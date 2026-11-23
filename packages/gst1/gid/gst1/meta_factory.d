/// Module for [MetaFactory] class
module gid.gst1.meta_factory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.meta_info;
import gid.gst1.plugin;
import gid.gst1.plugin_feature;
import gid.gst1.types;

/**
    Register a #GstMetaInfo that can be automatically loaded the first time it is
    used.
    
    In general, applications and plugins don't need to use the factory
    beyond registering the meta in a plugin init function. Once that is
    done, the meta is stored in the registry, and ready as soon as the
    registry is loaded.
    
    ## Registering a meta for dynamic loading
    
    ```c
    
    static gboolean
    plugin_init (GstPlugin * plugin)
    {
      return gst_meta_factory_register (plugin, my_meta_get_info());
    }
    ```
*/
class MetaFactory : gid.gst1.plugin_feature.PluginFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_meta_factory_get_type != &gidSymbolNotFound ? gst_meta_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstMetaFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override MetaFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.meta_factory.MetaFactory]
      Returns: New builder object
  */
  static MetaFactoryGidBuilder builder() nothrow
  {
    return new MetaFactoryGidBuilder;
  }

  /**
      Loads a previously registered #GstMetaInfo from the registry.
  
      Params:
        factoryname = The name of the #GstMetaInfo to load
      Returns: A #GstMetaInfo or NULL if not found
  */
  static gid.gst1.meta_info.MetaInfo load(string factoryname) nothrow
  {
    const(GstMetaInfo)* _cretval;
    const(char)* _factoryname = factoryname.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_meta_factory_load(_factoryname);
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }

  /**
      Registers a new #GstMetaInfo in the registry
  
      Params:
        plugin = The #GstPlugin to register meta_info for
        metaInfo = The #GstMetaInfo to register
      Returns: 
  */
  static bool register(gid.gst1.plugin.Plugin plugin, gid.gst1.meta_info.MetaInfo metaInfo) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_meta_factory_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, cast(const(GstMetaInfo)*)&metaInfo);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.meta_factory.MetaFactory]
class MetaFactoryGidBuilderImpl(T) : gid.gst1.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.meta_factory.MetaFactory]
final class MetaFactoryGidBuilder : MetaFactoryGidBuilderImpl!MetaFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MetaFactory build() nothrow
  {
    return new MetaFactory(cast(void*)createGObject(MetaFactory._getGType), Yes.Take);
  }
}
