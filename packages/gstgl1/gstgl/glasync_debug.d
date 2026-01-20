/// Module for [GLAsyncDebug] class
module gstgl.glasync_debug;

import gid.gid;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    #GstGLAsyncDebug an opaque structure and should only be accessed through the
    provided API.
*/
class GLAsyncDebug
{
  GstGLAsyncDebug _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstgl.glasync_debug.GLAsyncDebug");

    _cInstance = *cast(GstGLAsyncDebug*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      freeze the debug output.  While frozen, any call to
      [gstgl.glasync_debug.GLAsyncDebug.outputLogMsg] will not output any messages but
      subsequent calls to [gstgl.glasync_debug.GLAsyncDebug.storeLogMsg] will overwrite previous
      messages.
  */
  void freeze()
  {
    gst_gl_async_debug_freeze(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Initialize ad.  Intended for use with #GstGLAsyncDebug's that are embedded
      in other structs.
  */
  void init_()
  {
    gst_gl_async_debug_init(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Outputs a previously stored debug message.
  */
  void outputLogMsg()
  {
    gst_gl_async_debug_output_log_msg(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      unfreeze the debug output.  See [gstgl.glasync_debug.GLAsyncDebug.freeze] for what freezing means
  */
  void thaw()
  {
    gst_gl_async_debug_thaw(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Unset any dynamically allocated data.  Intended for use with
      #GstGLAsyncDebug's that are embedded in other structs.
  */
  void unset()
  {
    gst_gl_async_debug_unset(cast(GstGLAsyncDebug*)this._cPtr);
  }
}
