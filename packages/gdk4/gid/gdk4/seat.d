/// Module for [Seat] class
module gid.gdk4.seat;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.device;
import gid.gdk4.device_tool;
import gid.gdk4.display;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Represents a collection of input devices that belong to a user.
*/
class Seat : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_seat_get_type != &gidSymbolNotFound ? gdk_seat_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkSeat";
  }

  /** Returns `this`, for use in `with` statements. */
  override Seat self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.seat.Seat]
      Returns: New builder object
  */
  static SeatGidBuilder builder() nothrow
  {
    return new SeatGidBuilder;
  }

  /**
      Get `display` property.
      Returns: [gid.gdk4.display.Display] of this seat.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Returns the capabilities this [gid.gdk4.seat.Seat] currently has.
      Returns: the seat capabilities
  */
  gid.gdk4.types.SeatCapabilities getCapabilities() nothrow
  {
    GdkSeatCapabilities _cretval;
    _cretval = gdk_seat_get_capabilities(cast(GdkSeat*)this._cPtr);
    gid.gdk4.types.SeatCapabilities _retval = cast(gid.gdk4.types.SeatCapabilities)_cretval;
    return _retval;
  }

  /**
      Returns the devices that match the given capabilities.
  
      Params:
        capabilities = capabilities to get devices for
      Returns: A list
          of `GdkDevices`. The list must be freed with [gid.glib2.list.List.free],
          the elements are owned by GTK and must not be freed.
  */
  gid.gdk4.device.Device[] getDevices(gid.gdk4.types.SeatCapabilities capabilities) nothrow
  {
    GList* _cretval;
    _cretval = gdk_seat_get_devices(cast(GdkSeat*)this._cPtr, capabilities);
    auto _retval = gListToD!(gid.gdk4.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the [gid.gdk4.display.Display] this seat belongs to.
      Returns: a [gid.gdk4.display.Display]. This object
          is owned by GTK and must not be freed.
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_seat_get_display(cast(GdkSeat*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes keyboard events.
      Returns: a [gid.gdk4.device.Device] with keyboard
          capabilities. This object is owned by GTK and must not be freed.
  */
  gid.gdk4.device.Device getKeyboard() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_keyboard(cast(GdkSeat*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes pointer events.
      Returns: a [gid.gdk4.device.Device] with pointer
          capabilities. This object is owned by GTK and must not be freed.
  */
  gid.gdk4.device.Device getPointer() nothrow
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_pointer(cast(GdkSeat*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns all `GdkDeviceTools` that are known to the application.
      Returns: A list of tools. Free with [gid.glib2.list.List.free].
  */
  gid.gdk4.device_tool.DeviceTool[] getTools() nothrow
  {
    GList* _cretval;
    _cretval = gdk_seat_get_tools(cast(GdkSeat*)this._cPtr);
    auto _retval = gListToD!(gid.gdk4.device_tool.DeviceTool, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Connect to `DeviceAdded` signal.
  
      Emitted when a new input device is related to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device.Device device, gid.gdk4.seat.Seat seat)`
  
          `device` the newly added [gid.gdk4.device.Device]. (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeviceAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device.Device)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.seat.Seat)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.seat.Seat.deviceAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-added", closure, after);
  }

  /**
      Connect to `DeviceRemoved` signal.
  
      Emitted when an input device is removed (e.g. unplugged).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device.Device device, gid.gdk4.seat.Seat seat)`
  
          `device` the just removed [gid.gdk4.device.Device]. (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeviceRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device.Device)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.seat.Seat)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.seat.Seat.deviceRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-removed", closure, after);
  }

  /**
      Connect to `ToolAdded` signal.
  
      Emitted whenever a new tool is made known to the seat.
        
        The tool may later be assigned to a device (i.e. on
        proximity with a tablet). The device will emit the
        [gid.gdk4.device.Device.toolChanged] signal accordingly.
        
        A same tool may be used by several devices.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device_tool.DeviceTool tool, gid.gdk4.seat.Seat seat)`
  
          `tool` the new [gid.gdk4.device_tool.DeviceTool] known to the seat (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToolAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.seat.Seat)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.seat.Seat.toolAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-added", closure, after);
  }

  /**
      Connect to `ToolRemoved` signal.
  
      Emitted whenever a tool is no longer known to this seat.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.device_tool.DeviceTool tool, gid.gdk4.seat.Seat seat)`
  
          `tool` the just removed [gid.gdk4.device_tool.DeviceTool] (optional)
  
          `seat` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToolRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.device_tool.DeviceTool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.seat.Seat)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.seat.Seat.toolRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-removed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.seat.Seat]
class SeatGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `display` property.
      Params:
        propval = [gid.gdk4.display.Display] of this seat.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gid.gdk4.seat.Seat]
final class SeatGidBuilder : SeatGidBuilderImpl!SeatGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Seat build() nothrow
  {
    return new Seat(cast(void*)createGObject(Seat._getGType), Yes.Take);
  }
}
