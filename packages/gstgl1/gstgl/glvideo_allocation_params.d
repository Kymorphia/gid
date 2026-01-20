/// Module for [GLVideoAllocationParams] class
module gstgl.glvideo_allocation_params;

import gid.gid;
import glib.types;
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
    return cast(void function())gst_gl_video_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_video_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLVideoAllocationParams self()
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: the parent #GstGLAllocationParams structure
  */
  @property gstgl.glallocation_params.GLAllocationParams parent()
  {
    return cToD!(gstgl.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLVideoAllocationParams*)this._cPtr).parent);
  }

  /**
      Get `vInfo` field.
      Returns: the #GstVideoInfo to allocate
  */
  @property gstvideo.video_info.VideoInfo vInfo()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).vInfo);
  }

  /**
      Set `vInfo` field.
      Params:
        propval = the #GstVideoInfo to allocate
  */
  @property void vInfo(gstvideo.video_info.VideoInfo propval)
  {
    cValueFree!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).vInfo);
    dToC(propval, cast(void*)&(cast(GstGLVideoAllocationParams*)this._cPtr).vInfo);
  }

  /**
      Get `plane` field.
      Returns: the video plane index to allocate
  */
  @property uint plane()
  {
    return (cast(GstGLVideoAllocationParams*)this._cPtr).plane;
  }

  /**
      Set `plane` field.
      Params:
        propval = the video plane index to allocate
  */
  @property void plane(uint propval)
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).plane = propval;
  }

  /**
      Get `valign` field.
      Returns: the #GstVideoAlignment to align the system representation to (may be null for the default)
  */
  @property gstvideo.video_alignment.VideoAlignment valign()
  {
    return cToD!(gstvideo.video_alignment.VideoAlignment)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).valign);
  }

  /**
      Get `target` field.
      Returns: the #GstGLTextureTarget to allocate
  */
  @property gstgl.types.GLTextureTarget target()
  {
    return cast(gstgl.types.GLTextureTarget)(cast(GstGLVideoAllocationParams*)this._cPtr).target;
  }

  /**
      Set `target` field.
      Params:
        propval = the #GstGLTextureTarget to allocate
  */
  @property void target(gstgl.types.GLTextureTarget propval)
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).target = cast(GstGLTextureTarget)propval;
  }

  /**
      Get `texFormat` field.
      Returns: the #GstGLFormat to allocate
  */
  @property gstgl.types.GLFormat texFormat()
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLVideoAllocationParams*)this._cPtr).texFormat;
  }

  /**
      Set `texFormat` field.
      Params:
        propval = the #GstGLFormat to allocate
  */
  @property void texFormat(gstgl.types.GLFormat propval)
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).texFormat = cast(GstGLFormat)propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstvideo.video_info.VideoInfo vInfo, uint plane, gstvideo.video_alignment.VideoAlignment valign, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat)
  {
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)&valign, target, texFormat);
    this(_cretval, Yes.Take);
  }

  /** */
  static gstgl.glvideo_allocation_params.GLVideoAllocationParams newWrappedData(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstvideo.video_info.VideoInfo vInfo, uint plane, gstvideo.video_alignment.VideoAlignment valign, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, void* wrappedData = null, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new_wrapped_data(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)&valign, target, texFormat, wrappedData, userData, _notifyCB);
    auto _retval = _cretval ? new gstgl.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      gl_handle is defined by the specific OpenGL handle being wrapped
      For #GstGLMemory and #GstGLMemoryPBO it is an OpenGL texture id.
      Other memory types may define it to require a different type of parameter.
  
      Params:
        context = a #GstGLContext
        allocParams = the #GstAllocationParams for tex_id
        vInfo = the #GstVideoInfo for tex_id
        plane = the video plane tex_id represents
        valign = any #GstVideoAlignment applied to symem mappings of tex_id
        target = the #GstGLTextureTarget for tex_id
        texFormat = the #GstGLFormat for tex_id
        glHandle = the GL handle to wrap
        userData = user data to call notify with
        notify = a #GDestroyNotify
      Returns: a new #GstGLVideoAllocationParams for wrapping gl_handle
  */
  static gstgl.glvideo_allocation_params.GLVideoAllocationParams newWrappedGlHandle(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstvideo.video_info.VideoInfo vInfo, uint plane, gstvideo.video_alignment.VideoAlignment valign, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, void* glHandle = null, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new_wrapped_gl_handle(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)&valign, target, texFormat, glHandle, userData, _notifyCB);
    auto _retval = _cretval ? new gstgl.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static gstgl.glvideo_allocation_params.GLVideoAllocationParams newWrappedTexture(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstvideo.video_info.VideoInfo vInfo, uint plane, gstvideo.video_alignment.VideoAlignment valign, gstgl.types.GLTextureTarget target, gstgl.types.GLFormat texFormat, uint texId, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new_wrapped_texture(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)&valign, target, texFormat, texId, userData, _notifyCB);
    auto _retval = _cretval ? new gstgl.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copy and set any dynamically allocated resources in dest_vid.  Intended
      for subclass usage only to chain up at the end of a subclass copy function.
  
      Params:
        destVid = destination #GstGLVideoAllocationParams to copy into
  */
  void copyData(gstgl.glvideo_allocation_params.GLVideoAllocationParams destVid)
  {
    gst_gl_video_allocation_params_copy_data(cast(GstGLVideoAllocationParams*)this._cPtr, destVid ? cast(GstGLVideoAllocationParams*)destVid._cPtr(No.Dup) : null);
  }

  /**
      Unset and free any dynamically allocated resources.  Intended for subclass
      usage only to chain up at the end of a subclass free function.
  */
  void freeData()
  {
    gst_gl_video_allocation_params_free_data(cast(GstGLVideoAllocationParams*)this._cPtr);
  }
}
