/// Module for [GLQuery] class
module gid.gstgl1.glquery;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.object;
import gid.gst1.element;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    A #GstGLQuery represents and holds an OpenGL query object.  Various types of
    queries can be run or counters retrieved.
*/
@gidGir("GLQuery")
class GLQuery : StructWrap!(GstGLQuery)
{
  /**
      Create a `glquery.GLQuery` wrap type.
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
      Record the result of a counter
  */
  void counter() nothrow
  {
    gst_gl_query_counter(cast(GstGLQuery*)this._cPtr);
  }

  /**
      End counting the query
  */
  void end() nothrow
  {
    gst_gl_query_end(cast(GstGLQuery*)this._cPtr);
  }

  /** */
  void init_(gid.gstgl1.glcontext.GLContext context, gid.gstgl1.types.GLQueryType queryType) nothrow
  {
    gst_gl_query_init(cast(GstGLQuery*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, queryType);
  }

  /** */
  ulong result() nothrow
  {
    ulong _retval;
    _retval = gst_gl_query_result(cast(GstGLQuery*)this._cPtr);
    return _retval;
  }

  /**
      Start counting the query
  */
  void start() nothrow
  {
    gst_gl_query_start(cast(GstGLQuery*)this._cPtr);
  }

  /**
      Free any dynamically allocated resources
  */
  void unset() nothrow
  {
    gst_gl_query_unset(cast(GstGLQuery*)this._cPtr);
  }

  /**
      Performs a GST_QUERY_CONTEXT query of type "gst.gl.local_context" on all
      #GstPads in element of direction for the local OpenGL context used by
      GStreamer elements.
  
      Params:
        element = a #GstElement to query from
        direction = the #GstPadDirection to query
        contextPtr = location containing the current and/or resulting
                               #GstGLContext
      Returns: whether context_ptr contains a #GstGLContext
  */
  static bool localGlContext(gid.gst1.element.Element element, gid.gst1.types.PadDirection direction, ref gid.gstgl1.glcontext.GLContext contextPtr) nothrow
  {
    bool _retval;
    GstGLContext* _contextPtr = contextPtr ? cast(GstGLContext*)contextPtr._cPtr(Yes.Dup) : null;
    _retval = cast(bool)gst_gl_query_local_gl_context(element ? cast(GstElement*)element._cPtr(No.Dup) : null, direction, &_contextPtr);
    contextPtr = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(_contextPtr, Yes.Take);
    return _retval;
  }
}
