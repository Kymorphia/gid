/// Module for [WebsocketExtensionManager] class
module soup.websocket_extension_manager;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    SoupWebsocketExtensionManager is the `iface@SessionFeature` that handles WebSockets
    extensions for a `class@Session`.
    
    A #SoupWebsocketExtensionManager is added to the session by default, and normally
    you don't need to worry about it at all. However, if you want to
    disable WebSocket extensions, you can remove the feature from the
    session with [soup.session.Session.removeFeatureByType] or disable it on
    individual requests with [soup.message.Message.disableFeature].
*/
class WebsocketExtensionManager : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_manager_get_type != &gidSymbolNotFound ? soup_websocket_extension_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtensionManager self()
  {
    return this;
  }

  /**
  Get builder for [soup.websocket_extension_manager.WebsocketExtensionManager]
  Returns: New builder object
  */
  static WebsocketExtensionManagerGidBuilder builder()
  {
    return new WebsocketExtensionManagerGidBuilder;
  }

  mixin SessionFeatureT!();
}

class WebsocketExtensionManagerGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, soup.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [soup.websocket_extension_manager.WebsocketExtensionManager]
final class WebsocketExtensionManagerGidBuilder : WebsocketExtensionManagerGidBuilderImpl!WebsocketExtensionManagerGidBuilder
{
  WebsocketExtensionManager build()
  {
    return new WebsocketExtensionManager(cast(void*)createGObject(WebsocketExtensionManager._getGType), No.Take);
  }
}
