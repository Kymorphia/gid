/// Module for [SessionFeatureIfaceProxy] interface proxy object
module gid.soup3.session_feature_iface_proxy;

import gid.gobject2.object;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;

/// Proxy object for [gid.soup3.session_feature.SessionFeature] interface when a GObject has no applicable D binding
class SessionFeatureIfaceProxy : IfaceProxy, gid.soup3.session_feature.SessionFeature
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.soup3.session_feature.SessionFeature);
  }

  mixin SessionFeatureT!();
}
