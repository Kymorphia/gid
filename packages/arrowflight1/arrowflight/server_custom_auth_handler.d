/// Module for [ServerCustomAuthHandler] class
module arrowflight.server_custom_auth_handler;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.server_auth_handler;
import arrowflight.server_auth_reader;
import arrowflight.server_auth_sender;
import arrowflight.server_call_context;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;

/** */
class ServerCustomAuthHandler : arrowflight.server_auth_handler.ServerAuthHandler
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
    return cast(void function())gaflight_server_custom_auth_handler_get_type != &gidSymbolNotFound ? gaflight_server_custom_auth_handler_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerCustomAuthHandler self()
  {
    return this;
  }

  /**
      Get builder for [arrowflight.server_custom_auth_handler.ServerCustomAuthHandler]
      Returns: New builder object
  */
  static ServerCustomAuthHandlerGidBuilder builder()
  {
    return new ServerCustomAuthHandlerGidBuilder;
  }

  /**
      Authenticates the client on initial connection. The server can send
      and read responses from the client at any time.
  
      Params:
        context = A #GAFlightServerCallContext.
        sender = A #GAFlightServerAuthSender.
        reader = A #GAFlightServerAuthReader.
      Throws: [ErrorWrap]
  */
  void authenticate(arrowflight.server_call_context.ServerCallContext context, arrowflight.server_auth_sender.ServerAuthSender sender, arrowflight.server_auth_reader.ServerAuthReader reader)
  {
    GError *_err;
    gaflight_server_custom_auth_handler_authenticate(cast(GAFlightServerCustomAuthHandler*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, sender ? cast(GAFlightServerAuthSender*)sender._cPtr(No.Dup) : null, reader ? cast(GAFlightServerAuthReader*)reader._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
  }

  /**
      Validates a per-call client token.
  
      Params:
        context = A #GAFlightServerCallContext.
        token = The client token. May be the empty string if the client does not
            provide a token.
      Returns: The identity of the peer, if
          this authentication method supports it.
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes isValid(arrowflight.server_call_context.ServerCallContext context, glib.bytes.Bytes token)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = gaflight_server_custom_auth_handler_is_valid(cast(GAFlightServerCustomAuthHandler*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, token ? cast(GBytes*)token._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.server_custom_auth_handler.ServerCustomAuthHandler]
class ServerCustomAuthHandlerGidBuilderImpl(T) : arrowflight.server_auth_handler.ServerAuthHandlerGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.server_custom_auth_handler.ServerCustomAuthHandler]
final class ServerCustomAuthHandlerGidBuilder : ServerCustomAuthHandlerGidBuilderImpl!ServerCustomAuthHandlerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ServerCustomAuthHandler build()
  {
    return new ServerCustomAuthHandler(cast(void*)createGObject(ServerCustomAuthHandler._getGType), No.Take);
  }
}
