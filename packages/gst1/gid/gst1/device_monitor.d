/// Module for [DeviceMonitor] class
module gid.gst1.device_monitor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.bus;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.device;
import gid.gst1.object;
import gid.gst1.types;

/**
    Applications should create a #GstDeviceMonitor when they want
    to probe, list and monitor devices of a specific type. The
    #GstDeviceMonitor will create the appropriate
    #GstDeviceProvider objects and manage them. It will then post
    messages on its #GstBus for devices that have been added and
    removed.
    
    The device monitor will monitor all devices matching the filters that
    the application has set.
    
    The basic use pattern of a device monitor is as follows:
    ```
      static gboolean
      my_bus_func (GstBus * bus, GstMessage * message, gpointer user_data)
      {
         GstDevice *device;
         gchar *name;
    
         switch (GST_MESSAGE_TYPE (message)) {
           case GST_MESSAGE_DEVICE_ADDED:
             gst_message_parse_device_added (message, &device);
             name = gst_device_get_display_name (device);
             g_print("Device added: %s\n", name);
             g_free (name);
             gst_object_unref (device);
             break;
           case GST_MESSAGE_DEVICE_REMOVED:
             gst_message_parse_device_removed (message, &device);
             name = gst_device_get_display_name (device);
             g_print("Device removed: %s\n", name);
             g_free (name);
             gst_object_unref (device);
             break;
           default:
             break;
         }
    
         return G_SOURCE_CONTINUE;
      }
    
      GstDeviceMonitor *
      setup_raw_video_source_device_monitor (void) {
         GstDeviceMonitor *monitor;
         GstBus *bus;
         GstCaps *caps;
    
         monitor = gst_device_monitor_new ();
    
         bus = gst_device_monitor_get_bus (monitor);
         gst_bus_add_watch (bus, my_bus_func, NULL);
         gst_object_unref (bus);
    
         caps = gst_caps_new_empty_simple ("video/x-raw");
         gst_device_monitor_add_filter (monitor, "Video/Source", caps);
         gst_caps_unref (caps);
    
         gst_device_monitor_start (monitor);
    
         return monitor;
      }
    ```
*/
class DeviceMonitor : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_device_monitor_get_type != &gidSymbolNotFound ? gst_device_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDeviceMonitor";
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceMonitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.device_monitor.DeviceMonitor]
      Returns: New builder object
  */
  static DeviceMonitorGidBuilder builder() nothrow
  {
    return new DeviceMonitorGidBuilder;
  }

  /** */
  @property bool showAll() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-all");
  }

  /** */
  @property void showAll(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-all", propval);
  }

  /**
      Create a new #GstDeviceMonitor
      Returns: a new device monitor.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstDeviceMonitor* _cretval;
      _cretval = gst_device_monitor_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a filter for which #GstDevice will be monitored, any device that matches
      all these classes and the #GstCaps will be returned.
      
      If this function is called multiple times to add more filters, each will be
      matched independently. That is, adding more filters will not further restrict
      what devices are matched.
      
      The #GstCaps supported by the device as returned by [gid.gst1.device.Device.getCaps] are
      not intersected with caps filters added using this function.
      
      Filters must be added before the #GstDeviceMonitor is started.
  
      Params:
        classes = device classes to use as filter or null for any class
        caps = the #GstCaps to filter or null for ANY
      Returns: The id of the new filter or 0 if no provider matched the filter's
         classes.
  */
  uint addFilter(string classes = null, gid.gst1.caps.Caps caps = null) nothrow
  {
    uint _retval;
    const(char)* _classes = classes.toCString!(No.Malloc, Yes.Nullable);
    _retval = gst_device_monitor_add_filter(cast(GstDeviceMonitor*)this._cPtr, _classes, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the #GstBus of this #GstDeviceMonitor
      Returns: a #GstBus
  */
  gid.gst1.bus.Bus getBus() nothrow
  {
    GstBus* _cretval;
    _cretval = gst_device_monitor_get_bus(cast(GstDeviceMonitor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.bus.Bus)(cast(GstBus*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of devices from all of the relevant monitors. This may actually
      probe the hardware if the monitor is not currently started.
      Returns: a #GList of
          #GstDevice
  */
  gid.gst1.device.Device[] getDevices() nothrow
  {
    GList* _cretval;
    _cretval = gst_device_monitor_get_devices(cast(GstDeviceMonitor*)this._cPtr);
    auto _retval = gListToD!(gid.gst1.device.Device, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get a list of the currently selected device provider factories.
      
      This
      Returns: A list of device provider factory names that are currently being
            monitored by monitor or null when nothing is being monitored.
  */
  string[] getProviders() nothrow
  {
    char** _cretval;
    _cretval = gst_device_monitor_get_providers(cast(GstDeviceMonitor*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get if monitor is currently showing all devices, even those from hidden
      providers.
      Returns: true when all devices will be shown.
  */
  bool getShowAllDevices() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_device_monitor_get_show_all_devices(cast(GstDeviceMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Removes a filter from the #GstDeviceMonitor using the id that was returned
      by [gid.gst1.device_monitor.DeviceMonitor.addFilter].
  
      Params:
        filterId = the id of the filter
      Returns: true of the filter id was valid, false otherwise
  */
  bool removeFilter(uint filterId) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_device_monitor_remove_filter(cast(GstDeviceMonitor*)this._cPtr, filterId);
    return _retval;
  }

  /**
      Set if all devices should be visible, even those devices from hidden
      providers. Setting show_all to true might show some devices multiple times.
  
      Params:
        showAll = show all devices
  */
  void setShowAllDevices(bool showAll) nothrow
  {
    gst_device_monitor_set_show_all_devices(cast(GstDeviceMonitor*)this._cPtr, showAll);
  }

  /**
      Starts monitoring the devices, once this has succeeded, the
      [gid.gst1.types.MessageType.DeviceAdded] and [gid.gst1.types.MessageType.DeviceRemoved] messages
      will be emitted on the bus when the list of devices changes.
      
      Since 1.28, device providers are started asynchronously and
      [gid.gst1.types.MessageType.DeviceMonitorStarted] will be emitted once the initial list
      of devices has been populated, signalling that monitor startup has
      completed.
      
      The monitor will hold a strong reference to itself while it is populating
      devices asynchronously, so you must call [gid.gst1.device_monitor.DeviceMonitor.stop] before
      unreffing if you want monitoring to stop immediately.
      Returns: true if the device monitoring could be started, i.e. at least a
            single device provider was started successfully.
  */
  bool start() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_device_monitor_start(cast(GstDeviceMonitor*)this._cPtr);
    return _retval;
  }

  /**
      Stops monitoring the devices.
  */
  void stop() nothrow
  {
    gst_device_monitor_stop(cast(GstDeviceMonitor*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gst1.device_monitor.DeviceMonitor]
class DeviceMonitorGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T showAll(bool propval) nothrow
  {
    return setProperty("show-all", propval);
  }
}

/// Fluent builder for [gid.gst1.device_monitor.DeviceMonitor]
final class DeviceMonitorGidBuilder : DeviceMonitorGidBuilderImpl!DeviceMonitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceMonitor build() nothrow
  {
    return new DeviceMonitor(cast(void*)createGObject(DeviceMonitor._getGType), Yes.Take);
  }
}
