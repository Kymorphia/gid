/// C functions for gstgl1 library
module gstgl.c.functions;

public import gid.basictypes;
import gid.loader;
import gstgl.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstvideo.c.types;

version(Windows)
  private immutable LIBS = ["libgstgl-1.0-0.dll;gstgl-1.0-0.dll;gstgl-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstgl-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstgl-1.0.so.0"];

__gshared extern(C)
{
  // GLAllocationParams
  GType function() c_gst_gl_allocation_params_get_type; ///
  GstGLAllocationParams* function(GstGLAllocationParams* src) c_gst_gl_allocation_params_copy; ///
  void function(GstGLAllocationParams* src, GstGLAllocationParams* dest) c_gst_gl_allocation_params_copy_data; ///
  void function(GstGLAllocationParams* params) c_gst_gl_allocation_params_free; ///
  void function(GstGLAllocationParams* params) c_gst_gl_allocation_params_free_data; ///
  gboolean function(GstGLAllocationParams* params, size_t structSize, uint allocFlags, GstGLAllocationParamsCopyFunc copy, GstGLAllocationParamsFreeFunc free, GstGLContext* context, size_t allocSize, const(GstAllocationParams)* allocParams, void* wrappedData, void* glHandle, void* userData, GDestroyNotify notify) c_gst_gl_allocation_params_init; ///

  // GLAsyncDebug
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_free; ///
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_freeze; ///
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_init; ///
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_output_log_msg; ///
  void function(GstGLAsyncDebug* ad, GstDebugCategory* cat, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format,  ...) c_gst_gl_async_debug_store_log_msg; ///
  void function(GstGLAsyncDebug* ad, GstDebugCategory* cat, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format, void* varargs) c_gst_gl_async_debug_store_log_msg_valist; ///
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_thaw; ///
  void function(GstGLAsyncDebug* ad) c_gst_gl_async_debug_unset; ///
  GstGLAsyncDebug* function() c_gst_gl_async_debug_new; ///

  // GLBaseFilter
  GType function() c_gst_gl_base_filter_get_type; ///
  gboolean function(GstGLBaseFilter* filter) c_gst_gl_base_filter_find_gl_context; ///
  GstGLContext* function(GstGLBaseFilter* filter) c_gst_gl_base_filter_get_gl_context; ///

  // GLBaseMemory
  GType function() c_gst_gl_base_memory_get_type; ///
  gboolean function(GstGLBaseMemory* glMem) c_gst_gl_base_memory_alloc_data; ///
  void function(GstGLBaseMemory* mem, GstAllocator* allocator, GstMemory* parent, GstGLContext* context, const(GstAllocationParams)* params, size_t size, void* userData, GDestroyNotify notify) c_gst_gl_base_memory_init; ///
  gboolean function(GstGLBaseMemory* src, GstGLBaseMemory* dest, ptrdiff_t offset, ptrdiff_t size) c_gst_gl_base_memory_memcpy; ///
  GstGLBaseMemory* function(GstGLBaseMemoryAllocator* allocator, GstGLAllocationParams* params) c_gst_gl_base_memory_alloc; ///
  void function() c_gst_gl_base_memory_init_once; ///

  // GLBaseMemoryAllocator
  GType function() c_gst_gl_base_memory_allocator_get_type; ///

  // GLBaseMixer
  GType function() c_gst_gl_base_mixer_get_type; ///
  GstGLContext* function(GstGLBaseMixer* mix) c_gst_gl_base_mixer_get_gl_context; ///

  // GLBaseMixerPad
  GType function() c_gst_gl_base_mixer_pad_get_type; ///

  // GLBaseSrc
  GType function() c_gst_gl_base_src_get_type; ///

  // GLBuffer
  GType function() c_gst_gl_buffer_get_type; ///
  void function() c_gst_gl_buffer_init_once; ///

  // GLBufferAllocationParams
  GType function() c_gst_gl_buffer_allocation_params_get_type; ///
  GstGLBufferAllocationParams* function(GstGLContext* context, size_t allocSize, const(GstAllocationParams)* allocParams, uint glTarget, uint glUsage) c_gst_gl_buffer_allocation_params_new; ///

  // GLBufferAllocator
  GType function() c_gst_gl_buffer_allocator_get_type; ///

  // GLBufferPool
  GType function() c_gst_gl_buffer_pool_get_type; ///
  GstBufferPool* function(GstGLContext* context) c_gst_gl_buffer_pool_new; ///
  GstGLAllocationParams* function(GstGLBufferPool* pool) c_gst_gl_buffer_pool_get_gl_allocation_params; ///

  // GLColorConvert
  GType function() c_gst_gl_color_convert_get_type; ///
  GstGLColorConvert* function(GstGLContext* context) c_gst_gl_color_convert_new; ///
  GstCaps* function(GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* other) c_gst_gl_color_convert_fixate_caps; ///
  char* function(GstGLContext* context) c_gst_gl_color_convert_swizzle_shader_string; ///
  GstCaps* function(GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* filter) c_gst_gl_color_convert_transform_caps; ///
  char* function(GstGLContext* context) c_gst_gl_color_convert_yuv_to_rgb_shader_string; ///
  gboolean function(GstGLColorConvert* convert, GstQuery* query) c_gst_gl_color_convert_decide_allocation; ///
  GstBuffer* function(GstGLColorConvert* convert, GstBuffer* inbuf) c_gst_gl_color_convert_perform; ///
  gboolean function(GstGLColorConvert* convert, GstCaps* inCaps, GstCaps* outCaps) c_gst_gl_color_convert_set_caps; ///

  // GLContext
  GType function() c_gst_gl_context_get_type; ///
  GstGLContext* function(GstGLDisplay* display) c_gst_gl_context_new; ///
  GstGLContext* function(GstGLDisplay* display, size_t handle, GstGLPlatform contextType, GstGLAPI availableApis) c_gst_gl_context_new_wrapped; ///
  void* function(GstGLAPI glApi, const(char)* name) c_gst_gl_context_default_get_proc_address; ///
  GstGLContext* function() c_gst_gl_context_get_current; ///
  GstGLAPI function(GstGLPlatform platform, uint* major, uint* minor) c_gst_gl_context_get_current_gl_api; ///
  size_t function(GstGLPlatform contextType) c_gst_gl_context_get_current_gl_context; ///
  void* function(GstGLPlatform contextType, GstGLAPI glApi, const(char)* name) c_gst_gl_context_get_proc_address_with_platform; ///
  gboolean function(GstGLContext* context, gboolean activate) c_gst_gl_context_activate; ///
  gboolean function(GstGLContext* context, GstGLContext* otherContext) c_gst_gl_context_can_share; ///
  gboolean function(GstGLContext* context, const(char)* feature) c_gst_gl_context_check_feature; ///
  gboolean function(GstGLContext* context, uint fboTarget) c_gst_gl_context_check_framebuffer_status; ///
  gboolean function(GstGLContext* context, GstGLAPI api, int maj, int min) c_gst_gl_context_check_gl_version; ///
  void function(GstGLContext* context) c_gst_gl_context_clear_framebuffer; ///
  void function(GstGLContext* context) c_gst_gl_context_clear_shader; ///
  gboolean function(GstGLContext* context, GstGLContext* otherContext, GError** _err) c_gst_gl_context_create; ///
  void function(GstGLContext* context) c_gst_gl_context_destroy; ///
  gboolean function(GstGLContext* context, GError** _err) c_gst_gl_context_fill_info; ///
  GstStructure* function(GstGLContext* context) c_gst_gl_context_get_config; ///
  GstGLDisplay* function(GstGLContext* context) c_gst_gl_context_get_display; ///
  GstGLAPI function(GstGLContext* context) c_gst_gl_context_get_gl_api; ///
  size_t function(GstGLContext* context) c_gst_gl_context_get_gl_context; ///
  GstGLPlatform function(GstGLContext* context) c_gst_gl_context_get_gl_platform; ///
  void function(GstGLContext* context, int* major, int* minor) c_gst_gl_context_get_gl_platform_version; ///
  void function(GstGLContext* context, int* maj, int* min) c_gst_gl_context_get_gl_version; ///
  void* function(GstGLContext* context, const(char)* name) c_gst_gl_context_get_proc_address; ///
  GThread* function(GstGLContext* context) c_gst_gl_context_get_thread; ///
  GstGLWindow* function(GstGLContext* context) c_gst_gl_context_get_window; ///
  gboolean function(GstGLContext* context) c_gst_gl_context_is_shared; ///
  gboolean function(GstGLContext* context, GstStructure* glConfig) c_gst_gl_context_request_config; ///
  void function(GstGLContext* context, GstGLContext* share) c_gst_gl_context_set_shared_with; ///
  gboolean function(GstGLContext* context, GstGLWindow* window) c_gst_gl_context_set_window; ///
  gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_context_supports_glsl_profile_version; ///
  gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_context_supports_precision; ///
  gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_context_supports_precision_highp; ///
  void function(GstGLContext* context) c_gst_gl_context_swap_buffers; ///
  void function(GstGLContext* context, GstGLContextThreadFunc func, void* data) c_gst_gl_context_thread_add; ///

  // GLDisplay
  GType function() c_gst_gl_display_get_type; ///
  GstGLDisplay* function() c_gst_gl_display_new; ///
  GstGLDisplay* function(GstGLDisplayType type) c_gst_gl_display_new_with_type; ///
  gboolean function(GstGLDisplay* display, GstGLContext* context) c_gst_gl_display_add_context; ///
  gboolean function(GstGLDisplay* display, GstGLContext* otherContext, GstGLContext** pContext, GError** _err) c_gst_gl_display_create_context; ///
  GstGLWindow* function(GstGLDisplay* display) c_gst_gl_display_create_window; ///
  gboolean function(GstGLDisplay* display, GstGLContext* otherContext, GstGLContext** context, GError** _err) c_gst_gl_display_ensure_context; ///
  void function(GstGLDisplay* display, GstGLAPI glApi) c_gst_gl_display_filter_gl_api; ///
  GstGLWindow* function(GstGLDisplay* display, void* data, GCompareFunc compareFunc) c_gst_gl_display_find_window; ///
  GstGLAPI function(GstGLDisplay* display) c_gst_gl_display_get_gl_api; ///
  GstGLAPI function(GstGLDisplay* display) c_gst_gl_display_get_gl_api_unlocked; ///
  GstGLContext* function(GstGLDisplay* display, GThread* thread) c_gst_gl_display_get_gl_context_for_thread; ///
  size_t function(GstGLDisplay* display) c_gst_gl_display_get_handle; ///
  GstGLDisplayType function(GstGLDisplay* display) c_gst_gl_display_get_handle_type; ///
  void function(GstGLDisplay* display, GstGLContext* context) c_gst_gl_display_remove_context; ///
  gboolean function(GstGLDisplay* display, GstGLWindow* window) c_gst_gl_display_remove_window; ///
  GstGLWindow* function(GstGLDisplay* display, void* data, GCompareFunc compareFunc) c_gst_gl_display_retrieve_window; ///

  // GLFilter
  GType function() c_gst_gl_filter_get_type; ///
  void function(GstGLFilterClass* klass) c_gst_gl_filter_add_rgba_pad_templates; ///
  void function(GstGLFilter* filter) c_gst_gl_filter_draw_fullscreen_quad; ///
  gboolean function(GstGLFilter* filter, GstBuffer* input, GstBuffer* output) c_gst_gl_filter_filter_texture; ///
  gboolean function(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output, GstGLFilterRenderFunc func, void* data) c_gst_gl_filter_render_to_target; ///
  void function(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output, GstGLShader* shader) c_gst_gl_filter_render_to_target_with_shader; ///

  // GLFramebuffer
  GType function() c_gst_gl_framebuffer_get_type; ///
  GstGLFramebuffer* function(GstGLContext* context) c_gst_gl_framebuffer_new; ///
  GstGLFramebuffer* function(GstGLContext* context, uint width, uint height) c_gst_gl_framebuffer_new_with_default_depth; ///
  void function(GstGLFramebuffer* fb, uint attachmentPoint, GstGLBaseMemory* mem) c_gst_gl_framebuffer_attach; ///
  void function(GstGLFramebuffer* fb) c_gst_gl_framebuffer_bind; ///
  gboolean function(GstGLFramebuffer* fb, GstGLMemory* mem, GstGLFramebufferFunc func, void* userData) c_gst_gl_framebuffer_draw_to_texture; ///
  void function(GstGLFramebuffer* fb, uint* width, uint* height) c_gst_gl_framebuffer_get_effective_dimensions; ///
  uint function(GstGLFramebuffer* fb) c_gst_gl_framebuffer_get_id; ///

  // GLMemory
  GType function() c_gst_gl_memory_get_type; ///
  gboolean function(GstGLMemory* glMem, uint texId, GstGLTextureTarget target, GstGLFormat texFormat, int width, int height) c_gst_gl_memory_copy_into; ///
  gboolean function(GstGLMemory* src, uint texId, GstGLTextureTarget outTarget, GstGLFormat outTexFormat, int outWidth, int outHeight) c_gst_gl_memory_copy_teximage; ///
  GstGLFormat function(GstGLMemory* glMem) c_gst_gl_memory_get_texture_format; ///
  int function(GstGLMemory* glMem) c_gst_gl_memory_get_texture_height; ///
  uint function(GstGLMemory* glMem) c_gst_gl_memory_get_texture_id; ///
  GstGLTextureTarget function(GstGLMemory* glMem) c_gst_gl_memory_get_texture_target; ///
  int function(GstGLMemory* glMem) c_gst_gl_memory_get_texture_width; ///
  void function(GstGLMemory* mem, GstAllocator* allocator, GstMemory* parent, GstGLContext* context, GstGLTextureTarget target, GstGLFormat texFormat, const(GstAllocationParams)* params, const(GstVideoInfo)* info, uint plane, const(GstVideoAlignment)* valign, void* userData, GDestroyNotify notify) c_gst_gl_memory_init; ///
  gboolean function(GstGLMemory* glMem, void* writePointer) c_gst_gl_memory_read_pixels; ///
  void function(GstGLMemory* glMem, void* readPointer) c_gst_gl_memory_texsubimage; ///
  void function() c_gst_gl_memory_init_once; ///
  gboolean function(GstGLMemoryAllocator* allocator, GstBuffer* buffer, GstGLVideoAllocationParams* params, GstGLFormat* texFormats, void** wrappedData, size_t nWrappedPointers) c_gst_gl_memory_setup_buffer; ///

  // GLMemoryAllocator
  GType function() c_gst_gl_memory_allocator_get_type; ///
  GstGLMemoryAllocator* function(GstGLContext* context) c_gst_gl_memory_allocator_get_default; ///

  // GLMemoryPBO
  GType function() c_gst_gl_memory_pbo_get_type; ///
  gboolean function(GstGLMemoryPBO* glMem, uint texId, GstGLTextureTarget target, GstGLFormat texFormat, int width, int height, int stride, gboolean respecify) c_gst_gl_memory_pbo_copy_into_texture; ///
  void function(GstGLMemoryPBO* glMem) c_gst_gl_memory_pbo_download_transfer; ///
  void function(GstGLMemoryPBO* glMem) c_gst_gl_memory_pbo_upload_transfer; ///
  void function() c_gst_gl_memory_pbo_init_once; ///

  // GLMemoryPBOAllocator
  GType function() c_gst_gl_memory_pbo_allocator_get_type; ///

  // GLMixer
  GType function() c_gst_gl_mixer_get_type; ///
  GstGLFramebuffer* function(GstGLMixer* mix) c_gst_gl_mixer_get_framebuffer; ///
  gboolean function(GstGLMixer* mix, GstBuffer* outbuf) c_gst_gl_mixer_process_textures; ///

  // GLMixerClass
  void function(GstGLMixerClass* klass) c_gst_gl_mixer_class_add_rgba_pad_templates; ///

  // GLMixerPad
  GType function() c_gst_gl_mixer_pad_get_type; ///

  // GLOverlayCompositor
  GType function() c_gst_gl_overlay_compositor_get_type; ///
  GstGLOverlayCompositor* function(GstGLContext* context) c_gst_gl_overlay_compositor_new; ///
  GstCaps* function(GstCaps* caps) c_gst_gl_overlay_compositor_add_caps; ///
  void function(GstGLOverlayCompositor* compositor) c_gst_gl_overlay_compositor_draw_overlays; ///
  void function(GstGLOverlayCompositor* compositor) c_gst_gl_overlay_compositor_free_overlays; ///
  void function(GstGLOverlayCompositor* compositor, GstBuffer* buf) c_gst_gl_overlay_compositor_upload_overlays; ///

  // GLQuery
  void function(GstGLQuery* query) c_gst_gl_query_counter; ///
  void function(GstGLQuery* query) c_gst_gl_query_end; ///
  void function(GstGLQuery* query) c_gst_gl_query_free; ///
  void function(GstGLQuery* query, GstGLContext* context, GstGLQueryType queryType) c_gst_gl_query_init; ///
  ulong function(GstGLQuery* query) c_gst_gl_query_result; ///
  void function(GstGLQuery* query) c_gst_gl_query_start; ///
  void function(GstGLQuery* query) c_gst_gl_query_unset; ///
  gboolean function(GstElement* element, GstPadDirection direction, GstGLContext** contextPtr) c_gst_gl_query_local_gl_context; ///
  GstGLQuery* function(GstGLContext* context, GstGLQueryType queryType) c_gst_gl_query_new; ///

  // GLRenderbuffer
  GType function() c_gst_gl_renderbuffer_get_type; ///
  GstGLFormat function(GstGLRenderbuffer* glMem) c_gst_gl_renderbuffer_get_format; ///
  int function(GstGLRenderbuffer* glMem) c_gst_gl_renderbuffer_get_height; ///
  uint function(GstGLRenderbuffer* glMem) c_gst_gl_renderbuffer_get_id; ///
  int function(GstGLRenderbuffer* glMem) c_gst_gl_renderbuffer_get_width; ///
  void function() c_gst_gl_renderbuffer_init_once; ///

  // GLRenderbufferAllocationParams
  GType function() c_gst_gl_renderbuffer_allocation_params_get_type; ///
  GstGLRenderbufferAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, GstGLFormat renderbufferFormat, uint width, uint height) c_gst_gl_renderbuffer_allocation_params_new; ///
  GstGLRenderbufferAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, GstGLFormat renderbufferFormat, uint width, uint height, void* glHandle, void* userData, GDestroyNotify notify) c_gst_gl_renderbuffer_allocation_params_new_wrapped; ///

  // GLRenderbufferAllocator
  GType function() c_gst_gl_renderbuffer_allocator_get_type; ///

  // GLSLStage
  GType function() c_gst_glsl_stage_get_type; ///
  GstGLSLStage* function(GstGLContext* context, uint type) c_gst_glsl_stage_new; ///
  GstGLSLStage* function(GstGLContext* context) c_gst_glsl_stage_new_default_fragment; ///
  GstGLSLStage* function(GstGLContext* context) c_gst_glsl_stage_new_default_vertex; ///
  GstGLSLStage* function(GstGLContext* context, uint type, GstGLSLVersion version_, GstGLSLProfile profile, const(char)* str) c_gst_glsl_stage_new_with_string; ///
  GstGLSLStage* function(GstGLContext* context, uint type, GstGLSLVersion version_, GstGLSLProfile profile, int nStrings, const(char*)* str) c_gst_glsl_stage_new_with_strings; ///
  gboolean function(GstGLSLStage* stage, GError** _err) c_gst_glsl_stage_compile; ///
  uint function(GstGLSLStage* stage) c_gst_glsl_stage_get_handle; ///
  GstGLSLProfile function(GstGLSLStage* stage) c_gst_glsl_stage_get_profile; ///
  uint function(GstGLSLStage* stage) c_gst_glsl_stage_get_shader_type; ///
  GstGLSLVersion function(GstGLSLStage* stage) c_gst_glsl_stage_get_version; ///
  gboolean function(GstGLSLStage* stage, GstGLSLVersion version_, GstGLSLProfile profile, int nStrings, const(char*)* str) c_gst_glsl_stage_set_strings; ///

  // GLShader
  GType function() c_gst_gl_shader_get_type; ///
  GstGLShader* function(GstGLContext* context) c_gst_gl_shader_new; ///
  GstGLShader* function(GstGLContext* context, GError** _err) c_gst_gl_shader_new_default; ///
  GstGLShader* function(GstGLContext* context, GError** error,  ...) c_gst_gl_shader_new_link_with_stages; ///
  GstGLShader* function(GstGLContext* context, GError** error,  ...) c_gst_gl_shader_new_with_stages; ///
  char* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_shader_string_fragment_external_oes_get_default; ///
  char* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_shader_string_fragment_get_default; ///
  const(char)* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) c_gst_gl_shader_string_get_highest_precision; ///
  gboolean function(GstGLShader* shader, GstGLSLStage* stage) c_gst_gl_shader_attach; ///
  gboolean function(GstGLShader* shader, GstGLSLStage* stage) c_gst_gl_shader_attach_unlocked; ///
  void function(GstGLShader* shader, uint index, const(char)* name) c_gst_gl_shader_bind_attribute_location; ///
  void function(GstGLShader* shader, uint index, const(char)* name) c_gst_gl_shader_bind_frag_data_location; ///
  gboolean function(GstGLShader* shader, GstGLSLStage* stage, GError** _err) c_gst_gl_shader_compile_attach_stage; ///
  void function(GstGLShader* shader, GstGLSLStage* stage) c_gst_gl_shader_detach; ///
  void function(GstGLShader* shader, GstGLSLStage* stage) c_gst_gl_shader_detach_unlocked; ///
  int function(GstGLShader* shader, const(char)* name) c_gst_gl_shader_get_attribute_location; ///
  int function(GstGLShader* shader) c_gst_gl_shader_get_program_handle; ///
  gboolean function(GstGLShader* shader) c_gst_gl_shader_is_linked; ///
  gboolean function(GstGLShader* shader, GError** _err) c_gst_gl_shader_link; ///
  void function(GstGLShader* shader) c_gst_gl_shader_release; ///
  void function(GstGLShader* shader) c_gst_gl_shader_release_unlocked; ///
  void function(GstGLShader* shader, const(char)* name, float value) c_gst_gl_shader_set_uniform_1f; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) c_gst_gl_shader_set_uniform_1fv; ///
  void function(GstGLShader* shader, const(char)* name, int value) c_gst_gl_shader_set_uniform_1i; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) c_gst_gl_shader_set_uniform_1iv; ///
  void function(GstGLShader* shader, const(char)* name, float v0, float v1) c_gst_gl_shader_set_uniform_2f; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) c_gst_gl_shader_set_uniform_2fv; ///
  void function(GstGLShader* shader, const(char)* name, int v0, int v1) c_gst_gl_shader_set_uniform_2i; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) c_gst_gl_shader_set_uniform_2iv; ///
  void function(GstGLShader* shader, const(char)* name, float v0, float v1, float v2) c_gst_gl_shader_set_uniform_3f; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) c_gst_gl_shader_set_uniform_3fv; ///
  void function(GstGLShader* shader, const(char)* name, int v0, int v1, int v2) c_gst_gl_shader_set_uniform_3i; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) c_gst_gl_shader_set_uniform_3iv; ///
  void function(GstGLShader* shader, const(char)* name, float v0, float v1, float v2, float v3) c_gst_gl_shader_set_uniform_4f; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) c_gst_gl_shader_set_uniform_4fv; ///
  void function(GstGLShader* shader, const(char)* name, int v0, int v1, int v2, int v3) c_gst_gl_shader_set_uniform_4i; ///
  void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) c_gst_gl_shader_set_uniform_4iv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_2fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_2x3fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_2x4fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_3fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_3x2fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_3x4fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_4fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_4x2fv; ///
  void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) c_gst_gl_shader_set_uniform_matrix_4x3fv; ///
  void function(GstGLShader* shader) c_gst_gl_shader_use; ///

  // GLSyncMeta
  void function(GstGLSyncMeta* syncMeta, GstGLContext* context) c_gst_gl_sync_meta_set_sync_point; ///
  void function(GstGLSyncMeta* syncMeta, GstGLContext* context) c_gst_gl_sync_meta_wait; ///
  void function(GstGLSyncMeta* syncMeta, GstGLContext* context) c_gst_gl_sync_meta_wait_cpu; ///
  const(GstMetaInfo)* function() c_gst_gl_sync_meta_get_info; ///

  // GLUpload
  GType function() c_gst_gl_upload_get_type; ///
  GstGLUpload* function(GstGLContext* context) c_gst_gl_upload_new; ///
  GstCaps* function() c_gst_gl_upload_get_input_template_caps; ///
  GstCaps* function(GstGLUpload* upload, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) c_gst_gl_upload_fixate_caps; ///
  void function(GstGLUpload* upload, GstCaps** inCaps, GstCaps** outCaps) c_gst_gl_upload_get_caps; ///
  GstGLUploadReturn function(GstGLUpload* upload, GstBuffer* buffer, GstBuffer** outbufPtr) c_gst_gl_upload_perform_with_buffer; ///
  void function(GstGLUpload* upload, GstQuery* decideQuery, GstQuery* query) c_gst_gl_upload_propose_allocation; ///
  gboolean function(GstGLUpload* upload, GstCaps* inCaps, GstCaps* outCaps) c_gst_gl_upload_set_caps; ///
  void function(GstGLUpload* upload, GstGLContext* context) c_gst_gl_upload_set_context; ///
  GstCaps* function(GstGLUpload* upload, GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* filter) c_gst_gl_upload_transform_caps; ///

  // GLVideoAllocationParams
  GType function() c_gst_gl_video_allocation_params_get_type; ///
  GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat) c_gst_gl_video_allocation_params_new; ///
  GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* wrappedData, void* userData, GDestroyNotify notify) c_gst_gl_video_allocation_params_new_wrapped_data; ///
  GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* glHandle, void* userData, GDestroyNotify notify) c_gst_gl_video_allocation_params_new_wrapped_gl_handle; ///
  GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, uint texId, void* userData, GDestroyNotify notify) c_gst_gl_video_allocation_params_new_wrapped_texture; ///
  void function(GstGLVideoAllocationParams* srcVid, GstGLVideoAllocationParams* destVid) c_gst_gl_video_allocation_params_copy_data; ///
  void function(GstGLVideoAllocationParams* params) c_gst_gl_video_allocation_params_free_data; ///
  gboolean function(GstGLVideoAllocationParams* params, size_t structSize, uint allocFlags, GstGLAllocationParamsCopyFunc copy, GstGLAllocationParamsFreeFunc free, GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* wrappedData, void* glHandle, void* userData, GDestroyNotify notify) c_gst_gl_video_allocation_params_init_full; ///

  // GLViewConvert
  GType function() c_gst_gl_view_convert_get_type; ///
  GstGLViewConvert* function() c_gst_gl_view_convert_new; ///
  GstCaps* function(GstGLViewConvert* viewconvert, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) c_gst_gl_view_convert_fixate_caps; ///
  GstFlowReturn function(GstGLViewConvert* viewconvert, GstBuffer** outbufPtr) c_gst_gl_view_convert_get_output; ///
  GstBuffer* function(GstGLViewConvert* viewconvert, GstBuffer* inbuf) c_gst_gl_view_convert_perform; ///
  void function(GstGLViewConvert* viewconvert) c_gst_gl_view_convert_reset; ///
  gboolean function(GstGLViewConvert* viewconvert, GstCaps* inCaps, GstCaps* outCaps) c_gst_gl_view_convert_set_caps; ///
  void function(GstGLViewConvert* viewconvert, GstGLContext* context) c_gst_gl_view_convert_set_context; ///
  GstFlowReturn function(GstGLViewConvert* viewconvert, gboolean isDiscont, GstBuffer* input) c_gst_gl_view_convert_submit_input_buffer; ///
  GstCaps* function(GstGLViewConvert* viewconvert, GstPadDirection direction, GstCaps* caps, GstCaps* filter) c_gst_gl_view_convert_transform_caps; ///

  // GLWindow
  GType function() c_gst_gl_window_get_type; ///
  GstGLWindow* function(GstGLDisplay* display) c_gst_gl_window_new; ///
  gboolean function(GstGLWindow* window) c_gst_gl_window_controls_viewport; ///
  void function(GstGLWindow* window) c_gst_gl_window_draw; ///
  GstGLContext* function(GstGLWindow* window) c_gst_gl_window_get_context; ///
  size_t function(GstGLWindow* window) c_gst_gl_window_get_display; ///
  void function(GstGLWindow* window, uint* width, uint* height) c_gst_gl_window_get_surface_dimensions; ///
  size_t function(GstGLWindow* window) c_gst_gl_window_get_window_handle; ///
  void function(GstGLWindow* window, gboolean handleEvents) c_gst_gl_window_handle_events; ///
  gboolean function(GstGLWindow* window) c_gst_gl_window_has_output_surface; ///
  void function(GstGLWindow* window) c_gst_gl_window_queue_resize; ///
  void function(GstGLWindow* window) c_gst_gl_window_quit; ///
  void function(GstGLWindow* window, uint width, uint height) c_gst_gl_window_resize; ///
  void function(GstGLWindow* window) c_gst_gl_window_run; ///
  void function(GstGLWindow* window, const(char)* eventType, const(char)* keyStr) c_gst_gl_window_send_key_event; ///
  void function(GstGLWindow* window, GstGLWindowCB callback, void* data) c_gst_gl_window_send_message; ///
  void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroy) c_gst_gl_window_send_message_async; ///
  void function(GstGLWindow* window, const(char)* eventType, int button, double posx, double posy) c_gst_gl_window_send_mouse_event; ///
  void function(GstGLWindow* window, double posx, double posy, double deltaX, double deltaY) c_gst_gl_window_send_scroll_event; ///
  void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroyNotify) c_gst_gl_window_set_close_callback; ///
  void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroyNotify) c_gst_gl_window_set_draw_callback; ///
  void function(GstGLWindow* window, int width, int height) c_gst_gl_window_set_preferred_size; ///
  gboolean function(GstGLWindow* window, int x, int y, int width, int height) c_gst_gl_window_set_render_rectangle; ///
  void function(GstGLWindow* window, GstGLWindowResizeCB callback, void* data, GDestroyNotify destroyNotify) c_gst_gl_window_set_resize_callback; ///
  void function(GstGLWindow* window, size_t handle) c_gst_gl_window_set_window_handle; ///
  void function(GstGLWindow* window) c_gst_gl_window_show; ///

  // global
  GstGLSyncMeta* function(GstGLContext* context, GstBuffer* buffer) c_gst_buffer_add_gl_sync_meta; ///
  GstGLSyncMeta* function(GstGLContext* context, GstBuffer* buffer, void* data) c_gst_buffer_add_gl_sync_meta_full; ///
  GstGLAllocationParams* function(GstStructure* config) c_gst_buffer_pool_config_get_gl_allocation_params; ///
  uint function(GstStructure* config) c_gst_buffer_pool_config_get_gl_min_free_queue_size; ///
  void function(GstStructure* config, const(GstGLAllocationParams)* params) c_gst_buffer_pool_config_set_gl_allocation_params; ///
  void function(GstStructure* config, uint queueSize) c_gst_buffer_pool_config_set_gl_min_free_queue_size; ///
  gboolean function(GstContext* context, GstGLDisplay** display) c_gst_context_get_gl_display; ///
  void function(GstContext* context, GstGLDisplay* display) c_gst_context_set_gl_display; ///
  gboolean function(const(char)* name, const(char)* ext) c_gst_gl_check_extension; ///
  void function(GstElement* element, GstGLDisplay* display) c_gst_gl_element_propagate_display_context; ///
  gboolean function(GstElement* element, GstGLDisplay** displayPtr, GstGLContext** otherContextPtr) c_gst_gl_ensure_element_data; ///
  void function(GstVideoAffineTransformationMeta* meta, float* matrix) c_gst_gl_get_affine_transformation_meta_as_ndc; ///
  size_t function(const(GstVideoInfo)* info, const(GstVideoAlignment)* align_, uint plane) c_gst_gl_get_plane_data_size; ///
  size_t function(const(GstVideoInfo)* info, const(GstVideoAlignment)* valign, uint plane) c_gst_gl_get_plane_start; ///
  gboolean function(GstElement* element, GstQuery* query, GstGLDisplay* display, GstGLContext* context, GstGLContext* otherContext) c_gst_gl_handle_context_query; ///
  gboolean function(GstElement* element, GstContext* context, GstGLDisplay** display, GstGLContext** otherContext) c_gst_gl_handle_set_context; ///
  void function(GstGLContext* context, const(char)* format,  ...) c_gst_gl_insert_debug_marker; ///
  void function(const(float)* a, const(float)* b, float* result) c_gst_gl_multiply_matrix4; ///
  void function(GstVideoAffineTransformationMeta* meta, const(float)* matrix) c_gst_gl_set_affine_transformation_meta_from_ndc; ///
  uint function(GstGLContext* context, uint format, uint type) c_gst_gl_sized_gl_format_from_gl_format_type; ///
  GType function() c_gst_gl_stereo_downmix_mode_get_type; ///
  void function(int* swizzle, int* inversion) c_gst_gl_swizzle_invert; ///
  GType function() c_gst_gl_sync_meta_api_get_type; ///
  GstGLTextureTarget function(const(GValue)* value) c_gst_gl_value_get_texture_target_mask; ///
  gboolean function(GValue* value, GstGLTextureTarget target) c_gst_gl_value_set_texture_target; ///
  gboolean function(GValue* value, GstGLTextureTarget targetMask) c_gst_gl_value_set_texture_target_from_mask; ///
  GstGLSLVersion function(GstGLAPI glApi, int maj, int min) c_gst_gl_version_to_glsl_version; ///
  gboolean function(GstVideoFormat videoFormat, int* swizzle) c_gst_gl_video_format_swizzle; ///
  gboolean function(const(char)* s, GstGLSLVersion* version_, GstGLSLProfile* profile) c_gst_glsl_string_get_version_profile; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_base_memory; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_buffer; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_memory; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_memory_pbo; ///
  gboolean function(GstMemory* mem) c_gst_is_gl_renderbuffer; ///

  // GLAPI
  GstGLAPI function(const(char)* apiS) c_gst_gl_api_from_string; ///
  char* function(GstGLAPI api) c_gst_gl_api_to_string; ///

  // GLBaseMemoryError
  GQuark function() c_gst_gl_base_memory_error_quark; ///

  // GLConfigCaveat
  const(char)* function(GstGLConfigCaveat caveat) c_gst_gl_config_caveat_to_string; ///

  // GLConfigSurfaceType
  const(char)* function(GstGLConfigSurfaceType surfaceType) c_gst_gl_config_surface_type_to_string; ///

  // GLContextError
  GQuark function() c_gst_gl_context_error_quark; ///

  // GLFormat
  GstGLFormat function(GstGLContext* context, const(GstVideoInfo)* vinfo, uint plane) c_gst_gl_format_from_video_info; ///
  gboolean function(GstGLContext* context, GstGLFormat format) c_gst_gl_format_is_supported; ///
  uint function(GstGLFormat glFormat) c_gst_gl_format_n_components; ///
  void function(GstGLFormat format, GstGLFormat* unsizedFormat, uint* glType) c_gst_gl_format_type_from_sized_gl_format; ///
  uint function(uint format, uint type) c_gst_gl_format_type_n_bytes; ///

  // GLPlatform
  GstGLPlatform function(const(char)* platformS) c_gst_gl_platform_from_string; ///
  char* function(GstGLPlatform platform) c_gst_gl_platform_to_string; ///

  // GLSLError
  GQuark function() c_gst_glsl_error_quark; ///

  // GLSLProfile
  GstGLSLProfile function(const(char)* string_) c_gst_glsl_profile_from_string; ///
  const(char)* function(GstGLSLProfile profile) c_gst_glsl_profile_to_string; ///

  // GLSLVersion
  GstGLSLVersion function(const(char)* string_) c_gst_glsl_version_from_string; ///
  gboolean function(const(char)* string_, GstGLSLVersion* versionRet, GstGLSLProfile* profileRet) c_gst_glsl_version_profile_from_string; ///
  char* function(GstGLSLVersion version_, GstGLSLProfile profile) c_gst_glsl_version_profile_to_string; ///
  const(char)* function(GstGLSLVersion version_) c_gst_glsl_version_to_string; ///

  // GLTextureTarget
  GstGLTextureTarget function(uint target) c_gst_gl_texture_target_from_gl; ///
  GstGLTextureTarget function(const(char)* str) c_gst_gl_texture_target_from_string; ///
  const(char)* function(GstGLTextureTarget target) c_gst_gl_texture_target_to_buffer_pool_option; ///
  uint function(GstGLTextureTarget target) c_gst_gl_texture_target_to_gl; ///
  const(char)* function(GstGLTextureTarget target) c_gst_gl_texture_target_to_string; ///

  // GLWindowError
  GQuark function() c_gst_gl_window_error_quark; ///
}

