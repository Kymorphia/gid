/// Module for [WebView] class
module webkit.web_view;

import gdk.rectangle;
import gdk.rgba;
import gdk.texture;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.input_stream;
import gio.tls_certificate;
import gio.types;
import glib.bytes;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import javascriptcore.value;
import webkit.authentication_request;
import webkit.back_forward_list;
import webkit.back_forward_list_item;
import webkit.c.functions;
import webkit.c.types;
import webkit.color_chooser_request;
import webkit.context_menu;
import webkit.download;
import webkit.editor_state;
import webkit.file_chooser_request;
import webkit.find_controller;
import webkit.form_submission_request;
import webkit.hit_test_result;
import webkit.input_method_context;
import webkit.navigation_action;
import webkit.network_session;
import webkit.notification;
import webkit.option_menu;
import webkit.permission_request;
import webkit.permission_state_query;
import webkit.policy_decision;
import webkit.print_operation;
import webkit.script_dialog;
import webkit.settings;
import webkit.types;
import webkit.urirequest;
import webkit.user_content_manager;
import webkit.user_message;
import webkit.web_context;
import webkit.web_inspector;
import webkit.web_resource;
import webkit.web_view_base;
import webkit.web_view_session_state;
import webkit.website_policies;
import webkit.window_properties;

