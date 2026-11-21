/// Module for [GLRenderbuffer] class
module gid.gstgl1.glrenderbuffer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/**
    GstGLRenderbuffer is a #GstGLBaseMemory subclass providing support for
    OpenGL renderbuffers.
    
    #GstGLRenderbuffer is created or wrapped through [gid.gstgl1.glbase_memory.GLBaseMemory.alloc]
    with #GstGLRenderbufferAllocationParams.
*/
class GLRenderbuffer : gid.gobject2.boxed.BoxedWrap!(gst_gl_renderbuffer_get_type)
{
  /**
      Create a `glrenderbuffer.GLRenderbuffer` boxed type.
      Params:
        renderbufferId = the GL texture id for this memory
        renderbufferFormat = the texture type
        width = the width
        height = the height
        renderbufferWrapped = 
  */
  this(uint renderbufferId = uint.init, gid.gstgl1.types.GLFormat renderbufferFormat = gid.gstgl1.types.GLFormat.init, uint width = uint.init, uint height = uint.init, bool renderbufferWrapped = bool.init) nothrow
  {
    super(boxedNew!GstGLRenderbuffer(_getGType), Yes.Take);
    this.renderbufferId = renderbufferId;
    this.renderbufferFormat = renderbufferFormat;
    this.width = width;
    this.height = height;
    this.renderbufferWrapped = renderbufferWrapped;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderbuffer self() nothrow
  {
    return this;
  }

  /**
      Get `renderbufferId` field.
      Returns: the GL texture id for this memory
  */
  @property uint renderbufferId() nothrow
  {
    return (cast(GstGLRenderbuffer*)this._cPtr).renderbufferId;
  }

  /**
      Set `renderbufferId` field.
      Params:
        propval = the GL texture id for this memory
  */
  @property void renderbufferId(uint propval) nothrow
  {
    (cast(GstGLRenderbuffer*)this._cPtr).renderbufferId = propval;
  }

  /**
      Get `renderbufferFormat` field.
      Returns: the texture type
  */
  @property gid.gstgl1.types.GLFormat renderbufferFormat() nothrow
  {
    return cast(gid.gstgl1.types.GLFormat)(cast(GstGLRenderbuffer*)this._cPtr).renderbufferFormat;
  }

  /**
      Set `renderbufferFormat` field.
      Params:
        propval = the texture type
  */
  @property void renderbufferFormat(gid.gstgl1.types.GLFormat propval) nothrow
  {
    (cast(GstGLRenderbuffer*)this._cPtr).renderbufferFormat = cast(GstGLFormat)propval;
  }

  /**
      Get `width` field.
      Returns: the width
  */
  @property uint width() nothrow
  {
    return (cast(GstGLRenderbuffer*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width
  */
  @property void width(uint propval) nothrow
  {
    (cast(GstGLRenderbuffer*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height
  */
  @property uint height() nothrow
  {
    return (cast(GstGLRenderbuffer*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height
  */
  @property void height(uint propval) nothrow
  {
    (cast(GstGLRenderbuffer*)this._cPtr).height = propval;
  }

  /** */
  @property bool renderbufferWrapped() nothrow
  {
    return cast(bool)(cast(GstGLRenderbuffer*)this._cPtr).renderbufferWrapped;
  }

  /** */
  @property void renderbufferWrapped(bool propval) nothrow
  {
    (cast(GstGLRenderbuffer*)this._cPtr).renderbufferWrapped = propval;
  }

  /** */
  gid.gstgl1.types.GLFormat getFormat() nothrow
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_renderbuffer_get_format(cast(GstGLRenderbuffer*)this._cPtr);
    gid.gstgl1.types.GLFormat _retval = cast(gid.gstgl1.types.GLFormat)_cretval;
    return _retval;
  }

  /** */
  int getHeight() nothrow
  {
    int _retval;
    _retval = gst_gl_renderbuffer_get_height(cast(GstGLRenderbuffer*)this._cPtr);
    return _retval;
  }

  /** */
  uint getId() nothrow
  {
    uint _retval;
    _retval = gst_gl_renderbuffer_get_id(cast(GstGLRenderbuffer*)this._cPtr);
    return _retval;
  }

  /** */
  int getWidth() nothrow
  {
    int _retval;
    _retval = gst_gl_renderbuffer_get_width(cast(GstGLRenderbuffer*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the GL Base Texture allocator. It is safe to call this function
      multiple times.  This must be called before any other GstGLRenderbuffer operation.
  */
  static void initOnce() nothrow
  {
    gst_gl_renderbuffer_init_once();
  }
}
