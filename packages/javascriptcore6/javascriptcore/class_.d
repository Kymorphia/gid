/// Module for [Class] class
module javascriptcore.class_;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.context;
import javascriptcore.types;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())jsc_class_get_type != &gidSymbolNotFound ? jsc_class_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Class self()
  {
    return this;
  }

  /**
      Get builder for [javascriptcore.class_.Class]
      Returns: New builder object
  */
  static ClassGidBuilder builder()
  {
    return new ClassGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The name of the class.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `parent` property.
      Returns: The parent class or null in case of final classes.
  */
  @property javascriptcore.class_.Class parent()
  {
    return getParent();
  }

  /**
      Get the class name of jsc_class
      Returns: the name of jsc_class
  */
  string getName()
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
  javascriptcore.class_.Class getParent()
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
  T context(javascriptcore.context.Context propval)
  {
    return setProperty("context", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the class.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval)
  {
    return setProperty("name", propval);
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent class or null in case of final classes.
      Returns: Builder instance for fluent chaining
  */
  T parent(javascriptcore.class_.Class propval)
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
  Class build()
  {
    return new Class(cast(void*)createGObject(Class._getGType), No.Take);
  }
}
