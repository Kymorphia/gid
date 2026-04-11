/// Module for [DeviceTool] class
module gdk.device_tool;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
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

  /** */
  @property gdk.types.AxisFlags axes()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.types.AxisFlags)("axes");
  }

  /** */
  @property ulong hardwareId()
  {
    return getHardwareId();
  }

  /** */
  @property ulong serial()
  {
    return getSerial();
  }

  /** */
  @property gdk.types.DeviceToolType toolType()
  {
    return getToolType();
  }

  /**
      Gets the hardware ID of this tool, or 0 if it's not known. When
      non-zero, the identificator is unique for the given tool model,
      meaning that two identical tools will share the same hardware_id,
      but will have different serial numbers (see [gdk.device_tool.DeviceTool.getSerial]).
      
      This is a more concrete (and device specific) method to identify
      a #GdkDeviceTool than [gdk.device_tool.DeviceTool.getToolType], as a tablet
      may support multiple devices with the same #GdkDeviceToolType,
      but having different hardware identificators.
      Returns: The hardware identificator of this tool.
  */
  ulong getHardwareId()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_hardware_id(cast(GdkDeviceTool*)this._cPtr);
    return _retval;
  }

  /**
      Gets the serial of this tool, this value can be used to identify a
      physical tool (eg. a tablet pen) across program executions.
      Returns: The serial ID for this tool
  */
  ulong getSerial()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_serial(cast(GdkDeviceTool*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GdkDeviceToolType of the tool.
      Returns: The physical type for this tool. This can be used to figure out what
        sort of pen is being used, such as an airbrush or a pencil.
  */
  gdk.types.DeviceToolType getToolType()
  {
    GdkDeviceToolType _cretval;
    _cretval = gdk_device_tool_get_tool_type(cast(GdkDeviceTool*)this._cPtr);
    gdk.types.DeviceToolType _retval = cast(gdk.types.DeviceToolType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gdk.device_tool.DeviceTool]
class DeviceToolGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T axes(gdk.types.AxisFlags propval)
  {
    return setProperty("axes", propval);
  }

  /** */
  T hardwareId(ulong propval)
  {
    return setProperty("hardware-id", propval);
  }

  /** */
  T serial(ulong propval)
  {
    return setProperty("serial", propval);
  }

  /** */
  T toolType(gdk.types.DeviceToolType propval)
  {
    return setProperty("tool-type", propval);
  }
}

/// Fluent builder for [gdk.device_tool.DeviceTool]
final class DeviceToolGidBuilder : DeviceToolGidBuilderImpl!DeviceToolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceTool build()
  {
    return new DeviceTool(cast(void*)createGObject(DeviceTool._getGType), No.Take);
  }
}
