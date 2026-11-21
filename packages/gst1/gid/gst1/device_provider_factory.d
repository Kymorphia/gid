/// Module for [DeviceProviderFactory] class
module gid.gst1.device_provider_factory;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.device_provider;
import gid.gst1.plugin_feature;
import gid.gst1.types;

/**
    #GstDeviceProviderFactory is used to create instances of device providers. A
    GstDeviceProviderfactory can be added to a #GstPlugin as it is also a
    #GstPluginFeature.
    
    Use the [gid.gst1.device_provider_factory.DeviceProviderFactory.find] and
    [gid.gst1.device_provider_factory.DeviceProviderFactory.get] functions to create device
    provider instances or use [gid.gst1.device_provider_factory.DeviceProviderFactory.getByName] as a
    convenient shortcut.
*/
class DeviceProviderFactory : gid.gst1.plugin_feature.PluginFeature
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
    return cast(void function())gst_device_provider_factory_get_type != &gidSymbolNotFound ? gst_device_provider_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDeviceProviderFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override DeviceProviderFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.device_provider_factory.DeviceProviderFactory]
      Returns: New builder object
  */
  static DeviceProviderFactoryGidBuilder builder() nothrow
  {
    return new DeviceProviderFactoryGidBuilder;
  }

  /**
      Search for an device provider factory of the given name. Refs the returned
      device provider factory; caller is responsible for unreffing.
  
      Params:
        name = name of factory to find
      Returns: #GstDeviceProviderFactory if
        found, null otherwise
  */
  static gid.gst1.device_provider_factory.DeviceProviderFactory find(string name) nothrow
  {
    GstDeviceProviderFactory* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_device_provider_factory_find(_name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.device_provider_factory.DeviceProviderFactory)(cast(GstDeviceProviderFactory*)_cretval, Yes.Take);
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
  static gid.gst1.device_provider.DeviceProvider getByName(string factoryname) nothrow
  {
    GstDeviceProvider* _cretval;
    const(char)* _factoryname = factoryname.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_device_provider_factory_get_by_name(_factoryname);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.device_provider.DeviceProvider)(cast(GstDeviceProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a list of factories with a rank greater or equal to minrank.
      The list of factories is returned by decreasing rank.
  
      Params:
        minrank = Minimum rank
      Returns: a #GList of #GstDeviceProviderFactory device providers. Use
        [gid.gst1.plugin_feature.PluginFeature.listFree] after usage.
  */
  static gid.gst1.device_provider_factory.DeviceProviderFactory[] listGetDeviceProviders(gid.gst1.types.Rank minrank) nothrow
  {
    GList* _cretval;
    _cretval = gst_device_provider_factory_list_get_device_providers(minrank);
    auto _retval = gListToD!(gid.gst1.device_provider_factory.DeviceProviderFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the device provider of the type defined by the given device
      providerfactory.
      Returns: the #GstDeviceProvider or null
        if the device provider couldn't be created
  */
  gid.gst1.device_provider.DeviceProvider get() nothrow
  {
    GstDeviceProvider* _cretval;
    _cretval = gst_device_provider_factory_get(cast(GstDeviceProviderFactory*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.device_provider.DeviceProvider)(cast(GstDeviceProvider*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #GType for device providers managed by this factory. The type can
      only be retrieved if the device provider factory is loaded, which can be
      assured with [gid.gst1.plugin_feature.PluginFeature.load].
      Returns: the #GType for device providers managed by this factory.
  */
  gid.gobject2.types.GType getDeviceProviderType() nothrow
  {
    gid.gobject2.types.GType _retval;
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
  string getMetadata(string key) nothrow
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_device_provider_factory_get_metadata(cast(GstDeviceProviderFactory*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the available keys for the metadata on factory.
      Returns: a null-terminated array of key strings, or null when there is no
        metadata. Free with [gid.glib2.global.strfreev] when no longer needed.
  */
  string[] getMetadataKeys() nothrow
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
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
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
  bool hasClasses(string classes = null) nothrow
  {
    bool _retval;
    const(char)* _classes = classes.toCString!(No.Malloc, Yes.Nullable);
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
  bool hasClassesv(string[] classes = null) nothrow
  {
    bool _retval;
    auto _classes_arr = new char*[](classes.length + 1);
    auto _classes = cast(char**)_classes_arr.ptr;
    foreach (i, s; classes) _classes[i] = s.toCString!(No.Malloc);
    _retval = cast(bool)gst_device_provider_factory_has_classesv(cast(GstDeviceProviderFactory*)this._cPtr, _classes);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.device_provider_factory.DeviceProviderFactory]
class DeviceProviderFactoryGidBuilderImpl(T) : gid.gst1.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.device_provider_factory.DeviceProviderFactory]
final class DeviceProviderFactoryGidBuilder : DeviceProviderFactoryGidBuilderImpl!DeviceProviderFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DeviceProviderFactory build() nothrow
  {
    return new DeviceProviderFactory(cast(void*)createGObject(DeviceProviderFactory._getGType), Yes.Take);
  }
}
