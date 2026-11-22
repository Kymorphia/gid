/// Module for [GLBuffer] class
module gid.gstgl1.glbuffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_memory;
import gid.gstgl1.types;

/**
    GstGLBuffer is a #GstMemory subclass providing support for the mapping of
    GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLBuffer : gid.gobject2.boxed.BoxedWrap!(gst_gl_buffer_get_type)
{
  /**
      Create a `glbuffer.GLBuffer` boxed type.
      Params:
        id = the buffer id for this memory
        target = the OpenGL target of this texture for binding purposes
        usageHints = the OpenGL usage hints this buffer was created with
  */
  this(uint id = uint.init, uint target = uint.init, uint usageHints = uint.init) nothrow
  {
    super(boxedNew!GstGLBuffer(_getGType), Yes.Take);
    this.id = id;
    this.target = target;
    this.usageHints = usageHints;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBuffer self() nothrow
  {
    return this;
  }

  /**
      Get `mem` field.
      Returns: the parent object
  */
  @property gid.gstgl1.glbase_memory.GLBaseMemory mem() nothrow
  {
    return cToD!(gid.gstgl1.glbase_memory.GLBaseMemory)(cast(void*)&(cast(GstGLBuffer*)this._cPtr).mem);
  }

  /**
      Get `id` field.
      Returns: the buffer id for this memory
  */
  @property uint id() nothrow
  {
    return (cast(GstGLBuffer*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = the buffer id for this memory
  */
  @property void id(uint propval) nothrow
  {
    (cast(GstGLBuffer*)this._cPtr).id = propval;
  }

  /**
      Get `target` field.
      Returns: the OpenGL target of this texture for binding purposes
  */
  @property uint target() nothrow
  {
    return (cast(GstGLBuffer*)this._cPtr).target;
  }

  /**
      Set `target` field.
      Params:
        propval = the OpenGL target of this texture for binding purposes
  */
  @property void target(uint propval) nothrow
  {
    (cast(GstGLBuffer*)this._cPtr).target = propval;
  }

  /**
      Get `usageHints` field.
      Returns: the OpenGL usage hints this buffer was created with
  */
  @property uint usageHints() nothrow
  {
    return (cast(GstGLBuffer*)this._cPtr).usageHints;
  }

  /**
      Set `usageHints` field.
      Params:
        propval = the OpenGL usage hints this buffer was created with
  */
  @property void usageHints(uint propval) nothrow
  {
    (cast(GstGLBuffer*)this._cPtr).usageHints = propval;
  }

  /**
      Initializes the GL Buffer allocator. It is safe to call this function
      multiple times.  This must be called before any other #GstGLBuffer operation.
  */
  static void initOnce() nothrow
  {
    gst_gl_buffer_init_once();
  }
}
