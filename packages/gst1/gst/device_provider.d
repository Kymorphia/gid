/// Module for [DeviceProvider] class
module gst.device_provider;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gst.bus;
import gst.c.functions;
import gst.c.types;
import gst.device;
import gst.device_provider_factory;
import gst.object;
import gst.plugin;
import gst.types;

/**
    A #GstDeviceProvider subclass is provided by a plugin that handles devices
    if there is a way to programmatically list connected devices. It can also
    optionally provide updates to the list of connected devices.
    
    Each #GstDeviceProvider subclass is a singleton, a plugin should
    normally provide a single subclass for all devices.
    
    Applications would normally use a #GstDeviceMonitor to monitor devices
    from all relevant providers.
*/
class DeviceProvider : gst.object.ObjectWrap
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
    return cast(void function())gst_device_provider_get_type != &gidSymbolNotFound ? gst_device_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceProvider self()
  {
    return this;
  }

  /**
      Create a new device providerfactory capable of instantiating objects of the
      type and add the factory to plugin.
  
      Params:
        plugin = #GstPlugin to register the device provider with, or null for
              a static device provider.
        name = name of device providers of this type
        rank = rank of device provider (higher rank means more importance when autoplugging)
        type = GType of device provider to register
      Returns: true, if the registering succeeded, false on error
  */
  static bool register(gst.plugin.Plugin plugin, string name, uint rank, gobject.types.GType type)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_device_provider_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, rank, type);
    return _retval;
  }

  /** */
  bool canMonitor()
  {
    bool _retval;
    _retval = cast(bool)gst_device_provider_can_monitor(cast(GstDeviceProvider*)this._cPtr);
    return _retval;
  }

  /**
      Posts a message on the provider's #GstBus to inform applications that
      a new device has been added.
      
      This is for use by subclasses.
      
      device's reference count will be incremented, and any floating reference
      will be removed (see [gst.object.ObjectWrap.refSink]).
  
      Params:
        device = a #GstDevice that has been added
  */
  void deviceAdd(gst.device.Device device)
  {
    gst_device_provider_device_add(cast(GstDeviceProvider*)this._cPtr, device ? cast(GstDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      This function is used when changed_device was modified into its new form
      device. This will post a `DEVICE_CHANGED` message on the bus to let
      the application know that the device was modified. #GstDevice is immutable
      for MT. safety purposes so this is an "atomic" way of letting the application
      know when a device was modified.
  
      Params:
        device = the new version of changed_device
        changedDevice = the old version of the device that has been updated
  */
  void deviceChanged(gst.device.Device device, gst.device.Device changedDevice)
  {
    gst_device_provider_device_changed(cast(GstDeviceProvider*)this._cPtr, device ? cast(GstDevice*)device._cPtr(No.Dup) : null, changedDevice ? cast(GstDevice*)changedDevice._cPtr(No.Dup) : null);
  }

  /**
      Posts a message on the provider's #GstBus to inform applications that
      a device has been removed.
      
      This is for use by subclasses.
  
      Params:
        device = a #GstDevice that has been removed
  */
  void deviceRemove(gst.device.Device device)
  {
    gst_device_provider_device_remove(cast(GstDeviceProvider*)this._cPtr, device ? cast(GstDevice*)device._cPtr(No.Dup) : null);
  }

  /**
      Gets the #GstBus of this #GstDeviceProvider
      Returns: a #GstBus
  */
  gst.bus.Bus getBus()
  {
    GstBus* _cretval;
    _cretval = gst_device_provider_get_bus(cast(GstDeviceProvider*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.bus.Bus)(cast(GstBus*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a list of devices that this provider understands. This may actually
      probe the hardware if the provider is not currently started.
      
      If the provider has been started, this will returned the same #GstDevice
      objedcts that have been returned by the #GST_MESSAGE_DEVICE_ADDED messages.
      Returns: a #GList of
          #GstDevice
  */
  gst.device.Device[] getDevices()
  {
    GList* _cretval;
    _cretval = gst_device_provider_get_devices(cast(GstDeviceProvider*)this._cPtr);
    auto _retval = gListToD!(gst.device.Device, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Retrieves the factory that was used to create this device provider.
      Returns: the #GstDeviceProviderFactory used for
            creating this device provider. no refcounting is needed.
  */
  gst.device_provider_factory.DeviceProviderFactory getFactory()
  {
    GstDeviceProviderFactory* _cretval;
    _cretval = gst_device_provider_get_factory(cast(GstDeviceProvider*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.device_provider_factory.DeviceProviderFactory)(cast(GstDeviceProviderFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the provider factory names of the #GstDeviceProvider instances that
      are hidden by provider.
      Returns: a list of hidden providers factory names or null when
          nothing is hidden by provider. Free with g_strfreev.
  */
  string[] getHiddenProviders()
  {
    char** _cretval;
    _cretval = gst_device_provider_get_hidden_providers(cast(GstDeviceProvider*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Get metadata with key in provider.
  
      Params:
        key = the key to get
      Returns: the metadata for key.
  */
  string getMetadata(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_device_provider_get_metadata(cast(GstDeviceProvider*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Make provider hide the devices from the factory with name.
      
      This function is used when provider will also provide the devices reported
      by provider factory name. A monitor should stop monitoring the
      device provider with name to avoid duplicate devices.
  
      Params:
        name = a provider factory name
  */
  void hideProvider(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_device_provider_hide_provider(cast(GstDeviceProvider*)this._cPtr, _name);
  }

  /**
      This function can be used to know if the provider was successfully started.
      Returns: 
  */
  bool isStarted()
  {
    bool _retval;
    _retval = cast(bool)gst_device_provider_is_started(cast(GstDeviceProvider*)this._cPtr);
    return _retval;
  }

  /**
      Starts providering the devices. This will cause #GST_MESSAGE_DEVICE_ADDED
      and #GST_MESSAGE_DEVICE_REMOVED messages to be posted on the provider's bus
      when devices are added or removed from the system.
      
      Since the #GstDeviceProvider is a singleton,
      [gst.device_provider.DeviceProvider.start] may already have been called by another
      user of the object, [gst.device_provider.DeviceProvider.stop] needs to be called the same
      number of times.
      
      After this function has been called, [gst.device_provider.DeviceProvider.getDevices] will
      return the same objects that have been received from the
      #GST_MESSAGE_DEVICE_ADDED messages and will no longer probe.
      Returns: true if the device providering could be started
  */
  bool start()
  {
    bool _retval;
    _retval = cast(bool)gst_device_provider_start(cast(GstDeviceProvider*)this._cPtr);
    return _retval;
  }

  /**
      Decreases the use-count by one. If the use count reaches zero, this
      #GstDeviceProvider will stop providering the devices. This needs to be
      called the same number of times that [gst.device_provider.DeviceProvider.start] was called.
  */
  void stop()
  {
    gst_device_provider_stop(cast(GstDeviceProvider*)this._cPtr);
  }

  /**
      Make provider unhide the devices from factory name.
      
      This function is used when provider will no longer provide the devices
      reported by provider factory name. A monitor should start
      monitoring the devices from provider factory name in order to see
      all devices again.
  
      Params:
        name = a provider factory name
  */
  void unhideProvider(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_device_provider_unhide_provider(cast(GstDeviceProvider*)this._cPtr, _name);
  }

  /**
      Connect to `ProviderHidden` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string object, gst.device_provider.DeviceProvider deviceProvider))
  
          `object`  (optional)
  
          `deviceProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProviderHidden(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.device_provider.DeviceProvider)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-hidden", closure, after);
  }

  /**
      Connect to `ProviderUnhidden` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string object, gst.device_provider.DeviceProvider deviceProvider))
  
          `object`  (optional)
  
          `deviceProvider` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProviderUnhidden(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.device_provider.DeviceProvider)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("provider-unhidden", closure, after);
  }
}
