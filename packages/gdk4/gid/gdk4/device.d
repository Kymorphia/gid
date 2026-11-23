/// Module for [Device] class
module gid.gdk4.device;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.device_tool;
import gid.gdk4.display;
import gid.gdk4.seat;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.types;

/**
    Represents an input device, such as a keyboard, mouse or touchpad.
    
    See the [gid.gdk4.seat.Seat] documentation for more information
    about the various kinds of devices, and their relationships.
*/
class Device : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_device_get_type != &gidSymbolNotFound ? gdk_device_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDevice";
  }

  /** Returns `this`, for use in `with` statements. */
  override Device self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.device.Device]
      Returns: New builder object
  */
  static DeviceGidBuilder builder() nothrow
  {
    return new DeviceGidBuilder;
  }

  /**
      Get `activeLayoutIndex` property.
      Returns: The index of the keyboard active layout of a [gid.gdk4.device.Device].
        
        Will be -1 if there is no valid active layout.
        
        This is only relevant for keyboard devices.
  */
  @property int activeLayoutIndex() nothrow
  {
    return getActiveLayoutIndex();
  }

  /**
      Get `capsLockState` property.
      Returns: Whether Caps Lock is on.
        
        This is only relevant for keyboard devices.
  */
  @property bool capsLockState() nothrow
  {
    return getCapsLockState();
  }

  /**
      Get `direction` property.
      Returns: The direction of the current layout.
        
        This is only relevant for keyboard devices.
  */
  @property gid.pango1.types.Direction direction() nothrow
  {
    return getDirection();
  }

  /**
      Get `display` property.
      Returns: The [gid.gdk4.display.Display] the [gid.gdk4.device.Device] pertains to.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `hasCursor` property.
      Returns: Whether the device is represented by a cursor on the screen.
  */
  @property bool hasCursor() nothrow
  {
    return getHasCursor();
  }

  /**
      Get `layoutNames` property.
      Returns: The names of the keyboard layouts of a [gid.gdk4.device.Device].
        
        This is only relevant for keyboard devices.
  */
  @property string[] layoutNames() nothrow
  {
    return getLayoutNames();
  }

  /**
      Get `modifierState` property.
      Returns: The current modifier state of the device.
        
        This is only relevant for keyboard devices.
  */
  @property gid.gdk4.types.ModifierType modifierState() nothrow
  {
    return getModifierState();
  }

  /**
      Get `nAxes` property.
      Returns: Number of axes in the device.
  */
  @property uint nAxes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("n-axes");
  }

  /**
      Get `name` property.
      Returns: The device name.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `numLockState` property.
      Returns: Whether Num Lock is on.
        
        This is only relevant for keyboard devices.
  */
  @property bool numLockState() nothrow
  {
    return getNumLockState();
  }

  /**
      Get `numTouches` property.
      Returns: The maximal number of concurrent touches on a touch device.
        
        Will be 0 if the device is not a touch device or if the number
        of touches is unknown.
  */
  @property uint numTouches() nothrow
  {
    return getNumTouches();
  }

  /**
      Get `productId` property.
      Returns: Product ID of this device.
        
        See [gid.gdk4.device.Device.getProductId].
  */
  @property string productId() nothrow
  {
    return getProductId();
  }

  /**
      Get `scrollLockState` property.
      Returns: Whether Scroll Lock is on.
        
        This is only relevant for keyboard devices.
  */
  @property bool scrollLockState() nothrow
  {
    return getScrollLockState();
  }

  /**
      Get `seat` property.
      Returns: [gid.gdk4.seat.Seat] of this device.
  */
  @property gid.gdk4.seat.Seat seat() nothrow
  {
    return getSeat();
  }

  /**
      Set `seat` property.
      Params:
        propval = [gid.gdk4.seat.Seat] of this device.
  */
  @property void seat(gid.gdk4.seat.Seat propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.seat.Seat)("seat", propval);
  }

  /**
      Get `source` property.
      Returns: Source type for the device.
  */
  @property gid.gdk4.types.InputSource source() nothrow
  {
    return getSource();
  }

  /**
      Get `tool` property.
      Returns: The [gid.gdk4.device_tool.DeviceTool] that is currently used with this device.
  */
  @property gid.gdk4.device_tool.DeviceTool tool() nothrow
  {
    return getDeviceTool();
  }

  /**
      Get `vendorId` property.
      Returns: Vendor ID of this device.
        
        See [gid.gdk4.device.Device.getVendorId].
  */
  @property string vendorId() nothrow
  {
    return getVendorId();
  }

  /**
      Retrieves the index of the active layout of the keyboard.
      
      If there is no valid active layout for the [gid.gdk4.device.Device], this function will
      return -1;
      
      This is only relevant for keyboard devices.
      Returns: The layout index of the active layout or -1.
  */
  int getActiveLayoutIndex() nothrow
  {
    int _retval;
    _retval = gdk_device_get_active_layout_index(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the Caps Lock modifier of the keyboard is locked.
      
      This is only relevant for keyboard devices.
      Returns: true if Caps Lock is on for device
  */
  bool getCapsLockState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_caps_lock_state(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current tool for device.
      Returns: the [gid.gdk4.device_tool.DeviceTool]
  */
  gid.gdk4.device_tool.DeviceTool getDeviceTool() nothrow
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_device_get_device_tool(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the direction of effective layout of the keyboard.
      
      This is only relevant for keyboard devices.
      
      The direction of a layout is the direction of the majority
      of its symbols. See `funcPango.unichar_direction`.
      Returns: [gid.pango1.types.Direction.Ltr] or [gid.pango1.types.Direction.Rtl]
          if it can determine the direction. [gid.pango1.types.Direction.Neutral]
          otherwise
  */
  gid.pango1.types.Direction getDirection() nothrow
  {
    PangoDirection _cretval;
    _cretval = gdk_device_get_direction(cast(GdkDevice*)this._cPtr);
    gid.pango1.types.Direction _retval = cast(gid.pango1.types.Direction)_cretval;
    return _retval;
  }

  /**
      Returns the [gid.gdk4.display.Display] to which device pertains.
      Returns: a [gid.gdk4.display.Display]
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_device_get_display(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the pointer follows device motion.
      
      This is not meaningful for keyboard devices, which
      don't have a pointer.
      Returns: true if the pointer follows device motion
  */
  bool getHasCursor() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_has_cursor(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the names of the layouts of the keyboard.
      
      This is only relevant for keyboard devices.
      Returns: null-terminated array of strings of layouts,
  */
  string[] getLayoutNames() nothrow
  {
    char** _cretval;
    _cretval = gdk_device_get_layout_names(cast(GdkDevice*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves the current modifier state of the keyboard.
      
      This is only relevant for keyboard devices.
      Returns: the current modifier state
  */
  gid.gdk4.types.ModifierType getModifierState() nothrow
  {
    GdkModifierType _cretval;
    _cretval = gdk_device_get_modifier_state(cast(GdkDevice*)this._cPtr);
    gid.gdk4.types.ModifierType _retval = cast(gid.gdk4.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      The name of the device, suitable for showing in a user interface.
      Returns: a name
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_name(cast(GdkDevice*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves whether the Num Lock modifier of the keyboard is locked.
      
      This is only relevant for keyboard devices.
      Returns: true if Num Lock is on for device
  */
  bool getNumLockState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_num_lock_state(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the number of touch points associated to device.
      Returns: the number of touch points
  */
  uint getNumTouches() nothrow
  {
    uint _retval;
    _retval = gdk_device_get_num_touches(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Returns the product ID of this device.
      
      This ID is retrieved from the device, and does not change.
      See [gid.gdk4.device.Device.getVendorId] for more information.
      Returns: the product ID
  */
  string getProductId() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_product_id(cast(GdkDevice*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves whether the Scroll Lock modifier of the keyboard is locked.
      
      This is only relevant for keyboard devices.
      Returns: true if Scroll Lock is on for device
  */
  bool getScrollLockState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_scroll_lock_state(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gid.gdk4.seat.Seat] the device belongs to.
      Returns: a [gid.gdk4.seat.Seat]
  */
  gid.gdk4.seat.Seat getSeat() nothrow
  {
    GdkSeat* _cretval;
    _cretval = gdk_device_get_seat(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the type of the device.
      Returns: a [gid.gdk4.types.InputSource]
  */
  gid.gdk4.types.InputSource getSource() nothrow
  {
    GdkInputSource _cretval;
    _cretval = gdk_device_get_source(cast(GdkDevice*)this._cPtr);
    gid.gdk4.types.InputSource _retval = cast(gid.gdk4.types.InputSource)_cretval;
    return _retval;
  }

  /**
      Obtains the surface underneath device, returning the location of the
      device in win_x and win_y.
      
      Returns null if the surface tree under device is not known to GDK
      (for example, belongs to another application).
  
      Params:
        winX = return location for the X coordinate
            of the device location relative to the surface origin
        winY = return location for the Y coordinate
            of the device location relative to the surface origin
      Returns: the [gid.gdk4.surface.Surface] under the
          device position
  */
  gid.gdk4.surface.Surface getSurfaceAtPosition(out double winX, out double winY) nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_device_get_surface_at_position(cast(GdkDevice*)this._cPtr, cast(double*)&winX, cast(double*)&winY);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the timestamp of the last activity for this device.
      
      In practice, this means the timestamp of the last event that was
      received from the OS for this device. (GTK may occasionally produce
      events for a device that are not received from the OS, and will not
      update the timestamp).
      Returns: the timestamp of the last activity for this device
  */
  uint getTimestamp() nothrow
  {
    uint _retval;
    _retval = gdk_device_get_timestamp(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Returns the vendor ID of this device.
      
      This ID is retrieved from the device, and does not change.
      
      This function, together with [gid.gdk4.device.Device.getProductId],
      can be used to eg. compose [gid.gio2.settings.Settings] paths to store settings
      for this device.
      
      ```c
       static GSettings *
       get_device_settings (GdkDevice *device)
       {
         const char *vendor, *product;
         GSettings *settings;
         GdkDevice *device;
         char *path;
      
         vendor = gdk_device_get_vendor_id (device);
         product = gdk_device_get_product_id (device);
      
         path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
         settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
         g_free (path);
      
         return settings;
       }
      ```
      Returns: the vendor ID
  */
  string getVendorId() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_vendor_id(cast(GdkDevice*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Determines if layouts for both right-to-left and
      left-to-right languages are in use on the keyboard.
      
      This is only relevant for keyboard devices.
      Returns: true if there are layouts with both directions, false otherwise
  */
  bool hasBidiLayouts() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_has_bidi_layouts(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted either when the number of either axes or keys changes.
        
        On X11 this will normally happen when the physical device
        routing events through the logical device changes (for
        example, user switches from the USB mouse to a tablet); in
        that case the logical device will change to reflect the axes
        and keys on the new physical device.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device.Device device)`
  
          `device` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device.Device)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.device.Device.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `ToolChanged` signal.
  
      Emitted on pen/eraser devices whenever tools enter or leave proximity.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device_tool.DeviceTool tool, gid.gdk4.device.Device device)`
  
          `tool` The new current tool (optional)
  
          `device` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToolChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.device.Device)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.device.Device.toolChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.device.Device]
class DeviceGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `display` property.
      Params:
        propval = The [gid.gdk4.display.Display] the [gid.gdk4.device.Device] pertains to.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }

  /**
      Set `hasCursor` property.
      Params:
        propval = Whether the device is represented by a cursor on the screen.
      Returns: Builder instance for fluent chaining
  */
  T hasCursor(bool propval) nothrow
  {
    return setProperty("has-cursor", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The device name.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `numTouches` property.
      Params:
        propval = The maximal number of concurrent touches on a touch device.
          
          Will be 0 if the device is not a touch device or if the number
          of touches is unknown.
      Returns: Builder instance for fluent chaining
  */
  T numTouches(uint propval) nothrow
  {
    return setProperty("num-touches", propval);
  }

  /**
      Set `productId` property.
      Params:
        propval = Product ID of this device.
          
          See [gid.gdk4.device.Device.getProductId].
      Returns: Builder instance for fluent chaining
  */
  T productId(string propval) nothrow
  {
    return setProperty("product-id", propval);
  }

  /**
      Set `seat` property.
      Params:
        propval = [gid.gdk4.seat.Seat] of this device.
      Returns: Builder instance for fluent chaining
  */
  T seat(gid.gdk4.seat.Seat propval) nothrow
  {
    return setProperty("seat", propval);
  }

  /**
      Set `source` property.
      Params:
        propval = Source type for the device.
      Returns: Builder instance for fluent chaining
  */
  T source(gid.gdk4.types.InputSource propval) nothrow
  {
    return setProperty("source", propval);
  }

  /**
      Set `vendorId` property.
      Params:
        propval = Vendor ID of this device.
          
          See [gid.gdk4.device.Device.getVendorId].
      Returns: Builder instance for fluent chaining
  */
  T vendorId(string propval) nothrow
  {
    return setProperty("vendor-id", propval);
  }
}

/// Fluent builder for [gid.gdk4.device.Device]
final class DeviceGidBuilder : DeviceGidBuilderImpl!DeviceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Device build() nothrow
  {
    return new Device(cast(void*)createGObject(Device._getGType), Yes.Take);
  }
}
