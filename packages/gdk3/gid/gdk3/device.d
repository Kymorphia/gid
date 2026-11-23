/// Module for [Device] class
module gid.gdk3.device;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.atom;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.cursor;
import gid.gdk3.device_manager;
import gid.gdk3.device_tool;
import gid.gdk3.display;
import gid.gdk3.screen;
import gid.gdk3.seat;
import gid.gdk3.types;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The #GdkDevice object represents a single input device, such
    as a keyboard, a mouse, a touchpad, etc.
    
    See the #GdkDeviceManager documentation for more information
    about the various kinds of master and slave devices, and their
    relationships.
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
      [gobject.object.GObjectSubclass]).
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
      Get builder for [gid.gdk3.device.Device]
      Returns: New builder object
  */
  static DeviceGidBuilder builder() nothrow
  {
    return new DeviceGidBuilder;
  }

  /**
      Get `associatedDevice` property.
      Returns: Associated pointer or keyboard with this device, if any. Devices of type #GDK_DEVICE_TYPE_MASTER
        always come in keyboard/pointer pairs. Other device types will have a null associated device.
  */
  @property gid.gdk3.device.Device associatedDevice() nothrow
  {
    return getAssociatedDevice();
  }

  /**
      Get `axes` property.
      Returns: The axes currently available for this device.
  */
  @property gid.gdk3.types.AxisFlags axes() nothrow
  {
    return getAxes();
  }

  /**
      Get `deviceManager` property.
      Returns: The #GdkDeviceManager the #GdkDevice pertains to.
  */
  @property gid.gdk3.device_manager.DeviceManager deviceManager() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.device_manager.DeviceManager)("device-manager");
  }

  /**
      Get `display` property.
      Returns: The #GdkDisplay the #GdkDevice pertains to.
  */
  @property gid.gdk3.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `hasCursor` property.
      Returns: Whether the device is represented by a cursor on the screen. Devices of type
        [gid.gdk3.types.DeviceType.Master] will have true here.
  */
  @property bool hasCursor() nothrow
  {
    return getHasCursor();
  }

  /** */
  @property gid.gdk3.types.InputMode inputMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.InputMode)("input-mode");
  }

  /** */
  @property void inputMode(gid.gdk3.types.InputMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.types.InputMode)("input-mode", propval);
  }

  /**
      Get `inputSource` property.
      Returns: Source type for the device.
  */
  @property gid.gdk3.types.InputSource inputSource() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.InputSource)("input-source");
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
      Get `numTouches` property.
      Returns: The maximal number of concurrent touches on a touch device.
        Will be 0 if the device is not a touch device or if the number
        of touches is unknown.
  */
  @property uint numTouches() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("num-touches");
  }

  /**
      Get `productId` property.
      Returns: Product ID of this device, see [gid.gdk4.device.Device.getProductId].
  */
  @property string productId() nothrow
  {
    return getProductId();
  }

  /**
      Get `seat` property.
      Returns: #GdkSeat of this device.
  */
  @property gid.gdk3.seat.Seat seat() nothrow
  {
    return getSeat();
  }

  /**
      Set `seat` property.
      Params:
        propval = #GdkSeat of this device.
  */
  @property void seat(gid.gdk3.seat.Seat propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.seat.Seat)("seat", propval);
  }

  /** */
  @property gid.gdk3.device_tool.DeviceTool tool() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.device_tool.DeviceTool)("tool");
  }

  /**
      Get `type` property.
      Returns: Device role in the device manager.
  */
  @property gid.gdk3.types.DeviceType type() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.DeviceType)("type");
  }

  /**
      Get `vendorId` property.
      Returns: Vendor ID of this device, see [gid.gdk4.device.Device.getVendorId].
  */
  @property string vendorId() nothrow
  {
    return getVendorId();
  }

  /**
      Determines information about the current keyboard grab.
      This is not public API and must not be used by applications.
  
      Params:
        display = the display for which to get the grab information
        device = device to get the grab information from
        grabWindow = location to store current grab window
        ownerEvents = location to store boolean indicating whether
            the owner_events flag to [gid.gdk3.global.keyboardGrab] or
            [gid.gdk3.global.pointerGrab] was true.
      Returns: true if this application currently has the
         keyboard grabbed.
  
      Deprecated: The symbol was never meant to be used outside
          of GTK+
  */
  static bool grabInfoLibgtkOnly(gid.gdk3.display.Display display, gid.gdk3.device.Device device, out gid.gdk3.window.Window grabWindow, out bool ownerEvents) nothrow
  {
    bool _retval;
    GdkWindow* _grabWindow;
    gboolean _ownerEvents;
    _retval = cast(bool)gdk_device_grab_info_libgtk_only(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, &_grabWindow, &_ownerEvents);
    grabWindow = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(_grabWindow, No.Take);
    ownerEvents = cast(bool)_ownerEvents;
    return _retval;
  }

  /**
      Returns the associated device to device, if device is of type
      [gid.gdk3.types.DeviceType.Master], it will return the paired pointer or
      keyboard.
      
      If device is of type [gid.gdk3.types.DeviceType.Slave], it will return
      the master device to which device is attached to.
      
      If device is of type [gid.gdk3.types.DeviceType.Floating], null will be
      returned, as there is no associated device.
      Returns: The associated device, or
          null
  */
  gid.gdk3.device.Device getAssociatedDevice() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_device_get_associated_device(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the axes currently available on the device.
      Returns: 
  */
  gid.gdk3.types.AxisFlags getAxes() nothrow
  {
    GdkAxisFlags _cretval;
    _cretval = gdk_device_get_axes(cast(GdkDevice*)this._cPtr);
    gid.gdk3.types.AxisFlags _retval = cast(gid.gdk3.types.AxisFlags)_cretval;
    return _retval;
  }

  /**
      Returns the axis use for index_.
  
      Params:
        index = the index of the axis.
      Returns: a #GdkAxisUse specifying how the axis is used.
  */
  gid.gdk3.types.AxisUse getAxisUse(uint index) nothrow
  {
    GdkAxisUse _cretval;
    _cretval = gdk_device_get_axis_use(cast(GdkDevice*)this._cPtr, index);
    gid.gdk3.types.AxisUse _retval = cast(gid.gdk3.types.AxisUse)_cretval;
    return _retval;
  }

  /**
      Returns the device type for device.
      Returns: the #GdkDeviceType for device.
  */
  gid.gdk3.types.DeviceType getDeviceType() nothrow
  {
    GdkDeviceType _cretval;
    _cretval = gdk_device_get_device_type(cast(GdkDevice*)this._cPtr);
    gid.gdk3.types.DeviceType _retval = cast(gid.gdk3.types.DeviceType)_cretval;
    return _retval;
  }

  /**
      Returns the #GdkDisplay to which device pertains.
      Returns: a #GdkDisplay. This memory is owned
                 by GTK+, and must not be freed or unreffed.
  */
  gid.gdk3.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_device_get_display(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the pointer follows device motion.
      This is not meaningful for keyboard devices, which don't have a pointer.
      Returns: true if the pointer follows device motion
  */
  bool getHasCursor() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_has_cursor(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      If index_ has a valid keyval, this function will return true
      and fill in keyval and modifiers with the keyval settings.
  
      Params:
        index = the index of the macro button to get.
        keyval = return value for the keyval.
        modifiers = return value for modifiers.
      Returns: true if keyval is set for index.
  */
  bool getKey(uint index, out uint keyval, out gid.gdk3.types.ModifierType modifiers) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_get_key(cast(GdkDevice*)this._cPtr, index, cast(uint*)&keyval, &modifiers);
    return _retval;
  }

  /**
      Gets information about which window the given pointer device is in, based on events
      that have been received so far from the display server. If another application
      has a pointer grab, or this application has a grab with owner_events = false,
      null may be returned even if the pointer is physically over one of this
      application's windows.
      Returns: the last window the device
  */
  gid.gdk3.window.Window getLastEventWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gdk_device_get_last_event_window(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the mode of the device.
      Returns: a #GdkInputSource
  */
  gid.gdk3.types.InputMode getMode() nothrow
  {
    GdkInputMode _cretval;
    _cretval = gdk_device_get_mode(cast(GdkDevice*)this._cPtr);
    gid.gdk3.types.InputMode _retval = cast(gid.gdk3.types.InputMode)_cretval;
    return _retval;
  }

  /**
      Returns the number of axes the device currently has.
      Returns: the number of axes.
  */
  int getNAxes() nothrow
  {
    int _retval;
    _retval = gdk_device_get_n_axes(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of keys the device currently has.
      Returns: the number of keys.
  */
  int getNKeys() nothrow
  {
    int _retval;
    _retval = gdk_device_get_n_keys(cast(GdkDevice*)this._cPtr);
    return _retval;
  }

  /**
      Determines the name of the device.
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
      Gets the current location of device. As a slave device
      coordinates are those of its master pointer, This function
      may not be called on devices of type [gid.gdk3.types.DeviceType.Slave],
      unless there is an ongoing grab on them, see [gid.gdk3.device.Device.grab].
  
      Params:
        screen = location to store the #GdkScreen
                   the device is on, or null.
        x = location to store root window X coordinate of device, or null.
        y = location to store root window Y coordinate of device, or null.
  */
  void getPosition(out gid.gdk3.screen.Screen screen, out int x, out int y) nothrow
  {
    GdkScreen* _screen;
    gdk_device_get_position(cast(GdkDevice*)this._cPtr, &_screen, cast(int*)&x, cast(int*)&y);
    screen = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(_screen, No.Take);
  }

  /**
      Gets the current location of device in double precision. As a slave device's
      coordinates are those of its master pointer, this function
      may not be called on devices of type [gid.gdk3.types.DeviceType.Slave],
      unless there is an ongoing grab on them. See [gid.gdk3.device.Device.grab].
  
      Params:
        screen = location to store the #GdkScreen
                   the device is on, or null.
        x = location to store root window X coordinate of device, or null.
        y = location to store root window Y coordinate of device, or null.
  */
  void getPositionDouble(out gid.gdk3.screen.Screen screen, out double x, out double y) nothrow
  {
    GdkScreen* _screen;
    gdk_device_get_position_double(cast(GdkDevice*)this._cPtr, &_screen, cast(double*)&x, cast(double*)&y);
    screen = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(_screen, No.Take);
  }

  /**
      Returns the product ID of this device, or null if this information couldn't
      be obtained. This ID is retrieved from the device, and is thus constant for
      it. See [gid.gdk4.device.Device.getVendorId] for more information.
      Returns: the product ID, or null
  */
  string getProductId() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_product_id(cast(GdkDevice*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the #GdkSeat the device belongs to.
      Returns: A #GdkSeat. This memory is owned by GTK+ and
                 must not be freed.
  */
  gid.gdk3.seat.Seat getSeat() nothrow
  {
    GdkSeat* _cretval;
    _cretval = gdk_device_get_seat(cast(GdkDevice*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the type of the device.
      Returns: a #GdkInputSource
  */
  gid.gdk3.types.InputSource getSource() nothrow
  {
    GdkInputSource _cretval;
    _cretval = gdk_device_get_source(cast(GdkDevice*)this._cPtr);
    gid.gdk3.types.InputSource _retval = cast(gid.gdk3.types.InputSource)_cretval;
    return _retval;
  }

  /**
      Returns the vendor ID of this device, or null if this information couldn't
      be obtained. This ID is retrieved from the device, and is thus constant for
      it.
      
      This function, together with [gid.gdk4.device.Device.getProductId], can be used to eg.
      compose #GSettings paths to store settings for this device.
      
      ```c
       static GSettings *
       get_device_settings (GdkDevice *device)
       {
         const gchar *vendor, *product;
         GSettings *settings;
         GdkDevice *device;
         gchar *path;
      
         vendor = gdk_device_get_vendor_id (device);
         product = gdk_device_get_product_id (device);
      
         path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
         settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
         g_free (path);
      
         return settings;
       }
      ```
      Returns: the vendor ID, or null
  */
  string getVendorId() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_vendor_id(cast(GdkDevice*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the window underneath device, returning the location of the device in win_x and win_y. Returns
      null if the window tree under device is not known to GDK (for example, belongs to another application).
      
      As a slave device coordinates are those of its master pointer, This
      function may not be called on devices of type [gid.gdk3.types.DeviceType.Slave],
      unless there is an ongoing grab on them, see [gid.gdk3.device.Device.grab].
  
      Params:
        winX = return location for the X coordinate of the device location,
                  relative to the window origin, or null.
        winY = return location for the Y coordinate of the device location,
                  relative to the window origin, or null.
      Returns: the #GdkWindow under the
        device position, or null.
  */
  gid.gdk3.window.Window getWindowAtPosition(out int winX, out int winY) nothrow
  {
    GdkWindow* _cretval;
    _cretval = gdk_device_get_window_at_position(cast(GdkDevice*)this._cPtr, cast(int*)&winX, cast(int*)&winY);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the window underneath device, returning the location of the device in win_x and win_y in
      double precision. Returns null if the window tree under device is not known to GDK (for example,
      belongs to another application).
      
      As a slave device coordinates are those of its master pointer, This
      function may not be called on devices of type [gid.gdk3.types.DeviceType.Slave],
      unless there is an ongoing grab on them, see [gid.gdk3.device.Device.grab].
  
      Params:
        winX = return location for the X coordinate of the device location,
                  relative to the window origin, or null.
        winY = return location for the Y coordinate of the device location,
                  relative to the window origin, or null.
      Returns: the #GdkWindow under the
          device position, or null.
  */
  gid.gdk3.window.Window getWindowAtPositionDouble(out double winX, out double winY) nothrow
  {
    GdkWindow* _cretval;
    _cretval = gdk_device_get_window_at_position_double(cast(GdkDevice*)this._cPtr, cast(double*)&winX, cast(double*)&winY);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Grabs the device so that all events coming from this device are passed to
      this application until the device is ungrabbed with [gid.gdk3.device.Device.ungrab],
      or the window becomes unviewable. This overrides any previous grab on the device
      by this client.
      
      Note that device and window need to be on the same display.
      
      Device grabs are used for operations which need complete control over the
      given device events (either pointer or keyboard). For example in GTK+ this
      is used for Drag and Drop operations, popup menus and such.
      
      Note that if the event mask of an X window has selected both button press
      and button release events, then a button press event will cause an automatic
      pointer grab until the button is released. X does this automatically since
      most applications expect to receive button press and release events in pairs.
      It is equivalent to a pointer grab on the window with owner_events set to
      true.
      
      If you set up anything at the time you take the grab that needs to be
      cleaned up when the grab ends, you should handle the #GdkEventGrabBroken
      events that are emitted when the grab ends unvoluntarily.
  
      Params:
        window = the #GdkWindow which will own the grab (the grab window)
        grabOwnership = specifies the grab ownership.
        ownerEvents = if false then all device events are reported with respect to
                         window and are only reported if selected by event_mask. If
                         true then pointer events for this application are reported
                         as normal, but pointer events outside this application are
                         reported with respect to window and only if selected by
                         event_mask. In either mode, unreported events are discarded.
        eventMask = specifies the event mask, which is used in accordance with
                       owner_events.
        cursor = the cursor to display while the grab is active if the device is
                   a pointer. If this is null then the normal cursors are used for
                   window and its descendants, and the cursor for window is used
                   elsewhere.
        time = the timestamp of the event which led to this pointer grab. This
                  usually comes from the #GdkEvent struct, though [gid.gdk4.types.CURRENT_TIME]
                  can be used if the time isn’t known.
      Returns: [gid.gdk3.types.GrabStatus.Success] if the grab was successful.
  
      Deprecated: Use [gid.gdk3.seat.Seat.grab] instead.
  */
  gid.gdk3.types.GrabStatus grab(gid.gdk3.window.Window window, gid.gdk3.types.GrabOwnership grabOwnership, bool ownerEvents, gid.gdk3.types.EventMask eventMask, gid.gdk3.cursor.Cursor cursor, uint time) nothrow
  {
    GdkGrabStatus _cretval;
    _cretval = gdk_device_grab(cast(GdkDevice*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, grabOwnership, ownerEvents, eventMask, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null, time);
    gid.gdk3.types.GrabStatus _retval = cast(gid.gdk3.types.GrabStatus)_cretval;
    return _retval;
  }

  /**
      Returns a #GList of #GdkAtoms, containing the labels for
      the axes that device currently has.
      Returns: A #GList of #GdkAtoms, free with [gid.glib2.list.List.free].
  */
  gid.gdk3.atom.Atom[] listAxes() nothrow
  {
    GList* _cretval;
    _cretval = gdk_device_list_axes(cast(GdkDevice*)this._cPtr);
    auto _retval = gListToD!(gid.gdk3.atom.Atom, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      If the device if of type [gid.gdk3.types.DeviceType.Master], it will return
      the list of slave devices attached to it, otherwise it will return
      null
      Returns: the list of slave devices, or null. The list must be
                 freed with [gid.glib2.list.List.free], the contents of the list are
                 owned by GTK+ and should not be freed.
  */
  gid.gdk3.device.Device[] listSlaveDevices() nothrow
  {
    GList* _cretval;
    _cretval = gdk_device_list_slave_devices(cast(GdkDevice*)this._cPtr);
    auto _retval = gListToD!(gid.gdk3.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Specifies how an axis of a device is used.
  
      Params:
        index = the index of the axis
        use = specifies how the axis is used
  */
  void setAxisUse(uint index, gid.gdk3.types.AxisUse use) nothrow
  {
    gdk_device_set_axis_use(cast(GdkDevice*)this._cPtr, index, use);
  }

  /**
      Specifies the X key event to generate when a macro button of a device
      is pressed.
  
      Params:
        index = the index of the macro button to set
        keyval = the keyval to generate
        modifiers = the modifiers to set
  */
  void setKey(uint index, uint keyval, gid.gdk3.types.ModifierType modifiers) nothrow
  {
    gdk_device_set_key(cast(GdkDevice*)this._cPtr, index, keyval, modifiers);
  }

  /**
      Sets a the mode of an input device. The mode controls if the
      device is active and whether the device’s range is mapped to the
      entire screen or to a single window.
      
      Note: This is only meaningful for floating devices, master devices (and
      slaves connected to these) drive the pointer cursor, which is not limited
      by the input mode.
  
      Params:
        mode = the input mode.
      Returns: true if the mode was successfully changed.
  */
  bool setMode(gid.gdk3.types.InputMode mode) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_device_set_mode(cast(GdkDevice*)this._cPtr, mode);
    return _retval;
  }

  /**
      Release any grab on device.
  
      Params:
        time = a timestap (e.g. [gid.gdk4.types.CURRENT_TIME]).
  
      Deprecated: Use [gid.gdk3.seat.Seat.ungrab] instead.
  */
  void ungrab(uint time) nothrow
  {
    gdk_device_ungrab(cast(GdkDevice*)this._cPtr, time);
  }

  /**
      Warps device in display to the point `x`,`y` on
      the screen screen, unless the device is confined
      to a window by a grab, in which case it will be moved
      as far as allowed by the grab. Warping the pointer
      creates events as if the user had moved the mouse
      instantaneously to the destination.
      
      Note that the pointer should normally be under the
      control of the user. This function was added to cover
      some rare use cases like keyboard navigation support
      for the color picker in the #GtkColorSelectionDialog.
  
      Params:
        screen = the screen to warp device to.
        x = the X coordinate of the destination.
        y = the Y coordinate of the destination.
  */
  void warp(gid.gdk3.screen.Screen screen, int x, int y) nothrow
  {
    gdk_device_warp(cast(GdkDevice*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, x, y);
  }

  /**
      Connect to `Changed` signal.
  
      The ::changed signal is emitted either when the #GdkDevice
        has changed the number of either axes or keys. For example
        In X this will normally happen when the slave device routing
        events through the master device changes (for example, user
        switches from the USB mouse to a tablet), in that case the
        master device will change to reflect the new slave device
        axes and keys.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.device.Device device)`
  
          `device` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.device.Device)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk3.device.Device.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `ToolChanged` signal.
  
      The ::tool-changed signal is emitted on pen/eraser
        #GdkDevices whenever tools enter or leave proximity.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.device_tool.DeviceTool tool, gid.gdk3.device.Device device)`
  
          `tool` The new current tool (optional)
  
          `device` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToolChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk3.device.Device)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk3.device.Device.toolChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk3.device.Device]
class DeviceGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `deviceManager` property.
      Params:
        propval = The #GdkDeviceManager the #GdkDevice pertains to.
      Returns: Builder instance for fluent chaining
  */
  T deviceManager(gid.gdk3.device_manager.DeviceManager propval) nothrow
  {
    return setProperty("device-manager", propval);
  }

  /**
      Set `display` property.
      Params:
        propval = The #GdkDisplay the #GdkDevice pertains to.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk3.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }

  /**
      Set `hasCursor` property.
      Params:
        propval = Whether the device is represented by a cursor on the screen. Devices of type
          [gid.gdk3.types.DeviceType.Master] will have true here.
      Returns: Builder instance for fluent chaining
  */
  T hasCursor(bool propval) nothrow
  {
    return setProperty("has-cursor", propval);
  }

  /** */
  T inputMode(gid.gdk3.types.InputMode propval) nothrow
  {
    return setProperty("input-mode", propval);
  }

  /**
      Set `inputSource` property.
      Params:
        propval = Source type for the device.
      Returns: Builder instance for fluent chaining
  */
  T inputSource(gid.gdk3.types.InputSource propval) nothrow
  {
    return setProperty("input-source", propval);
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
        propval = Product ID of this device, see [gid.gdk4.device.Device.getProductId].
      Returns: Builder instance for fluent chaining
  */
  T productId(string propval) nothrow
  {
    return setProperty("product-id", propval);
  }

  /**
      Set `seat` property.
      Params:
        propval = #GdkSeat of this device.
      Returns: Builder instance for fluent chaining
  */
  T seat(gid.gdk3.seat.Seat propval) nothrow
  {
    return setProperty("seat", propval);
  }

  /**
      Set `type` property.
      Params:
        propval = Device role in the device manager.
      Returns: Builder instance for fluent chaining
  */
  T type(gid.gdk3.types.DeviceType propval) nothrow
  {
    return setProperty("type", propval);
  }

  /**
      Set `vendorId` property.
      Params:
        propval = Vendor ID of this device, see [gid.gdk4.device.Device.getVendorId].
      Returns: Builder instance for fluent chaining
  */
  T vendorId(string propval) nothrow
  {
    return setProperty("vendor-id", propval);
  }
}

/// Fluent builder for [gid.gdk3.device.Device]
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
