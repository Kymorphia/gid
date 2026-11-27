/// Module for [Download] class
module gid.webkit6.download;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.urirequest;
import gid.webkit6.uriresponse;
import gid.webkit6.web_view;

/**
    Object used to communicate with the application when downloading.
    
    #WebKitDownload carries information about a download request and
    response, including a #WebKitURIRequest and a #WebKitURIResponse
    objects. The application may use this object to control the
    download process, or to simply figure out what is to be downloaded,
    and handle the download process itself.
*/
@gidGir("Download", "DownloadClass")
class Download : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_download_get_type != &gidSymbolNotFound ? webkit_download_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitDownload";
  }

  /** Returns `this`, for use in `with` statements. */
  override Download self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.download.Download]
      Returns: New builder object
  */
  static DownloadGidBuilder builder() nothrow
  {
    return new DownloadGidBuilder;
  }

  /**
      Get `allowOverwrite` property.
      Returns: Whether or not the download is allowed to overwrite an existing file on
        disk. If this property is false and the destination already exists,
        the download will fail.
  */
  @property bool allowOverwrite() nothrow
  {
    return getAllowOverwrite();
  }

  /**
      Set `allowOverwrite` property.
      Params:
        propval = Whether or not the download is allowed to overwrite an existing file on
          disk. If this property is false and the destination already exists,
          the download will fail.
  */
  @property void allowOverwrite(bool propval) nothrow
  {
    setAllowOverwrite(propval);
  }

  /**
      Get `destination` property.
      Returns: The local path to where the download will be saved.
  */
  @property string destination() nothrow
  {
    return getDestination();
  }

  /**
      Get `estimatedProgress` property.
      Returns: An estimate of the percent completion for the download operation.
        This value will range from 0.0 to 1.0. The value is an estimate
        based on the total number of bytes expected to be received for
        a download.
        If you need a more accurate progress information you can connect to
        #WebKitDownload::received-data signal to track the progress.
  */
  @property double estimatedProgress() nothrow
  {
    return getEstimatedProgress();
  }

  /**
      Get `response` property.
      Returns: The #WebKitURIResponse associated with this download.
  */
  @property gid.webkit6.uriresponse.URIResponse response() nothrow
  {
    return getResponse();
  }

  /**
      Cancels the download.
      
      When the ongoing download
      operation is effectively cancelled the signal
      #WebKitDownload::failed is emitted with
      [gid.webkit6.types.DownloadError.CancelledByUser] error.
  */
  void cancel() nothrow
  {
    webkit_download_cancel(cast(WebKitDownload*)this._cPtr);
  }

  /**
      Returns the current value of the #WebKitDownload:allow-overwrite property.
      
      Returns the current value of the #WebKitDownload:allow-overwrite property,
      which determines whether the download will overwrite an existing file on
      disk, or if it will fail if the destination already exists.
      Returns: the current value of the #WebKitDownload:allow-overwrite property
  */
  bool getAllowOverwrite() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_download_get_allow_overwrite(cast(WebKitDownload*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the destination to which the downloaded file will be written.
      
      You can connect to #WebKitDownload::created-destination to make
      sure this method returns a valid destination.
      Returns: the destination or null
  */
  string getDestination() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_download_get_destination(cast(WebKitDownload*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the elapsed time in seconds, including any fractional part.
      
      If the download finished, had an error or was cancelled this is
      the time between its start and the event.
      Returns: seconds since the download was started
  */
  double getElapsedTime() nothrow
  {
    double _retval;
    _retval = webkit_download_get_elapsed_time(cast(WebKitDownload*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitDownload:estimated-progress property.
      Gets the value of the #WebKitDownload:estimated-progress property.
      You can monitor the estimated progress of the download operation by
      connecting to the notify::estimated-progress signal of download.
      Returns: an estimate of the of the percent complete for a download
            as a range from 0.0 to 1.0.
  */
  double getEstimatedProgress() nothrow
  {
    double _retval;
    _retval = webkit_download_get_estimated_progress(cast(WebKitDownload*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length of the data already downloaded for download.
      
      Gets the length of the data already downloaded for download
      in bytes.
      Returns: the amount of bytes already downloaded.
  */
  ulong getReceivedDataLength() nothrow
  {
    ulong _retval;
    _retval = webkit_download_get_received_data_length(cast(WebKitDownload*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the #WebKitURIRequest object that backs the download
      process.
      Returns: the #WebKitURIRequest of download
  */
  gid.webkit6.urirequest.URIRequest getRequest() nothrow
  {
    WebKitURIRequest* _cretval;
    _cretval = webkit_download_get_request(cast(WebKitDownload*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.urirequest.URIRequest)(cast(WebKitURIRequest*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the #WebKitURIResponse object that backs the download process.
      
      Retrieves the #WebKitURIResponse object that backs the download
      process. This method returns null if called before the response
      is received from the server. You can connect to notify::response
      signal to be notified when the response is received.
      Returns: the #WebKitURIResponse, or null if
            the response hasn't been received yet.
  */
  gid.webkit6.uriresponse.URIResponse getResponse() nothrow
  {
    WebKitURIResponse* _cretval;
    _cretval = webkit_download_get_response(cast(WebKitDownload*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.uriresponse.URIResponse)(cast(WebKitURIResponse*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitWebView that initiated the download.
      Returns: the #WebKitWebView that initiated download,
           or null if download was not initiated by a #WebKitWebView.
  */
  gid.webkit6.web_view.WebView getWebView() nothrow
  {
    WebKitWebView* _cretval;
    _cretval = webkit_download_get_web_view(cast(WebKitDownload*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.web_view.WebView)(cast(WebKitWebView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the #WebKitDownload:allow-overwrite property.
      
      Sets the #WebKitDownload:allow-overwrite property, which determines whether
      the download may overwrite an existing file on disk, or if it will fail if
      the destination already exists.
  
      Params:
        allowed = the new value for the #WebKitDownload:allow-overwrite property
  */
  void setAllowOverwrite(bool allowed) nothrow
  {
    webkit_download_set_allow_overwrite(cast(WebKitDownload*)this._cPtr, allowed);
  }

  /**
      Sets the destination to which the downloaded file will be written.
      
      This method should be called before the download transfer
      starts or it will not have any effect on the ongoing download
      operation. To set the destination using the filename suggested
      by the server connect to #WebKitDownload::decide-destination
      signal and call [gid.webkit6.download.Download.setDestination]. If you want to
      set a fixed destination that doesn't depend on the suggested
      filename you can connect to notify::response signal and call
      [gid.webkit6.download.Download.setDestination].
      
      If #WebKitDownload::decide-destination signal is not handled
      and destination is not set when the download transfer starts,
      the file will be saved with the filename suggested by the server in
      [gid.glib2.types.UserDirectory.DirectoryDownload] directory.
  
      Params:
        destination = the destination
  */
  void setDestination(string destination) nothrow
  {
    const(char)* _destination = destination.toCString!(No.Malloc, No.Nullable);
    webkit_download_set_destination(cast(WebKitDownload*)this._cPtr, _destination);
  }

  /**
      Connect to `CreatedDestination` signal.
  
      This signal is emitted after #WebKitDownload::decide-destination and before
        #WebKitDownload::received-data to notify that destination file has been
        created successfully at destination.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string destination, gid.webkit6.download.Download download)`
  
          `destination` the destination (optional)
  
          `download` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreatedDestination(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.download.Download)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.download.Download.createdDestination");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("created-destination", closure, after);
  }

  /**
      Connect to `DecideDestination` signal.
  
      This signal is emitted after response is received to
        decide a destination for the download using
        [gid.webkit6.download.Download.setDestination]. If this signal is not
        handled, the file will be downloaded to [gid.glib2.types.UserDirectory.DirectoryDownload]
        directory using suggested_filename.
        
        Since 2.40, you may handle this signal asynchronously by
        returning true without calling [gid.webkit6.download.Download.setDestination].
        This indicates intent to eventually call [gid.webkit6.download.Download.setDestination].
        In this case, the download will not proceed until the destination is set
        or cancelled with [gid.webkit6.download.Download.cancel].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(string suggestedFilename, gid.webkit6.download.Download download)`
  
          `suggestedFilename` the filename suggested for the download (optional)
  
          `download` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event,
              or false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDecideDestination(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.download.Download)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.download.Download.decideDestination");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decide-destination", closure, after);
  }

  /**
      Connect to `Failed` signal.
  
      This signal is emitted when an error occurs during the download
        operation. The given error, of the domain `WEBKIT_DOWNLOAD_ERROR`,
        contains further details of the failure. If the download is cancelled
        with [gid.webkit6.download.Download.cancel], this signal is emitted with error
        [gid.webkit6.types.DownloadError.CancelledByUser]. The download operation finishes
        after an error and #WebKitDownload::finished signal is emitted after this one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.glib2.error.ErrorWrap error, gid.webkit6.download.Download download)`
  
          `error` the #GError that was triggered (optional)
  
          `download` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFailed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.glib2.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.download.Download)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.download.Download.failed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("failed", closure, after);
  }

  /**
      Connect to `Finished` signal.
  
      This signal is emitted when download finishes successfully or due to an error.
        In case of errors #WebKitDownload::failed signal is emitted before this one.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.download.Download download)`
  
          `download` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.download.Download)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.download.Download.finished");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
      Connect to `ReceivedData` signal.
  
      This signal is emitted after response is received,
        every time new data has been written to the destination. It's
        useful to know the progress of the download operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(ulong dataLength, gid.webkit6.download.Download download)`
  
          `dataLength` the length of data received in bytes (optional)
  
          `download` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReceivedData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == ulong)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.download.Download)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.download.Download.receivedData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("received-data", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.download.Download]
class DownloadGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `allowOverwrite` property.
      Params:
        propval = Whether or not the download is allowed to overwrite an existing file on
          disk. If this property is false and the destination already exists,
          the download will fail.
      Returns: Builder instance for fluent chaining
  */
  T allowOverwrite(bool propval) nothrow
  {
    return setProperty("allow-overwrite", propval);
  }
}

/// Fluent builder for [gid.webkit6.download.Download]
final class DownloadGidBuilder : DownloadGidBuilderImpl!DownloadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Download build() nothrow
  {
    return new Download(cast(void*)createGObject(Download._getGType), Yes.Take);
  }
}
