/// Module for [GLBufferAllocationParams] class
module gstgl.glbuffer_allocation_params;

import gid.gid;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glcontext;
import gstgl.types;

/** */
class GLBufferAllocationParams : gobject.boxed.Boxed
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
    return cast(void function())gst_gl_buffer_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_buffer_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferAllocationParams self()
  {
    return this;
  }

  /**
      Get `parent` field.
      Returns: parent object
  */
  @property gstgl.glallocation_params.GLAllocationParams parent()
  {
    return cToD!(gstgl.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLBufferAllocationParams*)this._cPtr).parent);
  }

  /**
      Get `glTarget` field.
      Returns: the OpenGL target to bind the buffer to
  */
  @property uint glTarget()
  {
    return (cast(GstGLBufferAllocationParams*)this._cPtr).glTarget;
  }

  /**
      Set `glTarget` field.
      Params:
        propval = the OpenGL target to bind the buffer to
  */
  @property void glTarget(uint propval)
  {
    (cast(GstGLBufferAllocationParams*)this._cPtr).glTarget = propval;
  }

  /**
      Get `glUsage` field.
      Returns: the OpenGL usage hint to create the buffer with
  */
  @property uint glUsage()
  {
    return (cast(GstGLBufferAllocationParams*)this._cPtr).glUsage;
  }

  /**
      Set `glUsage` field.
      Params:
        propval = the OpenGL usage hint to create the buffer with
  */
  @property void glUsage(uint propval)
  {
    (cast(GstGLBufferAllocationParams*)this._cPtr).glUsage = propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, size_t allocSize, gst.allocation_params.AllocationParams allocParams, uint glTarget, uint glUsage)
  {
    GstGLBufferAllocationParams* _cretval;
    _cretval = gst_gl_buffer_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, allocSize, cast(const(GstAllocationParams)*)&allocParams, glTarget, glUsage);
    this(_cretval, Yes.Take);
  }
}
