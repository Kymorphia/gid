/// Module for [WebsocketExtensionDeflate] class
module soup.websocket_extension_deflate;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import soup.c.functions;
import soup.c.types;
import soup.types;
import soup.websocket_extension;

/**
    A SoupWebsocketExtensionDeflate is a [soup.websocket_extension.WebsocketExtension]
    implementing permessage-deflate (RFC 7692).
    
    This extension is used by default in a [soup.session.Session] when [soup.websocket_extension_manager.WebsocketExtensionManager]
    feature is present, and always used by [soup.server.Server].
*/
class WebsocketExtensionDeflate : soup.websocket_extension.WebsocketExtension
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_deflate_get_type != &gidSymbolNotFound ? soup_websocket_extension_deflate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtensionDeflate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.websocket_extension_deflate.WebsocketExtensionDeflate]
      Returns: New builder object
  */
  static WebsocketExtensionDeflateGidBuilder builder() nothrow
  {
    return new WebsocketExtensionDeflateGidBuilder;
  }
}

/// Fluent builder implementation template for [soup.websocket_extension_deflate.WebsocketExtensionDeflate]
class WebsocketExtensionDeflateGidBuilderImpl(T) : soup.websocket_extension.WebsocketExtensionGidBuilderImpl!T
{
}

/// Fluent builder for [soup.websocket_extension_deflate.WebsocketExtensionDeflate]
final class WebsocketExtensionDeflateGidBuilder : WebsocketExtensionDeflateGidBuilderImpl!WebsocketExtensionDeflateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsocketExtensionDeflate build() nothrow
  {
    return new WebsocketExtensionDeflate(cast(void*)createGObject(WebsocketExtensionDeflate._getGType), No.Take);
  }
}
