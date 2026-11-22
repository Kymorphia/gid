/// Module for [GLRenderbufferAllocationParams] class
module gid.gstgl1.glrenderbuffer_allocation_params;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gst1.allocation_params;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    Allocation parameters
*/
class GLRenderbufferAllocationParams : gid.gobject2.boxed.BoxedWrap!(gst_gl_renderbuffer_allocation_params_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderbufferAllocationParams self() nothrow
  {
    return this;
  }

  /**
      Get `renderbufferFormat` field.
      Returns: the #GstGLFormat
  */
  @property gid.gstgl1.types.GLFormat renderbufferFormat() nothrow
  {
    return cast(gid.gstgl1.types.GLFormat)(cast(GstGLRenderbufferAllocationParams*)this._cPtr).renderbufferFormat;
  }

  /**
      Set `renderbufferFormat` field.
      Params:
        propval = the #GstGLFormat
  */
  @property void renderbufferFormat(gid.gstgl1.types.GLFormat propval) nothrow
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).renderbufferFormat = cast(GstGLFormat)propval;
  }

  /**
      Get `width` field.
      Returns: the width
  */
  @property uint width() nothrow
  {
    return (cast(GstGLRenderbufferAllocationParams*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width
  */
  @property void width(uint propval) nothrow
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height
  */
  @property uint height() nothrow
  {
    return (cast(GstGLRenderbufferAllocationParams*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height
  */
  @property void height(uint propval) nothrow
  {
    (cast(GstGLRenderbufferAllocationParams*)this._cPtr).height = propval;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstgl1.types.GLFormat renderbufferFormat, uint width, uint height) nothrow
  {
    GstGLRenderbufferAllocationParams* _cretval;
    _cretval = gst_gl_renderbuffer_allocation_params_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, renderbufferFormat, width, height);
    this(_cretval, Yes.Take);
  }

  /** */
  static gid.gstgl1.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams newWrapped(gid.gstgl1.glcontext.GLContext context, gid.gst1.allocation_params.AllocationParams* allocParams, gid.gstgl1.types.GLFormat renderbufferFormat, uint width, uint height, void* glHandle = null, gid.glib2.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
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
    GstGLRenderbufferAllocationParams* _cretval;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_gl_renderbuffer_allocation_params_new_wrapped(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)allocParams, renderbufferFormat, width, height, glHandle, _notify, _notifyCB);
    auto _retval = _cretval ? new gid.gstgl1.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