// GLAllocationParams

/** */
alias gst_gl_allocation_params_get_type = c_gst_gl_allocation_params_get_type;

/** */
alias gst_gl_allocation_params_copy = c_gst_gl_allocation_params_copy;

/** */
alias gst_gl_allocation_params_copy_data = c_gst_gl_allocation_params_copy_data;

/** */
alias gst_gl_allocation_params_free = c_gst_gl_allocation_params_free;

/** */
alias gst_gl_allocation_params_free_data = c_gst_gl_allocation_params_free_data;

/** */
alias gst_gl_allocation_params_init = c_gst_gl_allocation_params_init;

// GLAsyncDebug

/** */
alias gst_gl_async_debug_free = c_gst_gl_async_debug_free;

/** */
alias gst_gl_async_debug_freeze = c_gst_gl_async_debug_freeze;

/** */
alias gst_gl_async_debug_init = c_gst_gl_async_debug_init;

/** */
alias gst_gl_async_debug_output_log_msg = c_gst_gl_async_debug_output_log_msg;

/** */
alias gst_gl_async_debug_store_log_msg = c_gst_gl_async_debug_store_log_msg;

/** */
alias gst_gl_async_debug_store_log_msg_valist = c_gst_gl_async_debug_store_log_msg_valist;

/** */
alias gst_gl_async_debug_thaw = c_gst_gl_async_debug_thaw;

