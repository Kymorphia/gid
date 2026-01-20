/// Module for [AutomationSession] class
module webkit.automation_session;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.application_info;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.web_view;

/**
    Automation Session.
    
    WebKitAutomationSession represents an automation session of a WebKitWebContext.
    When a new session is requested, a WebKitAutomationSession is created and the signal
    WebKitWebContext::automation-started is emitted with the WebKitAutomationSession as
    argument. Then, the automation client can request the session to create a new
    #WebKitWebView to interact with it. When this happens the signal #WebKitAutomationSession::create-web-view
    is emitted.
*/
class AutomationSession : gobject.object.ObjectWrap
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
    return cast(void function())webkit_automation_session_get_type != &gidSymbolNotFound ? webkit_automation_session_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AutomationSession self()
  {
    return this;
  }

  /**
      Get the the previously set #WebKitAutomationSession.
      
      Get the #WebKitAutomationSession previously set with [webkit.automation_session.AutomationSession.setApplicationInfo].
      Returns: the #WebKitAutomationSession of session, or null if no one has been set.
  */
  webkit.application_info.ApplicationInfo getApplicationInfo()
  {
    WebKitApplicationInfo* _cretval;
    _cretval = webkit_automation_session_get_application_info(cast(WebKitAutomationSession*)this._cPtr);
    auto _retval = _cretval ? new webkit.application_info.ApplicationInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the unique identifier of a #WebKitAutomationSession
      Returns: the unique identifier of session
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = webkit_automation_session_get_id(cast(WebKitAutomationSession*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the application information to session.
      
      This information will be used by the driver service
      to match the requested capabilities with the actual application information. If this information
      is not provided to the session when a new automation session is requested, the creation might fail
      if the client requested a specific browser name or version. This will not have any effect when called
      after the automation session has been fully created, so this must be called in the callback of
      #WebKitWebContext::automation-started signal.
  
      Params:
        info = a #WebKitApplicationInfo
  */
  void setApplicationInfo(webkit.application_info.ApplicationInfo info)
  {
    webkit_automation_session_set_application_info(cast(WebKitAutomationSession*)this._cPtr, info ? cast(WebKitApplicationInfo*)info._cPtr(No.Dup) : null);
  }

  /**
      Connect to `CreateWebView` signal.
  
      This signal is emitted when the automation client requests a new
        browsing context to interact with it. The callback handler should
        return a #WebKitWebView created with #WebKitWebView:is-controlled-by-automation
        construct property enabled and #WebKitWebView:automation-presentation-type construct
        property set if needed.
        
        If the signal is emitted with "tab" detail, the returned #WebKitWebView should be
        a new web view added to a new tab of the current browsing context window.
        If the signal is emitted with "window" detail, the returned #WebKitWebView should be
        a new web view added to a new window.
        When creating a new web view and there's an active browsing context, the new window
        or tab shouldn't be focused.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D webkit.web_view.WebView callback(webkit.automation_session.AutomationSession automationSession))
  
          `automationSession` the instance the signal is connected to (optional)
  
          `Returns` a #WebKitWebView widget.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateWebView(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : webkit.web_view.WebView)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.automation_session.AutomationSession)))
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
      setVal!(webkit.web_view.WebView)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-web-view"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `WillClose` signal.
  
      This signal is emitted when the given automation session is about to finish.
        It allows clients to perform any cleanup tasks before the session is destroyed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.automation_session.AutomationSession automationSession))
  
          `automationSession` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWillClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.automation_session.AutomationSession)))
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
    return connectSignalClosure("will-close", closure, after);
  }
}
