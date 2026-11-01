/// Module for [DesktopAppInfoLookup] interface
module giounix.desktop_app_info_lookup;

public import gid.basictypes;
public import giounix.desktop_app_info_lookup_iface_proxy;
import gid.gid;
import gio.app_info;
import giounix.c.functions;
import giounix.c.types;
import giounix.types;
import gobject.gid_builder;
import gobject.object;

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The [giounix.desktop_app_info_lookup.DesktopAppInfoLookup] interface is
        deprecated and unused by GIO.
*/
interface DesktopAppInfoLookup : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_desktop_app_info_lookup_get_type != &gidSymbolNotFound ? g_desktop_app_info_lookup_get_type() : cast(GType)0;
  }

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
  gio.app_info.AppInfo getDefaultForUriScheme(string uriScheme);
}

/// Fluent builder implementation template for [giounix.desktop_app_info_lookup.DesktopAppInfoLookup]
interface DesktopAppInfoLookupGidBuilderImpl(T)
{
}
