/// Module for [GLDisplay] class
module gid.gstgl1.gldisplay;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.glib2.thread;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.glwindow;
import gid.gstgl1.types;

/**
    #GstGLDisplay represents a connection to the underlying windowing system.
    Elements are required to make use of #GstContext to share and propagate
    a #GstGLDisplay.
    
    There are a number of environment variables that influence the choice of
    platform and window system specific functionality.
    - GST_GL_WINDOW influences the window system to use.  Common values are
      'x11', 'wayland', 'surfaceless', 'win32' or 'cocoa'.
    - GST_GL_PLATFORM influences the OpenGL platform to use.  Common values are
      'egl', 'glx', 'wgl' or 'cgl'.
    - GST_GL_API influences the OpenGL API requested by the OpenGL platform.
      Common values are 'opengl', 'opengl3' and 'gles2'.
    
    > Certain window systems require a special function to be called to
    > initialize threading support.  As this GStreamer GL library does not preclude
    > concurrent access to the windowing system, it is strongly advised that
    > applications ensure that threading support has been initialized before any
    > other toolkit/library functionality is accessed.  Failure to do so could
    > result in sudden application abortion during execution.  The most notably
    > example of such a function is X11's XInitThreads\().
*/
class GLDisplay : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_get_type != &gidSymbolNotFound ? gst_gl_display_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLDisplay";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplay self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.gldisplay.GLDisplay]
      Returns: New builder object
  */
  static GLDisplayGidBuilder builder() nothrow
  {
    return new GLDisplayGidBuilder;
  }

  /** */
  this() nothrow
  {
    GstGLDisplay* _cretval;
    _cretval = gst_gl_display_new();
    this(_cretval, Yes.Take);
  }

  /**
      Will always return a #GstGLDisplay of a single type.  This differs from
      [gid.gstgl1.gldisplay.GLDisplay.new_] and the seemingly equivalent call
      gst_gl_display_new_with_type (GST_GL_DISPLAY_TYPE_ANY) in that the latter
      may return NULL.
  
      Params:
        type = #GstGLDisplayType
      Returns: a new #GstGLDisplay or null if type is
                 not supported
  */
  static gid.gstgl1.gldisplay.GLDisplay newWithType(gid.gstgl1.types.GLDisplayType type) nothrow
  {
    GstGLDisplay* _cretval;
    _cretval = gst_gl_display_new_with_type(type);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.gldisplay.GLDisplay)(cast(GstGLDisplay*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool addContext(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_display_add_context(cast(GstGLDisplay*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      It requires the display's object lock to be held.
  
      Params:
        otherContext = other #GstGLContext to share resources with.
        pContext = resulting #GstGLContext
      Returns: whether a new context could be created.
      Throws: [ErrorWrap]
  */
  bool createContext(gid.gstgl1.glcontext.GLContext otherContext, out gid.gstgl1.glcontext.GLContext pContext)
  {
    bool _retval;
    GstGLContext* _pContext;
    GError *_err;
    _retval = cast(bool)gst_gl_display_create_context(cast(GstGLDisplay*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null, &_pContext, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    pContext = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(_pContext, Yes.Take);
    return _retval;
  }

  /** */
  gid.gstgl1.glwindow.GLWindow createWindow() nothrow
  {
    GstGLWindow* _cretval;
    _cretval = gst_gl_display_create_window(cast(GstGLDisplay*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glwindow.GLWindow)(cast(GstGLWindow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Ensures that the display has a valid GL context for the current thread. If
      context already contains a valid context, this does nothing.
  
      Params:
        otherContext = other #GstGLContext to share resources with.
        context = the resulting #GstGLContext
      Returns: wether context contains a valid context.
      Throws: [ErrorWrap]
  */
  bool ensureContext(gid.gstgl1.glcontext.GLContext otherContext, ref gid.gstgl1.glcontext.GLContext context)
  {
    bool _retval;
    GstGLContext* _context = context ? cast(GstGLContext*)context._cPtr(Yes.Dup) : null;
    GError *_err;
    _retval = cast(bool)gst_gl_display_ensure_context(cast(GstGLDisplay*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null, &_context, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    context = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(_context, Yes.Take);
    return _retval;
  }

  /**
      limit the use of OpenGL to the requested gl_api.  This is intended to allow
      application and elements to request a specific set of OpenGL API's based on
      what they support.  See [gid.gstgl1.glcontext.GLContext.getGlApi] for the retrieving the
      API supported by a #GstGLContext.
  
      Params:
        glApi = a #GstGLAPI to filter with
  */
  void filterGlApi(gid.gstgl1.types.GLAPI glApi) nothrow
  {
    gst_gl_display_filter_gl_api(cast(GstGLDisplay*)this._cPtr, glApi);
  }

  /**
      see [gid.gstgl1.gldisplay.GLDisplay.filterGlApi] for what the returned value represents
      Returns: the #GstGLAPI configured for display
  */
  gid.gstgl1.types.GLAPI getGlApi() nothrow
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_display_get_gl_api(cast(GstGLDisplay*)this._cPtr);
    gid.gstgl1.types.GLAPI _retval = cast(gid.gstgl1.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  gid.gstgl1.types.GLAPI getGlApiUnlocked() nothrow
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_display_get_gl_api_unlocked(cast(GstGLDisplay*)this._cPtr);
    gid.gstgl1.types.GLAPI _retval = cast(gid.gstgl1.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContextForThread(gid.glib2.thread.Thread thread) nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_display_get_gl_context_for_thread(cast(GstGLDisplay*)this._cPtr, thread ? cast(GThread*)thread._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  size_t getHandle() nothrow
  {
    size_t _retval;
    _retval = gst_gl_display_get_handle(cast(GstGLDisplay*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstgl1.types.GLDisplayType getHandleType() nothrow
  {
    GstGLDisplayType _cretval;
    _cretval = gst_gl_display_get_handle_type(cast(GstGLDisplay*)this._cPtr);
    gid.gstgl1.types.GLDisplayType _retval = cast(gid.gstgl1.types.GLDisplayType)_cretval;
    return _retval;
  }

  /**
      Must be called with the object lock held.
  
      Params:
        context = the #GstGLContext to remove
  */
  void removeContext(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    gst_gl_display_remove_context(cast(GstGLDisplay*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  bool removeWindow(gid.gstgl1.glwindow.GLWindow window) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_display_remove_window(cast(GstGLDisplay*)this._cPtr, window ? cast(GstGLWindow*)window._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `CreateContext` signal.
  
      Overrides the GstGLContext creation mechanism.
        It can be called in any thread and it is emitted with
        display's object lock held.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.gstgl1.glcontext.GLContext callback(gid.gstgl1.glcontext.GLContext context, gid.gstgl1.gldisplay.GLDisplay gLDisplay)`
  
          `context` other context to share resources with. (optional)
  
          `gLDisplay` the instance the signal is connected to (optional)
  
          `Returns` the new context.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateContext(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.gstgl1.glcontext.GLContext)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gstgl1.glcontext.GLContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gstgl1.gldisplay.GLDisplay)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.gstgl1.glcontext.GLContext _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.gldisplay.GLDisplay.createContext");
      }

      setVal!(gid.gstgl1.glcontext.GLContext)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-context", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gstgl1.gldisplay.GLDisplay]
class GLDisplayGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.gldisplay.GLDisplay]
final class GLDisplayGidBuilder : GLDisplayGidBuilderImpl!GLDisplayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLDisplay build() nothrow
  {
    return new GLDisplay(cast(void*)createGObject(GLDisplay._getGType), Yes.Take);
  }
}
