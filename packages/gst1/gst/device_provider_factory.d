/// Module for [DeviceProviderFactory] class
module gst.device_provider_factory;

import gid.gid;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.device_provider;
import gst.plugin_feature;
import gst.types;

/**
    #GstDeviceProviderFactory is used to create instances of device providers. A
    GstDeviceProviderfactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gst.device_provider_factory.DeviceProviderFactory.find] and
    [gst.device_provider_factory.DeviceProviderFactory.get] functions to create device
    provider instances or use [gst.device_provider_factory.DeviceProviderFactory.getByName] as a
    convenient shortcut.
*/
class DeviceProviderFactory : gst.plugin_feature.PluginFeature
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
    return cast(void function())gst_device_provider_factory_get_type != &gidSymbolNotFound ? gst_device_provider_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceProviderFactory self()
  {
    return this;
  }

  /**
      Search for an device provider factory of the given name. Refs the returned
      device provider factory; caller is responsible for unreffing.
  
      Params:
        name = name of factory to find
      Returns: #GstDeviceProviderFactory if
        found, null otherwise
  */
  static gst.device_provider_factory.DeviceProviderFactory find(string name)
  {
    GstDeviceProviderFactory* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_device_provider_factory_find(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.device_provider_factory.DeviceProviderFactory)(cast(GstDeviceProviderFactory*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the device provider of the type defined by the given device
      provider factory.
  
      Params:
        factoryname = a named factory to instantiate
      Returns: a #GstDeviceProvider or null
        if unable to create device provider
  */
  static gst.device_provider.DeviceProvider getByName(string factoryname)
  {
    GstDeviceProvider* _cretval;
    const(char)* _factoryname = factoryname.toCString(No.Alloc);
    _cretval = gst_device_provider_factory_get_by_name(_factoryname);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.device_provider.DeviceProvider)(cast(GstDeviceProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a list of factories with a rank greater or equal to minrank.
      The list of factories is returned by decreasing rank.
  
      Params:
        minrank = Minimum rank
      Returns: a #GList of #GstDeviceProviderFactory device providers. Use
        [gst.plugin_feature.PluginFeature.listFree] after usage.
  */
  static gst.device_provider_factory.DeviceProviderFactory[] listGetDeviceProviders(gst.types.Rank minrank)
  {
    GList* _cretval;
    _cretval = gst_device_provider_factory_list_get_device_providers(minrank);
    auto _retval = gListToD!(gst.device_provider_factory.DeviceProviderFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the device provider of the type defined by the given device
      providerfactory.
      Returns: the #GstDeviceProvider or null
        if the device provider couldn't be created
  */
  gst.device_provider.DeviceProvider get()
  {
    GstDeviceProvider* _cretval;
    _cretval = gst_device_provider_factory_get(cast(GstDeviceProviderFactory*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.device_provider.DeviceProvider)(cast(GstDeviceProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #GType for device providers managed by this factory. The type can
      only be retrieved if the device provider factory is loaded, which can be
      assured with [gst.plugin_feature.PluginFeature.load].
      Returns: the #GType for device providers managed by this factory.
  */
  gobject.types.GType getDeviceProviderType()
  {
    gobject.types.GType _retval;
    _retval = gst_device_provider_factory_get_device_provider_type(cast(GstDeviceProviderFactory*)this._cPtr);
    return _retval;
  }

  /**
      Get the metadata on factory with key.
  
      Params:
        key = a key
      Returns: the metadata with key on factory or null
        when there was no metadata with the given key.
  */
  string getMetadata(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_device_provider_factory_get_metadata(cast(GstDeviceProviderFactory*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the available keys for the metadata on factory.
      Returns: a null-terminated array of key strings, or null when there is no
        metadata. Free with [glib.global.strfreev] when no longer needed.
  */
  string[] getMetadataKeys()
  {
    char** _cretval;
    _cretval = gst_device_provider_factory_get_metadata_keys(cast(GstDeviceProviderFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Check if factory matches all of the given classes
  
      Params:
        classes = a "/" separate list of classes to match, only match
              if all classes are matched
      Returns: true if factory matches or if classes is null.
  */
  bool hasClasses(string classes = null)
  {
    bool _retval;
    const(char)* _classes = classes.toCString(No.Alloc);
    _retval = cast(bool)gst_device_provider_factory_has_classes(cast(GstDeviceProviderFactory*)this._cPtr, _classes);
    return _retval;
  }

  /**
      Check if factory matches all of the given classes
  
      Params:
        classes = a null terminated array
            of classes to match, only match if all classes are matched
      Returns: true if factory matches.
  */
  bool hasClassesv(string[] classes = null)
  {
    bool _retval;
    char*[] _tmpclasses;
    foreach (s; classes)
      _tmpclasses ~= s.toCString(No.Alloc);
    _tmpclasses ~= null;
    char** _classes = _tmpclasses.ptr;

    _retval = cast(bool)gst_device_provider_factory_has_classesv(cast(GstDeviceProviderFactory*)this._cPtr, _classes);
    return _retval;
  }
}
