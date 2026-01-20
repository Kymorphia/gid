/// Module for [Screen] class
module gdk.screen;

import cairo.font_options;
import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.rectangle;
import gdk.types;
import gdk.visual;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/**
    #GdkScreen objects are the GDK representation of the screen on
    which windows can be displayed and on which the pointer moves.
    X originally identified screens with physical screens, but
    nowadays it is more common to have a single #GdkScreen which
    combines several physical monitors (see [gdk.screen.Screen.getNMonitors]).
    
    GdkScreen is used throughout GDK and GTK+ to specify which screen
    the top level windows are to be displayed on. it is also used to
    query the screen specification and default settings such as
    the default visual ([gdk.screen.Screen.getSystemVisual]), the dimensions
    of the physical monitors ([gdk.screen.Screen.getMonitorGeometry]), etc.
*/
class Screen : gobject.object.ObjectWrap
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
    return cast(void function())gdk_screen_get_type != &gidSymbolNotFound ? gdk_screen_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Screen self()
  {
    return this;
  }

  /** */
  @property void* fontOptions()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("font-options");
  }

  /** */
  @property void fontOptions(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("font-options", propval);
  }

  /** */
  @property double resolution()
  {
    return getResolution();
  }

  /** */
  @property void resolution(double propval)
  {
    return setResolution(propval);
  }

  /**
      Gets the default screen for the default display. (See
      gdk_display_get_default ()).
      Returns: a #GdkScreen, or null if
            there is no default display.
  */
  static gdk.screen.Screen getDefault()
  {
    GdkScreen* _cretval;
    _cretval = gdk_screen_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the height of the default screen in pixels. The returned
      size is in ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      Returns: the height of the default screen in pixels.
  
      Deprecated: Use per-monitor information
  */
  static int height()
  {
    int _retval;
    _retval = gdk_screen_height();
    return _retval;
  }

  /**
      Returns the height of the default screen in millimeters.
      Note that on many X servers this value will not be correct.
      Returns: the height of the default screen in millimeters,
        though it is not always correct.
  
      Deprecated: Use per-monitor information
  */
  static int heightMm()
  {
    int _retval;
    _retval = gdk_screen_height_mm();
    return _retval;
  }

  /**
      Gets the width of the default screen in pixels. The returned
      size is in ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      Returns: the width of the default screen in pixels.
  
      Deprecated: Use per-monitor information
  */
  static int width()
  {
    int _retval;
    _retval = gdk_screen_width();
    return _retval;
  }

  /**
      Returns the width of the default screen in millimeters.
      Note that on many X servers this value will not be correct.
      Returns: the width of the default screen in millimeters,
        though it is not always correct.
  
      Deprecated: Use per-monitor information
  */
  static int widthMm()
  {
    int _retval;
    _retval = gdk_screen_width_mm();
    return _retval;
  }

  /**
      Returns the screen’s currently active window.
      
      On X11, this is done by inspecting the _NET_ACTIVE_WINDOW property
      on the root window, as described in the
      [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
      If there is no currently currently active
      window, or the window manager does not support the
      _NET_ACTIVE_WINDOW hint, this function returns null.
      
      On other platforms, this function may return null, depending on whether
      it is implementable on that platform.
      
      The returned window should be unrefed using [gobject.object.ObjectWrap.unref] when
      no longer needed.
      Returns: the currently active window,
          or null.
  */
  gdk.window.Window getActiveWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_screen_get_active_window(cast(GdkScreen*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the display to which the screen belongs.
      Returns: the display to which screen belongs
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_screen_get_display(cast(GdkScreen*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets any options previously set with [gdk.screen.Screen.setFontOptions].
      Returns: the current font options, or null if no
         default font options have been set.
  */
  cairo.font_options.FontOptions getFontOptions()
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = gdk_screen_get_font_options(cast(GdkScreen*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the height of screen in pixels. The returned size is in
      ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      Returns: the height of screen in pixels.
  
      Deprecated: Use per-monitor information instead
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_screen_get_height(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Returns the height of screen in millimeters.
      
      Note that this value is somewhat ill-defined when the screen
      has multiple monitors of different resolution. It is recommended
      to use the monitor dimensions instead.
      Returns: the heigth of screen in millimeters.
  
      Deprecated: Use per-monitor information instead
  */
  int getHeightMm()
  {
    int _retval;
    _retval = gdk_screen_get_height_mm(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Returns the monitor number in which the point (`x`,`y`) is located.
  
      Params:
        x = the x coordinate in the virtual screen.
        y = the y coordinate in the virtual screen.
      Returns: the monitor number in which the point (`x`,`y`) lies, or
          a monitor close to (`x`,`y`) if the point is not in any monitor.
  
      Deprecated: Use [gdk.display.Display.getMonitorAtPoint] instead
  */
  int getMonitorAtPoint(int x, int y)
  {
    int _retval;
    _retval = gdk_screen_get_monitor_at_point(cast(GdkScreen*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Returns the number of the monitor in which the largest area of the
      bounding rectangle of window resides.
  
      Params:
        window = a #GdkWindow
      Returns: the monitor number in which most of window is located,
            or if window does not intersect any monitors, a monitor,
            close to window.
  
      Deprecated: Use [gdk.display.Display.getMonitorAtWindow] instead
  */
  int getMonitorAtWindow(gdk.window.Window window)
  {
    int _retval;
    _retval = gdk_screen_get_monitor_at_window(cast(GdkScreen*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the #GdkRectangle representing the size and position of
      the individual monitor within the entire screen area. The returned
      geometry is in ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      
      Monitor numbers start at 0. To obtain the number of monitors of
      screen, use [gdk.screen.Screen.getNMonitors].
      
      Note that the size of the entire screen area can be retrieved via
      [gdk.screen.Screen.getWidth] and [gdk.screen.Screen.getHeight].
  
      Params:
        monitorNum = the monitor number
        dest = a #GdkRectangle to be filled with
              the monitor geometry
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getGeometry] instead
  */
  void getMonitorGeometry(int monitorNum, out gdk.rectangle.Rectangle dest)
  {
    gdk_screen_get_monitor_geometry(cast(GdkScreen*)this._cPtr, monitorNum, cast(GdkRectangle*)&dest);
  }

  /**
      Gets the height in millimeters of the specified monitor.
  
      Params:
        monitorNum = number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
      Returns: the height of the monitor, or -1 if not available
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getHeightMm] instead
  */
  int getMonitorHeightMm(int monitorNum)
  {
    int _retval;
    _retval = gdk_screen_get_monitor_height_mm(cast(GdkScreen*)this._cPtr, monitorNum);
    return _retval;
  }

  /**
      Returns the output name of the specified monitor.
      Usually something like VGA, DVI, or TV, not the actual
      product name of the display device.
  
      Params:
        monitorNum = number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
      Returns: a newly-allocated string containing the name
          of the monitor, or null if the name cannot be determined
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getModel] instead
  */
  string getMonitorPlugName(int monitorNum)
  {
    char* _cretval;
    _cretval = gdk_screen_get_monitor_plug_name(cast(GdkScreen*)this._cPtr, monitorNum);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the internal scale factor that maps from monitor coordinates
      to the actual device pixels. On traditional systems this is 1, but
      on very high density outputs this can be a higher value (often 2).
      
      This can be used if you want to create pixel based data for a
      particular monitor, but most of the time you’re drawing to a window
      where it is better to use [gdk.window.Window.getScaleFactor] instead.
  
      Params:
        monitorNum = number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
      Returns: the scale factor
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getScaleFactor] instead
  */
  int getMonitorScaleFactor(int monitorNum)
  {
    int _retval;
    _retval = gdk_screen_get_monitor_scale_factor(cast(GdkScreen*)this._cPtr, monitorNum);
    return _retval;
  }

  /**
      Gets the width in millimeters of the specified monitor, if available.
  
      Params:
        monitorNum = number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
      Returns: the width of the monitor, or -1 if not available
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getWidthMm] instead
  */
  int getMonitorWidthMm(int monitorNum)
  {
    int _retval;
    _retval = gdk_screen_get_monitor_width_mm(cast(GdkScreen*)this._cPtr, monitorNum);
    return _retval;
  }

  /**
      Retrieves the #GdkRectangle representing the size and position of
      the “work area” on a monitor within the entire screen area. The returned
      geometry is in ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      
      The work area should be considered when positioning menus and
      similar popups, to avoid placing them below panels, docks or other
      desktop components.
      
      Note that not all backends may have a concept of workarea. This
      function will return the monitor geometry if a workarea is not
      available, or does not apply.
      
      Monitor numbers start at 0. To obtain the number of monitors of
      screen, use [gdk.screen.Screen.getNMonitors].
  
      Params:
        monitorNum = the monitor number
        dest = a #GdkRectangle to be filled with
              the monitor workarea
  
      Deprecated: Use [gdk.monitor.MonitorWrap.getWorkarea] instead
  */
  void getMonitorWorkarea(int monitorNum, out gdk.rectangle.Rectangle dest)
  {
    gdk_screen_get_monitor_workarea(cast(GdkScreen*)this._cPtr, monitorNum, cast(GdkRectangle*)&dest);
  }

  /**
      Returns the number of monitors which screen consists of.
      Returns: number of monitors which screen consists of
  
      Deprecated: Use [gdk.display.Display.getNMonitors] instead
  */
  int getNMonitors()
  {
    int _retval;
    _retval = gdk_screen_get_n_monitors(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Gets the index of screen among the screens in the display
      to which it belongs. (See [gdk.screen.Screen.getDisplay])
      Returns: the index
  */
  int getNumber()
  {
    int _retval;
    _retval = gdk_screen_get_number(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Gets the primary monitor for screen.  The primary monitor
      is considered the monitor where the “main desktop” lives.
      While normal application windows typically allow the window
      manager to place the windows, specialized desktop applications
      such as panels should place themselves on the primary monitor.
      
      If no primary monitor is configured by the user, the return value
      will be 0, defaulting to the first monitor.
      Returns: An integer index for the primary monitor, or 0 if none is configured.
  
      Deprecated: Use [gdk.display.Display.getPrimaryMonitor] instead
  */
  int getPrimaryMonitor()
  {
    int _retval;
    _retval = gdk_screen_get_primary_monitor(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Gets the resolution for font handling on the screen; see
      [gdk.screen.Screen.setResolution] for full details.
      Returns: the current resolution, or -1 if no resolution
        has been set.
  */
  double getResolution()
  {
    double _retval;
    _retval = gdk_screen_get_resolution(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Gets a visual to use for creating windows with an alpha channel.
      The windowing system on which GTK+ is running
      may not support this capability, in which case null will
      be returned. Even if a non-null value is returned, its
      possible that the window’s alpha channel won’t be honored
      when displaying the window on the screen: in particular, for
      X an appropriate windowing manager and compositing manager
      must be running to provide appropriate display.
      
      This functionality is not implemented in the Windows backend.
      
      For setting an overall opacity for a top-level window, see
      [gdk.window.Window.setOpacity].
      Returns: a visual to use for windows
            with an alpha channel or null if the capability is not
            available.
  */
  gdk.visual.Visual getRgbaVisual()
  {
    GdkVisual* _cretval;
    _cretval = gdk_screen_get_rgba_visual(cast(GdkScreen*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the root window of screen.
      Returns: the root window
  */
  gdk.window.Window getRootWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_screen_get_root_window(cast(GdkScreen*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves a desktop-wide setting such as double-click time
      for the #GdkScreen screen.
      
      FIXME needs a list of valid settings here, or a link to
      more information.
  
      Params:
        name = the name of the setting
        value = location to store the value of the setting
      Returns: true if the setting existed and a value was stored
          in value, false otherwise.
  */
  bool getSetting(string name, gobject.value.Value value)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gdk_screen_get_setting(cast(GdkScreen*)this._cPtr, _name, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the system’s default visual for screen.
      This is the visual for the root window of the display.
      The return value should not be freed.
      Returns: the system visual
  */
  gdk.visual.Visual getSystemVisual()
  {
    GdkVisual* _cretval;
    _cretval = gdk_screen_get_system_visual(cast(GdkScreen*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.visual.Visual)(cast(GdkVisual*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains a list of all toplevel windows known to GDK on the screen screen.
      A toplevel window is a child of the root window (see
      [gdk.global.getDefaultRootWindow]).
      
      The returned list should be freed with [glib.list.List.free], but
      its elements need not be freed.
      Returns: list of toplevel windows, free with [glib.list.List.free]
  */
  gdk.window.Window[] getToplevelWindows()
  {
    GList* _cretval;
    _cretval = gdk_screen_get_toplevel_windows(cast(GdkScreen*)this._cPtr);
    auto _retval = gListToD!(gdk.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the width of screen in pixels. The returned size is in
      ”application pixels”, not in ”device pixels” (see
      [gdk.screen.Screen.getMonitorScaleFactor]).
      Returns: the width of screen in pixels.
  
      Deprecated: Use per-monitor information instead
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_screen_get_width(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Gets the width of screen in millimeters.
      
      Note that this value is somewhat ill-defined when the screen
      has multiple monitors of different resolution. It is recommended
      to use the monitor dimensions instead.
      Returns: the width of screen in millimeters.
  
      Deprecated: Use per-monitor information instead
  */
  int getWidthMm()
  {
    int _retval;
    _retval = gdk_screen_get_width_mm(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Returns a #GList of #GdkWindows representing the current
      window stack.
      
      On X11, this is done by inspecting the _NET_CLIENT_LIST_STACKING
      property on the root window, as described in the
      [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
      If the window manager does not support the
      _NET_CLIENT_LIST_STACKING hint, this function returns null.
      
      On other platforms, this function may return null, depending on whether
      it is implementable on that platform.
      
      The returned list is newly allocated and owns references to the
      windows it contains, so it should be freed using [glib.list.List.free] and
      its windows unrefed using [gobject.object.ObjectWrap.unref] when no longer needed.
      Returns: a
            list of #GdkWindows for the current window stack, or null.
  */
  gdk.window.Window[] getWindowStack()
  {
    GList* _cretval;
    _cretval = gdk_screen_get_window_stack(cast(GdkScreen*)this._cPtr);
    auto _retval = gListToD!(gdk.window.Window, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns whether windows with an RGBA visual can reasonably
      be expected to have their alpha channel drawn correctly on
      the screen.
      
      On X11 this function returns whether a compositing manager is
      compositing screen.
      Returns: Whether windows with RGBA visuals can reasonably be
        expected to have their alpha channels drawn correctly on the screen.
  */
  bool isComposited()
  {
    bool _retval;
    _retval = cast(bool)gdk_screen_is_composited(cast(GdkScreen*)this._cPtr);
    return _retval;
  }

  /**
      Lists the available visuals for the specified screen.
      A visual describes a hardware image data format.
      For example, a visual might support 24-bit color, or 8-bit color,
      and might expect pixels to be in a certain format.
      
      Call [glib.list.List.free] on the return value when you’re finished with it.
      Returns: a list of visuals; the list must be freed, but not its contents
  */
  gdk.visual.Visual[] listVisuals()
  {
    GList* _cretval;
    _cretval = gdk_screen_list_visuals(cast(GdkScreen*)this._cPtr);
    auto _retval = gListToD!(gdk.visual.Visual, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Determines the name to pass to [gdk.display.Display.open] to get
      a #GdkDisplay with this screen as the default screen.
      Returns: a newly allocated string, free with [glib.global.gfree]
  */
  string makeDisplayName()
  {
    char* _cretval;
    _cretval = gdk_screen_make_display_name(cast(GdkScreen*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the default font options for the screen. These
      options will be set on any #PangoContext’s newly created
      with [gdk.global.pangoContextGetForScreen]. Changing the
      default set of font options does not affect contexts that
      have already been created.
  
      Params:
        options = a #cairo_font_options_t, or null to unset any
            previously set default font options.
  */
  void setFontOptions(cairo.font_options.FontOptions options = null)
  {
    gdk_screen_set_font_options(cast(GdkScreen*)this._cPtr, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
  }

  /**
      Sets the resolution for font handling on the screen. This is a
      scale factor between points specified in a #PangoFontDescription
      and cairo units. The default value is 96, meaning that a 10 point
      font will be 13 units high. (10 * 96. / 72. = 13.3).
  
      Params:
        dpi = the resolution in “dots per inch”. (Physical inches aren’t actually
            involved; the terminology is conventional.)
  */
  void setResolution(double dpi)
  {
    gdk_screen_set_resolution(cast(GdkScreen*)this._cPtr, dpi);
  }

  /**
      Connect to `CompositedChanged` signal.
  
      The ::composited-changed signal is emitted when the composited
        status of the screen changes
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.screen.Screen screen))
  
          `screen` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCompositedChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.screen.Screen)))
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
    return connectSignalClosure("composited-changed", closure, after);
  }

  /**
      Connect to `MonitorsChanged` signal.
  
      The ::monitors-changed signal is emitted when the number, size
        or position of the monitors attached to the screen change.
        
        Only for X11 and OS X for now. A future implementation for Win32
        may be a possibility.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.screen.Screen screen))
  
          `screen` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMonitorsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.screen.Screen)))
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
    return connectSignalClosure("monitors-changed", closure, after);
  }

  /**
      Connect to `SizeChanged` signal.
  
      The ::size-changed signal is emitted when the pixel width or
        height of a screen changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.screen.Screen screen))
  
          `screen` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSizeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.screen.Screen)))
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
    return connectSignalClosure("size-changed", closure, after);
  }
}
