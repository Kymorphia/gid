/// Module for [Seat] class
module gdk.seat;

import gdk.c.functions;
import gdk.c.types;
import gdk.cursor;
import gdk.device;
import gdk.device_tool;
import gdk.display;
import gdk.event;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The #GdkSeat object represents a collection of input devices
    that belong to a user.
*/
class Seat : gobject.object.ObjectWrap
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
    return cast(void function())gdk_seat_get_type != &gidSymbolNotFound ? gdk_seat_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Seat self()
  {
    return this;
  }

  /**
      Returns the capabilities this #GdkSeat currently has.
      Returns: the seat capabilities
  */
  gdk.types.SeatCapabilities getCapabilities()
  {
    GdkSeatCapabilities _cretval;
    _cretval = gdk_seat_get_capabilities(cast(GdkSeat*)this._cPtr);
    gdk.types.SeatCapabilities _retval = cast(gdk.types.SeatCapabilities)_cretval;
    return _retval;
  }

  /**
      Returns the #GdkDisplay this seat belongs to.
      Returns: a #GdkDisplay. This object is owned by GTK+
                 and must not be freed.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_seat_get_display(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the master device that routes keyboard events.
      Returns: a master #GdkDevice with keyboard
                 capabilities. This object is owned by GTK+ and must not be freed.
  */
  gdk.device.Device getKeyboard()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_keyboard(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the master device that routes pointer events.
      Returns: a master #GdkDevice with pointer
                 capabilities. This object is owned by GTK+ and must not be freed.
  */
  gdk.device.Device getPointer()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_pointer(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the slave devices that match the given capabilities.
  
      Params:
        capabilities = capabilities to get devices for
      Returns: A list of #GdkDevices.
                 The list must be freed with [glib.list.List.free], the elements are owned
                 by GDK and must not be freed.
  */
  gdk.device.Device[] getSlaves(gdk.types.SeatCapabilities capabilities)
  {
    GList* _cretval;
    _cretval = gdk_seat_get_slaves(cast(GdkSeat*)this._cPtr, capabilities);
    auto _retval = gListToD!(gdk.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Grabs the seat so that all events corresponding to the given capabilities
      are passed to this application until the seat is ungrabbed with [gdk.seat.Seat.ungrab],
      or the window becomes hidden. This overrides any previous grab on the
      seat by this client.
      
      As a rule of thumb, if a grab is desired over [gdk.types.SeatCapabilities.Pointer],
      all other "pointing" capabilities (eg. [gdk.types.SeatCapabilities.Touch]) should
      be grabbed too, so the user is able to interact with all of those while
      the grab holds, you should thus use [gdk.types.SeatCapabilities.AllPointing] most
      commonly.
      
      Grabs are used for operations which need complete control over the
      events corresponding to the given capabilities. For example in GTK+ this
      is used for Drag and Drop operations, popup menus and such.
      
      Note that if the event mask of a #GdkWindow has selected both button press
      and button release events, or touch begin and touch end, then a press event
      will cause an automatic grab until the button is released, equivalent to a
      grab on the window with owner_events set to true. This is done because most
      applications expect to receive paired press and release events.
      
      If you set up anything at the time you take the grab that needs to be
      cleaned up when the grab ends, you should handle the #GdkEventGrabBroken
      events that are emitted when the grab ends unvoluntarily.
  
      Params:
        window = the #GdkWindow which will own the grab
        capabilities = capabilities that will be grabbed
        ownerEvents = if false then all device events are reported with respect to
                         window and are only reported if selected by event_mask. If
                         true then pointer events for this application are reported
                         as normal, but pointer events outside this application are
                         reported with respect to window and only if selected by
                         event_mask. In either mode, unreported events are discarded.
        cursor = the cursor to display while the grab is active. If
                   this is null then the normal cursors are used for
                   window and its descendants, and the cursor for window is used
                   elsewhere.
        event = the event that is triggering the grab, or null if none
                  is available.
        prepareFunc = function to
                         prepare the window to be grabbed, it can be null if window is
                         visible before this call.
      Returns: [gdk.types.GrabStatus.Success] if the grab was successful.
  */
  gdk.types.GrabStatus grab(gdk.window.Window window, gdk.types.SeatCapabilities capabilities, bool ownerEvents, gdk.cursor.Cursor cursor = null, gdk.event.Event event = null, gdk.types.SeatGrabPrepareFunc prepareFunc = null)
  {
    extern(C) void _prepareFuncCallback(GdkSeat* seat, GdkWindow* window, void* userData)
    {
      auto _dlg = cast(gdk.types.SeatGrabPrepareFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gdk.seat.Seat)(cast(void*)seat, No.Take), gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(void*)window, No.Take));
    }
    auto _prepareFuncCB = prepareFunc ? &_prepareFuncCallback : null;
    GdkGrabStatus _cretval;
    auto _prepareFunc = prepareFunc ? cast(void*)&(prepareFunc) : null;
    _cretval = gdk_seat_grab(cast(GdkSeat*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, capabilities, ownerEvents, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null, event ? cast(const(GdkEvent)*)event._cPtr(No.Dup) : null, _prepareFuncCB, _prepareFunc);
    gdk.types.GrabStatus _retval = cast(gdk.types.GrabStatus)_cretval;
    return _retval;
  }

  /**
      Releases a grab added through [gdk.seat.Seat.grab].
  */
  void ungrab()
  {
    gdk_seat_ungrab(cast(GdkSeat*)this._cPtr);
  }

  /**
      Connect to `DeviceAdded` signal.
  
      The ::device-added signal is emitted when a new input
        device is related to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device.Device device, gdk.seat.Seat seat))
  
          `device` the newly added #GdkDevice. (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeviceAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.device.Device)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.seat.Seat)))
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
    return connectSignalClosure("device-added", closure, after);
  }

  /**
      Connect to `DeviceRemoved` signal.
  
      The ::device-removed signal is emitted when an
        input device is removed (e.g. unplugged).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device.Device device, gdk.seat.Seat seat))
  
          `device` the just removed #GdkDevice. (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeviceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.device.Device)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.seat.Seat)))
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
    return connectSignalClosure("device-removed", closure, after);
  }

  /**
      Connect to `ToolAdded` signal.
  
      The ::tool-added signal is emitted whenever a new tool
        is made known to the seat. The tool may later be assigned
        to a device (i.e. on proximity with a tablet). The device
        will emit the #GdkDevice::tool-changed signal accordingly.
        
        A same tool may be used by several devices.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat))
  
          `tool` the new #GdkDeviceTool known to the seat (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToolAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.seat.Seat)))
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
    return connectSignalClosure("tool-added", closure, after);
  }

  /**
      Connect to `ToolRemoved` signal.
  
      This signal is emitted whenever a tool is no longer known
        to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat))
  
          `tool` the just removed #GdkDeviceTool (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToolRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.seat.Seat)))
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
    return connectSignalClosure("tool-removed", closure, after);
  }
}
