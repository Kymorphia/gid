/// C functions for gstglegl1 library
module gstglegl.c.functions;

public import gid.basictypes;
import gid.loader;
import gstglegl.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstgl.c.types;
public import gstvideo.c.types;

version(Windows)
  private immutable LIBS = ["libgstgl-1.0-0.dll;gstgl-1.0-0.dll;gstgl-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstgl-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstgl-1.0.so.0"];

__gshared extern(C)
{
  // EGLImage
  GType function() c_gst_egl_image_get_type; ///
  GstEGLImage* function(GstGLContext* context, void* image, GstGLFormat format, void* userData, GstEGLImageDestroyNotify userDataDestroy) c_gst_egl_image_new_wrapped; ///
  gboolean function(GstEGLImage* image, int* fd, int* stride, size_t* offset) c_gst_egl_image_export_dmabuf; ///
  void* function(GstEGLImage* image) c_gst_egl_image_get_image; ///
  GstEGLImage* function(GstGLContext* context, int dmabuf, const(GstVideoInfo)* inInfo, int plane, size_t offset) c_gst_egl_image_from_dmabuf; ///
  GstEGLImage* function(GstGLContext* context, int* fd, const(size_t)* offset, const(GstVideoInfo)* inInfo) c_gst_egl_image_from_dmabuf_direct; ///
  GstEGLImage* function(GstGLContext* context, int* fd, const(size_t)* offset, const(GstVideoInfo)* inInfo, GstGLTextureTarget target) c_gst_egl_image_from_dmabuf_direct_target; ///
  GstEGLImage* function(GstGLContext* context, uint nPlanes, int* fd, const(size_t)* offset, const(GstVideoInfoDmaDrm)* inInfoDma, GstGLTextureTarget target) c_gst_egl_image_from_dmabuf_direct_target_with_dma_drm; ///
  GstEGLImage* function(GstGLContext* context, GstGLMemory* glMem, size_t* attribs) c_gst_egl_image_from_texture; ///

  // GLDisplayEGL
  GType function() c_gst_gl_display_egl_get_type; ///
  GstGLDisplayEGL* function() c_gst_gl_display_egl_new; ///
  GstGLDisplayEGL* function() c_gst_gl_display_egl_new_surfaceless; ///
  GstGLDisplayEGL* function(void* display) c_gst_gl_display_egl_new_with_egl_display; ///
  GstGLDisplayEGL* function(GstGLDisplay* display) c_gst_gl_display_egl_from_gl_display; ///
  void* function(GstGLDisplayType type, size_t display) c_gst_gl_display_egl_get_from_native; ///

  // GLDisplayEGLDevice
  GType function() c_gst_gl_display_egl_device_get_type; ///
  GstGLDisplayEGLDevice* function(uint deviceIndex) c_gst_gl_display_egl_device_new; ///
  GstGLDisplayEGLDevice* function(void* device) c_gst_gl_display_egl_device_new_with_egl_device; ///

  // GLMemoryEGL
  GType function() c_gst_gl_memory_egl_get_type; ///
  void* function(GstGLMemoryEGL* mem) c_gst_gl_memory_egl_get_display; ///
  void* function(GstGLMemoryEGL* mem) c_gst_gl_memory_egl_get_image; ///
  void function() c_gst_gl_memory_egl_init_once; ///

  // GLMemoryEGLAllocator
  GType function() c_gst_gl_memory_egl_allocator_get_type; ///

  // global
  const(char)* function(int err) c_gst_egl_get_error_string; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_memory_egl; ///
}

// EGLImage

/** */
alias gst_egl_image_get_type = c_gst_egl_image_get_type;

/** */
alias gst_egl_image_new_wrapped = c_gst_egl_image_new_wrapped;

/** */
alias gst_egl_image_export_dmabuf = c_gst_egl_image_export_dmabuf;

/** */
alias gst_egl_image_get_image = c_gst_egl_image_get_image;

/** */
alias gst_egl_image_from_dmabuf = c_gst_egl_image_from_dmabuf;

/** */
alias gst_egl_image_from_dmabuf_direct = c_gst_egl_image_from_dmabuf_direct;

/** */
alias gst_egl_image_from_dmabuf_direct_target = c_gst_egl_image_from_dmabuf_direct_target;

/** */
alias gst_egl_image_from_dmabuf_direct_target_with_dma_drm = c_gst_egl_image_from_dmabuf_direct_target_with_dma_drm;

/** */
alias gst_egl_image_from_texture = c_gst_egl_image_from_texture;

// GLDisplayEGL

/** */
alias gst_gl_display_egl_get_type = c_gst_gl_display_egl_get_type;

/** */
alias gst_gl_display_egl_new = c_gst_gl_display_egl_new;

/** */
alias gst_gl_display_egl_new_surfaceless = c_gst_gl_display_egl_new_surfaceless;

