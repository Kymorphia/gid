/// Module for [MenuLinkIter] class
module gio.menu_link_iter;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.menu_model;
import gio.types;
import gobject.object;

/**
    #GMenuLinkIter is an opaque structure type.  You must access it using
    the functions below.
*/
class MenuLinkIter : gobject.object.ObjectWrap
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
    return cast(void function())g_menu_link_iter_get_type != &gidSymbolNotFound ? g_menu_link_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuLinkIter self()
  {
    return this;
  }

  /**
      Gets the name of the link at the current iterator position.
      
      The iterator is not advanced.
      Returns: the type of the link
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_menu_link_iter_get_name(cast(GMenuLinkIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function combines [gio.menu_link_iter.MenuLinkIter.next] with
      [gio.menu_link_iter.MenuLinkIter.getName] and [gio.menu_link_iter.MenuLinkIter.getValue].
      
      First the iterator is advanced to the next (possibly first) link.
      If that fails, then false is returned and there are no other effects.
      
      If successful, out_link and value are set to the name and #GMenuModel
      of the link that has just been advanced to.  At this point,
      [gio.menu_link_iter.MenuLinkIter.getName] and [gio.menu_link_iter.MenuLinkIter.getValue] will return the
      same values again.
      
      The value returned in out_link remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gobject.object.ObjectWrap.unref] when it is no longer in use.
  
      Params:
        outLink = the name of the link
        value = the linked #GMenuModel
      Returns: true on success, or false if there is no additional link
  */
  bool getNext(out string outLink, out gio.menu_model.MenuModel value)
  {
    bool _retval;
    char* _outLink;
    GMenuModel* _value;
    _retval = cast(bool)g_menu_link_iter_get_next(cast(GMenuLinkIter*)this._cPtr, &_outLink, &_value);
    outLink = _outLink.fromCString(No.Free);
    value = new gio.menu_model.MenuModel(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the linked #GMenuModel at the current iterator position.
      
      The iterator is not advanced.
      Returns: the #GMenuModel that is linked to
  */
  gio.menu_model.MenuModel getValue()
  {
    GMenuModel* _cretval;
    _cretval = g_menu_link_iter_get_value(cast(GMenuLinkIter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to advance the iterator to the next (possibly first)
      link.
      
      true is returned on success, or false if there are no more links.
      
      You must call this function when you first acquire the iterator to
      advance it to the first link (and determine if the first link exists
      at all).
      Returns: true on success, or false when there are no more links
  */
  bool next()
  {
    bool _retval;
    _retval = cast(bool)g_menu_link_iter_next(cast(GMenuLinkIter*)this._cPtr);
    return _retval;
  }
}
