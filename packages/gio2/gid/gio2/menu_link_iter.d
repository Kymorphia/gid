/// Module for [MenuLinkIter] class
module gid.gio2.menu_link_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.menu_model;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    #GMenuLinkIter is an opaque structure type.  You must access it using
    the functions below.
*/
class MenuLinkIter : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_menu_link_iter_get_type != &gidSymbolNotFound ? g_menu_link_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMenuLinkIter";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuLinkIter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.menu_link_iter.MenuLinkIter]
      Returns: New builder object
  */
  static MenuLinkIterGidBuilder builder() nothrow
  {
    return new MenuLinkIterGidBuilder;
  }

  /**
      This function combines [gid.gio2.menu_link_iter.MenuLinkIter.next] with
      [gid.gio2.menu_link_iter.MenuLinkIter.getName] and [gid.gio2.menu_link_iter.MenuLinkIter.getValue].
      
      First the iterator is advanced to the next (possibly first) link.
      If that fails, then false is returned and there are no other effects.
      
      If successful, out_link and value are set to the name and #GMenuModel
      of the link that has just been advanced to.  At this point,
      [gid.gio2.menu_link_iter.MenuLinkIter.getName] and [gid.gio2.menu_link_iter.MenuLinkIter.getValue] will return the
      same values again.
      
      The value returned in out_link remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gid.gobject2.object.ObjectWrap.unref] when it is no longer in use.
  
      Params:
        outLink = the name of the link
        value = the linked #GMenuModel
      Returns: true on success, or false if there is no additional link
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNext` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncGetNext(out string outLink, out gid.gio2.menu_model.MenuModel value)
  {
    auto _klass = cast(GMenuLinkIterClass*)_vfuncClass;
    if (!_klass.getNext)
      return typeof(return).init;

    bool _retval;
    char* _outLink;
    GMenuModel* _value;
    _retval = cast(bool)_klass.getNext(cast(GMenuLinkIter*)this._cPtr, &_outLink, &_value);
    outLink = _outLink.fromCString!(No.Free);
    value = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of the link at the current iterator position.
      
      The iterator is not advanced.
      Returns: the type of the link
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_menu_link_iter_get_name(cast(GMenuLinkIter*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      This function combines [gid.gio2.menu_link_iter.MenuLinkIter.next] with
      [gid.gio2.menu_link_iter.MenuLinkIter.getName] and [gid.gio2.menu_link_iter.MenuLinkIter.getValue].
      
      First the iterator is advanced to the next (possibly first) link.
      If that fails, then false is returned and there are no other effects.
      
      If successful, out_link and value are set to the name and #GMenuModel
      of the link that has just been advanced to.  At this point,
      [gid.gio2.menu_link_iter.MenuLinkIter.getName] and [gid.gio2.menu_link_iter.MenuLinkIter.getValue] will return the
      same values again.
      
      The value returned in out_link remains valid for as long as the iterator
      remains at the current position.  The value returned in value must
      be unreffed using [gid.gobject2.object.ObjectWrap.unref] when it is no longer in use.
  
      Params:
        outLink = the name of the link
        value = the linked #GMenuModel
      Returns: true on success, or false if there is no additional link
  */
  bool getNext(out string outLink, out gid.gio2.menu_model.MenuModel value) nothrow
  {
    bool _retval;
    char* _outLink;
    GMenuModel* _value;
    _retval = cast(bool)g_menu_link_iter_get_next(cast(GMenuLinkIter*)this._cPtr, &_outLink, &_value);
    outLink = _outLink.fromCString!(No.Free);
    value = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(_value, Yes.Take);
    return _retval;
  }

  /**
      Gets the linked #GMenuModel at the current iterator position.
      
      The iterator is not advanced.
      Returns: the #GMenuModel that is linked to
  */
  gid.gio2.menu_model.MenuModel getValue() nothrow
  {
    GMenuModel* _cretval;
    _cretval = g_menu_link_iter_get_value(cast(GMenuLinkIter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
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
  bool next() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_menu_link_iter_next(cast(GMenuLinkIter*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MenuLinkIter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.menu_link_iter.MenuLinkIter), T.stringof ~ " is not derived from gid.gio2.menu_link_iter.MenuLinkIter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNext", true)[0]) == gid.gio2.menu_link_iter.MenuLinkIter))
      _installVfunc(klass, "get_next");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMenuLinkIterClass*)klass;

    switch (vfunc)
    {
      case "get_next":
      {
        static extern(C) gboolean _vfuncGetNextTramp(GMenuLinkIter* iter, const(char*)* outLink, GMenuModel** value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.menu_link_iter.MenuLinkIter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GMenuLinkIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.getNext)
              return (cast(typeof(&_vfuncGetNextTramp))_klass.getNext)(iter, outLink, value);
            return typeof(return).init;
          }

          typeof(*outLink) _outLinkNull;
          if (!outLink)
            outLink = &_outLinkNull;

          typeof(*value) _valueNull;
          if (!value)
            value = &_valueNull;

          bool _dretval;
          string _outLink;
          gid.gio2.menu_model.MenuModel _value;

          try
          {
            _dretval = _obj.vfuncGetNext(_outLink, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_link_iter.MenuLinkIter.vfuncGetNext");
          }
          auto _retval = cast(gboolean)_dretval;
          *cast(char**)outLink = _outLink.toCString!(No.Malloc, No.Nullable);
          *value = _value ? cast(GMenuModel*)_value._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getNext = cast(typeof(_klass.getNext))&_vfuncGetNextTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.menu_link_iter.MenuLinkIter]
class MenuLinkIterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.menu_link_iter.MenuLinkIter]
final class MenuLinkIterGidBuilder : MenuLinkIterGidBuilderImpl!MenuLinkIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuLinkIter build() nothrow
  {
    return new MenuLinkIter(cast(void*)createGObject(MenuLinkIter._getGType), Yes.Take);
  }
}
