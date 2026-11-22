/// Module for [DesktopAppInfoLookupIfaceProxy] interface proxy object
module gid.giounix2.desktop_app_info_lookup_iface_proxy;

import gid.gobject2.object;
import gid.giounix2.desktop_app_info_lookup;
import gid.giounix2.desktop_app_info_lookup_mixin;

/// Proxy object for [gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup] interface when a GObject has no applicable D binding
class DesktopAppInfoLookupIfaceProxy : IfaceProxy, gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.giounix2.desktop_app_info_lookup.DesktopAppInfoLookup);
  }

  mixin DesktopAppInfoLookupT!();
}
