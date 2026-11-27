/// Module for [StringObject] class
module gid.gtk4.string_object;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    The type of items in a [gid.gtk4.string_list.StringList].
    
    A [gid.gtk4.string_object.StringObject] is a wrapper around a `const char*`; it has
    a [gid.gtk4.string_object.StringObject.string_] property that can be used
    for property bindings and expressions.
*/
@gidGir("StringObject", "StringObjectClass")
class StringObject : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_string_object_get_type != &gidSymbolNotFound ? gtk_string_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStringObject";
  }

  /** Returns `this`, for use in `with` statements. */
  override StringObject self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.string_object.StringObject]
      Returns: New builder object
  */
  static StringObjectGidBuilder builder() nothrow
  {
    return new StringObjectGidBuilder;
  }

  /**
      Get `string_` property.
      Returns: The string.
  */
  @property string string_() nothrow
  {
    return getString();
  }

  /**
      Wraps a string in an object for use with [gid.gio2.list_model.ListModel].
  
      Params:
        string_ = The string to wrap
      Returns: a new [gid.gtk4.string_object.StringObject]
  */
  this(string string_) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkStringObject* _cretval;
      const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_string_object_new(_string_);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the string contained in a [gid.gtk4.string_object.StringObject].
      Returns: the string of self
  */
  string getString() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_string_object_get_string(cast(GtkStringObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.string_object.StringObject]
class StringObjectGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.string_object.StringObject]
final class StringObjectGidBuilder : StringObjectGidBuilderImpl!StringObjectGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StringObject build() nothrow
  {
    return new StringObject(cast(void*)createGObject(StringObject._getGType), Yes.Take);
  }
}
