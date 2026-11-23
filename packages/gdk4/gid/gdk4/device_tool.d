/// Module for [DeviceTool] class
module gid.gdk4.device_tool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A physical tool associated to a [gid.gdk4.device.Device].
*/
class DeviceTool : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_device_tool_get_type != &gidSymbolNotFound ? gdk_device_tool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDeviceTool";
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceTool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.device_tool.DeviceTool]
      Returns: New builder object
  */
  static DeviceToolGidBuilder builder() nothrow
  {
    return new DeviceToolGidBuilder;
  }

  /**
      Get `axes` property.
      Returns: The axes of the tool.
  */
  @property gid.gdk4.types.AxisFlags axes() nothrow
  {
    return getAxes();
  }

  /**
      Get `hardwareId` property.
      Returns: The hardware ID of the tool.
  */
  @property ulong hardwareId() nothrow
  {
    return getHardwareId();
  }

  /**
      Get `serial` property.
      Returns: The serial number of the tool.
  */
  @property ulong serial() nothrow
  {
    return getSerial();
  }

  /**
      Get `toolType` property.
      Returns: The type of the tool.
  */
  @property gid.gdk4.types.DeviceToolType toolType() nothrow
  {
    return getToolType();
  }

  /**
      Gets the axes of the tool.
      Returns: the axes of tool
  */
  gid.gdk4.types.AxisFlags getAxes() nothrow
  {
    GdkAxisFlags _cretval;
    _cretval = gdk_device_tool_get_axes(cast(GdkDeviceTool*)this._cPtr);
    gid.gdk4.types.AxisFlags _retval = cast(gid.gdk4.types.AxisFlags)_cretval;
    return _retval;
  }

  /**
      Gets the hardware ID of this tool, or 0 if it's not known.
      
      When non-zero, the identifier is unique for the given tool model,
      meaning that two identical tools will share the same hardware_id,
      but will have different serial numbers (see
      [gid.gdk4.device_tool.DeviceTool.getSerial]).
      
      This is a more concrete (and device specific) method to identify
      a [gid.gdk4.device_tool.DeviceTool] than [gid.gdk4.device_tool.DeviceTool.getToolType],
      as a tablet may support multiple devices with the same
      [gid.gdk4.types.DeviceToolType], but different hardware identifiers.
      Returns: The hardware identifier of this tool.
  */
  ulong getHardwareId() nothrow
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
  ulong getSerial() nothrow
  {
    ulong _retval;
    _retval = gdk_device_tool_get_serial(cast(GdkDeviceTool*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gdk4.types.DeviceToolType] of the tool.
      Returns: The physical type for this tool. This can be used to
          figure out what sort of pen is being used, such as an airbrush
          or a pencil.
  */
  gid.gdk4.types.DeviceToolType getToolType() nothrow
  {
    GdkDeviceToolType _cretval;
    _cretval = gdk_device_tool_get_tool_type(cast(GdkDeviceTool*)this._cPtr);
    gid.gdk4.types.DeviceToolType _retval = cast(gid.gdk4.types.DeviceToolType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.device_tool.DeviceTool]
class DeviceToolGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `axes` property.
      Params:
        propval = The axes of the tool.
      Returns: Builder instance for fluent chaining
  */
  T axes(gid.gdk4.types.AxisFlags propval) nothrow
  {
    return setProperty("axes", propval);
  }

  /**
      Set `hardwareId` property.
      Params:
        propval = The hardware ID of the tool.
      Returns: Builder instance for fluent chaining
  */
  T hardwareId(ulong propval) nothrow
  {
    return setProperty("hardware-id", propval);
  }

  /**
      Set `serial` property.
      Params:
        propval = The serial number of the tool.
      Returns: Builder instance for fluent chaining
  */
  T serial(ulong propval) nothrow
  {
    return setProperty("serial", propval);
  }

  /**
      Set `toolType` property.
      Params:
        propval = The type of the tool.
      Returns: Builder instance for fluent chaining
  */
  T toolType(gid.gdk4.types.DeviceToolType propval) nothrow
  {
    return setProperty("tool-type", propval);
  }
}

/// Fluent builder for [gid.gdk4.device_tool.DeviceTool]
final class DeviceToolGidBuilder : DeviceToolGidBuilderImpl!DeviceToolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceTool build() nothrow
  {
    return new DeviceTool(cast(void*)createGObject(DeviceTool._getGType), Yes.Take);
  }
}