/** */
alias gst_gl_async_debug_unset = c_gst_gl_async_debug_unset;

/** */
alias gst_gl_async_debug_new = c_gst_gl_async_debug_new;

// GLBaseFilter

/** */
alias gst_gl_base_filter_get_type = c_gst_gl_base_filter_get_type;

/** */
alias gst_gl_base_filter_find_gl_context = c_gst_gl_base_filter_find_gl_context;

/** */
alias gst_gl_base_filter_get_gl_context = c_gst_gl_base_filter_get_gl_context;

// GLBaseMemory

/** */
alias gst_gl_base_memory_get_type = c_gst_gl_base_memory_get_type;

/** */
alias gst_gl_base_memory_alloc_data = c_gst_gl_base_memory_alloc_data;

/** */
alias gst_gl_base_memory_init = c_gst_gl_base_memory_init;

/** */
alias gst_gl_base_memory_memcpy = c_gst_gl_base_memory_memcpy;

/** */
alias gst_gl_base_memory_alloc = c_gst_gl_base_memory_alloc;

/** */
alias gst_gl_base_memory_init_once = c_gst_gl_base_memory_init_once;

// GLBaseMemoryAllocator

/** */
alias gst_gl_base_memory_allocator_get_type = c_gst_gl_base_memory_allocator_get_type;

// GLBaseMixer

/** */
alias gst_gl_base_mixer_get_type = c_gst_gl_base_mixer_get_type;

/** */
alias gst_gl_base_mixer_get_gl_context = c_gst_gl_base_mixer_get_gl_context;

// GLBaseMixerPad

/** */
alias gst_gl_base_mixer_pad_get_type = c_gst_gl_base_mixer_pad_get_type;

// GLBaseSrc

/** */
alias gst_gl_base_src_get_type = c_gst_gl_base_src_get_type;

// GLBuffer

/** */
alias gst_gl_buffer_get_type = c_gst_gl_buffer_get_type;

/** */
alias gst_gl_buffer_init_once = c_gst_gl_buffer_init_once;

// GLBufferAllocationParams

/** */
alias gst_gl_buffer_allocation_params_get_type = c_gst_gl_buffer_allocation_params_get_type;

/** */
alias gst_gl_buffer_allocation_params_new = c_gst_gl_buffer_allocation_params_new;

// GLBufferAllocator

/** */
alias gst_gl_buffer_allocator_get_type = c_gst_gl_buffer_allocator_get_type;

// GLBufferPool

/** */
alias gst_gl_buffer_pool_get_type = c_gst_gl_buffer_pool_get_type;

/** */
alias gst_gl_buffer_pool_new = c_gst_gl_buffer_pool_new;

/** */
alias gst_gl_buffer_pool_get_gl_allocation_params = c_gst_gl_buffer_pool_get_gl_allocation_params;

// GLColorConvert

/** */
alias gst_gl_color_convert_get_type = c_gst_gl_color_convert_get_type;

/** */
alias gst_gl_color_convert_new = c_gst_gl_color_convert_new;

/** */
alias gst_gl_color_convert_fixate_caps = c_gst_gl_color_convert_fixate_caps;

/** */
alias gst_gl_color_convert_swizzle_shader_string = c_gst_gl_color_convert_swizzle_shader_string;

/** */
alias gst_gl_color_convert_transform_caps = c_gst_gl_color_convert_transform_caps;

/** */
alias gst_gl_color_convert_yuv_to_rgb_shader_string = c_gst_gl_color_convert_yuv_to_rgb_shader_string;

/** */
alias gst_gl_color_convert_decide_allocation = c_gst_gl_color_convert_decide_allocation;

/** */
alias gst_gl_color_convert_perform = c_gst_gl_color_convert_perform;

/** */
alias gst_gl_color_convert_set_caps = c_gst_gl_color_convert_set_caps;

