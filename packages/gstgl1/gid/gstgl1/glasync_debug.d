/// Module for [GLAsyncDebug] class
module gid.gstgl1.glasync_debug;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/**
    #GstGLAsyncDebug an opaque structure and should only be accessed through the
    provided API.
*/
class GLAsyncDebug : StructWrap!(GstGLAsyncDebug)
{
  /**
      Create a `glasync_debug.GLAsyncDebug` wrap type.
  */
  this() nothrow
  {
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
      freeze the debug output.  While frozen, any call to
      [gid.gstgl1.glasync_debug.GLAsyncDebug.outputLogMsg] will not output any messages but
      subsequent calls to [gid.gstgl1.glasync_debug.GLAsyncDebug.storeLogMsg] will overwrite previous
      messages.
  */
  void freeze() nothrow
  {
    gst_gl_async_debug_freeze(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Initialize ad.  Intended for use with #GstGLAsyncDebug's that are embedded
      in other structs.
  */
  void init_() nothrow
  {
    gst_gl_async_debug_init(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Outputs a previously stored debug message.
  */
  void outputLogMsg() nothrow
  {
    gst_gl_async_debug_output_log_msg(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      unfreeze the debug output.  See [gid.gstgl1.glasync_debug.GLAsyncDebug.freeze] for what freezing means
  */
  void thaw() nothrow
  {
    gst_gl_async_debug_thaw(cast(GstGLAsyncDebug*)this._cPtr);
  }

  /**
      Unset any dynamically allocated data.  Intended for use with
      #GstGLAsyncDebug's that are embedded in other structs.
  */
  void unset() nothrow
  {
    gst_gl_async_debug_unset(cast(GstGLAsyncDebug*)this._cPtr);
  }
}
