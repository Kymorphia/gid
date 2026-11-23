/// Module for [GLContext] class
module gid.gdk4.glcontext;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.display;
import gid.gdk4.draw_context;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Represents a platform-specific OpenGL draw context.
    
    [gid.gdk4.glcontext.GLContext]s are created for a surface using
    [gid.gdk4.surface.Surface.createGlContext], and the context will match
    the characteristics of the surface.
    
    A [gid.gdk4.glcontext.GLContext] is not tied to any particular normal framebuffer.
    For instance, it cannot draw to the surface back buffer. The GDK
    repaint system is in full control of the painting to that. Instead,
    you can create render buffers or textures and use `func@cairo_draw_from_gl`
    in the draw function of your widget to draw them. Then GDK will handle
    the integration of your rendering with that of other widgets.
    
    Support for [gid.gdk4.glcontext.GLContext] is platform-specific and context creation
    can fail, returning null context.
    
    A [gid.gdk4.glcontext.GLContext] has to be made "current" in order to start using
    it, otherwise any OpenGL call will be ignored.
    
    ## Creating a new OpenGL context
    
    In order to create a new [gid.gdk4.glcontext.GLContext] instance you need a [gid.gdk4.surface.Surface],
    which you typically get during the realize call of a widget.
    
    A [gid.gdk4.glcontext.GLContext] is not realized until either [gid.gdk4.glcontext.GLContext.makeCurrent]
    or [gid.gdk4.glcontext.GLContext.realize] is called. It is possible to specify
    details of the GL context like the OpenGL version to be used, or whether
    the GL context should have extra state validation enabled after calling
    [gid.gdk4.surface.Surface.createGlContext] by calling [gid.gdk4.glcontext.GLContext.realize].
    If the realization fails you have the option to change the settings of
    the [gid.gdk4.glcontext.GLContext] and try again.
    
    ## Using a GdkGLContext
    
    You will need to make the [gid.gdk4.glcontext.GLContext] the current context before issuing
    OpenGL calls; the system sends OpenGL commands to whichever context is current.
    It is possible to have multiple contexts, so you always need to ensure that
    the one which you want to draw with is the current one before issuing commands:
    
    ```c
    gdk_gl_context_make_current (context);
    ```
    
    You can now perform your drawing using OpenGL commands.
    
    You can check which [gid.gdk4.glcontext.GLContext] is the current one by using
    [gid.gdk4.glcontext.GLContext.getCurrent]; you can also unset any [gid.gdk4.glcontext.GLContext]
    that is currently set by calling [gid.gdk4.glcontext.GLContext.clearCurrent].
