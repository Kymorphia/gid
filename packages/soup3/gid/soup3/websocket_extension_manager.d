/// Module for [WebsocketExtensionManager] class
module gid.soup3.websocket_extension_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    SoupWebsocketExtensionManager is the [gid.soup3.session_feature.SessionFeature] that handles WebSockets
    extensions for a [gid.soup3.session.Session].
    
    A [gid.soup3.websocket_extension_manager.WebsocketExtensionManager] is added to the session by default, and normally
    you don't need to worry about it at all. However, if you want to
    disable WebSocket extensions, you can remove the feature from the
    session with [gid.soup3.session.Session.removeFeatureByType] or disable it on
    individual requests with [gid.soup3.message.Message.disableFeature].
*/
@gidGir("WebsocketExtensionManager", "WebsocketExtensionManagerClass")
class WebsocketExtensionManager : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_manager_get_type != &gidSymbolNotFound ? soup_websocket_extension_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupWebsocketExtensionManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtensionManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.websocket_extension_manager.WebsocketExtensionManager]
      Returns: New builder object
  */
  static WebsocketExtensionManagerGidBuilder builder() nothrow
  {
    return new WebsocketExtensionManagerGidBuilder;
  }

  mixin SessionFeatureT!();
}

/// Fluent builder implementation template for [gid.soup3.websocket_extension_manager.WebsocketExtensionManager]
class WebsocketExtensionManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [gid.soup3.websocket_extension_manager.WebsocketExtensionManager]
final class WebsocketExtensionManagerGidBuilder : WebsocketExtensionManagerGidBuilderImpl!WebsocketExtensionManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsocketExtensionManager build() nothrow
  {
    return new WebsocketExtensionManager(cast(void*)createGObject(WebsocketExtensionManager._getGType), Yes.Take);
  }
}
