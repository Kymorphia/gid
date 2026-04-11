/// Module for [PixbufSimpleAnimIter] class
module gdkpixbuf.pixbuf_simple_anim_iter;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_animation_iter;
import gdkpixbuf.types;
import gid.gid;
import gobject.gid_builder;

/** */
class PixbufSimpleAnimIter : gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter
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
    return cast(void function())gdk_pixbuf_simple_anim_iter_get_type != &gidSymbolNotFound ? gdk_pixbuf_simple_anim_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufSimpleAnimIter self()
  {
    return this;
  }

  /**
      Get builder for [gdkpixbuf.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
      Returns: New builder object
  */
  static PixbufSimpleAnimIterGidBuilder builder()
  {
    return new PixbufSimpleAnimIterGidBuilder;
  }
}

/// Fluent builder implementation template for [gdkpixbuf.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
class PixbufSimpleAnimIterGidBuilderImpl(T) : gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIterGidBuilderImpl!T
{
}

/// Fluent builder for [gdkpixbuf.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
final class PixbufSimpleAnimIterGidBuilder : PixbufSimpleAnimIterGidBuilderImpl!PixbufSimpleAnimIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufSimpleAnimIter build()
  {
    return new PixbufSimpleAnimIter(cast(void*)createGObject(PixbufSimpleAnimIter._getGType), No.Take);
  }
}