// GLContext

/** */
alias gst_gl_context_get_type = c_gst_gl_context_get_type;

/** */
alias gst_gl_context_new = c_gst_gl_context_new;

/** */
alias gst_gl_context_new_wrapped = c_gst_gl_context_new_wrapped;

/** */
alias gst_gl_context_default_get_proc_address = c_gst_gl_context_default_get_proc_address;

/** */
alias gst_gl_context_get_current = c_gst_gl_context_get_current;

/** */
alias gst_gl_context_get_current_gl_api = c_gst_gl_context_get_current_gl_api;

/** */
alias gst_gl_context_get_current_gl_context = c_gst_gl_context_get_current_gl_context;

/** */
alias gst_gl_context_get_proc_address_with_platform = c_gst_gl_context_get_proc_address_with_platform;

/** */
alias gst_gl_context_activate = c_gst_gl_context_activate;

/** */
alias gst_gl_context_can_share = c_gst_gl_context_can_share;

/** */
alias gst_gl_context_check_feature = c_gst_gl_context_check_feature;

/** */
alias gst_gl_context_check_framebuffer_status = c_gst_gl_context_check_framebuffer_status;

/** */
alias gst_gl_context_check_gl_version = c_gst_gl_context_check_gl_version;

/** */
alias gst_gl_context_clear_framebuffer = c_gst_gl_context_clear_framebuffer;

/** */
alias gst_gl_context_clear_shader = c_gst_gl_context_clear_shader;

/** */
alias gst_gl_context_create = c_gst_gl_context_create;

/** */
alias gst_gl_context_destroy = c_gst_gl_context_destroy;

/** */
alias gst_gl_context_fill_info = c_gst_gl_context_fill_info;

/** */
alias gst_gl_context_get_config = c_gst_gl_context_get_config;

/** */
alias gst_gl_context_get_display = c_gst_gl_context_get_display;

/** */
alias gst_gl_context_get_gl_api = c_gst_gl_context_get_gl_api;

/** */
alias gst_gl_context_get_gl_context = c_gst_gl_context_get_gl_context;

/** */
alias gst_gl_context_get_gl_platform = c_gst_gl_context_get_gl_platform;

/** */
alias gst_gl_context_get_gl_platform_version = c_gst_gl_context_get_gl_platform_version;

/** */
alias gst_gl_context_get_gl_version = c_gst_gl_context_get_gl_version;

/** */
alias gst_gl_context_get_proc_address = c_gst_gl_context_get_proc_address;

/** */
alias gst_gl_context_get_thread = c_gst_gl_context_get_thread;

/** */
alias gst_gl_context_get_window = c_gst_gl_context_get_window;

/** */
alias gst_gl_context_is_shared = c_gst_gl_context_is_shared;

/** */
alias gst_gl_context_request_config = c_gst_gl_context_request_config;

/** */
alias gst_gl_context_set_shared_with = c_gst_gl_context_set_shared_with;

/** */
alias gst_gl_context_set_window = c_gst_gl_context_set_window;

/** */
alias gst_gl_context_supports_glsl_profile_version = c_gst_gl_context_supports_glsl_profile_version;

/** */
alias gst_gl_context_supports_precision = c_gst_gl_context_supports_precision;

/** */
alias gst_gl_context_supports_precision_highp = c_gst_gl_context_supports_precision_highp;

/** */
alias gst_gl_context_swap_buffers = c_gst_gl_context_swap_buffers;

/** */
alias gst_gl_context_thread_add = c_gst_gl_context_thread_add;

// GLDisplay

/** */
alias gst_gl_display_get_type = c_gst_gl_display_get_type;

/** */
alias gst_gl_display_new = c_gst_gl_display_new;

/** */
alias gst_gl_display_new_with_type = c_gst_gl_display_new_with_type;

/** */
alias gst_gl_display_add_context = c_gst_gl_display_add_context;

/** */
alias gst_gl_display_create_context = c_gst_gl_display_create_context;

/** */
alias gst_gl_display_create_window = c_gst_gl_display_create_window;

/** */
alias gst_gl_display_ensure_context = c_gst_gl_display_ensure_context;

/** */
alias gst_gl_display_filter_gl_api = c_gst_gl_display_filter_gl_api;

/** */
alias gst_gl_display_find_window = c_gst_gl_display_find_window;

/** */
alias gst_gl_display_get_gl_api = c_gst_gl_display_get_gl_api;

/** */
alias gst_gl_display_get_gl_api_unlocked = c_gst_gl_display_get_gl_api_unlocked;

/** */
alias gst_gl_display_get_gl_context_for_thread = c_gst_gl_display_get_gl_context_for_thread;

/** */
alias gst_gl_display_get_handle = c_gst_gl_display_get_handle;

/** */
alias gst_gl_display_get_handle_type = c_gst_gl_display_get_handle_type;

/** */
alias gst_gl_display_remove_context = c_gst_gl_display_remove_context;

/** */
alias gst_gl_display_remove_window = c_gst_gl_display_remove_window;

/** */
alias gst_gl_display_retrieve_window = c_gst_gl_display_retrieve_window;

// GLFilter

/** */
alias gst_gl_filter_get_type = c_gst_gl_filter_get_type;

/** */
alias gst_gl_filter_add_rgba_pad_templates = c_gst_gl_filter_add_rgba_pad_templates;

/** */
alias gst_gl_filter_draw_fullscreen_quad = c_gst_gl_filter_draw_fullscreen_quad;

/** */
alias gst_gl_filter_filter_texture = c_gst_gl_filter_filter_texture;

/** */
alias gst_gl_filter_render_to_target = c_gst_gl_filter_render_to_target;

/** */
alias gst_gl_filter_render_to_target_with_shader = c_gst_gl_filter_render_to_target_with_shader;

// GLFramebuffer

/** */
alias gst_gl_framebuffer_get_type = c_gst_gl_framebuffer_get_type;

/** */
alias gst_gl_framebuffer_new = c_gst_gl_framebuffer_new;

/** */
alias gst_gl_framebuffer_new_with_default_depth = c_gst_gl_framebuffer_new_with_default_depth;

/** */
alias gst_gl_framebuffer_attach = c_gst_gl_framebuffer_attach;

/** */
alias gst_gl_framebuffer_bind = c_gst_gl_framebuffer_bind;

/** */
alias gst_gl_framebuffer_draw_to_texture = c_gst_gl_framebuffer_draw_to_texture;

/** */
alias gst_gl_framebuffer_get_effective_dimensions = c_gst_gl_framebuffer_get_effective_dimensions;

/** */
alias gst_gl_framebuffer_get_id = c_gst_gl_framebuffer_get_id;

// GLMemory

/** */
alias gst_gl_memory_get_type = c_gst_gl_memory_get_type;

/** */
alias gst_gl_memory_copy_into = c_gst_gl_memory_copy_into;

/** */
alias gst_gl_memory_copy_teximage = c_gst_gl_memory_copy_teximage;

/** */
alias gst_gl_memory_get_texture_format = c_gst_gl_memory_get_texture_format;

/** */
alias gst_gl_memory_get_texture_height = c_gst_gl_memory_get_texture_height;

/** */
alias gst_gl_memory_get_texture_id = c_gst_gl_memory_get_texture_id;

/** */
alias gst_gl_memory_get_texture_target = c_gst_gl_memory_get_texture_target;

/** */
alias gst_gl_memory_get_texture_width = c_gst_gl_memory_get_texture_width;

/** */
alias gst_gl_memory_init = c_gst_gl_memory_init;

/** */
alias gst_gl_memory_read_pixels = c_gst_gl_memory_read_pixels;

/** */
alias gst_gl_memory_texsubimage = c_gst_gl_memory_texsubimage;

/** */
alias gst_gl_memory_init_once = c_gst_gl_memory_init_once;

/** */
alias gst_gl_memory_setup_buffer = c_gst_gl_memory_setup_buffer;

// GLMemoryAllocator

/** */
alias gst_gl_memory_allocator_get_type = c_gst_gl_memory_allocator_get_type;

/** */
alias gst_gl_memory_allocator_get_default = c_gst_gl_memory_allocator_get_default;

// GLMemoryPBO

/** */
alias gst_gl_memory_pbo_get_type = c_gst_gl_memory_pbo_get_type;

/** */
alias gst_gl_memory_pbo_copy_into_texture = c_gst_gl_memory_pbo_copy_into_texture;

/** */
alias gst_gl_memory_pbo_download_transfer = c_gst_gl_memory_pbo_download_transfer;

/** */
alias gst_gl_memory_pbo_upload_transfer = c_gst_gl_memory_pbo_upload_transfer;

/** */
alias gst_gl_memory_pbo_init_once = c_gst_gl_memory_pbo_init_once;

// GLMemoryPBOAllocator

/** */
alias gst_gl_memory_pbo_allocator_get_type = c_gst_gl_memory_pbo_allocator_get_type;

// GLMixer

/** */
alias gst_gl_mixer_get_type = c_gst_gl_mixer_get_type;

/** */
alias gst_gl_mixer_get_framebuffer = c_gst_gl_mixer_get_framebuffer;

/** */
alias gst_gl_mixer_process_textures = c_gst_gl_mixer_process_textures;

// GLMixerClass

/** */
alias gst_gl_mixer_class_add_rgba_pad_templates = c_gst_gl_mixer_class_add_rgba_pad_templates;

// GLMixerPad

/** */
alias gst_gl_mixer_pad_get_type = c_gst_gl_mixer_pad_get_type;

// GLOverlayCompositor

/** */
alias gst_gl_overlay_compositor_get_type = c_gst_gl_overlay_compositor_get_type;

/** */
alias gst_gl_overlay_compositor_new = c_gst_gl_overlay_compositor_new;

/** */
alias gst_gl_overlay_compositor_add_caps = c_gst_gl_overlay_compositor_add_caps;

/** */
alias gst_gl_overlay_compositor_draw_overlays = c_gst_gl_overlay_compositor_draw_overlays;

/** */
alias gst_gl_overlay_compositor_free_overlays = c_gst_gl_overlay_compositor_free_overlays;

/** */
alias gst_gl_overlay_compositor_upload_overlays = c_gst_gl_overlay_compositor_upload_overlays;

// GLQuery

/** */
alias gst_gl_query_counter = c_gst_gl_query_counter;

/** */
alias gst_gl_query_end = c_gst_gl_query_end;

/** */
alias gst_gl_query_free = c_gst_gl_query_free;

/** */
alias gst_gl_query_init = c_gst_gl_query_init;

/** */
alias gst_gl_query_result = c_gst_gl_query_result;

/** */
alias gst_gl_query_start = c_gst_gl_query_start;

/** */
alias gst_gl_query_unset = c_gst_gl_query_unset;

/** */
alias gst_gl_query_local_gl_context = c_gst_gl_query_local_gl_context;

/** */
alias gst_gl_query_new = c_gst_gl_query_new;

// GLRenderbuffer

/** */
alias gst_gl_renderbuffer_get_type = c_gst_gl_renderbuffer_get_type;

/** */
alias gst_gl_renderbuffer_get_format = c_gst_gl_renderbuffer_get_format;

/** */
alias gst_gl_renderbuffer_get_height = c_gst_gl_renderbuffer_get_height;

/** */
alias gst_gl_renderbuffer_get_id = c_gst_gl_renderbuffer_get_id;

/** */
alias gst_gl_renderbuffer_get_width = c_gst_gl_renderbuffer_get_width;

/** */
alias gst_gl_renderbuffer_init_once = c_gst_gl_renderbuffer_init_once;

// GLRenderbufferAllocationParams

/** */
alias gst_gl_renderbuffer_allocation_params_get_type = c_gst_gl_renderbuffer_allocation_params_get_type;

/** */
alias gst_gl_renderbuffer_allocation_params_new = c_gst_gl_renderbuffer_allocation_params_new;

/** */
alias gst_gl_renderbuffer_allocation_params_new_wrapped = c_gst_gl_renderbuffer_allocation_params_new_wrapped;

// GLRenderbufferAllocator

/** */
alias gst_gl_renderbuffer_allocator_get_type = c_gst_gl_renderbuffer_allocator_get_type;

// GLSLStage

/** */
alias gst_glsl_stage_get_type = c_gst_glsl_stage_get_type;

/** */
alias gst_glsl_stage_new = c_gst_glsl_stage_new;

/** */
alias gst_glsl_stage_new_default_fragment = c_gst_glsl_stage_new_default_fragment;

/** */
alias gst_glsl_stage_new_default_vertex = c_gst_glsl_stage_new_default_vertex;

/** */
alias gst_glsl_stage_new_with_string = c_gst_glsl_stage_new_with_string;

/** */
alias gst_glsl_stage_new_with_strings = c_gst_glsl_stage_new_with_strings;

/** */
alias gst_glsl_stage_compile = c_gst_glsl_stage_compile;

/** */
alias gst_glsl_stage_get_handle = c_gst_glsl_stage_get_handle;

/** */
alias gst_glsl_stage_get_profile = c_gst_glsl_stage_get_profile;

/** */
alias gst_glsl_stage_get_shader_type = c_gst_glsl_stage_get_shader_type;

/** */
alias gst_glsl_stage_get_version = c_gst_glsl_stage_get_version;

/** */
alias gst_glsl_stage_set_strings = c_gst_glsl_stage_set_strings;

// GLShader

/** */
alias gst_gl_shader_get_type = c_gst_gl_shader_get_type;

/** */
alias gst_gl_shader_new = c_gst_gl_shader_new;

/** */
alias gst_gl_shader_new_default = c_gst_gl_shader_new_default;

/** */
alias gst_gl_shader_new_link_with_stages = c_gst_gl_shader_new_link_with_stages;

/** */
alias gst_gl_shader_new_with_stages = c_gst_gl_shader_new_with_stages;

/** */
alias gst_gl_shader_string_fragment_external_oes_get_default = c_gst_gl_shader_string_fragment_external_oes_get_default;

/** */
alias gst_gl_shader_string_fragment_get_default = c_gst_gl_shader_string_fragment_get_default;

