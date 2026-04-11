/// Module for [ServerAuthHandler] class
module arrowflight.server_auth_handler;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ServerAuthHandler : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_server_auth_handler_get_type != &gidSymbolNotFound ? gaflight_server_auth_handler_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerAuthHandler self()
  {
    return this;
  }

  /**
      Get builder for [arrowflight.server_auth_handler.ServerAuthHandler]
      Returns: New builder object
  */
  static ServerAuthHandlerGidBuilder builder()
  {
    return new ServerAuthHandlerGidBuilder;
  }
}

/// Fluent builder implementation template for [arrowflight.server_auth_handler.ServerAuthHandler]
class ServerAuthHandlerGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T handler(void* propval)
  {
    return setProperty("handler", propval);
  }
}

/// Fluent builder for [arrowflight.server_auth_handler.ServerAuthHandler]
final class ServerAuthHandlerGidBuilder : ServerAuthHandlerGidBuilderImpl!ServerAuthHandlerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ServerAuthHandler build()
  {
    return new ServerAuthHandler(cast(void*)createGObject(ServerAuthHandler._getGType), No.Take);
  }
}
