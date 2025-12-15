/// Module for [Window] class
module gdk.window;

import cairo.context;
import cairo.pattern;
import cairo.region;
import cairo.surface;
import cairo.types;
import gdk.c.functions;
import gdk.c.types;
import gdk.color;
import gdk.cursor;
import gdk.device;
import gdk.display;
import gdk.drawing_context;
import gdk.event;
import gdk.frame_clock;
import gdk.glcontext;
import gdk.rectangle;
import gdk.rgba;
import gdk.screen;
import gdk.types;
import gdk.visual;
import gdk.window_attr;
import gdkpixbuf.pixbuf;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;

/** */
class Window : gobject.object.ObjectWrap
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
    return cast(void function())gdk_window_get_type != &gidSymbolNotFound ? gdk_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Window self()
  {
    return this;
  }

  /**
      Get `cursor` property.
      Returns: The mouse pointer for a #GdkWindow. See [gdk.window.Window.setCursor] and
      [gdk.window.Window.getCursor] for details.
  */
  @property gdk.cursor.Cursor cursor()
  {
    return getCursor();
  }

  /**
      Set `cursor` property.
      Params:
        propval = The mouse pointer for a #GdkWindow. See [gdk.window.Window.setCursor] and
        [gdk.window.Window.getCursor] for details.
  */
  @property void cursor(gdk.cursor.Cursor propval)
  {
    return setCursor(propval);
  }

  /**
      Creates a new #GdkWindow using the attributes from
      attributes. See #GdkWindowAttr and #GdkWindowAttributesType for
      more details.  Note: to use this on displays other than the default
      display, parent must be specified.
  
      Params:
        parent = a #GdkWindow, or null to create the window as a child of
            the default root window for the default display.
        attributes = attributes of the new window
        attributesMask = mask indicating which
            fields in attributes are valid
      Returns: the new #GdkWindow
  */
  this(gdk.window.Window parent, gdk.window_attr.WindowAttr attributes, gdk.types.WindowAttributesType attributesMask)
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_new(parent ? cast(GdkWindow*)parent._cPtr(No.Dup) : null, attributes ? cast(GdkWindowAttr*)attributes._cPtr : null, attributesMask);
    this(_cretval, Yes.Take);
  }

  /**
      Obtains the window underneath the mouse pointer, returning the
      location of that window in win_x, win_y. Returns null if the
      window under the mouse pointer is not known to GDK (if the window
      belongs to another application and a #GdkWindow hasn’t been created
      for it with gdk_window_foreign_new())
      
      NOTE: For multihead-aware widgets or applications use
      [gdk.display.Display.getWindowAtPointer] instead.
  
      Params:
        winX = return location for origin of the window under the pointer
        winY = return location for origin of the window under the pointer
      Returns: window under the mouse pointer
  
      Deprecated: Use [gdk.device.Device.getWindowAtPosition] instead.
  */
  static gdk.window.Window atPointer(out int winX, out int winY)
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_at_pointer(cast(int*)&winX, cast(int*)&winY);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Constrains a desired width and height according to a
      set of geometry hints (such as minimum and maximum size).
  
      Params:
        geometry = a #GdkGeometry structure
        flags = a mask indicating what portions of geometry are set
        width = desired width of window
        height = desired height of the window
        newWidth = location to store resulting width
        newHeight = location to store resulting height
  */
  static void constrainSize(gdk.types.Geometry geometry, gdk.types.WindowHints flags, int width, int height, out int newWidth, out int newHeight)
  {
    gdk_window_constrain_size(&geometry, flags, width, height, cast(int*)&newWidth, cast(int*)&newHeight);
  }

  /**
      Calls [gdk.window.Window.processUpdates] for all windows (see #GdkWindow)
      in the application.
  */
  static void processAllUpdates()
  {
    gdk_window_process_all_updates();
  }

  /**
      With update debugging enabled, calls to
      [gdk.window.Window.invalidateRegion] clear the invalidated region of the
      screen to a noticeable color, and GDK pauses for a short time
      before sending exposes to windows during
      [gdk.window.Window.processUpdates].  The net effect is that you can see
      the invalid region for each window and watch redraws as they
      occur. This allows you to diagnose inefficiencies in your application.
      
      In essence, because the GDK rendering model prevents all flicker,
      if you are redrawing the same region 400 times you may never
      notice, aside from noticing a speed problem. Enabling update
      debugging causes GTK to flicker slowly and noticeably, so you can
      see exactly what’s being redrawn when, in what order.
      
      The --gtk-debug=updates command line option passed to GTK+ programs
      enables this debug option at application startup time. That's
      usually more useful than calling [gdk.window.Window.setDebugUpdates]
      yourself, though you might want to use this function to enable
      updates sometime after application startup time.
  
      Params:
        setting = true to turn on update debugging
  */
  static void setDebugUpdates(bool setting)
  {
    gdk_window_set_debug_updates(setting);
  }

  /**
      Emits a short beep associated to window in the appropriate
      display, if supported. Otherwise, emits a short beep on
      the display just as [gdk.display.Display.beep].
  */
  void beep()
  {
    gdk_window_beep(cast(GdkWindow*)this._cPtr);
  }

  /**
      Indicates that you are beginning the process of redrawing region
      on window, and provides you with a #GdkDrawingContext.
      
      If window is a top level #GdkWindow, backed by a native window
      implementation, a backing store (offscreen buffer) large enough to
      contain region will be created. The backing store will be initialized
      with the background color or background surface for window. Then, all
      drawing operations performed on window will be diverted to the
      backing store. When you call gdk_window_end_frame(), the contents of
      the backing store will be copied to window, making it visible
      on screen. Only the part of window contained in region will be
      modified; that is, drawing operations are clipped to region.
      
      The net result of all this is to remove flicker, because the user
      sees the finished product appear all at once when you call
      [gdk.window.Window.endDrawFrame]. If you draw to window directly without
      calling [gdk.window.Window.beginDrawFrame], the user may see flicker
      as individual drawing operations are performed in sequence.
      
      When using GTK+, the widget system automatically places calls to
      [gdk.window.Window.beginDrawFrame] and [gdk.window.Window.endDrawFrame] around
      emissions of the `GtkWidget::draw` signal. That is, if you’re
      drawing the contents of the widget yourself, you can assume that the
      widget has a cleared background, is already set as the clip region,
      and already has a backing store. Therefore in most cases, application
      code in GTK does not need to call [gdk.window.Window.beginDrawFrame]
      explicitly.
  
      Params:
        region = a Cairo region
      Returns: a #GdkDrawingContext context that should be
          used to draw the contents of the window; the returned context is owned
          by GDK.
  */
  gdk.drawing_context.DrawingContext beginDrawFrame(cairo.region.Region region)
  {
    GdkDrawingContext* _cretval;
    _cretval = gdk_window_begin_draw_frame(cast(GdkWindow*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drawing_context.DrawingContext)(cast(GdkDrawingContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Begins a window move operation (for a toplevel window).
      
      This function assumes that the drag is controlled by the
      client pointer device, use [gdk.window.Window.beginMoveDragForDevice]
      to begin a drag with a different device.
  
      Params:
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        rootX = root window X coordinate of mouse click that began the drag
        rootY = root window Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag
  */
  void beginMoveDrag(int button, int rootX, int rootY, uint timestamp)
  {
    gdk_window_begin_move_drag(cast(GdkWindow*)this._cPtr, button, rootX, rootY, timestamp);
  }

  /**
      Begins a window move operation (for a toplevel window).
      You might use this function to implement a “window move grip,” for
      example. The function works best with window managers that support the
      [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
      but has a fallback implementation for other window managers.
  
      Params:
        device = the device used for the operation
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        rootX = root window X coordinate of mouse click that began the drag
        rootY = root window Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag
  */
  void beginMoveDragForDevice(gdk.device.Device device, int button, int rootX, int rootY, uint timestamp)
  {
    gdk_window_begin_move_drag_for_device(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, button, rootX, rootY, timestamp);
  }

  /**
      A convenience wrapper around [gdk.window.Window.beginPaintRegion] which
      creates a rectangular region for you. See
      [gdk.window.Window.beginPaintRegion] for details.
  
      Params:
        rectangle = rectangle you intend to draw to
  
      Deprecated: Use [gdk.window.Window.beginDrawFrame] instead
  */
  void beginPaintRect(gdk.rectangle.Rectangle rectangle)
  {
    gdk_window_begin_paint_rect(cast(GdkWindow*)this._cPtr, rectangle ? cast(const(GdkRectangle)*)rectangle._cPtr(No.Dup) : null);
  }

  /**
      Indicates that you are beginning the process of redrawing region.
      A backing store (offscreen buffer) large enough to contain region
      will be created. The backing store will be initialized with the
      background color or background surface for window. Then, all
      drawing operations performed on window will be diverted to the
      backing store.  When you call [gdk.window.Window.endPaint], the backing
      store will be copied to window, making it visible onscreen. Only
      the part of window contained in region will be modified; that is,
      drawing operations are clipped to region.
      
      The net result of all this is to remove flicker, because the user
      sees the finished product appear all at once when you call
      [gdk.window.Window.endPaint]. If you draw to window directly without
      calling [gdk.window.Window.beginPaintRegion], the user may see flicker
      as individual drawing operations are performed in sequence.  The
      clipping and background-initializing features of
      [gdk.window.Window.beginPaintRegion] are conveniences for the
      programmer, so you can avoid doing that work yourself.
      
      When using GTK+, the widget system automatically places calls to
      [gdk.window.Window.beginPaintRegion] and [gdk.window.Window.endPaint] around
      emissions of the expose_event signal. That is, if you’re writing an
      expose event handler, you can assume that the exposed area in
      #GdkEventExpose has already been cleared to the window background,
      is already set as the clip region, and already has a backing store.
      Therefore in most cases, application code need not call
      [gdk.window.Window.beginPaintRegion]. (You can disable the automatic
      calls around expose events on a widget-by-widget basis by calling
      [gtk.widget.Widget.setDoubleBuffered].)
      
      If you call this function multiple times before calling the
      matching [gdk.window.Window.endPaint], the backing stores are pushed onto
      a stack. [gdk.window.Window.endPaint] copies the topmost backing store
      onscreen, subtracts the topmost region from all other regions in
      the stack, and pops the stack. All drawing operations affect only
      the topmost backing store in the stack. One matching call to
      [gdk.window.Window.endPaint] is required for each call to
      [gdk.window.Window.beginPaintRegion].
  
      Params:
        region = region you intend to draw to
  
      Deprecated: Use [gdk.window.Window.beginDrawFrame] instead
  */
  void beginPaintRegion(cairo.region.Region region)
  {
    gdk_window_begin_paint_region(cast(GdkWindow*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null);
  }

  /**
      Begins a window resize operation (for a toplevel window).
      
      This function assumes that the drag is controlled by the
      client pointer device, use [gdk.window.Window.beginResizeDragForDevice]
      to begin a drag with a different device.
  
      Params:
        edge = the edge or corner from which the drag is started
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        rootX = root window X coordinate of mouse click that began the drag
        rootY = root window Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag (use [gdk.event.Event.getTime])
  */
  void beginResizeDrag(gdk.types.WindowEdge edge, int button, int rootX, int rootY, uint timestamp)
  {
    gdk_window_begin_resize_drag(cast(GdkWindow*)this._cPtr, edge, button, rootX, rootY, timestamp);
  }

  /**
      Begins a window resize operation (for a toplevel window).
      You might use this function to implement a “window resize grip,” for
      example; in fact #GtkStatusbar uses it. The function works best
      with window managers that support the
      [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
      but has a fallback implementation for other window managers.
  
      Params:
        edge = the edge or corner from which the drag is started
        device = the device used for the operation
        button = the button being used to drag, or 0 for a keyboard-initiated drag
        rootX = root window X coordinate of mouse click that began the drag
        rootY = root window Y coordinate of mouse click that began the drag
        timestamp = timestamp of mouse click that began the drag (use [gdk.event.Event.getTime])
  */
  void beginResizeDragForDevice(gdk.types.WindowEdge edge, gdk.device.Device device, int button, int rootX, int rootY, uint timestamp)
  {
    gdk_window_begin_resize_drag_for_device(cast(GdkWindow*)this._cPtr, edge, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, button, rootX, rootY, timestamp);
  }

  /**
      Does nothing, present only for compatiblity.
  
      Deprecated: this function is no longer needed
  */
  void configureFinished()
  {
    gdk_window_configure_finished(cast(GdkWindow*)this._cPtr);
  }

  /**
      Transforms window coordinates from a parent window to a child
      window, where the parent window is the normal parent as returned by
      [gdk.window.Window.getParent] for normal windows, and the window's
      embedder as returned by [gdk.global.offscreenWindowGetEmbedder] for
      offscreen windows.
      
      For normal windows, calling this function is equivalent to subtracting
      the return values of [gdk.window.Window.getPosition] from the parent coordinates.
      For offscreen windows however (which can be arbitrarily transformed),
      this function calls the GdkWindow::from-embedder: signal to translate
      the coordinates.
      
      You should always use this function when writing generic code that
      walks down a window hierarchy.
      
      See also: [gdk.window.Window.coordsToParent]
  
      Params:
        parentX = X coordinate in parent’s coordinate system
        parentY = Y coordinate in parent’s coordinate system
        x = return location for X coordinate in child’s coordinate system
        y = return location for Y coordinate in child’s coordinate system
  */
  void coordsFromParent(double parentX, double parentY, out double x, out double y)
  {
    gdk_window_coords_from_parent(cast(GdkWindow*)this._cPtr, parentX, parentY, cast(double*)&x, cast(double*)&y);
  }

  /**
      Transforms window coordinates from a child window to its parent
      window, where the parent window is the normal parent as returned by
      [gdk.window.Window.getParent] for normal windows, and the window's
      embedder as returned by [gdk.global.offscreenWindowGetEmbedder] for
      offscreen windows.
      
      For normal windows, calling this function is equivalent to adding
      the return values of [gdk.window.Window.getPosition] to the child coordinates.
      For offscreen windows however (which can be arbitrarily transformed),
      this function calls the GdkWindow::to-embedder: signal to translate
      the coordinates.
      
      You should always use this function when writing generic code that
      walks up a window hierarchy.
      
      See also: [gdk.window.Window.coordsFromParent]
  
      Params:
        x = X coordinate in child’s coordinate system
        y = Y coordinate in child’s coordinate system
        parentX = return location for X coordinate
          in parent’s coordinate system, or null
        parentY = return location for Y coordinate
          in parent’s coordinate system, or null
  */
  void coordsToParent(double x, double y, out double parentX, out double parentY)
  {
    gdk_window_coords_to_parent(cast(GdkWindow*)this._cPtr, x, y, cast(double*)&parentX, cast(double*)&parentY);
  }

  /**
      Creates a new #GdkGLContext matching the
      framebuffer format to the visual of the #GdkWindow. The context
      is disconnected from any particular window or surface.
      
      If the creation of the #GdkGLContext failed, error will be set.
      
      Before using the returned #GdkGLContext, you will need to
      call [gdk.glcontext.GLContext.makeCurrent] or [gdk.glcontext.GLContext.realize].
      Returns: the newly created #GdkGLContext, or
        null on error
      Throws: [ErrorWrap]
  */
  gdk.glcontext.GLContext createGlContext()
  {
    GdkGLContext* _cretval;
    GError *_err;
    _cretval = gdk_window_create_gl_context(cast(GdkWindow*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new image surface that is efficient to draw on the
      given window.
      
      Initially the surface contents are all 0 (transparent if contents
      have transparency, black otherwise.)
      
      The width and height of the new surface are not affected by
      the scaling factor of the window, or by the scale argument; they
      are the size of the surface in device pixels. If you wish to create
      an image surface capable of holding the contents of window you can
      use:
      
      ```c
        int scale = gdk_window_get_scale_factor (window);
        int width = gdk_window_get_width (window) * scale;
        int height = gdk_window_get_height (window) * scale;
      
        // format is set elsewhere
        cairo_surface_t *surface =
          gdk_window_create_similar_image_surface (window,
                                                   format,
                                                   width, height,
                                                   scale);
      ```
      
      Note that unlike [cairo.surface.Surface.createSimilarImage], the new
      surface's device scale is set to scale, or to the scale factor of
      window if scale is 0.
  
      Params:
        format = the format for the new surface
        width = width of the new surface
        height = height of the new surface
        scale = the scale of the new surface, or 0 to use same as window
      Returns: a pointer to the newly allocated surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a “nil” surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createSimilarImageSurface(cairo.types.Format format, int width, int height, int scale)
  {
    cairo_surface_t* _cretval;
    _cretval = gdk_window_create_similar_image_surface(cast(GdkWindow*)this._cPtr, format, width, height, scale);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new surface that is as compatible as possible with the
      given window. For example the new surface will have the same
      fallback resolution and font options as window. Generally, the new
      surface will also use the same backend as window, unless that is
      not possible for some reason. The type of the returned surface may
      be examined with [cairo.surface.Surface.getSurfaceType].
      
      Initially the surface contents are all 0 (transparent if contents
      have transparency, black otherwise.)
  
      Params:
        content = the content for the new surface
        width = width of the new surface
        height = height of the new surface
      Returns: a pointer to the newly allocated surface. The caller
        owns the surface and should call [cairo.surface.Surface.destroy] when done
        with it.
        
        This function always returns a valid pointer, but it will return a
        pointer to a “nil” surface if other is already in an error state
        or any other error occurs.
  */
  cairo.surface.Surface createSimilarSurface(cairo.types.Content content, int width, int height)
  {
    cairo_surface_t* _cretval;
    _cretval = gdk_window_create_similar_surface(cast(GdkWindow*)this._cPtr, content, width, height);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Attempt to deiconify (unminimize) window. On X11 the window manager may
      choose to ignore the request to deiconify. When using GTK+,
      use [gtk.window.Window.deiconify] instead of the #GdkWindow variant. Or better yet,
      you probably want to use [gtk.window.Window.presentWithTime], which raises the window, focuses it,
      unminimizes it, and puts it on the current desktop.
  */
  void deiconify()
  {
    gdk_window_deiconify(cast(GdkWindow*)this._cPtr);
  }

  /**
      Destroys the window system resources associated with window and decrements window's
      reference count. The window system resources for all children of window are also
      destroyed, but the children’s reference counts are not decremented.
      
      Note that a window will not be destroyed automatically when its reference count
      reaches zero. You must call this function yourself before that happens.
  */
  void destroy()
  {
    gdk_window_destroy(cast(GdkWindow*)this._cPtr);
  }

  /** */
  void destroyNotify()
  {
    gdk_window_destroy_notify(cast(GdkWindow*)this._cPtr);
  }

  /**
      Does nothing, present only for compatiblity.
  
      Deprecated: this function is no longer needed
  */
  void enableSynchronizedConfigure()
  {
    gdk_window_enable_synchronized_configure(cast(GdkWindow*)this._cPtr);
  }

  /**
      Indicates that the drawing of the contents of window started with
      gdk_window_begin_frame() has been completed.
      
      This function will take care of destroying the #GdkDrawingContext.
      
      It is an error to call this function without a matching
      gdk_window_begin_frame() first.
  
      Params:
        context = the #GdkDrawingContext created by [gdk.window.Window.beginDrawFrame]
  */
  void endDrawFrame(gdk.drawing_context.DrawingContext context)
  {
    gdk_window_end_draw_frame(cast(GdkWindow*)this._cPtr, context ? cast(GdkDrawingContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Indicates that the backing store created by the most recent call
      to [gdk.window.Window.beginPaintRegion] should be copied onscreen and
      deleted, leaving the next-most-recent backing store or no backing
      store at all as the active paint region. See
      [gdk.window.Window.beginPaintRegion] for full details.
      
      It is an error to call this function without a matching
      [gdk.window.Window.beginPaintRegion] first.
  */
  void endPaint()
  {
    gdk_window_end_paint(cast(GdkWindow*)this._cPtr);
  }

  /**
      Tries to ensure that there is a window-system native window for this
      GdkWindow. This may fail in some situations, returning false.
      
      Offscreen window and children of them can never have native windows.
      
      Some backends may not support native child windows.
      Returns: true if the window has a native window, false otherwise
  */
  bool ensureNative()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_ensure_native(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      This function does nothing.
  */
  void flush()
  {
    gdk_window_flush(cast(GdkWindow*)this._cPtr);
  }

  /**
      Sets keyboard focus to window. In most cases, [gtk.window.Window.presentWithTime]
      should be used on a #GtkWindow, rather than calling this function.
  
      Params:
        timestamp = timestamp of the event triggering the window focus
  */
  void focus(uint timestamp)
  {
    gdk_window_focus(cast(GdkWindow*)this._cPtr, timestamp);
  }

  /**
      Temporarily freezes a window and all its descendants such that it won't
      receive expose events.  The window will begin receiving expose events
      again when [gdk.window.Window.thawToplevelUpdatesLibgtkOnly] is called. If
      [gdk.window.Window.freezeToplevelUpdatesLibgtkOnly]
      has been called more than once,
      [gdk.window.Window.thawToplevelUpdatesLibgtkOnly] must be called
      an equal number of times to begin processing exposes.
      
      This function is not part of the GDK public API and is only
      for use by GTK+.
  
      Deprecated: This symbol was never meant to be used outside of GTK+
  */
  void freezeToplevelUpdatesLibgtkOnly()
  {
    gdk_window_freeze_toplevel_updates_libgtk_only(cast(GdkWindow*)this._cPtr);
  }

  /**
      Temporarily freezes a window such that it won’t receive expose
      events.  The window will begin receiving expose events again when
      [gdk.window.Window.thawUpdates] is called. If [gdk.window.Window.freezeUpdates]
      has been called more than once, [gdk.window.Window.thawUpdates] must be called
      an equal number of times to begin processing exposes.
  */
  void freezeUpdates()
  {
    gdk_window_freeze_updates(cast(GdkWindow*)this._cPtr);
  }

  /**
      Moves the window into fullscreen mode. This means the
      window covers the entire screen and is above any panels
      or task bars.
      
      If the window was already fullscreen, then this function does nothing.
      
      On X11, asks the window manager to put window in a fullscreen
      state, if the window manager supports this operation. Not all
      window managers support this, and some deliberately ignore it or
      don’t have a concept of “fullscreen”; so you can’t rely on the
      fullscreenification actually happening. But it will happen with
      most standard window managers, and GDK makes a best effort to get
      it to happen.
  */
  void fullscreen()
  {
    gdk_window_fullscreen(cast(GdkWindow*)this._cPtr);
  }

  /**
      Moves the window into fullscreen mode on the given monitor. This means
      the window covers the entire screen and is above any panels or task bars.
      
      If the window was already fullscreen, then this function does nothing.
  
      Params:
        monitor = Which monitor to display fullscreen on.
  
      Version: UNRELEASED
  */
  void fullscreenOnMonitor(int monitor)
  {
    gdk_window_fullscreen_on_monitor(cast(GdkWindow*)this._cPtr, monitor);
  }

  /**
      This function informs GDK that the geometry of an embedded
      offscreen window has changed. This is necessary for GDK to keep
      track of which offscreen window the pointer is in.
  */
  void geometryChanged()
  {
    gdk_window_geometry_changed(cast(GdkWindow*)this._cPtr);
  }

  /**
      Determines whether or not the desktop environment shuld be hinted that
      the window does not want to receive input focus.
      Returns: whether or not the window should receive input focus.
  */
  bool getAcceptFocus()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_accept_focus(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the pattern used to clear the background on window.
      Returns: The pattern to use for the
        background or null if there is no background.
  
      Deprecated: Don't use this function
  */
  cairo.pattern.Pattern getBackgroundPattern()
  {
    cairo_pattern_t* _cretval;
    _cretval = gdk_window_get_background_pattern(cast(GdkWindow*)this._cPtr);
    auto _retval = _cretval ? new cairo.pattern.Pattern(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of children of window known to GDK.
      This function only returns children created via GDK,
      so for example it’s useless when used with the root window;
      it only returns windows an application created itself.
      
      The returned list must be freed, but the elements in the
      list need not be.
      Returns: list of child windows inside window
  */
  gdk.window.Window[] getChildren()
  {
    GList* _cretval;
    _cretval = gdk_window_get_children(cast(GdkWindow*)this._cPtr);
    auto _retval = gListToD!(gdk.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the list of children of window known to GDK with a
      particular user_data set on it.
      
      The returned list must be freed, but the elements in the
      list need not be.
      
      The list is returned in (relative) stacking order, i.e. the
      lowest window is first.
  
      Params:
        userData = user data to look for
      Returns: list of child windows inside window
  */
  gdk.window.Window[] getChildrenWithUserData(void* userData = null)
  {
    GList* _cretval;
    _cretval = gdk_window_get_children_with_user_data(cast(GdkWindow*)this._cPtr, userData);
    auto _retval = gListToD!(gdk.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Computes the region of a window that potentially can be written
      to by drawing primitives. This region may not take into account
      other factors such as if the window is obscured by other windows,
      but no area outside of this region will be affected by drawing
      primitives.
      Returns: a #cairo_region_t. This must be freed with [cairo.region.Region.destroy]
                 when you are done.
  */
  cairo.region.Region getClipRegion()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_window_get_clip_region(cast(GdkWindow*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Determines whether window is composited.
      
      See [gdk.window.Window.setComposited].
      Returns: true if the window is composited.
  
      Deprecated: Compositing is an outdated technology that
          only ever worked on X11.
  */
  bool getComposited()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_composited(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a #GdkCursor pointer for the cursor currently set on the
      specified #GdkWindow, or null.  If the return value is null then
      there is no custom cursor set on the specified window, and it is
      using the cursor for its parent window.
      Returns: a #GdkCursor, or null. The
          returned object is owned by the #GdkWindow and should not be
          unreferenced directly. Use [gdk.window.Window.setCursor] to unset the
          cursor of the window
  */
  gdk.cursor.Cursor getCursor()
  {
    GdkCursor* _cretval;
    _cretval = gdk_window_get_cursor(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the decorations set on the GdkWindow with
      [gdk.window.Window.setDecorations].
  
      Params:
        decorations = The window decorations will be written here
      Returns: true if the window has decorations set, false otherwise.
  */
  bool getDecorations(out gdk.types.WMDecoration decorations)
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_decorations(cast(GdkWindow*)this._cPtr, &decorations);
    return _retval;
  }

  /**
      Retrieves a #GdkCursor pointer for the device currently set on the
      specified #GdkWindow, or null.  If the return value is null then
      there is no custom cursor set on the specified window, and it is
      using the cursor for its parent window.
  
      Params:
        device = a master, pointer #GdkDevice.
      Returns: a #GdkCursor, or null. The
          returned object is owned by the #GdkWindow and should not be
          unreferenced directly. Use [gdk.window.Window.setCursor] to unset the
          cursor of the window
  */
  gdk.cursor.Cursor getDeviceCursor(gdk.device.Device device)
  {
    GdkCursor* _cretval;
    _cretval = gdk_window_get_device_cursor(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the event mask for window corresponding to an specific device.
  
      Params:
        device = a #GdkDevice.
      Returns: device event mask for window
  */
  gdk.types.EventMask getDeviceEvents(gdk.device.Device device)
  {
    GdkEventMask _cretval;
    _cretval = gdk_window_get_device_events(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    gdk.types.EventMask _retval = cast(gdk.types.EventMask)_cretval;
    return _retval;
  }

  /**
      Obtains the current device position and modifier state.
      The position is given in coordinates relative to the upper left
      corner of window.
      
      Use [gdk.window.Window.getDevicePositionDouble] if you need subpixel precision.
  
      Params:
        device = pointer #GdkDevice to query to.
        x = return location for the X coordinate of device, or null.
        y = return location for the Y coordinate of device, or null.
        mask = return location for the modifier mask, or null.
      Returns: The window underneath device
        (as with [gdk.device.Device.getWindowAtPosition]), or null if the
        window is not known to GDK.
  */
  gdk.window.Window getDevicePosition(gdk.device.Device device, out int x, out int y, out gdk.types.ModifierType mask)
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_device_position(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, cast(int*)&x, cast(int*)&y, &mask);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the current device position in doubles and modifier state.
      The position is given in coordinates relative to the upper left
      corner of window.
  
      Params:
        device = pointer #GdkDevice to query to.
        x = return location for the X coordinate of device, or null.
        y = return location for the Y coordinate of device, or null.
        mask = return location for the modifier mask, or null.
      Returns: The window underneath device
        (as with [gdk.device.Device.getWindowAtPosition]), or null if the
        window is not known to GDK.
  */
  gdk.window.Window getDevicePositionDouble(gdk.device.Device device, out double x, out double y, out gdk.types.ModifierType mask)
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_device_position_double(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y, &mask);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkDisplay associated with a #GdkWindow.
      Returns: the #GdkDisplay associated with window
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_window_get_display(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds out the DND protocol supported by a window.
  
      Params:
        target = location of the window
             where the drop should happen. This may be window or a proxy window,
             or null if window does not support Drag and Drop.
      Returns: the supported DND protocol.
  */
  gdk.types.DragProtocol getDragProtocol(out gdk.window.Window target)
  {
    GdkDragProtocol _cretval;
    GdkWindow* _target;
    _cretval = gdk_window_get_drag_protocol(cast(GdkWindow*)this._cPtr, &_target);
    gdk.types.DragProtocol _retval = cast(gdk.types.DragProtocol)_cretval;
    target = new gdk.window.Window(cast(void*)_target, Yes.Take);
    return _retval;
  }

  /**
      Obtains the parent of window, as known to GDK. Works like
      [gdk.window.Window.getParent] for normal windows, but returns the
      window’s embedder for offscreen windows.
      
      See also: [gdk.global.offscreenWindowGetEmbedder]
      Returns: effective parent of window
  */
  gdk.window.Window getEffectiveParent()
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_effective_parent(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the toplevel window that’s an ancestor of window.
      
      Works like [gdk.window.Window.getToplevel], but treats an offscreen window's
      embedder as its parent, using [gdk.window.Window.getEffectiveParent].
      
      See also: [gdk.global.offscreenWindowGetEmbedder]
      Returns: the effective toplevel window containing window
  */
  gdk.window.Window getEffectiveToplevel()
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_effective_toplevel(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the current event compression setting for this window.
      Returns: true if motion events will be compressed
  */
  bool getEventCompression()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_event_compression(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the event mask for window for all master input devices. See
      [gdk.window.Window.setEvents].
      Returns: event mask for window
  */
  gdk.types.EventMask getEvents()
  {
    GdkEventMask _cretval;
    _cretval = gdk_window_get_events(cast(GdkWindow*)this._cPtr);
    gdk.types.EventMask _retval = cast(gdk.types.EventMask)_cretval;
    return _retval;
  }

  /**
      Determines whether or not the desktop environment should be hinted that the
      window does not want to receive input focus when it is mapped.
      Returns: whether or not the window wants to receive input focus when
        it is mapped.
  */
  bool getFocusOnMap()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_focus_on_map(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the frame clock for the window. The frame clock for a window
      never changes unless the window is reparented to a new toplevel
      window.
      Returns: the frame clock
  */
  gdk.frame_clock.FrameClock getFrameClock()
  {
    GdkFrameClock* _cretval;
    _cretval = gdk_window_get_frame_clock(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the bounding box of the window, including window manager
      titlebar/borders if any. The frame position is given in root window
      coordinates. To get the position of the window itself (rather than
      the frame) in root window coordinates, use [gdk.window.Window.getOrigin].
  
      Params:
        rect = rectangle to fill with bounding box of the window frame
  */
  void getFrameExtents(out gdk.rectangle.Rectangle rect)
  {
    GdkRectangle _rect;
    gdk_window_get_frame_extents(cast(GdkWindow*)this._cPtr, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
  }

  /**
      Obtains the #GdkFullscreenMode of the window.
      Returns: The #GdkFullscreenMode applied to the window when fullscreen.
  */
  gdk.types.FullscreenMode getFullscreenMode()
  {
    GdkFullscreenMode _cretval;
    _cretval = gdk_window_get_fullscreen_mode(cast(GdkWindow*)this._cPtr);
    gdk.types.FullscreenMode _retval = cast(gdk.types.FullscreenMode)_cretval;
    return _retval;
  }

  /**
      Any of the return location arguments to this function may be null,
      if you aren’t interested in getting the value of that field.
      
      The X and Y coordinates returned are relative to the parent window
      of window, which for toplevels usually means relative to the
      window decorations (titlebar, etc.) rather than relative to the
      root window (screen-size background window).
      
      On the X11 platform, the geometry is obtained from the X server,
      so reflects the latest position of window; this may be out-of-sync
      with the position of window delivered in the most-recently-processed
      #GdkEventConfigure. [gdk.window.Window.getPosition] in contrast gets the
      position from the most recent configure event.
      
      Note: If window is not a toplevel, it is much better
      to call [gdk.window.Window.getPosition], [gdk.window.Window.getWidth] and
      [gdk.window.Window.getHeight] instead, because it avoids the roundtrip to
      the X server and because these functions support the full 32-bit
      coordinate space, whereas [gdk.window.Window.getGeometry] is restricted to
      the 16-bit coordinates of X11.
  
      Params:
        x = return location for X coordinate of window (relative to its parent)
        y = return location for Y coordinate of window (relative to its parent)
        width = return location for width of window
        height = return location for height of window
  */
  void getGeometry(out int x, out int y, out int width, out int height)
  {
    gdk_window_get_geometry(cast(GdkWindow*)this._cPtr, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns the group leader window for window. See [gdk.window.Window.setGroup].
      Returns: the group leader window for window
  */
  gdk.window.Window getGroup()
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_group(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the height of the given window.
      
      On the X11 platform the returned size is the size reported in the
      most-recently-processed configure event, rather than the current
      size on the X server.
      Returns: The height of window
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_window_get_height(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether or not the window manager is hinted that window
      has modal behaviour.
      Returns: whether or not the window has the modal hint set.
  */
  bool getModalHint()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_modal_hint(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the position of a window in root window coordinates.
      (Compare with [gdk.window.Window.getPosition] and
      [gdk.window.Window.getGeometry] which return the position of a window
      relative to its parent window.)
  
      Params:
        x = return location for X coordinate
        y = return location for Y coordinate
      Returns: not meaningful, ignore
  */
  int getOrigin(out int x, out int y)
  {
    int _retval;
    _retval = gdk_window_get_origin(cast(GdkWindow*)this._cPtr, cast(int*)&x, cast(int*)&y);
    return _retval;
  }

  /**
      Obtains the parent of window, as known to GDK. Does not query the
      X server; thus this returns the parent as passed to [gdk.window.Window.new_],
      not the actual parent. This should never matter unless you’re using
      Xlib calls mixed with GDK calls on the X11 platform. It may also
      matter for toplevel windows, because the window manager may choose
      to reparent them.
      
      Note that you should use [gdk.window.Window.getEffectiveParent] when
      writing generic code that walks up a window hierarchy, because
      [gdk.window.Window.getParent] will most likely not do what you expect if
      there are offscreen windows in the hierarchy.
      Returns: parent of window
  */
  gdk.window.Window getParent()
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_parent(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether input to the window is passed through to the window
      below.
      
      See [gdk.window.Window.setPassThrough] for details
      Returns: 
  */
  bool getPassThrough()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_pass_through(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the current pointer position and modifier state.
      The position is given in coordinates relative to the upper left
      corner of window.
  
      Params:
        x = return location for X coordinate of pointer or null to not
               return the X coordinate
        y = return location for Y coordinate of pointer or null to not
               return the Y coordinate
        mask = return location for modifier mask or null to not return the
               modifier mask
      Returns: the window containing the
        pointer (as with [gdk.window.Window.atPointer]), or null if the window
        containing the pointer isn’t known to GDK
  
      Deprecated: Use [gdk.window.Window.getDevicePosition] instead.
  */
  gdk.window.Window getPointer(out int x, out int y, out gdk.types.ModifierType mask)
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_pointer(cast(GdkWindow*)this._cPtr, cast(int*)&x, cast(int*)&y, &mask);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the window as reported in the
      most-recently-processed #GdkEventConfigure. Contrast with
      [gdk.window.Window.getGeometry] which queries the X server for the
      current window position, regardless of which events have been
      received or processed.
      
      The position coordinates are relative to the window’s parent window.
  
      Params:
        x = X coordinate of window
        y = Y coordinate of window
  */
  void getPosition(out int x, out int y)
  {
    gdk_window_get_position(cast(GdkWindow*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Obtains the position of a window position in root
      window coordinates. This is similar to
      [gdk.window.Window.getOrigin] but allows you to pass
      in any position in the window, not just the origin.
  
      Params:
        x = X coordinate in window
        y = Y coordinate in window
        rootX = return location for X coordinate
        rootY = return location for Y coordinate
  */
  void getRootCoords(int x, int y, out int rootX, out int rootY)
  {
    gdk_window_get_root_coords(cast(GdkWindow*)this._cPtr, x, y, cast(int*)&rootX, cast(int*)&rootY);
  }

  /**
      Obtains the top-left corner of the window manager frame in root
      window coordinates.
  
      Params:
        x = return location for X position of window frame
        y = return location for Y position of window frame
  */
  void getRootOrigin(out int x, out int y)
  {
    gdk_window_get_root_origin(cast(GdkWindow*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Returns the internal scale factor that maps from window coordiantes
      to the actual device pixels. On traditional systems this is 1, but
      on very high density outputs this can be a higher value (often 2).
      
      A higher value means that drawing is automatically scaled up to
      a higher resolution, so any code doing drawing will automatically look
      nicer. However, if you are supplying pixel-based data the scale
      value can be used to determine whether to use a pixel resource
      with higher resolution data.
      
      The scale of a window may change during runtime, if this happens
      a configure event will be sent to the toplevel window.
      Returns: the scale factor
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gdk_window_get_scale_factor(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GdkScreen associated with a #GdkWindow.
      Returns: the #GdkScreen associated with window
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gdk_window_get_screen(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the event mask for window corresponding to the device class specified
      by source.
  
      Params:
        source = a #GdkInputSource to define the source class.
      Returns: source event mask for window
  */
  gdk.types.EventMask getSourceEvents(gdk.types.InputSource source)
  {
    GdkEventMask _cretval;
    _cretval = gdk_window_get_source_events(cast(GdkWindow*)this._cPtr, source);
    gdk.types.EventMask _retval = cast(gdk.types.EventMask)_cretval;
    return _retval;
  }

  /**
      Gets the bitwise OR of the currently active window state flags,
      from the #GdkWindowState enumeration.
      Returns: window state bitfield
  */
  gdk.types.WindowState getState()
  {
    GdkWindowState _cretval;
    _cretval = gdk_window_get_state(cast(GdkWindow*)this._cPtr);
    gdk.types.WindowState _retval = cast(gdk.types.WindowState)_cretval;
    return _retval;
  }

  /**
      Returns true if the window is aware of the existence of multiple
      devices.
      Returns: true if the window handles multidevice features.
  */
  bool getSupportMultidevice()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_get_support_multidevice(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the toplevel window that’s an ancestor of window.
      
      Any window type but [gdk.types.WindowType.Child] is considered a
      toplevel window, as is a [gdk.types.WindowType.Child] window that
      has a root window as parent.
      
      Note that you should use [gdk.window.Window.getEffectiveToplevel] when
      you want to get to a window’s toplevel as seen on screen, because
      [gdk.window.Window.getToplevel] will most likely not do what you expect
      if there are offscreen windows in the hierarchy.
      Returns: the toplevel window containing window
  */
  gdk.window.Window getToplevel()
  {
    GdkWindow* _cretval;
    _cretval = gdk_window_get_toplevel(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function returns the type hint set for a window.
      Returns: The type hint set for window
  */
  gdk.types.WindowTypeHint getTypeHint()
  {
    GdkWindowTypeHint _cretval;
    _cretval = gdk_window_get_type_hint(cast(GdkWindow*)this._cPtr);
    gdk.types.WindowTypeHint _retval = cast(gdk.types.WindowTypeHint)_cretval;
    return _retval;
  }

  /**
      Transfers ownership of the update area from window to the caller
      of the function. That is, after calling this function, window will
      no longer have an invalid/dirty region; the update area is removed
      from window and handed to you. If a window has no update area,
      [gdk.window.Window.getUpdateArea] returns null. You are responsible for
      calling [cairo.region.Region.destroy] on the returned region if it’s non-null.
      Returns: the update area for window
  */
  cairo.region.Region getUpdateArea()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_window_get_update_area(cast(GdkWindow*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the user data for window, which is normally the widget
      that window belongs to. See [gdk.window.Window.setUserData].
  
      Params:
        data = return location for user data
  */
  void getUserData(out void* data)
  {
    gdk_window_get_user_data(cast(GdkWindow*)this._cPtr, cast(void**)&data);
  }

  /**
      Computes the region of the window that is potentially visible.
      This does not necessarily take into account if the window is
      obscured by other windows, but no area outside of this region
      is visible.
      Returns: a #cairo_region_t. This must be freed with [cairo.region.Region.destroy]
                 when you are done.
  */
  cairo.region.Region getVisibleRegion()
  {
    cairo_region_t* _cretval;
    _cretval = gdk_window_get_visible_region(cast(GdkWindow*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the #GdkVisual describing the pixel format of window.
      Returns: a #GdkVisual
  */
  gdk.visual.Visual getVisual()
  {
    GdkVisual* _cretval;
    _cretval = gdk_window_get_visual(cast(GdkWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width of the given window.
      
      On the X11 platform the returned size is the size reported in the
      most-recently-processed configure event, rather than the current
      size on the X server.
      Returns: The width of window
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_window_get_width(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of the window. See #GdkWindowType.
      Returns: type of window
  */
  gdk.types.WindowType getWindowType()
  {
    GdkWindowType _cretval;
    _cretval = gdk_window_get_window_type(cast(GdkWindow*)this._cPtr);
    gdk.types.WindowType _retval = cast(gdk.types.WindowType)_cretval;
    return _retval;
  }

  /**
      Checks whether the window has a native window or not. Note that
      you can use [gdk.window.Window.ensureNative] if a native window is needed.
      Returns: true if the window has a native window, false otherwise.
  */
  bool hasNative()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_has_native(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      For toplevel windows, withdraws them, so they will no longer be
      known to the window manager; for all windows, unmaps them, so
      they won’t be displayed. Normally done automatically as
      part of [gtk.widget.Widget.hide].
  */
  void hide()
  {
    gdk_window_hide(cast(GdkWindow*)this._cPtr);
  }

  /**
      Asks to iconify (minimize) window. The window manager may choose
      to ignore the request, but normally will honor it. Using
      [gtk.window.Window.iconify] is preferred, if you have a #GtkWindow widget.
      
      This function only makes sense when window is a toplevel window.
  */
  void iconify()
  {
    gdk_window_iconify(cast(GdkWindow*)this._cPtr);
  }

  /**
      Like [gdk.window.Window.shapeCombineRegion], but the shape applies
      only to event handling. Mouse events which happen while
      the pointer position corresponds to an unset bit in the
      mask will be passed on the window below window.
      
      An input shape is typically used with RGBA windows.
      The alpha channel of the window defines which pixels are
      invisible and allows for nicely antialiased borders,
      and the input shape controls where the window is
      “clickable”.
      
      On the X11 platform, this requires version 1.1 of the
      shape extension.
      
      On the Win32 platform, this functionality is not present and the
      function does nothing.
  
      Params:
        shapeRegion = region of window to be non-transparent
        offsetX = X position of shape_region in window coordinates
        offsetY = Y position of shape_region in window coordinates
  */
  void inputShapeCombineRegion(cairo.region.Region shapeRegion, int offsetX, int offsetY)
  {
    gdk_window_input_shape_combine_region(cast(GdkWindow*)this._cPtr, shapeRegion ? cast(const(cairo_region_t)*)shapeRegion._cPtr(No.Dup) : null, offsetX, offsetY);
  }

  /**
      Adds region to the update area for window. The update area is the
      region that needs to be redrawn, or “dirty region.” The call
      [gdk.window.Window.processUpdates] sends one or more expose events to the
      window, which together cover the entire update area. An
      application would normally redraw the contents of window in
      response to those expose events.
      
      GDK will call [gdk.window.Window.processAllUpdates] on your behalf
      whenever your program returns to the main loop and becomes idle, so
      normally there’s no need to do that manually, you just need to
      invalidate regions that you know should be redrawn.
      
      The child_func parameter controls whether the region of
      each child window that intersects region will also be invalidated.
      Only children for which child_func returns #TRUE will have the area
      invalidated.
  
      Params:
        region = a #cairo_region_t
        childFunc = function to use to decide if to
              recurse to a child, null means never recurse.
  */
  void invalidateMaybeRecurse(cairo.region.Region region, gdk.types.WindowChildFunc childFunc = null)
  {
    extern(C) gboolean _childFuncCallback(GdkWindow* window, void* userData)
    {
      auto _dlg = cast(gdk.types.WindowChildFunc*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(void*)window, No.Take));
      return _retval;
    }
    auto _childFuncCB = childFunc ? &_childFuncCallback : null;

    auto _childFunc = childFunc ? cast(void*)&(childFunc) : null;
    gdk_window_invalidate_maybe_recurse(cast(GdkWindow*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null, _childFuncCB, _childFunc);
  }

  /**
      A convenience wrapper around [gdk.window.Window.invalidateRegion] which
      invalidates a rectangular region. See
      [gdk.window.Window.invalidateRegion] for details.
  
      Params:
        rect = rectangle to invalidate or null to invalidate the whole
               window
        invalidateChildren = whether to also invalidate child windows
  */
  void invalidateRect(gdk.rectangle.Rectangle rect, bool invalidateChildren)
  {
    gdk_window_invalidate_rect(cast(GdkWindow*)this._cPtr, rect ? cast(const(GdkRectangle)*)rect._cPtr(No.Dup) : null, invalidateChildren);
  }

  /**
      Adds region to the update area for window. The update area is the
      region that needs to be redrawn, or “dirty region.” The call
      [gdk.window.Window.processUpdates] sends one or more expose events to the
      window, which together cover the entire update area. An
      application would normally redraw the contents of window in
      response to those expose events.
      
      GDK will call [gdk.window.Window.processAllUpdates] on your behalf
      whenever your program returns to the main loop and becomes idle, so
      normally there’s no need to do that manually, you just need to
      invalidate regions that you know should be redrawn.
      
      The invalidate_children parameter controls whether the region of
      each child window that intersects region will also be invalidated.
      If false, then the update area for child windows will remain
      unaffected. See gdk_window_invalidate_maybe_recurse if you need
      fine grained control over which children are invalidated.
  
      Params:
        region = a #cairo_region_t
        invalidateChildren = true to also invalidate child windows
  */
  void invalidateRegion(cairo.region.Region region, bool invalidateChildren)
  {
    gdk_window_invalidate_region(cast(GdkWindow*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null, invalidateChildren);
  }

  /**
      Check to see if a window is destroyed..
      Returns: true if the window is destroyed
  */
  bool isDestroyed()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_is_destroyed(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether or not the window is an input only window.
      Returns: true if window is input only
  */
  bool isInputOnly()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_is_input_only(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether or not the window is shaped.
      Returns: true if window is shaped
  */
  bool isShaped()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_is_shaped(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Check if the window and all ancestors of the window are
      mapped. (This is not necessarily "viewable" in the X sense, since
      we only check as far as we have GDK window parents, not to the root
      window.)
      Returns: true if the window is viewable
  */
  bool isViewable()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_is_viewable(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the window has been mapped (with [gdk.window.Window.show] or
      [gdk.window.Window.showUnraised]).
      Returns: true if the window is mapped
  */
  bool isVisible()
  {
    bool _retval;
    _retval = cast(bool)gdk_window_is_visible(cast(GdkWindow*)this._cPtr);
    return _retval;
  }

  /**
      Lowers window to the bottom of the Z-order (stacking order), so that
      other windows with the same parent window appear above window.
      This is true whether or not the other windows are visible.
      
      If window is a toplevel, the window manager may choose to deny the
      request to move the window in the Z-order, [gdk.window.Window.lower] only
      requests the restack, does not guarantee it.
      
      Note that [gdk.window.Window.show] raises the window again, so don’t call this
      function before [gdk.window.Window.show]. (Try [gdk.window.Window.showUnraised].)
  */
  void lower()
  {
    gdk_window_lower(cast(GdkWindow*)this._cPtr);
  }

  /**
      If you call this during a paint (e.g. between [gdk.window.Window.beginPaintRegion]
      and [gdk.window.Window.endPaint] then GDK will mark the current clip region of the
      window as being drawn. This is required when mixing GL rendering via
      [gdk.global.cairoDrawFromGl] and cairo rendering, as otherwise GDK has no way
      of knowing when something paints over the GL-drawn regions.
      
      This is typically called automatically by GTK+ and you don't need
      to care about this.
  
      Params:
        cr = a #cairo_t
  */
  void markPaintFromClip(cairo.context.Context cr)
  {
    gdk_window_mark_paint_from_clip(cast(GdkWindow*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Maximizes the window. If the window was already maximized, then
      this function does nothing.
      
      On X11, asks the window manager to maximize window, if the window
      manager supports this operation. Not all window managers support
      this, and some deliberately ignore it or don’t have a concept of
      “maximized”; so you can’t rely on the maximization actually
      happening. But it will happen with most standard window managers,
      and GDK makes a best effort to get it to happen.
      
      On Windows, reliably maximizes the window.
  */
  void maximize()
  {
    gdk_window_maximize(cast(GdkWindow*)this._cPtr);
  }

  /**
      Merges the input shape masks for any child windows into the
      input shape mask for window. i.e. the union of all input masks
      for window and its children will become the new input mask
      for window. See [gdk.window.Window.inputShapeCombineRegion].
      
      This function is distinct from [gdk.window.Window.setChildInputShapes]
      because it includes window’s input shape mask in the set of
      shapes to be merged.
  */
  void mergeChildInputShapes()
  {
    gdk_window_merge_child_input_shapes(cast(GdkWindow*)this._cPtr);
  }

  /**
      Merges the shape masks for any child windows into the
      shape mask for window. i.e. the union of all masks
      for window and its children will become the new mask
      for window. See [gdk.window.Window.shapeCombineRegion].
      
      This function is distinct from [gdk.window.Window.setChildShapes]
      because it includes window’s shape mask in the set of shapes to
      be merged.
  */
  void mergeChildShapes()
  {
    gdk_window_merge_child_shapes(cast(GdkWindow*)this._cPtr);
  }

  /**
      Repositions a window relative to its parent window.
      For toplevel windows, window managers may ignore or modify the move;
      you should probably use [gtk.window.Window.move] on a #GtkWindow widget
      anyway, instead of using GDK functions. For child windows,
      the move will reliably succeed.
      
      If you’re also planning to resize the window, use [gdk.window.Window.moveResize]
      to both move and resize simultaneously, for a nicer visual effect.
  
      Params:
        x = X coordinate relative to window’s parent
        y = Y coordinate relative to window’s parent
  */
  void move(int x, int y)
  {
    gdk_window_move(cast(GdkWindow*)this._cPtr, x, y);
  }

  /**
      Move the part of window indicated by region by dy pixels in the Y
      direction and dx pixels in the X direction. The portions of region
      that not covered by the new position of region are invalidated.
      
      Child windows are not moved.
  
      Params:
        region = The #cairo_region_t to move
        dx = Amount to move in the X direction
        dy = Amount to move in the Y direction
  */
  void moveRegion(cairo.region.Region region, int dx, int dy)
  {
    gdk_window_move_region(cast(GdkWindow*)this._cPtr, region ? cast(const(cairo_region_t)*)region._cPtr(No.Dup) : null, dx, dy);
  }

  /**
      Equivalent to calling [gdk.window.Window.move] and [gdk.window.Window.resize],
      except that both operations are performed at once, avoiding strange
      visual effects. (i.e. the user may be able to see the window first
      move, then resize, if you don’t use [gdk.window.Window.moveResize].)
  
      Params:
        x = new X position relative to window’s parent
        y = new Y position relative to window’s parent
        width = new width
        height = new height
  */
  void moveResize(int x, int y, int width, int height)
  {
    gdk_window_move_resize(cast(GdkWindow*)this._cPtr, x, y, width, height);
  }

  /**
      Moves window to rect, aligning their anchor points.
      
      rect is relative to the top-left corner of the window that window is
      transient for. rect_anchor and window_anchor determine anchor points on
      rect and window to pin together. rect's anchor point can optionally be
      offset by rect_anchor_dx and rect_anchor_dy, which is equivalent to
      offsetting the position of window.
      
      anchor_hints determines how window will be moved if the anchor points cause
      it to move off-screen. For example, [gdk.types.AnchorHints.FlipX] will replace
      [gdk.types.Gravity.NorthWest] with [gdk.types.Gravity.NorthEast] and vice versa if
      window extends beyond the left or right edges of the monitor.
      
      Connect to the #GdkWindow::moved-to-rect signal to find out how it was
      actually positioned.
  
      Params:
        rect = the destination #GdkRectangle to align window with
        rectAnchor = the point on rect to align with window's anchor point
        windowAnchor = the point on window to align with rect's anchor point
        anchorHints = positioning hints to use when limited on space
        rectAnchorDx = horizontal offset to shift window, i.e. rect's anchor
                           point
        rectAnchorDy = vertical offset to shift window, i.e. rect's anchor point
  */
  void moveToRect(gdk.rectangle.Rectangle rect, gdk.types.Gravity rectAnchor, gdk.types.Gravity windowAnchor, gdk.types.AnchorHints anchorHints, int rectAnchorDx, int rectAnchorDy)
  {
    gdk_window_move_to_rect(cast(GdkWindow*)this._cPtr, rect ? cast(const(GdkRectangle)*)rect._cPtr(No.Dup) : null, rectAnchor, windowAnchor, anchorHints, rectAnchorDx, rectAnchorDy);
  }

  /**
      Like [gdk.window.Window.getChildren], but does not copy the list of
      children, so the list does not need to be freed.
      Returns: a reference to the list of child windows in window
  */
  gdk.window.Window[] peekChildren()
  {
    GList* _cretval;
    _cretval = gdk_window_peek_children(cast(GdkWindow*)this._cPtr);
    auto _retval = gListToD!(gdk.window.Window, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Sends one or more expose events to window. The areas in each
      expose event will cover the entire update area for the window (see
      [gdk.window.Window.invalidateRegion] for details). Normally GDK calls
      [gdk.window.Window.processAllUpdates] on your behalf, so there’s no
      need to call this function unless you want to force expose events
      to be delivered immediately and synchronously (vs. the usual
      case, where GDK delivers them in an idle handler). Occasionally
      this is useful to produce nicer scrolling behavior, for example.
  
      Params:
        updateChildren = whether to also process updates for child windows
  */
  void processUpdates(bool updateChildren)
  {
    gdk_window_process_updates(cast(GdkWindow*)this._cPtr, updateChildren);
  }

  /**
      Raises window to the top of the Z-order (stacking order), so that
      other windows with the same parent window appear below window.
      This is true whether or not the windows are visible.
      
      If window is a toplevel, the window manager may choose to deny the
      request to move the window in the Z-order, [gdk.window.Window.raise] only
      requests the restack, does not guarantee it.
  */
  void raise()
  {
    gdk_window_raise(cast(GdkWindow*)this._cPtr);
  }

  /**
      Registers a window as a potential drop destination.
  */
  void registerDnd()
  {
    gdk_window_register_dnd(cast(GdkWindow*)this._cPtr);
  }

  /**
      Reparents window into the given new_parent. The window being
      reparented will be unmapped as a side effect.
  
      Params:
        newParent = new parent to move window into
        x = X location inside the new parent
        y = Y location inside the new parent
  */
  void reparent(gdk.window.Window newParent, int x, int y)
  {
    gdk_window_reparent(cast(GdkWindow*)this._cPtr, newParent ? cast(GdkWindow*)newParent._cPtr(No.Dup) : null, x, y);
  }

  /**
      Resizes window; for toplevel windows, asks the window manager to resize
      the window. The window manager may not allow the resize. When using GTK+,
      use [gtk.window.Window.resize] instead of this low-level GDK function.
      
      Windows may not be resized below 1x1.
      
      If you’re also planning to move the window, use [gdk.window.Window.moveResize]
      to both move and resize simultaneously, for a nicer visual effect.
  
      Params:
        width = new width of the window
        height = new height of the window
  */
  void resize(int width, int height)
  {
    gdk_window_resize(cast(GdkWindow*)this._cPtr, width, height);
  }

  /**
      Changes the position of  window in the Z-order (stacking order), so that
      it is above sibling (if above is true) or below sibling (if above is
      false).
      
      If sibling is null, then this either raises (if above is true) or
      lowers the window.
      
      If window is a toplevel, the window manager may choose to deny the
      request to move the window in the Z-order, [gdk.window.Window.restack] only
      requests the restack, does not guarantee it.
  
      Params:
        sibling = a #GdkWindow that is a sibling of window, or null
        above = a boolean
  */
  void restack(gdk.window.Window sibling, bool above)
  {
    gdk_window_restack(cast(GdkWindow*)this._cPtr, sibling ? cast(GdkWindow*)sibling._cPtr(No.Dup) : null, above);
  }

  /**
      Scroll the contents of window, both pixels and children, by the
      given amount. window itself does not move. Portions of the window
      that the scroll operation brings in from offscreen areas are
      invalidated. The invalidated region may be bigger than what would
      strictly be necessary.
      
      For X11, a minimum area will be invalidated if the window has no
      subwindows, or if the edges of the window’s parent do not extend
      beyond the edges of the window. In other cases, a multi-step process
      is used to scroll the window which may produce temporary visual
      artifacts and unnecessary invalidations.
  
      Params:
        dx = Amount to scroll in the X direction
        dy = Amount to scroll in the Y direction
  */
  void scroll(int dx, int dy)
  {
    gdk_window_scroll(cast(GdkWindow*)this._cPtr, dx, dy);
  }

  /**
      Setting accept_focus to false hints the desktop environment that the
      window doesn’t want to receive input focus.
      
      On X, it is the responsibility of the window manager to interpret this
      hint. ICCCM-compliant window manager usually respect it.
  
      Params:
        acceptFocus = true if the window should receive input focus
  */
  void setAcceptFocus(bool acceptFocus)
  {
    gdk_window_set_accept_focus(cast(GdkWindow*)this._cPtr, acceptFocus);
  }

  /**
      Sets the background color of window.
      
      However, when using GTK+, influence the background of a widget
      using a style class or CSS — if you’re an application — or with
      [gtk.style_context.StyleContext.setBackground] — if you're implementing a
      custom widget.
  
      Params:
        color = a #GdkColor
  
      Deprecated: Don't use this function
  */
  void setBackground(gdk.color.Color color)
  {
    gdk_window_set_background(cast(GdkWindow*)this._cPtr, color ? cast(const(GdkColor)*)color._cPtr(No.Dup) : null);
  }

  /**
      Sets the background of window.
      
      A background of null means that the window won't have any background. On the
      X11 backend it's also possible to inherit the background from the parent
      window using gdk_x11_get_parent_relative_pattern().
      
      The windowing system will normally fill a window with its background
      when the window is obscured then exposed.
  
      Params:
        pattern = a pattern to use, or null
  
      Deprecated: Don't use this function
  */
  void setBackgroundPattern(cairo.pattern.Pattern pattern = null)
  {
    gdk_window_set_background_pattern(cast(GdkWindow*)this._cPtr, pattern ? cast(cairo_pattern_t*)pattern._cPtr(No.Dup) : null);
  }

  /**
      Sets the background color of window.
      
      See also [gdk.window.Window.setBackgroundPattern].
  
      Params:
        rgba = a #GdkRGBA color
  
      Deprecated: Don't use this function
  */
  void setBackgroundRgba(gdk.rgba.RGBA rgba)
  {
    gdk_window_set_background_rgba(cast(GdkWindow*)this._cPtr, rgba ? cast(const(GdkRGBA)*)rgba._cPtr(No.Dup) : null);
  }

  /**
      Sets the input shape mask of window to the union of input shape masks
      for all children of window, ignoring the input shape mask of window
      itself. Contrast with [gdk.window.Window.mergeChildInputShapes] which includes
      the input shape mask of window in the masks to be merged.
  */
  void setChildInputShapes()
  {
    gdk_window_set_child_input_shapes(cast(GdkWindow*)this._cPtr);
  }

  /**
      Sets the shape mask of window to the union of shape masks
      for all children of window, ignoring the shape mask of window
      itself. Contrast with [gdk.window.Window.mergeChildShapes] which includes
      the shape mask of window in the masks to be merged.
  */
  void setChildShapes()
  {
    gdk_window_set_child_shapes(cast(GdkWindow*)this._cPtr);
  }

  /**
      Sets a #GdkWindow as composited, or unsets it. Composited
      windows do not automatically have their contents drawn to
      the screen. Drawing is redirected to an offscreen buffer
      and an expose event is emitted on the parent of the composited
      window. It is the responsibility of the parent’s expose handler
      to manually merge the off-screen content onto the screen in
      whatever way it sees fit.
      
      It only makes sense for child windows to be composited; see
      [gdk.window.Window.setOpacity] if you need translucent toplevel
      windows.
      
      An additional effect of this call is that the area of this
      window is no longer clipped from regions marked for
      invalidation on its parent. Draws done on the parent
      window are also no longer clipped by the child.
      
      This call is only supported on some systems (currently,
      only X11 with new enough Xcomposite and Xdamage extensions).
      You must call [gdk.display.Display.supportsComposite] to check if
      setting a window as composited is supported before
      attempting to do so.
  
      Params:
        composited = true to set the window as composited
  
      Deprecated: Compositing is an outdated technology that
          only ever worked on X11.
  */
  void setComposited(bool composited)
  {
    gdk_window_set_composited(cast(GdkWindow*)this._cPtr, composited);
  }

  /**
      Sets the default mouse pointer for a #GdkWindow.
      
      Note that cursor must be for the same display as window.
      
      Use [gdk.cursor.Cursor.newForDisplay] or [gdk.cursor.Cursor.newFromPixbuf] to
      create the cursor. To make the cursor invisible, use [gdk.types.CursorType.BlankCursor].
      Passing null for the cursor argument to [gdk.window.Window.setCursor] means
      that window will use the cursor of its parent window. Most windows
      should use this default.
  
      Params:
        cursor = a cursor
  */
  void setCursor(gdk.cursor.Cursor cursor = null)
  {
    gdk_window_set_cursor(cast(GdkWindow*)this._cPtr, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      “Decorations” are the features the window manager adds to a toplevel #GdkWindow.
      This function sets the traditional Motif window manager hints that tell the
      window manager which decorations you would like your window to have.
      Usually you should use [gtk.window.Window.setDecorated] on a #GtkWindow instead of
      using the GDK function directly.
      
      The decorations argument is the logical OR of the fields in
      the #GdkWMDecoration enumeration. If #GDK_DECOR_ALL is included in the
      mask, the other bits indicate which decorations should be turned off.
      If #GDK_DECOR_ALL is not included, then the other bits indicate
      which decorations should be turned on.
      
      Most window managers honor a decorations hint of 0 to disable all decorations,
      but very few honor all possible combinations of bits.
  
      Params:
        decorations = decoration hint mask
  */
  void setDecorations(gdk.types.WMDecoration decorations)
  {
    gdk_window_set_decorations(cast(GdkWindow*)this._cPtr, decorations);
  }

  /**
      Sets a specific #GdkCursor for a given device when it gets inside window.
      Use [gdk.cursor.Cursor.newForDisplay] or [gdk.cursor.Cursor.newFromPixbuf] to create
      the cursor. To make the cursor invisible, use [gdk.types.CursorType.BlankCursor]. Passing
      null for the cursor argument to [gdk.window.Window.setCursor] means that
      window will use the cursor of its parent window. Most windows should
      use this default.
  
      Params:
        device = a master, pointer #GdkDevice
        cursor = a #GdkCursor
  */
  void setDeviceCursor(gdk.device.Device device, gdk.cursor.Cursor cursor)
  {
    gdk_window_set_device_cursor(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Sets the event mask for a given device (Normally a floating device, not
      attached to any visible pointer) to window. For example, an event mask
      including #GDK_BUTTON_PRESS_MASK means the window should report button
      press events. The event mask is the bitwise OR of values from the
      #GdkEventMask enumeration.
      
      See the [input handling overview][event-masks] for details.
  
      Params:
        device = #GdkDevice to enable events for.
        eventMask = event mask for window
  */
  void setDeviceEvents(gdk.device.Device device, gdk.types.EventMask eventMask)
  {
    gdk_window_set_device_events(cast(GdkWindow*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, eventMask);
  }

  /**
      Determines whether or not extra unprocessed motion events in
      the event queue can be discarded. If true only the most recent
      event will be delivered.
      
      Some types of applications, e.g. paint programs, need to see all
      motion events and will benefit from turning off event compression.
      
      By default, event compression is enabled.
  
      Params:
        eventCompression = true if motion events should be compressed
  */
  void setEventCompression(bool eventCompression)
  {
    gdk_window_set_event_compression(cast(GdkWindow*)this._cPtr, eventCompression);
  }

  /**
      The event mask for a window determines which events will be reported
      for that window from all master input devices. For example, an event mask
      including #GDK_BUTTON_PRESS_MASK means the window should report button
      press events. The event mask is the bitwise OR of values from the
      #GdkEventMask enumeration.
      
      See the [input handling overview][event-masks] for details.
  
      Params:
        eventMask = event mask for window
  */
  void setEvents(gdk.types.EventMask eventMask)
  {
    gdk_window_set_events(cast(GdkWindow*)this._cPtr, eventMask);
  }

  /**
      Setting focus_on_map to false hints the desktop environment that the
      window doesn’t want to receive input focus when it is mapped.
      focus_on_map should be turned off for windows that aren’t triggered
      interactively (such as popups from network activity).
      
      On X, it is the responsibility of the window manager to interpret
      this hint. Window managers following the freedesktop.org window
      manager extension specification should respect it.
  
      Params:
        focusOnMap = true if the window should receive input focus when mapped
  */
  void setFocusOnMap(bool focusOnMap)
  {
    gdk_window_set_focus_on_map(cast(GdkWindow*)this._cPtr, focusOnMap);
  }

  /**
      Specifies whether the window should span over all monitors (in a multi-head
      setup) or only the current monitor when in fullscreen mode.
      
      The mode argument is from the #GdkFullscreenMode enumeration.
      If #GDK_FULLSCREEN_ON_ALL_MONITORS is specified, the fullscreen window will
      span over all monitors from the #GdkScreen.
      
      On X11, searches through the list of monitors from the #GdkScreen the ones
      which delimit the 4 edges of the entire #GdkScreen and will ask the window
      manager to span the window over these monitors.
      
      If the XINERAMA extension is not available or not usable, this function
      has no effect.
      
      Not all window managers support this, so you can’t rely on the fullscreen
      window to span over the multiple monitors when #GDK_FULLSCREEN_ON_ALL_MONITORS
      is specified.
  
      Params:
        mode = fullscreen mode
  */
  void setFullscreenMode(gdk.types.FullscreenMode mode)
  {
    gdk_window_set_fullscreen_mode(cast(GdkWindow*)this._cPtr, mode);
  }

  /**
      Sets hints about the window management functions to make available
      via buttons on the window frame.
      
      On the X backend, this function sets the traditional Motif window
      manager hint for this purpose. However, few window managers do
      anything reliable or interesting with this hint. Many ignore it
      entirely.
      
      The functions argument is the logical OR of values from the
      #GdkWMFunction enumeration. If the bitmask includes #GDK_FUNC_ALL,
      then the other bits indicate which functions to disable; if
      it doesn’t include #GDK_FUNC_ALL, it indicates which functions to
      enable.
  
      Params:
        functions = bitmask of operations to allow on window
  */
  void setFunctions(gdk.types.WMFunction functions)
  {
    gdk_window_set_functions(cast(GdkWindow*)this._cPtr, functions);
  }

  /**
      Sets the geometry hints for window. Hints flagged in geom_mask
      are set, hints not flagged in geom_mask are unset.
      To unset all hints, use a geom_mask of 0 and a geometry of null.
      
      This function provides hints to the windowing system about
      acceptable sizes for a toplevel window. The purpose of
      this is to constrain user resizing, but the windowing system
      will typically  (but is not required to) also constrain the
      current size of the window to the provided values and
      constrain programatic resizing via [gdk.window.Window.resize] or
      [gdk.window.Window.moveResize].
      
      Note that on X11, this effect has no effect on windows
      of type [gdk.types.WindowType.Temp] or windows where override redirect
      has been turned on via [gdk.window.Window.setOverrideRedirect]
      since these windows are not resizable by the user.
      
      Since you can’t count on the windowing system doing the
      constraints for programmatic resizes, you should generally
      call [gdk.window.Window.constrainSize] yourself to determine
      appropriate sizes.
  
      Params:
        geometry = geometry hints
        geomMask = bitmask indicating fields of geometry to pay attention to
  */
  void setGeometryHints(gdk.types.Geometry geometry, gdk.types.WindowHints geomMask)
  {
    gdk_window_set_geometry_hints(cast(GdkWindow*)this._cPtr, &geometry, geomMask);
  }

  /**
      Sets the group leader window for window. By default,
      GDK sets the group leader for all toplevel windows
      to a global window implicitly created by GDK. With this function
      you can override this default.
      
      The group leader window allows the window manager to distinguish
      all windows that belong to a single application. It may for example
      allow users to minimize/unminimize all windows belonging to an
      application at once. You should only set a non-default group window
      if your application pretends to be multiple applications.
  
      Params:
        leader = group leader window, or null to restore the default group leader window
  */
  void setGroup(gdk.window.Window leader = null)
  {
    gdk_window_set_group(cast(GdkWindow*)this._cPtr, leader ? cast(GdkWindow*)leader._cPtr(No.Dup) : null);
  }

  /**
      Sets a list of icons for the window. One of these will be used
      to represent the window when it has been iconified. The icon is
      usually shown in an icon box or some sort of task bar. Which icon
      size is shown depends on the window manager. The window manager
      can scale the icon  but setting several size icons can give better
      image quality since the window manager may only need to scale the
      icon by a small amount or not at all.
      
      Note that some platforms don't support window icons.
  
      Params:
        pixbufs = A list of pixbufs, of different sizes.
  */
  void setIconList(gdkpixbuf.pixbuf.Pixbuf[] pixbufs)
  {
    auto _pixbufs = gListFromD!(gdkpixbuf.pixbuf.Pixbuf)(pixbufs);
    scope(exit) containerFree!(GList*, gdkpixbuf.pixbuf.Pixbuf, GidOwnership.None)(_pixbufs);
    gdk_window_set_icon_list(cast(GdkWindow*)this._cPtr, _pixbufs);
  }

  /**
      Windows may have a name used while minimized, distinct from the
      name they display in their titlebar. Most of the time this is a bad
      idea from a user interface standpoint. But you can set such a name
      with this function, if you like.
      
      After calling this with a non-null name, calls to [gdk.window.Window.setTitle]
      will not update the icon title.
      
      Using null for name unsets the icon title; further calls to
      [gdk.window.Window.setTitle] will again update the icon title as well.
      
      Note that some platforms don't support window icons.
  
      Params:
        name = name of window while iconified (minimized)
  */
  void setIconName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gdk_window_set_icon_name(cast(GdkWindow*)this._cPtr, _name);
  }

  /**
      Set if window must be kept above other windows. If the
      window was already above, then this function does nothing.
      
      On X11, asks the window manager to keep window above, if the window
      manager supports this operation. Not all window managers support
      this, and some deliberately ignore it or don’t have a concept of
      “keep above”; so you can’t rely on the window being kept above.
      But it will happen with most standard window managers,
      and GDK makes a best effort to get it to happen.
  
      Params:
        setting = whether to keep window above other windows
  */
  void setKeepAbove(bool setting)
  {
    gdk_window_set_keep_above(cast(GdkWindow*)this._cPtr, setting);
  }

  /**
      Set if window must be kept below other windows. If the
      window was already below, then this function does nothing.
      
      On X11, asks the window manager to keep window below, if the window
      manager supports this operation. Not all window managers support
      this, and some deliberately ignore it or don’t have a concept of
      “keep below”; so you can’t rely on the window being kept below.
      But it will happen with most standard window managers,
      and GDK makes a best effort to get it to happen.
  
      Params:
        setting = whether to keep window below other windows
  */
  void setKeepBelow(bool setting)
  {
    gdk_window_set_keep_below(cast(GdkWindow*)this._cPtr, setting);
  }

  /**
      The application can use this hint to tell the window manager
      that a certain window has modal behaviour. The window manager
      can use this information to handle modal windows in a special
      way.
      
      You should only use this on windows for which you have
      previously called [gdk.window.Window.setTransientFor]
  
      Params:
        modal = true if the window is modal, false otherwise.
  */
  void setModalHint(bool modal)
  {
    gdk_window_set_modal_hint(cast(GdkWindow*)this._cPtr, modal);
  }

  /**
      Set window to render as partially transparent,
      with opacity 0 being fully transparent and 1 fully opaque. (Values
      of the opacity parameter are clamped to the [0,1] range.)
      
      For toplevel windows this depends on support from the windowing system
      that may not always be there. For instance, On X11, this works only on
      X screens with a compositing manager running. On Wayland, there is no
      per-window opacity value that the compositor would apply. Instead, use
      `gdk_window_set_opaque_region (window, NULL)` to tell the compositor
      that the entire window is (potentially) non-opaque, and draw your content
      with alpha, or use [gtk.widget.Widget.setOpacity] to set an overall opacity
      for your widgets.
      
      For child windows this function only works for non-native windows.
      
      For setting up per-pixel alpha topelevels, see [gdk.screen.Screen.getRgbaVisual],
      and for non-toplevels, see [gdk.window.Window.setComposited].
      
      Support for non-toplevel windows was added in 3.8.
  
      Params:
        opacity = opacity
  */
  void setOpacity(double opacity)
  {
    gdk_window_set_opacity(cast(GdkWindow*)this._cPtr, opacity);
  }

  /**
      For optimisation purposes, compositing window managers may
      like to not draw obscured regions of windows, or turn off blending
      during for these regions. With RGB windows with no transparency,
      this is just the shape of the window, but with ARGB32 windows, the
      compositor does not know what regions of the window are transparent
      or not.
      
      This function only works for toplevel windows.
      
      GTK+ will update this property automatically if
      the window background is opaque, as we know where the opaque regions
      are. If your window background is not opaque, please update this
      property in your #GtkWidget::style-updated handler.
  
      Params:
        region = a region, or null
  */
  void setOpaqueRegion(cairo.region.Region region = null)
  {
    gdk_window_set_opaque_region(cast(GdkWindow*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      An override redirect window is not under the control of the window manager.
      This means it won’t have a titlebar, won’t be minimizable, etc. - it will
      be entirely under the control of the application. The window manager
      can’t see the override redirect window at all.
      
      Override redirect should only be used for short-lived temporary
      windows, such as popup menus. #GtkMenu uses an override redirect
      window in its implementation, for example.
  
      Params:
        overrideRedirect = true if window should be override redirect
  */
  void setOverrideRedirect(bool overrideRedirect)
  {
    gdk_window_set_override_redirect(cast(GdkWindow*)this._cPtr, overrideRedirect);
  }

  /**
      Sets whether input to the window is passed through to the window
      below.
      
      The default value of this is false, which means that pointer
      events that happen inside the window are send first to the window,
      but if the event is not selected by the event mask then the event
      is sent to the parent window, and so on up the hierarchy.
      
      If pass_through is true then such pointer events happen as if the
      window wasn't there at all, and thus will be sent first to any
      windows below window. This is useful if the window is used in a
      transparent fashion. In the terminology of the web this would be called
      "pointer-events: none".
      
      Note that a window with pass_through true can still have a subwindow
      without pass through, so you can get events on a subset of a window. And in
      that cases you would get the in-between related events such as the pointer
      enter/leave events on its way to the destination window.
  
      Params:
        passThrough = a boolean
  */
  void setPassThrough(bool passThrough)
  {
    gdk_window_set_pass_through(cast(GdkWindow*)this._cPtr, passThrough);
  }

  /**
      When using GTK+, typically you should use [gtk.window.Window.setRole] instead
      of this low-level function.
      
      The window manager and session manager use a window’s role to
      distinguish it from other kinds of window in the same application.
      When an application is restarted after being saved in a previous
      session, all windows with the same title and role are treated as
      interchangeable.  So if you have two windows with the same title
      that should be distinguished for session management purposes, you
      should set the role on those windows. It doesn’t matter what string
      you use for the role, as long as you have a different role for each
      non-interchangeable kind of window.
  
      Params:
        role = a string indicating its role
  */
  void setRole(string role)
  {
    const(char)* _role = role.toCString(No.Alloc);
    gdk_window_set_role(cast(GdkWindow*)this._cPtr, _role);
  }

  /**
      Newer GTK+ windows using client-side decorations use extra geometry
      around their frames for effects like shadows and invisible borders.
      Window managers that want to maximize windows or snap to edges need
      to know where the extents of the actual frame lie, so that users
      don’t feel like windows are snapping against random invisible edges.
      
      Note that this property is automatically updated by GTK+, so this
      function should only be used by applications which do not use GTK+
      to create toplevel windows.
  
      Params:
        left = The left extent
        right = The right extent
        top = The top extent
        bottom = The bottom extent
  */
  void setShadowWidth(int left, int right, int top, int bottom)
  {
    gdk_window_set_shadow_width(cast(GdkWindow*)this._cPtr, left, right, top, bottom);
  }

  /**
      Toggles whether a window should appear in a pager (workspace
      switcher, or other desktop utility program that displays a small
      thumbnail representation of the windows on the desktop). If a
      window’s semantic type as specified with [gdk.window.Window.setTypeHint]
      already fully describes the window, this function should
      not be called in addition, instead you should
      allow the window to be treated according to standard policy for
      its semantic type.
  
      Params:
        skipsPager = true to skip the pager
  */
  void setSkipPagerHint(bool skipsPager)
  {
    gdk_window_set_skip_pager_hint(cast(GdkWindow*)this._cPtr, skipsPager);
  }

  /**
      Toggles whether a window should appear in a task list or window
      list. If a window’s semantic type as specified with
      [gdk.window.Window.setTypeHint] already fully describes the window, this
      function should not be called in addition,
      instead you should allow the window to be treated according to
      standard policy for its semantic type.
  
      Params:
        skipsTaskbar = true to skip the taskbar
  */
  void setSkipTaskbarHint(bool skipsTaskbar)
  {
    gdk_window_set_skip_taskbar_hint(cast(GdkWindow*)this._cPtr, skipsTaskbar);
  }

  /**
      Sets the event mask for any floating device (i.e. not attached to any
      visible pointer) that has the source defined as source. This event
      mask will be applied both to currently existing, newly added devices
      after this call, and devices being attached/detached.
  
      Params:
        source = a #GdkInputSource to define the source class.
        eventMask = event mask for window
  */
  void setSourceEvents(gdk.types.InputSource source, gdk.types.EventMask eventMask)
  {
    gdk_window_set_source_events(cast(GdkWindow*)this._cPtr, source, eventMask);
  }

  /**
      When using GTK+, typically you should use [gtk.window.Window.setStartupId]
      instead of this low-level function.
  
      Params:
        startupId = a string with startup-notification identifier
  */
  void setStartupId(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.Alloc);
    gdk_window_set_startup_id(cast(GdkWindow*)this._cPtr, _startupId);
  }

  /**
      Used to set the bit gravity of the given window to static, and flag
      it so all children get static subwindow gravity. This is used if you
      are implementing scary features that involve deep knowledge of the
      windowing system. Don’t worry about it.
  
      Params:
        useStatic = true to turn on static gravity
      Returns: false
  
      Deprecated: static gravities haven't worked on anything but X11
          for a long time.
  */
  bool setStaticGravities(bool useStatic)
  {
    bool _retval;
    _retval = cast(bool)gdk_window_set_static_gravities(cast(GdkWindow*)this._cPtr, useStatic);
    return _retval;
  }

  /**
      This function will enable multidevice features in window.
      
      Multidevice aware windows will need to handle properly multiple,
      per device enter/leave events, device grabs and grab ownerships.
  
      Params:
        supportMultidevice = true to enable multidevice support in window.
  */
  void setSupportMultidevice(bool supportMultidevice)
  {
    gdk_window_set_support_multidevice(cast(GdkWindow*)this._cPtr, supportMultidevice);
  }

  /**
      Sets the title of a toplevel window, to be displayed in the titlebar.
      If you haven’t explicitly set the icon name for the window
      (using [gdk.window.Window.setIconName]), the icon name will be set to
      title as well. title must be in UTF-8 encoding (as with all
      user-readable strings in GDK/GTK+). title may not be null.
  
      Params:
        title = title of window
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gdk_window_set_title(cast(GdkWindow*)this._cPtr, _title);
  }

  /**
      Indicates to the window manager that window is a transient dialog
      associated with the application window parent. This allows the
      window manager to do things like center window on parent and
      keep window above parent.
      
      See [gtk.window.Window.setTransientFor] if you’re using #GtkWindow or
      #GtkDialog.
  
      Params:
        parent = another toplevel #GdkWindow
  */
  void setTransientFor(gdk.window.Window parent)
  {
    gdk_window_set_transient_for(cast(GdkWindow*)this._cPtr, parent ? cast(GdkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      The application can use this call to provide a hint to the window
      manager about the functionality of a window. The window manager
      can use this information when determining the decoration and behaviour
      of the window.
      
      The hint must be set before the window is mapped.
  
      Params:
        hint = A hint of the function this window will have
  */
  void setTypeHint(gdk.types.WindowTypeHint hint)
  {
    gdk_window_set_type_hint(cast(GdkWindow*)this._cPtr, hint);
  }

  /**
      Toggles whether a window needs the user's
      urgent attention.
  
      Params:
        urgent = true if the window is urgent
  */
  void setUrgencyHint(bool urgent)
  {
    gdk_window_set_urgency_hint(cast(GdkWindow*)this._cPtr, urgent);
  }

  /**
      For most purposes this function is deprecated in favor of
      [gobject.object.ObjectWrap.setData]. However, for historical reasons GTK+ stores
      the #GtkWidget that owns a #GdkWindow as user data on the
      #GdkWindow. So, custom widget implementations should use
      this function for that. If GTK+ receives an event for a #GdkWindow,
      and the user data for the window is non-null, GTK+ will assume the
      user data is a #GtkWidget, and forward the event to that widget.
  
      Params:
        userData = user data
  */
  void setUserData(gobject.object.ObjectWrap userData = null)
  {
    gdk_window_set_user_data(cast(GdkWindow*)this._cPtr, userData ? cast(GObject*)userData._cPtr(No.Dup) : null);
  }

  /**
      Makes pixels in window outside shape_region be transparent,
      so that the window may be nonrectangular.
      
      If shape_region is null, the shape will be unset, so the whole
      window will be opaque again. offset_x and offset_y are ignored
      if shape_region is null.
      
      On the X11 platform, this uses an X server extension which is
      widely available on most common platforms, but not available on
      very old X servers, and occasionally the implementation will be
      buggy. On servers without the shape extension, this function
      will do nothing.
      
      This function works on both toplevel and child windows.
  
      Params:
        shapeRegion = region of window to be non-transparent
        offsetX = X position of shape_region in window coordinates
        offsetY = Y position of shape_region in window coordinates
  */
  void shapeCombineRegion(cairo.region.Region shapeRegion, int offsetX, int offsetY)
  {
    gdk_window_shape_combine_region(cast(GdkWindow*)this._cPtr, shapeRegion ? cast(const(cairo_region_t)*)shapeRegion._cPtr(No.Dup) : null, offsetX, offsetY);
  }

  /**
      Like [gdk.window.Window.showUnraised], but also raises the window to the
      top of the window stack (moves the window to the front of the
      Z-order).
      
      This function maps a window so it’s visible onscreen. Its opposite
      is [gdk.window.Window.hide].
      
      When implementing a #GtkWidget, you should call this function on the widget's
      #GdkWindow as part of the “map” method.
  */
  void show()
  {
    gdk_window_show(cast(GdkWindow*)this._cPtr);
  }

  /**
      Shows a #GdkWindow onscreen, but does not modify its stacking
      order. In contrast, [gdk.window.Window.show] will raise the window
      to the top of the window stack.
      
      On the X11 platform, in Xlib terms, this function calls
      XMapWindow() (it also updates some internal GDK state, which means
      that you can’t really use XMapWindow() directly on a GDK window).
  */
  void showUnraised()
  {
    gdk_window_show_unraised(cast(GdkWindow*)this._cPtr);
  }

  /**
      Asks the windowing system to show the window menu. The window menu
      is the menu shown when right-clicking the titlebar on traditional
      windows managed by the window manager. This is useful for windows
      using client-side decorations, activating it with a right-click
      on the window decorations.
  
      Params:
        event = a #GdkEvent to show the menu for
      Returns: true if the window menu was shown and false otherwise.
  */
  bool showWindowMenu(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gdk_window_show_window_menu(cast(GdkWindow*)this._cPtr, event ? cast(GdkEvent*)event._cPtr : null);
    return _retval;
  }

  /**
      “Pins” a window such that it’s on all workspaces and does not scroll
      with viewports, for window managers that have scrollable viewports.
      (When using #GtkWindow, [gtk.window.Window.stick] may be more useful.)
      
      On the X11 platform, this function depends on window manager
      support, so may have no effect with many window managers. However,
      GDK will do the best it can to convince the window manager to stick
      the window. For window managers that don’t support this operation,
      there’s nothing you can do to force it to happen.
  */
  void stick()
  {
    gdk_window_stick(cast(GdkWindow*)this._cPtr);
  }

  /**
      Thaws a window frozen with
      [gdk.window.Window.freezeToplevelUpdatesLibgtkOnly].
      
      This function is not part of the GDK public API and is only
      for use by GTK+.
  
      Deprecated: This symbol was never meant to be used outside of GTK+
  */
  void thawToplevelUpdatesLibgtkOnly()
  {
    gdk_window_thaw_toplevel_updates_libgtk_only(cast(GdkWindow*)this._cPtr);
  }

  /**
      Thaws a window frozen with [gdk.window.Window.freezeUpdates].
  */
  void thawUpdates()
  {
    gdk_window_thaw_updates(cast(GdkWindow*)this._cPtr);
  }

  /**
      Moves the window out of fullscreen mode. If the window was not
      fullscreen, does nothing.
      
      On X11, asks the window manager to move window out of the fullscreen
      state, if the window manager supports this operation. Not all
      window managers support this, and some deliberately ignore it or
      don’t have a concept of “fullscreen”; so you can’t rely on the
      unfullscreenification actually happening. But it will happen with
      most standard window managers, and GDK makes a best effort to get
      it to happen.
  */
  void unfullscreen()
  {
    gdk_window_unfullscreen(cast(GdkWindow*)this._cPtr);
  }

  /**
      Unmaximizes the window. If the window wasn’t maximized, then this
      function does nothing.
      
      On X11, asks the window manager to unmaximize window, if the
      window manager supports this operation. Not all window managers
      support this, and some deliberately ignore it or don’t have a
      concept of “maximized”; so you can’t rely on the unmaximization
      actually happening. But it will happen with most standard window
      managers, and GDK makes a best effort to get it to happen.
      
      On Windows, reliably unmaximizes the window.
  */
  void unmaximize()
  {
    gdk_window_unmaximize(cast(GdkWindow*)this._cPtr);
  }

  /**
      Reverse operation for [gdk.window.Window.stick]; see [gdk.window.Window.stick],
      and [gtk.window.Window.unstick].
  */
  void unstick()
  {
    gdk_window_unstick(cast(GdkWindow*)this._cPtr);
  }

  /**
      Withdraws a window (unmaps it and asks the window manager to forget about it).
      This function is not really useful as [gdk.window.Window.hide] automatically
      withdraws toplevel windows before hiding them.
  */
  void withdraw()
  {
    gdk_window_withdraw(cast(GdkWindow*)this._cPtr);
  }

  /**
      Connect to `CreateSurface` signal.
  
      The ::create-surface signal is emitted when an offscreen window
      needs its surface (re)created, which happens either when the
      window is first drawn to, or when the window is being
      resized. The first signal handler that returns a non-null
      surface will stop any further signal emission, and its surface
      will be used.
      
      Note that it is not possible to access the window's previous
      surface from within any callback of this signal. Calling
      [gdk.global.offscreenWindowGetSurface] will lead to a crash.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D cairo.surface.Surface callback(int width, int height, gdk.window.Window window))
  
          `width` the width of the offscreen surface to create (optional)
  
          `height` the height of the offscreen surface to create (optional)
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` the newly created #cairo_surface_t for the offscreen window
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateSurface(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == cairo.surface.Surface)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gdk.window.Window)))
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
      setVal!(cairo.surface.Surface)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-surface", closure, after);
  }

  /**
      Connect to `MovedToRect` signal.
  
      Emitted when the position of window is finalized after being moved to a
      destination rectangle.
      
      window might be flipped over the destination rectangle in order to keep
      it on-screen, in which case flipped_x and flipped_y will be set to true
      accordingly.
      
      flipped_rect is the ideal position of window after any possible
      flipping, but before any possible sliding. final_rect is flipped_rect,
      but possibly translated in the case that flipping is still ineffective in
      keeping window on-screen.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* flippedRect, void* finalRect, bool flippedX, bool flippedY, gdk.window.Window window))
  
          `flippedRect` the position of window after any possible
                         flipping or null if the backend can't obtain it (optional)
  
          `finalRect` the final position of window or null if the
                       backend can't obtain it (optional)
  
          `flippedX` true if the anchors were flipped horizontally (optional)
  
          `flippedY` true if the anchors were flipped vertically (optional)
  
          `window` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMovedToRect(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == void*)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gdk.window.Window)))
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
    return connectSignalClosure("moved-to-rect", closure, after);
  }

  /**
      Connect to `PickEmbeddedChild` signal.
  
      The ::pick-embedded-child signal is emitted to find an embedded
      child at the given position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.window.Window callback(double x, double y, gdk.window.Window window))
  
          `x` x coordinate in the window (optional)
  
          `y` y coordinate in the window (optional)
  
          `window` the instance the signal is connected to (optional)
  
          `Returns` the #GdkWindow of the
              embedded child at `x`, `y`, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPickEmbeddedChild(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gdk.window.Window)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gdk.window.Window)))
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
      setVal!(gdk.window.Window)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pick-embedded-child", closure, after);
  }
}
