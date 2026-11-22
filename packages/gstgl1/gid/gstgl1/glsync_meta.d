/// Module for [GLSyncMeta] class
module gid.gstgl1.glsync_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLSyncMeta provides the ability to synchronize the OpenGL command stream
    with the CPU or with other OpenGL contexts.
*/
class GLSyncMeta : StructWrap!(GstGLSyncMeta)
{
  /**
      Create a `glsync_meta.GLSyncMeta` wrap type.
      Params:
        context = the #GstGLContext used to allocate the meta
  */
  this(gid.gstgl1.glcontext.GLContext context = gid.gstgl1.glcontext.GLContext.init) nothrow
  {
    this.context = context;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `parent` field.
      Returns: the parent #GstMeta
  */
  @property gid.gst1.meta.Meta parent() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstGLSyncMeta*)this._cPtr).parent, this);
  }

  private gid.gstgl1.glcontext.GLContext _contextRef; // Keeps borrowed field value alive

  /**
      Get `context` field.
      Returns: the #GstGLContext used to allocate the meta
  */
  @property gid.gstgl1.glcontext.GLContext context() nothrow
  {
    return cToD!(gid.gstgl1.glcontext.GLContext)(cast(void*)(cast(GstGLSyncMeta*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = the #GstGLContext used to allocate the meta
  */
  @property void context(gid.gstgl1.glcontext.GLContext propval) nothrow
  {
    if (_refuseBorrowedStore("context"))
      return;

    _contextRef = propval;
    (cast(GstGLSyncMeta*)this._cPtr).context = propval ? cast(GstGLContext*)propval._cPtr(No.Dup) : null;
  }

  /** Function alias for field `setSync` */
  alias SetSyncFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `setSync` field.
      Returns: set a sync point in the OpenGL command stream
  */
  @property SetSyncFuncType setSync() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).setSync;
  }

  /** Function alias for field `setSyncGl` */
  alias SetSyncGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `setSyncGl` field.
      Returns: the same as @set_sync but called from @context's thread
  */
  @property SetSyncGlFuncType setSyncGl() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).setSyncGl;
  }

  /** Function alias for field `waitGl` */
  alias WaitGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `waitGl` field.
      Returns: the same as @wait but called from @context's thread
  */
  @property WaitGlFuncType waitGl() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).waitGl;
  }

  /** Function alias for field `waitCpuGl` */
  alias WaitCpuGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `waitCpuGl` field.
      Returns: the same as @wait_cpu but called from @context's thread
  */
  @property WaitCpuGlFuncType waitCpuGl() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).waitCpuGl;
  }

  /** Function alias for field `copy` */
  alias CopyFuncType = extern(C) void function(GstGLSyncMeta* src, GstBuffer* sbuffer, GstGLSyncMeta* dest, GstBuffer* dbuffer);

  /**
      Get `copy` field.
      Returns: copy @data into a new #GstGLSyncMeta
  */
  @property CopyFuncType copy() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).copy;
  }

  /** Function alias for field `free` */
  alias FreeFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `free` field.
      Returns: free @data
  */
  @property FreeFuncType free() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).free;
  }

  /** Function alias for field `freeGl` */
  alias FreeGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  /**
      Get `freeGl` field.
      Returns: free @data in @context's thread
  */
  @property FreeGlFuncType freeGl() nothrow
  {
    return (cast(GstGLSyncMeta*)this._cPtr).freeGl;
  }

  /**
      Set a sync point to possibly wait on at a later time.
  
      Params:
        context = a #GstGLContext
  */
  void setSyncPoint(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    gst_gl_sync_meta_set_sync_point(cast(GstGLSyncMeta*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Insert a wait into context's command stream ensuring all previous OpenGL
      commands before sync_meta have completed.
  
      Params:
        context = a #GstGLContext
  */
  void wait(gid.gstgl1.glcontext.GLContext context) nothrow
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
  void waitCpu(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    gst_gl_sync_meta_wait_cpu(cast(GstGLSyncMeta*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_gl_sync_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
