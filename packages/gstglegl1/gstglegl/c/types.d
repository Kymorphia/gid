/// C types for gstglegl1 library
module gstglegl.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;
public import gstgl.c.types;
public import gstvideo.c.types;

/**
    #GstEGLImage represents and holds an `EGLImage` handle.
    
    A #GstEGLImage can be created from a dmabuf with [gstglegl.eglimage.EGLImage.fromDmabuf],
    or [gstglegl.eglimage.EGLImage.fromDmabufDirect], or #GstGLMemoryEGL provides a
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
    #GstGLMemoryEGL is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
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

