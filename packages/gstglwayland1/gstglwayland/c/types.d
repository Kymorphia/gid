/// C types for gstglwayland1 library
module gstglwayland.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;
public import gstgl.c.types;
public import gstvideo.c.types;

/**
    the contents of a #GstGLDisplayWayland are private and should only be accessed
    through the provided API
*/
struct GstGLDisplayWayland
{
  /** */
  GstGLDisplay parent;

  /** */
  void* display;

  /** */
  void* registry;

  /** */
  void* compositor;

  /** */
  void* subcompositor;

  /** */
  void* shell;

  /** */
  gboolean foreignDisplay;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLDisplayWaylandClass
{
  /** */
  GstGLDisplayClass objectClass;

  /** */
  void*[4] Padding;
}

