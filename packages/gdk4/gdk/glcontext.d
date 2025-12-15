/// Module for [GLContext] class
module gdk.glcontext;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.draw_context;
import gdk.surface;
import gdk.types;
import gid.gid;
import glib.error;
import gobject.object;

/**
    [gdk.glcontext.GLContext] is an object representing a platform-specific
    OpenGL draw context.
    
    [gdk.glcontext.GLContext]s are created for a surface using
    [gdk.surface.Surface.createGlContext], and the context will match
    the characteristics of the surface.
    
    A [gdk.glcontext.GLContext] is not tied to any particular normal framebuffer.
    For instance, it cannot draw to the surface back buffer. The GDK
    repaint system is in full control of the painting to that. Instead,
    you can create render buffers or textures and use `func@cairo_draw_from_gl`
    in the draw function of your widget to draw them. Then GDK will handle
    the integration of your rendering with that of other widgets.
    
    Support for [gdk.glcontext.GLContext] is platform-specific and context creation
    can fail, returning null context.
    
    A [gdk.glcontext.GLContext] has to be made "current" in order to start using
    it, otherwise any OpenGL call will be ignored.
    
    ## Creating a new OpenGL context
    
    In order to create a new [gdk.glcontext.GLContext] instance you need a [gdk.surface.Surface],
    which you typically get during the realize call of a widget.
    
    A [gdk.glcontext.GLContext] is not realized until either [gdk.glcontext.GLContext.makeCurrent]
    or [gdk.glcontext.GLContext.realize] is called. It is possible to specify
    details of the GL context like the OpenGL version to be used, or whether
    the GL context should have extra state validation enabled after calling
    [gdk.surface.Surface.createGlContext] by calling [gdk.glcontext.GLContext.realize].
    If the realization fails you have the option to change the settings of
    the [gdk.glcontext.GLContext] and try again.
    
    ## Using a GdkGLContext
    
    You will need to make the [gdk.glcontext.GLContext] the current context before issuing
    OpenGL calls; the system sends OpenGL commands to whichever context is current.
    It is possible to have multiple contexts, so you always need to ensure that
    the one which you want to draw with is the current one before issuing commands:
    
    ```c
    gdk_gl_context_make_current (context);
    ```
    
    You can now perform your drawing using OpenGL commands.
    
    You can check which [gdk.glcontext.GLContext] is the current one by using
    [gdk.glcontext.GLContext.getCurrent]; you can also unset any [gdk.glcontext.GLContext]
    that is currently set by calling [gdk.glcontext.GLContext.clearCurrent].
*/
class GLContext : gdk.draw_context.DrawContext
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
      Get `allowedApis` property.
      Returns: The allowed APIs.
  */
  @property gdk.types.GLAPI allowedApis()
  {
    return getAllowedApis();
  }

  /**
      Set `allowedApis` property.
      Params:
        propval = The allowed APIs.
  */
  @property void allowedApis(gdk.types.GLAPI propval)
  {
    return setAllowedApis(propval);
  }

  /**
      Get `api` property.
      Returns: The API currently in use.
  */
  @property gdk.types.GLAPI api()
  {
    return getApi();
  }

  /**
      Clears the current [gdk.glcontext.GLContext].
      
      Any OpenGL call after this function returns will be ignored
      until [gdk.glcontext.GLContext.makeCurrent] is called.
  */
  static void clearCurrent()
  {
    gdk_gl_context_clear_current();
  }

  /**
      Retrieves the current [gdk.glcontext.GLContext].
      Returns: the current [gdk.glcontext.GLContext]
  */
  static gdk.glcontext.GLContext getCurrent()
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_current();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the allowed APIs set via [gdk.glcontext.GLContext.setAllowedApis].
      Returns: the allowed APIs
  */
  gdk.types.GLAPI getAllowedApis()
  {
    GdkGLAPI _cretval;
    _cretval = gdk_gl_context_get_allowed_apis(cast(GdkGLContext*)this._cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Gets the API currently in use.
      
      If the renderer has not been realized yet, 0 is returned.
      Returns: the currently used API
  */
  gdk.types.GLAPI getApi()
  {
    GdkGLAPI _cretval;
    _cretval = gdk_gl_context_get_api(cast(GdkGLContext*)this._cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Retrieves whether the context is doing extra validations and runtime checking.
      
      See [gdk.glcontext.GLContext.setDebugEnabled].
      Returns: true if debugging is enabled
  */
  bool getDebugEnabled()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_debug_enabled(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the display the context is created for
      Returns: a [gdk.display.Display]
  */
  override gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_gl_context_get_display(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves whether the context is forward-compatible.
      
      See [gdk.glcontext.GLContext.setForwardCompatible].
      Returns: true if the context should be forward-compatible
  */
  bool getForwardCompatible()
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_forward_compatible(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves required OpenGL version set as a requirement for the context
      realization. It will not change even if a greater OpenGL version is supported
      and used after the context is realized. See
      [gdk.glcontext.GLContext.getVersion] for the real version in use.
      
      See [gdk.glcontext.GLContext.setRequiredVersion].
  
      Params:
        major = return location for the major version to request
        minor = return location for the minor version to request
  */
  void getRequiredVersion(out int major, out int minor)
  {
    gdk_gl_context_get_required_version(cast(GdkGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Used to retrieves the [gdk.glcontext.GLContext] that this context share data with.
      
      As many contexts can share data now and no single shared context exists
      anymore, this function has been deprecated and now always returns null.
      Returns: null
  
      Deprecated: Use [gdk.glcontext.GLContext.isShared] to check if contexts
          can be shared.
  */
  gdk.glcontext.GLContext getSharedContext()
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_shared_context(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the surface used by the context.
      Returns: a [gdk.surface.Surface]
  */
  override gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_gl_context_get_surface(cast(GdkGLContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the context is using an OpenGL or OpenGL ES profile.
      Returns: true if the [gdk.glcontext.GLContext] is using an OpenGL ES profile;
        false if other profile is in use of if the context has not yet
        been realized.
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
      Whether the [gdk.glcontext.GLContext] is in legacy mode or not.
      
      The [gdk.glcontext.GLContext] must be realized before calling this function.
      
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
      Checks if the two GL contexts can share resources.
      
      When they can, the texture IDs from other can be used in self. This
      is particularly useful when passing [gdk.gltexture.GLTexture] objects between
      different contexts.
      
      Contexts created for the same display with the same properties will
      always be compatible, even if they are created for different surfaces.
      For other contexts it depends on the GL backend.
      
      Both contexts must be realized for this check to succeed. If either one
      is not, this function will return false.
  
      Params:
        other = the [gdk.glcontext.GLContext] that should be compatible with self
      Returns: true if the two GL contexts are compatible.
  */
  bool isShared(gdk.glcontext.GLContext other)
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_is_shared(cast(GdkGLContext*)this._cPtr, other ? cast(GdkGLContext*)other._cPtr(No.Dup) : null);
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
      Realizes the given [gdk.glcontext.GLContext].
      
      It is safe to call this function on a realized [gdk.glcontext.GLContext].
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
      Sets the allowed APIs. When [gdk.glcontext.GLContext.realize] is called, only the
      allowed APIs will be tried. If you set this to 0, realizing will always fail.
      
      If you set it on a realized context, the property will not have any effect.
      It is only relevant during [gdk.glcontext.GLContext.realize].
      
      By default, all APIs are allowed.
  
      Params:
        apis = the allowed APIs
  */
  void setAllowedApis(gdk.types.GLAPI apis)
  {
    gdk_gl_context_set_allowed_apis(cast(GdkGLContext*)this._cPtr, apis);
  }

  /**
      Sets whether the [gdk.glcontext.GLContext] should perform extra validations and
      runtime checking.
      
      This is useful during development, but has additional overhead.
      
      The [gdk.glcontext.GLContext] must not be realized or made current prior to
      calling this function.
  
      Params:
        enabled = whether to enable debugging in the context
  */
  void setDebugEnabled(bool enabled)
  {
    gdk_gl_context_set_debug_enabled(cast(GdkGLContext*)this._cPtr, enabled);
  }

  /**
      Sets whether the [gdk.glcontext.GLContext] should be forward-compatible.
      
      Forward-compatible contexts must not support OpenGL functionality that
      has been marked as deprecated in the requested version; non-forward
      compatible contexts, on the other hand, must support both deprecated and
      non deprecated functionality.
      
      The [gdk.glcontext.GLContext] must not be realized or made current prior to calling
      this function.
  
      Params:
        compatible = whether the context should be forward-compatible
  */
  void setForwardCompatible(bool compatible)
  {
    gdk_gl_context_set_forward_compatible(cast(GdkGLContext*)this._cPtr, compatible);
  }

  /**
      Sets the major and minor version of OpenGL to request.
      
      Setting major and minor to zero will use the default values.
      
      Setting major and minor lower than the minimum versions required
      by GTK will result in the context choosing the minimum version.
      
      The context must not be realized or made current prior to calling
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
      Requests that GDK create an OpenGL ES context instead of an OpenGL one.
      
      Not all platforms support OpenGL ES.
      
      The context must not have been realized.
      
      By default, GDK will attempt to automatically detect whether the
      underlying GL implementation is OpenGL or OpenGL ES once the context
      is realized.
      
      You should check the return value of [gdk.glcontext.GLContext.getUseEs]
      after calling [gdk.glcontext.GLContext.realize] to decide whether to use
      the OpenGL or OpenGL ES API, extensions, or shaders.
  
      Params:
        useEs = whether the context should use OpenGL ES instead of OpenGL,
            or -1 to allow auto-detection
  */
  void setUseEs(int useEs)
  {
    gdk_gl_context_set_use_es(cast(GdkGLContext*)this._cPtr, useEs);
  }
}
