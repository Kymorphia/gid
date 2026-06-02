/// Module for [GLRenderbuffer] class
module gstgl.glrenderbuffer;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    GstGLRenderbuffer is a #GstGLBaseMemory subclass providing support for
    OpenGL renderbuffers.
    
    #GstGLRenderbuffer is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLRenderbufferAllocationParams.
*/
class GLRenderbuffer : gobject.boxed.Boxed
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
  this(uint renderbufferId = uint.init, gstgl.types.GLFormat renderbufferFormat = gstgl.types.GLFormat.init, uint width = uint.init, uint height = uint.init, bool renderbufferWrapped = bool.init) nothrow
  {
    super(gMalloc(GstGLRenderbuffer.sizeof), Yes.Take);
    this.renderbufferId = renderbufferId;
    this.renderbufferFormat = renderbufferFormat;
    this.width = width;
    this.height = height;
    this.renderbufferWrapped = renderbufferWrapped;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_renderbuffer_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
  @property gstgl.types.GLFormat renderbufferFormat() nothrow
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLRenderbuffer*)this._cPtr).renderbufferFormat;
  }

  /**
      Set `renderbufferFormat` field.
      Params:
        propval = the texture type
  */
  @property void renderbufferFormat(gstgl.types.GLFormat propval) nothrow
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
  gstgl.types.GLFormat getFormat() nothrow
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_renderbuffer_get_format(cast(GstGLRenderbuffer*)this._cPtr);
    gstgl.types.GLFormat _retval = cast(gstgl.types.GLFormat)_cretval;
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
