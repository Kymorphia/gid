/// Module for [NativeVolumeMonitor] class
module gid.gio2.native_volume_monitor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gio2.volume_monitor;
import gid.gobject2.gid_builder;

/** */
class NativeVolumeMonitor : gid.gio2.volume_monitor.VolumeMonitor
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
    return cast(void function())g_native_volume_monitor_get_type != &gidSymbolNotFound ? g_native_volume_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GNativeVolumeMonitor";
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeVolumeMonitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.native_volume_monitor.NativeVolumeMonitor]
      Returns: New builder object
  */
  static NativeVolumeMonitorGidBuilder builder() nothrow
  {
    return new NativeVolumeMonitorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gio2.native_volume_monitor.NativeVolumeMonitor]
class NativeVolumeMonitorGidBuilderImpl(T) : gid.gio2.volume_monitor.VolumeMonitorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.native_volume_monitor.NativeVolumeMonitor]
final class NativeVolumeMonitorGidBuilder : NativeVolumeMonitorGidBuilderImpl!NativeVolumeMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NativeVolumeMonitor build() nothrow
  {
    return new NativeVolumeMonitor(cast(void*)createGObject(NativeVolumeMonitor._getGType), Yes.Take);
  }
}
