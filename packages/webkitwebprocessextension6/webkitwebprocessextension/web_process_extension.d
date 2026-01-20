/// Module for [WebProcessExtension] class
module webkitwebprocessextension.web_process_extension;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;
import webkitwebprocessextension.user_message;
import webkitwebprocessextension.web_page;

/**
    Represents an extension of the web process.
    
    WebKitWebProcessExtension is a loadable module for the web process. It allows you to execute code in the
    web process and being able to use the DOM API, to change any request or to inject custom
    JavaScript code, for example.
    
    To create a WebKitWebProcessExtension you should write a module with an initialization function that could
    be either webkit_web_process_extension_initialize() with prototype #WebKitWebProcessExtensionInitializeFunction or
    webkit_web_process_extension_initialize_with_user_data() with prototype #WebKitWebProcessExtensionInitializeWithUserDataFunction.
    This function has to be public and it has to use the #G_MODULE_EXPORT macro. It is called when the
    web process is initialized.
    
    ```c
    static void
    web_page_created_callback (WebKitWebProcessExtension *extension,
                               WebKitWebPage             *web_page,
                               gpointer                   user_data)
    {
        g_print ("Page %d created for %s\n",
                 webkit_web_page_get_id (web_page),
                 webkit_web_page_get_uri (web_page));
    }
    
    G_MODULE_EXPORT void
    webkit_web_process_extension_initialize (WebKitWebProcessExtension *extension)
    {
        g_signal_connect (extension, "page-created",
                          G_CALLBACK (web_page_created_callback),
                          NULL);
    }
    ```
    
    The previous piece of code shows a trivial example of an extension that notifies when
    a #WebKitWebPage is created.
    
    WebKit has to know where it can find the created WebKitWebProcessExtension. To do so you
    should use the webkit_web_context_set_web_extensions_directory() function. The signal
    #WebKitWebContext::initialize-web-extensions is the recommended place to call it.
    
    To provide the initialization data used by the webkit_web_process_extension_initialize_with_user_data()
    function, you have to call webkit_web_context_set_web_extensions_initialization_user_data() with
    the desired data as parameter. You can see an example of this in the following piece of code:
    
    ```c
    #define WEB_EXTENSIONS_DIRECTORY // ...
    
    static void
    initialize_web_extensions (WebKitWebContext *context,
                               gpointer          user_data)
    {
      // Web Extensions get a different ID for each Web Process
      static guint32 unique_id = 0;
    
      webkit_web_context_set_web_extensions_directory (
         context, WEB_EXTENSIONS_DIRECTORY);
      webkit_web_context_set_web_extensions_initialization_user_data (
         context, g_variant_new_uint32 (unique_id++));
    }
    
    int main (int argc, char **argv)
    {
      g_signal_connect (webkit_web_context_get_default (),
                       "initialize-web-extensions",
                        G_CALLBACK (initialize_web_extensions),
                        NULL);
    
      GtkWidget *view = webkit_web_view_new ();
    
      // ...
    }
    ```
*/
class WebProcessExtension : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_process_extension_get_type != &gidSymbolNotFound ? webkit_web_process_extension_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebProcessExtension self()
  {
    return this;
  }

  /**
      Get the web page of the given page_id.
  
      Params:
        pageId = the identifier of the #WebKitWebPage to get
      Returns: the #WebKitWebPage for the given page_id, or null if the
           identifier doesn't correspond to an existing web page.
  */
  webkitwebprocessextension.web_page.WebPage getPage(ulong pageId)
  {
    WebKitWebPage* _cretval;
    _cretval = webkit_web_process_extension_get_page(cast(WebKitWebProcessExtension*)this._cPtr, pageId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.web_page.WebPage)(cast(WebKitWebPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Send message to the #WebKitWebContext corresponding to extension. If message is floating, it's consumed.
      
      If you don't expect any reply, or you simply want to ignore it, you can pass null as calback.
      When the operation is finished, callback will be called. You can then call
      [webkitwebprocessextension.web_process_extension.WebProcessExtension.sendMessageToContextFinish] to get the message reply.
  
      Params:
        message = a #WebKitUserMessage
        cancellable = a #GCancellable or null to ignore
        callback = A #GAsyncReadyCallback to call when the request is satisfied or null
  */
  void sendMessageToContext(webkitwebprocessextension.user_message.UserMessage message, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_process_extension_send_message_to_context(cast(WebKitWebProcessExtension*)this._cPtr, message ? cast(WebKitUserMessage*)message._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkitwebprocessextension.web_process_extension.WebProcessExtension.sendMessageToContext].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserMessage with the reply or null in case of error.
      Throws: [ErrorWrap]
  */
  webkitwebprocessextension.user_message.UserMessage sendMessageToContextFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserMessage* _cretval;
    GError *_err;
    _cretval = webkit_web_process_extension_send_message_to_context_finish(cast(WebKitWebProcessExtension*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `PageCreated` signal.
  
      This signal is emitted when a new #WebKitWebPage is created in
        the Web Process.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkitwebprocessextension.web_page.WebPage webPage, webkitwebprocessextension.web_process_extension.WebProcessExtension webProcessExtension))
  
          `webPage` the #WebKitWebPage created (optional)
  
          `webProcessExtension` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageCreated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.web_page.WebPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.web_process_extension.WebProcessExtension)))
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
    return connectSignalClosure("page-created", closure, after);
  }

  /**
      Connect to `UserMessageReceived` signal.
  
      This signal is emitted when a #WebKitUserMessage is received from the
        #WebKitWebContext corresponding to extension. Messages sent by #WebKitWebContext
        are always broadcasted to all web extensions and they can't be
        replied to. Calling [webkitwebprocessextension.user_message.UserMessage.sendReply] will do nothing.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkitwebprocessextension.user_message.UserMessage message, webkitwebprocessextension.web_process_extension.WebProcessExtension webProcessExtension))
  
          `message` the #WebKitUserMessage received (optional)
  
          `webProcessExtension` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUserMessageReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkitwebprocessextension.user_message.UserMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkitwebprocessextension.web_process_extension.WebProcessExtension)))
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
    return connectSignalClosure("user-message-received", closure, after);
  }
}
