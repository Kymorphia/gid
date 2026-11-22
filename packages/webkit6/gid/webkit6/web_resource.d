/// Module for [WebResource] class
module gid.webkit6.web_resource;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.tls_certificate;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.urirequest;
import gid.webkit6.uriresponse;

/**
    Represents a resource at the end of a URI.
    
    A #WebKitWebResource encapsulates content for each resource at the
    end of a particular URI. For example, one #WebKitWebResource will
    be created for each separate image and stylesheet when a page is
    loaded.
    
    You can access the response and the URI for a given
    #WebKitWebResource, using [gid.webkit6.web_resource.WebResource.getUri] and
    [gid.webkit6.web_resource.WebResource.getResponse], as well as the raw data, using
    [gid.webkit6.web_resource.WebResource.getData].
*/
class WebResource : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_web_resource_get_type != &gidSymbolNotFound ? webkit_web_resource_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebResource";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebResource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.web_resource.WebResource]
      Returns: New builder object
  */
  static WebResourceGidBuilder builder() nothrow
  {
    return new WebResourceGidBuilder;
  }

  /**
      Get `response` property.
      Returns: The #WebKitURIResponse associated with this resource.
  */
  @property gid.webkit6.uriresponse.URIResponse response() nothrow
  {
    return getResponse();
  }

  /**
      Get `uri` property.
      Returns: The current active URI of the #WebKitWebResource.
        See [gid.webkit6.web_resource.WebResource.getUri] for more details.
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  alias getData = gid.gobject2.object.ObjectWrap.getData;

  /**
      Asynchronously get the raw data for resource.
      
      When the operation is finished, callback will be called. You can then call
      [gid.webkit6.web_resource.WebResource.getDataFinish] to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void getData(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_resource_get_data(cast(WebKitWebResource*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkit6.web_resource.WebResource.getData].
  
      Params:
        result = a #GAsyncResult
      Returns: a
           string with the data of resource, or null in case of error. if length
           is not null, the size of the data will be assigned to it.
      Throws: [ErrorWrap]
  */
  ubyte[] getDataFinish(gid.gio2.async_result.AsyncResult result)
  {
    ubyte* _cretval;
    size_t _cretlength;
    GError *_err;
    _cretval = webkit_web_resource_get_data_finish(cast(WebKitWebResource*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_cretlength, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  gid.webkit6.uriresponse.URIResponse getResponse() nothrow
  {
    WebKitURIResponse* _cretval;
    _cretval = webkit_web_resource_get_response(cast(WebKitWebResource*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.uriresponse.URIResponse)(cast(WebKitURIResponse*)_cretval, No.Take);
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
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_resource_get_uri(cast(WebKitWebResource*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Connect to `Failed` signal.
  
      This signal is emitted when an error occurs during the resource
        load operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.glib2.error.ErrorWrap error, gid.webkit6.web_resource.WebResource webResource)`
  
          `error` the #GError that was triggered (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.glib2.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.web_resource.WebResource)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.web_resource.WebResource.failed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed", closure, after);
  }

  /**
      Connect to `FailedWithTlsErrors` signal.
  
      This signal is emitted when a TLS error occurs during the resource load operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.tls_certificate.TlsCertificate certificate, gid.gio2.types.TlsCertificateFlags errors, gid.webkit6.web_resource.WebResource webResource)`
  
          `certificate` a #GTlsCertificate (optional)
  
          `errors` a #GTlsCertificateFlags with the verification status of certificate (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFailedWithTlsErrors(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gio2.types.TlsCertificateFlags)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkit6.web_resource.WebResource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.web_resource.WebResource.failedWithTlsErrors");
      }
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
  
          `void callback(gid.webkit6.web_resource.WebResource webResource)`
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.web_resource.WebResource)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.web_resource.WebResource.finished");
      }
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
  
          `void callback(gid.webkit6.urirequest.URIRequest request, gid.webkit6.uriresponse.URIResponse redirectedResponse, gid.webkit6.web_resource.WebResource webResource)`
  
          `request` a #WebKitURIRequest (optional)
  
          `redirectedResponse` a #WebKitURIResponse, or null (optional)
  
          `webResource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSentRequest(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.urirequest.URIRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.uriresponse.URIResponse)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkit6.web_resource.WebResource)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.web_resource.WebResource.sentRequest");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sent-request", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.web_resource.WebResource]
class WebResourceGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.web_resource.WebResource]
final class WebResourceGidBuilder : WebResourceGidBuilderImpl!WebResourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebResource build() nothrow
  {
    return new WebResource(cast(void*)createGObject(WebResource._getGType), Yes.Take);
  }
}
