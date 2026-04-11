/// Module for [PixbufSimpleAnim] class
module gdkpixbuf.pixbuf_simple_anim;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.types;
import gid.gid;
import gobject.gid_builder;

/**
    An opaque struct representing a simple animation.
*/
class PixbufSimpleAnim : gdkpixbuf.pixbuf_animation.PixbufAnimation
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
    return cast(void function())gdk_pixbuf_simple_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_simple_anim_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufSimpleAnim self()
  {
    return this;
  }

  /**
      Get builder for [gdkpixbuf.pixbuf_simple_anim.PixbufSimpleAnim]
      Returns: New builder object
  */
  static PixbufSimpleAnimGidBuilder builder()
  {
    return new PixbufSimpleAnimGidBuilder;
  }

  /**
      Get `loop` property.
      Returns: Whether the animation should loop when it reaches the end.
  */
  @property bool loop()
  {
    return getLoop();
  }

  /**
      Set `loop` property.
      Params:
        propval = Whether the animation should loop when it reaches the end.
  */
  @property void loop(bool propval)
  {
    setLoop(propval);
  }

  /**
      Creates a new, empty animation.
  
      Params:
        width = the width of the animation
        height = the height of the animation
        rate = the speed of the animation, in frames per second
      Returns: a newly allocated #GdkPixbufSimpleAnim
  */
  this(int width, int height, float rate)
  {
    GdkPixbufSimpleAnim* _cretval;
    _cretval = gdk_pixbuf_simple_anim_new(width, height, rate);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a new frame to animation. The pixbuf must
      have the dimensions specified when the animation
      was constructed.
  
      Params:
        pixbuf = the pixbuf to add
  */
  void addFrame(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gdk_pixbuf_simple_anim_add_frame(cast(GdkPixbufSimpleAnim*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Gets whether animation should loop indefinitely when it reaches the end.
      Returns: true if the animation loops forever, false otherwise
  */
  bool getLoop()
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_simple_anim_get_loop(cast(GdkPixbufSimpleAnim*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether animation should loop indefinitely when it reaches the end.
  
      Params:
        loop = whether to loop the animation
  */
  void setLoop(bool loop)
  {
    gdk_pixbuf_simple_anim_set_loop(cast(GdkPixbufSimpleAnim*)this._cPtr, loop);
  }
}

/// Fluent builder implementation template for [gdkpixbuf.pixbuf_simple_anim.PixbufSimpleAnim]
class PixbufSimpleAnimGidBuilderImpl(T) : gdkpixbuf.pixbuf_animation.PixbufAnimationGidBuilderImpl!T
{

  /**
      Set `loop` property.
      Params:
        propval = Whether the animation should loop when it reaches the end.
      Returns: Builder instance for fluent chaining
  */
  T loop(bool propval)
  {
    return setProperty("loop", propval);
  }
}

/// Fluent builder for [gdkpixbuf.pixbuf_simple_anim.PixbufSimpleAnim]
final class PixbufSimpleAnimGidBuilder : PixbufSimpleAnimGidBuilderImpl!PixbufSimpleAnimGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufSimpleAnim build()
  {
    return new PixbufSimpleAnim(cast(void*)createGObject(PixbufSimpleAnim._getGType), Yes.Take);
  }
}
