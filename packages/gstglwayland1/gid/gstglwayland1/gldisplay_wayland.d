/// Module for [GLDisplayWayland] class
module gid.gstglwayland1.gldisplay_wayland;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstgl1.gldisplay;
import gid.gstglwayland1.c.functions;
import gid.gstglwayland1.c.types;
import gid.gstglwayland1.types;

/**
    the contents of a #GstGLDisplayWayland are private and should only be accessed
    through the provided API
*/
class GLDisplayWayland : gid.gstgl1.gldisplay.GLDisplay
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
    return cast(void function())gst_gl_display_wayland_get_type != &gidSymbolNotFound ? gst_gl_display_wayland_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLDisplayWayland";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLDisplayWayland self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstglwayland1.gldisplay_wayland.GLDisplayWayland]
      Returns: New builder object
  */
  static GLDisplayWaylandGidBuilder builder() nothrow
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
  this(string name = null) nothrow
  {
    GstGLDisplayWayland* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_gl_display_wayland_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new display connection from a wl_display Display.
  
      Params:
        display = an existing, wayland display
      Returns: a new #GstGLDisplayWayland
  */
  static gid.gstglwayland1.gldisplay_wayland.GLDisplayWayland newWithDisplay(void* display = null) nothrow
  {
    GstGLDisplayWayland* _cretval;
    _cretval = gst_gl_display_wayland_new_with_display(display);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstglwayland1.gldisplay_wayland.GLDisplayWayland)(cast(GstGLDisplayWayland*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstglwayland1.gldisplay_wayland.GLDisplayWayland]
class GLDisplayWaylandGidBuilderImpl(T) : gid.gstgl1.gldisplay.GLDisplayGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstglwayland1.gldisplay_wayland.GLDisplayWayland]
final class GLDisplayWaylandGidBuilder : GLDisplayWaylandGidBuilderImpl!GLDisplayWaylandGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLDisplayWayland build() nothrow
  {
    return new GLDisplayWayland(cast(void*)createGObject(GLDisplayWayland._getGType), Yes.Take);
  }
}
