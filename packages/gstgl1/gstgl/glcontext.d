/// Module for [GLContext] class
module gstgl.glcontext;

import gid.gid;
import glib.error;
import glib.thread;
import gobject.object;
import gst.object;
import gst.structure;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.gldisplay;
import gstgl.glwindow;
import gstgl.types;

/**
    #GstGLContext wraps an OpenGL context object in a uniform API.  As a result
    of the limitation on OpenGL context, this object is not thread safe unless
    specified and must only be activated in a single thread.
    
    Environment variables:
    $(LIST
      * `GST_GL_API`: select which OpenGL API to create and OpenGL context for.
                      Depending on the platform, the available values are
                      'opengl', 'opengl3' (core profile), and 'gles2'.  See the
                      the #GstGLAPI enumeration for more details.
      * `GST_GL_PLATFORM`: select which OpenGL platform to create an OpenGL
                           context with.  Depending on the platform and the
                           dependencies available build-time, the available values
                           are, 'glx', 'egl', 'cgl', 'wgl', and 'eagl'
      * `GST_GL_CONFIG`: select the configuration used for creating the OpenGL
                         context and OpenGL surface.  Written out as a GstStructure
                         that has been serialized to string.  e.g.
                         `GST_GL_CONFIG="gst-gl-context-config,red-size=8,green-size=8,blue-size=8,alpha-size=8,depth-size=16"`.
                         Not all platforms will support the same level of
                         functionality.
    )
*/
class GLContext : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_context_get_type != &gidSymbolNotFound ? gst_gl_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLContext self()
  {
    return this;
  }

  /**
      Create a new #GstGLContext with the specified display
  
      Params:
        display = a #GstGLDisplay
      Returns: a new #GstGLContext
  */
  this(gstgl.gldisplay.GLDisplay display)
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_context_new(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Wraps an existing OpenGL context into a #GstGLContext.
      
      Note: The caller is responsible for ensuring that the OpenGL context
      represented by handle stays alive while the returned #GstGLContext is
      active.
      
      context_type must not be [gstgl.types.GLPlatform.None] or [gstgl.types.GLPlatform.Any]
      
      available_apis must not be [gstgl.types.GLAPI.None] or [gstgl.types.GLAPI.Any]
  
      Params:
        display = a #GstGLDisplay
        handle = the OpenGL context to wrap
        contextType = a #GstGLPlatform specifying the type of context in handle
        availableApis = a #GstGLAPI containing the available OpenGL apis in handle
      Returns: a #GstGLContext wrapping handle
  */
  static gstgl.glcontext.GLContext newWrapped(gstgl.gldisplay.GLDisplay display, size_t handle, gstgl.types.GLPlatform contextType, gstgl.types.GLAPI availableApis)
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_context_new_wrapped(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null, handle, contextType, availableApis);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      A default implementation of the various GetProcAddress functions that looks
      for name in the OpenGL shared libraries or in the current process.
      
      See also: [gstgl.glcontext.GLContext.getProcAddress]
  
      Params:
        glApi = a #GstGLAPI
        name = then function to get the address of
      Returns: an address pointing to name or null
  */
  static void* defaultGetProcAddress(gstgl.types.GLAPI glApi, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    auto _retval = gst_gl_context_default_get_proc_address(glApi, _name);
    return _retval;
  }

  /**
      See also [gstgl.glcontext.GLContext.activate].
      Returns: the #GstGLContext active in the current thread or null
  */
  static gstgl.glcontext.GLContext getCurrent()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_context_get_current();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      If an error occurs, major and minor are not modified and [gstgl.types.GLAPI.None] is
      returned.
  
      Params:
        platform = the #GstGLPlatform to retrieve the API for
        major = the major version
        minor = the minor version
      Returns: The version supported by the OpenGL context current in the calling
                 thread or [gstgl.types.GLAPI.None]
  */
  static gstgl.types.GLAPI getCurrentGlApi(gstgl.types.GLPlatform platform, out uint major, out uint minor)
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_context_get_current_gl_api(platform, cast(uint*)&major, cast(uint*)&minor);
    gstgl.types.GLAPI _retval = cast(gstgl.types.GLAPI)_cretval;
    return _retval;
  }

  /** */
  static size_t getCurrentGlContext(gstgl.types.GLPlatform contextType)
  {
    size_t _retval;
    _retval = gst_gl_context_get_current_gl_context(contextType);
    return _retval;
  }

  /**
      Attempts to use the context_type specific GetProcAddress implementations
      to retrieve name.
      
      See also [gstgl.glcontext.GLContext.getProcAddress].
  
      Params:
        contextType = a #GstGLPlatform
        glApi = a #GstGLAPI
        name = the name of the function to retrieve
      Returns: a function pointer for name, or null
  */
  static void* getProcAddressWithPlatform(gstgl.types.GLPlatform contextType, gstgl.types.GLAPI glApi, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    auto _retval = gst_gl_context_get_proc_address_with_platform(contextType, glApi, _name);
    return _retval;
  }

  /**
      (De)activate the OpenGL context represented by this context.
      
      In OpenGL terms, calls eglMakeCurrent or similar with this context and the
      currently set window.  See [gstgl.glcontext.GLContext.setWindow] for details.
  
      Params:
        activate = true to activate, false to deactivate
      Returns: Whether the activation succeeded
  */
  bool activate(bool activate)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_activate(cast(GstGLContext*)this._cPtr, activate);
    return _retval;
  }

  /**
      Note: This will always fail for two wrapped #GstGLContext's
  
      Params:
        otherContext = another #GstGLContext
      Returns: whether context and other_context are able to share OpenGL
             resources.
  */
  bool canShare(gstgl.glcontext.GLContext otherContext)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_can_share(cast(GstGLContext*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check for an OpenGL feature being supported.
      
      Note: Most features require that the context be created before it is
      possible to determine their existence and so will fail if that is not the
      case.
  
      Params:
        feature = a platform specific feature
      Returns: Whether feature is supported by context
  */
  bool checkFeature(string feature)
  {
    bool _retval;
    const(char)* _feature = feature.toCString(No.Alloc);
    _retval = cast(bool)gst_gl_context_check_feature(cast(GstGLContext*)this._cPtr, _feature);
    return _retval;
  }

  /**
      Must be called with context current.
  
      Params:
        fboTarget = the GL value of the framebuffer target, GL_FRAMEBUFFER,
                       GL_READ_FRAMEBUFFER, GL_DRAW_FRAMEBUFFER
      Returns: whether whether the current framebuffer is complete
  */
  bool checkFramebufferStatus(uint fboTarget)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_check_framebuffer_status(cast(GstGLContext*)this._cPtr, fboTarget);
    return _retval;
  }

  /** */
  bool checkGlVersion(gstgl.types.GLAPI api, int maj, int min)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_check_gl_version(cast(GstGLContext*)this._cPtr, api, maj, min);
    return _retval;
  }

  /**
      Unbind the current framebuffer
  */
  void clearFramebuffer()
  {
    gst_gl_context_clear_framebuffer(cast(GstGLContext*)this._cPtr);
  }

  /**
      Clear's the currently set shader from the GL state machine.
      
      Note: must be called in the GL thread.
  */
  void clearShader()
  {
    gst_gl_context_clear_shader(cast(GstGLContext*)this._cPtr);
  }

  /**
      Creates an OpenGL context with the specified other_context as a context
      to share shareable OpenGL objects with.  See the OpenGL specification for
      what is shared between OpenGL contexts.
      
      Since 1.20, the configuration can be overriden with the environment variable
      `GST_GL_CONFIG` which is a stringified #GstStructure as would be returned
      from [gstgl.glcontext.GLContext.getConfig].  If `GST_GL_CONFIG` is not set, then the
      config will be chosen from other_context by calling
      [gstgl.glcontext.GLContext.getConfig] on other_context.  Otherwise, a default
      configuration is used.
      
      Calling [gstgl.glcontext.GLContext.requestConfig]) before calling
      [gstgl.glcontext.GLContext.create] will override the config from other_context but
      will not override the `GST_GL_CONFIG` environment variable.
      
      If an error occurs, and error is not null, then error will contain
      details of the error and false will be returned.
      
      Should only be called once.
  
      Params:
        otherContext = a #GstGLContext to share OpenGL objects with
      Returns: whether the context could successfully be created
      Throws: [ErrorWrap]
  */
  bool create(gstgl.glcontext.GLContext otherContext = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_gl_context_create(cast(GstGLContext*)this._cPtr, otherContext ? cast(GstGLContext*)otherContext._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Destroys an OpenGL context.
      
      Should only be called after [gstgl.glcontext.GLContext.create] has been successfully
      called for this context.
  */
  void destroy()
  {
    gst_gl_context_destroy(cast(GstGLContext*)this._cPtr);
  }

  /**
      Fills context's info (version, extensions, vtable, etc) from the GL
      context in the current thread.  Typically used with wrapped contexts to
      allow wrapped contexts to be used as regular #GstGLContext's.
      Returns: 
      Throws: [ErrorWrap]
  */
  bool fillInfo()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_gl_context_fill_info(cast(GstGLContext*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Retrieve the OpenGL configuration for this context.  The context must
      have been successfully created for this function to return a valid value.
      
      Not all implementations currently support retrieving the config and will
      return null when not supported.
      Returns: the configuration chosen for this OpenGL context.
  */
  gst.structure.Structure getConfig()
  {
    GstStructure* _cretval;
    _cretval = gst_gl_context_get_config(cast(GstGLContext*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gstgl.gldisplay.GLDisplay getDisplay()
  {
    GstGLDisplay* _cretval;
    _cretval = gst_gl_context_get_display(cast(GstGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.gldisplay.GLDisplay)(cast(GstGLDisplay*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the currently enabled OpenGL api.
      
      The currently available API may be limited by the #GstGLDisplay in use and/or
      the #GstGLWindow chosen.
      Returns: the available OpenGL api
  */
  gstgl.types.GLAPI getGlApi()
  {
    GstGLAPI _cretval;
    _cretval = gst_gl_context_get_gl_api(cast(GstGLContext*)this._cPtr);
    gstgl.types.GLAPI _retval = cast(gstgl.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Gets the backing OpenGL context used by context.
      Returns: The platform specific backing OpenGL context
  */
  size_t getGlContext()
  {
    size_t _retval;
    _retval = gst_gl_context_get_gl_context(cast(GstGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Gets the OpenGL platform that used by context.
      Returns: The platform specific backing OpenGL context
  */
  gstgl.types.GLPlatform getGlPlatform()
  {
    GstGLPlatform _cretval;
    _cretval = gst_gl_context_get_gl_platform(cast(GstGLContext*)this._cPtr);
    gstgl.types.GLPlatform _retval = cast(gstgl.types.GLPlatform)_cretval;
    return _retval;
  }

  /**
      Get the version of the OpenGL platform (GLX, EGL, etc) used.  Only valid
      after a call to [gstgl.glcontext.GLContext.create].
  
      Params:
        major = return for the major version
        minor = return for the minor version
  */
  void getGlPlatformVersion(out int major, out int minor)
  {
    gst_gl_context_get_gl_platform_version(cast(GstGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Returns the OpenGL version implemented by context.  See
      [gstgl.glcontext.GLContext.getGlApi] for retrieving the OpenGL api implemented by
      context.
  
      Params:
        maj = resulting major version
        min = resulting minor version
  */
  void getGlVersion(out int maj, out int min)
  {
    gst_gl_context_get_gl_version(cast(GstGLContext*)this._cPtr, cast(int*)&maj, cast(int*)&min);
  }

  /**
      Get a function pointer to a specified opengl function, name.  If the the
      specific function does not exist, NULL is returned instead.
      
      Platform specific functions (names starting 'egl', 'glX', 'wgl', etc) can also
      be retrieved using this method.
      
      Note: This function may return valid function pointers that may not be valid
      to call in context.  The caller is responsible for ensuring that the
      returned function is a valid function to call in context by either checking
      the OpenGL API and version or for an appropriate OpenGL extension.
      
      Note: On success, you need to cast the returned function pointer to the
      correct type to be able to call it correctly.  On 32-bit Windows, this will
      include the `GSTGLAPI` identifier to use the correct calling convention.
      e.g.
      
      ```c
      void (GSTGLAPI *PFN_glGetIntegerv) (GLenum name, GLint * ret)
      ```
  
      Params:
        name = an opengl function name
      Returns: a function pointer or null
  */
  void* getProcAddress(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    auto _retval = gst_gl_context_get_proc_address(cast(GstGLContext*)this._cPtr, _name);
    return _retval;
  }

  /** */
  glib.thread.Thread getThread()
  {
    GThread* _cretval;
    _cretval = gst_gl_context_get_thread(cast(GstGLContext*)this._cPtr);
    auto _retval = _cretval ? new glib.thread.Thread(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gstgl.glwindow.GLWindow getWindow()
  {
    GstGLWindow* _cretval;
    _cretval = gst_gl_context_get_window(cast(GstGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glwindow.GLWindow)(cast(GstGLWindow*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool isShared()
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_is_shared(cast(GstGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Set the OpenGL configuration for this context.  The context must not
      have been created for this function to succeed.  Setting a null
      config has the affect of removing any specific configuration request.
      
      Not all implementations currently support retrieving the config and this
      function will return FALSE when not supported.
      
      Note that calling this function may cause a subsequent
      [gstgl.glcontext.GLContext.create] to fail if config could not be matched with
      the platform-specific configuration.
      
      Note that the actual config used may be differ from the requested values.
  
      Params:
        glConfig = a configuration structure for
                      configuring the OpenGL context
      Returns: whether gl_config could be successfully set on context
  */
  bool requestConfig(gst.structure.Structure glConfig = null)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_request_config(cast(GstGLContext*)this._cPtr, glConfig ? cast(GstStructure*)glConfig._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Will internally set context as shared with share
  
      Params:
        share = another #GstGLContext
  */
  void setSharedWith(gstgl.glcontext.GLContext share)
  {
    gst_gl_context_set_shared_with(cast(GstGLContext*)this._cPtr, share ? cast(GstGLContext*)share._cPtr(No.Dup) : null);
  }

  /**
      Set's the current window on context to window.  The window can only be
      changed before [gstgl.glcontext.GLContext.create] has been called and the window is not
      already running.
  
      Params:
        window = a #GstGLWindow
      Returns: Whether the window was successfully updated
  */
  bool setWindow(gstgl.glwindow.GLWindow window)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_set_window(cast(GstGLContext*)this._cPtr, window ? cast(GstGLWindow*)window._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /** */
  bool supportsGlslProfileVersion(gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_supports_glsl_profile_version(cast(GstGLContext*)this._cPtr, version_, profile);
    return _retval;
  }

  /** */
  bool supportsPrecision(gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_supports_precision(cast(GstGLContext*)this._cPtr, version_, profile);
    return _retval;
  }

  /** */
  bool supportsPrecisionHighp(gstgl.types.GLSLVersion version_, gstgl.types.GLSLProfile profile)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_context_supports_precision_highp(cast(GstGLContext*)this._cPtr, version_, profile);
    return _retval;
  }

  /**
      Swap the front and back buffers on the window attached to context.
      This will display the frame on the next refresh cycle.
  */
  void swapBuffers()
  {
    gst_gl_context_swap_buffers(cast(GstGLContext*)this._cPtr);
  }

  /**
      Execute func in the OpenGL thread of context with data
      
      MT-safe
  
      Params:
        func = a #GstGLContextThreadFunc
  */
  void threadAdd(gstgl.types.GLContextThreadFunc func)
  {
    extern(C) void _funcCallback(GstGLContext* context, void* data)
    {
      auto _dlg = cast(gstgl.types.GLContextThreadFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(void*)context, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gst_gl_context_thread_add(cast(GstGLContext*)this._cPtr, _funcCB, _func);
  }
}
