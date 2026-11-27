/// Module for [WebsocketExtension] class
module gid.soup3.websocket_extension;

public import gid.core.basictypes;
import gid.core.utils;
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
@gidGir("WebsocketExtension", "WebsocketExtensionClass")
class WebsocketExtension : gid.gobject2.object.ObjectWrap
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
      Get the parameters strings to be included in the request header.
      
      If the extension doesn't include any parameter in the request, this function
      returns null.
      Returns: a new allocated string with the parameters
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestParams` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncGetRequestParams()
  {
    auto _klass = cast(SoupWebsocketExtensionClass*)_vfuncClass;
    if (!_klass.getRequestParams)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getRequestParams(cast(SoupWebsocketExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the parameters strings to be included in the response header.
      
      If the extension doesn't include any parameter in the response, this function
      returns null.
      Returns: a new allocated string with the parameters
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetResponseParams` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncGetResponseParams()
  {
    auto _klass = cast(SoupWebsocketExtensionClass*)_vfuncClass;
    if (!_klass.getResponseParams)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getResponseParams(cast(SoupWebsocketExtension*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcessIncomingMessage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.bytes.Bytes vfuncProcessIncomingMessage(ref ubyte header, gid.glib2.bytes.Bytes payload)
  {
    auto _klass = cast(SoupWebsocketExtensionClass*)_vfuncClass;
    if (!_klass.processIncomingMessage)
      return typeof(return).init;

    GBytes* _cretval;
    GError *_err;
    _cretval = _klass.processIncomingMessage(cast(SoupWebsocketExtension*)this._cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload._cPtr(Yes.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcessOutgoingMessage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.bytes.Bytes vfuncProcessOutgoingMessage(ref ubyte header, gid.glib2.bytes.Bytes payload)
  {
    auto _klass = cast(SoupWebsocketExtensionClass*)_vfuncClass;
    if (!_klass.processOutgoingMessage)
      return typeof(return).init;

    GBytes* _cretval;
    GError *_err;
    _cretval = _klass.processOutgoingMessage(cast(SoupWebsocketExtension*)this._cPtr, cast(ubyte*)&header, payload ? cast(GBytes*)payload._cPtr(Yes.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from WebsocketExtension
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.websocket_extension.WebsocketExtension), T.stringof ~ " is not derived from gid.soup3.websocket_extension.WebsocketExtension");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestParams", true)[0]) == gid.soup3.websocket_extension.WebsocketExtension))
      _installVfunc(klass, "get_request_params");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetResponseParams", true)[0]) == gid.soup3.websocket_extension.WebsocketExtension))
      _installVfunc(klass, "get_response_params");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcessIncomingMessage", true)[0]) == gid.soup3.websocket_extension.WebsocketExtension))
      _installVfunc(klass, "process_incoming_message");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcessOutgoingMessage", true)[0]) == gid.soup3.websocket_extension.WebsocketExtension))
      _installVfunc(klass, "process_outgoing_message");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupWebsocketExtensionClass*)klass;

    switch (vfunc)
    {
      case "get_request_params":
      {
        static extern(C) char* _vfuncGetRequestParamsTramp(SoupWebsocketExtension* extension) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.websocket_extension.WebsocketExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)extension);
          if (!_obj)
          {
            auto _klass = cast(SoupWebsocketExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)extension);
            if (_klass.getRequestParams)
              return (cast(typeof(&_vfuncGetRequestParamsTramp))_klass.getRequestParams)(extension);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestParams();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.websocket_extension.WebsocketExtension.vfuncGetRequestParams");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getRequestParams = cast(typeof(_klass.getRequestParams))&_vfuncGetRequestParamsTramp;
        break;
      }
      case "get_response_params":
      {
        static extern(C) char* _vfuncGetResponseParamsTramp(SoupWebsocketExtension* extension) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.websocket_extension.WebsocketExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)extension);
          if (!_obj)
          {
            auto _klass = cast(SoupWebsocketExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)extension);
            if (_klass.getResponseParams)
              return (cast(typeof(&_vfuncGetResponseParamsTramp))_klass.getResponseParams)(extension);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetResponseParams();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.websocket_extension.WebsocketExtension.vfuncGetResponseParams");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.getResponseParams = cast(typeof(_klass.getResponseParams))&_vfuncGetResponseParamsTramp;
        break;
      }
      case "process_incoming_message":
      {
        static extern(C) GBytes* _vfuncProcessIncomingMessageTramp(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.websocket_extension.WebsocketExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)extension);
          if (!_obj)
          {
            auto _klass = cast(SoupWebsocketExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)extension);
            if (_klass.processIncomingMessage)
              return (cast(typeof(&_vfuncProcessIncomingMessageTramp))_klass.processIncomingMessage)(extension, header, payload, _err);
            return typeof(return).init;
          }

          gid.glib2.bytes.Bytes _dretval;

          try
          {
            _dretval = _obj.vfuncProcessIncomingMessage(*header, payload ? new gid.glib2.bytes.Bytes(cast(void*)payload, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GBytes*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.processIncomingMessage = cast(typeof(_klass.processIncomingMessage))&_vfuncProcessIncomingMessageTramp;
        break;
      }
      case "process_outgoing_message":
      {
        static extern(C) GBytes* _vfuncProcessOutgoingMessageTramp(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.websocket_extension.WebsocketExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)extension);
          if (!_obj)
          {
            auto _klass = cast(SoupWebsocketExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)extension);
            if (_klass.processOutgoingMessage)
              return (cast(typeof(&_vfuncProcessOutgoingMessageTramp))_klass.processOutgoingMessage)(extension, header, payload, _err);
            return typeof(return).init;
          }

          gid.glib2.bytes.Bytes _dretval;

          try
          {
            _dretval = _obj.vfuncProcessOutgoingMessage(*header, payload ? new gid.glib2.bytes.Bytes(cast(void*)payload, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GBytes*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.processOutgoingMessage = cast(typeof(_klass.processOutgoingMessage))&_vfuncProcessOutgoingMessageTramp;
        break;
      }
      default:
      break;
    }
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
