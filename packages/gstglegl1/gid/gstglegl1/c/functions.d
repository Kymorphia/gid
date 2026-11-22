/// C functions for gstglegl1 library
module gid.gstglegl1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstglegl1.c.types;
static import gid.gstglegl1.c._gidlib_GstGLEGL;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstgl1.c.types;
public import gid.gstvideo1.c.types;

private immutable LIBS = ["gstgl-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gstglegl1.c._gidlib_GstGLEGL.gidLibLinked;

// EGLImage
private alias c_gst_egl_image_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_egl_image_get_typeFn c_gst_egl_image_get_type; ///
private alias c_gst_egl_image_new_wrappedFn = extern(C) GstEGLImage* function(GstGLContext* context, void* image, GstGLFormat format, void* userData, GstEGLImageDestroyNotify userDataDestroy) nothrow;
__gshared c_gst_egl_image_new_wrappedFn c_gst_egl_image_new_wrapped; ///
private alias c_gst_egl_image_export_dmabufFn = extern(C) gboolean function(GstEGLImage* image, int* fd, int* stride, size_t* offset) nothrow;
__gshared c_gst_egl_image_export_dmabufFn c_gst_egl_image_export_dmabuf; ///
private alias c_gst_egl_image_get_imageFn = extern(C) void* function(GstEGLImage* image) nothrow;
__gshared c_gst_egl_image_get_imageFn c_gst_egl_image_get_image; ///
private alias c_gst_egl_image_can_emulateFn = extern(C) gboolean function(GstGLContext* context, GstVideoFormat format) nothrow;
__gshared c_gst_egl_image_can_emulateFn c_gst_egl_image_can_emulate; ///
private alias c_gst_egl_image_from_dmabufFn = extern(C) GstEGLImage* function(GstGLContext* context, int dmabuf, const(GstVideoInfo)* inInfo, int plane, size_t offset) nothrow;
__gshared c_gst_egl_image_from_dmabufFn c_gst_egl_image_from_dmabuf; ///
private alias c_gst_egl_image_from_dmabuf_directFn = extern(C) GstEGLImage* function(GstGLContext* context, int* fd, const(size_t)* offset, const(GstVideoInfo)* inInfo) nothrow;
__gshared c_gst_egl_image_from_dmabuf_directFn c_gst_egl_image_from_dmabuf_direct; ///
private alias c_gst_egl_image_from_dmabuf_direct_targetFn = extern(C) GstEGLImage* function(GstGLContext* context, int* fd, const(size_t)* offset, const(GstVideoInfo)* inInfo, GstGLTextureTarget target) nothrow;
__gshared c_gst_egl_image_from_dmabuf_direct_targetFn c_gst_egl_image_from_dmabuf_direct_target; ///
private alias c_gst_egl_image_from_dmabuf_direct_target_with_dma_drmFn = extern(C) GstEGLImage* function(GstGLContext* context, uint nPlanes, int* fd, const(size_t)* offset, const(GstVideoInfoDmaDrm)* inInfoDma, GstGLTextureTarget target) nothrow;
__gshared c_gst_egl_image_from_dmabuf_direct_target_with_dma_drmFn c_gst_egl_image_from_dmabuf_direct_target_with_dma_drm; ///
private alias c_gst_egl_image_from_textureFn = extern(C) GstEGLImage* function(GstGLContext* context, GstGLMemory* glMem, size_t* attribs) nothrow;
__gshared c_gst_egl_image_from_textureFn c_gst_egl_image_from_texture; ///

// GLDisplayEGL
private alias c_gst_gl_display_egl_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_display_egl_get_typeFn c_gst_gl_display_egl_get_type; ///
private alias c_gst_gl_display_egl_newFn = extern(C) GstGLDisplayEGL* function() nothrow;
__gshared c_gst_gl_display_egl_newFn c_gst_gl_display_egl_new; ///
private alias c_gst_gl_display_egl_new_surfacelessFn = extern(C) GstGLDisplayEGL* function() nothrow;
__gshared c_gst_gl_display_egl_new_surfacelessFn c_gst_gl_display_egl_new_surfaceless; ///
private alias c_gst_gl_display_egl_new_with_egl_displayFn = extern(C) GstGLDisplayEGL* function(void* display) nothrow;
__gshared c_gst_gl_display_egl_new_with_egl_displayFn c_gst_gl_display_egl_new_with_egl_display; ///
private alias c_gst_gl_display_egl_from_gl_displayFn = extern(C) GstGLDisplayEGL* function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_egl_from_gl_displayFn c_gst_gl_display_egl_from_gl_display; ///
private alias c_gst_gl_display_egl_get_from_nativeFn = extern(C) void* function(GstGLDisplayType type, size_t display) nothrow;
__gshared c_gst_gl_display_egl_get_from_nativeFn c_gst_gl_display_egl_get_from_native; ///
private alias c_gst_gl_display_egl_set_foreignFn = extern(C) void function(GstGLDisplayEGL* displayEgl, gboolean foreign) nothrow;
__gshared c_gst_gl_display_egl_set_foreignFn c_gst_gl_display_egl_set_foreign; ///

// GLDisplayEGLDevice
private alias c_gst_gl_display_egl_device_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_display_egl_device_get_typeFn c_gst_gl_display_egl_device_get_type; ///
private alias c_gst_gl_display_egl_device_newFn = extern(C) GstGLDisplayEGLDevice* function(uint deviceIndex) nothrow;
__gshared c_gst_gl_display_egl_device_newFn c_gst_gl_display_egl_device_new; ///
private alias c_gst_gl_display_egl_device_new_with_egl_deviceFn = extern(C) GstGLDisplayEGLDevice* function(void* device) nothrow;
__gshared c_gst_gl_display_egl_device_new_with_egl_deviceFn c_gst_gl_display_egl_device_new_with_egl_device; ///

// GLMemoryEGL
private alias c_gst_gl_memory_egl_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_egl_get_typeFn c_gst_gl_memory_egl_get_type; ///
private alias c_gst_gl_memory_egl_get_displayFn = extern(C) void* function(GstGLMemoryEGL* mem) nothrow;
__gshared c_gst_gl_memory_egl_get_displayFn c_gst_gl_memory_egl_get_display; ///
private alias c_gst_gl_memory_egl_get_imageFn = extern(C) void* function(GstGLMemoryEGL* mem) nothrow;
__gshared c_gst_gl_memory_egl_get_imageFn c_gst_gl_memory_egl_get_image; ///
private alias c_gst_gl_memory_egl_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_memory_egl_init_onceFn c_gst_gl_memory_egl_init_once; ///

// GLMemoryEGLAllocator
private alias c_gst_gl_memory_egl_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_egl_allocator_get_typeFn c_gst_gl_memory_egl_allocator_get_type; ///

// global
private alias c_gst_egl_get_error_stringFn = extern(C) const(char)* function(int err) nothrow;
__gshared c_gst_egl_get_error_stringFn c_gst_egl_get_error_string; ///
private alias c_gst_is_gl_memory_eglFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_memory_eglFn c_gst_is_gl_memory_egl; ///

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
alias gst_egl_image_can_emulate = c_gst_egl_image_can_emulate;

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

/** */
alias gst_gl_display_egl_set_foreign = c_gst_gl_display_egl_set_foreign;

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
  auto libs = gidResolveLibs(LIBS, "gid.gstglegl1", "GstGLEGL");

  // EGLImage
  gidLink(cast(void**)&gst_egl_image_get_type, "gst_egl_image_get_type", libs);
  gidLink(cast(void**)&gst_egl_image_new_wrapped, "gst_egl_image_new_wrapped", libs);
  gidLink(cast(void**)&gst_egl_image_export_dmabuf, "gst_egl_image_export_dmabuf", libs);
  gidLink(cast(void**)&gst_egl_image_get_image, "gst_egl_image_get_image", libs);
  gidLink(cast(void**)&gst_egl_image_can_emulate, "gst_egl_image_can_emulate", libs);
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
  gidLink(cast(void**)&gst_gl_display_egl_set_foreign, "gst_gl_display_egl_set_foreign", libs);

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
