/// Module for [WebsocketExtensionDeflate] class
module soup.websocket_extension_deflate;

import gid.gid;
import gobject.gid_builder;
import soup.c.functions;
import soup.c.types;
import soup.types;
import soup.websocket_extension;

/**
    A SoupWebsocketExtensionDeflate is a `class@WebsocketExtension`
    implementing permessage-deflate (RFC 7692).
    
    This extension is used by default in a `class@Session` when `class@WebsocketExtensionManager`
    feature is present, and always used by `class@Server`.
*/
class WebsocketExtensionDeflate : soup.websocket_extension.WebsocketExtension
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
    return cast(void function())soup_websocket_extension_deflate_get_type != &gidSymbolNotFound ? soup_websocket_extension_deflate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtensionDeflate self()
  {
    return this;
  }

  /**
  Get builder for [soup.websocket_extension_deflate.WebsocketExtensionDeflate]
  Returns: New builder object
  */
  static WebsocketExtensionDeflateGidBuilder builder()
  {
    return new WebsocketExtensionDeflateGidBuilder;
  }
}

class WebsocketExtensionDeflateGidBuilderImpl(T) : soup.websocket_extension.WebsocketExtensionGidBuilderImpl!T
{
}

/// Fluent builder for [soup.websocket_extension_deflate.WebsocketExtensionDeflate]
final class WebsocketExtensionDeflateGidBuilder : WebsocketExtensionDeflateGidBuilderImpl!WebsocketExtensionDeflateGidBuilder
{
  WebsocketExtensionDeflate build()
  {
    return new WebsocketExtensionDeflate(cast(void*)createGObject(WebsocketExtensionDeflate._getGType), No.Take);
  }
}
