/// Module for [PowerProfileMonitor] interface
module gio.power_profile_monitor;

public import gio.power_profile_monitor_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.power_profile_monitor.PowerProfileMonitor] makes it possible for applications as well as OS
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
    
    Don’t forget to disconnect the [gobject.object.ObjectWrap.notify] signal for
    `property@Gio.PowerProfileMonitor:power-saver-enabled`, and unref the
    [gio.power_profile_monitor.PowerProfileMonitor] itself when exiting.
*/
interface PowerProfileMonitor
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_power_profile_monitor_get_type != &gidSymbolNotFound ? g_power_profile_monitor_get_type() : cast(GType)0;
  }

  /**
      Get `powerSaverEnabled` property.
      Returns: Whether “Power Saver” mode is enabled on the system.
  */
  @property bool powerSaverEnabled();

  /**
      Gets a reference to the default #GPowerProfileMonitor for the system.
      Returns: a new reference to the default #GPowerProfileMonitor
  */
  static gio.power_profile_monitor.PowerProfileMonitor dupDefault()
  {
    GPowerProfileMonitor* _cretval;
    _cretval = g_power_profile_monitor_dup_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.power_profile_monitor.PowerProfileMonitor)(cast(GPowerProfileMonitor*)_cretval, Yes.Take);
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

/// Fluent builder implementation template for [gio.power_profile_monitor.PowerProfileMonitor]
interface PowerProfileMonitorGidBuilderImpl(T)
{
}
