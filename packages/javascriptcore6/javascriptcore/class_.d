/// Module for [Class] class
module javascriptcore.class_;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.context;
import javascriptcore.types;


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

/**
    A JSSClass represents a custom JavaScript class registered by the user in a #JSCContext.
    It allows to create new JavaScripts objects whose instances are created by the user using
    this API.
    It's possible to add constructors, properties and methods for a JSSClass by providing
    #GCallback<!-- -->s to implement them.
*/
class Class : gobject.object.ObjectWrap
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
    return cast(void function())jsc_class_get_type != &gidSymbolNotFound ? jsc_class_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Class self() nothrow
  {
    return this;
  }

  /**
      Get builder for [javascriptcore.class_.Class]
      Returns: New builder object
  */
  static ClassGidBuilder builder() nothrow
  {
    return new ClassGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The name of the class.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `parent` property.
      Returns: The parent class or null in case of final classes.
  */
  @property javascriptcore.class_.Class parent() nothrow
  {
    return getParent();
  }
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

  /**
      Get the class name of jsc_class
      Returns: the name of jsc_class
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = jsc_class_get_name(cast(JSCClass*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the parent class of jsc_class
      Returns: the parent class of jsc_class
  */
  javascriptcore.class_.Class getParent() nothrow
  {
    JSCClass* _cretval;
    _cretval = jsc_class_get_parent(cast(JSCClass*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.class_.Class)(cast(JSCClass*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [javascriptcore.class_.Class]
class ClassGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `context` property.
      Params:
        propval = The #JSCContext in which the class was registered.
      Returns: Builder instance for fluent chaining
  */
  T context(javascriptcore.context.Context propval) nothrow
  {
    return setProperty("context", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the class.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent class or null in case of final classes.
      Returns: Builder instance for fluent chaining
  */
  T parent(javascriptcore.class_.Class propval) nothrow
  {
    return setProperty("parent", propval);
  }
}

/// Fluent builder for [javascriptcore.class_.Class]
final class ClassGidBuilder : ClassGidBuilderImpl!ClassGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Class build() nothrow
  {
    return new Class(cast(void*)createGObject(Class._getGType), No.Take);
  }
}
