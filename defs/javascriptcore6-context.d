//!class Context pre

import std.traits : isFunction;

import gobject.c.functions;
import javascriptcore.class_;

class Context : gobject.object.ObjectWrap
{
  private Class[TypeInfo] classRegistry; // JSC Classes registered by D class TypeInfo
  private TypeInfo[string] classNameToType; // JSC class name to D class TypeInfo

  /**
   * Register a D function/delegate as a JavaScript function.
   */
  void registerFunction(T)(string name, T callback)
  {
    auto jsFunc = Value.newFunction(this, name, callback);
    setValue(name, jsFunc);
  }

  /**
   * Register with automatic name from the function symbol.
   * Only works with function pointers/aliases, not runtime delegates.
   */
  void registerFunction(alias Func)()
    if (isFunction!Func)
  {
    string name = __traits(identifier, Func);
    registerFunction(name, &Func);
  }

  /**
   * Register a D class to a JSC Context.
   * Params:
   *   DClass = The D class to register
   *   name = Class name to use or empty/null to use D class name (default)
   */
  Class registerClass(alias DClass)(string name = null)
  {
    extern(C) void classDestroyNotify(const(void*) data)
    {
      auto jsObj = cast(GObject*)data;
      if (auto dObj = g_object_get_qdata(jsObj, jscObjectQuark))
      {
        ptrThawGC(dObj); // Remove GC root (see Class.addConstructor for the ptrFreezeGC side of this)
        g_object_set_qdata(jsObj, jscObjectQuark, null);
      }
    }

    auto ti = typeid(DClass);
    if (auto existing = classRegistry.get(ti, null))
      return existing;

    if (name.length == 0)
      name = __traits(identifier, typeof(this));

    auto parent = classRegistry.get(ti.base, null);
    auto jscParent = parent ? cast(JSCClass*)parent._cPtr : null;

    auto jscClass = jsc_context_register_class(cast(JSCContext*)this._cPtr, name.toCString(No.Alloc), jscParent, null,
      &classDestroyNotify);

    auto jsClass = new Class(cast(void*)jscClass, Yes.Take);
    classRegistry[ti] = jsClass;
    classNameToType[name] = ti;
    return jsClass;
  }

  /**
   * Template to get a JSC Class from a context.
   * Params:
   *   T = The class type
   * Returns: The JSC Class or null if none registered for the given D class type
   */
  Class getClass(T)()
  {
    return classRegistery.get(typeid(T), null);
  }

  /**
   * Template to get a JSC Class from a context by the name that it was registered with
   * (the same as the D class name if not specified on registration).
   * Params:
   *   name = The name of the JSC Class that was registered
   * Returns: The JSC Class or null if not found
   */
  Class getClass(string name)
  {
    if (auto ti = classNameToType.get(name, null))
      return classRegistry.get(ti, null);

    return null;
  }
}
