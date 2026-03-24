/// Module for [PixbufNonAnim] class
module gdkpixbuf.pixbuf_non_anim;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.types;
import gid.gid;
import gobject.gid_builder;

/** */
class PixbufNonAnim : gdkpixbuf.pixbuf_animation.PixbufAnimation
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
    return cast(void function())gdk_pixbuf_non_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_non_anim_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufNonAnim self()
  {
    return this;
  }

  /**
  Get builder for [gdkpixbuf.pixbuf_non_anim.PixbufNonAnim]
  Returns: New builder object
  */
  static PixbufNonAnimGidBuilder builder()
  {
    return new PixbufNonAnimGidBuilder;
  }

  /** */
  this(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_non_anim_new(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class PixbufNonAnimGidBuilderImpl(T) : gdkpixbuf.pixbuf_animation.PixbufAnimationGidBuilderImpl!T
{
}

/// Fluent builder for [gdkpixbuf.pixbuf_non_anim.PixbufNonAnim]
final class PixbufNonAnimGidBuilder : PixbufNonAnimGidBuilderImpl!PixbufNonAnimGidBuilder
{
  PixbufNonAnim build()
  {
    return new PixbufNonAnim(cast(void*)createGObject(PixbufNonAnim._getGType), Yes.Take);
  }
}
