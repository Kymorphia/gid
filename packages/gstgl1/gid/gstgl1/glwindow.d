/// Module for [GLWindow] class
module gid.gstgl1.glwindow;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.gldisplay;
import gid.gstgl1.types;

/**
    GstGLWindow represents a window that elements can render into.  A window can
    either be a user visible window (onscreen) or hidden (offscreen).
*/
@gidGir("GLWindow", "GLWindowClass")
class GLWindow : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_gl_window_get_type != &gidSymbolNotFound ? gst_gl_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glwindow.GLWindow]
      Returns: New builder object
  */
  static GLWindowGidBuilder builder() nothrow
  {
    return new GLWindowGidBuilder;
  }

  /** */
  this(gid.gstgl1.gldisplay.GLDisplay display) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstGLWindow* _cretval;
      _cretval = gst_gl_window_new(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      close the connection to the display
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncClose()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.close)
      return;

    _klass.close(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Checks if window controls the GL viewport.
      Returns: true if window controls the GL viewport, otherwise false
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncControlsViewport` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncControlsViewport()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.controlsViewport)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.controlsViewport(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Redraw the window contents.  Implementations should invoke the draw callback.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDraw` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncDraw()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.draw)
      return;

    _klass.draw(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Gets the current windowing system display connection
      Returns: the windowing system display handle for this window
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetDisplay` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected size_t vfuncGetDisplay()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.getDisplay)
      return typeof(return).init;

    size_t _retval;
    _retval = _klass.getDisplay(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current window handle that this #GstGLWindow is
                          rendering into.  This may return a different value to
                          what is passed into set_window_handle
      Returns: the window handle we are currently rendering into
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetWindowHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected size_t vfuncGetWindowHandle()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.getWindowHandle)
      return typeof(return).init;

    size_t _retval;
    _retval = _klass.getWindowHandle(cast(GstGLWindow*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandleEvents` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncHandleEvents(bool handleEvents)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.handleEvents)
      return;

    _klass.handleEvents(cast(GstGLWindow*)this._cPtr, handleEvents);
  }

  /**
      Query whether window has output surface or not
      Returns: true if window has useable output surface
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHasOutputSurface` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncHasOutputSurface()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.hasOutputSurface)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.hasOutputSurface(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      open the connection to the display
      Returns: 
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncOpen()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.open(cast(GstGLWindow*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Queue resizing of window.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQueueResize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQueueResize()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.queueResize)
      return;

    _klass.queueResize(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Quit the runloop's execution.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncQuit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncQuit()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.quit)
      return;

    _klass.quit(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Start the execution of the runloop.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRun` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRun()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.run)
      return;

    _klass.run(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Invoke callback with data on the window thread.  callback is guaranteed to
      have executed when this function returns.
  
      Params:
        callback = function to invoke
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSendMessage` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncSendMessage(gid.gstgl1.types.GLWindowCB callback)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.sendMessage)
      return;

    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.sendMessage(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Invoke callback with data on the window thread.  The callback may not
      have been executed when this function returns.
  
      Params:
        callback = function to invoke
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSendMessageAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncSendMessageAsync(gid.gstgl1.types.GLWindowCB callback)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.sendMessageAsync)
      return;

    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _klass.sendMessageAsync(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Set the preferred width and height of the window.  Implementations are free
      to ignore this information.
  
      Params:
        width = new preferred width
        height = new preferred height
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetPreferredSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetPreferredSize(int width, int height)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.setPreferredSize)
      return;

    _klass.setPreferredSize(cast(GstGLWindow*)this._cPtr, width, height);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetRenderRectangle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetRenderRectangle(int x, int y, int width, int height)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.setRenderRectangle)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setRenderRectangle(cast(GstGLWindow*)this._cPtr, x, y, width, height);
    return _retval;
  }

  /**
      Sets the window that this window should render into.  Some implementations
      require this to be called with a valid handle before drawing can commence.
  
      Params:
        handle = handle to the window
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetWindowHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetWindowHandle(size_t handle)
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.setWindowHandle)
      return;

    _klass.setWindowHandle(cast(GstGLWindow*)this._cPtr, handle);
  }

  /**
      Present the window to the screen.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShow()
  {
    auto _klass = cast(GstGLWindowClass*)_vfuncClass;
    if (!_klass.show)
      return;

    _klass.show(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Checks if window controls the GL viewport.
      Returns: true if window controls the GL viewport, otherwise false
  */
  bool controlsViewport() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_controls_viewport(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Redraw the window contents.  Implementations should invoke the draw callback.
  */
  void draw() nothrow
  {
    gst_gl_window_draw(cast(GstGLWindow*)this._cPtr);
  }

  /** */
  gid.gstgl1.glcontext.GLContext getContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_window_get_context(cast(GstGLWindow*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  size_t getDisplay() nothrow
  {
    size_t _retval;
    _retval = gst_gl_window_get_display(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /** */
  bool getRequestOutputSurface() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_get_request_output_surface(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /** */
  void getSurfaceDimensions(out uint width, out uint height) nothrow
  {
    gst_gl_window_get_surface_dimensions(cast(GstGLWindow*)this._cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /** */
  size_t getWindowHandle() nothrow
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
  void handleEvents(bool handleEvents) nothrow
  {
    gst_gl_window_handle_events(cast(GstGLWindow*)this._cPtr, handleEvents);
  }

  /**
      Query whether window has output surface or not
      Returns: true if window has useable output surface
  */
  bool hasOutputSurface() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_has_output_surface(cast(GstGLWindow*)this._cPtr);
    return _retval;
  }

  /**
      Queue resizing of window.
  */
  void queueResize() nothrow
  {
    gst_gl_window_queue_resize(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Quit the runloop's execution.
  */
  void quit() nothrow
  {
    gst_gl_window_quit(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Resize window to the given width and height.
  
      Params:
        width = new width
        height = new height
  */
  void resize(uint width, uint height) nothrow
  {
    gst_gl_window_resize(cast(GstGLWindow*)this._cPtr, width, height);
  }

  /**
      Start the execution of the runloop.
  */
  void run() nothrow
  {
    gst_gl_window_run(cast(GstGLWindow*)this._cPtr);
  }

  /** */
  void sendKeyEvent(string eventType, string keyStr) nothrow
  {
    const(char)* _eventType = eventType.toCString!(No.Malloc, No.Nullable);
    const(char)* _keyStr = keyStr.toCString!(No.Malloc, No.Nullable);
    gst_gl_window_send_key_event(cast(GstGLWindow*)this._cPtr, _eventType, _keyStr);
  }

  /**
      Invoke callback with data on the window thread.  callback is guaranteed to
      have executed when this function returns.
  
      Params:
        callback = function to invoke
  */
  void sendMessage(gid.gstgl1.types.GLWindowCB callback) nothrow
  {
    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
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
  void sendMessageAsync(gid.gstgl1.types.GLWindowCB callback) nothrow
  {
    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_send_message_async(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /** */
  void sendMouseEvent(string eventType, int button, double posx, double posy) nothrow
  {
    const(char)* _eventType = eventType.toCString!(No.Malloc, No.Nullable);
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
  void sendScrollEvent(double posx, double posy, double deltaX, double deltaY) nothrow
  {
    gst_gl_window_send_scroll_event(cast(GstGLWindow*)this._cPtr, posx, posy, deltaX, deltaY);
  }

  /**
      Sets the callback called when the window is about to close.
  
      Params:
        callback = function to invoke
  */
  void setCloseCallback(gid.gstgl1.types.GLWindowCB callback) nothrow
  {
    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_close_callback(cast(GstGLWindow*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets the draw callback called every time [gid.gstgl1.glwindow.GLWindow.draw] is called
  
      Params:
        callback = function to invoke
  */
  void setDrawCallback(gid.gstgl1.types.GLWindowCB callback) nothrow
  {
    extern(C) void _callbackCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstgl1.types.GLWindowCB*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowCB");
      }
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
  void setPreferredSize(int width, int height) nothrow
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
  bool setRenderRectangle(int x, int y, int width, int height) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_window_set_render_rectangle(cast(GstGLWindow*)this._cPtr, x, y, width, height);
    return _retval;
  }

  /**
      Configure whether a visible output surface is requested.
  
      Params:
        outputSurface = whether to request an output surface.
  */
  void setRequestOutputSurface(bool outputSurface) nothrow
  {
    gst_gl_window_set_request_output_surface(cast(GstGLWindow*)this._cPtr, outputSurface);
  }

  /**
      Sets the resize callback called every time a resize of the window occurs.
  
      Params:
        callback = function to invoke
  */
  void setResizeCallback(gid.gstgl1.types.GLWindowResizeCB callback) nothrow
  {
    extern(C) void _callbackCallback(void* data, uint width, uint height) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gstgl1.types.GLWindowResizeCB*)data;

      try
      {
        (*_dlg)(width, height);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLWindowResizeCB");
      }
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
  void setWindowHandle(size_t handle) nothrow
  {
    gst_gl_window_set_window_handle(cast(GstGLWindow*)this._cPtr, handle);
  }

  /**
      Present the window to the screen.
  */
  void show() nothrow
  {
    gst_gl_window_show(cast(GstGLWindow*)this._cPtr);
  }

  /**
      Connect to `KeyEvent` signal.
  
      Will be emitted when a key event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string id, string key, gid.gstgl1.glwindow.GLWindow gLWindow)`
  
          `id` the name of the event (optional)
  
          `key` the id of the key pressed (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectKeyEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gstgl1.glwindow.GLWindow)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.keyEvent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-event", closure, after);
  }

  /**
      Connect to `MouseEvent` signal.
  
      Will be emitted when a mouse event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string id, int button, double x, double y, gid.gstgl1.glwindow.GLWindow gLWindow)`
  
          `id` the name of the event (optional)
  
          `button` the id of the button (optional)
  
          `x` the x coordinate of the mouse event (optional)
  
          `y` the y coordinate of the mouse event (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMouseEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == double)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gstgl1.glwindow.GLWindow)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.mouseEvent");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mouse-event", closure, after);
  }

  /**
      Connect to `ScrollEvent` signal.
  
      Will be emitted when a mouse scroll event is received by the GstGLwindow.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, double deltaX, double deltaY, gid.gstgl1.glwindow.GLWindow gLWindow)`
  
          `x` the x coordinate of the mouse event (optional)
  
          `y` the y coordinate of the mouse event (optional)
  
          `deltaX` the x offset of the scroll event (optional)
  
          `deltaY` the y offset of the scroll event (optional)
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == double)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gstgl1.glwindow.GLWindow)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.scrollEvent");
      }
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
  
          `void callback(gid.gstgl1.glwindow.GLWindow gLWindow)`
  
          `gLWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectWindowHandleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstgl1.glwindow.GLWindow)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.windowHandleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-handle-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLWindow
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glwindow.GLWindow), T.stringof ~ " is not derived from gid.gstgl1.glwindow.GLWindow");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncControlsViewport", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "controls_viewport");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDraw", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "draw");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetDisplay", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "get_display");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetWindowHandle", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "get_window_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandleEvents", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "handle_events");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHasOutputSurface", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "has_output_surface");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQueueResize", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "queue_resize");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncQuit", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "quit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRun", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "run");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSendMessage", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      static assert(0, "Overriding gid.gstgl1.glwindow.GLWindow.vfuncSendMessage is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSendMessageAsync", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      static assert(0, "Overriding gid.gstgl1.glwindow.GLWindow.vfuncSendMessageAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetPreferredSize", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "set_preferred_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetRenderRectangle", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "set_render_rectangle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetWindowHandle", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "set_window_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShow", true)[0]) == gid.gstgl1.glwindow.GLWindow))
      _installVfunc(klass, "show");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLWindowClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) void _vfuncCloseTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(window);
            return;
          }

          try
          {
            _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncClose");
          }
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "controls_viewport":
      {
        static extern(C) gboolean _vfuncControlsViewportTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.controlsViewport)
              return (cast(typeof(&_vfuncControlsViewportTramp))_klass.controlsViewport)(window);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncControlsViewport();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncControlsViewport");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.controlsViewport = cast(typeof(_klass.controlsViewport))&_vfuncControlsViewportTramp;
        break;
      }
      case "draw":
      {
        static extern(C) void _vfuncDrawTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.draw)
              return (cast(typeof(&_vfuncDrawTramp))_klass.draw)(window);
            return;
          }

          try
          {
            _obj.vfuncDraw();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncDraw");
          }
        }

        _klass.draw = cast(typeof(_klass.draw))&_vfuncDrawTramp;
        break;
      }
      case "get_display":
      {
        static extern(C) size_t _vfuncGetDisplayTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.getDisplay)
              return (cast(typeof(&_vfuncGetDisplayTramp))_klass.getDisplay)(window);
            return typeof(return).init;
          }

          size_t _retval;

          try
          {
            _retval = _obj.vfuncGetDisplay();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncGetDisplay");
          }
          return _retval;
        }

        _klass.getDisplay = cast(typeof(_klass.getDisplay))&_vfuncGetDisplayTramp;
        break;
      }
      case "get_window_handle":
      {
        static extern(C) size_t _vfuncGetWindowHandleTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.getWindowHandle)
              return (cast(typeof(&_vfuncGetWindowHandleTramp))_klass.getWindowHandle)(window);
            return typeof(return).init;
          }

          size_t _retval;

          try
          {
            _retval = _obj.vfuncGetWindowHandle();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncGetWindowHandle");
          }
          return _retval;
        }

        _klass.getWindowHandle = cast(typeof(_klass.getWindowHandle))&_vfuncGetWindowHandleTramp;
        break;
      }
      case "handle_events":
      {
        static extern(C) void _vfuncHandleEventsTramp(GstGLWindow* window, gboolean handleEvents) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.handleEvents)
              return (cast(typeof(&_vfuncHandleEventsTramp))_klass.handleEvents)(window, handleEvents);
            return;
          }

          try
          {
            _obj.vfuncHandleEvents(cast(bool)handleEvents);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncHandleEvents");
          }
        }

        _klass.handleEvents = cast(typeof(_klass.handleEvents))&_vfuncHandleEventsTramp;
        break;
      }
      case "has_output_surface":
      {
        static extern(C) gboolean _vfuncHasOutputSurfaceTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.hasOutputSurface)
              return (cast(typeof(&_vfuncHasOutputSurfaceTramp))_klass.hasOutputSurface)(window);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHasOutputSurface();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncHasOutputSurface");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasOutputSurface = cast(typeof(_klass.hasOutputSurface))&_vfuncHasOutputSurfaceTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstGLWindow* window, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(window, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOpen();
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "queue_resize":
      {
        static extern(C) void _vfuncQueueResizeTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.queueResize)
              return (cast(typeof(&_vfuncQueueResizeTramp))_klass.queueResize)(window);
            return;
          }

          try
          {
            _obj.vfuncQueueResize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncQueueResize");
          }
        }

        _klass.queueResize = cast(typeof(_klass.queueResize))&_vfuncQueueResizeTramp;
        break;
      }
      case "quit":
      {
        static extern(C) void _vfuncQuitTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.quit)
              return (cast(typeof(&_vfuncQuitTramp))_klass.quit)(window);
            return;
          }

          try
          {
            _obj.vfuncQuit();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncQuit");
          }
        }

        _klass.quit = cast(typeof(_klass.quit))&_vfuncQuitTramp;
        break;
      }
      case "run":
      {
        static extern(C) void _vfuncRunTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.run)
              return (cast(typeof(&_vfuncRunTramp))_klass.run)(window);
            return;
          }

          try
          {
            _obj.vfuncRun();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncRun");
          }
        }

        _klass.run = cast(typeof(_klass.run))&_vfuncRunTramp;
        break;
      }
      case "set_preferred_size":
      {
        static extern(C) void _vfuncSetPreferredSizeTramp(GstGLWindow* window, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.setPreferredSize)
              return (cast(typeof(&_vfuncSetPreferredSizeTramp))_klass.setPreferredSize)(window, width, height);
            return;
          }

          try
          {
            _obj.vfuncSetPreferredSize(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncSetPreferredSize");
          }
        }

        _klass.setPreferredSize = cast(typeof(_klass.setPreferredSize))&_vfuncSetPreferredSizeTramp;
        break;
      }
      case "set_render_rectangle":
      {
        static extern(C) gboolean _vfuncSetRenderRectangleTramp(GstGLWindow* window, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.setRenderRectangle)
              return (cast(typeof(&_vfuncSetRenderRectangleTramp))_klass.setRenderRectangle)(window, x, y, width, height);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetRenderRectangle(x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncSetRenderRectangle");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setRenderRectangle = cast(typeof(_klass.setRenderRectangle))&_vfuncSetRenderRectangleTramp;
        break;
      }
      case "set_window_handle":
      {
        static extern(C) void _vfuncSetWindowHandleTramp(GstGLWindow* window, size_t handle) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.setWindowHandle)
              return (cast(typeof(&_vfuncSetWindowHandleTramp))_klass.setWindowHandle)(window, handle);
            return;
          }

          try
          {
            _obj.vfuncSetWindowHandle(handle);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncSetWindowHandle");
          }
        }

        _klass.setWindowHandle = cast(typeof(_klass.setWindowHandle))&_vfuncSetWindowHandleTramp;
        break;
      }
      case "show":
      {
        static extern(C) void _vfuncShowTramp(GstGLWindow* window) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glwindow.GLWindow)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)window);
          if (!_obj)
          {
            auto _klass = cast(GstGLWindowClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)window);
            if (_klass.show)
              return (cast(typeof(&_vfuncShowTramp))_klass.show)(window);
            return;
          }

          try
          {
            _obj.vfuncShow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glwindow.GLWindow.vfuncShow");
          }
        }

        _klass.show = cast(typeof(_klass.show))&_vfuncShowTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glwindow.GLWindow]
class GLWindowGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glwindow.GLWindow]
final class GLWindowGidBuilder : GLWindowGidBuilderImpl!GLWindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLWindow build() nothrow
  {
    return new GLWindow(cast(void*)createGObject(GLWindow._getGType), Yes.Take);
  }
}
