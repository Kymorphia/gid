/// C types for gstglwayland1 library
module gid.gstglwayland1.c.types;

public import gid.core.basictypes;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstgl1.c.types;
public import gid.gstvideo1.c.types;

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

