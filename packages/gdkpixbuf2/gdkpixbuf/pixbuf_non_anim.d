/// Module for [PixbufNonAnim] class
module gdkpixbuf.pixbuf_non_anim;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_non_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_non_anim_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufNonAnim self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gdkpixbuf.pixbuf_non_anim.PixbufNonAnim]
      Returns: New builder object
  */
  static PixbufNonAnimGidBuilder builder() nothrow
  {
    return new PixbufNonAnimGidBuilder;
  }

  /** */
  this(gdkpixbuf.pixbuf.Pixbuf pixbuf) nothrow
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_non_anim_new(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gdkpixbuf.pixbuf_non_anim.PixbufNonAnim]
class PixbufNonAnimGidBuilderImpl(T) : gdkpixbuf.pixbuf_animation.PixbufAnimationGidBuilderImpl!T
{
}

/// Fluent builder for [gdkpixbuf.pixbuf_non_anim.PixbufNonAnim]
final class PixbufNonAnimGidBuilder : PixbufNonAnimGidBuilderImpl!PixbufNonAnimGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufNonAnim build() nothrow
  {
    return new PixbufNonAnim(cast(void*)createGObject(PixbufNonAnim._getGType), Yes.Take);
  }
}
