/// Module for [Server] class
module arrowflight.server;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.criteria;
import arrowflight.data_stream;
import arrowflight.descriptor;
import arrowflight.info;
import arrowflight.message_reader;
import arrowflight.metadata_writer;
import arrowflight.servable;
import arrowflight.servable_mixin;
import arrowflight.server_call_context;
import arrowflight.server_options;
import arrowflight.ticket;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Server : gobject.object.ObjectWrap, arrowflight.servable.Servable
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
    return cast(void function())gaflight_server_get_type != &gidSymbolNotFound ? gaflight_server_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Server self()
  {
    return this;
  }

  mixin ServableT!();

  /** */
  arrowflight.data_stream.DataStream doGet(arrowflight.server_call_context.ServerCallContext context, arrowflight.ticket.Ticket ticket)
  {
    GAFlightDataStream* _cretval;
    GError *_err;
    _cretval = gaflight_server_do_get(cast(GAFlightServer*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, ticket ? cast(GAFlightTicket*)ticket._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.data_stream.DataStream)(cast(GAFlightDataStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Processes a stream of IPC payloads sent from a client.
  
      Params:
        context = A #GAFlightServerCallContext.
        reader = A #GAFlightMessageReader.
        writer = A #GAFlightMetadataWriter.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool doPut(arrowflight.server_call_context.ServerCallContext context, arrowflight.message_reader.MessageReader reader, arrowflight.metadata_writer.MetadataWriter writer)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_server_do_put(cast(GAFlightServer*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, reader ? cast(GAFlightMessageReader*)reader._cPtr(No.Dup) : null, writer ? cast(GAFlightMetadataWriter*)writer._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrowflight.info.Info getFlightInfo(arrowflight.server_call_context.ServerCallContext context, arrowflight.descriptor.Descriptor request)
  {
    GAFlightInfo* _cretval;
    GError *_err;
    _cretval = gaflight_server_get_flight_info(cast(GAFlightServer*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, request ? cast(GAFlightDescriptor*)request._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.info.Info)(cast(GAFlightInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getPort()
  {
    int _retval;
    _retval = gaflight_server_get_port(cast(GAFlightServer*)this._cPtr);
    return _retval;
  }

  /** */
  arrowflight.info.Info[] listFlights(arrowflight.server_call_context.ServerCallContext context, arrowflight.criteria.Criteria criteria = null)
  {
    GList* _cretval;
    GError *_err;
    _cretval = gaflight_server_list_flights(cast(GAFlightServer*)this._cPtr, context ? cast(GAFlightServerCallContext*)context._cPtr(No.Dup) : null, criteria ? cast(GAFlightCriteria*)criteria._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrowflight.info.Info, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  bool listen(arrowflight.server_options.ServerOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_server_listen(cast(GAFlightServer*)this._cPtr, options ? cast(GAFlightServerOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Shuts down the serve. This function can be called from signal
      handler or another thread.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool shutdown()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_server_shutdown(cast(GAFlightServer*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool wait()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_server_wait(cast(GAFlightServer*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
