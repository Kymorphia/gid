/// Module for [MenuAttributeIter] class
module gid.gio2.menu_attribute_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    #GMenuAttributeIter is an opaque structure type.  You must access it
    using the functions below.
*/
class MenuAttributeIter : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_menu_attribute_iter_get_type != &gidSymbolNotFound ? g_menu_attribute_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMenuAttributeIter";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuAttributeIter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
      Returns: New builder object
  */
  static MenuAttributeIterGidBuilder builder() nothrow
  {
    return new MenuAttributeIterGidBuilder;
  }

  /**
      Gets the name of the attribute at the current iterator position, as
      a string.
      
      The iterator is not advanced.
      Returns: the name of the attribute
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_menu_attribute_iter_get_name(cast(GMenuAttributeIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      This function combines [gid.gio2.menu_attribute_iter.MenuAttributeIter.next] with
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue].
      
      First the iterator is advanced to the next (possibly first) attribute.
      If that fails, then false is returned and there are no other
      effects.
      
      If successful, name and value are set to the name and value of the
      attribute that has just been advanced to.  At this point,
      [gid.gio2.menu_attribute_iter.MenuAttributeIter.getName] and [gid.gio2.menu_attribute_iter.MenuAttributeIter.getValue] will
      return the same values again.
      
      The value returned in name remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gid.glib2.variant.Variant.unref] when it is no longer in use.
  
      Params:
        outName = the type of the attribute
        value = the attribute value
      Returns: true on success, or false if there is no additional
            attribute
  */
  bool getNext(out string outName, out gid.glib2.variant.Variant value) nothrow
  {
    bool _retval;
    char* _outName;
    GVariant* _value;
    _retval = cast(bool)g_menu_attribute_iter_get_next(cast(GMenuAttributeIter*)this._cPtr, &_outName, &_value);
    outName = _outName.fromCString!(No.Free);
    if (_value)
      value = new gid.glib2.variant.Variant(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the attribute at the current iterator position.
      
      The iterator is not advanced.
      Returns: the value of the current attribute
  */
  gid.glib2.variant.Variant getValue() nothrow
  {
    GVariant* _cretval;
    _cretval = g_menu_attribute_iter_get_value(cast(GMenuAttributeIter*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Attempts to advance the iterator to the next (possibly first)
      attribute.
      
      true is returned on success, or false if there are no more
      attributes.
      
      You must call this function when you first acquire the iterator
      to advance it to the first attribute (and determine if the first
      attribute exists at all).
      Returns: true on success, or false when there are no more attributes
  */
  bool next() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_menu_attribute_iter_next(cast(GMenuAttributeIter*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
class MenuAttributeIterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.menu_attribute_iter.MenuAttributeIter]
final class MenuAttributeIterGidBuilder : MenuAttributeIterGidBuilderImpl!MenuAttributeIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuAttributeIter build() nothrow
  {
    return new MenuAttributeIter(cast(void*)createGObject(MenuAttributeIter._getGType), Yes.Take);
  }
}
