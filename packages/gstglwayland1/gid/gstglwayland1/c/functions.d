/// C functions for gstglwayland1 library
module gid.gstglwayland1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstglwayland1.c.types;
static import gid.gstglwayland1.c._gidlib_GstGLWayland;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstgl1.c.types;
public import gid.gstvideo1.c.types;

private immutable LIBS = ["gstgl-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gstglwayland1.c._gidlib_GstGLWayland.gidLibLinked;

// GLDisplayWayland
private alias c_gst_gl_display_wayland_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_display_wayland_get_typeFn c_gst_gl_display_wayland_get_type; ///
private alias c_gst_gl_display_wayland_newFn = extern(C) GstGLDisplayWayland* function(const(char)* name) nothrow;
__gshared c_gst_gl_display_wayland_newFn c_gst_gl_display_wayland_new; ///
private alias c_gst_gl_display_wayland_new_with_displayFn = extern(C) GstGLDisplayWayland* function(void* display) nothrow;
__gshared c_gst_gl_display_wayland_new_with_displayFn c_gst_gl_display_wayland_new_with_display; ///

// GLDisplayWayland

/** */
alias gst_gl_display_wayland_get_type = c_gst_gl_display_wayland_get_type;

/** */
alias gst_gl_display_wayland_new = c_gst_gl_display_wayland_new;

/** */
alias gst_gl_display_wayland_new_with_display = c_gst_gl_display_wayland_new_with_display;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstglwayland1", "GstGLWayland");

  // GLDisplayWayland
  gidLink(cast(void**)&gst_gl_display_wayland_get_type, "gst_gl_display_wayland_get_type", libs);
  gidLink(cast(void**)&gst_gl_display_wayland_new, "gst_gl_display_wayland_new", libs);
  gidLink(cast(void**)&gst_gl_display_wayland_new_with_display, "gst_gl_display_wayland_new_with_display", libs);
}
