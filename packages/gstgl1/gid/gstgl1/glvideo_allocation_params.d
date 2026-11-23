/// Module for [GLVideoAllocationParams] class
module gid.gstgl1.glvideo_allocation_params;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gst1.allocation_params;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;
import gid.gstvideo1.video_alignment;
import gid.gstvideo1.video_info;

/** */
class GLVideoAllocationParams : gid.gobject2.boxed.BoxedWrap!(gst_gl_video_allocation_params_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
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
  @property gid.gstgl1.glallocation_params.GLAllocationParams parent() nothrow
  {
    return cToD!(gid.gstgl1.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLVideoAllocationParams*)this._cPtr).parent);
  }

  /**
      Get `vInfo` field.
      Returns: the #GstVideoInfo to allocate
  */
  @property gid.gstvideo1.video_info.VideoInfo vInfo() nothrow
  {
    return cToD!(gid.gstvideo1.video_info.VideoInfo)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).vInfo);
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
  @property gid.gstvideo1.video_alignment.VideoAlignment valign() nothrow
  {
    return cToD!(gid.gstvideo1.video_alignment.VideoAlignment)(cast(void*)(cast(GstGLVideoAllocationParams*)this._cPtr).valign);
  }

  /**
      Get `target` field.
      Returns: the #GstGLTextureTarget to allocate
  */
  @property gid.gstgl1.types.GLTextureTarget target() nothrow
  {
    return cast(gid.gstgl1.types.GLTextureTarget)(cast(GstGLVideoAllocationParams*)this._cPtr).target;
  }

  /**
      Set `target` field.
      Params:
        propval = the #GstGLTextureTarget to allocate
  */
  @property void target(gid.gstgl1.types.GLTextureTarget propval) nothrow
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).target = cast(GstGLTextureTarget)propval;
  }

  /**
      Get `texFormat` field.
      Returns: the #GstGLFormat to allocate
  */
  @property gid.gstgl1.types.GLFormat texFormat() nothrow
  {
    return cast(gid.gstgl1.types.GLFormat)(cast(GstGLVideoAllocationParams*)this._cPtr).texFormat;
  }

  /**
      Set `texFormat` field.
      Params:
        propval = the #GstGLFormat to allocate
  */
  @property void texFormat(gid.gstgl1.types.GLFormat propval) nothrow
  {
    (cast(GstGLVideoAllocationParams*)this._cPtr).texFormat = cast(GstGLFormat)propval;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstvideo1.video_info.VideoInfo vInfo, uint plane, gid.gstvideo1.video_alignment.VideoAlignment* valign, gid.gstgl1.types.GLTextureTarget target, gid.gstgl1.types.GLFormat texFormat) nothrow
  {
    GstGLVideoAllocationParams* _cretval;
    _cretval = gst_gl_video_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)valign, target, texFormat);
    this(_cretval, Yes.Take);
  }

  /** */
  static gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams newWrappedData(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstvideo1.video_info.VideoInfo vInfo, uint plane, gid.gstvideo1.video_alignment.VideoAlignment* valign, gid.gstgl1.types.GLTextureTarget target, gid.gstgl1.types.GLFormat texFormat, void* wrappedData = null, gid.glib2.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_gl_video_allocation_params_new_wrapped_data(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)valign, target, texFormat, wrappedData, _notify, _notifyCB);
    auto _retval = _cretval ? new gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
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
        notify = a #GDestroyNotify
      Returns: a new #GstGLVideoAllocationParams for wrapping gl_handle
  */
  static gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams newWrappedGlHandle(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstvideo1.video_info.VideoInfo vInfo, uint plane, gid.gstvideo1.video_alignment.VideoAlignment* valign, gid.gstgl1.types.GLTextureTarget target, gid.gstgl1.types.GLFormat texFormat, void* glHandle = null, gid.glib2.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_gl_video_allocation_params_new_wrapped_gl_handle(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)valign, target, texFormat, glHandle, _notify, _notifyCB);
    auto _retval = _cretval ? new gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams newWrappedTexture(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstvideo1.video_info.VideoInfo vInfo, uint plane, gid.gstvideo1.video_alignment.VideoAlignment* valign, gid.gstgl1.types.GLTextureTarget target, gid.gstgl1.types.GLFormat texFormat, uint texId, gid.glib2.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLVideoAllocationParams* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_gl_video_allocation_params_new_wrapped_texture(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, vInfo ? cast(const(GstVideoInfo)*)vInfo._cPtr(No.Dup) : null, plane, cast(const(GstVideoAlignment)*)valign, target, texFormat, texId, _notify, _notifyCB);
    auto _retval = _cretval ? new gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copy and set any dynamically allocated resources in dest_vid.  Intended
      for subclass usage only to chain up at the end of a subclass copy function.
  
      Params:
        destVid = destination #GstGLVideoAllocationParams to copy into
  */
  void copyData(gid.gstgl1.glvideo_allocation_params.GLVideoAllocationParams destVid) nothrow
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
