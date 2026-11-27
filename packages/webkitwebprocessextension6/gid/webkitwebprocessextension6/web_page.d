/// Module for [WebPage] class
module gid.webkitwebprocessextension6.web_page;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.console_message;
import gid.webkitwebprocessextension6.context_menu;
import gid.webkitwebprocessextension6.frame;
import gid.webkitwebprocessextension6.script_world;
import gid.webkitwebprocessextension6.types;
import gid.webkitwebprocessextension6.urirequest;
import gid.webkitwebprocessextension6.uriresponse;
import gid.webkitwebprocessextension6.user_message;
import gid.webkitwebprocessextension6.web_editor;
import gid.webkitwebprocessextension6.web_form_manager;
import gid.webkitwebprocessextension6.web_hit_test_result;

/**
    A loaded web page.
*/
@gidGir("WebPage", "WebPageClass")
class WebPage : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_web_page_get_type != &gidSymbolNotFound ? webkit_web_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitWebPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override WebPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkitwebprocessextension6.web_page.WebPage]
      Returns: New builder object
  */
  static WebPageGidBuilder builder() nothrow
  {
    return new WebPageGidBuilder;
  }

  /**
      Get `uri` property.
      Returns: The current active URI of the #WebKitWebPage.
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  /**
      Gets the #WebKitWebEditor of a #WebKitWebPage.
      Returns: the #WebKitWebEditor
  */
  gid.webkitwebprocessextension6.web_editor.WebEditor getEditor() nothrow
  {
    WebKitWebEditor* _cretval;
    _cretval = webkit_web_page_get_editor(cast(WebKitWebPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkitwebprocessextension6.web_editor.WebEditor)(cast(WebKitWebEditor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitWebFormManager of web_page in world.
  
      Params:
        world = a #WebKitScriptWorld
      Returns: a #WebKitWebFormManager
  */
  gid.webkitwebprocessextension6.web_form_manager.WebFormManager getFormManager(gid.webkitwebprocessextension6.script_world.ScriptWorld world = null) nothrow
  {
    WebKitWebFormManager* _cretval;
    _cretval = webkit_web_page_get_form_manager(cast(WebKitWebPage*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkitwebprocessextension6.web_form_manager.WebFormManager)(cast(WebKitWebFormManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the identifier of the #WebKitWebPage
      Returns: the identifier of web_page
  */
  ulong getId() nothrow
  {
    ulong _retval;
    _retval = webkit_web_page_get_id(cast(WebKitWebPage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the main frame of a #WebKitWebPage.
      Returns: the #WebKitFrame that is the main frame of web_page
  */
  gid.webkitwebprocessextension6.frame.Frame getMainFrame() nothrow
  {
    WebKitFrame* _cretval;
    _cretval = webkit_web_page_get_main_frame(cast(WebKitWebPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkitwebprocessextension6.frame.Frame)(cast(WebKitFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current active URI of web_page.
      
      You can monitor the active URI by connecting to the notify::uri
      signal of web_page.
      Returns: the current active URI of web_view or null if nothing has been
           loaded yet.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_web_page_get_uri(cast(WebKitWebPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Send message to the #WebKitWebView corresponding to web_page. If message is floating, it's consumed.
      
      If you don't expect any reply, or you simply want to ignore it, you can pass null as callback.
      When the operation is finished, callback will be called. You can then call
      [gid.webkitwebprocessextension6.web_page.WebPage.sendMessageToViewFinish] to get the message reply.
  
      Params:
        message = a #WebKitUserMessage
        cancellable = a #GCancellable or null to ignore
        callback = A #GAsyncReadyCallback to call when the request is satisfied or null
  */
  void sendMessageToView(gid.webkitwebprocessextension6.user_message.UserMessage message, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    webkit_web_page_send_message_to_view(cast(WebKitWebPage*)this._cPtr, message ? cast(WebKitUserMessage*)message._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [gid.webkitwebprocessextension6.web_page.WebPage.sendMessageToView].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserMessage with the reply or null in case of error.
      Throws: [ErrorWrap]
  */
  gid.webkitwebprocessextension6.user_message.UserMessage sendMessageToViewFinish(gid.gio2.async_result.AsyncResult result)
  {
    WebKitUserMessage* _cretval;
    GError *_err;
    _cretval = webkit_web_page_send_message_to_view_finish(cast(WebKitWebPage*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkitwebprocessextension6.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `ConsoleMessageSent` signal.
  
      Emitted when a message is sent to the console. This can be a message
        produced by the use of JavaScript console API, a JavaScript exception,
        a security error or other errors, warnings, debug or log messages.
        The console_message contains information of the message.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkitwebprocessextension6.console_message.ConsoleMessage consoleMessage, gid.webkitwebprocessextension6.web_page.WebPage webPage)`
  
          `consoleMessage` the #WebKitConsoleMessage (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectConsoleMessageSent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.webkitwebprocessextension6.console_message.ConsoleMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkitwebprocessextension6.web_page.WebPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_page.WebPage.consoleMessageSent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("console-message-sent", closure, after);
  }

  /**
      Connect to `ContextMenu` signal.
  
      Emitted before a context menu is displayed in the UI Process to
        give the application a chance to customize the proposed menu,
        build its own context menu or pass user data to the UI Process.
        This signal is useful when the information available in the UI Process
        is not enough to build or customize the context menu, for example, to
        add menu entries depending on the node at the coordinates of the
        hit_test_result. Otherwise, it's recommended to use #WebKitWebView::context-menu
        signal instead.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.webkitwebprocessextension6.context_menu.ContextMenu contextMenu, gid.webkitwebprocessextension6.web_hit_test_result.WebHitTestResult hitTestResult, gid.webkitwebprocessextension6.web_page.WebPage webPage)`
  
          `contextMenu` the proposed #WebKitContextMenu (optional)
  
          `hitTestResult` a #WebKitWebHitTestResult (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true if the proposed context_menu has been modified, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectContextMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkitwebprocessextension6.context_menu.ContextMenu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkitwebprocessextension6.web_hit_test_result.WebHitTestResult)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkitwebprocessextension6.web_page.WebPage)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_page.WebPage.contextMenu");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("context-menu", closure, after);
  }

  /**
      Connect to `DocumentLoaded` signal.
  
      This signal is emitted when the DOM document of a #WebKitWebPage has been
        loaded.
        
        You can wait for this signal to get the DOM document
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkitwebprocessextension6.web_page.WebPage webPage)`
  
          `webPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDocumentLoaded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkitwebprocessextension6.web_page.WebPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_page.WebPage.documentLoaded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("document-loaded", closure, after);
  }

  /**
      Connect to `SendRequest` signal.
  
      This signal is emitted when request is about to be sent to
        the server. This signal can be used to modify the #WebKitURIRequest
        that will be sent to the server. You can also cancel the resource load
        operation by connecting to this signal and returning true.
        
        In case of a server redirection this signal is
        emitted again with the request argument containing the new
        request to be sent to the server due to the redirection and the
        redirected_response parameter containing the response
        received by the server for the initial request.
        
        Modifications to the #WebKitURIRequest and its associated
        #SoupMessageHeaders will be taken into account when the request
        is sent over the network.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.webkitwebprocessextension6.urirequest.URIRequest request, gid.webkitwebprocessextension6.uriresponse.URIResponse redirectedResponse, gid.webkitwebprocessextension6.web_page.WebPage webPage)`
  
          `request` a #WebKitURIRequest (optional)
  
          `redirectedResponse` a #WebKitURIResponse, or null (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to continue emission of the event.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSendRequest(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkitwebprocessextension6.urirequest.URIRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkitwebprocessextension6.uriresponse.URIResponse)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkitwebprocessextension6.web_page.WebPage)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_page.WebPage.sendRequest");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("send-request", closure, after);
  }

  /**
      Connect to `UserMessageReceived` signal.
  
      This signal is emitted when a #WebKitUserMessage is received from the
        #WebKitWebView corresponding to web_page. You can reply to the message
        using [gid.webkitwebprocessextension6.user_message.UserMessage.sendReply].
        
        You can handle the user message asynchronously by calling [gid.gobject2.object.ObjectWrap.ref_] on
        message and returning true. If the last reference of message is removed
        and the message has been replied, the operation in the #WebKitWebView will
        finish with error [gid.webkitwebprocessextension6.types.UserMessageError.UserMessageUnhandledMessage].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.webkitwebprocessextension6.user_message.UserMessage message, gid.webkitwebprocessextension6.web_page.WebPage webPage)`
  
          `message` the #WebKitUserMessage received (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true if the message was handled, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUserMessageReceived(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkitwebprocessextension6.user_message.UserMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkitwebprocessextension6.web_page.WebPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkitwebprocessextension6.web_page.WebPage.userMessageReceived");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("user-message-received", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkitwebprocessextension6.web_page.WebPage]
class WebPageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkitwebprocessextension6.web_page.WebPage]
final class WebPageGidBuilder : WebPageGidBuilderImpl!WebPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WebPage build() nothrow
  {
    return new WebPage(cast(void*)createGObject(WebPage._getGType), Yes.Take);
  }
}
