/// Module for [Surface] class
module gdk.surface;

import cairo.region;
import cairo.surface;
import cairo.types;
import gdk.c.functions;
import gdk.c.types;
import gdk.cairo_context;
import gdk.cursor;
import gdk.device;
import gdk.display;
import gdk.event;
import gdk.frame_clock;
import gdk.glcontext;
import gdk.monitor;
import gdk.types;
import gdk.vulkan_context;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    A [gdk.surface.Surface] is a rectangular region on the screen.
    
    It’s a low-level object, used to implement high-level objects
    such as [GtkWindow](../gtk4/class.Window.html).
    
    The surfaces you see in practice are either [gdk.toplevel.Toplevel] or
    [gdk.popup.Popup], and those interfaces provide much of the required
    API to interact with these surfaces. Other, more specialized surface
    types exist, but you will rarely interact with them directly.
*/
class Surface : gobject.object.ObjectWrap
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
    return cast(void function())gdk_surface_get_type != &gidSymbolNotFound ? gdk_surface_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Surface self()
  {
    return this;
  }

  /**
      Get `cursor` property.
      Returns: The mouse pointer for the [gdk.surface.Surface].
  */
  @property gdk.cursor.Cursor cursor()
  {
    return getCursor();
  }

  /**
      Set `cursor` property.
      Params:
        propval = The mouse pointer for the [gdk.surface.Surface].
  */
  @property void cursor(gdk.cursor.Cursor propval)
  {
    return setCursor(propval);
  }

  /**
      Get `height` property.
      Returns: The height of the surface, in pixels.
  */
  @property int height()
  {
    return getHeight();
  }

  /**
      Get `mapped` property.
      Returns: Whether the surface is mapped.
  */
  @property bool mapped()
  {
    return getMapped();
  }

  /**
      Get `scale` property.
      Returns: The scale of the surface.
  */
  @property double scale()
  {
    return getScale();
  }

  /**
      Get `scaleFactor` property.
      Returns: The scale factor of the surface.
        
        The scale factor is the next larger integer,
        compared to [gdk.surface.Surface.scale].
  */
  @property int scaleFactor()
  {
    return getScaleFactor();
  }

  /**
      Get `width` property.
      Returns: The width of the surface in pixels.
  */
  @property int width()
  {
    return getWidth();
  }

  /**
      Create a new popup surface.
      
      The surface will be attached to parent and can be positioned
      relative to it using [gdk.popup.Popup.present].
  
      Params:
        parent = the parent surface to attach the surface to
        autohide = whether to hide the surface on outside clicks
      Returns: a new [gdk.surface.Surface]
  */
  static gdk.surface.Surface newPopup(gdk.surface.Surface parent, bool autohide)
  {
    GdkSurface* _cretval;
    _cretval = gdk_surface_new_popup(parent ? cast(GdkSurface*)parent._cPtr(No.Dup) : null, autohide);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new toplevel surface.
  
      Params:
        display = the display to create the surface on
      Returns: the new [gdk.surface.Surface]
  */
  static gdk.surface.Surface newToplevel(gdk.display.Display display)
  {
    GdkSurface* _cretval;
    _cretval = gdk_surface_new_toplevel(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Emits a short beep associated to surface.
      
      If the display of surface does not support per-surface beeps,
      emits a short beep on the display just as [gdk.display.Display.beep].
  */
  void beep()
  {
    gdk_surface_beep(cast(GdkSurface*)this._cPtr);
  }

  /**
      Creates a new [gdk.cairo_context.CairoContext] for rendering on surface.
      Returns: the newly created [gdk.cairo_context.CairoContext]
  */
  gdk.cairo_context.CairoContext createCairoContext()
  {
    GdkCairoContext* _cretval;
    _cretval = gdk_surface_create_cairo_context(cast(GdkSurface*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cairo_context.CairoContext)(cast(GdkCairoContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gdk.glcontext.GLContext] for the [gdk.surface.Surface].
      
      The context is disconnected from any particular surface or surface.
      If the creation of the [gdk.glcontext.GLContext] failed, error will be set.
      Before using the returned [gdk.glcontext.GLContext], you will need to
      call [gdk.glcontext.GLContext.makeCurrent] or [gdk.glcontext.GLContext.realize].
      Returns: the newly created [gdk.glcontext.GLContext]
      Throws: [ErrorWrap]
  */
  gdk.glcontext.GLContext createGlContext()
  {
    GdkGLContext* _cretval;
    GError *_err;
    _cretval = gdk_surface_create_gl_context(cast(GdkSurface*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Create a new Cairo surface that is as compatible as possible with the
      given surface.
      
      For example the new surface will have the same fallback resolution
      and font options as surface. Generally, the new surface will also
      use the same backend as surface, unless that is not possible for
      some reason. The type of the returned surface may be examined with
      [cairo.surface.Surface.getSurfaceType].
      
      Initially the surface contents are all 0 (transparent if contents
      have transparency, black otherwise.)
      
      This function always returns a valid pointer, but it will return a
      pointer to a “nil” surface if other is already in an error state
      or any other error occurs.
  
      Params:
        content = the content for the new surface
        width = width of the new surface
        height = height of the new surface
      Returns: a pointer to the newly allocated surface. The caller
          owns the surface and should call [cairo.surface.Surface.destroy] when done
          with it.
  
      Deprecated: Create a suitable cairo image surface yourself
  */
  cairo.surface.Surface createSimilarSurface(cairo.types.Content content, int width, int height)
  {
    cairo_surface_t* _cretval;
    _cretval = gdk_surface_create_similar_surface(cast(GdkSurface*)this._cPtr, content, width, height);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets an error and returns null.
      Returns: null
      Throws: [ErrorWrap]
  
      Deprecated: GTK does not expose any Vulkan internals. This
          function is a leftover that was accidentally exposed.
  */
  gdk.vulkan_context.VulkanContext createVulkanContext()
  {
    GdkVulkanContext* _cretval;
    GError *_err;
    _cretval = gdk_surface_create_vulkan_context(cast(GdkSurface*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.vulkan_context.VulkanContext)(cast(GdkVulkanContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Destroys the window system resources associated with surface and
      decrements surface's reference count.
      
      The window system resources for all children of surface are also
      destroyed, but the children’s reference counts are not decremented.
      
      Note that a surface will not be destroyed automatically when its
      reference count reaches zero. You must call this function yourself
      before that happens.
  */
  void destroy()
  {
    gdk_surface_destroy(cast(GdkSurface*)this._cPtr);
  }

  /**
      Retrieves a [gdk.cursor.Cursor] pointer for the cursor currently set on the
      [gdk.surface.Surface].
      
      If the return value is null then there is no custom cursor set on
      the surface, and it is using the cursor for its parent surface.
      
      Use [gdk.surface.Surface.setCursor] to unset the cursor of the surface.
      Returns: a [gdk.cursor.Cursor]
  */
  gdk.cursor.Cursor getCursor()
  {
    GdkCursor* _cretval;
    _cretval = gdk_surface_get_cursor(cast(GdkSurface*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves a [gdk.cursor.Cursor] pointer for the device currently set on the
      specified [gdk.surface.Surface].
      
      If the return value is null then there is no custom cursor set on the
      specified surface, and it is using the cursor for its parent surface.
      
      Use [gdk.surface.Surface.setCursor] to unset the cursor of the surface.
  
      Params:
        device = a pointer [gdk.device.Device]
      Returns: a [gdk.cursor.Cursor]
  */
  gdk.cursor.Cursor getDeviceCursor(gdk.device.Device device)
  {
    GdkCursor* _cretval;
    _cretval = gdk_surface_get_device_cursor(cast(GdkSurface*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the current device position and modifier state.
      
      The position is given in coordinates relative to the upper
      left corner of surface.
  
      Params:
        device = pointer [gdk.device.Device] to query to
        x = return location for the X coordinate of device
        y = return location for the Y coordinate of device
        mask = return location for the modifier mask
      Returns: true if the device is over the surface
  */
  bool getDevicePosition(gdk.device.Device device, out double x, out double y, out gdk.types.ModifierType mask)
  {
    bool _retval;
    _retval = cast(bool)gdk_surface_get_device_position(cast(GdkSurface*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y, &mask);
    return _retval;
  }

  /**
      Gets the [gdk.display.Display] associated with a [gdk.surface.Surface].
      Returns: the [gdk.display.Display] associated with surface
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_surface_get_display(cast(GdkSurface*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the frame clock for the surface.
      
      The frame clock for a surface never changes unless the surface is
      reparented to a new toplevel surface.
      Returns: the frame clock
  */
  gdk.frame_clock.FrameClock getFrameClock()
  {
    GdkFrameClock* _cretval;
    _cretval = gdk_surface_get_frame_clock(cast(GdkSurface*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the height of the given surface.
      
      Surface size is reported in ”application pixels”, not
      ”device pixels” (see [gdk.surface.Surface.getScaleFactor]).
      Returns: The height of surface
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_surface_get_height(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the surface has been mapped.
      
      A surface is mapped with [gdk.toplevel.Toplevel.present]
      or [gdk.popup.Popup.present].
      Returns: true if the surface is mapped
  */
  bool getMapped()
  {
    bool _retval;
    _retval = cast(bool)gdk_surface_get_mapped(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Returns the internal scale that maps from surface coordinates
      to the actual device pixels.
      
      When the scale is bigger than 1, the windowing system prefers to get
      buffers with a resolution that is bigger than the surface size (e.g.
      to show the surface on a high-resolution display, or in a magnifier).
      
      Compare with [gdk.surface.Surface.getScaleFactor], which returns the
      next larger integer.
      
      The scale may change during the lifetime of the surface.
      Returns: the scale
  */
  double getScale()
  {
    double _retval;
    _retval = gdk_surface_get_scale(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Returns the internal scale factor that maps from surface coordinates
      to the actual device pixels.
      
      On traditional systems this is 1, but on very high density outputs
      this can be a higher value (often 2). A higher value means that drawing
      is automatically scaled up to a higher resolution, so any code doing
      drawing will automatically look nicer. However, if you are supplying
      pixel-based data the scale value can be used to determine whether to
      use a pixel resource with higher resolution data.
      
      The scale factor may change during the lifetime of the surface.
      Returns: the scale factor
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gdk_surface_get_scale_factor(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Returns the width of the given surface.
      
      Surface size is reported in ”application pixels”, not
      ”device pixels” (see [gdk.surface.Surface.getScaleFactor]).
      Returns: The width of surface
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_surface_get_width(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Hide the surface.
      
      For toplevel surfaces, withdraws them, so they will no longer be
      known to the window manager; for all surfaces, unmaps them, so
      they won’t be displayed. Normally done automatically as
      part of [[gtk.widget.Widget.hide]](../gtk4/method.Widget.hide.html).
  */
  void hide()
  {
    gdk_surface_hide(cast(GdkSurface*)this._cPtr);
  }

  /**
      Check to see if a surface is destroyed.
      Returns: true if the surface is destroyed
  */
  bool isDestroyed()
  {
    bool _retval;
    _retval = cast(bool)gdk_surface_is_destroyed(cast(GdkSurface*)this._cPtr);
    return _retval;
  }

  /**
      Forces a [gdk.surface.Surface.render] signal emission for surface
      to be scheduled.
      
      This function is useful for implementations that track invalid
      regions on their own.
  */
  void queueRender()
  {
    gdk_surface_queue_render(cast(GdkSurface*)this._cPtr);
  }

  /**
      Request a layout phase from the surface's frame clock.
      
      See [gdk.frame_clock.FrameClock.requestPhase].
  */
  void requestLayout()
  {
    gdk_surface_request_layout(cast(GdkSurface*)this._cPtr);
  }

  /**
      Sets the default mouse pointer for a [gdk.surface.Surface].
      
      Passing null for the cursor argument means that surface will use
      the cursor of its parent surface. Most surfaces should use this default.
      Note that cursor must be for the same display as surface.
      
      Use [gdk.cursor.Cursor.newFromName] or [gdk.cursor.Cursor.newFromTexture]
      to create the cursor. To make the cursor invisible, use [gdk.types.CursorType.BlankCursor].
  
      Params:
        cursor = a [gdk.cursor.Cursor]
  */
  void setCursor(gdk.cursor.Cursor cursor = null)
  {
    gdk_surface_set_cursor(cast(GdkSurface*)this._cPtr, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Sets a specific [gdk.cursor.Cursor] for a given device when it gets inside surface.
      
      Passing null for the cursor argument means that surface will use the
      cursor of its parent surface. Most surfaces should use this default.
      
      Use [gdk.cursor.Cursor.newFromName] or [gdk.cursor.Cursor.newFromTexture]
      to create the cursor. To make the cursor invisible, use [gdk.types.CursorType.BlankCursor].
  
      Params:
        device = a pointer [gdk.device.Device]
        cursor = a [gdk.cursor.Cursor]
  */
  void setDeviceCursor(gdk.device.Device device, gdk.cursor.Cursor cursor)
  {
    gdk_surface_set_device_cursor(cast(GdkSurface*)this._cPtr, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Apply the region to the surface for the purpose of event
      handling.
      
      Mouse events which happen while the pointer position corresponds
      to an unset bit in the mask will be passed on the surface below
      surface.
      
      An input region is typically used with RGBA surfaces. The alpha
      channel of the surface defines which pixels are invisible and
      allows for nicely antialiased borders, and the input region
      controls where the surface is “clickable”.
      
      Use [gdk.display.Display.supportsInputShapes] to find out if
      a particular backend supports input regions.
  
      Params:
        region = region of surface to be reactive
  */
  void setInputRegion(cairo.region.Region region)
  {
    gdk_surface_set_input_region(cast(GdkSurface*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Marks a region of the [gdk.surface.Surface] as opaque.
      
      For optimisation purposes, compositing window managers may
      like to not draw obscured regions of surfaces, or turn off blending
      during for these regions. With RGB windows with no transparency,
      this is just the shape of the window, but with ARGB32 windows, the
      compositor does not know what regions of the window are transparent
      or not.
      
      This function only works for toplevel surfaces.
      
      GTK will update this property automatically if the surface background
      is opaque, as we know where the opaque regions are. If your surface
      background is not opaque, please update this property in your
      [GtkWidgetClass.css_changed](../gtk4/vfunc.Widget.css_changed.html) handler.
  
      Params:
        region = a region, or null to make the entire
            surface opaque
  */
  void setOpaqueRegion(cairo.region.Region region = null)
  {
    gdk_surface_set_opaque_region(cast(GdkSurface*)this._cPtr, region ? cast(cairo_region_t*)region._cPtr(No.Dup) : null);
  }

  /**
      Translates coordinates between two surfaces.
      
      Note that this only works if to and from are popups or
      transient-for to the same toplevel (directly or indirectly).
  
      Params:
        to = the target surface
        x = coordinates to translate
        y = coordinates to translate
      Returns: true if the coordinates were successfully translated
  */
  bool translateCoordinates(gdk.surface.Surface to, ref double x, ref double y)
  {
    bool _retval;
    _retval = cast(bool)gdk_surface_translate_coordinates(cast(GdkSurface*)this._cPtr, to ? cast(GdkSurface*)to._cPtr(No.Dup) : null, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Connect to `EnterMonitor` signal.
  
      Emitted when surface starts being present on the monitor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.monitor.MonitorWrap monitor, gdk.surface.Surface surface))
  
          `monitor` the monitor (optional)
  
          `surface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnterMonitor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.monitor.MonitorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.surface.Surface)))
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
    return connectSignalClosure("enter-monitor", closure, after);
  }

  /**
      Connect to `Event` signal.
  
      Emitted when GDK receives an input event for surface.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gdk.event.Event event, gdk.surface.Surface surface))
  
          `event` an input event (optional)
  
          `surface` the instance the signal is connected to (optional)
  
          `Returns` true to indicate that the event has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event.Event)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.surface.Surface)))
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
    return connectSignalClosure("event", closure, after);
  }

  /**
      Connect to `Layout` signal.
  
      Emitted when the size of surface is changed, or when relayout should
        be performed.
        
        Surface size is reported in ”application pixels”, not
        ”device pixels” (see [gdk.surface.Surface.getScaleFactor]).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int width, int height, gdk.surface.Surface surface))
  
          `width` the current width (optional)
  
          `height` the current height (optional)
  
          `surface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLayout(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gdk.surface.Surface)))
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
    return connectSignalClosure("layout", closure, after);
  }

  /**
      Connect to `LeaveMonitor` signal.
  
      Emitted when surface stops being present on the monitor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.monitor.MonitorWrap monitor, gdk.surface.Surface surface))
  
          `monitor` the monitor (optional)
  
          `surface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeaveMonitor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.monitor.MonitorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.surface.Surface)))
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
    return connectSignalClosure("leave-monitor", closure, after);
  }

  /**
      Connect to `Render` signal.
  
      Emitted when part of the surface needs to be redrawn.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(cairo.region.Region region, gdk.surface.Surface surface))
  
          `region` the region that needs to be redrawn (optional)
  
          `surface` the instance the signal is connected to (optional)
  
          `Returns` true to indicate that the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRender(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == cairo.region.Region)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.surface.Surface)))
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
    return connectSignalClosure("render", closure, after);
  }
}
