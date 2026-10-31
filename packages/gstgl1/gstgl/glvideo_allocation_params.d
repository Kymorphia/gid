/// Module for [GLVideoAllocationParams] class
module gstgl.glvideo_allocation_params;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glcontext;
import gstgl.types;
import gstvideo.video_alignment;
import gstvideo.video_info;

/** */
class GLVideoAllocationParams : gobject.boxed.Boxed
{

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
    return cast(void function())gst_gl_video_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_video_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLVideoAllocationParams self() nothrow
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: the parent #GstGLAllocationParams structure
  */
  @property gstgl.glallocation_params.GLAllocationParams parent() nothrow
  {
    return cToD!(gstgl.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLVideoAllocationParams*)this._cPtr).parent);
  }

  /**
      Get `vInfo` field.
      Returns: the #GstVideoInfo to allocate
  */
  @property gstvideo.video_info.VideoInfo vInfo() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).vInfo);
  }

  /**
      Get `plane` field.
      Returns: the video plane index to allocate
  */
  @property uint plane() nothrow
  {
    return (cast(GstGLVideoAllocationParams*)this._cPtr).plane;
  }

  /**
      Set `plane` field.
      Params:
        propval = the video plane index to allocate
  */
  @property void plane(uint propval) nothrow
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).plane = propval;
  }

  /**
      Get `valign` field.
      Returns: the #GstVideoAlignment to align the system representation to (may be null for the default)
  */
  @property gstvideo.video_alignment.VideoAlignment valign() nothrow
  {
    return cToD!(gstvideo.video_alignment.VideoAlignment)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).valign);
  }

  /**
      Get `target` field.
      Returns: the #GstGLTextureTarget to allocate
  */
  @property gstgl.types.GLTextureTarget target() nothrow
  {
    return cast(gstgl.types.GLTextureTarget)(cast(GstGLVideoAllocationParams*)this._cPtr).target;
  }

  /**
      Set `target` field.
      Params:
        propval = the #GstGLTextureTarget to allocate
  */
  @property void target(gstgl.types.GLTextureTarget propval) nothrow
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).target = cast(GstGLTextureTarget)propval;
  }

  /**
      Get `texFormat` field.
      Returns: the #GstGLFormat to allocate
  */
  @property gstgl.types.GLFormat texFormat() nothrow
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLVideoAllocationParams*)this._cPtr).texFormat;
  }

  /**
      Set `texFormat` field.
      Params:
        propval = the #GstGLFormat to allocate
  */
  @property void texFormat(gstgl.types.GLFormat propval) nothrow
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).texFormat = cast(GstGLFormat)propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams* allocParams, gstvideo.video_info.VideoInfo vInfo, uint plane, gstvideo.video_alignment.VideoAlignment* valign, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat) nothrow
  {
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)valign, target, texFormat);
    this(_cretval, Yes.Take);
  }

  /**
      Copy and set any dynamically allocated resources in dest_vid.  Intended
      for subclass usage only to chain up at the end of a subclass copy function.
  
      Params:
        destVid = destination #GstGLVideoAllocationParams to copy into
  */
  void copyData(gstgl.glvideo_allocation_params.GLVideoAllocationParams destVid) nothrow
  {
    gst_gl_video_allocation_params_copy_data(cast(GstGLVideoAllocationParams*)this._cPtr, destVid ? cast(GstGLVideoAllocationParams*)destVid._cPtr(No.Dup) : null);
  }

  /**
      Unset and free any dynamically allocated resources.  Intended for subclass
      usage only to chain up at the end of a subclass free function.
  */
  void freeData() nothrow
  {
    gst_gl_video_allocation_params_free_data(cast(GstGLVideoAllocationParams*)this._cPtr);
  }
}
