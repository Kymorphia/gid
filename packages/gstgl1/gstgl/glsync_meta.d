/// Module for [GLSyncMeta] class
module gstgl.glsync_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLSyncMeta provides the ability to synchronize the OpenGL command stream
    with the CPU or with other OpenGL contexts.
*/
class GLSyncMeta
{
  GstGLSyncMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstgl.glsync_meta.GLSyncMeta");

    _cInstance = *cast(GstGLSyncMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `parent` field.
      Returns: the parent #GstMeta
  */
  @property gst.meta.Meta parent()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstGLSyncMeta*)this._cPtr).parent, No.Take);
  }

  /**
      Get `context` field.
      Returns: the #GstGLContext used to allocate the meta
  */
  @property gstgl.glcontext.GLContext context()
  {
    return cToD!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLSyncMeta*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = the #GstGLContext used to allocate the meta
  */
  @property void context(gstgl.glcontext.GLContext propval)
  {
    cValueFree!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLSyncMeta*)this._cPtr).context);
    dToC(propval, cast(void*)&(cast(GstGLSyncMeta*)this._cPtr).context);
  }

  /** Function alias for field `setSync` */
  alias SetSyncFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `setSync` field.
      Returns: set a sync point in the OpenGL command stream
  */
  @property SetSyncFuncType setSync()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).setSync;
  }

  /** Function alias for field `setSyncGl` */
  alias SetSyncGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `setSyncGl` field.
      Returns: the same as @set_sync but called from @context's thread
  */
  @property SetSyncGlFuncType setSyncGl()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).setSyncGl;
  }

  /** Function alias for field `wait` */
  alias WaitFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `wait` field.
      Returns: execute a wait on the previously set sync point into the OpenGL command stream
  */
  @property WaitFuncType wait()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).wait;
  }

  /** Function alias for field `waitGl` */
  alias WaitGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `waitGl` field.
      Returns: the same as @wait but called from @context's thread
  */
  @property WaitGlFuncType waitGl()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).waitGl;
  }

  /** Function alias for field `waitCpu` */
  alias WaitCpuFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `waitCpu` field.
      Returns: wait for the previously set sync point to pass from the CPU
  */
  @property WaitCpuFuncType waitCpu()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).waitCpu;
  }

  /** Function alias for field `waitCpuGl` */
  alias WaitCpuGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `waitCpuGl` field.
      Returns: the same as @wait_cpu but called from @context's thread
  */
  @property WaitCpuGlFuncType waitCpuGl()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).waitCpuGl;
  }

  /** Function alias for field `copy` */
  alias CopyFuncType = extern(C) void function(GstGLSyncMeta* src, GstBuffer* sbuffer, GstGLSyncMeta* dest, GstBuffer* dbuffer);

  /**
      Get `copy` field.
      Returns: copy @data into a new #GstGLSyncMeta
  */
  @property CopyFuncType copy()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).copy;
  }

  /** Function alias for field `free` */
  alias FreeFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `free` field.
      Returns: free @data
  */
  @property FreeFuncType free()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).free;
  }

  /** Function alias for field `freeGl` */
  alias FreeGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `freeGl` field.
      Returns: free @data in @context's thread
  */
  @property FreeGlFuncType freeGl()
  {
    return (cast(GstGLSyncMeta*)this._cPtr).freeGl;
  }

  /**
      Set a sync point to possibly wait on at a later time.
  
      Params:
        context = a #GstGLContext
  */
  void setSyncPoint(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_set_sync_point(cast(GstGLSyncMeta*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Insert a wait into context's command stream ensuring all previous OpenGL
      commands before sync_meta have completed.
  
      Params:
        context = a #GstGLContext
  */
  void wait(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_wait(cast(GstGLSyncMeta*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Perform a wait so that the sync point has passed from the CPU's perspective
      What that means, is that all GL operations changing CPU-visible data before
      the sync point are now visible.
  
      Params:
        context = a #GstGLContext
  */
  void waitCpu(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_wait_cpu(cast(GstGLSyncMeta*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_gl_sync_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
