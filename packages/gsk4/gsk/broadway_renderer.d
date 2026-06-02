/// Module for [BroadwayRenderer] class
module gsk.broadway_renderer;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/** */
class BroadwayRenderer : gsk.renderer.Renderer
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
    return cast(void function())gsk_broadway_renderer_get_type != &gidSymbolNotFound ? gsk_broadway_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BroadwayRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gsk.broadway_renderer.BroadwayRenderer]
      Returns: New builder object
  */
  static BroadwayRendererGidBuilder builder() nothrow
  {
    return new BroadwayRendererGidBuilder;
  }

  /**
      Creates a new Broadway renderer.
      
      The Broadway renderer is the default renderer for the broadway backend.
      It will only work with broadway surfaces, otherwise it will fail the
      call to [gsk.renderer.Renderer.realize].
      
      This function is only available when GTK was compiled with Broadway
      support.
      Returns: a new Broadway renderer.
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_broadway_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gsk.broadway_renderer.BroadwayRenderer]
class BroadwayRendererGidBuilderImpl(T) : gsk.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gsk.broadway_renderer.BroadwayRenderer]
final class BroadwayRendererGidBuilder : BroadwayRendererGidBuilderImpl!BroadwayRendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BroadwayRenderer build() nothrow
  {
    return new BroadwayRenderer(cast(void*)createGObject(BroadwayRenderer._getGType), Yes.Take);
  }
}
