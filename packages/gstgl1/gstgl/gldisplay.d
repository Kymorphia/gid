/// Module for [GLDisplay] class
module gstgl.gldisplay;

import gid.gid;
import glib.error;
import glib.thread;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.glwindow;
import gstgl.types;

/**
    #GstGLDisplay represents a connection to the underlying windowing system.
    Elements are required to make use of #GstContext to share and propagate
    a #GstGLDisplay.
    
    There are a number of environment variables that influence the choice of
    platform and window system specific functionality.
    $(LIST
      * GST_GL_WINDOW influences the window system to use.  Common values are
        'x11', 'wayland', 'surfaceless', 'win32' or 'cocoa'.
      * GST_GL_PLATFORM influences the OpenGL platform to use.  Common values are
        'egl', 'glx', 'wgl' or 'cgl'.
      * GST_GL_API influences the OpenGL API requested by the OpenGL platform.
        Common values are 'opengl', 'opengl3' and 'gles2'.
    )
      
    > Certain window systems require a special function to be called to
    > initialize threading support.  As this GStreamer GL library does not preclude
    > concurrent access to the windowing system, it is strongly advised that
    > applications ensure that threading support has been initialized before any
    > other toolkit/library functionality is accessed.  Failure to do so could
    > result in sudden application abortion during execution.  The most notably
    > example of such a function is X11's XInitThreads\().
*/
class GLDisplay : gst.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_get_type != &gidSymbolNotFound ? gst_gl_display_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplay self()
  {
    return this;
  }

  /** */
  this()
  {
    GstGLDisplay* _cretval;
    _cretval = gst_gl_display_new();
    this(_cretval, Yes.Take);
  }

  /**
      Will always return a #GstGLDisplay of a single type.  This differs from
      [gstgl.gldisplay.GLDisplay.new_] and the seemingly equivalent call
      gst_gl_display_new_with_type (GST_GL_DISPLAY_TYPE_ANY) in that the latter
      may return NULL.
  
      Params:
        type = #GstGLDisplayType
      Returns: a new #GstGLDisplay or null if type is
                 not supported
  */
  static gstgl.gldisplay.GLDisplay newWithType(gstgl.types.GLDisplayType type)
  {
    GstGLDisplay* _cretval;
    _cretval = gst_gl_display_new_with_type(type);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.gldisplay.GLDisplay)(cast(GstGLDisplay*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool addContext(gstgl.glcontext.GLContext context)
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
  bool createContext(gstgl.glcontext.GLContext otherContext, out gstgl.glcontext.GLContext pContext)
  {
    bool _retval;
    GstGLContext* _pContext;
    GError *_err;
    _retval = cast(bool)gst_gl_display_create_context(cast(GstGLDisplay*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null, &_pContext, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    pContext = new gstgl.glcontext.GLContext(cast(void*)_pContext, Yes.Take);
    return _retval;
  }

  /** */
  gstgl.glwindow.GLWindow createWindow()
  {
    GstGLWindow* _cretval;
    _cretval = gst_gl_display_create_window(cast(GstGLDisplay*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glwindow.GLWindow)(cast(GstGLWindow*)_cretval, Yes.Take);
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
  bool ensureContext(gstgl.glcontext.GLContext otherContext = null, gstgl.glcontext.GLContext context = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_gl_display_ensure_context(cast(GstGLDisplay*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null, context ? cast(GstGLContext**)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      limit the use of OpenGL to the requested gl_api.  This is intended to allow
      application and elements to request a specific set of OpenGL API's based on
      what they support.  See [gstgl.glcontext.GLContext.getGlApi] for the retrieving the
      API supported by a #GstGLContext.
  
      Params:
        glApi = a #GstGLAPI to filter with
  */
  void filterGlApi(gstgl.types.GLAPI glApi)
  {
    gst_gl_display_filter_gl_api(cast(GstGLDisplay*)this._cPtr, glApi);
  }

  /**
      Execute compare_func over the list of windows stored by display.  The
      first argument to compare_func is the #GstGLWindow being checked and the
      second argument is data.
  
      Params:
        data = some data to pass to compare_func
        compareFunc = a comparison function to run
      Returns: The first #GstGLWindow that causes a match
                 from compare_func
  
      Deprecated: Use [gstgl.gldisplay.GLDisplay.retrieveWindow] instead.
  */
  gstgl.glwindow.GLWindow findWindow(void* data, glib.types.CompareFunc compareFunc)
  {
    static glib.types.CompareFunc _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b)
    {
      int _retval = _static_compareFunc(a, b);
      return _retval;
    }
    auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
    _static_compareFunc = compareFunc;
    GstGLWindow* _cretval;
    _cretval = gst_gl_display_find_window(cast(GstGLDisplay*)this._cPtr, data, _compareFuncCB);
    _static_compareFunc = null;
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glwindow.GLWindow)(cast(GstGLWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      see [gstgl.gldisplay.GLDisplay.filterGlApi] for what the returned value represents
      Returns: the #GstGLAPI configured for display
  */
  gstgl.types.GLAPI getGlApi()
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_display_get_gl_api(cast(GstGLDisplay*)this._cPtr);
    gstgl.types.GLAPI _retval = cast(gstgl.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  gstgl.types.GLAPI getGlApiUnlocked()
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_display_get_gl_api_unlocked(cast(GstGLDisplay*)this._cPtr);
    gstgl.types.GLAPI _retval = cast(gstgl.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  gstgl.glcontext.GLContext getGlContextForThread(glib.thread.Thread thread)
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_display_get_gl_context_for_thread(cast(GstGLDisplay*)this._cPtr, cast(GThread*)&thread);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  size_t getHandle()
  {
    size_t _retval;
    _retval = gst_gl_display_get_handle(cast(GstGLDisplay*)this._cPtr);
    return _retval;
  }

  /** */
  gstgl.types.GLDisplayType getHandleType()
  {
    GstGLDisplayType _cretval;
    _cretval = gst_gl_display_get_handle_type(cast(GstGLDisplay*)this._cPtr);
    gstgl.types.GLDisplayType _retval = cast(gstgl.types.GLDisplayType)_cretval;
    return _retval;
  }

  /**
      Must be called with the object lock held.
  
      Params:
        context = the #GstGLContext to remove
  */
  void removeContext(gstgl.glcontext.GLContext context)
  {
    gst_gl_display_remove_context(cast(GstGLDisplay*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /** */
  bool removeWindow(gstgl.glwindow.GLWindow window)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_display_remove_window(cast(GstGLDisplay*)this._cPtr, window ? cast(GstGLWindow*)window._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Execute compare_func over the list of windows stored by display.  The
      first argument to compare_func is the #GstGLWindow being checked and the
      second argument is data.
  
      Params:
        data = some data to pass to compare_func
        compareFunc = a comparison function to run
      Returns: The first #GstGLWindow that causes a match
                 from compare_func
  */
  gstgl.glwindow.GLWindow retrieveWindow(void* data, glib.types.CompareFunc compareFunc)
  {
    static glib.types.CompareFunc _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b)
    {
      int _retval = _static_compareFunc(a, b);
      return _retval;
    }
    auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
    _static_compareFunc = compareFunc;
    GstGLWindow* _cretval;
    _cretval = gst_gl_display_retrieve_window(cast(GstGLDisplay*)this._cPtr, data, _compareFuncCB);
    _static_compareFunc = null;
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glwindow.GLWindow)(cast(GstGLWindow*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `CreateContext` signal.
  
      Overrides the GstGLContext creation mechanism.
        It can be called in any thread and it is emitted with
        display's object lock held.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gstgl.glcontext.GLContext callback(gstgl.glcontext.GLContext context, gstgl.gldisplay.GLDisplay gLDisplay))
  
          `context` other context to share resources with. (optional)
  
          `gLDisplay` the instance the signal is connected to (optional)
  
          `Returns` the new context.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateContext(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gstgl.glcontext.GLContext)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstgl.glcontext.GLContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstgl.gldisplay.GLDisplay)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gstgl.glcontext.GLContext)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-context", closure, after);
  }
}
