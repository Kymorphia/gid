/// Module for [GLContext] class
module gdk.glcontext;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.types;
import gdk.window;
import gid.gid;
import glib.error;
import gobject.object;

/**
    #GdkGLContext is an object representing the platform-specific
    OpenGL drawing context.
    
    #GdkGLContexts are created for a #GdkWindow using
    [gdk.window.Window.createGlContext], and the context will match
    the #GdkVisual of the window.
    
    A #GdkGLContext is not tied to any particular normal framebuffer.
    For instance, it cannot draw to the #GdkWindow back buffer. The GDK
    repaint system is in full control of the painting to that. Instead,
    you can create render buffers or textures and use [gdk.global.cairoDrawFromGl]
    in the draw function of your widget to draw them. Then GDK will handle
    the integration of your rendering with that of other widgets.
    
    Support for #GdkGLContext is platform-specific, context creation
    can fail, returning null context.
    
    A #GdkGLContext has to be made "current" in order to start using
    it, otherwise any OpenGL call will be ignored.
    
    ## Creating a new OpenGL context ##
    
    In order to create a new #GdkGLContext instance you need a
    #GdkWindow, which you typically get during the realize call
    of a widget.
    
    A #GdkGLContext is not realized until either [gdk.glcontext.GLContext.makeCurrent],
    or until it is realized using [gdk.glcontext.GLContext.realize]. It is possible to
    specify details of the GL context like the OpenGL version to be used, or
    whether the GL context should have extra state validation enabled after
    calling [gdk.window.Window.createGlContext] by calling [gdk.glcontext.GLContext.realize].
    If the realization fails you have the option to change the settings of the
    #GdkGLContext and try again.
    
    ## Using a GdkGLContext ##
    
    You will need to make the #GdkGLContext the current context
    before issuing OpenGL calls; the system sends OpenGL commands to
    whichever context is current. It is possible to have multiple
    contexts, so you always need to ensure that the one which you
    want to draw with is the current one before issuing commands:
    
    ```c
      gdk_gl_context_make_current (context);
    ```
    
    You can now perform your drawing using OpenGL commands.
    
    You can check which #GdkGLContext is the current one by using
    [gdk.glcontext.GLContext.getCurrent]; you can also unset any #GdkGLContext
    that is currently set by calling [gdk.glcontext.GLContext.clearCurrent].
*/
class GLContext : gobject.object.ObjectWrap
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
    return cast(void function())gdk_gl_context_get_type != &gidSymbolNotFound ? gdk_gl_context_get_type() : cast(GType)0;
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
      Clears the current #GdkGLContext.
      
      Any OpenGL call after this function returns will be ignored
      until [gdk.glcontext.GLContext.makeCurrent] is called.
  */
  static void clearCurrent()
  {
    gdk_gl_context_clear_current();
  }

  /**
      Retrieves the current #GdkGLContext.
      Returns: the current #GdkGLContext, or null
  */
  static gdk.glcontext.GLContext getCurrent()
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_current();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the value set using [gdk.glcontext.GLContext.setDebugEnabled].
      Returns: true if debugging is enabled
  */
  bool getDebugEnabled()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_debug_enabled(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the #GdkDisplay the context is created for
      Returns: a #GdkDisplay or null
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_gl_context_get_display(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the value set using [gdk.glcontext.GLContext.setForwardCompatible].
      Returns: true if the context should be forward compatible
  */
  bool getForwardCompatible()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_forward_compatible(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the major and minor version requested by calling
      [gdk.glcontext.GLContext.setRequiredVersion].
  
      Params:
        major = return location for the major version to request
        minor = return location for the minor version to request
  */
  void getRequiredVersion(out int major, out int minor)
  {
    gdk_gl_context_get_required_version(cast(GdkGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Retrieves the #GdkGLContext that this context share data with.
      Returns: a #GdkGLContext or null
  */
  gdk.glcontext.GLContext getSharedContext()
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_shared_context(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the context is using an OpenGL or OpenGL ES profile.
      Returns: true if the #GdkGLContext is using an OpenGL ES profile
  */
  bool getUseEs()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_use_es(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the OpenGL version of the context.
      
      The context must be realized prior to calling this function.
  
      Params:
        major = return location for the major version
        minor = return location for the minor version
  */
  void getVersion(out int major, out int minor)
  {
    gdk_gl_context_get_version(cast(GdkGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Retrieves the #GdkWindow used by the context.
      Returns: a #GdkWindow or null
  */
  gdk.window.Window getWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_gl_context_get_window(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Whether the #GdkGLContext is in legacy mode or not.
      
      The #GdkGLContext must be realized before calling this function.
      
      When realizing a GL context, GDK will try to use the OpenGL 3.2 core
      profile; this profile removes all the OpenGL API that was deprecated
      prior to the 3.2 version of the specification. If the realization is
      successful, this function will return false.
      
      If the underlying OpenGL implementation does not support core profiles,
      GDK will fall back to a pre-3.2 compatibility profile, and this function
      will return true.
      
      You can use the value returned by this function to decide which kind
      of OpenGL API to use, or whether to do extension discovery, or what
      kind of shader programs to load.
      Returns: true if the GL context is in legacy mode
  */
  bool isLegacy()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_is_legacy(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Makes the context the current one.
  */
  void makeCurrent()
  {
    gdk_gl_context_make_current(cast(GdkGLContext*)this._cPtr);
  }

  /**
      Realizes the given #GdkGLContext.
      
      It is safe to call this function on a realized #GdkGLContext.
      Returns: true if the context is realized
      Throws: [ErrorWrap]
  */
  bool realize()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_gl_context_realize(cast(GdkGLContext*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets whether the #GdkGLContext should perform extra validations and
      run time checking. This is useful during development, but has
      additional overhead.
      
      The #GdkGLContext must not be realized or made current prior to
      calling this function.
  
      Params:
        enabled = whether to enable debugging in the context
  */
  void setDebugEnabled(bool enabled)
  {
    gdk_gl_context_set_debug_enabled(cast(GdkGLContext*)this._cPtr, enabled);
  }

  /**
      Sets whether the #GdkGLContext should be forward compatible.
      
      Forward compatibile contexts must not support OpenGL functionality that
      has been marked as deprecated in the requested version; non-forward
      compatible contexts, on the other hand, must support both deprecated and
      non deprecated functionality.
      
      The #GdkGLContext must not be realized or made current prior to calling
      this function.
  
      Params:
        compatible = whether the context should be forward compatible
  */
  void setForwardCompatible(bool compatible)
  {
    gdk_gl_context_set_forward_compatible(cast(GdkGLContext*)this._cPtr, compatible);
  }

  /**
      Sets the major and minor version of OpenGL to request.
      
      Setting major and minor to zero will use the default values.
      
      The #GdkGLContext must not be realized or made current prior to calling
      this function.
  
      Params:
        major = the major version to request
        minor = the minor version to request
  */
  void setRequiredVersion(int major, int minor)
  {
    gdk_gl_context_set_required_version(cast(GdkGLContext*)this._cPtr, major, minor);
  }

  /**
      Requests that GDK create a OpenGL ES context instead of an OpenGL one,
      if the platform and windowing system allows it.
      
      The context must not have been realized.
      
      By default, GDK will attempt to automatically detect whether the
      underlying GL implementation is OpenGL or OpenGL ES once the context
      is realized.
      
      You should check the return value of [gdk.glcontext.GLContext.getUseEs] after
      calling [gdk.glcontext.GLContext.realize] to decide whether to use the OpenGL or
      OpenGL ES API, extensions, or shaders.
  
      Params:
        useEs = whether the context should use OpenGL ES instead of OpenGL,
            or -1 to allow auto-detection
  */
  void setUseEs(int useEs)
  {
    gdk_gl_context_set_use_es(cast(GdkGLContext*)this._cPtr, useEs);
  }
}
