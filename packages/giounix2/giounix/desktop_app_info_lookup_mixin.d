/// Module for [DesktopAppInfoLookup] interface mixin
module giounix.desktop_app_info_lookup_mixin;

public import gid.basictypes;
public import giounix.desktop_app_info_lookup_iface_proxy;
public import gid.gid;
public import gio.app_info;
public import giounix.c.functions;
public import giounix.c.types;
public import giounix.types;
public import gobject.gid_builder;
public import gobject.object;

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The [giounix.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
        deprecated and unused by GIO.
*/
template DesktopAppInfoLookupT()
{

  /**
      Gets the default application for launching applications
      using this URI scheme for a particular [giounix.desktop_app_info_lookup.DesktopAppInfoLookup]
      implementation.
      
      The [giounix.desktop_app_info_lookup.DesktopAppInfoLookup] interface and this function is used
      to implement [gio.app_info.AppInfo.getDefaultForUriScheme] backends
      in a GIO module. There is no reason for applications to use it
      directly. Applications should use
      [gio.app_info.AppInfo.getDefaultForUriScheme].
  
      Params:
        uriScheme = a string containing a URI scheme.
      Returns: [gio.app_info.AppInfo] for given
          uri_scheme or `NULL` on error.
  
      Deprecated: The [giounix.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
          deprecated and unused by GIO.
  */
  override gio.app_info.AppInfo getDefaultForUriScheme(string uriScheme) nothrow
  {
    GAppInfo* _cretval;
    const(char)* _uriScheme = uriScheme.toCString!(No.Malloc, No.Nullable);
    _cretval = g_desktop_app_info_lookup_get_default_for_uri_scheme(cast(GDesktopAppInfoLookup*)this._cPtr, _uriScheme);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.app_info.AppInfo)(cast(GAppInfo*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [giounix.desktop_app_info_lookup.DesktopAppInfoLookup]
template DesktopAppInfoLookupGidBuilderT()
{
}
