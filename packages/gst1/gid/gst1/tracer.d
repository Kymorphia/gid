/// Module for [Tracer] class
module gid.gst1.tracer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.plugin;
import gid.gst1.types;

/**
    Tracing modules will subclass #GstTracer and register through
    [gid.gst1.tracer.Tracer.register]. Modules can attach to various hook-types - see
    [gid.gst1.global.tracingRegisterHook]. When invoked they receive hook specific
    contextual data, which they must not modify.
*/
class Tracer : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_tracer_get_type != &gidSymbolNotFound ? gst_tracer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTracer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Tracer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.tracer.Tracer]
      Returns: New builder object
  */
  static TracerGidBuilder builder() nothrow
  {
    return new TracerGidBuilder;
  }

  /** */
  @property string params() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("params");
  }

  /** */
  @property void params(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("params", propval);
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
  static bool register(gid.gst1.plugin.Plugin plugin, string name, gid.gobject2.types.GType type) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_tracer_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, type);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.tracer.Tracer]
class TracerGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T params(string propval) nothrow
  {
    return setProperty("params", propval);
  }
}

/// Fluent builder for [gid.gst1.tracer.Tracer]
final class TracerGidBuilder : TracerGidBuilderImpl!TracerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Tracer build() nothrow
  {
    return new Tracer(cast(void*)createGObject(Tracer._getGType), Yes.Take);
  }
}
