/// C functions for gstgl1 library
module gid.gstgl1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstgl1.c.types;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstvideo1.c.types;

private immutable LIBS = ["gstgl-1.0_0"];

// GLAllocationParams
private alias c_gst_gl_allocation_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_allocation_params_get_typeFn c_gst_gl_allocation_params_get_type; ///
private alias c_gst_gl_allocation_params_copyFn = extern(C) GstGLAllocationParams* function(GstGLAllocationParams* src) nothrow;
__gshared c_gst_gl_allocation_params_copyFn c_gst_gl_allocation_params_copy; ///
private alias c_gst_gl_allocation_params_copy_dataFn = extern(C) void function(GstGLAllocationParams* src, GstGLAllocationParams* dest) nothrow;
__gshared c_gst_gl_allocation_params_copy_dataFn c_gst_gl_allocation_params_copy_data; ///
private alias c_gst_gl_allocation_params_freeFn = extern(C) void function(GstGLAllocationParams* params) nothrow;
__gshared c_gst_gl_allocation_params_freeFn c_gst_gl_allocation_params_free; ///
private alias c_gst_gl_allocation_params_free_dataFn = extern(C) void function(GstGLAllocationParams* params) nothrow;
__gshared c_gst_gl_allocation_params_free_dataFn c_gst_gl_allocation_params_free_data; ///
private alias c_gst_gl_allocation_params_initFn = extern(C) gboolean function(GstGLAllocationParams* params, size_t structSize, uint allocFlags, GstGLAllocationParamsCopyFunc copy, GstGLAllocationParamsFreeFunc free, GstGLContext* context, size_t allocSize, const(GstAllocationParams)* allocParams, void* wrappedData, void* glHandle, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_allocation_params_initFn c_gst_gl_allocation_params_init; ///

// GLAsyncDebug
private alias c_gst_gl_async_debug_freeFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_freeFn c_gst_gl_async_debug_free; ///
private alias c_gst_gl_async_debug_freezeFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_freezeFn c_gst_gl_async_debug_freeze; ///
private alias c_gst_gl_async_debug_initFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_initFn c_gst_gl_async_debug_init; ///
private alias c_gst_gl_async_debug_output_log_msgFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_output_log_msgFn c_gst_gl_async_debug_output_log_msg; ///
private alias c_gst_gl_async_debug_store_log_msgFn = extern(C) void function(GstGLAsyncDebug* ad, GstDebugCategory* cat, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format,  ...) nothrow;
__gshared c_gst_gl_async_debug_store_log_msgFn c_gst_gl_async_debug_store_log_msg; ///
private alias c_gst_gl_async_debug_store_log_msg_valistFn = extern(C) void function(GstGLAsyncDebug* ad, GstDebugCategory* cat, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format, void* varargs) nothrow;
__gshared c_gst_gl_async_debug_store_log_msg_valistFn c_gst_gl_async_debug_store_log_msg_valist; ///
private alias c_gst_gl_async_debug_thawFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_thawFn c_gst_gl_async_debug_thaw; ///
private alias c_gst_gl_async_debug_unsetFn = extern(C) void function(GstGLAsyncDebug* ad) nothrow;
__gshared c_gst_gl_async_debug_unsetFn c_gst_gl_async_debug_unset; ///
private alias c_gst_gl_async_debug_newFn = extern(C) GstGLAsyncDebug* function() nothrow;
__gshared c_gst_gl_async_debug_newFn c_gst_gl_async_debug_new; ///

// GLBaseFilter
private alias c_gst_gl_base_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_filter_get_typeFn c_gst_gl_base_filter_get_type; ///
private alias c_gst_gl_base_filter_find_gl_contextFn = extern(C) gboolean function(GstGLBaseFilter* filter) nothrow;
__gshared c_gst_gl_base_filter_find_gl_contextFn c_gst_gl_base_filter_find_gl_context; ///
private alias c_gst_gl_base_filter_get_gl_contextFn = extern(C) GstGLContext* function(GstGLBaseFilter* filter) nothrow;
__gshared c_gst_gl_base_filter_get_gl_contextFn c_gst_gl_base_filter_get_gl_context; ///

// GLBaseMemory
private alias c_gst_gl_base_memory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_memory_get_typeFn c_gst_gl_base_memory_get_type; ///
private alias c_gst_gl_base_memory_alloc_dataFn = extern(C) gboolean function(GstGLBaseMemory* glMem) nothrow;
__gshared c_gst_gl_base_memory_alloc_dataFn c_gst_gl_base_memory_alloc_data; ///
private alias c_gst_gl_base_memory_initFn = extern(C) void function(GstGLBaseMemory* mem, GstAllocator* allocator, GstMemory* parent, GstGLContext* context, const(GstAllocationParams)* params, size_t size, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_base_memory_initFn c_gst_gl_base_memory_init; ///
private alias c_gst_gl_base_memory_memcpyFn = extern(C) gboolean function(GstGLBaseMemory* src, GstGLBaseMemory* dest, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_gl_base_memory_memcpyFn c_gst_gl_base_memory_memcpy; ///
private alias c_gst_gl_base_memory_allocFn = extern(C) GstGLBaseMemory* function(GstGLBaseMemoryAllocator* allocator, GstGLAllocationParams* params) nothrow;
__gshared c_gst_gl_base_memory_allocFn c_gst_gl_base_memory_alloc; ///
private alias c_gst_gl_base_memory_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_base_memory_init_onceFn c_gst_gl_base_memory_init_once; ///

// GLBaseMemoryAllocator
private alias c_gst_gl_base_memory_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_memory_allocator_get_typeFn c_gst_gl_base_memory_allocator_get_type; ///

// GLBaseMixer
private alias c_gst_gl_base_mixer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_mixer_get_typeFn c_gst_gl_base_mixer_get_type; ///
private alias c_gst_gl_base_mixer_get_gl_contextFn = extern(C) GstGLContext* function(GstGLBaseMixer* mix) nothrow;
__gshared c_gst_gl_base_mixer_get_gl_contextFn c_gst_gl_base_mixer_get_gl_context; ///

// GLBaseMixerPad
private alias c_gst_gl_base_mixer_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_mixer_pad_get_typeFn c_gst_gl_base_mixer_pad_get_type; ///

// GLBaseSrc
private alias c_gst_gl_base_src_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_base_src_get_typeFn c_gst_gl_base_src_get_type; ///
private alias c_gst_gl_base_src_get_gl_contextFn = extern(C) GstGLContext* function(GstGLBaseSrc* baseSrc) nothrow;
__gshared c_gst_gl_base_src_get_gl_contextFn c_gst_gl_base_src_get_gl_context; ///

// GLBuffer
private alias c_gst_gl_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_buffer_get_typeFn c_gst_gl_buffer_get_type; ///
private alias c_gst_gl_buffer_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_buffer_init_onceFn c_gst_gl_buffer_init_once; ///

// GLBufferAllocationParams
private alias c_gst_gl_buffer_allocation_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_buffer_allocation_params_get_typeFn c_gst_gl_buffer_allocation_params_get_type; ///
private alias c_gst_gl_buffer_allocation_params_newFn = extern(C) GstGLBufferAllocationParams* function(GstGLContext* context, size_t allocSize, const(GstAllocationParams)* allocParams, uint glTarget, uint glUsage) nothrow;
__gshared c_gst_gl_buffer_allocation_params_newFn c_gst_gl_buffer_allocation_params_new; ///

// GLBufferAllocator
private alias c_gst_gl_buffer_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_buffer_allocator_get_typeFn c_gst_gl_buffer_allocator_get_type; ///

// GLBufferPool
private alias c_gst_gl_buffer_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_buffer_pool_get_typeFn c_gst_gl_buffer_pool_get_type; ///
private alias c_gst_gl_buffer_pool_newFn = extern(C) GstBufferPool* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_buffer_pool_newFn c_gst_gl_buffer_pool_new; ///
private alias c_gst_gl_buffer_pool_get_gl_allocation_paramsFn = extern(C) GstGLAllocationParams* function(GstGLBufferPool* pool) nothrow;
__gshared c_gst_gl_buffer_pool_get_gl_allocation_paramsFn c_gst_gl_buffer_pool_get_gl_allocation_params; ///

// GLColorConvert
private alias c_gst_gl_color_convert_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_color_convert_get_typeFn c_gst_gl_color_convert_get_type; ///
private alias c_gst_gl_color_convert_newFn = extern(C) GstGLColorConvert* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_color_convert_newFn c_gst_gl_color_convert_new; ///
private alias c_gst_gl_color_convert_fixate_capsFn = extern(C) GstCaps* function(GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* other) nothrow;
__gshared c_gst_gl_color_convert_fixate_capsFn c_gst_gl_color_convert_fixate_caps; ///
private alias c_gst_gl_color_convert_swizzle_shader_stringFn = extern(C) char* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_color_convert_swizzle_shader_stringFn c_gst_gl_color_convert_swizzle_shader_string; ///
private alias c_gst_gl_color_convert_transform_capsFn = extern(C) GstCaps* function(GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_gl_color_convert_transform_capsFn c_gst_gl_color_convert_transform_caps; ///
private alias c_gst_gl_color_convert_yuv_to_rgb_shader_stringFn = extern(C) char* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_color_convert_yuv_to_rgb_shader_stringFn c_gst_gl_color_convert_yuv_to_rgb_shader_string; ///
private alias c_gst_gl_color_convert_decide_allocationFn = extern(C) gboolean function(GstGLColorConvert* convert, GstQuery* query) nothrow;
__gshared c_gst_gl_color_convert_decide_allocationFn c_gst_gl_color_convert_decide_allocation; ///
private alias c_gst_gl_color_convert_performFn = extern(C) GstBuffer* function(GstGLColorConvert* convert, GstBuffer* inbuf) nothrow;
__gshared c_gst_gl_color_convert_performFn c_gst_gl_color_convert_perform; ///
private alias c_gst_gl_color_convert_set_capsFn = extern(C) gboolean function(GstGLColorConvert* convert, GstCaps* inCaps, GstCaps* outCaps) nothrow;
__gshared c_gst_gl_color_convert_set_capsFn c_gst_gl_color_convert_set_caps; ///

// GLContext
private alias c_gst_gl_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_context_get_typeFn c_gst_gl_context_get_type; ///
private alias c_gst_gl_context_newFn = extern(C) GstGLContext* function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_context_newFn c_gst_gl_context_new; ///
private alias c_gst_gl_context_new_wrappedFn = extern(C) GstGLContext* function(GstGLDisplay* display, size_t handle, GstGLPlatform contextType, GstGLAPI availableApis) nothrow;
__gshared c_gst_gl_context_new_wrappedFn c_gst_gl_context_new_wrapped; ///
private alias c_gst_gl_context_default_get_proc_addressFn = extern(C) void* function(GstGLAPI glApi, const(char)* name) nothrow;
__gshared c_gst_gl_context_default_get_proc_addressFn c_gst_gl_context_default_get_proc_address; ///
private alias c_gst_gl_context_get_currentFn = extern(C) GstGLContext* function() nothrow;
__gshared c_gst_gl_context_get_currentFn c_gst_gl_context_get_current; ///
private alias c_gst_gl_context_get_current_gl_apiFn = extern(C) GstGLAPI function(GstGLPlatform platform, uint* major, uint* minor) nothrow;
__gshared c_gst_gl_context_get_current_gl_apiFn c_gst_gl_context_get_current_gl_api; ///
private alias c_gst_gl_context_get_current_gl_contextFn = extern(C) size_t function(GstGLPlatform contextType) nothrow;
__gshared c_gst_gl_context_get_current_gl_contextFn c_gst_gl_context_get_current_gl_context; ///
private alias c_gst_gl_context_get_proc_address_with_platformFn = extern(C) void* function(GstGLPlatform contextType, GstGLAPI glApi, const(char)* name) nothrow;
__gshared c_gst_gl_context_get_proc_address_with_platformFn c_gst_gl_context_get_proc_address_with_platform; ///
private alias c_gst_gl_context_activateFn = extern(C) gboolean function(GstGLContext* context, gboolean activate) nothrow;
__gshared c_gst_gl_context_activateFn c_gst_gl_context_activate; ///
private alias c_gst_gl_context_can_shareFn = extern(C) gboolean function(GstGLContext* context, GstGLContext* otherContext) nothrow;
__gshared c_gst_gl_context_can_shareFn c_gst_gl_context_can_share; ///
private alias c_gst_gl_context_check_featureFn = extern(C) gboolean function(GstGLContext* context, const(char)* feature) nothrow;
__gshared c_gst_gl_context_check_featureFn c_gst_gl_context_check_feature; ///
private alias c_gst_gl_context_check_framebuffer_statusFn = extern(C) gboolean function(GstGLContext* context, uint fboTarget) nothrow;
__gshared c_gst_gl_context_check_framebuffer_statusFn c_gst_gl_context_check_framebuffer_status; ///
private alias c_gst_gl_context_check_gl_versionFn = extern(C) gboolean function(GstGLContext* context, GstGLAPI api, int maj, int min) nothrow;
__gshared c_gst_gl_context_check_gl_versionFn c_gst_gl_context_check_gl_version; ///
private alias c_gst_gl_context_clear_framebufferFn = extern(C) void function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_clear_framebufferFn c_gst_gl_context_clear_framebuffer; ///
private alias c_gst_gl_context_clear_shaderFn = extern(C) void function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_clear_shaderFn c_gst_gl_context_clear_shader; ///
private alias c_gst_gl_context_createFn = extern(C) gboolean function(GstGLContext* context, GstGLContext* otherContext, GError** _err) nothrow;
__gshared c_gst_gl_context_createFn c_gst_gl_context_create; ///
private alias c_gst_gl_context_destroyFn = extern(C) void function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_destroyFn c_gst_gl_context_destroy; ///
private alias c_gst_gl_context_fill_infoFn = extern(C) gboolean function(GstGLContext* context, GError** _err) nothrow;
__gshared c_gst_gl_context_fill_infoFn c_gst_gl_context_fill_info; ///
private alias c_gst_gl_context_get_configFn = extern(C) GstStructure* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_configFn c_gst_gl_context_get_config; ///
private alias c_gst_gl_context_get_displayFn = extern(C) GstGLDisplay* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_displayFn c_gst_gl_context_get_display; ///
private alias c_gst_gl_context_get_gl_apiFn = extern(C) GstGLAPI function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_gl_apiFn c_gst_gl_context_get_gl_api; ///
private alias c_gst_gl_context_get_gl_contextFn = extern(C) size_t function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_gl_contextFn c_gst_gl_context_get_gl_context; ///
private alias c_gst_gl_context_get_gl_platformFn = extern(C) GstGLPlatform function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_gl_platformFn c_gst_gl_context_get_gl_platform; ///
private alias c_gst_gl_context_get_gl_platform_versionFn = extern(C) void function(GstGLContext* context, int* major, int* minor) nothrow;
__gshared c_gst_gl_context_get_gl_platform_versionFn c_gst_gl_context_get_gl_platform_version; ///
private alias c_gst_gl_context_get_gl_versionFn = extern(C) void function(GstGLContext* context, int* maj, int* min) nothrow;
__gshared c_gst_gl_context_get_gl_versionFn c_gst_gl_context_get_gl_version; ///
private alias c_gst_gl_context_get_proc_addressFn = extern(C) void* function(GstGLContext* context, const(char)* name) nothrow;
__gshared c_gst_gl_context_get_proc_addressFn c_gst_gl_context_get_proc_address; ///
private alias c_gst_gl_context_get_threadFn = extern(C) GThread* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_threadFn c_gst_gl_context_get_thread; ///
private alias c_gst_gl_context_get_windowFn = extern(C) GstGLWindow* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_get_windowFn c_gst_gl_context_get_window; ///
private alias c_gst_gl_context_is_sharedFn = extern(C) gboolean function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_is_sharedFn c_gst_gl_context_is_shared; ///
private alias c_gst_gl_context_request_configFn = extern(C) gboolean function(GstGLContext* context, GstStructure* glConfig) nothrow;
__gshared c_gst_gl_context_request_configFn c_gst_gl_context_request_config; ///
private alias c_gst_gl_context_set_shared_withFn = extern(C) void function(GstGLContext* context, GstGLContext* share) nothrow;
__gshared c_gst_gl_context_set_shared_withFn c_gst_gl_context_set_shared_with; ///
private alias c_gst_gl_context_set_windowFn = extern(C) gboolean function(GstGLContext* context, GstGLWindow* window) nothrow;
__gshared c_gst_gl_context_set_windowFn c_gst_gl_context_set_window; ///
private alias c_gst_gl_context_supports_glsl_profile_versionFn = extern(C) gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_context_supports_glsl_profile_versionFn c_gst_gl_context_supports_glsl_profile_version; ///
private alias c_gst_gl_context_supports_precisionFn = extern(C) gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_context_supports_precisionFn c_gst_gl_context_supports_precision; ///
private alias c_gst_gl_context_supports_precision_highpFn = extern(C) gboolean function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_context_supports_precision_highpFn c_gst_gl_context_supports_precision_highp; ///
private alias c_gst_gl_context_swap_buffersFn = extern(C) void function(GstGLContext* context) nothrow;
__gshared c_gst_gl_context_swap_buffersFn c_gst_gl_context_swap_buffers; ///
private alias c_gst_gl_context_thread_addFn = extern(C) void function(GstGLContext* context, GstGLContextThreadFunc func, void* data) nothrow;
__gshared c_gst_gl_context_thread_addFn c_gst_gl_context_thread_add; ///

// GLDisplay
private alias c_gst_gl_display_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_display_get_typeFn c_gst_gl_display_get_type; ///
private alias c_gst_gl_display_newFn = extern(C) GstGLDisplay* function() nothrow;
__gshared c_gst_gl_display_newFn c_gst_gl_display_new; ///
private alias c_gst_gl_display_new_with_typeFn = extern(C) GstGLDisplay* function(GstGLDisplayType type) nothrow;
__gshared c_gst_gl_display_new_with_typeFn c_gst_gl_display_new_with_type; ///
private alias c_gst_gl_display_add_contextFn = extern(C) gboolean function(GstGLDisplay* display, GstGLContext* context) nothrow;
__gshared c_gst_gl_display_add_contextFn c_gst_gl_display_add_context; ///
private alias c_gst_gl_display_create_contextFn = extern(C) gboolean function(GstGLDisplay* display, GstGLContext* otherContext, GstGLContext** pContext, GError** _err) nothrow;
__gshared c_gst_gl_display_create_contextFn c_gst_gl_display_create_context; ///
private alias c_gst_gl_display_create_windowFn = extern(C) GstGLWindow* function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_create_windowFn c_gst_gl_display_create_window; ///
private alias c_gst_gl_display_ensure_contextFn = extern(C) gboolean function(GstGLDisplay* display, GstGLContext* otherContext, GstGLContext** context, GError** _err) nothrow;
__gshared c_gst_gl_display_ensure_contextFn c_gst_gl_display_ensure_context; ///
private alias c_gst_gl_display_filter_gl_apiFn = extern(C) void function(GstGLDisplay* display, GstGLAPI glApi) nothrow;
__gshared c_gst_gl_display_filter_gl_apiFn c_gst_gl_display_filter_gl_api; ///
private alias c_gst_gl_display_find_windowFn = extern(C) GstGLWindow* function(GstGLDisplay* display, void* data, GCompareFunc compareFunc) nothrow;
__gshared c_gst_gl_display_find_windowFn c_gst_gl_display_find_window; ///
private alias c_gst_gl_display_get_gl_apiFn = extern(C) GstGLAPI function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_get_gl_apiFn c_gst_gl_display_get_gl_api; ///
private alias c_gst_gl_display_get_gl_api_unlockedFn = extern(C) GstGLAPI function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_get_gl_api_unlockedFn c_gst_gl_display_get_gl_api_unlocked; ///
private alias c_gst_gl_display_get_gl_context_for_threadFn = extern(C) GstGLContext* function(GstGLDisplay* display, GThread* thread) nothrow;
__gshared c_gst_gl_display_get_gl_context_for_threadFn c_gst_gl_display_get_gl_context_for_thread; ///
private alias c_gst_gl_display_get_handleFn = extern(C) size_t function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_get_handleFn c_gst_gl_display_get_handle; ///
private alias c_gst_gl_display_get_handle_typeFn = extern(C) GstGLDisplayType function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_display_get_handle_typeFn c_gst_gl_display_get_handle_type; ///
private alias c_gst_gl_display_remove_contextFn = extern(C) void function(GstGLDisplay* display, GstGLContext* context) nothrow;
__gshared c_gst_gl_display_remove_contextFn c_gst_gl_display_remove_context; ///
private alias c_gst_gl_display_remove_windowFn = extern(C) gboolean function(GstGLDisplay* display, GstGLWindow* window) nothrow;
__gshared c_gst_gl_display_remove_windowFn c_gst_gl_display_remove_window; ///
private alias c_gst_gl_display_retrieve_windowFn = extern(C) GstGLWindow* function(GstGLDisplay* display, void* data, GCompareFunc compareFunc) nothrow;
__gshared c_gst_gl_display_retrieve_windowFn c_gst_gl_display_retrieve_window; ///

// GLFilter
private alias c_gst_gl_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_filter_get_typeFn c_gst_gl_filter_get_type; ///
private alias c_gst_gl_filter_add_rgba_pad_templatesFn = extern(C) void function(GstGLFilterClass* klass) nothrow;
__gshared c_gst_gl_filter_add_rgba_pad_templatesFn c_gst_gl_filter_add_rgba_pad_templates; ///
private alias c_gst_gl_filter_draw_fullscreen_quadFn = extern(C) void function(GstGLFilter* filter) nothrow;
__gshared c_gst_gl_filter_draw_fullscreen_quadFn c_gst_gl_filter_draw_fullscreen_quad; ///
private alias c_gst_gl_filter_filter_textureFn = extern(C) gboolean function(GstGLFilter* filter, GstBuffer* input, GstBuffer* output) nothrow;
__gshared c_gst_gl_filter_filter_textureFn c_gst_gl_filter_filter_texture; ///
private alias c_gst_gl_filter_render_to_targetFn = extern(C) gboolean function(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output, GstGLFilterRenderFunc func, void* data) nothrow;
__gshared c_gst_gl_filter_render_to_targetFn c_gst_gl_filter_render_to_target; ///
private alias c_gst_gl_filter_render_to_target_with_shaderFn = extern(C) void function(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output, GstGLShader* shader) nothrow;
__gshared c_gst_gl_filter_render_to_target_with_shaderFn c_gst_gl_filter_render_to_target_with_shader; ///

// GLFramebuffer
private alias c_gst_gl_framebuffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_framebuffer_get_typeFn c_gst_gl_framebuffer_get_type; ///
private alias c_gst_gl_framebuffer_newFn = extern(C) GstGLFramebuffer* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_framebuffer_newFn c_gst_gl_framebuffer_new; ///
private alias c_gst_gl_framebuffer_new_with_default_depthFn = extern(C) GstGLFramebuffer* function(GstGLContext* context, uint width, uint height) nothrow;
__gshared c_gst_gl_framebuffer_new_with_default_depthFn c_gst_gl_framebuffer_new_with_default_depth; ///
private alias c_gst_gl_framebuffer_attachFn = extern(C) void function(GstGLFramebuffer* fb, uint attachmentPoint, GstGLBaseMemory* mem) nothrow;
__gshared c_gst_gl_framebuffer_attachFn c_gst_gl_framebuffer_attach; ///
private alias c_gst_gl_framebuffer_bindFn = extern(C) void function(GstGLFramebuffer* fb) nothrow;
__gshared c_gst_gl_framebuffer_bindFn c_gst_gl_framebuffer_bind; ///
private alias c_gst_gl_framebuffer_draw_to_textureFn = extern(C) gboolean function(GstGLFramebuffer* fb, GstGLMemory* mem, GstGLFramebufferFunc func, void* userData) nothrow;
__gshared c_gst_gl_framebuffer_draw_to_textureFn c_gst_gl_framebuffer_draw_to_texture; ///
private alias c_gst_gl_framebuffer_get_effective_dimensionsFn = extern(C) void function(GstGLFramebuffer* fb, uint* width, uint* height) nothrow;
__gshared c_gst_gl_framebuffer_get_effective_dimensionsFn c_gst_gl_framebuffer_get_effective_dimensions; ///
private alias c_gst_gl_framebuffer_get_idFn = extern(C) uint function(GstGLFramebuffer* fb) nothrow;
__gshared c_gst_gl_framebuffer_get_idFn c_gst_gl_framebuffer_get_id; ///

// GLMemory
private alias c_gst_gl_memory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_get_typeFn c_gst_gl_memory_get_type; ///
private alias c_gst_gl_memory_copy_intoFn = extern(C) gboolean function(GstGLMemory* glMem, uint texId, GstGLTextureTarget target, GstGLFormat texFormat, int width, int height) nothrow;
__gshared c_gst_gl_memory_copy_intoFn c_gst_gl_memory_copy_into; ///
private alias c_gst_gl_memory_copy_teximageFn = extern(C) gboolean function(GstGLMemory* src, uint texId, GstGLTextureTarget outTarget, GstGLFormat outTexFormat, int outWidth, int outHeight) nothrow;
__gshared c_gst_gl_memory_copy_teximageFn c_gst_gl_memory_copy_teximage; ///
private alias c_gst_gl_memory_get_texture_formatFn = extern(C) GstGLFormat function(GstGLMemory* glMem) nothrow;
__gshared c_gst_gl_memory_get_texture_formatFn c_gst_gl_memory_get_texture_format; ///
private alias c_gst_gl_memory_get_texture_heightFn = extern(C) int function(GstGLMemory* glMem) nothrow;
__gshared c_gst_gl_memory_get_texture_heightFn c_gst_gl_memory_get_texture_height; ///
private alias c_gst_gl_memory_get_texture_idFn = extern(C) uint function(GstGLMemory* glMem) nothrow;
__gshared c_gst_gl_memory_get_texture_idFn c_gst_gl_memory_get_texture_id; ///
private alias c_gst_gl_memory_get_texture_targetFn = extern(C) GstGLTextureTarget function(GstGLMemory* glMem) nothrow;
__gshared c_gst_gl_memory_get_texture_targetFn c_gst_gl_memory_get_texture_target; ///
private alias c_gst_gl_memory_get_texture_widthFn = extern(C) int function(GstGLMemory* glMem) nothrow;
__gshared c_gst_gl_memory_get_texture_widthFn c_gst_gl_memory_get_texture_width; ///
private alias c_gst_gl_memory_initFn = extern(C) void function(GstGLMemory* mem, GstAllocator* allocator, GstMemory* parent, GstGLContext* context, GstGLTextureTarget target, GstGLFormat texFormat, const(GstAllocationParams)* params, const(GstVideoInfo)* info, uint plane, const(GstVideoAlignment)* valign, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_memory_initFn c_gst_gl_memory_init; ///
private alias c_gst_gl_memory_read_pixelsFn = extern(C) gboolean function(GstGLMemory* glMem, void* writePointer) nothrow;
__gshared c_gst_gl_memory_read_pixelsFn c_gst_gl_memory_read_pixels; ///
private alias c_gst_gl_memory_texsubimageFn = extern(C) void function(GstGLMemory* glMem, void* readPointer) nothrow;
__gshared c_gst_gl_memory_texsubimageFn c_gst_gl_memory_texsubimage; ///
private alias c_gst_gl_memory_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_memory_init_onceFn c_gst_gl_memory_init_once; ///
private alias c_gst_gl_memory_setup_bufferFn = extern(C) gboolean function(GstGLMemoryAllocator* allocator, GstBuffer* buffer, GstGLVideoAllocationParams* params, GstGLFormat* texFormats, void** wrappedData, size_t nWrappedPointers) nothrow;
__gshared c_gst_gl_memory_setup_bufferFn c_gst_gl_memory_setup_buffer; ///

// GLMemoryAllocator
private alias c_gst_gl_memory_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_allocator_get_typeFn c_gst_gl_memory_allocator_get_type; ///
private alias c_gst_gl_memory_allocator_get_defaultFn = extern(C) GstGLMemoryAllocator* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_memory_allocator_get_defaultFn c_gst_gl_memory_allocator_get_default; ///

// GLMemoryPBO
private alias c_gst_gl_memory_pbo_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_pbo_get_typeFn c_gst_gl_memory_pbo_get_type; ///
private alias c_gst_gl_memory_pbo_copy_into_textureFn = extern(C) gboolean function(GstGLMemoryPBO* glMem, uint texId, GstGLTextureTarget target, GstGLFormat texFormat, int width, int height, int stride, gboolean respecify) nothrow;
__gshared c_gst_gl_memory_pbo_copy_into_textureFn c_gst_gl_memory_pbo_copy_into_texture; ///
private alias c_gst_gl_memory_pbo_download_transferFn = extern(C) void function(GstGLMemoryPBO* glMem) nothrow;
__gshared c_gst_gl_memory_pbo_download_transferFn c_gst_gl_memory_pbo_download_transfer; ///
private alias c_gst_gl_memory_pbo_upload_transferFn = extern(C) void function(GstGLMemoryPBO* glMem) nothrow;
__gshared c_gst_gl_memory_pbo_upload_transferFn c_gst_gl_memory_pbo_upload_transfer; ///
private alias c_gst_gl_memory_pbo_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_memory_pbo_init_onceFn c_gst_gl_memory_pbo_init_once; ///

// GLMemoryPBOAllocator
private alias c_gst_gl_memory_pbo_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_memory_pbo_allocator_get_typeFn c_gst_gl_memory_pbo_allocator_get_type; ///

// GLMixer
private alias c_gst_gl_mixer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_mixer_get_typeFn c_gst_gl_mixer_get_type; ///
private alias c_gst_gl_mixer_get_framebufferFn = extern(C) GstGLFramebuffer* function(GstGLMixer* mix) nothrow;
__gshared c_gst_gl_mixer_get_framebufferFn c_gst_gl_mixer_get_framebuffer; ///
private alias c_gst_gl_mixer_process_texturesFn = extern(C) gboolean function(GstGLMixer* mix, GstBuffer* outbuf) nothrow;
__gshared c_gst_gl_mixer_process_texturesFn c_gst_gl_mixer_process_textures; ///

// GLMixerClass
private alias c_gst_gl_mixer_class_add_rgba_pad_templatesFn = extern(C) void function(GstGLMixerClass* klass) nothrow;
__gshared c_gst_gl_mixer_class_add_rgba_pad_templatesFn c_gst_gl_mixer_class_add_rgba_pad_templates; ///

// GLMixerPad
private alias c_gst_gl_mixer_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_mixer_pad_get_typeFn c_gst_gl_mixer_pad_get_type; ///

// GLOverlayCompositor
private alias c_gst_gl_overlay_compositor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_overlay_compositor_get_typeFn c_gst_gl_overlay_compositor_get_type; ///
private alias c_gst_gl_overlay_compositor_newFn = extern(C) GstGLOverlayCompositor* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_overlay_compositor_newFn c_gst_gl_overlay_compositor_new; ///
private alias c_gst_gl_overlay_compositor_add_capsFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_gl_overlay_compositor_add_capsFn c_gst_gl_overlay_compositor_add_caps; ///
private alias c_gst_gl_overlay_compositor_draw_overlaysFn = extern(C) void function(GstGLOverlayCompositor* compositor) nothrow;
__gshared c_gst_gl_overlay_compositor_draw_overlaysFn c_gst_gl_overlay_compositor_draw_overlays; ///
private alias c_gst_gl_overlay_compositor_free_overlaysFn = extern(C) void function(GstGLOverlayCompositor* compositor) nothrow;
__gshared c_gst_gl_overlay_compositor_free_overlaysFn c_gst_gl_overlay_compositor_free_overlays; ///
private alias c_gst_gl_overlay_compositor_upload_overlaysFn = extern(C) void function(GstGLOverlayCompositor* compositor, GstBuffer* buf) nothrow;
__gshared c_gst_gl_overlay_compositor_upload_overlaysFn c_gst_gl_overlay_compositor_upload_overlays; ///

// GLQuery
private alias c_gst_gl_query_counterFn = extern(C) void function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_counterFn c_gst_gl_query_counter; ///
private alias c_gst_gl_query_endFn = extern(C) void function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_endFn c_gst_gl_query_end; ///
private alias c_gst_gl_query_freeFn = extern(C) void function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_freeFn c_gst_gl_query_free; ///
private alias c_gst_gl_query_initFn = extern(C) void function(GstGLQuery* query, GstGLContext* context, GstGLQueryType queryType) nothrow;
__gshared c_gst_gl_query_initFn c_gst_gl_query_init; ///
private alias c_gst_gl_query_resultFn = extern(C) ulong function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_resultFn c_gst_gl_query_result; ///
private alias c_gst_gl_query_startFn = extern(C) void function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_startFn c_gst_gl_query_start; ///
private alias c_gst_gl_query_unsetFn = extern(C) void function(GstGLQuery* query) nothrow;
__gshared c_gst_gl_query_unsetFn c_gst_gl_query_unset; ///
private alias c_gst_gl_query_local_gl_contextFn = extern(C) gboolean function(GstElement* element, GstPadDirection direction, GstGLContext** contextPtr) nothrow;
__gshared c_gst_gl_query_local_gl_contextFn c_gst_gl_query_local_gl_context; ///
private alias c_gst_gl_query_newFn = extern(C) GstGLQuery* function(GstGLContext* context, GstGLQueryType queryType) nothrow;
__gshared c_gst_gl_query_newFn c_gst_gl_query_new; ///

// GLRenderbuffer
private alias c_gst_gl_renderbuffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_renderbuffer_get_typeFn c_gst_gl_renderbuffer_get_type; ///
private alias c_gst_gl_renderbuffer_get_formatFn = extern(C) GstGLFormat function(GstGLRenderbuffer* glMem) nothrow;
__gshared c_gst_gl_renderbuffer_get_formatFn c_gst_gl_renderbuffer_get_format; ///
private alias c_gst_gl_renderbuffer_get_heightFn = extern(C) int function(GstGLRenderbuffer* glMem) nothrow;
__gshared c_gst_gl_renderbuffer_get_heightFn c_gst_gl_renderbuffer_get_height; ///
private alias c_gst_gl_renderbuffer_get_idFn = extern(C) uint function(GstGLRenderbuffer* glMem) nothrow;
__gshared c_gst_gl_renderbuffer_get_idFn c_gst_gl_renderbuffer_get_id; ///
private alias c_gst_gl_renderbuffer_get_widthFn = extern(C) int function(GstGLRenderbuffer* glMem) nothrow;
__gshared c_gst_gl_renderbuffer_get_widthFn c_gst_gl_renderbuffer_get_width; ///
private alias c_gst_gl_renderbuffer_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_gl_renderbuffer_init_onceFn c_gst_gl_renderbuffer_init_once; ///

// GLRenderbufferAllocationParams
private alias c_gst_gl_renderbuffer_allocation_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_renderbuffer_allocation_params_get_typeFn c_gst_gl_renderbuffer_allocation_params_get_type; ///
private alias c_gst_gl_renderbuffer_allocation_params_newFn = extern(C) GstGLRenderbufferAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, GstGLFormat renderbufferFormat, uint width, uint height) nothrow;
__gshared c_gst_gl_renderbuffer_allocation_params_newFn c_gst_gl_renderbuffer_allocation_params_new; ///
private alias c_gst_gl_renderbuffer_allocation_params_new_wrappedFn = extern(C) GstGLRenderbufferAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, GstGLFormat renderbufferFormat, uint width, uint height, void* glHandle, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_renderbuffer_allocation_params_new_wrappedFn c_gst_gl_renderbuffer_allocation_params_new_wrapped; ///

// GLRenderbufferAllocator
private alias c_gst_gl_renderbuffer_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_renderbuffer_allocator_get_typeFn c_gst_gl_renderbuffer_allocator_get_type; ///

// GLSLStage
private alias c_gst_glsl_stage_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_glsl_stage_get_typeFn c_gst_glsl_stage_get_type; ///
private alias c_gst_glsl_stage_newFn = extern(C) GstGLSLStage* function(GstGLContext* context, uint type) nothrow;
__gshared c_gst_glsl_stage_newFn c_gst_glsl_stage_new; ///
private alias c_gst_glsl_stage_new_default_fragmentFn = extern(C) GstGLSLStage* function(GstGLContext* context) nothrow;
__gshared c_gst_glsl_stage_new_default_fragmentFn c_gst_glsl_stage_new_default_fragment; ///
private alias c_gst_glsl_stage_new_default_vertexFn = extern(C) GstGLSLStage* function(GstGLContext* context) nothrow;
__gshared c_gst_glsl_stage_new_default_vertexFn c_gst_glsl_stage_new_default_vertex; ///
private alias c_gst_glsl_stage_new_with_stringFn = extern(C) GstGLSLStage* function(GstGLContext* context, uint type, GstGLSLVersion version_, GstGLSLProfile profile, const(char)* str) nothrow;
__gshared c_gst_glsl_stage_new_with_stringFn c_gst_glsl_stage_new_with_string; ///
private alias c_gst_glsl_stage_new_with_stringsFn = extern(C) GstGLSLStage* function(GstGLContext* context, uint type, GstGLSLVersion version_, GstGLSLProfile profile, int nStrings, const(char*)* str) nothrow;
__gshared c_gst_glsl_stage_new_with_stringsFn c_gst_glsl_stage_new_with_strings; ///
private alias c_gst_glsl_stage_compileFn = extern(C) gboolean function(GstGLSLStage* stage, GError** _err) nothrow;
__gshared c_gst_glsl_stage_compileFn c_gst_glsl_stage_compile; ///
private alias c_gst_glsl_stage_get_handleFn = extern(C) uint function(GstGLSLStage* stage) nothrow;
__gshared c_gst_glsl_stage_get_handleFn c_gst_glsl_stage_get_handle; ///
private alias c_gst_glsl_stage_get_profileFn = extern(C) GstGLSLProfile function(GstGLSLStage* stage) nothrow;
__gshared c_gst_glsl_stage_get_profileFn c_gst_glsl_stage_get_profile; ///
private alias c_gst_glsl_stage_get_shader_typeFn = extern(C) uint function(GstGLSLStage* stage) nothrow;
__gshared c_gst_glsl_stage_get_shader_typeFn c_gst_glsl_stage_get_shader_type; ///
private alias c_gst_glsl_stage_get_versionFn = extern(C) GstGLSLVersion function(GstGLSLStage* stage) nothrow;
__gshared c_gst_glsl_stage_get_versionFn c_gst_glsl_stage_get_version; ///
private alias c_gst_glsl_stage_set_stringsFn = extern(C) gboolean function(GstGLSLStage* stage, GstGLSLVersion version_, GstGLSLProfile profile, int nStrings, const(char*)* str) nothrow;
__gshared c_gst_glsl_stage_set_stringsFn c_gst_glsl_stage_set_strings; ///

// GLShader
private alias c_gst_gl_shader_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_shader_get_typeFn c_gst_gl_shader_get_type; ///
private alias c_gst_gl_shader_newFn = extern(C) GstGLShader* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_shader_newFn c_gst_gl_shader_new; ///
private alias c_gst_gl_shader_new_defaultFn = extern(C) GstGLShader* function(GstGLContext* context, GError** _err) nothrow;
__gshared c_gst_gl_shader_new_defaultFn c_gst_gl_shader_new_default; ///
private alias c_gst_gl_shader_new_link_with_stagesFn = extern(C) GstGLShader* function(GstGLContext* context, GError** error,  ...) nothrow;
__gshared c_gst_gl_shader_new_link_with_stagesFn c_gst_gl_shader_new_link_with_stages; ///
private alias c_gst_gl_shader_new_with_stagesFn = extern(C) GstGLShader* function(GstGLContext* context, GError** error,  ...) nothrow;
__gshared c_gst_gl_shader_new_with_stagesFn c_gst_gl_shader_new_with_stages; ///
private alias c_gst_gl_shader_string_fragment_external_oes_get_defaultFn = extern(C) char* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_shader_string_fragment_external_oes_get_defaultFn c_gst_gl_shader_string_fragment_external_oes_get_default; ///
private alias c_gst_gl_shader_string_fragment_get_defaultFn = extern(C) char* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_shader_string_fragment_get_defaultFn c_gst_gl_shader_string_fragment_get_default; ///
private alias c_gst_gl_shader_string_get_highest_precisionFn = extern(C) const(char)* function(GstGLContext* context, GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_gl_shader_string_get_highest_precisionFn c_gst_gl_shader_string_get_highest_precision; ///
private alias c_gst_gl_shader_attachFn = extern(C) gboolean function(GstGLShader* shader, GstGLSLStage* stage) nothrow;
__gshared c_gst_gl_shader_attachFn c_gst_gl_shader_attach; ///
private alias c_gst_gl_shader_attach_unlockedFn = extern(C) gboolean function(GstGLShader* shader, GstGLSLStage* stage) nothrow;
__gshared c_gst_gl_shader_attach_unlockedFn c_gst_gl_shader_attach_unlocked; ///
private alias c_gst_gl_shader_bind_attribute_locationFn = extern(C) void function(GstGLShader* shader, uint index, const(char)* name) nothrow;
__gshared c_gst_gl_shader_bind_attribute_locationFn c_gst_gl_shader_bind_attribute_location; ///
private alias c_gst_gl_shader_bind_frag_data_locationFn = extern(C) void function(GstGLShader* shader, uint index, const(char)* name) nothrow;
__gshared c_gst_gl_shader_bind_frag_data_locationFn c_gst_gl_shader_bind_frag_data_location; ///
private alias c_gst_gl_shader_compile_attach_stageFn = extern(C) gboolean function(GstGLShader* shader, GstGLSLStage* stage, GError** _err) nothrow;
__gshared c_gst_gl_shader_compile_attach_stageFn c_gst_gl_shader_compile_attach_stage; ///
private alias c_gst_gl_shader_detachFn = extern(C) void function(GstGLShader* shader, GstGLSLStage* stage) nothrow;
__gshared c_gst_gl_shader_detachFn c_gst_gl_shader_detach; ///
private alias c_gst_gl_shader_detach_unlockedFn = extern(C) void function(GstGLShader* shader, GstGLSLStage* stage) nothrow;
__gshared c_gst_gl_shader_detach_unlockedFn c_gst_gl_shader_detach_unlocked; ///
private alias c_gst_gl_shader_get_attribute_locationFn = extern(C) int function(GstGLShader* shader, const(char)* name) nothrow;
__gshared c_gst_gl_shader_get_attribute_locationFn c_gst_gl_shader_get_attribute_location; ///
private alias c_gst_gl_shader_get_program_handleFn = extern(C) int function(GstGLShader* shader) nothrow;
__gshared c_gst_gl_shader_get_program_handleFn c_gst_gl_shader_get_program_handle; ///
private alias c_gst_gl_shader_is_linkedFn = extern(C) gboolean function(GstGLShader* shader) nothrow;
__gshared c_gst_gl_shader_is_linkedFn c_gst_gl_shader_is_linked; ///
private alias c_gst_gl_shader_linkFn = extern(C) gboolean function(GstGLShader* shader, GError** _err) nothrow;
__gshared c_gst_gl_shader_linkFn c_gst_gl_shader_link; ///
private alias c_gst_gl_shader_releaseFn = extern(C) void function(GstGLShader* shader) nothrow;
__gshared c_gst_gl_shader_releaseFn c_gst_gl_shader_release; ///
private alias c_gst_gl_shader_release_unlockedFn = extern(C) void function(GstGLShader* shader) nothrow;
__gshared c_gst_gl_shader_release_unlockedFn c_gst_gl_shader_release_unlocked; ///
private alias c_gst_gl_shader_set_uniform_1fFn = extern(C) void function(GstGLShader* shader, const(char)* name, float value) nothrow;
__gshared c_gst_gl_shader_set_uniform_1fFn c_gst_gl_shader_set_uniform_1f; ///
private alias c_gst_gl_shader_set_uniform_1fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_1fvFn c_gst_gl_shader_set_uniform_1fv; ///
private alias c_gst_gl_shader_set_uniform_1iFn = extern(C) void function(GstGLShader* shader, const(char)* name, int value) nothrow;
__gshared c_gst_gl_shader_set_uniform_1iFn c_gst_gl_shader_set_uniform_1i; ///
private alias c_gst_gl_shader_set_uniform_1ivFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_1ivFn c_gst_gl_shader_set_uniform_1iv; ///
private alias c_gst_gl_shader_set_uniform_2fFn = extern(C) void function(GstGLShader* shader, const(char)* name, float v0, float v1) nothrow;
__gshared c_gst_gl_shader_set_uniform_2fFn c_gst_gl_shader_set_uniform_2f; ///
private alias c_gst_gl_shader_set_uniform_2fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_2fvFn c_gst_gl_shader_set_uniform_2fv; ///
private alias c_gst_gl_shader_set_uniform_2iFn = extern(C) void function(GstGLShader* shader, const(char)* name, int v0, int v1) nothrow;
__gshared c_gst_gl_shader_set_uniform_2iFn c_gst_gl_shader_set_uniform_2i; ///
private alias c_gst_gl_shader_set_uniform_2ivFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_2ivFn c_gst_gl_shader_set_uniform_2iv; ///
private alias c_gst_gl_shader_set_uniform_3fFn = extern(C) void function(GstGLShader* shader, const(char)* name, float v0, float v1, float v2) nothrow;
__gshared c_gst_gl_shader_set_uniform_3fFn c_gst_gl_shader_set_uniform_3f; ///
private alias c_gst_gl_shader_set_uniform_3fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_3fvFn c_gst_gl_shader_set_uniform_3fv; ///
private alias c_gst_gl_shader_set_uniform_3iFn = extern(C) void function(GstGLShader* shader, const(char)* name, int v0, int v1, int v2) nothrow;
__gshared c_gst_gl_shader_set_uniform_3iFn c_gst_gl_shader_set_uniform_3i; ///
private alias c_gst_gl_shader_set_uniform_3ivFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_3ivFn c_gst_gl_shader_set_uniform_3iv; ///
private alias c_gst_gl_shader_set_uniform_4fFn = extern(C) void function(GstGLShader* shader, const(char)* name, float v0, float v1, float v2, float v3) nothrow;
__gshared c_gst_gl_shader_set_uniform_4fFn c_gst_gl_shader_set_uniform_4f; ///
private alias c_gst_gl_shader_set_uniform_4fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_4fvFn c_gst_gl_shader_set_uniform_4fv; ///
private alias c_gst_gl_shader_set_uniform_4iFn = extern(C) void function(GstGLShader* shader, const(char)* name, int v0, int v1, int v2, int v3) nothrow;
__gshared c_gst_gl_shader_set_uniform_4iFn c_gst_gl_shader_set_uniform_4i; ///
private alias c_gst_gl_shader_set_uniform_4ivFn = extern(C) void function(GstGLShader* shader, const(char)* name, uint count, const(int)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_4ivFn c_gst_gl_shader_set_uniform_4iv; ///
private alias c_gst_gl_shader_set_uniform_matrix_2fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_2fvFn c_gst_gl_shader_set_uniform_matrix_2fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_2x3fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_2x3fvFn c_gst_gl_shader_set_uniform_matrix_2x3fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_2x4fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_2x4fvFn c_gst_gl_shader_set_uniform_matrix_2x4fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_3fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_3fvFn c_gst_gl_shader_set_uniform_matrix_3fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_3x2fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_3x2fvFn c_gst_gl_shader_set_uniform_matrix_3x2fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_3x4fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_3x4fvFn c_gst_gl_shader_set_uniform_matrix_3x4fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_4fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_4fvFn c_gst_gl_shader_set_uniform_matrix_4fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_4x2fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_4x2fvFn c_gst_gl_shader_set_uniform_matrix_4x2fv; ///
private alias c_gst_gl_shader_set_uniform_matrix_4x3fvFn = extern(C) void function(GstGLShader* shader, const(char)* name, int count, gboolean transpose, const(float)* value) nothrow;
__gshared c_gst_gl_shader_set_uniform_matrix_4x3fvFn c_gst_gl_shader_set_uniform_matrix_4x3fv; ///
private alias c_gst_gl_shader_useFn = extern(C) void function(GstGLShader* shader) nothrow;
__gshared c_gst_gl_shader_useFn c_gst_gl_shader_use; ///

// GLSyncMeta
private alias c_gst_gl_sync_meta_set_sync_pointFn = extern(C) void function(GstGLSyncMeta* syncMeta, GstGLContext* context) nothrow;
__gshared c_gst_gl_sync_meta_set_sync_pointFn c_gst_gl_sync_meta_set_sync_point; ///
private alias c_gst_gl_sync_meta_waitFn = extern(C) void function(GstGLSyncMeta* syncMeta, GstGLContext* context) nothrow;
__gshared c_gst_gl_sync_meta_waitFn c_gst_gl_sync_meta_wait; ///
private alias c_gst_gl_sync_meta_wait_cpuFn = extern(C) void function(GstGLSyncMeta* syncMeta, GstGLContext* context) nothrow;
__gshared c_gst_gl_sync_meta_wait_cpuFn c_gst_gl_sync_meta_wait_cpu; ///
private alias c_gst_gl_sync_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_gl_sync_meta_get_infoFn c_gst_gl_sync_meta_get_info; ///

// GLUpload
private alias c_gst_gl_upload_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_upload_get_typeFn c_gst_gl_upload_get_type; ///
private alias c_gst_gl_upload_newFn = extern(C) GstGLUpload* function(GstGLContext* context) nothrow;
__gshared c_gst_gl_upload_newFn c_gst_gl_upload_new; ///
private alias c_gst_gl_upload_get_input_template_capsFn = extern(C) GstCaps* function() nothrow;
__gshared c_gst_gl_upload_get_input_template_capsFn c_gst_gl_upload_get_input_template_caps; ///
private alias c_gst_gl_upload_fixate_capsFn = extern(C) GstCaps* function(GstGLUpload* upload, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) nothrow;
__gshared c_gst_gl_upload_fixate_capsFn c_gst_gl_upload_fixate_caps; ///
private alias c_gst_gl_upload_get_capsFn = extern(C) void function(GstGLUpload* upload, GstCaps** inCaps, GstCaps** outCaps) nothrow;
__gshared c_gst_gl_upload_get_capsFn c_gst_gl_upload_get_caps; ///
private alias c_gst_gl_upload_perform_with_bufferFn = extern(C) GstGLUploadReturn function(GstGLUpload* upload, GstBuffer* buffer, GstBuffer** outbufPtr) nothrow;
__gshared c_gst_gl_upload_perform_with_bufferFn c_gst_gl_upload_perform_with_buffer; ///
private alias c_gst_gl_upload_propose_allocationFn = extern(C) void function(GstGLUpload* upload, GstQuery* decideQuery, GstQuery* query) nothrow;
__gshared c_gst_gl_upload_propose_allocationFn c_gst_gl_upload_propose_allocation; ///
private alias c_gst_gl_upload_set_capsFn = extern(C) gboolean function(GstGLUpload* upload, GstCaps* inCaps, GstCaps* outCaps) nothrow;
__gshared c_gst_gl_upload_set_capsFn c_gst_gl_upload_set_caps; ///
private alias c_gst_gl_upload_set_contextFn = extern(C) void function(GstGLUpload* upload, GstGLContext* context) nothrow;
__gshared c_gst_gl_upload_set_contextFn c_gst_gl_upload_set_context; ///
private alias c_gst_gl_upload_transform_capsFn = extern(C) GstCaps* function(GstGLUpload* upload, GstGLContext* context, GstPadDirection direction, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_gl_upload_transform_capsFn c_gst_gl_upload_transform_caps; ///

// GLVideoAllocationParams
private alias c_gst_gl_video_allocation_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_video_allocation_params_get_typeFn c_gst_gl_video_allocation_params_get_type; ///
private alias c_gst_gl_video_allocation_params_newFn = extern(C) GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat) nothrow;
__gshared c_gst_gl_video_allocation_params_newFn c_gst_gl_video_allocation_params_new; ///
private alias c_gst_gl_video_allocation_params_new_wrapped_dataFn = extern(C) GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* wrappedData, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_video_allocation_params_new_wrapped_dataFn c_gst_gl_video_allocation_params_new_wrapped_data; ///
private alias c_gst_gl_video_allocation_params_new_wrapped_gl_handleFn = extern(C) GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* glHandle, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_video_allocation_params_new_wrapped_gl_handleFn c_gst_gl_video_allocation_params_new_wrapped_gl_handle; ///
private alias c_gst_gl_video_allocation_params_new_wrapped_textureFn = extern(C) GstGLVideoAllocationParams* function(GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, uint texId, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_video_allocation_params_new_wrapped_textureFn c_gst_gl_video_allocation_params_new_wrapped_texture; ///
private alias c_gst_gl_video_allocation_params_copy_dataFn = extern(C) void function(GstGLVideoAllocationParams* srcVid, GstGLVideoAllocationParams* destVid) nothrow;
__gshared c_gst_gl_video_allocation_params_copy_dataFn c_gst_gl_video_allocation_params_copy_data; ///
private alias c_gst_gl_video_allocation_params_free_dataFn = extern(C) void function(GstGLVideoAllocationParams* params) nothrow;
__gshared c_gst_gl_video_allocation_params_free_dataFn c_gst_gl_video_allocation_params_free_data; ///
private alias c_gst_gl_video_allocation_params_init_fullFn = extern(C) gboolean function(GstGLVideoAllocationParams* params, size_t structSize, uint allocFlags, GstGLAllocationParamsCopyFunc copy, GstGLAllocationParamsFreeFunc free, GstGLContext* context, const(GstAllocationParams)* allocParams, const(GstVideoInfo)* vInfo, uint plane, const(GstVideoAlignment)* valign, GstGLTextureTarget target, GstGLFormat texFormat, void* wrappedData, void* glHandle, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_gl_video_allocation_params_init_fullFn c_gst_gl_video_allocation_params_init_full; ///

// GLViewConvert
private alias c_gst_gl_view_convert_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_view_convert_get_typeFn c_gst_gl_view_convert_get_type; ///
private alias c_gst_gl_view_convert_newFn = extern(C) GstGLViewConvert* function() nothrow;
__gshared c_gst_gl_view_convert_newFn c_gst_gl_view_convert_new; ///
private alias c_gst_gl_view_convert_fixate_capsFn = extern(C) GstCaps* function(GstGLViewConvert* viewconvert, GstPadDirection direction, GstCaps* caps, GstCaps* othercaps) nothrow;
__gshared c_gst_gl_view_convert_fixate_capsFn c_gst_gl_view_convert_fixate_caps; ///
private alias c_gst_gl_view_convert_get_outputFn = extern(C) GstFlowReturn function(GstGLViewConvert* viewconvert, GstBuffer** outbufPtr) nothrow;
__gshared c_gst_gl_view_convert_get_outputFn c_gst_gl_view_convert_get_output; ///
private alias c_gst_gl_view_convert_performFn = extern(C) GstBuffer* function(GstGLViewConvert* viewconvert, GstBuffer* inbuf) nothrow;
__gshared c_gst_gl_view_convert_performFn c_gst_gl_view_convert_perform; ///
private alias c_gst_gl_view_convert_resetFn = extern(C) void function(GstGLViewConvert* viewconvert) nothrow;
__gshared c_gst_gl_view_convert_resetFn c_gst_gl_view_convert_reset; ///
private alias c_gst_gl_view_convert_set_capsFn = extern(C) gboolean function(GstGLViewConvert* viewconvert, GstCaps* inCaps, GstCaps* outCaps) nothrow;
__gshared c_gst_gl_view_convert_set_capsFn c_gst_gl_view_convert_set_caps; ///
private alias c_gst_gl_view_convert_set_contextFn = extern(C) void function(GstGLViewConvert* viewconvert, GstGLContext* context) nothrow;
__gshared c_gst_gl_view_convert_set_contextFn c_gst_gl_view_convert_set_context; ///
private alias c_gst_gl_view_convert_submit_input_bufferFn = extern(C) GstFlowReturn function(GstGLViewConvert* viewconvert, gboolean isDiscont, GstBuffer* input) nothrow;
__gshared c_gst_gl_view_convert_submit_input_bufferFn c_gst_gl_view_convert_submit_input_buffer; ///
private alias c_gst_gl_view_convert_transform_capsFn = extern(C) GstCaps* function(GstGLViewConvert* viewconvert, GstPadDirection direction, GstCaps* caps, GstCaps* filter) nothrow;
__gshared c_gst_gl_view_convert_transform_capsFn c_gst_gl_view_convert_transform_caps; ///

// GLWindow
private alias c_gst_gl_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_window_get_typeFn c_gst_gl_window_get_type; ///
private alias c_gst_gl_window_newFn = extern(C) GstGLWindow* function(GstGLDisplay* display) nothrow;
__gshared c_gst_gl_window_newFn c_gst_gl_window_new; ///
private alias c_gst_gl_window_controls_viewportFn = extern(C) gboolean function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_controls_viewportFn c_gst_gl_window_controls_viewport; ///
private alias c_gst_gl_window_drawFn = extern(C) void function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_drawFn c_gst_gl_window_draw; ///
private alias c_gst_gl_window_get_contextFn = extern(C) GstGLContext* function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_get_contextFn c_gst_gl_window_get_context; ///
private alias c_gst_gl_window_get_displayFn = extern(C) size_t function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_get_displayFn c_gst_gl_window_get_display; ///
private alias c_gst_gl_window_get_request_output_surfaceFn = extern(C) gboolean function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_get_request_output_surfaceFn c_gst_gl_window_get_request_output_surface; ///
private alias c_gst_gl_window_get_surface_dimensionsFn = extern(C) void function(GstGLWindow* window, uint* width, uint* height) nothrow;
__gshared c_gst_gl_window_get_surface_dimensionsFn c_gst_gl_window_get_surface_dimensions; ///
private alias c_gst_gl_window_get_window_handleFn = extern(C) size_t function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_get_window_handleFn c_gst_gl_window_get_window_handle; ///
private alias c_gst_gl_window_handle_eventsFn = extern(C) void function(GstGLWindow* window, gboolean handleEvents) nothrow;
__gshared c_gst_gl_window_handle_eventsFn c_gst_gl_window_handle_events; ///
private alias c_gst_gl_window_has_output_surfaceFn = extern(C) gboolean function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_has_output_surfaceFn c_gst_gl_window_has_output_surface; ///
private alias c_gst_gl_window_queue_resizeFn = extern(C) void function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_queue_resizeFn c_gst_gl_window_queue_resize; ///
private alias c_gst_gl_window_quitFn = extern(C) void function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_quitFn c_gst_gl_window_quit; ///
private alias c_gst_gl_window_resizeFn = extern(C) void function(GstGLWindow* window, uint width, uint height) nothrow;
__gshared c_gst_gl_window_resizeFn c_gst_gl_window_resize; ///
private alias c_gst_gl_window_runFn = extern(C) void function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_runFn c_gst_gl_window_run; ///
private alias c_gst_gl_window_send_key_eventFn = extern(C) void function(GstGLWindow* window, const(char)* eventType, const(char)* keyStr) nothrow;
__gshared c_gst_gl_window_send_key_eventFn c_gst_gl_window_send_key_event; ///
private alias c_gst_gl_window_send_messageFn = extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data) nothrow;
__gshared c_gst_gl_window_send_messageFn c_gst_gl_window_send_message; ///
private alias c_gst_gl_window_send_message_asyncFn = extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroy) nothrow;
__gshared c_gst_gl_window_send_message_asyncFn c_gst_gl_window_send_message_async; ///
private alias c_gst_gl_window_send_mouse_eventFn = extern(C) void function(GstGLWindow* window, const(char)* eventType, int button, double posx, double posy) nothrow;
__gshared c_gst_gl_window_send_mouse_eventFn c_gst_gl_window_send_mouse_event; ///
private alias c_gst_gl_window_send_scroll_eventFn = extern(C) void function(GstGLWindow* window, double posx, double posy, double deltaX, double deltaY) nothrow;
__gshared c_gst_gl_window_send_scroll_eventFn c_gst_gl_window_send_scroll_event; ///
private alias c_gst_gl_window_set_close_callbackFn = extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_gl_window_set_close_callbackFn c_gst_gl_window_set_close_callback; ///
private alias c_gst_gl_window_set_draw_callbackFn = extern(C) void function(GstGLWindow* window, GstGLWindowCB callback, void* data, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_gl_window_set_draw_callbackFn c_gst_gl_window_set_draw_callback; ///
private alias c_gst_gl_window_set_preferred_sizeFn = extern(C) void function(GstGLWindow* window, int width, int height) nothrow;
__gshared c_gst_gl_window_set_preferred_sizeFn c_gst_gl_window_set_preferred_size; ///
private alias c_gst_gl_window_set_render_rectangleFn = extern(C) gboolean function(GstGLWindow* window, int x, int y, int width, int height) nothrow;
__gshared c_gst_gl_window_set_render_rectangleFn c_gst_gl_window_set_render_rectangle; ///
private alias c_gst_gl_window_set_request_output_surfaceFn = extern(C) void function(GstGLWindow* window, gboolean outputSurface) nothrow;
__gshared c_gst_gl_window_set_request_output_surfaceFn c_gst_gl_window_set_request_output_surface; ///
private alias c_gst_gl_window_set_resize_callbackFn = extern(C) void function(GstGLWindow* window, GstGLWindowResizeCB callback, void* data, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_gl_window_set_resize_callbackFn c_gst_gl_window_set_resize_callback; ///
private alias c_gst_gl_window_set_window_handleFn = extern(C) void function(GstGLWindow* window, size_t handle) nothrow;
__gshared c_gst_gl_window_set_window_handleFn c_gst_gl_window_set_window_handle; ///
private alias c_gst_gl_window_showFn = extern(C) void function(GstGLWindow* window) nothrow;
__gshared c_gst_gl_window_showFn c_gst_gl_window_show; ///

// global
private alias c_gst_buffer_add_gl_sync_metaFn = extern(C) GstGLSyncMeta* function(GstGLContext* context, GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_add_gl_sync_metaFn c_gst_buffer_add_gl_sync_meta; ///
private alias c_gst_buffer_add_gl_sync_meta_fullFn = extern(C) GstGLSyncMeta* function(GstGLContext* context, GstBuffer* buffer, void* data) nothrow;
__gshared c_gst_buffer_add_gl_sync_meta_fullFn c_gst_buffer_add_gl_sync_meta_full; ///
private alias c_gst_buffer_pool_config_get_gl_allocation_paramsFn = extern(C) GstGLAllocationParams* function(GstStructure* config) nothrow;
__gshared c_gst_buffer_pool_config_get_gl_allocation_paramsFn c_gst_buffer_pool_config_get_gl_allocation_params; ///
private alias c_gst_buffer_pool_config_get_gl_min_free_queue_sizeFn = extern(C) uint function(GstStructure* config) nothrow;
__gshared c_gst_buffer_pool_config_get_gl_min_free_queue_sizeFn c_gst_buffer_pool_config_get_gl_min_free_queue_size; ///
private alias c_gst_buffer_pool_config_set_gl_allocation_paramsFn = extern(C) void function(GstStructure* config, const(GstGLAllocationParams)* params) nothrow;
__gshared c_gst_buffer_pool_config_set_gl_allocation_paramsFn c_gst_buffer_pool_config_set_gl_allocation_params; ///
private alias c_gst_buffer_pool_config_set_gl_min_free_queue_sizeFn = extern(C) void function(GstStructure* config, uint queueSize) nothrow;
__gshared c_gst_buffer_pool_config_set_gl_min_free_queue_sizeFn c_gst_buffer_pool_config_set_gl_min_free_queue_size; ///
private alias c_gst_context_get_gl_displayFn = extern(C) gboolean function(GstContext* context, GstGLDisplay** display) nothrow;
__gshared c_gst_context_get_gl_displayFn c_gst_context_get_gl_display; ///
private alias c_gst_context_set_gl_displayFn = extern(C) void function(GstContext* context, GstGLDisplay* display) nothrow;
__gshared c_gst_context_set_gl_displayFn c_gst_context_set_gl_display; ///
private alias c_gst_gl_check_extensionFn = extern(C) gboolean function(const(char)* name, const(char)* ext) nothrow;
__gshared c_gst_gl_check_extensionFn c_gst_gl_check_extension; ///
private alias c_gst_gl_dma_buf_transform_drm_formats_to_gst_formatsFn = extern(C) gboolean function(GstGLContext* context, const(GValue)* src, GstGLDrmFormatFlags flags, GValue* dst) nothrow;
__gshared c_gst_gl_dma_buf_transform_drm_formats_to_gst_formatsFn c_gst_gl_dma_buf_transform_drm_formats_to_gst_formats; ///
private alias c_gst_gl_dma_buf_transform_gst_formats_to_drm_formatsFn = extern(C) gboolean function(GstGLContext* context, const(GValue)* src, GstGLDrmFormatFlags flags, GValue* dst) nothrow;
__gshared c_gst_gl_dma_buf_transform_gst_formats_to_drm_formatsFn c_gst_gl_dma_buf_transform_gst_formats_to_drm_formats; ///
private alias c_gst_gl_element_propagate_display_contextFn = extern(C) void function(GstElement* element, GstGLDisplay* display) nothrow;
__gshared c_gst_gl_element_propagate_display_contextFn c_gst_gl_element_propagate_display_context; ///
private alias c_gst_gl_ensure_element_dataFn = extern(C) gboolean function(GstElement* element, GstGLDisplay** displayPtr, GstGLContext** otherContextPtr) nothrow;
__gshared c_gst_gl_ensure_element_dataFn c_gst_gl_ensure_element_data; ///
private alias c_gst_gl_get_affine_transformation_meta_as_ndcFn = extern(C) void function(GstVideoAffineTransformationMeta* meta, float* matrix) nothrow;
__gshared c_gst_gl_get_affine_transformation_meta_as_ndcFn c_gst_gl_get_affine_transformation_meta_as_ndc; ///
private alias c_gst_gl_get_plane_data_sizeFn = extern(C) size_t function(const(GstVideoInfo)* info, const(GstVideoAlignment)* align_, uint plane) nothrow;
__gshared c_gst_gl_get_plane_data_sizeFn c_gst_gl_get_plane_data_size; ///
private alias c_gst_gl_get_plane_startFn = extern(C) size_t function(const(GstVideoInfo)* info, const(GstVideoAlignment)* valign, uint plane) nothrow;
__gshared c_gst_gl_get_plane_startFn c_gst_gl_get_plane_start; ///
private alias c_gst_gl_handle_context_queryFn = extern(C) gboolean function(GstElement* element, GstQuery* query, GstGLDisplay* display, GstGLContext* context, GstGLContext* otherContext) nothrow;
__gshared c_gst_gl_handle_context_queryFn c_gst_gl_handle_context_query; ///
private alias c_gst_gl_handle_set_contextFn = extern(C) gboolean function(GstElement* element, GstContext* context, GstGLDisplay** display, GstGLContext** otherContext) nothrow;
__gshared c_gst_gl_handle_set_contextFn c_gst_gl_handle_set_context; ///
private alias c_gst_gl_insert_debug_markerFn = extern(C) void function(GstGLContext* context, const(char)* format,  ...) nothrow;
__gshared c_gst_gl_insert_debug_markerFn c_gst_gl_insert_debug_marker; ///
private alias c_gst_gl_multiply_matrix4Fn = extern(C) void function(const(float)* a, const(float)* b, float* result) nothrow;
__gshared c_gst_gl_multiply_matrix4Fn c_gst_gl_multiply_matrix4; ///
private alias c_gst_gl_set_affine_transformation_meta_from_ndcFn = extern(C) void function(GstVideoAffineTransformationMeta* meta, const(float)* matrix) nothrow;
__gshared c_gst_gl_set_affine_transformation_meta_from_ndcFn c_gst_gl_set_affine_transformation_meta_from_ndc; ///
private alias c_gst_gl_sized_gl_format_from_gl_format_typeFn = extern(C) uint function(GstGLContext* context, uint format, uint type) nothrow;
__gshared c_gst_gl_sized_gl_format_from_gl_format_typeFn c_gst_gl_sized_gl_format_from_gl_format_type; ///
private alias c_gst_gl_stereo_downmix_mode_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_stereo_downmix_mode_get_typeFn c_gst_gl_stereo_downmix_mode_get_type; ///
private alias c_gst_gl_swizzle_invertFn = extern(C) void function(int* swizzle, int* inversion) nothrow;
__gshared c_gst_gl_swizzle_invertFn c_gst_gl_swizzle_invert; ///
private alias c_gst_gl_sync_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_gl_sync_meta_api_get_typeFn c_gst_gl_sync_meta_api_get_type; ///
private alias c_gst_gl_value_get_texture_target_maskFn = extern(C) GstGLTextureTarget function(const(GValue)* value) nothrow;
__gshared c_gst_gl_value_get_texture_target_maskFn c_gst_gl_value_get_texture_target_mask; ///
private alias c_gst_gl_value_set_texture_targetFn = extern(C) gboolean function(GValue* value, GstGLTextureTarget target) nothrow;
__gshared c_gst_gl_value_set_texture_targetFn c_gst_gl_value_set_texture_target; ///
private alias c_gst_gl_value_set_texture_target_from_maskFn = extern(C) gboolean function(GValue* value, GstGLTextureTarget targetMask) nothrow;
__gshared c_gst_gl_value_set_texture_target_from_maskFn c_gst_gl_value_set_texture_target_from_mask; ///
private alias c_gst_gl_version_to_glsl_versionFn = extern(C) GstGLSLVersion function(GstGLAPI glApi, int maj, int min) nothrow;
__gshared c_gst_gl_version_to_glsl_versionFn c_gst_gl_version_to_glsl_version; ///
private alias c_gst_gl_video_format_swizzleFn = extern(C) gboolean function(GstVideoFormat videoFormat, int* swizzle) nothrow;
__gshared c_gst_gl_video_format_swizzleFn c_gst_gl_video_format_swizzle; ///
private alias c_gst_glsl_string_get_version_profileFn = extern(C) gboolean function(const(char)* s, GstGLSLVersion* version_, GstGLSLProfile* profile) nothrow;
__gshared c_gst_glsl_string_get_version_profileFn c_gst_glsl_string_get_version_profile; ///
private alias c_gst_is_gl_base_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_base_memoryFn c_gst_is_gl_base_memory; ///
private alias c_gst_is_gl_bufferFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_bufferFn c_gst_is_gl_buffer; ///
private alias c_gst_is_gl_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_memoryFn c_gst_is_gl_memory; ///
private alias c_gst_is_gl_memory_pboFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_memory_pboFn c_gst_is_gl_memory_pbo; ///
private alias c_gst_is_gl_renderbufferFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_gl_renderbufferFn c_gst_is_gl_renderbuffer; ///

// GLAPI
private alias c_gst_gl_api_from_stringFn = extern(C) GstGLAPI function(const(char)* apiS) nothrow;
__gshared c_gst_gl_api_from_stringFn c_gst_gl_api_from_string; ///
private alias c_gst_gl_api_to_stringFn = extern(C) char* function(GstGLAPI api) nothrow;
__gshared c_gst_gl_api_to_stringFn c_gst_gl_api_to_string; ///

// GLBaseMemoryError
private alias c_gst_gl_base_memory_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_gl_base_memory_error_quarkFn c_gst_gl_base_memory_error_quark; ///

// GLConfigCaveat
private alias c_gst_gl_config_caveat_to_stringFn = extern(C) const(char)* function(GstGLConfigCaveat caveat) nothrow;
__gshared c_gst_gl_config_caveat_to_stringFn c_gst_gl_config_caveat_to_string; ///

// GLConfigSurfaceType
private alias c_gst_gl_config_surface_type_to_stringFn = extern(C) const(char)* function(GstGLConfigSurfaceType surfaceType) nothrow;
__gshared c_gst_gl_config_surface_type_to_stringFn c_gst_gl_config_surface_type_to_string; ///

// GLContextError
private alias c_gst_gl_context_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_gl_context_error_quarkFn c_gst_gl_context_error_quark; ///

// GLFormat
private alias c_gst_gl_format_from_video_infoFn = extern(C) GstGLFormat function(GstGLContext* context, const(GstVideoInfo)* vinfo, uint plane) nothrow;
__gshared c_gst_gl_format_from_video_infoFn c_gst_gl_format_from_video_info; ///
private alias c_gst_gl_format_is_supportedFn = extern(C) gboolean function(GstGLContext* context, GstGLFormat format) nothrow;
__gshared c_gst_gl_format_is_supportedFn c_gst_gl_format_is_supported; ///
private alias c_gst_gl_format_n_componentsFn = extern(C) uint function(GstGLFormat glFormat) nothrow;
__gshared c_gst_gl_format_n_componentsFn c_gst_gl_format_n_components; ///
private alias c_gst_gl_format_type_from_sized_gl_formatFn = extern(C) void function(GstGLFormat format, GstGLFormat* unsizedFormat, uint* glType) nothrow;
__gshared c_gst_gl_format_type_from_sized_gl_formatFn c_gst_gl_format_type_from_sized_gl_format; ///
private alias c_gst_gl_format_type_n_bytesFn = extern(C) uint function(uint format, uint type) nothrow;
__gshared c_gst_gl_format_type_n_bytesFn c_gst_gl_format_type_n_bytes; ///

// GLPlatform
private alias c_gst_gl_platform_from_stringFn = extern(C) GstGLPlatform function(const(char)* platformS) nothrow;
__gshared c_gst_gl_platform_from_stringFn c_gst_gl_platform_from_string; ///
private alias c_gst_gl_platform_to_stringFn = extern(C) char* function(GstGLPlatform platform) nothrow;
__gshared c_gst_gl_platform_to_stringFn c_gst_gl_platform_to_string; ///

// GLSLError
private alias c_gst_glsl_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_glsl_error_quarkFn c_gst_glsl_error_quark; ///

// GLSLProfile
private alias c_gst_glsl_profile_from_stringFn = extern(C) GstGLSLProfile function(const(char)* string_) nothrow;
__gshared c_gst_glsl_profile_from_stringFn c_gst_glsl_profile_from_string; ///
private alias c_gst_glsl_profile_to_stringFn = extern(C) const(char)* function(GstGLSLProfile profile) nothrow;
__gshared c_gst_glsl_profile_to_stringFn c_gst_glsl_profile_to_string; ///

// GLSLVersion
private alias c_gst_glsl_version_from_stringFn = extern(C) GstGLSLVersion function(const(char)* string_) nothrow;
__gshared c_gst_glsl_version_from_stringFn c_gst_glsl_version_from_string; ///
private alias c_gst_glsl_version_profile_from_stringFn = extern(C) gboolean function(const(char)* string_, GstGLSLVersion* versionRet, GstGLSLProfile* profileRet) nothrow;
__gshared c_gst_glsl_version_profile_from_stringFn c_gst_glsl_version_profile_from_string; ///
private alias c_gst_glsl_version_profile_to_stringFn = extern(C) char* function(GstGLSLVersion version_, GstGLSLProfile profile) nothrow;
__gshared c_gst_glsl_version_profile_to_stringFn c_gst_glsl_version_profile_to_string; ///
private alias c_gst_glsl_version_to_stringFn = extern(C) const(char)* function(GstGLSLVersion version_) nothrow;
__gshared c_gst_glsl_version_to_stringFn c_gst_glsl_version_to_string; ///

// GLTextureTarget
private alias c_gst_gl_texture_target_from_glFn = extern(C) GstGLTextureTarget function(uint target) nothrow;
__gshared c_gst_gl_texture_target_from_glFn c_gst_gl_texture_target_from_gl; ///
private alias c_gst_gl_texture_target_from_stringFn = extern(C) GstGLTextureTarget function(const(char)* str) nothrow;
__gshared c_gst_gl_texture_target_from_stringFn c_gst_gl_texture_target_from_string; ///
private alias c_gst_gl_texture_target_to_buffer_pool_optionFn = extern(C) const(char)* function(GstGLTextureTarget target) nothrow;
__gshared c_gst_gl_texture_target_to_buffer_pool_optionFn c_gst_gl_texture_target_to_buffer_pool_option; ///
private alias c_gst_gl_texture_target_to_glFn = extern(C) uint function(GstGLTextureTarget target) nothrow;
__gshared c_gst_gl_texture_target_to_glFn c_gst_gl_texture_target_to_gl; ///
private alias c_gst_gl_texture_target_to_stringFn = extern(C) const(char)* function(GstGLTextureTarget target) nothrow;
__gshared c_gst_gl_texture_target_to_stringFn c_gst_gl_texture_target_to_string; ///

// GLWindowError
private alias c_gst_gl_window_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_gl_window_error_quarkFn c_gst_gl_window_error_quark; ///

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

/** */
alias gst_gl_base_src_get_gl_context = c_gst_gl_base_src_get_gl_context;

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
alias gst_gl_window_get_request_output_surface = c_gst_gl_window_get_request_output_surface;

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
alias gst_gl_window_set_request_output_surface = c_gst_gl_window_set_request_output_surface;

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
alias gst_gl_dma_buf_transform_drm_formats_to_gst_formats = c_gst_gl_dma_buf_transform_drm_formats_to_gst_formats;

/** */
alias gst_gl_dma_buf_transform_gst_formats_to_drm_formats = c_gst_gl_dma_buf_transform_gst_formats_to_drm_formats;

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
  gidLink(cast(void**)&gst_gl_base_src_get_gl_context, "gst_gl_base_src_get_gl_context", libs);

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
  gidLink(cast(void**)&gst_gl_window_get_request_output_surface, "gst_gl_window_get_request_output_surface", libs);
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
  gidLink(cast(void**)&gst_gl_window_set_request_output_surface, "gst_gl_window_set_request_output_surface", libs);
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
  gidLink(cast(void**)&gst_gl_dma_buf_transform_drm_formats_to_gst_formats, "gst_gl_dma_buf_transform_drm_formats_to_gst_formats", libs);
  gidLink(cast(void**)&gst_gl_dma_buf_transform_gst_formats_to_drm_formats, "gst_gl_dma_buf_transform_gst_formats_to_drm_formats", libs);
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
