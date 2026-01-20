/// Module for [WebPage] class
module webkitwebprocessextension.web_page;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.console_message;
import webkitwebprocessextension.context_menu;
import webkitwebprocessextension.frame;
import webkitwebprocessextension.script_world;
import webkitwebprocessextension.types;
import webkitwebprocessextension.urirequest;
import webkitwebprocessextension.uriresponse;
import webkitwebprocessextension.user_message;
import webkitwebprocessextension.web_editor;
import webkitwebprocessextension.web_form_manager;
import webkitwebprocessextension.web_hit_test_result;

/**
    A loaded web page.
*/
class WebPage : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_page_get_type != &gidSymbolNotFound ? webkit_web_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebPage self()
  {
    return this;
  }

  /**
      Get `uri` property.
      Returns: The current active URI of the #WebKitWebPage.
  */
  @property string uri()
  {
    return getUri();
  }

  /**
      Gets the #WebKitWebEditor of a #WebKitWebPage.
      Returns: the #WebKitWebEditor
  */
  webkitwebprocessextension.web_editor.WebEditor getEditor()
  {
    WebKitWebEditor* _cretval;
    _cretval = webkit_web_page_get_editor(cast(WebKitWebPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.web_editor.WebEditor)(cast(WebKitWebEditor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitWebFormManager of web_page in world.
  
      Params:
        world = a #WebKitScriptWorld
      Returns: a #WebKitWebFormManager
  */
  webkitwebprocessextension.web_form_manager.WebFormManager getFormManager(webkitwebprocessextension.script_world.ScriptWorld world = null)
  {
    WebKitWebFormManager* _cretval;
    _cretval = webkit_web_page_get_form_manager(cast(WebKitWebPage*)this._cPtr, world ? cast(WebKitScriptWorld*)world._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.web_form_manager.WebFormManager)(cast(WebKitWebFormManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the identifier of the #WebKitWebPage
      Returns: the identifier of web_page
  */
  ulong getId()
  {
    ulong _retval;
    _retval = webkit_web_page_get_id(cast(WebKitWebPage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the main frame of a #WebKitWebPage.
      Returns: the #WebKitFrame that is the main frame of web_page
  */
  webkitwebprocessextension.frame.Frame getMainFrame()
  {
    WebKitFrame* _cretval;
    _cretval = webkit_web_page_get_main_frame(cast(WebKitWebPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.frame.Frame)(cast(WebKitFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current active URI of web_page.
      
      You can monitor the active URI by connecting to the notify::uri
      signal of web_page.
      Returns: the current active URI of web_view or null if nothing has been
           loaded yet.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_page_get_uri(cast(WebKitWebPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Send message to the #WebKitWebView corresponding to web_page. If message is floating, it's consumed.
      
      If you don't expect any reply, or you simply want to ignore it, you can pass null as callback.
      When the operation is finished, callback will be called. You can then call
      [webkitwebprocessextension.web_page.WebPage.sendMessageToViewFinish] to get the message reply.
  
      Params:
        message = a #WebKitUserMessage
        cancellable = a #GCancellable or null to ignore
        callback = A #GAsyncReadyCallback to call when the request is satisfied or null
  */
  void sendMessageToView(webkitwebprocessextension.user_message.UserMessage message, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_page_send_message_to_view(cast(WebKitWebPage*)this._cPtr, message ? cast(WebKitUserMessage*)message._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkitwebprocessextension.web_page.WebPage.sendMessageToView].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserMessage with the reply or null in case of error.
      Throws: [ErrorWrap]
  */
  webkitwebprocessextension.user_message.UserMessage sendMessageToViewFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserMessage* _cretval;
    GError *_err;
    _cretval = webkit_web_page_send_message_to_view_finish(cast(WebKitWebPage*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, Yes.Take);
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
  
          $(D void callback(webkitwebprocessextension.console_message.ConsoleMessage consoleMessage, webkitwebprocessextension.web_page.WebPage webPage))
  
          `consoleMessage` the #WebKitConsoleMessage (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConsoleMessageSent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkitwebprocessextension.console_message.ConsoleMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.web_page.WebPage)))
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
  
          $(D bool callback(webkitwebprocessextension.context_menu.ContextMenu contextMenu, webkitwebprocessextension.web_hit_test_result.WebHitTestResult hitTestResult, webkitwebprocessextension.web_page.WebPage webPage))
  
          `contextMenu` the proposed #WebKitContextMenu (optional)
  
          `hitTestResult` a #WebKitWebHitTestResult (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true if the proposed context_menu has been modified, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectContextMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.context_menu.ContextMenu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.web_hit_test_result.WebHitTestResult)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.web_page.WebPage)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(webkitwebprocessextension.web_page.WebPage webPage))
  
          `webPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDocumentLoaded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.web_page.WebPage)))
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
  
          $(D bool callback(webkitwebprocessextension.urirequest.URIRequest request, webkitwebprocessextension.uriresponse.URIResponse redirectedResponse, webkitwebprocessextension.web_page.WebPage webPage))
  
          `request` a #WebKitURIRequest (optional)
  
          `redirectedResponse` a #WebKitURIResponse, or null (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to continue emission of the event.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSendRequest(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.urirequest.URIRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.uriresponse.URIResponse)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkitwebprocessextension.web_page.WebPage)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("send-request", closure, after);
  }

  /**
      Connect to `UserMessageReceived` signal.
  
      This signal is emitted when a #WebKitUserMessage is received from the
        #WebKitWebView corresponding to web_page. You can reply to the message
        using [webkitwebprocessextension.user_message.UserMessage.sendReply].
        
        You can handle the user message asynchronously by calling [gobject.object.ObjectWrap.ref_] on
        message and returning true. If the last reference of message is removed
        and the message has been replied, the operation in the #WebKitWebView will
        finish with error [webkit.types.UserMessageError.Message].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkitwebprocessextension.user_message.UserMessage message, webkitwebprocessextension.web_page.WebPage webPage))
  
          `message` the #WebKitUserMessage received (optional)
  
          `webPage` the instance the signal is connected to (optional)
  
          `Returns` true if the message was handled, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUserMessageReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.user_message.UserMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.web_page.WebPage)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("user-message-received", closure, after);
  }
}