/** */
alias gst_gl_shader_string_get_highest_precision = c_gst_gl_shader_string_get_highest_precision;

/** */
alias gst_gl_shader_attach = c_gst_gl_shader_attach;

/** */
alias gst_gl_shader_attach_unlocked = c_gst_gl_shader_attach_unlocked;

/** */
alias gst_gl_shader_bind_attribute_location = c_gst_gl_shader_bind_attribute_location;

/** */
alias gst_gl_shader_bind_frag_data_location = c_gst_gl_shader_bind_frag_data_location;

/** */
alias gst_gl_shader_compile_attach_stage = c_gst_gl_shader_compile_attach_stage;

/** */
alias gst_gl_shader_detach = c_gst_gl_shader_detach;

/** */
alias gst_gl_shader_detach_unlocked = c_gst_gl_shader_detach_unlocked;

/** */
alias gst_gl_shader_get_attribute_location = c_gst_gl_shader_get_attribute_location;

/** */
alias gst_gl_shader_get_program_handle = c_gst_gl_shader_get_program_handle;

/** */
alias gst_gl_shader_is_linked = c_gst_gl_shader_is_linked;

/** */
alias gst_gl_shader_link = c_gst_gl_shader_link;

/** */
alias gst_gl_shader_release = c_gst_gl_shader_release;

/** */
alias gst_gl_shader_release_unlocked = c_gst_gl_shader_release_unlocked;

/** */
alias gst_gl_shader_set_uniform_1f = c_gst_gl_shader_set_uniform_1f;

/** */
alias gst_gl_shader_set_uniform_1fv = c_gst_gl_shader_set_uniform_1fv;

/** */
alias gst_gl_shader_set_uniform_1i = c_gst_gl_shader_set_uniform_1i;

/** */
alias gst_gl_shader_set_uniform_1iv = c_gst_gl_shader_set_uniform_1iv;

/** */
alias gst_gl_shader_set_uniform_2f = c_gst_gl_shader_set_uniform_2f;

/** */
alias gst_gl_shader_set_uniform_2fv = c_gst_gl_shader_set_uniform_2fv;

/** */
alias gst_gl_shader_set_uniform_2i = c_gst_gl_shader_set_uniform_2i;

/** */
alias gst_gl_shader_set_uniform_2iv = c_gst_gl_shader_set_uniform_2iv;

/** */
alias gst_gl_shader_set_uniform_3f = c_gst_gl_shader_set_uniform_3f;

/** */
alias gst_gl_shader_set_uniform_3fv = c_gst_gl_shader_set_uniform_3fv;

/** */
alias gst_gl_shader_set_uniform_3i = c_gst_gl_shader_set_uniform_3i;

/** */
alias gst_gl_shader_set_uniform_3iv = c_gst_gl_shader_set_uniform_3iv;

/** */
alias gst_gl_shader_set_uniform_4f = c_gst_gl_shader_set_uniform_4f;

/** */
alias gst_gl_shader_set_uniform_4fv = c_gst_gl_shader_set_uniform_4fv;

/** */
alias gst_gl_shader_set_uniform_4i = c_gst_gl_shader_set_uniform_4i;

/** */
alias gst_gl_shader_set_uniform_4iv = c_gst_gl_shader_set_uniform_4iv;

/** */
alias gst_gl_shader_set_uniform_matrix_2fv = c_gst_gl_shader_set_uniform_matrix_2fv;

/** */
alias gst_gl_shader_set_uniform_matrix_2x3fv = c_gst_gl_shader_set_uniform_matrix_2x3fv;

/** */
alias gst_gl_shader_set_uniform_matrix_2x4fv = c_gst_gl_shader_set_uniform_matrix_2x4fv;

/** */
alias gst_gl_shader_set_uniform_matrix_3fv = c_gst_gl_shader_set_uniform_matrix_3fv;

/** */
alias gst_gl_shader_set_uniform_matrix_3x2fv = c_gst_gl_shader_set_uniform_matrix_3x2fv;

/** */
alias gst_gl_shader_set_uniform_matrix_3x4fv = c_gst_gl_shader_set_uniform_matrix_3x4fv;

/** */
alias gst_gl_shader_set_uniform_matrix_4fv = c_gst_gl_shader_set_uniform_matrix_4fv;

/** */
alias gst_gl_shader_set_uniform_matrix_4x2fv = c_gst_gl_shader_set_uniform_matrix_4x2fv;

/** */
alias gst_gl_shader_set_uniform_matrix_4x3fv = c_gst_gl_shader_set_uniform_matrix_4x3fv;

/** */
alias gst_gl_shader_use = c_gst_gl_shader_use;

// GLSyncMeta

/** */
alias gst_gl_sync_meta_set_sync_point = c_gst_gl_sync_meta_set_sync_point;

/** */
alias gst_gl_sync_meta_wait = c_gst_gl_sync_meta_wait;

/** */
alias gst_gl_sync_meta_wait_cpu = c_gst_gl_sync_meta_wait_cpu;

/** */
alias gst_gl_sync_meta_get_info = c_gst_gl_sync_meta_get_info;

// GLUpload

/** */
alias gst_gl_upload_get_type = c_gst_gl_upload_get_type;

/** */
alias gst_gl_upload_new = c_gst_gl_upload_new;

/** */
alias gst_gl_upload_get_input_template_caps = c_gst_gl_upload_get_input_template_caps;

/** */
alias gst_gl_upload_fixate_caps = c_gst_gl_upload_fixate_caps;

/** */
alias gst_gl_upload_get_caps = c_gst_gl_upload_get_caps;

/** */
alias gst_gl_upload_perform_with_buffer = c_gst_gl_upload_perform_with_buffer;

/** */
alias gst_gl_upload_propose_allocation = c_gst_gl_upload_propose_allocation;

/** */
alias gst_gl_upload_set_caps = c_gst_gl_upload_set_caps;

/** */
alias gst_gl_upload_set_context = c_gst_gl_upload_set_context;

/** */
alias gst_gl_upload_transform_caps = c_gst_gl_upload_transform_caps;

// GLVideoAllocationParams

/** */
alias gst_gl_video_allocation_params_get_type = c_gst_gl_video_allocation_params_get_type;

/** */
alias gst_gl_video_allocation_params_new = c_gst_gl_video_allocation_params_new;

/** */
alias gst_gl_video_allocation_params_new_wrapped_data = c_gst_gl_video_allocation_params_new_wrapped_data;

/** */
alias gst_gl_video_allocation_params_new_wrapped_gl_handle = c_gst_gl_video_allocation_params_new_wrapped_gl_handle;

/** */
alias gst_gl_video_allocation_params_new_wrapped_texture = c_gst_gl_video_allocation_params_new_wrapped_texture;

/** */
alias gst_gl_video_allocation_params_copy_data = c_gst_gl_video_allocation_params_copy_data;

/** */
alias gst_gl_video_allocation_params_free_data = c_gst_gl_video_allocation_params_free_data;

/** */
alias gst_gl_video_allocation_params_init_full = c_gst_gl_video_allocation_params_init_full;

// GLViewConvert

/** */
alias gst_gl_view_convert_get_type = c_gst_gl_view_convert_get_type;

/** */
alias gst_gl_view_convert_new = c_gst_gl_view_convert_new;

/** */
alias gst_gl_view_convert_fixate_caps = c_gst_gl_view_convert_fixate_caps;

/** */
alias gst_gl_view_convert_get_output = c_gst_gl_view_convert_get_output;

/** */
alias gst_gl_view_convert_perform = c_gst_gl_view_convert_perform;

/** */
alias gst_gl_view_convert_reset = c_gst_gl_view_convert_reset;

/** */
alias gst_gl_view_convert_set_caps = c_gst_gl_view_convert_set_caps;

/** */
alias gst_gl_view_convert_set_context = c_gst_gl_view_convert_set_context;

/** */
alias gst_gl_view_convert_submit_input_buffer = c_gst_gl_view_convert_submit_input_buffer;

/** */
alias gst_gl_view_convert_transform_caps = c_gst_gl_view_convert_transform_caps;

// GLWindow

/** */
alias gst_gl_window_get_type = c_gst_gl_window_get_type;

/** */
alias gst_gl_window_new = c_gst_gl_window_new;

/** */
alias gst_gl_window_controls_viewport = c_gst_gl_window_controls_viewport;

/** */
alias gst_gl_window_draw = c_gst_gl_window_draw;

/** */
alias gst_gl_window_get_context = c_gst_gl_window_get_context;

/** */
alias gst_gl_window_get_display = c_gst_gl_window_get_display;

/** */
alias gst_gl_window_get_surface_dimensions = c_gst_gl_window_get_surface_dimensions;

/** */
alias gst_gl_window_get_window_handle = c_gst_gl_window_get_window_handle;

/** */
alias gst_gl_window_handle_events = c_gst_gl_window_handle_events;

/** */
alias gst_gl_window_has_output_surface = c_gst_gl_window_has_output_surface;

/** */
alias gst_gl_window_queue_resize = c_gst_gl_window_queue_resize;

/** */
alias gst_gl_window_quit = c_gst_gl_window_quit;

/** */
alias gst_gl_window_resize = c_gst_gl_window_resize;

/** */
alias gst_gl_window_run = c_gst_gl_window_run;

/** */
alias gst_gl_window_send_key_event = c_gst_gl_window_send_key_event;

/** */
alias gst_gl_window_send_message = c_gst_gl_window_send_message;

/** */
alias gst_gl_window_send_message_async = c_gst_gl_window_send_message_async;

/** */
alias gst_gl_window_send_mouse_event = c_gst_gl_window_send_mouse_event;

/** */
alias gst_gl_window_send_scroll_event = c_gst_gl_window_send_scroll_event;

/** */
alias gst_gl_window_set_close_callback = c_gst_gl_window_set_close_callback;

/** */
alias gst_gl_window_set_draw_callback = c_gst_gl_window_set_draw_callback;

/** */
alias gst_gl_window_set_preferred_size = c_gst_gl_window_set_preferred_size;

/** */
alias gst_gl_window_set_render_rectangle = c_gst_gl_window_set_render_rectangle;

/** */
alias gst_gl_window_set_resize_callback = c_gst_gl_window_set_resize_callback;

/** */
alias gst_gl_window_set_window_handle = c_gst_gl_window_set_window_handle;

/** */
alias gst_gl_window_show = c_gst_gl_window_show;

// global

/** */
alias gst_buffer_add_gl_sync_meta = c_gst_buffer_add_gl_sync_meta;

/** */
alias gst_buffer_add_gl_sync_meta_full = c_gst_buffer_add_gl_sync_meta_full;

/** */
alias gst_buffer_pool_config_get_gl_allocation_params = c_gst_buffer_pool_config_get_gl_allocation_params;

/** */
alias gst_buffer_pool_config_get_gl_min_free_queue_size = c_gst_buffer_pool_config_get_gl_min_free_queue_size;

/** */
alias gst_buffer_pool_config_set_gl_allocation_params = c_gst_buffer_pool_config_set_gl_allocation_params;

/** */
alias gst_buffer_pool_config_set_gl_min_free_queue_size = c_gst_buffer_pool_config_set_gl_min_free_queue_size;

/** */
alias gst_context_get_gl_display = c_gst_context_get_gl_display;

/** */
alias gst_context_set_gl_display = c_gst_context_set_gl_display;

/** */
alias gst_gl_check_extension = c_gst_gl_check_extension;

/** */
alias gst_gl_element_propagate_display_context = c_gst_gl_element_propagate_display_context;

/** */
alias gst_gl_ensure_element_data = c_gst_gl_ensure_element_data;

/** */
alias gst_gl_get_affine_transformation_meta_as_ndc = c_gst_gl_get_affine_transformation_meta_as_ndc;

/** */
alias gst_gl_get_plane_data_size = c_gst_gl_get_plane_data_size;

/** */
alias gst_gl_get_plane_start = c_gst_gl_get_plane_start;

/** */
alias gst_gl_handle_context_query = c_gst_gl_handle_context_query;

/** */
alias gst_gl_handle_set_context = c_gst_gl_handle_set_context;

/** */
alias gst_gl_insert_debug_marker = c_gst_gl_insert_debug_marker;

/** */
alias gst_gl_multiply_matrix4 = c_gst_gl_multiply_matrix4;

/** */
alias gst_gl_set_affine_transformation_meta_from_ndc = c_gst_gl_set_affine_transformation_meta_from_ndc;

/** */
alias gst_gl_sized_gl_format_from_gl_format_type = c_gst_gl_sized_gl_format_from_gl_format_type;

/** */
alias gst_gl_stereo_downmix_mode_get_type = c_gst_gl_stereo_downmix_mode_get_type;

/** */
alias gst_gl_swizzle_invert = c_gst_gl_swizzle_invert;

/** */
alias gst_gl_sync_meta_api_get_type = c_gst_gl_sync_meta_api_get_type;

/** */
alias gst_gl_value_get_texture_target_mask = c_gst_gl_value_get_texture_target_mask;

/** */
alias gst_gl_value_set_texture_target = c_gst_gl_value_set_texture_target;

/** */
alias gst_gl_value_set_texture_target_from_mask = c_gst_gl_value_set_texture_target_from_mask;

/** */
alias gst_gl_version_to_glsl_version = c_gst_gl_version_to_glsl_version;

/** */
alias gst_gl_video_format_swizzle = c_gst_gl_video_format_swizzle;

/** */
alias gst_glsl_string_get_version_profile = c_gst_glsl_string_get_version_profile;

/** */
alias gst_is_gl_base_memory = c_gst_is_gl_base_memory;

/** */
alias gst_is_gl_buffer = c_gst_is_gl_buffer;

/** */
alias gst_is_gl_memory = c_gst_is_gl_memory;

/** */
alias gst_is_gl_memory_pbo = c_gst_is_gl_memory_pbo;

/** */
alias gst_is_gl_renderbuffer = c_gst_is_gl_renderbuffer;

// GLAPI

/** */
alias gst_gl_api_from_string = c_gst_gl_api_from_string;

/** */
alias gst_gl_api_to_string = c_gst_gl_api_to_string;

// GLBaseMemoryError