*/
class GLContext : gid.gdk4.draw_context.DrawContext
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_gl_context_get_type != &gidSymbolNotFound ? gdk_gl_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkGLContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.glcontext.GLContext]
      Returns: New builder object
  */
  static GLContextGidBuilder builder() nothrow
  {
    return new GLContextGidBuilder;
  }

  /**
      Get `allowedApis` property.
      Returns: The allowed APIs.
  */
  @property gid.gdk4.types.GLAPI allowedApis() nothrow
  {
    return getAllowedApis();
  }

  /**
      Set `allowedApis` property.
      Params:
        propval = The allowed APIs.
  */
  @property void allowedApis(gid.gdk4.types.GLAPI propval) nothrow
  {
    setAllowedApis(propval);
  }

  /**
      Get `api` property.
      Returns: The API currently in use.
  */
  @property gid.gdk4.types.GLAPI api() nothrow
  {
    return getApi();
  }

  /**
      Get `sharedContext` property.
      Returns: Always null
        
        As many contexts can share data now and no single shared context exists
        anymore, this function has been deprecated and now always returns null.
  
      Deprecated: Use [gid.gdk4.glcontext.GLContext.isShared] to check if contexts
          can be shared.
  */
  @property gid.gdk4.glcontext.GLContext sharedContext() nothrow
  {
    return getSharedContext();
  }

  /**
      Clears the current [gid.gdk4.glcontext.GLContext].
      
      Any OpenGL call after this function returns will be ignored
      until [gid.gdk4.glcontext.GLContext.makeCurrent] is called.
  */
  static void clearCurrent() nothrow
  {
    gdk_gl_context_clear_current();
  }

  /**
      Retrieves the current [gid.gdk4.glcontext.GLContext].
      Returns: the current [gid.gdk4.glcontext.GLContext]
  */
  static gid.gdk4.glcontext.GLContext getCurrent() nothrow
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_current();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the allowed APIs set via [gid.gdk4.glcontext.GLContext.setAllowedApis].
      Returns: the allowed APIs
  */
  gid.gdk4.types.GLAPI getAllowedApis() nothrow
  {
    GdkGLAPI _cretval;
    _cretval = gdk_gl_context_get_allowed_apis(cast(GdkGLContext*)this._cPtr);
    gid.gdk4.types.GLAPI _retval = cast(gid.gdk4.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Gets the API currently in use.
      
      If the renderer has not been realized yet, 0 is returned.
      Returns: the currently used API
  */
  gid.gdk4.types.GLAPI getApi() nothrow
  {
    GdkGLAPI _cretval;
    _cretval = gdk_gl_context_get_api(cast(GdkGLContext*)this._cPtr);
    gid.gdk4.types.GLAPI _retval = cast(gid.gdk4.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Retrieves whether the context is doing extra validations and runtime checking.
      
      See [gid.gdk4.glcontext.GLContext.setDebugEnabled].
      Returns: true if debugging is enabled
  */
  bool getDebugEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_debug_enabled(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the display the context is created for
      Returns: a [gid.gdk4.display.Display]
  */
  override gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_gl_context_get_display(cast(GdkGLContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves whether the context is forward-compatible.
      
      See [gid.gdk4.glcontext.GLContext.setForwardCompatible].
      Returns: true if the context should be forward-compatible
  */
  bool getForwardCompatible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_get_forward_compatible(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves required OpenGL version set as a requirement for the context
      realization. It will not change even if a greater OpenGL version is supported
      and used after the context is realized. See
      [gid.gdk4.glcontext.GLContext.getVersion] for the real version in use.
      
      See [gid.gdk4.glcontext.GLContext.setRequiredVersion].
  
      Params:
        major = return location for the major version to request
        minor = return location for the minor version to request
  */
  void getRequiredVersion(out int major, out int minor) nothrow
  {
    gdk_gl_context_get_required_version(cast(GdkGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Used to retrieves the [gid.gdk4.glcontext.GLContext] that this context share data with.
      
      As many contexts can share data now and no single shared context exists
      anymore, this function has been deprecated and now always returns null.
      Returns: null
  
      Deprecated: Use [gid.gdk4.glcontext.GLContext.isShared] to check if contexts
          can be shared.
  */
  gid.gdk4.glcontext.GLContext getSharedContext() nothrow
  {
    GdkGLContext* _cretval;
    _cretval = gdk_gl_context_get_shared_context(cast(GdkGLContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the surface used by the context.
      Returns: a [gid.gdk4.surface.Surface]
  */
  override gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_gl_context_get_surface(cast(GdkGLContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the context is using an OpenGL or OpenGL ES profile.
      Returns: true if the [gid.gdk4.glcontext.GLContext] is using an OpenGL ES profile;
        false if other profile is in use of if the context has not yet
        been realized.
  */
  bool getUseEs() nothrow
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
  void getVersion(out int major, out int minor) nothrow
  {
    gdk_gl_context_get_version(cast(GdkGLContext*)this._cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Whether the [gid.gdk4.glcontext.GLContext] is in legacy mode or not.
      
      The [gid.gdk4.glcontext.GLContext] must be realized before calling this function.
      
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
  bool isLegacy() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_is_legacy(cast(GdkGLContext*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the two GL contexts can share resources.
      
      When they can, the texture IDs from other can be used in self. This
      is particularly useful when passing [gid.gdk4.gltexture.GLTexture] objects between
      different contexts.
      
      Contexts created for the same display with the same properties will
      always be compatible, even if they are created for different surfaces.
      For other contexts it depends on the GL backend.
      
      Both contexts must be realized for this check to succeed. If either one
      is not, this function will return false.
  
      Params:
        other = the [gid.gdk4.glcontext.GLContext] that should be compatible with self
      Returns: true if the two GL contexts are compatible.
  */
  bool isShared(gid.gdk4.glcontext.GLContext other) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_gl_context_is_shared(cast(GdkGLContext*)this._cPtr, other ? cast(GdkGLContext*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Makes the context the current one.
  */
  void makeCurrent() nothrow
  {
    gdk_gl_context_make_current(cast(GdkGLContext*)this._cPtr);
  }

  /**
      Realizes the given [gid.gdk4.glcontext.GLContext].
      
      It is safe to call this function on a realized [gid.gdk4.glcontext.GLContext].
      Returns: true if the context is realized
      Throws: [ErrorWrap]
  */
  bool realize()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_gl_context_realize(cast(GdkGLContext*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the allowed APIs. When [gid.gdk4.glcontext.GLContext.realize] is called, only the
      allowed APIs will be tried. If you set this to 0, realizing will always fail.
      
      If you set it on a realized context, the property will not have any effect.
      It is only relevant during [gid.gdk4.glcontext.GLContext.realize].
      
      By default, all APIs are allowed.
  
      Params:
        apis = the allowed APIs
  */
  void setAllowedApis(gid.gdk4.types.GLAPI apis) nothrow
  {
    gdk_gl_context_set_allowed_apis(cast(GdkGLContext*)this._cPtr, apis);
  }

  /**
      Sets whether the [gid.gdk4.glcontext.GLContext] should perform extra validations and
      runtime checking.
      
      This is useful during development, but has additional overhead.
      
      The [gid.gdk4.glcontext.GLContext] must not be realized or made current prior to
      calling this function.
  
      Params:
        enabled = whether to enable debugging in the context
  */
  void setDebugEnabled(bool enabled) nothrow
  {
    gdk_gl_context_set_debug_enabled(cast(GdkGLContext*)this._cPtr, enabled);
  }

  /**
      Sets whether the [gid.gdk4.glcontext.GLContext] should be forward-compatible.
      
      Forward-compatible contexts must not support OpenGL functionality that
      has been marked as deprecated in the requested version; non-forward
      compatible contexts, on the other hand, must support both deprecated and
      non deprecated functionality.
      
      The [gid.gdk4.glcontext.GLContext] must not be realized or made current prior to calling
      this function.
  
      Params:
        compatible = whether the context should be forward-compatible
  */
  void setForwardCompatible(bool compatible) nothrow
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
  void setRequiredVersion(int major, int minor) nothrow
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
      
      You should check the return value of [gid.gdk4.glcontext.GLContext.getUseEs]
      after calling [gid.gdk4.glcontext.GLContext.realize] to decide whether to use
      the OpenGL or OpenGL ES API, extensions, or shaders.
  
      Params:
        useEs = whether the context should use OpenGL ES instead of OpenGL,
            or -1 to allow auto-detection
  */
  void setUseEs(int useEs) nothrow
  {
    gdk_gl_context_set_use_es(cast(GdkGLContext*)this._cPtr, useEs);
  }
}

/// Fluent builder implementation template for [gid.gdk4.glcontext.GLContext]
class GLContextGidBuilderImpl(T) : gid.gdk4.draw_context.DrawContextGidBuilderImpl!T
{

  /**
      Set `allowedApis` property.
      Params:
        propval = The allowed APIs.
      Returns: Builder instance for fluent chaining
  */
  T allowedApis(gid.gdk4.types.GLAPI propval) nothrow
  {
    return setProperty("allowed-apis", propval);
  }

  /**
      Set `sharedContext` property.
      Params:
        propval = Always null
          
          As many contexts can share data now and no single shared context exists
          anymore, this function has been deprecated and now always returns null.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gdk4.glcontext.GLContext.isShared] to check if contexts
          can be shared.
  */
  T sharedContext(gid.gdk4.glcontext.GLContext propval) nothrow
  {
    return setProperty("shared-context", propval);
  }
}

/// Fluent builder for [gid.gdk4.glcontext.GLContext]
final class GLContextGidBuilder : GLContextGidBuilderImpl!GLContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLContext build() nothrow
  {
    return new GLContext(cast(void*)createGObject(GLContext._getGType), Yes.Take);
  }
}
