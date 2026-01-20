/// Module for [MonitorWrap] class
module gdk.monitor;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    GdkMonitor objects represent the individual outputs that are
    associated with a #GdkDisplay. GdkDisplay has APIs to enumerate
    monitors with [gdk.display.Display.getNMonitors] and [gdk.display.Display.getMonitor], and
    to find particular monitors with [gdk.display.Display.getPrimaryMonitor] or
    [gdk.display.Display.getMonitorAtWindow].
    
    GdkMonitor was introduced in GTK+ 3.22 and supersedes earlier
    APIs in GdkScreen to obtain monitor-related information.
*/
class MonitorWrap : gobject.object.ObjectWrap
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
    return cast(void function())gdk_monitor_get_type != &gidSymbolNotFound ? gdk_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonitorWrap self()
  {
    return this;
  }

  /** */
  @property gdk.rectangle.Rectangle geometry()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rectangle.Rectangle)("geometry");
  }

  /** */
  @property int heightMm()
  {
    return getHeightMm();
  }

  /** */
  @property string manufacturer()
  {
    return getManufacturer();
  }

  /** */
  @property string model()
  {
    return getModel();
  }

  /** */
  @property int refreshRate()
  {
    return getRefreshRate();
  }

  /** */
  @property int scaleFactor()
  {
    return getScaleFactor();
  }

  /** */
  @property gdk.types.SubpixelLayout subpixelLayout()
  {
    return getSubpixelLayout();
  }

  /** */
  @property int widthMm()
  {
    return getWidthMm();
  }

  /** */
  @property gdk.rectangle.Rectangle workarea()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rectangle.Rectangle)("workarea");
  }

  /**
      Gets the display that this monitor belongs to.
      Returns: the display
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_monitor_get_display(cast(GdkMonitor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the size and position of an individual monitor within the
      display coordinate space. The returned geometry is in  ”application pixels”,
      not in ”device pixels” (see [gdk.monitor.MonitorWrap.getScaleFactor]).
  
      Params:
        geometry = a #GdkRectangle to be filled with the monitor geometry
  */
  void getGeometry(out gdk.rectangle.Rectangle geometry)
  {
    gdk_monitor_get_geometry(cast(GdkMonitor*)this._cPtr, cast(GdkRectangle*)&geometry);
  }

  /**
      Gets the height in millimeters of the monitor.
      Returns: the physical height of the monitor
  */
  int getHeightMm()
  {
    int _retval;
    _retval = gdk_monitor_get_height_mm(cast(GdkMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name or PNP ID of the monitor's manufacturer, if available.
      
      Note that this value might also vary depending on actual
      display backend.
      
      PNP ID registry is located at https://uefi.org/pnp_id_list
      Returns: the name of the manufacturer, or null
  */
  string getManufacturer()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_manufacturer(cast(GdkMonitor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the a string identifying the monitor model, if available.
      Returns: the monitor model, or null
  */
  string getModel()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_model(cast(GdkMonitor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the refresh rate of the monitor, if available.
      
      The value is in milli-Hertz, so a refresh rate of 60Hz
      is returned as 60000.
      Returns: the refresh rate in milli-Hertz, or 0
  */
  int getRefreshRate()
  {
    int _retval;
    _retval = gdk_monitor_get_refresh_rate(cast(GdkMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Gets the internal scale factor that maps from monitor coordinates
      to the actual device pixels. On traditional systems this is 1, but
      on very high density outputs this can be a higher value (often 2).
      
      This can be used if you want to create pixel based data for a
      particular monitor, but most of the time you’re drawing to a window
      where it is better to use [gdk.window.Window.getScaleFactor] instead.
      Returns: the scale factor
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gdk_monitor_get_scale_factor(cast(GdkMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Gets information about the layout of red, green and blue
      primaries for each pixel in this monitor, if available.
      Returns: the subpixel layout
  */
  gdk.types.SubpixelLayout getSubpixelLayout()
  {
    GdkSubpixelLayout _cretval;
    _cretval = gdk_monitor_get_subpixel_layout(cast(GdkMonitor*)this._cPtr);
    gdk.types.SubpixelLayout _retval = cast(gdk.types.SubpixelLayout)_cretval;
    return _retval;
  }

  /**
      Gets the width in millimeters of the monitor.
      Returns: the physical width of the monitor
  */
  int getWidthMm()
  {
    int _retval;
    _retval = gdk_monitor_get_width_mm(cast(GdkMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the size and position of the “work area” on a monitor
      within the display coordinate space. The returned geometry is in
      ”application pixels”, not in ”device pixels” (see
      [gdk.monitor.MonitorWrap.getScaleFactor]).
      
      The work area should be considered when positioning menus and
      similar popups, to avoid placing them below panels, docks or other
      desktop components.
      
      Note that not all backends may have a concept of workarea. This
      function will return the monitor geometry if a workarea is not
      available, or does not apply.
  
      Params:
        workarea = a #GdkRectangle to be filled with
              the monitor workarea
  */
  void getWorkarea(out gdk.rectangle.Rectangle workarea)
  {
    gdk_monitor_get_workarea(cast(GdkMonitor*)this._cPtr, cast(GdkRectangle*)&workarea);
  }

  /**
      Gets whether this monitor should be considered primary
      (see [gdk.display.Display.getPrimaryMonitor]).
      Returns: true if monitor is primary
  */
  bool isPrimary()
  {
    bool _retval;
    _retval = cast(bool)gdk_monitor_is_primary(cast(GdkMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Invalidate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.monitor.MonitorWrap monitorWrap))
  
          `monitorWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInvalidate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.monitor.MonitorWrap)))
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
    return connectSignalClosure("invalidate", closure, after);
  }
}
