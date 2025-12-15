/// Module for [GLMemoryPBO] class
module gstgl.glmemory_pbo;

import gid.gid;
import gobject.boxed;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    #GstGLMemoryPBO is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLMemoryPBO : gobject.boxed.Boxed
{

  /**
      Create a `glmemory_pbo.GLMemoryPBO` boxed type.
  */
  this()
  {
    super(gMalloc(GstGLMemoryPBO.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_pbo_get_type != &gidSymbolNotFound ? gst_gl_memory_pbo_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryPBO self()
  {
    return this;
  }

  /**
      Copies gl_mem into the texture specified by tex_id.  The format of tex_id
      is specified by tex_format, width and height.
      
      If respecify is true, then the copy is performed in terms of the texture
      data.  This is useful for splitting RGBA textures into RG or R textures or
      vice versa. The requirement for this to succeed is that the backing texture
      data must be the same size, i.e. say a RGBA8 texture is converted into a RG8
      texture, then the RG texture must have twice as many pixels available for
      output as the RGBA texture.
      
      Otherwise, if respecify is false, then the copy is performed per texel
      using glCopyTexImage.  See the OpenGL specification for details on the
      mappings between texture formats.
  
      Params:
        texId = the destination texture id
        target = the destination #GstGLTextureTarget
        texFormat = the destination #GstGLFormat
        width = width of tex_id
        height = height of tex_id
        stride = stride of the backing texture data
        respecify = whether to copy the data or copy per texel
      Returns: Whether the copy succeeded
  */
  bool copyIntoTexture(uint texId, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, int width, int height, int stride, bool respecify)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_memory_pbo_copy_into_texture(cast(GstGLMemoryPBO*)this._cPtr, texId, target, texFormat, width, height, stride, respecify);
    return _retval;
  }

  /**
      Transfer the texture data from the texture into the PBO if necessary.
  */
  void downloadTransfer()
  {
    gst_gl_memory_pbo_download_transfer(cast(GstGLMemoryPBO*)this._cPtr);
  }

  /**
      Transfer the texture data from the PBO into the texture if necessary.
  */
  void uploadTransfer()
  {
    gst_gl_memory_pbo_upload_transfer(cast(GstGLMemoryPBO*)this._cPtr);
  }

  /** */
  static void initOnce()
  {
    gst_gl_memory_pbo_init_once();
  }
}
