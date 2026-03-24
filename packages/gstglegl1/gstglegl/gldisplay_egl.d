/// Module for [GLDisplayEGL] class
module gstglegl.gldisplay_egl;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_display_egl_get_type != &gidSymbolNotFound ? gst_gl_display_egl_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayEGL self()
  {
    return this;
  }

  /**
  Get builder for [gstglegl.gldisplay_egl.GLDisplayEGL]
  Returns: New builder object
  */
  static GLDisplayEGLGidBuilder builder()
  {
    return new GLDisplayEGLGidBuilder;
  }

  /**
      Create a new #GstGLDisplayEGL using the default EGL_DEFAULT_DISPLAY.
      Returns: a new #GstGLDisplayEGL or null
  */
  this()
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
  static gstglegl.gldisplay_egl.GLDisplayEGL newSurfaceless()
  {
    GstGLDisplayEGL* _cretval;
    _cretval = gst_gl_display_egl_new_surfaceless();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglegl.gldisplay_egl.GLDisplayEGL)(cast(GstGLDisplayEGL*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static gstglegl.gldisplay_egl.GLDisplayEGL newWithEglDisplay(void* display = null)
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
  
      Params:
        display = an existing #GstGLDisplay
      Returns: a new #GstGLDisplayEGL
  */
  static gstglegl.gldisplay_egl.GLDisplayEGL fromGlDisplay(gstgl.gldisplay.GLDisplay display)
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
  static void* getFromNative(gstgl.types.GLDisplayType type, size_t display)
  {
    auto _retval = gst_gl_display_egl_get_from_native(type, display);
    return _retval;
  }
}

class GLDisplayEGLGidBuilderImpl(T) : gstgl.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gstglegl.gldisplay_egl.GLDisplayEGL]
final class GLDisplayEGLGidBuilder : GLDisplayEGLGidBuilderImpl!GLDisplayEGLGidBuilder
{
  GLDisplayEGL build()
  {
    return new GLDisplayEGL(cast(void*)createGObject(GLDisplayEGL._getGType), Yes.Take);
  }
}
