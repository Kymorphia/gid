//!class Context pre

import std.traits;

import std.exception : assumeWontThrow;

import gobject.c.functions;
import javascriptcore.class_;

class Context : gobject.object.ObjectWrap
{
  private Class[TypeInfo] classRegistry; // JSC Classes registered by D class TypeInfo
  private TypeInfo[string] classNameToType; // JSC class name to D class TypeInfo

  /**
   * Register a D function/delegate as a JavaScript function.
   */
  void registerFunction(T)(string name, T callback) nothrow
  {
    auto jsFunc = Value.newFunction(this, name, callback);
    setValue(name, jsFunc);
  }

  /**
   * Register with automatic name from the function symbol.
   * Only works with function pointers/aliases, not runtime delegates.
   */
  void registerFunction(alias Func)() nothrow
    if (isFunction!Func)
  {
    string name = __traits(identifier, Func);
    registerFunction(name, &Func);
  }

  /**
  * Register a D class to a JSC Context.
  *
  * If the Mode is RegisterClassMode.UdaOnly then a constructor must be marked with the @JsCtor attribute
  * and all methods and properties which are to be exposed must be marked with the @JsExpose attribute.
  *
  * The @JsName attribute is used to set the name (string) of a method or property.
  * The @JsReadOnly attribute is used to mark a member variable property as read-only.
  *
  * Params:
  *   DClass = The D class to register
  *   Mode = The registration mode (defaults to RegisterClassMode.UdaOnly)
  *   className = Class name to use or empty/null to use D class name (default)
  * Returns: The registered Class (returns the existing instance if it was already registered)
  */
  Class registerClass(alias DClass, RegisterClassMode Mode = RegisterClassMode.UdaOnly)(string className = null) nothrow
  {
    extern(C) void classDestroyNotify(const(void*) data) nothrow
    {
      auto jsObj = cast(GObject*)data;
      if (auto dObj = g_object_get_qdata(jsObj, jscObjectQuark))
      {
        ptrThawGC(dObj); // Remove GC root (see Class.addConstructor for the ptrFreezeGC side of this)
        g_object_set_qdata(jsObj, jscObjectQuark, null);
      }
    }

    auto ti = typeid(DClass);
    if (auto existing = assumeWontThrow(classRegistry.get(ti, null)))
      return existing;

    if (className.length == 0)
      className = __traits(identifier, DClass);

    auto parent = assumeWontThrow(classRegistry.get(ti.base, null));
    auto jscParent = parent ? cast(JSCClass*)parent._cPtr : null;

    auto jscClass = jsc_context_register_class(cast(JSCContext*)this._cPtr, className.toCString, jscParent, null, &classDestroyNotify);

    auto jsClass = new Class(cast(void*)jscClass, Yes.Take);
    classRegistry[ti] = jsClass;
    classNameToType[className] = ti;

    static if (Mode == RegisterClassMode.Manual)
      return jsClass;

    alias SelectedCtor = findBestConstructor!DClass;

    static if (is(SelectedCtor == void))
    {
      static assert(0, "No suitable constructor found for " ~ DClass.stringof ~
        ". Mark a static method returning " ~ DClass.stringof ~ " with @JsConstructor");
    }

    static foreach (memberName; __traits(derivedMembers, DClass))
    {{
      alias Member = __traits(getMember, DClass, memberName);

      static if (isFunction!(Member))
      {
        static if (hasFunctionAttributes!(Member, "@property"))
        {{
          alias PropInfo = PropertyPair!(__traits(parent, Member), memberName, Mode);

          static if (PropInfo.isValid)
          {
            static if (is(PropInfo.Setter == void))
              jsClass.addProperty!(PropInfo.Getter)(memberName); // Read only
            else
              jsClass.addProperty!(PropInfo.Getter, PropInfo.Setter)(memberName);
          }
          else static if (isMethodExposable!(Member, Mode))
            jsClass.addMethod!Member(getUDAName!(Member, memberName));
        }}
        else static if (isMethodExposable!(Member, Mode))
          jsClass.addMethod!(Member)(getUDAName!(Member, memberName));
      }
    }}

    auto ctor = jsClass.addConstructor!(SelectedCtor)(getUDAName!(SelectedCtor, __traits(identifier, SelectedCtor)));
    setValue(className, ctor);

    return jsClass;
  }

