/// Module for [GLMemory] class
module gstgl.glmemory;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocation_params;
import gst.allocator;
import gst.memory;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory;
import gstgl.glcontext;
import gstgl.types;
import gstvideo.video_alignment;
import gstvideo.video_info;

/**
    GstGLMemory is a #GstGLBaseMemory subclass providing support for the mapping of
    OpenGL textures.
    
    #GstGLMemory is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
    
    Data is uploaded or downloaded from the GPU as is necessary.
    
    The #GstCaps that is used for #GstGLMemory based buffers should contain
    the [gstgl.types.CAPS_FEATURE_MEMORY_GL_MEMORY] as a #GstCapsFeatures and should
    contain a 'texture-target' field with one of the #GstGLTextureTarget values
    as a string, i.e. some combination of 'texture-target=(string){2D,
    rectangle, external-oes}'.
*/
class GLMemory : gobject.boxed.Boxed
{

  /**
      Create a `glmemory.GLMemory` boxed type.
      Params:
        texId = the GL texture id for this memory
        texTarget = the GL texture target for this memory
        texFormat = the texture type
        valign = data alignment for system memory mapping
        plane = data plane in @info
        textureWrapped = 
        unpackLength = 
        texWidth = 
  */
  this(uint texId = uint.init, gstgl.types.GLTextureTarget texTarget = gstgl.types.GLTextureTarget.init, gstgl.types.GLFormat texFormat = gstgl.types.GLFormat.init, gstvideo.video_alignment.VideoAlignment valign = gstvideo.video_alignment.VideoAlignment.init, uint plane = uint.init, bool textureWrapped = bool.init, uint unpackLength = uint.init, uint texWidth = uint.init)
  {
    super(gMalloc(GstGLMemory.sizeof), Yes.Take);
    this.texId = texId;
    this.texTarget = texTarget;
    this.texFormat = texFormat;
    this.valign = valign;
    this.plane = plane;
    this.textureWrapped = textureWrapped;
    this.unpackLength = unpackLength;
    this.texWidth = texWidth;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_get_type != &gidSymbolNotFound ? gst_gl_memory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemory self()
  {
    return this;
  }

  /**
      Get `mem` field.
      Returns: the parent #GstGLBaseMemory object
  */
  @property gstgl.glbase_memory.GLBaseMemory mem()
  {
    return cToD!(gstgl.glbase_memory.GLBaseMemory)(cast(void*)&(cast(GstGLMemory*)this._cPtr).mem);
  }

  /**
      Get `texId` field.
      Returns: the GL texture id for this memory
  */
  @property uint texId()
  {
    return (cast(GstGLMemory*)this._cPtr).texId;
  }

  /**
      Set `texId` field.
      Params:
        propval = the GL texture id for this memory
  */
  @property void texId(uint propval)
  {
    (cast(GstGLMemory*)this._cPtr).texId = propval;
  }

  /**
      Get `texTarget` field.
      Returns: the GL texture target for this memory
  */
  @property gstgl.types.GLTextureTarget texTarget()
  {
    return cast(gstgl.types.GLTextureTarget)(cast(GstGLMemory*)this._cPtr).texTarget;
  }

  /**
      Set `texTarget` field.
      Params:
        propval = the GL texture target for this memory
  */
  @property void texTarget(gstgl.types.GLTextureTarget propval)
  {
    (cast(GstGLMemory*)this._cPtr).texTarget = cast(GstGLTextureTarget)propval;
  }

  /**
      Get `texFormat` field.
      Returns: the texture type
  */
  @property gstgl.types.GLFormat texFormat()
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLMemory*)this._cPtr).texFormat;
  }

  /**
      Set `texFormat` field.
      Params:
        propval = the texture type
  */
  @property void texFormat(gstgl.types.GLFormat propval)
  {
    (cast(GstGLMemory*)this._cPtr).texFormat = cast(GstGLFormat)propval;
  }

  /**
      Get `info` field.
      Returns: the texture's #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo info()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstGLMemory*)this._cPtr).info);
  }

  /**
      Get `valign` field.
      Returns: data alignment for system memory mapping
  */
  @property gstvideo.video_alignment.VideoAlignment valign()
  {
    return cToD!(gstvideo.video_alignment.VideoAlignment)(cast(void*)&(cast(GstGLMemory*)this._cPtr).valign);
  }

  /**
      Set `valign` field.
      Params:
        propval = data alignment for system memory mapping
  */
  @property void valign(gstvideo.video_alignment.VideoAlignment propval)
  {
    (cast(GstGLMemory*)this._cPtr).valign = cast(GstVideoAlignment)propval;
  }

  /**
      Get `plane` field.
      Returns: data plane in @info
  */
  @property uint plane()
  {
    return (cast(GstGLMemory*)this._cPtr).plane;
  }

  /**
      Set `plane` field.
      Params:
        propval = data plane in @info
  */
  @property void plane(uint propval)
  {
    (cast(GstGLMemory*)this._cPtr).plane = propval;
  }

  /** */
  @property bool textureWrapped()
  {
    return cast(bool)(cast(GstGLMemory*)this._cPtr).textureWrapped;
  }

  /** */
  @property void textureWrapped(bool propval)
  {
    (cast(GstGLMemory*)this._cPtr).textureWrapped = propval;
  }

  /** */
  @property uint unpackLength()
  {
    return (cast(GstGLMemory*)this._cPtr).unpackLength;
  }

  /** */
  @property void unpackLength(uint propval)
  {
    (cast(GstGLMemory*)this._cPtr).unpackLength = propval;
  }

  /** */
  @property uint texWidth()
  {
    return (cast(GstGLMemory*)this._cPtr).texWidth;
  }

  /** */
  @property void texWidth(uint propval)
  {
    (cast(GstGLMemory*)this._cPtr).texWidth = propval;
  }

  /**
      Copies gl_mem into the texture specified by tex_id.  The format of tex_id
      is specified by tex_format, width and height.
  
      Params:
        texId = OpenGL texture id
        target = the #GstGLTextureTarget
        texFormat = the #GstGLFormat
        width = width of tex_id
        height = height of tex_id
      Returns: Whether the copy succeeded
  */
  bool copyInto(uint texId, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, int width, int height)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_memory_copy_into(cast(GstGLMemory*)this._cPtr, texId, target, texFormat, width, height);
    return _retval;
  }

  /**
      Copies the texture in #GstGLMemory into the texture specified by tex_id,
      out_target, out_tex_format, out_width and out_height.
  
      Params:
        texId = the destination texture id
        outTarget = the destination #GstGLTextureTarget
        outTexFormat = the destination #GstGLFormat
        outWidth = the destination width
        outHeight = the destination height
      Returns: whether the copy succeeded.
  */
  bool copyTeximage(uint texId, gstgl.types.GLTextureTarget outTarget, gstgl.types.GLFormat outTexFormat, int outWidth, int outHeight)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_memory_copy_teximage(cast(GstGLMemory*)this._cPtr, texId, outTarget, outTexFormat, outWidth, outHeight);
    return _retval;
  }

  /** */
  gstgl.types.GLFormat getTextureFormat()
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_memory_get_texture_format(cast(GstGLMemory*)this._cPtr);
    gstgl.types.GLFormat _retval = cast(gstgl.types.GLFormat)_cretval;
    return _retval;
  }

  /** */
  int getTextureHeight()
  {
    int _retval;
    _retval = gst_gl_memory_get_texture_height(cast(GstGLMemory*)this._cPtr);
    return _retval;
  }

  /** */
  uint getTextureId()
  {
    uint _retval;
    _retval = gst_gl_memory_get_texture_id(cast(GstGLMemory*)this._cPtr);
    return _retval;
  }

  /** */
  gstgl.types.GLTextureTarget getTextureTarget()
  {
    GstGLTextureTarget _cretval;
    _cretval = gst_gl_memory_get_texture_target(cast(GstGLMemory*)this._cPtr);
    gstgl.types.GLTextureTarget _retval = cast(gstgl.types.GLTextureTarget)_cretval;
    return _retval;
  }

  /** */
  int getTextureWidth()
  {
    int _retval;
    _retval = gst_gl_memory_get_texture_width(cast(GstGLMemory*)this._cPtr);
    return _retval;
  }

  /**
      Initializes mem with the required parameters.  info is assumed to have
      already have been modified with [gstvideo.video_info.VideoInfo.align_].
  
      Params:
        allocator = the #GstAllocator to initialize with
        parent = the parent #GstMemory to initialize with
        context = the #GstGLContext to initialize with
        target = the #GstGLTextureTarget for this #GstGLMemory
        texFormat = the #GstGLFormat for this #GstGLMemory
        params = the GstAllocationParams to initialize with
        info = the #GstVideoInfo for this #GstGLMemory
        plane = the plane number (starting from 0) for this #GstGLMemory
        valign = optional #GstVideoAlignment parameters
        userData = user data to call notify with
        notify = a #GDestroyNotify
  */
  void init_(gst.allocator.Allocator allocator, gst.memory.Memory parent, gstgl.glcontext.GLContext context, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, gst.allocation_params.AllocationParams params, gstvideo.video_info.VideoInfo info, uint plane, gstvideo.video_alignment.VideoAlignment valign, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    gst_gl_memory_init(cast(GstGLMemory*)this._cPtr, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, parent ? cast(GstMemory*)parent._cPtr(No.Dup) : null, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, target, texFormat, cast(const(GstAllocationParams)*)&params, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)&valign, userData, _notifyCB);
  }

  /**
      Reads the texture in #GstGLMemory into write_pointer if no buffer is bound
      to `GL_PIXEL_PACK_BUFFER`.  Otherwise write_pointer is the byte offset into
      the currently bound `GL_PIXEL_PACK_BUFFER` buffer to store the result of
      glReadPixels.  See the OpenGL specification for glReadPixels for more
      details.
  
      Params:
        writePointer = the data pointer to pass to glReadPixels
      Returns: whether theread operation succeeded
  */
  bool readPixels(void* writePointer = null)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_memory_read_pixels(cast(GstGLMemory*)this._cPtr, writePointer);
    return _retval;
  }

  /**
      Reads the texture in read_pointer into gl_mem.
      
      See [gstgl.glmemory.GLMemory.readPixels] for what read_pointer signifies.
  
      Params:
        readPointer = the data pointer to pass to glTexSubImage
  */
  void texsubimage(void* readPointer = null)
  {
    gst_gl_memory_texsubimage(cast(GstGLMemory*)this._cPtr, readPointer);
  }

  /**
      Initializes the GL Base Texture allocator. It is safe to call this function
      multiple times.  This must be called before any other GstGLMemory operation.
  */
  static void initOnce()
  {
    gst_gl_memory_init_once();
  }
}
