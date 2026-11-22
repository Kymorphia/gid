/// Module for [GLDisplayEGL] class
module gid.gstglegl1.gldisplay_egl;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstgl1.gldisplay;
import gid.gstgl1.types;
import gid.gstglegl1.c.functions;
import gid.gstglegl1.c.types;
import gid.gstglegl1.types;

/**
    the contents of a #GstGLDisplayEGL are private and should only be accessed
    through the provided API
*/
class GLDisplayEGL : gid.gstgl1.gldisplay.GLDisplay
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
      Get builder for [gid.gstglegl1.gldisplay_egl.GLDisplayEGL]
      Returns: New builder object
  */
  static GLDisplayEGLGidBuilder builder() nothrow
  {
    return new GLDisplayEGLGidBuilder;
  }

  /**
      Create a new #GstGLDisplayEGL using the default EGL_DEFAULT_DISPLAY.
      
      The returned #GstGLDisplayEGL will by default free all EGL resources when
      finalized. See [gid.gstglegl1.gldisplay_egl.GLDisplayEGL.setForeign] for details on if you need
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
  static gid.gstglegl1.gldisplay_egl.GLDisplayEGL newSurfaceless() nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new_surfaceless();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstglegl1.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static gid.gstglegl1.gldisplay_egl.GLDisplayEGL newWithEglDisplay(void* display = null) nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new_with_egl_display(display);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstglegl1.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a EGL display connection from a native Display.
      
      This function will return the same value for multiple calls with the same
      display.
      
      The returned #GstGLDisplayEGL will *not* be marked as foreign and will free
      some display global EGL resources on finalization. If an external API/user
      will be also handling the lifetime of the `EGLDisplay`, you should mark the
      returned #GstGLDisplayEGL as foreign by calling [gid.gstglegl1.gldisplay_egl.GLDisplayEGL.setForeign].
  
      Params:
        display = an existing #GstGLDisplay
      Returns: a new #GstGLDisplayEGL
  */
  static gid.gstglegl1.gldisplay_egl.GLDisplayEGL fromGlDisplay(gid.gstgl1.gldisplay.GLDisplay display) nothrow
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_from_gl_display(display ? cast(GstGLDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstglegl1.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to create a new `EGLDisplay` from display.  If type is
      [gid.gstgl1.types.GLDisplayType.Any] or [gid.gstgl1.types.GLDisplayType.EglSurfaceless], then
      display must be 0. type must not be [gid.gstgl1.types.GLDisplayType.None].
  
      Params:
        type = a #GstGLDisplayType
        display = pointer to a display (or 0)
      Returns: A `EGLDisplay` or `EGL_NO_DISPLAY`
  */
  static void* getFromNative(gid.gstgl1.types.GLDisplayType type, size_t display) nothrow
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
      [gid.gstglegl1.gldisplay_egl.GLDisplayEGL.newWithEglDisplay].
  
      Params:
        foreign = whether display_egl should be marked as containing a foreign
                    `EGLDisplay`
  */
  void setForeign(bool foreign) nothrow
  {
    gst_gl_display_egl_set_foreign(cast(GstGLDisplayEGL*)this._cPtr, foreign);
  }
}

/// Fluent builder implementation template for [gid.gstglegl1.gldisplay_egl.GLDisplayEGL]
class GLDisplayEGLGidBuilderImpl(T) : gid.gstgl1.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstglegl1.gldisplay_egl.GLDisplayEGL]
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
