/// Module for [Context] class
module javascriptcore.context;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gobject.gid_builder;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.class_;
import javascriptcore.exception;
import javascriptcore.types;
import javascriptcore.value;
import javascriptcore.virtual_machine;


import std.traits;

import std.exception : assumeWontThrow;

import gobject.c.functions;
import javascriptcore.class_;

/**
    JSCContext represents a JavaScript execution context, where all operations
    take place and where the values will be associated.
    
    When a new context is created, a global object is allocated and the built-in JavaScript
    objects (Object, Function, String, Array) are populated. You can execute JavaScript in
    the context by using [javascriptcore.context.Context.evaluate] or [javascriptcore.context.Context.evaluateWithSourceUri].
    It's also possible to register custom objects in the context with [javascriptcore.context.Context.registerClass].
*/
class Context : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())jsc_context_get_type != &gidSymbolNotFound ? jsc_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Context self() nothrow
  {
    return this;
  }

  /**
      Get builder for [javascriptcore.context.Context]
      Returns: New builder object
  */
  static ContextGidBuilder builder() nothrow
  {
    return new ContextGidBuilder;
  }

  /**
      Get `virtualMachine` property.
      Returns: The #JSCVirtualMachine in which the context was created.
  */
  @property javascriptcore.virtual_machine.VirtualMachine virtualMachine() nothrow
  {
    return getVirtualMachine();
  }
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

  /**
      Create a new #JSCContext. The context is created in a new #JSCVirtualMachine.
      Use [javascriptcore.context.Context.newWithVirtualMachine] to create a new #JSCContext in an
      existing #JSCVirtualMachine.
      Returns: the newly created #JSCContext.
  */
  this() nothrow
  {
    JSCContext* _cretval;
    _cretval = jsc_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Create a new #JSCContext in virtual_machine.
  
      Params:
        vm = a #JSCVirtualMachine
      Returns: the newly created #JSCContext.
  */
  static javascriptcore.context.Context newWithVirtualMachine(javascriptcore.virtual_machine.VirtualMachine vm) nothrow
  {
    JSCContext* _cretval;
    _cretval = jsc_context_new_with_virtual_machine(vm ? cast(JSCVirtualMachine*)vm._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(JSCContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #JSCContext that is currently executing a function. This should only be
      called within a function or method callback, otherwise null will be returned.
      Returns: the #JSCContext that is currently executing.
  */
  static javascriptcore.context.Context getCurrent() nothrow
  {
    JSCContext* _cretval;
    _cretval = jsc_context_get_current();
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(JSCContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Check the given code in context for syntax errors. The line_number is the starting line number in uri;
      the value is one-based so the first line is 1. uri and line_number are only used to fill the exception.
      In case of errors exception will be set to a new #JSCException with the details. You can pass null to
      exception to ignore the error details.
  
      Params:
        code = a JavaScript script to check
        mode = a #JSCCheckSyntaxMode
        uri = the source URI
        lineNumber = the starting line number
        exception = return location for a #JSCException, or null to ignore
      Returns: a #JSCCheckSyntaxResult
  */
  javascriptcore.types.CheckSyntaxResult checkSyntax(string code, javascriptcore.types.CheckSyntaxMode mode, string uri, uint lineNumber, out javascriptcore.exception.ExceptionWrap exception) nothrow
  {
    JSCCheckSyntaxResult _cretval;
    ptrdiff_t _length;
    if (code)
      _length = cast(ptrdiff_t)code.length;

    auto _code = code.ptr ? cast(const(char)*)code.ptr : [char.init].ptr;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    JSCException* _exception;
    _cretval = jsc_context_check_syntax(cast(JSCContext*)this._cPtr, _code, _length, mode, _uri, lineNumber, &_exception);
    javascriptcore.types.CheckSyntaxResult _retval = cast(javascriptcore.types.CheckSyntaxResult)_cretval;
    exception = new javascriptcore.exception.ExceptionWrap(cast(void*)_exception, Yes.Take);
    return _retval;
  }

  /**
      Clear the uncaught exception in context if any.
  */
  void clearException() nothrow
  {
    jsc_context_clear_exception(cast(JSCContext*)this._cPtr);
  }

  /**
      Evaluate code in context.
  
      Params:
        code = a JavaScript script to evaluate
      Returns: a #JSCValue representing the last value generated by the script.
  */
  javascriptcore.value.Value evaluate(string code) nothrow
  {
    JSCValue* _cretval;
    ptrdiff_t _length;
    if (code)
      _length = cast(ptrdiff_t)code.length;

    auto _code = code.ptr ? cast(const(char)*)code.ptr : [char.init].ptr;
    _cretval = jsc_context_evaluate(cast(JSCContext*)this._cPtr, _code, _length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Evaluate code and create an new object where symbols defined in code will be added as properties,
      instead of being added to context global object. The new object is returned as object parameter.
      Similar to how [javascriptcore.value.Value.newObject] works, if object_instance is not null object_class must be provided too.
      The line_number is the starting line number in uri; the value is one-based so the first line is 1.
      uri and line_number will be shown in exceptions and they don't affect the behavior of the script.
  
      Params:
        code = a JavaScript script to evaluate
        objectInstance = an object instance
        objectClass = a #JSCClass or null to use the default
        uri = the source URI
        lineNumber = the starting line number
        object = return location for a #JSCValue.
      Returns: a #JSCValue representing the last value generated by the script.
  */
  javascriptcore.value.Value evaluateInObject(string code, void* objectInstance, javascriptcore.class_.Class objectClass, string uri, uint lineNumber, out javascriptcore.value.Value object) nothrow
  {
    JSCValue* _cretval;
    ptrdiff_t _length;
    if (code)
      _length = cast(ptrdiff_t)code.length;

    auto _code = code.ptr ? cast(const(char)*)code.ptr : [char.init].ptr;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    JSCValue* _object;
    _cretval = jsc_context_evaluate_in_object(cast(JSCContext*)this._cPtr, _code, _length, objectInstance, objectClass ? cast(JSCClass*)objectClass._cPtr(No.Dup) : null, _uri, lineNumber, &_object);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    object = new javascriptcore.value.Value(cast(void*)_object, Yes.Take);
    return _retval;
  }

  /**
      Evaluate code in context using uri as the source URI. The line_number is the starting line number
      in uri; the value is one-based so the first line is 1. uri and line_number will be shown in exceptions and
      they don't affect the behavior of the script.
  
      Params:
        code = a JavaScript script to evaluate
        uri = the source URI
        lineNumber = the starting line number
      Returns: a #JSCValue representing the last value generated by the script.
  */
  javascriptcore.value.Value evaluateWithSourceUri(string code, string uri, uint lineNumber) nothrow
  {
    JSCValue* _cretval;
    ptrdiff_t _length;
    if (code)
      _length = cast(ptrdiff_t)code.length;

    auto _code = code.ptr ? cast(const(char)*)code.ptr : [char.init].ptr;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = jsc_context_evaluate_with_source_uri(cast(JSCContext*)this._cPtr, _code, _length, _uri, lineNumber);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the last unhandled exception thrown in context by API functions calls.
      Returns: a #JSCException or null if there isn't any
           unhandled exception in the #JSCContext.
  */
  javascriptcore.exception.ExceptionWrap getException() nothrow
  {
    JSCException* _cretval;
    _cretval = jsc_context_get_exception(cast(JSCContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.exception.ExceptionWrap)(cast(JSCException*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get a #JSCValue referencing the context global object
      Returns: a #JSCValue
  */
  javascriptcore.value.Value getGlobalObject() nothrow
  {
    JSCValue* _cretval;
    _cretval = jsc_context_get_global_object(cast(JSCContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a property of context global object with name.
  
      Params:
        name = the value name
      Returns: a #JSCValue
  */
  javascriptcore.value.Value getValue(string name) nothrow
  {
    JSCValue* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = jsc_context_get_value(cast(JSCContext*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #JSCVirtualMachine where context was created.
      Returns: the #JSCVirtualMachine where the #JSCContext was created.
  */
  javascriptcore.virtual_machine.VirtualMachine getVirtualMachine() nothrow
  {
    JSCVirtualMachine* _cretval;
    _cretval = jsc_context_get_virtual_machine(cast(JSCContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.virtual_machine.VirtualMachine)(cast(JSCVirtualMachine*)_cretval, No.Take);
    return _retval;
  }

  /**
      Remove the last #JSCExceptionHandler previously pushed to context with
      [javascriptcore.context.Context.pushExceptionHandler].
  */
  void popExceptionHandler() nothrow
  {
    jsc_context_pop_exception_handler(cast(JSCContext*)this._cPtr);
  }

  /**
      Push an exception handler in context. Whenever a JavaScript exception happens in
      the #JSCContext, the given handler will be called. The default #JSCExceptionHandler
      simply calls [javascriptcore.context.Context.throwException] to throw the exception to the #JSCContext.
      If you don't want to catch the exception, but only get notified about it, call
      [javascriptcore.context.Context.throwException] in handler like the default one does.
      The last exception handler pushed is the only one used by the #JSCContext, use
      [javascriptcore.context.Context.popExceptionHandler] to remove it and set the previous one. When handler
      is removed from the context, destroy_notify i called with user_data as parameter.
  
      Params:
        handler = a #JSCExceptionHandler
  */
  void pushExceptionHandler(javascriptcore.types.ExceptionHandler handler) nothrow
  {
    extern(C) void _handlerCallback(JSCContext* context, JSCException* exception, void* userData) nothrow
    {
      auto _dlg = cast(javascriptcore.types.ExceptionHandler*)userData;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(javascriptcore.context.Context)(cast(void*)context, No.Take), gobject.object.ObjectWrap._getDObject!(javascriptcore.exception.ExceptionWrap)(cast(void*)exception, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "javascriptcore.types.ExceptionHandler");
      }
    }
    auto _handlerCB = handler ? &_handlerCallback : null;
    auto _handler = handler ? freezeDelegate(cast(void*)&handler) : null;
    GDestroyNotify _handlerDestroyCB = handler ? &thawDelegate : null;
    jsc_context_push_exception_handler(cast(JSCContext*)this._cPtr, _handlerCB, _handler, _handlerDestroyCB);
  }

  /**
      Register a custom class in context using the given name. If the new class inherits from
      another #JSCClass, the parent should be passed as parent_class, otherwise null should be
      used. The optional vtable parameter allows to provide a custom implementation for handling
      the class, for example, to handle external properties not added to the prototype.
      When an instance of the #JSCClass is cleared in the context, destroy_notify is called with
      the instance as parameter.
  
      Params:
        name = the class name
        parentClass = a #JSCClass or null
        vtable = an optional #JSCClassVTable or null
        destroyNotify = a destroy notifier for class instances
      Returns: a #JSCClass
  */
  javascriptcore.class_.Class registerClass(string name, javascriptcore.class_.Class parentClass, javascriptcore.types.ClassVTable vtable, glib.types.DestroyNotify destroyNotify = null) nothrow
  {
    extern(C) void _destroyNotifyCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _destroyNotifyCB = destroyNotify ? &_destroyNotifyCallback : null;
    JSCClass* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = jsc_context_register_class(cast(JSCContext*)this._cPtr, _name, parentClass ? cast(JSCClass*)parentClass._cPtr(No.Dup) : null, &vtable, _destroyNotifyCB);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.class_.Class)(cast(JSCClass*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set a property of context global object with name and value.
  
      Params:
        name = the value name
        value = a #JSCValue
  */
  void setValue(string name, javascriptcore.value.Value value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    jsc_context_set_value(cast(JSCContext*)this._cPtr, _name, value ? cast(JSCValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Throw an exception to context using the given error message. The created #JSCException
      can be retrieved with [javascriptcore.context.Context.getException].
  
      Params:
        errorMessage = an error message
  */
  void throw_(string errorMessage) nothrow
  {
    const(char)* _errorMessage = errorMessage.toCString!(No.Malloc, No.Nullable);
    jsc_context_throw(cast(JSCContext*)this._cPtr, _errorMessage);
  }

  /**
      Throw exception to context.
  
      Params:
        exception = a #JSCException
  */
  void throwException(javascriptcore.exception.ExceptionWrap exception) nothrow
  {
    jsc_context_throw_exception(cast(JSCContext*)this._cPtr, exception ? cast(JSCException*)exception._cPtr(No.Dup) : null);
  }

  /**
      Throw an exception to context using the given error name and message. The created #JSCException
      can be retrieved with [javascriptcore.context.Context.getException].
  
      Params:
        errorName = the error name
        errorMessage = an error message
  */
  void throwWithName(string errorName, string errorMessage) nothrow
  {
    const(char)* _errorName = errorName.toCString!(No.Malloc, No.Nullable);
    const(char)* _errorMessage = errorMessage.toCString!(No.Malloc, No.Nullable);
    jsc_context_throw_with_name(cast(JSCContext*)this._cPtr, _errorName, _errorMessage);
  }
}

/// Fluent builder implementation template for [javascriptcore.context.Context]
class ContextGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `virtualMachine` property.
      Params:
        propval = The #JSCVirtualMachine in which the context was created.
      Returns: Builder instance for fluent chaining
  */
  T virtualMachine(javascriptcore.virtual_machine.VirtualMachine propval) nothrow
  {
    return setProperty("virtual-machine", propval);
  }
}

/// Fluent builder for [javascriptcore.context.Context]
final class ContextGidBuilder : ContextGidBuilderImpl!ContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Context build() nothrow
  {
    return new Context(cast(void*)createGObject(Context._getGType), Yes.Take);
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
