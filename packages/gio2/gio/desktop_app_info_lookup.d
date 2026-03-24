/// Module for [DesktopAppInfoLookup] interface
module gio.desktop_app_info_lookup;

public import gio.desktop_app_info_lookup_iface_proxy;
import gid.gid;
import gio.app_info;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
    using the following functions.

    Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
         unused by GIO.
*/
interface DesktopAppInfoLookup
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_desktop_app_info_lookup_get_type != &gidSymbolNotFound ? g_desktop_app_info_lookup_get_type() : cast(GType)0;
  }

  /**
      Gets the default application for launching applications
      using this URI scheme for a particular #GDesktopAppInfoLookup
      implementation.
      
      The #GDesktopAppInfoLookup interface and this function is used
      to implement [gio.app_info.AppInfo.getDefaultForUriScheme] backends
      in a GIO module. There is no reason for applications to use it
      directly. Applications should use [gio.app_info.AppInfo.getDefaultForUriScheme].
  
      Params:
        uriScheme = a string containing a URI scheme.
      Returns: #GAppInfo for given uri_scheme or
           null on error.
  
      Deprecated: The #GDesktopAppInfoLookup interface is deprecated and
           unused by GIO.
  */
  gio.app_info.AppInfo getDefaultForUriScheme(string uriScheme);
}

interface DesktopAppInfoLookupGidBuilderImpl(T)
{
}
