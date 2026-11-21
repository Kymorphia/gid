/// Module for [WebsocketExtension] class
module gid.soup3.websocket_extension;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    A WebSocket extension
    
    [gid.soup3.websocket_extension.WebsocketExtension] is the base class for WebSocket extension objects.
*/
class WebsocketExtension : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_extension_get_type != &gidSymbolNotFound ? soup_websocket_extension_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupWebsocketExtension";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketExtension self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.websocket_extension.WebsocketExtension]
      Returns: New builder object
  */
  static WebsocketExtensionGidBuilder builder() nothrow
  {
    return new WebsocketExtensionGidBuilder;
  }

  /**
      Configures extension with the given params.
  
      Params:
        connectionType = either [gid.soup3.types.WebsocketConnectionType.Client] or [gid.soup3.types.WebsocketConnectionType.Server]
        params = the parameters
      Returns: true if extension could be configured with the given parameters, or false otherwise
      Throws: [ErrorWrap]
  */
  bool configure(gid.soup3.types.WebsocketConnectionType connectionType, string[string] params = null)
  {
    bool _retval;
    auto _params = gHashTableFromD!(string, string)(params);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_params);
    GError *_err;
    _retval = cast(bool)soup_websocket_extension_configure(cast(SoupWebsocketExtension*)this._cPtr, connectionType, _params, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Get the parameters strings to be included in the request header.
      
      If the extension doesn't include any parameter in the request, this function
      returns null.
      Returns: a new allocated string with the parameters
  */
  string getRequestParams() nothrow
  {
    char* _cretval;
    _cretval = soup_websocket_extension_get_request_params(cast(SoupWebsocketExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the parameters strings to be included in the response header.
      
      If the extension doesn't include any parameter in the response, this function
      returns null.
      Returns: a new allocated string with the parameters
  */
  string getResponseParams() nothrow
  {
    char* _cretval;
    _cretval = soup_websocket_extension_get_response_params(cast(SoupWebsocketExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Process a message after it's received.
      
      If the payload isn't changed the given payload is just returned, otherwise
      [gid.glib2.bytes.Bytes.unref] is called on the given payload and a new
      [gid.glib2.bytes.Bytes] is returned with the new data.
      
      Extensions using reserved bits of the header will reset them in header.
  
      Params:
        header = the message header
        payload = the payload data
      Returns: the message payload data, or null in case of error
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes processIncomingMessage(ref ubyte header, gid.glib2.bytes.Bytes payload)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_websocket_extension_process_incoming_message(cast(SoupWebsocketExtension*)this._cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload._cPtr(Yes.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Process a message before it's sent.
      
      If the payload isn't changed the given payload is just returned, otherwise
      `methodGlib.Bytes.unref` is called on the given payload and a new
      [gid.glib2.bytes.Bytes] is returned with the new data.
      
      Extensions using reserved bits of the header will change them in header.
  
      Params:
        header = the message header
        payload = the payload data
      Returns: the message payload data, or null in case of error
      Throws: [ErrorWrap]
  */
  gid.glib2.bytes.Bytes processOutgoingMessage(ref ubyte header, gid.glib2.bytes.Bytes payload)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = soup_websocket_extension_process_outgoing_message(cast(SoupWebsocketExtension*)this._cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload._cPtr(Yes.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.soup3.websocket_extension.WebsocketExtension]
class WebsocketExtensionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.websocket_extension.WebsocketExtension]
final class WebsocketExtensionGidBuilder : WebsocketExtensionGidBuilderImpl!WebsocketExtensionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebsocketExtension build() nothrow
  {
    return new WebsocketExtension(cast(void*)createGObject(WebsocketExtension._getGType), Yes.Take);
  }
}
