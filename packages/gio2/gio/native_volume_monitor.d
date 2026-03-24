/// Module for [NativeVolumeMonitor] class
module gio.native_volume_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gio.volume_monitor;
import gobject.gid_builder;

/** */
class NativeVolumeMonitor : gio.volume_monitor.VolumeMonitor
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
    return cast(void function())g_native_volume_monitor_get_type != &gidSymbolNotFound ? g_native_volume_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeVolumeMonitor self()
  {
    return this;
  }

  /**
  Get builder for [gio.native_volume_monitor.NativeVolumeMonitor]
  Returns: New builder object
  */
  static NativeVolumeMonitorGidBuilder builder()
  {
    return new NativeVolumeMonitorGidBuilder;
  }
}

class NativeVolumeMonitorGidBuilderImpl(T) : gio.volume_monitor.VolumeMonitorGidBuilderImpl!T
{
}

/// Fluent builder for [gio.native_volume_monitor.NativeVolumeMonitor]
final class NativeVolumeMonitorGidBuilder : NativeVolumeMonitorGidBuilderImpl!NativeVolumeMonitorGidBuilder
{
  NativeVolumeMonitor build()
  {
    return new NativeVolumeMonitor(cast(void*)createGObject(NativeVolumeMonitor._getGType), No.Take);
  }
}
