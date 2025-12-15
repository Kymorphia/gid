/// Module for [PowerProfileMonitor] interface mixin
module gio.power_profile_monitor_mixin;

public import gio.power_profile_monitor_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import gobject.object;

/**
    [gio.power_profile_monitor.PowerProfileMonitor] makes it possible for applications as well as OS
    components to monitor system power profiles and act upon them. It currently
    only exports whether the system is in “Power Saver” mode (known as
    “Low Power” mode on some systems).
    
    When in “Low Power” mode, it is recommended that applications:
    $(LIST
      * disable automatic downloads;
      * reduce the rate of refresh from online sources such as calendar or
        email synchronisation;
      * reduce the use of expensive visual effects.
    )
      
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
template PowerProfileMonitorT()
{

  /**
      Get `powerSaverEnabled` property.
      Returns: Whether “Power Saver” mode is enabled on the system.
  */
  @property bool powerSaverEnabled()
  {
    return getPowerSaverEnabled();
  }


  /**
      Gets whether the system is in “Power Saver” mode.
      
      You are expected to listen to the
      #GPowerProfileMonitor::notify::power-saver-enabled signal to know when the profile has
      changed.
      Returns: Whether the system is in “Power Saver” mode.
  */
  override bool getPowerSaverEnabled()
  {
    bool _retval;
    _retval = cast(bool)g_power_profile_monitor_get_power_saver_enabled(cast(GPowerProfileMonitor*)this._cPtr);
    return _retval;
  }
}