/** */
alias gst_gl_display_egl_new_with_egl_display = c_gst_gl_display_egl_new_with_egl_display;

/** */
alias gst_gl_display_egl_from_gl_display = c_gst_gl_display_egl_from_gl_display;

/** */
alias gst_gl_display_egl_get_from_native = c_gst_gl_display_egl_get_from_native;

// GLDisplayEGLDevice

/** */
alias gst_gl_display_egl_device_get_type = c_gst_gl_display_egl_device_get_type;

/** */
alias gst_gl_display_egl_device_new = c_gst_gl_display_egl_device_new;

/** */
alias gst_gl_display_egl_device_new_with_egl_device = c_gst_gl_display_egl_device_new_with_egl_device;

// GLMemoryEGL

/** */
alias gst_gl_memory_egl_get_type = c_gst_gl_memory_egl_get_type;

/** */
alias gst_gl_memory_egl_get_display = c_gst_gl_memory_egl_get_display;

/** */
alias gst_gl_memory_egl_get_image = c_gst_gl_memory_egl_get_image;

/** */
alias gst_gl_memory_egl_init_once = c_gst_gl_memory_egl_init_once;

// GLMemoryEGLAllocator

/** */
alias gst_gl_memory_egl_allocator_get_type = c_gst_gl_memory_egl_allocator_get_type;

// global

/** */
alias gst_egl_get_error_string = c_gst_egl_get_error_string;

/** */
alias gst_is_gl_memory_egl = c_gst_is_gl_memory_egl;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // EGLImage
  gidLink(cast(void**)&gst_egl_image_get_type, "gst_egl_image_get_type", libs);
  gidLink(cast(void**)&gst_egl_image_new_wrapped, "gst_egl_image_new_wrapped", libs);
  gidLink(cast(void**)&gst_egl_image_export_dmabuf, "gst_egl_image_export_dmabuf", libs);
  gidLink(cast(void**)&gst_egl_image_get_image, "gst_egl_image_get_image", libs);
  gidLink(cast(void**)&gst_egl_image_from_dmabuf, "gst_egl_image_from_dmabuf", libs);
  gidLink(cast(void**)&gst_egl_image_from_dmabuf_direct, "gst_egl_image_from_dmabuf_direct", libs);
  gidLink(cast(void**)&gst_egl_image_from_dmabuf_direct_target, "gst_egl_image_from_dmabuf_direct_target", libs);
  gidLink(cast(void**)&gst_egl_image_from_dmabuf_direct_target_with_dma_drm, "gst_egl_image_from_dmabuf_direct_target_with_dma_drm", libs);
  gidLink(cast(void**)&gst_egl_image_from_texture, "gst_egl_image_from_texture", libs);

  // GLDisplayEGL
  gidLink(cast(void**)&gst_gl_display_egl_get_type, "gst_gl_display_egl_get_type", libs);
  gidLink(cast(void**)&gst_gl_display_egl_new, "gst_gl_display_egl_new", libs);
  gidLink(cast(void**)&gst_gl_display_egl_new_surfaceless, "gst_gl_display_egl_new_surfaceless", libs);
  gidLink(cast(void**)&gst_gl_display_egl_new_with_egl_display, "gst_gl_display_egl_new_with_egl_display", libs);
  gidLink(cast(void**)&gst_gl_display_egl_from_gl_display, "gst_gl_display_egl_from_gl_display", libs);
  gidLink(cast(void**)&gst_gl_display_egl_get_from_native, "gst_gl_display_egl_get_from_native", libs);

  // GLDisplayEGLDevice
  gidLink(cast(void**)&gst_gl_display_egl_device_get_type, "gst_gl_display_egl_device_get_type", libs);
  gidLink(cast(void**)&gst_gl_display_egl_device_new, "gst_gl_display_egl_device_new", libs);
  gidLink(cast(void**)&gst_gl_display_egl_device_new_with_egl_device, "gst_gl_display_egl_device_new_with_egl_device", libs);

  // GLMemoryEGL
  gidLink(cast(void**)&gst_gl_memory_egl_get_type, "gst_gl_memory_egl_get_type", libs);
  gidLink(cast(void**)&gst_gl_memory_egl_get_display, "gst_gl_memory_egl_get_display", libs);
  gidLink(cast(void**)&gst_gl_memory_egl_get_image, "gst_gl_memory_egl_get_image", libs);
  gidLink(cast(void**)&gst_gl_memory_egl_init_once, "gst_gl_memory_egl_init_once", libs);

  // GLMemoryEGLAllocator
  gidLink(cast(void**)&gst_gl_memory_egl_allocator_get_type, "gst_gl_memory_egl_allocator_get_type", libs);

  // global
  gidLink(cast(void**)&gst_egl_get_error_string, "gst_egl_get_error_string", libs);
  gidLink(cast(void**)&gst_is_gl_memory_egl, "gst_is_gl_memory_egl", libs);
}
