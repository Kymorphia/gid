/// Module for [GLBufferAllocationParams] class
module gid.gstgl1.glbuffer_allocation_params;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gst1.allocation_params;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/** */
class GLBufferAllocationParams : gid.gobject2.boxed.BoxedWrap!(gst_gl_buffer_allocation_params_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferAllocationParams self() nothrow
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: parent object
  */
  @property gid.gstgl1.glallocation_params.GLAllocationParams parent() nothrow
  {
    return cToD!(gid.gstgl1.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLBufferAllocationParams*)this._cPtr).parent);
  }

  /**
      Get `glTarget` field.
      Returns: the OpenGL target to bind the buffer to
  */
  @property uint glTarget() nothrow
  {
    return (cast(GstGLBufferAllocationParams*)this._cPtr).glTarget;
  }

  /**
      Set `glTarget` field.
      Params:
        propval = the OpenGL target to bind the buffer to
  */
  @property void glTarget(uint propval) nothrow
  {
    (cast(GstGLBufferAllocationParams*)this._cPtr).glTarget = propval;
  }

  /**
      Get `glUsage` field.
      Returns: the OpenGL usage hint to create the buffer with
  */
  @property uint glUsage() nothrow
  {
    return (cast(GstGLBufferAllocationParams*)this._cPtr).glUsage;
  }

  /**
      Set `glUsage` field.
      Params:
        propval = the OpenGL usage hint to create the buffer with
  */
  @property void glUsage(uint propval) nothrow
  {
    (cast(GstGLBufferAllocationParams*)this._cPtr).glUsage = propval;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context, size_t allocSize, gid.gst1.allocation_params.AllocationParams* allocParams, uint glTarget, uint glUsage) nothrow
  {
    GstGLBufferAllocationParams* _cretval;
    _cretval = gst_gl_buffer_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, allocSize, cast(const(GstAllocationParams)*)allocParams, glTarget, glUsage);
    this(_cretval, Yes.Take);
  }
}
