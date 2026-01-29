/// Module for [GLRenderbufferAllocationParams] class
module gstgl.glrenderbuffer_allocation_params;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    Allocation parameters
*/
class GLRenderbufferAllocationParams : gobject.boxed.Boxed
{

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
    return cast(void function())gst_gl_renderbuffer_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderbufferAllocationParams self()
  {
    return this;
  }

  /**
      Get `renderbufferFormat` field.
      Returns: the #GstGLFormat
  */
  @property gstgl.types.GLFormat renderbufferFormat()
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLRenderbufferAllocationParams*)this._cPtr).renderbufferFormat;
  }

  /**
      Set `renderbufferFormat` field.
      Params:
        propval = the #GstGLFormat
  */
  @property void renderbufferFormat(gstgl.types.GLFormat propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).renderbufferFormat = cast(GstGLFormat)propval;
  }

  /**
      Get `width` field.
      Returns: the width
  */
  @property uint width()
  {
    return (cast(GstGLRenderbufferAllocationParams*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width
  */
  @property void width(uint propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height
  */
  @property uint height()
  {
    return (cast(GstGLRenderbufferAllocationParams*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height
  */
  @property void height(uint propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).height = propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstgl.types.GLFormat renderbufferFormat, uint width, uint height)
  {
    GstGLRenderbufferAllocationParams* _cretval;
    _cretval = gst_gl_renderbuffer_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, renderbufferFormat, width, height);
    this(_cretval, Yes.Take);
  }

  /** */
  static gstgl.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams newWrapped(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstgl.types.GLFormat renderbufferFormat, uint width, uint height, void* glHandle = null, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstGLRenderbufferAllocationParams* _cretval;
    _cretval = gst_gl_renderbuffer_allocation_params_new_wrapped(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&allocParams, renderbufferFormat, width, height, glHandle, userData, _notifyCB);
    auto _retval = _cretval ? new gstgl.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
