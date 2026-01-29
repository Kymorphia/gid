/// Module for [GLBuffer] class
module gstgl.glbuffer;

import gid.gid;
import gobject.boxed;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory;
import gstgl.types;

/**
    GstGLBuffer is a #GstMemory subclass providing support for the mapping of
    GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLBuffer : gobject.boxed.Boxed
{

  /**
      Create a `glbuffer.GLBuffer` boxed type.
      Params:
        id = the buffer id for this memory
        target = the OpenGL target of this texture for binding purposes
        usageHints = the OpenGL usage hints this buffer was created with
  */
  this(uint id = uint.init, uint target = uint.init, uint usageHints = uint.init)
  {
    super(gMalloc(GstGLBuffer.sizeof), Yes.Take);
    this.id = id;
    this.target = target;
    this.usageHints = usageHints;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_buffer_get_type != &gidSymbolNotFound ? gst_gl_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBuffer self()
  {
    return this;
  }

  /**
      Get `mem` field.
      Returns: the parent object
  */
  @property gstgl.glbase_memory.GLBaseMemory mem()
  {
    return cToD!(gstgl.glbase_memory.GLBaseMemory)(cast(void*)&(cast(GstGLBuffer*)this._cPtr).mem);
  }

  /**
      Get `id` field.
      Returns: the buffer id for this memory
  */
  @property uint id()
  {
    return (cast(GstGLBuffer*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = the buffer id for this memory
  */
  @property void id(uint propval)
  {
    (cast(GstGLBuffer*)this._cPtr).id = propval;
  }

  /**
      Get `target` field.
      Returns: the OpenGL target of this texture for binding purposes
  */
  @property uint target()
  {
    return (cast(GstGLBuffer*)this._cPtr).target;
  }

  /**
      Set `target` field.
      Params:
        propval = the OpenGL target of this texture for binding purposes
  */
  @property void target(uint propval)
  {
    (cast(GstGLBuffer*)this._cPtr).target = propval;
  }

  /**
      Get `usageHints` field.
      Returns: the OpenGL usage hints this buffer was created with
  */
  @property uint usageHints()
  {
    return (cast(GstGLBuffer*)this._cPtr).usageHints;
  }

  /**
      Set `usageHints` field.
      Params:
        propval = the OpenGL usage hints this buffer was created with
  */
  @property void usageHints(uint propval)
  {
    (cast(GstGLBuffer*)this._cPtr).usageHints = propval;
  }

  /**
      Initializes the GL Buffer allocator. It is safe to call this function
      multiple times.  This must be called before any other #GstGLBuffer operation.
  */
  static void initOnce()
  {
    gst_gl_buffer_init_once();
  }
}
