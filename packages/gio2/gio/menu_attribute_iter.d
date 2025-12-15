/// Module for [MenuAttributeIter] class
module gio.menu_attribute_iter;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import gobject.object;

/**
    #GMenuAttributeIter is an opaque structure type.  You must access it
    using the functions below.
*/
class MenuAttributeIter : gobject.object.ObjectWrap
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
    return cast(void function())g_menu_attribute_iter_get_type != &gidSymbolNotFound ? g_menu_attribute_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuAttributeIter self()
  {
    return this;
  }

  /**
      Gets the name of the attribute at the current iterator position, as
      a string.
      
      The iterator is not advanced.
      Returns: the name of the attribute
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_menu_attribute_iter_get_name(cast(GMenuAttributeIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function combines [gio.menu_attribute_iter.MenuAttributeIter.next] with
      [gio.menu_attribute_iter.MenuAttributeIter.getName] and [gio.menu_attribute_iter.MenuAttributeIter.getValue].
      
      First the iterator is advanced to the next (possibly first) attribute.
      If that fails, then false is returned and there are no other
      effects.
      
      If successful, name and value are set to the name and value of the
      attribute that has just been advanced to.  At this point,
      [gio.menu_attribute_iter.MenuAttributeIter.getName] and [gio.menu_attribute_iter.MenuAttributeIter.getValue] will
      return the same values again.
      
      The value returned in name remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [glib.variant.Variant.unref] when it is no longer in use.
  
      Params:
        outName = the type of the attribute
        value = the attribute value
      Returns: true on success, or false if there is no additional
            attribute
  */
  bool getNext(out string outName, out glib.variant.Variant value)
  {
    bool _retval;
    char* _outName;
    GVariant* _value;
    _retval = cast(bool)g_menu_attribute_iter_get_next(cast(GMenuAttributeIter*)this._cPtr, &_outName, &_value);
    outName = _outName.fromCString(No.Free);
    value = new glib.variant.Variant(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the attribute at the current iterator position.
      
      The iterator is not advanced.
      Returns: the value of the current attribute
  */
  glib.variant.Variant getValue()
  {
    GVariant* _cretval;
    _cretval = g_menu_attribute_iter_get_value(cast(GMenuAttributeIter*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
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
  bool next()
  {
    bool _retval;
    _retval = cast(bool)g_menu_attribute_iter_next(cast(GMenuAttributeIter*)this._cPtr);
    return _retval;
  }
}
