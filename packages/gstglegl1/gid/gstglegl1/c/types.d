/// C types for gstglegl1 library
module gid.gstglegl1.c.types;

public import gid.core.basictypes;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstgl1.c.types;
public import gid.gstvideo1.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "GstGLEGL";

/// GIR namespace version of the binding
enum string _gidGirVersion = "1.0";

/**
    #GstEGLImage represents and holds an `EGLImage` handle.
    
    A #GstEGLImage can be created from a dmabuf with [gid.gstglegl1.eglimage.EGLImage.fromDmabuf],
    or [gid.gstglegl1.eglimage.EGLImage.fromDmabufDirect], or #GstGLMemoryEGL provides a
    #GstAllocator to allocate `EGLImage`'s bound to and OpenGL texture.
*/
struct GstEGLImage
{
  /** */
  GstMiniObject parent;

  /** */
  GstGLContext* context;

  /** */
  void* image;

  /** */
  GstGLFormat format;

  /** */
  void* destroyData;

  /** */
  GstEGLImageDestroyNotify destroyNotify;

  /** */
  void*[4] Padding;
}

/**
    the contents of a #GstGLDisplayEGL are private and should only be accessed
    through the provided API
*/
struct GstGLDisplayEGL
{
  /** */
  GstGLDisplay parent;

  /** */
  void* display;

  /** */
  gboolean foreignDisplay;

  /** */
  void*[4] Padding;
}

/** */
struct GstGLDisplayEGLClass
{
  /** */
  GstGLDisplayClass objectClass;

  /** */
  void*[4] Padding;
}

/**
    the contents of a #GstGLDisplayEGLDevice are private and should only be accessed
    through the provided API
*/
struct GstGLDisplayEGLDevice
{
  /** */
  GstGLDisplay parent;

  /** */
  void* device;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLDisplayEGLDeviceClass struct
*/
struct GstGLDisplayEGLDeviceClass
{
  /** */
  GstGLDisplayClass objectClass;

  /** */
  void*[4] Padding;
}

/**
    #GstGLMemoryEGL is created or wrapped through [gid.gstgl1.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
*/
struct GstGLMemoryEGL
{
  /** */
  GstGLMemory mem;

  /** */
  GstEGLImage* image;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstGLMemoryEGLAllocator struct
*/
struct GstGLMemoryEGLAllocator
{
  /** */
  GstGLMemoryAllocator parent;

  /** */
  void*[4] Padding;
}

/**
    The #GstGLMemoryEGLAllocatorClass only contains private data
*/
struct GstGLMemoryEGLAllocatorClass
{
  /** */
  GstGLMemoryAllocatorClass parentClass;

  /** */
  void*[4] Padding;
}

alias extern(C) void function(GstEGLImage* image, void* data) GstEGLImageDestroyNotify;