/** */
alias gst_gl_base_memory_error_quark = c_gst_gl_base_memory_error_quark;

// GLConfigCaveat

/** */
alias gst_gl_config_caveat_to_string = c_gst_gl_config_caveat_to_string;

// GLConfigSurfaceType

/** */
alias gst_gl_config_surface_type_to_string = c_gst_gl_config_surface_type_to_string;

// GLContextError

/** */
alias gst_gl_context_error_quark = c_gst_gl_context_error_quark;

// GLFormat

/** */
alias gst_gl_format_from_video_info = c_gst_gl_format_from_video_info;

/** */
alias gst_gl_format_is_supported = c_gst_gl_format_is_supported;

/** */
alias gst_gl_format_n_components = c_gst_gl_format_n_components;

/** */
alias gst_gl_format_type_from_sized_gl_format = c_gst_gl_format_type_from_sized_gl_format;

/** */
alias gst_gl_format_type_n_bytes = c_gst_gl_format_type_n_bytes;

// GLPlatform

/** */
alias gst_gl_platform_from_string = c_gst_gl_platform_from_string;

/** */
alias gst_gl_platform_to_string = c_gst_gl_platform_to_string;

// GLSLError

/** */
alias gst_glsl_error_quark = c_gst_glsl_error_quark;

// GLSLProfile

/** */
alias gst_glsl_profile_from_string = c_gst_glsl_profile_from_string;

/** */
alias gst_glsl_profile_to_string = c_gst_glsl_profile_to_string;

// GLSLVersion

/** */
alias gst_glsl_version_from_string = c_gst_glsl_version_from_string;

/** */
alias gst_glsl_version_profile_from_string = c_gst_glsl_version_profile_from_string;

/** */
alias gst_glsl_version_profile_to_string = c_gst_glsl_version_profile_to_string;

/** */
alias gst_glsl_version_to_string = c_gst_glsl_version_to_string;

// GLTextureTarget

/** */
alias gst_gl_texture_target_from_gl = c_gst_gl_texture_target_from_gl;

/** */
alias gst_gl_texture_target_from_string = c_gst_gl_texture_target_from_string;

/** */
alias gst_gl_texture_target_to_buffer_pool_option = c_gst_gl_texture_target_to_buffer_pool_option;

/** */
alias gst_gl_texture_target_to_gl = c_gst_gl_texture_target_to_gl;

/** */
alias gst_gl_texture_target_to_string = c_gst_gl_texture_target_to_string;

// GLWindowError

