/// Module for [TracerFactory] class
module gid.gst1.tracer_factory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.plugin_feature;
import gid.gst1.types;

/**
    Use [gid.gst1.tracer_factory.TracerFactory.getList] to get a list of tracer factories known to
    GStreamer.
*/
class TracerFactory : gid.gst1.plugin_feature.PluginFeature
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
    return cast(void function())gst_tracer_factory_get_type != &gidSymbolNotFound ? gst_tracer_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTracerFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override TracerFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.tracer_factory.TracerFactory]
      Returns: New builder object
  */
  static TracerFactoryGidBuilder builder() nothrow
  {
    return new TracerFactoryGidBuilder;
  }

  /**
      Gets the list of all registered tracer factories. You must free the
      list using [gid.gst1.plugin_feature.PluginFeature.listFree].
      
      The returned factories are sorted by factory name.
      
      Free-function: gst_plugin_feature_list_free
      Returns: the list of all
            registered #GstTracerFactory.
  */
  static gid.gst1.tracer_factory.TracerFactory[] getList() nothrow
  {
    GList* _cretval;
    _cretval = gst_tracer_factory_get_list();
    auto _retval = gListToD!(gid.gst1.tracer_factory.TracerFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the #GType for elements managed by this factory. The type can
      only be retrieved if the element factory is loaded, which can be
      assured with [gid.gst1.plugin_feature.PluginFeature.load].
      Returns: the #GType for tracers managed by this factory or 0 if
        the factory is not loaded.
  */
  gid.gobject2.types.GType getTracerType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gst_tracer_factory_get_tracer_type(cast(GstTracerFactory*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.tracer_factory.TracerFactory]
class TracerFactoryGidBuilderImpl(T) : gid.gst1.plugin_feature.PluginFeatureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.tracer_factory.TracerFactory]
final class TracerFactoryGidBuilder : TracerFactoryGidBuilderImpl!TracerFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TracerFactory build() nothrow
  {
    return new TracerFactory(cast(void*)createGObject(TracerFactory._getGType), Yes.Take);
  }
}
