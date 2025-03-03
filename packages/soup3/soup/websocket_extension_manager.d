module soup.websocket_extension_manager;

import gid.gid;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
 * SoupWebsocketExtensionManager is the iface@SessionFeature that handles WebSockets
 * extensions for a class@Session.
 * A #SoupWebsocketExtensionManager is added to the session by default, and normally
 * you don't need to worry about it at all. However, if you want to
 * disable WebSocket extensions, you can remove the feature from the
 * session with [soup.session.Session.removeFeatureByType] or disable it on
 * individual requests with [soup.message.Message.disableFeature].
 */
class WebsocketExtensionManager : gobject.object.ObjectG, soup.session_feature.SessionFeature
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_manager_get_type != &gidSymbolNotFound ? soup_websocket_extension_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin SessionFeatureT!();
}
