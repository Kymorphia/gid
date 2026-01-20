/// Module for [Seat] class
module gdk.seat;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.device_tool;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The [gdk.seat.Seat] object represents a collection of input devices
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
      Returns the capabilities this [gdk.seat.Seat] currently has.
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
      Returns the devices that match the given capabilities.
  
      Params:
        capabilities = capabilities to get devices for
      Returns: A list
          of `GdkDevices`. The list must be freed with [glib.list.List.free],
          the elements are owned by GTK and must not be freed.
  */
  gdk.device.Device[] getDevices(gdk.types.SeatCapabilities capabilities)
  {
    GList* _cretval;
    _cretval = gdk_seat_get_devices(cast(GdkSeat*)this._cPtr, capabilities);
    auto _retval = gListToD!(gdk.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the [gdk.display.Display] this seat belongs to.
      Returns: a [gdk.display.Display]. This object
          is owned by GTK and must not be freed.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_seat_get_display(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes keyboard events.
      Returns: a [gdk.device.Device] with keyboard
          capabilities. This object is owned by GTK and must not be freed.
  */
  gdk.device.Device getKeyboard()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_keyboard(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes pointer events.
      Returns: a [gdk.device.Device] with pointer
          capabilities. This object is owned by GTK and must not be freed.
  */
  gdk.device.Device getPointer()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_pointer(cast(GdkSeat*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns all `GdkDeviceTools` that are known to the application.
      Returns: A list of tools. Free with [glib.list.List.free].
  */
  gdk.device_tool.DeviceTool[] getTools()
  {
    GList* _cretval;
    _cretval = gdk_seat_get_tools(cast(GdkSeat*)this._cPtr);
    auto _retval = gListToD!(gdk.device_tool.DeviceTool, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Connect to `DeviceAdded` signal.
  
      Emitted when a new input device is related to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device.Device device, gdk.seat.Seat seat))
  
          `device` the newly added [gdk.device.Device]. (optional)
  
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
  
      Emitted when an input device is removed (e.g. unplugged).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device.Device device, gdk.seat.Seat seat))
  
          `device` the just removed [gdk.device.Device]. (optional)
  
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
  
      Emitted whenever a new tool is made known to the seat.
        
        The tool may later be assigned to a device (i.e. on
        proximity with a tablet). The device will emit the
        `signalGdk.Device::tool-changed` signal accordingly.
        
        A same tool may be used by several devices.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat))
  
          `tool` the new [gdk.device_tool.DeviceTool] known to the seat (optional)
  
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
  
      Emitted whenever a tool is no longer known to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat))
  
          `tool` the just removed [gdk.device_tool.DeviceTool] (optional)
  
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