/** */
alias gst_gl_window_error_quark = c_gst_gl_window_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // GLAllocationParams
  gidLink(cast(void**)&gst_gl_allocation_params_get_type, "gst_gl_allocation_params_get_type", libs);
  gidLink(cast(void**)&gst_gl_allocation_params_copy, "gst_gl_allocation_params_copy", libs);
  gidLink(cast(void**)&gst_gl_allocation_params_copy_data, "gst_gl_allocation_params_copy_data", libs);
  gidLink(cast(void**)&gst_gl_allocation_params_free, "gst_gl_allocation_params_free", libs);
  gidLink(cast(void**)&gst_gl_allocation_params_free_data, "gst_gl_allocation_params_free_data", libs);
  gidLink(cast(void**)&gst_gl_allocation_params_init, "gst_gl_allocation_params_init", libs);

  // GLAsyncDebug
  gidLink(cast(void**)&gst_gl_async_debug_free, "gst_gl_async_debug_free", libs);
  gidLink(cast(void**)&gst_gl_async_debug_freeze, "gst_gl_async_debug_freeze", libs);
  gidLink(cast(void**)&gst_gl_async_debug_init, "gst_gl_async_debug_init", libs);
  gidLink(cast(void**)&gst_gl_async_debug_output_log_msg, "gst_gl_async_debug_output_log_msg", libs);
  gidLink(cast(void**)&gst_gl_async_debug_store_log_msg, "gst_gl_async_debug_store_log_msg", libs);
  gidLink(cast(void**)&gst_gl_async_debug_store_log_msg_valist, "gst_gl_async_debug_store_log_msg_valist", libs);
  gidLink(cast(void**)&gst_gl_async_debug_thaw, "gst_gl_async_debug_thaw", libs);
  gidLink(cast(void**)&gst_gl_async_debug_unset, "gst_gl_async_debug_unset", libs);
  gidLink(cast(void**)&gst_gl_async_debug_new, "gst_gl_async_debug_new", libs);

  // GLBaseFilter
  gidLink(cast(void**)&gst_gl_base_filter_get_type, "gst_gl_base_filter_get_type", libs);
  gidLink(cast(void**)&gst_gl_base_filter_find_gl_context, "gst_gl_base_filter_find_gl_context", libs);
  gidLink(cast(void**)&gst_gl_base_filter_get_gl_context, "gst_gl_base_filter_get_gl_context", libs);

  // GLBaseMemory
  gidLink(cast(void**)&gst_gl_base_memory_get_type, "gst_gl_base_memory_get_type", libs);
  gidLink(cast(void**)&gst_gl_base_memory_alloc_data, "gst_gl_base_memory_alloc_data", libs);
  gidLink(cast(void**)&gst_gl_base_memory_init, "gst_gl_base_memory_init", libs);
  gidLink(cast(void**)&gst_gl_base_memory_memcpy, "gst_gl_base_memory_memcpy", libs);
  gidLink(cast(void**)&gst_gl_base_memory_alloc, "gst_gl_base_memory_alloc", libs);
  gidLink(cast(void**)&gst_gl_base_memory_init_once, "gst_gl_base_memory_init_once", libs);

  // GLBaseMemoryAllocator
  gidLink(cast(void**)&gst_gl_base_memory_allocator_get_type, "gst_gl_base_memory_allocator_get_type", libs);

  // GLBaseMixer
  gidLink(cast(void**)&gst_gl_base_mixer_get_type, "gst_gl_base_mixer_get_type", libs);
  gidLink(cast(void**)&gst_gl_base_mixer_get_gl_context, "gst_gl_base_mixer_get_gl_context", libs);

  // GLBaseMixerPad
  gidLink(cast(void**)&gst_gl_base_mixer_pad_get_type, "gst_gl_base_mixer_pad_get_type", libs);

  // GLBaseSrc
  gidLink(cast(void**)&gst_gl_base_src_get_type, "gst_gl_base_src_get_type", libs);

  // GLBuffer
  gidLink(cast(void**)&gst_gl_buffer_get_type, "gst_gl_buffer_get_type", libs);
  gidLink(cast(void**)&gst_gl_buffer_init_once, "gst_gl_buffer_init_once", libs);

  // GLBufferAllocationParams
  gidLink(cast(void**)&gst_gl_buffer_allocation_params_get_type, "gst_gl_buffer_allocation_params_get_type", libs);
  gidLink(cast(void**)&gst_gl_buffer_allocation_params_new, "gst_gl_buffer_allocation_params_new", libs);

  // GLBufferAllocator
  gidLink(cast(void**)&gst_gl_buffer_allocator_get_type, "gst_gl_buffer_allocator_get_type", libs);

  // GLBufferPool
  gidLink(cast(void**)&gst_gl_buffer_pool_get_type, "gst_gl_buffer_pool_get_type", libs);
  gidLink(cast(void**)&gst_gl_buffer_pool_new, "gst_gl_buffer_pool_new", libs);
  gidLink(cast(void**)&gst_gl_buffer_pool_get_gl_allocation_params, "gst_gl_buffer_pool_get_gl_allocation_params", libs);

  // GLColorConvert
  gidLink(cast(void**)&gst_gl_color_convert_get_type, "gst_gl_color_convert_get_type", libs);
  gidLink(cast(void**)&gst_gl_color_convert_new, "gst_gl_color_convert_new", libs);
  gidLink(cast(void**)&gst_gl_color_convert_fixate_caps, "gst_gl_color_convert_fixate_caps", libs);
  gidLink(cast(void**)&gst_gl_color_convert_swizzle_shader_string, "gst_gl_color_convert_swizzle_shader_string", libs);
  gidLink(cast(void**)&gst_gl_color_convert_transform_caps, "gst_gl_color_convert_transform_caps", libs);
  gidLink(cast(void**)&gst_gl_color_convert_yuv_to_rgb_shader_string, "gst_gl_color_convert_yuv_to_rgb_shader_string", libs);
  gidLink(cast(void**)&gst_gl_color_convert_decide_allocation, "gst_gl_color_convert_decide_allocation", libs);
  gidLink(cast(void**)&gst_gl_color_convert_perform, "gst_gl_color_convert_perform", libs);
  gidLink(cast(void**)&gst_gl_color_convert_set_caps, "gst_gl_color_convert_set_caps", libs);

  // GLContext
  gidLink(cast(void**)&gst_gl_context_get_type, "gst_gl_context_get_type", libs);
  gidLink(cast(void**)&gst_gl_context_new, "gst_gl_context_new", libs);
  gidLink(cast(void**)&gst_gl_context_new_wrapped, "gst_gl_context_new_wrapped", libs);
  gidLink(cast(void**)&gst_gl_context_default_get_proc_address, "gst_gl_context_default_get_proc_address", libs);
  gidLink(cast(void**)&gst_gl_context_get_current, "gst_gl_context_get_current", libs);
  gidLink(cast(void**)&gst_gl_context_get_current_gl_api, "gst_gl_context_get_current_gl_api", libs);
  gidLink(cast(void**)&gst_gl_context_get_current_gl_context, "gst_gl_context_get_current_gl_context", libs);
  gidLink(cast(void**)&gst_gl_context_get_proc_address_with_platform, "gst_gl_context_get_proc_address_with_platform", libs);
  gidLink(cast(void**)&gst_gl_context_activate, "gst_gl_context_activate", libs);
  gidLink(cast(void**)&gst_gl_context_can_share, "gst_gl_context_can_share", libs);
  gidLink(cast(void**)&gst_gl_context_check_feature, "gst_gl_context_check_feature", libs);
  gidLink(cast(void**)&gst_gl_context_check_framebuffer_status, "gst_gl_context_check_framebuffer_status", libs);
  gidLink(cast(void**)&gst_gl_context_check_gl_version, "gst_gl_context_check_gl_version", libs);
  gidLink(cast(void**)&gst_gl_context_clear_framebuffer, "gst_gl_context_clear_framebuffer", libs);
  gidLink(cast(void**)&gst_gl_context_clear_shader, "gst_gl_context_clear_shader", libs);
  gidLink(cast(void**)&gst_gl_context_create, "gst_gl_context_create", libs);
  gidLink(cast(void**)&gst_gl_context_destroy, "gst_gl_context_destroy", libs);
  gidLink(cast(void**)&gst_gl_context_fill_info, "gst_gl_context_fill_info", libs);
  gidLink(cast(void**)&gst_gl_context_get_config, "gst_gl_context_get_config", libs);
  gidLink(cast(void**)&gst_gl_context_get_display, "gst_gl_context_get_display", libs);
  gidLink(cast(void**)&gst_gl_context_get_gl_api, "gst_gl_context_get_gl_api", libs);
  gidLink(cast(void**)&gst_gl_context_get_gl_context, "gst_gl_context_get_gl_context", libs);
  gidLink(cast(void**)&gst_gl_context_get_gl_platform, "gst_gl_context_get_gl_platform", libs);
  gidLink(cast(void**)&gst_gl_context_get_gl_platform_version, "gst_gl_context_get_gl_platform_version", libs);
  gidLink(cast(void**)&gst_gl_context_get_gl_version, "gst_gl_context_get_gl_version", libs);
  gidLink(cast(void**)&gst_gl_context_get_proc_address, "gst_gl_context_get_proc_address", libs);
  gidLink(cast(void**)&gst_gl_context_get_thread, "gst_gl_context_get_thread", libs);
  gidLink(cast(void**)&gst_gl_context_get_window, "gst_gl_context_get_window", libs);
  gidLink(cast(void**)&gst_gl_context_is_shared, "gst_gl_context_is_shared", libs);
  gidLink(cast(void**)&gst_gl_context_request_config, "gst_gl_context_request_config", libs);
  gidLink(cast(void**)&gst_gl_context_set_shared_with, "gst_gl_context_set_shared_with", libs);
  gidLink(cast(void**)&gst_gl_context_set_window, "gst_gl_context_set_window", libs);
  gidLink(cast(void**)&gst_gl_context_supports_glsl_profile_version, "gst_gl_context_supports_glsl_profile_version", libs);
  gidLink(cast(void**)&gst_gl_context_supports_precision, "gst_gl_context_supports_precision", libs);
  gidLink(cast(void**)&gst_gl_context_supports_precision_highp, "gst_gl_context_supports_precision_highp", libs);
  gidLink(cast(void**)&gst_gl_context_swap_buffers, "gst_gl_context_swap_buffers", libs);
  gidLink(cast(void**)&gst_gl_context_thread_add, "gst_gl_context_thread_add", libs);

  // GLDisplay
  gidLink(cast(void**)&gst_gl_display_get_type, "gst_gl_display_get_type", libs);
  gidLink(cast(void**)&gst_gl_display_new, "gst_gl_display_new", libs);
  gidLink(cast(void**)&gst_gl_display_new_with_type, "gst_gl_display_new_with_type", libs);
  gidLink(cast(void**)&gst_gl_display_add_context, "gst_gl_display_add_context", libs);
  gidLink(cast(void**)&gst_gl_display_create_context, "gst_gl_display_create_context", libs);
  gidLink(cast(void**)&gst_gl_display_create_window, "gst_gl_display_create_window", libs);
  gidLink(cast(void**)&gst_gl_display_ensure_context, "gst_gl_display_ensure_context", libs);
  gidLink(cast(void**)&gst_gl_display_filter_gl_api, "gst_gl_display_filter_gl_api", libs);
  gidLink(cast(void**)&gst_gl_display_find_window, "gst_gl_display_find_window", libs);
  gidLink(cast(void**)&gst_gl_display_get_gl_api, "gst_gl_display_get_gl_api", libs);
  gidLink(cast(void**)&gst_gl_display_get_gl_api_unlocked, "gst_gl_display_get_gl_api_unlocked", libs);
  gidLink(cast(void**)&gst_gl_display_get_gl_context_for_thread, "gst_gl_display_get_gl_context_for_thread", libs);
  gidLink(cast(void**)&gst_gl_display_get_handle, "gst_gl_display_get_handle", libs);
  gidLink(cast(void**)&gst_gl_display_get_handle_type, "gst_gl_display_get_handle_type", libs);
  gidLink(cast(void**)&gst_gl_display_remove_context, "gst_gl_display_remove_context", libs);
  gidLink(cast(void**)&gst_gl_display_remove_window, "gst_gl_display_remove_window", libs);
  gidLink(cast(void**)&gst_gl_display_retrieve_window, "gst_gl_display_retrieve_window", libs);

  // GLFilter
  gidLink(cast(void**)&gst_gl_filter_get_type, "gst_gl_filter_get_type", libs);
  gidLink(cast(void**)&gst_gl_filter_add_rgba_pad_templates, "gst_gl_filter_add_rgba_pad_templates", libs);
  gidLink(cast(void**)&gst_gl_filter_draw_fullscreen_quad, "gst_gl_filter_draw_fullscreen_quad", libs);
  gidLink(cast(void**)&gst_gl_filter_filter_texture, "gst_gl_filter_filter_texture", libs);
  gidLink(cast(void**)&gst_gl_filter_render_to_target, "gst_gl_filter_render_to_target", libs);
  gidLink(cast(void**)&gst_gl_filter_render_to_target_with_shader, "gst_gl_filter_render_to_target_with_shader", libs);

  // GLFramebuffer
  gidLink(cast(void**)&gst_gl_framebuffer_get_type, "gst_gl_framebuffer_get_type", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_new, "gst_gl_framebuffer_new", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_new_with_default_depth, "gst_gl_framebuffer_new_with_default_depth", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_attach, "gst_gl_framebuffer_attach", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_bind, "gst_gl_framebuffer_bind", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_draw_to_texture, "gst_gl_framebuffer_draw_to_texture", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_get_effective_dimensions, "gst_gl_framebuffer_get_effective_dimensions", libs);
  gidLink(cast(void**)&gst_gl_framebuffer_get_id, "gst_gl_framebuffer_get_id", libs);

  // GLMemory
  gidLink(cast(void**)&gst_gl_memory_get_type, "gst_gl_memory_get_type", libs);
  gidLink(cast(void**)&gst_gl_memory_copy_into, "gst_gl_memory_copy_into", libs);
  gidLink(cast(void**)&gst_gl_memory_copy_teximage, "gst_gl_memory_copy_teximage", libs);
  gidLink(cast(void**)&gst_gl_memory_get_texture_format, "gst_gl_memory_get_texture_format", libs);
  gidLink(cast(void**)&gst_gl_memory_get_texture_height, "gst_gl_memory_get_texture_height", libs);
  gidLink(cast(void**)&gst_gl_memory_get_texture_id, "gst_gl_memory_get_texture_id", libs);
  gidLink(cast(void**)&gst_gl_memory_get_texture_target, "gst_gl_memory_get_texture_target", libs);
  gidLink(cast(void**)&gst_gl_memory_get_texture_width, "gst_gl_memory_get_texture_width", libs);
  gidLink(cast(void**)&gst_gl_memory_init, "gst_gl_memory_init", libs);
  gidLink(cast(void**)&gst_gl_memory_read_pixels, "gst_gl_memory_read_pixels", libs);
  gidLink(cast(void**)&gst_gl_memory_texsubimage, "gst_gl_memory_texsubimage", libs);
  gidLink(cast(void**)&gst_gl_memory_init_once, "gst_gl_memory_init_once", libs);
  gidLink(cast(void**)&gst_gl_memory_setup_buffer, "gst_gl_memory_setup_buffer", libs);

  // GLMemoryAllocator
  gidLink(cast(void**)&gst_gl_memory_allocator_get_type, "gst_gl_memory_allocator_get_type", libs);
  gidLink(cast(void**)&gst_gl_memory_allocator_get_default, "gst_gl_memory_allocator_get_default", libs);

  // GLMemoryPBO
  gidLink(cast(void**)&gst_gl_memory_pbo_get_type, "gst_gl_memory_pbo_get_type", libs);
  gidLink(cast(void**)&gst_gl_memory_pbo_copy_into_texture, "gst_gl_memory_pbo_copy_into_texture", libs);
  gidLink(cast(void**)&gst_gl_memory_pbo_download_transfer, "gst_gl_memory_pbo_download_transfer", libs);
  gidLink(cast(void**)&gst_gl_memory_pbo_upload_transfer, "gst_gl_memory_pbo_upload_transfer", libs);
  gidLink(cast(void**)&gst_gl_memory_pbo_init_once, "gst_gl_memory_pbo_init_once", libs);

  // GLMemoryPBOAllocator
  gidLink(cast(void**)&gst_gl_memory_pbo_allocator_get_type, "gst_gl_memory_pbo_allocator_get_type", libs);

  // GLMixer
  gidLink(cast(void**)&gst_gl_mixer_get_type, "gst_gl_mixer_get_type", libs);
  gidLink(cast(void**)&gst_gl_mixer_get_framebuffer, "gst_gl_mixer_get_framebuffer", libs);
  gidLink(cast(void**)&gst_gl_mixer_process_textures, "gst_gl_mixer_process_textures", libs);

  // GLMixerClass
  gidLink(cast(void**)&gst_gl_mixer_class_add_rgba_pad_templates, "gst_gl_mixer_class_add_rgba_pad_templates", libs);

  // GLMixerPad
  gidLink(cast(void**)&gst_gl_mixer_pad_get_type, "gst_gl_mixer_pad_get_type", libs);

  // GLOverlayCompositor
  gidLink(cast(void**)&gst_gl_overlay_compositor_get_type, "gst_gl_overlay_compositor_get_type", libs);
  gidLink(cast(void**)&gst_gl_overlay_compositor_new, "gst_gl_overlay_compositor_new", libs);
  gidLink(cast(void**)&gst_gl_overlay_compositor_add_caps, "gst_gl_overlay_compositor_add_caps", libs);
  gidLink(cast(void**)&gst_gl_overlay_compositor_draw_overlays, "gst_gl_overlay_compositor_draw_overlays", libs);
  gidLink(cast(void**)&gst_gl_overlay_compositor_free_overlays, "gst_gl_overlay_compositor_free_overlays", libs);
  gidLink(cast(void**)&gst_gl_overlay_compositor_upload_overlays, "gst_gl_overlay_compositor_upload_overlays", libs);

  // GLQuery
  gidLink(cast(void**)&gst_gl_query_counter, "gst_gl_query_counter", libs);
  gidLink(cast(void**)&gst_gl_query_end, "gst_gl_query_end", libs);
  gidLink(cast(void**)&gst_gl_query_free, "gst_gl_query_free", libs);
  gidLink(cast(void**)&gst_gl_query_init, "gst_gl_query_init", libs);
  gidLink(cast(void**)&gst_gl_query_result, "gst_gl_query_result", libs);
  gidLink(cast(void**)&gst_gl_query_start, "gst_gl_query_start", libs);
  gidLink(cast(void**)&gst_gl_query_unset, "gst_gl_query_unset", libs);
  gidLink(cast(void**)&gst_gl_query_local_gl_context, "gst_gl_query_local_gl_context", libs);
  gidLink(cast(void**)&gst_gl_query_new, "gst_gl_query_new", libs);

  // GLRenderbuffer
  gidLink(cast(void**)&gst_gl_renderbuffer_get_type, "gst_gl_renderbuffer_get_type", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_get_format, "gst_gl_renderbuffer_get_format", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_get_height, "gst_gl_renderbuffer_get_height", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_get_id, "gst_gl_renderbuffer_get_id", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_get_width, "gst_gl_renderbuffer_get_width", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_init_once, "gst_gl_renderbuffer_init_once", libs);

  // GLRenderbufferAllocationParams
  gidLink(cast(void**)&gst_gl_renderbuffer_allocation_params_get_type, "gst_gl_renderbuffer_allocation_params_get_type", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_allocation_params_new, "gst_gl_renderbuffer_allocation_params_new", libs);
  gidLink(cast(void**)&gst_gl_renderbuffer_allocation_params_new_wrapped, "gst_gl_renderbuffer_allocation_params_new_wrapped", libs);

  // GLRenderbufferAllocator
  gidLink(cast(void**)&gst_gl_renderbuffer_allocator_get_type, "gst_gl_renderbuffer_allocator_get_type", libs);

  // GLSLStage
  gidLink(cast(void**)&gst_glsl_stage_get_type, "gst_glsl_stage_get_type", libs);
  gidLink(cast(void**)&gst_glsl_stage_new, "gst_glsl_stage_new", libs);
  gidLink(cast(void**)&gst_glsl_stage_new_default_fragment, "gst_glsl_stage_new_default_fragment", libs);
  gidLink(cast(void**)&gst_glsl_stage_new_default_vertex, "gst_glsl_stage_new_default_vertex", libs);
  gidLink(cast(void**)&gst_glsl_stage_new_with_string, "gst_glsl_stage_new_with_string", libs);
  gidLink(cast(void**)&gst_glsl_stage_new_with_strings, "gst_glsl_stage_new_with_strings", libs);
  gidLink(cast(void**)&gst_glsl_stage_compile, "gst_glsl_stage_compile", libs);
  gidLink(cast(void**)&gst_glsl_stage_get_handle, "gst_glsl_stage_get_handle", libs);
  gidLink(cast(void**)&gst_glsl_stage_get_profile, "gst_glsl_stage_get_profile", libs);
  gidLink(cast(void**)&gst_glsl_stage_get_shader_type, "gst_glsl_stage_get_shader_type", libs);
  gidLink(cast(void**)&gst_glsl_stage_get_version, "gst_glsl_stage_get_version", libs);
  gidLink(cast(void**)&gst_glsl_stage_set_strings, "gst_glsl_stage_set_strings", libs);

  // GLShader
  gidLink(cast(void**)&gst_gl_shader_get_type, "gst_gl_shader_get_type", libs);
  gidLink(cast(void**)&gst_gl_shader_new, "gst_gl_shader_new", libs);
  gidLink(cast(void**)&gst_gl_shader_new_default, "gst_gl_shader_new_default", libs);
  gidLink(cast(void**)&gst_gl_shader_new_link_with_stages, "gst_gl_shader_new_link_with_stages", libs);
  gidLink(cast(void**)&gst_gl_shader_new_with_stages, "gst_gl_shader_new_with_stages", libs);
  gidLink(cast(void**)&gst_gl_shader_string_fragment_external_oes_get_default, "gst_gl_shader_string_fragment_external_oes_get_default", libs);
  gidLink(cast(void**)&gst_gl_shader_string_fragment_get_default, "gst_gl_shader_string_fragment_get_default", libs);
  gidLink(cast(void**)&gst_gl_shader_string_get_highest_precision, "gst_gl_shader_string_get_highest_precision", libs);
  gidLink(cast(void**)&gst_gl_shader_attach, "gst_gl_shader_attach", libs);
  gidLink(cast(void**)&gst_gl_shader_attach_unlocked, "gst_gl_shader_attach_unlocked", libs);
  gidLink(cast(void**)&gst_gl_shader_bind_attribute_location, "gst_gl_shader_bind_attribute_location", libs);
  gidLink(cast(void**)&gst_gl_shader_bind_frag_data_location, "gst_gl_shader_bind_frag_data_location", libs);
  gidLink(cast(void**)&gst_gl_shader_compile_attach_stage, "gst_gl_shader_compile_attach_stage", libs);
  gidLink(cast(void**)&gst_gl_shader_detach, "gst_gl_shader_detach", libs);
  gidLink(cast(void**)&gst_gl_shader_detach_unlocked, "gst_gl_shader_detach_unlocked", libs);
  gidLink(cast(void**)&gst_gl_shader_get_attribute_location, "gst_gl_shader_get_attribute_location", libs);
  gidLink(cast(void**)&gst_gl_shader_get_program_handle, "gst_gl_shader_get_program_handle", libs);
  gidLink(cast(void**)&gst_gl_shader_is_linked, "gst_gl_shader_is_linked", libs);
  gidLink(cast(void**)&gst_gl_shader_link, "gst_gl_shader_link", libs);
  gidLink(cast(void**)&gst_gl_shader_release, "gst_gl_shader_release", libs);
  gidLink(cast(void**)&gst_gl_shader_release_unlocked, "gst_gl_shader_release_unlocked", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_1f, "gst_gl_shader_set_uniform_1f", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_1fv, "gst_gl_shader_set_uniform_1fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_1i, "gst_gl_shader_set_uniform_1i", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_1iv, "gst_gl_shader_set_uniform_1iv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_2f, "gst_gl_shader_set_uniform_2f", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_2fv, "gst_gl_shader_set_uniform_2fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_2i, "gst_gl_shader_set_uniform_2i", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_2iv, "gst_gl_shader_set_uniform_2iv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_3f, "gst_gl_shader_set_uniform_3f", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_3fv, "gst_gl_shader_set_uniform_3fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_3i, "gst_gl_shader_set_uniform_3i", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_3iv, "gst_gl_shader_set_uniform_3iv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_4f, "gst_gl_shader_set_uniform_4f", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_4fv, "gst_gl_shader_set_uniform_4fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_4i, "gst_gl_shader_set_uniform_4i", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_4iv, "gst_gl_shader_set_uniform_4iv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_2fv, "gst_gl_shader_set_uniform_matrix_2fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_2x3fv, "gst_gl_shader_set_uniform_matrix_2x3fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_2x4fv, "gst_gl_shader_set_uniform_matrix_2x4fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_3fv, "gst_gl_shader_set_uniform_matrix_3fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_3x2fv, "gst_gl_shader_set_uniform_matrix_3x2fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_3x4fv, "gst_gl_shader_set_uniform_matrix_3x4fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_4fv, "gst_gl_shader_set_uniform_matrix_4fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_4x2fv, "gst_gl_shader_set_uniform_matrix_4x2fv", libs);
  gidLink(cast(void**)&gst_gl_shader_set_uniform_matrix_4x3fv, "gst_gl_shader_set_uniform_matrix_4x3fv", libs);
  gidLink(cast(void**)&gst_gl_shader_use, "gst_gl_shader_use", libs);

  // GLSyncMeta
  gidLink(cast(void**)&gst_gl_sync_meta_set_sync_point, "gst_gl_sync_meta_set_sync_point", libs);
  gidLink(cast(void**)&gst_gl_sync_meta_wait, "gst_gl_sync_meta_wait", libs);
  gidLink(cast(void**)&gst_gl_sync_meta_wait_cpu, "gst_gl_sync_meta_wait_cpu", libs);
  gidLink(cast(void**)&gst_gl_sync_meta_get_info, "gst_gl_sync_meta_get_info", libs);

  // GLUpload
  gidLink(cast(void**)&gst_gl_upload_get_type, "gst_gl_upload_get_type", libs);
  gidLink(cast(void**)&gst_gl_upload_new, "gst_gl_upload_new", libs);
  gidLink(cast(void**)&gst_gl_upload_get_input_template_caps, "gst_gl_upload_get_input_template_caps", libs);
  gidLink(cast(void**)&gst_gl_upload_fixate_caps, "gst_gl_upload_fixate_caps", libs);
  gidLink(cast(void**)&gst_gl_upload_get_caps, "gst_gl_upload_get_caps", libs);
  gidLink(cast(void**)&gst_gl_upload_perform_with_buffer, "gst_gl_upload_perform_with_buffer", libs);
  gidLink(cast(void**)&gst_gl_upload_propose_allocation, "gst_gl_upload_propose_allocation", libs);
  gidLink(cast(void**)&gst_gl_upload_set_caps, "gst_gl_upload_set_caps", libs);
  gidLink(cast(void**)&gst_gl_upload_set_context, "gst_gl_upload_set_context", libs);
  gidLink(cast(void**)&gst_gl_upload_transform_caps, "gst_gl_upload_transform_caps", libs);

  // GLVideoAllocationParams
  gidLink(cast(void**)&gst_gl_video_allocation_params_get_type, "gst_gl_video_allocation_params_get_type", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_new, "gst_gl_video_allocation_params_new", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_new_wrapped_data, "gst_gl_video_allocation_params_new_wrapped_data", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_new_wrapped_gl_handle, "gst_gl_video_allocation_params_new_wrapped_gl_handle", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_new_wrapped_texture, "gst_gl_video_allocation_params_new_wrapped_texture", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_copy_data, "gst_gl_video_allocation_params_copy_data", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_free_data, "gst_gl_video_allocation_params_free_data", libs);
  gidLink(cast(void**)&gst_gl_video_allocation_params_init_full, "gst_gl_video_allocation_params_init_full", libs);

  // GLViewConvert
  gidLink(cast(void**)&gst_gl_view_convert_get_type, "gst_gl_view_convert_get_type", libs);
  gidLink(cast(void**)&gst_gl_view_convert_new, "gst_gl_view_convert_new", libs);
  gidLink(cast(void**)&gst_gl_view_convert_fixate_caps, "gst_gl_view_convert_fixate_caps", libs);
  gidLink(cast(void**)&gst_gl_view_convert_get_output, "gst_gl_view_convert_get_output", libs);
  gidLink(cast(void**)&gst_gl_view_convert_perform, "gst_gl_view_convert_perform", libs);
  gidLink(cast(void**)&gst_gl_view_convert_reset, "gst_gl_view_convert_reset", libs);
  gidLink(cast(void**)&gst_gl_view_convert_set_caps, "gst_gl_view_convert_set_caps", libs);
  gidLink(cast(void**)&gst_gl_view_convert_set_context, "gst_gl_view_convert_set_context", libs);
  gidLink(cast(void**)&gst_gl_view_convert_submit_input_buffer, "gst_gl_view_convert_submit_input_buffer", libs);
  gidLink(cast(void**)&gst_gl_view_convert_transform_caps, "gst_gl_view_convert_transform_caps", libs);

  // GLWindow
  gidLink(cast(void**)&gst_gl_window_get_type, "gst_gl_window_get_type", libs);
  gidLink(cast(void**)&gst_gl_window_new, "gst_gl_window_new", libs);
  gidLink(cast(void**)&gst_gl_window_controls_viewport, "gst_gl_window_controls_viewport", libs);
  gidLink(cast(void**)&gst_gl_window_draw, "gst_gl_window_draw", libs);
  gidLink(cast(void**)&gst_gl_window_get_context, "gst_gl_window_get_context", libs);
  gidLink(cast(void**)&gst_gl_window_get_display, "gst_gl_window_get_display", libs);
  gidLink(cast(void**)&gst_gl_window_get_surface_dimensions, "gst_gl_window_get_surface_dimensions", libs);
  gidLink(cast(void**)&gst_gl_window_get_window_handle, "gst_gl_window_get_window_handle", libs);
  gidLink(cast(void**)&gst_gl_window_handle_events, "gst_gl_window_handle_events", libs);
  gidLink(cast(void**)&gst_gl_window_has_output_surface, "gst_gl_window_has_output_surface", libs);
  gidLink(cast(void**)&gst_gl_window_queue_resize, "gst_gl_window_queue_resize", libs);
  gidLink(cast(void**)&gst_gl_window_quit, "gst_gl_window_quit", libs);
  gidLink(cast(void**)&gst_gl_window_resize, "gst_gl_window_resize", libs);
  gidLink(cast(void**)&gst_gl_window_run, "gst_gl_window_run", libs);
  gidLink(cast(void**)&gst_gl_window_send_key_event, "gst_gl_window_send_key_event", libs);
  gidLink(cast(void**)&gst_gl_window_send_message, "gst_gl_window_send_message", libs);
  gidLink(cast(void**)&gst_gl_window_send_message_async, "gst_gl_window_send_message_async", libs);
  gidLink(cast(void**)&gst_gl_window_send_mouse_event, "gst_gl_window_send_mouse_event", libs);
  gidLink(cast(void**)&gst_gl_window_send_scroll_event, "gst_gl_window_send_scroll_event", libs);
  gidLink(cast(void**)&gst_gl_window_set_close_callback, "gst_gl_window_set_close_callback", libs);
  gidLink(cast(void**)&gst_gl_window_set_draw_callback, "gst_gl_window_set_draw_callback", libs);
  gidLink(cast(void**)&gst_gl_window_set_preferred_size, "gst_gl_window_set_preferred_size", libs);
  gidLink(cast(void**)&gst_gl_window_set_render_rectangle, "gst_gl_window_set_render_rectangle", libs);
  gidLink(cast(void**)&gst_gl_window_set_resize_callback, "gst_gl_window_set_resize_callback", libs);
  gidLink(cast(void**)&gst_gl_window_set_window_handle, "gst_gl_window_set_window_handle", libs);
  gidLink(cast(void**)&gst_gl_window_show, "gst_gl_window_show", libs);

  // global
  gidLink(cast(void**)&gst_buffer_add_gl_sync_meta, "gst_buffer_add_gl_sync_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_gl_sync_meta_full, "gst_buffer_add_gl_sync_meta_full", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_gl_allocation_params, "gst_buffer_pool_config_get_gl_allocation_params", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_gl_min_free_queue_size, "gst_buffer_pool_config_get_gl_min_free_queue_size", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_set_gl_allocation_params, "gst_buffer_pool_config_set_gl_allocation_params", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_set_gl_min_free_queue_size, "gst_buffer_pool_config_set_gl_min_free_queue_size", libs);
  gidLink(cast(void**)&gst_context_get_gl_display, "gst_context_get_gl_display", libs);
  gidLink(cast(void**)&gst_context_set_gl_display, "gst_context_set_gl_display", libs);
  gidLink(cast(void**)&gst_gl_check_extension, "gst_gl_check_extension", libs);
  gidLink(cast(void**)&gst_gl_element_propagate_display_context, "gst_gl_element_propagate_display_context", libs);
  gidLink(cast(void**)&gst_gl_ensure_element_data, "gst_gl_ensure_element_data", libs);
  gidLink(cast(void**)&gst_gl_get_affine_transformation_meta_as_ndc, "gst_gl_get_affine_transformation_meta_as_ndc", libs);
  gidLink(cast(void**)&gst_gl_get_plane_data_size, "gst_gl_get_plane_data_size", libs);
  gidLink(cast(void**)&gst_gl_get_plane_start, "gst_gl_get_plane_start", libs);
  gidLink(cast(void**)&gst_gl_handle_context_query, "gst_gl_handle_context_query", libs);
  gidLink(cast(void**)&gst_gl_handle_set_context, "gst_gl_handle_set_context", libs);
  gidLink(cast(void**)&gst_gl_insert_debug_marker, "gst_gl_insert_debug_marker", libs);
  gidLink(cast(void**)&gst_gl_multiply_matrix4, "gst_gl_multiply_matrix4", libs);
  gidLink(cast(void**)&gst_gl_set_affine_transformation_meta_from_ndc, "gst_gl_set_affine_transformation_meta_from_ndc", libs);
  gidLink(cast(void**)&gst_gl_sized_gl_format_from_gl_format_type, "gst_gl_sized_gl_format_from_gl_format_type", libs);
  gidLink(cast(void**)&gst_gl_stereo_downmix_mode_get_type, "gst_gl_stereo_downmix_mode_get_type", libs);
  gidLink(cast(void**)&gst_gl_swizzle_invert, "gst_gl_swizzle_invert", libs);
  gidLink(cast(void**)&gst_gl_sync_meta_api_get_type, "gst_gl_sync_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_gl_value_get_texture_target_mask, "gst_gl_value_get_texture_target_mask", libs);
  gidLink(cast(void**)&gst_gl_value_set_texture_target, "gst_gl_value_set_texture_target", libs);
  gidLink(cast(void**)&gst_gl_value_set_texture_target_from_mask, "gst_gl_value_set_texture_target_from_mask", libs);
  gidLink(cast(void**)&gst_gl_version_to_glsl_version, "gst_gl_version_to_glsl_version", libs);
  gidLink(cast(void**)&gst_gl_video_format_swizzle, "gst_gl_video_format_swizzle", libs);
  gidLink(cast(void**)&gst_glsl_string_get_version_profile, "gst_glsl_string_get_version_profile", libs);
  gidLink(cast(void**)&gst_is_gl_base_memory, "gst_is_gl_base_memory", libs);
  gidLink(cast(void**)&gst_is_gl_buffer, "gst_is_gl_buffer", libs);
  gidLink(cast(void**)&gst_is_gl_memory, "gst_is_gl_memory", libs);
  gidLink(cast(void**)&gst_is_gl_memory_pbo, "gst_is_gl_memory_pbo", libs);
  gidLink(cast(void**)&gst_is_gl_renderbuffer, "gst_is_gl_renderbuffer", libs);

  // GLAPI
  gidLink(cast(void**)&gst_gl_api_from_string, "gst_gl_api_from_string", libs);
  gidLink(cast(void**)&gst_gl_api_to_string, "gst_gl_api_to_string", libs);

  // GLBaseMemoryError
  gidLink(cast(void**)&gst_gl_base_memory_error_quark, "gst_gl_base_memory_error_quark", libs);

  // GLConfigCaveat
  gidLink(cast(void**)&gst_gl_config_caveat_to_string, "gst_gl_config_caveat_to_string", libs);

  // GLConfigSurfaceType
  gidLink(cast(void**)&gst_gl_config_surface_type_to_string, "gst_gl_config_surface_type_to_string", libs);

  // GLContextError
  gidLink(cast(void**)&gst_gl_context_error_quark, "gst_gl_context_error_quark", libs);

  // GLFormat
  gidLink(cast(void**)&gst_gl_format_from_video_info, "gst_gl_format_from_video_info", libs);
  gidLink(cast(void**)&gst_gl_format_is_supported, "gst_gl_format_is_supported", libs);
  gidLink(cast(void**)&gst_gl_format_n_components, "gst_gl_format_n_components", libs);
  gidLink(cast(void**)&gst_gl_format_type_from_sized_gl_format, "gst_gl_format_type_from_sized_gl_format", libs);
  gidLink(cast(void**)&gst_gl_format_type_n_bytes, "gst_gl_format_type_n_bytes", libs);

  // GLPlatform
  gidLink(cast(void**)&gst_gl_platform_from_string, "gst_gl_platform_from_string", libs);
  gidLink(cast(void**)&gst_gl_platform_to_string, "gst_gl_platform_to_string", libs);

  // GLSLError
  gidLink(cast(void**)&gst_glsl_error_quark, "gst_glsl_error_quark", libs);

  // GLSLProfile
  gidLink(cast(void**)&gst_glsl_profile_from_string, "gst_glsl_profile_from_string", libs);
  gidLink(cast(void**)&gst_glsl_profile_to_string, "gst_glsl_profile_to_string", libs);

  // GLSLVersion
  gidLink(cast(void**)&gst_glsl_version_from_string, "gst_glsl_version_from_string", libs);
  gidLink(cast(void**)&gst_glsl_version_profile_from_string, "gst_glsl_version_profile_from_string", libs);
  gidLink(cast(void**)&gst_glsl_version_profile_to_string, "gst_glsl_version_profile_to_string", libs);
  gidLink(cast(void**)&gst_glsl_version_to_string, "gst_glsl_version_to_string", libs);

  // GLTextureTarget
  gidLink(cast(void**)&gst_gl_texture_target_from_gl, "gst_gl_texture_target_from_gl", libs);
  gidLink(cast(void**)&gst_gl_texture_target_from_string, "gst_gl_texture_target_from_string", libs);
  gidLink(cast(void**)&gst_gl_texture_target_to_buffer_pool_option, "gst_gl_texture_target_to_buffer_pool_option", libs);
  gidLink(cast(void**)&gst_gl_texture_target_to_gl, "gst_gl_texture_target_to_gl", libs);
  gidLink(cast(void**)&gst_gl_texture_target_to_string, "gst_gl_texture_target_to_string", libs);

  // GLWindowError
  gidLink(cast(void**)&gst_gl_window_error_quark, "gst_gl_window_error_quark", libs);
}
