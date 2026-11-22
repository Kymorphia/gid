/// Module for [PixbufNonAnim] class
module gid.gdkpixbuf2.pixbuf_non_anim;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gdkpixbuf2.pixbuf_animation;
import gid.gdkpixbuf2.types;
import gid.gobject2.gid_builder;

/** */
class PixbufNonAnim : gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation
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
    return cast(void function())gdk_pixbuf_non_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_non_anim_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkPixbufNonAnim";
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufNonAnim self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdkpixbuf2.pixbuf_non_anim.PixbufNonAnim]
      Returns: New builder object
  */
  static PixbufNonAnimGidBuilder builder() nothrow
  {
    return new PixbufNonAnimGidBuilder;
  }

  /** */
  this(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_non_anim_new(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gdkpixbuf2.pixbuf_non_anim.PixbufNonAnim]
class PixbufNonAnimGidBuilderImpl(T) : gid.gdkpixbuf2.pixbuf_animation.PixbufAnimationGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdkpixbuf2.pixbuf_non_anim.PixbufNonAnim]
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
