/// Module for [BroadwayRenderer] class
module gid.gsk4.broadway_renderer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.renderer;
import gid.gsk4.types;

/**
    A Broadway based renderer.
    
    See [gid.gsk4.renderer.Renderer].
*/
class BroadwayRenderer : gid.gsk4.renderer.Renderer
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
    return cast(void function())gsk_broadway_renderer_get_type != &gidSymbolNotFound ? gsk_broadway_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GskBroadwayRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override BroadwayRenderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gsk4.broadway_renderer.BroadwayRenderer]
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
      call to [gid.gsk4.renderer.Renderer.realize].
      
      This function is only available when GTK was compiled with Broadway
      support.
      Returns: a new Broadway renderer.
  
      Deprecated: Broadway will be retired in GTK 5
  */
  this() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gsk_broadway_renderer_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gsk4.broadway_renderer.BroadwayRenderer]
class BroadwayRendererGidBuilderImpl(T) : gid.gsk4.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gsk4.broadway_renderer.BroadwayRenderer]
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
