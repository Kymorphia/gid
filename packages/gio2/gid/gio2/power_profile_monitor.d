/// Module for [PowerProfileMonitor] interface
module gid.gio2.power_profile_monitor;

public import gid.core.basictypes;
public import gid.gio2.power_profile_monitor_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.initable;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.power_profile_monitor.PowerProfileMonitor] makes it possible for applications as well as OS
    components to monitor system power profiles and act upon them. It currently
    only exports whether the system is in “Power Saver” mode (known as
    “Low Power” mode on some systems).
    
    When in “Low Power” mode, it is recommended that applications:
    
    - disable automatic downloads;
    - reduce the rate of refresh from online sources such as calendar or
      email synchronisation;
    - reduce the use of expensive visual effects.
    
    It is also likely that OS components providing services to applications will
    lower their own background activity, for the sake of the system.
    
    There are a variety of tools that exist for power consumption analysis, but those
    usually depend on the OS and hardware used. On Linux, one could use `upower` to
    monitor the battery discharge rate, `powertop` to check on the background activity
    or activity at all), `sysprof` to inspect CPU usage, and `intel_gpu_time` to
    profile GPU usage.
    
    Don’t forget to disconnect the [gid.gobject2.object.ObjectWrap.notify] signal for
    [gid.gio2.power_profile_monitor.PowerProfileMonitor.powerSaverEnabled], and unref the
    [gid.gio2.power_profile_monitor.PowerProfileMonitor] itself when exiting.
*/
@gidGir("PowerProfileMonitor", "PowerProfileMonitorInterface")
interface PowerProfileMonitor : gid.gio2.initable.Initable
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_power_profile_monitor_get_type != &gidSymbolNotFound ? g_power_profile_monitor_get_type() : cast(GType)0;
  }

  /**
      Get `powerSaverEnabled` property.
      Returns: Whether “Power Saver” mode is enabled on the system.
  */
  @property bool powerSaverEnabled() nothrow;

  /**
      Gets a reference to the default #GPowerProfileMonitor for the system.
      Returns: a new reference to the default #GPowerProfileMonitor
  */
  static gid.gio2.power_profile_monitor.PowerProfileMonitor dupDefault() nothrow
  {
    GPowerProfileMonitor* _cretval;
    _cretval = g_power_profile_monitor_dup_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.power_profile_monitor.PowerProfileMonitor)(cast(GPowerProfileMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether the system is in “Power Saver” mode.
      
      You are expected to listen to the
      #GPowerProfileMonitor::notify::power-saver-enabled signal to know when the profile has
      changed.
      Returns: Whether the system is in “Power Saver” mode.
  */
  bool getPowerSaverEnabled();
}

/// Fluent builder implementation template for [gid.gio2.power_profile_monitor.PowerProfileMonitor]
interface PowerProfileMonitorGidBuilderImpl(T) : gid.gio2.initable.InitableGidBuilderImpl!T
{
}
