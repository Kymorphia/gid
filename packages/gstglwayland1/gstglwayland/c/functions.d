/// C functions for gstglwayland1 library
module gstglwayland.c.functions;

public import gid.basictypes;
import gid.loader;
import gstglwayland.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstgl.c.types;
public import gstvideo.c.types;

private immutable LIBS = ["gstgl-1.0_0"];

__gshared extern(C) nothrow
{
  // GLDisplayWayland
  GType function() c_gst_gl_display_wayland_get_type; ///
  GstGLDisplayWayland* function(const(char)* name) c_gst_gl_display_wayland_new; ///
  GstGLDisplayWayland* function(void* display) c_gst_gl_display_wayland_new_with_display; ///
}

// GLDisplayWayland

/** */
alias gst_gl_display_wayland_get_type = c_gst_gl_display_wayland_get_type;

/** */
alias gst_gl_display_wayland_new = c_gst_gl_display_wayland_new;

/** */
alias gst_gl_display_wayland_new_with_display = c_gst_gl_display_wayland_new_with_display;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // GLDisplayWayland
  gidLink(cast(void**)&gst_gl_display_wayland_get_type, "gst_gl_display_wayland_get_type", libs);
  gidLink(cast(void**)&gst_gl_display_wayland_new, "gst_gl_display_wayland_new", libs);
  gidLink(cast(void**)&gst_gl_display_wayland_new_with_display, "gst_gl_display_wayland_new_with_display", libs);
}
