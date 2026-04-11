/// Module for [DynamicTypeFactory] class
module gst.dynamic_type_factory;

import gid.gid;
import gobject.gid_builder;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.plugin_feature;
import gst.types;

/**
    #GstDynamicTypeFactory is used to represent a type that can be
    automatically loaded the first time it is used. For example,
    a non-standard type for use in caps fields.
    
    In general, applications and plugins don't need to use the factory
    beyond registering the type in a plugin init function. Once that is
    done, the type is stored in the registry, and ready as soon as the
    registry is loaded.
    
    ## Registering a type for dynamic loading
    
    ```c
    
    static gboolean
    plugin_init (GstPlugin * plugin)
    {
      return gst_dynamic_type_register (plugin, GST_TYPE_CUSTOM_CAPS_FIELD);
    }
    ```
*/
class DynamicTypeFactory : gst.plugin_feature.PluginFeature
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
    return cast(void function())gst_dynamic_type_factory_get_type != &gidSymbolNotFound ? gst_dynamic_type_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DynamicTypeFactory self()
  {
    return this;
  }

  /**
      Get builder for [gst.dynamic_type_factory.DynamicTypeFactory]
      Returns: New builder object
  */
  static DynamicTypeFactoryGidBuilder builder()
  {
    return new DynamicTypeFactoryGidBuilder;
  }

  /** */
  static gobject.types.GType load(string factoryname)
  {
    gobject.types.GType _retval;
    const(char)* _factoryname = factoryname.toCString(No.Alloc);
    _retval = gst_dynamic_type_factory_load(_factoryname);
    return _retval;
  }
}

/// Fluent builder implementation template for [gst.dynamic_type_factory.DynamicTypeFactory]
class DynamicTypeFactoryGidBuilderImpl(T) : gst.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gst.dynamic_type_factory.DynamicTypeFactory]
final class DynamicTypeFactoryGidBuilder : DynamicTypeFactoryGidBuilderImpl!DynamicTypeFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DynamicTypeFactory build()
  {
    return new DynamicTypeFactory(cast(void*)createGObject(DynamicTypeFactory._getGType), No.Take);
  }
}
