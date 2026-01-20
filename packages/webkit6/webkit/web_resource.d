/// Module for [WebResource] class
module webkit.web_resource;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.urirequest;
import webkit.uriresponse;

/**
    Represents a resource at the end of a URI.
    
    A #WebKitWebResource encapsulates content for each resource at the
    end of a particular URI. For example, one #WebKitWebResource will
    be created for each separate image and stylesheet when a page is
    loaded.
    
    You can access the response and the URI for a given
    #WebKitWebResource, using [webkit.web_resource.WebResource.getUri] and
    [webkit.web_resource.WebResource.getResponse], as well as the raw data, using
    [webkit.web_resource.WebResource.getData].
*/
class WebResource : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_resource_get_type != &gidSymbolNotFound ? webkit_web_resource_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebResource self()
  {
    return this;
  }

  /**
      Get `response` property.
      Returns: The #WebKitURIResponse associated with this resource.
  */
  @property webkit.uriresponse.URIResponse response()
  {
    return getResponse();
  }

  /**
      Get `uri` property.
      Returns: The current active URI of the #WebKitWebResource.
        See [webkit.web_resource.WebResource.getUri] for more details.
  */
  @property string uri()
  {
    return getUri();
  }

  alias getData = gobject.object.ObjectWrap.getData;

  /**
      Asynchronously get the raw data for resource.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.web_resource.WebResource.getDataFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getData(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_resource_get_data(cast(WebKitWebResource*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_resource.WebResource.getData].
  
      Params:
        result = a #GAsyncResult
      Returns: a
           string with the data of resource, or null in case of error. if length
           is not null, the size of the data will be assigned to it.
      Throws: [ErrorWrap]
  */
  ubyte[] getDataFinish(gio.async_result.AsyncResult result)
  {
    ubyte* _cretval;
    size_t _cretlength;
    GError *_err;
    _cretval = webkit_web_resource_get_data_finish(cast(WebKitWebResource*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_cretlength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves the #WebKitURIResponse of the resource load operation.
      
      This method returns null if called before the response
      is received from the server. You can connect to notify::response
      signal to be notified when the response is received.
      Returns: the #WebKitURIResponse, or null if
            the response hasn't been received yet.
  */
  webkit.uriresponse.URIResponse getResponse()
  {
    WebKitURIResponse* _cretval;
    _cretval = webkit_web_resource_get_response(cast(WebKitWebResource*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.uriresponse.URIResponse)(cast(WebKitURIResponse*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current active URI of resource.
      
      The active URI might change during
      a load operation:
      
      <orderedlist>
      <listitem><para>
        When the resource load starts, the active URI is the requested URI
      </para></listitem>
      <listitem><para>
        When the initial request is sent to the server, #WebKitWebResource::sent-request
        signal is emitted without a redirected response, the active URI is the URI of
        the request sent to the server.
      </para></listitem>
      <listitem><para>
        In case of a server redirection, #WebKitWebResource::sent-request signal
        is emitted again with a redirected response, the active URI is the URI the request
        was redirected to.
      </para></listitem>
      <listitem><para>
        When the response is received from the server, the active URI is the final
        one and it will not change again.
      </para></listitem>
      </orderedlist>
      
      You can monitor the active URI by connecting to the notify::uri
      signal of resource.
      Returns: the current active URI of resource
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_resource_get_uri(cast(WebKitWebResource*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Connect to `Failed` signal.
  
      This signal is emitted when an error occurs during the resource
        load operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.error.ErrorWrap error, webkit.web_resource.WebResource webResource))
  
          `error` the #GError that was triggered (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_resource.WebResource)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed", closure, after);
  }

  /**
      Connect to `FailedWithTlsErrors` signal.
  
      This signal is emitted when a TLS error occurs during the resource load operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.tls_certificate.TlsCertificate certificate, gio.types.TlsCertificateFlags errors, webkit.web_resource.WebResource webResource))
  
          `certificate` a #GTlsCertificate (optional)
  
          `errors` a #GTlsCertificateFlags with the verification status of certificate (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFailedWithTlsErrors(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gio.types.TlsCertificateFlags)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_resource.WebResource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed-with-tls-errors", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      This signal is emitted when the resource load finishes successfully
        or due to an error. In case of errors #WebKitWebResource::failed signal
        is emitted before this one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_resource.WebResource webResource))
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_resource.WebResource)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
      Connect to `SentRequest` signal.
  
      This signal is emitted when request has been sent to the
        server. In case of a server redirection this signal is
        emitted again with the request argument containing the new
        request sent to the server due to the redirection and the
        redirected_response parameter containing the response
        received by the server for the initial request.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.urirequest.URIRequest request, webkit.uriresponse.URIResponse redirectedResponse, webkit.web_resource.WebResource webResource))
  
          `request` a #WebKitURIRequest (optional)
  
          `redirectedResponse` a #WebKitURIResponse, or null (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSentRequest(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.urirequest.URIRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.uriresponse.URIResponse)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_resource.WebResource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sent-request", closure, after);
  }
}
