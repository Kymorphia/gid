//!class Class pre

import glib.types;
import glib.c.functions;
import gobject.c.functions;
import javascriptcore.value;

shared static this()
{
  jscObjectQuark = g_quark_from_string("_jscObject");
}

// String quark used to assign the D object to the C JSCValue object instance keyed-data list
immutable Quark jscObjectQuark;

class Class : gobject.object.ObjectWrap
{
  /**
   * Add a constructor to a Class. If name is empty (null), the class name will be used.
   * After creating the constructor, it needs to be added to an object as a property to be able to use it.
   * Use [Context.setValue] to make the constructor available in the global object.
   * Params:
   *   name = The JSC name of the constructor or null to use the class name
   *   callback = The callback
   * Returns: A Value representing the class constructor
   */
  Value addConstructor(alias Ctor)(string name = null) nothrow
    if (isCallable!Ctor && is(ReturnType!Ctor : Object))
  {
    extern(C) JSCValue* ctorThunk(GPtrArray* args, void* userData) nothrow
    {
      auto ctx = jsc_context_get_current();

      try
      {
        Parameters!Ctor dParams;

        foreach (i, P; Parameters!Ctor)
          if (i < args.len)
            dParams[i] = getJsVal!P(cast(JSCValue*)args.pdata[i]);

        auto dObj = Ctor(dParams);
        if (!dObj)
        {
          jsc_context_throw(ctx, "Object constructor returned null");
          return jsc_value_new_undefined(ctx);
        }

        ptrFreezeGC(cast(void*)dObj); // Add the D object as a GC root so it does not get garbage collected

        auto jsObj = jsc_value_new_object(ctx, cast(void*)dObj, cast(JSCClass*)userData);
        g_object_set_qdata(cast(GObject*)jsObj, jscObjectQuark, cast(void*)dObj); // Associate the D Object with the object JSCValue because it doesn't provide a way to retrieve the object pointer
        return jsObj;
      }
      catch (Exception e)
      {
        jsc_context_throw(ctx, e.msg.toCString(No.Alloc));
        return jsc_value_new_undefined(ctx);
      }
    }

    auto ctorVal = jsc_class_add_constructor_variadic(cast(JSCClass*)_cPtr,
      name.length > 0 ? name.toCString(No.Alloc) : null, cast(GCallback)&ctorThunk,
      _cPtr, null, Value._getGType);

    return new Value(cast(void*)ctorVal, Yes.Take);
  }

  /**
   * Add a method to a Class.
   * Params:
   *   Method = The method
   *   name = The JSC name of the method or null to use the D method name (default)
   */
  void addMethod(alias Method)(string name = null) nothrow
    if (isCallable!Method)
  {
    alias ClassT = __traits(parent, Method);
    enum string dMethodName = __traits(identifier, Method);

    extern(C) JSCValue* methodThunk(JSCValue* instance, GPtrArray* args, void* userData) nothrow
    {
      auto ctx = jsc_context_get_current();

      try
      {
        auto dObj = cast(ClassT)g_object_get_qdata(cast(GObject*)instance, jscObjectQuark);
        if (!dObj)
        {
          jsc_context_throw(ctx, "D Object not found for method call");
          return jsc_value_new_undefined(ctx);
        }

        Parameters!Method dParams;
        foreach (i, P; Parameters!Method)
          if (i < args.len)
            dParams[i] = getJsVal!P(cast(JSCValue*)args.pdata[i]);

        static if (!is(ReturnType!Method == void))
        {
          auto retval = __traits(getMember, dObj, dMethodName)(dParams);
          return createJsVal(ctx, retval);
        }
        else
        {
          __traits(getMember, dObj, dMethodName)(dParams);
          return jsc_value_new_undefined(ctx);
        }
      }
      catch (Exception e)
      {
        jsc_context_throw(ctx, e.msg.toCString(No.Alloc));
        return jsc_value_new_undefined(ctx);
      }
    }

    if (name.length == 0)
      name = dMethodName;

    jsc_class_add_method_variadic(cast(JSCClass*)_cPtr, name.toCString(No.Alloc), cast(GCallback)&methodThunk,
      null, null, Value._getGType);
  }

  /// Used as a default value for addProperty template Setter argument which results in a read-only property
  void readOnlyProperty() nothrow {}

  /**
   * Add a property to a Class.
   * Params:
   *   Getter = The getter method
   *   Setter = The setter method (optional)
   *   name = The property name
   */
  void addProperty(alias Getter, alias Setter = readOnlyProperty)(string name) nothrow
    if ((isCallable!Getter && !is(ReturnType!Getter == void) && Parameters!Getter.length == 0)
      && (__traits(isSame, Setter, readOnlyProperty)
      || (isCallable!Setter && is(ReturnType!Setter == void) && Parameters!Setter.length == 1)))
  {
    extern(C) JSCValue* getterThunk(JSCValue* instance, void* userData) nothrow
    {
      alias ClassT = __traits(parent, Getter);
      enum string getterName = __traits(identifier, Getter);

      auto ctx = jsc_context_get_current();

      try
      {
        auto dObj = cast(ClassT)g_object_get_qdata(cast(GObject*)instance, jscObjectQuark);
        if (!dObj)
        {
          jsc_context_throw(ctx, "D Object not found for property getter call");
          return jsc_value_new_undefined(ctx);
        }

        auto retval = __traits(getMember, dObj, getterName)();
        return createJsVal(ctx, retval);
      }
      catch (Exception e)
      {
        jsc_context_throw(ctx, e.msg.toCString(No.Alloc));
        return jsc_value_new_undefined(ctx);
      }
    }

    static if (!__traits(isSame, Setter, readOnlyProperty))
    {
      extern(C) void setterThunk(JSCValue* instance, JSCValue* value, void* userData) nothrow
      {
        alias ClassT = __traits(parent, Setter);
        enum string setterName = __traits(identifier, Setter);

        auto ctx = jsc_context_get_current();

        try
        {
          auto dObj = cast(ClassT)g_object_get_qdata(cast(GObject*)instance, jscObjectQuark);

          if (!dObj)
            jsc_context_throw(ctx, "D Object not found for property setter call");
          else
            __traits(getMember, dObj, setterName)(getJsVal!(Parameters!Setter[0])(value));
        }
        catch (Exception e)
          jsc_context_throw(ctx, e.msg.toCString(No.Alloc));
      }

      jsc_class_add_property(cast(JSCClass*)_cPtr, name.toCString(No.Alloc), Value._getGType, cast(GCallback)&getterThunk, cast(GCallback)&setterThunk, null, null);
    }
    else
      jsc_class_add_property(cast(JSCClass*)_cPtr, name.toCString(No.Alloc), Value._getGType, cast(GCallback)&getterThunk, null, null, null);
  }
}
