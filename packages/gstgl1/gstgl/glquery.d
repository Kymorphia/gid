/// Module for [GLQuery] class
module gstgl.glquery;

import gid.gid;
import gst.element;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    A #GstGLQuery represents and holds an OpenGL query object.  Various types of
    queries can be run or counters retrieved.
*/
class GLQuery
{
  GstGLQuery _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstgl.glquery.GLQuery");

    _cInstance = *cast(GstGLQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Record the result of a counter
  */
  void counter()
  {
    gst_gl_query_counter(cast(GstGLQuery*)this._cPtr);
  }

  /**
      End counting the query
  */
  void end()
  {
    gst_gl_query_end(cast(GstGLQuery*)this._cPtr);
  }

  /** */
  void init_(gstgl.glcontext.GLContext context, gstgl.types.GLQueryType queryType)
  {
    gst_gl_query_init(cast(GstGLQuery*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, queryType);
  }

  /** */
  ulong result()
  {
    ulong _retval;
    _retval = gst_gl_query_result(cast(GstGLQuery*)this._cPtr);
    return _retval;
  }

  /**
      Start counting the query
  */
  void start()
  {
    gst_gl_query_start(cast(GstGLQuery*)this._cPtr);
  }

  /**
      Free any dynamically allocated resources
  */
  void unset()
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
  static bool localGlContext(gst.element.Element element, gst.types.PadDirection direction, gstgl.glcontext.GLContext contextPtr)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_query_local_gl_context(element ? cast(GstElement*)element._cPtr(No.Dup) : null, direction, contextPtr ? cast(GstGLContext**)contextPtr._cPtr(No.Dup) : null);
    return _retval;
  }
}
