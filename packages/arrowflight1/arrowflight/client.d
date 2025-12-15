/// Module for [Client] class
module arrowflight.client;

import arrow.schema;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.call_options;
import arrowflight.client_options;
import arrowflight.criteria;
import arrowflight.descriptor;
import arrowflight.do_put_result;
import arrowflight.info;
import arrowflight.location;
import arrowflight.stream_reader;
import arrowflight.ticket;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Client : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_client_get_type != &gidSymbolNotFound ? gaflight_client_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Client self()
  {
    return this;
  }

  /** */
  this(arrowflight.location.Location location, arrowflight.client_options.ClientOptions options = null)
  {
    GAFlightClient* _cretval;
    GError *_err;
    _cretval = gaflight_client_new(location ? cast(GAFlightLocation*)location._cPtr(No.Dup) : null, options ? cast(GAFlightClientOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Authenticates to the server using basic HTTP style authentication.
  
      Params:
        user = User name to be used.
        password = Password to be used.
        options = A #GAFlightCallOptions.
        bearerName = Bearer token name on success.
        bearerValue = Bearer token value on success.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool authenticateBasicToken(string user, string password, arrowflight.call_options.CallOptions options, out string bearerName, out string bearerValue)
  {
    bool _retval;
    const(char)* _user = user.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    char* _bearerName;
    char* _bearerValue;
    GError *_err;
    _retval = cast(bool)gaflight_client_authenticate_basic_token(cast(GAFlightClient*)this._cPtr, _user, _password, options ? cast(GAFlightCallOptions*)options._cPtr(No.Dup) : null, &_bearerName, &_bearerValue, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    bearerName = _bearerName.fromCString(Yes.Free);
    bearerValue = _bearerValue.fromCString(Yes.Free);
    return _retval;
  }

  /** */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gaflight_client_close(cast(GAFlightClient*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrowflight.stream_reader.StreamReader doGet(arrowflight.ticket.Ticket ticket, arrowflight.call_options.CallOptions options = null)
  {
    GAFlightStreamReader* _cretval;
    GError *_err;
    _cretval = gaflight_client_do_get(cast(GAFlightClient*)this._cPtr, ticket ? cast(GAFlightTicket*)ticket._cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.stream_reader.StreamReader)(cast(GAFlightStreamReader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Upload data to a Flight described by the given descriptor. The
      caller must call [arrow.record_batch_writer.RecordBatchWriter.close] on the
      returned stream once they are done writing.
      
      The reader and writer are linked; closing the writer will also
      close the reader. Use garrow_flight_stream_writer_done_writing() to
      only close the write side of the channel.
  
      Params:
        descriptor = A #GAFlightDescriptor.
        schema = A #GArrowSchema.
        options = A #GAFlightCallOptions.
      Returns: The #GAFlighDoPutResult holding a reader and a writer on success,
          null on error.
      Throws: [ErrorWrap]
  */
  arrowflight.do_put_result.DoPutResult doPut(arrowflight.descriptor.Descriptor descriptor, arrow.schema.Schema schema, arrowflight.call_options.CallOptions options = null)
  {
    GAFlightDoPutResult* _cretval;
    GError *_err;
    _cretval = gaflight_client_do_put(cast(GAFlightClient*)this._cPtr, descriptor ? cast(GAFlightDescriptor*)descriptor._cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.do_put_result.DoPutResult)(cast(GAFlightDoPutResult*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrowflight.info.Info getFlightInfo(arrowflight.descriptor.Descriptor descriptor, arrowflight.call_options.CallOptions options = null)
  {
    GAFlightInfo* _cretval;
    GError *_err;
    _cretval = gaflight_client_get_flight_info(cast(GAFlightClient*)this._cPtr, descriptor ? cast(GAFlightDescriptor*)descriptor._cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.info.Info)(cast(GAFlightInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrowflight.info.Info[] listFlights(arrowflight.criteria.Criteria criteria = null, arrowflight.call_options.CallOptions options = null)
  {
    GList* _cretval;
    GError *_err;
    _cretval = gaflight_client_list_flights(cast(GAFlightClient*)this._cPtr, criteria ? cast(GAFlightCriteria*)criteria._cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(arrowflight.info.Info, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
