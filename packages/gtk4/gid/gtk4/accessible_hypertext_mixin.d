/// Module for [AccessibleHypertext] interface mixin
module gid.gtk4.accessible_hypertext_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_hypertext_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.accessible_hyperlink;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for accessible objects containing links.
    
    The [gid.gtk4.accessible_hypertext.AccessibleHypertext] interfaces is meant to be implemented by accessible
    objects that contain links. Those links don't necessarily have to be part
    of text, they can be associated with images and other things.
*/
template AccessibleHypertextT()
{

  /**
      Retrieve the n-th link in the accessible object.
      
      index must be smaller than the number of links.
  
      Params:
        index = the index of the link
      Returns: the link
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetLink`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk4.accessible_hyperlink.AccessibleHyperlink vfuncGetLink(uint index)
  {
    auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
    if (!_klass || !_klass.getLink)
      return typeof(return).init;

    GtkAccessibleHyperlink* _cretval;
    _cretval = _klass.getLink(cast(GtkAccessibleHypertext*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible_hyperlink.AccessibleHyperlink)(cast(GtkAccessibleHyperlink*)_cretval, No.Take);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncGetLinkAt(uint offset)
  {
    auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
    if (!_klass || !_klass.getLinkAt)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getLinkAt(cast(GtkAccessibleHypertext*)this._cPtr, offset);
    return _retval;
  }

  /**
      Retrieve the number of links in the accessible object.
      Returns: the number of links
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNLinks`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncGetNLinks()
  {
    auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
    if (!_klass || !_klass.getNLinks)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getNLinks(cast(GtkAccessibleHypertext*)this._cPtr);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.accessible_hypertext.AccessibleHypertext (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_accessible_hypertext_AccessibleHypertext(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLink", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLinkAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNLinks", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.accessible_hypertext.AccessibleHypertext vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_accessible_hypertext_AccessibleHypertext(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLink", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_hypertext_AccessibleHypertext(iface, "get_link");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLinkAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_hypertext_AccessibleHypertext(iface, "get_link_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNLinks", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_hypertext_AccessibleHypertext(iface, "get_n_links");
  }

  private static void _installIfaceVfunc_gid_gtk4_accessible_hypertext_AccessibleHypertext(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkAccessibleHypertextInterface*)iface;

    switch (vfunc)
    {
      case "get_link":
      {
        static extern(C) GtkAccessibleHyperlink* _vfuncGetLinkTramp(GtkAccessibleHypertext* self, uint index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
            if (_klass && _klass.getLink)
              return (cast(typeof(&_vfuncGetLinkTramp))_klass.getLink)(self, index);
            return typeof(return).init;
          }

          gid.gtk4.accessible_hyperlink.AccessibleHyperlink _dretval;

          try
          {
            _dretval = _obj.vfuncGetLink(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_hypertext.AccessibleHypertext.vfuncGetLink");
          }
          auto _retval = _dretval ? cast(GtkAccessibleHyperlink*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getLink = cast(typeof(_klass.getLink))&_vfuncGetLinkTramp;
        break;
      }
      case "get_link_at":
      {
        static extern(C) uint _vfuncGetLinkAtTramp(GtkAccessibleHypertext* self, uint offset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
            if (_klass && _klass.getLinkAt)
              return (cast(typeof(&_vfuncGetLinkAtTramp))_klass.getLinkAt)(self, offset);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetLinkAt(offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_hypertext.AccessibleHypertext.vfuncGetLinkAt");
          }
          return _retval;
        }

        _klass.getLinkAt = cast(typeof(_klass.getLinkAt))&_vfuncGetLinkAtTramp;
        break;
      }
      case "get_n_links":
      {
        static extern(C) uint _vfuncGetNLinksTramp(GtkAccessibleHypertext* self) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleHypertextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_hypertext.AccessibleHypertext._getGType);
            if (_klass && _klass.getNLinks)
              return (cast(typeof(&_vfuncGetNLinksTramp))_klass.getNLinks)(self);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetNLinks();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_hypertext.AccessibleHypertext.vfuncGetNLinks");
          }
          return _retval;
        }

        _klass.getNLinks = cast(typeof(_klass.getNLinks))&_vfuncGetNLinksTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.accessible_hypertext.AccessibleHypertext]
template AccessibleHypertextGidBuilderT()
{
}
