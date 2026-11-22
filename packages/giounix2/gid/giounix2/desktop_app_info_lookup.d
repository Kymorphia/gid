/// Module for [DesktopAppInfoLookup] interface
module gid.giounix2.desktop_app_info_lookup;

public import gid.core.basictypes;
public import gid.giounix2.desktop_app_info_lookup_iface_proxy;
import gid.core.utils;
import gid.gio2.app_info;
import gid.giounix2.c.functions;
import gid.giounix2.c.types;
import gid.giounix2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
        deprecated and unused by GIO.
*/
interface DesktopAppInfoLookup : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_desktop_app_info_lookup_get_type != &gidSymbolNotFound ? g_desktop_app_info_lookup_get_type() : cast(GType)0;
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
  gid.gio2.app_info.AppInfo getDefaultForUriScheme(string uriScheme);
}

/// Fluent builder implementation template for [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup]
interface DesktopAppInfoLookupGidBuilderImpl(T)
{
}
