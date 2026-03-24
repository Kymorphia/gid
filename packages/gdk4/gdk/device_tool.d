/// Module for [DeviceTool] class
module gdk.device_tool;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A physical tool associated to a [gdk.device.Device].
*/
class DeviceTool : gobject.object.ObjectWrap
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
    return cast(void function())gdk_device_tool_get_type != &gidSymbolNotFound ? gdk_device_tool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceTool self()
  {
    return this;
  }

  /**
  Get builder for [gdk.device_tool.DeviceTool]
  Returns: New builder object
  */
  static DeviceToolGidBuilder builder()
  {
    return new DeviceToolGidBuilder;
  }

  /**
      Get `axes` property.
      Returns: The axes of the tool.
  */
  @property gdk.types.AxisFlags axes()
  {
    return getAxes();
  }

  /**
      Get `hardwareId` property.
      Returns: The hardware ID of the tool.
  */
  @property ulong hardwareId()
  {
    return getHardwareId();
  }

  /**
      Get `serial` property.
      Returns: The serial number of the tool.
  */
  @property ulong serial()
  {
    return getSerial();
  }

  /**
      Get `toolType` property.
      Returns: The type of the tool.
  */
  @property gdk.types.DeviceToolType toolType()
  {
    return getToolType();
  }

  /**
      Gets the axes of the tool.
      Returns: the axes of tool
  */
  gdk.types.AxisFlags getAxes()
  {
    GdkAxisFlags _cretval;
    _cretval = gdk_device_tool_get_axes(cast(GdkDeviceTool*)this._cPtr);
    gdk.types.AxisFlags _retval = cast(gdk.types.AxisFlags)_cretval;
    return _retval;
  }

  /**
      Gets the hardware ID of this tool, or 0 if it's not known.
      
      When non-zero, the identifier is unique for the given tool model,
      meaning that two identical tools will share the same hardware_id,
      but will have different serial numbers (see
      [gdk.device_tool.DeviceTool.getSerial]).
      
      This is a more concrete (and device specific) method to identify
      a [gdk.device_tool.DeviceTool] than [gdk.device_tool.DeviceTool.getToolType],
      as a tablet may support multiple devices with the same
      [gdk.types.DeviceToolType], but different hardware identifiers.
      Returns: The hardware identifier of this tool.
  */
  ulong getHardwareId()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_hardware_id(cast(GdkDeviceTool*)this._cPtr);
    return _retval;
  }

  /**
      Gets the serial number of this tool.
      
      This value can be used to identify a physical tool
      (eg. a tablet pen) across program executions.
      Returns: The serial ID for this tool
  */
  ulong getSerial()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_serial(cast(GdkDeviceTool*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gdk.types.DeviceToolType] of the tool.
      Returns: The physical type for this tool. This can be used to
          figure out what sort of pen is being used, such as an airbrush
          or a pencil.
  */
  gdk.types.DeviceToolType getToolType()
  {
    GdkDeviceToolType _cretval;
    _cretval = gdk_device_tool_get_tool_type(cast(GdkDeviceTool*)this._cPtr);
    gdk.types.DeviceToolType _retval = cast(gdk.types.DeviceToolType)_cretval;
    return _retval;
  }
}

class DeviceToolGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `axes` property.
      Params:
        propval = The axes of the tool.
      Returns: Builder instance for fluent chaining
  */
  T axes(gdk.types.AxisFlags propval)
  {
    return setProperty("axes", propval);
  }

  /**
      Set `hardwareId` property.
      Params:
        propval = The hardware ID of the tool.
      Returns: Builder instance for fluent chaining
  */
  T hardwareId(ulong propval)
  {
    return setProperty("hardware-id", propval);
  }

  /**
      Set `serial` property.
      Params:
        propval = The serial number of the tool.
      Returns: Builder instance for fluent chaining
  */
  T serial(ulong propval)
  {
    return setProperty("serial", propval);
  }

  /**
      Set `toolType` property.
      Params:
        propval = The type of the tool.
      Returns: Builder instance for fluent chaining
  */
  T toolType(gdk.types.DeviceToolType propval)
  {
    return setProperty("tool-type", propval);
  }
}

/// Fluent builder for [gdk.device_tool.DeviceTool]
final class DeviceToolGidBuilder : DeviceToolGidBuilderImpl!DeviceToolGidBuilder
{
  DeviceTool build()
  {
    return new DeviceTool(cast(void*)createGObject(DeviceTool._getGType), No.Take);
  }
}
