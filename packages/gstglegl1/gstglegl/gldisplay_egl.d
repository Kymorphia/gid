/// Module for [GLDisplayEGL] class
module gstglegl.gldisplay_egl;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstgl.gldisplay;
import gstgl.types;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    the contents of a #GstGLDisplayEGL are private and should only be accessed
    through the provided API
*/
class GLDisplayEGL : gstgl.gldisplay.GLDisplay
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_egl_get_type != &gidSymbolNotFound ? gst_gl_display_egl_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLDisplayEGL";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayEGL self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstglegl.gldisplay_egl.GLDisplayEGL]
      Returns: New builder object
  */
  static GLDisplayEGLGidBuilder builder() nothrow
  {
    return new GLDisplayEGLGidBuilder;
  }

  /**
      Create a new #GstGLDisplayEGL using the default EGL_DEFAULT_DISPLAY.
      
      The returned #GstGLDisplayEGL will by default free all EGL resources when
      finalized. See [gstglegl.gldisplay_egl.GLDisplayEGL.setForeign] for details on if you need
      the EGLDisplay to remain alive.
      Returns: a new #GstGLDisplayEGL or null
  */
  this() nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new();
    this(_cretval, Yes.Take);
  }

  /**
      Create a new surfaceless #GstGLDisplayEGL using the Mesa3D
      EGL_PLATFORM_SURFACELESS_MESA extension.
      Returns: a new #GstGLDisplayEGL or null
  */
  static gstglegl.gldisplay_egl.GLDisplayEGL newSurfaceless() nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new_surfaceless();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglegl.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static gstglegl.gldisplay_egl.GLDisplayEGL newWithEglDisplay(void* display = null) nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new_with_egl_display(display);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglegl.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a EGL display connection from a native Display.
      
      This function will return the same value for multiple calls with the same
      display.
      
      The returned #GstGLDisplayEGL will *not* be marked as foreign and will free
      some display global EGL resources on finalization. If an external API/user
      will be also handling the lifetime of the `EGLDisplay`, you should mark the
      returned #GstGLDisplayEGL as foreign by calling [gstglegl.gldisplay_egl.GLDisplayEGL.setForeign].
  
      Params:
        display = an existing #GstGLDisplay
      Returns: a new #GstGLDisplayEGL
  */
  static gstglegl.gldisplay_egl.GLDisplayEGL fromGlDisplay(gstgl.gldisplay.GLDisplay display) nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_from_gl_display(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglegl.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to create a new `EGLDisplay` from display.  If type is
      [gstgl.types.GLDisplayType.Any] or [gstgl.types.GLDisplayType.EglSurfaceless], then
      display must be 0. type must not be [gstgl.types.GLDisplayType.None].
  
      Params:
        type = a #GstGLDisplayType
        display = pointer to a display (or 0)
      Returns: A `EGLDisplay` or `EGL_NO_DISPLAY`
  */
  static void* getFromNative(gstgl.types.GLDisplayType type, size_t display) nothrow
  {
    auto _retval = gst_gl_display_egl_get_from_native(type, display);
    return _retval;
  }

  /**
      Configure whether or not this EGL display is foreign and is managed by an
      external application/library.
      
      A display marked as foreign will not have display global resources freed when
      this display is finalized. As such, any external API using the same
      `EGLDisplay` must keep the `EGLDisplay` alive while GStreamer is using any
      EGL or GL resources associated with that `EGLDisplay`.  The reverse is also
      true and a foreign #GstGLDisplayEGL must not be used after the associated
      `EGLDisplay` has been destroyed externally with `eglTerminate()`.
      
      A non-foreign #GstGLDisplayEGL will destroy the associated `EGLDisplay` on
      finalization. This can also be useful when a user would like GStreamer to
      assume ownership of the `EGLDisplay` after calling e.g.
      [gstglegl.gldisplay_egl.GLDisplayEGL.newWithEglDisplay].
  
      Params:
        foreign = whether display_egl should be marked as containing a foreign
                    `EGLDisplay`
  */
  void setForeign(bool foreign) nothrow
  {
    gst_gl_display_egl_set_foreign(cast(GstGLDisplayEGL*)this._cPtr, foreign);
  }
}

/// Fluent builder implementation template for [gstglegl.gldisplay_egl.GLDisplayEGL]
class GLDisplayEGLGidBuilderImpl(T) : gstgl.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gstglegl.gldisplay_egl.GLDisplayEGL]
final class GLDisplayEGLGidBuilder : GLDisplayEGLGidBuilderImpl!GLDisplayEGLGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLDisplayEGL build() nothrow
  {
    return new GLDisplayEGL(cast(void*)createGObject(GLDisplayEGL._getGType), Yes.Take);
  }
}
