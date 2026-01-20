/// Module for [DebugController] interface mixin
module gio.debug_controller_mixin;

public import gio.debug_controller_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;

/**
    [gio.debug_controller.DebugController] is an interface to expose control of debugging features and
    debug output.
    
    It is implemented on Linux using [gio.debug_controller_dbus.DebugControllerDBus], which
    exposes a D-Bus interface to allow authenticated peers to control debug
    features in this process.
    
    Whether debug output is enabled is exposed as
    `property@Gio.DebugController:debug-enabled`. This controls
    `func@GLib.log_set_debug_enabled` by default. Application code may
    connect to the [gobject.object.ObjectWrap.notify] signal for it
    to control other parts of its debug infrastructure as necessary.
    
    If your application or service is using the default GLib log writer function,
    creating one of the built-in implementations of [gio.debug_controller.DebugController] should be
    all that’s needed to dynamically enable or disable debug output.
*/
template DebugControllerT()
{

  /**
      Get `debugEnabled` property.
      Returns: true if debug output should be exposed (for example by forwarding it to
        the journal), false otherwise.
  */
  @property bool debugEnabled()
  {
    return getDebugEnabled();
  }

  /**
      Set `debugEnabled` property.
      Params:
        propval = true if debug output should be exposed (for example by forwarding it to
          the journal), false otherwise.
  */
  @property void debugEnabled(bool propval)
  {
    return setDebugEnabled(propval);
  }

  /**
      Get the value of #GDebugController:debug-enabled.
      Returns: true if debug output should be exposed, false otherwise
  */
  override bool getDebugEnabled()
  {
    bool _retval;
    _retval = cast(bool)g_debug_controller_get_debug_enabled(cast(GDebugController*)this._cPtr);
    return _retval;
  }

  /**
      Set the value of #GDebugController:debug-enabled.
  
      Params:
        debugEnabled = true if debug output should be exposed, false otherwise
  */
  override void setDebugEnabled(bool debugEnabled)
  {
    g_debug_controller_set_debug_enabled(cast(GDebugController*)this._cPtr, debugEnabled);
  }
}