/**
    The central class of the WPE WebKit and WebKitGTK APIs.
    
    #WebKitWebView is the central class of the WPE WebKit and WebKitGTK
    APIs. It is responsible for managing the drawing of the content and
    forwarding of events. You can load any URI into the #WebKitWebView or
    a data string. With #WebKitSettings you can control various aspects
    of the rendering and loading of the content.
    
    Note that in WebKitGTK, #WebKitWebView is scrollable by itself, so
    you don't need to embed it in a #GtkScrolledWindow.
*/
class WebView : webkit.web_view_base.WebViewBase
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
    return cast(void function())webkit_web_view_get_type != &gidSymbolNotFound ? webkit_web_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebView self()
  {
    return this;
  }

  /**
      Get `cameraCaptureState` property.
      Returns: Capture state of the camera device. Whenever the user grants a media-request sent by the web
        page, requesting video capture capabilities (`navigator.mediaDevices.getUserMedia({video:
        true})`) this property will be set to [webkit.types.MediaCaptureState.Active].
        
        The application can monitor this property and provide a visual indicator allowing to optionally
        deactivate or mute the capture device by setting this property respectively to
        [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
        
        If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
        can still re-request the permission to the user. Permission desision caching is left to the
        application.
  */
  @property webkit.types.MediaCaptureState cameraCaptureState()
  {
    return getCameraCaptureState();
  }

  /**
      Set `cameraCaptureState` property.
      Params:
        propval = Capture state of the camera device. Whenever the user grants a media-request sent by the web
          page, requesting video capture capabilities (`navigator.mediaDevices.getUserMedia({video:
          true})`) this property will be set to [webkit.types.MediaCaptureState.Active].
          
          The application can monitor this property and provide a visual indicator allowing to optionally
          deactivate or mute the capture device by setting this property respectively to
          [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
          
          If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
          can still re-request the permission to the user. Permission desision caching is left to the
          application.
  */
  @property void cameraCaptureState(webkit.types.MediaCaptureState propval)
  {
    return setCameraCaptureState(propval);
  }

  /**
      Get `displayCaptureState` property.
      Returns: Capture state of the display device. Whenever the user grants a media-request sent by the web
        page, requesting screencasting capabilities (`navigator.mediaDevices.getDisplayMedia() this
        property will be set to [webkit.types.MediaCaptureState.Active].
        
        The application can monitor this property and provide a visual indicator allowing to
        optionally deactivate or mute the capture device by setting this property respectively to
        [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
        
        If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
        can still re-request the permission to the user. Permission desision caching is left to the
        application.
  */
  @property webkit.types.MediaCaptureState displayCaptureState()
  {
    return getDisplayCaptureState();
  }

  /**
      Set `displayCaptureState` property.
      Params:
        propval = Capture state of the display device. Whenever the user grants a media-request sent by the web
          page, requesting screencasting capabilities (`navigator.mediaDevices.getDisplayMedia() this
          property will be set to [webkit.types.MediaCaptureState.Active].
          
          The application can monitor this property and provide a visual indicator allowing to
          optionally deactivate or mute the capture device by setting this property respectively to
          [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
          
          If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
          can still re-request the permission to the user. Permission desision caching is left to the
          application.
  */
  @property void displayCaptureState(webkit.types.MediaCaptureState propval)
  {
    return setDisplayCaptureState(propval);
  }

  /**
      Get `editable` property.
      Returns: Whether the pages loaded inside #WebKitWebView are editable. For more
        information see [webkit.web_view.WebView.setEditable].
  */
  @property bool editable()
  {
    return isEditable();
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the pages loaded inside #WebKitWebView are editable. For more
          information see [webkit.web_view.WebView.setEditable].
  */
  @property void editable(bool propval)
  {
    return setEditable(propval);
  }

  /**
      Get `estimatedLoadProgress` property.
      Returns: An estimate of the percent completion for the current loading operation.
        This value will range from 0.0 to 1.0 and, once a load completes,
        will remain at 1.0 until a new load starts, at which point it
        will be reset to 0.0.
        The value is an estimate based on the total number of bytes expected
        to be received for a document, including all its possible subresources
        and child documents.
  */
  @property double estimatedLoadProgress()
  {
    return getEstimatedLoadProgress();
  }

  /**
      Get `favicon` property.
      Returns: The favicon currently associated to the #WebKitWebView.
        See [webkit.web_view.WebView.getFavicon] for more details.
  */
  @property gdk.texture.Texture favicon()
  {
    return getFavicon();
  }

  /**
      Get `isMuted` property.
      Returns: Whether the #WebKitWebView audio is muted. When true, audio is silenced.
        It may still be playing, i.e. #WebKitWebView:is-playing-audio may be true.
  */
  @property bool isMuted()
  {
    return getIsMuted();
  }

  /**
      Set `isMuted` property.
      Params:
        propval = Whether the #WebKitWebView audio is muted. When true, audio is silenced.
          It may still be playing, i.e. #WebKitWebView:is-playing-audio may be true.
  */
  @property void isMuted(bool propval)
  {
    return setIsMuted(propval);
  }

  /**
      Get `isWebProcessResponsive` property.
      Returns: Whether the web process currently associated to the #WebKitWebView is responsive.
  */
  @property bool isWebProcessResponsive()
  {
    return getIsWebProcessResponsive();
  }

  /**
      Get `microphoneCaptureState` property.
      Returns: Capture state of the microphone device. Whenever the user grants a media-request sent by the web
        page, requesting audio capture capabilities (`navigator.mediaDevices.getUserMedia({audio:
        true})`) this property will be set to [webkit.types.MediaCaptureState.Active].
        
        The application can monitor this property and provide a visual indicator allowing to
        optionally deactivate or mute the capture device by setting this property respectively to
        [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
        
        If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
        can still re-request the permission to the user. Permission desision caching is left to the
        application.
  */
  @property webkit.types.MediaCaptureState microphoneCaptureState()
  {
    return getMicrophoneCaptureState();
  }

  /**
      Set `microphoneCaptureState` property.
      Params:
        propval = Capture state of the microphone device. Whenever the user grants a media-request sent by the web
          page, requesting audio capture capabilities (`navigator.mediaDevices.getUserMedia({audio:
          true})`) this property will be set to [webkit.types.MediaCaptureState.Active].
          
          The application can monitor this property and provide a visual indicator allowing to
          optionally deactivate or mute the capture device by setting this property respectively to
          [webkit.types.MediaCaptureState.None] or [webkit.types.MediaCaptureState.Muted].
          
          If the capture state of the device is set to [webkit.types.MediaCaptureState.None] the web-page
          can still re-request the permission to the user. Permission desision caching is left to the
          application.
  */
  @property void microphoneCaptureState(webkit.types.MediaCaptureState propval)
  {
    return setMicrophoneCaptureState(propval);
  }

  /**
      Get `pageId` property.
      Returns: The identifier of the #WebKitWebPage corresponding to the #WebKitWebView.
  */
  @property ulong pageId()
  {
    return getPageId();
  }

  /**
      Set `settings` property.
      Params:
        propval = The #WebKitSettings of the view.
  */
  @property void settings(webkit.settings.Settings propval)
  {
    return setSettings(propval);
  }

  /**
      Get `title` property.
      Returns: The main frame document title of this #WebKitWebView. If
        the title has not been received yet, it will be null.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Get `uri` property.
      Returns: The current active URI of the #WebKitWebView.
        See [webkit.web_view.WebView.getUri] for more details.
  */
  @property string uri()
  {
    return getUri();
  }

  /**
      Get `zoomLevel` property.
      Returns: The zoom level of the #WebKitWebView content.
        See [webkit.web_view.WebView.setZoomLevel] for more details.
  */
  @property double zoomLevel()
  {
    return getZoomLevel();
  }

  /**
      Set `zoomLevel` property.
      Params:
        propval = The zoom level of the #WebKitWebView content.
          See [webkit.web_view.WebView.setZoomLevel] for more details.
  */
  @property void zoomLevel(double propval)
  {
    return setZoomLevel(propval);
  }

  /**
      Creates a new #WebKitWebView with the default #WebKitWebContext.
      
      Creates a new #WebKitWebView with the default #WebKitWebContext and
      no #WebKitUserContentManager associated with it.
      See also webkit_web_view_new_with_context(),
      webkit_web_view_new_with_user_content_manager(), and
      webkit_web_view_new_with_settings().
      Returns: The newly created #WebKitWebView widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = webkit_web_view_new();
    this(_cretval, No.Take);
  }

  /**
      Asynchronously call body with arguments in the script world with name world_name of the main frame current context in web_view.
      The arguments values must be one of the following types, or contain only the following GVariant types: number, string and dictionary.
      The result of the operation can be a Promise that will be properly passed to the callback.
      If world_name is null, the default world is used. Any value that is not null is a distin ct world.
      The source_uri will be shown in exceptions and doesn't affect the behavior of the script.
      When not provided, the document URL is used.
      
      Note that if #WebKitSettings:enable-javascript is false, this method will do nothing.
      If you want to use this method but still prevent web content from executing its own
      JavaScript, then use #WebKitSettings:enable-javascript-markup.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.web_view.WebView.callAsyncJavascriptFunctionFinish] to get the result of the operation.
      
      This is an example that shows how to pass arguments to a JS function that returns a Promise
      that resolves with the passed argument:
      
      ```c
      static void
      web_view_javascript_finished (GObject      *object,
                                    GAsyncResult *result,
                                    gpointer      user_data)
      {
          JSCValue               *value;
          GError                 *error = NULL;
      
          value = webkit_web_view_call_async_javascript_function_finish (WEBKIT_WEB_VIEW (object), result, &error);
          if (!value) {
              g_warning ("Error running javascript: %s", error->message);
              g_error_free (error);
              return;
          }
      
          if (jsc_value_is_number (value)) {
              gint32        int_value = jsc_value_to_string (value);
              JSCException *exception = jsc_context_get_exception (jsc_value_get_context (value));
              if (exception)
                  g_warning ("Error running javascript: %s", jsc_exception_get_message (exception));
              else
                  g_print ("Script result: %d\n", int_value);
              g_free (str_value);
          } else {
              g_warning ("Error running javascript: unexpected return value");
          }
          g_object_unref (value);
      }
      
      static void
      web_view_evaluate_promise (WebKitWebView *web_view)
      {
          GVariantDict dict;
          g_variant_dict_init (&dict, NULL);
          g_variant_dict_insert (&dict, "count", "u", 42);
          GVariant *args = g_variant_dict_end (&dict);
          const gchar *body = "return new Promise((resolve) => { resolve(count); });";
          webkit_web_view_call_async_javascript_function (web_view, body, -1, arguments, NULL, NULL, NULL, web_view_javascript_finished, NULL);
      }
      ```
  
      Params:
        body_ = the function body
        arguments = a #GVariant with format `a{sv}` storing the function arguments, or null
        worldName = the name of a #WebKitScriptWorld or null to use the default
        sourceUri = the source URI
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the script finished
  */
  void callAsyncJavascriptFunction(string body_, glib.variant.Variant arguments = null, string worldName = null, string sourceUri = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    ptrdiff_t _length;
    if (body_)
      _length = cast(ptrdiff_t)body_.length;

    auto _body_ = cast(const(char)*)body_.ptr;
    const(char)* _worldName = worldName.toCString(No.Alloc);
    const(char)* _sourceUri = sourceUri.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_call_async_javascript_function(cast(WebKitWebView*)this._cPtr, _body_, _length, arguments ? cast(GVariant*)arguments._cPtr(No.Dup) : null, _worldName, _sourceUri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.callAsyncJavascriptFunction].
  
      Params:
        result = a #GAsyncResult
      Returns: a #JSCValue with the return value of the async function
           or null in case of error
      Throws: [ErrorWrap]
  */
  javascriptcore.value.Value callAsyncJavascriptFunctionFinish(gio.async_result.AsyncResult result)
  {
    JSCValue* _cretval;
    GError *_err;
    _cretval = webkit_web_view_call_async_javascript_function_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously check if it is possible to execute the given editing command.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.web_view.WebView.canExecuteEditingCommandFinish] to get the result of the operation.
  
      Params:
        command = the command to check
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void canExecuteEditingCommand(string command, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _command = command.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_can_execute_editing_command(cast(WebKitWebView*)this._cPtr, _command, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.canExecuteEditingCommand].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the editing command can be executed or false otherwise
      Throws: [ErrorWrap]
  */
  bool canExecuteEditingCommandFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_web_view_can_execute_editing_command_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Determines whether web_view has a previous history item.
      Returns: true if able to move back or false otherwise.
  */
  bool canGoBack()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_can_go_back(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether web_view has a next history item.
      Returns: true if able to move forward or false otherwise.
  */
  bool canGoForward()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_can_go_forward(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Whether or not a MIME type can be displayed in web_view.
  
      Params:
        mimeType = a MIME type
      Returns: true if the MIME type mime_type can be displayed or false otherwise
  */
  bool canShowMimeType(string mimeType)
  {
    bool _retval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    _retval = cast(bool)webkit_web_view_can_show_mime_type(cast(WebKitWebView*)this._cPtr, _mimeType);
    return _retval;
  }

  /**
      Requests downloading of the specified URI string for web_view.
  
      Params:
        uri = the URI to download
      Returns: a new #WebKitDownload representing
           the download operation.
  */
  webkit.download.Download downloadUri(string uri)
  {
    WebKitDownload* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = webkit_web_view_download_uri(cast(WebKitWebView*)this._cPtr, _uri);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.download.Download)(cast(WebKitDownload*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously evaluate script in the script world with name world_name of the main frame current context in web_view.
      If world_name is null, the default world is used. Any value that is not null is a distinct world.
      The source_uri will be shown in exceptions and doesn't affect the behavior of the script.
      When not provided, the document URL is used.
      
      Note that if #WebKitSettings:enable-javascript is false, this method will do nothing.
      If you want to use this method but still prevent web content from executing its own
      JavaScript, then use #WebKitSettings:enable-javascript-markup.
      
      When the operation is finished, callback will be called. You can then call
      [webkit.web_view.WebView.evaluateJavascriptFinish] to get the result of the operation.
      
      This is an example of using [webkit.web_view.WebView.evaluateJavascript] with a script returning
      a string:
      
      ```c
      static void
      web_view_javascript_finished (GObject      *object,
                                    GAsyncResult *result,
                                    gpointer      user_data)
      {
          JSCValue               *value;
          GError                 *error = NULL;
      
          value = webkit_web_view_evaluate_javascript_finish (WEBKIT_WEB_VIEW (object), result, &error);
          if (!value) {
              g_warning ("Error running javascript: %s", error->message);
              g_error_free (error);
              return;
          }
      
          if (jsc_value_is_string (value)) {
              gchar        *str_value = jsc_value_to_string (value);
              JSCException *exception = jsc_context_get_exception (jsc_value_get_context (value));
              if (exception)
                  g_warning ("Error running javascript: %s", jsc_exception_get_message (exception));
              else
                  g_print ("Script result: %s\n", str_value);
              g_free (str_value);
          } else {
              g_warning ("Error running javascript: unexpected return value");
          }
          g_object_unref (value);
      }
      
      static void
      web_view_get_link_url (WebKitWebView *web_view,
                             const gchar   *link_id)
      {
          gchar *script = g_strdup_printf ("window.document.getElementById('%s').href;", link_id);
          webkit_web_view_evaluate_javascript (web_view, script, -1, NULL, NULL, NULL, web_view_javascript_finished, NULL);
          g_free (script);
      }
      ```
  
      Params:
        script = the script to evaluate
        worldName = the name of a #WebKitScriptWorld or null to use the default
        sourceUri = the source URI
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the script finished
  */
  void evaluateJavascript(string script, string worldName = null, string sourceUri = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    ptrdiff_t _length;
    if (script)
      _length = cast(ptrdiff_t)script.length;

    auto _script = cast(const(char)*)script.ptr;
    const(char)* _worldName = worldName.toCString(No.Alloc);
    const(char)* _sourceUri = sourceUri.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_evaluate_javascript(cast(WebKitWebView*)this._cPtr, _script, _length, _worldName, _sourceUri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.evaluateJavascript].
  
      Params:
        result = a #GAsyncResult
      Returns: a #JSCValue with the result of the last executed statement in script
           or null in case of error
      Throws: [ErrorWrap]
  */
  javascriptcore.value.Value evaluateJavascriptFinish(gio.async_result.AsyncResult result)
  {
    JSCValue* _cretval;
    GError *_err;
    _cretval = webkit_web_view_evaluate_javascript_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.value.Value)(cast(JSCValue*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Request to execute the given command for web_view.
      
      You can use [webkit.web_view.WebView.canExecuteEditingCommand] to check whether
      it's possible to execute the command.
  
      Params:
        command = the command to execute
  */
  void executeEditingCommand(string command)
  {
    const(char)* _command = command.toCString(No.Alloc);
    webkit_web_view_execute_editing_command(cast(WebKitWebView*)this._cPtr, _command);
  }

  /**
      Request to execute the given command with argument for web_view.
      
      You can use
      [webkit.web_view.WebView.canExecuteEditingCommand] to check whether
      it's possible to execute the command.
  
      Params:
        command = the command to execute
        argument = the command argument
  */
  void executeEditingCommandWithArgument(string command, string argument)
  {
    const(char)* _command = command.toCString(No.Alloc);
    const(char)* _argument = argument.toCString(No.Alloc);
    webkit_web_view_execute_editing_command_with_argument(cast(WebKitWebView*)this._cPtr, _command, _argument);
  }

  /**
      Get the presentation type of #WebKitWebView when created for automation.
      Returns: a #WebKitAutomationBrowsingContextPresentation.
  */
  webkit.types.AutomationBrowsingContextPresentation getAutomationPresentationType()
  {
    WebKitAutomationBrowsingContextPresentation _cretval;
    _cretval = webkit_web_view_get_automation_presentation_type(cast(WebKitWebView*)this._cPtr);
    webkit.types.AutomationBrowsingContextPresentation _retval = cast(webkit.types.AutomationBrowsingContextPresentation)_cretval;
    return _retval;
  }

  /**
      Obtains the #WebKitBackForwardList associated with the given #WebKitWebView.
      
      The #WebKitBackForwardList is owned by the #WebKitWebView.
      Returns: the #WebKitBackForwardList
  */
  webkit.back_forward_list.BackForwardList getBackForwardList()
  {
    WebKitBackForwardList* _cretval;
    _cretval = webkit_web_view_get_back_forward_list(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.back_forward_list.BackForwardList)(cast(WebKitBackForwardList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the color that is used to draw the web_view background.
      
      Gets the color that is used to draw the web_view background before
      the actual contents are rendered.
      For more information see also [webkit.web_view.WebView.setBackgroundColor]
  
      Params:
        rgba = a #GdkRGBA to fill in with the background color
  */
  void getBackgroundColor(out gdk.rgba.RGBA rgba)
  {
    webkit_web_view_get_background_color(cast(WebKitWebView*)this._cPtr, cast(GdkRGBA*)&rgba);
  }

  /**
      Get the camera capture state of a #WebKitWebView.
      Returns: The #WebKitMediaCaptureState of the camera device. If #WebKitSettings:enable-mediastream
        is false, this method will return [webkit.types.MediaCaptureState.None].
  */
  webkit.types.MediaCaptureState getCameraCaptureState()
  {
    WebKitMediaCaptureState _cretval;
    _cretval = webkit_web_view_get_camera_capture_state(cast(WebKitWebView*)this._cPtr);
    webkit.types.MediaCaptureState _retval = cast(webkit.types.MediaCaptureState)_cretval;
    return _retval;
  }

  /**
      Gets the web context of web_view.
      Returns: the #WebKitWebContext of the view
  */
  webkit.web_context.WebContext getContext()
  {
    WebKitWebContext* _cretval;
    _cretval = webkit_web_view_get_context(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_context.WebContext)(cast(WebKitWebContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current custom character encoding name of web_view.
      Returns: the current custom character encoding name or null if no
           custom character encoding has been set.
  */
  string getCustomCharset()
  {
    const(char)* _cretval;
    _cretval = webkit_web_view_get_custom_charset(cast(WebKitWebView*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the configured default Content-Security-Policy.
      Returns: The default policy or null
  */
  string getDefaultContentSecurityPolicy()
  {
    const(char)* _cretval;
    _cretval = webkit_web_view_get_default_content_security_policy(cast(WebKitWebView*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the display capture state of a #WebKitWebView.
      Returns: The #WebKitMediaCaptureState of the display device. If #WebKitSettings:enable-mediastream
        is false, this method will return [webkit.types.MediaCaptureState.None].
  */
  webkit.types.MediaCaptureState getDisplayCaptureState()
  {
    WebKitMediaCaptureState _cretval;
    _cretval = webkit_web_view_get_display_capture_state(cast(WebKitWebView*)this._cPtr);
    webkit.types.MediaCaptureState _retval = cast(webkit.types.MediaCaptureState)_cretval;
    return _retval;
  }

  /**
      Gets the web editor state of web_view.
      Returns: the #WebKitEditorState of the view
  */
  webkit.editor_state.EditorState getEditorState()
  {
    WebKitEditorState* _cretval;
    _cretval = webkit_web_view_get_editor_state(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.editor_state.EditorState)(cast(WebKitEditorState*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the #WebKitWebView:estimated-load-progress property.
      
      You can monitor the estimated progress of a load operation by
      connecting to the notify::estimated-load-progress signal of web_view.
      Returns: an estimate of the of the percent complete for a document
            load as a range from 0.0 to 1.0.
  */
  double getEstimatedLoadProgress()
  {
    double _retval;
    _retval = webkit_web_view_get_estimated_load_progress(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Returns favicon currently associated to web_view.
      
      Returns favicon currently associated to web_view, if any. You can
      connect to notify::favicon signal of web_view to be notified when
      the favicon is available.
      Returns: the favicon image or null if there's no
           icon associated with web_view.
  */
  gdk.texture.Texture getFavicon()
  {
    GdkTexture* _cretval;
    _cretval = webkit_web_view_get_favicon(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #WebKitFindController.
      
      Gets the #WebKitFindController that will allow the caller to query
      the #WebKitWebView for the text to look for.
      Returns: the #WebKitFindController associated to
        this particular #WebKitWebView.
  */
  webkit.find_controller.FindController getFindController()
  {
    WebKitFindController* _cretval;
    _cretval = webkit_web_view_get_find_controller(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.find_controller.FindController)(cast(WebKitFindController*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitInputMethodContext currently in use by web_view.
      
      Get the #WebKitInputMethodContext currently in use by web_view, or null if no input method is being used.
      Returns: a #WebKitInputMethodContext, or null
  */
  webkit.input_method_context.InputMethodContext getInputMethodContext()
  {
    WebKitInputMethodContext* _cretval;
    _cretval = webkit_web_view_get_input_method_context(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.input_method_context.InputMethodContext)(cast(WebKitInputMethodContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitWebInspector associated to web_view
      Returns: the #WebKitWebInspector of web_view
  */
  webkit.web_inspector.WebInspector getInspector()
  {
    WebKitWebInspector* _cretval;
    _cretval = webkit_web_view_get_inspector(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_inspector.WebInspector)(cast(WebKitWebInspector*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the mute state of web_view.
      Returns: true if web_view audio is muted or false is audio is not muted.
  */
  bool getIsMuted()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_get_is_muted(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Get whether the current web process of a #WebKitWebView is responsive.
      Returns: true if the web process attached to web_view is responsive, or false otherwise.
  */
  bool getIsWebProcessResponsive()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_get_is_web_process_responsive(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Return the main resource of web_view.
      Returns: the main #WebKitWebResource of the view
           or null if nothing has been loaded.
  */
  webkit.web_resource.WebResource getMainResource()
  {
    WebKitWebResource* _cretval;
    _cretval = webkit_web_view_get_main_resource(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_resource.WebResource)(cast(WebKitWebResource*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the microphone capture state of a #WebKitWebView.
      Returns: The #WebKitMediaCaptureState of the microphone device. If #WebKitSettings:enable-mediastream
        is false, this method will return [webkit.types.MediaCaptureState.None].
  */
  webkit.types.MediaCaptureState getMicrophoneCaptureState()
  {
    WebKitMediaCaptureState _cretval;
    _cretval = webkit_web_view_get_microphone_capture_state(cast(WebKitWebView*)this._cPtr);
    webkit.types.MediaCaptureState _retval = cast(webkit.types.MediaCaptureState)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitNetworkSession associated to web_view.
      Returns: a #WebKitNetworkSession
  */
  webkit.network_session.NetworkSession getNetworkSession()
  {
    WebKitNetworkSession* _cretval;
    _cretval = webkit_web_view_get_network_session(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.network_session.NetworkSession)(cast(WebKitNetworkSession*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the identifier of the #WebKitWebPage corresponding to
      the #WebKitWebView
      Returns: the page ID of web_view.
  */
  ulong getPageId()
  {
    ulong _retval;
    _retval = webkit_web_view_get_page_id(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current session state of web_view
      Returns: a #WebKitWebViewSessionState
  */
  webkit.web_view_session_state.WebViewSessionState getSessionState()
  {
    WebKitWebViewSessionState* _cretval;
    _cretval = webkit_web_view_get_session_state(cast(WebKitWebView*)this._cPtr);
    auto _retval = _cretval ? new webkit.web_view_session_state.WebViewSessionState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  alias getSettings = gtk.widget.Widget.getSettings;

  /**
      Gets the #WebKitSettings currently applied to web_view.
      
      If no other #WebKitSettings have been explicitly applied to
      web_view with [webkit.web_view.WebView.setSettings], the default
      #WebKitSettings will be returned. This method always returns
      a valid #WebKitSettings object.
      To modify any of the web_view settings, you can either create
      a new #WebKitSettings object with [webkit.settings.Settings.new_], setting
      the desired preferences, and then replace the existing web_view
      settings with [webkit.web_view.WebView.setSettings] or get the existing
      web_view settings and update it directly. #WebKitSettings objects
      can be shared by multiple #WebKitWebView<!-- -->s, so modifying
      the settings of a #WebKitWebView would affect other
      #WebKitWebView<!-- -->s using the same #WebKitSettings.
      Returns: the #WebKitSettings attached to web_view
  */
  webkit.settings.Settings getSettings()
  {
    WebKitSettings* _cretval;
    _cretval = webkit_web_view_get_settings(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.settings.Settings)(cast(WebKitSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Asynchronously retrieves a snapshot of web_view for region.
      
      options specifies how the snapshot should be rendered.
      
      When the operation is finished, callback will be called. You must
      call [webkit.web_view.WebView.getSnapshotFinish] to get the result of the
      operation.
  
      Params:
        region = the #WebKitSnapshotRegion for this snapshot
        options = #WebKitSnapshotOptions for the snapshot
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback
  */
  void getSnapshot(webkit.types.SnapshotRegion region, webkit.types.SnapshotOptions options, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_get_snapshot(cast(WebKitWebView*)this._cPtr, region, options, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous operation started with [webkit.web_view.WebView.getSnapshot].
  
      Params:
        result = a #GAsyncResult
      Returns: an image with the retrieved snapshot, or null in case of error.
      Throws: [ErrorWrap]
  */
  gdk.texture.Texture getSnapshotFinish(gio.async_result.AsyncResult result)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = webkit_web_view_get_snapshot_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the #WebKitWebView:title property.
      
      You can connect to notify::title signal of web_view to
      be notified when the title has been received.
      Returns: The main frame document title of web_view.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = webkit_web_view_get_title(cast(WebKitWebView*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the #GTlsCertificate associated with the main resource of web_view.
      
      Retrieves the #GTlsCertificate associated with the main resource of web_view,
      and the #GTlsCertificateFlags showing what problems, if any, have been found
      with that certificate.
      If the connection is not HTTPS, this function returns false.
      This function should be called after a response has been received from the
      server, so you can connect to #WebKitWebView::load-changed and call this function
      when it's emitted with [webkit.types.LoadEvent.Committed] event.
      
      Note that this function provides no information about the security of the web
      page if the current #WebKitTLSErrorsPolicy is [webkit.types.TLSErrorsPolicy.Ignore],
      as subresources of the page may be controlled by an attacker. This function
      may safely be used to determine the security status of the current page only
      if the current #WebKitTLSErrorsPolicy is [webkit.types.TLSErrorsPolicy.Fail], in
      which case subresources that fail certificate verification will be blocked.
  
      Params:
        certificate = return location for a #GTlsCertificate
        errors = return location for a #GTlsCertificateFlags the verification status of certificate
      Returns: true if the web_view connection uses HTTPS and a response has been received
           from the server, or false otherwise.
  */
  bool getTlsInfo(out gio.tls_certificate.TlsCertificate certificate, out gio.types.TlsCertificateFlags errors)
  {
    bool _retval;
    GTlsCertificate* _certificate;
    _retval = cast(bool)webkit_web_view_get_tls_info(cast(WebKitWebView*)this._cPtr, &_certificate, &errors);
    certificate = new gio.tls_certificate.TlsCertificate(cast(void*)_certificate, No.Take);
    return _retval;
  }

  /**
      Returns the current active URI of web_view.
      
      The active URI might change during
      a load operation:
      
      <orderedlist>
      <listitem><para>
        When nothing has been loaded yet on web_view the active URI is null.
      </para></listitem>
      <listitem><para>
        When a new load operation starts the active URI is the requested URI:
        <itemizedlist>
        <listitem><para>
          If the load operation was started by [webkit.web_view.WebView.loadUri],
          the requested URI is the given one.
        </para></listitem>
        <listitem><para>
          If the load operation was started by [webkit.web_view.WebView.loadHtml],
          the requested URI is "about:blank".
        </para></listitem>
        <listitem><para>
          If the load operation was started by [webkit.web_view.WebView.loadAlternateHtml],
          the requested URI is content URI provided.
        </para></listitem>
        <listitem><para>
          If the load operation was started by [webkit.web_view.WebView.goBack] or
          [webkit.web_view.WebView.goForward], the requested URI is the original URI
          of the previous/next item in the #WebKitBackForwardList of web_view.
        </para></listitem>
        <listitem><para>
          If the load operation was started by
          [webkit.web_view.WebView.goToBackForwardListItem], the requested URI
          is the opriginal URI of the given #WebKitBackForwardListItem.
        </para></listitem>
        </itemizedlist>
      </para></listitem>
      <listitem><para>
        If there is a server redirection during the load operation,
        the active URI is the redirected URI. When the signal
        #WebKitWebView::load-changed is emitted with [webkit.types.LoadEvent.Redirected]
        event, the active URI is already updated to the redirected URI.
      </para></listitem>
      <listitem><para>
        When the signal #WebKitWebView::load-changed is emitted
        with [webkit.types.LoadEvent.Committed] event, the active URI is the final
        one and it will not change unless a new load operation is started
        or a navigation action within the same page is performed.
      </para></listitem>
      </orderedlist>
      
      You can monitor the active URI by connecting to the notify::uri
      signal of web_view.
      Returns: the current active URI of web_view or null
           if nothing has been loaded yet.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_view_get_uri(cast(WebKitWebView*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the user content manager associated to web_view.
      Returns: the #WebKitUserContentManager associated with the view
  */
  webkit.user_content_manager.UserContentManager getUserContentManager()
  {
    WebKitUserContentManager* _cretval;
    _cretval = webkit_web_view_get_user_content_manager(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.user_content_manager.UserContentManager)(cast(WebKitUserContentManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the view's #WebKitWebExtensionMode.
      Returns: the #WebKitWebExtensionMode
  */
  webkit.types.WebExtensionMode getWebExtensionMode()
  {
    WebKitWebExtensionMode _cretval;
    _cretval = webkit_web_view_get_web_extension_mode(cast(WebKitWebView*)this._cPtr);
    webkit.types.WebExtensionMode _retval = cast(webkit.types.WebExtensionMode)_cretval;
    return _retval;
  }

  /**
      Gets the default website policies.
      
      Gets the default website policies set on construction in the
      web_view. These can be overridden on a per-origin basis via the
      #WebKitWebView::decide-policy signal handler.
      
      See also [webkit.policy_decision.PolicyDecision.useWithPolicies].
      Returns: the default #WebKitWebsitePolicies
            associated with the view.
  */
  webkit.website_policies.WebsitePolicies getWebsitePolicies()
  {
    WebKitWebsitePolicies* _cretval;
    _cretval = webkit_web_view_get_website_policies(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.website_policies.WebsitePolicies)(cast(WebKitWebsitePolicies*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the #WebKitWindowProperties object.
      
      Get the #WebKitWindowProperties object containing the properties
      that the window containing web_view should have.
      Returns: the #WebKitWindowProperties of web_view
  */
  webkit.window_properties.WindowProperties getWindowProperties()
  {
    WebKitWindowProperties* _cretval;
    _cretval = webkit_web_view_get_window_properties(cast(WebKitWebView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.window_properties.WindowProperties)(cast(WebKitWindowProperties*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the zoom level of web_view.
      
      Get the zoom level of web_view, i.e. the factor by which the
      view contents are scaled with respect to their original size.
      Returns: the current zoom level of web_view
  */
  double getZoomLevel()
  {
    double _retval;
    _retval = webkit_web_view_get_zoom_level(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Loads the previous history item.
      
      You can monitor the load operation by connecting to
      #WebKitWebView::load-changed signal.
  */
  void goBack()
  {
    webkit_web_view_go_back(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Loads the next history item.
      
      You can monitor the load operation by connecting to
      #WebKitWebView::load-changed signal.
  */
  void goForward()
  {
    webkit_web_view_go_forward(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Loads the specific history item list_item.
      
      You can monitor the load operation by connecting to
      #WebKitWebView::load-changed signal.
  
      Params:
        listItem = a #WebKitBackForwardListItem
  */
  void goToBackForwardListItem(webkit.back_forward_list_item.BackForwardListItem listItem)
  {
    webkit_web_view_go_to_back_forward_list_item(cast(WebKitWebView*)this._cPtr, listItem ? cast(WebKitBackForwardListItem*)listItem._cPtr(No.Dup) : null);
  }

  /**
      Get whether a #WebKitWebView was created with #WebKitWebView:is-controlled-by-automation
      property enabled.
      
      Only #WebKitWebView<!-- -->s controlled by automation can be used in an
      automation session.
      Returns: true if web_view is controlled by automation, or false otherwise.
  */
  bool isControlledByAutomation()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_is_controlled_by_automation(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the user is allowed to edit the HTML document.
      
      When web_view is not editable an element in the HTML document can only be edited if the
      CONTENTEDITABLE attribute has been set on the element or one of its parent
      elements. By default a #WebKitWebView is not editable.
      Returns: true if the user is allowed to edit the HTML document, or false otherwise.
  */
  bool isEditable()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_is_editable(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitWebView:is-loading property.
      
      You can monitor when a #WebKitWebView is loading a page by connecting to
      notify::is-loading signal of web_view. This is useful when you are
      interesting in knowing when the view is loading something but not in the
      details about the status of the load operation, for example to start a spinner
      when the view is loading a page and stop it when it finishes.
      Returns: true if web_view is loading a page or false otherwise.
  */
  bool isLoading()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_is_loading(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #WebKitWebView:is-playing-audio property.
      
      You can monitor when a page in a #WebKitWebView is playing audio by
      connecting to the notify::is-playing-audio signal of web_view. This
      is useful when the application wants to provide visual feedback when a
      page is producing sound.
      Returns: true if a page in web_view is playing audio or false otherwise.
  */
  bool isPlayingAudio()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_view_is_playing_audio(cast(WebKitWebView*)this._cPtr);
    return _retval;
  }

  /**
      Load the given content string for the URI content_uri.
      
      This allows clients to display page-loading errors in the #WebKitWebView itself.
      When this method is called from #WebKitWebView::load-failed signal to show an
      error page, then the back-forward list is maintained appropriately.
      For everything else this method works the same way as [webkit.web_view.WebView.loadHtml].
  
      Params:
        content = the new content to display as the main page of the web_view
        contentUri = the URI for the alternate page content
        baseUri = the base URI for relative locations or null
  */
  void loadAlternateHtml(string content, string contentUri, string baseUri = null)
  {
    const(char)* _content = content.toCString(No.Alloc);
    const(char)* _contentUri = contentUri.toCString(No.Alloc);
    const(char)* _baseUri = baseUri.toCString(No.Alloc);
    webkit_web_view_load_alternate_html(cast(WebKitWebView*)this._cPtr, _content, _contentUri, _baseUri);
  }

  /**
      Load the specified bytes into web_view using the given mime_type and encoding.
      
      When mime_type is null, it defaults to "text/html".
      When encoding is null, it defaults to "UTF-8".
      When base_uri is null, it defaults to "about:blank".
      You can monitor the load operation by connecting to #WebKitWebView::load-changed signal.
  
      Params:
        bytes = input data to load
        mimeType = the MIME type of bytes, or null
        encoding = the character encoding of bytes, or null
        baseUri = the base URI for relative locations or null
  */
  void loadBytes(glib.bytes.Bytes bytes, string mimeType = null, string encoding = null, string baseUri = null)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    const(char)* _encoding = encoding.toCString(No.Alloc);
    const(char)* _baseUri = baseUri.toCString(No.Alloc);
    webkit_web_view_load_bytes(cast(WebKitWebView*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, _mimeType, _encoding, _baseUri);
  }

  /**
      Load the given content string with the specified base_uri.
      
      If base_uri is not null, relative URLs in the content will be
      resolved against base_uri and absolute local paths must be children of the base_uri.
      For security reasons absolute local paths that are not children of base_uri
      will cause the web process to terminate.
      If you need to include URLs in content that are local paths in a different
      directory than base_uri you can build a data URI for them. When base_uri is null,
      it defaults to "about:blank". The mime type of the document will be "text/html".
      You can monitor the load operation by connecting to #WebKitWebView::load-changed signal.
  
      Params:
        content = The HTML string to load
        baseUri = The base URI for relative locations or null
  */
  void loadHtml(string content, string baseUri = null)
  {
    const(char)* _content = content.toCString(No.Alloc);
    const(char)* _baseUri = baseUri.toCString(No.Alloc);
    webkit_web_view_load_html(cast(WebKitWebView*)this._cPtr, _content, _baseUri);
  }

  /**
      Load the specified plain_text string into web_view.
      
      The mime type of document will be "text/plain". You can monitor the load
      operation by connecting to #WebKitWebView::load-changed signal.
  
      Params:
        plainText = The plain text to load
  */
  void loadPlainText(string plainText)
  {
    const(char)* _plainText = plainText.toCString(No.Alloc);
    webkit_web_view_load_plain_text(cast(WebKitWebView*)this._cPtr, _plainText);
  }

  /**
      Requests loading of the specified #WebKitURIRequest.
      
      You can monitor the load operation by connecting to
      #WebKitWebView::load-changed signal.
  
      Params:
        request = a #WebKitURIRequest to load
  */
  void loadRequest(webkit.urirequest.URIRequest request)
  {
    webkit_web_view_load_request(cast(WebKitWebView*)this._cPtr, request ? cast(WebKitURIRequest*)request._cPtr(No.Dup) : null);
  }

  /**
      Requests loading of the specified URI string.
      
      You can monitor the load operation by connecting to
      #WebKitWebView::load-changed signal.
  
      Params:
        uri = an URI string
  */
  void loadUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    webkit_web_view_load_uri(cast(WebKitWebView*)this._cPtr, _uri);
  }

  /**
      Reloads the current contents of web_view.
      
      See also [webkit.web_view.WebView.reloadBypassCache].
  */
  void reload()
  {
    webkit_web_view_reload(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Reloads the current contents of web_view without
      using any cached data.
  */
  void reloadBypassCache()
  {
    webkit_web_view_reload_bypass_cache(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Restore the web_view session state from state
  
      Params:
        state = a #WebKitWebViewSessionState
  */
  void restoreSessionState(webkit.web_view_session_state.WebViewSessionState state)
  {
    webkit_web_view_restore_session_state(cast(WebKitWebView*)this._cPtr, state ? cast(WebKitWebViewSessionState*)state._cPtr(No.Dup) : null);
  }

  /**
      Asynchronously save the current web page.
      
      Asynchronously save the current web page associated to the
      #WebKitWebView into a self-contained format using the mode
      specified in save_mode.
      
      When the operation is finished, callback will be called. You can
      then call [webkit.web_view.WebView.saveFinish] to get the result of the
      operation.
  
      Params:
        saveMode = the #WebKitSaveMode specifying how the web page should be saved.
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void save(webkit.types.SaveMode saveMode, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_save(cast(WebKitWebView*)this._cPtr, saveMode, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.save].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GInputStream with the result of saving
           the current web page or null in case of error.
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream saveFinish(gio.async_result.AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = webkit_web_view_save_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously save the current web page.
      
      Asynchronously save the current web page associated to the
      #WebKitWebView into a self-contained format using the mode
      specified in save_mode and writing it to file.
      
      When the operation is finished, callback will be called. You can
      then call [webkit.web_view.WebView.saveToFileFinish] to get the result of the
      operation.
  
      Params:
        file = the #GFile where the current web page should be saved to.
        saveMode = the #WebKitSaveMode specifying how the web page should be saved.
        cancellable = a #GCancellable or null to ignore
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void saveToFile(gio.file.File file, webkit.types.SaveMode saveMode, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_save_to_file(cast(WebKitWebView*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, saveMode, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.saveToFile].
  
      Params:
        result = a #GAsyncResult
      Returns: true if the web page was successfully saved to a file or false otherwise.
      Throws: [ErrorWrap]
  */
  bool saveToFileFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)webkit_web_view_save_to_file_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Send message to the #WebKitWebPage corresponding to web_view.
      
      If message is floating, it's consumed.
      If you don't expect any reply, or you simply want to ignore it, you can pass null as callback.
      When the operation is finished, callback will be called. You can then call
      [webkit.web_view.WebView.sendMessageToPageFinish] to get the message reply.
  
      Params:
        message = a #WebKitUserMessage
        cancellable = a #GCancellable or null to ignore
        callback = (nullable): A #GAsyncReadyCallback to call when the request is satisfied or null
  */
  void sendMessageToPage(webkit.user_message.UserMessage message, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    webkit_web_view_send_message_to_page(cast(WebKitWebView*)this._cPtr, message ? cast(WebKitUserMessage*)message._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous operation started with [webkit.web_view.WebView.sendMessageToPage].
  
      Params:
        result = a #GAsyncResult
      Returns: a #WebKitUserMessage with the reply or null in case of error.
      Throws: [ErrorWrap]
  */
  webkit.user_message.UserMessage sendMessageToPageFinish(gio.async_result.AsyncResult result)
  {
    WebKitUserMessage* _cretval;
    GError *_err;
    _cretval = webkit_web_view_send_message_to_page_finish(cast(WebKitWebView*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the color that will be used to draw the web_view background.
      
      Sets the color that will be used to draw the web_view background before
      the actual contents are rendered. Note that if the web page loaded in web_view
      specifies a background color, it will take precedence over the rgba color.
      By default the web_view background color is opaque white.
  
      Params:
        rgba = a #GdkRGBA
  */
  void setBackgroundColor(gdk.rgba.RGBA rgba)
  {
    webkit_web_view_set_background_color(cast(WebKitWebView*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }

  /**
      Set the camera capture state of a #WebKitWebView.
      
      If #WebKitSettings:enable-mediastream is false, this method will have no visible effect. Once the
      state of the device has been set to [webkit.types.MediaCaptureState.None] it cannot be changed
      anymore. The page can however request capture again using the mediaDevices API.
  
      Params:
        state = a #WebKitMediaCaptureState
  */
  void setCameraCaptureState(webkit.types.MediaCaptureState state)
  {
    webkit_web_view_set_camera_capture_state(cast(WebKitWebView*)this._cPtr, state);
  }

  /**
      Sets the allowlist for CORS.
      
      Sets the allowlist for which
      [Cross-Origin Resource Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
      checks are disabled in web_view. URI patterns must be of the form
      `[protocol]://[host]/[path]`, each component may contain the wildcard
      character (`*`) to represent zero or more other characters. All three
      components are required and must not be omitted from the URI
      patterns.
      
      Disabling CORS checks permits resources from other origins to load
      allowlisted resources. It does not permit the allowlisted resources
      to load resources from other origins.
      
      If this function is called multiple times, only the allowlist set by
      the most recent call will be effective.
  
      Params:
        allowlist = an allowlist of URI patterns, or null
  */
  void setCorsAllowlist(string[] allowlist = null)
  {
    const(char)*[] _tmpallowlist;
    foreach (s; allowlist)
      _tmpallowlist ~= s.toCString(No.Alloc);
    _tmpallowlist ~= null;
    const(char*)* _allowlist = _tmpallowlist.ptr;

    webkit_web_view_set_cors_allowlist(cast(WebKitWebView*)this._cPtr, _allowlist);
  }

  /**
      Sets the current custom character encoding override of web_view.
      
      The custom character encoding will override any text encoding detected via HTTP headers or
      META tags. Calling this method will stop any current load operation and reload the
      current page. Setting the custom character encoding to null removes the character
      encoding override.
  
      Params:
        charset = a character encoding name or null
  */
  void setCustomCharset(string charset = null)
  {
    const(char)* _charset = charset.toCString(No.Alloc);
    webkit_web_view_set_custom_charset(cast(WebKitWebView*)this._cPtr, _charset);
  }

  /**
      Set the display capture state of a #WebKitWebView.
      
      If #WebKitSettings:enable-mediastream is false, this method will have no visible effect. Once the
      state of the device has been set to [webkit.types.MediaCaptureState.None] it cannot be changed
      anymore. The page can however request capture again using the mediaDevices API.
  
      Params:
        state = a #WebKitMediaCaptureState
  */
  void setDisplayCaptureState(webkit.types.MediaCaptureState state)
  {
    webkit_web_view_set_display_capture_state(cast(WebKitWebView*)this._cPtr, state);
  }

  /**
      Sets whether the user is allowed to edit the HTML document.
      
      If editable is true, web_view allows the user to edit the HTML document. If
      editable is false, an element in web_view's document can only be edited if the
      CONTENTEDITABLE attribute has been set on the element or one of its parent
      elements. By default a #WebKitWebView is not editable.
      
      Normally, a HTML document is not editable unless the elements within the
      document are editable. This function provides a way to make the contents
      of a #WebKitWebView editable without altering the document or DOM structure.
  
      Params:
        editable = a #gboolean indicating the editable state
  */
  void setEditable(bool editable)
  {
    webkit_web_view_set_editable(cast(WebKitWebView*)this._cPtr, editable);
  }

  /**
      Set the #WebKitInputMethodContext to be used by web_view.
      
      Set the #WebKitInputMethodContext to be used by web_view, or null to not use any input method.
      Note that the same #WebKitInputMethodContext can't be set on more than one #WebKitWebView at the same time.
  
      Params:
        context = the #WebKitInputMethodContext to set, or null
  */
  void setInputMethodContext(webkit.input_method_context.InputMethodContext context = null)
  {
    webkit_web_view_set_input_method_context(cast(WebKitWebView*)this._cPtr, context ? cast(WebKitInputMethodContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Sets the mute state of web_view.
  
      Params:
        muted = mute flag
  */
  void setIsMuted(bool muted)
  {
    webkit_web_view_set_is_muted(cast(WebKitWebView*)this._cPtr, muted);
  }

  /**
      Set the microphone capture state of a #WebKitWebView.
      
      If #WebKitSettings:enable-mediastream is false, this method will have no visible effect. Once the
      state of the device has been set to [webkit.types.MediaCaptureState.None] it cannot be changed
      anymore. The page can however request capture again using the mediaDevices API.
  
      Params:
        state = a #WebKitMediaCaptureState
  */
  void setMicrophoneCaptureState(webkit.types.MediaCaptureState state)
  {
    webkit_web_view_set_microphone_capture_state(cast(WebKitWebView*)this._cPtr, state);
  }

  /**
      Sets the #WebKitSettings to be applied to web_view.
      
      The
      existing #WebKitSettings of web_view will be replaced by
      settings. New settings are applied immediately on web_view.
      The same #WebKitSettings object can be shared
      by multiple #WebKitWebView<!-- -->s.
  
      Params:
        settings = a #WebKitSettings
  */
  void setSettings(webkit.settings.Settings settings)
  {
    webkit_web_view_set_settings(cast(WebKitWebView*)this._cPtr, settings ? cast(WebKitSettings*)settings._cPtr(No.Dup) : null);
  }

  /**
      Set the zoom level of web_view.
      
      Set the zoom level of web_view, i.e. the factor by which the
      view contents are scaled with respect to their original size.
  
      Params:
        zoomLevel = the zoom level
  */
  void setZoomLevel(double zoomLevel)
  {
    webkit_web_view_set_zoom_level(cast(WebKitWebView*)this._cPtr, zoomLevel);
  }

  /**
      Stops any ongoing loading operation in web_view.
      
      This method does nothing if no content is being loaded.
      If there is a loading operation in progress, it will be cancelled and
      #WebKitWebView::load-failed signal will be emitted with
      [webkit.types.NetworkError.Cancelled] error.
  */
  void stopLoading()
  {
    webkit_web_view_stop_loading(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Terminates the web process associated to web_view.
      
      When the web process gets terminated
      using this method, the #WebKitWebView::web-process-terminated signal is emitted with
      [webkit.types.WebProcessTerminationReason.TerminatedByApi] as the reason for termination.
  */
  void terminateWebProcess()
  {
    webkit_web_view_terminate_web_process(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Tries to close the web_view.
      
      This will fire the onbeforeunload event
      to ask the user for confirmation to close the page. If there isn't an
      onbeforeunload event handler or the user confirms to close the page,
      the #WebKitWebView::close signal is emitted, otherwise nothing happens.
  */
  void tryClose()
  {
    webkit_web_view_try_close(cast(WebKitWebView*)this._cPtr);
  }

  /**
      Connect to `Authenticate` signal.
  
      This signal is emitted when the user is challenged with HTTP
        authentication. To let the  application access or supply
        the credentials as well as to allow the client application
        to either cancel the request or perform the authentication,
        the signal will pass an instance of the
        #WebKitAuthenticationRequest in the request argument.
        To handle this signal asynchronously you should keep a ref
        of the request and return true. To disable HTTP authentication
        entirely, connect to this signal and simply return true.
        
        The default signal handler will run a default authentication
        dialog asynchronously for the user to interact with.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.authentication_request.AuthenticationRequest request, webkit.web_view.WebView webView))
  
          `request` a #WebKitAuthenticationRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAuthenticate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.authentication_request.AuthenticationRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("authenticate", closure, after);
  }

  /**
      Connect to `Close` signal.
  
      Emitted when closing a #WebKitWebView is requested. This occurs when a
        call is made from JavaScript's <function>window.close</function> function or
        after trying to close the web_view with [webkit.web_view.WebView.tryClose].
        It is the owner's responsibility to handle this signal to hide or
        destroy the #WebKitWebView, if necessary.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
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
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `ContextMenu` signal.
  
      Emitted when a context menu is about to be displayed to give the application
        a chance to customize the proposed menu, prevent the menu from being displayed,
        or build its own context menu.
        <itemizedlist>
        <listitem><para>
         To customize the proposed menu you can use [webkitwebprocessextension.context_menu.ContextMenu.prepend],
         [webkitwebprocessextension.context_menu.ContextMenu.append] or [webkitwebprocessextension.context_menu.ContextMenu.insert] to add new
         #WebKitContextMenuItem<!-- -->s to context_menu, [webkitwebprocessextension.context_menu.ContextMenu.moveItem]
         to reorder existing items, or [webkitwebprocessextension.context_menu.ContextMenu.remove] to remove an
         existing item. The signal handler should return false, and the menu represented
         by context_menu will be shown.
        </para></listitem>
        <listitem><para>
         To prevent the menu from being displayed you can just connect to this signal
         and return true so that the proposed menu will not be shown.
        </para></listitem>
        <listitem><para>
         To build your own menu, you can remove all items from the proposed menu with
         [webkitwebprocessextension.context_menu.ContextMenu.removeAll], add your own items and return false so
         that the menu will be shown. You can also ignore the proposed #WebKitContextMenu,
         build your own #GtkMenu and return true to prevent the proposed menu from being shown.
        </para></listitem>
        <listitem><para>
         If you just want the default menu to be shown always, simply don't connect to this
         signal because showing the proposed context menu is the default behaviour.
        </para></listitem>
        </itemizedlist>
        
        If the signal handler returns false the context menu represented by context_menu
        will be shown, if it return true the context menu will not be shown.
        
        The proposed #WebKitContextMenu passed in context_menu argument is only valid
        during the signal emission.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.context_menu.ContextMenu contextMenu, webkit.hit_test_result.HitTestResult hitTestResult, webkit.web_view.WebView webView))
  
          `contextMenu` the proposed #WebKitContextMenu (optional)
  
          `hitTestResult` a #WebKitHitTestResult (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectContextMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.context_menu.ContextMenu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.hit_test_result.HitTestResult)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_view.WebView)))
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
      Connect to `ContextMenuDismissed` signal.
  
      Emitted after #WebKitWebView::context-menu signal, if the context menu is shown,
        to notify that the context menu is dismissed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectContextMenuDismissed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
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
    return connectSignalClosure("context-menu-dismissed", closure, after);
  }

  /**
      Connect to `Create` signal.
  
      Emitted when the creation of a new #WebKitWebView is requested.
        If this signal is handled the signal handler should return the
        newly created #WebKitWebView.
        
        The #WebKitNavigationAction parameter contains information about the
        navigation action that triggered this signal.
        
        The new #WebKitWebView must be related to web_view, see
        #WebKitWebView:related-view for more details.
        
        The new #WebKitWebView should not be displayed to the user
        until the #WebKitWebView::ready-to-show signal is emitted.
        
        For creating views as response to automation tools requests, see the
        #WebKitAutomationSession::create-web-view signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gtk.widget.Widget callback(webkit.navigation_action.NavigationAction navigationAction, webkit.web_view.WebView webView))
  
          `navigationAction` a #WebKitNavigationAction (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` a newly allocated #WebKitWebView widget
               or null to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gtk.widget.Widget)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.navigation_action.NavigationAction)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
      setVal!(gtk.widget.Widget)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create", closure, after);
  }

  /**
      Connect to `DecidePolicy` signal.
  
      This signal is emitted when WebKit is requesting the client to decide a policy
        decision, such as whether to navigate to a page, open a new window or whether or
        not to download a resource. The #WebKitNavigationPolicyDecision passed in the
        decision argument is a generic type, but should be casted to a more
        specific type when making the decision. For example:
        
        ```c
        static gboolean
        decide_policy_cb (WebKitWebView *web_view,
                          WebKitPolicyDecision *decision,
                          WebKitPolicyDecisionType type)
        {
            switch (type) {
            case WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION: {
                WebKitNavigationPolicyDecision *navigation_decision = WEBKIT_NAVIGATION_POLICY_DECISION (decision);
                // Make a policy decision here
                break;
            }
            case WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION: {
                WebKitNavigationPolicyDecision *navigation_decision = WEBKIT_NAVIGATION_POLICY_DECISION (decision);
                // Make a policy decision here
                break;
            }
            case WEBKIT_POLICY_DECISION_TYPE_RESPONSE:
                WebKitResponsePolicyDecision *response = WEBKIT_RESPONSE_POLICY_DECISION (decision);
                // Make a policy decision here
                break;
            default:
                // Making no decision results in webkit_policy_decision_use()
                return FALSE;
            }
            return TRUE;
        }
        ```
        
        It is possible to make policy decision asynchronously, by simply calling [gobject.object.ObjectWrap.ref_]
        on the decision argument and returning true to block the default signal handler.
        If the last reference is removed on a #WebKitPolicyDecision and no decision has been
        made explicitly, [webkit.policy_decision.PolicyDecision.use] will be the default policy decision. The
        default signal handler will simply call [webkit.policy_decision.PolicyDecision.use]. Only the first
        policy decision chosen for a given #WebKitPolicyDecision will have any affect.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.policy_decision.PolicyDecision decision, webkit.types.PolicyDecisionType decisionType, webkit.web_view.WebView webView))
  
          `decision` the #WebKitPolicyDecision (optional)
  
          `decisionType` a #WebKitPolicyDecisionType denoting the type of decision (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDecidePolicy(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.policy_decision.PolicyDecision)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == webkit.types.PolicyDecisionType)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_view.WebView)))
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
    return connectSignalClosure("decide-policy", closure, after);
  }

  /**
      Connect to `EnterFullscreen` signal.
  
      Emitted when JavaScript code calls
        <function>element.webkitRequestFullScreen</function>. If the
        signal is not handled the #WebKitWebView will proceed to full screen
        its top level window. This signal can be used by client code to
        request permission to the user prior doing the full screen
        transition and eventually prepare the top-level window
        (e.g. hide some widgets that would otherwise be part of the
        full screen window).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to continue emission of the event.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnterFullscreen(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter-fullscreen", closure, after);
  }

  /**
      Connect to `InsecureContentDetected` signal.
  
      Prior to 2.46, this signal was emitted when insecure content was
        loaded in a secure content. Since 2.46, this signal is generally
        no longer emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.types.InsecureContentEvent event, webkit.web_view.WebView webView))
  
          `event` the #WebKitInsecureContentEvent (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInsecureContentDetected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.types.InsecureContentEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("insecure-content-detected", closure, after);
  }

  /**
      Connect to `LeaveFullscreen` signal.
  
      Emitted when the #WebKitWebView is about to restore its top level
        window out of its full screen state. This signal can be used by
        client code to restore widgets hidden during the
        #WebKitWebView::enter-fullscreen stage for instance.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to continue emission of the event.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeaveFullscreen(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave-fullscreen", closure, after);
  }

  /**
      Connect to `LoadChanged` signal.
  
      Emitted when a load operation in web_view changes.
        The signal is always emitted with [webkit.types.LoadEvent.Started] when a
        new load request is made and [webkit.types.LoadEvent.Finished] when the load
        finishes successfully or due to an error. When the ongoing load
        operation fails #WebKitWebView::load-failed signal is emitted
        before #WebKitWebView::load-changed is emitted with
        [webkit.types.LoadEvent.Finished].
        If a redirection is received from the server, this signal is emitted
        with [webkit.types.LoadEvent.Redirected] after the initial emission with
        [webkit.types.LoadEvent.Started] and before [webkit.types.LoadEvent.Committed].
        When the page content starts arriving the signal is emitted with
        [webkit.types.LoadEvent.Committed] event.
        
        You can handle this signal and use a switch to track any ongoing
        load operation.
        
        ```c
        static void web_view_load_changed (WebKitWebView  *web_view,
                                           WebKitLoadEvent load_event,
                                           gpointer        user_data)
        {
            switch (load_event) {
            case WEBKIT_LOAD_STARTED:
                // New load, we have now a provisional URI
                provisional_uri = webkit_web_view_get_uri (web_view);
                // Here we could start a spinner or update the
                // location bar with the provisional URI
                break;
            case WEBKIT_LOAD_REDIRECTED:
                redirected_uri = webkit_web_view_get_uri (web_view);
                break;
            case WEBKIT_LOAD_COMMITTED:
                // The load is being performed. Current URI is
                // the final one and it won't change unless a new
                // load is requested or a navigation within the
                // same page is performed
                uri = webkit_web_view_get_uri (web_view);
                break;
            case WEBKIT_LOAD_FINISHED:
                // Load finished, we can now stop the spinner
                break;
            }
        }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.types.LoadEvent loadEvent, webkit.web_view.WebView webView))
  
          `loadEvent` the #WebKitLoadEvent (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.types.LoadEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("load-changed", closure, after);
  }

  /**
      Connect to `LoadFailed` signal.
  
      Emitted when an error occurs during a load operation.
        If the error happened when starting to load data for a page
        load_event will be [webkit.types.LoadEvent.Started]. If it happened while
        loading a committed data source load_event will be [webkit.types.LoadEvent.Committed].
        Since a load error causes the load operation to finish, the signal
        WebKitWebView::load-changed will always be emitted with
        [webkit.types.LoadEvent.Finished] event right after this one.
        
        By default, if the signal is not handled, a stock error page will be displayed.
        You need to handle the signal if you want to provide your own error page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.types.LoadEvent loadEvent, string failingUri, glib.error.ErrorWrap error, webkit.web_view.WebView webView))
  
          `loadEvent` the #WebKitLoadEvent of the load operation (optional)
  
          `failingUri` the URI that failed to load (optional)
  
          `error` the #GError that was triggered (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadFailed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.types.LoadEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : webkit.web_view.WebView)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("load-failed", closure, after);
  }

  /**
      Connect to `LoadFailedWithTlsErrors` signal.
  
      Emitted when a TLS error occurs during a load operation.
        To allow an exception for this certificate
        and the host of failing_uri use webkit_web_context_allow_tls_certificate_for_host().
        
        To handle this signal asynchronously you should call [gobject.object.ObjectWrap.ref_] on certificate
        and return true.
        
        If false is returned, #WebKitWebView::load-failed will be emitted. The load
        will finish regardless of the returned value.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(string failingUri, gio.tls_certificate.TlsCertificate certificate, gio.types.TlsCertificateFlags errors, webkit.web_view.WebView webView))
  
          `failingUri` the URI that failed to load (optional)
  
          `certificate` a #GTlsCertificate (optional)
  
          `errors` a #GTlsCertificateFlags with the verification status of certificate (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLoadFailedWithTlsErrors(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gio.types.TlsCertificateFlags)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : webkit.web_view.WebView)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("load-failed-with-tls-errors", closure, after);
  }

  /**
      Connect to `MouseTargetChanged` signal.
  
      This signal is emitted when the mouse cursor moves over an
        element such as a link, image or a media element. To determine
        what type of element the mouse cursor is over, a Hit Test is performed
        on the current mouse coordinates and the result is passed in the
        hit_test_result argument. The modifiers argument is a bitmask of
        #GdkModifierType flags indicating the state of modifier keys.
        The signal is emitted again when the mouse is moved out of the
        current element with a new hit_test_result.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.hit_test_result.HitTestResult hitTestResult, uint modifiers, webkit.web_view.WebView webView))
  
          `hitTestResult` a #WebKitHitTestResult (optional)
  
          `modifiers` a bitmask of #GdkModifierType (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMouseTargetChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.hit_test_result.HitTestResult)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_view.WebView)))
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
    return connectSignalClosure("mouse-target-changed", closure, after);
  }

  /**
      Connect to `PermissionRequest` signal.
  
      This signal is emitted when WebKit is requesting the client to
        decide about a permission request, such as allowing the browser
        to switch to fullscreen mode, sharing its location or similar
        operations.
        
        A possible way to use this signal could be through a dialog
        allowing the user decide what to do with the request:
        
        ```c
        static gboolean permission_request_cb (WebKitWebView *web_view,
                                               WebKitPermissionRequest *request,
                                               GtkWindow *parent_window)
        {
            GtkWidget *dialog = gtk_message_dialog_new (parent_window,
                                                        GTK_DIALOG_MODAL,
                                                        GTK_MESSAGE_QUESTION,
                                                        GTK_BUTTONS_YES_NO,
                                                        "Allow Permission Request?");
            gtk_widget_show (dialog);
            gint result = gtk_dialog_run (GTK_DIALOG (dialog));
        
            switch (result) {
            case GTK_RESPONSE_YES:
                webkit_permission_request_allow (request);
                break;
            default:
                webkit_permission_request_deny (request);
                break;
            }
            gtk_widget_destroy (dialog);
        
            return TRUE;
        }
        ```
        
        It is possible to handle permission requests asynchronously, by
        simply calling [gobject.object.ObjectWrap.ref_] on the request argument and
        returning true to block the default signal handler.  If the
        last reference is removed on a #WebKitPermissionRequest and the
        request has not been handled, [webkit.permission_request.PermissionRequest.deny]
        will be the default action.
        
        If the signal is not handled, the request will be completed automatically
        by the specific #WebKitPermissionRequest that could allow or deny it. Check the
        documentation of classes implementing #WebKitPermissionRequest interface to know
        their default action.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.permission_request.PermissionRequest request, webkit.web_view.WebView webView))
  
          `request` the #WebKitPermissionRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPermissionRequest(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.permission_request.PermissionRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("permission-request", closure, after);
  }

  /**
      Connect to `Print` signal.
  
      Emitted when printing is requested on web_view, usually by a JavaScript call,
        before the print dialog is shown. This signal can be used to set the initial
        print settings and page setup of print_operation to be used as default values in
        the print dialog. You can call [webkit.print_operation.PrintOperation.setPrintSettings] and
        [webkit.print_operation.PrintOperation.setPageSetup] and then return false to propagate the
        event so that the print dialog is shown.
        
        You can connect to this signal and return true to cancel the print operation
        or implement your own print dialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.print_operation.PrintOperation printOperation, webkit.web_view.WebView webView))
  
          `printOperation` the #WebKitPrintOperation that will handle the print request (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPrint(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.print_operation.PrintOperation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("print", closure, after);
  }

  /**
      Connect to `QueryPermissionState` signal.
  
      This signal allows the User-Agent to respond to permission requests for powerful features, as
        specified by the [Permissions W3C Specification](https://w3c.github.io/permissions/).
        You can reply to the query using [webkit.permission_state_query.PermissionStateQuery.finish].
        
        You can handle the query asynchronously by calling [webkit.permission_state_query.PermissionStateQuery.ref_] on
        query and returning true. If the last reference of query is removed and the query has not
        been handled, the query result will be set to `WEBKIT_QUERY_PERMISSION_PROMPT`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.permission_state_query.PermissionStateQuery query, webkit.web_view.WebView webView))
  
          `query` the #WebKitPermissionStateQuery (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true if the message was handled, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQueryPermissionState(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.permission_state_query.PermissionStateQuery)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("query-permission-state", closure, after);
  }

  /**
      Connect to `ReadyToShow` signal.
  
      Emitted after #WebKitWebView::create on the newly created #WebKitWebView
        when it should be displayed to the user. When this signal is emitted
        all the information about how the window should look, including
        size, position, whether the location, status and scrollbars
        should be displayed, is already set on the #WebKitWindowProperties
        of web_view. See also [webkit.web_view.WebView.getWindowProperties].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReadyToShow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
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
    return connectSignalClosure("ready-to-show", closure, after);
  }

  /**
      Connect to `ResourceLoadStarted` signal.
  
      Emitted when a new resource is going to be loaded. The request parameter
        contains the #WebKitURIRequest that will be sent to the server.
        You can monitor the load operation by connecting to the different signals
        of resource.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_resource.WebResource resource, webkit.urirequest.URIRequest request, webkit.web_view.WebView webView))
  
          `resource` a #WebKitWebResource (optional)
  
          `request` a #WebKitURIRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectResourceLoadStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_resource.WebResource)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.urirequest.URIRequest)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_view.WebView)))
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
    return connectSignalClosure("resource-load-started", closure, after);
  }

  /**
      Connect to `RunAsModal` signal.
  
      Emitted after #WebKitWebView::ready-to-show on the newly
        created #WebKitWebView when JavaScript code calls
        <function>window.showModalDialog</function>. The purpose of
        this signal is to allow the client application to prepare the
        new view to behave as modal. Once the signal is emitted a new
        main loop will be run to block user interaction in the parent
        #WebKitWebView until the new dialog is closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_view.WebView webView))
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRunAsModal(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_view.WebView)))
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
    return connectSignalClosure("run-as-modal", closure, after);
  }

  /**
      Connect to `RunColorChooser` signal.
  
      This signal is emitted when the user interacts with a <input
        type='color' /> HTML element, requesting from WebKit to show
        a dialog to select a color. To let the application know the details of
        the color chooser, as well as to allow the client application to either
        cancel the request or perform an actual color selection, the signal will
        pass an instance of the #WebKitColorChooserRequest in the request
        argument.
        
        It is possible to handle this request asynchronously by increasing the
        reference count of the request.
        
        The default signal handler will asynchronously run a regular
        #GtkColorChooser for the user to interact with.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.color_chooser_request.ColorChooserRequest request, webkit.web_view.WebView webView))
  
          `request` a #WebKitColorChooserRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRunColorChooser(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.color_chooser_request.ColorChooserRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("run-color-chooser", closure, after);
  }

  /**
      Connect to `RunFileChooser` signal.
  
      This signal is emitted when the user interacts with a <input
        type='file' /> HTML element, requesting from WebKit to show
        a dialog to select one or more files to be uploaded. To let the
        application know the details of the file chooser, as well as to
        allow the client application to either cancel the request or
        perform an actual selection of files, the signal will pass an
        instance of the #WebKitFileChooserRequest in the request
        argument.
        
        The default signal handler will asynchronously run a regular
        #GtkFileChooserDialog for the user to interact with.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.file_chooser_request.FileChooserRequest request, webkit.web_view.WebView webView))
  
          `request` a #WebKitFileChooserRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRunFileChooser(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.file_chooser_request.FileChooserRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("run-file-chooser", closure, after);
  }

  /**
      Connect to `ScriptDialog` signal.
  
      Emitted when JavaScript code calls <function>window.alert</function>,
        <function>window.confirm</function> or <function>window.prompt</function>,
        or when <function>onbeforeunload</function> event is fired.
        The dialog parameter should be used to build the dialog.
        If the signal is not handled a different dialog will be built and shown depending
        on the dialog type:
        <itemizedlist>
        <listitem><para>
         [webkit.types.ScriptDialogType.Alert]: message dialog with a single Close button.
        </para></listitem>
        <listitem><para>
         [webkit.types.ScriptDialogType.Confirm]: message dialog with OK and Cancel buttons.
        </para></listitem>
        <listitem><para>
         [webkit.types.ScriptDialogType.Prompt]: message dialog with OK and Cancel buttons and
         a text entry with the default text.
        </para></listitem>
        <listitem><para>
         [webkit.types.ScriptDialogType.BeforeUnloadConfirm]: message dialog with Stay and Leave buttons.
        </para></listitem>
        </itemizedlist>
        
        It is possible to handle the script dialog request asynchronously, by simply
        caling [webkit.script_dialog.ScriptDialog.ref_] on the dialog argument and calling
        [webkit.script_dialog.ScriptDialog.close] when done.
        If the last reference is removed on a #WebKitScriptDialog and the dialog has not been
        closed, [webkit.script_dialog.ScriptDialog.close] will be called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.script_dialog.ScriptDialog dialog, webkit.web_view.WebView webView))
  
          `dialog` the #WebKitScriptDialog to show (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScriptDialog(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.script_dialog.ScriptDialog)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("script-dialog", closure, after);
  }

  /**
      Connect to `ShowNotification` signal.
  
      This signal is emitted when a notification should be presented to the
        user. The notification is kept alive until either: 1) the web page cancels it
        or 2) a navigation happens.
        
        The default handler will emit a notification using libnotify, if built with
        support for it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.notification.Notification notification, webkit.web_view.WebView webView))
  
          `notification` a #WebKitNotification (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked. false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowNotification(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.notification.Notification)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("show-notification", closure, after);
  }

  /**
      Connect to `ShowOptionMenu` signal.
  
      This signal is emitted when a select element in web_view needs to display a
        dropdown menu. This signal can be used to show a custom menu, using menu to get
        the details of all items that should be displayed. The area of the element in the
        #WebKitWebView is given as rectangle parameter, it can be used to position the
        menu.
        To handle this signal asynchronously you should keep a ref of the menu.
        
        The default signal handler will pop up a #GtkMenu.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.option_menu.OptionMenu menu, gdk.rectangle.Rectangle rectangle, webkit.web_view.WebView webView))
  
          `menu` the #WebKitOptionMenu (optional)
  
          `rectangle` the option element area (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
              false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowOptionMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.option_menu.OptionMenu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.web_view.WebView)))
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
    return connectSignalClosure("show-option-menu", closure, after);
  }

  /**
      Connect to `SubmitForm` signal.
  
      This signal is emitted when a form is about to be submitted. The request
        argument passed contains information about the text fields of the form. This
        is typically used to store login information that can be used later to
        pre-fill the form.
        The form will not be submitted until [webkit.form_submission_request.FormSubmissionRequest.submit] is called.
        
        It is possible to handle the form submission request asynchronously, by
        simply calling [gobject.object.ObjectWrap.ref_] on the request argument and calling
        [webkit.form_submission_request.FormSubmissionRequest.submit] when done to continue with the form submission.
        If the last reference is removed on a #WebKitFormSubmissionRequest and the
        form has not been submitted, [webkit.form_submission_request.FormSubmissionRequest.submit] will be called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.form_submission_request.FormSubmissionRequest request, webkit.web_view.WebView webView))
  
          `request` a #WebKitFormSubmissionRequest (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSubmitForm(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.form_submission_request.FormSubmissionRequest)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("submit-form", closure, after);
  }

  /**
      Connect to `UserMessageReceived` signal.
  
      This signal is emitted when a #WebKitUserMessage is received from the
        #WebKitWebPage corresponding to web_view. You can reply to the message
        using [webkitwebprocessextension.user_message.UserMessage.sendReply].
        
        You can handle the user message asynchronously by calling [gobject.object.ObjectWrap.ref_] on
        message and returning true. If the last reference of message is removed
        and the message has not been replied to, the operation in the #WebKitWebPage will
        finish with error [webkit.types.UserMessageError.Message].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.user_message.UserMessage message, webkit.web_view.WebView webView))
  
          `message` the #WebKitUserMessage received (optional)
  
          `webView` the instance the signal is connected to (optional)
  
          `Returns` true if the message was handled, or false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUserMessageReceived(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.user_message.UserMessage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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

  /**
      Connect to `WebProcessTerminated` signal.
  
      This signal is emitted when the web process terminates abnormally due
        to reason.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.types.WebProcessTerminationReason reason, webkit.web_view.WebView webView))
  
          `reason` the a #WebKitWebProcessTerminationReason (optional)
  
          `webView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWebProcessTerminated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.types.WebProcessTerminationReason)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.web_view.WebView)))
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
    return connectSignalClosure("web-process-terminated", closure, after);
  }
}
