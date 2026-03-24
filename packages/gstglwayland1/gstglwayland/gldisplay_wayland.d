/// Module for [GLDisplayWayland] class
module gstglwayland.gldisplay_wayland;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstgl.gldisplay;
import gstglwayland.c.functions;
import gstglwayland.c.types;
import gstglwayland.types;

/**
    the contents of a #GstGLDisplayWayland are private and should only be accessed
    through the provided API
*/
class GLDisplayWayland : gstgl.gldisplay.GLDisplay
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
    return cast(void function())gst_gl_display_wayland_get_type != &gidSymbolNotFound ? gst_gl_display_wayland_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayWayland self()
  {
    return this;
  }

  /**
  Get builder for [gstglwayland.gldisplay_wayland.GLDisplayWayland]
  Returns: New builder object
  */
  static GLDisplayWaylandGidBuilder builder()
  {
    return new GLDisplayWaylandGidBuilder;
  }

  /**
      Create a new #GstGLDisplayWayland from the wayland display name.  See `wl_display_connect`()
      for details on what is a valid name.
  
      Params:
        name = a display name
      Returns: a new #GstGLDisplayWayland or null
  */
  this(string name = null)
  {
    GstGLDisplayWayland* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_gl_display_wayland_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new display connection from a wl_display Display.
  
      Params:
        display = an existing, wayland display
      Returns: a new #GstGLDisplayWayland
  */
  static gstglwayland.gldisplay_wayland.GLDisplayWayland newWithDisplay(void* display = null)
  {
    GstGLDisplayWayland* _cretval;
    _cretval = gst_gl_display_wayland_new_with_display(display);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstglwayland.gldisplay_wayland.GLDisplayWayland)(cast(GstGLDisplayWayland*)_cretval, Yes.Take);
    return _retval;
  }
}

class GLDisplayWaylandGidBuilderImpl(T) : gstgl.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gstglwayland.gldisplay_wayland.GLDisplayWayland]
final class GLDisplayWaylandGidBuilder : GLDisplayWaylandGidBuilderImpl!GLDisplayWaylandGidBuilder
{
  GLDisplayWayland build()
  {
    return new GLDisplayWayland(cast(void*)createGObject(GLDisplayWayland._getGType), Yes.Take);
  }
}
