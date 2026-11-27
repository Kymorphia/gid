/// Module for [DesktopAppInfoLookup] interface mixin
module gid.giounix2.desktop_app_info_lookup_mixin;

public import gid.core.basictypes;
public import gid.giounix2.desktop_app_info_lookup;
public import gid.giounix2.desktop_app_info_lookup_iface_proxy;
public import gid.core.utils;
public import gid.gio2.app_info;
public import gid.giounix2.c.functions;
public import gid.giounix2.c.types;
public import gid.giounix2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
        deprecated and unused by GIO.
*/
template DesktopAppInfoLookupT()
{

  /**
      Gets the default application for launching applications
      using this URI scheme for a particular [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup]
      implementation.
      
      The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface and this function is used
      to implement [gid.gio2.app_info.AppInfo.getDefaultForUriScheme] backends
      in a GIO module. There is no reason for applications to use it
      directly. Applications should use
      [gid.gio2.app_info.AppInfo.getDefaultForUriScheme].
  
      Params:
        uriScheme = a string containing a URI scheme.
      Returns: [gid.gio2.app_info.AppInfo] for given
          uri_scheme or `NULL` on error.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDefaultForUriScheme`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
          deprecated and unused by GIO.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.app_info.AppInfo vfuncGetDefaultForUriScheme(string uriScheme)
  {
    auto _klass = cast(GDesktopAppInfoLookupIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup._getGType);
    if (!_klass || !_klass.getDefaultForUriScheme)
      return typeof(return).init;

    GAppInfo* _cretval;
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getDefaultForUriScheme(cast(GDesktopAppInfoLookup*)this._cPtr, _uriScheme);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the default application for launching applications
      using this URI scheme for a particular [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup]
      implementation.
      
      The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface and this function is used
      to implement [gid.gio2.app_info.AppInfo.getDefaultForUriScheme] backends
      in a GIO module. There is no reason for applications to use it
      directly. Applications should use
      [gid.gio2.app_info.AppInfo.getDefaultForUriScheme].
  
      Params:
        uriScheme = a string containing a URI scheme.
      Returns: [gid.gio2.app_info.AppInfo] for given
          uri_scheme or `NULL` on error.
  
      Deprecated: The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
          deprecated and unused by GIO.
  */
  override gid.gio2.app_info.AppInfo getDefaultForUriScheme(string uriScheme) nothrow
  {
    GAppInfo* _cretval;
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_lookup_get_default_for_uri_scheme(cast(GDesktopAppInfoLookup*)this._cPtr, _uriScheme);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup (DiG)
  enum bool _ifaceVfuncsOverridden_gid_giounix2_desktop_app_info_lookup_DesktopAppInfoLookup(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultForUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_giounix2_desktop_app_info_lookup_DesktopAppInfoLookup(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultForUriScheme", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_giounix2_desktop_app_info_lookup_DesktopAppInfoLookup(iface, "get_default_for_uri_scheme");
  }

  private static void _installIfaceVfunc_gid_giounix2_desktop_app_info_lookup_DesktopAppInfoLookup(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDesktopAppInfoLookupIface*)iface;

    switch (vfunc)
    {
      case "get_default_for_uri_scheme":
      {
        static extern(C) GAppInfo* _vfuncGetDefaultForUriSchemeTramp(GDesktopAppInfoLookup* lookup, const(char)* uriScheme) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)lookup);
          if (!_obj)
          {
            auto _klass = cast(GDesktopAppInfoLookupIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)lookup), gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup._getGType);
            if (_klass && _klass.getDefaultForUriScheme)
              return (cast(typeof(&_vfuncGetDefaultForUriSchemeTramp))_klass.getDefaultForUriScheme)(lookup, uriScheme);
            return typeof(return).init;
          }

          gid.gio2.app_info.AppInfo _dretval;
          string _uriScheme = uriScheme.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetDefaultForUriScheme(_uriScheme);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup.vfuncGetDefaultForUriScheme");
          }
          auto _retval = _dretval ? cast(GAppInfo*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getDefaultForUriScheme = cast(typeof(_klass.getDefaultForUriScheme))&_vfuncGetDefaultForUriSchemeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup]
template DesktopAppInfoLookupGidBuilderT()
{
}
