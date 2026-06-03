/// Module for [Tracer] class
module gst.tracer;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.plugin;
import gst.types;

/**
    Tracing modules will subclass #GstTracer and register through
    [gst.tracer.Tracer.register]. Modules can attach to various hook-types - see
    [gst.global.tracingRegisterHook]. When invoked they receive hook specific
    contextual data, which they must not modify.
*/
class Tracer : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_tracer_get_type != &gidSymbolNotFound ? gst_tracer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tracer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gst.tracer.Tracer]
      Returns: New builder object
  */
  static TracerGidBuilder builder() nothrow
  {
    return new TracerGidBuilder;
  }

  /** */
  @property string params() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("params");
  }

  /** */
  @property void params(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("params", propval);
  }

  /**
      Create a new tracer-factory  capable of instantiating objects of the
      type and add the factory to plugin.
  
      Params:
        plugin = A #GstPlugin, or null for a static typefind function
        name = The name for registering
        type = GType of tracer to register
      Returns: true, if the registering succeeded, false on error
  */
  static bool register(gst.plugin.Plugin plugin, string name, gobject.types.GType type) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_tracer_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, type);
    return _retval;
  }
}

/// Fluent builder implementation template for [gst.tracer.Tracer]
class TracerGidBuilderImpl(T) : gst.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T params(string propval) nothrow
  {
    return setProperty("params", propval);
  }
}

/// Fluent builder for [gst.tracer.Tracer]
final class TracerGidBuilder : TracerGidBuilderImpl!TracerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Tracer build() nothrow
  {
    return new Tracer(cast(void*)createGObject(Tracer._getGType), No.Take);
  }
}
