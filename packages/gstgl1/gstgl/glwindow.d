/// Module for [GLWindow] class
module gstgl.glwindow;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.gldisplay;
import gstgl.types;

/**
    GstGLWindow represents a window that elements can render into.  A window can
    either be a user visible window (onscreen) or hidden (offscreen).
*/
class GLWindow : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_window_get_type != &gidSymbolNotFound ? gst_gl_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLWindow self()
  {
    return this;
  }

  /** */
  this(gstgl.gldisplay.GLDisplay display)
  {
    GstGLWindow* _cretval;
    _cretval = gst_gl_window_new(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if window controls the GL viewport.
      Returns: true if window controls the GL viewport, otherwise false
  */
  bool controlsViewport()
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_controls_viewport(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Redraw the window contents.  Implementations should invoke the draw callback.
  */
  void draw()
  {
    gst_gl_window_draw(cast(GstGLWindow*)this._cPtr);
  }

  /** */
  gstgl.glcontext.GLContext getContext()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_window_get_context(cast(GstGLWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  size_t getDisplay()
  {
    size_t _retval;
    _retval = gst_gl_window_get_display(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /** */
  void getSurfaceDimensions(out uint width, out uint height)
  {
    gst_gl_window_get_surface_dimensions(cast(GstGLWindow*)this._cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /** */
  size_t getWindowHandle()
  {
    size_t _retval;
    _retval = gst_gl_window_get_window_handle(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Tell a window that it should handle events from the window system. These
      events are forwarded upstream as navigation events. In some window systems
      events are not propagated in the window hierarchy if a client is listening
      for them. This method allows you to disable events handling completely
      from the window.
  
      Params:
        handleEvents = a #gboolean indicating if events should be handled or not.
  */
  void handleEvents(bool handleEvents)
  {
    gst_gl_window_handle_events(cast(GstGLWindow*)this._cPtr, handleEvents);
  }

  /**
      Query whether window has output surface or not
      Returns: true if window has useable output surface
  */
  bool hasOutputSurface()
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_has_output_surface(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Queue resizing of window.
  */
  void queueResize()
  {
    gst_gl_window_queue_resize(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Quit the runloop's execution.
  */
  void quit()
  {
    gst_gl_window_quit(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Resize window to the given width and height.
  
      Params:
        width = new width
        height = new height
  */
  void resize(uint width, uint height)
  {
    gst_gl_window_resize(cast(GstGLWindow*)this._cPtr, width, height);
  }

  /**
      Start the execution of the runloop.
  */
  void run()
  {
    gst_gl_window_run(cast(GstGLWindow*)this._cPtr);
  }

  /** */
  void sendKeyEvent(string eventType, string keyStr)
  {
    const(char)* _eventType = eventType.toCString(No.Alloc);
    const(char)* _keyStr = keyStr.toCString(No.Alloc);
    gst_gl_window_send_key_event(cast(GstGLWindow*)this._cPtr, _eventType, _keyStr);
  }

  /**
      Invoke callback with data on the window thread.  callback is guaranteed to
      have executed when this function returns.
  
      Params:
        callback = function to invoke
  */
  void sendMessage(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gst_gl_window_send_message(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Invoke callback with data on the window thread.  The callback may not
      have been executed when this function returns.
  
      Params:
        callback = function to invoke
  */
  void sendMessageAsync(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_send_message_async(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /** */
  void sendMouseEvent(string eventType, int button, double posx, double posy)
  {
    const(char)* _eventType = eventType.toCString(No.Alloc);
    gst_gl_window_send_mouse_event(cast(GstGLWindow*)this._cPtr, _eventType, button, posx, posy);
  }

  /**
      Notify a window about a scroll event. A scroll signal holding the event
      coordinates will be emitted.
  
      Params:
        posx = x position of the mouse cursor
        posy = y position of the mouse cursor
        deltaX = the x offset of the scroll event
        deltaY = the y offset of the scroll event
  */
  void sendScrollEvent(double posx, double posy, double deltaX, double deltaY)
  {
    gst_gl_window_send_scroll_event(cast(GstGLWindow*)this._cPtr, posx, posy, deltaX, deltaY);
  }

  /**
      Sets the callback called when the window is about to close.
  
      Params:
        callback = function to invoke
  */
  void setCloseCallback(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_close_callback(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets the draw callback called every time [gstgl.glwindow.GLWindow.draw] is called
  
      Params:
        callback = function to invoke
  */
  void setDrawCallback(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_draw_callback(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Set the preferred width and height of the window.  Implementations are free
      to ignore this information.
  
      Params:
        width = new preferred width
        height = new preferred height
  */
  void setPreferredSize(int width, int height)
  {
    gst_gl_window_set_preferred_size(cast(GstGLWindow*)this._cPtr, width, height);
  }

  /**
      Tell a window that it should render into a specific region of the window
      according to the #GstVideoOverlay interface.
  
      Params:
        x = x position
        y = y position
        width = width
        height = height
      Returns: whether the specified region could be set
  */
  bool setRenderRectangle(int x, int y, int width, int height)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_set_render_rectangle(cast(GstGLWindow*)this._cPtr, x, y, width, height);
    return _retval;
  }

  /**
      Sets the resize callback called every time a resize of the window occurs.
  
      Params:
        callback = function to invoke
  */
  void setResizeCallback(gstgl.types.GLWindowResizeCB callback)
  {
    extern(C) void _callbackCallback(void* data, uint width, uint height)
    {
      auto _dlg = cast(gstgl.types.GLWindowResizeCB*)data;

      (*_dlg)(width, height);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_resize_callback(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets the window that this window should render into.  Some implementations
      require this to be called with a valid handle before drawing can commence.
  
      Params:
        handle = handle to the window
  */
  void setWindowHandle(size_t handle)
  {
    gst_gl_window_set_window_handle(cast(GstGLWindow*)this._cPtr, handle);
  }

  /**
      Present the window to the screen.
  */
  void show()
  {
    gst_gl_window_show(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Connect to `KeyEvent` signal.
  
      Will be emitted when a key event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string id, string key, gstgl.glwindow.GLWindow gLWindow))
  
          `id` the name of the event (optional)
  
          `key` the id of the key pressed (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectKeyEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstgl.glwindow.GLWindow)))
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
    return connectSignalClosure("key-event", closure, after);
  }

  /**
      Connect to `MouseEvent` signal.
  
      Will be emitted when a mouse event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string id, int button, double x, double y, gstgl.glwindow.GLWindow gLWindow))
  
          `id` the name of the event (optional)
  
          `button` the id of the button (optional)
  
          `x` the x coordinate of the mouse event (optional)
  
          `y` the y coordinate of the mouse event (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMouseEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == double)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gstgl.glwindow.GLWindow)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mouse-event", closure, after);
  }

  /**
      Connect to `ScrollEvent` signal.
  
      Will be emitted when a mouse scroll event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, double deltaX, double deltaY, gstgl.glwindow.GLWindow gLWindow))
  
          `x` the x coordinate of the mouse event (optional)
  
          `y` the y coordinate of the mouse event (optional)
  
          `deltaX` the x offset of the scroll event (optional)
  
          `deltaY` the y offset of the scroll event (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == double)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gstgl.glwindow.GLWindow)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);


      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-event", closure, after);
  }

  /**
      Connect to `WindowHandleChanged` signal.
  
      Will be emitted when the window handle has been set into the native
        implementation, but before the context is re-activated. By using this
        signal, elements can refresh associated resource without relying on
        direct handle comparision.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstgl.glwindow.GLWindow gLWindow))
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWindowHandleChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstgl.glwindow.GLWindow)))
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
    return connectSignalClosure("window-handle-changed", closure, after);
  }
}
