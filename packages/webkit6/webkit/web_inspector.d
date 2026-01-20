/// Module for [WebInspector] class
module webkit.web_inspector;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.web_view_base;

/**
    Access to the WebKit inspector.
    
    The WebKit Inspector is a graphical tool to inspect and change the
    content of a #WebKitWebView. It also includes an interactive
    JavaScript debugger. Using this class one can get a #GtkWidget
    which can be embedded into an application to show the inspector.
    
    The inspector is available when the #WebKitSettings of the
    #WebKitWebView has set the #WebKitSettings:enable-developer-extras
    to true, otherwise no inspector is available.
    
    ```c
    // Enable the developer extras
    WebKitSettings *settings = webkit_web_view_get_settings (WEBKIT_WEB_VIEW(my_webview));
    g_object_set (G_OBJECT(settings), "enable-developer-extras", TRUE, NULL);
    
    // Load some data or reload to be able to inspect the page
    webkit_web_view_load_uri (WEBKIT_WEB_VIEW(my_webview), "http://www.gnome.org");
    
    // Show the inspector
    WebKitWebInspector *inspector = webkit_web_view_get_inspector (WEBKIT_WEB_VIEW(my_webview));
    webkit_web_inspector_show (WEBKIT_WEB_INSPECTOR(inspector));
    ```
*/
class WebInspector : gobject.object.ObjectWrap
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
    return cast(void function())webkit_web_inspector_get_type != &gidSymbolNotFound ? webkit_web_inspector_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebInspector self()
  {
    return this;
  }

  /**
      Get `attachedHeight` property.
      Returns: The height that the inspector view should have when it is attached.
  */
  @property uint attachedHeight()
  {
    return getAttachedHeight();
  }

  /**
      Get `canAttach` property.
      Returns: Whether the @inspector can be attached to the same window that contains
        the inspected view.
  */
  @property bool canAttach()
  {
    return getCanAttach();
  }

  /**
      Get `inspectedUri` property.
      Returns: The URI that is currently being inspected.
  */
  @property string inspectedUri()
  {
    return getInspectedUri();
  }

  /**
      Request inspector to be attached.
      
      The signal #WebKitWebInspector::attach
      will be emitted. If the inspector is already attached it does nothing.
  */
  void attach()
  {
    webkit_web_inspector_attach(cast(WebKitWebInspector*)this._cPtr);
  }

  /**
      Request inspector to be closed.
  */
  void close()
  {
    webkit_web_inspector_close(cast(WebKitWebInspector*)this._cPtr);
  }

  /**
      Request inspector to be detached.
      
      The signal #WebKitWebInspector::detach
      will be emitted. If the inspector is already detached it does nothing.
  */
  void detach()
  {
    webkit_web_inspector_detach(cast(WebKitWebInspector*)this._cPtr);
  }

  /**
      Get the height that the inspector view when attached.
      
      Get the height that the inspector view should have when
      it's attached. If the inspector view is not attached this
      returns 0.
      Returns: the height of the inspector view when attached
  */
  uint getAttachedHeight()
  {
    uint _retval;
    _retval = webkit_web_inspector_get_attached_height(cast(WebKitWebInspector*)this._cPtr);
    return _retval;
  }

  /**
      Whether the inspector can be attached to the same window that contains
      the inspected view.
      Returns: true if there is enough room for the inspector view inside the
            window that contains the inspected view, or false otherwise.
  */
  bool getCanAttach()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_inspector_get_can_attach(cast(WebKitWebInspector*)this._cPtr);
    return _retval;
  }

  /**
      Get the URI that is currently being inspected.
      
      This can be null if
      nothing has been loaded yet in the inspected view, if the inspector
      has been closed or when inspected view was loaded from a HTML string
      instead of a URI.
      Returns: the URI that is currently being inspected or null
  */
  string getInspectedUri()
  {
    const(char)* _cretval;
    _cretval = webkit_web_inspector_get_inspected_uri(cast(WebKitWebInspector*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitWebViewBase used to display the inspector.
      
      This might be null if the inspector hasn't been loaded yet,
      or it has been closed.
      Returns: the #WebKitWebViewBase used to display the inspector or null
  */
  webkit.web_view_base.WebViewBase getWebView()
  {
    WebKitWebViewBase* _cretval;
    _cretval = webkit_web_inspector_get_web_view(cast(WebKitWebInspector*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_view_base.WebViewBase)(cast(WebKitWebViewBase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Whether the inspector view is currently attached to the same window that contains
      the inspected view.
      Returns: true if inspector is currently attached or false otherwise
  */
  bool isAttached()
  {
    bool _retval;
    _retval = cast(bool)webkit_web_inspector_is_attached(cast(WebKitWebInspector*)this._cPtr);
    return _retval;
  }

  /**
      Request inspector to be shown.
  */
  void show()
  {
    webkit_web_inspector_show(cast(WebKitWebInspector*)this._cPtr);
  }

  /**
      Connect to `Attach` signal.
  
      Emitted when the inspector is requested to be attached to the window
        where the inspected web view is.
        If this signal is not handled the inspector view will be automatically
        attached to the inspected view, so you only need to handle this signal
        if you want to attach the inspector view yourself (for example, to add
        the inspector view to a browser tab).
        
        To prevent the inspector view from being attached you can connect to this
        signal and simply return true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_inspector.WebInspector webInspector))
  
          `webInspector` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAttach(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_inspector.WebInspector)))
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
    return connectSignalClosure("attach", closure, after);
  }

  /**
      Connect to `BringToFront` signal.
  
      Emitted when the inspector should be shown.
        
        If the inspector is not attached the inspector window should be shown
        on top of any other windows.
        If the inspector is attached the inspector view should be made visible.
        For example, if the inspector view is attached using a tab in a browser
        window, the browser window should be raised and the tab containing the
        inspector view should be the active one.
        In both cases, if this signal is not handled, the default implementation
        calls [gtk.window.Window.present] on the current toplevel #GtkWindow of the
        inspector view.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_inspector.WebInspector webInspector))
  
          `webInspector` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBringToFront(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_inspector.WebInspector)))
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
    return connectSignalClosure("bring-to-front", closure, after);
  }

  /**
      Connect to `Closed` signal.
  
      Emitted when the inspector page is closed. If you are using your own
        inspector window, you should connect to this signal and destroy your
        window.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.web_inspector.WebInspector webInspector))
  
          `webInspector` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_inspector.WebInspector)))
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
    return connectSignalClosure("closed", closure, after);
  }

  /**
      Connect to `Detach` signal.
  
      Emitted when the inspector is requested to be detached from the window
        it is currently attached to. The inspector is detached when the inspector page
        is about to be closed, and this signal is emitted right before
        #WebKitWebInspector::closed, or when the user clicks on the detach button
        in the inspector view to show the inspector in a separate window. In this case
        the signal #WebKitWebInspector::open-window is emitted after this one.
        
        To prevent the inspector view from being detached you can connect to this
        signal and simply return true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_inspector.WebInspector webInspector))
  
          `webInspector` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDetach(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_inspector.WebInspector)))
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
    return connectSignalClosure("detach", closure, after);
  }

  /**
      Connect to `OpenWindow` signal.
  
      Emitted when the inspector is requested to open in a separate window.
        If this signal is not handled, a #GtkWindow with the inspector will be
        created and shown, so you only need to handle this signal if you want
        to use your own window.
        This signal is emitted after #WebKitWebInspector::detach to show
        the inspector in a separate window after being detached.
        
        To prevent the inspector from being shown you can connect to this
        signal and simply return true
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(webkit.web_inspector.WebInspector webInspector))
  
          `webInspector` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the event.
               false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOpenWindow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.web_inspector.WebInspector)))
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
    return connectSignalClosure("open-window", closure, after);
  }
}
