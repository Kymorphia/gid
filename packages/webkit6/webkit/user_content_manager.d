/// Module for [UserContentManager] class
module webkit.user_content_manager;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import javascriptcore.value;
import webkit.c.functions;
import webkit.c.types;
import webkit.script_message_reply;
import webkit.types;
import webkit.user_content_filter;
import webkit.user_script;
import webkit.user_style_sheet;

/**
    Manages user-defined content which affects web pages.
    
    Using a #WebKitUserContentManager user CSS style sheets can be set to
    be injected in the web pages loaded by a #WebKitWebView, by
    [webkit.user_content_manager.UserContentManager.addStyleSheet].
    
    To use a #WebKitUserContentManager, it must be created using
    [webkit.user_content_manager.UserContentManager.new_], and then used to construct
    a #WebKitWebView. User style sheets can be created with
    [webkit.user_style_sheet.UserStyleSheet.new_].
    
    User style sheets can be added and removed at any time, but
    they will affect the web pages loaded afterwards.
*/
class UserContentManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_user_content_manager_get_type != &gidSymbolNotFound ? webkit_user_content_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserContentManager self()
  {
    return this;
  }

  /**
      Creates a new user content manager.
      Returns: A #WebKitUserContentManager
  */
  this()
  {
    WebKitUserContentManager* _cretval;
    _cretval = webkit_user_content_manager_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a #WebKitUserContentFilter to the given #WebKitUserContentManager.
      
      The same #WebKitUserContentFilter can be reused with multiple
      #WebKitUserContentManager instances.
      
      Filters need to be saved and loaded from #WebKitUserContentFilterStore.
  
      Params:
        filter = A #WebKitUserContentFilter
  */
  void addFilter(webkit.user_content_filter.UserContentFilter filter)
  {
    webkit_user_content_manager_add_filter(cast(WebKitUserContentManager*)this._cPtr, filter ? cast(WebKitUserContentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Adds a #WebKitUserScript to the given #WebKitUserContentManager.
      
      The same #WebKitUserScript can be reused with multiple
      #WebKitUserContentManager instances.
  
      Params:
        script = A #WebKitUserScript
  */
  void addScript(webkit.user_script.UserScript script)
  {
    webkit_user_content_manager_add_script(cast(WebKitUserContentManager*)this._cPtr, script ? cast(WebKitUserScript*)script._cPtr(No.Dup) : null);
  }

  /**
      Adds a #WebKitUserStyleSheet to the given #WebKitUserContentManager.
      
      The same #WebKitUserStyleSheet can be reused with multiple
      #WebKitUserContentManager instances.
  
      Params:
        stylesheet = A #WebKitUserStyleSheet
  */
  void addStyleSheet(webkit.user_style_sheet.UserStyleSheet stylesheet)
  {
    webkit_user_content_manager_add_style_sheet(cast(WebKitUserContentManager*)this._cPtr, stylesheet ? cast(WebKitUserStyleSheet*)stylesheet._cPtr(No.Dup) : null);
  }

  /**
      Registers a new user script message handler in script world.
      
      After it is registered,
      scripts can use `window.webkit.messageHandlers.<name>.postMessage(value)`
      to send messages. Those messages are received by connecting handlers
      to the #WebKitUserContentManager::script-message-received signal. The
      handler name is used as the detail of the signal. To avoid race
      conditions between registering the handler name, and starting to
      receive the signals, it is recommended to connect to the signal
      *before* registering the handler name:
      
      ```c
      WebKitWebView *view = webkit_web_view_new ();
      WebKitUserContentManager *manager = webkit_web_view_get_user_content_manager ();
      g_signal_connect (manager, "script-message-received::foobar",
                        G_CALLBACK (handle_script_message), NULL);
      webkit_user_content_manager_register_script_message_handler (manager, "foobar");
      ```
      
      Registering a script message handler will fail if the requested
      name has been already registered before.
      
      If null is passed as the world_name, the default world will be used.
      
      The registered handler can be unregistered by using
      [webkit.user_content_manager.UserContentManager.unregisterScriptMessageHandler].
  
      Params:
        name = Name of the script message channel
        worldName = the name of a #WebKitScriptWorld
      Returns: true if message handler was registered successfully, or false otherwise.
  */
  bool registerScriptMessageHandler(string name, string worldName = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _worldName = worldName.toCString(No.Alloc);
    _retval = cast(bool)webkit_user_content_manager_register_script_message_handler(cast(WebKitUserContentManager*)this._cPtr, _name, _worldName);
    return _retval;
  }

  /**
      Registers a new user script message handler in script world with name world_name.
      
      Different from [webkit.user_content_manager.UserContentManager.registerScriptMessageHandler],
      when using this function to register the handler, the connected signal is
      script-message-with-reply-received, and a reply provided by the user is expected.
      Otherwise, the user will receive a default undefined value.
      
      If null is passed as the world_name, the default world will be used.
      See [webkit.user_content_manager.UserContentManager.registerScriptMessageHandler] for full description.
      
      Registering a script message handler will fail if the requested
      name has been already registered before.
      
      The registered handler can be unregistered by using
      [webkit.user_content_manager.UserContentManager.unregisterScriptMessageHandler].
  
      Params:
        name = Name of the script message channel
        worldName = the name of a #WebKitScriptWorld
      Returns: true if message handler was registered successfully, or false otherwise.
  */
  bool registerScriptMessageHandlerWithReply(string name, string worldName = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _worldName = worldName.toCString(No.Alloc);
    _retval = cast(bool)webkit_user_content_manager_register_script_message_handler_with_reply(cast(WebKitUserContentManager*)this._cPtr, _name, _worldName);
    return _retval;
  }

  /**
      Removes all content filters from the given #WebKitUserContentManager.
  */
  void removeAllFilters()
  {
    webkit_user_content_manager_remove_all_filters(cast(WebKitUserContentManager*)this._cPtr);
  }

  /**
      Removes all user scripts from the given #WebKitUserContentManager
      
      See also [webkit.user_content_manager.UserContentManager.removeScript].
  */
  void removeAllScripts()
  {
    webkit_user_content_manager_remove_all_scripts(cast(WebKitUserContentManager*)this._cPtr);
  }

  /**
      Removes all user style sheets from the given #WebKitUserContentManager.
  */
  void removeAllStyleSheets()
  {
    webkit_user_content_manager_remove_all_style_sheets(cast(WebKitUserContentManager*)this._cPtr);
  }

  /**
      Removes a filter from the given #WebKitUserContentManager.
      
      Since 2.24
  
      Params:
        filter = A #WebKitUserContentFilter
  */
  void removeFilter(webkit.user_content_filter.UserContentFilter filter)
  {
    webkit_user_content_manager_remove_filter(cast(WebKitUserContentManager*)this._cPtr, filter ? cast(WebKitUserContentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Removes a filter by the given identifier.
      
      Removes a filter from the given #WebKitUserContentManager given the
      identifier of a #WebKitUserContentFilter as returned by
      [webkit.user_content_filter.UserContentFilter.getIdentifier].
  
      Params:
        filterId = Filter identifier
  */
  void removeFilterById(string filterId)
  {
    const(char)* _filterId = filterId.toCString(No.Alloc);
    webkit_user_content_manager_remove_filter_by_id(cast(WebKitUserContentManager*)this._cPtr, _filterId);
  }

  /**
      Removes a #WebKitUserScript from the given #WebKitUserContentManager.
      
      See also [webkit.user_content_manager.UserContentManager.removeAllScripts].
  
      Params:
        script = A #WebKitUserScript
  */
  void removeScript(webkit.user_script.UserScript script)
  {
    webkit_user_content_manager_remove_script(cast(WebKitUserContentManager*)this._cPtr, script ? cast(WebKitUserScript*)script._cPtr(No.Dup) : null);
  }

  /**
      Removes a #WebKitUserStyleSheet from the given #WebKitUserContentManager.
      
      See also [webkit.user_content_manager.UserContentManager.removeAllStyleSheets].
  
      Params:
        stylesheet = A #WebKitUserStyleSheet
  */
  void removeStyleSheet(webkit.user_style_sheet.UserStyleSheet stylesheet)
  {
    webkit_user_content_manager_remove_style_sheet(cast(WebKitUserContentManager*)this._cPtr, stylesheet ? cast(WebKitUserStyleSheet*)stylesheet._cPtr(No.Dup) : null);
  }

  /**
      Unregisters a previously registered message handler in script world with name world_name.
      If null is passed as the world_name, the default world will be used.
      
      Note that this does *not* disconnect handlers for the
      #WebKitUserContentManager::script-message-received signal;
      they will be kept connected, but the signal will not be emitted
      unless the handler name is registered again.
      
      See also [webkit.user_content_manager.UserContentManager.registerScriptMessageHandler].
  
      Params:
        name = Name of the script message channel
        worldName = the name of a #WebKitScriptWorld
  */
  void unregisterScriptMessageHandler(string name, string worldName = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _worldName = worldName.toCString(No.Alloc);
    webkit_user_content_manager_unregister_script_message_handler(cast(WebKitUserContentManager*)this._cPtr, _name, _worldName);
  }

  /**
      Connect to `ScriptMessageReceived` signal.
  
      This signal is emitted when JavaScript in a web view calls
        <code>window.webkit.messageHandlers.<name>.postMessage()</code>, after registering
        <code><name></code> using
        [webkit.user_content_manager.UserContentManager.registerScriptMessageHandler]
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(javascriptcore.value.Value value, webkit.user_content_manager.UserContentManager userContentManager))
  
          `value` the value received from the JavaScript world. (optional)
  
          `userContentManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScriptMessageReceived(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : javascriptcore.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.user_content_manager.UserContentManager)))
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
    return connectSignalClosure("script-message-received"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `ScriptMessageWithReplyReceived` signal.
  
      This signal is emitted when JavaScript in a web view calls
        <code>window.webkit.messageHandlers.<name>.postMessage()</code>, after registering
        <code><name></code> using
        [webkit.user_content_manager.UserContentManager.registerScriptMessageHandlerWithReply]
        
        The given reply can be used to send a return value with
        [webkit.script_message_reply.ScriptMessageReply.returnValue] or an error message with
        [webkit.script_message_reply.ScriptMessageReply.returnErrorMessage]. If none of them are
        called, an automatic reply with an undefined value will be sent.
        
        It is possible to handle the reply asynchronously, by simply calling
        [gobject.object.ObjectWrap.ref_] on the reply and returning true.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D bool callback(javascriptcore.value.Value value, webkit.script_message_reply.ScriptMessageReply reply, webkit.user_content_manager.UserContentManager userContentManager))
  
          `value` the value received from the JavaScript world. (optional)
  
          `reply` the #WebKitScriptMessageReply to send the reply to the script message. (optional)
  
          `userContentManager` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScriptMessageWithReplyReceived(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : javascriptcore.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == webkit.script_message_reply.ScriptMessageReply)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.user_content_manager.UserContentManager)))
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
    return connectSignalClosure("script-message-with-reply-received"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
