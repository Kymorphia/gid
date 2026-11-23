/// Module for [WebsocketExtensionDeflate] class
module gid.soup3.websocket_extension_deflate;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;
import gid.soup3.websocket_extension;

/**
    A SoupWebsocketExtensionDeflate is a [gid.soup3.websocket_extension.WebsocketExtension]
    implementing permessage-deflate (RFC 7692).
    
    This extension is used by default in a [gid.soup3.session.Session] when [gid.soup3.websocket_extension_manager.WebsocketExtensionManager]
    feature is present, and always used by [gid.soup3.server.Server].
*/
class WebsocketExtensionDeflate : gid.soup3.websocket_extension.WebsocketExtension
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_deflate_get_type != &gidSymbolNotFound ? soup_websocket_extension_deflate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupWebsocketExtensionDeflate";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtensionDeflate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.websocket_extension_deflate.WebsocketExtensionDeflate]
      Returns: New builder object
  */
  static WebsocketExtensionDeflateGidBuilder builder() nothrow
  {
    return new WebsocketExtensionDeflateGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.soup3.websocket_extension_deflate.WebsocketExtensionDeflate]
class WebsocketExtensionDeflateGidBuilderImpl(T) : gid.soup3.websocket_extension.WebsocketExtensionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.websocket_extension_deflate.WebsocketExtensionDeflate]
final class WebsocketExtensionDeflateGidBuilder : WebsocketExtensionDeflateGidBuilderImpl!WebsocketExtensionDeflateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsocketExtensionDeflate build() nothrow
  {
    return new WebsocketExtensionDeflate(cast(void*)createGObject(WebsocketExtensionDeflate._getGType), Yes.Take);
  }
}
