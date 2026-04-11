/// Module for [TracerFactory] class
module gst.tracer_factory;

import gid.gid;
import gobject.gid_builder;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.plugin_feature;
import gst.types;

/**
    Use [gst.tracer_factory.TracerFactory.getList] to get a list of tracer factories known to
    GStreamer.
*/
class TracerFactory : gst.plugin_feature.PluginFeature
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
    return cast(void function())gst_tracer_factory_get_type != &gidSymbolNotFound ? gst_tracer_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TracerFactory self()
  {
    return this;
  }

  /**
      Get builder for [gst.tracer_factory.TracerFactory]
      Returns: New builder object
  */
  static TracerFactoryGidBuilder builder()
  {
    return new TracerFactoryGidBuilder;
  }

  /**
      Gets the list of all registered tracer factories. You must free the
      list using [gst.plugin_feature.PluginFeature.listFree].
      
      The returned factories are sorted by factory name.
      
      Free-function: gst_plugin_feature_list_free
      Returns: the list of all
            registered #GstTracerFactory.
  */
  static gst.tracer_factory.TracerFactory[] getList()
  {
    GList* _cretval;
    _cretval = gst_tracer_factory_get_list();
    auto _retval = gListToD!(gst.tracer_factory.TracerFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the #GType for elements managed by this factory. The type can
      only be retrieved if the element factory is loaded, which can be
      assured with [gst.plugin_feature.PluginFeature.load].
      Returns: the #GType for tracers managed by this factory or 0 if
        the factory is not loaded.
  */
  gobject.types.GType getTracerType()
  {
    gobject.types.GType _retval;
    _retval = gst_tracer_factory_get_tracer_type(cast(GstTracerFactory*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gst.tracer_factory.TracerFactory]
class TracerFactoryGidBuilderImpl(T) : gst.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gst.tracer_factory.TracerFactory]
final class TracerFactoryGidBuilder : TracerFactoryGidBuilderImpl!TracerFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TracerFactory build()
  {
    return new TracerFactory(cast(void*)createGObject(TracerFactory._getGType), No.Take);
  }
}
