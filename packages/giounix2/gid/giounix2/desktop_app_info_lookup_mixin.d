/// Module for [DesktopAppInfoLookup] interface mixin
module gid.giounix2.desktop_app_info_lookup_mixin;

public import gid.core.basictypes;
public import gid.giounix2.desktop_app_info_lookup_iface_proxy;
public import gid.core.utils;
public import gid.gio2.app_info;
public import gid.giounix2.c.functions;
public import gid.giounix2.c.types;
public import gid.giounix2.types;
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
}

/// Fluent builder implementation template for [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup]
template DesktopAppInfoLookupGidBuilderT()
{
}
