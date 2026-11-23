/// Module for [HyperlinkImpl] interface mixin
module gid.atk1.hyperlink_impl_mixin;

public import gid.core.basictypes;
public import gid.atk1.hyperlink_impl_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.hyperlink;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    A queryable interface which allows AtkHyperlink instances
    associated with an AtkObject to be obtained.  AtkHyperlinkImpl
    corresponds to AT-SPI's Hyperlink interface, and differs from
    AtkHyperlink in that AtkHyperlink is an object type, rather than an
    interface, and thus cannot be directly queried. FTW
*/
template HyperlinkImplT()
{

  /**
      Gets the hyperlink associated with this object.
      Returns: an AtkHyperlink object which points to this
        implementing AtkObject.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetHyperlink`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.hyperlink.Hyperlink vfuncGetHyperlink()
  {
    auto _klass = cast(AtkHyperlinkImplIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.hyperlink_impl.HyperlinkImpl._getGType);
    if (!_klass || !_klass.getHyperlink)
      return typeof(return).init;

    AtkHyperlink* _cretval;
    _cretval = _klass.getHyperlink(cast(AtkHyperlinkImpl*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the hyperlink associated with this object.
      Returns: an AtkHyperlink object which points to this
        implementing AtkObject.
  */
  override gid.atk1.hyperlink.Hyperlink getHyperlink() nothrow
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hyperlink_impl_get_hyperlink(cast(AtkHyperlinkImpl*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.hyperlink_impl.HyperlinkImpl (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_hyperlink_impl_HyperlinkImpl(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHyperlink", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.hyperlink_impl.HyperlinkImpl vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_hyperlink_impl_HyperlinkImpl(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHyperlink", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_hyperlink_impl_HyperlinkImpl(iface, "get_hyperlink");
  }

  private static void _installIfaceVfunc_gid_atk1_hyperlink_impl_HyperlinkImpl(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkHyperlinkImplIface*)iface;

    switch (vfunc)
    {
      case "get_hyperlink":
      {
        static extern(C) AtkHyperlink* _vfuncGetHyperlinkTramp(AtkHyperlinkImpl* impl) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)impl);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkImplIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)impl), gid.atk1.hyperlink_impl.HyperlinkImpl._getGType);
            if (_klass && _klass.getHyperlink)
              return (cast(typeof(&_vfuncGetHyperlinkTramp))_klass.getHyperlink)(impl);
            return typeof(return).init;
          }

          gid.atk1.hyperlink.Hyperlink _dretval;

          try
          {
            _dretval = _obj.vfuncGetHyperlink();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink_impl.HyperlinkImpl.vfuncGetHyperlink");
          }
          auto _retval = _dretval ? cast(AtkHyperlink*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getHyperlink = cast(typeof(_klass.getHyperlink))&_vfuncGetHyperlinkTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.hyperlink_impl.HyperlinkImpl]
template HyperlinkImplGidBuilderT()
{
}