  // Helper to get custom name from @JsName or fall back to D name
  private template getUDAName(alias Member, string defaultName)
  {
    alias udas = getUDAs!(Member, JsName);
    static if (udas.length > 0)
      enum getUDAName = udas[0].name;
    else
      enum getUDAName = defaultName;
  }

  private template findBestConstructor(alias DClass)
  {
    alias findBestConstructor = FindBestCtor!DClass;
  }

  private template FindBestCtor(alias DClass)
  {
    alias BestConstructor = void;
    alias BestFallback = void;

    static foreach (memberName; __traits(derivedMembers, DClass))
    {
      static if (isCallable!(__traits(getMember, DClass, memberName))
        && __traits(isStaticFunction, __traits(getMember, DClass, memberName))
        && is(ReturnType!(__traits(getMember, DClass, memberName)) == DClass))
      {
        static if (hasUDA!(__traits(getMember, DClass, memberName), JsConstructor))
          BestConstructor = __traits(getMember, DClass, memberName); // Prioritize explicit @JsConstructor
        else
          BestFallback = __traits(getMember, DClass, memberName);
      }
    }

    static if (is(BestConstructor == void))
      alias FindBestCtor = BestFallback;
    else
      alias FindBestCtor = BestConstructor;
  }

  private template isMethodExposable(alias Method, RegisterClassMode Mode)
  {
    static bool compute() nothrow
    {
      bool isValid = true;

      // Check visibility / UDA
      static if (!hasUDA!(Method, JsExpose))
      {
        static if (Mode == RegisterClassMode.Full)
        {
          static if (__traits(getVisibility, Method) != "public")
            isValid = false;
        }
        else
          isValid = false;
      }

      static foreach (T; Parameters!Method) // Check parameters
        static if (!isValidJsVal!T)
          isValid = false;

      static if (!is(ReturnType!Method == void) && !isValidJsVal!(ReturnType!Method))
        isValid = false;

      return isValid;
    }

    enum bool isMethodExposable = compute();
  }

  private template PropertyPair(alias DClass, string propName, RegisterClassMode Mode)
  {
    alias Overloads = __traits(getOverloads, DClass, propName);

    alias Getter = void;
    alias Setter = void;

    static foreach (i, F; Overloads)
    {
      static if (isCallable!F && Parameters!F.length == 0 && !is(ReturnType!F == void)
          && (Mode == RegisterClassMode.Full || hasUDA!(F, JsExpose)))
        Getter = F;
      else static if (isCallable!F && Parameters!F.length == 1 && is(ReturnType!F == void)
          && (Mode == RegisterClassMode.Full || hasUDA!(F, JsExpose)))
        Setter = F;
    }

    enum bool isValid = !is(Getter == void);
  }

  /**
   * Template to get a JSC Class from a context.
   * Params:
   *   T = The class type
   * Returns: The JSC Class or null if none registered for the given D class type
   */
  Class getClass(T)() nothrow
  {
    return assumeWontThrow(classRegistery.get(typeid(T), null));
  }

  /**
   * Template to get a JSC Class from a context by the name that it was registered with
   * (the same as the D class name if not specified on registration).
   * Params:
   *   name = The name of the JSC Class that was registered
   * Returns: The JSC Class or null if not found
   */
  Class getClass(string name) nothrow
  {
    if (auto ti = assumeWontThrow(classNameToType.get(name, null)))
      return assumeWontThrow(classRegistry.get(ti, null));

    return null;
  }
}

/// Value used with registerClass template
enum RegisterClassMode
{
  UdaOnly, /// Only add methods and members which are marked with @JsExpose
  Full, /// Bind all public methods and public members as properties, first method which returns an instance is used (or the one marked @JsCtor)
  Manual, /// Don't do any automatic class registration, leaving it up to the caller to do all that
}

struct JsConstructor {} /// Attribute to mark a constructor method
struct JsExpose {} /// Attribute to mark a method or member variable (property) for exposing to javascriptcore
struct JsName { string name; } /// Attribute to set the name of a method or member variable property
struct JsReadOnly {} /// Attribute to set a member variable property as read-only
