/// Module for [DeviceTool] class
module gid.gdk3.device_tool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/** */
@gidGir("DeviceTool")
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
      Get builder for [gid.gdk3.device_tool.DeviceTool]
      Returns: New builder object
  */
  static DeviceToolGidBuilder builder() nothrow
  {
    return new DeviceToolGidBuilder;
  }

  /** */
  @property gid.gdk3.types.AxisFlags axes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.types.AxisFlags)("axes");
  }

  /** */
  @property ulong hardwareId() nothrow
  {
    return getHardwareId();
  }

  /** */
  @property ulong serial() nothrow
  {
    return getSerial();
  }

  /** */
  @property gid.gdk3.types.DeviceToolType toolType() nothrow
  {
    return getToolType();
  }

  /**
      Gets the hardware ID of this tool, or 0 if it's not known. When
      non-zero, the identificator is unique for the given tool model,
      meaning that two identical tools will share the same hardware_id,
      but will have different serial numbers (see [gid.gdk4.device_tool.DeviceTool.getSerial]).
      
      This is a more concrete (and device specific) method to identify
      a #GdkDeviceTool than [gid.gdk4.device_tool.DeviceTool.getToolType], as a tablet
      may support multiple devices with the same #GdkDeviceToolType,
      but having different hardware identificators.
      Returns: The hardware identificator of this tool.
  */
  ulong getHardwareId() nothrow
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
  ulong getSerial() nothrow
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
  gid.gdk3.types.DeviceToolType getToolType() nothrow
  {
    GdkDeviceToolType _cretval;
    _cretval = gdk_device_tool_get_tool_type(cast(GdkDeviceTool*)this._cPtr);
    gid.gdk3.types.DeviceToolType _retval = cast(gid.gdk3.types.DeviceToolType)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk3.device_tool.DeviceTool]
class DeviceToolGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T axes(gid.gdk3.types.AxisFlags propval) nothrow
  {
    return setProperty("axes", propval);
  }

  /** */
  T hardwareId(ulong propval) nothrow
  {
    return setProperty("hardware-id", propval);
  }

  /** */
  T serial(ulong propval) nothrow
  {
    return setProperty("serial", propval);
  }

  /** */
  T toolType(gid.gdk3.types.DeviceToolType propval) nothrow
  {
    return setProperty("tool-type", propval);
  }
}

/// Fluent builder for [gid.gdk3.device_tool.DeviceTool]
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
