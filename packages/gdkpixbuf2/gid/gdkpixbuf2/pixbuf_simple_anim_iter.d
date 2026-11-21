/// Module for [PixbufSimpleAnimIter] class
module gid.gdkpixbuf2.pixbuf_simple_anim_iter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.pixbuf_animation_iter;
import gid.gdkpixbuf2.types;
import gid.gobject2.gid_builder;

/** */
class PixbufSimpleAnimIter : gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter
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
    return cast(void function())gdk_pixbuf_simple_anim_iter_get_type != &gidSymbolNotFound ? gdk_pixbuf_simple_anim_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkPixbufSimpleAnimIter";
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufSimpleAnimIter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdkpixbuf2.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
      Returns: New builder object
  */
  static PixbufSimpleAnimIterGidBuilder builder() nothrow
  {
    return new PixbufSimpleAnimIterGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gdkpixbuf2.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
class PixbufSimpleAnimIterGidBuilderImpl(T) : gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdkpixbuf2.pixbuf_simple_anim_iter.PixbufSimpleAnimIter]
final class PixbufSimpleAnimIterGidBuilder : PixbufSimpleAnimIterGidBuilderImpl!PixbufSimpleAnimIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufSimpleAnimIter build() nothrow
  {
    return new PixbufSimpleAnimIter(cast(void*)createGObject(PixbufSimpleAnimIter._getGType), Yes.Take);
  }
}
