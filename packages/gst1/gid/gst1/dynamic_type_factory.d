/// Module for [DynamicTypeFactory] class
module gid.gst1.dynamic_type_factory;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.plugin_feature;
import gid.gst1.types;

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
class DynamicTypeFactory : gid.gst1.plugin_feature.PluginFeature
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
    return cast(void function())gst_dynamic_type_factory_get_type != &gidSymbolNotFound ? gst_dynamic_type_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDynamicTypeFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override DynamicTypeFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.dynamic_type_factory.DynamicTypeFactory]
      Returns: New builder object
  */
  static DynamicTypeFactoryGidBuilder builder() nothrow
  {
    return new DynamicTypeFactoryGidBuilder;
  }

  /** */
  static gid.gobject2.types.GType load(string factoryname) nothrow
  {
    gid.gobject2.types.GType _retval;
    const(char)* _factoryname = factoryname.toCString!(No.Malloc, No.Nullable);
    _retval = gst_dynamic_type_factory_load(_factoryname);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.dynamic_type_factory.DynamicTypeFactory]
class DynamicTypeFactoryGidBuilderImpl(T) : gid.gst1.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.dynamic_type_factory.DynamicTypeFactory]
final class DynamicTypeFactoryGidBuilder : DynamicTypeFactoryGidBuilderImpl!DynamicTypeFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DynamicTypeFactory build() nothrow
  {
    return new DynamicTypeFactory(cast(void*)createGObject(DynamicTypeFactory._getGType), Yes.Take);
  }
}
