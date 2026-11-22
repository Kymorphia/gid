/// C functions for gst1 library
module gid.gst1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gst1.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;

private immutable LIBS = ["gstreamer-1.0_0"];

// AllocationParams
private alias c_gst_allocation_params_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_allocation_params_get_typeFn c_gst_allocation_params_get_type; ///
private alias c_gst_allocation_params_newFn = extern(C) GstAllocationParams* function() nothrow;
__gshared c_gst_allocation_params_newFn c_gst_allocation_params_new; ///
private alias c_gst_allocation_params_copyFn = extern(C) GstAllocationParams* function(const(GstAllocationParams)* params) nothrow;
__gshared c_gst_allocation_params_copyFn c_gst_allocation_params_copy; ///
private alias c_gst_allocation_params_freeFn = extern(C) void function(GstAllocationParams* params) nothrow;
__gshared c_gst_allocation_params_freeFn c_gst_allocation_params_free; ///
private alias c_gst_allocation_params_initFn = extern(C) void function(GstAllocationParams* params) nothrow;
__gshared c_gst_allocation_params_initFn c_gst_allocation_params_init; ///

// Allocator
private alias c_gst_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_allocator_get_typeFn c_gst_allocator_get_type; ///
private alias c_gst_allocator_findFn = extern(C) GstAllocator* function(const(char)* name) nothrow;
__gshared c_gst_allocator_findFn c_gst_allocator_find; ///
private alias c_gst_allocator_registerFn = extern(C) void function(const(char)* name, GstAllocator* allocator) nothrow;
__gshared c_gst_allocator_registerFn c_gst_allocator_register; ///
private alias c_gst_allocator_allocFn = extern(C) GstMemory* function(GstAllocator* allocator, size_t size, GstAllocationParams* params) nothrow;
__gshared c_gst_allocator_allocFn c_gst_allocator_alloc; ///
private alias c_gst_allocator_freeFn = extern(C) void function(GstAllocator* allocator, GstMemory* memory) nothrow;
__gshared c_gst_allocator_freeFn c_gst_allocator_free; ///
private alias c_gst_allocator_set_defaultFn = extern(C) void function(GstAllocator* allocator) nothrow;
__gshared c_gst_allocator_set_defaultFn c_gst_allocator_set_default; ///

// AtomicQueue
private alias c_gst_atomic_queue_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_atomic_queue_get_typeFn c_gst_atomic_queue_get_type; ///
private alias c_gst_atomic_queue_newFn = extern(C) GstAtomicQueue* function(uint initialSize) nothrow;
__gshared c_gst_atomic_queue_newFn c_gst_atomic_queue_new; ///
private alias c_gst_atomic_queue_lengthFn = extern(C) uint function(GstAtomicQueue* queue) nothrow;
__gshared c_gst_atomic_queue_lengthFn c_gst_atomic_queue_length; ///
private alias c_gst_atomic_queue_peekFn = extern(C) void* function(GstAtomicQueue* queue) nothrow;
__gshared c_gst_atomic_queue_peekFn c_gst_atomic_queue_peek; ///
private alias c_gst_atomic_queue_popFn = extern(C) void* function(GstAtomicQueue* queue) nothrow;
__gshared c_gst_atomic_queue_popFn c_gst_atomic_queue_pop; ///
private alias c_gst_atomic_queue_pushFn = extern(C) void function(GstAtomicQueue* queue, void* data) nothrow;
__gshared c_gst_atomic_queue_pushFn c_gst_atomic_queue_push; ///
private alias c_gst_atomic_queue_refFn = extern(C) void function(GstAtomicQueue* queue) nothrow;
__gshared c_gst_atomic_queue_refFn c_gst_atomic_queue_ref; ///
private alias c_gst_atomic_queue_unrefFn = extern(C) void function(GstAtomicQueue* queue) nothrow;
__gshared c_gst_atomic_queue_unrefFn c_gst_atomic_queue_unref; ///

// Bin
private alias c_gst_bin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_bin_get_typeFn c_gst_bin_get_type; ///
private alias c_gst_bin_newFn = extern(C) GstElement* function(const(char)* name) nothrow;
__gshared c_gst_bin_newFn c_gst_bin_new; ///
private alias c_gst_bin_addFn = extern(C) gboolean function(GstBin* bin, GstElement* element) nothrow;
__gshared c_gst_bin_addFn c_gst_bin_add; ///
private alias c_gst_bin_add_manyFn = extern(C) void function(GstBin* bin, GstElement* element1,  ...) nothrow;
__gshared c_gst_bin_add_manyFn c_gst_bin_add_many; ///
private alias c_gst_bin_find_unlinked_padFn = extern(C) GstPad* function(GstBin* bin, GstPadDirection direction) nothrow;
__gshared c_gst_bin_find_unlinked_padFn c_gst_bin_find_unlinked_pad; ///
private alias c_gst_bin_get_by_interfaceFn = extern(C) GstElement* function(GstBin* bin, GType iface) nothrow;
__gshared c_gst_bin_get_by_interfaceFn c_gst_bin_get_by_interface; ///
private alias c_gst_bin_get_by_nameFn = extern(C) GstElement* function(GstBin* bin, const(char)* name) nothrow;
__gshared c_gst_bin_get_by_nameFn c_gst_bin_get_by_name; ///
private alias c_gst_bin_get_by_name_recurse_upFn = extern(C) GstElement* function(GstBin* bin, const(char)* name) nothrow;
__gshared c_gst_bin_get_by_name_recurse_upFn c_gst_bin_get_by_name_recurse_up; ///
private alias c_gst_bin_get_suppressed_flagsFn = extern(C) GstElementFlags function(GstBin* bin) nothrow;
__gshared c_gst_bin_get_suppressed_flagsFn c_gst_bin_get_suppressed_flags; ///
private alias c_gst_bin_iterate_all_by_element_factory_nameFn = extern(C) GstIterator* function(GstBin* bin, const(char)* factoryName) nothrow;
__gshared c_gst_bin_iterate_all_by_element_factory_nameFn c_gst_bin_iterate_all_by_element_factory_name; ///
private alias c_gst_bin_iterate_all_by_interfaceFn = extern(C) GstIterator* function(GstBin* bin, GType iface) nothrow;
__gshared c_gst_bin_iterate_all_by_interfaceFn c_gst_bin_iterate_all_by_interface; ///
private alias c_gst_bin_iterate_elementsFn = extern(C) GstIterator* function(GstBin* bin) nothrow;
__gshared c_gst_bin_iterate_elementsFn c_gst_bin_iterate_elements; ///
private alias c_gst_bin_iterate_recurseFn = extern(C) GstIterator* function(GstBin* bin) nothrow;
__gshared c_gst_bin_iterate_recurseFn c_gst_bin_iterate_recurse; ///
private alias c_gst_bin_iterate_sinksFn = extern(C) GstIterator* function(GstBin* bin) nothrow;
__gshared c_gst_bin_iterate_sinksFn c_gst_bin_iterate_sinks; ///
private alias c_gst_bin_iterate_sortedFn = extern(C) GstIterator* function(GstBin* bin) nothrow;
__gshared c_gst_bin_iterate_sortedFn c_gst_bin_iterate_sorted; ///
private alias c_gst_bin_iterate_sourcesFn = extern(C) GstIterator* function(GstBin* bin) nothrow;
__gshared c_gst_bin_iterate_sourcesFn c_gst_bin_iterate_sources; ///
private alias c_gst_bin_recalculate_latencyFn = extern(C) gboolean function(GstBin* bin) nothrow;
__gshared c_gst_bin_recalculate_latencyFn c_gst_bin_recalculate_latency; ///
private alias c_gst_bin_removeFn = extern(C) gboolean function(GstBin* bin, GstElement* element) nothrow;
__gshared c_gst_bin_removeFn c_gst_bin_remove; ///
private alias c_gst_bin_remove_manyFn = extern(C) void function(GstBin* bin, GstElement* element1,  ...) nothrow;
__gshared c_gst_bin_remove_manyFn c_gst_bin_remove_many; ///
private alias c_gst_bin_set_suppressed_flagsFn = extern(C) void function(GstBin* bin, GstElementFlags flags) nothrow;
__gshared c_gst_bin_set_suppressed_flagsFn c_gst_bin_set_suppressed_flags; ///
private alias c_gst_bin_sync_children_statesFn = extern(C) gboolean function(GstBin* bin) nothrow;
__gshared c_gst_bin_sync_children_statesFn c_gst_bin_sync_children_states; ///

// Bitmask
private alias c_gst_bitmask_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_bitmask_get_typeFn c_gst_bitmask_get_type; ///

// Buffer
private alias c_gst_buffer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_buffer_get_typeFn c_gst_buffer_get_type; ///
private alias c_gst_buffer_newFn = extern(C) GstBuffer* function() nothrow;
__gshared c_gst_buffer_newFn c_gst_buffer_new; ///
private alias c_gst_buffer_new_allocateFn = extern(C) GstBuffer* function(GstAllocator* allocator, size_t size, GstAllocationParams* params) nothrow;
__gshared c_gst_buffer_new_allocateFn c_gst_buffer_new_allocate; ///
private alias c_gst_buffer_new_memdupFn = extern(C) GstBuffer* function(const(void)* data, size_t size) nothrow;
__gshared c_gst_buffer_new_memdupFn c_gst_buffer_new_memdup; ///
private alias c_gst_buffer_new_wrappedFn = extern(C) GstBuffer* function(void* data, size_t size) nothrow;
__gshared c_gst_buffer_new_wrappedFn c_gst_buffer_new_wrapped; ///
private alias c_gst_buffer_new_wrapped_bytesFn = extern(C) GstBuffer* function(GBytes* bytes) nothrow;
__gshared c_gst_buffer_new_wrapped_bytesFn c_gst_buffer_new_wrapped_bytes; ///
private alias c_gst_buffer_new_wrapped_fullFn = extern(C) GstBuffer* function(GstMemoryFlags flags, void* data, size_t maxsize, size_t offset, size_t size, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_buffer_new_wrapped_fullFn c_gst_buffer_new_wrapped_full; ///
private alias c_gst_buffer_add_custom_metaFn = extern(C) GstCustomMeta* function(GstBuffer* buffer, const(char)* name) nothrow;
__gshared c_gst_buffer_add_custom_metaFn c_gst_buffer_add_custom_meta; ///
private alias c_gst_buffer_add_metaFn = extern(C) GstMeta* function(GstBuffer* buffer, const(GstMetaInfo)* info, void* params) nothrow;
__gshared c_gst_buffer_add_metaFn c_gst_buffer_add_meta; ///
private alias c_gst_buffer_add_parent_buffer_metaFn = extern(C) GstParentBufferMeta* function(GstBuffer* buffer, GstBuffer* ref_) nothrow;
__gshared c_gst_buffer_add_parent_buffer_metaFn c_gst_buffer_add_parent_buffer_meta; ///
private alias c_gst_buffer_add_protection_metaFn = extern(C) GstProtectionMeta* function(GstBuffer* buffer, GstStructure* info) nothrow;
__gshared c_gst_buffer_add_protection_metaFn c_gst_buffer_add_protection_meta; ///
private alias c_gst_buffer_add_reference_timestamp_metaFn = extern(C) GstReferenceTimestampMeta* function(GstBuffer* buffer, GstCaps* reference, GstClockTime timestamp, GstClockTime duration) nothrow;
__gshared c_gst_buffer_add_reference_timestamp_metaFn c_gst_buffer_add_reference_timestamp_meta; ///
private alias c_gst_buffer_appendFn = extern(C) GstBuffer* function(GstBuffer* buf1, GstBuffer* buf2) nothrow;
__gshared c_gst_buffer_appendFn c_gst_buffer_append; ///
private alias c_gst_buffer_append_memoryFn = extern(C) void function(GstBuffer* buffer, GstMemory* mem) nothrow;
__gshared c_gst_buffer_append_memoryFn c_gst_buffer_append_memory; ///
private alias c_gst_buffer_append_regionFn = extern(C) GstBuffer* function(GstBuffer* buf1, GstBuffer* buf2, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_buffer_append_regionFn c_gst_buffer_append_region; ///
private alias c_gst_buffer_copyFn = extern(C) GstBuffer* function(const(GstBuffer)* buf) nothrow;
__gshared c_gst_buffer_copyFn c_gst_buffer_copy; ///
private alias c_gst_buffer_copy_deepFn = extern(C) GstBuffer* function(const(GstBuffer)* buf) nothrow;
__gshared c_gst_buffer_copy_deepFn c_gst_buffer_copy_deep; ///
private alias c_gst_buffer_copy_intoFn = extern(C) gboolean function(GstBuffer* dest, GstBuffer* src, GstBufferCopyFlags flags, size_t offset, size_t size) nothrow;
__gshared c_gst_buffer_copy_intoFn c_gst_buffer_copy_into; ///
private alias c_gst_buffer_copy_regionFn = extern(C) GstBuffer* function(GstBuffer* parent, GstBufferCopyFlags flags, size_t offset, size_t size) nothrow;
__gshared c_gst_buffer_copy_regionFn c_gst_buffer_copy_region; ///
private alias c_gst_buffer_extractFn = extern(C) size_t function(GstBuffer* buffer, size_t offset, void* dest, size_t size) nothrow;
__gshared c_gst_buffer_extractFn c_gst_buffer_extract; ///
private alias c_gst_buffer_extract_dupFn = extern(C) void function(GstBuffer* buffer, size_t offset, size_t size, void** dest, size_t* destSize) nothrow;
__gshared c_gst_buffer_extract_dupFn c_gst_buffer_extract_dup; ///
private alias c_gst_buffer_fillFn = extern(C) size_t function(GstBuffer* buffer, size_t offset, const(void)* src, size_t size) nothrow;
__gshared c_gst_buffer_fillFn c_gst_buffer_fill; ///
private alias c_gst_buffer_find_memoryFn = extern(C) gboolean function(GstBuffer* buffer, size_t offset, size_t size, uint* idx, uint* length, size_t* skip) nothrow;
__gshared c_gst_buffer_find_memoryFn c_gst_buffer_find_memory; ///
private alias c_gst_buffer_foreach_metaFn = extern(C) gboolean function(GstBuffer* buffer, GstBufferForeachMetaFunc func, void* userData) nothrow;
__gshared c_gst_buffer_foreach_metaFn c_gst_buffer_foreach_meta; ///
private alias c_gst_buffer_get_all_memoryFn = extern(C) GstMemory* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_all_memoryFn c_gst_buffer_get_all_memory; ///
private alias c_gst_buffer_get_custom_metaFn = extern(C) GstCustomMeta* function(GstBuffer* buffer, const(char)* name) nothrow;
__gshared c_gst_buffer_get_custom_metaFn c_gst_buffer_get_custom_meta; ///
private alias c_gst_buffer_get_flagsFn = extern(C) GstBufferFlags function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_flagsFn c_gst_buffer_get_flags; ///
private alias c_gst_buffer_get_memoryFn = extern(C) GstMemory* function(GstBuffer* buffer, uint idx) nothrow;
__gshared c_gst_buffer_get_memoryFn c_gst_buffer_get_memory; ///
private alias c_gst_buffer_get_memory_rangeFn = extern(C) GstMemory* function(GstBuffer* buffer, uint idx, int length) nothrow;
__gshared c_gst_buffer_get_memory_rangeFn c_gst_buffer_get_memory_range; ///
private alias c_gst_buffer_get_metaFn = extern(C) GstMeta* function(GstBuffer* buffer, GType api) nothrow;
__gshared c_gst_buffer_get_metaFn c_gst_buffer_get_meta; ///
private alias c_gst_buffer_get_n_metaFn = extern(C) uint function(GstBuffer* buffer, GType apiType) nothrow;
__gshared c_gst_buffer_get_n_metaFn c_gst_buffer_get_n_meta; ///
private alias c_gst_buffer_get_reference_timestamp_metaFn = extern(C) GstReferenceTimestampMeta* function(GstBuffer* buffer, GstCaps* reference) nothrow;
__gshared c_gst_buffer_get_reference_timestamp_metaFn c_gst_buffer_get_reference_timestamp_meta; ///
private alias c_gst_buffer_get_sizeFn = extern(C) size_t function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_sizeFn c_gst_buffer_get_size; ///
private alias c_gst_buffer_get_sizesFn = extern(C) size_t function(GstBuffer* buffer, size_t* offset, size_t* maxsize) nothrow;
__gshared c_gst_buffer_get_sizesFn c_gst_buffer_get_sizes; ///
private alias c_gst_buffer_get_sizes_rangeFn = extern(C) size_t function(GstBuffer* buffer, uint idx, int length, size_t* offset, size_t* maxsize) nothrow;
__gshared c_gst_buffer_get_sizes_rangeFn c_gst_buffer_get_sizes_range; ///
private alias c_gst_buffer_has_flagsFn = extern(C) gboolean function(GstBuffer* buffer, GstBufferFlags flags) nothrow;
__gshared c_gst_buffer_has_flagsFn c_gst_buffer_has_flags; ///
private alias c_gst_buffer_insert_memoryFn = extern(C) void function(GstBuffer* buffer, int idx, GstMemory* mem) nothrow;
__gshared c_gst_buffer_insert_memoryFn c_gst_buffer_insert_memory; ///
private alias c_gst_buffer_is_all_memory_writableFn = extern(C) gboolean function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_is_all_memory_writableFn c_gst_buffer_is_all_memory_writable; ///
private alias c_gst_buffer_is_memory_range_writableFn = extern(C) gboolean function(GstBuffer* buffer, uint idx, int length) nothrow;
__gshared c_gst_buffer_is_memory_range_writableFn c_gst_buffer_is_memory_range_writable; ///
private alias c_gst_buffer_is_writableFn = extern(C) gboolean function(const(GstBuffer)* buf) nothrow;
__gshared c_gst_buffer_is_writableFn c_gst_buffer_is_writable; ///
private alias c_gst_buffer_iterate_metaFn = extern(C) GstMeta* function(GstBuffer* buffer, void** state) nothrow;
__gshared c_gst_buffer_iterate_metaFn c_gst_buffer_iterate_meta; ///
private alias c_gst_buffer_iterate_meta_filteredFn = extern(C) GstMeta* function(GstBuffer* buffer, void** state, GType metaApiType) nothrow;
__gshared c_gst_buffer_iterate_meta_filteredFn c_gst_buffer_iterate_meta_filtered; ///
private alias c_gst_buffer_make_writableFn = extern(C) GstBuffer* function(GstBuffer* buf) nothrow;
__gshared c_gst_buffer_make_writableFn c_gst_buffer_make_writable; ///
private alias c_gst_buffer_mapFn = extern(C) gboolean function(GstBuffer* buffer, GstMapInfo* info, GstMapFlags flags) nothrow;
__gshared c_gst_buffer_mapFn c_gst_buffer_map; ///
private alias c_gst_buffer_map_rangeFn = extern(C) gboolean function(GstBuffer* buffer, uint idx, int length, GstMapInfo* info, GstMapFlags flags) nothrow;
__gshared c_gst_buffer_map_rangeFn c_gst_buffer_map_range; ///
private alias c_gst_buffer_memcmpFn = extern(C) int function(GstBuffer* buffer, size_t offset, const(void)* mem, size_t size) nothrow;
__gshared c_gst_buffer_memcmpFn c_gst_buffer_memcmp; ///
private alias c_gst_buffer_memsetFn = extern(C) size_t function(GstBuffer* buffer, size_t offset, ubyte val, size_t size) nothrow;
__gshared c_gst_buffer_memsetFn c_gst_buffer_memset; ///
private alias c_gst_buffer_n_memoryFn = extern(C) uint function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_n_memoryFn c_gst_buffer_n_memory; ///
private alias c_gst_buffer_peek_memoryFn = extern(C) GstMemory* function(GstBuffer* buffer, uint idx) nothrow;
__gshared c_gst_buffer_peek_memoryFn c_gst_buffer_peek_memory; ///
private alias c_gst_buffer_prepend_memoryFn = extern(C) void function(GstBuffer* buffer, GstMemory* mem) nothrow;
__gshared c_gst_buffer_prepend_memoryFn c_gst_buffer_prepend_memory; ///
private alias c_gst_buffer_refFn = extern(C) GstBuffer* function(GstBuffer* buf) nothrow;
__gshared c_gst_buffer_refFn c_gst_buffer_ref; ///
private alias c_gst_buffer_remove_all_memoryFn = extern(C) void function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_remove_all_memoryFn c_gst_buffer_remove_all_memory; ///
private alias c_gst_buffer_remove_memoryFn = extern(C) void function(GstBuffer* buffer, uint idx) nothrow;
__gshared c_gst_buffer_remove_memoryFn c_gst_buffer_remove_memory; ///
private alias c_gst_buffer_remove_memory_rangeFn = extern(C) void function(GstBuffer* buffer, uint idx, int length) nothrow;
__gshared c_gst_buffer_remove_memory_rangeFn c_gst_buffer_remove_memory_range; ///
private alias c_gst_buffer_remove_metaFn = extern(C) gboolean function(GstBuffer* buffer, GstMeta* meta) nothrow;
__gshared c_gst_buffer_remove_metaFn c_gst_buffer_remove_meta; ///
private alias c_gst_buffer_replace_all_memoryFn = extern(C) void function(GstBuffer* buffer, GstMemory* mem) nothrow;
__gshared c_gst_buffer_replace_all_memoryFn c_gst_buffer_replace_all_memory; ///
private alias c_gst_buffer_replace_memoryFn = extern(C) void function(GstBuffer* buffer, uint idx, GstMemory* mem) nothrow;
__gshared c_gst_buffer_replace_memoryFn c_gst_buffer_replace_memory; ///
private alias c_gst_buffer_replace_memory_rangeFn = extern(C) void function(GstBuffer* buffer, uint idx, int length, GstMemory* mem) nothrow;
__gshared c_gst_buffer_replace_memory_rangeFn c_gst_buffer_replace_memory_range; ///
private alias c_gst_buffer_resizeFn = extern(C) void function(GstBuffer* buffer, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_buffer_resizeFn c_gst_buffer_resize; ///
private alias c_gst_buffer_resize_rangeFn = extern(C) gboolean function(GstBuffer* buffer, uint idx, int length, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_buffer_resize_rangeFn c_gst_buffer_resize_range; ///
private alias c_gst_buffer_set_flagsFn = extern(C) gboolean function(GstBuffer* buffer, GstBufferFlags flags) nothrow;
__gshared c_gst_buffer_set_flagsFn c_gst_buffer_set_flags; ///
private alias c_gst_buffer_set_sizeFn = extern(C) void function(GstBuffer* buffer, ptrdiff_t size) nothrow;
__gshared c_gst_buffer_set_sizeFn c_gst_buffer_set_size; ///
private alias c_gst_buffer_unmapFn = extern(C) void function(GstBuffer* buffer, GstMapInfo* info) nothrow;
__gshared c_gst_buffer_unmapFn c_gst_buffer_unmap; ///
private alias c_gst_buffer_unrefFn = extern(C) void function(GstBuffer* buf) nothrow;
__gshared c_gst_buffer_unrefFn c_gst_buffer_unref; ///
private alias c_gst_buffer_unset_flagsFn = extern(C) gboolean function(GstBuffer* buffer, GstBufferFlags flags) nothrow;
__gshared c_gst_buffer_unset_flagsFn c_gst_buffer_unset_flags; ///
private alias c_gst_buffer_get_max_memoryFn = extern(C) uint function() nothrow;
__gshared c_gst_buffer_get_max_memoryFn c_gst_buffer_get_max_memory; ///
private alias c_gst_buffer_replaceFn = extern(C) gboolean function(GstBuffer** obuf, GstBuffer* nbuf) nothrow;
__gshared c_gst_buffer_replaceFn c_gst_buffer_replace; ///
private alias c_gst_buffer_stealFn = extern(C) GstBuffer* function(GstBuffer** oldBuffer) nothrow;
__gshared c_gst_buffer_stealFn c_gst_buffer_steal; ///
private alias c_gst_buffer_takeFn = extern(C) gboolean function(GstBuffer** oldBuffer, GstBuffer* newBuffer) nothrow;
__gshared c_gst_buffer_takeFn c_gst_buffer_take; ///

// BufferList
private alias c_gst_buffer_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_buffer_list_get_typeFn c_gst_buffer_list_get_type; ///
private alias c_gst_buffer_list_newFn = extern(C) GstBufferList* function() nothrow;
__gshared c_gst_buffer_list_newFn c_gst_buffer_list_new; ///
private alias c_gst_buffer_list_new_sizedFn = extern(C) GstBufferList* function(uint size) nothrow;
__gshared c_gst_buffer_list_new_sizedFn c_gst_buffer_list_new_sized; ///
private alias c_gst_buffer_list_calculate_sizeFn = extern(C) size_t function(GstBufferList* list) nothrow;
__gshared c_gst_buffer_list_calculate_sizeFn c_gst_buffer_list_calculate_size; ///
private alias c_gst_buffer_list_copyFn = extern(C) GstBufferList* function(const(GstBufferList)* list) nothrow;
__gshared c_gst_buffer_list_copyFn c_gst_buffer_list_copy; ///
private alias c_gst_buffer_list_copy_deepFn = extern(C) GstBufferList* function(const(GstBufferList)* list) nothrow;
__gshared c_gst_buffer_list_copy_deepFn c_gst_buffer_list_copy_deep; ///
private alias c_gst_buffer_list_foreachFn = extern(C) gboolean function(GstBufferList* list, GstBufferListFunc func, void* userData) nothrow;
__gshared c_gst_buffer_list_foreachFn c_gst_buffer_list_foreach; ///
private alias c_gst_buffer_list_getFn = extern(C) GstBuffer* function(GstBufferList* list, uint idx) nothrow;
__gshared c_gst_buffer_list_getFn c_gst_buffer_list_get; ///
private alias c_gst_buffer_list_get_writableFn = extern(C) GstBuffer* function(GstBufferList* list, uint idx) nothrow;
__gshared c_gst_buffer_list_get_writableFn c_gst_buffer_list_get_writable; ///
private alias c_gst_buffer_list_insertFn = extern(C) void function(GstBufferList* list, int idx, GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_list_insertFn c_gst_buffer_list_insert; ///
private alias c_gst_buffer_list_is_writableFn = extern(C) gboolean function(const(GstBufferList)* list) nothrow;
__gshared c_gst_buffer_list_is_writableFn c_gst_buffer_list_is_writable; ///
private alias c_gst_buffer_list_lengthFn = extern(C) uint function(GstBufferList* list) nothrow;
__gshared c_gst_buffer_list_lengthFn c_gst_buffer_list_length; ///
private alias c_gst_buffer_list_make_writableFn = extern(C) GstBufferList* function(GstBufferList* list) nothrow;
__gshared c_gst_buffer_list_make_writableFn c_gst_buffer_list_make_writable; ///
private alias c_gst_buffer_list_refFn = extern(C) GstBufferList* function(GstBufferList* list) nothrow;
__gshared c_gst_buffer_list_refFn c_gst_buffer_list_ref; ///
private alias c_gst_buffer_list_removeFn = extern(C) void function(GstBufferList* list, uint idx, uint length) nothrow;
__gshared c_gst_buffer_list_removeFn c_gst_buffer_list_remove; ///
private alias c_gst_buffer_list_unrefFn = extern(C) void function(GstBufferList* list) nothrow;
__gshared c_gst_buffer_list_unrefFn c_gst_buffer_list_unref; ///
private alias c_gst_buffer_list_replaceFn = extern(C) gboolean function(GstBufferList** oldList, GstBufferList* newList) nothrow;
__gshared c_gst_buffer_list_replaceFn c_gst_buffer_list_replace; ///
private alias c_gst_buffer_list_stealFn = extern(C) GstBufferList* function(GstBufferList** oldList) nothrow;
__gshared c_gst_buffer_list_stealFn c_gst_buffer_list_steal; ///
private alias c_gst_buffer_list_takeFn = extern(C) gboolean function(GstBufferList** oldList, GstBufferList* newList) nothrow;
__gshared c_gst_buffer_list_takeFn c_gst_buffer_list_take; ///

// BufferPool
private alias c_gst_buffer_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_buffer_pool_get_typeFn c_gst_buffer_pool_get_type; ///
private alias c_gst_buffer_pool_newFn = extern(C) GstBufferPool* function() nothrow;
__gshared c_gst_buffer_pool_newFn c_gst_buffer_pool_new; ///
private alias c_gst_buffer_pool_config_add_optionFn = extern(C) void function(GstStructure* config, const(char)* option) nothrow;
__gshared c_gst_buffer_pool_config_add_optionFn c_gst_buffer_pool_config_add_option; ///
private alias c_gst_buffer_pool_config_get_allocatorFn = extern(C) gboolean function(GstStructure* config, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_buffer_pool_config_get_allocatorFn c_gst_buffer_pool_config_get_allocator; ///
private alias c_gst_buffer_pool_config_get_optionFn = extern(C) const(char)* function(GstStructure* config, uint index) nothrow;
__gshared c_gst_buffer_pool_config_get_optionFn c_gst_buffer_pool_config_get_option; ///
private alias c_gst_buffer_pool_config_get_paramsFn = extern(C) gboolean function(GstStructure* config, GstCaps** caps, uint* size, uint* minBuffers, uint* maxBuffers) nothrow;
__gshared c_gst_buffer_pool_config_get_paramsFn c_gst_buffer_pool_config_get_params; ///
private alias c_gst_buffer_pool_config_has_optionFn = extern(C) gboolean function(GstStructure* config, const(char)* option) nothrow;
__gshared c_gst_buffer_pool_config_has_optionFn c_gst_buffer_pool_config_has_option; ///
private alias c_gst_buffer_pool_config_n_optionsFn = extern(C) uint function(GstStructure* config) nothrow;
__gshared c_gst_buffer_pool_config_n_optionsFn c_gst_buffer_pool_config_n_options; ///
private alias c_gst_buffer_pool_config_set_allocatorFn = extern(C) void function(GstStructure* config, GstAllocator* allocator, const(GstAllocationParams)* params) nothrow;
__gshared c_gst_buffer_pool_config_set_allocatorFn c_gst_buffer_pool_config_set_allocator; ///
private alias c_gst_buffer_pool_config_set_paramsFn = extern(C) void function(GstStructure* config, GstCaps* caps, uint size, uint minBuffers, uint maxBuffers) nothrow;
__gshared c_gst_buffer_pool_config_set_paramsFn c_gst_buffer_pool_config_set_params; ///
private alias c_gst_buffer_pool_config_validate_paramsFn = extern(C) gboolean function(GstStructure* config, GstCaps* caps, uint size, uint minBuffers, uint maxBuffers) nothrow;
__gshared c_gst_buffer_pool_config_validate_paramsFn c_gst_buffer_pool_config_validate_params; ///
private alias c_gst_buffer_pool_acquire_bufferFn = extern(C) GstFlowReturn function(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) nothrow;
__gshared c_gst_buffer_pool_acquire_bufferFn c_gst_buffer_pool_acquire_buffer; ///
private alias c_gst_buffer_pool_get_configFn = extern(C) GstStructure* function(GstBufferPool* pool) nothrow;
__gshared c_gst_buffer_pool_get_configFn c_gst_buffer_pool_get_config; ///
private alias c_gst_buffer_pool_get_optionsFn = extern(C) const(char*)* function(GstBufferPool* pool) nothrow;
__gshared c_gst_buffer_pool_get_optionsFn c_gst_buffer_pool_get_options; ///
private alias c_gst_buffer_pool_has_optionFn = extern(C) gboolean function(GstBufferPool* pool, const(char)* option) nothrow;
__gshared c_gst_buffer_pool_has_optionFn c_gst_buffer_pool_has_option; ///
private alias c_gst_buffer_pool_is_activeFn = extern(C) gboolean function(GstBufferPool* pool) nothrow;
__gshared c_gst_buffer_pool_is_activeFn c_gst_buffer_pool_is_active; ///
private alias c_gst_buffer_pool_release_bufferFn = extern(C) void function(GstBufferPool* pool, GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_pool_release_bufferFn c_gst_buffer_pool_release_buffer; ///
private alias c_gst_buffer_pool_set_activeFn = extern(C) gboolean function(GstBufferPool* pool, gboolean active) nothrow;
__gshared c_gst_buffer_pool_set_activeFn c_gst_buffer_pool_set_active; ///
private alias c_gst_buffer_pool_set_configFn = extern(C) gboolean function(GstBufferPool* pool, GstStructure* config) nothrow;
__gshared c_gst_buffer_pool_set_configFn c_gst_buffer_pool_set_config; ///
private alias c_gst_buffer_pool_set_flushingFn = extern(C) void function(GstBufferPool* pool, gboolean flushing) nothrow;
__gshared c_gst_buffer_pool_set_flushingFn c_gst_buffer_pool_set_flushing; ///

// Bus
private alias c_gst_bus_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_bus_get_typeFn c_gst_bus_get_type; ///
private alias c_gst_bus_newFn = extern(C) GstBus* function() nothrow;
__gshared c_gst_bus_newFn c_gst_bus_new; ///
private alias c_gst_bus_add_signal_watchFn = extern(C) void function(GstBus* bus) nothrow;
__gshared c_gst_bus_add_signal_watchFn c_gst_bus_add_signal_watch; ///
private alias c_gst_bus_add_signal_watch_fullFn = extern(C) void function(GstBus* bus, int priority) nothrow;
__gshared c_gst_bus_add_signal_watch_fullFn c_gst_bus_add_signal_watch_full; ///
private alias c_gst_bus_add_watchFn = extern(C) uint function(GstBus* bus, GstBusFunc func, void* userData) nothrow;
__gshared c_gst_bus_add_watchFn c_gst_bus_add_watch; ///
private alias c_gst_bus_add_watch_fullFn = extern(C) uint function(GstBus* bus, int priority, GstBusFunc func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_bus_add_watch_fullFn c_gst_bus_add_watch_full; ///
private alias c_gst_bus_async_signal_funcFn = extern(C) gboolean function(GstBus* bus, GstMessage* message, void* data) nothrow;
__gshared c_gst_bus_async_signal_funcFn c_gst_bus_async_signal_func; ///
private alias c_gst_bus_create_watchFn = extern(C) GSource* function(GstBus* bus) nothrow;
__gshared c_gst_bus_create_watchFn c_gst_bus_create_watch; ///
private alias c_gst_bus_disable_sync_message_emissionFn = extern(C) void function(GstBus* bus) nothrow;
__gshared c_gst_bus_disable_sync_message_emissionFn c_gst_bus_disable_sync_message_emission; ///
private alias c_gst_bus_enable_sync_message_emissionFn = extern(C) void function(GstBus* bus) nothrow;
__gshared c_gst_bus_enable_sync_message_emissionFn c_gst_bus_enable_sync_message_emission; ///
private alias c_gst_bus_get_pollfdFn = extern(C) void function(GstBus* bus, GPollFD* fd) nothrow;
__gshared c_gst_bus_get_pollfdFn c_gst_bus_get_pollfd; ///
private alias c_gst_bus_have_pendingFn = extern(C) gboolean function(GstBus* bus) nothrow;
__gshared c_gst_bus_have_pendingFn c_gst_bus_have_pending; ///
private alias c_gst_bus_peekFn = extern(C) GstMessage* function(GstBus* bus) nothrow;
__gshared c_gst_bus_peekFn c_gst_bus_peek; ///
private alias c_gst_bus_pollFn = extern(C) GstMessage* function(GstBus* bus, GstMessageType events, GstClockTime timeout) nothrow;
__gshared c_gst_bus_pollFn c_gst_bus_poll; ///
private alias c_gst_bus_popFn = extern(C) GstMessage* function(GstBus* bus) nothrow;
__gshared c_gst_bus_popFn c_gst_bus_pop; ///
private alias c_gst_bus_pop_filteredFn = extern(C) GstMessage* function(GstBus* bus, GstMessageType types) nothrow;
__gshared c_gst_bus_pop_filteredFn c_gst_bus_pop_filtered; ///
private alias c_gst_bus_postFn = extern(C) gboolean function(GstBus* bus, GstMessage* message) nothrow;
__gshared c_gst_bus_postFn c_gst_bus_post; ///
private alias c_gst_bus_remove_signal_watchFn = extern(C) void function(GstBus* bus) nothrow;
__gshared c_gst_bus_remove_signal_watchFn c_gst_bus_remove_signal_watch; ///
private alias c_gst_bus_remove_watchFn = extern(C) gboolean function(GstBus* bus) nothrow;
__gshared c_gst_bus_remove_watchFn c_gst_bus_remove_watch; ///
private alias c_gst_bus_set_flushingFn = extern(C) void function(GstBus* bus, gboolean flushing) nothrow;
__gshared c_gst_bus_set_flushingFn c_gst_bus_set_flushing; ///
private alias c_gst_bus_set_sync_handlerFn = extern(C) void function(GstBus* bus, GstBusSyncHandler func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_bus_set_sync_handlerFn c_gst_bus_set_sync_handler; ///
private alias c_gst_bus_sync_signal_handlerFn = extern(C) GstBusSyncReply function(GstBus* bus, GstMessage* message, void* data) nothrow;
__gshared c_gst_bus_sync_signal_handlerFn c_gst_bus_sync_signal_handler; ///
private alias c_gst_bus_timed_popFn = extern(C) GstMessage* function(GstBus* bus, GstClockTime timeout) nothrow;
__gshared c_gst_bus_timed_popFn c_gst_bus_timed_pop; ///
private alias c_gst_bus_timed_pop_filteredFn = extern(C) GstMessage* function(GstBus* bus, GstClockTime timeout, GstMessageType types) nothrow;
__gshared c_gst_bus_timed_pop_filteredFn c_gst_bus_timed_pop_filtered; ///

// Caps
private alias c_gst_caps_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_caps_get_typeFn c_gst_caps_get_type; ///
private alias c_gst_caps_new_anyFn = extern(C) GstCaps* function() nothrow;
__gshared c_gst_caps_new_anyFn c_gst_caps_new_any; ///
private alias c_gst_caps_new_emptyFn = extern(C) GstCaps* function() nothrow;
__gshared c_gst_caps_new_emptyFn c_gst_caps_new_empty; ///
private alias c_gst_caps_new_empty_simpleFn = extern(C) GstCaps* function(const(char)* mediaType) nothrow;
__gshared c_gst_caps_new_empty_simpleFn c_gst_caps_new_empty_simple; ///
private alias c_gst_caps_new_fullFn = extern(C) GstCaps* function(GstStructure* struct1,  ...) nothrow;
__gshared c_gst_caps_new_fullFn c_gst_caps_new_full; ///
private alias c_gst_caps_new_full_valistFn = extern(C) GstCaps* function(GstStructure* structure, void* varArgs) nothrow;
__gshared c_gst_caps_new_full_valistFn c_gst_caps_new_full_valist; ///
private alias c_gst_caps_new_id_str_empty_simpleFn = extern(C) GstCaps* function(const(GstIdStr)* mediaType) nothrow;
__gshared c_gst_caps_new_id_str_empty_simpleFn c_gst_caps_new_id_str_empty_simple; ///
private alias c_gst_caps_new_id_str_simpleFn = extern(C) GstCaps* function(const(GstIdStr)* mediaType, const(GstIdStr)* fieldname,  ...) nothrow;
__gshared c_gst_caps_new_id_str_simpleFn c_gst_caps_new_id_str_simple; ///
private alias c_gst_caps_new_simpleFn = extern(C) GstCaps* function(const(char)* mediaType, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_caps_new_simpleFn c_gst_caps_new_simple; ///
private alias c_gst_caps_new_static_str_empty_simpleFn = extern(C) GstCaps* function(const(char)* mediaType) nothrow;
__gshared c_gst_caps_new_static_str_empty_simpleFn c_gst_caps_new_static_str_empty_simple; ///
private alias c_gst_caps_new_static_str_simpleFn = extern(C) GstCaps* function(const(char)* mediaType, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_caps_new_static_str_simpleFn c_gst_caps_new_static_str_simple; ///
private alias c_gst_caps_appendFn = extern(C) void function(GstCaps* caps1, GstCaps* caps2) nothrow;
__gshared c_gst_caps_appendFn c_gst_caps_append; ///
private alias c_gst_caps_append_structureFn = extern(C) void function(GstCaps* caps, GstStructure* structure) nothrow;
__gshared c_gst_caps_append_structureFn c_gst_caps_append_structure; ///
private alias c_gst_caps_append_structure_fullFn = extern(C) void function(GstCaps* caps, GstStructure* structure, GstCapsFeatures* features) nothrow;
__gshared c_gst_caps_append_structure_fullFn c_gst_caps_append_structure_full; ///
private alias c_gst_caps_can_intersectFn = extern(C) gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) nothrow;
__gshared c_gst_caps_can_intersectFn c_gst_caps_can_intersect; ///
private alias c_gst_caps_copyFn = extern(C) GstCaps* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_copyFn c_gst_caps_copy; ///
private alias c_gst_caps_copy_nthFn = extern(C) GstCaps* function(const(GstCaps)* caps, uint nth) nothrow;
__gshared c_gst_caps_copy_nthFn c_gst_caps_copy_nth; ///
private alias c_gst_caps_filter_and_map_in_placeFn = extern(C) void function(GstCaps* caps, GstCapsFilterMapFunc func, void* userData) nothrow;
__gshared c_gst_caps_filter_and_map_in_placeFn c_gst_caps_filter_and_map_in_place; ///
private alias c_gst_caps_fixateFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_fixateFn c_gst_caps_fixate; ///
private alias c_gst_caps_foreachFn = extern(C) gboolean function(const(GstCaps)* caps, GstCapsForeachFunc func, void* userData) nothrow;
__gshared c_gst_caps_foreachFn c_gst_caps_foreach; ///
private alias c_gst_caps_get_featuresFn = extern(C) GstCapsFeatures* function(const(GstCaps)* caps, uint index) nothrow;
__gshared c_gst_caps_get_featuresFn c_gst_caps_get_features; ///
private alias c_gst_caps_get_sizeFn = extern(C) uint function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_get_sizeFn c_gst_caps_get_size; ///
private alias c_gst_caps_get_structureFn = extern(C) GstStructure* function(const(GstCaps)* caps, uint index) nothrow;
__gshared c_gst_caps_get_structureFn c_gst_caps_get_structure; ///
private alias c_gst_caps_id_str_set_simpleFn = extern(C) void function(GstCaps* caps, const(GstIdStr)* field,  ...) nothrow;
__gshared c_gst_caps_id_str_set_simpleFn c_gst_caps_id_str_set_simple; ///
private alias c_gst_caps_id_str_set_simple_valistFn = extern(C) void function(GstCaps* caps, const(GstIdStr)* field, void* varargs) nothrow;
__gshared c_gst_caps_id_str_set_simple_valistFn c_gst_caps_id_str_set_simple_valist; ///
private alias c_gst_caps_id_str_set_valueFn = extern(C) void function(GstCaps* caps, const(GstIdStr)* field, const(GValue)* value) nothrow;
__gshared c_gst_caps_id_str_set_valueFn c_gst_caps_id_str_set_value; ///
private alias c_gst_caps_intersectFn = extern(C) GstCaps* function(GstCaps* caps1, GstCaps* caps2) nothrow;
__gshared c_gst_caps_intersectFn c_gst_caps_intersect; ///
private alias c_gst_caps_intersect_fullFn = extern(C) GstCaps* function(GstCaps* caps1, GstCaps* caps2, GstCapsIntersectMode mode) nothrow;
__gshared c_gst_caps_intersect_fullFn c_gst_caps_intersect_full; ///
private alias c_gst_caps_is_always_compatibleFn = extern(C) gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) nothrow;
__gshared c_gst_caps_is_always_compatibleFn c_gst_caps_is_always_compatible; ///
private alias c_gst_caps_is_anyFn = extern(C) gboolean function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_is_anyFn c_gst_caps_is_any; ///
private alias c_gst_caps_is_emptyFn = extern(C) gboolean function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_is_emptyFn c_gst_caps_is_empty; ///
private alias c_gst_caps_is_equalFn = extern(C) gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) nothrow;
__gshared c_gst_caps_is_equalFn c_gst_caps_is_equal; ///
private alias c_gst_caps_is_equal_fixedFn = extern(C) gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) nothrow;
__gshared c_gst_caps_is_equal_fixedFn c_gst_caps_is_equal_fixed; ///
private alias c_gst_caps_is_fixedFn = extern(C) gboolean function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_is_fixedFn c_gst_caps_is_fixed; ///
private alias c_gst_caps_is_strictly_equalFn = extern(C) gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) nothrow;
__gshared c_gst_caps_is_strictly_equalFn c_gst_caps_is_strictly_equal; ///
private alias c_gst_caps_is_subsetFn = extern(C) gboolean function(const(GstCaps)* subset, const(GstCaps)* superset) nothrow;
__gshared c_gst_caps_is_subsetFn c_gst_caps_is_subset; ///
private alias c_gst_caps_is_subset_structureFn = extern(C) gboolean function(const(GstCaps)* caps, const(GstStructure)* structure) nothrow;
__gshared c_gst_caps_is_subset_structureFn c_gst_caps_is_subset_structure; ///
private alias c_gst_caps_is_subset_structure_fullFn = extern(C) gboolean function(const(GstCaps)* caps, const(GstStructure)* structure, const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_caps_is_subset_structure_fullFn c_gst_caps_is_subset_structure_full; ///
private alias c_gst_caps_is_writableFn = extern(C) gboolean function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_is_writableFn c_gst_caps_is_writable; ///
private alias c_gst_caps_make_writableFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_make_writableFn c_gst_caps_make_writable; ///
private alias c_gst_caps_map_in_placeFn = extern(C) gboolean function(GstCaps* caps, GstCapsMapFunc func, void* userData) nothrow;
__gshared c_gst_caps_map_in_placeFn c_gst_caps_map_in_place; ///
private alias c_gst_caps_mergeFn = extern(C) GstCaps* function(GstCaps* caps1, GstCaps* caps2) nothrow;
__gshared c_gst_caps_mergeFn c_gst_caps_merge; ///
private alias c_gst_caps_merge_structureFn = extern(C) GstCaps* function(GstCaps* caps, GstStructure* structure) nothrow;
__gshared c_gst_caps_merge_structureFn c_gst_caps_merge_structure; ///
private alias c_gst_caps_merge_structure_fullFn = extern(C) GstCaps* function(GstCaps* caps, GstStructure* structure, GstCapsFeatures* features) nothrow;
__gshared c_gst_caps_merge_structure_fullFn c_gst_caps_merge_structure_full; ///
private alias c_gst_caps_normalizeFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_normalizeFn c_gst_caps_normalize; ///
private alias c_gst_caps_refFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_refFn c_gst_caps_ref; ///
private alias c_gst_caps_remove_structureFn = extern(C) void function(GstCaps* caps, uint idx) nothrow;
__gshared c_gst_caps_remove_structureFn c_gst_caps_remove_structure; ///
private alias c_gst_caps_serializeFn = extern(C) char* function(const(GstCaps)* caps, GstSerializeFlags flags) nothrow;
__gshared c_gst_caps_serializeFn c_gst_caps_serialize; ///
private alias c_gst_caps_set_featuresFn = extern(C) void function(GstCaps* caps, uint index, GstCapsFeatures* features) nothrow;
__gshared c_gst_caps_set_featuresFn c_gst_caps_set_features; ///
private alias c_gst_caps_set_features_simpleFn = extern(C) void function(GstCaps* caps, GstCapsFeatures* features) nothrow;
__gshared c_gst_caps_set_features_simpleFn c_gst_caps_set_features_simple; ///
private alias c_gst_caps_set_simpleFn = extern(C) void function(GstCaps* caps, const(char)* field,  ...) nothrow;
__gshared c_gst_caps_set_simpleFn c_gst_caps_set_simple; ///
private alias c_gst_caps_set_simple_static_strFn = extern(C) void function(GstCaps* caps, const(char)* field,  ...) nothrow;
__gshared c_gst_caps_set_simple_static_strFn c_gst_caps_set_simple_static_str; ///
private alias c_gst_caps_set_simple_static_str_valistFn = extern(C) void function(GstCaps* caps, const(char)* field, void* varargs) nothrow;
__gshared c_gst_caps_set_simple_static_str_valistFn c_gst_caps_set_simple_static_str_valist; ///
private alias c_gst_caps_set_simple_valistFn = extern(C) void function(GstCaps* caps, const(char)* field, void* varargs) nothrow;
__gshared c_gst_caps_set_simple_valistFn c_gst_caps_set_simple_valist; ///
private alias c_gst_caps_set_valueFn = extern(C) void function(GstCaps* caps, const(char)* field, const(GValue)* value) nothrow;
__gshared c_gst_caps_set_valueFn c_gst_caps_set_value; ///
private alias c_gst_caps_set_value_static_strFn = extern(C) void function(GstCaps* caps, const(char)* field, const(GValue)* value) nothrow;
__gshared c_gst_caps_set_value_static_strFn c_gst_caps_set_value_static_str; ///
private alias c_gst_caps_simplifyFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_simplifyFn c_gst_caps_simplify; ///
private alias c_gst_caps_steal_structureFn = extern(C) GstStructure* function(GstCaps* caps, uint index) nothrow;
__gshared c_gst_caps_steal_structureFn c_gst_caps_steal_structure; ///
private alias c_gst_caps_subtractFn = extern(C) GstCaps* function(GstCaps* minuend, GstCaps* subtrahend) nothrow;
__gshared c_gst_caps_subtractFn c_gst_caps_subtract; ///
private alias c_gst_caps_to_stringFn = extern(C) char* function(const(GstCaps)* caps) nothrow;
__gshared c_gst_caps_to_stringFn c_gst_caps_to_string; ///
private alias c_gst_caps_truncateFn = extern(C) GstCaps* function(GstCaps* caps) nothrow;
__gshared c_gst_caps_truncateFn c_gst_caps_truncate; ///
private alias c_gst_caps_unrefFn = extern(C) void function(GstCaps* caps) nothrow;
__gshared c_gst_caps_unrefFn c_gst_caps_unref; ///
private alias c_gst_caps_from_stringFn = extern(C) GstCaps* function(const(char)* string_) nothrow;
__gshared c_gst_caps_from_stringFn c_gst_caps_from_string; ///
private alias c_gst_caps_replaceFn = extern(C) gboolean function(GstCaps** oldCaps, GstCaps* newCaps) nothrow;
__gshared c_gst_caps_replaceFn c_gst_caps_replace; ///
private alias c_gst_caps_stealFn = extern(C) GstCaps* function(GstCaps** oldCaps) nothrow;
__gshared c_gst_caps_stealFn c_gst_caps_steal; ///
private alias c_gst_caps_takeFn = extern(C) gboolean function(GstCaps** oldCaps, GstCaps* newCaps) nothrow;
__gshared c_gst_caps_takeFn c_gst_caps_take; ///

// CapsFeatures
private alias c_gst_caps_features_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_caps_features_get_typeFn c_gst_caps_features_get_type; ///
private alias c_gst_caps_features_newFn = extern(C) GstCapsFeatures* function(const(char)* feature1,  ...) nothrow;
__gshared c_gst_caps_features_newFn c_gst_caps_features_new; ///
private alias c_gst_caps_features_new_anyFn = extern(C) GstCapsFeatures* function() nothrow;
__gshared c_gst_caps_features_new_anyFn c_gst_caps_features_new_any; ///
private alias c_gst_caps_features_new_emptyFn = extern(C) GstCapsFeatures* function() nothrow;
__gshared c_gst_caps_features_new_emptyFn c_gst_caps_features_new_empty; ///
private alias c_gst_caps_features_new_idFn = extern(C) GstCapsFeatures* function(GQuark feature1,  ...) nothrow;
__gshared c_gst_caps_features_new_idFn c_gst_caps_features_new_id; ///
private alias c_gst_caps_features_new_id_strFn = extern(C) GstCapsFeatures* function(const(GstIdStr)* feature1,  ...) nothrow;
__gshared c_gst_caps_features_new_id_strFn c_gst_caps_features_new_id_str; ///
private alias c_gst_caps_features_new_id_str_valistFn = extern(C) GstCapsFeatures* function(const(GstIdStr)* feature1, void* varargs) nothrow;
__gshared c_gst_caps_features_new_id_str_valistFn c_gst_caps_features_new_id_str_valist; ///
private alias c_gst_caps_features_new_id_valistFn = extern(C) GstCapsFeatures* function(GQuark feature1, void* varargs) nothrow;
__gshared c_gst_caps_features_new_id_valistFn c_gst_caps_features_new_id_valist; ///
private alias c_gst_caps_features_new_singleFn = extern(C) GstCapsFeatures* function(const(char)* feature) nothrow;
__gshared c_gst_caps_features_new_singleFn c_gst_caps_features_new_single; ///
private alias c_gst_caps_features_new_single_static_strFn = extern(C) GstCapsFeatures* function(const(char)* feature) nothrow;
__gshared c_gst_caps_features_new_single_static_strFn c_gst_caps_features_new_single_static_str; ///
private alias c_gst_caps_features_new_static_strFn = extern(C) GstCapsFeatures* function(const(char)* feature1,  ...) nothrow;
__gshared c_gst_caps_features_new_static_strFn c_gst_caps_features_new_static_str; ///
private alias c_gst_caps_features_new_static_str_valistFn = extern(C) GstCapsFeatures* function(const(char)* feature1, void* varargs) nothrow;
__gshared c_gst_caps_features_new_static_str_valistFn c_gst_caps_features_new_static_str_valist; ///
private alias c_gst_caps_features_new_valistFn = extern(C) GstCapsFeatures* function(const(char)* feature1, void* varargs) nothrow;
__gshared c_gst_caps_features_new_valistFn c_gst_caps_features_new_valist; ///
private alias c_gst_caps_features_addFn = extern(C) void function(GstCapsFeatures* features, const(char)* feature) nothrow;
__gshared c_gst_caps_features_addFn c_gst_caps_features_add; ///
private alias c_gst_caps_features_add_idFn = extern(C) void function(GstCapsFeatures* features, GQuark feature) nothrow;
__gshared c_gst_caps_features_add_idFn c_gst_caps_features_add_id; ///
private alias c_gst_caps_features_add_id_strFn = extern(C) void function(GstCapsFeatures* features, const(GstIdStr)* feature) nothrow;
__gshared c_gst_caps_features_add_id_strFn c_gst_caps_features_add_id_str; ///
private alias c_gst_caps_features_add_static_strFn = extern(C) void function(GstCapsFeatures* features, const(char)* feature) nothrow;
__gshared c_gst_caps_features_add_static_strFn c_gst_caps_features_add_static_str; ///
private alias c_gst_caps_features_containsFn = extern(C) gboolean function(const(GstCapsFeatures)* features, const(char)* feature) nothrow;
__gshared c_gst_caps_features_containsFn c_gst_caps_features_contains; ///
private alias c_gst_caps_features_contains_idFn = extern(C) gboolean function(const(GstCapsFeatures)* features, GQuark feature) nothrow;
__gshared c_gst_caps_features_contains_idFn c_gst_caps_features_contains_id; ///
private alias c_gst_caps_features_contains_id_strFn = extern(C) gboolean function(const(GstCapsFeatures)* features, const(GstIdStr)* feature) nothrow;
__gshared c_gst_caps_features_contains_id_strFn c_gst_caps_features_contains_id_str; ///
private alias c_gst_caps_features_copyFn = extern(C) GstCapsFeatures* function(const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_caps_features_copyFn c_gst_caps_features_copy; ///
private alias c_gst_caps_features_freeFn = extern(C) void function(GstCapsFeatures* features) nothrow;
__gshared c_gst_caps_features_freeFn c_gst_caps_features_free; ///
private alias c_gst_caps_features_get_nthFn = extern(C) const(char)* function(const(GstCapsFeatures)* features, uint i) nothrow;
__gshared c_gst_caps_features_get_nthFn c_gst_caps_features_get_nth; ///
private alias c_gst_caps_features_get_nth_idFn = extern(C) GQuark function(const(GstCapsFeatures)* features, uint i) nothrow;
__gshared c_gst_caps_features_get_nth_idFn c_gst_caps_features_get_nth_id; ///
private alias c_gst_caps_features_get_nth_id_strFn = extern(C) const(GstIdStr)* function(const(GstCapsFeatures)* features, uint i) nothrow;
__gshared c_gst_caps_features_get_nth_id_strFn c_gst_caps_features_get_nth_id_str; ///
private alias c_gst_caps_features_get_sizeFn = extern(C) uint function(const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_caps_features_get_sizeFn c_gst_caps_features_get_size; ///
private alias c_gst_caps_features_is_anyFn = extern(C) gboolean function(const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_caps_features_is_anyFn c_gst_caps_features_is_any; ///
private alias c_gst_caps_features_is_equalFn = extern(C) gboolean function(const(GstCapsFeatures)* features1, const(GstCapsFeatures)* features2) nothrow;
__gshared c_gst_caps_features_is_equalFn c_gst_caps_features_is_equal; ///
private alias c_gst_caps_features_removeFn = extern(C) void function(GstCapsFeatures* features, const(char)* feature) nothrow;
__gshared c_gst_caps_features_removeFn c_gst_caps_features_remove; ///
private alias c_gst_caps_features_remove_idFn = extern(C) void function(GstCapsFeatures* features, GQuark feature) nothrow;
__gshared c_gst_caps_features_remove_idFn c_gst_caps_features_remove_id; ///
private alias c_gst_caps_features_remove_id_strFn = extern(C) void function(GstCapsFeatures* features, const(GstIdStr)* feature) nothrow;
__gshared c_gst_caps_features_remove_id_strFn c_gst_caps_features_remove_id_str; ///
private alias c_gst_caps_features_set_parent_refcountFn = extern(C) gboolean function(GstCapsFeatures* features, int* refcount) nothrow;
__gshared c_gst_caps_features_set_parent_refcountFn c_gst_caps_features_set_parent_refcount; ///
private alias c_gst_caps_features_to_stringFn = extern(C) char* function(const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_caps_features_to_stringFn c_gst_caps_features_to_string; ///
private alias c_gst_caps_features_from_stringFn = extern(C) GstCapsFeatures* function(const(char)* features) nothrow;
__gshared c_gst_caps_features_from_stringFn c_gst_caps_features_from_string; ///

// ChildProxy
private alias c_gst_child_proxy_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_child_proxy_get_typeFn c_gst_child_proxy_get_type; ///
private alias c_gst_child_proxy_child_addedFn = extern(C) void function(GstChildProxy* parent, GObject* child, const(char)* name) nothrow;
__gshared c_gst_child_proxy_child_addedFn c_gst_child_proxy_child_added; ///
private alias c_gst_child_proxy_child_removedFn = extern(C) void function(GstChildProxy* parent, GObject* child, const(char)* name) nothrow;
__gshared c_gst_child_proxy_child_removedFn c_gst_child_proxy_child_removed; ///
private alias c_gst_child_proxy_getFn = extern(C) void function(GstChildProxy* object, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_gst_child_proxy_getFn c_gst_child_proxy_get; ///
private alias c_gst_child_proxy_get_child_by_indexFn = extern(C) GObject* function(GstChildProxy* parent, uint index) nothrow;
__gshared c_gst_child_proxy_get_child_by_indexFn c_gst_child_proxy_get_child_by_index; ///
private alias c_gst_child_proxy_get_child_by_nameFn = extern(C) GObject* function(GstChildProxy* parent, const(char)* name) nothrow;
__gshared c_gst_child_proxy_get_child_by_nameFn c_gst_child_proxy_get_child_by_name; ///
private alias c_gst_child_proxy_get_child_by_name_recurseFn = extern(C) GObject* function(GstChildProxy* childProxy, const(char)* name) nothrow;
__gshared c_gst_child_proxy_get_child_by_name_recurseFn c_gst_child_proxy_get_child_by_name_recurse; ///
private alias c_gst_child_proxy_get_children_countFn = extern(C) uint function(GstChildProxy* parent) nothrow;
__gshared c_gst_child_proxy_get_children_countFn c_gst_child_proxy_get_children_count; ///
private alias c_gst_child_proxy_get_propertyFn = extern(C) void function(GstChildProxy* object, const(char)* name, GValue* value) nothrow;
__gshared c_gst_child_proxy_get_propertyFn c_gst_child_proxy_get_property; ///
private alias c_gst_child_proxy_get_valistFn = extern(C) void function(GstChildProxy* object, const(char)* firstPropertyName, void* varArgs) nothrow;
__gshared c_gst_child_proxy_get_valistFn c_gst_child_proxy_get_valist; ///
private alias c_gst_child_proxy_lookupFn = extern(C) gboolean function(GstChildProxy* object, const(char)* name, GObject** target, GParamSpec** pspec) nothrow;
__gshared c_gst_child_proxy_lookupFn c_gst_child_proxy_lookup; ///
private alias c_gst_child_proxy_setFn = extern(C) void function(GstChildProxy* object, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_gst_child_proxy_setFn c_gst_child_proxy_set; ///
private alias c_gst_child_proxy_set_propertyFn = extern(C) void function(GstChildProxy* object, const(char)* name, const(GValue)* value) nothrow;
__gshared c_gst_child_proxy_set_propertyFn c_gst_child_proxy_set_property; ///
private alias c_gst_child_proxy_set_valistFn = extern(C) void function(GstChildProxy* object, const(char)* firstPropertyName, void* varArgs) nothrow;
__gshared c_gst_child_proxy_set_valistFn c_gst_child_proxy_set_valist; ///

// Clock
private alias c_gst_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_clock_get_typeFn c_gst_clock_get_type; ///
private alias c_gst_clock_id_compare_funcFn = extern(C) int function(const(void)* id1, const(void)* id2) nothrow;
__gshared c_gst_clock_id_compare_funcFn c_gst_clock_id_compare_func; ///
private alias c_gst_clock_id_get_clockFn = extern(C) GstClock* function(GstClockID id) nothrow;
__gshared c_gst_clock_id_get_clockFn c_gst_clock_id_get_clock; ///
private alias c_gst_clock_id_get_timeFn = extern(C) GstClockTime function(GstClockID id) nothrow;
__gshared c_gst_clock_id_get_timeFn c_gst_clock_id_get_time; ///
private alias c_gst_clock_id_refFn = extern(C) GstClockID function(GstClockID id) nothrow;
__gshared c_gst_clock_id_refFn c_gst_clock_id_ref; ///
private alias c_gst_clock_id_unrefFn = extern(C) void function(GstClockID id) nothrow;
__gshared c_gst_clock_id_unrefFn c_gst_clock_id_unref; ///
private alias c_gst_clock_id_unscheduleFn = extern(C) void function(GstClockID id) nothrow;
__gshared c_gst_clock_id_unscheduleFn c_gst_clock_id_unschedule; ///
private alias c_gst_clock_id_uses_clockFn = extern(C) gboolean function(GstClockID id, GstClock* clock) nothrow;
__gshared c_gst_clock_id_uses_clockFn c_gst_clock_id_uses_clock; ///
private alias c_gst_clock_id_waitFn = extern(C) GstClockReturn function(GstClockID id, GstClockTimeDiff* jitter) nothrow;
__gshared c_gst_clock_id_waitFn c_gst_clock_id_wait; ///
private alias c_gst_clock_id_wait_asyncFn = extern(C) GstClockReturn function(GstClockID id, GstClockCallback func, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_clock_id_wait_asyncFn c_gst_clock_id_wait_async; ///
private alias c_gst_clock_add_observationFn = extern(C) gboolean function(GstClock* clock, GstClockTime observationInternal, GstClockTime observationExternal, double* rSquared) nothrow;
__gshared c_gst_clock_add_observationFn c_gst_clock_add_observation; ///
private alias c_gst_clock_add_observation_unappliedFn = extern(C) gboolean function(GstClock* clock, GstClockTime observationInternal, GstClockTime observationExternal, double* rSquared, GstClockTime* internal, GstClockTime* external, GstClockTime* rateNum, GstClockTime* rateDenom) nothrow;
__gshared c_gst_clock_add_observation_unappliedFn c_gst_clock_add_observation_unapplied; ///
private alias c_gst_clock_adjust_unlockedFn = extern(C) GstClockTime function(GstClock* clock, GstClockTime internal) nothrow;
__gshared c_gst_clock_adjust_unlockedFn c_gst_clock_adjust_unlocked; ///
private alias c_gst_clock_adjust_with_calibrationFn = extern(C) GstClockTime function(GstClock* clock, GstClockTime internalTarget, GstClockTime cinternal, GstClockTime cexternal, GstClockTime cnum, GstClockTime cdenom) nothrow;
__gshared c_gst_clock_adjust_with_calibrationFn c_gst_clock_adjust_with_calibration; ///
private alias c_gst_clock_get_calibrationFn = extern(C) void function(GstClock* clock, GstClockTime* internal, GstClockTime* external, GstClockTime* rateNum, GstClockTime* rateDenom) nothrow;
__gshared c_gst_clock_get_calibrationFn c_gst_clock_get_calibration; ///
private alias c_gst_clock_get_internal_timeFn = extern(C) GstClockTime function(GstClock* clock) nothrow;
__gshared c_gst_clock_get_internal_timeFn c_gst_clock_get_internal_time; ///
private alias c_gst_clock_get_masterFn = extern(C) GstClock* function(GstClock* clock) nothrow;
__gshared c_gst_clock_get_masterFn c_gst_clock_get_master; ///
private alias c_gst_clock_get_resolutionFn = extern(C) GstClockTime function(GstClock* clock) nothrow;
__gshared c_gst_clock_get_resolutionFn c_gst_clock_get_resolution; ///
private alias c_gst_clock_get_timeFn = extern(C) GstClockTime function(GstClock* clock) nothrow;
__gshared c_gst_clock_get_timeFn c_gst_clock_get_time; ///
private alias c_gst_clock_get_timeoutFn = extern(C) GstClockTime function(GstClock* clock) nothrow;
__gshared c_gst_clock_get_timeoutFn c_gst_clock_get_timeout; ///
private alias c_gst_clock_is_syncedFn = extern(C) gboolean function(GstClock* clock) nothrow;
__gshared c_gst_clock_is_syncedFn c_gst_clock_is_synced; ///
private alias c_gst_clock_is_system_monotonicFn = extern(C) gboolean function(GstClock* clock) nothrow;
__gshared c_gst_clock_is_system_monotonicFn c_gst_clock_is_system_monotonic; ///
private alias c_gst_clock_new_periodic_idFn = extern(C) GstClockID function(GstClock* clock, GstClockTime startTime, GstClockTime interval) nothrow;
__gshared c_gst_clock_new_periodic_idFn c_gst_clock_new_periodic_id; ///
private alias c_gst_clock_new_single_shot_idFn = extern(C) GstClockID function(GstClock* clock, GstClockTime time) nothrow;
__gshared c_gst_clock_new_single_shot_idFn c_gst_clock_new_single_shot_id; ///
private alias c_gst_clock_periodic_id_reinitFn = extern(C) gboolean function(GstClock* clock, GstClockID id, GstClockTime startTime, GstClockTime interval) nothrow;
__gshared c_gst_clock_periodic_id_reinitFn c_gst_clock_periodic_id_reinit; ///
private alias c_gst_clock_set_calibrationFn = extern(C) void function(GstClock* clock, GstClockTime internal, GstClockTime external, GstClockTime rateNum, GstClockTime rateDenom) nothrow;
__gshared c_gst_clock_set_calibrationFn c_gst_clock_set_calibration; ///
private alias c_gst_clock_set_masterFn = extern(C) gboolean function(GstClock* clock, GstClock* master) nothrow;
__gshared c_gst_clock_set_masterFn c_gst_clock_set_master; ///
private alias c_gst_clock_set_resolutionFn = extern(C) GstClockTime function(GstClock* clock, GstClockTime resolution) nothrow;
__gshared c_gst_clock_set_resolutionFn c_gst_clock_set_resolution; ///
private alias c_gst_clock_set_syncedFn = extern(C) void function(GstClock* clock, gboolean synced) nothrow;
__gshared c_gst_clock_set_syncedFn c_gst_clock_set_synced; ///
private alias c_gst_clock_set_timeoutFn = extern(C) void function(GstClock* clock, GstClockTime timeout) nothrow;
__gshared c_gst_clock_set_timeoutFn c_gst_clock_set_timeout; ///
private alias c_gst_clock_single_shot_id_reinitFn = extern(C) gboolean function(GstClock* clock, GstClockID id, GstClockTime time) nothrow;
__gshared c_gst_clock_single_shot_id_reinitFn c_gst_clock_single_shot_id_reinit; ///
private alias c_gst_clock_unadjust_unlockedFn = extern(C) GstClockTime function(GstClock* clock, GstClockTime external) nothrow;
__gshared c_gst_clock_unadjust_unlockedFn c_gst_clock_unadjust_unlocked; ///
private alias c_gst_clock_unadjust_with_calibrationFn = extern(C) GstClockTime function(GstClock* clock, GstClockTime externalTarget, GstClockTime cinternal, GstClockTime cexternal, GstClockTime cnum, GstClockTime cdenom) nothrow;
__gshared c_gst_clock_unadjust_with_calibrationFn c_gst_clock_unadjust_with_calibration; ///
private alias c_gst_clock_wait_for_syncFn = extern(C) gboolean function(GstClock* clock, GstClockTime timeout) nothrow;
__gshared c_gst_clock_wait_for_syncFn c_gst_clock_wait_for_sync; ///

// Context
private alias c_gst_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_context_get_typeFn c_gst_context_get_type; ///
private alias c_gst_context_newFn = extern(C) GstContext* function(const(char)* contextType, gboolean persistent) nothrow;
__gshared c_gst_context_newFn c_gst_context_new; ///
private alias c_gst_context_copyFn = extern(C) GstContext* function(const(GstContext)* context) nothrow;
__gshared c_gst_context_copyFn c_gst_context_copy; ///
private alias c_gst_context_get_context_typeFn = extern(C) const(char)* function(const(GstContext)* context) nothrow;
__gshared c_gst_context_get_context_typeFn c_gst_context_get_context_type; ///
private alias c_gst_context_get_structureFn = extern(C) const(GstStructure)* function(const(GstContext)* context) nothrow;
__gshared c_gst_context_get_structureFn c_gst_context_get_structure; ///
private alias c_gst_context_get_task_poolFn = extern(C) gboolean function(GstContext* context, GstTaskPool** pool) nothrow;
__gshared c_gst_context_get_task_poolFn c_gst_context_get_task_pool; ///
private alias c_gst_context_has_context_typeFn = extern(C) gboolean function(const(GstContext)* context, const(char)* contextType) nothrow;
__gshared c_gst_context_has_context_typeFn c_gst_context_has_context_type; ///
private alias c_gst_context_is_persistentFn = extern(C) gboolean function(const(GstContext)* context) nothrow;
__gshared c_gst_context_is_persistentFn c_gst_context_is_persistent; ///
private alias c_gst_context_is_writableFn = extern(C) gboolean function(const(GstContext)* context) nothrow;
__gshared c_gst_context_is_writableFn c_gst_context_is_writable; ///
private alias c_gst_context_make_writableFn = extern(C) GstContext* function(GstContext* context) nothrow;
__gshared c_gst_context_make_writableFn c_gst_context_make_writable; ///
private alias c_gst_context_refFn = extern(C) GstContext* function(GstContext* context) nothrow;
__gshared c_gst_context_refFn c_gst_context_ref; ///
private alias c_gst_context_set_task_poolFn = extern(C) void function(GstContext* context, GstTaskPool* pool) nothrow;
__gshared c_gst_context_set_task_poolFn c_gst_context_set_task_pool; ///
private alias c_gst_context_unrefFn = extern(C) void function(GstContext* context) nothrow;
__gshared c_gst_context_unrefFn c_gst_context_unref; ///
private alias c_gst_context_writable_structureFn = extern(C) GstStructure* function(GstContext* context) nothrow;
__gshared c_gst_context_writable_structureFn c_gst_context_writable_structure; ///
private alias c_gst_context_replaceFn = extern(C) gboolean function(GstContext** oldContext, GstContext* newContext) nothrow;
__gshared c_gst_context_replaceFn c_gst_context_replace; ///

// ControlBinding
private alias c_gst_control_binding_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_control_binding_get_typeFn c_gst_control_binding_get_type; ///
private alias c_gst_control_binding_get_g_value_arrayFn = extern(C) gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) nothrow;
__gshared c_gst_control_binding_get_g_value_arrayFn c_gst_control_binding_get_g_value_array; ///
private alias c_gst_control_binding_get_valueFn = extern(C) GValue* function(GstControlBinding* binding, GstClockTime timestamp) nothrow;
__gshared c_gst_control_binding_get_valueFn c_gst_control_binding_get_value; ///
private alias c_gst_control_binding_get_value_arrayFn = extern(C) gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, void* values) nothrow;
__gshared c_gst_control_binding_get_value_arrayFn c_gst_control_binding_get_value_array; ///
private alias c_gst_control_binding_is_disabledFn = extern(C) gboolean function(GstControlBinding* binding) nothrow;
__gshared c_gst_control_binding_is_disabledFn c_gst_control_binding_is_disabled; ///
private alias c_gst_control_binding_set_disabledFn = extern(C) void function(GstControlBinding* binding, gboolean disabled) nothrow;
__gshared c_gst_control_binding_set_disabledFn c_gst_control_binding_set_disabled; ///
private alias c_gst_control_binding_sync_valuesFn = extern(C) gboolean function(GstControlBinding* binding, GstObject* object, GstClockTime timestamp, GstClockTime lastSync) nothrow;
__gshared c_gst_control_binding_sync_valuesFn c_gst_control_binding_sync_values; ///

// ControlSource
private alias c_gst_control_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_control_source_get_typeFn c_gst_control_source_get_type; ///
private alias c_gst_control_source_get_valueFn = extern(C) gboolean function(GstControlSource* self, GstClockTime timestamp, double* value) nothrow;
__gshared c_gst_control_source_get_valueFn c_gst_control_source_get_value; ///
private alias c_gst_control_source_get_value_arrayFn = extern(C) gboolean function(GstControlSource* self, GstClockTime timestamp, GstClockTime interval, uint nValues, double* values) nothrow;
__gshared c_gst_control_source_get_value_arrayFn c_gst_control_source_get_value_array; ///

// CustomMeta
private alias c_gst_custom_meta_get_structureFn = extern(C) GstStructure* function(GstCustomMeta* meta) nothrow;
__gshared c_gst_custom_meta_get_structureFn c_gst_custom_meta_get_structure; ///
private alias c_gst_custom_meta_has_nameFn = extern(C) gboolean function(GstCustomMeta* meta, const(char)* name) nothrow;
__gshared c_gst_custom_meta_has_nameFn c_gst_custom_meta_has_name; ///

// DateTime
private alias c_gst_date_time_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_date_time_get_typeFn c_gst_date_time_get_type; ///
private alias c_gst_date_time_newFn = extern(C) GstDateTime* function(float tzoffset, int year, int month, int day, int hour, int minute, double seconds) nothrow;
__gshared c_gst_date_time_newFn c_gst_date_time_new; ///
private alias c_gst_date_time_new_from_g_date_timeFn = extern(C) GstDateTime* function(GDateTime* dt) nothrow;
__gshared c_gst_date_time_new_from_g_date_timeFn c_gst_date_time_new_from_g_date_time; ///
private alias c_gst_date_time_new_from_iso8601_stringFn = extern(C) GstDateTime* function(const(char)* string_) nothrow;
__gshared c_gst_date_time_new_from_iso8601_stringFn c_gst_date_time_new_from_iso8601_string; ///
private alias c_gst_date_time_new_from_unix_epoch_local_timeFn = extern(C) GstDateTime* function(long secs) nothrow;
__gshared c_gst_date_time_new_from_unix_epoch_local_timeFn c_gst_date_time_new_from_unix_epoch_local_time; ///
private alias c_gst_date_time_new_from_unix_epoch_local_time_usecsFn = extern(C) GstDateTime* function(long usecs) nothrow;
__gshared c_gst_date_time_new_from_unix_epoch_local_time_usecsFn c_gst_date_time_new_from_unix_epoch_local_time_usecs; ///
private alias c_gst_date_time_new_from_unix_epoch_utcFn = extern(C) GstDateTime* function(long secs) nothrow;
__gshared c_gst_date_time_new_from_unix_epoch_utcFn c_gst_date_time_new_from_unix_epoch_utc; ///
private alias c_gst_date_time_new_from_unix_epoch_utc_usecsFn = extern(C) GstDateTime* function(long usecs) nothrow;
__gshared c_gst_date_time_new_from_unix_epoch_utc_usecsFn c_gst_date_time_new_from_unix_epoch_utc_usecs; ///
private alias c_gst_date_time_new_local_timeFn = extern(C) GstDateTime* function(int year, int month, int day, int hour, int minute, double seconds) nothrow;
__gshared c_gst_date_time_new_local_timeFn c_gst_date_time_new_local_time; ///
private alias c_gst_date_time_new_now_local_timeFn = extern(C) GstDateTime* function() nothrow;
__gshared c_gst_date_time_new_now_local_timeFn c_gst_date_time_new_now_local_time; ///
private alias c_gst_date_time_new_now_utcFn = extern(C) GstDateTime* function() nothrow;
__gshared c_gst_date_time_new_now_utcFn c_gst_date_time_new_now_utc; ///
private alias c_gst_date_time_new_yFn = extern(C) GstDateTime* function(int year) nothrow;
__gshared c_gst_date_time_new_yFn c_gst_date_time_new_y; ///
private alias c_gst_date_time_new_ymFn = extern(C) GstDateTime* function(int year, int month) nothrow;
__gshared c_gst_date_time_new_ymFn c_gst_date_time_new_ym; ///
private alias c_gst_date_time_new_ymdFn = extern(C) GstDateTime* function(int year, int month, int day) nothrow;
__gshared c_gst_date_time_new_ymdFn c_gst_date_time_new_ymd; ///
private alias c_gst_date_time_get_dayFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_dayFn c_gst_date_time_get_day; ///
private alias c_gst_date_time_get_hourFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_hourFn c_gst_date_time_get_hour; ///
private alias c_gst_date_time_get_microsecondFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_microsecondFn c_gst_date_time_get_microsecond; ///
private alias c_gst_date_time_get_minuteFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_minuteFn c_gst_date_time_get_minute; ///
private alias c_gst_date_time_get_monthFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_monthFn c_gst_date_time_get_month; ///
private alias c_gst_date_time_get_secondFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_secondFn c_gst_date_time_get_second; ///
private alias c_gst_date_time_get_time_zone_offsetFn = extern(C) float function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_time_zone_offsetFn c_gst_date_time_get_time_zone_offset; ///
private alias c_gst_date_time_get_yearFn = extern(C) int function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_get_yearFn c_gst_date_time_get_year; ///
private alias c_gst_date_time_has_dayFn = extern(C) gboolean function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_has_dayFn c_gst_date_time_has_day; ///
private alias c_gst_date_time_has_monthFn = extern(C) gboolean function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_has_monthFn c_gst_date_time_has_month; ///
private alias c_gst_date_time_has_secondFn = extern(C) gboolean function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_has_secondFn c_gst_date_time_has_second; ///
private alias c_gst_date_time_has_timeFn = extern(C) gboolean function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_has_timeFn c_gst_date_time_has_time; ///
private alias c_gst_date_time_has_yearFn = extern(C) gboolean function(const(GstDateTime)* datetime) nothrow;
__gshared c_gst_date_time_has_yearFn c_gst_date_time_has_year; ///
private alias c_gst_date_time_refFn = extern(C) GstDateTime* function(GstDateTime* datetime) nothrow;
__gshared c_gst_date_time_refFn c_gst_date_time_ref; ///
private alias c_gst_date_time_to_g_date_timeFn = extern(C) GDateTime* function(GstDateTime* datetime) nothrow;
__gshared c_gst_date_time_to_g_date_timeFn c_gst_date_time_to_g_date_time; ///
private alias c_gst_date_time_to_iso8601_stringFn = extern(C) char* function(GstDateTime* datetime) nothrow;
__gshared c_gst_date_time_to_iso8601_stringFn c_gst_date_time_to_iso8601_string; ///
private alias c_gst_date_time_unrefFn = extern(C) void function(GstDateTime* datetime) nothrow;
__gshared c_gst_date_time_unrefFn c_gst_date_time_unref; ///

// DebugCategory
private alias c_gst_debug_category_freeFn = extern(C) void function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_freeFn c_gst_debug_category_free; ///
private alias c_gst_debug_category_get_colorFn = extern(C) uint function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_get_colorFn c_gst_debug_category_get_color; ///
private alias c_gst_debug_category_get_descriptionFn = extern(C) const(char)* function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_get_descriptionFn c_gst_debug_category_get_description; ///
private alias c_gst_debug_category_get_nameFn = extern(C) const(char)* function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_get_nameFn c_gst_debug_category_get_name; ///
private alias c_gst_debug_category_get_thresholdFn = extern(C) GstDebugLevel function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_get_thresholdFn c_gst_debug_category_get_threshold; ///
private alias c_gst_debug_category_reset_thresholdFn = extern(C) void function(GstDebugCategory* category) nothrow;
__gshared c_gst_debug_category_reset_thresholdFn c_gst_debug_category_reset_threshold; ///
private alias c_gst_debug_category_set_thresholdFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level) nothrow;
__gshared c_gst_debug_category_set_thresholdFn c_gst_debug_category_set_threshold; ///

// DebugMessage
private alias c_gst_debug_message_getFn = extern(C) const(char)* function(GstDebugMessage* message) nothrow;
__gshared c_gst_debug_message_getFn c_gst_debug_message_get; ///
private alias c_gst_debug_message_get_idFn = extern(C) const(char)* function(GstDebugMessage* message) nothrow;
__gshared c_gst_debug_message_get_idFn c_gst_debug_message_get_id; ///

// Device
private alias c_gst_device_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_device_get_typeFn c_gst_device_get_type; ///
private alias c_gst_device_create_elementFn = extern(C) GstElement* function(GstDevice* device, const(char)* name) nothrow;
__gshared c_gst_device_create_elementFn c_gst_device_create_element; ///
private alias c_gst_device_get_capsFn = extern(C) GstCaps* function(GstDevice* device) nothrow;
__gshared c_gst_device_get_capsFn c_gst_device_get_caps; ///
private alias c_gst_device_get_device_classFn = extern(C) char* function(GstDevice* device) nothrow;
__gshared c_gst_device_get_device_classFn c_gst_device_get_device_class; ///
private alias c_gst_device_get_display_nameFn = extern(C) char* function(GstDevice* device) nothrow;
__gshared c_gst_device_get_display_nameFn c_gst_device_get_display_name; ///
private alias c_gst_device_get_propertiesFn = extern(C) GstStructure* function(GstDevice* device) nothrow;
__gshared c_gst_device_get_propertiesFn c_gst_device_get_properties; ///
private alias c_gst_device_has_classesFn = extern(C) gboolean function(GstDevice* device, const(char)* classes) nothrow;
__gshared c_gst_device_has_classesFn c_gst_device_has_classes; ///
private alias c_gst_device_has_classesvFn = extern(C) gboolean function(GstDevice* device, char** classes) nothrow;
__gshared c_gst_device_has_classesvFn c_gst_device_has_classesv; ///
private alias c_gst_device_reconfigure_elementFn = extern(C) gboolean function(GstDevice* device, GstElement* element) nothrow;
__gshared c_gst_device_reconfigure_elementFn c_gst_device_reconfigure_element; ///

// DeviceMonitor
private alias c_gst_device_monitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_device_monitor_get_typeFn c_gst_device_monitor_get_type; ///
private alias c_gst_device_monitor_newFn = extern(C) GstDeviceMonitor* function() nothrow;
__gshared c_gst_device_monitor_newFn c_gst_device_monitor_new; ///
private alias c_gst_device_monitor_add_filterFn = extern(C) uint function(GstDeviceMonitor* monitor, const(char)* classes, GstCaps* caps) nothrow;
__gshared c_gst_device_monitor_add_filterFn c_gst_device_monitor_add_filter; ///
private alias c_gst_device_monitor_get_busFn = extern(C) GstBus* function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_get_busFn c_gst_device_monitor_get_bus; ///
private alias c_gst_device_monitor_get_devicesFn = extern(C) GList* function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_get_devicesFn c_gst_device_monitor_get_devices; ///
private alias c_gst_device_monitor_get_providersFn = extern(C) char** function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_get_providersFn c_gst_device_monitor_get_providers; ///
private alias c_gst_device_monitor_get_show_all_devicesFn = extern(C) gboolean function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_get_show_all_devicesFn c_gst_device_monitor_get_show_all_devices; ///
private alias c_gst_device_monitor_remove_filterFn = extern(C) gboolean function(GstDeviceMonitor* monitor, uint filterId) nothrow;
__gshared c_gst_device_monitor_remove_filterFn c_gst_device_monitor_remove_filter; ///
private alias c_gst_device_monitor_set_show_all_devicesFn = extern(C) void function(GstDeviceMonitor* monitor, gboolean showAll) nothrow;
__gshared c_gst_device_monitor_set_show_all_devicesFn c_gst_device_monitor_set_show_all_devices; ///
private alias c_gst_device_monitor_startFn = extern(C) gboolean function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_startFn c_gst_device_monitor_start; ///
private alias c_gst_device_monitor_stopFn = extern(C) void function(GstDeviceMonitor* monitor) nothrow;
__gshared c_gst_device_monitor_stopFn c_gst_device_monitor_stop; ///

// DeviceProvider
private alias c_gst_device_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_device_provider_get_typeFn c_gst_device_provider_get_type; ///
private alias c_gst_device_provider_registerFn = extern(C) gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GType type) nothrow;
__gshared c_gst_device_provider_registerFn c_gst_device_provider_register; ///
private alias c_gst_device_provider_can_monitorFn = extern(C) gboolean function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_can_monitorFn c_gst_device_provider_can_monitor; ///
private alias c_gst_device_provider_device_addFn = extern(C) void function(GstDeviceProvider* provider, GstDevice* device) nothrow;
__gshared c_gst_device_provider_device_addFn c_gst_device_provider_device_add; ///
private alias c_gst_device_provider_device_changedFn = extern(C) void function(GstDeviceProvider* provider, GstDevice* device, GstDevice* changedDevice) nothrow;
__gshared c_gst_device_provider_device_changedFn c_gst_device_provider_device_changed; ///
private alias c_gst_device_provider_device_removeFn = extern(C) void function(GstDeviceProvider* provider, GstDevice* device) nothrow;
__gshared c_gst_device_provider_device_removeFn c_gst_device_provider_device_remove; ///
private alias c_gst_device_provider_get_busFn = extern(C) GstBus* function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_get_busFn c_gst_device_provider_get_bus; ///
private alias c_gst_device_provider_get_devicesFn = extern(C) GList* function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_get_devicesFn c_gst_device_provider_get_devices; ///
private alias c_gst_device_provider_get_factoryFn = extern(C) GstDeviceProviderFactory* function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_get_factoryFn c_gst_device_provider_get_factory; ///
private alias c_gst_device_provider_get_hidden_providersFn = extern(C) char** function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_get_hidden_providersFn c_gst_device_provider_get_hidden_providers; ///
private alias c_gst_device_provider_get_metadataFn = extern(C) const(char)* function(GstDeviceProvider* provider, const(char)* key) nothrow;
__gshared c_gst_device_provider_get_metadataFn c_gst_device_provider_get_metadata; ///
private alias c_gst_device_provider_hide_providerFn = extern(C) void function(GstDeviceProvider* provider, const(char)* name) nothrow;
__gshared c_gst_device_provider_hide_providerFn c_gst_device_provider_hide_provider; ///
private alias c_gst_device_provider_is_startedFn = extern(C) gboolean function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_is_startedFn c_gst_device_provider_is_started; ///
private alias c_gst_device_provider_startFn = extern(C) gboolean function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_startFn c_gst_device_provider_start; ///
private alias c_gst_device_provider_stopFn = extern(C) void function(GstDeviceProvider* provider) nothrow;
__gshared c_gst_device_provider_stopFn c_gst_device_provider_stop; ///
private alias c_gst_device_provider_unhide_providerFn = extern(C) void function(GstDeviceProvider* provider, const(char)* name) nothrow;
__gshared c_gst_device_provider_unhide_providerFn c_gst_device_provider_unhide_provider; ///

// DeviceProviderClass
private alias c_gst_device_provider_class_add_metadataFn = extern(C) void function(GstDeviceProviderClass* klass, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_device_provider_class_add_metadataFn c_gst_device_provider_class_add_metadata; ///
private alias c_gst_device_provider_class_add_static_metadataFn = extern(C) void function(GstDeviceProviderClass* klass, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_device_provider_class_add_static_metadataFn c_gst_device_provider_class_add_static_metadata; ///
private alias c_gst_device_provider_class_get_metadataFn = extern(C) const(char)* function(GstDeviceProviderClass* klass, const(char)* key) nothrow;
__gshared c_gst_device_provider_class_get_metadataFn c_gst_device_provider_class_get_metadata; ///
private alias c_gst_device_provider_class_set_metadataFn = extern(C) void function(GstDeviceProviderClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) nothrow;
__gshared c_gst_device_provider_class_set_metadataFn c_gst_device_provider_class_set_metadata; ///
private alias c_gst_device_provider_class_set_static_metadataFn = extern(C) void function(GstDeviceProviderClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) nothrow;
__gshared c_gst_device_provider_class_set_static_metadataFn c_gst_device_provider_class_set_static_metadata; ///

// DeviceProviderFactory
private alias c_gst_device_provider_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_device_provider_factory_get_typeFn c_gst_device_provider_factory_get_type; ///
private alias c_gst_device_provider_factory_findFn = extern(C) GstDeviceProviderFactory* function(const(char)* name) nothrow;
__gshared c_gst_device_provider_factory_findFn c_gst_device_provider_factory_find; ///
private alias c_gst_device_provider_factory_get_by_nameFn = extern(C) GstDeviceProvider* function(const(char)* factoryname) nothrow;
__gshared c_gst_device_provider_factory_get_by_nameFn c_gst_device_provider_factory_get_by_name; ///
private alias c_gst_device_provider_factory_list_get_device_providersFn = extern(C) GList* function(GstRank minrank) nothrow;
__gshared c_gst_device_provider_factory_list_get_device_providersFn c_gst_device_provider_factory_list_get_device_providers; ///
private alias c_gst_device_provider_factory_getFn = extern(C) GstDeviceProvider* function(GstDeviceProviderFactory* factory) nothrow;
__gshared c_gst_device_provider_factory_getFn c_gst_device_provider_factory_get; ///
private alias c_gst_device_provider_factory_get_device_provider_typeFn = extern(C) GType function(GstDeviceProviderFactory* factory) nothrow;
__gshared c_gst_device_provider_factory_get_device_provider_typeFn c_gst_device_provider_factory_get_device_provider_type; ///
private alias c_gst_device_provider_factory_get_metadataFn = extern(C) const(char)* function(GstDeviceProviderFactory* factory, const(char)* key) nothrow;
__gshared c_gst_device_provider_factory_get_metadataFn c_gst_device_provider_factory_get_metadata; ///
private alias c_gst_device_provider_factory_get_metadata_keysFn = extern(C) char** function(GstDeviceProviderFactory* factory) nothrow;
__gshared c_gst_device_provider_factory_get_metadata_keysFn c_gst_device_provider_factory_get_metadata_keys; ///
private alias c_gst_device_provider_factory_has_classesFn = extern(C) gboolean function(GstDeviceProviderFactory* factory, const(char)* classes) nothrow;
__gshared c_gst_device_provider_factory_has_classesFn c_gst_device_provider_factory_has_classes; ///
private alias c_gst_device_provider_factory_has_classesvFn = extern(C) gboolean function(GstDeviceProviderFactory* factory, char** classes) nothrow;
__gshared c_gst_device_provider_factory_has_classesvFn c_gst_device_provider_factory_has_classesv; ///

// DoubleRange
private alias c_gst_double_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_double_range_get_typeFn c_gst_double_range_get_type; ///

// DynamicTypeFactory
private alias c_gst_dynamic_type_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_dynamic_type_factory_get_typeFn c_gst_dynamic_type_factory_get_type; ///
private alias c_gst_dynamic_type_factory_loadFn = extern(C) GType function(const(char)* factoryname) nothrow;
__gshared c_gst_dynamic_type_factory_loadFn c_gst_dynamic_type_factory_load; ///

// Element
private alias c_gst_element_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_element_get_typeFn c_gst_element_get_type; ///
private alias c_gst_element_make_from_uriFn = extern(C) GstElement* function(GstURIType type, const(char)* uri, const(char)* elementname, GError** _err) nothrow;
__gshared c_gst_element_make_from_uriFn c_gst_element_make_from_uri; ///
private alias c_gst_element_registerFn = extern(C) gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GType type) nothrow;
__gshared c_gst_element_registerFn c_gst_element_register; ///
private alias c_gst_element_state_change_return_get_nameFn = extern(C) const(char)* function(GstStateChangeReturn stateRet) nothrow;
__gshared c_gst_element_state_change_return_get_nameFn c_gst_element_state_change_return_get_name; ///
private alias c_gst_element_state_get_nameFn = extern(C) const(char)* function(GstState state) nothrow;
__gshared c_gst_element_state_get_nameFn c_gst_element_state_get_name; ///
private alias c_gst_element_type_set_skip_documentationFn = extern(C) void function(GType type) nothrow;
__gshared c_gst_element_type_set_skip_documentationFn c_gst_element_type_set_skip_documentation; ///
private alias c_gst_element_abort_stateFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_element_abort_stateFn c_gst_element_abort_state; ///
private alias c_gst_element_add_padFn = extern(C) gboolean function(GstElement* element, GstPad* pad) nothrow;
__gshared c_gst_element_add_padFn c_gst_element_add_pad; ///
private alias c_gst_element_add_property_deep_notify_watchFn = extern(C) gulong function(GstElement* element, const(char)* propertyName, gboolean includeValue) nothrow;
__gshared c_gst_element_add_property_deep_notify_watchFn c_gst_element_add_property_deep_notify_watch; ///
private alias c_gst_element_add_property_notify_watchFn = extern(C) gulong function(GstElement* element, const(char)* propertyName, gboolean includeValue) nothrow;
__gshared c_gst_element_add_property_notify_watchFn c_gst_element_add_property_notify_watch; ///
private alias c_gst_element_call_asyncFn = extern(C) void function(GstElement* element, GstElementCallAsyncFunc func, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_element_call_asyncFn c_gst_element_call_async; ///
private alias c_gst_element_change_stateFn = extern(C) GstStateChangeReturn function(GstElement* element, GstStateChange transition) nothrow;
__gshared c_gst_element_change_stateFn c_gst_element_change_state; ///
private alias c_gst_element_continue_stateFn = extern(C) GstStateChangeReturn function(GstElement* element, GstStateChangeReturn ret) nothrow;
__gshared c_gst_element_continue_stateFn c_gst_element_continue_state; ///
private alias c_gst_element_create_all_padsFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_element_create_all_padsFn c_gst_element_create_all_pads; ///
private alias c_gst_element_decorate_stream_idFn = extern(C) char* function(GstElement* element, const(char)* streamId) nothrow;
__gshared c_gst_element_decorate_stream_idFn c_gst_element_decorate_stream_id; ///
private alias c_gst_element_decorate_stream_id_printfFn = extern(C) char* function(GstElement* element, const(char)* format,  ...) nothrow;
__gshared c_gst_element_decorate_stream_id_printfFn c_gst_element_decorate_stream_id_printf; ///
private alias c_gst_element_decorate_stream_id_printf_valistFn = extern(C) char* function(GstElement* element, const(char)* format, void* varArgs) nothrow;
__gshared c_gst_element_decorate_stream_id_printf_valistFn c_gst_element_decorate_stream_id_printf_valist; ///
private alias c_gst_element_foreach_padFn = extern(C) gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) nothrow;
__gshared c_gst_element_foreach_padFn c_gst_element_foreach_pad; ///
private alias c_gst_element_foreach_sink_padFn = extern(C) gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) nothrow;
__gshared c_gst_element_foreach_sink_padFn c_gst_element_foreach_sink_pad; ///
private alias c_gst_element_foreach_src_padFn = extern(C) gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) nothrow;
__gshared c_gst_element_foreach_src_padFn c_gst_element_foreach_src_pad; ///
private alias c_gst_element_get_base_timeFn = extern(C) GstClockTime function(GstElement* element) nothrow;
__gshared c_gst_element_get_base_timeFn c_gst_element_get_base_time; ///
private alias c_gst_element_get_busFn = extern(C) GstBus* function(GstElement* element) nothrow;
__gshared c_gst_element_get_busFn c_gst_element_get_bus; ///
private alias c_gst_element_get_clockFn = extern(C) GstClock* function(GstElement* element) nothrow;
__gshared c_gst_element_get_clockFn c_gst_element_get_clock; ///
private alias c_gst_element_get_compatible_padFn = extern(C) GstPad* function(GstElement* element, GstPad* pad, GstCaps* caps) nothrow;
__gshared c_gst_element_get_compatible_padFn c_gst_element_get_compatible_pad; ///
private alias c_gst_element_get_compatible_pad_templateFn = extern(C) GstPadTemplate* function(GstElement* element, GstPadTemplate* compattempl) nothrow;
__gshared c_gst_element_get_compatible_pad_templateFn c_gst_element_get_compatible_pad_template; ///
private alias c_gst_element_get_contextFn = extern(C) GstContext* function(GstElement* element, const(char)* contextType) nothrow;
__gshared c_gst_element_get_contextFn c_gst_element_get_context; ///
private alias c_gst_element_get_context_unlockedFn = extern(C) GstContext* function(GstElement* element, const(char)* contextType) nothrow;
__gshared c_gst_element_get_context_unlockedFn c_gst_element_get_context_unlocked; ///
private alias c_gst_element_get_contextsFn = extern(C) GList* function(GstElement* element) nothrow;
__gshared c_gst_element_get_contextsFn c_gst_element_get_contexts; ///
private alias c_gst_element_get_current_clock_timeFn = extern(C) GstClockTime function(GstElement* element) nothrow;
__gshared c_gst_element_get_current_clock_timeFn c_gst_element_get_current_clock_time; ///
private alias c_gst_element_get_current_running_timeFn = extern(C) GstClockTime function(GstElement* element) nothrow;
__gshared c_gst_element_get_current_running_timeFn c_gst_element_get_current_running_time; ///
private alias c_gst_element_get_factoryFn = extern(C) GstElementFactory* function(GstElement* element) nothrow;
__gshared c_gst_element_get_factoryFn c_gst_element_get_factory; ///
private alias c_gst_element_get_metadataFn = extern(C) const(char)* function(GstElement* element, const(char)* key) nothrow;
__gshared c_gst_element_get_metadataFn c_gst_element_get_metadata; ///
private alias c_gst_element_get_pad_templateFn = extern(C) GstPadTemplate* function(GstElement* element, const(char)* name) nothrow;
__gshared c_gst_element_get_pad_templateFn c_gst_element_get_pad_template; ///
private alias c_gst_element_get_pad_template_listFn = extern(C) GList* function(GstElement* element) nothrow;
__gshared c_gst_element_get_pad_template_listFn c_gst_element_get_pad_template_list; ///
private alias c_gst_element_get_request_padFn = extern(C) GstPad* function(GstElement* element, const(char)* name) nothrow;
__gshared c_gst_element_get_request_padFn c_gst_element_get_request_pad; ///
private alias c_gst_element_get_start_timeFn = extern(C) GstClockTime function(GstElement* element) nothrow;
__gshared c_gst_element_get_start_timeFn c_gst_element_get_start_time; ///
private alias c_gst_element_get_stateFn = extern(C) GstStateChangeReturn function(GstElement* element, GstState* state, GstState* pending, GstClockTime timeout) nothrow;
__gshared c_gst_element_get_stateFn c_gst_element_get_state; ///
private alias c_gst_element_get_static_padFn = extern(C) GstPad* function(GstElement* element, const(char)* name) nothrow;
__gshared c_gst_element_get_static_padFn c_gst_element_get_static_pad; ///
private alias c_gst_element_is_locked_stateFn = extern(C) gboolean function(GstElement* element) nothrow;
__gshared c_gst_element_is_locked_stateFn c_gst_element_is_locked_state; ///
private alias c_gst_element_iterate_padsFn = extern(C) GstIterator* function(GstElement* element) nothrow;
__gshared c_gst_element_iterate_padsFn c_gst_element_iterate_pads; ///
private alias c_gst_element_iterate_sink_padsFn = extern(C) GstIterator* function(GstElement* element) nothrow;
__gshared c_gst_element_iterate_sink_padsFn c_gst_element_iterate_sink_pads; ///
private alias c_gst_element_iterate_src_padsFn = extern(C) GstIterator* function(GstElement* element) nothrow;
__gshared c_gst_element_iterate_src_padsFn c_gst_element_iterate_src_pads; ///
private alias c_gst_element_linkFn = extern(C) gboolean function(GstElement* src, GstElement* dest) nothrow;
__gshared c_gst_element_linkFn c_gst_element_link; ///
private alias c_gst_element_link_filteredFn = extern(C) gboolean function(GstElement* src, GstElement* dest, GstCaps* filter) nothrow;
__gshared c_gst_element_link_filteredFn c_gst_element_link_filtered; ///
private alias c_gst_element_link_manyFn = extern(C) gboolean function(GstElement* element1, GstElement* element2,  ...) nothrow;
__gshared c_gst_element_link_manyFn c_gst_element_link_many; ///
private alias c_gst_element_link_padsFn = extern(C) gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname) nothrow;
__gshared c_gst_element_link_padsFn c_gst_element_link_pads; ///
private alias c_gst_element_link_pads_filteredFn = extern(C) gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname, GstCaps* filter) nothrow;
__gshared c_gst_element_link_pads_filteredFn c_gst_element_link_pads_filtered; ///
private alias c_gst_element_link_pads_fullFn = extern(C) gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname, GstPadLinkCheck flags) nothrow;
__gshared c_gst_element_link_pads_fullFn c_gst_element_link_pads_full; ///
private alias c_gst_element_lost_stateFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_element_lost_stateFn c_gst_element_lost_state; ///
private alias c_gst_element_message_fullFn = extern(C) void function(GstElement* element, GstMessageType type, GQuark domain, int code, char* text, char* debug_, const(char)* file, const(char)* function_, int line) nothrow;
__gshared c_gst_element_message_fullFn c_gst_element_message_full; ///
private alias c_gst_element_message_full_with_detailsFn = extern(C) void function(GstElement* element, GstMessageType type, GQuark domain, int code, char* text, char* debug_, const(char)* file, const(char)* function_, int line, GstStructure* structure) nothrow;
__gshared c_gst_element_message_full_with_detailsFn c_gst_element_message_full_with_details; ///
private alias c_gst_element_no_more_padsFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_element_no_more_padsFn c_gst_element_no_more_pads; ///
private alias c_gst_element_post_messageFn = extern(C) gboolean function(GstElement* element, GstMessage* message) nothrow;
__gshared c_gst_element_post_messageFn c_gst_element_post_message; ///
private alias c_gst_element_provide_clockFn = extern(C) GstClock* function(GstElement* element) nothrow;
__gshared c_gst_element_provide_clockFn c_gst_element_provide_clock; ///
private alias c_gst_element_queryFn = extern(C) gboolean function(GstElement* element, GstQuery* query) nothrow;
__gshared c_gst_element_queryFn c_gst_element_query; ///
private alias c_gst_element_query_convertFn = extern(C) gboolean function(GstElement* element, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) nothrow;
__gshared c_gst_element_query_convertFn c_gst_element_query_convert; ///
private alias c_gst_element_query_durationFn = extern(C) gboolean function(GstElement* element, GstFormat format, long* duration) nothrow;
__gshared c_gst_element_query_durationFn c_gst_element_query_duration; ///
private alias c_gst_element_query_positionFn = extern(C) gboolean function(GstElement* element, GstFormat format, long* cur) nothrow;
__gshared c_gst_element_query_positionFn c_gst_element_query_position; ///
private alias c_gst_element_release_request_padFn = extern(C) void function(GstElement* element, GstPad* pad) nothrow;
__gshared c_gst_element_release_request_padFn c_gst_element_release_request_pad; ///
private alias c_gst_element_remove_padFn = extern(C) gboolean function(GstElement* element, GstPad* pad) nothrow;
__gshared c_gst_element_remove_padFn c_gst_element_remove_pad; ///
private alias c_gst_element_remove_property_notify_watchFn = extern(C) void function(GstElement* element, gulong watchId) nothrow;
__gshared c_gst_element_remove_property_notify_watchFn c_gst_element_remove_property_notify_watch; ///
private alias c_gst_element_request_padFn = extern(C) GstPad* function(GstElement* element, GstPadTemplate* templ, const(char)* name, const(GstCaps)* caps) nothrow;
__gshared c_gst_element_request_padFn c_gst_element_request_pad; ///
private alias c_gst_element_request_pad_simpleFn = extern(C) GstPad* function(GstElement* element, const(char)* name) nothrow;
__gshared c_gst_element_request_pad_simpleFn c_gst_element_request_pad_simple; ///
private alias c_gst_element_seekFn = extern(C) gboolean function(GstElement* element, double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, long start, GstSeekType stopType, long stop) nothrow;
__gshared c_gst_element_seekFn c_gst_element_seek; ///
private alias c_gst_element_seek_simpleFn = extern(C) gboolean function(GstElement* element, GstFormat format, GstSeekFlags seekFlags, long seekPos) nothrow;
__gshared c_gst_element_seek_simpleFn c_gst_element_seek_simple; ///
private alias c_gst_element_send_eventFn = extern(C) gboolean function(GstElement* element, GstEvent* event) nothrow;
__gshared c_gst_element_send_eventFn c_gst_element_send_event; ///
private alias c_gst_element_set_base_timeFn = extern(C) void function(GstElement* element, GstClockTime time) nothrow;
__gshared c_gst_element_set_base_timeFn c_gst_element_set_base_time; ///
private alias c_gst_element_set_busFn = extern(C) void function(GstElement* element, GstBus* bus) nothrow;
__gshared c_gst_element_set_busFn c_gst_element_set_bus; ///
private alias c_gst_element_set_clockFn = extern(C) gboolean function(GstElement* element, GstClock* clock) nothrow;
__gshared c_gst_element_set_clockFn c_gst_element_set_clock; ///
private alias c_gst_element_set_contextFn = extern(C) void function(GstElement* element, GstContext* context) nothrow;
__gshared c_gst_element_set_contextFn c_gst_element_set_context; ///
private alias c_gst_element_set_locked_stateFn = extern(C) gboolean function(GstElement* element, gboolean lockedState) nothrow;
__gshared c_gst_element_set_locked_stateFn c_gst_element_set_locked_state; ///
private alias c_gst_element_set_start_timeFn = extern(C) void function(GstElement* element, GstClockTime time) nothrow;
__gshared c_gst_element_set_start_timeFn c_gst_element_set_start_time; ///
private alias c_gst_element_set_stateFn = extern(C) GstStateChangeReturn function(GstElement* element, GstState state) nothrow;
__gshared c_gst_element_set_stateFn c_gst_element_set_state; ///
private alias c_gst_element_sync_state_with_parentFn = extern(C) gboolean function(GstElement* element) nothrow;
__gshared c_gst_element_sync_state_with_parentFn c_gst_element_sync_state_with_parent; ///
private alias c_gst_element_unlinkFn = extern(C) void function(GstElement* src, GstElement* dest) nothrow;
__gshared c_gst_element_unlinkFn c_gst_element_unlink; ///
private alias c_gst_element_unlink_manyFn = extern(C) void function(GstElement* element1, GstElement* element2,  ...) nothrow;
__gshared c_gst_element_unlink_manyFn c_gst_element_unlink_many; ///
private alias c_gst_element_unlink_padsFn = extern(C) void function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname) nothrow;
__gshared c_gst_element_unlink_padsFn c_gst_element_unlink_pads; ///

// ElementClass
private alias c_gst_element_class_add_metadataFn = extern(C) void function(GstElementClass* klass, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_element_class_add_metadataFn c_gst_element_class_add_metadata; ///
private alias c_gst_element_class_add_pad_templateFn = extern(C) void function(GstElementClass* klass, GstPadTemplate* templ) nothrow;
__gshared c_gst_element_class_add_pad_templateFn c_gst_element_class_add_pad_template; ///
private alias c_gst_element_class_add_static_metadataFn = extern(C) void function(GstElementClass* klass, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_element_class_add_static_metadataFn c_gst_element_class_add_static_metadata; ///
private alias c_gst_element_class_add_static_pad_templateFn = extern(C) void function(GstElementClass* klass, GstStaticPadTemplate* staticTempl) nothrow;
__gshared c_gst_element_class_add_static_pad_templateFn c_gst_element_class_add_static_pad_template; ///
private alias c_gst_element_class_add_static_pad_template_with_gtypeFn = extern(C) void function(GstElementClass* klass, GstStaticPadTemplate* staticTempl, GType padType) nothrow;
__gshared c_gst_element_class_add_static_pad_template_with_gtypeFn c_gst_element_class_add_static_pad_template_with_gtype; ///
private alias c_gst_element_class_get_metadataFn = extern(C) const(char)* function(GstElementClass* klass, const(char)* key) nothrow;
__gshared c_gst_element_class_get_metadataFn c_gst_element_class_get_metadata; ///
private alias c_gst_element_class_get_pad_templateFn = extern(C) GstPadTemplate* function(GstElementClass* elementClass, const(char)* name) nothrow;
__gshared c_gst_element_class_get_pad_templateFn c_gst_element_class_get_pad_template; ///
private alias c_gst_element_class_get_pad_template_listFn = extern(C) GList* function(GstElementClass* elementClass) nothrow;
__gshared c_gst_element_class_get_pad_template_listFn c_gst_element_class_get_pad_template_list; ///
private alias c_gst_element_class_set_metadataFn = extern(C) void function(GstElementClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) nothrow;
__gshared c_gst_element_class_set_metadataFn c_gst_element_class_set_metadata; ///
private alias c_gst_element_class_set_static_metadataFn = extern(C) void function(GstElementClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) nothrow;
__gshared c_gst_element_class_set_static_metadataFn c_gst_element_class_set_static_metadata; ///

// ElementFactory
private alias c_gst_element_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_element_factory_get_typeFn c_gst_element_factory_get_type; ///
private alias c_gst_element_factory_findFn = extern(C) GstElementFactory* function(const(char)* name) nothrow;
__gshared c_gst_element_factory_findFn c_gst_element_factory_find; ///
private alias c_gst_element_factory_list_filterFn = extern(C) GList* function(GList* list, const(GstCaps)* caps, GstPadDirection direction, gboolean subsetonly) nothrow;
__gshared c_gst_element_factory_list_filterFn c_gst_element_factory_list_filter; ///
private alias c_gst_element_factory_list_get_elementsFn = extern(C) GList* function(GstElementFactoryListType type, GstRank minrank) nothrow;
__gshared c_gst_element_factory_list_get_elementsFn c_gst_element_factory_list_get_elements; ///
private alias c_gst_element_factory_makeFn = extern(C) GstElement* function(const(char)* factoryname, const(char)* name) nothrow;
__gshared c_gst_element_factory_makeFn c_gst_element_factory_make; ///
private alias c_gst_element_factory_make_fullFn = extern(C) GstElement* function(const(char)* factoryname, const(char)* first,  ...) nothrow;
__gshared c_gst_element_factory_make_fullFn c_gst_element_factory_make_full; ///
private alias c_gst_element_factory_make_valistFn = extern(C) GstElement* function(const(char)* factoryname, const(char)* first, void* properties) nothrow;
__gshared c_gst_element_factory_make_valistFn c_gst_element_factory_make_valist; ///
private alias c_gst_element_factory_make_with_propertiesFn = extern(C) GstElement* function(const(char)* factoryname, uint n, const(char*)* names, const(GValue)* values) nothrow;
__gshared c_gst_element_factory_make_with_propertiesFn c_gst_element_factory_make_with_properties; ///
private alias c_gst_element_factory_can_sink_all_capsFn = extern(C) gboolean function(GstElementFactory* factory, const(GstCaps)* caps) nothrow;
__gshared c_gst_element_factory_can_sink_all_capsFn c_gst_element_factory_can_sink_all_caps; ///
private alias c_gst_element_factory_can_sink_any_capsFn = extern(C) gboolean function(GstElementFactory* factory, const(GstCaps)* caps) nothrow;
__gshared c_gst_element_factory_can_sink_any_capsFn c_gst_element_factory_can_sink_any_caps; ///
private alias c_gst_element_factory_can_src_all_capsFn = extern(C) gboolean function(GstElementFactory* factory, const(GstCaps)* caps) nothrow;
__gshared c_gst_element_factory_can_src_all_capsFn c_gst_element_factory_can_src_all_caps; ///
private alias c_gst_element_factory_can_src_any_capsFn = extern(C) gboolean function(GstElementFactory* factory, const(GstCaps)* caps) nothrow;
__gshared c_gst_element_factory_can_src_any_capsFn c_gst_element_factory_can_src_any_caps; ///
private alias c_gst_element_factory_createFn = extern(C) GstElement* function(GstElementFactory* factory, const(char)* name) nothrow;
__gshared c_gst_element_factory_createFn c_gst_element_factory_create; ///
private alias c_gst_element_factory_create_fullFn = extern(C) GstElement* function(GstElementFactory* factory, const(char)* first,  ...) nothrow;
__gshared c_gst_element_factory_create_fullFn c_gst_element_factory_create_full; ///
private alias c_gst_element_factory_create_valistFn = extern(C) GstElement* function(GstElementFactory* factory, const(char)* first, void* properties) nothrow;
__gshared c_gst_element_factory_create_valistFn c_gst_element_factory_create_valist; ///
private alias c_gst_element_factory_create_with_propertiesFn = extern(C) GstElement* function(GstElementFactory* factory, uint n, const(char*)* names, const(GValue)* values) nothrow;
__gshared c_gst_element_factory_create_with_propertiesFn c_gst_element_factory_create_with_properties; ///
private alias c_gst_element_factory_get_element_typeFn = extern(C) GType function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_element_typeFn c_gst_element_factory_get_element_type; ///
private alias c_gst_element_factory_get_metadataFn = extern(C) const(char)* function(GstElementFactory* factory, const(char)* key) nothrow;
__gshared c_gst_element_factory_get_metadataFn c_gst_element_factory_get_metadata; ///
private alias c_gst_element_factory_get_metadata_keysFn = extern(C) char** function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_metadata_keysFn c_gst_element_factory_get_metadata_keys; ///
private alias c_gst_element_factory_get_num_pad_templatesFn = extern(C) uint function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_num_pad_templatesFn c_gst_element_factory_get_num_pad_templates; ///
private alias c_gst_element_factory_get_skip_documentationFn = extern(C) gboolean function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_skip_documentationFn c_gst_element_factory_get_skip_documentation; ///
private alias c_gst_element_factory_get_static_pad_templatesFn = extern(C) const(GList)* function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_static_pad_templatesFn c_gst_element_factory_get_static_pad_templates; ///
private alias c_gst_element_factory_get_uri_protocolsFn = extern(C) const(char*)* function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_uri_protocolsFn c_gst_element_factory_get_uri_protocols; ///
private alias c_gst_element_factory_get_uri_typeFn = extern(C) GstURIType function(GstElementFactory* factory) nothrow;
__gshared c_gst_element_factory_get_uri_typeFn c_gst_element_factory_get_uri_type; ///
private alias c_gst_element_factory_has_interfaceFn = extern(C) gboolean function(GstElementFactory* factory, const(char)* interfacename) nothrow;
__gshared c_gst_element_factory_has_interfaceFn c_gst_element_factory_has_interface; ///
private alias c_gst_element_factory_list_is_typeFn = extern(C) gboolean function(GstElementFactory* factory, GstElementFactoryListType type) nothrow;
__gshared c_gst_element_factory_list_is_typeFn c_gst_element_factory_list_is_type; ///

// Event
private alias c_gst_event_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_event_get_typeFn c_gst_event_get_type; ///
private alias c_gst_event_new_buffer_sizeFn = extern(C) GstEvent* function(GstFormat format, long minsize, long maxsize, gboolean async) nothrow;
__gshared c_gst_event_new_buffer_sizeFn c_gst_event_new_buffer_size; ///
private alias c_gst_event_new_capsFn = extern(C) GstEvent* function(GstCaps* caps) nothrow;
__gshared c_gst_event_new_capsFn c_gst_event_new_caps; ///
private alias c_gst_event_new_customFn = extern(C) GstEvent* function(GstEventType type, GstStructure* structure) nothrow;
__gshared c_gst_event_new_customFn c_gst_event_new_custom; ///
private alias c_gst_event_new_eosFn = extern(C) GstEvent* function() nothrow;
__gshared c_gst_event_new_eosFn c_gst_event_new_eos; ///
private alias c_gst_event_new_flush_startFn = extern(C) GstEvent* function() nothrow;
__gshared c_gst_event_new_flush_startFn c_gst_event_new_flush_start; ///
private alias c_gst_event_new_flush_stopFn = extern(C) GstEvent* function(gboolean resetTime) nothrow;
__gshared c_gst_event_new_flush_stopFn c_gst_event_new_flush_stop; ///
private alias c_gst_event_new_gapFn = extern(C) GstEvent* function(GstClockTime timestamp, GstClockTime duration) nothrow;
__gshared c_gst_event_new_gapFn c_gst_event_new_gap; ///
private alias c_gst_event_new_instant_rate_changeFn = extern(C) GstEvent* function(double rateMultiplier, GstSegmentFlags newFlags) nothrow;
__gshared c_gst_event_new_instant_rate_changeFn c_gst_event_new_instant_rate_change; ///
private alias c_gst_event_new_instant_rate_sync_timeFn = extern(C) GstEvent* function(double rateMultiplier, GstClockTime runningTime, GstClockTime upstreamRunningTime) nothrow;
__gshared c_gst_event_new_instant_rate_sync_timeFn c_gst_event_new_instant_rate_sync_time; ///
private alias c_gst_event_new_latencyFn = extern(C) GstEvent* function(GstClockTime latency) nothrow;
__gshared c_gst_event_new_latencyFn c_gst_event_new_latency; ///
private alias c_gst_event_new_navigationFn = extern(C) GstEvent* function(GstStructure* structure) nothrow;
__gshared c_gst_event_new_navigationFn c_gst_event_new_navigation; ///
private alias c_gst_event_new_protectionFn = extern(C) GstEvent* function(const(char)* systemId, GstBuffer* data, const(char)* origin) nothrow;
__gshared c_gst_event_new_protectionFn c_gst_event_new_protection; ///
private alias c_gst_event_new_qosFn = extern(C) GstEvent* function(GstQOSType type, double proportion, GstClockTimeDiff diff, GstClockTime timestamp) nothrow;
__gshared c_gst_event_new_qosFn c_gst_event_new_qos; ///
private alias c_gst_event_new_reconfigureFn = extern(C) GstEvent* function() nothrow;
__gshared c_gst_event_new_reconfigureFn c_gst_event_new_reconfigure; ///
private alias c_gst_event_new_seekFn = extern(C) GstEvent* function(double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, long start, GstSeekType stopType, long stop) nothrow;
__gshared c_gst_event_new_seekFn c_gst_event_new_seek; ///
private alias c_gst_event_new_segmentFn = extern(C) GstEvent* function(const(GstSegment)* segment) nothrow;
__gshared c_gst_event_new_segmentFn c_gst_event_new_segment; ///
private alias c_gst_event_new_segment_doneFn = extern(C) GstEvent* function(GstFormat format, long position) nothrow;
__gshared c_gst_event_new_segment_doneFn c_gst_event_new_segment_done; ///
private alias c_gst_event_new_select_streamsFn = extern(C) GstEvent* function(GList* streams) nothrow;
__gshared c_gst_event_new_select_streamsFn c_gst_event_new_select_streams; ///
private alias c_gst_event_new_sink_messageFn = extern(C) GstEvent* function(const(char)* name, GstMessage* msg) nothrow;
__gshared c_gst_event_new_sink_messageFn c_gst_event_new_sink_message; ///
private alias c_gst_event_new_stepFn = extern(C) GstEvent* function(GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate) nothrow;
__gshared c_gst_event_new_stepFn c_gst_event_new_step; ///
private alias c_gst_event_new_stream_collectionFn = extern(C) GstEvent* function(GstStreamCollection* collection) nothrow;
__gshared c_gst_event_new_stream_collectionFn c_gst_event_new_stream_collection; ///
private alias c_gst_event_new_stream_group_doneFn = extern(C) GstEvent* function(uint groupId) nothrow;
__gshared c_gst_event_new_stream_group_doneFn c_gst_event_new_stream_group_done; ///
private alias c_gst_event_new_stream_startFn = extern(C) GstEvent* function(const(char)* streamId) nothrow;
__gshared c_gst_event_new_stream_startFn c_gst_event_new_stream_start; ///
private alias c_gst_event_new_tagFn = extern(C) GstEvent* function(GstTagList* taglist) nothrow;
__gshared c_gst_event_new_tagFn c_gst_event_new_tag; ///
private alias c_gst_event_new_tocFn = extern(C) GstEvent* function(GstToc* toc, gboolean updated) nothrow;
__gshared c_gst_event_new_tocFn c_gst_event_new_toc; ///
private alias c_gst_event_new_toc_selectFn = extern(C) GstEvent* function(const(char)* uid) nothrow;
__gshared c_gst_event_new_toc_selectFn c_gst_event_new_toc_select; ///
private alias c_gst_event_copyFn = extern(C) GstEvent* function(const(GstEvent)* event) nothrow;
__gshared c_gst_event_copyFn c_gst_event_copy; ///
private alias c_gst_event_copy_segmentFn = extern(C) void function(GstEvent* event, GstSegment* segment) nothrow;
__gshared c_gst_event_copy_segmentFn c_gst_event_copy_segment; ///
private alias c_gst_event_get_running_time_offsetFn = extern(C) long function(GstEvent* event) nothrow;
__gshared c_gst_event_get_running_time_offsetFn c_gst_event_get_running_time_offset; ///
private alias c_gst_event_get_seqnumFn = extern(C) uint function(GstEvent* event) nothrow;
__gshared c_gst_event_get_seqnumFn c_gst_event_get_seqnum; ///
private alias c_gst_event_get_structureFn = extern(C) const(GstStructure)* function(GstEvent* event) nothrow;
__gshared c_gst_event_get_structureFn c_gst_event_get_structure; ///
private alias c_gst_event_has_nameFn = extern(C) gboolean function(GstEvent* event, const(char)* name) nothrow;
__gshared c_gst_event_has_nameFn c_gst_event_has_name; ///
private alias c_gst_event_has_name_idFn = extern(C) gboolean function(GstEvent* event, GQuark name) nothrow;
__gshared c_gst_event_has_name_idFn c_gst_event_has_name_id; ///
private alias c_gst_event_is_writableFn = extern(C) gboolean function(const(GstEvent)* event) nothrow;
__gshared c_gst_event_is_writableFn c_gst_event_is_writable; ///
private alias c_gst_event_make_writableFn = extern(C) GstEvent* function(GstEvent* event) nothrow;
__gshared c_gst_event_make_writableFn c_gst_event_make_writable; ///
private alias c_gst_event_parse_buffer_sizeFn = extern(C) void function(GstEvent* event, GstFormat* format, long* minsize, long* maxsize, gboolean* async) nothrow;
__gshared c_gst_event_parse_buffer_sizeFn c_gst_event_parse_buffer_size; ///
private alias c_gst_event_parse_capsFn = extern(C) void function(GstEvent* event, GstCaps** caps) nothrow;
__gshared c_gst_event_parse_capsFn c_gst_event_parse_caps; ///
private alias c_gst_event_parse_flush_stopFn = extern(C) void function(GstEvent* event, gboolean* resetTime) nothrow;
__gshared c_gst_event_parse_flush_stopFn c_gst_event_parse_flush_stop; ///
private alias c_gst_event_parse_gapFn = extern(C) void function(GstEvent* event, GstClockTime* timestamp, GstClockTime* duration) nothrow;
__gshared c_gst_event_parse_gapFn c_gst_event_parse_gap; ///
private alias c_gst_event_parse_gap_flagsFn = extern(C) void function(GstEvent* event, GstGapFlags* flags) nothrow;
__gshared c_gst_event_parse_gap_flagsFn c_gst_event_parse_gap_flags; ///
private alias c_gst_event_parse_group_idFn = extern(C) gboolean function(GstEvent* event, uint* groupId) nothrow;
__gshared c_gst_event_parse_group_idFn c_gst_event_parse_group_id; ///
private alias c_gst_event_parse_instant_rate_changeFn = extern(C) void function(GstEvent* event, double* rateMultiplier, GstSegmentFlags* newFlags) nothrow;
__gshared c_gst_event_parse_instant_rate_changeFn c_gst_event_parse_instant_rate_change; ///
private alias c_gst_event_parse_instant_rate_sync_timeFn = extern(C) void function(GstEvent* event, double* rateMultiplier, GstClockTime* runningTime, GstClockTime* upstreamRunningTime) nothrow;
__gshared c_gst_event_parse_instant_rate_sync_timeFn c_gst_event_parse_instant_rate_sync_time; ///
private alias c_gst_event_parse_latencyFn = extern(C) void function(GstEvent* event, GstClockTime* latency) nothrow;
__gshared c_gst_event_parse_latencyFn c_gst_event_parse_latency; ///
private alias c_gst_event_parse_protectionFn = extern(C) void function(GstEvent* event, const(char*)* systemId, GstBuffer** data, const(char*)* origin) nothrow;
__gshared c_gst_event_parse_protectionFn c_gst_event_parse_protection; ///
private alias c_gst_event_parse_qosFn = extern(C) void function(GstEvent* event, GstQOSType* type, double* proportion, GstClockTimeDiff* diff, GstClockTime* timestamp) nothrow;
__gshared c_gst_event_parse_qosFn c_gst_event_parse_qos; ///
private alias c_gst_event_parse_seekFn = extern(C) void function(GstEvent* event, double* rate, GstFormat* format, GstSeekFlags* flags, GstSeekType* startType, long* start, GstSeekType* stopType, long* stop) nothrow;
__gshared c_gst_event_parse_seekFn c_gst_event_parse_seek; ///
private alias c_gst_event_parse_seek_trickmode_intervalFn = extern(C) void function(GstEvent* event, GstClockTime* interval) nothrow;
__gshared c_gst_event_parse_seek_trickmode_intervalFn c_gst_event_parse_seek_trickmode_interval; ///
private alias c_gst_event_parse_segmentFn = extern(C) void function(GstEvent* event, const(GstSegment*)* segment) nothrow;
__gshared c_gst_event_parse_segmentFn c_gst_event_parse_segment; ///
private alias c_gst_event_parse_segment_doneFn = extern(C) void function(GstEvent* event, GstFormat* format, long* position) nothrow;
__gshared c_gst_event_parse_segment_doneFn c_gst_event_parse_segment_done; ///
private alias c_gst_event_parse_select_streamsFn = extern(C) void function(GstEvent* event, GList** streams) nothrow;
__gshared c_gst_event_parse_select_streamsFn c_gst_event_parse_select_streams; ///
private alias c_gst_event_parse_sink_messageFn = extern(C) void function(GstEvent* event, GstMessage** msg) nothrow;
__gshared c_gst_event_parse_sink_messageFn c_gst_event_parse_sink_message; ///
private alias c_gst_event_parse_stepFn = extern(C) void function(GstEvent* event, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate) nothrow;
__gshared c_gst_event_parse_stepFn c_gst_event_parse_step; ///
private alias c_gst_event_parse_streamFn = extern(C) void function(GstEvent* event, GstStream** stream) nothrow;
__gshared c_gst_event_parse_streamFn c_gst_event_parse_stream; ///
private alias c_gst_event_parse_stream_collectionFn = extern(C) void function(GstEvent* event, GstStreamCollection** collection) nothrow;
__gshared c_gst_event_parse_stream_collectionFn c_gst_event_parse_stream_collection; ///
private alias c_gst_event_parse_stream_flagsFn = extern(C) void function(GstEvent* event, GstStreamFlags* flags) nothrow;
__gshared c_gst_event_parse_stream_flagsFn c_gst_event_parse_stream_flags; ///
private alias c_gst_event_parse_stream_group_doneFn = extern(C) void function(GstEvent* event, uint* groupId) nothrow;
__gshared c_gst_event_parse_stream_group_doneFn c_gst_event_parse_stream_group_done; ///
private alias c_gst_event_parse_stream_startFn = extern(C) void function(GstEvent* event, const(char*)* streamId) nothrow;
__gshared c_gst_event_parse_stream_startFn c_gst_event_parse_stream_start; ///
private alias c_gst_event_parse_tagFn = extern(C) void function(GstEvent* event, GstTagList** taglist) nothrow;
__gshared c_gst_event_parse_tagFn c_gst_event_parse_tag; ///
private alias c_gst_event_parse_tocFn = extern(C) void function(GstEvent* event, GstToc** toc, gboolean* updated) nothrow;
__gshared c_gst_event_parse_tocFn c_gst_event_parse_toc; ///
private alias c_gst_event_parse_toc_selectFn = extern(C) void function(GstEvent* event, char** uid) nothrow;
__gshared c_gst_event_parse_toc_selectFn c_gst_event_parse_toc_select; ///
private alias c_gst_event_refFn = extern(C) GstEvent* function(GstEvent* event) nothrow;
__gshared c_gst_event_refFn c_gst_event_ref; ///
private alias c_gst_event_set_gap_flagsFn = extern(C) void function(GstEvent* event, GstGapFlags flags) nothrow;
__gshared c_gst_event_set_gap_flagsFn c_gst_event_set_gap_flags; ///
private alias c_gst_event_set_group_idFn = extern(C) void function(GstEvent* event, uint groupId) nothrow;
__gshared c_gst_event_set_group_idFn c_gst_event_set_group_id; ///
private alias c_gst_event_set_running_time_offsetFn = extern(C) void function(GstEvent* event, long offset) nothrow;
__gshared c_gst_event_set_running_time_offsetFn c_gst_event_set_running_time_offset; ///
private alias c_gst_event_set_seek_trickmode_intervalFn = extern(C) void function(GstEvent* event, GstClockTime interval) nothrow;
__gshared c_gst_event_set_seek_trickmode_intervalFn c_gst_event_set_seek_trickmode_interval; ///
private alias c_gst_event_set_seqnumFn = extern(C) void function(GstEvent* event, uint seqnum) nothrow;
__gshared c_gst_event_set_seqnumFn c_gst_event_set_seqnum; ///
private alias c_gst_event_set_streamFn = extern(C) void function(GstEvent* event, GstStream* stream) nothrow;
__gshared c_gst_event_set_streamFn c_gst_event_set_stream; ///
private alias c_gst_event_set_stream_flagsFn = extern(C) void function(GstEvent* event, GstStreamFlags flags) nothrow;
__gshared c_gst_event_set_stream_flagsFn c_gst_event_set_stream_flags; ///
private alias c_gst_event_unrefFn = extern(C) void function(GstEvent* event) nothrow;
__gshared c_gst_event_unrefFn c_gst_event_unref; ///
private alias c_gst_event_writable_structureFn = extern(C) GstStructure* function(GstEvent* event) nothrow;
__gshared c_gst_event_writable_structureFn c_gst_event_writable_structure; ///
private alias c_gst_event_replaceFn = extern(C) gboolean function(GstEvent** oldEvent, GstEvent* newEvent) nothrow;
__gshared c_gst_event_replaceFn c_gst_event_replace; ///
private alias c_gst_event_stealFn = extern(C) GstEvent* function(GstEvent** oldEvent) nothrow;
__gshared c_gst_event_stealFn c_gst_event_steal; ///
private alias c_gst_event_takeFn = extern(C) gboolean function(GstEvent** oldEvent, GstEvent* newEvent) nothrow;
__gshared c_gst_event_takeFn c_gst_event_take; ///

// FlagSet
private alias c_gst_flagset_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_flagset_get_typeFn c_gst_flagset_get_type; ///
private alias c_gst_flagset_registerFn = extern(C) GType function(GType flagsType) nothrow;
__gshared c_gst_flagset_registerFn c_gst_flagset_register; ///

// Fraction
private alias c_gst_fraction_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_fraction_get_typeFn c_gst_fraction_get_type; ///

// FractionRange
private alias c_gst_fraction_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_fraction_range_get_typeFn c_gst_fraction_range_get_type; ///

// GhostPad
private alias c_gst_ghost_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_ghost_pad_get_typeFn c_gst_ghost_pad_get_type; ///
private alias c_gst_ghost_pad_newFn = extern(C) GstPad* function(const(char)* name, GstPad* target) nothrow;
__gshared c_gst_ghost_pad_newFn c_gst_ghost_pad_new; ///
private alias c_gst_ghost_pad_new_from_templateFn = extern(C) GstPad* function(const(char)* name, GstPad* target, GstPadTemplate* templ) nothrow;
__gshared c_gst_ghost_pad_new_from_templateFn c_gst_ghost_pad_new_from_template; ///
private alias c_gst_ghost_pad_new_no_targetFn = extern(C) GstPad* function(const(char)* name, GstPadDirection dir) nothrow;
__gshared c_gst_ghost_pad_new_no_targetFn c_gst_ghost_pad_new_no_target; ///
private alias c_gst_ghost_pad_new_no_target_from_templateFn = extern(C) GstPad* function(const(char)* name, GstPadTemplate* templ) nothrow;
__gshared c_gst_ghost_pad_new_no_target_from_templateFn c_gst_ghost_pad_new_no_target_from_template; ///
private alias c_gst_ghost_pad_activate_mode_defaultFn = extern(C) gboolean function(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) nothrow;
__gshared c_gst_ghost_pad_activate_mode_defaultFn c_gst_ghost_pad_activate_mode_default; ///
private alias c_gst_ghost_pad_internal_activate_mode_defaultFn = extern(C) gboolean function(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) nothrow;
__gshared c_gst_ghost_pad_internal_activate_mode_defaultFn c_gst_ghost_pad_internal_activate_mode_default; ///
private alias c_gst_ghost_pad_constructFn = extern(C) gboolean function(GstGhostPad* gpad) nothrow;
__gshared c_gst_ghost_pad_constructFn c_gst_ghost_pad_construct; ///
private alias c_gst_ghost_pad_get_targetFn = extern(C) GstPad* function(GstGhostPad* gpad) nothrow;
__gshared c_gst_ghost_pad_get_targetFn c_gst_ghost_pad_get_target; ///
private alias c_gst_ghost_pad_set_targetFn = extern(C) gboolean function(GstGhostPad* gpad, GstPad* newtarget) nothrow;
__gshared c_gst_ghost_pad_set_targetFn c_gst_ghost_pad_set_target; ///

// IdStr
private alias c_gst_id_str_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_id_str_get_typeFn c_gst_id_str_get_type; ///
private alias c_gst_id_str_newFn = extern(C) GstIdStr* function() nothrow;
__gshared c_gst_id_str_newFn c_gst_id_str_new; ///
private alias c_gst_id_str_as_strFn = extern(C) const(char)* function(const(GstIdStr)* s) nothrow;
__gshared c_gst_id_str_as_strFn c_gst_id_str_as_str; ///
private alias c_gst_id_str_clearFn = extern(C) void function(GstIdStr* s) nothrow;
__gshared c_gst_id_str_clearFn c_gst_id_str_clear; ///
private alias c_gst_id_str_copyFn = extern(C) GstIdStr* function(const(GstIdStr)* s) nothrow;
__gshared c_gst_id_str_copyFn c_gst_id_str_copy; ///
private alias c_gst_id_str_copy_intoFn = extern(C) void function(GstIdStr* d, const(GstIdStr)* s) nothrow;
__gshared c_gst_id_str_copy_intoFn c_gst_id_str_copy_into; ///
private alias c_gst_id_str_freeFn = extern(C) void function(GstIdStr* s) nothrow;
__gshared c_gst_id_str_freeFn c_gst_id_str_free; ///
private alias c_gst_id_str_get_lenFn = extern(C) size_t function(const(GstIdStr)* s) nothrow;
__gshared c_gst_id_str_get_lenFn c_gst_id_str_get_len; ///
private alias c_gst_id_str_initFn = extern(C) void function(GstIdStr* s) nothrow;
__gshared c_gst_id_str_initFn c_gst_id_str_init; ///
private alias c_gst_id_str_is_equalFn = extern(C) gboolean function(const(GstIdStr)* s1, const(GstIdStr)* s2) nothrow;
__gshared c_gst_id_str_is_equalFn c_gst_id_str_is_equal; ///
private alias c_gst_id_str_is_equal_to_strFn = extern(C) gboolean function(const(GstIdStr)* s1, const(char)* s2) nothrow;
__gshared c_gst_id_str_is_equal_to_strFn c_gst_id_str_is_equal_to_str; ///
private alias c_gst_id_str_is_equal_to_str_with_lenFn = extern(C) gboolean function(const(GstIdStr)* s1, const(char)* s2, size_t len) nothrow;
__gshared c_gst_id_str_is_equal_to_str_with_lenFn c_gst_id_str_is_equal_to_str_with_len; ///
private alias c_gst_id_str_moveFn = extern(C) void function(GstIdStr* d, GstIdStr* s) nothrow;
__gshared c_gst_id_str_moveFn c_gst_id_str_move; ///
private alias c_gst_id_str_setFn = extern(C) void function(GstIdStr* s, const(char)* value) nothrow;
__gshared c_gst_id_str_setFn c_gst_id_str_set; ///
private alias c_gst_id_str_set_static_strFn = extern(C) void function(GstIdStr* s, const(char)* value) nothrow;
__gshared c_gst_id_str_set_static_strFn c_gst_id_str_set_static_str; ///
private alias c_gst_id_str_set_static_str_with_lenFn = extern(C) void function(GstIdStr* s, const(char)* value, size_t len) nothrow;
__gshared c_gst_id_str_set_static_str_with_lenFn c_gst_id_str_set_static_str_with_len; ///
private alias c_gst_id_str_set_with_lenFn = extern(C) void function(GstIdStr* s, const(char)* value, size_t len) nothrow;
__gshared c_gst_id_str_set_with_lenFn c_gst_id_str_set_with_len; ///

// Int64Range
private alias c_gst_int64_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_int64_range_get_typeFn c_gst_int64_range_get_type; ///

// IntRange
private alias c_gst_int_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_int_range_get_typeFn c_gst_int_range_get_type; ///

// Iterator
private alias c_gst_iterator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_iterator_get_typeFn c_gst_iterator_get_type; ///
private alias c_gst_iterator_newFn = extern(C) GstIterator* function(uint size, GType type, GMutex* lock, uint* masterCookie, GstIteratorCopyFunction copy, GstIteratorNextFunction next, GstIteratorItemFunction item, GstIteratorResyncFunction resync, GstIteratorFreeFunction free) nothrow;
__gshared c_gst_iterator_newFn c_gst_iterator_new; ///
private alias c_gst_iterator_new_listFn = extern(C) GstIterator* function(GType type, GMutex* lock, uint* masterCookie, GList** list, GObject* owner, GstIteratorItemFunction item) nothrow;
__gshared c_gst_iterator_new_listFn c_gst_iterator_new_list; ///
private alias c_gst_iterator_new_singleFn = extern(C) GstIterator* function(GType type, const(GValue)* object) nothrow;
__gshared c_gst_iterator_new_singleFn c_gst_iterator_new_single; ///
private alias c_gst_iterator_copyFn = extern(C) GstIterator* function(const(GstIterator)* it) nothrow;
__gshared c_gst_iterator_copyFn c_gst_iterator_copy; ///
private alias c_gst_iterator_filterFn = extern(C) GstIterator* function(GstIterator* it, GCompareFunc func, const(GValue)* userData) nothrow;
__gshared c_gst_iterator_filterFn c_gst_iterator_filter; ///
private alias c_gst_iterator_find_customFn = extern(C) gboolean function(GstIterator* it, GCompareFunc func, GValue* elem, void* userData) nothrow;
__gshared c_gst_iterator_find_customFn c_gst_iterator_find_custom; ///
private alias c_gst_iterator_foldFn = extern(C) GstIteratorResult function(GstIterator* it, GstIteratorFoldFunction func, GValue* ret, void* userData) nothrow;
__gshared c_gst_iterator_foldFn c_gst_iterator_fold; ///
private alias c_gst_iterator_foreachFn = extern(C) GstIteratorResult function(GstIterator* it, GstIteratorForeachFunction func, void* userData) nothrow;
__gshared c_gst_iterator_foreachFn c_gst_iterator_foreach; ///
private alias c_gst_iterator_freeFn = extern(C) void function(GstIterator* it) nothrow;
__gshared c_gst_iterator_freeFn c_gst_iterator_free; ///
private alias c_gst_iterator_nextFn = extern(C) GstIteratorResult function(GstIterator* it, GValue* elem) nothrow;
__gshared c_gst_iterator_nextFn c_gst_iterator_next; ///
private alias c_gst_iterator_pushFn = extern(C) void function(GstIterator* it, GstIterator* other) nothrow;
__gshared c_gst_iterator_pushFn c_gst_iterator_push; ///
private alias c_gst_iterator_resyncFn = extern(C) void function(GstIterator* it) nothrow;
__gshared c_gst_iterator_resyncFn c_gst_iterator_resync; ///

// LogContext
private alias c_gst_log_context_freeFn = extern(C) void function(GstLogContext* ctx) nothrow;
__gshared c_gst_log_context_freeFn c_gst_log_context_free; ///
private alias c_gst_log_context_get_categoryFn = extern(C) GstDebugCategory* function(GstLogContext* context) nothrow;
__gshared c_gst_log_context_get_categoryFn c_gst_log_context_get_category; ///
private alias c_gst_log_context_resetFn = extern(C) void function(GstLogContext* ctx) nothrow;
__gshared c_gst_log_context_resetFn c_gst_log_context_reset; ///

// LogContextBuilder
private alias c_gst_log_context_builder_buildFn = extern(C) GstLogContext* function(GstLogContextBuilder* builder) nothrow;
__gshared c_gst_log_context_builder_buildFn c_gst_log_context_builder_build; ///
private alias c_gst_log_context_builder_set_categoryFn = extern(C) GstLogContextBuilder* function(GstLogContextBuilder* builder, GstDebugCategory* category) nothrow;
__gshared c_gst_log_context_builder_set_categoryFn c_gst_log_context_builder_set_category; ///
private alias c_gst_log_context_builder_set_hash_flagsFn = extern(C) GstLogContextBuilder* function(GstLogContextBuilder* builder, GstLogContextHashFlags flags) nothrow;
__gshared c_gst_log_context_builder_set_hash_flagsFn c_gst_log_context_builder_set_hash_flags; ///
private alias c_gst_log_context_builder_set_intervalFn = extern(C) GstLogContextBuilder* function(GstLogContextBuilder* builder, GstClockTime interval) nothrow;
__gshared c_gst_log_context_builder_set_intervalFn c_gst_log_context_builder_set_interval; ///
private alias c_gst_log_context_builder_newFn = extern(C) GstLogContextBuilder* function(GstDebugCategory* category, GstLogContextFlags flags) nothrow;
__gshared c_gst_log_context_builder_newFn c_gst_log_context_builder_new; ///

// MapInfo
private alias c_gst_map_info_clearFn = extern(C) void function(GstMapInfo* info) nothrow;
__gshared c_gst_map_info_clearFn c_gst_map_info_clear; ///
private alias c_gst_map_info_get_dataFn = extern(C) ubyte* function(GstMapInfo* info, size_t* size) nothrow;
__gshared c_gst_map_info_get_dataFn c_gst_map_info_get_data; ///
private alias c_gst_map_info_initFn = extern(C) void function(GstMapInfo* info) nothrow;
__gshared c_gst_map_info_initFn c_gst_map_info_init; ///

// Memory
private alias c_gst_memory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_memory_get_typeFn c_gst_memory_get_type; ///
private alias c_gst_memory_new_wrappedFn = extern(C) GstMemory* function(GstMemoryFlags flags, void* data, size_t maxsize, size_t offset, size_t size, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_memory_new_wrappedFn c_gst_memory_new_wrapped; ///
private alias c_gst_memory_copyFn = extern(C) GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_memory_copyFn c_gst_memory_copy; ///
private alias c_gst_memory_get_sizesFn = extern(C) size_t function(GstMemory* mem, size_t* offset, size_t* maxsize) nothrow;
__gshared c_gst_memory_get_sizesFn c_gst_memory_get_sizes; ///
private alias c_gst_memory_initFn = extern(C) void function(GstMemory* mem, GstMemoryFlags flags, GstAllocator* allocator, GstMemory* parent, size_t maxsize, size_t align_, size_t offset, size_t size) nothrow;
__gshared c_gst_memory_initFn c_gst_memory_init; ///
private alias c_gst_memory_is_spanFn = extern(C) gboolean function(GstMemory* mem1, GstMemory* mem2, size_t* offset) nothrow;
__gshared c_gst_memory_is_spanFn c_gst_memory_is_span; ///
private alias c_gst_memory_is_typeFn = extern(C) gboolean function(GstMemory* mem, const(char)* memType) nothrow;
__gshared c_gst_memory_is_typeFn c_gst_memory_is_type; ///
private alias c_gst_memory_is_writableFn = extern(C) gboolean function(const(GstMemory)* memory) nothrow;
__gshared c_gst_memory_is_writableFn c_gst_memory_is_writable; ///
private alias c_gst_memory_make_mappedFn = extern(C) GstMemory* function(GstMemory* mem, GstMapInfo* info, GstMapFlags flags) nothrow;
__gshared c_gst_memory_make_mappedFn c_gst_memory_make_mapped; ///
private alias c_gst_memory_make_writableFn = extern(C) GstMemory* function(GstMemory* memory) nothrow;
__gshared c_gst_memory_make_writableFn c_gst_memory_make_writable; ///
private alias c_gst_memory_mapFn = extern(C) gboolean function(GstMemory* mem, GstMapInfo* info, GstMapFlags flags) nothrow;
__gshared c_gst_memory_mapFn c_gst_memory_map; ///
private alias c_gst_memory_refFn = extern(C) GstMemory* function(GstMemory* memory) nothrow;
__gshared c_gst_memory_refFn c_gst_memory_ref; ///
private alias c_gst_memory_resizeFn = extern(C) void function(GstMemory* mem, ptrdiff_t offset, size_t size) nothrow;
__gshared c_gst_memory_resizeFn c_gst_memory_resize; ///
private alias c_gst_memory_shareFn = extern(C) GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) nothrow;
__gshared c_gst_memory_shareFn c_gst_memory_share; ///
private alias c_gst_memory_unmapFn = extern(C) void function(GstMemory* mem, GstMapInfo* info) nothrow;
__gshared c_gst_memory_unmapFn c_gst_memory_unmap; ///
private alias c_gst_memory_unrefFn = extern(C) void function(GstMemory* memory) nothrow;
__gshared c_gst_memory_unrefFn c_gst_memory_unref; ///
private alias c_gst_memory_replaceFn = extern(C) gboolean function(GstMemory** oldMemory, GstMemory* newMemory) nothrow;
__gshared c_gst_memory_replaceFn c_gst_memory_replace; ///
private alias c_gst_memory_stealFn = extern(C) GstMemory* function(GstMemory** oldMemory) nothrow;
__gshared c_gst_memory_stealFn c_gst_memory_steal; ///
private alias c_gst_memory_takeFn = extern(C) gboolean function(GstMemory** oldMemory, GstMemory* newMemory) nothrow;
__gshared c_gst_memory_takeFn c_gst_memory_take; ///

// Message
private alias c_gst_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_message_get_typeFn c_gst_message_get_type; ///
private alias c_gst_message_new_applicationFn = extern(C) GstMessage* function(GstObject* src, GstStructure* structure) nothrow;
__gshared c_gst_message_new_applicationFn c_gst_message_new_application; ///
private alias c_gst_message_new_async_doneFn = extern(C) GstMessage* function(GstObject* src, GstClockTime runningTime) nothrow;
__gshared c_gst_message_new_async_doneFn c_gst_message_new_async_done; ///
private alias c_gst_message_new_async_startFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_async_startFn c_gst_message_new_async_start; ///
private alias c_gst_message_new_bufferingFn = extern(C) GstMessage* function(GstObject* src, int percent) nothrow;
__gshared c_gst_message_new_bufferingFn c_gst_message_new_buffering; ///
private alias c_gst_message_new_clock_lostFn = extern(C) GstMessage* function(GstObject* src, GstClock* clock) nothrow;
__gshared c_gst_message_new_clock_lostFn c_gst_message_new_clock_lost; ///
private alias c_gst_message_new_clock_provideFn = extern(C) GstMessage* function(GstObject* src, GstClock* clock, gboolean ready) nothrow;
__gshared c_gst_message_new_clock_provideFn c_gst_message_new_clock_provide; ///
private alias c_gst_message_new_customFn = extern(C) GstMessage* function(GstMessageType type, GstObject* src, GstStructure* structure) nothrow;
__gshared c_gst_message_new_customFn c_gst_message_new_custom; ///
private alias c_gst_message_new_device_addedFn = extern(C) GstMessage* function(GstObject* src, GstDevice* device) nothrow;
__gshared c_gst_message_new_device_addedFn c_gst_message_new_device_added; ///
private alias c_gst_message_new_device_changedFn = extern(C) GstMessage* function(GstObject* src, GstDevice* device, GstDevice* changedDevice) nothrow;
__gshared c_gst_message_new_device_changedFn c_gst_message_new_device_changed; ///
private alias c_gst_message_new_device_monitor_startedFn = extern(C) GstMessage* function(GstObject* src, gboolean success) nothrow;
__gshared c_gst_message_new_device_monitor_startedFn c_gst_message_new_device_monitor_started; ///
private alias c_gst_message_new_device_removedFn = extern(C) GstMessage* function(GstObject* src, GstDevice* device) nothrow;
__gshared c_gst_message_new_device_removedFn c_gst_message_new_device_removed; ///
private alias c_gst_message_new_duration_changedFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_duration_changedFn c_gst_message_new_duration_changed; ///
private alias c_gst_message_new_elementFn = extern(C) GstMessage* function(GstObject* src, GstStructure* structure) nothrow;
__gshared c_gst_message_new_elementFn c_gst_message_new_element; ///
private alias c_gst_message_new_eosFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_eosFn c_gst_message_new_eos; ///
private alias c_gst_message_new_errorFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_) nothrow;
__gshared c_gst_message_new_errorFn c_gst_message_new_error; ///
private alias c_gst_message_new_error_with_detailsFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) nothrow;
__gshared c_gst_message_new_error_with_detailsFn c_gst_message_new_error_with_details; ///
private alias c_gst_message_new_have_contextFn = extern(C) GstMessage* function(GstObject* src, GstContext* context) nothrow;
__gshared c_gst_message_new_have_contextFn c_gst_message_new_have_context; ///
private alias c_gst_message_new_infoFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_) nothrow;
__gshared c_gst_message_new_infoFn c_gst_message_new_info; ///
private alias c_gst_message_new_info_with_detailsFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) nothrow;
__gshared c_gst_message_new_info_with_detailsFn c_gst_message_new_info_with_details; ///
private alias c_gst_message_new_instant_rate_requestFn = extern(C) GstMessage* function(GstObject* src, double rateMultiplier) nothrow;
__gshared c_gst_message_new_instant_rate_requestFn c_gst_message_new_instant_rate_request; ///
private alias c_gst_message_new_latencyFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_latencyFn c_gst_message_new_latency; ///
private alias c_gst_message_new_need_contextFn = extern(C) GstMessage* function(GstObject* src, const(char)* contextType) nothrow;
__gshared c_gst_message_new_need_contextFn c_gst_message_new_need_context; ///
private alias c_gst_message_new_new_clockFn = extern(C) GstMessage* function(GstObject* src, GstClock* clock) nothrow;
__gshared c_gst_message_new_new_clockFn c_gst_message_new_new_clock; ///
private alias c_gst_message_new_progressFn = extern(C) GstMessage* function(GstObject* src, GstProgressType type, const(char)* code, const(char)* text) nothrow;
__gshared c_gst_message_new_progressFn c_gst_message_new_progress; ///
private alias c_gst_message_new_property_notifyFn = extern(C) GstMessage* function(GstObject* src, const(char)* propertyName, GValue* val) nothrow;
__gshared c_gst_message_new_property_notifyFn c_gst_message_new_property_notify; ///
private alias c_gst_message_new_qosFn = extern(C) GstMessage* function(GstObject* src, gboolean live, ulong runningTime, ulong streamTime, ulong timestamp, ulong duration) nothrow;
__gshared c_gst_message_new_qosFn c_gst_message_new_qos; ///
private alias c_gst_message_new_redirectFn = extern(C) GstMessage* function(GstObject* src, const(char)* location, GstTagList* tagList, GstStructure* entryStruct) nothrow;
__gshared c_gst_message_new_redirectFn c_gst_message_new_redirect; ///
private alias c_gst_message_new_request_stateFn = extern(C) GstMessage* function(GstObject* src, GstState state) nothrow;
__gshared c_gst_message_new_request_stateFn c_gst_message_new_request_state; ///
private alias c_gst_message_new_reset_timeFn = extern(C) GstMessage* function(GstObject* src, GstClockTime runningTime) nothrow;
__gshared c_gst_message_new_reset_timeFn c_gst_message_new_reset_time; ///
private alias c_gst_message_new_segment_doneFn = extern(C) GstMessage* function(GstObject* src, GstFormat format, long position) nothrow;
__gshared c_gst_message_new_segment_doneFn c_gst_message_new_segment_done; ///
private alias c_gst_message_new_segment_startFn = extern(C) GstMessage* function(GstObject* src, GstFormat format, long position) nothrow;
__gshared c_gst_message_new_segment_startFn c_gst_message_new_segment_start; ///
private alias c_gst_message_new_state_changedFn = extern(C) GstMessage* function(GstObject* src, GstState oldstate, GstState newstate, GstState pending) nothrow;
__gshared c_gst_message_new_state_changedFn c_gst_message_new_state_changed; ///
private alias c_gst_message_new_state_dirtyFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_state_dirtyFn c_gst_message_new_state_dirty; ///
private alias c_gst_message_new_step_doneFn = extern(C) GstMessage* function(GstObject* src, GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate, ulong duration, gboolean eos) nothrow;
__gshared c_gst_message_new_step_doneFn c_gst_message_new_step_done; ///
private alias c_gst_message_new_step_startFn = extern(C) GstMessage* function(GstObject* src, gboolean active, GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate) nothrow;
__gshared c_gst_message_new_step_startFn c_gst_message_new_step_start; ///
private alias c_gst_message_new_stream_collectionFn = extern(C) GstMessage* function(GstObject* src, GstStreamCollection* collection) nothrow;
__gshared c_gst_message_new_stream_collectionFn c_gst_message_new_stream_collection; ///
private alias c_gst_message_new_stream_startFn = extern(C) GstMessage* function(GstObject* src) nothrow;
__gshared c_gst_message_new_stream_startFn c_gst_message_new_stream_start; ///
private alias c_gst_message_new_stream_statusFn = extern(C) GstMessage* function(GstObject* src, GstStreamStatusType type, GstElement* owner) nothrow;
__gshared c_gst_message_new_stream_statusFn c_gst_message_new_stream_status; ///
private alias c_gst_message_new_streams_selectedFn = extern(C) GstMessage* function(GstObject* src, GstStreamCollection* collection) nothrow;
__gshared c_gst_message_new_streams_selectedFn c_gst_message_new_streams_selected; ///
private alias c_gst_message_new_structure_changeFn = extern(C) GstMessage* function(GstObject* src, GstStructureChangeType type, GstElement* owner, gboolean busy) nothrow;
__gshared c_gst_message_new_structure_changeFn c_gst_message_new_structure_change; ///
private alias c_gst_message_new_tagFn = extern(C) GstMessage* function(GstObject* src, GstTagList* tagList) nothrow;
__gshared c_gst_message_new_tagFn c_gst_message_new_tag; ///
private alias c_gst_message_new_tocFn = extern(C) GstMessage* function(GstObject* src, GstToc* toc, gboolean updated) nothrow;
__gshared c_gst_message_new_tocFn c_gst_message_new_toc; ///
private alias c_gst_message_new_warningFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_) nothrow;
__gshared c_gst_message_new_warningFn c_gst_message_new_warning; ///
private alias c_gst_message_new_warning_with_detailsFn = extern(C) GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) nothrow;
__gshared c_gst_message_new_warning_with_detailsFn c_gst_message_new_warning_with_details; ///
private alias c_gst_message_add_redirect_entryFn = extern(C) void function(GstMessage* message, const(char)* location, GstTagList* tagList, GstStructure* entryStruct) nothrow;
__gshared c_gst_message_add_redirect_entryFn c_gst_message_add_redirect_entry; ///
private alias c_gst_message_copyFn = extern(C) GstMessage* function(const(GstMessage)* msg) nothrow;
__gshared c_gst_message_copyFn c_gst_message_copy; ///
private alias c_gst_message_get_detailsFn = extern(C) const(GstStructure)* function(GstMessage* message) nothrow;
__gshared c_gst_message_get_detailsFn c_gst_message_get_details; ///
private alias c_gst_message_get_num_redirect_entriesFn = extern(C) size_t function(GstMessage* message) nothrow;
__gshared c_gst_message_get_num_redirect_entriesFn c_gst_message_get_num_redirect_entries; ///
private alias c_gst_message_get_seqnumFn = extern(C) uint function(GstMessage* message) nothrow;
__gshared c_gst_message_get_seqnumFn c_gst_message_get_seqnum; ///
private alias c_gst_message_get_stream_status_objectFn = extern(C) const(GValue)* function(GstMessage* message) nothrow;
__gshared c_gst_message_get_stream_status_objectFn c_gst_message_get_stream_status_object; ///
private alias c_gst_message_get_structureFn = extern(C) const(GstStructure)* function(GstMessage* message) nothrow;
__gshared c_gst_message_get_structureFn c_gst_message_get_structure; ///
private alias c_gst_message_has_nameFn = extern(C) gboolean function(GstMessage* message, const(char)* name) nothrow;
__gshared c_gst_message_has_nameFn c_gst_message_has_name; ///
private alias c_gst_message_is_writableFn = extern(C) gboolean function(const(GstMessage)* message) nothrow;
__gshared c_gst_message_is_writableFn c_gst_message_is_writable; ///
private alias c_gst_message_make_writableFn = extern(C) GstMessage* function(GstMessage* message) nothrow;
__gshared c_gst_message_make_writableFn c_gst_message_make_writable; ///
private alias c_gst_message_parse_async_doneFn = extern(C) void function(GstMessage* message, GstClockTime* runningTime) nothrow;
__gshared c_gst_message_parse_async_doneFn c_gst_message_parse_async_done; ///
private alias c_gst_message_parse_bufferingFn = extern(C) void function(GstMessage* message, int* percent) nothrow;
__gshared c_gst_message_parse_bufferingFn c_gst_message_parse_buffering; ///
private alias c_gst_message_parse_buffering_statsFn = extern(C) void function(GstMessage* message, GstBufferingMode* mode, int* avgIn, int* avgOut, long* bufferingLeft) nothrow;
__gshared c_gst_message_parse_buffering_statsFn c_gst_message_parse_buffering_stats; ///
private alias c_gst_message_parse_clock_lostFn = extern(C) void function(GstMessage* message, GstClock** clock) nothrow;
__gshared c_gst_message_parse_clock_lostFn c_gst_message_parse_clock_lost; ///
private alias c_gst_message_parse_clock_provideFn = extern(C) void function(GstMessage* message, GstClock** clock, gboolean* ready) nothrow;
__gshared c_gst_message_parse_clock_provideFn c_gst_message_parse_clock_provide; ///
private alias c_gst_message_parse_context_typeFn = extern(C) gboolean function(GstMessage* message, const(char*)* contextType) nothrow;
__gshared c_gst_message_parse_context_typeFn c_gst_message_parse_context_type; ///
private alias c_gst_message_parse_device_addedFn = extern(C) void function(GstMessage* message, GstDevice** device) nothrow;
__gshared c_gst_message_parse_device_addedFn c_gst_message_parse_device_added; ///
private alias c_gst_message_parse_device_changedFn = extern(C) void function(GstMessage* message, GstDevice** device, GstDevice** changedDevice) nothrow;
__gshared c_gst_message_parse_device_changedFn c_gst_message_parse_device_changed; ///
private alias c_gst_message_parse_device_monitor_startedFn = extern(C) void function(GstMessage* message, gboolean* success) nothrow;
__gshared c_gst_message_parse_device_monitor_startedFn c_gst_message_parse_device_monitor_started; ///
private alias c_gst_message_parse_device_removedFn = extern(C) void function(GstMessage* message, GstDevice** device) nothrow;
__gshared c_gst_message_parse_device_removedFn c_gst_message_parse_device_removed; ///
private alias c_gst_message_parse_errorFn = extern(C) void function(GstMessage* message, GError** gerror, char** debug_) nothrow;
__gshared c_gst_message_parse_errorFn c_gst_message_parse_error; ///
private alias c_gst_message_parse_error_detailsFn = extern(C) void function(GstMessage* message, const(GstStructure*)* structure) nothrow;
__gshared c_gst_message_parse_error_detailsFn c_gst_message_parse_error_details; ///
private alias c_gst_message_parse_error_writable_detailsFn = extern(C) void function(GstMessage* message, GstStructure** structure) nothrow;
__gshared c_gst_message_parse_error_writable_detailsFn c_gst_message_parse_error_writable_details; ///
private alias c_gst_message_parse_group_idFn = extern(C) gboolean function(GstMessage* message, uint* groupId) nothrow;
__gshared c_gst_message_parse_group_idFn c_gst_message_parse_group_id; ///
private alias c_gst_message_parse_have_contextFn = extern(C) void function(GstMessage* message, GstContext** context) nothrow;
__gshared c_gst_message_parse_have_contextFn c_gst_message_parse_have_context; ///
private alias c_gst_message_parse_infoFn = extern(C) void function(GstMessage* message, GError** gerror, char** debug_) nothrow;
__gshared c_gst_message_parse_infoFn c_gst_message_parse_info; ///
private alias c_gst_message_parse_info_detailsFn = extern(C) void function(GstMessage* message, const(GstStructure*)* structure) nothrow;
__gshared c_gst_message_parse_info_detailsFn c_gst_message_parse_info_details; ///
private alias c_gst_message_parse_info_writable_detailsFn = extern(C) void function(GstMessage* message, GstStructure** structure) nothrow;
__gshared c_gst_message_parse_info_writable_detailsFn c_gst_message_parse_info_writable_details; ///
private alias c_gst_message_parse_instant_rate_requestFn = extern(C) void function(GstMessage* message, double* rateMultiplier) nothrow;
__gshared c_gst_message_parse_instant_rate_requestFn c_gst_message_parse_instant_rate_request; ///
private alias c_gst_message_parse_new_clockFn = extern(C) void function(GstMessage* message, GstClock** clock) nothrow;
__gshared c_gst_message_parse_new_clockFn c_gst_message_parse_new_clock; ///
private alias c_gst_message_parse_progressFn = extern(C) void function(GstMessage* message, GstProgressType* type, char** code, char** text) nothrow;
__gshared c_gst_message_parse_progressFn c_gst_message_parse_progress; ///
private alias c_gst_message_parse_property_notifyFn = extern(C) void function(GstMessage* message, GstObject** object, const(char*)* propertyName, const(GValue*)* propertyValue) nothrow;
__gshared c_gst_message_parse_property_notifyFn c_gst_message_parse_property_notify; ///
private alias c_gst_message_parse_qosFn = extern(C) void function(GstMessage* message, gboolean* live, ulong* runningTime, ulong* streamTime, ulong* timestamp, ulong* duration) nothrow;
__gshared c_gst_message_parse_qosFn c_gst_message_parse_qos; ///
private alias c_gst_message_parse_qos_statsFn = extern(C) void function(GstMessage* message, GstFormat* format, ulong* processed, ulong* dropped) nothrow;
__gshared c_gst_message_parse_qos_statsFn c_gst_message_parse_qos_stats; ///
private alias c_gst_message_parse_qos_valuesFn = extern(C) void function(GstMessage* message, long* jitter, double* proportion, int* quality) nothrow;
__gshared c_gst_message_parse_qos_valuesFn c_gst_message_parse_qos_values; ///
private alias c_gst_message_parse_redirect_entryFn = extern(C) void function(GstMessage* message, size_t entryIndex, const(char*)* location, GstTagList** tagList, const(GstStructure*)* entryStruct) nothrow;
__gshared c_gst_message_parse_redirect_entryFn c_gst_message_parse_redirect_entry; ///
private alias c_gst_message_parse_request_stateFn = extern(C) void function(GstMessage* message, GstState* state) nothrow;
__gshared c_gst_message_parse_request_stateFn c_gst_message_parse_request_state; ///
private alias c_gst_message_parse_reset_timeFn = extern(C) void function(GstMessage* message, GstClockTime* runningTime) nothrow;
__gshared c_gst_message_parse_reset_timeFn c_gst_message_parse_reset_time; ///
private alias c_gst_message_parse_segment_doneFn = extern(C) void function(GstMessage* message, GstFormat* format, long* position) nothrow;
__gshared c_gst_message_parse_segment_doneFn c_gst_message_parse_segment_done; ///
private alias c_gst_message_parse_segment_startFn = extern(C) void function(GstMessage* message, GstFormat* format, long* position) nothrow;
__gshared c_gst_message_parse_segment_startFn c_gst_message_parse_segment_start; ///
private alias c_gst_message_parse_state_changedFn = extern(C) void function(GstMessage* message, GstState* oldstate, GstState* newstate, GstState* pending) nothrow;
__gshared c_gst_message_parse_state_changedFn c_gst_message_parse_state_changed; ///
private alias c_gst_message_parse_step_doneFn = extern(C) void function(GstMessage* message, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate, ulong* duration, gboolean* eos) nothrow;
__gshared c_gst_message_parse_step_doneFn c_gst_message_parse_step_done; ///
private alias c_gst_message_parse_step_startFn = extern(C) void function(GstMessage* message, gboolean* active, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate) nothrow;
__gshared c_gst_message_parse_step_startFn c_gst_message_parse_step_start; ///
private alias c_gst_message_parse_stream_collectionFn = extern(C) void function(GstMessage* message, GstStreamCollection** collection) nothrow;
__gshared c_gst_message_parse_stream_collectionFn c_gst_message_parse_stream_collection; ///
private alias c_gst_message_parse_stream_statusFn = extern(C) void function(GstMessage* message, GstStreamStatusType* type, GstElement** owner) nothrow;
__gshared c_gst_message_parse_stream_statusFn c_gst_message_parse_stream_status; ///
private alias c_gst_message_parse_streams_selectedFn = extern(C) void function(GstMessage* message, GstStreamCollection** collection) nothrow;
__gshared c_gst_message_parse_streams_selectedFn c_gst_message_parse_streams_selected; ///
private alias c_gst_message_parse_structure_changeFn = extern(C) void function(GstMessage* message, GstStructureChangeType* type, GstElement** owner, gboolean* busy) nothrow;
__gshared c_gst_message_parse_structure_changeFn c_gst_message_parse_structure_change; ///
private alias c_gst_message_parse_tagFn = extern(C) void function(GstMessage* message, GstTagList** tagList) nothrow;
__gshared c_gst_message_parse_tagFn c_gst_message_parse_tag; ///
private alias c_gst_message_parse_tocFn = extern(C) void function(GstMessage* message, GstToc** toc, gboolean* updated) nothrow;
__gshared c_gst_message_parse_tocFn c_gst_message_parse_toc; ///
private alias c_gst_message_parse_warningFn = extern(C) void function(GstMessage* message, GError** gerror, char** debug_) nothrow;
__gshared c_gst_message_parse_warningFn c_gst_message_parse_warning; ///
private alias c_gst_message_parse_warning_detailsFn = extern(C) void function(GstMessage* message, const(GstStructure*)* structure) nothrow;
__gshared c_gst_message_parse_warning_detailsFn c_gst_message_parse_warning_details; ///
private alias c_gst_message_parse_warning_writable_detailsFn = extern(C) void function(GstMessage* message, GstStructure** structure) nothrow;
__gshared c_gst_message_parse_warning_writable_detailsFn c_gst_message_parse_warning_writable_details; ///
private alias c_gst_message_refFn = extern(C) GstMessage* function(GstMessage* msg) nothrow;
__gshared c_gst_message_refFn c_gst_message_ref; ///
private alias c_gst_message_set_buffering_statsFn = extern(C) void function(GstMessage* message, GstBufferingMode mode, int avgIn, int avgOut, long bufferingLeft) nothrow;
__gshared c_gst_message_set_buffering_statsFn c_gst_message_set_buffering_stats; ///
private alias c_gst_message_set_detailsFn = extern(C) void function(GstMessage* message, GstStructure* details) nothrow;
__gshared c_gst_message_set_detailsFn c_gst_message_set_details; ///
private alias c_gst_message_set_group_idFn = extern(C) void function(GstMessage* message, uint groupId) nothrow;
__gshared c_gst_message_set_group_idFn c_gst_message_set_group_id; ///
private alias c_gst_message_set_qos_statsFn = extern(C) void function(GstMessage* message, GstFormat format, ulong processed, ulong dropped) nothrow;
__gshared c_gst_message_set_qos_statsFn c_gst_message_set_qos_stats; ///
private alias c_gst_message_set_qos_valuesFn = extern(C) void function(GstMessage* message, long jitter, double proportion, int quality) nothrow;
__gshared c_gst_message_set_qos_valuesFn c_gst_message_set_qos_values; ///
private alias c_gst_message_set_seqnumFn = extern(C) void function(GstMessage* message, uint seqnum) nothrow;
__gshared c_gst_message_set_seqnumFn c_gst_message_set_seqnum; ///
private alias c_gst_message_set_stream_status_objectFn = extern(C) void function(GstMessage* message, const(GValue)* object) nothrow;
__gshared c_gst_message_set_stream_status_objectFn c_gst_message_set_stream_status_object; ///
private alias c_gst_message_streams_selected_addFn = extern(C) void function(GstMessage* message, GstStream* stream) nothrow;
__gshared c_gst_message_streams_selected_addFn c_gst_message_streams_selected_add; ///
private alias c_gst_message_streams_selected_get_sizeFn = extern(C) uint function(GstMessage* message) nothrow;
__gshared c_gst_message_streams_selected_get_sizeFn c_gst_message_streams_selected_get_size; ///
private alias c_gst_message_streams_selected_get_streamFn = extern(C) GstStream* function(GstMessage* message, uint idx) nothrow;
__gshared c_gst_message_streams_selected_get_streamFn c_gst_message_streams_selected_get_stream; ///
private alias c_gst_message_unrefFn = extern(C) void function(GstMessage* msg) nothrow;
__gshared c_gst_message_unrefFn c_gst_message_unref; ///
private alias c_gst_message_writable_detailsFn = extern(C) GstStructure* function(GstMessage* message) nothrow;
__gshared c_gst_message_writable_detailsFn c_gst_message_writable_details; ///
private alias c_gst_message_writable_structureFn = extern(C) GstStructure* function(GstMessage* message) nothrow;
__gshared c_gst_message_writable_structureFn c_gst_message_writable_structure; ///
private alias c_gst_message_replaceFn = extern(C) gboolean function(GstMessage** oldMessage, GstMessage* newMessage) nothrow;
__gshared c_gst_message_replaceFn c_gst_message_replace; ///
private alias c_gst_message_stealFn = extern(C) GstMessage* function(GstMessage** oldMessage) nothrow;
__gshared c_gst_message_stealFn c_gst_message_steal; ///
private alias c_gst_message_takeFn = extern(C) gboolean function(GstMessage** oldMessage, GstMessage* newMessage) nothrow;
__gshared c_gst_message_takeFn c_gst_message_take; ///

// Meta
private alias c_gst_meta_compare_seqnumFn = extern(C) int function(const(GstMeta)* meta1, const(GstMeta)* meta2) nothrow;
__gshared c_gst_meta_compare_seqnumFn c_gst_meta_compare_seqnum; ///
private alias c_gst_meta_get_seqnumFn = extern(C) ulong function(const(GstMeta)* meta) nothrow;
__gshared c_gst_meta_get_seqnumFn c_gst_meta_get_seqnum; ///
private alias c_gst_meta_serializeFn = extern(C) gboolean function(const(GstMeta)* meta, GstByteArrayInterface* data) nothrow;
__gshared c_gst_meta_serializeFn c_gst_meta_serialize; ///
private alias c_gst_meta_serialize_simpleFn = extern(C) gboolean function(const(GstMeta)* meta, GByteArray* data) nothrow;
__gshared c_gst_meta_serialize_simpleFn c_gst_meta_serialize_simple; ///
private alias c_gst_meta_api_type_aggregate_paramsFn = extern(C) gboolean function(GType api, GstStructure** aggregatedParams, const(GstStructure)* params0, const(GstStructure)* params1) nothrow;
__gshared c_gst_meta_api_type_aggregate_paramsFn c_gst_meta_api_type_aggregate_params; ///
private alias c_gst_meta_api_type_get_tagsFn = extern(C) const(char*)* function(GType api) nothrow;
__gshared c_gst_meta_api_type_get_tagsFn c_gst_meta_api_type_get_tags; ///
private alias c_gst_meta_api_type_has_tagFn = extern(C) gboolean function(GType api, GQuark tag) nothrow;
__gshared c_gst_meta_api_type_has_tagFn c_gst_meta_api_type_has_tag; ///
private alias c_gst_meta_api_type_registerFn = extern(C) GType function(const(char)* api, const(char*)* tags) nothrow;
__gshared c_gst_meta_api_type_registerFn c_gst_meta_api_type_register; ///
private alias c_gst_meta_api_type_set_params_aggregatorFn = extern(C) void function(GType api, GstAllocationMetaParamsAggregator aggregator) nothrow;
__gshared c_gst_meta_api_type_set_params_aggregatorFn c_gst_meta_api_type_set_params_aggregator; ///
private alias c_gst_meta_api_type_tags_contain_onlyFn = extern(C) gboolean function(GType api, const(char*)* validTags) nothrow;
__gshared c_gst_meta_api_type_tags_contain_onlyFn c_gst_meta_api_type_tags_contain_only; ///
private alias c_gst_meta_deserializeFn = extern(C) GstMeta* function(GstBuffer* buffer, const(ubyte)* data, size_t size, uint* consumed) nothrow;
__gshared c_gst_meta_deserializeFn c_gst_meta_deserialize; ///
private alias c_gst_meta_get_infoFn = extern(C) const(GstMetaInfo)* function(const(char)* impl) nothrow;
__gshared c_gst_meta_get_infoFn c_gst_meta_get_info; ///
private alias c_gst_meta_registerFn = extern(C) const(GstMetaInfo)* function(GType api, const(char)* impl, size_t size, GstMetaInitFunction initFunc, GstMetaFreeFunction freeFunc, GstMetaTransformFunction transformFunc) nothrow;
__gshared c_gst_meta_registerFn c_gst_meta_register; ///
private alias c_gst_meta_register_customFn = extern(C) const(GstMetaInfo)* function(const(char)* name, const(char*)* tags, GstCustomMetaTransformFunction transformFunc, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_meta_register_customFn c_gst_meta_register_custom; ///
private alias c_gst_meta_register_custom_simpleFn = extern(C) const(GstMetaInfo)* function(const(char)* name) nothrow;
__gshared c_gst_meta_register_custom_simpleFn c_gst_meta_register_custom_simple; ///

// MetaFactory
private alias c_gst_meta_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_meta_factory_get_typeFn c_gst_meta_factory_get_type; ///
private alias c_gst_meta_factory_loadFn = extern(C) const(GstMetaInfo)* function(const(char)* factoryname) nothrow;
__gshared c_gst_meta_factory_loadFn c_gst_meta_factory_load; ///
private alias c_gst_meta_factory_registerFn = extern(C) gboolean function(GstPlugin* plugin, const(GstMetaInfo)* metaInfo) nothrow;
__gshared c_gst_meta_factory_registerFn c_gst_meta_factory_register; ///

// MetaInfo
private alias c_gst_meta_info_is_customFn = extern(C) gboolean function(const(GstMetaInfo)* info) nothrow;
__gshared c_gst_meta_info_is_customFn c_gst_meta_info_is_custom; ///
private alias c_gst_meta_info_registerFn = extern(C) const(GstMetaInfo)* function(GstMetaInfo* info) nothrow;
__gshared c_gst_meta_info_registerFn c_gst_meta_info_register; ///
private alias c_gst_meta_info_newFn = extern(C) GstMetaInfo* function(GType api, const(char)* impl, size_t size) nothrow;
__gshared c_gst_meta_info_newFn c_gst_meta_info_new; ///

// MiniObject
private alias c_gst_mini_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_mini_object_get_typeFn c_gst_mini_object_get_type; ///
private alias c_gst_mini_object_add_parentFn = extern(C) void function(GstMiniObject* object, GstMiniObject* parent) nothrow;
__gshared c_gst_mini_object_add_parentFn c_gst_mini_object_add_parent; ///
private alias c_gst_mini_object_copyFn = extern(C) GstMiniObject* function(const(GstMiniObject)* miniObject) nothrow;
__gshared c_gst_mini_object_copyFn c_gst_mini_object_copy; ///
private alias c_gst_mini_object_get_qdataFn = extern(C) void* function(GstMiniObject* object, GQuark quark) nothrow;
__gshared c_gst_mini_object_get_qdataFn c_gst_mini_object_get_qdata; ///
private alias c_gst_mini_object_initFn = extern(C) void function(GstMiniObject* miniObject, uint flags, GType type, GstMiniObjectCopyFunction copyFunc, GstMiniObjectDisposeFunction disposeFunc, GstMiniObjectFreeFunction freeFunc) nothrow;
__gshared c_gst_mini_object_initFn c_gst_mini_object_init; ///
private alias c_gst_mini_object_is_writableFn = extern(C) gboolean function(const(GstMiniObject)* miniObject) nothrow;
__gshared c_gst_mini_object_is_writableFn c_gst_mini_object_is_writable; ///
private alias c_gst_mini_object_lockFn = extern(C) gboolean function(GstMiniObject* object, GstLockFlags flags) nothrow;
__gshared c_gst_mini_object_lockFn c_gst_mini_object_lock; ///
private alias c_gst_mini_object_make_writableFn = extern(C) GstMiniObject* function(GstMiniObject* miniObject) nothrow;
__gshared c_gst_mini_object_make_writableFn c_gst_mini_object_make_writable; ///
private alias c_gst_mini_object_refFn = extern(C) GstMiniObject* function(GstMiniObject* miniObject) nothrow;
__gshared c_gst_mini_object_refFn c_gst_mini_object_ref; ///
private alias c_gst_mini_object_remove_parentFn = extern(C) void function(GstMiniObject* object, GstMiniObject* parent) nothrow;
__gshared c_gst_mini_object_remove_parentFn c_gst_mini_object_remove_parent; ///
private alias c_gst_mini_object_set_qdataFn = extern(C) void function(GstMiniObject* object, GQuark quark, void* data, GDestroyNotify destroy) nothrow;
__gshared c_gst_mini_object_set_qdataFn c_gst_mini_object_set_qdata; ///
private alias c_gst_mini_object_steal_qdataFn = extern(C) void* function(GstMiniObject* object, GQuark quark) nothrow;
__gshared c_gst_mini_object_steal_qdataFn c_gst_mini_object_steal_qdata; ///
private alias c_gst_mini_object_unlockFn = extern(C) void function(GstMiniObject* object, GstLockFlags flags) nothrow;
__gshared c_gst_mini_object_unlockFn c_gst_mini_object_unlock; ///
private alias c_gst_mini_object_unrefFn = extern(C) void function(GstMiniObject* miniObject) nothrow;
__gshared c_gst_mini_object_unrefFn c_gst_mini_object_unref; ///
private alias c_gst_mini_object_weak_refFn = extern(C) void function(GstMiniObject* object, GstMiniObjectNotify notify, void* data) nothrow;
__gshared c_gst_mini_object_weak_refFn c_gst_mini_object_weak_ref; ///
private alias c_gst_mini_object_weak_unrefFn = extern(C) void function(GstMiniObject* object, GstMiniObjectNotify notify, void* data) nothrow;
__gshared c_gst_mini_object_weak_unrefFn c_gst_mini_object_weak_unref; ///
private alias c_gst_mini_object_replaceFn = extern(C) gboolean function(GstMiniObject** olddata, GstMiniObject* newdata) nothrow;
__gshared c_gst_mini_object_replaceFn c_gst_mini_object_replace; ///
private alias c_gst_mini_object_stealFn = extern(C) GstMiniObject* function(GstMiniObject** olddata) nothrow;
__gshared c_gst_mini_object_stealFn c_gst_mini_object_steal; ///
private alias c_gst_mini_object_takeFn = extern(C) gboolean function(GstMiniObject** olddata, GstMiniObject* newdata) nothrow;
__gshared c_gst_mini_object_takeFn c_gst_mini_object_take; ///

// ObjectWrap
private alias c_gst_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_object_get_typeFn c_gst_object_get_type; ///
private alias c_gst_object_check_uniquenessFn = extern(C) gboolean function(GList* list, const(char)* name) nothrow;
__gshared c_gst_object_check_uniquenessFn c_gst_object_check_uniqueness; ///
private alias c_gst_object_default_deep_notifyFn = extern(C) void function(GObject* object, GstObject* orig, GParamSpec* pspec, char** excludedProps) nothrow;
__gshared c_gst_object_default_deep_notifyFn c_gst_object_default_deep_notify; ///
private alias c_gst_object_ref_sinkFn = extern(C) void* function(void* object) nothrow;
__gshared c_gst_object_ref_sinkFn c_gst_object_ref_sink; ///
private alias c_gst_object_replaceFn = extern(C) gboolean function(GstObject** oldobj, GstObject* newobj) nothrow;
__gshared c_gst_object_replaceFn c_gst_object_replace; ///
private alias c_gst_object_add_control_bindingFn = extern(C) gboolean function(GstObject* object, GstControlBinding* binding) nothrow;
__gshared c_gst_object_add_control_bindingFn c_gst_object_add_control_binding; ///
private alias c_gst_object_call_asyncFn = extern(C) void function(GstObject* object, GstObjectCallAsyncFunc func, void* userData) nothrow;
__gshared c_gst_object_call_asyncFn c_gst_object_call_async; ///
private alias c_gst_object_default_errorFn = extern(C) void function(GstObject* source, const(GError)* error, const(char)* debug_) nothrow;
__gshared c_gst_object_default_errorFn c_gst_object_default_error; ///
private alias c_gst_object_get_control_bindingFn = extern(C) GstControlBinding* function(GstObject* object, const(char)* propertyName) nothrow;
__gshared c_gst_object_get_control_bindingFn c_gst_object_get_control_binding; ///
private alias c_gst_object_get_control_rateFn = extern(C) GstClockTime function(GstObject* object) nothrow;
__gshared c_gst_object_get_control_rateFn c_gst_object_get_control_rate; ///
private alias c_gst_object_get_g_value_arrayFn = extern(C) gboolean function(GstObject* object, const(char)* propertyName, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) nothrow;
__gshared c_gst_object_get_g_value_arrayFn c_gst_object_get_g_value_array; ///
private alias c_gst_object_get_nameFn = extern(C) char* function(GstObject* object) nothrow;
__gshared c_gst_object_get_nameFn c_gst_object_get_name; ///
private alias c_gst_object_get_parentFn = extern(C) GstObject* function(GstObject* object) nothrow;
__gshared c_gst_object_get_parentFn c_gst_object_get_parent; ///
private alias c_gst_object_get_path_stringFn = extern(C) char* function(GstObject* object) nothrow;
__gshared c_gst_object_get_path_stringFn c_gst_object_get_path_string; ///
private alias c_gst_object_get_toplevelFn = extern(C) GstObject* function(GstObject* object) nothrow;
__gshared c_gst_object_get_toplevelFn c_gst_object_get_toplevel; ///
private alias c_gst_object_get_valueFn = extern(C) GValue* function(GstObject* object, const(char)* propertyName, GstClockTime timestamp) nothrow;
__gshared c_gst_object_get_valueFn c_gst_object_get_value; ///
private alias c_gst_object_get_value_arrayFn = extern(C) gboolean function(GstObject* object, const(char)* propertyName, GstClockTime timestamp, GstClockTime interval, uint nValues, void* values) nothrow;
__gshared c_gst_object_get_value_arrayFn c_gst_object_get_value_array; ///
private alias c_gst_object_has_active_control_bindingsFn = extern(C) gboolean function(GstObject* object) nothrow;
__gshared c_gst_object_has_active_control_bindingsFn c_gst_object_has_active_control_bindings; ///
private alias c_gst_object_has_ancestorFn = extern(C) gboolean function(GstObject* object, GstObject* ancestor) nothrow;
__gshared c_gst_object_has_ancestorFn c_gst_object_has_ancestor; ///
private alias c_gst_object_has_as_ancestorFn = extern(C) gboolean function(GstObject* object, GstObject* ancestor) nothrow;
__gshared c_gst_object_has_as_ancestorFn c_gst_object_has_as_ancestor; ///
private alias c_gst_object_has_as_parentFn = extern(C) gboolean function(GstObject* object, GstObject* parent) nothrow;
__gshared c_gst_object_has_as_parentFn c_gst_object_has_as_parent; ///
private alias c_gst_object_refFn = extern(C) GstObject* function(GstObject* object) nothrow;
__gshared c_gst_object_refFn c_gst_object_ref; ///
private alias c_gst_object_remove_control_bindingFn = extern(C) gboolean function(GstObject* object, GstControlBinding* binding) nothrow;
__gshared c_gst_object_remove_control_bindingFn c_gst_object_remove_control_binding; ///
private alias c_gst_object_set_control_binding_disabledFn = extern(C) void function(GstObject* object, const(char)* propertyName, gboolean disabled) nothrow;
__gshared c_gst_object_set_control_binding_disabledFn c_gst_object_set_control_binding_disabled; ///
private alias c_gst_object_set_control_bindings_disabledFn = extern(C) void function(GstObject* object, gboolean disabled) nothrow;
__gshared c_gst_object_set_control_bindings_disabledFn c_gst_object_set_control_bindings_disabled; ///
private alias c_gst_object_set_control_rateFn = extern(C) void function(GstObject* object, GstClockTime controlRate) nothrow;
__gshared c_gst_object_set_control_rateFn c_gst_object_set_control_rate; ///
private alias c_gst_object_set_nameFn = extern(C) gboolean function(GstObject* object, const(char)* name) nothrow;
__gshared c_gst_object_set_nameFn c_gst_object_set_name; ///
private alias c_gst_object_set_parentFn = extern(C) gboolean function(GstObject* object, GstObject* parent) nothrow;
__gshared c_gst_object_set_parentFn c_gst_object_set_parent; ///
private alias c_gst_object_suggest_next_syncFn = extern(C) GstClockTime function(GstObject* object) nothrow;
__gshared c_gst_object_suggest_next_syncFn c_gst_object_suggest_next_sync; ///
private alias c_gst_object_sync_valuesFn = extern(C) gboolean function(GstObject* object, GstClockTime timestamp) nothrow;
__gshared c_gst_object_sync_valuesFn c_gst_object_sync_values; ///
private alias c_gst_object_unparentFn = extern(C) void function(GstObject* object) nothrow;
__gshared c_gst_object_unparentFn c_gst_object_unparent; ///
private alias c_gst_object_unrefFn = extern(C) void function(GstObject* object) nothrow;
__gshared c_gst_object_unrefFn c_gst_object_unref; ///

// Pad
private alias c_gst_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_pad_get_typeFn c_gst_pad_get_type; ///
private alias c_gst_pad_newFn = extern(C) GstPad* function(const(char)* name, GstPadDirection direction) nothrow;
__gshared c_gst_pad_newFn c_gst_pad_new; ///
private alias c_gst_pad_new_from_static_templateFn = extern(C) GstPad* function(GstStaticPadTemplate* templ, const(char)* name) nothrow;
__gshared c_gst_pad_new_from_static_templateFn c_gst_pad_new_from_static_template; ///
private alias c_gst_pad_new_from_templateFn = extern(C) GstPad* function(GstPadTemplate* templ, const(char)* name) nothrow;
__gshared c_gst_pad_new_from_templateFn c_gst_pad_new_from_template; ///
private alias c_gst_pad_link_get_nameFn = extern(C) const(char)* function(GstPadLinkReturn ret) nothrow;
__gshared c_gst_pad_link_get_nameFn c_gst_pad_link_get_name; ///
private alias c_gst_pad_activate_modeFn = extern(C) gboolean function(GstPad* pad, GstPadMode mode, gboolean active) nothrow;
__gshared c_gst_pad_activate_modeFn c_gst_pad_activate_mode; ///
private alias c_gst_pad_add_probeFn = extern(C) gulong function(GstPad* pad, GstPadProbeType mask, GstPadProbeCallback callback, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_pad_add_probeFn c_gst_pad_add_probe; ///
private alias c_gst_pad_can_linkFn = extern(C) gboolean function(GstPad* srcpad, GstPad* sinkpad) nothrow;
__gshared c_gst_pad_can_linkFn c_gst_pad_can_link; ///
private alias c_gst_pad_chainFn = extern(C) GstFlowReturn function(GstPad* pad, GstBuffer* buffer) nothrow;
__gshared c_gst_pad_chainFn c_gst_pad_chain; ///
private alias c_gst_pad_chain_listFn = extern(C) GstFlowReturn function(GstPad* pad, GstBufferList* list) nothrow;
__gshared c_gst_pad_chain_listFn c_gst_pad_chain_list; ///
private alias c_gst_pad_check_reconfigureFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_check_reconfigureFn c_gst_pad_check_reconfigure; ///
private alias c_gst_pad_create_stream_idFn = extern(C) char* function(GstPad* pad, GstElement* parent, const(char)* streamId) nothrow;
__gshared c_gst_pad_create_stream_idFn c_gst_pad_create_stream_id; ///
private alias c_gst_pad_create_stream_id_printfFn = extern(C) char* function(GstPad* pad, GstElement* parent, const(char)* streamId,  ...) nothrow;
__gshared c_gst_pad_create_stream_id_printfFn c_gst_pad_create_stream_id_printf; ///
private alias c_gst_pad_create_stream_id_printf_valistFn = extern(C) char* function(GstPad* pad, GstElement* parent, const(char)* streamId, void* varArgs) nothrow;
__gshared c_gst_pad_create_stream_id_printf_valistFn c_gst_pad_create_stream_id_printf_valist; ///
private alias c_gst_pad_event_defaultFn = extern(C) gboolean function(GstPad* pad, GstObject* parent, GstEvent* event) nothrow;
__gshared c_gst_pad_event_defaultFn c_gst_pad_event_default; ///
private alias c_gst_pad_forwardFn = extern(C) gboolean function(GstPad* pad, GstPadForwardFunction forward, void* userData) nothrow;
__gshared c_gst_pad_forwardFn c_gst_pad_forward; ///
private alias c_gst_pad_get_allowed_capsFn = extern(C) GstCaps* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_allowed_capsFn c_gst_pad_get_allowed_caps; ///
private alias c_gst_pad_get_current_capsFn = extern(C) GstCaps* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_current_capsFn c_gst_pad_get_current_caps; ///
private alias c_gst_pad_get_directionFn = extern(C) GstPadDirection function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_directionFn c_gst_pad_get_direction; ///
private alias c_gst_pad_get_element_privateFn = extern(C) void* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_element_privateFn c_gst_pad_get_element_private; ///
private alias c_gst_pad_get_last_flow_returnFn = extern(C) GstFlowReturn function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_last_flow_returnFn c_gst_pad_get_last_flow_return; ///
private alias c_gst_pad_get_offsetFn = extern(C) long function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_offsetFn c_gst_pad_get_offset; ///
private alias c_gst_pad_get_pad_templateFn = extern(C) GstPadTemplate* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_pad_templateFn c_gst_pad_get_pad_template; ///
private alias c_gst_pad_get_pad_template_capsFn = extern(C) GstCaps* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_pad_template_capsFn c_gst_pad_get_pad_template_caps; ///
private alias c_gst_pad_get_parent_elementFn = extern(C) GstElement* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_parent_elementFn c_gst_pad_get_parent_element; ///
private alias c_gst_pad_get_peerFn = extern(C) GstPad* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_peerFn c_gst_pad_get_peer; ///
private alias c_gst_pad_get_rangeFn = extern(C) GstFlowReturn function(GstPad* pad, ulong offset, uint size, GstBuffer** buffer) nothrow;
__gshared c_gst_pad_get_rangeFn c_gst_pad_get_range; ///
private alias c_gst_pad_get_single_internal_linkFn = extern(C) GstPad* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_single_internal_linkFn c_gst_pad_get_single_internal_link; ///
private alias c_gst_pad_get_sticky_eventFn = extern(C) GstEvent* function(GstPad* pad, GstEventType eventType, uint idx) nothrow;
__gshared c_gst_pad_get_sticky_eventFn c_gst_pad_get_sticky_event; ///
private alias c_gst_pad_get_streamFn = extern(C) GstStream* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_streamFn c_gst_pad_get_stream; ///
private alias c_gst_pad_get_stream_idFn = extern(C) char* function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_stream_idFn c_gst_pad_get_stream_id; ///
private alias c_gst_pad_get_task_stateFn = extern(C) GstTaskState function(GstPad* pad) nothrow;
__gshared c_gst_pad_get_task_stateFn c_gst_pad_get_task_state; ///
private alias c_gst_pad_has_current_capsFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_has_current_capsFn c_gst_pad_has_current_caps; ///
private alias c_gst_pad_is_activeFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_is_activeFn c_gst_pad_is_active; ///
private alias c_gst_pad_is_blockedFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_is_blockedFn c_gst_pad_is_blocked; ///
private alias c_gst_pad_is_blockingFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_is_blockingFn c_gst_pad_is_blocking; ///
private alias c_gst_pad_is_linkedFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_is_linkedFn c_gst_pad_is_linked; ///
private alias c_gst_pad_iterate_internal_linksFn = extern(C) GstIterator* function(GstPad* pad) nothrow;
__gshared c_gst_pad_iterate_internal_linksFn c_gst_pad_iterate_internal_links; ///
private alias c_gst_pad_iterate_internal_links_defaultFn = extern(C) GstIterator* function(GstPad* pad, GstObject* parent) nothrow;
__gshared c_gst_pad_iterate_internal_links_defaultFn c_gst_pad_iterate_internal_links_default; ///
private alias c_gst_pad_linkFn = extern(C) GstPadLinkReturn function(GstPad* srcpad, GstPad* sinkpad) nothrow;
__gshared c_gst_pad_linkFn c_gst_pad_link; ///
private alias c_gst_pad_link_fullFn = extern(C) GstPadLinkReturn function(GstPad* srcpad, GstPad* sinkpad, GstPadLinkCheck flags) nothrow;
__gshared c_gst_pad_link_fullFn c_gst_pad_link_full; ///
private alias c_gst_pad_link_maybe_ghostingFn = extern(C) gboolean function(GstPad* src, GstPad* sink) nothrow;
__gshared c_gst_pad_link_maybe_ghostingFn c_gst_pad_link_maybe_ghosting; ///
private alias c_gst_pad_link_maybe_ghosting_fullFn = extern(C) gboolean function(GstPad* src, GstPad* sink, GstPadLinkCheck flags) nothrow;
__gshared c_gst_pad_link_maybe_ghosting_fullFn c_gst_pad_link_maybe_ghosting_full; ///
private alias c_gst_pad_mark_reconfigureFn = extern(C) void function(GstPad* pad) nothrow;
__gshared c_gst_pad_mark_reconfigureFn c_gst_pad_mark_reconfigure; ///
private alias c_gst_pad_needs_reconfigureFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_needs_reconfigureFn c_gst_pad_needs_reconfigure; ///
private alias c_gst_pad_pause_taskFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_pause_taskFn c_gst_pad_pause_task; ///
private alias c_gst_pad_peer_queryFn = extern(C) gboolean function(GstPad* pad, GstQuery* query) nothrow;
__gshared c_gst_pad_peer_queryFn c_gst_pad_peer_query; ///
private alias c_gst_pad_peer_query_accept_capsFn = extern(C) gboolean function(GstPad* pad, GstCaps* caps) nothrow;
__gshared c_gst_pad_peer_query_accept_capsFn c_gst_pad_peer_query_accept_caps; ///
private alias c_gst_pad_peer_query_capsFn = extern(C) GstCaps* function(GstPad* pad, GstCaps* filter) nothrow;
__gshared c_gst_pad_peer_query_capsFn c_gst_pad_peer_query_caps; ///
private alias c_gst_pad_peer_query_convertFn = extern(C) gboolean function(GstPad* pad, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) nothrow;
__gshared c_gst_pad_peer_query_convertFn c_gst_pad_peer_query_convert; ///
private alias c_gst_pad_peer_query_durationFn = extern(C) gboolean function(GstPad* pad, GstFormat format, long* duration) nothrow;
__gshared c_gst_pad_peer_query_durationFn c_gst_pad_peer_query_duration; ///
private alias c_gst_pad_peer_query_positionFn = extern(C) gboolean function(GstPad* pad, GstFormat format, long* cur) nothrow;
__gshared c_gst_pad_peer_query_positionFn c_gst_pad_peer_query_position; ///
private alias c_gst_pad_proxy_query_accept_capsFn = extern(C) gboolean function(GstPad* pad, GstQuery* query) nothrow;
__gshared c_gst_pad_proxy_query_accept_capsFn c_gst_pad_proxy_query_accept_caps; ///
private alias c_gst_pad_proxy_query_capsFn = extern(C) gboolean function(GstPad* pad, GstQuery* query) nothrow;
__gshared c_gst_pad_proxy_query_capsFn c_gst_pad_proxy_query_caps; ///
private alias c_gst_pad_pull_rangeFn = extern(C) GstFlowReturn function(GstPad* pad, ulong offset, uint size, GstBuffer** buffer) nothrow;
__gshared c_gst_pad_pull_rangeFn c_gst_pad_pull_range; ///
private alias c_gst_pad_pushFn = extern(C) GstFlowReturn function(GstPad* pad, GstBuffer* buffer) nothrow;
__gshared c_gst_pad_pushFn c_gst_pad_push; ///
private alias c_gst_pad_push_eventFn = extern(C) gboolean function(GstPad* pad, GstEvent* event) nothrow;
__gshared c_gst_pad_push_eventFn c_gst_pad_push_event; ///
private alias c_gst_pad_push_listFn = extern(C) GstFlowReturn function(GstPad* pad, GstBufferList* list) nothrow;
__gshared c_gst_pad_push_listFn c_gst_pad_push_list; ///
private alias c_gst_pad_queryFn = extern(C) gboolean function(GstPad* pad, GstQuery* query) nothrow;
__gshared c_gst_pad_queryFn c_gst_pad_query; ///
private alias c_gst_pad_query_accept_capsFn = extern(C) gboolean function(GstPad* pad, GstCaps* caps) nothrow;
__gshared c_gst_pad_query_accept_capsFn c_gst_pad_query_accept_caps; ///
private alias c_gst_pad_query_capsFn = extern(C) GstCaps* function(GstPad* pad, GstCaps* filter) nothrow;
__gshared c_gst_pad_query_capsFn c_gst_pad_query_caps; ///
private alias c_gst_pad_query_convertFn = extern(C) gboolean function(GstPad* pad, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) nothrow;
__gshared c_gst_pad_query_convertFn c_gst_pad_query_convert; ///
private alias c_gst_pad_query_defaultFn = extern(C) gboolean function(GstPad* pad, GstObject* parent, GstQuery* query) nothrow;
__gshared c_gst_pad_query_defaultFn c_gst_pad_query_default; ///
private alias c_gst_pad_query_durationFn = extern(C) gboolean function(GstPad* pad, GstFormat format, long* duration) nothrow;
__gshared c_gst_pad_query_durationFn c_gst_pad_query_duration; ///
private alias c_gst_pad_query_positionFn = extern(C) gboolean function(GstPad* pad, GstFormat format, long* cur) nothrow;
__gshared c_gst_pad_query_positionFn c_gst_pad_query_position; ///
private alias c_gst_pad_remove_probeFn = extern(C) void function(GstPad* pad, gulong id) nothrow;
__gshared c_gst_pad_remove_probeFn c_gst_pad_remove_probe; ///
private alias c_gst_pad_send_eventFn = extern(C) gboolean function(GstPad* pad, GstEvent* event) nothrow;
__gshared c_gst_pad_send_eventFn c_gst_pad_send_event; ///
private alias c_gst_pad_set_activate_function_fullFn = extern(C) void function(GstPad* pad, GstPadActivateFunction activate, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_activate_function_fullFn c_gst_pad_set_activate_function_full; ///
private alias c_gst_pad_set_activatemode_function_fullFn = extern(C) void function(GstPad* pad, GstPadActivateModeFunction activatemode, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_activatemode_function_fullFn c_gst_pad_set_activatemode_function_full; ///
private alias c_gst_pad_set_activeFn = extern(C) gboolean function(GstPad* pad, gboolean active) nothrow;
__gshared c_gst_pad_set_activeFn c_gst_pad_set_active; ///
private alias c_gst_pad_set_chain_function_fullFn = extern(C) void function(GstPad* pad, GstPadChainFunction chain, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_chain_function_fullFn c_gst_pad_set_chain_function_full; ///
private alias c_gst_pad_set_chain_list_function_fullFn = extern(C) void function(GstPad* pad, GstPadChainListFunction chainlist, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_chain_list_function_fullFn c_gst_pad_set_chain_list_function_full; ///
private alias c_gst_pad_set_element_privateFn = extern(C) void function(GstPad* pad, void* priv) nothrow;
__gshared c_gst_pad_set_element_privateFn c_gst_pad_set_element_private; ///
private alias c_gst_pad_set_event_full_function_fullFn = extern(C) void function(GstPad* pad, GstPadEventFullFunction event, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_event_full_function_fullFn c_gst_pad_set_event_full_function_full; ///
private alias c_gst_pad_set_event_function_fullFn = extern(C) void function(GstPad* pad, GstPadEventFunction event, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_event_function_fullFn c_gst_pad_set_event_function_full; ///
private alias c_gst_pad_set_getrange_function_fullFn = extern(C) void function(GstPad* pad, GstPadGetRangeFunction get, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_getrange_function_fullFn c_gst_pad_set_getrange_function_full; ///
private alias c_gst_pad_set_iterate_internal_links_function_fullFn = extern(C) void function(GstPad* pad, GstPadIterIntLinkFunction iterintlink, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_iterate_internal_links_function_fullFn c_gst_pad_set_iterate_internal_links_function_full; ///
private alias c_gst_pad_set_link_function_fullFn = extern(C) void function(GstPad* pad, GstPadLinkFunction link, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_link_function_fullFn c_gst_pad_set_link_function_full; ///
private alias c_gst_pad_set_offsetFn = extern(C) void function(GstPad* pad, long offset) nothrow;
__gshared c_gst_pad_set_offsetFn c_gst_pad_set_offset; ///
private alias c_gst_pad_set_query_function_fullFn = extern(C) void function(GstPad* pad, GstPadQueryFunction query, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_query_function_fullFn c_gst_pad_set_query_function_full; ///
private alias c_gst_pad_set_unlink_function_fullFn = extern(C) void function(GstPad* pad, GstPadUnlinkFunction unlink, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_set_unlink_function_fullFn c_gst_pad_set_unlink_function_full; ///
private alias c_gst_pad_start_taskFn = extern(C) gboolean function(GstPad* pad, GstTaskFunction func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_pad_start_taskFn c_gst_pad_start_task; ///
private alias c_gst_pad_sticky_events_foreachFn = extern(C) void function(GstPad* pad, GstPadStickyEventsForeachFunction foreachFunc, void* userData) nothrow;
__gshared c_gst_pad_sticky_events_foreachFn c_gst_pad_sticky_events_foreach; ///
private alias c_gst_pad_stop_taskFn = extern(C) gboolean function(GstPad* pad) nothrow;
__gshared c_gst_pad_stop_taskFn c_gst_pad_stop_task; ///
private alias c_gst_pad_store_sticky_eventFn = extern(C) GstFlowReturn function(GstPad* pad, GstEvent* event) nothrow;
__gshared c_gst_pad_store_sticky_eventFn c_gst_pad_store_sticky_event; ///
private alias c_gst_pad_unlinkFn = extern(C) gboolean function(GstPad* srcpad, GstPad* sinkpad) nothrow;
__gshared c_gst_pad_unlinkFn c_gst_pad_unlink; ///
private alias c_gst_pad_use_fixed_capsFn = extern(C) void function(GstPad* pad) nothrow;
__gshared c_gst_pad_use_fixed_capsFn c_gst_pad_use_fixed_caps; ///

// PadProbeInfo
private alias c_gst_pad_probe_info_get_bufferFn = extern(C) GstBuffer* function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_bufferFn c_gst_pad_probe_info_get_buffer; ///
private alias c_gst_pad_probe_info_get_buffer_listFn = extern(C) GstBufferList* function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_buffer_listFn c_gst_pad_probe_info_get_buffer_list; ///
private alias c_gst_pad_probe_info_get_eventFn = extern(C) GstEvent* function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_eventFn c_gst_pad_probe_info_get_event; ///
private alias c_gst_pad_probe_info_get_flow_returnFn = extern(C) GstFlowReturn function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_flow_returnFn c_gst_pad_probe_info_get_flow_return; ///
private alias c_gst_pad_probe_info_get_idFn = extern(C) gulong function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_idFn c_gst_pad_probe_info_get_id; ///
private alias c_gst_pad_probe_info_get_offsetFn = extern(C) ulong function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_offsetFn c_gst_pad_probe_info_get_offset; ///
private alias c_gst_pad_probe_info_get_queryFn = extern(C) GstQuery* function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_queryFn c_gst_pad_probe_info_get_query; ///
private alias c_gst_pad_probe_info_get_sizeFn = extern(C) size_t function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_sizeFn c_gst_pad_probe_info_get_size; ///
private alias c_gst_pad_probe_info_get_typeFn = extern(C) GstPadProbeType function(GstPadProbeInfo* info) nothrow;
__gshared c_gst_pad_probe_info_get_typeFn c_gst_pad_probe_info_get_type; ///
private alias c_gst_pad_probe_info_set_bufferFn = extern(C) void function(GstPadProbeInfo* info, GstBuffer* buffer) nothrow;
__gshared c_gst_pad_probe_info_set_bufferFn c_gst_pad_probe_info_set_buffer; ///
private alias c_gst_pad_probe_info_set_buffer_listFn = extern(C) void function(GstPadProbeInfo* info, GstBufferList* list) nothrow;
__gshared c_gst_pad_probe_info_set_buffer_listFn c_gst_pad_probe_info_set_buffer_list; ///
private alias c_gst_pad_probe_info_set_eventFn = extern(C) void function(GstPadProbeInfo* info, GstEvent* event) nothrow;
__gshared c_gst_pad_probe_info_set_eventFn c_gst_pad_probe_info_set_event; ///
private alias c_gst_pad_probe_info_set_flow_returnFn = extern(C) void function(GstPadProbeInfo* info, GstFlowReturn flowRet) nothrow;
__gshared c_gst_pad_probe_info_set_flow_returnFn c_gst_pad_probe_info_set_flow_return; ///

// PadTemplate
private alias c_gst_pad_template_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_pad_template_get_typeFn c_gst_pad_template_get_type; ///
private alias c_gst_pad_template_newFn = extern(C) GstPadTemplate* function(const(char)* nameTemplate, GstPadDirection direction, GstPadPresence presence, GstCaps* caps) nothrow;
__gshared c_gst_pad_template_newFn c_gst_pad_template_new; ///
private alias c_gst_pad_template_new_from_static_pad_template_with_gtypeFn = extern(C) GstPadTemplate* function(GstStaticPadTemplate* padTemplate, GType padType) nothrow;
__gshared c_gst_pad_template_new_from_static_pad_template_with_gtypeFn c_gst_pad_template_new_from_static_pad_template_with_gtype; ///
private alias c_gst_pad_template_new_with_gtypeFn = extern(C) GstPadTemplate* function(const(char)* nameTemplate, GstPadDirection direction, GstPadPresence presence, GstCaps* caps, GType padType) nothrow;
__gshared c_gst_pad_template_new_with_gtypeFn c_gst_pad_template_new_with_gtype; ///
private alias c_gst_pad_template_get_capsFn = extern(C) GstCaps* function(GstPadTemplate* templ) nothrow;
__gshared c_gst_pad_template_get_capsFn c_gst_pad_template_get_caps; ///
private alias c_gst_pad_template_get_documentation_capsFn = extern(C) GstCaps* function(GstPadTemplate* templ) nothrow;
__gshared c_gst_pad_template_get_documentation_capsFn c_gst_pad_template_get_documentation_caps; ///
private alias c_gst_pad_template_pad_createdFn = extern(C) void function(GstPadTemplate* templ, GstPad* pad) nothrow;
__gshared c_gst_pad_template_pad_createdFn c_gst_pad_template_pad_created; ///
private alias c_gst_pad_template_set_documentation_capsFn = extern(C) void function(GstPadTemplate* templ, GstCaps* caps) nothrow;
__gshared c_gst_pad_template_set_documentation_capsFn c_gst_pad_template_set_documentation_caps; ///

// ParamArray
private alias c_gst_param_spec_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_param_spec_array_get_typeFn c_gst_param_spec_array_get_type; ///

// ParamFraction
private alias c_gst_param_spec_fraction_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_param_spec_fraction_get_typeFn c_gst_param_spec_fraction_get_type; ///

// ParentBufferMeta
private alias c_gst_parent_buffer_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_parent_buffer_meta_get_infoFn c_gst_parent_buffer_meta_get_info; ///

// ParseContext
private alias c_gst_parse_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_parse_context_get_typeFn c_gst_parse_context_get_type; ///
private alias c_gst_parse_context_newFn = extern(C) GstParseContext* function() nothrow;
__gshared c_gst_parse_context_newFn c_gst_parse_context_new; ///
private alias c_gst_parse_context_copyFn = extern(C) GstParseContext* function(const(GstParseContext)* context) nothrow;
__gshared c_gst_parse_context_copyFn c_gst_parse_context_copy; ///
private alias c_gst_parse_context_freeFn = extern(C) void function(GstParseContext* context) nothrow;
__gshared c_gst_parse_context_freeFn c_gst_parse_context_free; ///
private alias c_gst_parse_context_get_missing_elementsFn = extern(C) char** function(GstParseContext* context) nothrow;
__gshared c_gst_parse_context_get_missing_elementsFn c_gst_parse_context_get_missing_elements; ///

// Pipeline
private alias c_gst_pipeline_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_pipeline_get_typeFn c_gst_pipeline_get_type; ///
private alias c_gst_pipeline_newFn = extern(C) GstElement* function(const(char)* name) nothrow;
__gshared c_gst_pipeline_newFn c_gst_pipeline_new; ///
private alias c_gst_pipeline_auto_clockFn = extern(C) void function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_auto_clockFn c_gst_pipeline_auto_clock; ///
private alias c_gst_pipeline_get_auto_flush_busFn = extern(C) gboolean function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_auto_flush_busFn c_gst_pipeline_get_auto_flush_bus; ///
private alias c_gst_pipeline_get_busFn = extern(C) GstBus* function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_busFn c_gst_pipeline_get_bus; ///
private alias c_gst_pipeline_get_clockFn = extern(C) GstClock* function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_clockFn c_gst_pipeline_get_clock; ///
private alias c_gst_pipeline_get_configured_latencyFn = extern(C) GstClockTime function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_configured_latencyFn c_gst_pipeline_get_configured_latency; ///
private alias c_gst_pipeline_get_delayFn = extern(C) GstClockTime function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_delayFn c_gst_pipeline_get_delay; ///
private alias c_gst_pipeline_get_latencyFn = extern(C) GstClockTime function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_latencyFn c_gst_pipeline_get_latency; ///
private alias c_gst_pipeline_get_pipeline_clockFn = extern(C) GstClock* function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_get_pipeline_clockFn c_gst_pipeline_get_pipeline_clock; ///
private alias c_gst_pipeline_is_liveFn = extern(C) gboolean function(GstPipeline* pipeline) nothrow;
__gshared c_gst_pipeline_is_liveFn c_gst_pipeline_is_live; ///
private alias c_gst_pipeline_set_auto_flush_busFn = extern(C) void function(GstPipeline* pipeline, gboolean autoFlush) nothrow;
__gshared c_gst_pipeline_set_auto_flush_busFn c_gst_pipeline_set_auto_flush_bus; ///
private alias c_gst_pipeline_set_clockFn = extern(C) gboolean function(GstPipeline* pipeline, GstClock* clock) nothrow;
__gshared c_gst_pipeline_set_clockFn c_gst_pipeline_set_clock; ///
private alias c_gst_pipeline_set_delayFn = extern(C) void function(GstPipeline* pipeline, GstClockTime delay) nothrow;
__gshared c_gst_pipeline_set_delayFn c_gst_pipeline_set_delay; ///
private alias c_gst_pipeline_set_latencyFn = extern(C) void function(GstPipeline* pipeline, GstClockTime latency) nothrow;
__gshared c_gst_pipeline_set_latencyFn c_gst_pipeline_set_latency; ///
private alias c_gst_pipeline_use_clockFn = extern(C) void function(GstPipeline* pipeline, GstClock* clock) nothrow;
__gshared c_gst_pipeline_use_clockFn c_gst_pipeline_use_clock; ///

// Plugin
private alias c_gst_plugin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_plugin_get_typeFn c_gst_plugin_get_type; ///
private alias c_gst_plugin_list_freeFn = extern(C) void function(GList* list) nothrow;
__gshared c_gst_plugin_list_freeFn c_gst_plugin_list_free; ///
private alias c_gst_plugin_load_by_nameFn = extern(C) GstPlugin* function(const(char)* name) nothrow;
__gshared c_gst_plugin_load_by_nameFn c_gst_plugin_load_by_name; ///
private alias c_gst_plugin_load_fileFn = extern(C) GstPlugin* function(const(char)* filename, GError** _err) nothrow;
__gshared c_gst_plugin_load_fileFn c_gst_plugin_load_file; ///
private alias c_gst_plugin_register_staticFn = extern(C) gboolean function(int majorVersion, int minorVersion, const(char)* name, const(char)* description, GstPluginInitFunc initFunc, const(char)* version_, const(char)* license, const(char)* source, const(char)* package_, const(char)* origin) nothrow;
__gshared c_gst_plugin_register_staticFn c_gst_plugin_register_static; ///
private alias c_gst_plugin_register_static_fullFn = extern(C) gboolean function(int majorVersion, int minorVersion, const(char)* name, const(char)* description, GstPluginInitFullFunc initFullFunc, const(char)* version_, const(char)* license, const(char)* source, const(char)* package_, const(char)* origin, void* userData) nothrow;
__gshared c_gst_plugin_register_static_fullFn c_gst_plugin_register_static_full; ///
private alias c_gst_plugin_add_dependencyFn = extern(C) void function(GstPlugin* plugin, const(char*)* envVars, const(char*)* paths, const(char*)* names, GstPluginDependencyFlags flags) nothrow;
__gshared c_gst_plugin_add_dependencyFn c_gst_plugin_add_dependency; ///
private alias c_gst_plugin_add_dependency_simpleFn = extern(C) void function(GstPlugin* plugin, const(char)* envVars, const(char)* paths, const(char)* names, GstPluginDependencyFlags flags) nothrow;
__gshared c_gst_plugin_add_dependency_simpleFn c_gst_plugin_add_dependency_simple; ///
private alias c_gst_plugin_add_status_errorFn = extern(C) void function(GstPlugin* plugin, const(char)* message) nothrow;
__gshared c_gst_plugin_add_status_errorFn c_gst_plugin_add_status_error; ///
private alias c_gst_plugin_add_status_infoFn = extern(C) void function(GstPlugin* plugin, const(char)* message) nothrow;
__gshared c_gst_plugin_add_status_infoFn c_gst_plugin_add_status_info; ///
private alias c_gst_plugin_add_status_warningFn = extern(C) void function(GstPlugin* plugin, const(char)* message) nothrow;
__gshared c_gst_plugin_add_status_warningFn c_gst_plugin_add_status_warning; ///
private alias c_gst_plugin_get_cache_dataFn = extern(C) const(GstStructure)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_cache_dataFn c_gst_plugin_get_cache_data; ///
private alias c_gst_plugin_get_descriptionFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_descriptionFn c_gst_plugin_get_description; ///
private alias c_gst_plugin_get_filenameFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_filenameFn c_gst_plugin_get_filename; ///
private alias c_gst_plugin_get_licenseFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_licenseFn c_gst_plugin_get_license; ///
private alias c_gst_plugin_get_nameFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_nameFn c_gst_plugin_get_name; ///
private alias c_gst_plugin_get_originFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_originFn c_gst_plugin_get_origin; ///
private alias c_gst_plugin_get_packageFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_packageFn c_gst_plugin_get_package; ///
private alias c_gst_plugin_get_release_date_stringFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_release_date_stringFn c_gst_plugin_get_release_date_string; ///
private alias c_gst_plugin_get_sourceFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_sourceFn c_gst_plugin_get_source; ///
private alias c_gst_plugin_get_status_errorsFn = extern(C) char** function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_status_errorsFn c_gst_plugin_get_status_errors; ///
private alias c_gst_plugin_get_status_infosFn = extern(C) char** function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_status_infosFn c_gst_plugin_get_status_infos; ///
private alias c_gst_plugin_get_status_warningsFn = extern(C) char** function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_status_warningsFn c_gst_plugin_get_status_warnings; ///
private alias c_gst_plugin_get_versionFn = extern(C) const(char)* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_get_versionFn c_gst_plugin_get_version; ///
private alias c_gst_plugin_is_loadedFn = extern(C) gboolean function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_is_loadedFn c_gst_plugin_is_loaded; ///
private alias c_gst_plugin_loadFn = extern(C) GstPlugin* function(GstPlugin* plugin) nothrow;
__gshared c_gst_plugin_loadFn c_gst_plugin_load; ///
private alias c_gst_plugin_set_cache_dataFn = extern(C) void function(GstPlugin* plugin, GstStructure* cacheData) nothrow;
__gshared c_gst_plugin_set_cache_dataFn c_gst_plugin_set_cache_data; ///

// PluginFeature
private alias c_gst_plugin_feature_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_plugin_feature_get_typeFn c_gst_plugin_feature_get_type; ///
private alias c_gst_plugin_feature_list_copyFn = extern(C) GList* function(GList* list) nothrow;
__gshared c_gst_plugin_feature_list_copyFn c_gst_plugin_feature_list_copy; ///
private alias c_gst_plugin_feature_list_debugFn = extern(C) void function(GList* list) nothrow;
__gshared c_gst_plugin_feature_list_debugFn c_gst_plugin_feature_list_debug; ///
private alias c_gst_plugin_feature_list_freeFn = extern(C) void function(GList* list) nothrow;
__gshared c_gst_plugin_feature_list_freeFn c_gst_plugin_feature_list_free; ///
private alias c_gst_plugin_feature_rank_compare_funcFn = extern(C) int function(const(void)* p1, const(void)* p2) nothrow;
__gshared c_gst_plugin_feature_rank_compare_funcFn c_gst_plugin_feature_rank_compare_func; ///
private alias c_gst_plugin_feature_check_versionFn = extern(C) gboolean function(GstPluginFeature* feature, uint minMajor, uint minMinor, uint minMicro) nothrow;
__gshared c_gst_plugin_feature_check_versionFn c_gst_plugin_feature_check_version; ///
private alias c_gst_plugin_feature_get_pluginFn = extern(C) GstPlugin* function(GstPluginFeature* feature) nothrow;
__gshared c_gst_plugin_feature_get_pluginFn c_gst_plugin_feature_get_plugin; ///
private alias c_gst_plugin_feature_get_plugin_nameFn = extern(C) const(char)* function(GstPluginFeature* feature) nothrow;
__gshared c_gst_plugin_feature_get_plugin_nameFn c_gst_plugin_feature_get_plugin_name; ///
private alias c_gst_plugin_feature_get_rankFn = extern(C) uint function(GstPluginFeature* feature) nothrow;
__gshared c_gst_plugin_feature_get_rankFn c_gst_plugin_feature_get_rank; ///
private alias c_gst_plugin_feature_loadFn = extern(C) GstPluginFeature* function(GstPluginFeature* feature) nothrow;
__gshared c_gst_plugin_feature_loadFn c_gst_plugin_feature_load; ///
private alias c_gst_plugin_feature_set_rankFn = extern(C) void function(GstPluginFeature* feature, uint rank) nothrow;
__gshared c_gst_plugin_feature_set_rankFn c_gst_plugin_feature_set_rank; ///

// Poll
private alias c_gst_poll_add_fdFn = extern(C) gboolean function(GstPoll* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_add_fdFn c_gst_poll_add_fd; ///
private alias c_gst_poll_fd_can_readFn = extern(C) gboolean function(const(GstPoll)* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_can_readFn c_gst_poll_fd_can_read; ///
private alias c_gst_poll_fd_can_writeFn = extern(C) gboolean function(const(GstPoll)* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_can_writeFn c_gst_poll_fd_can_write; ///
private alias c_gst_poll_fd_ctl_priFn = extern(C) gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) nothrow;
__gshared c_gst_poll_fd_ctl_priFn c_gst_poll_fd_ctl_pri; ///
private alias c_gst_poll_fd_ctl_readFn = extern(C) gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) nothrow;
__gshared c_gst_poll_fd_ctl_readFn c_gst_poll_fd_ctl_read; ///
private alias c_gst_poll_fd_ctl_writeFn = extern(C) gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) nothrow;
__gshared c_gst_poll_fd_ctl_writeFn c_gst_poll_fd_ctl_write; ///
private alias c_gst_poll_fd_has_closedFn = extern(C) gboolean function(const(GstPoll)* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_has_closedFn c_gst_poll_fd_has_closed; ///
private alias c_gst_poll_fd_has_errorFn = extern(C) gboolean function(const(GstPoll)* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_has_errorFn c_gst_poll_fd_has_error; ///
private alias c_gst_poll_fd_has_priFn = extern(C) gboolean function(const(GstPoll)* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_has_priFn c_gst_poll_fd_has_pri; ///
private alias c_gst_poll_fd_ignoredFn = extern(C) void function(GstPoll* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_ignoredFn c_gst_poll_fd_ignored; ///
private alias c_gst_poll_freeFn = extern(C) void function(GstPoll* set) nothrow;
__gshared c_gst_poll_freeFn c_gst_poll_free; ///
private alias c_gst_poll_get_read_gpollfdFn = extern(C) void function(GstPoll* set, GPollFD* fd) nothrow;
__gshared c_gst_poll_get_read_gpollfdFn c_gst_poll_get_read_gpollfd; ///
private alias c_gst_poll_read_controlFn = extern(C) gboolean function(GstPoll* set) nothrow;
__gshared c_gst_poll_read_controlFn c_gst_poll_read_control; ///
private alias c_gst_poll_remove_fdFn = extern(C) gboolean function(GstPoll* set, GstPollFD* fd) nothrow;
__gshared c_gst_poll_remove_fdFn c_gst_poll_remove_fd; ///
private alias c_gst_poll_restartFn = extern(C) void function(GstPoll* set) nothrow;
__gshared c_gst_poll_restartFn c_gst_poll_restart; ///
private alias c_gst_poll_set_controllableFn = extern(C) gboolean function(GstPoll* set, gboolean controllable) nothrow;
__gshared c_gst_poll_set_controllableFn c_gst_poll_set_controllable; ///
private alias c_gst_poll_set_flushingFn = extern(C) void function(GstPoll* set, gboolean flushing) nothrow;
__gshared c_gst_poll_set_flushingFn c_gst_poll_set_flushing; ///
private alias c_gst_poll_waitFn = extern(C) int function(GstPoll* set, GstClockTime timeout) nothrow;
__gshared c_gst_poll_waitFn c_gst_poll_wait; ///
private alias c_gst_poll_write_controlFn = extern(C) gboolean function(GstPoll* set) nothrow;
__gshared c_gst_poll_write_controlFn c_gst_poll_write_control; ///
private alias c_gst_poll_newFn = extern(C) GstPoll* function(gboolean controllable) nothrow;
__gshared c_gst_poll_newFn c_gst_poll_new; ///
private alias c_gst_poll_new_timerFn = extern(C) GstPoll* function() nothrow;
__gshared c_gst_poll_new_timerFn c_gst_poll_new_timer; ///

// PollFD
private alias c_gst_poll_fd_initFn = extern(C) void function(GstPollFD* fd) nothrow;
__gshared c_gst_poll_fd_initFn c_gst_poll_fd_init; ///

// Preset
private alias c_gst_preset_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_preset_get_typeFn c_gst_preset_get_type; ///
private alias c_gst_preset_get_app_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_gst_preset_get_app_dirFn c_gst_preset_get_app_dir; ///
private alias c_gst_preset_set_app_dirFn = extern(C) gboolean function(const(char)* appDir) nothrow;
__gshared c_gst_preset_set_app_dirFn c_gst_preset_set_app_dir; ///
private alias c_gst_preset_delete_presetFn = extern(C) gboolean function(GstPreset* preset, const(char)* name) nothrow;
__gshared c_gst_preset_delete_presetFn c_gst_preset_delete_preset; ///
private alias c_gst_preset_get_metaFn = extern(C) gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, char** value) nothrow;
__gshared c_gst_preset_get_metaFn c_gst_preset_get_meta; ///
private alias c_gst_preset_get_preset_namesFn = extern(C) char** function(GstPreset* preset) nothrow;
__gshared c_gst_preset_get_preset_namesFn c_gst_preset_get_preset_names; ///
private alias c_gst_preset_get_property_namesFn = extern(C) char** function(GstPreset* preset) nothrow;
__gshared c_gst_preset_get_property_namesFn c_gst_preset_get_property_names; ///
private alias c_gst_preset_is_editableFn = extern(C) gboolean function(GstPreset* preset) nothrow;
__gshared c_gst_preset_is_editableFn c_gst_preset_is_editable; ///
private alias c_gst_preset_load_presetFn = extern(C) gboolean function(GstPreset* preset, const(char)* name) nothrow;
__gshared c_gst_preset_load_presetFn c_gst_preset_load_preset; ///
private alias c_gst_preset_rename_presetFn = extern(C) gboolean function(GstPreset* preset, const(char)* oldName, const(char)* newName) nothrow;
__gshared c_gst_preset_rename_presetFn c_gst_preset_rename_preset; ///
private alias c_gst_preset_save_presetFn = extern(C) gboolean function(GstPreset* preset, const(char)* name) nothrow;
__gshared c_gst_preset_save_presetFn c_gst_preset_save_preset; ///
private alias c_gst_preset_set_metaFn = extern(C) gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, const(char)* value) nothrow;
__gshared c_gst_preset_set_metaFn c_gst_preset_set_meta; ///

// Promise
private alias c_gst_promise_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_promise_get_typeFn c_gst_promise_get_type; ///
private alias c_gst_promise_newFn = extern(C) GstPromise* function() nothrow;
__gshared c_gst_promise_newFn c_gst_promise_new; ///
private alias c_gst_promise_new_with_change_funcFn = extern(C) GstPromise* function(GstPromiseChangeFunc func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_promise_new_with_change_funcFn c_gst_promise_new_with_change_func; ///
private alias c_gst_promise_expireFn = extern(C) void function(GstPromise* promise) nothrow;
__gshared c_gst_promise_expireFn c_gst_promise_expire; ///
private alias c_gst_promise_get_replyFn = extern(C) const(GstStructure)* function(GstPromise* promise) nothrow;
__gshared c_gst_promise_get_replyFn c_gst_promise_get_reply; ///
private alias c_gst_promise_interruptFn = extern(C) void function(GstPromise* promise) nothrow;
__gshared c_gst_promise_interruptFn c_gst_promise_interrupt; ///
private alias c_gst_promise_refFn = extern(C) GstPromise* function(GstPromise* promise) nothrow;
__gshared c_gst_promise_refFn c_gst_promise_ref; ///
private alias c_gst_promise_replyFn = extern(C) void function(GstPromise* promise, GstStructure* s) nothrow;
__gshared c_gst_promise_replyFn c_gst_promise_reply; ///
private alias c_gst_promise_unrefFn = extern(C) void function(GstPromise* promise) nothrow;
__gshared c_gst_promise_unrefFn c_gst_promise_unref; ///
private alias c_gst_promise_waitFn = extern(C) GstPromiseResult function(GstPromise* promise) nothrow;
__gshared c_gst_promise_waitFn c_gst_promise_wait; ///

// ProtectionMeta
private alias c_gst_protection_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_protection_meta_get_infoFn c_gst_protection_meta_get_info; ///

// ProxyPad
private alias c_gst_proxy_pad_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_proxy_pad_get_typeFn c_gst_proxy_pad_get_type; ///
private alias c_gst_proxy_pad_chain_defaultFn = extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstBuffer* buffer) nothrow;
__gshared c_gst_proxy_pad_chain_defaultFn c_gst_proxy_pad_chain_default; ///
private alias c_gst_proxy_pad_chain_list_defaultFn = extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstBufferList* list) nothrow;
__gshared c_gst_proxy_pad_chain_list_defaultFn c_gst_proxy_pad_chain_list_default; ///
private alias c_gst_proxy_pad_getrange_defaultFn = extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, ulong offset, uint size, GstBuffer** buffer) nothrow;
__gshared c_gst_proxy_pad_getrange_defaultFn c_gst_proxy_pad_getrange_default; ///
private alias c_gst_proxy_pad_iterate_internal_links_defaultFn = extern(C) GstIterator* function(GstPad* pad, GstObject* parent) nothrow;
__gshared c_gst_proxy_pad_iterate_internal_links_defaultFn c_gst_proxy_pad_iterate_internal_links_default; ///
private alias c_gst_proxy_pad_get_internalFn = extern(C) GstProxyPad* function(GstProxyPad* pad) nothrow;
__gshared c_gst_proxy_pad_get_internalFn c_gst_proxy_pad_get_internal; ///

// Query
private alias c_gst_query_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_query_get_typeFn c_gst_query_get_type; ///
private alias c_gst_query_new_accept_capsFn = extern(C) GstQuery* function(GstCaps* caps) nothrow;
__gshared c_gst_query_new_accept_capsFn c_gst_query_new_accept_caps; ///
private alias c_gst_query_new_allocationFn = extern(C) GstQuery* function(GstCaps* caps, gboolean needPool) nothrow;
__gshared c_gst_query_new_allocationFn c_gst_query_new_allocation; ///
private alias c_gst_query_new_bitrateFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_bitrateFn c_gst_query_new_bitrate; ///
private alias c_gst_query_new_bufferingFn = extern(C) GstQuery* function(GstFormat format) nothrow;
__gshared c_gst_query_new_bufferingFn c_gst_query_new_buffering; ///
private alias c_gst_query_new_capsFn = extern(C) GstQuery* function(GstCaps* filter) nothrow;
__gshared c_gst_query_new_capsFn c_gst_query_new_caps; ///
private alias c_gst_query_new_contextFn = extern(C) GstQuery* function(const(char)* contextType) nothrow;
__gshared c_gst_query_new_contextFn c_gst_query_new_context; ///
private alias c_gst_query_new_convertFn = extern(C) GstQuery* function(GstFormat srcFormat, long value, GstFormat destFormat) nothrow;
__gshared c_gst_query_new_convertFn c_gst_query_new_convert; ///
private alias c_gst_query_new_customFn = extern(C) GstQuery* function(GstQueryType type, GstStructure* structure) nothrow;
__gshared c_gst_query_new_customFn c_gst_query_new_custom; ///
private alias c_gst_query_new_drainFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_drainFn c_gst_query_new_drain; ///
private alias c_gst_query_new_durationFn = extern(C) GstQuery* function(GstFormat format) nothrow;
__gshared c_gst_query_new_durationFn c_gst_query_new_duration; ///
private alias c_gst_query_new_formatsFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_formatsFn c_gst_query_new_formats; ///
private alias c_gst_query_new_latencyFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_latencyFn c_gst_query_new_latency; ///
private alias c_gst_query_new_positionFn = extern(C) GstQuery* function(GstFormat format) nothrow;
__gshared c_gst_query_new_positionFn c_gst_query_new_position; ///
private alias c_gst_query_new_schedulingFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_schedulingFn c_gst_query_new_scheduling; ///
private alias c_gst_query_new_seekingFn = extern(C) GstQuery* function(GstFormat format) nothrow;
__gshared c_gst_query_new_seekingFn c_gst_query_new_seeking; ///
private alias c_gst_query_new_segmentFn = extern(C) GstQuery* function(GstFormat format) nothrow;
__gshared c_gst_query_new_segmentFn c_gst_query_new_segment; ///
private alias c_gst_query_new_selectableFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_selectableFn c_gst_query_new_selectable; ///
private alias c_gst_query_new_uriFn = extern(C) GstQuery* function() nothrow;
__gshared c_gst_query_new_uriFn c_gst_query_new_uri; ///
private alias c_gst_query_add_allocation_metaFn = extern(C) void function(GstQuery* query, GType api, const(GstStructure)* params) nothrow;
__gshared c_gst_query_add_allocation_metaFn c_gst_query_add_allocation_meta; ///
private alias c_gst_query_add_allocation_paramFn = extern(C) void function(GstQuery* query, GstAllocator* allocator, const(GstAllocationParams)* params) nothrow;
__gshared c_gst_query_add_allocation_paramFn c_gst_query_add_allocation_param; ///
private alias c_gst_query_add_allocation_poolFn = extern(C) void function(GstQuery* query, GstBufferPool* pool, uint size, uint minBuffers, uint maxBuffers) nothrow;
__gshared c_gst_query_add_allocation_poolFn c_gst_query_add_allocation_pool; ///
private alias c_gst_query_add_buffering_rangeFn = extern(C) gboolean function(GstQuery* query, long start, long stop) nothrow;
__gshared c_gst_query_add_buffering_rangeFn c_gst_query_add_buffering_range; ///
private alias c_gst_query_add_scheduling_modeFn = extern(C) void function(GstQuery* query, GstPadMode mode) nothrow;
__gshared c_gst_query_add_scheduling_modeFn c_gst_query_add_scheduling_mode; ///
private alias c_gst_query_copyFn = extern(C) GstQuery* function(const(GstQuery)* q) nothrow;
__gshared c_gst_query_copyFn c_gst_query_copy; ///
private alias c_gst_query_find_allocation_metaFn = extern(C) gboolean function(GstQuery* query, GType api, uint* index) nothrow;
__gshared c_gst_query_find_allocation_metaFn c_gst_query_find_allocation_meta; ///
private alias c_gst_query_get_n_allocation_metasFn = extern(C) uint function(GstQuery* query) nothrow;
__gshared c_gst_query_get_n_allocation_metasFn c_gst_query_get_n_allocation_metas; ///
private alias c_gst_query_get_n_allocation_paramsFn = extern(C) uint function(GstQuery* query) nothrow;
__gshared c_gst_query_get_n_allocation_paramsFn c_gst_query_get_n_allocation_params; ///
private alias c_gst_query_get_n_allocation_poolsFn = extern(C) uint function(GstQuery* query) nothrow;
__gshared c_gst_query_get_n_allocation_poolsFn c_gst_query_get_n_allocation_pools; ///
private alias c_gst_query_get_n_buffering_rangesFn = extern(C) uint function(GstQuery* query) nothrow;
__gshared c_gst_query_get_n_buffering_rangesFn c_gst_query_get_n_buffering_ranges; ///
private alias c_gst_query_get_n_scheduling_modesFn = extern(C) uint function(GstQuery* query) nothrow;
__gshared c_gst_query_get_n_scheduling_modesFn c_gst_query_get_n_scheduling_modes; ///
private alias c_gst_query_get_structureFn = extern(C) const(GstStructure)* function(GstQuery* query) nothrow;
__gshared c_gst_query_get_structureFn c_gst_query_get_structure; ///
private alias c_gst_query_has_scheduling_modeFn = extern(C) gboolean function(GstQuery* query, GstPadMode mode) nothrow;
__gshared c_gst_query_has_scheduling_modeFn c_gst_query_has_scheduling_mode; ///
private alias c_gst_query_has_scheduling_mode_with_flagsFn = extern(C) gboolean function(GstQuery* query, GstPadMode mode, GstSchedulingFlags flags) nothrow;
__gshared c_gst_query_has_scheduling_mode_with_flagsFn c_gst_query_has_scheduling_mode_with_flags; ///
private alias c_gst_query_is_writableFn = extern(C) gboolean function(const(GstQuery)* query) nothrow;
__gshared c_gst_query_is_writableFn c_gst_query_is_writable; ///
private alias c_gst_query_make_writableFn = extern(C) GstQuery* function(GstQuery* query) nothrow;
__gshared c_gst_query_make_writableFn c_gst_query_make_writable; ///
private alias c_gst_query_parse_accept_capsFn = extern(C) void function(GstQuery* query, GstCaps** caps) nothrow;
__gshared c_gst_query_parse_accept_capsFn c_gst_query_parse_accept_caps; ///
private alias c_gst_query_parse_accept_caps_resultFn = extern(C) void function(GstQuery* query, gboolean* result) nothrow;
__gshared c_gst_query_parse_accept_caps_resultFn c_gst_query_parse_accept_caps_result; ///
private alias c_gst_query_parse_allocationFn = extern(C) void function(GstQuery* query, GstCaps** caps, gboolean* needPool) nothrow;
__gshared c_gst_query_parse_allocationFn c_gst_query_parse_allocation; ///
private alias c_gst_query_parse_bitrateFn = extern(C) void function(GstQuery* query, uint* nominalBitrate) nothrow;
__gshared c_gst_query_parse_bitrateFn c_gst_query_parse_bitrate; ///
private alias c_gst_query_parse_buffering_percentFn = extern(C) void function(GstQuery* query, gboolean* busy, int* percent) nothrow;
__gshared c_gst_query_parse_buffering_percentFn c_gst_query_parse_buffering_percent; ///
private alias c_gst_query_parse_buffering_rangeFn = extern(C) void function(GstQuery* query, GstFormat* format, long* start, long* stop, long* estimatedTotal) nothrow;
__gshared c_gst_query_parse_buffering_rangeFn c_gst_query_parse_buffering_range; ///
private alias c_gst_query_parse_buffering_statsFn = extern(C) void function(GstQuery* query, GstBufferingMode* mode, int* avgIn, int* avgOut, long* bufferingLeft) nothrow;
__gshared c_gst_query_parse_buffering_statsFn c_gst_query_parse_buffering_stats; ///
private alias c_gst_query_parse_capsFn = extern(C) void function(GstQuery* query, GstCaps** filter) nothrow;
__gshared c_gst_query_parse_capsFn c_gst_query_parse_caps; ///
private alias c_gst_query_parse_caps_resultFn = extern(C) void function(GstQuery* query, GstCaps** caps) nothrow;
__gshared c_gst_query_parse_caps_resultFn c_gst_query_parse_caps_result; ///
private alias c_gst_query_parse_contextFn = extern(C) void function(GstQuery* query, GstContext** context) nothrow;
__gshared c_gst_query_parse_contextFn c_gst_query_parse_context; ///
private alias c_gst_query_parse_context_typeFn = extern(C) gboolean function(GstQuery* query, const(char*)* contextType) nothrow;
__gshared c_gst_query_parse_context_typeFn c_gst_query_parse_context_type; ///
private alias c_gst_query_parse_convertFn = extern(C) void function(GstQuery* query, GstFormat* srcFormat, long* srcValue, GstFormat* destFormat, long* destValue) nothrow;
__gshared c_gst_query_parse_convertFn c_gst_query_parse_convert; ///
private alias c_gst_query_parse_durationFn = extern(C) void function(GstQuery* query, GstFormat* format, long* duration) nothrow;
__gshared c_gst_query_parse_durationFn c_gst_query_parse_duration; ///
private alias c_gst_query_parse_latencyFn = extern(C) void function(GstQuery* query, gboolean* live, GstClockTime* minLatency, GstClockTime* maxLatency) nothrow;
__gshared c_gst_query_parse_latencyFn c_gst_query_parse_latency; ///
private alias c_gst_query_parse_n_formatsFn = extern(C) void function(GstQuery* query, uint* nFormats) nothrow;
__gshared c_gst_query_parse_n_formatsFn c_gst_query_parse_n_formats; ///
private alias c_gst_query_parse_nth_allocation_metaFn = extern(C) GType function(GstQuery* query, uint index, const(GstStructure*)* params) nothrow;
__gshared c_gst_query_parse_nth_allocation_metaFn c_gst_query_parse_nth_allocation_meta; ///
private alias c_gst_query_parse_nth_allocation_paramFn = extern(C) void function(GstQuery* query, uint index, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_query_parse_nth_allocation_paramFn c_gst_query_parse_nth_allocation_param; ///
private alias c_gst_query_parse_nth_allocation_poolFn = extern(C) void function(GstQuery* query, uint index, GstBufferPool** pool, uint* size, uint* minBuffers, uint* maxBuffers) nothrow;
__gshared c_gst_query_parse_nth_allocation_poolFn c_gst_query_parse_nth_allocation_pool; ///
private alias c_gst_query_parse_nth_buffering_rangeFn = extern(C) gboolean function(GstQuery* query, uint index, long* start, long* stop) nothrow;
__gshared c_gst_query_parse_nth_buffering_rangeFn c_gst_query_parse_nth_buffering_range; ///
private alias c_gst_query_parse_nth_formatFn = extern(C) void function(GstQuery* query, uint nth, GstFormat* format) nothrow;
__gshared c_gst_query_parse_nth_formatFn c_gst_query_parse_nth_format; ///
private alias c_gst_query_parse_nth_scheduling_modeFn = extern(C) GstPadMode function(GstQuery* query, uint index) nothrow;
__gshared c_gst_query_parse_nth_scheduling_modeFn c_gst_query_parse_nth_scheduling_mode; ///
private alias c_gst_query_parse_positionFn = extern(C) void function(GstQuery* query, GstFormat* format, long* cur) nothrow;
__gshared c_gst_query_parse_positionFn c_gst_query_parse_position; ///
private alias c_gst_query_parse_schedulingFn = extern(C) void function(GstQuery* query, GstSchedulingFlags* flags, int* minsize, int* maxsize, int* align_) nothrow;
__gshared c_gst_query_parse_schedulingFn c_gst_query_parse_scheduling; ///
private alias c_gst_query_parse_seekingFn = extern(C) void function(GstQuery* query, GstFormat* format, gboolean* seekable, long* segmentStart, long* segmentEnd) nothrow;
__gshared c_gst_query_parse_seekingFn c_gst_query_parse_seeking; ///
private alias c_gst_query_parse_segmentFn = extern(C) void function(GstQuery* query, double* rate, GstFormat* format, long* startValue, long* stopValue) nothrow;
__gshared c_gst_query_parse_segmentFn c_gst_query_parse_segment; ///
private alias c_gst_query_parse_selectableFn = extern(C) void function(GstQuery* query, gboolean* selectable) nothrow;
__gshared c_gst_query_parse_selectableFn c_gst_query_parse_selectable; ///
private alias c_gst_query_parse_uriFn = extern(C) void function(GstQuery* query, char** uri) nothrow;
__gshared c_gst_query_parse_uriFn c_gst_query_parse_uri; ///
private alias c_gst_query_parse_uri_redirectionFn = extern(C) void function(GstQuery* query, char** uri) nothrow;
__gshared c_gst_query_parse_uri_redirectionFn c_gst_query_parse_uri_redirection; ///
private alias c_gst_query_parse_uri_redirection_permanentFn = extern(C) void function(GstQuery* query, gboolean* permanent) nothrow;
__gshared c_gst_query_parse_uri_redirection_permanentFn c_gst_query_parse_uri_redirection_permanent; ///
private alias c_gst_query_refFn = extern(C) GstQuery* function(GstQuery* q) nothrow;
__gshared c_gst_query_refFn c_gst_query_ref; ///
private alias c_gst_query_remove_nth_allocation_metaFn = extern(C) void function(GstQuery* query, uint index) nothrow;
__gshared c_gst_query_remove_nth_allocation_metaFn c_gst_query_remove_nth_allocation_meta; ///
private alias c_gst_query_remove_nth_allocation_paramFn = extern(C) void function(GstQuery* query, uint index) nothrow;
__gshared c_gst_query_remove_nth_allocation_paramFn c_gst_query_remove_nth_allocation_param; ///
private alias c_gst_query_remove_nth_allocation_poolFn = extern(C) void function(GstQuery* query, uint index) nothrow;
__gshared c_gst_query_remove_nth_allocation_poolFn c_gst_query_remove_nth_allocation_pool; ///
private alias c_gst_query_set_accept_caps_resultFn = extern(C) void function(GstQuery* query, gboolean result) nothrow;
__gshared c_gst_query_set_accept_caps_resultFn c_gst_query_set_accept_caps_result; ///
private alias c_gst_query_set_bitrateFn = extern(C) void function(GstQuery* query, uint nominalBitrate) nothrow;
__gshared c_gst_query_set_bitrateFn c_gst_query_set_bitrate; ///
private alias c_gst_query_set_buffering_percentFn = extern(C) void function(GstQuery* query, gboolean busy, int percent) nothrow;
__gshared c_gst_query_set_buffering_percentFn c_gst_query_set_buffering_percent; ///
private alias c_gst_query_set_buffering_rangeFn = extern(C) void function(GstQuery* query, GstFormat format, long start, long stop, long estimatedTotal) nothrow;
__gshared c_gst_query_set_buffering_rangeFn c_gst_query_set_buffering_range; ///
private alias c_gst_query_set_buffering_statsFn = extern(C) void function(GstQuery* query, GstBufferingMode mode, int avgIn, int avgOut, long bufferingLeft) nothrow;
__gshared c_gst_query_set_buffering_statsFn c_gst_query_set_buffering_stats; ///
private alias c_gst_query_set_caps_resultFn = extern(C) void function(GstQuery* query, GstCaps* caps) nothrow;
__gshared c_gst_query_set_caps_resultFn c_gst_query_set_caps_result; ///
private alias c_gst_query_set_contextFn = extern(C) void function(GstQuery* query, GstContext* context) nothrow;
__gshared c_gst_query_set_contextFn c_gst_query_set_context; ///
private alias c_gst_query_set_convertFn = extern(C) void function(GstQuery* query, GstFormat srcFormat, long srcValue, GstFormat destFormat, long destValue) nothrow;
__gshared c_gst_query_set_convertFn c_gst_query_set_convert; ///
private alias c_gst_query_set_durationFn = extern(C) void function(GstQuery* query, GstFormat format, long duration) nothrow;
__gshared c_gst_query_set_durationFn c_gst_query_set_duration; ///
private alias c_gst_query_set_formatsFn = extern(C) void function(GstQuery* query, int nFormats,  ...) nothrow;
__gshared c_gst_query_set_formatsFn c_gst_query_set_formats; ///
private alias c_gst_query_set_formatsvFn = extern(C) void function(GstQuery* query, int nFormats, const(GstFormat)* formats) nothrow;
__gshared c_gst_query_set_formatsvFn c_gst_query_set_formatsv; ///
private alias c_gst_query_set_latencyFn = extern(C) void function(GstQuery* query, gboolean live, GstClockTime minLatency, GstClockTime maxLatency) nothrow;
__gshared c_gst_query_set_latencyFn c_gst_query_set_latency; ///
private alias c_gst_query_set_nth_allocation_paramFn = extern(C) void function(GstQuery* query, uint index, GstAllocator* allocator, const(GstAllocationParams)* params) nothrow;
__gshared c_gst_query_set_nth_allocation_paramFn c_gst_query_set_nth_allocation_param; ///
private alias c_gst_query_set_nth_allocation_poolFn = extern(C) void function(GstQuery* query, uint index, GstBufferPool* pool, uint size, uint minBuffers, uint maxBuffers) nothrow;
__gshared c_gst_query_set_nth_allocation_poolFn c_gst_query_set_nth_allocation_pool; ///
private alias c_gst_query_set_positionFn = extern(C) void function(GstQuery* query, GstFormat format, long cur) nothrow;
__gshared c_gst_query_set_positionFn c_gst_query_set_position; ///
private alias c_gst_query_set_schedulingFn = extern(C) void function(GstQuery* query, GstSchedulingFlags flags, int minsize, int maxsize, int align_) nothrow;
__gshared c_gst_query_set_schedulingFn c_gst_query_set_scheduling; ///
private alias c_gst_query_set_seekingFn = extern(C) void function(GstQuery* query, GstFormat format, gboolean seekable, long segmentStart, long segmentEnd) nothrow;
__gshared c_gst_query_set_seekingFn c_gst_query_set_seeking; ///
private alias c_gst_query_set_segmentFn = extern(C) void function(GstQuery* query, double rate, GstFormat format, long startValue, long stopValue) nothrow;
__gshared c_gst_query_set_segmentFn c_gst_query_set_segment; ///
private alias c_gst_query_set_selectableFn = extern(C) void function(GstQuery* query, gboolean selectable) nothrow;
__gshared c_gst_query_set_selectableFn c_gst_query_set_selectable; ///
private alias c_gst_query_set_uriFn = extern(C) void function(GstQuery* query, const(char)* uri) nothrow;
__gshared c_gst_query_set_uriFn c_gst_query_set_uri; ///
private alias c_gst_query_set_uri_redirectionFn = extern(C) void function(GstQuery* query, const(char)* uri) nothrow;
__gshared c_gst_query_set_uri_redirectionFn c_gst_query_set_uri_redirection; ///
private alias c_gst_query_set_uri_redirection_permanentFn = extern(C) void function(GstQuery* query, gboolean permanent) nothrow;
__gshared c_gst_query_set_uri_redirection_permanentFn c_gst_query_set_uri_redirection_permanent; ///
private alias c_gst_query_unrefFn = extern(C) void function(GstQuery* q) nothrow;
__gshared c_gst_query_unrefFn c_gst_query_unref; ///
private alias c_gst_query_writable_structureFn = extern(C) GstStructure* function(GstQuery* query) nothrow;
__gshared c_gst_query_writable_structureFn c_gst_query_writable_structure; ///
private alias c_gst_query_replaceFn = extern(C) gboolean function(GstQuery** oldQuery, GstQuery* newQuery) nothrow;
__gshared c_gst_query_replaceFn c_gst_query_replace; ///
private alias c_gst_query_stealFn = extern(C) GstQuery* function(GstQuery** oldQuery) nothrow;
__gshared c_gst_query_stealFn c_gst_query_steal; ///
private alias c_gst_query_takeFn = extern(C) gboolean function(GstQuery** oldQuery, GstQuery* newQuery) nothrow;
__gshared c_gst_query_takeFn c_gst_query_take; ///

// ReferenceTimestampMeta
private alias c_gst_reference_timestamp_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_reference_timestamp_meta_get_infoFn c_gst_reference_timestamp_meta_get_info; ///

// Registry
private alias c_gst_registry_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_registry_get_typeFn c_gst_registry_get_type; ///
private alias c_gst_registry_fork_is_enabledFn = extern(C) gboolean function() nothrow;
__gshared c_gst_registry_fork_is_enabledFn c_gst_registry_fork_is_enabled; ///
private alias c_gst_registry_fork_set_enabledFn = extern(C) void function(gboolean enabled) nothrow;
__gshared c_gst_registry_fork_set_enabledFn c_gst_registry_fork_set_enabled; ///
private alias c_gst_registry_getFn = extern(C) GstRegistry* function() nothrow;
__gshared c_gst_registry_getFn c_gst_registry_get; ///
private alias c_gst_registry_add_featureFn = extern(C) gboolean function(GstRegistry* registry, GstPluginFeature* feature) nothrow;
__gshared c_gst_registry_add_featureFn c_gst_registry_add_feature; ///
private alias c_gst_registry_add_pluginFn = extern(C) gboolean function(GstRegistry* registry, GstPlugin* plugin) nothrow;
__gshared c_gst_registry_add_pluginFn c_gst_registry_add_plugin; ///
private alias c_gst_registry_check_feature_versionFn = extern(C) gboolean function(GstRegistry* registry, const(char)* featureName, uint minMajor, uint minMinor, uint minMicro) nothrow;
__gshared c_gst_registry_check_feature_versionFn c_gst_registry_check_feature_version; ///
private alias c_gst_registry_feature_filterFn = extern(C) GList* function(GstRegistry* registry, GstPluginFeatureFilter filter, gboolean first, void* userData) nothrow;
__gshared c_gst_registry_feature_filterFn c_gst_registry_feature_filter; ///
private alias c_gst_registry_find_featureFn = extern(C) GstPluginFeature* function(GstRegistry* registry, const(char)* name, GType type) nothrow;
__gshared c_gst_registry_find_featureFn c_gst_registry_find_feature; ///
private alias c_gst_registry_find_pluginFn = extern(C) GstPlugin* function(GstRegistry* registry, const(char)* name) nothrow;
__gshared c_gst_registry_find_pluginFn c_gst_registry_find_plugin; ///
private alias c_gst_registry_get_feature_listFn = extern(C) GList* function(GstRegistry* registry, GType type) nothrow;
__gshared c_gst_registry_get_feature_listFn c_gst_registry_get_feature_list; ///
private alias c_gst_registry_get_feature_list_by_pluginFn = extern(C) GList* function(GstRegistry* registry, const(char)* name) nothrow;
__gshared c_gst_registry_get_feature_list_by_pluginFn c_gst_registry_get_feature_list_by_plugin; ///
private alias c_gst_registry_get_feature_list_cookieFn = extern(C) uint function(GstRegistry* registry) nothrow;
__gshared c_gst_registry_get_feature_list_cookieFn c_gst_registry_get_feature_list_cookie; ///
private alias c_gst_registry_get_plugin_listFn = extern(C) GList* function(GstRegistry* registry) nothrow;
__gshared c_gst_registry_get_plugin_listFn c_gst_registry_get_plugin_list; ///
private alias c_gst_registry_lookupFn = extern(C) GstPlugin* function(GstRegistry* registry, const(char)* filename) nothrow;
__gshared c_gst_registry_lookupFn c_gst_registry_lookup; ///
private alias c_gst_registry_lookup_featureFn = extern(C) GstPluginFeature* function(GstRegistry* registry, const(char)* name) nothrow;
__gshared c_gst_registry_lookup_featureFn c_gst_registry_lookup_feature; ///
private alias c_gst_registry_plugin_filterFn = extern(C) GList* function(GstRegistry* registry, GstPluginFilter filter, gboolean first, void* userData) nothrow;
__gshared c_gst_registry_plugin_filterFn c_gst_registry_plugin_filter; ///
private alias c_gst_registry_remove_featureFn = extern(C) void function(GstRegistry* registry, GstPluginFeature* feature) nothrow;
__gshared c_gst_registry_remove_featureFn c_gst_registry_remove_feature; ///
private alias c_gst_registry_remove_pluginFn = extern(C) void function(GstRegistry* registry, GstPlugin* plugin) nothrow;
__gshared c_gst_registry_remove_pluginFn c_gst_registry_remove_plugin; ///
private alias c_gst_registry_scan_pathFn = extern(C) gboolean function(GstRegistry* registry, const(char)* path) nothrow;
__gshared c_gst_registry_scan_pathFn c_gst_registry_scan_path; ///

// Sample
private alias c_gst_sample_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_sample_get_typeFn c_gst_sample_get_type; ///
private alias c_gst_sample_newFn = extern(C) GstSample* function(GstBuffer* buffer, GstCaps* caps, const(GstSegment)* segment, GstStructure* info) nothrow;
__gshared c_gst_sample_newFn c_gst_sample_new; ///
private alias c_gst_sample_copyFn = extern(C) GstSample* function(const(GstSample)* sample) nothrow;
__gshared c_gst_sample_copyFn c_gst_sample_copy; ///
private alias c_gst_sample_get_bufferFn = extern(C) GstBuffer* function(GstSample* sample) nothrow;
__gshared c_gst_sample_get_bufferFn c_gst_sample_get_buffer; ///
private alias c_gst_sample_get_buffer_listFn = extern(C) GstBufferList* function(GstSample* sample) nothrow;
__gshared c_gst_sample_get_buffer_listFn c_gst_sample_get_buffer_list; ///
private alias c_gst_sample_get_capsFn = extern(C) GstCaps* function(GstSample* sample) nothrow;
__gshared c_gst_sample_get_capsFn c_gst_sample_get_caps; ///
private alias c_gst_sample_get_infoFn = extern(C) const(GstStructure)* function(GstSample* sample) nothrow;
__gshared c_gst_sample_get_infoFn c_gst_sample_get_info; ///
private alias c_gst_sample_get_segmentFn = extern(C) GstSegment* function(GstSample* sample) nothrow;
__gshared c_gst_sample_get_segmentFn c_gst_sample_get_segment; ///
private alias c_gst_sample_is_writableFn = extern(C) gboolean function(const(GstSample)* sample) nothrow;
__gshared c_gst_sample_is_writableFn c_gst_sample_is_writable; ///
private alias c_gst_sample_make_writableFn = extern(C) GstSample* function(GstSample* sample) nothrow;
__gshared c_gst_sample_make_writableFn c_gst_sample_make_writable; ///
private alias c_gst_sample_refFn = extern(C) GstSample* function(GstSample* sample) nothrow;
__gshared c_gst_sample_refFn c_gst_sample_ref; ///
private alias c_gst_sample_set_bufferFn = extern(C) void function(GstSample* sample, GstBuffer* buffer) nothrow;
__gshared c_gst_sample_set_bufferFn c_gst_sample_set_buffer; ///
private alias c_gst_sample_set_buffer_listFn = extern(C) void function(GstSample* sample, GstBufferList* bufferList) nothrow;
__gshared c_gst_sample_set_buffer_listFn c_gst_sample_set_buffer_list; ///
private alias c_gst_sample_set_capsFn = extern(C) void function(GstSample* sample, GstCaps* caps) nothrow;
__gshared c_gst_sample_set_capsFn c_gst_sample_set_caps; ///
private alias c_gst_sample_set_infoFn = extern(C) gboolean function(GstSample* sample, GstStructure* info) nothrow;
__gshared c_gst_sample_set_infoFn c_gst_sample_set_info; ///
private alias c_gst_sample_set_segmentFn = extern(C) void function(GstSample* sample, const(GstSegment)* segment) nothrow;
__gshared c_gst_sample_set_segmentFn c_gst_sample_set_segment; ///
private alias c_gst_sample_unrefFn = extern(C) void function(GstSample* sample) nothrow;
__gshared c_gst_sample_unrefFn c_gst_sample_unref; ///

// Segment
private alias c_gst_segment_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_segment_get_typeFn c_gst_segment_get_type; ///
private alias c_gst_segment_newFn = extern(C) GstSegment* function() nothrow;
__gshared c_gst_segment_newFn c_gst_segment_new; ///
private alias c_gst_segment_clipFn = extern(C) gboolean function(const(GstSegment)* segment, GstFormat format, ulong start, ulong stop, ulong* clipStart, ulong* clipStop) nothrow;
__gshared c_gst_segment_clipFn c_gst_segment_clip; ///
private alias c_gst_segment_copyFn = extern(C) GstSegment* function(const(GstSegment)* segment) nothrow;
__gshared c_gst_segment_copyFn c_gst_segment_copy; ///
private alias c_gst_segment_copy_intoFn = extern(C) void function(const(GstSegment)* src, GstSegment* dest) nothrow;
__gshared c_gst_segment_copy_intoFn c_gst_segment_copy_into; ///
private alias c_gst_segment_do_seekFn = extern(C) gboolean function(GstSegment* segment, double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, ulong start, GstSeekType stopType, ulong stop, gboolean* update) nothrow;
__gshared c_gst_segment_do_seekFn c_gst_segment_do_seek; ///
private alias c_gst_segment_freeFn = extern(C) void function(GstSegment* segment) nothrow;
__gshared c_gst_segment_freeFn c_gst_segment_free; ///
private alias c_gst_segment_initFn = extern(C) void function(GstSegment* segment, GstFormat format) nothrow;
__gshared c_gst_segment_initFn c_gst_segment_init; ///
private alias c_gst_segment_is_equalFn = extern(C) gboolean function(const(GstSegment)* s0, const(GstSegment)* s1) nothrow;
__gshared c_gst_segment_is_equalFn c_gst_segment_is_equal; ///
private alias c_gst_segment_offset_running_timeFn = extern(C) gboolean function(GstSegment* segment, GstFormat format, long offset) nothrow;
__gshared c_gst_segment_offset_running_timeFn c_gst_segment_offset_running_time; ///
private alias c_gst_segment_position_from_running_timeFn = extern(C) ulong function(const(GstSegment)* segment, GstFormat format, ulong runningTime) nothrow;
__gshared c_gst_segment_position_from_running_timeFn c_gst_segment_position_from_running_time; ///
private alias c_gst_segment_position_from_running_time_fullFn = extern(C) int function(const(GstSegment)* segment, GstFormat format, ulong runningTime, ulong* position) nothrow;
__gshared c_gst_segment_position_from_running_time_fullFn c_gst_segment_position_from_running_time_full; ///
private alias c_gst_segment_position_from_stream_timeFn = extern(C) ulong function(const(GstSegment)* segment, GstFormat format, ulong streamTime) nothrow;
__gshared c_gst_segment_position_from_stream_timeFn c_gst_segment_position_from_stream_time; ///
private alias c_gst_segment_position_from_stream_time_fullFn = extern(C) int function(const(GstSegment)* segment, GstFormat format, ulong streamTime, ulong* position) nothrow;
__gshared c_gst_segment_position_from_stream_time_fullFn c_gst_segment_position_from_stream_time_full; ///
private alias c_gst_segment_set_running_timeFn = extern(C) gboolean function(GstSegment* segment, GstFormat format, ulong runningTime) nothrow;
__gshared c_gst_segment_set_running_timeFn c_gst_segment_set_running_time; ///
private alias c_gst_segment_to_positionFn = extern(C) ulong function(const(GstSegment)* segment, GstFormat format, ulong runningTime) nothrow;
__gshared c_gst_segment_to_positionFn c_gst_segment_to_position; ///
private alias c_gst_segment_to_running_timeFn = extern(C) ulong function(const(GstSegment)* segment, GstFormat format, ulong position) nothrow;
__gshared c_gst_segment_to_running_timeFn c_gst_segment_to_running_time; ///
private alias c_gst_segment_to_running_time_fullFn = extern(C) int function(const(GstSegment)* segment, GstFormat format, ulong position, ulong* runningTime) nothrow;
__gshared c_gst_segment_to_running_time_fullFn c_gst_segment_to_running_time_full; ///
private alias c_gst_segment_to_stream_timeFn = extern(C) ulong function(const(GstSegment)* segment, GstFormat format, ulong position) nothrow;
__gshared c_gst_segment_to_stream_timeFn c_gst_segment_to_stream_time; ///
private alias c_gst_segment_to_stream_time_fullFn = extern(C) int function(const(GstSegment)* segment, GstFormat format, ulong position, ulong* streamTime) nothrow;
__gshared c_gst_segment_to_stream_time_fullFn c_gst_segment_to_stream_time_full; ///

// SharedTaskPool
private alias c_gst_shared_task_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_shared_task_pool_get_typeFn c_gst_shared_task_pool_get_type; ///
private alias c_gst_shared_task_pool_newFn = extern(C) GstTaskPool* function() nothrow;
__gshared c_gst_shared_task_pool_newFn c_gst_shared_task_pool_new; ///
private alias c_gst_shared_task_pool_get_max_threadsFn = extern(C) uint function(GstSharedTaskPool* pool) nothrow;
__gshared c_gst_shared_task_pool_get_max_threadsFn c_gst_shared_task_pool_get_max_threads; ///
private alias c_gst_shared_task_pool_set_max_threadsFn = extern(C) void function(GstSharedTaskPool* pool, uint maxThreads) nothrow;
__gshared c_gst_shared_task_pool_set_max_threadsFn c_gst_shared_task_pool_set_max_threads; ///

// StaticCaps
private alias c_gst_static_caps_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_static_caps_get_typeFn c_gst_static_caps_get_type; ///
private alias c_gst_static_caps_cleanupFn = extern(C) void function(GstStaticCaps* staticCaps) nothrow;
__gshared c_gst_static_caps_cleanupFn c_gst_static_caps_cleanup; ///
private alias c_gst_static_caps_getFn = extern(C) GstCaps* function(GstStaticCaps* staticCaps) nothrow;
__gshared c_gst_static_caps_getFn c_gst_static_caps_get; ///

// StaticPadTemplate
private alias c_gst_static_pad_template_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_static_pad_template_get_typeFn c_gst_static_pad_template_get_type; ///
private alias c_gst_static_pad_template_getFn = extern(C) GstPadTemplate* function(GstStaticPadTemplate* padTemplate) nothrow;
__gshared c_gst_static_pad_template_getFn c_gst_static_pad_template_get; ///
private alias c_gst_static_pad_template_get_capsFn = extern(C) GstCaps* function(GstStaticPadTemplate* templ) nothrow;
__gshared c_gst_static_pad_template_get_capsFn c_gst_static_pad_template_get_caps; ///

// Stream
private alias c_gst_stream_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_stream_get_typeFn c_gst_stream_get_type; ///
private alias c_gst_stream_newFn = extern(C) GstStream* function(const(char)* streamId, GstCaps* caps, GstStreamType type, GstStreamFlags flags) nothrow;
__gshared c_gst_stream_newFn c_gst_stream_new; ///
private alias c_gst_stream_get_capsFn = extern(C) GstCaps* function(GstStream* stream) nothrow;
__gshared c_gst_stream_get_capsFn c_gst_stream_get_caps; ///
private alias c_gst_stream_get_stream_flagsFn = extern(C) GstStreamFlags function(GstStream* stream) nothrow;
__gshared c_gst_stream_get_stream_flagsFn c_gst_stream_get_stream_flags; ///
private alias c_gst_stream_get_stream_idFn = extern(C) const(char)* function(GstStream* stream) nothrow;
__gshared c_gst_stream_get_stream_idFn c_gst_stream_get_stream_id; ///
private alias c_gst_stream_get_stream_typeFn = extern(C) GstStreamType function(GstStream* stream) nothrow;
__gshared c_gst_stream_get_stream_typeFn c_gst_stream_get_stream_type; ///
private alias c_gst_stream_get_tagsFn = extern(C) GstTagList* function(GstStream* stream) nothrow;
__gshared c_gst_stream_get_tagsFn c_gst_stream_get_tags; ///
private alias c_gst_stream_set_capsFn = extern(C) void function(GstStream* stream, GstCaps* caps) nothrow;
__gshared c_gst_stream_set_capsFn c_gst_stream_set_caps; ///
private alias c_gst_stream_set_stream_flagsFn = extern(C) void function(GstStream* stream, GstStreamFlags flags) nothrow;
__gshared c_gst_stream_set_stream_flagsFn c_gst_stream_set_stream_flags; ///
private alias c_gst_stream_set_stream_typeFn = extern(C) void function(GstStream* stream, GstStreamType streamType) nothrow;
__gshared c_gst_stream_set_stream_typeFn c_gst_stream_set_stream_type; ///
private alias c_gst_stream_set_tagsFn = extern(C) void function(GstStream* stream, GstTagList* tags) nothrow;
__gshared c_gst_stream_set_tagsFn c_gst_stream_set_tags; ///

// StreamCollection
private alias c_gst_stream_collection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_stream_collection_get_typeFn c_gst_stream_collection_get_type; ///
private alias c_gst_stream_collection_newFn = extern(C) GstStreamCollection* function(const(char)* upstreamId) nothrow;
__gshared c_gst_stream_collection_newFn c_gst_stream_collection_new; ///
private alias c_gst_stream_collection_add_streamFn = extern(C) gboolean function(GstStreamCollection* collection, GstStream* stream) nothrow;
__gshared c_gst_stream_collection_add_streamFn c_gst_stream_collection_add_stream; ///
private alias c_gst_stream_collection_get_sizeFn = extern(C) uint function(GstStreamCollection* collection) nothrow;
__gshared c_gst_stream_collection_get_sizeFn c_gst_stream_collection_get_size; ///
private alias c_gst_stream_collection_get_streamFn = extern(C) GstStream* function(GstStreamCollection* collection, uint index) nothrow;
__gshared c_gst_stream_collection_get_streamFn c_gst_stream_collection_get_stream; ///
private alias c_gst_stream_collection_get_upstream_idFn = extern(C) const(char)* function(GstStreamCollection* collection) nothrow;
__gshared c_gst_stream_collection_get_upstream_idFn c_gst_stream_collection_get_upstream_id; ///

// Structure
private alias c_gst_structure_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_structure_get_typeFn c_gst_structure_get_type; ///
private alias c_gst_structure_from_stringFn = extern(C) GstStructure* function(const(char)* string_, char** end) nothrow;
__gshared c_gst_structure_from_stringFn c_gst_structure_from_string; ///
private alias c_gst_structure_newFn = extern(C) GstStructure* function(const(char)* name, const(char)* firstfield,  ...) nothrow;
__gshared c_gst_structure_newFn c_gst_structure_new; ///
private alias c_gst_structure_new_emptyFn = extern(C) GstStructure* function(const(char)* name) nothrow;
__gshared c_gst_structure_new_emptyFn c_gst_structure_new_empty; ///
private alias c_gst_structure_new_from_stringFn = extern(C) GstStructure* function(const(char)* string_) nothrow;
__gshared c_gst_structure_new_from_stringFn c_gst_structure_new_from_string; ///
private alias c_gst_structure_new_idFn = extern(C) GstStructure* function(GQuark nameQuark, GQuark fieldQuark,  ...) nothrow;
__gshared c_gst_structure_new_idFn c_gst_structure_new_id; ///
private alias c_gst_structure_new_id_emptyFn = extern(C) GstStructure* function(GQuark quark) nothrow;
__gshared c_gst_structure_new_id_emptyFn c_gst_structure_new_id_empty; ///
private alias c_gst_structure_new_id_strFn = extern(C) GstStructure* function(const(GstIdStr)* name, const(GstIdStr)* fieldname,  ...) nothrow;
__gshared c_gst_structure_new_id_strFn c_gst_structure_new_id_str; ///
private alias c_gst_structure_new_id_str_emptyFn = extern(C) GstStructure* function(const(GstIdStr)* name) nothrow;
__gshared c_gst_structure_new_id_str_emptyFn c_gst_structure_new_id_str_empty; ///
private alias c_gst_structure_new_id_str_valistFn = extern(C) GstStructure* function(const(GstIdStr)* name, const(GstIdStr)* firstfield, void* varargs) nothrow;
__gshared c_gst_structure_new_id_str_valistFn c_gst_structure_new_id_str_valist; ///
private alias c_gst_structure_new_static_strFn = extern(C) GstStructure* function(const(char)* name, const(char)* firstfield,  ...) nothrow;
__gshared c_gst_structure_new_static_strFn c_gst_structure_new_static_str; ///
private alias c_gst_structure_new_static_str_emptyFn = extern(C) GstStructure* function(const(char)* name) nothrow;
__gshared c_gst_structure_new_static_str_emptyFn c_gst_structure_new_static_str_empty; ///
private alias c_gst_structure_new_static_str_valistFn = extern(C) GstStructure* function(const(char)* name, const(char)* firstfield, void* varargs) nothrow;
__gshared c_gst_structure_new_static_str_valistFn c_gst_structure_new_static_str_valist; ///
private alias c_gst_structure_new_valistFn = extern(C) GstStructure* function(const(char)* name, const(char)* firstfield, void* varargs) nothrow;
__gshared c_gst_structure_new_valistFn c_gst_structure_new_valist; ///
private alias c_gst_structure_can_intersectFn = extern(C) gboolean function(const(GstStructure)* struct1, const(GstStructure)* struct2) nothrow;
__gshared c_gst_structure_can_intersectFn c_gst_structure_can_intersect; ///
private alias c_gst_structure_copyFn = extern(C) GstStructure* function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_copyFn c_gst_structure_copy; ///
private alias c_gst_structure_filter_and_map_in_placeFn = extern(C) void function(GstStructure* structure, GstStructureFilterMapFunc func, void* userData) nothrow;
__gshared c_gst_structure_filter_and_map_in_placeFn c_gst_structure_filter_and_map_in_place; ///
private alias c_gst_structure_filter_and_map_in_place_id_strFn = extern(C) void function(GstStructure* structure, GstStructureFilterMapIdStrFunc func, void* userData) nothrow;
__gshared c_gst_structure_filter_and_map_in_place_id_strFn c_gst_structure_filter_and_map_in_place_id_str; ///
private alias c_gst_structure_fixateFn = extern(C) void function(GstStructure* structure) nothrow;
__gshared c_gst_structure_fixateFn c_gst_structure_fixate; ///
private alias c_gst_structure_fixate_fieldFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName) nothrow;
__gshared c_gst_structure_fixate_fieldFn c_gst_structure_fixate_field; ///
private alias c_gst_structure_fixate_field_booleanFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName, gboolean target) nothrow;
__gshared c_gst_structure_fixate_field_booleanFn c_gst_structure_fixate_field_boolean; ///
private alias c_gst_structure_fixate_field_nearest_doubleFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName, double target) nothrow;
__gshared c_gst_structure_fixate_field_nearest_doubleFn c_gst_structure_fixate_field_nearest_double; ///
private alias c_gst_structure_fixate_field_nearest_fractionFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName, int targetNumerator, int targetDenominator) nothrow;
__gshared c_gst_structure_fixate_field_nearest_fractionFn c_gst_structure_fixate_field_nearest_fraction; ///
private alias c_gst_structure_fixate_field_nearest_intFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName, int target) nothrow;
__gshared c_gst_structure_fixate_field_nearest_intFn c_gst_structure_fixate_field_nearest_int; ///
private alias c_gst_structure_fixate_field_stringFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldName, const(char)* target) nothrow;
__gshared c_gst_structure_fixate_field_stringFn c_gst_structure_fixate_field_string; ///
private alias c_gst_structure_foreachFn = extern(C) gboolean function(const(GstStructure)* structure, GstStructureForeachFunc func, void* userData) nothrow;
__gshared c_gst_structure_foreachFn c_gst_structure_foreach; ///
private alias c_gst_structure_foreach_id_strFn = extern(C) gboolean function(const(GstStructure)* structure, GstStructureForeachIdStrFunc func, void* userData) nothrow;
__gshared c_gst_structure_foreach_id_strFn c_gst_structure_foreach_id_str; ///
private alias c_gst_structure_freeFn = extern(C) void function(GstStructure* structure) nothrow;
__gshared c_gst_structure_freeFn c_gst_structure_free; ///
private alias c_gst_structure_getFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* firstFieldname,  ...) nothrow;
__gshared c_gst_structure_getFn c_gst_structure_get; ///
private alias c_gst_structure_get_arrayFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldname, GValueArray** array) nothrow;
__gshared c_gst_structure_get_arrayFn c_gst_structure_get_array; ///
private alias c_gst_structure_get_booleanFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, gboolean* value) nothrow;
__gshared c_gst_structure_get_booleanFn c_gst_structure_get_boolean; ///
private alias c_gst_structure_get_capsFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, const(GstCaps*)* caps) nothrow;
__gshared c_gst_structure_get_capsFn c_gst_structure_get_caps; ///
private alias c_gst_structure_get_clock_timeFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GstClockTime* value) nothrow;
__gshared c_gst_structure_get_clock_timeFn c_gst_structure_get_clock_time; ///
private alias c_gst_structure_get_dateFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GDate** value) nothrow;
__gshared c_gst_structure_get_dateFn c_gst_structure_get_date; ///
private alias c_gst_structure_get_date_timeFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GstDateTime** value) nothrow;
__gshared c_gst_structure_get_date_timeFn c_gst_structure_get_date_time; ///
private alias c_gst_structure_get_doubleFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, double* value) nothrow;
__gshared c_gst_structure_get_doubleFn c_gst_structure_get_double; ///
private alias c_gst_structure_get_enumFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType enumtype, int* value) nothrow;
__gshared c_gst_structure_get_enumFn c_gst_structure_get_enum; ///
private alias c_gst_structure_get_field_typeFn = extern(C) GType function(const(GstStructure)* structure, const(char)* fieldname) nothrow;
__gshared c_gst_structure_get_field_typeFn c_gst_structure_get_field_type; ///
private alias c_gst_structure_get_flagsFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType flagsType, uint* value) nothrow;
__gshared c_gst_structure_get_flagsFn c_gst_structure_get_flags; ///
private alias c_gst_structure_get_flagsetFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, uint* valueFlags, uint* valueMask) nothrow;
__gshared c_gst_structure_get_flagsetFn c_gst_structure_get_flagset; ///
private alias c_gst_structure_get_fractionFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, int* valueNumerator, int* valueDenominator) nothrow;
__gshared c_gst_structure_get_fractionFn c_gst_structure_get_fraction; ///
private alias c_gst_structure_get_intFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, int* value) nothrow;
__gshared c_gst_structure_get_intFn c_gst_structure_get_int; ///
private alias c_gst_structure_get_int64Fn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, long* value) nothrow;
__gshared c_gst_structure_get_int64Fn c_gst_structure_get_int64; ///
private alias c_gst_structure_get_listFn = extern(C) gboolean function(GstStructure* structure, const(char)* fieldname, GValueArray** array) nothrow;
__gshared c_gst_structure_get_listFn c_gst_structure_get_list; ///
private alias c_gst_structure_get_nameFn = extern(C) const(char)* function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_get_nameFn c_gst_structure_get_name; ///
private alias c_gst_structure_get_name_idFn = extern(C) GQuark function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_get_name_idFn c_gst_structure_get_name_id; ///
private alias c_gst_structure_get_name_id_strFn = extern(C) const(GstIdStr)* function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_get_name_id_strFn c_gst_structure_get_name_id_str; ///
private alias c_gst_structure_get_stringFn = extern(C) const(char)* function(const(GstStructure)* structure, const(char)* fieldname) nothrow;
__gshared c_gst_structure_get_stringFn c_gst_structure_get_string; ///
private alias c_gst_structure_get_uintFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, uint* value) nothrow;
__gshared c_gst_structure_get_uintFn c_gst_structure_get_uint; ///
private alias c_gst_structure_get_uint64Fn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, ulong* value) nothrow;
__gshared c_gst_structure_get_uint64Fn c_gst_structure_get_uint64; ///
private alias c_gst_structure_get_valistFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* firstFieldname, void* args) nothrow;
__gshared c_gst_structure_get_valistFn c_gst_structure_get_valist; ///
private alias c_gst_structure_get_valueFn = extern(C) const(GValue)* function(const(GstStructure)* structure, const(char)* fieldname) nothrow;
__gshared c_gst_structure_get_valueFn c_gst_structure_get_value; ///
private alias c_gst_structure_has_fieldFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname) nothrow;
__gshared c_gst_structure_has_fieldFn c_gst_structure_has_field; ///
private alias c_gst_structure_has_field_typedFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType type) nothrow;
__gshared c_gst_structure_has_field_typedFn c_gst_structure_has_field_typed; ///
private alias c_gst_structure_has_nameFn = extern(C) gboolean function(const(GstStructure)* structure, const(char)* name) nothrow;
__gshared c_gst_structure_has_nameFn c_gst_structure_has_name; ///
private alias c_gst_structure_id_getFn = extern(C) gboolean function(const(GstStructure)* structure, GQuark firstFieldId,  ...) nothrow;
__gshared c_gst_structure_id_getFn c_gst_structure_id_get; ///
private alias c_gst_structure_id_get_valistFn = extern(C) gboolean function(const(GstStructure)* structure, GQuark firstFieldId, void* args) nothrow;
__gshared c_gst_structure_id_get_valistFn c_gst_structure_id_get_valist; ///
private alias c_gst_structure_id_get_valueFn = extern(C) const(GValue)* function(const(GstStructure)* structure, GQuark field) nothrow;
__gshared c_gst_structure_id_get_valueFn c_gst_structure_id_get_value; ///
private alias c_gst_structure_id_has_fieldFn = extern(C) gboolean function(const(GstStructure)* structure, GQuark field) nothrow;
__gshared c_gst_structure_id_has_fieldFn c_gst_structure_id_has_field; ///
private alias c_gst_structure_id_has_field_typedFn = extern(C) gboolean function(const(GstStructure)* structure, GQuark field, GType type) nothrow;
__gshared c_gst_structure_id_has_field_typedFn c_gst_structure_id_has_field_typed; ///
private alias c_gst_structure_id_setFn = extern(C) void function(GstStructure* structure, GQuark fieldname,  ...) nothrow;
__gshared c_gst_structure_id_setFn c_gst_structure_id_set; ///
private alias c_gst_structure_id_set_valistFn = extern(C) void function(GstStructure* structure, GQuark fieldname, void* varargs) nothrow;
__gshared c_gst_structure_id_set_valistFn c_gst_structure_id_set_valist; ///
private alias c_gst_structure_id_set_valueFn = extern(C) void function(GstStructure* structure, GQuark field, const(GValue)* value) nothrow;
__gshared c_gst_structure_id_set_valueFn c_gst_structure_id_set_value; ///
private alias c_gst_structure_id_str_getFn = extern(C) gboolean function(const(GstStructure)* structure, const(GstIdStr)* firstFieldname,  ...) nothrow;
__gshared c_gst_structure_id_str_getFn c_gst_structure_id_str_get; ///
private alias c_gst_structure_id_str_get_field_typeFn = extern(C) GType function(const(GstStructure)* structure, const(GstIdStr)* fieldname) nothrow;
__gshared c_gst_structure_id_str_get_field_typeFn c_gst_structure_id_str_get_field_type; ///
private alias c_gst_structure_id_str_get_valistFn = extern(C) gboolean function(const(GstStructure)* structure, const(GstIdStr)* firstFieldname, void* args) nothrow;
__gshared c_gst_structure_id_str_get_valistFn c_gst_structure_id_str_get_valist; ///
private alias c_gst_structure_id_str_get_valueFn = extern(C) const(GValue)* function(const(GstStructure)* structure, const(GstIdStr)* fieldname) nothrow;
__gshared c_gst_structure_id_str_get_valueFn c_gst_structure_id_str_get_value; ///
private alias c_gst_structure_id_str_has_fieldFn = extern(C) gboolean function(const(GstStructure)* structure, const(GstIdStr)* fieldname) nothrow;
__gshared c_gst_structure_id_str_has_fieldFn c_gst_structure_id_str_has_field; ///
private alias c_gst_structure_id_str_has_field_typedFn = extern(C) gboolean function(const(GstStructure)* structure, const(GstIdStr)* fieldname, GType type) nothrow;
__gshared c_gst_structure_id_str_has_field_typedFn c_gst_structure_id_str_has_field_typed; ///
private alias c_gst_structure_id_str_nth_field_nameFn = extern(C) const(GstIdStr)* function(const(GstStructure)* structure, uint index) nothrow;
__gshared c_gst_structure_id_str_nth_field_nameFn c_gst_structure_id_str_nth_field_name; ///
private alias c_gst_structure_id_str_remove_fieldFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname) nothrow;
__gshared c_gst_structure_id_str_remove_fieldFn c_gst_structure_id_str_remove_field; ///
private alias c_gst_structure_id_str_remove_fieldsFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname,  ...) nothrow;
__gshared c_gst_structure_id_str_remove_fieldsFn c_gst_structure_id_str_remove_fields; ///
private alias c_gst_structure_id_str_remove_fields_valistFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname, void* varargs) nothrow;
__gshared c_gst_structure_id_str_remove_fields_valistFn c_gst_structure_id_str_remove_fields_valist; ///
private alias c_gst_structure_id_str_setFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname,  ...) nothrow;
__gshared c_gst_structure_id_str_setFn c_gst_structure_id_str_set; ///
private alias c_gst_structure_id_str_set_valistFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname, void* varargs) nothrow;
__gshared c_gst_structure_id_str_set_valistFn c_gst_structure_id_str_set_valist; ///
private alias c_gst_structure_id_str_set_valueFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname, const(GValue)* value) nothrow;
__gshared c_gst_structure_id_str_set_valueFn c_gst_structure_id_str_set_value; ///
private alias c_gst_structure_id_str_take_valueFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* fieldname, GValue* value) nothrow;
__gshared c_gst_structure_id_str_take_valueFn c_gst_structure_id_str_take_value; ///
private alias c_gst_structure_id_take_valueFn = extern(C) void function(GstStructure* structure, GQuark field, GValue* value) nothrow;
__gshared c_gst_structure_id_take_valueFn c_gst_structure_id_take_value; ///
private alias c_gst_structure_intersectFn = extern(C) GstStructure* function(const(GstStructure)* struct1, const(GstStructure)* struct2) nothrow;
__gshared c_gst_structure_intersectFn c_gst_structure_intersect; ///
private alias c_gst_structure_is_equalFn = extern(C) gboolean function(const(GstStructure)* structure1, const(GstStructure)* structure2) nothrow;
__gshared c_gst_structure_is_equalFn c_gst_structure_is_equal; ///
private alias c_gst_structure_is_subsetFn = extern(C) gboolean function(const(GstStructure)* subset, const(GstStructure)* superset) nothrow;
__gshared c_gst_structure_is_subsetFn c_gst_structure_is_subset; ///
private alias c_gst_structure_is_writableFn = extern(C) gboolean function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_is_writableFn c_gst_structure_is_writable; ///
private alias c_gst_structure_map_in_placeFn = extern(C) gboolean function(GstStructure* structure, GstStructureMapFunc func, void* userData) nothrow;
__gshared c_gst_structure_map_in_placeFn c_gst_structure_map_in_place; ///
private alias c_gst_structure_map_in_place_id_strFn = extern(C) gboolean function(GstStructure* structure, GstStructureMapIdStrFunc func, void* userData) nothrow;
__gshared c_gst_structure_map_in_place_id_strFn c_gst_structure_map_in_place_id_str; ///
private alias c_gst_structure_n_fieldsFn = extern(C) int function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_n_fieldsFn c_gst_structure_n_fields; ///
private alias c_gst_structure_nth_field_nameFn = extern(C) const(char)* function(const(GstStructure)* structure, uint index) nothrow;
__gshared c_gst_structure_nth_field_nameFn c_gst_structure_nth_field_name; ///
private alias c_gst_structure_remove_all_fieldsFn = extern(C) void function(GstStructure* structure) nothrow;
__gshared c_gst_structure_remove_all_fieldsFn c_gst_structure_remove_all_fields; ///
private alias c_gst_structure_remove_fieldFn = extern(C) void function(GstStructure* structure, const(char)* fieldname) nothrow;
__gshared c_gst_structure_remove_fieldFn c_gst_structure_remove_field; ///
private alias c_gst_structure_remove_fieldsFn = extern(C) void function(GstStructure* structure, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_structure_remove_fieldsFn c_gst_structure_remove_fields; ///
private alias c_gst_structure_remove_fields_valistFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, void* varargs) nothrow;
__gshared c_gst_structure_remove_fields_valistFn c_gst_structure_remove_fields_valist; ///
private alias c_gst_structure_serializeFn = extern(C) char* function(const(GstStructure)* structure, GstSerializeFlags flags) nothrow;
__gshared c_gst_structure_serializeFn c_gst_structure_serialize; ///
private alias c_gst_structure_serialize_fullFn = extern(C) char* function(const(GstStructure)* structure, GstSerializeFlags flags) nothrow;
__gshared c_gst_structure_serialize_fullFn c_gst_structure_serialize_full; ///
private alias c_gst_structure_setFn = extern(C) void function(GstStructure* structure, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_structure_setFn c_gst_structure_set; ///
private alias c_gst_structure_set_arrayFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, const(GValueArray)* array) nothrow;
__gshared c_gst_structure_set_arrayFn c_gst_structure_set_array; ///
private alias c_gst_structure_set_listFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, const(GValueArray)* array) nothrow;
__gshared c_gst_structure_set_listFn c_gst_structure_set_list; ///
private alias c_gst_structure_set_nameFn = extern(C) void function(GstStructure* structure, const(char)* name) nothrow;
__gshared c_gst_structure_set_nameFn c_gst_structure_set_name; ///
private alias c_gst_structure_set_name_id_strFn = extern(C) void function(GstStructure* structure, const(GstIdStr)* name) nothrow;
__gshared c_gst_structure_set_name_id_strFn c_gst_structure_set_name_id_str; ///
private alias c_gst_structure_set_name_static_strFn = extern(C) void function(GstStructure* structure, const(char)* name) nothrow;
__gshared c_gst_structure_set_name_static_strFn c_gst_structure_set_name_static_str; ///
private alias c_gst_structure_set_parent_refcountFn = extern(C) gboolean function(GstStructure* structure, int* refcount) nothrow;
__gshared c_gst_structure_set_parent_refcountFn c_gst_structure_set_parent_refcount; ///
private alias c_gst_structure_set_static_strFn = extern(C) void function(GstStructure* structure, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_structure_set_static_strFn c_gst_structure_set_static_str; ///
private alias c_gst_structure_set_static_str_valistFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, void* varargs) nothrow;
__gshared c_gst_structure_set_static_str_valistFn c_gst_structure_set_static_str_valist; ///
private alias c_gst_structure_set_valistFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, void* varargs) nothrow;
__gshared c_gst_structure_set_valistFn c_gst_structure_set_valist; ///
private alias c_gst_structure_set_valueFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, const(GValue)* value) nothrow;
__gshared c_gst_structure_set_valueFn c_gst_structure_set_value; ///
private alias c_gst_structure_set_value_static_strFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, const(GValue)* value) nothrow;
__gshared c_gst_structure_set_value_static_strFn c_gst_structure_set_value_static_str; ///
private alias c_gst_structure_take_valueFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, GValue* value) nothrow;
__gshared c_gst_structure_take_valueFn c_gst_structure_take_value; ///
private alias c_gst_structure_take_value_static_strFn = extern(C) void function(GstStructure* structure, const(char)* fieldname, GValue* value) nothrow;
__gshared c_gst_structure_take_value_static_strFn c_gst_structure_take_value_static_str; ///
private alias c_gst_structure_to_stringFn = extern(C) char* function(const(GstStructure)* structure) nothrow;
__gshared c_gst_structure_to_stringFn c_gst_structure_to_string; ///
private alias c_gst_structure_takeFn = extern(C) gboolean function(GstStructure** oldstrPtr, GstStructure* newstr) nothrow;
__gshared c_gst_structure_takeFn c_gst_structure_take; ///

// SystemClock
private alias c_gst_system_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_system_clock_get_typeFn c_gst_system_clock_get_type; ///
private alias c_gst_system_clock_obtainFn = extern(C) GstClock* function() nothrow;
__gshared c_gst_system_clock_obtainFn c_gst_system_clock_obtain; ///
private alias c_gst_system_clock_set_defaultFn = extern(C) void function(GstClock* newClock) nothrow;
__gshared c_gst_system_clock_set_defaultFn c_gst_system_clock_set_default; ///

// TagList
private alias c_gst_tag_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tag_list_get_typeFn c_gst_tag_list_get_type; ///
private alias c_gst_tag_list_newFn = extern(C) GstTagList* function(const(char)* tag,  ...) nothrow;
__gshared c_gst_tag_list_newFn c_gst_tag_list_new; ///
private alias c_gst_tag_list_new_emptyFn = extern(C) GstTagList* function() nothrow;
__gshared c_gst_tag_list_new_emptyFn c_gst_tag_list_new_empty; ///
private alias c_gst_tag_list_new_from_stringFn = extern(C) GstTagList* function(const(char)* str) nothrow;
__gshared c_gst_tag_list_new_from_stringFn c_gst_tag_list_new_from_string; ///
private alias c_gst_tag_list_new_valistFn = extern(C) GstTagList* function(void* varArgs) nothrow;
__gshared c_gst_tag_list_new_valistFn c_gst_tag_list_new_valist; ///
private alias c_gst_tag_list_addFn = extern(C) void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag,  ...) nothrow;
__gshared c_gst_tag_list_addFn c_gst_tag_list_add; ///
private alias c_gst_tag_list_add_valistFn = extern(C) void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, void* varArgs) nothrow;
__gshared c_gst_tag_list_add_valistFn c_gst_tag_list_add_valist; ///
private alias c_gst_tag_list_add_valist_valuesFn = extern(C) void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, void* varArgs) nothrow;
__gshared c_gst_tag_list_add_valist_valuesFn c_gst_tag_list_add_valist_values; ///
private alias c_gst_tag_list_add_valueFn = extern(C) void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, const(GValue)* value) nothrow;
__gshared c_gst_tag_list_add_valueFn c_gst_tag_list_add_value; ///
private alias c_gst_tag_list_add_valuesFn = extern(C) void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag,  ...) nothrow;
__gshared c_gst_tag_list_add_valuesFn c_gst_tag_list_add_values; ///
private alias c_gst_tag_list_copyFn = extern(C) GstTagList* function(const(GstTagList)* taglist) nothrow;
__gshared c_gst_tag_list_copyFn c_gst_tag_list_copy; ///
private alias c_gst_tag_list_foreachFn = extern(C) void function(const(GstTagList)* list, GstTagForeachFunc func, void* userData) nothrow;
__gshared c_gst_tag_list_foreachFn c_gst_tag_list_foreach; ///
private alias c_gst_tag_list_get_booleanFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, gboolean* value) nothrow;
__gshared c_gst_tag_list_get_booleanFn c_gst_tag_list_get_boolean; ///
private alias c_gst_tag_list_get_boolean_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, gboolean* value) nothrow;
__gshared c_gst_tag_list_get_boolean_indexFn c_gst_tag_list_get_boolean_index; ///
private alias c_gst_tag_list_get_dateFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, GDate** value) nothrow;
__gshared c_gst_tag_list_get_dateFn c_gst_tag_list_get_date; ///
private alias c_gst_tag_list_get_date_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GDate** value) nothrow;
__gshared c_gst_tag_list_get_date_indexFn c_gst_tag_list_get_date_index; ///
private alias c_gst_tag_list_get_date_timeFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, GstDateTime** value) nothrow;
__gshared c_gst_tag_list_get_date_timeFn c_gst_tag_list_get_date_time; ///
private alias c_gst_tag_list_get_date_time_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GstDateTime** value) nothrow;
__gshared c_gst_tag_list_get_date_time_indexFn c_gst_tag_list_get_date_time_index; ///
private alias c_gst_tag_list_get_doubleFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, double* value) nothrow;
__gshared c_gst_tag_list_get_doubleFn c_gst_tag_list_get_double; ///
private alias c_gst_tag_list_get_double_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, double* value) nothrow;
__gshared c_gst_tag_list_get_double_indexFn c_gst_tag_list_get_double_index; ///
private alias c_gst_tag_list_get_floatFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, float* value) nothrow;
__gshared c_gst_tag_list_get_floatFn c_gst_tag_list_get_float; ///
private alias c_gst_tag_list_get_float_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, float* value) nothrow;
__gshared c_gst_tag_list_get_float_indexFn c_gst_tag_list_get_float_index; ///
private alias c_gst_tag_list_get_intFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, int* value) nothrow;
__gshared c_gst_tag_list_get_intFn c_gst_tag_list_get_int; ///
private alias c_gst_tag_list_get_int64Fn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, long* value) nothrow;
__gshared c_gst_tag_list_get_int64Fn c_gst_tag_list_get_int64; ///
private alias c_gst_tag_list_get_int64_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, long* value) nothrow;
__gshared c_gst_tag_list_get_int64_indexFn c_gst_tag_list_get_int64_index; ///
private alias c_gst_tag_list_get_int_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, int* value) nothrow;
__gshared c_gst_tag_list_get_int_indexFn c_gst_tag_list_get_int_index; ///
private alias c_gst_tag_list_get_pointerFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, void** value) nothrow;
__gshared c_gst_tag_list_get_pointerFn c_gst_tag_list_get_pointer; ///
private alias c_gst_tag_list_get_pointer_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, void** value) nothrow;
__gshared c_gst_tag_list_get_pointer_indexFn c_gst_tag_list_get_pointer_index; ///
private alias c_gst_tag_list_get_sampleFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, GstSample** sample) nothrow;
__gshared c_gst_tag_list_get_sampleFn c_gst_tag_list_get_sample; ///
private alias c_gst_tag_list_get_sample_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GstSample** sample) nothrow;
__gshared c_gst_tag_list_get_sample_indexFn c_gst_tag_list_get_sample_index; ///
private alias c_gst_tag_list_get_scopeFn = extern(C) GstTagScope function(const(GstTagList)* list) nothrow;
__gshared c_gst_tag_list_get_scopeFn c_gst_tag_list_get_scope; ///
private alias c_gst_tag_list_get_stringFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, char** value) nothrow;
__gshared c_gst_tag_list_get_stringFn c_gst_tag_list_get_string; ///
private alias c_gst_tag_list_get_string_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, char** value) nothrow;
__gshared c_gst_tag_list_get_string_indexFn c_gst_tag_list_get_string_index; ///
private alias c_gst_tag_list_get_tag_sizeFn = extern(C) uint function(const(GstTagList)* list, const(char)* tag) nothrow;
__gshared c_gst_tag_list_get_tag_sizeFn c_gst_tag_list_get_tag_size; ///
private alias c_gst_tag_list_get_uintFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint* value) nothrow;
__gshared c_gst_tag_list_get_uintFn c_gst_tag_list_get_uint; ///
private alias c_gst_tag_list_get_uint64Fn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, ulong* value) nothrow;
__gshared c_gst_tag_list_get_uint64Fn c_gst_tag_list_get_uint64; ///
private alias c_gst_tag_list_get_uint64_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, ulong* value) nothrow;
__gshared c_gst_tag_list_get_uint64_indexFn c_gst_tag_list_get_uint64_index; ///
private alias c_gst_tag_list_get_uint_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, uint* value) nothrow;
__gshared c_gst_tag_list_get_uint_indexFn c_gst_tag_list_get_uint_index; ///
private alias c_gst_tag_list_get_value_indexFn = extern(C) const(GValue)* function(const(GstTagList)* list, const(char)* tag, uint index) nothrow;
__gshared c_gst_tag_list_get_value_indexFn c_gst_tag_list_get_value_index; ///
private alias c_gst_tag_list_insertFn = extern(C) void function(GstTagList* into, const(GstTagList)* from, GstTagMergeMode mode) nothrow;
__gshared c_gst_tag_list_insertFn c_gst_tag_list_insert; ///
private alias c_gst_tag_list_is_emptyFn = extern(C) gboolean function(const(GstTagList)* list) nothrow;
__gshared c_gst_tag_list_is_emptyFn c_gst_tag_list_is_empty; ///
private alias c_gst_tag_list_is_equalFn = extern(C) gboolean function(const(GstTagList)* list1, const(GstTagList)* list2) nothrow;
__gshared c_gst_tag_list_is_equalFn c_gst_tag_list_is_equal; ///
private alias c_gst_tag_list_is_writableFn = extern(C) gboolean function(const(GstTagList)* taglist) nothrow;
__gshared c_gst_tag_list_is_writableFn c_gst_tag_list_is_writable; ///
private alias c_gst_tag_list_make_writableFn = extern(C) GstTagList* function(GstTagList* taglist) nothrow;
__gshared c_gst_tag_list_make_writableFn c_gst_tag_list_make_writable; ///
private alias c_gst_tag_list_mergeFn = extern(C) GstTagList* function(const(GstTagList)* list1, const(GstTagList)* list2, GstTagMergeMode mode) nothrow;
__gshared c_gst_tag_list_mergeFn c_gst_tag_list_merge; ///
private alias c_gst_tag_list_n_tagsFn = extern(C) int function(const(GstTagList)* list) nothrow;
__gshared c_gst_tag_list_n_tagsFn c_gst_tag_list_n_tags; ///
private alias c_gst_tag_list_nth_tag_nameFn = extern(C) const(char)* function(const(GstTagList)* list, uint index) nothrow;
__gshared c_gst_tag_list_nth_tag_nameFn c_gst_tag_list_nth_tag_name; ///
private alias c_gst_tag_list_peek_string_indexFn = extern(C) gboolean function(const(GstTagList)* list, const(char)* tag, uint index, const(char*)* value) nothrow;
__gshared c_gst_tag_list_peek_string_indexFn c_gst_tag_list_peek_string_index; ///
private alias c_gst_tag_list_refFn = extern(C) GstTagList* function(GstTagList* taglist) nothrow;
__gshared c_gst_tag_list_refFn c_gst_tag_list_ref; ///
private alias c_gst_tag_list_remove_tagFn = extern(C) void function(GstTagList* list, const(char)* tag) nothrow;
__gshared c_gst_tag_list_remove_tagFn c_gst_tag_list_remove_tag; ///
private alias c_gst_tag_list_set_scopeFn = extern(C) void function(GstTagList* list, GstTagScope scope_) nothrow;
__gshared c_gst_tag_list_set_scopeFn c_gst_tag_list_set_scope; ///
private alias c_gst_tag_list_to_stringFn = extern(C) char* function(const(GstTagList)* list) nothrow;
__gshared c_gst_tag_list_to_stringFn c_gst_tag_list_to_string; ///
private alias c_gst_tag_list_unrefFn = extern(C) void function(GstTagList* taglist) nothrow;
__gshared c_gst_tag_list_unrefFn c_gst_tag_list_unref; ///
private alias c_gst_tag_list_copy_valueFn = extern(C) gboolean function(GValue* dest, const(GstTagList)* list, const(char)* tag) nothrow;
__gshared c_gst_tag_list_copy_valueFn c_gst_tag_list_copy_value; ///
private alias c_gst_tag_list_replaceFn = extern(C) gboolean function(GstTagList** oldTaglist, GstTagList* newTaglist) nothrow;
__gshared c_gst_tag_list_replaceFn c_gst_tag_list_replace; ///
private alias c_gst_tag_list_takeFn = extern(C) gboolean function(GstTagList** oldTaglist, GstTagList* newTaglist) nothrow;
__gshared c_gst_tag_list_takeFn c_gst_tag_list_take; ///

// TagSetter
private alias c_gst_tag_setter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tag_setter_get_typeFn c_gst_tag_setter_get_type; ///
private alias c_gst_tag_setter_add_tag_valistFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, void* varArgs) nothrow;
__gshared c_gst_tag_setter_add_tag_valistFn c_gst_tag_setter_add_tag_valist; ///
private alias c_gst_tag_setter_add_tag_valist_valuesFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, void* varArgs) nothrow;
__gshared c_gst_tag_setter_add_tag_valist_valuesFn c_gst_tag_setter_add_tag_valist_values; ///
private alias c_gst_tag_setter_add_tag_valueFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, const(GValue)* value) nothrow;
__gshared c_gst_tag_setter_add_tag_valueFn c_gst_tag_setter_add_tag_value; ///
private alias c_gst_tag_setter_add_tag_valuesFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag,  ...) nothrow;
__gshared c_gst_tag_setter_add_tag_valuesFn c_gst_tag_setter_add_tag_values; ///
private alias c_gst_tag_setter_add_tagsFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag,  ...) nothrow;
__gshared c_gst_tag_setter_add_tagsFn c_gst_tag_setter_add_tags; ///
private alias c_gst_tag_setter_get_tag_listFn = extern(C) const(GstTagList)* function(GstTagSetter* setter) nothrow;
__gshared c_gst_tag_setter_get_tag_listFn c_gst_tag_setter_get_tag_list; ///
private alias c_gst_tag_setter_get_tag_merge_modeFn = extern(C) GstTagMergeMode function(GstTagSetter* setter) nothrow;
__gshared c_gst_tag_setter_get_tag_merge_modeFn c_gst_tag_setter_get_tag_merge_mode; ///
private alias c_gst_tag_setter_merge_tagsFn = extern(C) void function(GstTagSetter* setter, const(GstTagList)* list, GstTagMergeMode mode) nothrow;
__gshared c_gst_tag_setter_merge_tagsFn c_gst_tag_setter_merge_tags; ///
private alias c_gst_tag_setter_reset_tagsFn = extern(C) void function(GstTagSetter* setter) nothrow;
__gshared c_gst_tag_setter_reset_tagsFn c_gst_tag_setter_reset_tags; ///
private alias c_gst_tag_setter_set_tag_merge_modeFn = extern(C) void function(GstTagSetter* setter, GstTagMergeMode mode) nothrow;
__gshared c_gst_tag_setter_set_tag_merge_modeFn c_gst_tag_setter_set_tag_merge_mode; ///

// Task
private alias c_gst_task_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_task_get_typeFn c_gst_task_get_type; ///
private alias c_gst_task_newFn = extern(C) GstTask* function(GstTaskFunction func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_task_newFn c_gst_task_new; ///
private alias c_gst_task_cleanup_allFn = extern(C) void function() nothrow;
__gshared c_gst_task_cleanup_allFn c_gst_task_cleanup_all; ///
private alias c_gst_task_get_poolFn = extern(C) GstTaskPool* function(GstTask* task) nothrow;
__gshared c_gst_task_get_poolFn c_gst_task_get_pool; ///
private alias c_gst_task_get_stateFn = extern(C) GstTaskState function(GstTask* task) nothrow;
__gshared c_gst_task_get_stateFn c_gst_task_get_state; ///
private alias c_gst_task_joinFn = extern(C) gboolean function(GstTask* task) nothrow;
__gshared c_gst_task_joinFn c_gst_task_join; ///
private alias c_gst_task_pauseFn = extern(C) gboolean function(GstTask* task) nothrow;
__gshared c_gst_task_pauseFn c_gst_task_pause; ///
private alias c_gst_task_resumeFn = extern(C) gboolean function(GstTask* task) nothrow;
__gshared c_gst_task_resumeFn c_gst_task_resume; ///
private alias c_gst_task_set_enter_callbackFn = extern(C) void function(GstTask* task, GstTaskThreadFunc enterFunc, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_task_set_enter_callbackFn c_gst_task_set_enter_callback; ///
private alias c_gst_task_set_leave_callbackFn = extern(C) void function(GstTask* task, GstTaskThreadFunc leaveFunc, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_task_set_leave_callbackFn c_gst_task_set_leave_callback; ///
private alias c_gst_task_set_lockFn = extern(C) void function(GstTask* task, GRecMutex* mutex) nothrow;
__gshared c_gst_task_set_lockFn c_gst_task_set_lock; ///
private alias c_gst_task_set_poolFn = extern(C) void function(GstTask* task, GstTaskPool* pool) nothrow;
__gshared c_gst_task_set_poolFn c_gst_task_set_pool; ///
private alias c_gst_task_set_stateFn = extern(C) gboolean function(GstTask* task, GstTaskState state) nothrow;
__gshared c_gst_task_set_stateFn c_gst_task_set_state; ///
private alias c_gst_task_startFn = extern(C) gboolean function(GstTask* task) nothrow;
__gshared c_gst_task_startFn c_gst_task_start; ///
private alias c_gst_task_stopFn = extern(C) gboolean function(GstTask* task) nothrow;
__gshared c_gst_task_stopFn c_gst_task_stop; ///

// TaskPool
private alias c_gst_task_pool_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_task_pool_get_typeFn c_gst_task_pool_get_type; ///
private alias c_gst_task_pool_newFn = extern(C) GstTaskPool* function() nothrow;
__gshared c_gst_task_pool_newFn c_gst_task_pool_new; ///
private alias c_gst_task_pool_cleanupFn = extern(C) void function(GstTaskPool* pool) nothrow;
__gshared c_gst_task_pool_cleanupFn c_gst_task_pool_cleanup; ///
private alias c_gst_task_pool_dispose_handleFn = extern(C) void function(GstTaskPool* pool, void* id) nothrow;
__gshared c_gst_task_pool_dispose_handleFn c_gst_task_pool_dispose_handle; ///
private alias c_gst_task_pool_joinFn = extern(C) void function(GstTaskPool* pool, void* id) nothrow;
__gshared c_gst_task_pool_joinFn c_gst_task_pool_join; ///
private alias c_gst_task_pool_prepareFn = extern(C) void function(GstTaskPool* pool, GError** _err) nothrow;
__gshared c_gst_task_pool_prepareFn c_gst_task_pool_prepare; ///
private alias c_gst_task_pool_pushFn = extern(C) void* function(GstTaskPool* pool, GstTaskPoolFunction func, void* userData, GError** _err) nothrow;
__gshared c_gst_task_pool_pushFn c_gst_task_pool_push; ///

// Toc
private alias c_gst_toc_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_toc_get_typeFn c_gst_toc_get_type; ///
private alias c_gst_toc_newFn = extern(C) GstToc* function(GstTocScope scope_) nothrow;
__gshared c_gst_toc_newFn c_gst_toc_new; ///
private alias c_gst_toc_append_entryFn = extern(C) void function(GstToc* toc, GstTocEntry* entry) nothrow;
__gshared c_gst_toc_append_entryFn c_gst_toc_append_entry; ///
private alias c_gst_toc_dumpFn = extern(C) void function(GstToc* toc) nothrow;
__gshared c_gst_toc_dumpFn c_gst_toc_dump; ///
private alias c_gst_toc_find_entryFn = extern(C) GstTocEntry* function(const(GstToc)* toc, const(char)* uid) nothrow;
__gshared c_gst_toc_find_entryFn c_gst_toc_find_entry; ///
private alias c_gst_toc_get_entriesFn = extern(C) GList* function(const(GstToc)* toc) nothrow;
__gshared c_gst_toc_get_entriesFn c_gst_toc_get_entries; ///
private alias c_gst_toc_get_scopeFn = extern(C) GstTocScope function(const(GstToc)* toc) nothrow;
__gshared c_gst_toc_get_scopeFn c_gst_toc_get_scope; ///
private alias c_gst_toc_get_tagsFn = extern(C) GstTagList* function(const(GstToc)* toc) nothrow;
__gshared c_gst_toc_get_tagsFn c_gst_toc_get_tags; ///
private alias c_gst_toc_merge_tagsFn = extern(C) void function(GstToc* toc, GstTagList* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_toc_merge_tagsFn c_gst_toc_merge_tags; ///
private alias c_gst_toc_set_tagsFn = extern(C) void function(GstToc* toc, GstTagList* tags) nothrow;
__gshared c_gst_toc_set_tagsFn c_gst_toc_set_tags; ///

// TocEntry
private alias c_gst_toc_entry_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_toc_entry_get_typeFn c_gst_toc_entry_get_type; ///
private alias c_gst_toc_entry_newFn = extern(C) GstTocEntry* function(GstTocEntryType type, const(char)* uid) nothrow;
__gshared c_gst_toc_entry_newFn c_gst_toc_entry_new; ///
private alias c_gst_toc_entry_append_sub_entryFn = extern(C) void function(GstTocEntry* entry, GstTocEntry* subentry) nothrow;
__gshared c_gst_toc_entry_append_sub_entryFn c_gst_toc_entry_append_sub_entry; ///
private alias c_gst_toc_entry_get_entry_typeFn = extern(C) GstTocEntryType function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_get_entry_typeFn c_gst_toc_entry_get_entry_type; ///
private alias c_gst_toc_entry_get_loopFn = extern(C) gboolean function(const(GstTocEntry)* entry, GstTocLoopType* loopType, int* repeatCount) nothrow;
__gshared c_gst_toc_entry_get_loopFn c_gst_toc_entry_get_loop; ///
private alias c_gst_toc_entry_get_parentFn = extern(C) GstTocEntry* function(GstTocEntry* entry) nothrow;
__gshared c_gst_toc_entry_get_parentFn c_gst_toc_entry_get_parent; ///
private alias c_gst_toc_entry_get_start_stop_timesFn = extern(C) gboolean function(const(GstTocEntry)* entry, long* start, long* stop) nothrow;
__gshared c_gst_toc_entry_get_start_stop_timesFn c_gst_toc_entry_get_start_stop_times; ///
private alias c_gst_toc_entry_get_sub_entriesFn = extern(C) GList* function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_get_sub_entriesFn c_gst_toc_entry_get_sub_entries; ///
private alias c_gst_toc_entry_get_tagsFn = extern(C) GstTagList* function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_get_tagsFn c_gst_toc_entry_get_tags; ///
private alias c_gst_toc_entry_get_tocFn = extern(C) GstToc* function(GstTocEntry* entry) nothrow;
__gshared c_gst_toc_entry_get_tocFn c_gst_toc_entry_get_toc; ///
private alias c_gst_toc_entry_get_uidFn = extern(C) const(char)* function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_get_uidFn c_gst_toc_entry_get_uid; ///
private alias c_gst_toc_entry_is_alternativeFn = extern(C) gboolean function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_is_alternativeFn c_gst_toc_entry_is_alternative; ///
private alias c_gst_toc_entry_is_sequenceFn = extern(C) gboolean function(const(GstTocEntry)* entry) nothrow;
__gshared c_gst_toc_entry_is_sequenceFn c_gst_toc_entry_is_sequence; ///
private alias c_gst_toc_entry_merge_tagsFn = extern(C) void function(GstTocEntry* entry, GstTagList* tags, GstTagMergeMode mode) nothrow;
__gshared c_gst_toc_entry_merge_tagsFn c_gst_toc_entry_merge_tags; ///
private alias c_gst_toc_entry_set_loopFn = extern(C) void function(GstTocEntry* entry, GstTocLoopType loopType, int repeatCount) nothrow;
__gshared c_gst_toc_entry_set_loopFn c_gst_toc_entry_set_loop; ///
private alias c_gst_toc_entry_set_start_stop_timesFn = extern(C) void function(GstTocEntry* entry, long start, long stop) nothrow;
__gshared c_gst_toc_entry_set_start_stop_timesFn c_gst_toc_entry_set_start_stop_times; ///
private alias c_gst_toc_entry_set_tagsFn = extern(C) void function(GstTocEntry* entry, GstTagList* tags) nothrow;
__gshared c_gst_toc_entry_set_tagsFn c_gst_toc_entry_set_tags; ///

// TocSetter
private alias c_gst_toc_setter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_toc_setter_get_typeFn c_gst_toc_setter_get_type; ///
private alias c_gst_toc_setter_get_tocFn = extern(C) GstToc* function(GstTocSetter* setter) nothrow;
__gshared c_gst_toc_setter_get_tocFn c_gst_toc_setter_get_toc; ///
private alias c_gst_toc_setter_resetFn = extern(C) void function(GstTocSetter* setter) nothrow;
__gshared c_gst_toc_setter_resetFn c_gst_toc_setter_reset; ///
private alias c_gst_toc_setter_set_tocFn = extern(C) void function(GstTocSetter* setter, GstToc* toc) nothrow;
__gshared c_gst_toc_setter_set_tocFn c_gst_toc_setter_set_toc; ///

// Tracer
private alias c_gst_tracer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tracer_get_typeFn c_gst_tracer_get_type; ///
private alias c_gst_tracer_registerFn = extern(C) gboolean function(GstPlugin* plugin, const(char)* name, GType type) nothrow;
__gshared c_gst_tracer_registerFn c_gst_tracer_register; ///

// TracerClass
private alias c_gst_tracer_class_set_use_structure_paramsFn = extern(C) void function(GstTracerClass* tracerClass, gboolean useStructureParams) nothrow;
__gshared c_gst_tracer_class_set_use_structure_paramsFn c_gst_tracer_class_set_use_structure_params; ///
private alias c_gst_tracer_class_uses_structure_paramsFn = extern(C) gboolean function(GstTracerClass* tracerClass) nothrow;
__gshared c_gst_tracer_class_uses_structure_paramsFn c_gst_tracer_class_uses_structure_params; ///

// TracerFactory
private alias c_gst_tracer_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tracer_factory_get_typeFn c_gst_tracer_factory_get_type; ///
private alias c_gst_tracer_factory_get_listFn = extern(C) GList* function() nothrow;
__gshared c_gst_tracer_factory_get_listFn c_gst_tracer_factory_get_list; ///
private alias c_gst_tracer_factory_get_tracer_typeFn = extern(C) GType function(GstTracerFactory* factory) nothrow;
__gshared c_gst_tracer_factory_get_tracer_typeFn c_gst_tracer_factory_get_tracer_type; ///

// TracerRecord
private alias c_gst_tracer_record_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tracer_record_get_typeFn c_gst_tracer_record_get_type; ///
private alias c_gst_tracer_record_newFn = extern(C) GstTracerRecord* function(const(char)* name, const(char)* firstfield,  ...) nothrow;
__gshared c_gst_tracer_record_newFn c_gst_tracer_record_new; ///
private alias c_gst_tracer_record_logFn = extern(C) void function(GstTracerRecord* self,  ...) nothrow;
__gshared c_gst_tracer_record_logFn c_gst_tracer_record_log; ///

// TypeFind
private alias c_gst_type_find_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_type_find_get_typeFn c_gst_type_find_get_type; ///
private alias c_gst_type_find_get_lengthFn = extern(C) ulong function(GstTypeFind* find) nothrow;
__gshared c_gst_type_find_get_lengthFn c_gst_type_find_get_length; ///
private alias c_gst_type_find_peekFn = extern(C) const(ubyte)* function(GstTypeFind* find, long offset, uint size) nothrow;
__gshared c_gst_type_find_peekFn c_gst_type_find_peek; ///
private alias c_gst_type_find_suggestFn = extern(C) void function(GstTypeFind* find, uint probability, GstCaps* caps) nothrow;
__gshared c_gst_type_find_suggestFn c_gst_type_find_suggest; ///
private alias c_gst_type_find_suggest_empty_simpleFn = extern(C) void function(GstTypeFind* find, uint probability, const(char)* mediaType) nothrow;
__gshared c_gst_type_find_suggest_empty_simpleFn c_gst_type_find_suggest_empty_simple; ///
private alias c_gst_type_find_suggest_simpleFn = extern(C) void function(GstTypeFind* find, uint probability, const(char)* mediaType, const(char)* fieldname,  ...) nothrow;
__gshared c_gst_type_find_suggest_simpleFn c_gst_type_find_suggest_simple; ///
private alias c_gst_type_find_registerFn = extern(C) gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GstTypeFindFunction func, const(char)* extensions, GstCaps* possibleCaps, void* data, GDestroyNotify dataNotify) nothrow;
__gshared c_gst_type_find_registerFn c_gst_type_find_register; ///

// TypeFindFactory
private alias c_gst_type_find_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_type_find_factory_get_typeFn c_gst_type_find_factory_get_type; ///
private alias c_gst_type_find_factory_get_listFn = extern(C) GList* function() nothrow;
__gshared c_gst_type_find_factory_get_listFn c_gst_type_find_factory_get_list; ///
private alias c_gst_type_find_factory_call_functionFn = extern(C) void function(GstTypeFindFactory* factory, GstTypeFind* find) nothrow;
__gshared c_gst_type_find_factory_call_functionFn c_gst_type_find_factory_call_function; ///
private alias c_gst_type_find_factory_get_capsFn = extern(C) GstCaps* function(GstTypeFindFactory* factory) nothrow;
__gshared c_gst_type_find_factory_get_capsFn c_gst_type_find_factory_get_caps; ///
private alias c_gst_type_find_factory_get_extensionsFn = extern(C) const(char*)* function(GstTypeFindFactory* factory) nothrow;
__gshared c_gst_type_find_factory_get_extensionsFn c_gst_type_find_factory_get_extensions; ///
private alias c_gst_type_find_factory_has_functionFn = extern(C) gboolean function(GstTypeFindFactory* factory) nothrow;
__gshared c_gst_type_find_factory_has_functionFn c_gst_type_find_factory_has_function; ///

// URIHandler
private alias c_gst_uri_handler_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_uri_handler_get_typeFn c_gst_uri_handler_get_type; ///
private alias c_gst_uri_handler_get_protocolsFn = extern(C) const(char*)* function(GstURIHandler* handler) nothrow;
__gshared c_gst_uri_handler_get_protocolsFn c_gst_uri_handler_get_protocols; ///
private alias c_gst_uri_handler_get_uriFn = extern(C) char* function(GstURIHandler* handler) nothrow;
__gshared c_gst_uri_handler_get_uriFn c_gst_uri_handler_get_uri; ///
private alias c_gst_uri_handler_get_uri_typeFn = extern(C) GstURIType function(GstURIHandler* handler) nothrow;
__gshared c_gst_uri_handler_get_uri_typeFn c_gst_uri_handler_get_uri_type; ///
private alias c_gst_uri_handler_set_uriFn = extern(C) gboolean function(GstURIHandler* handler, const(char)* uri, GError** _err) nothrow;
__gshared c_gst_uri_handler_set_uriFn c_gst_uri_handler_set_uri; ///

// Uri
private alias c_gst_uri_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_uri_get_typeFn c_gst_uri_get_type; ///
private alias c_gst_uri_newFn = extern(C) GstUri* function(const(char)* scheme, const(char)* userinfo, const(char)* host, uint port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_gst_uri_newFn c_gst_uri_new; ///
private alias c_gst_uri_append_pathFn = extern(C) gboolean function(GstUri* uri, const(char)* relativePath) nothrow;
__gshared c_gst_uri_append_pathFn c_gst_uri_append_path; ///
private alias c_gst_uri_append_path_segmentFn = extern(C) gboolean function(GstUri* uri, const(char)* pathSegment) nothrow;
__gshared c_gst_uri_append_path_segmentFn c_gst_uri_append_path_segment; ///
private alias c_gst_uri_copyFn = extern(C) GstUri* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_copyFn c_gst_uri_copy; ///
private alias c_gst_uri_equalFn = extern(C) gboolean function(const(GstUri)* first, const(GstUri)* second) nothrow;
__gshared c_gst_uri_equalFn c_gst_uri_equal; ///
private alias c_gst_uri_from_string_with_baseFn = extern(C) GstUri* function(GstUri* base, const(char)* uri) nothrow;
__gshared c_gst_uri_from_string_with_baseFn c_gst_uri_from_string_with_base; ///
private alias c_gst_uri_get_fragmentFn = extern(C) const(char)* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_fragmentFn c_gst_uri_get_fragment; ///
private alias c_gst_uri_get_hostFn = extern(C) const(char)* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_hostFn c_gst_uri_get_host; ///
private alias c_gst_uri_get_media_fragment_tableFn = extern(C) GHashTable* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_media_fragment_tableFn c_gst_uri_get_media_fragment_table; ///
private alias c_gst_uri_get_pathFn = extern(C) char* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_pathFn c_gst_uri_get_path; ///
private alias c_gst_uri_get_path_segmentsFn = extern(C) GList* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_path_segmentsFn c_gst_uri_get_path_segments; ///
private alias c_gst_uri_get_path_stringFn = extern(C) char* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_path_stringFn c_gst_uri_get_path_string; ///
private alias c_gst_uri_get_portFn = extern(C) uint function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_portFn c_gst_uri_get_port; ///
private alias c_gst_uri_get_query_keysFn = extern(C) GList* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_query_keysFn c_gst_uri_get_query_keys; ///
private alias c_gst_uri_get_query_stringFn = extern(C) char* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_query_stringFn c_gst_uri_get_query_string; ///
private alias c_gst_uri_get_query_string_orderedFn = extern(C) char* function(const(GstUri)* uri, const(GList)* keys) nothrow;
__gshared c_gst_uri_get_query_string_orderedFn c_gst_uri_get_query_string_ordered; ///
private alias c_gst_uri_get_query_tableFn = extern(C) GHashTable* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_query_tableFn c_gst_uri_get_query_table; ///
private alias c_gst_uri_get_query_valueFn = extern(C) const(char)* function(const(GstUri)* uri, const(char)* queryKey) nothrow;
__gshared c_gst_uri_get_query_valueFn c_gst_uri_get_query_value; ///
private alias c_gst_uri_get_schemeFn = extern(C) const(char)* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_schemeFn c_gst_uri_get_scheme; ///
private alias c_gst_uri_get_userinfoFn = extern(C) const(char)* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_get_userinfoFn c_gst_uri_get_userinfo; ///
private alias c_gst_uri_is_normalizedFn = extern(C) gboolean function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_is_normalizedFn c_gst_uri_is_normalized; ///
private alias c_gst_uri_is_writableFn = extern(C) gboolean function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_is_writableFn c_gst_uri_is_writable; ///
private alias c_gst_uri_joinFn = extern(C) GstUri* function(GstUri* baseUri, GstUri* refUri) nothrow;
__gshared c_gst_uri_joinFn c_gst_uri_join; ///
private alias c_gst_uri_make_writableFn = extern(C) GstUri* function(GstUri* uri) nothrow;
__gshared c_gst_uri_make_writableFn c_gst_uri_make_writable; ///
private alias c_gst_uri_new_with_baseFn = extern(C) GstUri* function(GstUri* base, const(char)* scheme, const(char)* userinfo, const(char)* host, uint port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_gst_uri_new_with_baseFn c_gst_uri_new_with_base; ///
private alias c_gst_uri_normalizeFn = extern(C) gboolean function(GstUri* uri) nothrow;
__gshared c_gst_uri_normalizeFn c_gst_uri_normalize; ///
private alias c_gst_uri_query_has_keyFn = extern(C) gboolean function(const(GstUri)* uri, const(char)* queryKey) nothrow;
__gshared c_gst_uri_query_has_keyFn c_gst_uri_query_has_key; ///
private alias c_gst_uri_refFn = extern(C) GstUri* function(GstUri* uri) nothrow;
__gshared c_gst_uri_refFn c_gst_uri_ref; ///
private alias c_gst_uri_remove_query_keyFn = extern(C) gboolean function(GstUri* uri, const(char)* queryKey) nothrow;
__gshared c_gst_uri_remove_query_keyFn c_gst_uri_remove_query_key; ///
private alias c_gst_uri_set_fragmentFn = extern(C) gboolean function(GstUri* uri, const(char)* fragment) nothrow;
__gshared c_gst_uri_set_fragmentFn c_gst_uri_set_fragment; ///
private alias c_gst_uri_set_hostFn = extern(C) gboolean function(GstUri* uri, const(char)* host) nothrow;
__gshared c_gst_uri_set_hostFn c_gst_uri_set_host; ///
private alias c_gst_uri_set_pathFn = extern(C) gboolean function(GstUri* uri, const(char)* path) nothrow;
__gshared c_gst_uri_set_pathFn c_gst_uri_set_path; ///
private alias c_gst_uri_set_path_segmentsFn = extern(C) gboolean function(GstUri* uri, GList* pathSegments) nothrow;
__gshared c_gst_uri_set_path_segmentsFn c_gst_uri_set_path_segments; ///
private alias c_gst_uri_set_path_stringFn = extern(C) gboolean function(GstUri* uri, const(char)* path) nothrow;
__gshared c_gst_uri_set_path_stringFn c_gst_uri_set_path_string; ///
private alias c_gst_uri_set_portFn = extern(C) gboolean function(GstUri* uri, uint port) nothrow;
__gshared c_gst_uri_set_portFn c_gst_uri_set_port; ///
private alias c_gst_uri_set_query_stringFn = extern(C) gboolean function(GstUri* uri, const(char)* query) nothrow;
__gshared c_gst_uri_set_query_stringFn c_gst_uri_set_query_string; ///
private alias c_gst_uri_set_query_tableFn = extern(C) gboolean function(GstUri* uri, GHashTable* queryTable) nothrow;
__gshared c_gst_uri_set_query_tableFn c_gst_uri_set_query_table; ///
private alias c_gst_uri_set_query_valueFn = extern(C) gboolean function(GstUri* uri, const(char)* queryKey, const(char)* queryValue) nothrow;
__gshared c_gst_uri_set_query_valueFn c_gst_uri_set_query_value; ///
private alias c_gst_uri_set_schemeFn = extern(C) gboolean function(GstUri* uri, const(char)* scheme) nothrow;
__gshared c_gst_uri_set_schemeFn c_gst_uri_set_scheme; ///
private alias c_gst_uri_set_userinfoFn = extern(C) gboolean function(GstUri* uri, const(char)* userinfo) nothrow;
__gshared c_gst_uri_set_userinfoFn c_gst_uri_set_userinfo; ///
private alias c_gst_uri_to_stringFn = extern(C) char* function(const(GstUri)* uri) nothrow;
__gshared c_gst_uri_to_stringFn c_gst_uri_to_string; ///
private alias c_gst_uri_to_string_with_keysFn = extern(C) char* function(const(GstUri)* uri, const(GList)* keys) nothrow;
__gshared c_gst_uri_to_string_with_keysFn c_gst_uri_to_string_with_keys; ///
private alias c_gst_uri_unrefFn = extern(C) void function(GstUri* uri) nothrow;
__gshared c_gst_uri_unrefFn c_gst_uri_unref; ///
private alias c_gst_uri_constructFn = extern(C) char* function(const(char)* protocol, const(char)* location) nothrow;
__gshared c_gst_uri_constructFn c_gst_uri_construct; ///
private alias c_gst_uri_from_stringFn = extern(C) GstUri* function(const(char)* uri) nothrow;
__gshared c_gst_uri_from_stringFn c_gst_uri_from_string; ///
private alias c_gst_uri_from_string_escapedFn = extern(C) GstUri* function(const(char)* uri) nothrow;
__gshared c_gst_uri_from_string_escapedFn c_gst_uri_from_string_escaped; ///
private alias c_gst_uri_get_locationFn = extern(C) char* function(const(char)* uri) nothrow;
__gshared c_gst_uri_get_locationFn c_gst_uri_get_location; ///
private alias c_gst_uri_get_protocolFn = extern(C) char* function(const(char)* uri) nothrow;
__gshared c_gst_uri_get_protocolFn c_gst_uri_get_protocol; ///
private alias c_gst_uri_has_protocolFn = extern(C) gboolean function(const(char)* uri, const(char)* protocol) nothrow;
__gshared c_gst_uri_has_protocolFn c_gst_uri_has_protocol; ///
private alias c_gst_uri_is_validFn = extern(C) gboolean function(const(char)* uri) nothrow;
__gshared c_gst_uri_is_validFn c_gst_uri_is_valid; ///
private alias c_gst_uri_join_stringsFn = extern(C) char* function(const(char)* baseUri, const(char)* refUri) nothrow;
__gshared c_gst_uri_join_stringsFn c_gst_uri_join_strings; ///
private alias c_gst_uri_protocol_is_supportedFn = extern(C) gboolean function(GstURIType type, const(char)* protocol) nothrow;
__gshared c_gst_uri_protocol_is_supportedFn c_gst_uri_protocol_is_supported; ///
private alias c_gst_uri_protocol_is_validFn = extern(C) gboolean function(const(char)* protocol) nothrow;
__gshared c_gst_uri_protocol_is_validFn c_gst_uri_protocol_is_valid; ///

// ValueArray
private alias c_gst_value_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_value_array_get_typeFn c_gst_value_array_get_type; ///
private alias c_gst_value_array_append_and_take_valueFn = extern(C) void function(GValue* value, GValue* appendValue) nothrow;
__gshared c_gst_value_array_append_and_take_valueFn c_gst_value_array_append_and_take_value; ///
private alias c_gst_value_array_append_valueFn = extern(C) void function(GValue* value, const(GValue)* appendValue) nothrow;
__gshared c_gst_value_array_append_valueFn c_gst_value_array_append_value; ///
private alias c_gst_value_array_get_sizeFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_gst_value_array_get_sizeFn c_gst_value_array_get_size; ///
private alias c_gst_value_array_get_valueFn = extern(C) const(GValue)* function(const(GValue)* value, uint index) nothrow;
__gshared c_gst_value_array_get_valueFn c_gst_value_array_get_value; ///
private alias c_gst_value_array_initFn = extern(C) GValue* function(GValue* value, uint prealloc) nothrow;
__gshared c_gst_value_array_initFn c_gst_value_array_init; ///
private alias c_gst_value_array_prepend_valueFn = extern(C) void function(GValue* value, const(GValue)* prependValue) nothrow;
__gshared c_gst_value_array_prepend_valueFn c_gst_value_array_prepend_value; ///

// ValueList
private alias c_gst_value_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_value_list_get_typeFn c_gst_value_list_get_type; ///
private alias c_gst_value_list_append_and_take_valueFn = extern(C) void function(GValue* value, GValue* appendValue) nothrow;
__gshared c_gst_value_list_append_and_take_valueFn c_gst_value_list_append_and_take_value; ///
private alias c_gst_value_list_append_valueFn = extern(C) void function(GValue* value, const(GValue)* appendValue) nothrow;
__gshared c_gst_value_list_append_valueFn c_gst_value_list_append_value; ///
private alias c_gst_value_list_concatFn = extern(C) void function(GValue* dest, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_list_concatFn c_gst_value_list_concat; ///
private alias c_gst_value_list_get_sizeFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_gst_value_list_get_sizeFn c_gst_value_list_get_size; ///
private alias c_gst_value_list_get_valueFn = extern(C) const(GValue)* function(const(GValue)* value, uint index) nothrow;
__gshared c_gst_value_list_get_valueFn c_gst_value_list_get_value; ///
private alias c_gst_value_list_initFn = extern(C) GValue* function(GValue* value, uint prealloc) nothrow;
__gshared c_gst_value_list_initFn c_gst_value_list_init; ///
private alias c_gst_value_list_mergeFn = extern(C) void function(GValue* dest, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_list_mergeFn c_gst_value_list_merge; ///
private alias c_gst_value_list_prepend_valueFn = extern(C) void function(GValue* value, const(GValue)* prependValue) nothrow;
__gshared c_gst_value_list_prepend_valueFn c_gst_value_list_prepend_value; ///

// ValueUniqueList
private alias c_gst_value_unique_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_value_unique_list_get_typeFn c_gst_value_unique_list_get_type; ///
private alias c_gst_value_unique_list_append_and_take_valueFn = extern(C) void function(GValue* value, GValue* appendValue) nothrow;
__gshared c_gst_value_unique_list_append_and_take_valueFn c_gst_value_unique_list_append_and_take_value; ///
private alias c_gst_value_unique_list_append_valueFn = extern(C) void function(GValue* value, const(GValue)* appendValue) nothrow;
__gshared c_gst_value_unique_list_append_valueFn c_gst_value_unique_list_append_value; ///
private alias c_gst_value_unique_list_concatFn = extern(C) void function(GValue* dest, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_unique_list_concatFn c_gst_value_unique_list_concat; ///
private alias c_gst_value_unique_list_get_sizeFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_gst_value_unique_list_get_sizeFn c_gst_value_unique_list_get_size; ///
private alias c_gst_value_unique_list_get_valueFn = extern(C) const(GValue)* function(const(GValue)* value, uint index) nothrow;
__gshared c_gst_value_unique_list_get_valueFn c_gst_value_unique_list_get_value; ///
private alias c_gst_value_unique_list_prepend_valueFn = extern(C) void function(GValue* value, const(GValue)* prependValue) nothrow;
__gshared c_gst_value_unique_list_prepend_valueFn c_gst_value_unique_list_prepend_value; ///

// VecDeque
private alias c_gst_vec_deque_clearFn = extern(C) void function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_clearFn c_gst_vec_deque_clear; ///
private alias c_gst_vec_deque_drop_elementFn = extern(C) void* function(GstVecDeque* array, size_t idx) nothrow;
__gshared c_gst_vec_deque_drop_elementFn c_gst_vec_deque_drop_element; ///
private alias c_gst_vec_deque_drop_structFn = extern(C) gboolean function(GstVecDeque* array, size_t idx, void* pStruct) nothrow;
__gshared c_gst_vec_deque_drop_structFn c_gst_vec_deque_drop_struct; ///
private alias c_gst_vec_deque_findFn = extern(C) size_t function(GstVecDeque* array, GCompareFunc func, void* data) nothrow;
__gshared c_gst_vec_deque_findFn c_gst_vec_deque_find; ///
private alias c_gst_vec_deque_freeFn = extern(C) void function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_freeFn c_gst_vec_deque_free; ///
private alias c_gst_vec_deque_get_lengthFn = extern(C) size_t function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_get_lengthFn c_gst_vec_deque_get_length; ///
private alias c_gst_vec_deque_is_emptyFn = extern(C) gboolean function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_is_emptyFn c_gst_vec_deque_is_empty; ///
private alias c_gst_vec_deque_peek_headFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_peek_headFn c_gst_vec_deque_peek_head; ///
private alias c_gst_vec_deque_peek_head_structFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_peek_head_structFn c_gst_vec_deque_peek_head_struct; ///
private alias c_gst_vec_deque_peek_nthFn = extern(C) void* function(GstVecDeque* array, size_t idx) nothrow;
__gshared c_gst_vec_deque_peek_nthFn c_gst_vec_deque_peek_nth; ///
private alias c_gst_vec_deque_peek_nth_structFn = extern(C) void* function(GstVecDeque* array, size_t idx) nothrow;
__gshared c_gst_vec_deque_peek_nth_structFn c_gst_vec_deque_peek_nth_struct; ///
private alias c_gst_vec_deque_peek_tailFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_peek_tailFn c_gst_vec_deque_peek_tail; ///
private alias c_gst_vec_deque_peek_tail_structFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_peek_tail_structFn c_gst_vec_deque_peek_tail_struct; ///
private alias c_gst_vec_deque_pop_headFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_pop_headFn c_gst_vec_deque_pop_head; ///
private alias c_gst_vec_deque_pop_head_structFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_pop_head_structFn c_gst_vec_deque_pop_head_struct; ///
private alias c_gst_vec_deque_pop_tailFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_pop_tailFn c_gst_vec_deque_pop_tail; ///
private alias c_gst_vec_deque_pop_tail_structFn = extern(C) void* function(GstVecDeque* array) nothrow;
__gshared c_gst_vec_deque_pop_tail_structFn c_gst_vec_deque_pop_tail_struct; ///
private alias c_gst_vec_deque_push_sortedFn = extern(C) void function(GstVecDeque* array, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_gst_vec_deque_push_sortedFn c_gst_vec_deque_push_sorted; ///
private alias c_gst_vec_deque_push_sorted_structFn = extern(C) void function(GstVecDeque* array, void* pStruct, GCompareDataFunc func, void* userData) nothrow;
__gshared c_gst_vec_deque_push_sorted_structFn c_gst_vec_deque_push_sorted_struct; ///
private alias c_gst_vec_deque_push_tailFn = extern(C) void function(GstVecDeque* array, void* data) nothrow;
__gshared c_gst_vec_deque_push_tailFn c_gst_vec_deque_push_tail; ///
private alias c_gst_vec_deque_push_tail_structFn = extern(C) void function(GstVecDeque* array, void* pStruct) nothrow;
__gshared c_gst_vec_deque_push_tail_structFn c_gst_vec_deque_push_tail_struct; ///
private alias c_gst_vec_deque_set_clear_funcFn = extern(C) void function(GstVecDeque* array, GDestroyNotify clearFunc) nothrow;
__gshared c_gst_vec_deque_set_clear_funcFn c_gst_vec_deque_set_clear_func; ///
private alias c_gst_vec_deque_sortFn = extern(C) void function(GstVecDeque* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_gst_vec_deque_sortFn c_gst_vec_deque_sort; ///
private alias c_gst_vec_deque_newFn = extern(C) GstVecDeque* function(size_t initialSize) nothrow;
__gshared c_gst_vec_deque_newFn c_gst_vec_deque_new; ///
private alias c_gst_vec_deque_new_for_structFn = extern(C) GstVecDeque* function(size_t structSize, size_t initialSize) nothrow;
__gshared c_gst_vec_deque_new_for_structFn c_gst_vec_deque_new_for_struct; ///

// global
private alias c_gst_calculate_linear_regressionFn = extern(C) gboolean function(const(GstClockTime)* xy, GstClockTime* temp, uint n, GstClockTime* mNum, GstClockTime* mDenom, GstClockTime* b, GstClockTime* xbase, double* rSquared) nothrow;
__gshared c_gst_calculate_linear_regressionFn c_gst_calculate_linear_regression; ///
private alias c_gst_call_asyncFn = extern(C) void function(GstCallAsyncFunc func, void* userData) nothrow;
__gshared c_gst_call_asyncFn c_gst_call_async; ///
private alias c_gst_check_versionFn = extern(C) gboolean function(uint major, uint minor, uint micro) nothrow;
__gshared c_gst_check_versionFn c_gst_check_version; ///
private alias c_gst_clear_bufferFn = extern(C) void function(GstBuffer** bufPtr) nothrow;
__gshared c_gst_clear_bufferFn c_gst_clear_buffer; ///
private alias c_gst_clear_buffer_listFn = extern(C) void function(GstBufferList** listPtr) nothrow;
__gshared c_gst_clear_buffer_listFn c_gst_clear_buffer_list; ///
private alias c_gst_clear_capsFn = extern(C) void function(GstCaps** capsPtr) nothrow;
__gshared c_gst_clear_capsFn c_gst_clear_caps; ///
private alias c_gst_clear_contextFn = extern(C) void function(GstContext** contextPtr) nothrow;
__gshared c_gst_clear_contextFn c_gst_clear_context; ///
private alias c_gst_clear_eventFn = extern(C) void function(GstEvent** eventPtr) nothrow;
__gshared c_gst_clear_eventFn c_gst_clear_event; ///
private alias c_gst_clear_messageFn = extern(C) void function(GstMessage** msgPtr) nothrow;
__gshared c_gst_clear_messageFn c_gst_clear_message; ///
private alias c_gst_clear_mini_objectFn = extern(C) void function(GstMiniObject** objectPtr) nothrow;
__gshared c_gst_clear_mini_objectFn c_gst_clear_mini_object; ///
private alias c_gst_clear_objectFn = extern(C) void function(GstObject** objectPtr) nothrow;
__gshared c_gst_clear_objectFn c_gst_clear_object; ///
private alias c_gst_clear_promiseFn = extern(C) void function(GstPromise** promisePtr) nothrow;
__gshared c_gst_clear_promiseFn c_gst_clear_promise; ///
private alias c_gst_clear_queryFn = extern(C) void function(GstQuery** queryPtr) nothrow;
__gshared c_gst_clear_queryFn c_gst_clear_query; ///
private alias c_gst_clear_sampleFn = extern(C) void function(GstSample** samplePtr) nothrow;
__gshared c_gst_clear_sampleFn c_gst_clear_sample; ///
private alias c_gst_clear_structureFn = extern(C) void function(GstStructure** structurePtr) nothrow;
__gshared c_gst_clear_structureFn c_gst_clear_structure; ///
private alias c_gst_clear_tag_listFn = extern(C) void function(GstTagList** taglistPtr) nothrow;
__gshared c_gst_clear_tag_listFn c_gst_clear_tag_list; ///
private alias c_gst_clear_uriFn = extern(C) void function(GstUri** uriPtr) nothrow;
__gshared c_gst_clear_uriFn c_gst_clear_uri; ///
private alias c_gst_cpuid_supports_arm_neonFn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_arm_neonFn c_gst_cpuid_supports_arm_neon; ///
private alias c_gst_cpuid_supports_arm_neon64Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_arm_neon64Fn c_gst_cpuid_supports_arm_neon64; ///
private alias c_gst_cpuid_supports_x86_3dnowFn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_3dnowFn c_gst_cpuid_supports_x86_3dnow; ///
private alias c_gst_cpuid_supports_x86_avxFn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_avxFn c_gst_cpuid_supports_x86_avx; ///
private alias c_gst_cpuid_supports_x86_avx2Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_avx2Fn c_gst_cpuid_supports_x86_avx2; ///
private alias c_gst_cpuid_supports_x86_mmxFn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_mmxFn c_gst_cpuid_supports_x86_mmx; ///
private alias c_gst_cpuid_supports_x86_mmxextFn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_mmxextFn c_gst_cpuid_supports_x86_mmxext; ///
private alias c_gst_cpuid_supports_x86_sse2Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_sse2Fn c_gst_cpuid_supports_x86_sse2; ///
private alias c_gst_cpuid_supports_x86_sse3Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_sse3Fn c_gst_cpuid_supports_x86_sse3; ///
private alias c_gst_cpuid_supports_x86_sse4_1Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_sse4_1Fn c_gst_cpuid_supports_x86_sse4_1; ///
private alias c_gst_cpuid_supports_x86_sse4_2Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_sse4_2Fn c_gst_cpuid_supports_x86_sse4_2; ///
private alias c_gst_cpuid_supports_x86_ssse3Fn = extern(C) gboolean function() nothrow;
__gshared c_gst_cpuid_supports_x86_ssse3Fn c_gst_cpuid_supports_x86_ssse3; ///
private alias c_gst_debug_add_log_functionFn = extern(C) void function(GstLogFunction func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_debug_add_log_functionFn c_gst_debug_add_log_function; ///
private alias c_gst_debug_add_ring_buffer_loggerFn = extern(C) void function(uint maxSizePerThread, uint threadTimeout) nothrow;
__gshared c_gst_debug_add_ring_buffer_loggerFn c_gst_debug_add_ring_buffer_logger; ///
private alias c_gst_debug_bin_to_dot_dataFn = extern(C) char* function(GstBin* bin, GstDebugGraphDetails details) nothrow;
__gshared c_gst_debug_bin_to_dot_dataFn c_gst_debug_bin_to_dot_data; ///
private alias c_gst_debug_bin_to_dot_fileFn = extern(C) void function(GstBin* bin, GstDebugGraphDetails details, const(char)* fileName) nothrow;
__gshared c_gst_debug_bin_to_dot_fileFn c_gst_debug_bin_to_dot_file; ///
private alias c_gst_debug_bin_to_dot_file_with_tsFn = extern(C) void function(GstBin* bin, GstDebugGraphDetails details, const(char)* fileName) nothrow;
__gshared c_gst_debug_bin_to_dot_file_with_tsFn c_gst_debug_bin_to_dot_file_with_ts; ///
private alias c_gst_debug_construct_term_colorFn = extern(C) char* function(uint colorinfo) nothrow;
__gshared c_gst_debug_construct_term_colorFn c_gst_debug_construct_term_color; ///
private alias c_gst_debug_construct_win_colorFn = extern(C) int function(uint colorinfo) nothrow;
__gshared c_gst_debug_construct_win_colorFn c_gst_debug_construct_win_color; ///
private alias c_gst_debug_get_all_categoriesFn = extern(C) GSList* function() nothrow;
__gshared c_gst_debug_get_all_categoriesFn c_gst_debug_get_all_categories; ///
private alias c_gst_debug_get_color_modeFn = extern(C) GstDebugColorMode function() nothrow;
__gshared c_gst_debug_get_color_modeFn c_gst_debug_get_color_mode; ///
private alias c_gst_debug_get_default_thresholdFn = extern(C) GstDebugLevel function() nothrow;
__gshared c_gst_debug_get_default_thresholdFn c_gst_debug_get_default_threshold; ///
private alias c_gst_debug_get_stack_traceFn = extern(C) char* function(GstStackTraceFlags flags) nothrow;
__gshared c_gst_debug_get_stack_traceFn c_gst_debug_get_stack_trace; ///
private alias c_gst_debug_is_activeFn = extern(C) gboolean function() nothrow;
__gshared c_gst_debug_is_activeFn c_gst_debug_is_active; ///
private alias c_gst_debug_is_coloredFn = extern(C) gboolean function() nothrow;
__gshared c_gst_debug_is_coloredFn c_gst_debug_is_colored; ///
private alias c_gst_debug_logFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format,  ...) nothrow;
__gshared c_gst_debug_logFn c_gst_debug_log; ///
private alias c_gst_debug_log_defaultFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message, void* userData) nothrow;
__gshared c_gst_debug_log_defaultFn c_gst_debug_log_default; ///
private alias c_gst_debug_log_get_lineFn = extern(C) char* function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message) nothrow;
__gshared c_gst_debug_log_get_lineFn c_gst_debug_log_get_line; ///
private alias c_gst_debug_log_idFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format,  ...) nothrow;
__gshared c_gst_debug_log_idFn c_gst_debug_log_id; ///
private alias c_gst_debug_log_id_literalFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* messageString) nothrow;
__gshared c_gst_debug_log_id_literalFn c_gst_debug_log_id_literal; ///
private alias c_gst_debug_log_id_literal_with_contextFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* message) nothrow;
__gshared c_gst_debug_log_id_literal_with_contextFn c_gst_debug_log_id_literal_with_context; ///
private alias c_gst_debug_log_id_valistFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format, void* args) nothrow;
__gshared c_gst_debug_log_id_valistFn c_gst_debug_log_id_valist; ///
private alias c_gst_debug_log_id_with_contextFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format,  ...) nothrow;
__gshared c_gst_debug_log_id_with_contextFn c_gst_debug_log_id_with_context; ///
private alias c_gst_debug_log_id_with_context_valistFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format, void* args) nothrow;
__gshared c_gst_debug_log_id_with_context_valistFn c_gst_debug_log_id_with_context_valist; ///
private alias c_gst_debug_log_literalFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* messageString) nothrow;
__gshared c_gst_debug_log_literalFn c_gst_debug_log_literal; ///
private alias c_gst_debug_log_literal_with_contextFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* message) nothrow;
__gshared c_gst_debug_log_literal_with_contextFn c_gst_debug_log_literal_with_context; ///
private alias c_gst_debug_log_valistFn = extern(C) void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format, void* args) nothrow;
__gshared c_gst_debug_log_valistFn c_gst_debug_log_valist; ///
private alias c_gst_debug_log_with_contextFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format,  ...) nothrow;
__gshared c_gst_debug_log_with_contextFn c_gst_debug_log_with_context; ///
private alias c_gst_debug_log_with_context_valistFn = extern(C) void function(GstLogContext* ctx, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format, void* args) nothrow;
__gshared c_gst_debug_log_with_context_valistFn c_gst_debug_log_with_context_valist; ///
private alias c_gst_debug_print_objectFn = extern(C) char* function(const(void)* ptr) nothrow;
__gshared c_gst_debug_print_objectFn c_gst_debug_print_object; ///
private alias c_gst_debug_print_segmentFn = extern(C) char* function(const(GstSegment)* segment) nothrow;
__gshared c_gst_debug_print_segmentFn c_gst_debug_print_segment; ///
private alias c_gst_debug_print_stack_traceFn = extern(C) void function() nothrow;
__gshared c_gst_debug_print_stack_traceFn c_gst_debug_print_stack_trace; ///
private alias c_gst_debug_remove_log_functionFn = extern(C) uint function(GstLogFunction func) nothrow;
__gshared c_gst_debug_remove_log_functionFn c_gst_debug_remove_log_function; ///
private alias c_gst_debug_remove_log_function_by_dataFn = extern(C) uint function(void* data) nothrow;
__gshared c_gst_debug_remove_log_function_by_dataFn c_gst_debug_remove_log_function_by_data; ///
private alias c_gst_debug_remove_ring_buffer_loggerFn = extern(C) void function() nothrow;
__gshared c_gst_debug_remove_ring_buffer_loggerFn c_gst_debug_remove_ring_buffer_logger; ///
private alias c_gst_debug_ring_buffer_logger_get_logsFn = extern(C) char** function() nothrow;
__gshared c_gst_debug_ring_buffer_logger_get_logsFn c_gst_debug_ring_buffer_logger_get_logs; ///
private alias c_gst_debug_set_activeFn = extern(C) void function(gboolean active) nothrow;
__gshared c_gst_debug_set_activeFn c_gst_debug_set_active; ///
private alias c_gst_debug_set_color_modeFn = extern(C) void function(GstDebugColorMode mode) nothrow;
__gshared c_gst_debug_set_color_modeFn c_gst_debug_set_color_mode; ///
private alias c_gst_debug_set_color_mode_from_stringFn = extern(C) void function(const(char)* mode) nothrow;
__gshared c_gst_debug_set_color_mode_from_stringFn c_gst_debug_set_color_mode_from_string; ///
private alias c_gst_debug_set_coloredFn = extern(C) void function(gboolean colored) nothrow;
__gshared c_gst_debug_set_coloredFn c_gst_debug_set_colored; ///
private alias c_gst_debug_set_default_thresholdFn = extern(C) void function(GstDebugLevel level) nothrow;
__gshared c_gst_debug_set_default_thresholdFn c_gst_debug_set_default_threshold; ///
private alias c_gst_debug_set_threshold_for_nameFn = extern(C) void function(const(char)* name, GstDebugLevel level) nothrow;
__gshared c_gst_debug_set_threshold_for_nameFn c_gst_debug_set_threshold_for_name; ///
private alias c_gst_debug_set_threshold_from_stringFn = extern(C) void function(const(char)* list, gboolean reset) nothrow;
__gshared c_gst_debug_set_threshold_from_stringFn c_gst_debug_set_threshold_from_string; ///
private alias c_gst_debug_unset_threshold_for_nameFn = extern(C) void function(const(char)* name) nothrow;
__gshared c_gst_debug_unset_threshold_for_nameFn c_gst_debug_unset_threshold_for_name; ///
private alias c_gst_deinitFn = extern(C) void function() nothrow;
__gshared c_gst_deinitFn c_gst_deinit; ///
private alias c_gst_dynamic_type_registerFn = extern(C) gboolean function(GstPlugin* plugin, GType type) nothrow;
__gshared c_gst_dynamic_type_registerFn c_gst_dynamic_type_register; ///
private alias c_gst_error_get_messageFn = extern(C) char* function(GQuark domain, int code) nothrow;
__gshared c_gst_error_get_messageFn c_gst_error_get_message; ///
private alias c_gst_filename_to_uriFn = extern(C) char* function(const(char)* filename, GError** _err) nothrow;
__gshared c_gst_filename_to_uriFn c_gst_filename_to_uri; ///
private alias c_gst_flow_get_nameFn = extern(C) const(char)* function(GstFlowReturn ret) nothrow;
__gshared c_gst_flow_get_nameFn c_gst_flow_get_name; ///
private alias c_gst_flow_to_quarkFn = extern(C) GQuark function(GstFlowReturn ret) nothrow;
__gshared c_gst_flow_to_quarkFn c_gst_flow_to_quark; ///
private alias c_gst_formats_containsFn = extern(C) gboolean function(const(GstFormat)* formats, GstFormat format) nothrow;
__gshared c_gst_formats_containsFn c_gst_formats_contains; ///
private alias c_gst_get_main_executable_pathFn = extern(C) const(char)* function() nothrow;
__gshared c_gst_get_main_executable_pathFn c_gst_get_main_executable_path; ///
private alias c_gst_info_strdup_printfFn = extern(C) char* function(const(char)* format,  ...) nothrow;
__gshared c_gst_info_strdup_printfFn c_gst_info_strdup_printf; ///
private alias c_gst_info_strdup_vprintfFn = extern(C) char* function(const(char)* format, void* args) nothrow;
__gshared c_gst_info_strdup_vprintfFn c_gst_info_strdup_vprintf; ///
private alias c_gst_info_vasprintfFn = extern(C) int function(char** result, const(char)* format, void* args) nothrow;
__gshared c_gst_info_vasprintfFn c_gst_info_vasprintf; ///
private alias c_gst_initFn = extern(C) void function(int* argc, char*** argv) nothrow;
__gshared c_gst_initFn c_gst_init; ///
private alias c_gst_init_checkFn = extern(C) gboolean function(int* argc, char*** argv, GError** _err) nothrow;
__gshared c_gst_init_checkFn c_gst_init_check; ///
private alias c_gst_init_get_option_groupFn = extern(C) GOptionGroup* function() nothrow;
__gshared c_gst_init_get_option_groupFn c_gst_init_get_option_group; ///
private alias c_gst_is_caps_featuresFn = extern(C) gboolean function(const(void)* obj) nothrow;
__gshared c_gst_is_caps_featuresFn c_gst_is_caps_features; ///
private alias c_gst_is_initializedFn = extern(C) gboolean function() nothrow;
__gshared c_gst_is_initializedFn c_gst_is_initialized; ///
private alias c_gst_make_element_message_detailsFn = extern(C) GstStructure* function(const(char)* name,  ...) nothrow;
__gshared c_gst_make_element_message_detailsFn c_gst_make_element_message_details; ///
private alias c_gst_param_spec_arrayFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GParamSpec* elementSpec, GParamFlags flags) nothrow;
__gshared c_gst_param_spec_arrayFn c_gst_param_spec_array; ///
private alias c_gst_param_spec_fractionFn = extern(C) GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, int minNum, int minDenom, int maxNum, int maxDenom, int defaultNum, int defaultDenom, GParamFlags flags) nothrow;
__gshared c_gst_param_spec_fractionFn c_gst_param_spec_fraction; ///
private alias c_gst_parent_buffer_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_parent_buffer_meta_api_get_typeFn c_gst_parent_buffer_meta_api_get_type; ///
private alias c_gst_parse_bin_from_descriptionFn = extern(C) GstElement* function(const(char)* binDescription, gboolean ghostUnlinkedPads, GError** _err) nothrow;
__gshared c_gst_parse_bin_from_descriptionFn c_gst_parse_bin_from_description; ///
private alias c_gst_parse_bin_from_description_fullFn = extern(C) GstElement* function(const(char)* binDescription, gboolean ghostUnlinkedPads, GstParseContext* context, GstParseFlags flags, GError** _err) nothrow;
__gshared c_gst_parse_bin_from_description_fullFn c_gst_parse_bin_from_description_full; ///
private alias c_gst_parse_launchFn = extern(C) GstElement* function(const(char)* pipelineDescription, GError** _err) nothrow;
__gshared c_gst_parse_launchFn c_gst_parse_launch; ///
private alias c_gst_parse_launch_fullFn = extern(C) GstElement* function(const(char)* pipelineDescription, GstParseContext* context, GstParseFlags flags, GError** _err) nothrow;
__gshared c_gst_parse_launch_fullFn c_gst_parse_launch_full; ///
private alias c_gst_parse_launchvFn = extern(C) GstElement* function(const(char*)* argv, GError** _err) nothrow;
__gshared c_gst_parse_launchvFn c_gst_parse_launchv; ///
private alias c_gst_parse_launchv_fullFn = extern(C) GstElement* function(const(char*)* argv, GstParseContext* context, GstParseFlags flags, GError** _err) nothrow;
__gshared c_gst_parse_launchv_fullFn c_gst_parse_launchv_full; ///
private alias c_gst_printFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_gst_printFn c_gst_print; ///
private alias c_gst_printerrFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_gst_printerrFn c_gst_printerr; ///
private alias c_gst_printerrlnFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_gst_printerrlnFn c_gst_printerrln; ///
private alias c_gst_printlnFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_gst_printlnFn c_gst_println; ///
private alias c_gst_protection_filter_systems_by_available_decryptorsFn = extern(C) char** function(const(char*)* systemIdentifiers) nothrow;
__gshared c_gst_protection_filter_systems_by_available_decryptorsFn c_gst_protection_filter_systems_by_available_decryptors; ///
private alias c_gst_protection_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_protection_meta_api_get_typeFn c_gst_protection_meta_api_get_type; ///
private alias c_gst_protection_select_systemFn = extern(C) const(char)* function(const(char*)* systemIdentifiers) nothrow;
__gshared c_gst_protection_select_systemFn c_gst_protection_select_system; ///
private alias c_gst_reference_timestamp_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_reference_timestamp_meta_api_get_typeFn c_gst_reference_timestamp_meta_api_get_type; ///
private alias c_gst_segtrap_is_enabledFn = extern(C) gboolean function() nothrow;
__gshared c_gst_segtrap_is_enabledFn c_gst_segtrap_is_enabled; ///
private alias c_gst_segtrap_set_enabledFn = extern(C) void function(gboolean enabled) nothrow;
__gshared c_gst_segtrap_set_enabledFn c_gst_segtrap_set_enabled; ///
private alias c_gst_tag_existsFn = extern(C) gboolean function(const(char)* tag) nothrow;
__gshared c_gst_tag_existsFn c_gst_tag_exists; ///
private alias c_gst_tag_get_descriptionFn = extern(C) const(char)* function(const(char)* tag) nothrow;
__gshared c_gst_tag_get_descriptionFn c_gst_tag_get_description; ///
private alias c_gst_tag_get_flagFn = extern(C) GstTagFlag function(const(char)* tag) nothrow;
__gshared c_gst_tag_get_flagFn c_gst_tag_get_flag; ///
private alias c_gst_tag_get_nickFn = extern(C) const(char)* function(const(char)* tag) nothrow;
__gshared c_gst_tag_get_nickFn c_gst_tag_get_nick; ///
private alias c_gst_tag_get_typeFn = extern(C) GType function(const(char)* tag) nothrow;
__gshared c_gst_tag_get_typeFn c_gst_tag_get_type; ///
private alias c_gst_tag_is_fixedFn = extern(C) gboolean function(const(char)* tag) nothrow;
__gshared c_gst_tag_is_fixedFn c_gst_tag_is_fixed; ///
private alias c_gst_tag_merge_strings_with_commaFn = extern(C) void function(GValue* dest, const(GValue)* src) nothrow;
__gshared c_gst_tag_merge_strings_with_commaFn c_gst_tag_merge_strings_with_comma; ///
private alias c_gst_tag_merge_use_firstFn = extern(C) void function(GValue* dest, const(GValue)* src) nothrow;
__gshared c_gst_tag_merge_use_firstFn c_gst_tag_merge_use_first; ///
private alias c_gst_tag_registerFn = extern(C) void function(const(char)* name, GstTagFlag flag, GType type, const(char)* nick, const(char)* blurb, GstTagMergeFunc func) nothrow;
__gshared c_gst_tag_registerFn c_gst_tag_register; ///
private alias c_gst_tag_register_staticFn = extern(C) void function(const(char)* name, GstTagFlag flag, GType type, const(char)* nick, const(char)* blurb, GstTagMergeFunc func) nothrow;
__gshared c_gst_tag_register_staticFn c_gst_tag_register_static; ///
private alias c_gst_tracing_get_active_tracersFn = extern(C) GList* function() nothrow;
__gshared c_gst_tracing_get_active_tracersFn c_gst_tracing_get_active_tracers; ///
private alias c_gst_tracing_register_hookFn = extern(C) void function(GstTracer* tracer, const(char)* detail, GCallback func) nothrow;
__gshared c_gst_tracing_register_hookFn c_gst_tracing_register_hook; ///
private alias c_gst_type_is_plugin_apiFn = extern(C) gboolean function(GType type, GstPluginAPIFlags* flags) nothrow;
__gshared c_gst_type_is_plugin_apiFn c_gst_type_is_plugin_api; ///
private alias c_gst_type_mark_as_plugin_apiFn = extern(C) void function(GType type, GstPluginAPIFlags flags) nothrow;
__gshared c_gst_type_mark_as_plugin_apiFn c_gst_type_mark_as_plugin_api; ///
private alias c_gst_update_registryFn = extern(C) gboolean function() nothrow;
__gshared c_gst_update_registryFn c_gst_update_registry; ///
private alias c_gst_util_array_binary_searchFn = extern(C) void* function(void* array, uint numElements, size_t elementSize, GCompareDataFunc searchFunc, GstSearchMode mode, const(void)* searchData, void* userData) nothrow;
__gshared c_gst_util_array_binary_searchFn c_gst_util_array_binary_search; ///
private alias c_gst_util_ceil_log2Fn = extern(C) uint function(uint v) nothrow;
__gshared c_gst_util_ceil_log2Fn c_gst_util_ceil_log2; ///
private alias c_gst_util_double_to_fractionFn = extern(C) void function(double src, int* destN, int* destD) nothrow;
__gshared c_gst_util_double_to_fractionFn c_gst_util_double_to_fraction; ///
private alias c_gst_util_dump_bufferFn = extern(C) void function(GstBuffer* buf) nothrow;
__gshared c_gst_util_dump_bufferFn c_gst_util_dump_buffer; ///
private alias c_gst_util_dump_memFn = extern(C) void function(const(ubyte)* mem, uint size) nothrow;
__gshared c_gst_util_dump_memFn c_gst_util_dump_mem; ///
private alias c_gst_util_filename_compareFn = extern(C) int function(const(char)* a, const(char)* b) nothrow;
__gshared c_gst_util_filename_compareFn c_gst_util_filename_compare; ///
private alias c_gst_util_floor_log2Fn = extern(C) uint function(uint v) nothrow;
__gshared c_gst_util_floor_log2Fn c_gst_util_floor_log2; ///
private alias c_gst_util_fraction_addFn = extern(C) gboolean function(int aN, int aD, int bN, int bD, int* resN, int* resD) nothrow;
__gshared c_gst_util_fraction_addFn c_gst_util_fraction_add; ///
private alias c_gst_util_fraction_compareFn = extern(C) int function(int aN, int aD, int bN, int bD) nothrow;
__gshared c_gst_util_fraction_compareFn c_gst_util_fraction_compare; ///
private alias c_gst_util_fraction_multiplyFn = extern(C) gboolean function(int aN, int aD, int bN, int bD, int* resN, int* resD) nothrow;
__gshared c_gst_util_fraction_multiplyFn c_gst_util_fraction_multiply; ///
private alias c_gst_util_fraction_multiply_int64Fn = extern(C) gboolean function(long aN, long aD, long bN, long bD, long* resN, long* resD) nothrow;
__gshared c_gst_util_fraction_multiply_int64Fn c_gst_util_fraction_multiply_int64; ///
private alias c_gst_util_fraction_to_doubleFn = extern(C) void function(int srcN, int srcD, double* dest) nothrow;
__gshared c_gst_util_fraction_to_doubleFn c_gst_util_fraction_to_double; ///
private alias c_gst_util_gdouble_to_guint64Fn = extern(C) ulong function(double value) nothrow;
__gshared c_gst_util_gdouble_to_guint64Fn c_gst_util_gdouble_to_guint64; ///
private alias c_gst_util_get_object_arrayFn = extern(C) gboolean function(GObject* object, const(char)* name, GValueArray** array) nothrow;
__gshared c_gst_util_get_object_arrayFn c_gst_util_get_object_array; ///
private alias c_gst_util_get_timestampFn = extern(C) GstClockTime function() nothrow;
__gshared c_gst_util_get_timestampFn c_gst_util_get_timestamp; ///
private alias c_gst_util_greatest_common_divisorFn = extern(C) int function(int a, int b) nothrow;
__gshared c_gst_util_greatest_common_divisorFn c_gst_util_greatest_common_divisor; ///
private alias c_gst_util_greatest_common_divisor_int64Fn = extern(C) long function(long a, long b) nothrow;
__gshared c_gst_util_greatest_common_divisor_int64Fn c_gst_util_greatest_common_divisor_int64; ///
private alias c_gst_util_group_id_nextFn = extern(C) uint function() nothrow;
__gshared c_gst_util_group_id_nextFn c_gst_util_group_id_next; ///
private alias c_gst_util_guint64_to_gdoubleFn = extern(C) double function(ulong value) nothrow;
__gshared c_gst_util_guint64_to_gdoubleFn c_gst_util_guint64_to_gdouble; ///
private alias c_gst_util_seqnum_compareFn = extern(C) int function(uint s1, uint s2) nothrow;
__gshared c_gst_util_seqnum_compareFn c_gst_util_seqnum_compare; ///
private alias c_gst_util_seqnum_nextFn = extern(C) uint function() nothrow;
__gshared c_gst_util_seqnum_nextFn c_gst_util_seqnum_next; ///
private alias c_gst_util_set_object_argFn = extern(C) void function(GObject* object, const(char)* name, const(char)* value) nothrow;
__gshared c_gst_util_set_object_argFn c_gst_util_set_object_arg; ///
private alias c_gst_util_set_object_arrayFn = extern(C) gboolean function(GObject* object, const(char)* name, const(GValueArray)* array) nothrow;
__gshared c_gst_util_set_object_arrayFn c_gst_util_set_object_array; ///
private alias c_gst_util_set_value_from_stringFn = extern(C) void function(GValue* value, const(char)* valueStr) nothrow;
__gshared c_gst_util_set_value_from_stringFn c_gst_util_set_value_from_string; ///
private alias c_gst_util_simplify_fractionFn = extern(C) void function(int* numerator, int* denominator, uint nTerms, uint threshold) nothrow;
__gshared c_gst_util_simplify_fractionFn c_gst_util_simplify_fraction; ///
private alias c_gst_util_uint64_scaleFn = extern(C) ulong function(ulong val, ulong num, ulong denom) nothrow;
__gshared c_gst_util_uint64_scaleFn c_gst_util_uint64_scale; ///
private alias c_gst_util_uint64_scale_ceilFn = extern(C) ulong function(ulong val, ulong num, ulong denom) nothrow;
__gshared c_gst_util_uint64_scale_ceilFn c_gst_util_uint64_scale_ceil; ///
private alias c_gst_util_uint64_scale_intFn = extern(C) ulong function(ulong val, int num, int denom) nothrow;
__gshared c_gst_util_uint64_scale_intFn c_gst_util_uint64_scale_int; ///
private alias c_gst_util_uint64_scale_int_ceilFn = extern(C) ulong function(ulong val, int num, int denom) nothrow;
__gshared c_gst_util_uint64_scale_int_ceilFn c_gst_util_uint64_scale_int_ceil; ///
private alias c_gst_util_uint64_scale_int_roundFn = extern(C) ulong function(ulong val, int num, int denom) nothrow;
__gshared c_gst_util_uint64_scale_int_roundFn c_gst_util_uint64_scale_int_round; ///
private alias c_gst_util_uint64_scale_roundFn = extern(C) ulong function(ulong val, ulong num, ulong denom) nothrow;
__gshared c_gst_util_uint64_scale_roundFn c_gst_util_uint64_scale_round; ///
private alias c_gst_value_can_compareFn = extern(C) gboolean function(const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_can_compareFn c_gst_value_can_compare; ///
private alias c_gst_value_can_intersectFn = extern(C) gboolean function(const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_can_intersectFn c_gst_value_can_intersect; ///
private alias c_gst_value_can_subtractFn = extern(C) gboolean function(const(GValue)* minuend, const(GValue)* subtrahend) nothrow;
__gshared c_gst_value_can_subtractFn c_gst_value_can_subtract; ///
private alias c_gst_value_can_unionFn = extern(C) gboolean function(const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_can_unionFn c_gst_value_can_union; ///
private alias c_gst_value_compareFn = extern(C) int function(const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_compareFn c_gst_value_compare; ///
private alias c_gst_value_deserializeFn = extern(C) gboolean function(GValue* dest, const(char)* src) nothrow;
__gshared c_gst_value_deserializeFn c_gst_value_deserialize; ///
private alias c_gst_value_deserialize_with_pspecFn = extern(C) gboolean function(GValue* dest, const(char)* src, GParamSpec* pspec) nothrow;
__gshared c_gst_value_deserialize_with_pspecFn c_gst_value_deserialize_with_pspec; ///
private alias c_gst_value_fixateFn = extern(C) gboolean function(GValue* dest, const(GValue)* src) nothrow;
__gshared c_gst_value_fixateFn c_gst_value_fixate; ///
private alias c_gst_value_fraction_multiplyFn = extern(C) gboolean function(GValue* product, const(GValue)* factor1, const(GValue)* factor2) nothrow;
__gshared c_gst_value_fraction_multiplyFn c_gst_value_fraction_multiply; ///
private alias c_gst_value_fraction_subtractFn = extern(C) gboolean function(GValue* dest, const(GValue)* minuend, const(GValue)* subtrahend) nothrow;
__gshared c_gst_value_fraction_subtractFn c_gst_value_fraction_subtract; ///
private alias c_gst_value_get_bitmaskFn = extern(C) ulong function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_bitmaskFn c_gst_value_get_bitmask; ///
private alias c_gst_value_get_capsFn = extern(C) const(GstCaps)* function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_capsFn c_gst_value_get_caps; ///
private alias c_gst_value_get_caps_featuresFn = extern(C) const(GstCapsFeatures)* function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_caps_featuresFn c_gst_value_get_caps_features; ///
private alias c_gst_value_get_double_range_maxFn = extern(C) double function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_double_range_maxFn c_gst_value_get_double_range_max; ///
private alias c_gst_value_get_double_range_minFn = extern(C) double function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_double_range_minFn c_gst_value_get_double_range_min; ///
private alias c_gst_value_get_flagset_flagsFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_flagset_flagsFn c_gst_value_get_flagset_flags; ///
private alias c_gst_value_get_flagset_maskFn = extern(C) uint function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_flagset_maskFn c_gst_value_get_flagset_mask; ///
private alias c_gst_value_get_fraction_denominatorFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_fraction_denominatorFn c_gst_value_get_fraction_denominator; ///
private alias c_gst_value_get_fraction_numeratorFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_fraction_numeratorFn c_gst_value_get_fraction_numerator; ///
private alias c_gst_value_get_fraction_range_maxFn = extern(C) const(GValue)* function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_fraction_range_maxFn c_gst_value_get_fraction_range_max; ///
private alias c_gst_value_get_fraction_range_minFn = extern(C) const(GValue)* function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_fraction_range_minFn c_gst_value_get_fraction_range_min; ///
private alias c_gst_value_get_int64_range_maxFn = extern(C) long function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int64_range_maxFn c_gst_value_get_int64_range_max; ///
private alias c_gst_value_get_int64_range_minFn = extern(C) long function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int64_range_minFn c_gst_value_get_int64_range_min; ///
private alias c_gst_value_get_int64_range_stepFn = extern(C) long function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int64_range_stepFn c_gst_value_get_int64_range_step; ///
private alias c_gst_value_get_int_range_maxFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int_range_maxFn c_gst_value_get_int_range_max; ///
private alias c_gst_value_get_int_range_minFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int_range_minFn c_gst_value_get_int_range_min; ///
private alias c_gst_value_get_int_range_stepFn = extern(C) int function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_int_range_stepFn c_gst_value_get_int_range_step; ///
private alias c_gst_value_get_structureFn = extern(C) const(GstStructure)* function(const(GValue)* value) nothrow;
__gshared c_gst_value_get_structureFn c_gst_value_get_structure; ///
private alias c_gst_value_hashFn = extern(C) gboolean function(const(GValue)* value, uint* res) nothrow;
__gshared c_gst_value_hashFn c_gst_value_hash; ///
private alias c_gst_value_init_and_copyFn = extern(C) void function(GValue* dest, const(GValue)* src) nothrow;
__gshared c_gst_value_init_and_copyFn c_gst_value_init_and_copy; ///
private alias c_gst_value_intersectFn = extern(C) gboolean function(GValue* dest, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_intersectFn c_gst_value_intersect; ///
private alias c_gst_value_is_fixedFn = extern(C) gboolean function(const(GValue)* value) nothrow;
__gshared c_gst_value_is_fixedFn c_gst_value_is_fixed; ///
private alias c_gst_value_is_subsetFn = extern(C) gboolean function(const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_is_subsetFn c_gst_value_is_subset; ///
private alias c_gst_value_registerFn = extern(C) void function(const(GstValueTable)* table) nothrow;
__gshared c_gst_value_registerFn c_gst_value_register; ///
private alias c_gst_value_serializeFn = extern(C) char* function(const(GValue)* value) nothrow;
__gshared c_gst_value_serializeFn c_gst_value_serialize; ///
private alias c_gst_value_set_bitmaskFn = extern(C) void function(GValue* value, ulong bitmask) nothrow;
__gshared c_gst_value_set_bitmaskFn c_gst_value_set_bitmask; ///
private alias c_gst_value_set_capsFn = extern(C) void function(GValue* value, const(GstCaps)* caps) nothrow;
__gshared c_gst_value_set_capsFn c_gst_value_set_caps; ///
private alias c_gst_value_set_caps_featuresFn = extern(C) void function(GValue* value, const(GstCapsFeatures)* features) nothrow;
__gshared c_gst_value_set_caps_featuresFn c_gst_value_set_caps_features; ///
private alias c_gst_value_set_double_rangeFn = extern(C) void function(GValue* value, double start, double end) nothrow;
__gshared c_gst_value_set_double_rangeFn c_gst_value_set_double_range; ///
private alias c_gst_value_set_flagsetFn = extern(C) void function(GValue* value, uint flags, uint mask) nothrow;
__gshared c_gst_value_set_flagsetFn c_gst_value_set_flagset; ///
private alias c_gst_value_set_fractionFn = extern(C) void function(GValue* value, int numerator, int denominator) nothrow;
__gshared c_gst_value_set_fractionFn c_gst_value_set_fraction; ///
private alias c_gst_value_set_fraction_rangeFn = extern(C) void function(GValue* value, const(GValue)* start, const(GValue)* end) nothrow;
__gshared c_gst_value_set_fraction_rangeFn c_gst_value_set_fraction_range; ///
private alias c_gst_value_set_fraction_range_fullFn = extern(C) void function(GValue* value, int numeratorStart, int denominatorStart, int numeratorEnd, int denominatorEnd) nothrow;
__gshared c_gst_value_set_fraction_range_fullFn c_gst_value_set_fraction_range_full; ///
private alias c_gst_value_set_int64_rangeFn = extern(C) void function(GValue* value, long start, long end) nothrow;
__gshared c_gst_value_set_int64_rangeFn c_gst_value_set_int64_range; ///
private alias c_gst_value_set_int64_range_stepFn = extern(C) void function(GValue* value, long start, long end, long step) nothrow;
__gshared c_gst_value_set_int64_range_stepFn c_gst_value_set_int64_range_step; ///
private alias c_gst_value_set_int_rangeFn = extern(C) void function(GValue* value, int start, int end) nothrow;
__gshared c_gst_value_set_int_rangeFn c_gst_value_set_int_range; ///
private alias c_gst_value_set_int_range_stepFn = extern(C) void function(GValue* value, int start, int end, int step) nothrow;
__gshared c_gst_value_set_int_range_stepFn c_gst_value_set_int_range_step; ///
private alias c_gst_value_set_structureFn = extern(C) void function(GValue* value, const(GstStructure)* structure) nothrow;
__gshared c_gst_value_set_structureFn c_gst_value_set_structure; ///
private alias c_gst_value_subtractFn = extern(C) gboolean function(GValue* dest, const(GValue)* minuend, const(GValue)* subtrahend) nothrow;
__gshared c_gst_value_subtractFn c_gst_value_subtract; ///
private alias c_gst_value_unionFn = extern(C) gboolean function(GValue* dest, const(GValue)* value1, const(GValue)* value2) nothrow;
__gshared c_gst_value_unionFn c_gst_value_union; ///
private alias c_gst_versionFn = extern(C) void function(uint* major, uint* minor, uint* micro, uint* nano) nothrow;
__gshared c_gst_versionFn c_gst_version; ///
private alias c_gst_version_stringFn = extern(C) char* function() nothrow;
__gshared c_gst_version_stringFn c_gst_version_string; ///

// CoreError
private alias c_gst_core_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_core_error_quarkFn c_gst_core_error_quark; ///

// DebugLevel
private alias c_gst_debug_level_get_nameFn = extern(C) const(char)* function(GstDebugLevel level) nothrow;
__gshared c_gst_debug_level_get_nameFn c_gst_debug_level_get_name; ///

// EventType
private alias c_gst_event_type_get_flagsFn = extern(C) GstEventTypeFlags function(GstEventType type) nothrow;
__gshared c_gst_event_type_get_flagsFn c_gst_event_type_get_flags; ///
private alias c_gst_event_type_get_nameFn = extern(C) const(char)* function(GstEventType type) nothrow;
__gshared c_gst_event_type_get_nameFn c_gst_event_type_get_name; ///
private alias c_gst_event_type_to_quarkFn = extern(C) GQuark function(GstEventType type) nothrow;
__gshared c_gst_event_type_to_quarkFn c_gst_event_type_to_quark; ///
private alias c_gst_event_type_to_sticky_orderingFn = extern(C) uint function(GstEventType type) nothrow;
__gshared c_gst_event_type_to_sticky_orderingFn c_gst_event_type_to_sticky_ordering; ///

// Format
private alias c_gst_format_get_by_nickFn = extern(C) GstFormat function(const(char)* nick) nothrow;
__gshared c_gst_format_get_by_nickFn c_gst_format_get_by_nick; ///
private alias c_gst_format_get_detailsFn = extern(C) const(GstFormatDefinition)* function(GstFormat format) nothrow;
__gshared c_gst_format_get_detailsFn c_gst_format_get_details; ///
private alias c_gst_format_get_nameFn = extern(C) const(char)* function(GstFormat format) nothrow;
__gshared c_gst_format_get_nameFn c_gst_format_get_name; ///
private alias c_gst_format_iterate_definitionsFn = extern(C) GstIterator* function() nothrow;
__gshared c_gst_format_iterate_definitionsFn c_gst_format_iterate_definitions; ///
private alias c_gst_format_registerFn = extern(C) GstFormat function(const(char)* nick, const(char)* description) nothrow;
__gshared c_gst_format_registerFn c_gst_format_register; ///
private alias c_gst_format_to_quarkFn = extern(C) GQuark function(GstFormat format) nothrow;
__gshared c_gst_format_to_quarkFn c_gst_format_to_quark; ///

// LibraryError
private alias c_gst_library_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_library_error_quarkFn c_gst_library_error_quark; ///

// MessageType
private alias c_gst_message_type_get_nameFn = extern(C) const(char)* function(GstMessageType type) nothrow;
__gshared c_gst_message_type_get_nameFn c_gst_message_type_get_name; ///
private alias c_gst_message_type_to_quarkFn = extern(C) GQuark function(GstMessageType type) nothrow;
__gshared c_gst_message_type_to_quarkFn c_gst_message_type_to_quark; ///

// PadMode
private alias c_gst_pad_mode_get_nameFn = extern(C) const(char)* function(GstPadMode mode) nothrow;
__gshared c_gst_pad_mode_get_nameFn c_gst_pad_mode_get_name; ///

// ParseError
private alias c_gst_parse_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_parse_error_quarkFn c_gst_parse_error_quark; ///

// PluginError
private alias c_gst_plugin_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_plugin_error_quarkFn c_gst_plugin_error_quark; ///

// QueryType
private alias c_gst_query_type_get_flagsFn = extern(C) GstQueryTypeFlags function(GstQueryType type) nothrow;
__gshared c_gst_query_type_get_flagsFn c_gst_query_type_get_flags; ///
private alias c_gst_query_type_get_nameFn = extern(C) const(char)* function(GstQueryType type) nothrow;
__gshared c_gst_query_type_get_nameFn c_gst_query_type_get_name; ///
private alias c_gst_query_type_to_quarkFn = extern(C) GQuark function(GstQueryType type) nothrow;
__gshared c_gst_query_type_to_quarkFn c_gst_query_type_to_quark; ///

// ResourceError
private alias c_gst_resource_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_resource_error_quarkFn c_gst_resource_error_quark; ///

// State
private alias c_gst_state_get_nameFn = extern(C) const(char)* function(GstState state) nothrow;
__gshared c_gst_state_get_nameFn c_gst_state_get_name; ///

// StateChange
private alias c_gst_state_change_get_nameFn = extern(C) const(char)* function(GstStateChange transition) nothrow;
__gshared c_gst_state_change_get_nameFn c_gst_state_change_get_name; ///

// StateChangeReturn
private alias c_gst_state_change_return_get_nameFn = extern(C) const(char)* function(GstStateChangeReturn stateRet) nothrow;
__gshared c_gst_state_change_return_get_nameFn c_gst_state_change_return_get_name; ///

// StreamError
private alias c_gst_stream_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_stream_error_quarkFn c_gst_stream_error_quark; ///

// StreamType
private alias c_gst_stream_type_get_nameFn = extern(C) const(char)* function(GstStreamType stype) nothrow;
__gshared c_gst_stream_type_get_nameFn c_gst_stream_type_get_name; ///

// TocEntryType
private alias c_gst_toc_entry_type_get_nickFn = extern(C) const(char)* function(GstTocEntryType type) nothrow;
__gshared c_gst_toc_entry_type_get_nickFn c_gst_toc_entry_type_get_nick; ///

// URIError
private alias c_gst_uri_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_gst_uri_error_quarkFn c_gst_uri_error_quark; ///

// AllocationParams

/** */
alias gst_allocation_params_get_type = c_gst_allocation_params_get_type;

/** */
alias gst_allocation_params_new = c_gst_allocation_params_new;

/** */
alias gst_allocation_params_copy = c_gst_allocation_params_copy;

/** */
alias gst_allocation_params_free = c_gst_allocation_params_free;

/** */
alias gst_allocation_params_init = c_gst_allocation_params_init;

// Allocator

/** */
alias gst_allocator_get_type = c_gst_allocator_get_type;

/** */
alias gst_allocator_find = c_gst_allocator_find;

/** */
alias gst_allocator_register = c_gst_allocator_register;

/** */
alias gst_allocator_alloc = c_gst_allocator_alloc;

/** */
alias gst_allocator_free = c_gst_allocator_free;

/** */
alias gst_allocator_set_default = c_gst_allocator_set_default;

// AtomicQueue

/** */
alias gst_atomic_queue_get_type = c_gst_atomic_queue_get_type;

/** */
alias gst_atomic_queue_new = c_gst_atomic_queue_new;

/** */
alias gst_atomic_queue_length = c_gst_atomic_queue_length;

/** */
alias gst_atomic_queue_peek = c_gst_atomic_queue_peek;

/** */
alias gst_atomic_queue_pop = c_gst_atomic_queue_pop;

/** */
alias gst_atomic_queue_push = c_gst_atomic_queue_push;

/** */
alias gst_atomic_queue_ref = c_gst_atomic_queue_ref;

/** */
alias gst_atomic_queue_unref = c_gst_atomic_queue_unref;

// Bin

/** */
alias gst_bin_get_type = c_gst_bin_get_type;

/** */
alias gst_bin_new = c_gst_bin_new;

/** */
alias gst_bin_add = c_gst_bin_add;

/** */
alias gst_bin_add_many = c_gst_bin_add_many;

/** */
alias gst_bin_find_unlinked_pad = c_gst_bin_find_unlinked_pad;

/** */
alias gst_bin_get_by_interface = c_gst_bin_get_by_interface;

/** */
alias gst_bin_get_by_name = c_gst_bin_get_by_name;

/** */
alias gst_bin_get_by_name_recurse_up = c_gst_bin_get_by_name_recurse_up;

/** */
alias gst_bin_get_suppressed_flags = c_gst_bin_get_suppressed_flags;

/** */
alias gst_bin_iterate_all_by_element_factory_name = c_gst_bin_iterate_all_by_element_factory_name;

/** */
alias gst_bin_iterate_all_by_interface = c_gst_bin_iterate_all_by_interface;

/** */
alias gst_bin_iterate_elements = c_gst_bin_iterate_elements;

/** */
alias gst_bin_iterate_recurse = c_gst_bin_iterate_recurse;

/** */
alias gst_bin_iterate_sinks = c_gst_bin_iterate_sinks;

/** */
alias gst_bin_iterate_sorted = c_gst_bin_iterate_sorted;

/** */
alias gst_bin_iterate_sources = c_gst_bin_iterate_sources;

/** */
alias gst_bin_recalculate_latency = c_gst_bin_recalculate_latency;

/** */
alias gst_bin_remove = c_gst_bin_remove;

/** */
alias gst_bin_remove_many = c_gst_bin_remove_many;

/** */
alias gst_bin_set_suppressed_flags = c_gst_bin_set_suppressed_flags;

/** */
alias gst_bin_sync_children_states = c_gst_bin_sync_children_states;

// Bitmask

/** */
alias gst_bitmask_get_type = c_gst_bitmask_get_type;

// Buffer

/** */
alias gst_buffer_get_type = c_gst_buffer_get_type;

/** */
alias gst_buffer_new = c_gst_buffer_new;

/** */
alias gst_buffer_new_allocate = c_gst_buffer_new_allocate;

/** */
alias gst_buffer_new_memdup = c_gst_buffer_new_memdup;

/** */
alias gst_buffer_new_wrapped = c_gst_buffer_new_wrapped;

/** */
alias gst_buffer_new_wrapped_bytes = c_gst_buffer_new_wrapped_bytes;

/** */
alias gst_buffer_new_wrapped_full = c_gst_buffer_new_wrapped_full;

/** */
alias gst_buffer_add_custom_meta = c_gst_buffer_add_custom_meta;

/** */
alias gst_buffer_add_meta = c_gst_buffer_add_meta;

/** */
alias gst_buffer_add_parent_buffer_meta = c_gst_buffer_add_parent_buffer_meta;

/** */
alias gst_buffer_add_protection_meta = c_gst_buffer_add_protection_meta;

/** */
alias gst_buffer_add_reference_timestamp_meta = c_gst_buffer_add_reference_timestamp_meta;

/** */
alias gst_buffer_append = c_gst_buffer_append;

/** */
alias gst_buffer_append_memory = c_gst_buffer_append_memory;

/** */
alias gst_buffer_append_region = c_gst_buffer_append_region;

/** */
alias gst_buffer_copy = c_gst_buffer_copy;

/** */
alias gst_buffer_copy_deep = c_gst_buffer_copy_deep;

/** */
alias gst_buffer_copy_into = c_gst_buffer_copy_into;

/** */
alias gst_buffer_copy_region = c_gst_buffer_copy_region;

/** */
alias gst_buffer_extract = c_gst_buffer_extract;

/** */
alias gst_buffer_extract_dup = c_gst_buffer_extract_dup;

/** */
alias gst_buffer_fill = c_gst_buffer_fill;

/** */
alias gst_buffer_find_memory = c_gst_buffer_find_memory;

/** */
alias gst_buffer_foreach_meta = c_gst_buffer_foreach_meta;

/** */
alias gst_buffer_get_all_memory = c_gst_buffer_get_all_memory;

/** */
alias gst_buffer_get_custom_meta = c_gst_buffer_get_custom_meta;

/** */
alias gst_buffer_get_flags = c_gst_buffer_get_flags;

/** */
alias gst_buffer_get_memory = c_gst_buffer_get_memory;

/** */
alias gst_buffer_get_memory_range = c_gst_buffer_get_memory_range;

/** */
alias gst_buffer_get_meta = c_gst_buffer_get_meta;

/** */
alias gst_buffer_get_n_meta = c_gst_buffer_get_n_meta;

/** */
alias gst_buffer_get_reference_timestamp_meta = c_gst_buffer_get_reference_timestamp_meta;

/** */
alias gst_buffer_get_size = c_gst_buffer_get_size;

/** */
alias gst_buffer_get_sizes = c_gst_buffer_get_sizes;

/** */
alias gst_buffer_get_sizes_range = c_gst_buffer_get_sizes_range;

/** */
alias gst_buffer_has_flags = c_gst_buffer_has_flags;

/** */
alias gst_buffer_insert_memory = c_gst_buffer_insert_memory;

/** */
alias gst_buffer_is_all_memory_writable = c_gst_buffer_is_all_memory_writable;

/** */
alias gst_buffer_is_memory_range_writable = c_gst_buffer_is_memory_range_writable;

/** */
alias gst_buffer_is_writable = c_gst_buffer_is_writable;

/** */
alias gst_buffer_iterate_meta = c_gst_buffer_iterate_meta;

/** */
alias gst_buffer_iterate_meta_filtered = c_gst_buffer_iterate_meta_filtered;

/** */
alias gst_buffer_make_writable = c_gst_buffer_make_writable;

/** */
alias gst_buffer_map = c_gst_buffer_map;

/** */
alias gst_buffer_map_range = c_gst_buffer_map_range;

/** */
alias gst_buffer_memcmp = c_gst_buffer_memcmp;

/** */
alias gst_buffer_memset = c_gst_buffer_memset;

/** */
alias gst_buffer_n_memory = c_gst_buffer_n_memory;

/** */
alias gst_buffer_peek_memory = c_gst_buffer_peek_memory;

/** */
alias gst_buffer_prepend_memory = c_gst_buffer_prepend_memory;

/** */
alias gst_buffer_ref = c_gst_buffer_ref;

/** */
alias gst_buffer_remove_all_memory = c_gst_buffer_remove_all_memory;

/** */
alias gst_buffer_remove_memory = c_gst_buffer_remove_memory;

/** */
alias gst_buffer_remove_memory_range = c_gst_buffer_remove_memory_range;

/** */
alias gst_buffer_remove_meta = c_gst_buffer_remove_meta;

/** */
alias gst_buffer_replace_all_memory = c_gst_buffer_replace_all_memory;

/** */
alias gst_buffer_replace_memory = c_gst_buffer_replace_memory;

/** */
alias gst_buffer_replace_memory_range = c_gst_buffer_replace_memory_range;

/** */
alias gst_buffer_resize = c_gst_buffer_resize;

/** */
alias gst_buffer_resize_range = c_gst_buffer_resize_range;

/** */
alias gst_buffer_set_flags = c_gst_buffer_set_flags;

/** */
alias gst_buffer_set_size = c_gst_buffer_set_size;

/** */
alias gst_buffer_unmap = c_gst_buffer_unmap;

/** */
alias gst_buffer_unref = c_gst_buffer_unref;

/** */
alias gst_buffer_unset_flags = c_gst_buffer_unset_flags;

/** */
alias gst_buffer_get_max_memory = c_gst_buffer_get_max_memory;

/** */
alias gst_buffer_replace = c_gst_buffer_replace;

/** */
alias gst_buffer_steal = c_gst_buffer_steal;

/** */
alias gst_buffer_take = c_gst_buffer_take;

// BufferList

/** */
alias gst_buffer_list_get_type = c_gst_buffer_list_get_type;

/** */
alias gst_buffer_list_new = c_gst_buffer_list_new;

/** */
alias gst_buffer_list_new_sized = c_gst_buffer_list_new_sized;

/** */
alias gst_buffer_list_calculate_size = c_gst_buffer_list_calculate_size;

/** */
alias gst_buffer_list_copy = c_gst_buffer_list_copy;

/** */
alias gst_buffer_list_copy_deep = c_gst_buffer_list_copy_deep;

/** */
alias gst_buffer_list_foreach = c_gst_buffer_list_foreach;

/** */
alias gst_buffer_list_get = c_gst_buffer_list_get;

/** */
alias gst_buffer_list_get_writable = c_gst_buffer_list_get_writable;

/** */
alias gst_buffer_list_insert = c_gst_buffer_list_insert;

/** */
alias gst_buffer_list_is_writable = c_gst_buffer_list_is_writable;

/** */
alias gst_buffer_list_length = c_gst_buffer_list_length;

/** */
alias gst_buffer_list_make_writable = c_gst_buffer_list_make_writable;

/** */
alias gst_buffer_list_ref = c_gst_buffer_list_ref;

/** */
alias gst_buffer_list_remove = c_gst_buffer_list_remove;

/** */
alias gst_buffer_list_unref = c_gst_buffer_list_unref;

/** */
alias gst_buffer_list_replace = c_gst_buffer_list_replace;

/** */
alias gst_buffer_list_steal = c_gst_buffer_list_steal;

/** */
alias gst_buffer_list_take = c_gst_buffer_list_take;

// BufferPool

/** */
alias gst_buffer_pool_get_type = c_gst_buffer_pool_get_type;

/** */
alias gst_buffer_pool_new = c_gst_buffer_pool_new;

/** */
alias gst_buffer_pool_config_add_option = c_gst_buffer_pool_config_add_option;

/** */
alias gst_buffer_pool_config_get_allocator = c_gst_buffer_pool_config_get_allocator;

/** */
alias gst_buffer_pool_config_get_option = c_gst_buffer_pool_config_get_option;

/** */
alias gst_buffer_pool_config_get_params = c_gst_buffer_pool_config_get_params;

/** */
alias gst_buffer_pool_config_has_option = c_gst_buffer_pool_config_has_option;

/** */
alias gst_buffer_pool_config_n_options = c_gst_buffer_pool_config_n_options;

/** */
alias gst_buffer_pool_config_set_allocator = c_gst_buffer_pool_config_set_allocator;

/** */
alias gst_buffer_pool_config_set_params = c_gst_buffer_pool_config_set_params;

/** */
alias gst_buffer_pool_config_validate_params = c_gst_buffer_pool_config_validate_params;

/** */
alias gst_buffer_pool_acquire_buffer = c_gst_buffer_pool_acquire_buffer;

/** */
alias gst_buffer_pool_get_config = c_gst_buffer_pool_get_config;

/** */
alias gst_buffer_pool_get_options = c_gst_buffer_pool_get_options;

/** */
alias gst_buffer_pool_has_option = c_gst_buffer_pool_has_option;

/** */
alias gst_buffer_pool_is_active = c_gst_buffer_pool_is_active;

/** */
alias gst_buffer_pool_release_buffer = c_gst_buffer_pool_release_buffer;

/** */
alias gst_buffer_pool_set_active = c_gst_buffer_pool_set_active;

/** */
alias gst_buffer_pool_set_config = c_gst_buffer_pool_set_config;

/** */
alias gst_buffer_pool_set_flushing = c_gst_buffer_pool_set_flushing;

// Bus

/** */
alias gst_bus_get_type = c_gst_bus_get_type;

/** */
alias gst_bus_new = c_gst_bus_new;

/** */
alias gst_bus_add_signal_watch = c_gst_bus_add_signal_watch;

/** */
alias gst_bus_add_signal_watch_full = c_gst_bus_add_signal_watch_full;

/** */
alias gst_bus_add_watch = c_gst_bus_add_watch;

/** */
alias gst_bus_add_watch_full = c_gst_bus_add_watch_full;

/** */
alias gst_bus_async_signal_func = c_gst_bus_async_signal_func;

/** */
alias gst_bus_create_watch = c_gst_bus_create_watch;

/** */
alias gst_bus_disable_sync_message_emission = c_gst_bus_disable_sync_message_emission;

/** */
alias gst_bus_enable_sync_message_emission = c_gst_bus_enable_sync_message_emission;

/** */
alias gst_bus_get_pollfd = c_gst_bus_get_pollfd;

/** */
alias gst_bus_have_pending = c_gst_bus_have_pending;

/** */
alias gst_bus_peek = c_gst_bus_peek;

/** */
alias gst_bus_poll = c_gst_bus_poll;

/** */
alias gst_bus_pop = c_gst_bus_pop;

/** */
alias gst_bus_pop_filtered = c_gst_bus_pop_filtered;

/** */
alias gst_bus_post = c_gst_bus_post;

/** */
alias gst_bus_remove_signal_watch = c_gst_bus_remove_signal_watch;

/** */
alias gst_bus_remove_watch = c_gst_bus_remove_watch;

/** */
alias gst_bus_set_flushing = c_gst_bus_set_flushing;

/** */
alias gst_bus_set_sync_handler = c_gst_bus_set_sync_handler;

/** */
alias gst_bus_sync_signal_handler = c_gst_bus_sync_signal_handler;

/** */
alias gst_bus_timed_pop = c_gst_bus_timed_pop;

/** */
alias gst_bus_timed_pop_filtered = c_gst_bus_timed_pop_filtered;

// Caps

/** */
alias gst_caps_get_type = c_gst_caps_get_type;

/** */
alias gst_caps_new_any = c_gst_caps_new_any;

/** */
alias gst_caps_new_empty = c_gst_caps_new_empty;

/** */
alias gst_caps_new_empty_simple = c_gst_caps_new_empty_simple;

/** */
alias gst_caps_new_full = c_gst_caps_new_full;

/** */
alias gst_caps_new_full_valist = c_gst_caps_new_full_valist;

/** */
alias gst_caps_new_id_str_empty_simple = c_gst_caps_new_id_str_empty_simple;

/** */
alias gst_caps_new_id_str_simple = c_gst_caps_new_id_str_simple;

/** */
alias gst_caps_new_simple = c_gst_caps_new_simple;

/** */
alias gst_caps_new_static_str_empty_simple = c_gst_caps_new_static_str_empty_simple;

/** */
alias gst_caps_new_static_str_simple = c_gst_caps_new_static_str_simple;

/** */
alias gst_caps_append = c_gst_caps_append;

/** */
alias gst_caps_append_structure = c_gst_caps_append_structure;

/** */
alias gst_caps_append_structure_full = c_gst_caps_append_structure_full;

/** */
alias gst_caps_can_intersect = c_gst_caps_can_intersect;

/** */
alias gst_caps_copy = c_gst_caps_copy;

/** */
alias gst_caps_copy_nth = c_gst_caps_copy_nth;

/** */
alias gst_caps_filter_and_map_in_place = c_gst_caps_filter_and_map_in_place;

/** */
alias gst_caps_fixate = c_gst_caps_fixate;

/** */
alias gst_caps_foreach = c_gst_caps_foreach;

/** */
alias gst_caps_get_features = c_gst_caps_get_features;

/** */
alias gst_caps_get_size = c_gst_caps_get_size;

/** */
alias gst_caps_get_structure = c_gst_caps_get_structure;

/** */
alias gst_caps_id_str_set_simple = c_gst_caps_id_str_set_simple;

/** */
alias gst_caps_id_str_set_simple_valist = c_gst_caps_id_str_set_simple_valist;

/** */
alias gst_caps_id_str_set_value = c_gst_caps_id_str_set_value;

/** */
alias gst_caps_intersect = c_gst_caps_intersect;

/** */
alias gst_caps_intersect_full = c_gst_caps_intersect_full;

/** */
alias gst_caps_is_always_compatible = c_gst_caps_is_always_compatible;

/** */
alias gst_caps_is_any = c_gst_caps_is_any;

/** */
alias gst_caps_is_empty = c_gst_caps_is_empty;

/** */
alias gst_caps_is_equal = c_gst_caps_is_equal;

/** */
alias gst_caps_is_equal_fixed = c_gst_caps_is_equal_fixed;

/** */
alias gst_caps_is_fixed = c_gst_caps_is_fixed;

/** */
alias gst_caps_is_strictly_equal = c_gst_caps_is_strictly_equal;

/** */
alias gst_caps_is_subset = c_gst_caps_is_subset;

/** */
alias gst_caps_is_subset_structure = c_gst_caps_is_subset_structure;

/** */
alias gst_caps_is_subset_structure_full = c_gst_caps_is_subset_structure_full;

/** */
alias gst_caps_is_writable = c_gst_caps_is_writable;

/** */
alias gst_caps_make_writable = c_gst_caps_make_writable;

/** */
alias gst_caps_map_in_place = c_gst_caps_map_in_place;

/** */
alias gst_caps_merge = c_gst_caps_merge;

/** */
alias gst_caps_merge_structure = c_gst_caps_merge_structure;

/** */
alias gst_caps_merge_structure_full = c_gst_caps_merge_structure_full;

/** */
alias gst_caps_normalize = c_gst_caps_normalize;

/** */
alias gst_caps_ref = c_gst_caps_ref;

/** */
alias gst_caps_remove_structure = c_gst_caps_remove_structure;

/** */
alias gst_caps_serialize = c_gst_caps_serialize;

/** */
alias gst_caps_set_features = c_gst_caps_set_features;

/** */
alias gst_caps_set_features_simple = c_gst_caps_set_features_simple;

/** */
alias gst_caps_set_simple = c_gst_caps_set_simple;

/** */
alias gst_caps_set_simple_static_str = c_gst_caps_set_simple_static_str;

/** */
alias gst_caps_set_simple_static_str_valist = c_gst_caps_set_simple_static_str_valist;

/** */
alias gst_caps_set_simple_valist = c_gst_caps_set_simple_valist;

/** */
alias gst_caps_set_value = c_gst_caps_set_value;

/** */
alias gst_caps_set_value_static_str = c_gst_caps_set_value_static_str;

/** */
alias gst_caps_simplify = c_gst_caps_simplify;

/** */
alias gst_caps_steal_structure = c_gst_caps_steal_structure;

/** */
alias gst_caps_subtract = c_gst_caps_subtract;

/** */
alias gst_caps_to_string = c_gst_caps_to_string;

/** */
alias gst_caps_truncate = c_gst_caps_truncate;

/** */
alias gst_caps_unref = c_gst_caps_unref;

/** */
alias gst_caps_from_string = c_gst_caps_from_string;

/** */
alias gst_caps_replace = c_gst_caps_replace;

/** */
alias gst_caps_steal = c_gst_caps_steal;

/** */
alias gst_caps_take = c_gst_caps_take;

// CapsFeatures

/** */
alias gst_caps_features_get_type = c_gst_caps_features_get_type;

/** */
alias gst_caps_features_new = c_gst_caps_features_new;

/** */
alias gst_caps_features_new_any = c_gst_caps_features_new_any;

/** */
alias gst_caps_features_new_empty = c_gst_caps_features_new_empty;

/** */
alias gst_caps_features_new_id = c_gst_caps_features_new_id;

/** */
alias gst_caps_features_new_id_str = c_gst_caps_features_new_id_str;

/** */
alias gst_caps_features_new_id_str_valist = c_gst_caps_features_new_id_str_valist;

/** */
alias gst_caps_features_new_id_valist = c_gst_caps_features_new_id_valist;

/** */
alias gst_caps_features_new_single = c_gst_caps_features_new_single;

/** */
alias gst_caps_features_new_single_static_str = c_gst_caps_features_new_single_static_str;

/** */
alias gst_caps_features_new_static_str = c_gst_caps_features_new_static_str;

/** */
alias gst_caps_features_new_static_str_valist = c_gst_caps_features_new_static_str_valist;

/** */
alias gst_caps_features_new_valist = c_gst_caps_features_new_valist;

/** */
alias gst_caps_features_add = c_gst_caps_features_add;

/** */
alias gst_caps_features_add_id = c_gst_caps_features_add_id;

/** */
alias gst_caps_features_add_id_str = c_gst_caps_features_add_id_str;

/** */
alias gst_caps_features_add_static_str = c_gst_caps_features_add_static_str;

/** */
alias gst_caps_features_contains = c_gst_caps_features_contains;

/** */
alias gst_caps_features_contains_id = c_gst_caps_features_contains_id;

/** */
alias gst_caps_features_contains_id_str = c_gst_caps_features_contains_id_str;

/** */
alias gst_caps_features_copy = c_gst_caps_features_copy;

/** */
alias gst_caps_features_free = c_gst_caps_features_free;

/** */
alias gst_caps_features_get_nth = c_gst_caps_features_get_nth;

/** */
alias gst_caps_features_get_nth_id = c_gst_caps_features_get_nth_id;

/** */
alias gst_caps_features_get_nth_id_str = c_gst_caps_features_get_nth_id_str;

/** */
alias gst_caps_features_get_size = c_gst_caps_features_get_size;

/** */
alias gst_caps_features_is_any = c_gst_caps_features_is_any;

/** */
alias gst_caps_features_is_equal = c_gst_caps_features_is_equal;

/** */
alias gst_caps_features_remove = c_gst_caps_features_remove;

/** */
alias gst_caps_features_remove_id = c_gst_caps_features_remove_id;

/** */
alias gst_caps_features_remove_id_str = c_gst_caps_features_remove_id_str;

/** */
alias gst_caps_features_set_parent_refcount = c_gst_caps_features_set_parent_refcount;

/** */
alias gst_caps_features_to_string = c_gst_caps_features_to_string;

/** */
alias gst_caps_features_from_string = c_gst_caps_features_from_string;

// ChildProxy

/** */
alias gst_child_proxy_get_type = c_gst_child_proxy_get_type;

/** */
alias gst_child_proxy_child_added = c_gst_child_proxy_child_added;

/** */
alias gst_child_proxy_child_removed = c_gst_child_proxy_child_removed;

/** */
alias gst_child_proxy_get = c_gst_child_proxy_get;

/** */
alias gst_child_proxy_get_child_by_index = c_gst_child_proxy_get_child_by_index;

/** */
alias gst_child_proxy_get_child_by_name = c_gst_child_proxy_get_child_by_name;

/** */
alias gst_child_proxy_get_child_by_name_recurse = c_gst_child_proxy_get_child_by_name_recurse;

/** */
alias gst_child_proxy_get_children_count = c_gst_child_proxy_get_children_count;

/** */
alias gst_child_proxy_get_property = c_gst_child_proxy_get_property;

/** */
alias gst_child_proxy_get_valist = c_gst_child_proxy_get_valist;

/** */
alias gst_child_proxy_lookup = c_gst_child_proxy_lookup;

/** */
alias gst_child_proxy_set = c_gst_child_proxy_set;

/** */
alias gst_child_proxy_set_property = c_gst_child_proxy_set_property;

/** */
alias gst_child_proxy_set_valist = c_gst_child_proxy_set_valist;

// Clock

/** */
alias gst_clock_get_type = c_gst_clock_get_type;

/** */
alias gst_clock_id_compare_func = c_gst_clock_id_compare_func;

/** */
alias gst_clock_id_get_clock = c_gst_clock_id_get_clock;

/** */
alias gst_clock_id_get_time = c_gst_clock_id_get_time;

/** */
alias gst_clock_id_ref = c_gst_clock_id_ref;

/** */
alias gst_clock_id_unref = c_gst_clock_id_unref;

/** */
alias gst_clock_id_unschedule = c_gst_clock_id_unschedule;

/** */
alias gst_clock_id_uses_clock = c_gst_clock_id_uses_clock;

/** */
alias gst_clock_id_wait = c_gst_clock_id_wait;

/** */
alias gst_clock_id_wait_async = c_gst_clock_id_wait_async;

/** */
alias gst_clock_add_observation = c_gst_clock_add_observation;

/** */
alias gst_clock_add_observation_unapplied = c_gst_clock_add_observation_unapplied;

/** */
alias gst_clock_adjust_unlocked = c_gst_clock_adjust_unlocked;

/** */
alias gst_clock_adjust_with_calibration = c_gst_clock_adjust_with_calibration;

/** */
alias gst_clock_get_calibration = c_gst_clock_get_calibration;

/** */
alias gst_clock_get_internal_time = c_gst_clock_get_internal_time;

/** */
alias gst_clock_get_master = c_gst_clock_get_master;

/** */
alias gst_clock_get_resolution = c_gst_clock_get_resolution;

/** */
alias gst_clock_get_time = c_gst_clock_get_time;

/** */
alias gst_clock_get_timeout = c_gst_clock_get_timeout;

/** */
alias gst_clock_is_synced = c_gst_clock_is_synced;

/** */
alias gst_clock_is_system_monotonic = c_gst_clock_is_system_monotonic;

/** */
alias gst_clock_new_periodic_id = c_gst_clock_new_periodic_id;

/** */
alias gst_clock_new_single_shot_id = c_gst_clock_new_single_shot_id;

/** */
alias gst_clock_periodic_id_reinit = c_gst_clock_periodic_id_reinit;

/** */
alias gst_clock_set_calibration = c_gst_clock_set_calibration;

/** */
alias gst_clock_set_master = c_gst_clock_set_master;

/** */
alias gst_clock_set_resolution = c_gst_clock_set_resolution;

/** */
alias gst_clock_set_synced = c_gst_clock_set_synced;

/** */
alias gst_clock_set_timeout = c_gst_clock_set_timeout;

/** */
alias gst_clock_single_shot_id_reinit = c_gst_clock_single_shot_id_reinit;

/** */
alias gst_clock_unadjust_unlocked = c_gst_clock_unadjust_unlocked;

/** */
alias gst_clock_unadjust_with_calibration = c_gst_clock_unadjust_with_calibration;

/** */
alias gst_clock_wait_for_sync = c_gst_clock_wait_for_sync;

// Context

/** */
alias gst_context_get_type = c_gst_context_get_type;

/** */
alias gst_context_new = c_gst_context_new;

/** */
alias gst_context_copy = c_gst_context_copy;

/** */
alias gst_context_get_context_type = c_gst_context_get_context_type;

/** */
alias gst_context_get_structure = c_gst_context_get_structure;

/** */
alias gst_context_get_task_pool = c_gst_context_get_task_pool;

/** */
alias gst_context_has_context_type = c_gst_context_has_context_type;

/** */
alias gst_context_is_persistent = c_gst_context_is_persistent;

/** */
alias gst_context_is_writable = c_gst_context_is_writable;

/** */
alias gst_context_make_writable = c_gst_context_make_writable;

/** */
alias gst_context_ref = c_gst_context_ref;

/** */
alias gst_context_set_task_pool = c_gst_context_set_task_pool;

/** */
alias gst_context_unref = c_gst_context_unref;

/** */
alias gst_context_writable_structure = c_gst_context_writable_structure;

/** */
alias gst_context_replace = c_gst_context_replace;

// ControlBinding

/** */
alias gst_control_binding_get_type = c_gst_control_binding_get_type;

/** */
alias gst_control_binding_get_g_value_array = c_gst_control_binding_get_g_value_array;

/** */
alias gst_control_binding_get_value = c_gst_control_binding_get_value;

/** */
alias gst_control_binding_get_value_array = c_gst_control_binding_get_value_array;

/** */
alias gst_control_binding_is_disabled = c_gst_control_binding_is_disabled;

/** */
alias gst_control_binding_set_disabled = c_gst_control_binding_set_disabled;

/** */
alias gst_control_binding_sync_values = c_gst_control_binding_sync_values;

// ControlSource

/** */
alias gst_control_source_get_type = c_gst_control_source_get_type;

/** */
alias gst_control_source_get_value = c_gst_control_source_get_value;

/** */
alias gst_control_source_get_value_array = c_gst_control_source_get_value_array;

// CustomMeta

/** */
alias gst_custom_meta_get_structure = c_gst_custom_meta_get_structure;

/** */
alias gst_custom_meta_has_name = c_gst_custom_meta_has_name;

// DateTime

/** */
alias gst_date_time_get_type = c_gst_date_time_get_type;

/** */
alias gst_date_time_new = c_gst_date_time_new;

/** */
alias gst_date_time_new_from_g_date_time = c_gst_date_time_new_from_g_date_time;

/** */
alias gst_date_time_new_from_iso8601_string = c_gst_date_time_new_from_iso8601_string;

/** */
alias gst_date_time_new_from_unix_epoch_local_time = c_gst_date_time_new_from_unix_epoch_local_time;

/** */
alias gst_date_time_new_from_unix_epoch_local_time_usecs = c_gst_date_time_new_from_unix_epoch_local_time_usecs;

/** */
alias gst_date_time_new_from_unix_epoch_utc = c_gst_date_time_new_from_unix_epoch_utc;

/** */
alias gst_date_time_new_from_unix_epoch_utc_usecs = c_gst_date_time_new_from_unix_epoch_utc_usecs;

/** */
alias gst_date_time_new_local_time = c_gst_date_time_new_local_time;

/** */
alias gst_date_time_new_now_local_time = c_gst_date_time_new_now_local_time;

/** */
alias gst_date_time_new_now_utc = c_gst_date_time_new_now_utc;

/** */
alias gst_date_time_new_y = c_gst_date_time_new_y;

/** */
alias gst_date_time_new_ym = c_gst_date_time_new_ym;

/** */
alias gst_date_time_new_ymd = c_gst_date_time_new_ymd;

/** */
alias gst_date_time_get_day = c_gst_date_time_get_day;

/** */
alias gst_date_time_get_hour = c_gst_date_time_get_hour;

/** */
alias gst_date_time_get_microsecond = c_gst_date_time_get_microsecond;

/** */
alias gst_date_time_get_minute = c_gst_date_time_get_minute;

/** */
alias gst_date_time_get_month = c_gst_date_time_get_month;

/** */
alias gst_date_time_get_second = c_gst_date_time_get_second;

/** */
alias gst_date_time_get_time_zone_offset = c_gst_date_time_get_time_zone_offset;

/** */
alias gst_date_time_get_year = c_gst_date_time_get_year;

/** */
alias gst_date_time_has_day = c_gst_date_time_has_day;

/** */
alias gst_date_time_has_month = c_gst_date_time_has_month;

/** */
alias gst_date_time_has_second = c_gst_date_time_has_second;

/** */
alias gst_date_time_has_time = c_gst_date_time_has_time;

/** */
alias gst_date_time_has_year = c_gst_date_time_has_year;

/** */
alias gst_date_time_ref = c_gst_date_time_ref;

/** */
alias gst_date_time_to_g_date_time = c_gst_date_time_to_g_date_time;

/** */
alias gst_date_time_to_iso8601_string = c_gst_date_time_to_iso8601_string;

/** */
alias gst_date_time_unref = c_gst_date_time_unref;

// DebugCategory

/** */
alias gst_debug_category_free = c_gst_debug_category_free;

/** */
alias gst_debug_category_get_color = c_gst_debug_category_get_color;

/** */
alias gst_debug_category_get_description = c_gst_debug_category_get_description;

/** */
alias gst_debug_category_get_name = c_gst_debug_category_get_name;

/** */
alias gst_debug_category_get_threshold = c_gst_debug_category_get_threshold;

/** */
alias gst_debug_category_reset_threshold = c_gst_debug_category_reset_threshold;

/** */
alias gst_debug_category_set_threshold = c_gst_debug_category_set_threshold;

// DebugMessage

/** */
alias gst_debug_message_get = c_gst_debug_message_get;

/** */
alias gst_debug_message_get_id = c_gst_debug_message_get_id;

// Device

/** */
alias gst_device_get_type = c_gst_device_get_type;

/** */
alias gst_device_create_element = c_gst_device_create_element;

/** */
alias gst_device_get_caps = c_gst_device_get_caps;

/** */
alias gst_device_get_device_class = c_gst_device_get_device_class;

/** */
alias gst_device_get_display_name = c_gst_device_get_display_name;

/** */
alias gst_device_get_properties = c_gst_device_get_properties;

/** */
alias gst_device_has_classes = c_gst_device_has_classes;

/** */
alias gst_device_has_classesv = c_gst_device_has_classesv;

/** */
alias gst_device_reconfigure_element = c_gst_device_reconfigure_element;

// DeviceMonitor

/** */
alias gst_device_monitor_get_type = c_gst_device_monitor_get_type;

/** */
alias gst_device_monitor_new = c_gst_device_monitor_new;

/** */
alias gst_device_monitor_add_filter = c_gst_device_monitor_add_filter;

/** */
alias gst_device_monitor_get_bus = c_gst_device_monitor_get_bus;

/** */
alias gst_device_monitor_get_devices = c_gst_device_monitor_get_devices;

/** */
alias gst_device_monitor_get_providers = c_gst_device_monitor_get_providers;

/** */
alias gst_device_monitor_get_show_all_devices = c_gst_device_monitor_get_show_all_devices;

/** */
alias gst_device_monitor_remove_filter = c_gst_device_monitor_remove_filter;

/** */
alias gst_device_monitor_set_show_all_devices = c_gst_device_monitor_set_show_all_devices;

/** */
alias gst_device_monitor_start = c_gst_device_monitor_start;

/** */
alias gst_device_monitor_stop = c_gst_device_monitor_stop;

// DeviceProvider

/** */
alias gst_device_provider_get_type = c_gst_device_provider_get_type;

/** */
alias gst_device_provider_register = c_gst_device_provider_register;

/** */
alias gst_device_provider_can_monitor = c_gst_device_provider_can_monitor;

/** */
alias gst_device_provider_device_add = c_gst_device_provider_device_add;

/** */
alias gst_device_provider_device_changed = c_gst_device_provider_device_changed;

/** */
alias gst_device_provider_device_remove = c_gst_device_provider_device_remove;

/** */
alias gst_device_provider_get_bus = c_gst_device_provider_get_bus;

/** */
alias gst_device_provider_get_devices = c_gst_device_provider_get_devices;

/** */
alias gst_device_provider_get_factory = c_gst_device_provider_get_factory;

/** */
alias gst_device_provider_get_hidden_providers = c_gst_device_provider_get_hidden_providers;

/** */
alias gst_device_provider_get_metadata = c_gst_device_provider_get_metadata;

/** */
alias gst_device_provider_hide_provider = c_gst_device_provider_hide_provider;

/** */
alias gst_device_provider_is_started = c_gst_device_provider_is_started;

/** */
alias gst_device_provider_start = c_gst_device_provider_start;

/** */
alias gst_device_provider_stop = c_gst_device_provider_stop;

/** */
alias gst_device_provider_unhide_provider = c_gst_device_provider_unhide_provider;

// DeviceProviderClass

/** */
alias gst_device_provider_class_add_metadata = c_gst_device_provider_class_add_metadata;

/** */
alias gst_device_provider_class_add_static_metadata = c_gst_device_provider_class_add_static_metadata;

/** */
alias gst_device_provider_class_get_metadata = c_gst_device_provider_class_get_metadata;

/** */
alias gst_device_provider_class_set_metadata = c_gst_device_provider_class_set_metadata;

/** */
alias gst_device_provider_class_set_static_metadata = c_gst_device_provider_class_set_static_metadata;

// DeviceProviderFactory

/** */
alias gst_device_provider_factory_get_type = c_gst_device_provider_factory_get_type;

/** */
alias gst_device_provider_factory_find = c_gst_device_provider_factory_find;

/** */
alias gst_device_provider_factory_get_by_name = c_gst_device_provider_factory_get_by_name;

/** */
alias gst_device_provider_factory_list_get_device_providers = c_gst_device_provider_factory_list_get_device_providers;

/** */
alias gst_device_provider_factory_get = c_gst_device_provider_factory_get;

/** */
alias gst_device_provider_factory_get_device_provider_type = c_gst_device_provider_factory_get_device_provider_type;

/** */
alias gst_device_provider_factory_get_metadata = c_gst_device_provider_factory_get_metadata;

/** */
alias gst_device_provider_factory_get_metadata_keys = c_gst_device_provider_factory_get_metadata_keys;

/** */
alias gst_device_provider_factory_has_classes = c_gst_device_provider_factory_has_classes;

/** */
alias gst_device_provider_factory_has_classesv = c_gst_device_provider_factory_has_classesv;

// DoubleRange

/** */
alias gst_double_range_get_type = c_gst_double_range_get_type;

// DynamicTypeFactory

/** */
alias gst_dynamic_type_factory_get_type = c_gst_dynamic_type_factory_get_type;

/** */
alias gst_dynamic_type_factory_load = c_gst_dynamic_type_factory_load;

// Element

/** */
alias gst_element_get_type = c_gst_element_get_type;

/** */
alias gst_element_make_from_uri = c_gst_element_make_from_uri;

/** */
alias gst_element_register = c_gst_element_register;

/** */
alias gst_element_state_change_return_get_name = c_gst_element_state_change_return_get_name;

/** */
alias gst_element_state_get_name = c_gst_element_state_get_name;

/** */
alias gst_element_type_set_skip_documentation = c_gst_element_type_set_skip_documentation;

/** */
alias gst_element_abort_state = c_gst_element_abort_state;

/** */
alias gst_element_add_pad = c_gst_element_add_pad;

/** */
alias gst_element_add_property_deep_notify_watch = c_gst_element_add_property_deep_notify_watch;

/** */
alias gst_element_add_property_notify_watch = c_gst_element_add_property_notify_watch;

/** */
alias gst_element_call_async = c_gst_element_call_async;

/** */
alias gst_element_change_state = c_gst_element_change_state;

/** */
alias gst_element_continue_state = c_gst_element_continue_state;

/** */
alias gst_element_create_all_pads = c_gst_element_create_all_pads;

/** */
alias gst_element_decorate_stream_id = c_gst_element_decorate_stream_id;

/** */
alias gst_element_decorate_stream_id_printf = c_gst_element_decorate_stream_id_printf;

/** */
alias gst_element_decorate_stream_id_printf_valist = c_gst_element_decorate_stream_id_printf_valist;

/** */
alias gst_element_foreach_pad = c_gst_element_foreach_pad;

/** */
alias gst_element_foreach_sink_pad = c_gst_element_foreach_sink_pad;

/** */
alias gst_element_foreach_src_pad = c_gst_element_foreach_src_pad;

/** */
alias gst_element_get_base_time = c_gst_element_get_base_time;

/** */
alias gst_element_get_bus = c_gst_element_get_bus;

/** */
alias gst_element_get_clock = c_gst_element_get_clock;

/** */
alias gst_element_get_compatible_pad = c_gst_element_get_compatible_pad;

/** */
alias gst_element_get_compatible_pad_template = c_gst_element_get_compatible_pad_template;

/** */
alias gst_element_get_context = c_gst_element_get_context;

/** */
alias gst_element_get_context_unlocked = c_gst_element_get_context_unlocked;

/** */
alias gst_element_get_contexts = c_gst_element_get_contexts;

/** */
alias gst_element_get_current_clock_time = c_gst_element_get_current_clock_time;

/** */
alias gst_element_get_current_running_time = c_gst_element_get_current_running_time;

/** */
alias gst_element_get_factory = c_gst_element_get_factory;

/** */
alias gst_element_get_metadata = c_gst_element_get_metadata;

/** */
alias gst_element_get_pad_template = c_gst_element_get_pad_template;

/** */
alias gst_element_get_pad_template_list = c_gst_element_get_pad_template_list;

/** */
alias gst_element_get_request_pad = c_gst_element_get_request_pad;

/** */
alias gst_element_get_start_time = c_gst_element_get_start_time;

/** */
alias gst_element_get_state = c_gst_element_get_state;

/** */
alias gst_element_get_static_pad = c_gst_element_get_static_pad;

/** */
alias gst_element_is_locked_state = c_gst_element_is_locked_state;

/** */
alias gst_element_iterate_pads = c_gst_element_iterate_pads;

/** */
alias gst_element_iterate_sink_pads = c_gst_element_iterate_sink_pads;

/** */
alias gst_element_iterate_src_pads = c_gst_element_iterate_src_pads;

/** */
alias gst_element_link = c_gst_element_link;

/** */
alias gst_element_link_filtered = c_gst_element_link_filtered;

/** */
alias gst_element_link_many = c_gst_element_link_many;

/** */
alias gst_element_link_pads = c_gst_element_link_pads;

/** */
alias gst_element_link_pads_filtered = c_gst_element_link_pads_filtered;

/** */
alias gst_element_link_pads_full = c_gst_element_link_pads_full;

/** */
alias gst_element_lost_state = c_gst_element_lost_state;

/** */
alias gst_element_message_full = c_gst_element_message_full;

/** */
alias gst_element_message_full_with_details = c_gst_element_message_full_with_details;

/** */
alias gst_element_no_more_pads = c_gst_element_no_more_pads;

/** */
alias gst_element_post_message = c_gst_element_post_message;

/** */
alias gst_element_provide_clock = c_gst_element_provide_clock;

/** */
alias gst_element_query = c_gst_element_query;

/** */
alias gst_element_query_convert = c_gst_element_query_convert;

/** */
alias gst_element_query_duration = c_gst_element_query_duration;

/** */
alias gst_element_query_position = c_gst_element_query_position;

/** */
alias gst_element_release_request_pad = c_gst_element_release_request_pad;

/** */
alias gst_element_remove_pad = c_gst_element_remove_pad;

/** */
alias gst_element_remove_property_notify_watch = c_gst_element_remove_property_notify_watch;

/** */
alias gst_element_request_pad = c_gst_element_request_pad;

/** */
alias gst_element_request_pad_simple = c_gst_element_request_pad_simple;

/** */
alias gst_element_seek = c_gst_element_seek;

/** */
alias gst_element_seek_simple = c_gst_element_seek_simple;

/** */
alias gst_element_send_event = c_gst_element_send_event;

/** */
alias gst_element_set_base_time = c_gst_element_set_base_time;

/** */
alias gst_element_set_bus = c_gst_element_set_bus;

/** */
alias gst_element_set_clock = c_gst_element_set_clock;

/** */
alias gst_element_set_context = c_gst_element_set_context;

/** */
alias gst_element_set_locked_state = c_gst_element_set_locked_state;

/** */
alias gst_element_set_start_time = c_gst_element_set_start_time;

/** */
alias gst_element_set_state = c_gst_element_set_state;

/** */
alias gst_element_sync_state_with_parent = c_gst_element_sync_state_with_parent;

/** */
alias gst_element_unlink = c_gst_element_unlink;

/** */
alias gst_element_unlink_many = c_gst_element_unlink_many;

/** */
alias gst_element_unlink_pads = c_gst_element_unlink_pads;

// ElementClass

/** */
alias gst_element_class_add_metadata = c_gst_element_class_add_metadata;

/** */
alias gst_element_class_add_pad_template = c_gst_element_class_add_pad_template;

/** */
alias gst_element_class_add_static_metadata = c_gst_element_class_add_static_metadata;

/** */
alias gst_element_class_add_static_pad_template = c_gst_element_class_add_static_pad_template;

/** */
alias gst_element_class_add_static_pad_template_with_gtype = c_gst_element_class_add_static_pad_template_with_gtype;

/** */
alias gst_element_class_get_metadata = c_gst_element_class_get_metadata;

/** */
alias gst_element_class_get_pad_template = c_gst_element_class_get_pad_template;

/** */
alias gst_element_class_get_pad_template_list = c_gst_element_class_get_pad_template_list;

/** */
alias gst_element_class_set_metadata = c_gst_element_class_set_metadata;

/** */
alias gst_element_class_set_static_metadata = c_gst_element_class_set_static_metadata;

// ElementFactory

/** */
alias gst_element_factory_get_type = c_gst_element_factory_get_type;

/** */
alias gst_element_factory_find = c_gst_element_factory_find;

/** */
alias gst_element_factory_list_filter = c_gst_element_factory_list_filter;

/** */
alias gst_element_factory_list_get_elements = c_gst_element_factory_list_get_elements;

/** */
alias gst_element_factory_make = c_gst_element_factory_make;

/** */
alias gst_element_factory_make_full = c_gst_element_factory_make_full;

/** */
alias gst_element_factory_make_valist = c_gst_element_factory_make_valist;

/** */
alias gst_element_factory_make_with_properties = c_gst_element_factory_make_with_properties;

/** */
alias gst_element_factory_can_sink_all_caps = c_gst_element_factory_can_sink_all_caps;

/** */
alias gst_element_factory_can_sink_any_caps = c_gst_element_factory_can_sink_any_caps;

/** */
alias gst_element_factory_can_src_all_caps = c_gst_element_factory_can_src_all_caps;

/** */
alias gst_element_factory_can_src_any_caps = c_gst_element_factory_can_src_any_caps;

/** */
alias gst_element_factory_create = c_gst_element_factory_create;

/** */
alias gst_element_factory_create_full = c_gst_element_factory_create_full;

/** */
alias gst_element_factory_create_valist = c_gst_element_factory_create_valist;

/** */
alias gst_element_factory_create_with_properties = c_gst_element_factory_create_with_properties;

/** */
alias gst_element_factory_get_element_type = c_gst_element_factory_get_element_type;

/** */
alias gst_element_factory_get_metadata = c_gst_element_factory_get_metadata;

/** */
alias gst_element_factory_get_metadata_keys = c_gst_element_factory_get_metadata_keys;

/** */
alias gst_element_factory_get_num_pad_templates = c_gst_element_factory_get_num_pad_templates;

/** */
alias gst_element_factory_get_skip_documentation = c_gst_element_factory_get_skip_documentation;

/** */
alias gst_element_factory_get_static_pad_templates = c_gst_element_factory_get_static_pad_templates;

/** */
alias gst_element_factory_get_uri_protocols = c_gst_element_factory_get_uri_protocols;

/** */
alias gst_element_factory_get_uri_type = c_gst_element_factory_get_uri_type;

/** */
alias gst_element_factory_has_interface = c_gst_element_factory_has_interface;

/** */
alias gst_element_factory_list_is_type = c_gst_element_factory_list_is_type;

// Event

/** */
alias gst_event_get_type = c_gst_event_get_type;

/** */
alias gst_event_new_buffer_size = c_gst_event_new_buffer_size;

/** */
alias gst_event_new_caps = c_gst_event_new_caps;

/** */
alias gst_event_new_custom = c_gst_event_new_custom;

/** */
alias gst_event_new_eos = c_gst_event_new_eos;

/** */
alias gst_event_new_flush_start = c_gst_event_new_flush_start;

/** */
alias gst_event_new_flush_stop = c_gst_event_new_flush_stop;

/** */
alias gst_event_new_gap = c_gst_event_new_gap;

/** */
alias gst_event_new_instant_rate_change = c_gst_event_new_instant_rate_change;

/** */
alias gst_event_new_instant_rate_sync_time = c_gst_event_new_instant_rate_sync_time;

/** */
alias gst_event_new_latency = c_gst_event_new_latency;

/** */
alias gst_event_new_navigation = c_gst_event_new_navigation;

/** */
alias gst_event_new_protection = c_gst_event_new_protection;

/** */
alias gst_event_new_qos = c_gst_event_new_qos;

/** */
alias gst_event_new_reconfigure = c_gst_event_new_reconfigure;

/** */
alias gst_event_new_seek = c_gst_event_new_seek;

/** */
alias gst_event_new_segment = c_gst_event_new_segment;

/** */
alias gst_event_new_segment_done = c_gst_event_new_segment_done;

/** */
alias gst_event_new_select_streams = c_gst_event_new_select_streams;

/** */
alias gst_event_new_sink_message = c_gst_event_new_sink_message;

/** */
alias gst_event_new_step = c_gst_event_new_step;

/** */
alias gst_event_new_stream_collection = c_gst_event_new_stream_collection;

/** */
alias gst_event_new_stream_group_done = c_gst_event_new_stream_group_done;

/** */
alias gst_event_new_stream_start = c_gst_event_new_stream_start;

/** */
alias gst_event_new_tag = c_gst_event_new_tag;

/** */
alias gst_event_new_toc = c_gst_event_new_toc;

/** */
alias gst_event_new_toc_select = c_gst_event_new_toc_select;

/** */
alias gst_event_copy = c_gst_event_copy;

/** */
alias gst_event_copy_segment = c_gst_event_copy_segment;

/** */
alias gst_event_get_running_time_offset = c_gst_event_get_running_time_offset;

/** */
alias gst_event_get_seqnum = c_gst_event_get_seqnum;

/** */
alias gst_event_get_structure = c_gst_event_get_structure;

/** */
alias gst_event_has_name = c_gst_event_has_name;

/** */
alias gst_event_has_name_id = c_gst_event_has_name_id;

/** */
alias gst_event_is_writable = c_gst_event_is_writable;

/** */
alias gst_event_make_writable = c_gst_event_make_writable;

/** */
alias gst_event_parse_buffer_size = c_gst_event_parse_buffer_size;

/** */
alias gst_event_parse_caps = c_gst_event_parse_caps;

/** */
alias gst_event_parse_flush_stop = c_gst_event_parse_flush_stop;

/** */
alias gst_event_parse_gap = c_gst_event_parse_gap;

/** */
alias gst_event_parse_gap_flags = c_gst_event_parse_gap_flags;

/** */
alias gst_event_parse_group_id = c_gst_event_parse_group_id;

/** */
alias gst_event_parse_instant_rate_change = c_gst_event_parse_instant_rate_change;

/** */
alias gst_event_parse_instant_rate_sync_time = c_gst_event_parse_instant_rate_sync_time;

/** */
alias gst_event_parse_latency = c_gst_event_parse_latency;

/** */
alias gst_event_parse_protection = c_gst_event_parse_protection;

/** */
alias gst_event_parse_qos = c_gst_event_parse_qos;

/** */
alias gst_event_parse_seek = c_gst_event_parse_seek;

/** */
alias gst_event_parse_seek_trickmode_interval = c_gst_event_parse_seek_trickmode_interval;

/** */
alias gst_event_parse_segment = c_gst_event_parse_segment;

/** */
alias gst_event_parse_segment_done = c_gst_event_parse_segment_done;

/** */
alias gst_event_parse_select_streams = c_gst_event_parse_select_streams;

/** */
alias gst_event_parse_sink_message = c_gst_event_parse_sink_message;

/** */
alias gst_event_parse_step = c_gst_event_parse_step;

/** */
alias gst_event_parse_stream = c_gst_event_parse_stream;

/** */
alias gst_event_parse_stream_collection = c_gst_event_parse_stream_collection;

/** */
alias gst_event_parse_stream_flags = c_gst_event_parse_stream_flags;

/** */
alias gst_event_parse_stream_group_done = c_gst_event_parse_stream_group_done;

/** */
alias gst_event_parse_stream_start = c_gst_event_parse_stream_start;

/** */
alias gst_event_parse_tag = c_gst_event_parse_tag;

/** */
alias gst_event_parse_toc = c_gst_event_parse_toc;

/** */
alias gst_event_parse_toc_select = c_gst_event_parse_toc_select;

/** */
alias gst_event_ref = c_gst_event_ref;

/** */
alias gst_event_set_gap_flags = c_gst_event_set_gap_flags;

/** */
alias gst_event_set_group_id = c_gst_event_set_group_id;

/** */
alias gst_event_set_running_time_offset = c_gst_event_set_running_time_offset;

/** */
alias gst_event_set_seek_trickmode_interval = c_gst_event_set_seek_trickmode_interval;

/** */
alias gst_event_set_seqnum = c_gst_event_set_seqnum;

/** */
alias gst_event_set_stream = c_gst_event_set_stream;

/** */
alias gst_event_set_stream_flags = c_gst_event_set_stream_flags;

/** */
alias gst_event_unref = c_gst_event_unref;

/** */
alias gst_event_writable_structure = c_gst_event_writable_structure;

/** */
alias gst_event_replace = c_gst_event_replace;

/** */
alias gst_event_steal = c_gst_event_steal;

/** */
alias gst_event_take = c_gst_event_take;

// FlagSet

/** */
alias gst_flagset_get_type = c_gst_flagset_get_type;

/** */
alias gst_flagset_register = c_gst_flagset_register;

// Fraction

/** */
alias gst_fraction_get_type = c_gst_fraction_get_type;

// FractionRange

/** */
alias gst_fraction_range_get_type = c_gst_fraction_range_get_type;

// GhostPad

/** */
alias gst_ghost_pad_get_type = c_gst_ghost_pad_get_type;

/** */
alias gst_ghost_pad_new = c_gst_ghost_pad_new;

/** */
alias gst_ghost_pad_new_from_template = c_gst_ghost_pad_new_from_template;

/** */
alias gst_ghost_pad_new_no_target = c_gst_ghost_pad_new_no_target;

/** */
alias gst_ghost_pad_new_no_target_from_template = c_gst_ghost_pad_new_no_target_from_template;

/** */
alias gst_ghost_pad_activate_mode_default = c_gst_ghost_pad_activate_mode_default;

/** */
alias gst_ghost_pad_internal_activate_mode_default = c_gst_ghost_pad_internal_activate_mode_default;

/** */
alias gst_ghost_pad_construct = c_gst_ghost_pad_construct;

/** */
alias gst_ghost_pad_get_target = c_gst_ghost_pad_get_target;

/** */
alias gst_ghost_pad_set_target = c_gst_ghost_pad_set_target;

// IdStr

/** */
alias gst_id_str_get_type = c_gst_id_str_get_type;

/** */
alias gst_id_str_new = c_gst_id_str_new;

/** */
alias gst_id_str_as_str = c_gst_id_str_as_str;

/** */
alias gst_id_str_clear = c_gst_id_str_clear;

/** */
alias gst_id_str_copy = c_gst_id_str_copy;

/** */
alias gst_id_str_copy_into = c_gst_id_str_copy_into;

/** */
alias gst_id_str_free = c_gst_id_str_free;

/** */
alias gst_id_str_get_len = c_gst_id_str_get_len;

/** */
alias gst_id_str_init = c_gst_id_str_init;

/** */
alias gst_id_str_is_equal = c_gst_id_str_is_equal;

/** */
alias gst_id_str_is_equal_to_str = c_gst_id_str_is_equal_to_str;

/** */
alias gst_id_str_is_equal_to_str_with_len = c_gst_id_str_is_equal_to_str_with_len;

/** */
alias gst_id_str_move = c_gst_id_str_move;

/** */
alias gst_id_str_set = c_gst_id_str_set;

/** */
alias gst_id_str_set_static_str = c_gst_id_str_set_static_str;

/** */
alias gst_id_str_set_static_str_with_len = c_gst_id_str_set_static_str_with_len;

/** */
alias gst_id_str_set_with_len = c_gst_id_str_set_with_len;

// Int64Range

/** */
alias gst_int64_range_get_type = c_gst_int64_range_get_type;

// IntRange

/** */
alias gst_int_range_get_type = c_gst_int_range_get_type;

// Iterator

/** */
alias gst_iterator_get_type = c_gst_iterator_get_type;

/** */
alias gst_iterator_new = c_gst_iterator_new;

/** */
alias gst_iterator_new_list = c_gst_iterator_new_list;

/** */
alias gst_iterator_new_single = c_gst_iterator_new_single;

/** */
alias gst_iterator_copy = c_gst_iterator_copy;

/** */
alias gst_iterator_filter = c_gst_iterator_filter;

/** */
alias gst_iterator_find_custom = c_gst_iterator_find_custom;

/** */
alias gst_iterator_fold = c_gst_iterator_fold;

/** */
alias gst_iterator_foreach = c_gst_iterator_foreach;

/** */
alias gst_iterator_free = c_gst_iterator_free;

/** */
alias gst_iterator_next = c_gst_iterator_next;

/** */
alias gst_iterator_push = c_gst_iterator_push;

/** */
alias gst_iterator_resync = c_gst_iterator_resync;

// LogContext

/** */
alias gst_log_context_free = c_gst_log_context_free;

/** */
alias gst_log_context_get_category = c_gst_log_context_get_category;

/** */
alias gst_log_context_reset = c_gst_log_context_reset;

// LogContextBuilder

/** */
alias gst_log_context_builder_build = c_gst_log_context_builder_build;

/** */
alias gst_log_context_builder_set_category = c_gst_log_context_builder_set_category;

/** */
alias gst_log_context_builder_set_hash_flags = c_gst_log_context_builder_set_hash_flags;

/** */
alias gst_log_context_builder_set_interval = c_gst_log_context_builder_set_interval;

/** */
alias gst_log_context_builder_new = c_gst_log_context_builder_new;

// MapInfo

/** */
alias gst_map_info_clear = c_gst_map_info_clear;

/** */
alias gst_map_info_get_data = c_gst_map_info_get_data;

/** */
alias gst_map_info_init = c_gst_map_info_init;

// Memory

/** */
alias gst_memory_get_type = c_gst_memory_get_type;

/** */
alias gst_memory_new_wrapped = c_gst_memory_new_wrapped;

/** */
alias gst_memory_copy = c_gst_memory_copy;

/** */
alias gst_memory_get_sizes = c_gst_memory_get_sizes;

/** */
alias gst_memory_init = c_gst_memory_init;

/** */
alias gst_memory_is_span = c_gst_memory_is_span;

/** */
alias gst_memory_is_type = c_gst_memory_is_type;

/** */
alias gst_memory_is_writable = c_gst_memory_is_writable;

/** */
alias gst_memory_make_mapped = c_gst_memory_make_mapped;

/** */
alias gst_memory_make_writable = c_gst_memory_make_writable;

/** */
alias gst_memory_map = c_gst_memory_map;

/** */
alias gst_memory_ref = c_gst_memory_ref;

/** */
alias gst_memory_resize = c_gst_memory_resize;

/** */
alias gst_memory_share = c_gst_memory_share;

/** */
alias gst_memory_unmap = c_gst_memory_unmap;

/** */
alias gst_memory_unref = c_gst_memory_unref;

/** */
alias gst_memory_replace = c_gst_memory_replace;

/** */
alias gst_memory_steal = c_gst_memory_steal;

/** */
alias gst_memory_take = c_gst_memory_take;

// Message

/** */
alias gst_message_get_type = c_gst_message_get_type;

/** */
alias gst_message_new_application = c_gst_message_new_application;

/** */
alias gst_message_new_async_done = c_gst_message_new_async_done;

/** */
alias gst_message_new_async_start = c_gst_message_new_async_start;

/** */
alias gst_message_new_buffering = c_gst_message_new_buffering;

/** */
alias gst_message_new_clock_lost = c_gst_message_new_clock_lost;

/** */
alias gst_message_new_clock_provide = c_gst_message_new_clock_provide;

/** */
alias gst_message_new_custom = c_gst_message_new_custom;

/** */
alias gst_message_new_device_added = c_gst_message_new_device_added;

/** */
alias gst_message_new_device_changed = c_gst_message_new_device_changed;

/** */
alias gst_message_new_device_monitor_started = c_gst_message_new_device_monitor_started;

/** */
alias gst_message_new_device_removed = c_gst_message_new_device_removed;

/** */
alias gst_message_new_duration_changed = c_gst_message_new_duration_changed;

/** */
alias gst_message_new_element = c_gst_message_new_element;

/** */
alias gst_message_new_eos = c_gst_message_new_eos;

/** */
alias gst_message_new_error = c_gst_message_new_error;

/** */
alias gst_message_new_error_with_details = c_gst_message_new_error_with_details;

/** */
alias gst_message_new_have_context = c_gst_message_new_have_context;

/** */
alias gst_message_new_info = c_gst_message_new_info;

/** */
alias gst_message_new_info_with_details = c_gst_message_new_info_with_details;

/** */
alias gst_message_new_instant_rate_request = c_gst_message_new_instant_rate_request;

/** */
alias gst_message_new_latency = c_gst_message_new_latency;

/** */
alias gst_message_new_need_context = c_gst_message_new_need_context;

/** */
alias gst_message_new_new_clock = c_gst_message_new_new_clock;

/** */
alias gst_message_new_progress = c_gst_message_new_progress;

/** */
alias gst_message_new_property_notify = c_gst_message_new_property_notify;

/** */
alias gst_message_new_qos = c_gst_message_new_qos;

/** */
alias gst_message_new_redirect = c_gst_message_new_redirect;

/** */
alias gst_message_new_request_state = c_gst_message_new_request_state;

/** */
alias gst_message_new_reset_time = c_gst_message_new_reset_time;

/** */
alias gst_message_new_segment_done = c_gst_message_new_segment_done;

/** */
alias gst_message_new_segment_start = c_gst_message_new_segment_start;

/** */
alias gst_message_new_state_changed = c_gst_message_new_state_changed;

/** */
alias gst_message_new_state_dirty = c_gst_message_new_state_dirty;

/** */
alias gst_message_new_step_done = c_gst_message_new_step_done;

/** */
alias gst_message_new_step_start = c_gst_message_new_step_start;

/** */
alias gst_message_new_stream_collection = c_gst_message_new_stream_collection;

/** */
alias gst_message_new_stream_start = c_gst_message_new_stream_start;

/** */
alias gst_message_new_stream_status = c_gst_message_new_stream_status;

/** */
alias gst_message_new_streams_selected = c_gst_message_new_streams_selected;

/** */
alias gst_message_new_structure_change = c_gst_message_new_structure_change;

/** */
alias gst_message_new_tag = c_gst_message_new_tag;

/** */
alias gst_message_new_toc = c_gst_message_new_toc;

/** */
alias gst_message_new_warning = c_gst_message_new_warning;

/** */
alias gst_message_new_warning_with_details = c_gst_message_new_warning_with_details;

/** */
alias gst_message_add_redirect_entry = c_gst_message_add_redirect_entry;

/** */
alias gst_message_copy = c_gst_message_copy;

/** */
alias gst_message_get_details = c_gst_message_get_details;

/** */
alias gst_message_get_num_redirect_entries = c_gst_message_get_num_redirect_entries;

/** */
alias gst_message_get_seqnum = c_gst_message_get_seqnum;

/** */
alias gst_message_get_stream_status_object = c_gst_message_get_stream_status_object;

/** */
alias gst_message_get_structure = c_gst_message_get_structure;

/** */
alias gst_message_has_name = c_gst_message_has_name;

/** */
alias gst_message_is_writable = c_gst_message_is_writable;

/** */
alias gst_message_make_writable = c_gst_message_make_writable;

/** */
alias gst_message_parse_async_done = c_gst_message_parse_async_done;

/** */
alias gst_message_parse_buffering = c_gst_message_parse_buffering;

/** */
alias gst_message_parse_buffering_stats = c_gst_message_parse_buffering_stats;

/** */
alias gst_message_parse_clock_lost = c_gst_message_parse_clock_lost;

/** */
alias gst_message_parse_clock_provide = c_gst_message_parse_clock_provide;

/** */
alias gst_message_parse_context_type = c_gst_message_parse_context_type;

/** */
alias gst_message_parse_device_added = c_gst_message_parse_device_added;

/** */
alias gst_message_parse_device_changed = c_gst_message_parse_device_changed;

/** */
alias gst_message_parse_device_monitor_started = c_gst_message_parse_device_monitor_started;

/** */
alias gst_message_parse_device_removed = c_gst_message_parse_device_removed;

/** */
alias gst_message_parse_error = c_gst_message_parse_error;

/** */
alias gst_message_parse_error_details = c_gst_message_parse_error_details;

/** */
alias gst_message_parse_error_writable_details = c_gst_message_parse_error_writable_details;

/** */
alias gst_message_parse_group_id = c_gst_message_parse_group_id;

/** */
alias gst_message_parse_have_context = c_gst_message_parse_have_context;

/** */
alias gst_message_parse_info = c_gst_message_parse_info;

/** */
alias gst_message_parse_info_details = c_gst_message_parse_info_details;

/** */
alias gst_message_parse_info_writable_details = c_gst_message_parse_info_writable_details;

/** */
alias gst_message_parse_instant_rate_request = c_gst_message_parse_instant_rate_request;

/** */
alias gst_message_parse_new_clock = c_gst_message_parse_new_clock;

/** */
alias gst_message_parse_progress = c_gst_message_parse_progress;

/** */
alias gst_message_parse_property_notify = c_gst_message_parse_property_notify;

/** */
alias gst_message_parse_qos = c_gst_message_parse_qos;

/** */
alias gst_message_parse_qos_stats = c_gst_message_parse_qos_stats;

/** */
alias gst_message_parse_qos_values = c_gst_message_parse_qos_values;

/** */
alias gst_message_parse_redirect_entry = c_gst_message_parse_redirect_entry;

/** */
alias gst_message_parse_request_state = c_gst_message_parse_request_state;

/** */
alias gst_message_parse_reset_time = c_gst_message_parse_reset_time;

/** */
alias gst_message_parse_segment_done = c_gst_message_parse_segment_done;

/** */
alias gst_message_parse_segment_start = c_gst_message_parse_segment_start;

/** */
alias gst_message_parse_state_changed = c_gst_message_parse_state_changed;

/** */
alias gst_message_parse_step_done = c_gst_message_parse_step_done;

/** */
alias gst_message_parse_step_start = c_gst_message_parse_step_start;

/** */
alias gst_message_parse_stream_collection = c_gst_message_parse_stream_collection;

/** */
alias gst_message_parse_stream_status = c_gst_message_parse_stream_status;

/** */
alias gst_message_parse_streams_selected = c_gst_message_parse_streams_selected;

/** */
alias gst_message_parse_structure_change = c_gst_message_parse_structure_change;

/** */
alias gst_message_parse_tag = c_gst_message_parse_tag;

/** */
alias gst_message_parse_toc = c_gst_message_parse_toc;

/** */
alias gst_message_parse_warning = c_gst_message_parse_warning;

/** */
alias gst_message_parse_warning_details = c_gst_message_parse_warning_details;

/** */
alias gst_message_parse_warning_writable_details = c_gst_message_parse_warning_writable_details;

/** */
alias gst_message_ref = c_gst_message_ref;

/** */
alias gst_message_set_buffering_stats = c_gst_message_set_buffering_stats;

/** */
alias gst_message_set_details = c_gst_message_set_details;

/** */
alias gst_message_set_group_id = c_gst_message_set_group_id;

/** */
alias gst_message_set_qos_stats = c_gst_message_set_qos_stats;

/** */
alias gst_message_set_qos_values = c_gst_message_set_qos_values;

/** */
alias gst_message_set_seqnum = c_gst_message_set_seqnum;

/** */
alias gst_message_set_stream_status_object = c_gst_message_set_stream_status_object;

/** */
alias gst_message_streams_selected_add = c_gst_message_streams_selected_add;

/** */
alias gst_message_streams_selected_get_size = c_gst_message_streams_selected_get_size;

/** */
alias gst_message_streams_selected_get_stream = c_gst_message_streams_selected_get_stream;

/** */
alias gst_message_unref = c_gst_message_unref;

/** */
alias gst_message_writable_details = c_gst_message_writable_details;

/** */
alias gst_message_writable_structure = c_gst_message_writable_structure;

/** */
alias gst_message_replace = c_gst_message_replace;

/** */
alias gst_message_steal = c_gst_message_steal;

/** */
alias gst_message_take = c_gst_message_take;

// Meta

/** */
alias gst_meta_compare_seqnum = c_gst_meta_compare_seqnum;

/** */
alias gst_meta_get_seqnum = c_gst_meta_get_seqnum;

/** */
alias gst_meta_serialize = c_gst_meta_serialize;

/** */
alias gst_meta_serialize_simple = c_gst_meta_serialize_simple;

/** */
alias gst_meta_api_type_aggregate_params = c_gst_meta_api_type_aggregate_params;

/** */
alias gst_meta_api_type_get_tags = c_gst_meta_api_type_get_tags;

/** */
alias gst_meta_api_type_has_tag = c_gst_meta_api_type_has_tag;

/** */
alias gst_meta_api_type_register = c_gst_meta_api_type_register;

/** */
alias gst_meta_api_type_set_params_aggregator = c_gst_meta_api_type_set_params_aggregator;

/** */
alias gst_meta_api_type_tags_contain_only = c_gst_meta_api_type_tags_contain_only;

/** */
alias gst_meta_deserialize = c_gst_meta_deserialize;

/** */
alias gst_meta_get_info = c_gst_meta_get_info;

/** */
alias gst_meta_register = c_gst_meta_register;

/** */
alias gst_meta_register_custom = c_gst_meta_register_custom;

/** */
alias gst_meta_register_custom_simple = c_gst_meta_register_custom_simple;

// MetaFactory

/** */
alias gst_meta_factory_get_type = c_gst_meta_factory_get_type;

/** */
alias gst_meta_factory_load = c_gst_meta_factory_load;

/** */
alias gst_meta_factory_register = c_gst_meta_factory_register;

// MetaInfo

/** */
alias gst_meta_info_is_custom = c_gst_meta_info_is_custom;

/** */
alias gst_meta_info_register = c_gst_meta_info_register;

/** */
alias gst_meta_info_new = c_gst_meta_info_new;

// MiniObject

/** */
alias gst_mini_object_get_type = c_gst_mini_object_get_type;

/** */
alias gst_mini_object_add_parent = c_gst_mini_object_add_parent;

/** */
alias gst_mini_object_copy = c_gst_mini_object_copy;

/** */
alias gst_mini_object_get_qdata = c_gst_mini_object_get_qdata;

/** */
alias gst_mini_object_init = c_gst_mini_object_init;

/** */
alias gst_mini_object_is_writable = c_gst_mini_object_is_writable;

/** */
alias gst_mini_object_lock = c_gst_mini_object_lock;

/** */
alias gst_mini_object_make_writable = c_gst_mini_object_make_writable;

/** */
alias gst_mini_object_ref = c_gst_mini_object_ref;

/** */
alias gst_mini_object_remove_parent = c_gst_mini_object_remove_parent;

/** */
alias gst_mini_object_set_qdata = c_gst_mini_object_set_qdata;

/** */
alias gst_mini_object_steal_qdata = c_gst_mini_object_steal_qdata;

/** */
alias gst_mini_object_unlock = c_gst_mini_object_unlock;

/** */
alias gst_mini_object_unref = c_gst_mini_object_unref;

/** */
alias gst_mini_object_weak_ref = c_gst_mini_object_weak_ref;

/** */
alias gst_mini_object_weak_unref = c_gst_mini_object_weak_unref;

/** */
alias gst_mini_object_replace = c_gst_mini_object_replace;

/** */
alias gst_mini_object_steal = c_gst_mini_object_steal;

/** */
alias gst_mini_object_take = c_gst_mini_object_take;

// ObjectWrap

/** */
alias gst_object_get_type = c_gst_object_get_type;

/** */
alias gst_object_check_uniqueness = c_gst_object_check_uniqueness;

/** */
alias gst_object_default_deep_notify = c_gst_object_default_deep_notify;

/** */
alias gst_object_ref_sink = c_gst_object_ref_sink;

/** */
alias gst_object_replace = c_gst_object_replace;

/** */
alias gst_object_add_control_binding = c_gst_object_add_control_binding;

/** */
alias gst_object_call_async = c_gst_object_call_async;

/** */
alias gst_object_default_error = c_gst_object_default_error;

/** */
alias gst_object_get_control_binding = c_gst_object_get_control_binding;

/** */
alias gst_object_get_control_rate = c_gst_object_get_control_rate;

/** */
alias gst_object_get_g_value_array = c_gst_object_get_g_value_array;

/** */
alias gst_object_get_name = c_gst_object_get_name;

/** */
alias gst_object_get_parent = c_gst_object_get_parent;

/** */
alias gst_object_get_path_string = c_gst_object_get_path_string;

/** */
alias gst_object_get_toplevel = c_gst_object_get_toplevel;

/** */
alias gst_object_get_value = c_gst_object_get_value;

/** */
alias gst_object_get_value_array = c_gst_object_get_value_array;

/** */
alias gst_object_has_active_control_bindings = c_gst_object_has_active_control_bindings;

/** */
alias gst_object_has_ancestor = c_gst_object_has_ancestor;

/** */
alias gst_object_has_as_ancestor = c_gst_object_has_as_ancestor;

/** */
alias gst_object_has_as_parent = c_gst_object_has_as_parent;

/** */
alias gst_object_ref = c_gst_object_ref;

/** */
alias gst_object_remove_control_binding = c_gst_object_remove_control_binding;

/** */
alias gst_object_set_control_binding_disabled = c_gst_object_set_control_binding_disabled;

/** */
alias gst_object_set_control_bindings_disabled = c_gst_object_set_control_bindings_disabled;

/** */
alias gst_object_set_control_rate = c_gst_object_set_control_rate;

/** */
alias gst_object_set_name = c_gst_object_set_name;

/** */
alias gst_object_set_parent = c_gst_object_set_parent;

/** */
alias gst_object_suggest_next_sync = c_gst_object_suggest_next_sync;

/** */
alias gst_object_sync_values = c_gst_object_sync_values;

/** */
alias gst_object_unparent = c_gst_object_unparent;

/** */
alias gst_object_unref = c_gst_object_unref;

// Pad

/** */
alias gst_pad_get_type = c_gst_pad_get_type;

/** */
alias gst_pad_new = c_gst_pad_new;

/** */
alias gst_pad_new_from_static_template = c_gst_pad_new_from_static_template;

/** */
alias gst_pad_new_from_template = c_gst_pad_new_from_template;

/** */
alias gst_pad_link_get_name = c_gst_pad_link_get_name;

/** */
alias gst_pad_activate_mode = c_gst_pad_activate_mode;

/** */
alias gst_pad_add_probe = c_gst_pad_add_probe;

/** */
alias gst_pad_can_link = c_gst_pad_can_link;

/** */
alias gst_pad_chain = c_gst_pad_chain;

/** */
alias gst_pad_chain_list = c_gst_pad_chain_list;

/** */
alias gst_pad_check_reconfigure = c_gst_pad_check_reconfigure;

/** */
alias gst_pad_create_stream_id = c_gst_pad_create_stream_id;

/** */
alias gst_pad_create_stream_id_printf = c_gst_pad_create_stream_id_printf;

/** */
alias gst_pad_create_stream_id_printf_valist = c_gst_pad_create_stream_id_printf_valist;

/** */
alias gst_pad_event_default = c_gst_pad_event_default;

/** */
alias gst_pad_forward = c_gst_pad_forward;

/** */
alias gst_pad_get_allowed_caps = c_gst_pad_get_allowed_caps;

/** */
alias gst_pad_get_current_caps = c_gst_pad_get_current_caps;

/** */
alias gst_pad_get_direction = c_gst_pad_get_direction;

/** */
alias gst_pad_get_element_private = c_gst_pad_get_element_private;

/** */
alias gst_pad_get_last_flow_return = c_gst_pad_get_last_flow_return;

/** */
alias gst_pad_get_offset = c_gst_pad_get_offset;

/** */
alias gst_pad_get_pad_template = c_gst_pad_get_pad_template;

/** */
alias gst_pad_get_pad_template_caps = c_gst_pad_get_pad_template_caps;

/** */
alias gst_pad_get_parent_element = c_gst_pad_get_parent_element;

/** */
alias gst_pad_get_peer = c_gst_pad_get_peer;

/** */
alias gst_pad_get_range = c_gst_pad_get_range;

/** */
alias gst_pad_get_single_internal_link = c_gst_pad_get_single_internal_link;

/** */
alias gst_pad_get_sticky_event = c_gst_pad_get_sticky_event;

/** */
alias gst_pad_get_stream = c_gst_pad_get_stream;

/** */
alias gst_pad_get_stream_id = c_gst_pad_get_stream_id;

/** */
alias gst_pad_get_task_state = c_gst_pad_get_task_state;

/** */
alias gst_pad_has_current_caps = c_gst_pad_has_current_caps;

/** */
alias gst_pad_is_active = c_gst_pad_is_active;

/** */
alias gst_pad_is_blocked = c_gst_pad_is_blocked;

/** */
alias gst_pad_is_blocking = c_gst_pad_is_blocking;

/** */
alias gst_pad_is_linked = c_gst_pad_is_linked;

/** */
alias gst_pad_iterate_internal_links = c_gst_pad_iterate_internal_links;

/** */
alias gst_pad_iterate_internal_links_default = c_gst_pad_iterate_internal_links_default;

/** */
alias gst_pad_link = c_gst_pad_link;

/** */
alias gst_pad_link_full = c_gst_pad_link_full;

/** */
alias gst_pad_link_maybe_ghosting = c_gst_pad_link_maybe_ghosting;

/** */
alias gst_pad_link_maybe_ghosting_full = c_gst_pad_link_maybe_ghosting_full;

/** */
alias gst_pad_mark_reconfigure = c_gst_pad_mark_reconfigure;

/** */
alias gst_pad_needs_reconfigure = c_gst_pad_needs_reconfigure;

/** */
alias gst_pad_pause_task = c_gst_pad_pause_task;

/** */
alias gst_pad_peer_query = c_gst_pad_peer_query;

/** */
alias gst_pad_peer_query_accept_caps = c_gst_pad_peer_query_accept_caps;

/** */
alias gst_pad_peer_query_caps = c_gst_pad_peer_query_caps;

/** */
alias gst_pad_peer_query_convert = c_gst_pad_peer_query_convert;

/** */
alias gst_pad_peer_query_duration = c_gst_pad_peer_query_duration;

/** */
alias gst_pad_peer_query_position = c_gst_pad_peer_query_position;

/** */
alias gst_pad_proxy_query_accept_caps = c_gst_pad_proxy_query_accept_caps;

/** */
alias gst_pad_proxy_query_caps = c_gst_pad_proxy_query_caps;

/** */
alias gst_pad_pull_range = c_gst_pad_pull_range;

/** */
alias gst_pad_push = c_gst_pad_push;

/** */
alias gst_pad_push_event = c_gst_pad_push_event;

/** */
alias gst_pad_push_list = c_gst_pad_push_list;

/** */
alias gst_pad_query = c_gst_pad_query;

/** */
alias gst_pad_query_accept_caps = c_gst_pad_query_accept_caps;

/** */
alias gst_pad_query_caps = c_gst_pad_query_caps;

/** */
alias gst_pad_query_convert = c_gst_pad_query_convert;

/** */
alias gst_pad_query_default = c_gst_pad_query_default;

/** */
alias gst_pad_query_duration = c_gst_pad_query_duration;

/** */
alias gst_pad_query_position = c_gst_pad_query_position;

/** */
alias gst_pad_remove_probe = c_gst_pad_remove_probe;

/** */
alias gst_pad_send_event = c_gst_pad_send_event;

/** */
alias gst_pad_set_activate_function_full = c_gst_pad_set_activate_function_full;

/** */
alias gst_pad_set_activatemode_function_full = c_gst_pad_set_activatemode_function_full;

/** */
alias gst_pad_set_active = c_gst_pad_set_active;

/** */
alias gst_pad_set_chain_function_full = c_gst_pad_set_chain_function_full;

/** */
alias gst_pad_set_chain_list_function_full = c_gst_pad_set_chain_list_function_full;

/** */
alias gst_pad_set_element_private = c_gst_pad_set_element_private;

/** */
alias gst_pad_set_event_full_function_full = c_gst_pad_set_event_full_function_full;

/** */
alias gst_pad_set_event_function_full = c_gst_pad_set_event_function_full;

/** */
alias gst_pad_set_getrange_function_full = c_gst_pad_set_getrange_function_full;

/** */
alias gst_pad_set_iterate_internal_links_function_full = c_gst_pad_set_iterate_internal_links_function_full;

/** */
alias gst_pad_set_link_function_full = c_gst_pad_set_link_function_full;

/** */
alias gst_pad_set_offset = c_gst_pad_set_offset;

/** */
alias gst_pad_set_query_function_full = c_gst_pad_set_query_function_full;

/** */
alias gst_pad_set_unlink_function_full = c_gst_pad_set_unlink_function_full;

/** */
alias gst_pad_start_task = c_gst_pad_start_task;

/** */
alias gst_pad_sticky_events_foreach = c_gst_pad_sticky_events_foreach;

/** */
alias gst_pad_stop_task = c_gst_pad_stop_task;

/** */
alias gst_pad_store_sticky_event = c_gst_pad_store_sticky_event;

/** */
alias gst_pad_unlink = c_gst_pad_unlink;

/** */
alias gst_pad_use_fixed_caps = c_gst_pad_use_fixed_caps;

// PadProbeInfo

/** */
alias gst_pad_probe_info_get_buffer = c_gst_pad_probe_info_get_buffer;

/** */
alias gst_pad_probe_info_get_buffer_list = c_gst_pad_probe_info_get_buffer_list;

/** */
alias gst_pad_probe_info_get_event = c_gst_pad_probe_info_get_event;

/** */
alias gst_pad_probe_info_get_flow_return = c_gst_pad_probe_info_get_flow_return;

/** */
alias gst_pad_probe_info_get_id = c_gst_pad_probe_info_get_id;

/** */
alias gst_pad_probe_info_get_offset = c_gst_pad_probe_info_get_offset;

/** */
alias gst_pad_probe_info_get_query = c_gst_pad_probe_info_get_query;

/** */
alias gst_pad_probe_info_get_size = c_gst_pad_probe_info_get_size;

/** */
alias gst_pad_probe_info_get_type = c_gst_pad_probe_info_get_type;

/** */
alias gst_pad_probe_info_set_buffer = c_gst_pad_probe_info_set_buffer;

/** */
alias gst_pad_probe_info_set_buffer_list = c_gst_pad_probe_info_set_buffer_list;

/** */
alias gst_pad_probe_info_set_event = c_gst_pad_probe_info_set_event;

/** */
alias gst_pad_probe_info_set_flow_return = c_gst_pad_probe_info_set_flow_return;

// PadTemplate

/** */
alias gst_pad_template_get_type = c_gst_pad_template_get_type;

/** */
alias gst_pad_template_new = c_gst_pad_template_new;

/** */
alias gst_pad_template_new_from_static_pad_template_with_gtype = c_gst_pad_template_new_from_static_pad_template_with_gtype;

/** */
alias gst_pad_template_new_with_gtype = c_gst_pad_template_new_with_gtype;

/** */
alias gst_pad_template_get_caps = c_gst_pad_template_get_caps;

/** */
alias gst_pad_template_get_documentation_caps = c_gst_pad_template_get_documentation_caps;

/** */
alias gst_pad_template_pad_created = c_gst_pad_template_pad_created;

/** */
alias gst_pad_template_set_documentation_caps = c_gst_pad_template_set_documentation_caps;

// ParamArray

/** */
alias gst_param_spec_array_get_type = c_gst_param_spec_array_get_type;

// ParamFraction

/** */
alias gst_param_spec_fraction_get_type = c_gst_param_spec_fraction_get_type;

// ParentBufferMeta

/** */
alias gst_parent_buffer_meta_get_info = c_gst_parent_buffer_meta_get_info;

// ParseContext

/** */
alias gst_parse_context_get_type = c_gst_parse_context_get_type;

/** */
alias gst_parse_context_new = c_gst_parse_context_new;

/** */
alias gst_parse_context_copy = c_gst_parse_context_copy;

/** */
alias gst_parse_context_free = c_gst_parse_context_free;

/** */
alias gst_parse_context_get_missing_elements = c_gst_parse_context_get_missing_elements;

// Pipeline

/** */
alias gst_pipeline_get_type = c_gst_pipeline_get_type;

/** */
alias gst_pipeline_new = c_gst_pipeline_new;

/** */
alias gst_pipeline_auto_clock = c_gst_pipeline_auto_clock;

/** */
alias gst_pipeline_get_auto_flush_bus = c_gst_pipeline_get_auto_flush_bus;

/** */
alias gst_pipeline_get_bus = c_gst_pipeline_get_bus;

/** */
alias gst_pipeline_get_clock = c_gst_pipeline_get_clock;

/** */
alias gst_pipeline_get_configured_latency = c_gst_pipeline_get_configured_latency;

/** */
alias gst_pipeline_get_delay = c_gst_pipeline_get_delay;

/** */
alias gst_pipeline_get_latency = c_gst_pipeline_get_latency;

/** */
alias gst_pipeline_get_pipeline_clock = c_gst_pipeline_get_pipeline_clock;

/** */
alias gst_pipeline_is_live = c_gst_pipeline_is_live;

/** */
alias gst_pipeline_set_auto_flush_bus = c_gst_pipeline_set_auto_flush_bus;

/** */
alias gst_pipeline_set_clock = c_gst_pipeline_set_clock;

/** */
alias gst_pipeline_set_delay = c_gst_pipeline_set_delay;

/** */
alias gst_pipeline_set_latency = c_gst_pipeline_set_latency;

/** */
alias gst_pipeline_use_clock = c_gst_pipeline_use_clock;

// Plugin

/** */
alias gst_plugin_get_type = c_gst_plugin_get_type;

/** */
alias gst_plugin_list_free = c_gst_plugin_list_free;

/** */
alias gst_plugin_load_by_name = c_gst_plugin_load_by_name;

/** */
alias gst_plugin_load_file = c_gst_plugin_load_file;

/** */
alias gst_plugin_register_static = c_gst_plugin_register_static;

/** */
alias gst_plugin_register_static_full = c_gst_plugin_register_static_full;

/** */
alias gst_plugin_add_dependency = c_gst_plugin_add_dependency;

/** */
alias gst_plugin_add_dependency_simple = c_gst_plugin_add_dependency_simple;

/** */
alias gst_plugin_add_status_error = c_gst_plugin_add_status_error;

/** */
alias gst_plugin_add_status_info = c_gst_plugin_add_status_info;

/** */
alias gst_plugin_add_status_warning = c_gst_plugin_add_status_warning;

/** */
alias gst_plugin_get_cache_data = c_gst_plugin_get_cache_data;

/** */
alias gst_plugin_get_description = c_gst_plugin_get_description;

/** */
alias gst_plugin_get_filename = c_gst_plugin_get_filename;

/** */
alias gst_plugin_get_license = c_gst_plugin_get_license;

/** */
alias gst_plugin_get_name = c_gst_plugin_get_name;

/** */
alias gst_plugin_get_origin = c_gst_plugin_get_origin;

/** */
alias gst_plugin_get_package = c_gst_plugin_get_package;

/** */
alias gst_plugin_get_release_date_string = c_gst_plugin_get_release_date_string;

/** */
alias gst_plugin_get_source = c_gst_plugin_get_source;

/** */
alias gst_plugin_get_status_errors = c_gst_plugin_get_status_errors;

/** */
alias gst_plugin_get_status_infos = c_gst_plugin_get_status_infos;

/** */
alias gst_plugin_get_status_warnings = c_gst_plugin_get_status_warnings;

/** */
alias gst_plugin_get_version = c_gst_plugin_get_version;

/** */
alias gst_plugin_is_loaded = c_gst_plugin_is_loaded;

/** */
alias gst_plugin_load = c_gst_plugin_load;

/** */
alias gst_plugin_set_cache_data = c_gst_plugin_set_cache_data;

// PluginFeature

/** */
alias gst_plugin_feature_get_type = c_gst_plugin_feature_get_type;

/** */
alias gst_plugin_feature_list_copy = c_gst_plugin_feature_list_copy;

/** */
alias gst_plugin_feature_list_debug = c_gst_plugin_feature_list_debug;

/** */
alias gst_plugin_feature_list_free = c_gst_plugin_feature_list_free;

/** */
alias gst_plugin_feature_rank_compare_func = c_gst_plugin_feature_rank_compare_func;

/** */
alias gst_plugin_feature_check_version = c_gst_plugin_feature_check_version;

/** */
alias gst_plugin_feature_get_plugin = c_gst_plugin_feature_get_plugin;

/** */
alias gst_plugin_feature_get_plugin_name = c_gst_plugin_feature_get_plugin_name;

/** */
alias gst_plugin_feature_get_rank = c_gst_plugin_feature_get_rank;

/** */
alias gst_plugin_feature_load = c_gst_plugin_feature_load;

/** */
alias gst_plugin_feature_set_rank = c_gst_plugin_feature_set_rank;

// Poll

/** */
alias gst_poll_add_fd = c_gst_poll_add_fd;

/** */
alias gst_poll_fd_can_read = c_gst_poll_fd_can_read;

/** */
alias gst_poll_fd_can_write = c_gst_poll_fd_can_write;

/** */
alias gst_poll_fd_ctl_pri = c_gst_poll_fd_ctl_pri;

/** */
alias gst_poll_fd_ctl_read = c_gst_poll_fd_ctl_read;

/** */
alias gst_poll_fd_ctl_write = c_gst_poll_fd_ctl_write;

/** */
alias gst_poll_fd_has_closed = c_gst_poll_fd_has_closed;

/** */
alias gst_poll_fd_has_error = c_gst_poll_fd_has_error;

/** */
alias gst_poll_fd_has_pri = c_gst_poll_fd_has_pri;

/** */
alias gst_poll_fd_ignored = c_gst_poll_fd_ignored;

/** */
alias gst_poll_free = c_gst_poll_free;

/** */
alias gst_poll_get_read_gpollfd = c_gst_poll_get_read_gpollfd;

/** */
alias gst_poll_read_control = c_gst_poll_read_control;

/** */
alias gst_poll_remove_fd = c_gst_poll_remove_fd;

/** */
alias gst_poll_restart = c_gst_poll_restart;

/** */
alias gst_poll_set_controllable = c_gst_poll_set_controllable;

/** */
alias gst_poll_set_flushing = c_gst_poll_set_flushing;

/** */
alias gst_poll_wait = c_gst_poll_wait;

/** */
alias gst_poll_write_control = c_gst_poll_write_control;

/** */
alias gst_poll_new = c_gst_poll_new;

/** */
alias gst_poll_new_timer = c_gst_poll_new_timer;

// PollFD

/** */
alias gst_poll_fd_init = c_gst_poll_fd_init;

// Preset

/** */
alias gst_preset_get_type = c_gst_preset_get_type;

/** */
alias gst_preset_get_app_dir = c_gst_preset_get_app_dir;

/** */
alias gst_preset_set_app_dir = c_gst_preset_set_app_dir;

/** */
alias gst_preset_delete_preset = c_gst_preset_delete_preset;

/** */
alias gst_preset_get_meta = c_gst_preset_get_meta;

/** */
alias gst_preset_get_preset_names = c_gst_preset_get_preset_names;

/** */
alias gst_preset_get_property_names = c_gst_preset_get_property_names;

/** */
alias gst_preset_is_editable = c_gst_preset_is_editable;

/** */
alias gst_preset_load_preset = c_gst_preset_load_preset;

/** */
alias gst_preset_rename_preset = c_gst_preset_rename_preset;

/** */
alias gst_preset_save_preset = c_gst_preset_save_preset;

/** */
alias gst_preset_set_meta = c_gst_preset_set_meta;

// Promise

/** */
alias gst_promise_get_type = c_gst_promise_get_type;

/** */
alias gst_promise_new = c_gst_promise_new;

/** */
alias gst_promise_new_with_change_func = c_gst_promise_new_with_change_func;

/** */
alias gst_promise_expire = c_gst_promise_expire;

/** */
alias gst_promise_get_reply = c_gst_promise_get_reply;

/** */
alias gst_promise_interrupt = c_gst_promise_interrupt;

/** */
alias gst_promise_ref = c_gst_promise_ref;

/** */
alias gst_promise_reply = c_gst_promise_reply;

/** */
alias gst_promise_unref = c_gst_promise_unref;

/** */
alias gst_promise_wait = c_gst_promise_wait;

// ProtectionMeta

/** */
alias gst_protection_meta_get_info = c_gst_protection_meta_get_info;

// ProxyPad

/** */
alias gst_proxy_pad_get_type = c_gst_proxy_pad_get_type;

/** */
alias gst_proxy_pad_chain_default = c_gst_proxy_pad_chain_default;

/** */
alias gst_proxy_pad_chain_list_default = c_gst_proxy_pad_chain_list_default;

/** */
alias gst_proxy_pad_getrange_default = c_gst_proxy_pad_getrange_default;

/** */
alias gst_proxy_pad_iterate_internal_links_default = c_gst_proxy_pad_iterate_internal_links_default;

/** */
alias gst_proxy_pad_get_internal = c_gst_proxy_pad_get_internal;

// Query

/** */
alias gst_query_get_type = c_gst_query_get_type;

/** */
alias gst_query_new_accept_caps = c_gst_query_new_accept_caps;

/** */
alias gst_query_new_allocation = c_gst_query_new_allocation;

/** */
alias gst_query_new_bitrate = c_gst_query_new_bitrate;

/** */
alias gst_query_new_buffering = c_gst_query_new_buffering;

/** */
alias gst_query_new_caps = c_gst_query_new_caps;

/** */
alias gst_query_new_context = c_gst_query_new_context;

/** */
alias gst_query_new_convert = c_gst_query_new_convert;

/** */
alias gst_query_new_custom = c_gst_query_new_custom;

/** */
alias gst_query_new_drain = c_gst_query_new_drain;

/** */
alias gst_query_new_duration = c_gst_query_new_duration;

/** */
alias gst_query_new_formats = c_gst_query_new_formats;

/** */
alias gst_query_new_latency = c_gst_query_new_latency;

/** */
alias gst_query_new_position = c_gst_query_new_position;

/** */
alias gst_query_new_scheduling = c_gst_query_new_scheduling;

/** */
alias gst_query_new_seeking = c_gst_query_new_seeking;

/** */
alias gst_query_new_segment = c_gst_query_new_segment;

/** */
alias gst_query_new_selectable = c_gst_query_new_selectable;

/** */
alias gst_query_new_uri = c_gst_query_new_uri;

/** */
alias gst_query_add_allocation_meta = c_gst_query_add_allocation_meta;

/** */
alias gst_query_add_allocation_param = c_gst_query_add_allocation_param;

/** */
alias gst_query_add_allocation_pool = c_gst_query_add_allocation_pool;

/** */
alias gst_query_add_buffering_range = c_gst_query_add_buffering_range;

/** */
alias gst_query_add_scheduling_mode = c_gst_query_add_scheduling_mode;

/** */
alias gst_query_copy = c_gst_query_copy;

/** */
alias gst_query_find_allocation_meta = c_gst_query_find_allocation_meta;

/** */
alias gst_query_get_n_allocation_metas = c_gst_query_get_n_allocation_metas;

/** */
alias gst_query_get_n_allocation_params = c_gst_query_get_n_allocation_params;

/** */
alias gst_query_get_n_allocation_pools = c_gst_query_get_n_allocation_pools;

/** */
alias gst_query_get_n_buffering_ranges = c_gst_query_get_n_buffering_ranges;

/** */
alias gst_query_get_n_scheduling_modes = c_gst_query_get_n_scheduling_modes;

/** */
alias gst_query_get_structure = c_gst_query_get_structure;

/** */
alias gst_query_has_scheduling_mode = c_gst_query_has_scheduling_mode;

/** */
alias gst_query_has_scheduling_mode_with_flags = c_gst_query_has_scheduling_mode_with_flags;

/** */
alias gst_query_is_writable = c_gst_query_is_writable;

/** */
alias gst_query_make_writable = c_gst_query_make_writable;

/** */
alias gst_query_parse_accept_caps = c_gst_query_parse_accept_caps;

/** */
alias gst_query_parse_accept_caps_result = c_gst_query_parse_accept_caps_result;

/** */
alias gst_query_parse_allocation = c_gst_query_parse_allocation;

/** */
alias gst_query_parse_bitrate = c_gst_query_parse_bitrate;

/** */
alias gst_query_parse_buffering_percent = c_gst_query_parse_buffering_percent;

/** */
alias gst_query_parse_buffering_range = c_gst_query_parse_buffering_range;

/** */
alias gst_query_parse_buffering_stats = c_gst_query_parse_buffering_stats;

/** */
alias gst_query_parse_caps = c_gst_query_parse_caps;

/** */
alias gst_query_parse_caps_result = c_gst_query_parse_caps_result;

/** */
alias gst_query_parse_context = c_gst_query_parse_context;

/** */
alias gst_query_parse_context_type = c_gst_query_parse_context_type;

/** */
alias gst_query_parse_convert = c_gst_query_parse_convert;

/** */
alias gst_query_parse_duration = c_gst_query_parse_duration;

/** */
alias gst_query_parse_latency = c_gst_query_parse_latency;

/** */
alias gst_query_parse_n_formats = c_gst_query_parse_n_formats;

/** */
alias gst_query_parse_nth_allocation_meta = c_gst_query_parse_nth_allocation_meta;

/** */
alias gst_query_parse_nth_allocation_param = c_gst_query_parse_nth_allocation_param;

/** */
alias gst_query_parse_nth_allocation_pool = c_gst_query_parse_nth_allocation_pool;

/** */
alias gst_query_parse_nth_buffering_range = c_gst_query_parse_nth_buffering_range;

/** */
alias gst_query_parse_nth_format = c_gst_query_parse_nth_format;

/** */
alias gst_query_parse_nth_scheduling_mode = c_gst_query_parse_nth_scheduling_mode;

/** */
alias gst_query_parse_position = c_gst_query_parse_position;

/** */
alias gst_query_parse_scheduling = c_gst_query_parse_scheduling;

/** */
alias gst_query_parse_seeking = c_gst_query_parse_seeking;

/** */
alias gst_query_parse_segment = c_gst_query_parse_segment;

/** */
alias gst_query_parse_selectable = c_gst_query_parse_selectable;

/** */
alias gst_query_parse_uri = c_gst_query_parse_uri;

/** */
alias gst_query_parse_uri_redirection = c_gst_query_parse_uri_redirection;

/** */
alias gst_query_parse_uri_redirection_permanent = c_gst_query_parse_uri_redirection_permanent;

/** */
alias gst_query_ref = c_gst_query_ref;

/** */
alias gst_query_remove_nth_allocation_meta = c_gst_query_remove_nth_allocation_meta;

/** */
alias gst_query_remove_nth_allocation_param = c_gst_query_remove_nth_allocation_param;

/** */
alias gst_query_remove_nth_allocation_pool = c_gst_query_remove_nth_allocation_pool;

/** */
alias gst_query_set_accept_caps_result = c_gst_query_set_accept_caps_result;

/** */
alias gst_query_set_bitrate = c_gst_query_set_bitrate;

/** */
alias gst_query_set_buffering_percent = c_gst_query_set_buffering_percent;

/** */
alias gst_query_set_buffering_range = c_gst_query_set_buffering_range;

/** */
alias gst_query_set_buffering_stats = c_gst_query_set_buffering_stats;

/** */
alias gst_query_set_caps_result = c_gst_query_set_caps_result;

/** */
alias gst_query_set_context = c_gst_query_set_context;

/** */
alias gst_query_set_convert = c_gst_query_set_convert;

/** */
alias gst_query_set_duration = c_gst_query_set_duration;

/** */
alias gst_query_set_formats = c_gst_query_set_formats;

/** */
alias gst_query_set_formatsv = c_gst_query_set_formatsv;

/** */
alias gst_query_set_latency = c_gst_query_set_latency;

/** */
alias gst_query_set_nth_allocation_param = c_gst_query_set_nth_allocation_param;

/** */
alias gst_query_set_nth_allocation_pool = c_gst_query_set_nth_allocation_pool;

/** */
alias gst_query_set_position = c_gst_query_set_position;

/** */
alias gst_query_set_scheduling = c_gst_query_set_scheduling;

/** */
alias gst_query_set_seeking = c_gst_query_set_seeking;

/** */
alias gst_query_set_segment = c_gst_query_set_segment;

/** */
alias gst_query_set_selectable = c_gst_query_set_selectable;

/** */
alias gst_query_set_uri = c_gst_query_set_uri;

/** */
alias gst_query_set_uri_redirection = c_gst_query_set_uri_redirection;

/** */
alias gst_query_set_uri_redirection_permanent = c_gst_query_set_uri_redirection_permanent;

/** */
alias gst_query_unref = c_gst_query_unref;

/** */
alias gst_query_writable_structure = c_gst_query_writable_structure;

/** */
alias gst_query_replace = c_gst_query_replace;

/** */
alias gst_query_steal = c_gst_query_steal;

/** */
alias gst_query_take = c_gst_query_take;

// ReferenceTimestampMeta

/** */
alias gst_reference_timestamp_meta_get_info = c_gst_reference_timestamp_meta_get_info;

// Registry

/** */
alias gst_registry_get_type = c_gst_registry_get_type;

/** */
alias gst_registry_fork_is_enabled = c_gst_registry_fork_is_enabled;

/** */
alias gst_registry_fork_set_enabled = c_gst_registry_fork_set_enabled;

/** */
alias gst_registry_get = c_gst_registry_get;

/** */
alias gst_registry_add_feature = c_gst_registry_add_feature;

/** */
alias gst_registry_add_plugin = c_gst_registry_add_plugin;

/** */
alias gst_registry_check_feature_version = c_gst_registry_check_feature_version;

/** */
alias gst_registry_feature_filter = c_gst_registry_feature_filter;

/** */
alias gst_registry_find_feature = c_gst_registry_find_feature;

/** */
alias gst_registry_find_plugin = c_gst_registry_find_plugin;

/** */
alias gst_registry_get_feature_list = c_gst_registry_get_feature_list;

/** */
alias gst_registry_get_feature_list_by_plugin = c_gst_registry_get_feature_list_by_plugin;

/** */
alias gst_registry_get_feature_list_cookie = c_gst_registry_get_feature_list_cookie;

/** */
alias gst_registry_get_plugin_list = c_gst_registry_get_plugin_list;

/** */
alias gst_registry_lookup = c_gst_registry_lookup;

/** */
alias gst_registry_lookup_feature = c_gst_registry_lookup_feature;

/** */
alias gst_registry_plugin_filter = c_gst_registry_plugin_filter;

/** */
alias gst_registry_remove_feature = c_gst_registry_remove_feature;

/** */
alias gst_registry_remove_plugin = c_gst_registry_remove_plugin;

/** */
alias gst_registry_scan_path = c_gst_registry_scan_path;

// Sample

/** */
alias gst_sample_get_type = c_gst_sample_get_type;

/** */
alias gst_sample_new = c_gst_sample_new;

/** */
alias gst_sample_copy = c_gst_sample_copy;

/** */
alias gst_sample_get_buffer = c_gst_sample_get_buffer;

/** */
alias gst_sample_get_buffer_list = c_gst_sample_get_buffer_list;

/** */
alias gst_sample_get_caps = c_gst_sample_get_caps;

/** */
alias gst_sample_get_info = c_gst_sample_get_info;

/** */
alias gst_sample_get_segment = c_gst_sample_get_segment;

/** */
alias gst_sample_is_writable = c_gst_sample_is_writable;

/** */
alias gst_sample_make_writable = c_gst_sample_make_writable;

/** */
alias gst_sample_ref = c_gst_sample_ref;

/** */
alias gst_sample_set_buffer = c_gst_sample_set_buffer;

/** */
alias gst_sample_set_buffer_list = c_gst_sample_set_buffer_list;

/** */
alias gst_sample_set_caps = c_gst_sample_set_caps;

/** */
alias gst_sample_set_info = c_gst_sample_set_info;

/** */
alias gst_sample_set_segment = c_gst_sample_set_segment;

/** */
alias gst_sample_unref = c_gst_sample_unref;

// Segment

/** */
alias gst_segment_get_type = c_gst_segment_get_type;

/** */
alias gst_segment_new = c_gst_segment_new;

/** */
alias gst_segment_clip = c_gst_segment_clip;

/** */
alias gst_segment_copy = c_gst_segment_copy;

/** */
alias gst_segment_copy_into = c_gst_segment_copy_into;

/** */
alias gst_segment_do_seek = c_gst_segment_do_seek;

/** */
alias gst_segment_free = c_gst_segment_free;

/** */
alias gst_segment_init = c_gst_segment_init;

/** */
alias gst_segment_is_equal = c_gst_segment_is_equal;

/** */
alias gst_segment_offset_running_time = c_gst_segment_offset_running_time;

/** */
alias gst_segment_position_from_running_time = c_gst_segment_position_from_running_time;

/** */
alias gst_segment_position_from_running_time_full = c_gst_segment_position_from_running_time_full;

/** */
alias gst_segment_position_from_stream_time = c_gst_segment_position_from_stream_time;

/** */
alias gst_segment_position_from_stream_time_full = c_gst_segment_position_from_stream_time_full;

/** */
alias gst_segment_set_running_time = c_gst_segment_set_running_time;

/** */
alias gst_segment_to_position = c_gst_segment_to_position;

/** */
alias gst_segment_to_running_time = c_gst_segment_to_running_time;

/** */
alias gst_segment_to_running_time_full = c_gst_segment_to_running_time_full;

/** */
alias gst_segment_to_stream_time = c_gst_segment_to_stream_time;

/** */
alias gst_segment_to_stream_time_full = c_gst_segment_to_stream_time_full;

// SharedTaskPool

/** */
alias gst_shared_task_pool_get_type = c_gst_shared_task_pool_get_type;

/** */
alias gst_shared_task_pool_new = c_gst_shared_task_pool_new;

/** */
alias gst_shared_task_pool_get_max_threads = c_gst_shared_task_pool_get_max_threads;

/** */
alias gst_shared_task_pool_set_max_threads = c_gst_shared_task_pool_set_max_threads;

// StaticCaps

/** */
alias gst_static_caps_get_type = c_gst_static_caps_get_type;

/** */
alias gst_static_caps_cleanup = c_gst_static_caps_cleanup;

/** */
alias gst_static_caps_get = c_gst_static_caps_get;

// StaticPadTemplate

/** */
alias gst_static_pad_template_get_type = c_gst_static_pad_template_get_type;

/** */
alias gst_static_pad_template_get = c_gst_static_pad_template_get;

/** */
alias gst_static_pad_template_get_caps = c_gst_static_pad_template_get_caps;

// Stream

/** */
alias gst_stream_get_type = c_gst_stream_get_type;

/** */
alias gst_stream_new = c_gst_stream_new;

/** */
alias gst_stream_get_caps = c_gst_stream_get_caps;

/** */
alias gst_stream_get_stream_flags = c_gst_stream_get_stream_flags;

/** */
alias gst_stream_get_stream_id = c_gst_stream_get_stream_id;

/** */
alias gst_stream_get_stream_type = c_gst_stream_get_stream_type;

/** */
alias gst_stream_get_tags = c_gst_stream_get_tags;

/** */
alias gst_stream_set_caps = c_gst_stream_set_caps;

/** */
alias gst_stream_set_stream_flags = c_gst_stream_set_stream_flags;

/** */
alias gst_stream_set_stream_type = c_gst_stream_set_stream_type;

/** */
alias gst_stream_set_tags = c_gst_stream_set_tags;

// StreamCollection

/** */
alias gst_stream_collection_get_type = c_gst_stream_collection_get_type;

/** */
alias gst_stream_collection_new = c_gst_stream_collection_new;

/** */
alias gst_stream_collection_add_stream = c_gst_stream_collection_add_stream;

/** */
alias gst_stream_collection_get_size = c_gst_stream_collection_get_size;

/** */
alias gst_stream_collection_get_stream = c_gst_stream_collection_get_stream;

/** */
alias gst_stream_collection_get_upstream_id = c_gst_stream_collection_get_upstream_id;

// Structure

/** */
alias gst_structure_get_type = c_gst_structure_get_type;

/** */
alias gst_structure_from_string = c_gst_structure_from_string;

/** */
alias gst_structure_new = c_gst_structure_new;

/** */
alias gst_structure_new_empty = c_gst_structure_new_empty;

/** */
alias gst_structure_new_from_string = c_gst_structure_new_from_string;

/** */
alias gst_structure_new_id = c_gst_structure_new_id;

/** */
alias gst_structure_new_id_empty = c_gst_structure_new_id_empty;

/** */
alias gst_structure_new_id_str = c_gst_structure_new_id_str;

/** */
alias gst_structure_new_id_str_empty = c_gst_structure_new_id_str_empty;

/** */
alias gst_structure_new_id_str_valist = c_gst_structure_new_id_str_valist;

/** */
alias gst_structure_new_static_str = c_gst_structure_new_static_str;

/** */
alias gst_structure_new_static_str_empty = c_gst_structure_new_static_str_empty;

/** */
alias gst_structure_new_static_str_valist = c_gst_structure_new_static_str_valist;

/** */
alias gst_structure_new_valist = c_gst_structure_new_valist;

/** */
alias gst_structure_can_intersect = c_gst_structure_can_intersect;

/** */
alias gst_structure_copy = c_gst_structure_copy;

/** */
alias gst_structure_filter_and_map_in_place = c_gst_structure_filter_and_map_in_place;

/** */
alias gst_structure_filter_and_map_in_place_id_str = c_gst_structure_filter_and_map_in_place_id_str;

/** */
alias gst_structure_fixate = c_gst_structure_fixate;

/** */
alias gst_structure_fixate_field = c_gst_structure_fixate_field;

/** */
alias gst_structure_fixate_field_boolean = c_gst_structure_fixate_field_boolean;

/** */
alias gst_structure_fixate_field_nearest_double = c_gst_structure_fixate_field_nearest_double;

/** */
alias gst_structure_fixate_field_nearest_fraction = c_gst_structure_fixate_field_nearest_fraction;

/** */
alias gst_structure_fixate_field_nearest_int = c_gst_structure_fixate_field_nearest_int;

/** */
alias gst_structure_fixate_field_string = c_gst_structure_fixate_field_string;

/** */
alias gst_structure_foreach = c_gst_structure_foreach;

/** */
alias gst_structure_foreach_id_str = c_gst_structure_foreach_id_str;

/** */
alias gst_structure_free = c_gst_structure_free;

/** */
alias gst_structure_get = c_gst_structure_get;

/** */
alias gst_structure_get_array = c_gst_structure_get_array;

/** */
alias gst_structure_get_boolean = c_gst_structure_get_boolean;

/** */
alias gst_structure_get_caps = c_gst_structure_get_caps;

/** */
alias gst_structure_get_clock_time = c_gst_structure_get_clock_time;

/** */
alias gst_structure_get_date = c_gst_structure_get_date;

/** */
alias gst_structure_get_date_time = c_gst_structure_get_date_time;

/** */
alias gst_structure_get_double = c_gst_structure_get_double;

/** */
alias gst_structure_get_enum = c_gst_structure_get_enum;

/** */
alias gst_structure_get_field_type = c_gst_structure_get_field_type;

/** */
alias gst_structure_get_flags = c_gst_structure_get_flags;

/** */
alias gst_structure_get_flagset = c_gst_structure_get_flagset;

/** */
alias gst_structure_get_fraction = c_gst_structure_get_fraction;

/** */
alias gst_structure_get_int = c_gst_structure_get_int;

/** */
alias gst_structure_get_int64 = c_gst_structure_get_int64;

/** */
alias gst_structure_get_list = c_gst_structure_get_list;

/** */
alias gst_structure_get_name = c_gst_structure_get_name;

/** */
alias gst_structure_get_name_id = c_gst_structure_get_name_id;

/** */
alias gst_structure_get_name_id_str = c_gst_structure_get_name_id_str;

/** */
alias gst_structure_get_string = c_gst_structure_get_string;

/** */
alias gst_structure_get_uint = c_gst_structure_get_uint;

/** */
alias gst_structure_get_uint64 = c_gst_structure_get_uint64;

/** */
alias gst_structure_get_valist = c_gst_structure_get_valist;

/** */
alias gst_structure_get_value = c_gst_structure_get_value;

/** */
alias gst_structure_has_field = c_gst_structure_has_field;

/** */
alias gst_structure_has_field_typed = c_gst_structure_has_field_typed;

/** */
alias gst_structure_has_name = c_gst_structure_has_name;

/** */
alias gst_structure_id_get = c_gst_structure_id_get;

/** */
alias gst_structure_id_get_valist = c_gst_structure_id_get_valist;

/** */
alias gst_structure_id_get_value = c_gst_structure_id_get_value;

/** */
alias gst_structure_id_has_field = c_gst_structure_id_has_field;

/** */
alias gst_structure_id_has_field_typed = c_gst_structure_id_has_field_typed;

/** */
alias gst_structure_id_set = c_gst_structure_id_set;

/** */
alias gst_structure_id_set_valist = c_gst_structure_id_set_valist;

/** */
alias gst_structure_id_set_value = c_gst_structure_id_set_value;

/** */
alias gst_structure_id_str_get = c_gst_structure_id_str_get;

/** */
alias gst_structure_id_str_get_field_type = c_gst_structure_id_str_get_field_type;

/** */
alias gst_structure_id_str_get_valist = c_gst_structure_id_str_get_valist;

/** */
alias gst_structure_id_str_get_value = c_gst_structure_id_str_get_value;

/** */
alias gst_structure_id_str_has_field = c_gst_structure_id_str_has_field;

/** */
alias gst_structure_id_str_has_field_typed = c_gst_structure_id_str_has_field_typed;

/** */
alias gst_structure_id_str_nth_field_name = c_gst_structure_id_str_nth_field_name;

/** */
alias gst_structure_id_str_remove_field = c_gst_structure_id_str_remove_field;

/** */
alias gst_structure_id_str_remove_fields = c_gst_structure_id_str_remove_fields;

/** */
alias gst_structure_id_str_remove_fields_valist = c_gst_structure_id_str_remove_fields_valist;

/** */
alias gst_structure_id_str_set = c_gst_structure_id_str_set;

/** */
alias gst_structure_id_str_set_valist = c_gst_structure_id_str_set_valist;

/** */
alias gst_structure_id_str_set_value = c_gst_structure_id_str_set_value;

/** */
alias gst_structure_id_str_take_value = c_gst_structure_id_str_take_value;

/** */
alias gst_structure_id_take_value = c_gst_structure_id_take_value;

/** */
alias gst_structure_intersect = c_gst_structure_intersect;

/** */
alias gst_structure_is_equal = c_gst_structure_is_equal;

/** */
alias gst_structure_is_subset = c_gst_structure_is_subset;

/** */
alias gst_structure_is_writable = c_gst_structure_is_writable;

/** */
alias gst_structure_map_in_place = c_gst_structure_map_in_place;

/** */
alias gst_structure_map_in_place_id_str = c_gst_structure_map_in_place_id_str;

/** */
alias gst_structure_n_fields = c_gst_structure_n_fields;

/** */
alias gst_structure_nth_field_name = c_gst_structure_nth_field_name;

/** */
alias gst_structure_remove_all_fields = c_gst_structure_remove_all_fields;

/** */
alias gst_structure_remove_field = c_gst_structure_remove_field;

/** */
alias gst_structure_remove_fields = c_gst_structure_remove_fields;

/** */
alias gst_structure_remove_fields_valist = c_gst_structure_remove_fields_valist;

/** */
alias gst_structure_serialize = c_gst_structure_serialize;

/** */
alias gst_structure_serialize_full = c_gst_structure_serialize_full;

/** */
alias gst_structure_set = c_gst_structure_set;

/** */
alias gst_structure_set_array = c_gst_structure_set_array;

/** */
alias gst_structure_set_list = c_gst_structure_set_list;

/** */
alias gst_structure_set_name = c_gst_structure_set_name;

/** */
alias gst_structure_set_name_id_str = c_gst_structure_set_name_id_str;

/** */
alias gst_structure_set_name_static_str = c_gst_structure_set_name_static_str;

/** */
alias gst_structure_set_parent_refcount = c_gst_structure_set_parent_refcount;

/** */
alias gst_structure_set_static_str = c_gst_structure_set_static_str;

/** */
alias gst_structure_set_static_str_valist = c_gst_structure_set_static_str_valist;

/** */
alias gst_structure_set_valist = c_gst_structure_set_valist;

/** */
alias gst_structure_set_value = c_gst_structure_set_value;

/** */
alias gst_structure_set_value_static_str = c_gst_structure_set_value_static_str;

/** */
alias gst_structure_take_value = c_gst_structure_take_value;

/** */
alias gst_structure_take_value_static_str = c_gst_structure_take_value_static_str;

/** */
alias gst_structure_to_string = c_gst_structure_to_string;

/** */
alias gst_structure_take = c_gst_structure_take;

// SystemClock

/** */
alias gst_system_clock_get_type = c_gst_system_clock_get_type;

/** */
alias gst_system_clock_obtain = c_gst_system_clock_obtain;

/** */
alias gst_system_clock_set_default = c_gst_system_clock_set_default;

// TagList

/** */
alias gst_tag_list_get_type = c_gst_tag_list_get_type;

/** */
alias gst_tag_list_new = c_gst_tag_list_new;

/** */
alias gst_tag_list_new_empty = c_gst_tag_list_new_empty;

/** */
alias gst_tag_list_new_from_string = c_gst_tag_list_new_from_string;

/** */
alias gst_tag_list_new_valist = c_gst_tag_list_new_valist;

/** */
alias gst_tag_list_add = c_gst_tag_list_add;

/** */
alias gst_tag_list_add_valist = c_gst_tag_list_add_valist;

/** */
alias gst_tag_list_add_valist_values = c_gst_tag_list_add_valist_values;

/** */
alias gst_tag_list_add_value = c_gst_tag_list_add_value;

/** */
alias gst_tag_list_add_values = c_gst_tag_list_add_values;

/** */
alias gst_tag_list_copy = c_gst_tag_list_copy;

/** */
alias gst_tag_list_foreach = c_gst_tag_list_foreach;

/** */
alias gst_tag_list_get_boolean = c_gst_tag_list_get_boolean;

/** */
alias gst_tag_list_get_boolean_index = c_gst_tag_list_get_boolean_index;

/** */
alias gst_tag_list_get_date = c_gst_tag_list_get_date;

/** */
alias gst_tag_list_get_date_index = c_gst_tag_list_get_date_index;

/** */
alias gst_tag_list_get_date_time = c_gst_tag_list_get_date_time;

/** */
alias gst_tag_list_get_date_time_index = c_gst_tag_list_get_date_time_index;

/** */
alias gst_tag_list_get_double = c_gst_tag_list_get_double;

/** */
alias gst_tag_list_get_double_index = c_gst_tag_list_get_double_index;

/** */
alias gst_tag_list_get_float = c_gst_tag_list_get_float;

/** */
alias gst_tag_list_get_float_index = c_gst_tag_list_get_float_index;

/** */
alias gst_tag_list_get_int = c_gst_tag_list_get_int;

/** */
alias gst_tag_list_get_int64 = c_gst_tag_list_get_int64;

/** */
alias gst_tag_list_get_int64_index = c_gst_tag_list_get_int64_index;

/** */
alias gst_tag_list_get_int_index = c_gst_tag_list_get_int_index;

/** */
alias gst_tag_list_get_pointer = c_gst_tag_list_get_pointer;

/** */
alias gst_tag_list_get_pointer_index = c_gst_tag_list_get_pointer_index;

/** */
alias gst_tag_list_get_sample = c_gst_tag_list_get_sample;

/** */
alias gst_tag_list_get_sample_index = c_gst_tag_list_get_sample_index;

/** */
alias gst_tag_list_get_scope = c_gst_tag_list_get_scope;

/** */
alias gst_tag_list_get_string = c_gst_tag_list_get_string;

/** */
alias gst_tag_list_get_string_index = c_gst_tag_list_get_string_index;

/** */
alias gst_tag_list_get_tag_size = c_gst_tag_list_get_tag_size;

/** */
alias gst_tag_list_get_uint = c_gst_tag_list_get_uint;

/** */
alias gst_tag_list_get_uint64 = c_gst_tag_list_get_uint64;

/** */
alias gst_tag_list_get_uint64_index = c_gst_tag_list_get_uint64_index;

/** */
alias gst_tag_list_get_uint_index = c_gst_tag_list_get_uint_index;

/** */
alias gst_tag_list_get_value_index = c_gst_tag_list_get_value_index;

/** */
alias gst_tag_list_insert = c_gst_tag_list_insert;

/** */
alias gst_tag_list_is_empty = c_gst_tag_list_is_empty;

/** */
alias gst_tag_list_is_equal = c_gst_tag_list_is_equal;

/** */
alias gst_tag_list_is_writable = c_gst_tag_list_is_writable;

/** */
alias gst_tag_list_make_writable = c_gst_tag_list_make_writable;

/** */
alias gst_tag_list_merge = c_gst_tag_list_merge;

/** */
alias gst_tag_list_n_tags = c_gst_tag_list_n_tags;

/** */
alias gst_tag_list_nth_tag_name = c_gst_tag_list_nth_tag_name;

/** */
alias gst_tag_list_peek_string_index = c_gst_tag_list_peek_string_index;

/** */
alias gst_tag_list_ref = c_gst_tag_list_ref;

/** */
alias gst_tag_list_remove_tag = c_gst_tag_list_remove_tag;

/** */
alias gst_tag_list_set_scope = c_gst_tag_list_set_scope;

/** */
alias gst_tag_list_to_string = c_gst_tag_list_to_string;

/** */
alias gst_tag_list_unref = c_gst_tag_list_unref;

/** */
alias gst_tag_list_copy_value = c_gst_tag_list_copy_value;

/** */
alias gst_tag_list_replace = c_gst_tag_list_replace;

/** */
alias gst_tag_list_take = c_gst_tag_list_take;

// TagSetter

/** */
alias gst_tag_setter_get_type = c_gst_tag_setter_get_type;

/** */
alias gst_tag_setter_add_tag_valist = c_gst_tag_setter_add_tag_valist;

/** */
alias gst_tag_setter_add_tag_valist_values = c_gst_tag_setter_add_tag_valist_values;

/** */
alias gst_tag_setter_add_tag_value = c_gst_tag_setter_add_tag_value;

/** */
alias gst_tag_setter_add_tag_values = c_gst_tag_setter_add_tag_values;

/** */
alias gst_tag_setter_add_tags = c_gst_tag_setter_add_tags;

/** */
alias gst_tag_setter_get_tag_list = c_gst_tag_setter_get_tag_list;

/** */
alias gst_tag_setter_get_tag_merge_mode = c_gst_tag_setter_get_tag_merge_mode;

/** */
alias gst_tag_setter_merge_tags = c_gst_tag_setter_merge_tags;

/** */
alias gst_tag_setter_reset_tags = c_gst_tag_setter_reset_tags;

/** */
alias gst_tag_setter_set_tag_merge_mode = c_gst_tag_setter_set_tag_merge_mode;

// Task

/** */
alias gst_task_get_type = c_gst_task_get_type;

/** */
alias gst_task_new = c_gst_task_new;

/** */
alias gst_task_cleanup_all = c_gst_task_cleanup_all;

/** */
alias gst_task_get_pool = c_gst_task_get_pool;

/** */
alias gst_task_get_state = c_gst_task_get_state;

/** */
alias gst_task_join = c_gst_task_join;

/** */
alias gst_task_pause = c_gst_task_pause;

/** */
alias gst_task_resume = c_gst_task_resume;

/** */
alias gst_task_set_enter_callback = c_gst_task_set_enter_callback;

/** */
alias gst_task_set_leave_callback = c_gst_task_set_leave_callback;

/** */
alias gst_task_set_lock = c_gst_task_set_lock;

/** */
alias gst_task_set_pool = c_gst_task_set_pool;

/** */
alias gst_task_set_state = c_gst_task_set_state;

/** */
alias gst_task_start = c_gst_task_start;

/** */
alias gst_task_stop = c_gst_task_stop;

// TaskPool

/** */
alias gst_task_pool_get_type = c_gst_task_pool_get_type;

/** */
alias gst_task_pool_new = c_gst_task_pool_new;

/** */
alias gst_task_pool_cleanup = c_gst_task_pool_cleanup;

/** */
alias gst_task_pool_dispose_handle = c_gst_task_pool_dispose_handle;

/** */
alias gst_task_pool_join = c_gst_task_pool_join;

/** */
alias gst_task_pool_prepare = c_gst_task_pool_prepare;

/** */
alias gst_task_pool_push = c_gst_task_pool_push;

// Toc

/** */
alias gst_toc_get_type = c_gst_toc_get_type;

/** */
alias gst_toc_new = c_gst_toc_new;

/** */
alias gst_toc_append_entry = c_gst_toc_append_entry;

/** */
alias gst_toc_dump = c_gst_toc_dump;

/** */
alias gst_toc_find_entry = c_gst_toc_find_entry;

/** */
alias gst_toc_get_entries = c_gst_toc_get_entries;

/** */
alias gst_toc_get_scope = c_gst_toc_get_scope;

/** */
alias gst_toc_get_tags = c_gst_toc_get_tags;

/** */
alias gst_toc_merge_tags = c_gst_toc_merge_tags;

/** */
alias gst_toc_set_tags = c_gst_toc_set_tags;

// TocEntry

/** */
alias gst_toc_entry_get_type = c_gst_toc_entry_get_type;

/** */
alias gst_toc_entry_new = c_gst_toc_entry_new;

/** */
alias gst_toc_entry_append_sub_entry = c_gst_toc_entry_append_sub_entry;

/** */
alias gst_toc_entry_get_entry_type = c_gst_toc_entry_get_entry_type;

/** */
alias gst_toc_entry_get_loop = c_gst_toc_entry_get_loop;

/** */
alias gst_toc_entry_get_parent = c_gst_toc_entry_get_parent;

/** */
alias gst_toc_entry_get_start_stop_times = c_gst_toc_entry_get_start_stop_times;

/** */
alias gst_toc_entry_get_sub_entries = c_gst_toc_entry_get_sub_entries;

/** */
alias gst_toc_entry_get_tags = c_gst_toc_entry_get_tags;

/** */
alias gst_toc_entry_get_toc = c_gst_toc_entry_get_toc;

/** */
alias gst_toc_entry_get_uid = c_gst_toc_entry_get_uid;

/** */
alias gst_toc_entry_is_alternative = c_gst_toc_entry_is_alternative;

/** */
alias gst_toc_entry_is_sequence = c_gst_toc_entry_is_sequence;

/** */
alias gst_toc_entry_merge_tags = c_gst_toc_entry_merge_tags;

/** */
alias gst_toc_entry_set_loop = c_gst_toc_entry_set_loop;

/** */
alias gst_toc_entry_set_start_stop_times = c_gst_toc_entry_set_start_stop_times;

/** */
alias gst_toc_entry_set_tags = c_gst_toc_entry_set_tags;

// TocSetter

/** */
alias gst_toc_setter_get_type = c_gst_toc_setter_get_type;

/** */
alias gst_toc_setter_get_toc = c_gst_toc_setter_get_toc;

/** */
alias gst_toc_setter_reset = c_gst_toc_setter_reset;

/** */
alias gst_toc_setter_set_toc = c_gst_toc_setter_set_toc;

// Tracer

/** */
alias gst_tracer_get_type = c_gst_tracer_get_type;

/** */
alias gst_tracer_register = c_gst_tracer_register;

// TracerClass

/** */
alias gst_tracer_class_set_use_structure_params = c_gst_tracer_class_set_use_structure_params;

/** */
alias gst_tracer_class_uses_structure_params = c_gst_tracer_class_uses_structure_params;

// TracerFactory

/** */
alias gst_tracer_factory_get_type = c_gst_tracer_factory_get_type;

/** */
alias gst_tracer_factory_get_list = c_gst_tracer_factory_get_list;

/** */
alias gst_tracer_factory_get_tracer_type = c_gst_tracer_factory_get_tracer_type;

// TracerRecord

/** */
alias gst_tracer_record_get_type = c_gst_tracer_record_get_type;

/** */
alias gst_tracer_record_new = c_gst_tracer_record_new;

/** */
alias gst_tracer_record_log = c_gst_tracer_record_log;

// TypeFind

/** */
alias gst_type_find_get_type = c_gst_type_find_get_type;

/** */
alias gst_type_find_get_length = c_gst_type_find_get_length;

/** */
alias gst_type_find_peek = c_gst_type_find_peek;

/** */
alias gst_type_find_suggest = c_gst_type_find_suggest;

/** */
alias gst_type_find_suggest_empty_simple = c_gst_type_find_suggest_empty_simple;

/** */
alias gst_type_find_suggest_simple = c_gst_type_find_suggest_simple;

/** */
alias gst_type_find_register = c_gst_type_find_register;

// TypeFindFactory

/** */
alias gst_type_find_factory_get_type = c_gst_type_find_factory_get_type;

/** */
alias gst_type_find_factory_get_list = c_gst_type_find_factory_get_list;

/** */
alias gst_type_find_factory_call_function = c_gst_type_find_factory_call_function;

/** */
alias gst_type_find_factory_get_caps = c_gst_type_find_factory_get_caps;

/** */
alias gst_type_find_factory_get_extensions = c_gst_type_find_factory_get_extensions;

/** */
alias gst_type_find_factory_has_function = c_gst_type_find_factory_has_function;

// URIHandler

/** */
alias gst_uri_handler_get_type = c_gst_uri_handler_get_type;

/** */
alias gst_uri_handler_get_protocols = c_gst_uri_handler_get_protocols;

/** */
alias gst_uri_handler_get_uri = c_gst_uri_handler_get_uri;

/** */
alias gst_uri_handler_get_uri_type = c_gst_uri_handler_get_uri_type;

/** */
alias gst_uri_handler_set_uri = c_gst_uri_handler_set_uri;

// Uri

/** */
alias gst_uri_get_type = c_gst_uri_get_type;

/** */
alias gst_uri_new = c_gst_uri_new;

/** */
alias gst_uri_append_path = c_gst_uri_append_path;

/** */
alias gst_uri_append_path_segment = c_gst_uri_append_path_segment;

/** */
alias gst_uri_copy = c_gst_uri_copy;

/** */
alias gst_uri_equal = c_gst_uri_equal;

/** */
alias gst_uri_from_string_with_base = c_gst_uri_from_string_with_base;

/** */
alias gst_uri_get_fragment = c_gst_uri_get_fragment;

/** */
alias gst_uri_get_host = c_gst_uri_get_host;

/** */
alias gst_uri_get_media_fragment_table = c_gst_uri_get_media_fragment_table;

/** */
alias gst_uri_get_path = c_gst_uri_get_path;

/** */
alias gst_uri_get_path_segments = c_gst_uri_get_path_segments;

/** */
alias gst_uri_get_path_string = c_gst_uri_get_path_string;

/** */
alias gst_uri_get_port = c_gst_uri_get_port;

/** */
alias gst_uri_get_query_keys = c_gst_uri_get_query_keys;

/** */
alias gst_uri_get_query_string = c_gst_uri_get_query_string;

/** */
alias gst_uri_get_query_string_ordered = c_gst_uri_get_query_string_ordered;

/** */
alias gst_uri_get_query_table = c_gst_uri_get_query_table;

/** */
alias gst_uri_get_query_value = c_gst_uri_get_query_value;

/** */
alias gst_uri_get_scheme = c_gst_uri_get_scheme;

/** */
alias gst_uri_get_userinfo = c_gst_uri_get_userinfo;

/** */
alias gst_uri_is_normalized = c_gst_uri_is_normalized;

/** */
alias gst_uri_is_writable = c_gst_uri_is_writable;

/** */
alias gst_uri_join = c_gst_uri_join;

/** */
alias gst_uri_make_writable = c_gst_uri_make_writable;

/** */
alias gst_uri_new_with_base = c_gst_uri_new_with_base;

/** */
alias gst_uri_normalize = c_gst_uri_normalize;

/** */
alias gst_uri_query_has_key = c_gst_uri_query_has_key;

/** */
alias gst_uri_ref = c_gst_uri_ref;

/** */
alias gst_uri_remove_query_key = c_gst_uri_remove_query_key;

/** */
alias gst_uri_set_fragment = c_gst_uri_set_fragment;

/** */
alias gst_uri_set_host = c_gst_uri_set_host;

/** */
alias gst_uri_set_path = c_gst_uri_set_path;

/** */
alias gst_uri_set_path_segments = c_gst_uri_set_path_segments;

/** */
alias gst_uri_set_path_string = c_gst_uri_set_path_string;

/** */
alias gst_uri_set_port = c_gst_uri_set_port;

/** */
alias gst_uri_set_query_string = c_gst_uri_set_query_string;

/** */
alias gst_uri_set_query_table = c_gst_uri_set_query_table;

/** */
alias gst_uri_set_query_value = c_gst_uri_set_query_value;

/** */
alias gst_uri_set_scheme = c_gst_uri_set_scheme;

/** */
alias gst_uri_set_userinfo = c_gst_uri_set_userinfo;

/** */
alias gst_uri_to_string = c_gst_uri_to_string;

/** */
alias gst_uri_to_string_with_keys = c_gst_uri_to_string_with_keys;

/** */
alias gst_uri_unref = c_gst_uri_unref;

/** */
alias gst_uri_construct = c_gst_uri_construct;

/** */
alias gst_uri_from_string = c_gst_uri_from_string;

/** */
alias gst_uri_from_string_escaped = c_gst_uri_from_string_escaped;

/** */
alias gst_uri_get_location = c_gst_uri_get_location;

/** */
alias gst_uri_get_protocol = c_gst_uri_get_protocol;

/** */
alias gst_uri_has_protocol = c_gst_uri_has_protocol;

/** */
alias gst_uri_is_valid = c_gst_uri_is_valid;

/** */
alias gst_uri_join_strings = c_gst_uri_join_strings;

/** */
alias gst_uri_protocol_is_supported = c_gst_uri_protocol_is_supported;

/** */
alias gst_uri_protocol_is_valid = c_gst_uri_protocol_is_valid;

// ValueArray

/** */
alias gst_value_array_get_type = c_gst_value_array_get_type;

/** */
alias gst_value_array_append_and_take_value = c_gst_value_array_append_and_take_value;

/** */
alias gst_value_array_append_value = c_gst_value_array_append_value;

/** */
alias gst_value_array_get_size = c_gst_value_array_get_size;

/** */
alias gst_value_array_get_value = c_gst_value_array_get_value;

/** */
alias gst_value_array_init = c_gst_value_array_init;

/** */
alias gst_value_array_prepend_value = c_gst_value_array_prepend_value;

// ValueList

/** */
alias gst_value_list_get_type = c_gst_value_list_get_type;

/** */
alias gst_value_list_append_and_take_value = c_gst_value_list_append_and_take_value;

/** */
alias gst_value_list_append_value = c_gst_value_list_append_value;

/** */
alias gst_value_list_concat = c_gst_value_list_concat;

/** */
alias gst_value_list_get_size = c_gst_value_list_get_size;

/** */
alias gst_value_list_get_value = c_gst_value_list_get_value;

/** */
alias gst_value_list_init = c_gst_value_list_init;

/** */
alias gst_value_list_merge = c_gst_value_list_merge;

/** */
alias gst_value_list_prepend_value = c_gst_value_list_prepend_value;

// ValueUniqueList

/** */
alias gst_value_unique_list_get_type = c_gst_value_unique_list_get_type;

/** */
alias gst_value_unique_list_append_and_take_value = c_gst_value_unique_list_append_and_take_value;

/** */
alias gst_value_unique_list_append_value = c_gst_value_unique_list_append_value;

/** */
alias gst_value_unique_list_concat = c_gst_value_unique_list_concat;

/** */
alias gst_value_unique_list_get_size = c_gst_value_unique_list_get_size;

/** */
alias gst_value_unique_list_get_value = c_gst_value_unique_list_get_value;

/** */
alias gst_value_unique_list_prepend_value = c_gst_value_unique_list_prepend_value;

// VecDeque

/** */
alias gst_vec_deque_clear = c_gst_vec_deque_clear;

/** */
alias gst_vec_deque_drop_element = c_gst_vec_deque_drop_element;

/** */
alias gst_vec_deque_drop_struct = c_gst_vec_deque_drop_struct;

/** */
alias gst_vec_deque_find = c_gst_vec_deque_find;

/** */
alias gst_vec_deque_free = c_gst_vec_deque_free;

/** */
alias gst_vec_deque_get_length = c_gst_vec_deque_get_length;

/** */
alias gst_vec_deque_is_empty = c_gst_vec_deque_is_empty;

/** */
alias gst_vec_deque_peek_head = c_gst_vec_deque_peek_head;

/** */
alias gst_vec_deque_peek_head_struct = c_gst_vec_deque_peek_head_struct;

/** */
alias gst_vec_deque_peek_nth = c_gst_vec_deque_peek_nth;

/** */
alias gst_vec_deque_peek_nth_struct = c_gst_vec_deque_peek_nth_struct;

/** */
alias gst_vec_deque_peek_tail = c_gst_vec_deque_peek_tail;

/** */
alias gst_vec_deque_peek_tail_struct = c_gst_vec_deque_peek_tail_struct;

/** */
alias gst_vec_deque_pop_head = c_gst_vec_deque_pop_head;

/** */
alias gst_vec_deque_pop_head_struct = c_gst_vec_deque_pop_head_struct;

/** */
alias gst_vec_deque_pop_tail = c_gst_vec_deque_pop_tail;

/** */
alias gst_vec_deque_pop_tail_struct = c_gst_vec_deque_pop_tail_struct;

/** */
alias gst_vec_deque_push_sorted = c_gst_vec_deque_push_sorted;

/** */
alias gst_vec_deque_push_sorted_struct = c_gst_vec_deque_push_sorted_struct;

/** */
alias gst_vec_deque_push_tail = c_gst_vec_deque_push_tail;

/** */
alias gst_vec_deque_push_tail_struct = c_gst_vec_deque_push_tail_struct;

/** */
alias gst_vec_deque_set_clear_func = c_gst_vec_deque_set_clear_func;

/** */
alias gst_vec_deque_sort = c_gst_vec_deque_sort;

/** */
alias gst_vec_deque_new = c_gst_vec_deque_new;

/** */
alias gst_vec_deque_new_for_struct = c_gst_vec_deque_new_for_struct;

// global

/** */
alias gst_calculate_linear_regression = c_gst_calculate_linear_regression;

/** */
alias gst_call_async = c_gst_call_async;

/** */
alias gst_check_version = c_gst_check_version;

/** */
alias gst_clear_buffer = c_gst_clear_buffer;

/** */
alias gst_clear_buffer_list = c_gst_clear_buffer_list;

/** */
alias gst_clear_caps = c_gst_clear_caps;

/** */
alias gst_clear_context = c_gst_clear_context;

/** */
alias gst_clear_event = c_gst_clear_event;

/** */
alias gst_clear_message = c_gst_clear_message;

/** */
alias gst_clear_mini_object = c_gst_clear_mini_object;

/** */
alias gst_clear_object = c_gst_clear_object;

/** */
alias gst_clear_promise = c_gst_clear_promise;

/** */
alias gst_clear_query = c_gst_clear_query;

/** */
alias gst_clear_sample = c_gst_clear_sample;

/** */
alias gst_clear_structure = c_gst_clear_structure;

/** */
alias gst_clear_tag_list = c_gst_clear_tag_list;

/** */
alias gst_clear_uri = c_gst_clear_uri;

/** */
alias gst_cpuid_supports_arm_neon = c_gst_cpuid_supports_arm_neon;

/** */
alias gst_cpuid_supports_arm_neon64 = c_gst_cpuid_supports_arm_neon64;

/** */
alias gst_cpuid_supports_x86_3dnow = c_gst_cpuid_supports_x86_3dnow;

/** */
alias gst_cpuid_supports_x86_avx = c_gst_cpuid_supports_x86_avx;

/** */
alias gst_cpuid_supports_x86_avx2 = c_gst_cpuid_supports_x86_avx2;

/** */
alias gst_cpuid_supports_x86_mmx = c_gst_cpuid_supports_x86_mmx;

/** */
alias gst_cpuid_supports_x86_mmxext = c_gst_cpuid_supports_x86_mmxext;

/** */
alias gst_cpuid_supports_x86_sse2 = c_gst_cpuid_supports_x86_sse2;

/** */
alias gst_cpuid_supports_x86_sse3 = c_gst_cpuid_supports_x86_sse3;

/** */
alias gst_cpuid_supports_x86_sse4_1 = c_gst_cpuid_supports_x86_sse4_1;

/** */
alias gst_cpuid_supports_x86_sse4_2 = c_gst_cpuid_supports_x86_sse4_2;

/** */
alias gst_cpuid_supports_x86_ssse3 = c_gst_cpuid_supports_x86_ssse3;

/** */
alias gst_debug_add_log_function = c_gst_debug_add_log_function;

/** */
alias gst_debug_add_ring_buffer_logger = c_gst_debug_add_ring_buffer_logger;

/** */
alias gst_debug_bin_to_dot_data = c_gst_debug_bin_to_dot_data;

/** */
alias gst_debug_bin_to_dot_file = c_gst_debug_bin_to_dot_file;

/** */
alias gst_debug_bin_to_dot_file_with_ts = c_gst_debug_bin_to_dot_file_with_ts;

/** */
alias gst_debug_construct_term_color = c_gst_debug_construct_term_color;

/** */
alias gst_debug_construct_win_color = c_gst_debug_construct_win_color;

/** */
alias gst_debug_get_all_categories = c_gst_debug_get_all_categories;

/** */
alias gst_debug_get_color_mode = c_gst_debug_get_color_mode;

/** */
alias gst_debug_get_default_threshold = c_gst_debug_get_default_threshold;

/** */
alias gst_debug_get_stack_trace = c_gst_debug_get_stack_trace;

/** */
alias gst_debug_is_active = c_gst_debug_is_active;

/** */
alias gst_debug_is_colored = c_gst_debug_is_colored;

/** */
alias gst_debug_log = c_gst_debug_log;

/** */
alias gst_debug_log_default = c_gst_debug_log_default;

/** */
alias gst_debug_log_get_line = c_gst_debug_log_get_line;

/** */
alias gst_debug_log_id = c_gst_debug_log_id;

/** */
alias gst_debug_log_id_literal = c_gst_debug_log_id_literal;

/** */
alias gst_debug_log_id_literal_with_context = c_gst_debug_log_id_literal_with_context;

/** */
alias gst_debug_log_id_valist = c_gst_debug_log_id_valist;

/** */
alias gst_debug_log_id_with_context = c_gst_debug_log_id_with_context;

/** */
alias gst_debug_log_id_with_context_valist = c_gst_debug_log_id_with_context_valist;

/** */
alias gst_debug_log_literal = c_gst_debug_log_literal;

/** */
alias gst_debug_log_literal_with_context = c_gst_debug_log_literal_with_context;

/** */
alias gst_debug_log_valist = c_gst_debug_log_valist;

/** */
alias gst_debug_log_with_context = c_gst_debug_log_with_context;

/** */
alias gst_debug_log_with_context_valist = c_gst_debug_log_with_context_valist;

/** */
alias gst_debug_print_object = c_gst_debug_print_object;

/** */
alias gst_debug_print_segment = c_gst_debug_print_segment;

/** */
alias gst_debug_print_stack_trace = c_gst_debug_print_stack_trace;

/** */
alias gst_debug_remove_log_function = c_gst_debug_remove_log_function;

/** */
alias gst_debug_remove_log_function_by_data = c_gst_debug_remove_log_function_by_data;

/** */
alias gst_debug_remove_ring_buffer_logger = c_gst_debug_remove_ring_buffer_logger;

/** */
alias gst_debug_ring_buffer_logger_get_logs = c_gst_debug_ring_buffer_logger_get_logs;

/** */
alias gst_debug_set_active = c_gst_debug_set_active;

/** */
alias gst_debug_set_color_mode = c_gst_debug_set_color_mode;

/** */
alias gst_debug_set_color_mode_from_string = c_gst_debug_set_color_mode_from_string;

/** */
alias gst_debug_set_colored = c_gst_debug_set_colored;

/** */
alias gst_debug_set_default_threshold = c_gst_debug_set_default_threshold;

/** */
alias gst_debug_set_threshold_for_name = c_gst_debug_set_threshold_for_name;

/** */
alias gst_debug_set_threshold_from_string = c_gst_debug_set_threshold_from_string;

/** */
alias gst_debug_unset_threshold_for_name = c_gst_debug_unset_threshold_for_name;

/** */
alias gst_deinit = c_gst_deinit;

/** */
alias gst_dynamic_type_register = c_gst_dynamic_type_register;

/** */
alias gst_error_get_message = c_gst_error_get_message;

/** */
alias gst_filename_to_uri = c_gst_filename_to_uri;

/** */
alias gst_flow_get_name = c_gst_flow_get_name;

/** */
alias gst_flow_to_quark = c_gst_flow_to_quark;

/** */
alias gst_formats_contains = c_gst_formats_contains;

/** */
alias gst_get_main_executable_path = c_gst_get_main_executable_path;

/** */
alias gst_info_strdup_printf = c_gst_info_strdup_printf;

/** */
alias gst_info_strdup_vprintf = c_gst_info_strdup_vprintf;

/** */
alias gst_info_vasprintf = c_gst_info_vasprintf;

/** */
alias gst_init = c_gst_init;

/** */
alias gst_init_check = c_gst_init_check;

/** */
alias gst_init_get_option_group = c_gst_init_get_option_group;

/** */
alias gst_is_caps_features = c_gst_is_caps_features;

/** */
alias gst_is_initialized = c_gst_is_initialized;

/** */
alias gst_make_element_message_details = c_gst_make_element_message_details;

/** */
alias gst_param_spec_array = c_gst_param_spec_array;

/** */
alias gst_param_spec_fraction = c_gst_param_spec_fraction;

/** */
alias gst_parent_buffer_meta_api_get_type = c_gst_parent_buffer_meta_api_get_type;

/** */
alias gst_parse_bin_from_description = c_gst_parse_bin_from_description;

/** */
alias gst_parse_bin_from_description_full = c_gst_parse_bin_from_description_full;

/** */
alias gst_parse_launch = c_gst_parse_launch;

/** */
alias gst_parse_launch_full = c_gst_parse_launch_full;

/** */
alias gst_parse_launchv = c_gst_parse_launchv;

/** */
alias gst_parse_launchv_full = c_gst_parse_launchv_full;

/** */
alias gst_print = c_gst_print;

/** */
alias gst_printerr = c_gst_printerr;

/** */
alias gst_printerrln = c_gst_printerrln;

/** */
alias gst_println = c_gst_println;

/** */
alias gst_protection_filter_systems_by_available_decryptors = c_gst_protection_filter_systems_by_available_decryptors;

/** */
alias gst_protection_meta_api_get_type = c_gst_protection_meta_api_get_type;

/** */
alias gst_protection_select_system = c_gst_protection_select_system;

/** */
alias gst_reference_timestamp_meta_api_get_type = c_gst_reference_timestamp_meta_api_get_type;

/** */
alias gst_segtrap_is_enabled = c_gst_segtrap_is_enabled;

/** */
alias gst_segtrap_set_enabled = c_gst_segtrap_set_enabled;

/** */
alias gst_tag_exists = c_gst_tag_exists;

/** */
alias gst_tag_get_description = c_gst_tag_get_description;

/** */
alias gst_tag_get_flag = c_gst_tag_get_flag;

/** */
alias gst_tag_get_nick = c_gst_tag_get_nick;

/** */
alias gst_tag_get_type = c_gst_tag_get_type;

/** */
alias gst_tag_is_fixed = c_gst_tag_is_fixed;

/** */
alias gst_tag_merge_strings_with_comma = c_gst_tag_merge_strings_with_comma;

/** */
alias gst_tag_merge_use_first = c_gst_tag_merge_use_first;

/** */
alias gst_tag_register = c_gst_tag_register;

/** */
alias gst_tag_register_static = c_gst_tag_register_static;

/** */
alias gst_tracing_get_active_tracers = c_gst_tracing_get_active_tracers;

/** */
alias gst_tracing_register_hook = c_gst_tracing_register_hook;

/** */
alias gst_type_is_plugin_api = c_gst_type_is_plugin_api;

/** */
alias gst_type_mark_as_plugin_api = c_gst_type_mark_as_plugin_api;

/** */
alias gst_update_registry = c_gst_update_registry;

/** */
alias gst_util_array_binary_search = c_gst_util_array_binary_search;

/** */
alias gst_util_ceil_log2 = c_gst_util_ceil_log2;

/** */
alias gst_util_double_to_fraction = c_gst_util_double_to_fraction;

/** */
alias gst_util_dump_buffer = c_gst_util_dump_buffer;

/** */
alias gst_util_dump_mem = c_gst_util_dump_mem;

/** */
alias gst_util_filename_compare = c_gst_util_filename_compare;

/** */
alias gst_util_floor_log2 = c_gst_util_floor_log2;

/** */
alias gst_util_fraction_add = c_gst_util_fraction_add;

/** */
alias gst_util_fraction_compare = c_gst_util_fraction_compare;

/** */
alias gst_util_fraction_multiply = c_gst_util_fraction_multiply;

/** */
alias gst_util_fraction_multiply_int64 = c_gst_util_fraction_multiply_int64;

/** */
alias gst_util_fraction_to_double = c_gst_util_fraction_to_double;

/** */
alias gst_util_gdouble_to_guint64 = c_gst_util_gdouble_to_guint64;

/** */
alias gst_util_get_object_array = c_gst_util_get_object_array;

/** */
alias gst_util_get_timestamp = c_gst_util_get_timestamp;

/** */
alias gst_util_greatest_common_divisor = c_gst_util_greatest_common_divisor;

/** */
alias gst_util_greatest_common_divisor_int64 = c_gst_util_greatest_common_divisor_int64;

/** */
alias gst_util_group_id_next = c_gst_util_group_id_next;

/** */
alias gst_util_guint64_to_gdouble = c_gst_util_guint64_to_gdouble;

/** */
alias gst_util_seqnum_compare = c_gst_util_seqnum_compare;

/** */
alias gst_util_seqnum_next = c_gst_util_seqnum_next;

/** */
alias gst_util_set_object_arg = c_gst_util_set_object_arg;

/** */
alias gst_util_set_object_array = c_gst_util_set_object_array;

/** */
alias gst_util_set_value_from_string = c_gst_util_set_value_from_string;

/** */
alias gst_util_simplify_fraction = c_gst_util_simplify_fraction;

/** */
alias gst_util_uint64_scale = c_gst_util_uint64_scale;

/** */
alias gst_util_uint64_scale_ceil = c_gst_util_uint64_scale_ceil;

/** */
alias gst_util_uint64_scale_int = c_gst_util_uint64_scale_int;

/** */
alias gst_util_uint64_scale_int_ceil = c_gst_util_uint64_scale_int_ceil;

/** */
alias gst_util_uint64_scale_int_round = c_gst_util_uint64_scale_int_round;

/** */
alias gst_util_uint64_scale_round = c_gst_util_uint64_scale_round;

/** */
alias gst_value_can_compare = c_gst_value_can_compare;

/** */
alias gst_value_can_intersect = c_gst_value_can_intersect;

/** */
alias gst_value_can_subtract = c_gst_value_can_subtract;

/** */
alias gst_value_can_union = c_gst_value_can_union;

/** */
alias gst_value_compare = c_gst_value_compare;

/** */
alias gst_value_deserialize = c_gst_value_deserialize;

/** */
alias gst_value_deserialize_with_pspec = c_gst_value_deserialize_with_pspec;

/** */
alias gst_value_fixate = c_gst_value_fixate;

/** */
alias gst_value_fraction_multiply = c_gst_value_fraction_multiply;

/** */
alias gst_value_fraction_subtract = c_gst_value_fraction_subtract;

/** */
alias gst_value_get_bitmask = c_gst_value_get_bitmask;

/** */
alias gst_value_get_caps = c_gst_value_get_caps;

/** */
alias gst_value_get_caps_features = c_gst_value_get_caps_features;

/** */
alias gst_value_get_double_range_max = c_gst_value_get_double_range_max;

/** */
alias gst_value_get_double_range_min = c_gst_value_get_double_range_min;

/** */
alias gst_value_get_flagset_flags = c_gst_value_get_flagset_flags;

/** */
alias gst_value_get_flagset_mask = c_gst_value_get_flagset_mask;

/** */
alias gst_value_get_fraction_denominator = c_gst_value_get_fraction_denominator;

/** */
alias gst_value_get_fraction_numerator = c_gst_value_get_fraction_numerator;

/** */
alias gst_value_get_fraction_range_max = c_gst_value_get_fraction_range_max;

/** */
alias gst_value_get_fraction_range_min = c_gst_value_get_fraction_range_min;

/** */
alias gst_value_get_int64_range_max = c_gst_value_get_int64_range_max;

/** */
alias gst_value_get_int64_range_min = c_gst_value_get_int64_range_min;

/** */
alias gst_value_get_int64_range_step = c_gst_value_get_int64_range_step;

/** */
alias gst_value_get_int_range_max = c_gst_value_get_int_range_max;

/** */
alias gst_value_get_int_range_min = c_gst_value_get_int_range_min;

/** */
alias gst_value_get_int_range_step = c_gst_value_get_int_range_step;

/** */
alias gst_value_get_structure = c_gst_value_get_structure;

/** */
alias gst_value_hash = c_gst_value_hash;

/** */
alias gst_value_init_and_copy = c_gst_value_init_and_copy;

/** */
alias gst_value_intersect = c_gst_value_intersect;

/** */
alias gst_value_is_fixed = c_gst_value_is_fixed;

/** */
alias gst_value_is_subset = c_gst_value_is_subset;

/** */
alias gst_value_register = c_gst_value_register;

/** */
alias gst_value_serialize = c_gst_value_serialize;

/** */
alias gst_value_set_bitmask = c_gst_value_set_bitmask;

/** */
alias gst_value_set_caps = c_gst_value_set_caps;

/** */
alias gst_value_set_caps_features = c_gst_value_set_caps_features;

/** */
alias gst_value_set_double_range = c_gst_value_set_double_range;

/** */
alias gst_value_set_flagset = c_gst_value_set_flagset;

/** */
alias gst_value_set_fraction = c_gst_value_set_fraction;

/** */
alias gst_value_set_fraction_range = c_gst_value_set_fraction_range;

/** */
alias gst_value_set_fraction_range_full = c_gst_value_set_fraction_range_full;

/** */
alias gst_value_set_int64_range = c_gst_value_set_int64_range;

/** */
alias gst_value_set_int64_range_step = c_gst_value_set_int64_range_step;

/** */
alias gst_value_set_int_range = c_gst_value_set_int_range;

/** */
alias gst_value_set_int_range_step = c_gst_value_set_int_range_step;

/** */
alias gst_value_set_structure = c_gst_value_set_structure;

/** */
alias gst_value_subtract = c_gst_value_subtract;

/** */
alias gst_value_union = c_gst_value_union;

/** */
alias gst_version = c_gst_version;

/** */
alias gst_version_string = c_gst_version_string;

// CoreError

/** */
alias gst_core_error_quark = c_gst_core_error_quark;

// DebugLevel

/** */
alias gst_debug_level_get_name = c_gst_debug_level_get_name;

// EventType

/** */
alias gst_event_type_get_flags = c_gst_event_type_get_flags;

/** */
alias gst_event_type_get_name = c_gst_event_type_get_name;

/** */
alias gst_event_type_to_quark = c_gst_event_type_to_quark;

/** */
alias gst_event_type_to_sticky_ordering = c_gst_event_type_to_sticky_ordering;

// Format

/** */
alias gst_format_get_by_nick = c_gst_format_get_by_nick;

/** */
alias gst_format_get_details = c_gst_format_get_details;

/** */
alias gst_format_get_name = c_gst_format_get_name;

/** */
alias gst_format_iterate_definitions = c_gst_format_iterate_definitions;

/** */
alias gst_format_register = c_gst_format_register;

/** */
alias gst_format_to_quark = c_gst_format_to_quark;

// LibraryError

/** */
alias gst_library_error_quark = c_gst_library_error_quark;

// MessageType

/** */
alias gst_message_type_get_name = c_gst_message_type_get_name;

/** */
alias gst_message_type_to_quark = c_gst_message_type_to_quark;

// PadMode

/** */
alias gst_pad_mode_get_name = c_gst_pad_mode_get_name;

// ParseError

/** */
alias gst_parse_error_quark = c_gst_parse_error_quark;

// PluginError

/** */
alias gst_plugin_error_quark = c_gst_plugin_error_quark;

// QueryType

/** */
alias gst_query_type_get_flags = c_gst_query_type_get_flags;

/** */
alias gst_query_type_get_name = c_gst_query_type_get_name;

/** */
alias gst_query_type_to_quark = c_gst_query_type_to_quark;

// ResourceError

/** */
alias gst_resource_error_quark = c_gst_resource_error_quark;

// State

/** */
alias gst_state_get_name = c_gst_state_get_name;

// StateChange

/** */
alias gst_state_change_get_name = c_gst_state_change_get_name;

// StateChangeReturn

/** */
alias gst_state_change_return_get_name = c_gst_state_change_return_get_name;

// StreamError

/** */
alias gst_stream_error_quark = c_gst_stream_error_quark;

// StreamType

/** */
alias gst_stream_type_get_name = c_gst_stream_type_get_name;

// TocEntryType

/** */
alias gst_toc_entry_type_get_nick = c_gst_toc_entry_type_get_nick;

// URIError

/** */
alias gst_uri_error_quark = c_gst_uri_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gst1");

  // AllocationParams
  gidLink(cast(void**)&gst_allocation_params_get_type, "gst_allocation_params_get_type", libs);
  gidLink(cast(void**)&gst_allocation_params_new, "gst_allocation_params_new", libs);
  gidLink(cast(void**)&gst_allocation_params_copy, "gst_allocation_params_copy", libs);
  gidLink(cast(void**)&gst_allocation_params_free, "gst_allocation_params_free", libs);
  gidLink(cast(void**)&gst_allocation_params_init, "gst_allocation_params_init", libs);

  // Allocator
  gidLink(cast(void**)&gst_allocator_get_type, "gst_allocator_get_type", libs);
  gidLink(cast(void**)&gst_allocator_find, "gst_allocator_find", libs);
  gidLink(cast(void**)&gst_allocator_register, "gst_allocator_register", libs);
  gidLink(cast(void**)&gst_allocator_alloc, "gst_allocator_alloc", libs);
  gidLink(cast(void**)&gst_allocator_free, "gst_allocator_free", libs);
  gidLink(cast(void**)&gst_allocator_set_default, "gst_allocator_set_default", libs);

  // AtomicQueue
  gidLink(cast(void**)&gst_atomic_queue_get_type, "gst_atomic_queue_get_type", libs);
  gidLink(cast(void**)&gst_atomic_queue_new, "gst_atomic_queue_new", libs);
  gidLink(cast(void**)&gst_atomic_queue_length, "gst_atomic_queue_length", libs);
  gidLink(cast(void**)&gst_atomic_queue_peek, "gst_atomic_queue_peek", libs);
  gidLink(cast(void**)&gst_atomic_queue_pop, "gst_atomic_queue_pop", libs);
  gidLink(cast(void**)&gst_atomic_queue_push, "gst_atomic_queue_push", libs);
  gidLink(cast(void**)&gst_atomic_queue_ref, "gst_atomic_queue_ref", libs);
  gidLink(cast(void**)&gst_atomic_queue_unref, "gst_atomic_queue_unref", libs);

  // Bin
  gidLink(cast(void**)&gst_bin_get_type, "gst_bin_get_type", libs);
  gidLink(cast(void**)&gst_bin_new, "gst_bin_new", libs);
  gidLink(cast(void**)&gst_bin_add, "gst_bin_add", libs);
  gidLink(cast(void**)&gst_bin_add_many, "gst_bin_add_many", libs);
  gidLink(cast(void**)&gst_bin_find_unlinked_pad, "gst_bin_find_unlinked_pad", libs);
  gidLink(cast(void**)&gst_bin_get_by_interface, "gst_bin_get_by_interface", libs);
  gidLink(cast(void**)&gst_bin_get_by_name, "gst_bin_get_by_name", libs);
  gidLink(cast(void**)&gst_bin_get_by_name_recurse_up, "gst_bin_get_by_name_recurse_up", libs);
  gidLink(cast(void**)&gst_bin_get_suppressed_flags, "gst_bin_get_suppressed_flags", libs);
  gidLink(cast(void**)&gst_bin_iterate_all_by_element_factory_name, "gst_bin_iterate_all_by_element_factory_name", libs);
  gidLink(cast(void**)&gst_bin_iterate_all_by_interface, "gst_bin_iterate_all_by_interface", libs);
  gidLink(cast(void**)&gst_bin_iterate_elements, "gst_bin_iterate_elements", libs);
  gidLink(cast(void**)&gst_bin_iterate_recurse, "gst_bin_iterate_recurse", libs);
  gidLink(cast(void**)&gst_bin_iterate_sinks, "gst_bin_iterate_sinks", libs);
  gidLink(cast(void**)&gst_bin_iterate_sorted, "gst_bin_iterate_sorted", libs);
  gidLink(cast(void**)&gst_bin_iterate_sources, "gst_bin_iterate_sources", libs);
  gidLink(cast(void**)&gst_bin_recalculate_latency, "gst_bin_recalculate_latency", libs);
  gidLink(cast(void**)&gst_bin_remove, "gst_bin_remove", libs);
  gidLink(cast(void**)&gst_bin_remove_many, "gst_bin_remove_many", libs);
  gidLink(cast(void**)&gst_bin_set_suppressed_flags, "gst_bin_set_suppressed_flags", libs);
  gidLink(cast(void**)&gst_bin_sync_children_states, "gst_bin_sync_children_states", libs);

  // Bitmask
  gidLink(cast(void**)&gst_bitmask_get_type, "gst_bitmask_get_type", libs);

  // Buffer
  gidLink(cast(void**)&gst_buffer_get_type, "gst_buffer_get_type", libs);
  gidLink(cast(void**)&gst_buffer_new, "gst_buffer_new", libs);
  gidLink(cast(void**)&gst_buffer_new_allocate, "gst_buffer_new_allocate", libs);
  gidLink(cast(void**)&gst_buffer_new_memdup, "gst_buffer_new_memdup", libs);
  gidLink(cast(void**)&gst_buffer_new_wrapped, "gst_buffer_new_wrapped", libs);
  gidLink(cast(void**)&gst_buffer_new_wrapped_bytes, "gst_buffer_new_wrapped_bytes", libs);
  gidLink(cast(void**)&gst_buffer_new_wrapped_full, "gst_buffer_new_wrapped_full", libs);
  gidLink(cast(void**)&gst_buffer_add_custom_meta, "gst_buffer_add_custom_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_meta, "gst_buffer_add_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_parent_buffer_meta, "gst_buffer_add_parent_buffer_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_protection_meta, "gst_buffer_add_protection_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_reference_timestamp_meta, "gst_buffer_add_reference_timestamp_meta", libs);
  gidLink(cast(void**)&gst_buffer_append, "gst_buffer_append", libs);
  gidLink(cast(void**)&gst_buffer_append_memory, "gst_buffer_append_memory", libs);
  gidLink(cast(void**)&gst_buffer_append_region, "gst_buffer_append_region", libs);
  gidLink(cast(void**)&gst_buffer_copy, "gst_buffer_copy", libs);
  gidLink(cast(void**)&gst_buffer_copy_deep, "gst_buffer_copy_deep", libs);
  gidLink(cast(void**)&gst_buffer_copy_into, "gst_buffer_copy_into", libs);
  gidLink(cast(void**)&gst_buffer_copy_region, "gst_buffer_copy_region", libs);
  gidLink(cast(void**)&gst_buffer_extract, "gst_buffer_extract", libs);
  gidLink(cast(void**)&gst_buffer_extract_dup, "gst_buffer_extract_dup", libs);
  gidLink(cast(void**)&gst_buffer_fill, "gst_buffer_fill", libs);
  gidLink(cast(void**)&gst_buffer_find_memory, "gst_buffer_find_memory", libs);
  gidLink(cast(void**)&gst_buffer_foreach_meta, "gst_buffer_foreach_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_all_memory, "gst_buffer_get_all_memory", libs);
  gidLink(cast(void**)&gst_buffer_get_custom_meta, "gst_buffer_get_custom_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_flags, "gst_buffer_get_flags", libs);
  gidLink(cast(void**)&gst_buffer_get_memory, "gst_buffer_get_memory", libs);
  gidLink(cast(void**)&gst_buffer_get_memory_range, "gst_buffer_get_memory_range", libs);
  gidLink(cast(void**)&gst_buffer_get_meta, "gst_buffer_get_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_n_meta, "gst_buffer_get_n_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_reference_timestamp_meta, "gst_buffer_get_reference_timestamp_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_size, "gst_buffer_get_size", libs);
  gidLink(cast(void**)&gst_buffer_get_sizes, "gst_buffer_get_sizes", libs);
  gidLink(cast(void**)&gst_buffer_get_sizes_range, "gst_buffer_get_sizes_range", libs);
  gidLink(cast(void**)&gst_buffer_has_flags, "gst_buffer_has_flags", libs);
  gidLink(cast(void**)&gst_buffer_insert_memory, "gst_buffer_insert_memory", libs);
  gidLink(cast(void**)&gst_buffer_is_all_memory_writable, "gst_buffer_is_all_memory_writable", libs);
  gidLink(cast(void**)&gst_buffer_is_memory_range_writable, "gst_buffer_is_memory_range_writable", libs);
  gidLink(cast(void**)&gst_buffer_is_writable, "gst_buffer_is_writable", libs);
  gidLink(cast(void**)&gst_buffer_iterate_meta, "gst_buffer_iterate_meta", libs);
  gidLink(cast(void**)&gst_buffer_iterate_meta_filtered, "gst_buffer_iterate_meta_filtered", libs);
  gidLink(cast(void**)&gst_buffer_make_writable, "gst_buffer_make_writable", libs);
  gidLink(cast(void**)&gst_buffer_map, "gst_buffer_map", libs);
  gidLink(cast(void**)&gst_buffer_map_range, "gst_buffer_map_range", libs);
  gidLink(cast(void**)&gst_buffer_memcmp, "gst_buffer_memcmp", libs);
  gidLink(cast(void**)&gst_buffer_memset, "gst_buffer_memset", libs);
  gidLink(cast(void**)&gst_buffer_n_memory, "gst_buffer_n_memory", libs);
  gidLink(cast(void**)&gst_buffer_peek_memory, "gst_buffer_peek_memory", libs);
  gidLink(cast(void**)&gst_buffer_prepend_memory, "gst_buffer_prepend_memory", libs);
  gidLink(cast(void**)&gst_buffer_ref, "gst_buffer_ref", libs);
  gidLink(cast(void**)&gst_buffer_remove_all_memory, "gst_buffer_remove_all_memory", libs);
  gidLink(cast(void**)&gst_buffer_remove_memory, "gst_buffer_remove_memory", libs);
  gidLink(cast(void**)&gst_buffer_remove_memory_range, "gst_buffer_remove_memory_range", libs);
  gidLink(cast(void**)&gst_buffer_remove_meta, "gst_buffer_remove_meta", libs);
  gidLink(cast(void**)&gst_buffer_replace_all_memory, "gst_buffer_replace_all_memory", libs);
  gidLink(cast(void**)&gst_buffer_replace_memory, "gst_buffer_replace_memory", libs);
  gidLink(cast(void**)&gst_buffer_replace_memory_range, "gst_buffer_replace_memory_range", libs);
  gidLink(cast(void**)&gst_buffer_resize, "gst_buffer_resize", libs);
  gidLink(cast(void**)&gst_buffer_resize_range, "gst_buffer_resize_range", libs);
  gidLink(cast(void**)&gst_buffer_set_flags, "gst_buffer_set_flags", libs);
  gidLink(cast(void**)&gst_buffer_set_size, "gst_buffer_set_size", libs);
  gidLink(cast(void**)&gst_buffer_unmap, "gst_buffer_unmap", libs);
  gidLink(cast(void**)&gst_buffer_unref, "gst_buffer_unref", libs);
  gidLink(cast(void**)&gst_buffer_unset_flags, "gst_buffer_unset_flags", libs);
  gidLink(cast(void**)&gst_buffer_get_max_memory, "gst_buffer_get_max_memory", libs);
  gidLink(cast(void**)&gst_buffer_replace, "gst_buffer_replace", libs);
  gidLink(cast(void**)&gst_buffer_steal, "gst_buffer_steal", libs);
  gidLink(cast(void**)&gst_buffer_take, "gst_buffer_take", libs);

  // BufferList
  gidLink(cast(void**)&gst_buffer_list_get_type, "gst_buffer_list_get_type", libs);
  gidLink(cast(void**)&gst_buffer_list_new, "gst_buffer_list_new", libs);
  gidLink(cast(void**)&gst_buffer_list_new_sized, "gst_buffer_list_new_sized", libs);
  gidLink(cast(void**)&gst_buffer_list_calculate_size, "gst_buffer_list_calculate_size", libs);
  gidLink(cast(void**)&gst_buffer_list_copy, "gst_buffer_list_copy", libs);
  gidLink(cast(void**)&gst_buffer_list_copy_deep, "gst_buffer_list_copy_deep", libs);
  gidLink(cast(void**)&gst_buffer_list_foreach, "gst_buffer_list_foreach", libs);
  gidLink(cast(void**)&gst_buffer_list_get, "gst_buffer_list_get", libs);
  gidLink(cast(void**)&gst_buffer_list_get_writable, "gst_buffer_list_get_writable", libs);
  gidLink(cast(void**)&gst_buffer_list_insert, "gst_buffer_list_insert", libs);
  gidLink(cast(void**)&gst_buffer_list_is_writable, "gst_buffer_list_is_writable", libs);
  gidLink(cast(void**)&gst_buffer_list_length, "gst_buffer_list_length", libs);
  gidLink(cast(void**)&gst_buffer_list_make_writable, "gst_buffer_list_make_writable", libs);
  gidLink(cast(void**)&gst_buffer_list_ref, "gst_buffer_list_ref", libs);
  gidLink(cast(void**)&gst_buffer_list_remove, "gst_buffer_list_remove", libs);
  gidLink(cast(void**)&gst_buffer_list_unref, "gst_buffer_list_unref", libs);
  gidLink(cast(void**)&gst_buffer_list_replace, "gst_buffer_list_replace", libs);
  gidLink(cast(void**)&gst_buffer_list_steal, "gst_buffer_list_steal", libs);
  gidLink(cast(void**)&gst_buffer_list_take, "gst_buffer_list_take", libs);

  // BufferPool
  gidLink(cast(void**)&gst_buffer_pool_get_type, "gst_buffer_pool_get_type", libs);
  gidLink(cast(void**)&gst_buffer_pool_new, "gst_buffer_pool_new", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_add_option, "gst_buffer_pool_config_add_option", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_allocator, "gst_buffer_pool_config_get_allocator", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_option, "gst_buffer_pool_config_get_option", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_get_params, "gst_buffer_pool_config_get_params", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_has_option, "gst_buffer_pool_config_has_option", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_n_options, "gst_buffer_pool_config_n_options", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_set_allocator, "gst_buffer_pool_config_set_allocator", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_set_params, "gst_buffer_pool_config_set_params", libs);
  gidLink(cast(void**)&gst_buffer_pool_config_validate_params, "gst_buffer_pool_config_validate_params", libs);
  gidLink(cast(void**)&gst_buffer_pool_acquire_buffer, "gst_buffer_pool_acquire_buffer", libs);
  gidLink(cast(void**)&gst_buffer_pool_get_config, "gst_buffer_pool_get_config", libs);
  gidLink(cast(void**)&gst_buffer_pool_get_options, "gst_buffer_pool_get_options", libs);
  gidLink(cast(void**)&gst_buffer_pool_has_option, "gst_buffer_pool_has_option", libs);
  gidLink(cast(void**)&gst_buffer_pool_is_active, "gst_buffer_pool_is_active", libs);
  gidLink(cast(void**)&gst_buffer_pool_release_buffer, "gst_buffer_pool_release_buffer", libs);
  gidLink(cast(void**)&gst_buffer_pool_set_active, "gst_buffer_pool_set_active", libs);
  gidLink(cast(void**)&gst_buffer_pool_set_config, "gst_buffer_pool_set_config", libs);
  gidLink(cast(void**)&gst_buffer_pool_set_flushing, "gst_buffer_pool_set_flushing", libs);

  // Bus
  gidLink(cast(void**)&gst_bus_get_type, "gst_bus_get_type", libs);
  gidLink(cast(void**)&gst_bus_new, "gst_bus_new", libs);
  gidLink(cast(void**)&gst_bus_add_signal_watch, "gst_bus_add_signal_watch", libs);
  gidLink(cast(void**)&gst_bus_add_signal_watch_full, "gst_bus_add_signal_watch_full", libs);
  gidLink(cast(void**)&gst_bus_add_watch, "gst_bus_add_watch", libs);
  gidLink(cast(void**)&gst_bus_add_watch_full, "gst_bus_add_watch_full", libs);
  gidLink(cast(void**)&gst_bus_async_signal_func, "gst_bus_async_signal_func", libs);
  gidLink(cast(void**)&gst_bus_create_watch, "gst_bus_create_watch", libs);
  gidLink(cast(void**)&gst_bus_disable_sync_message_emission, "gst_bus_disable_sync_message_emission", libs);
  gidLink(cast(void**)&gst_bus_enable_sync_message_emission, "gst_bus_enable_sync_message_emission", libs);
  gidLink(cast(void**)&gst_bus_get_pollfd, "gst_bus_get_pollfd", libs);
  gidLink(cast(void**)&gst_bus_have_pending, "gst_bus_have_pending", libs);
  gidLink(cast(void**)&gst_bus_peek, "gst_bus_peek", libs);
  gidLink(cast(void**)&gst_bus_poll, "gst_bus_poll", libs);
  gidLink(cast(void**)&gst_bus_pop, "gst_bus_pop", libs);
  gidLink(cast(void**)&gst_bus_pop_filtered, "gst_bus_pop_filtered", libs);
  gidLink(cast(void**)&gst_bus_post, "gst_bus_post", libs);
  gidLink(cast(void**)&gst_bus_remove_signal_watch, "gst_bus_remove_signal_watch", libs);
  gidLink(cast(void**)&gst_bus_remove_watch, "gst_bus_remove_watch", libs);
  gidLink(cast(void**)&gst_bus_set_flushing, "gst_bus_set_flushing", libs);
  gidLink(cast(void**)&gst_bus_set_sync_handler, "gst_bus_set_sync_handler", libs);
  gidLink(cast(void**)&gst_bus_sync_signal_handler, "gst_bus_sync_signal_handler", libs);
  gidLink(cast(void**)&gst_bus_timed_pop, "gst_bus_timed_pop", libs);
  gidLink(cast(void**)&gst_bus_timed_pop_filtered, "gst_bus_timed_pop_filtered", libs);

  // Caps
  gidLink(cast(void**)&gst_caps_get_type, "gst_caps_get_type", libs);
  gidLink(cast(void**)&gst_caps_new_any, "gst_caps_new_any", libs);
  gidLink(cast(void**)&gst_caps_new_empty, "gst_caps_new_empty", libs);
  gidLink(cast(void**)&gst_caps_new_empty_simple, "gst_caps_new_empty_simple", libs);
  gidLink(cast(void**)&gst_caps_new_full, "gst_caps_new_full", libs);
  gidLink(cast(void**)&gst_caps_new_full_valist, "gst_caps_new_full_valist", libs);
  gidLink(cast(void**)&gst_caps_new_id_str_empty_simple, "gst_caps_new_id_str_empty_simple", libs);
  gidLink(cast(void**)&gst_caps_new_id_str_simple, "gst_caps_new_id_str_simple", libs);
  gidLink(cast(void**)&gst_caps_new_simple, "gst_caps_new_simple", libs);
  gidLink(cast(void**)&gst_caps_new_static_str_empty_simple, "gst_caps_new_static_str_empty_simple", libs);
  gidLink(cast(void**)&gst_caps_new_static_str_simple, "gst_caps_new_static_str_simple", libs);
  gidLink(cast(void**)&gst_caps_append, "gst_caps_append", libs);
  gidLink(cast(void**)&gst_caps_append_structure, "gst_caps_append_structure", libs);
  gidLink(cast(void**)&gst_caps_append_structure_full, "gst_caps_append_structure_full", libs);
  gidLink(cast(void**)&gst_caps_can_intersect, "gst_caps_can_intersect", libs);
  gidLink(cast(void**)&gst_caps_copy, "gst_caps_copy", libs);
  gidLink(cast(void**)&gst_caps_copy_nth, "gst_caps_copy_nth", libs);
  gidLink(cast(void**)&gst_caps_filter_and_map_in_place, "gst_caps_filter_and_map_in_place", libs);
  gidLink(cast(void**)&gst_caps_fixate, "gst_caps_fixate", libs);
  gidLink(cast(void**)&gst_caps_foreach, "gst_caps_foreach", libs);
  gidLink(cast(void**)&gst_caps_get_features, "gst_caps_get_features", libs);
  gidLink(cast(void**)&gst_caps_get_size, "gst_caps_get_size", libs);
  gidLink(cast(void**)&gst_caps_get_structure, "gst_caps_get_structure", libs);
  gidLink(cast(void**)&gst_caps_id_str_set_simple, "gst_caps_id_str_set_simple", libs);
  gidLink(cast(void**)&gst_caps_id_str_set_simple_valist, "gst_caps_id_str_set_simple_valist", libs);
  gidLink(cast(void**)&gst_caps_id_str_set_value, "gst_caps_id_str_set_value", libs);
  gidLink(cast(void**)&gst_caps_intersect, "gst_caps_intersect", libs);
  gidLink(cast(void**)&gst_caps_intersect_full, "gst_caps_intersect_full", libs);
  gidLink(cast(void**)&gst_caps_is_always_compatible, "gst_caps_is_always_compatible", libs);
  gidLink(cast(void**)&gst_caps_is_any, "gst_caps_is_any", libs);
  gidLink(cast(void**)&gst_caps_is_empty, "gst_caps_is_empty", libs);
  gidLink(cast(void**)&gst_caps_is_equal, "gst_caps_is_equal", libs);
  gidLink(cast(void**)&gst_caps_is_equal_fixed, "gst_caps_is_equal_fixed", libs);
  gidLink(cast(void**)&gst_caps_is_fixed, "gst_caps_is_fixed", libs);
  gidLink(cast(void**)&gst_caps_is_strictly_equal, "gst_caps_is_strictly_equal", libs);
  gidLink(cast(void**)&gst_caps_is_subset, "gst_caps_is_subset", libs);
  gidLink(cast(void**)&gst_caps_is_subset_structure, "gst_caps_is_subset_structure", libs);
  gidLink(cast(void**)&gst_caps_is_subset_structure_full, "gst_caps_is_subset_structure_full", libs);
  gidLink(cast(void**)&gst_caps_is_writable, "gst_caps_is_writable", libs);
  gidLink(cast(void**)&gst_caps_make_writable, "gst_caps_make_writable", libs);
  gidLink(cast(void**)&gst_caps_map_in_place, "gst_caps_map_in_place", libs);
  gidLink(cast(void**)&gst_caps_merge, "gst_caps_merge", libs);
  gidLink(cast(void**)&gst_caps_merge_structure, "gst_caps_merge_structure", libs);
  gidLink(cast(void**)&gst_caps_merge_structure_full, "gst_caps_merge_structure_full", libs);
  gidLink(cast(void**)&gst_caps_normalize, "gst_caps_normalize", libs);
  gidLink(cast(void**)&gst_caps_ref, "gst_caps_ref", libs);
  gidLink(cast(void**)&gst_caps_remove_structure, "gst_caps_remove_structure", libs);
  gidLink(cast(void**)&gst_caps_serialize, "gst_caps_serialize", libs);
  gidLink(cast(void**)&gst_caps_set_features, "gst_caps_set_features", libs);
  gidLink(cast(void**)&gst_caps_set_features_simple, "gst_caps_set_features_simple", libs);
  gidLink(cast(void**)&gst_caps_set_simple, "gst_caps_set_simple", libs);
  gidLink(cast(void**)&gst_caps_set_simple_static_str, "gst_caps_set_simple_static_str", libs);
  gidLink(cast(void**)&gst_caps_set_simple_static_str_valist, "gst_caps_set_simple_static_str_valist", libs);
  gidLink(cast(void**)&gst_caps_set_simple_valist, "gst_caps_set_simple_valist", libs);
  gidLink(cast(void**)&gst_caps_set_value, "gst_caps_set_value", libs);
  gidLink(cast(void**)&gst_caps_set_value_static_str, "gst_caps_set_value_static_str", libs);
  gidLink(cast(void**)&gst_caps_simplify, "gst_caps_simplify", libs);
  gidLink(cast(void**)&gst_caps_steal_structure, "gst_caps_steal_structure", libs);
  gidLink(cast(void**)&gst_caps_subtract, "gst_caps_subtract", libs);
  gidLink(cast(void**)&gst_caps_to_string, "gst_caps_to_string", libs);
  gidLink(cast(void**)&gst_caps_truncate, "gst_caps_truncate", libs);
  gidLink(cast(void**)&gst_caps_unref, "gst_caps_unref", libs);
  gidLink(cast(void**)&gst_caps_from_string, "gst_caps_from_string", libs);
  gidLink(cast(void**)&gst_caps_replace, "gst_caps_replace", libs);
  gidLink(cast(void**)&gst_caps_steal, "gst_caps_steal", libs);
  gidLink(cast(void**)&gst_caps_take, "gst_caps_take", libs);

  // CapsFeatures
  gidLink(cast(void**)&gst_caps_features_get_type, "gst_caps_features_get_type", libs);
  gidLink(cast(void**)&gst_caps_features_new, "gst_caps_features_new", libs);
  gidLink(cast(void**)&gst_caps_features_new_any, "gst_caps_features_new_any", libs);
  gidLink(cast(void**)&gst_caps_features_new_empty, "gst_caps_features_new_empty", libs);
  gidLink(cast(void**)&gst_caps_features_new_id, "gst_caps_features_new_id", libs);
  gidLink(cast(void**)&gst_caps_features_new_id_str, "gst_caps_features_new_id_str", libs);
  gidLink(cast(void**)&gst_caps_features_new_id_str_valist, "gst_caps_features_new_id_str_valist", libs);
  gidLink(cast(void**)&gst_caps_features_new_id_valist, "gst_caps_features_new_id_valist", libs);
  gidLink(cast(void**)&gst_caps_features_new_single, "gst_caps_features_new_single", libs);
  gidLink(cast(void**)&gst_caps_features_new_single_static_str, "gst_caps_features_new_single_static_str", libs);
  gidLink(cast(void**)&gst_caps_features_new_static_str, "gst_caps_features_new_static_str", libs);
  gidLink(cast(void**)&gst_caps_features_new_static_str_valist, "gst_caps_features_new_static_str_valist", libs);
  gidLink(cast(void**)&gst_caps_features_new_valist, "gst_caps_features_new_valist", libs);
  gidLink(cast(void**)&gst_caps_features_add, "gst_caps_features_add", libs);
  gidLink(cast(void**)&gst_caps_features_add_id, "gst_caps_features_add_id", libs);
  gidLink(cast(void**)&gst_caps_features_add_id_str, "gst_caps_features_add_id_str", libs);
  gidLink(cast(void**)&gst_caps_features_add_static_str, "gst_caps_features_add_static_str", libs);
  gidLink(cast(void**)&gst_caps_features_contains, "gst_caps_features_contains", libs);
  gidLink(cast(void**)&gst_caps_features_contains_id, "gst_caps_features_contains_id", libs);
  gidLink(cast(void**)&gst_caps_features_contains_id_str, "gst_caps_features_contains_id_str", libs);
  gidLink(cast(void**)&gst_caps_features_copy, "gst_caps_features_copy", libs);
  gidLink(cast(void**)&gst_caps_features_free, "gst_caps_features_free", libs);
  gidLink(cast(void**)&gst_caps_features_get_nth, "gst_caps_features_get_nth", libs);
  gidLink(cast(void**)&gst_caps_features_get_nth_id, "gst_caps_features_get_nth_id", libs);
  gidLink(cast(void**)&gst_caps_features_get_nth_id_str, "gst_caps_features_get_nth_id_str", libs);
  gidLink(cast(void**)&gst_caps_features_get_size, "gst_caps_features_get_size", libs);
  gidLink(cast(void**)&gst_caps_features_is_any, "gst_caps_features_is_any", libs);
  gidLink(cast(void**)&gst_caps_features_is_equal, "gst_caps_features_is_equal", libs);
  gidLink(cast(void**)&gst_caps_features_remove, "gst_caps_features_remove", libs);
  gidLink(cast(void**)&gst_caps_features_remove_id, "gst_caps_features_remove_id", libs);
  gidLink(cast(void**)&gst_caps_features_remove_id_str, "gst_caps_features_remove_id_str", libs);
  gidLink(cast(void**)&gst_caps_features_set_parent_refcount, "gst_caps_features_set_parent_refcount", libs);
  gidLink(cast(void**)&gst_caps_features_to_string, "gst_caps_features_to_string", libs);
  gidLink(cast(void**)&gst_caps_features_from_string, "gst_caps_features_from_string", libs);

  // ChildProxy
  gidLink(cast(void**)&gst_child_proxy_get_type, "gst_child_proxy_get_type", libs);
  gidLink(cast(void**)&gst_child_proxy_child_added, "gst_child_proxy_child_added", libs);
  gidLink(cast(void**)&gst_child_proxy_child_removed, "gst_child_proxy_child_removed", libs);
  gidLink(cast(void**)&gst_child_proxy_get, "gst_child_proxy_get", libs);
  gidLink(cast(void**)&gst_child_proxy_get_child_by_index, "gst_child_proxy_get_child_by_index", libs);
  gidLink(cast(void**)&gst_child_proxy_get_child_by_name, "gst_child_proxy_get_child_by_name", libs);
  gidLink(cast(void**)&gst_child_proxy_get_child_by_name_recurse, "gst_child_proxy_get_child_by_name_recurse", libs);
  gidLink(cast(void**)&gst_child_proxy_get_children_count, "gst_child_proxy_get_children_count", libs);
  gidLink(cast(void**)&gst_child_proxy_get_property, "gst_child_proxy_get_property", libs);
  gidLink(cast(void**)&gst_child_proxy_get_valist, "gst_child_proxy_get_valist", libs);
  gidLink(cast(void**)&gst_child_proxy_lookup, "gst_child_proxy_lookup", libs);
  gidLink(cast(void**)&gst_child_proxy_set, "gst_child_proxy_set", libs);
  gidLink(cast(void**)&gst_child_proxy_set_property, "gst_child_proxy_set_property", libs);
  gidLink(cast(void**)&gst_child_proxy_set_valist, "gst_child_proxy_set_valist", libs);

  // Clock
  gidLink(cast(void**)&gst_clock_get_type, "gst_clock_get_type", libs);
  gidLink(cast(void**)&gst_clock_id_compare_func, "gst_clock_id_compare_func", libs);
  gidLink(cast(void**)&gst_clock_id_get_clock, "gst_clock_id_get_clock", libs);
  gidLink(cast(void**)&gst_clock_id_get_time, "gst_clock_id_get_time", libs);
  gidLink(cast(void**)&gst_clock_id_ref, "gst_clock_id_ref", libs);
  gidLink(cast(void**)&gst_clock_id_unref, "gst_clock_id_unref", libs);
  gidLink(cast(void**)&gst_clock_id_unschedule, "gst_clock_id_unschedule", libs);
  gidLink(cast(void**)&gst_clock_id_uses_clock, "gst_clock_id_uses_clock", libs);
  gidLink(cast(void**)&gst_clock_id_wait, "gst_clock_id_wait", libs);
  gidLink(cast(void**)&gst_clock_id_wait_async, "gst_clock_id_wait_async", libs);
  gidLink(cast(void**)&gst_clock_add_observation, "gst_clock_add_observation", libs);
  gidLink(cast(void**)&gst_clock_add_observation_unapplied, "gst_clock_add_observation_unapplied", libs);
  gidLink(cast(void**)&gst_clock_adjust_unlocked, "gst_clock_adjust_unlocked", libs);
  gidLink(cast(void**)&gst_clock_adjust_with_calibration, "gst_clock_adjust_with_calibration", libs);
  gidLink(cast(void**)&gst_clock_get_calibration, "gst_clock_get_calibration", libs);
  gidLink(cast(void**)&gst_clock_get_internal_time, "gst_clock_get_internal_time", libs);
  gidLink(cast(void**)&gst_clock_get_master, "gst_clock_get_master", libs);
  gidLink(cast(void**)&gst_clock_get_resolution, "gst_clock_get_resolution", libs);
  gidLink(cast(void**)&gst_clock_get_time, "gst_clock_get_time", libs);
  gidLink(cast(void**)&gst_clock_get_timeout, "gst_clock_get_timeout", libs);
  gidLink(cast(void**)&gst_clock_is_synced, "gst_clock_is_synced", libs);
  gidLink(cast(void**)&gst_clock_is_system_monotonic, "gst_clock_is_system_monotonic", libs);
  gidLink(cast(void**)&gst_clock_new_periodic_id, "gst_clock_new_periodic_id", libs);
  gidLink(cast(void**)&gst_clock_new_single_shot_id, "gst_clock_new_single_shot_id", libs);
  gidLink(cast(void**)&gst_clock_periodic_id_reinit, "gst_clock_periodic_id_reinit", libs);
  gidLink(cast(void**)&gst_clock_set_calibration, "gst_clock_set_calibration", libs);
  gidLink(cast(void**)&gst_clock_set_master, "gst_clock_set_master", libs);
  gidLink(cast(void**)&gst_clock_set_resolution, "gst_clock_set_resolution", libs);
  gidLink(cast(void**)&gst_clock_set_synced, "gst_clock_set_synced", libs);
  gidLink(cast(void**)&gst_clock_set_timeout, "gst_clock_set_timeout", libs);
  gidLink(cast(void**)&gst_clock_single_shot_id_reinit, "gst_clock_single_shot_id_reinit", libs);
  gidLink(cast(void**)&gst_clock_unadjust_unlocked, "gst_clock_unadjust_unlocked", libs);
  gidLink(cast(void**)&gst_clock_unadjust_with_calibration, "gst_clock_unadjust_with_calibration", libs);
  gidLink(cast(void**)&gst_clock_wait_for_sync, "gst_clock_wait_for_sync", libs);

  // Context
  gidLink(cast(void**)&gst_context_get_type, "gst_context_get_type", libs);
  gidLink(cast(void**)&gst_context_new, "gst_context_new", libs);
  gidLink(cast(void**)&gst_context_copy, "gst_context_copy", libs);
  gidLink(cast(void**)&gst_context_get_context_type, "gst_context_get_context_type", libs);
  gidLink(cast(void**)&gst_context_get_structure, "gst_context_get_structure", libs);
  gidLink(cast(void**)&gst_context_get_task_pool, "gst_context_get_task_pool", libs);
  gidLink(cast(void**)&gst_context_has_context_type, "gst_context_has_context_type", libs);
  gidLink(cast(void**)&gst_context_is_persistent, "gst_context_is_persistent", libs);
  gidLink(cast(void**)&gst_context_is_writable, "gst_context_is_writable", libs);
  gidLink(cast(void**)&gst_context_make_writable, "gst_context_make_writable", libs);
  gidLink(cast(void**)&gst_context_ref, "gst_context_ref", libs);
  gidLink(cast(void**)&gst_context_set_task_pool, "gst_context_set_task_pool", libs);
  gidLink(cast(void**)&gst_context_unref, "gst_context_unref", libs);
  gidLink(cast(void**)&gst_context_writable_structure, "gst_context_writable_structure", libs);
  gidLink(cast(void**)&gst_context_replace, "gst_context_replace", libs);

  // ControlBinding
  gidLink(cast(void**)&gst_control_binding_get_type, "gst_control_binding_get_type", libs);
  gidLink(cast(void**)&gst_control_binding_get_g_value_array, "gst_control_binding_get_g_value_array", libs);
  gidLink(cast(void**)&gst_control_binding_get_value, "gst_control_binding_get_value", libs);
  gidLink(cast(void**)&gst_control_binding_get_value_array, "gst_control_binding_get_value_array", libs);
  gidLink(cast(void**)&gst_control_binding_is_disabled, "gst_control_binding_is_disabled", libs);
  gidLink(cast(void**)&gst_control_binding_set_disabled, "gst_control_binding_set_disabled", libs);
  gidLink(cast(void**)&gst_control_binding_sync_values, "gst_control_binding_sync_values", libs);

  // ControlSource
  gidLink(cast(void**)&gst_control_source_get_type, "gst_control_source_get_type", libs);
  gidLink(cast(void**)&gst_control_source_get_value, "gst_control_source_get_value", libs);
  gidLink(cast(void**)&gst_control_source_get_value_array, "gst_control_source_get_value_array", libs);

  // CustomMeta
  gidLink(cast(void**)&gst_custom_meta_get_structure, "gst_custom_meta_get_structure", libs);
  gidLink(cast(void**)&gst_custom_meta_has_name, "gst_custom_meta_has_name", libs);

  // DateTime
  gidLink(cast(void**)&gst_date_time_get_type, "gst_date_time_get_type", libs);
  gidLink(cast(void**)&gst_date_time_new, "gst_date_time_new", libs);
  gidLink(cast(void**)&gst_date_time_new_from_g_date_time, "gst_date_time_new_from_g_date_time", libs);
  gidLink(cast(void**)&gst_date_time_new_from_iso8601_string, "gst_date_time_new_from_iso8601_string", libs);
  gidLink(cast(void**)&gst_date_time_new_from_unix_epoch_local_time, "gst_date_time_new_from_unix_epoch_local_time", libs);
  gidLink(cast(void**)&gst_date_time_new_from_unix_epoch_local_time_usecs, "gst_date_time_new_from_unix_epoch_local_time_usecs", libs);
  gidLink(cast(void**)&gst_date_time_new_from_unix_epoch_utc, "gst_date_time_new_from_unix_epoch_utc", libs);
  gidLink(cast(void**)&gst_date_time_new_from_unix_epoch_utc_usecs, "gst_date_time_new_from_unix_epoch_utc_usecs", libs);
  gidLink(cast(void**)&gst_date_time_new_local_time, "gst_date_time_new_local_time", libs);
  gidLink(cast(void**)&gst_date_time_new_now_local_time, "gst_date_time_new_now_local_time", libs);
  gidLink(cast(void**)&gst_date_time_new_now_utc, "gst_date_time_new_now_utc", libs);
  gidLink(cast(void**)&gst_date_time_new_y, "gst_date_time_new_y", libs);
  gidLink(cast(void**)&gst_date_time_new_ym, "gst_date_time_new_ym", libs);
  gidLink(cast(void**)&gst_date_time_new_ymd, "gst_date_time_new_ymd", libs);
  gidLink(cast(void**)&gst_date_time_get_day, "gst_date_time_get_day", libs);
  gidLink(cast(void**)&gst_date_time_get_hour, "gst_date_time_get_hour", libs);
  gidLink(cast(void**)&gst_date_time_get_microsecond, "gst_date_time_get_microsecond", libs);
  gidLink(cast(void**)&gst_date_time_get_minute, "gst_date_time_get_minute", libs);
  gidLink(cast(void**)&gst_date_time_get_month, "gst_date_time_get_month", libs);
  gidLink(cast(void**)&gst_date_time_get_second, "gst_date_time_get_second", libs);
  gidLink(cast(void**)&gst_date_time_get_time_zone_offset, "gst_date_time_get_time_zone_offset", libs);
  gidLink(cast(void**)&gst_date_time_get_year, "gst_date_time_get_year", libs);
  gidLink(cast(void**)&gst_date_time_has_day, "gst_date_time_has_day", libs);
  gidLink(cast(void**)&gst_date_time_has_month, "gst_date_time_has_month", libs);
  gidLink(cast(void**)&gst_date_time_has_second, "gst_date_time_has_second", libs);
  gidLink(cast(void**)&gst_date_time_has_time, "gst_date_time_has_time", libs);
  gidLink(cast(void**)&gst_date_time_has_year, "gst_date_time_has_year", libs);
  gidLink(cast(void**)&gst_date_time_ref, "gst_date_time_ref", libs);
  gidLink(cast(void**)&gst_date_time_to_g_date_time, "gst_date_time_to_g_date_time", libs);
  gidLink(cast(void**)&gst_date_time_to_iso8601_string, "gst_date_time_to_iso8601_string", libs);
  gidLink(cast(void**)&gst_date_time_unref, "gst_date_time_unref", libs);

  // DebugCategory
  gidLink(cast(void**)&gst_debug_category_free, "gst_debug_category_free", libs);
  gidLink(cast(void**)&gst_debug_category_get_color, "gst_debug_category_get_color", libs);
  gidLink(cast(void**)&gst_debug_category_get_description, "gst_debug_category_get_description", libs);
  gidLink(cast(void**)&gst_debug_category_get_name, "gst_debug_category_get_name", libs);
  gidLink(cast(void**)&gst_debug_category_get_threshold, "gst_debug_category_get_threshold", libs);
  gidLink(cast(void**)&gst_debug_category_reset_threshold, "gst_debug_category_reset_threshold", libs);
  gidLink(cast(void**)&gst_debug_category_set_threshold, "gst_debug_category_set_threshold", libs);

  // DebugMessage
  gidLink(cast(void**)&gst_debug_message_get, "gst_debug_message_get", libs);
  gidLink(cast(void**)&gst_debug_message_get_id, "gst_debug_message_get_id", libs);

  // Device
  gidLink(cast(void**)&gst_device_get_type, "gst_device_get_type", libs);
  gidLink(cast(void**)&gst_device_create_element, "gst_device_create_element", libs);
  gidLink(cast(void**)&gst_device_get_caps, "gst_device_get_caps", libs);
  gidLink(cast(void**)&gst_device_get_device_class, "gst_device_get_device_class", libs);
  gidLink(cast(void**)&gst_device_get_display_name, "gst_device_get_display_name", libs);
  gidLink(cast(void**)&gst_device_get_properties, "gst_device_get_properties", libs);
  gidLink(cast(void**)&gst_device_has_classes, "gst_device_has_classes", libs);
  gidLink(cast(void**)&gst_device_has_classesv, "gst_device_has_classesv", libs);
  gidLink(cast(void**)&gst_device_reconfigure_element, "gst_device_reconfigure_element", libs);

  // DeviceMonitor
  gidLink(cast(void**)&gst_device_monitor_get_type, "gst_device_monitor_get_type", libs);
  gidLink(cast(void**)&gst_device_monitor_new, "gst_device_monitor_new", libs);
  gidLink(cast(void**)&gst_device_monitor_add_filter, "gst_device_monitor_add_filter", libs);
  gidLink(cast(void**)&gst_device_monitor_get_bus, "gst_device_monitor_get_bus", libs);
  gidLink(cast(void**)&gst_device_monitor_get_devices, "gst_device_monitor_get_devices", libs);
  gidLink(cast(void**)&gst_device_monitor_get_providers, "gst_device_monitor_get_providers", libs);
  gidLink(cast(void**)&gst_device_monitor_get_show_all_devices, "gst_device_monitor_get_show_all_devices", libs);
  gidLink(cast(void**)&gst_device_monitor_remove_filter, "gst_device_monitor_remove_filter", libs);
  gidLink(cast(void**)&gst_device_monitor_set_show_all_devices, "gst_device_monitor_set_show_all_devices", libs);
  gidLink(cast(void**)&gst_device_monitor_start, "gst_device_monitor_start", libs);
  gidLink(cast(void**)&gst_device_monitor_stop, "gst_device_monitor_stop", libs);

  // DeviceProvider
  gidLink(cast(void**)&gst_device_provider_get_type, "gst_device_provider_get_type", libs);
  gidLink(cast(void**)&gst_device_provider_register, "gst_device_provider_register", libs);
  gidLink(cast(void**)&gst_device_provider_can_monitor, "gst_device_provider_can_monitor", libs);
  gidLink(cast(void**)&gst_device_provider_device_add, "gst_device_provider_device_add", libs);
  gidLink(cast(void**)&gst_device_provider_device_changed, "gst_device_provider_device_changed", libs);
  gidLink(cast(void**)&gst_device_provider_device_remove, "gst_device_provider_device_remove", libs);
  gidLink(cast(void**)&gst_device_provider_get_bus, "gst_device_provider_get_bus", libs);
  gidLink(cast(void**)&gst_device_provider_get_devices, "gst_device_provider_get_devices", libs);
  gidLink(cast(void**)&gst_device_provider_get_factory, "gst_device_provider_get_factory", libs);
  gidLink(cast(void**)&gst_device_provider_get_hidden_providers, "gst_device_provider_get_hidden_providers", libs);
  gidLink(cast(void**)&gst_device_provider_get_metadata, "gst_device_provider_get_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_hide_provider, "gst_device_provider_hide_provider", libs);
  gidLink(cast(void**)&gst_device_provider_is_started, "gst_device_provider_is_started", libs);
  gidLink(cast(void**)&gst_device_provider_start, "gst_device_provider_start", libs);
  gidLink(cast(void**)&gst_device_provider_stop, "gst_device_provider_stop", libs);
  gidLink(cast(void**)&gst_device_provider_unhide_provider, "gst_device_provider_unhide_provider", libs);

  // DeviceProviderClass
  gidLink(cast(void**)&gst_device_provider_class_add_metadata, "gst_device_provider_class_add_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_class_add_static_metadata, "gst_device_provider_class_add_static_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_class_get_metadata, "gst_device_provider_class_get_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_class_set_metadata, "gst_device_provider_class_set_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_class_set_static_metadata, "gst_device_provider_class_set_static_metadata", libs);

  // DeviceProviderFactory
  gidLink(cast(void**)&gst_device_provider_factory_get_type, "gst_device_provider_factory_get_type", libs);
  gidLink(cast(void**)&gst_device_provider_factory_find, "gst_device_provider_factory_find", libs);
  gidLink(cast(void**)&gst_device_provider_factory_get_by_name, "gst_device_provider_factory_get_by_name", libs);
  gidLink(cast(void**)&gst_device_provider_factory_list_get_device_providers, "gst_device_provider_factory_list_get_device_providers", libs);
  gidLink(cast(void**)&gst_device_provider_factory_get, "gst_device_provider_factory_get", libs);
  gidLink(cast(void**)&gst_device_provider_factory_get_device_provider_type, "gst_device_provider_factory_get_device_provider_type", libs);
  gidLink(cast(void**)&gst_device_provider_factory_get_metadata, "gst_device_provider_factory_get_metadata", libs);
  gidLink(cast(void**)&gst_device_provider_factory_get_metadata_keys, "gst_device_provider_factory_get_metadata_keys", libs);
  gidLink(cast(void**)&gst_device_provider_factory_has_classes, "gst_device_provider_factory_has_classes", libs);
  gidLink(cast(void**)&gst_device_provider_factory_has_classesv, "gst_device_provider_factory_has_classesv", libs);

  // DoubleRange
  gidLink(cast(void**)&gst_double_range_get_type, "gst_double_range_get_type", libs);

  // DynamicTypeFactory
  gidLink(cast(void**)&gst_dynamic_type_factory_get_type, "gst_dynamic_type_factory_get_type", libs);
  gidLink(cast(void**)&gst_dynamic_type_factory_load, "gst_dynamic_type_factory_load", libs);

  // Element
  gidLink(cast(void**)&gst_element_get_type, "gst_element_get_type", libs);
  gidLink(cast(void**)&gst_element_make_from_uri, "gst_element_make_from_uri", libs);
  gidLink(cast(void**)&gst_element_register, "gst_element_register", libs);
  gidLink(cast(void**)&gst_element_state_change_return_get_name, "gst_element_state_change_return_get_name", libs);
  gidLink(cast(void**)&gst_element_state_get_name, "gst_element_state_get_name", libs);
  gidLink(cast(void**)&gst_element_type_set_skip_documentation, "gst_element_type_set_skip_documentation", libs);
  gidLink(cast(void**)&gst_element_abort_state, "gst_element_abort_state", libs);
  gidLink(cast(void**)&gst_element_add_pad, "gst_element_add_pad", libs);
  gidLink(cast(void**)&gst_element_add_property_deep_notify_watch, "gst_element_add_property_deep_notify_watch", libs);
  gidLink(cast(void**)&gst_element_add_property_notify_watch, "gst_element_add_property_notify_watch", libs);
  gidLink(cast(void**)&gst_element_call_async, "gst_element_call_async", libs);
  gidLink(cast(void**)&gst_element_change_state, "gst_element_change_state", libs);
  gidLink(cast(void**)&gst_element_continue_state, "gst_element_continue_state", libs);
  gidLink(cast(void**)&gst_element_create_all_pads, "gst_element_create_all_pads", libs);
  gidLink(cast(void**)&gst_element_decorate_stream_id, "gst_element_decorate_stream_id", libs);
  gidLink(cast(void**)&gst_element_decorate_stream_id_printf, "gst_element_decorate_stream_id_printf", libs);
  gidLink(cast(void**)&gst_element_decorate_stream_id_printf_valist, "gst_element_decorate_stream_id_printf_valist", libs);
  gidLink(cast(void**)&gst_element_foreach_pad, "gst_element_foreach_pad", libs);
  gidLink(cast(void**)&gst_element_foreach_sink_pad, "gst_element_foreach_sink_pad", libs);
  gidLink(cast(void**)&gst_element_foreach_src_pad, "gst_element_foreach_src_pad", libs);
  gidLink(cast(void**)&gst_element_get_base_time, "gst_element_get_base_time", libs);
  gidLink(cast(void**)&gst_element_get_bus, "gst_element_get_bus", libs);
  gidLink(cast(void**)&gst_element_get_clock, "gst_element_get_clock", libs);
  gidLink(cast(void**)&gst_element_get_compatible_pad, "gst_element_get_compatible_pad", libs);
  gidLink(cast(void**)&gst_element_get_compatible_pad_template, "gst_element_get_compatible_pad_template", libs);
  gidLink(cast(void**)&gst_element_get_context, "gst_element_get_context", libs);
  gidLink(cast(void**)&gst_element_get_context_unlocked, "gst_element_get_context_unlocked", libs);
  gidLink(cast(void**)&gst_element_get_contexts, "gst_element_get_contexts", libs);
  gidLink(cast(void**)&gst_element_get_current_clock_time, "gst_element_get_current_clock_time", libs);
  gidLink(cast(void**)&gst_element_get_current_running_time, "gst_element_get_current_running_time", libs);
  gidLink(cast(void**)&gst_element_get_factory, "gst_element_get_factory", libs);
  gidLink(cast(void**)&gst_element_get_metadata, "gst_element_get_metadata", libs);
  gidLink(cast(void**)&gst_element_get_pad_template, "gst_element_get_pad_template", libs);
  gidLink(cast(void**)&gst_element_get_pad_template_list, "gst_element_get_pad_template_list", libs);
  gidLink(cast(void**)&gst_element_get_request_pad, "gst_element_get_request_pad", libs);
  gidLink(cast(void**)&gst_element_get_start_time, "gst_element_get_start_time", libs);
  gidLink(cast(void**)&gst_element_get_state, "gst_element_get_state", libs);
  gidLink(cast(void**)&gst_element_get_static_pad, "gst_element_get_static_pad", libs);
  gidLink(cast(void**)&gst_element_is_locked_state, "gst_element_is_locked_state", libs);
  gidLink(cast(void**)&gst_element_iterate_pads, "gst_element_iterate_pads", libs);
  gidLink(cast(void**)&gst_element_iterate_sink_pads, "gst_element_iterate_sink_pads", libs);
  gidLink(cast(void**)&gst_element_iterate_src_pads, "gst_element_iterate_src_pads", libs);
  gidLink(cast(void**)&gst_element_link, "gst_element_link", libs);
  gidLink(cast(void**)&gst_element_link_filtered, "gst_element_link_filtered", libs);
  gidLink(cast(void**)&gst_element_link_many, "gst_element_link_many", libs);
  gidLink(cast(void**)&gst_element_link_pads, "gst_element_link_pads", libs);
  gidLink(cast(void**)&gst_element_link_pads_filtered, "gst_element_link_pads_filtered", libs);
  gidLink(cast(void**)&gst_element_link_pads_full, "gst_element_link_pads_full", libs);
  gidLink(cast(void**)&gst_element_lost_state, "gst_element_lost_state", libs);
  gidLink(cast(void**)&gst_element_message_full, "gst_element_message_full", libs);
  gidLink(cast(void**)&gst_element_message_full_with_details, "gst_element_message_full_with_details", libs);
  gidLink(cast(void**)&gst_element_no_more_pads, "gst_element_no_more_pads", libs);
  gidLink(cast(void**)&gst_element_post_message, "gst_element_post_message", libs);
  gidLink(cast(void**)&gst_element_provide_clock, "gst_element_provide_clock", libs);
  gidLink(cast(void**)&gst_element_query, "gst_element_query", libs);
  gidLink(cast(void**)&gst_element_query_convert, "gst_element_query_convert", libs);
  gidLink(cast(void**)&gst_element_query_duration, "gst_element_query_duration", libs);
  gidLink(cast(void**)&gst_element_query_position, "gst_element_query_position", libs);
  gidLink(cast(void**)&gst_element_release_request_pad, "gst_element_release_request_pad", libs);
  gidLink(cast(void**)&gst_element_remove_pad, "gst_element_remove_pad", libs);
  gidLink(cast(void**)&gst_element_remove_property_notify_watch, "gst_element_remove_property_notify_watch", libs);
  gidLink(cast(void**)&gst_element_request_pad, "gst_element_request_pad", libs);
  gidLink(cast(void**)&gst_element_request_pad_simple, "gst_element_request_pad_simple", libs);
  gidLink(cast(void**)&gst_element_seek, "gst_element_seek", libs);
  gidLink(cast(void**)&gst_element_seek_simple, "gst_element_seek_simple", libs);
  gidLink(cast(void**)&gst_element_send_event, "gst_element_send_event", libs);
  gidLink(cast(void**)&gst_element_set_base_time, "gst_element_set_base_time", libs);
  gidLink(cast(void**)&gst_element_set_bus, "gst_element_set_bus", libs);
  gidLink(cast(void**)&gst_element_set_clock, "gst_element_set_clock", libs);
  gidLink(cast(void**)&gst_element_set_context, "gst_element_set_context", libs);
  gidLink(cast(void**)&gst_element_set_locked_state, "gst_element_set_locked_state", libs);
  gidLink(cast(void**)&gst_element_set_start_time, "gst_element_set_start_time", libs);
  gidLink(cast(void**)&gst_element_set_state, "gst_element_set_state", libs);
  gidLink(cast(void**)&gst_element_sync_state_with_parent, "gst_element_sync_state_with_parent", libs);
  gidLink(cast(void**)&gst_element_unlink, "gst_element_unlink", libs);
  gidLink(cast(void**)&gst_element_unlink_many, "gst_element_unlink_many", libs);
  gidLink(cast(void**)&gst_element_unlink_pads, "gst_element_unlink_pads", libs);

  // ElementClass
  gidLink(cast(void**)&gst_element_class_add_metadata, "gst_element_class_add_metadata", libs);
  gidLink(cast(void**)&gst_element_class_add_pad_template, "gst_element_class_add_pad_template", libs);
  gidLink(cast(void**)&gst_element_class_add_static_metadata, "gst_element_class_add_static_metadata", libs);
  gidLink(cast(void**)&gst_element_class_add_static_pad_template, "gst_element_class_add_static_pad_template", libs);
  gidLink(cast(void**)&gst_element_class_add_static_pad_template_with_gtype, "gst_element_class_add_static_pad_template_with_gtype", libs);
  gidLink(cast(void**)&gst_element_class_get_metadata, "gst_element_class_get_metadata", libs);
  gidLink(cast(void**)&gst_element_class_get_pad_template, "gst_element_class_get_pad_template", libs);
  gidLink(cast(void**)&gst_element_class_get_pad_template_list, "gst_element_class_get_pad_template_list", libs);
  gidLink(cast(void**)&gst_element_class_set_metadata, "gst_element_class_set_metadata", libs);
  gidLink(cast(void**)&gst_element_class_set_static_metadata, "gst_element_class_set_static_metadata", libs);

  // ElementFactory
  gidLink(cast(void**)&gst_element_factory_get_type, "gst_element_factory_get_type", libs);
  gidLink(cast(void**)&gst_element_factory_find, "gst_element_factory_find", libs);
  gidLink(cast(void**)&gst_element_factory_list_filter, "gst_element_factory_list_filter", libs);
  gidLink(cast(void**)&gst_element_factory_list_get_elements, "gst_element_factory_list_get_elements", libs);
  gidLink(cast(void**)&gst_element_factory_make, "gst_element_factory_make", libs);
  gidLink(cast(void**)&gst_element_factory_make_full, "gst_element_factory_make_full", libs);
  gidLink(cast(void**)&gst_element_factory_make_valist, "gst_element_factory_make_valist", libs);
  gidLink(cast(void**)&gst_element_factory_make_with_properties, "gst_element_factory_make_with_properties", libs);
  gidLink(cast(void**)&gst_element_factory_can_sink_all_caps, "gst_element_factory_can_sink_all_caps", libs);
  gidLink(cast(void**)&gst_element_factory_can_sink_any_caps, "gst_element_factory_can_sink_any_caps", libs);
  gidLink(cast(void**)&gst_element_factory_can_src_all_caps, "gst_element_factory_can_src_all_caps", libs);
  gidLink(cast(void**)&gst_element_factory_can_src_any_caps, "gst_element_factory_can_src_any_caps", libs);
  gidLink(cast(void**)&gst_element_factory_create, "gst_element_factory_create", libs);
  gidLink(cast(void**)&gst_element_factory_create_full, "gst_element_factory_create_full", libs);
  gidLink(cast(void**)&gst_element_factory_create_valist, "gst_element_factory_create_valist", libs);
  gidLink(cast(void**)&gst_element_factory_create_with_properties, "gst_element_factory_create_with_properties", libs);
  gidLink(cast(void**)&gst_element_factory_get_element_type, "gst_element_factory_get_element_type", libs);
  gidLink(cast(void**)&gst_element_factory_get_metadata, "gst_element_factory_get_metadata", libs);
  gidLink(cast(void**)&gst_element_factory_get_metadata_keys, "gst_element_factory_get_metadata_keys", libs);
  gidLink(cast(void**)&gst_element_factory_get_num_pad_templates, "gst_element_factory_get_num_pad_templates", libs);
  gidLink(cast(void**)&gst_element_factory_get_skip_documentation, "gst_element_factory_get_skip_documentation", libs);
  gidLink(cast(void**)&gst_element_factory_get_static_pad_templates, "gst_element_factory_get_static_pad_templates", libs);
  gidLink(cast(void**)&gst_element_factory_get_uri_protocols, "gst_element_factory_get_uri_protocols", libs);
  gidLink(cast(void**)&gst_element_factory_get_uri_type, "gst_element_factory_get_uri_type", libs);
  gidLink(cast(void**)&gst_element_factory_has_interface, "gst_element_factory_has_interface", libs);
  gidLink(cast(void**)&gst_element_factory_list_is_type, "gst_element_factory_list_is_type", libs);

  // Event
  gidLink(cast(void**)&gst_event_get_type, "gst_event_get_type", libs);
  gidLink(cast(void**)&gst_event_new_buffer_size, "gst_event_new_buffer_size", libs);
  gidLink(cast(void**)&gst_event_new_caps, "gst_event_new_caps", libs);
  gidLink(cast(void**)&gst_event_new_custom, "gst_event_new_custom", libs);
  gidLink(cast(void**)&gst_event_new_eos, "gst_event_new_eos", libs);
  gidLink(cast(void**)&gst_event_new_flush_start, "gst_event_new_flush_start", libs);
  gidLink(cast(void**)&gst_event_new_flush_stop, "gst_event_new_flush_stop", libs);
  gidLink(cast(void**)&gst_event_new_gap, "gst_event_new_gap", libs);
  gidLink(cast(void**)&gst_event_new_instant_rate_change, "gst_event_new_instant_rate_change", libs);
  gidLink(cast(void**)&gst_event_new_instant_rate_sync_time, "gst_event_new_instant_rate_sync_time", libs);
  gidLink(cast(void**)&gst_event_new_latency, "gst_event_new_latency", libs);
  gidLink(cast(void**)&gst_event_new_navigation, "gst_event_new_navigation", libs);
  gidLink(cast(void**)&gst_event_new_protection, "gst_event_new_protection", libs);
  gidLink(cast(void**)&gst_event_new_qos, "gst_event_new_qos", libs);
  gidLink(cast(void**)&gst_event_new_reconfigure, "gst_event_new_reconfigure", libs);
  gidLink(cast(void**)&gst_event_new_seek, "gst_event_new_seek", libs);
  gidLink(cast(void**)&gst_event_new_segment, "gst_event_new_segment", libs);
  gidLink(cast(void**)&gst_event_new_segment_done, "gst_event_new_segment_done", libs);
  gidLink(cast(void**)&gst_event_new_select_streams, "gst_event_new_select_streams", libs);
  gidLink(cast(void**)&gst_event_new_sink_message, "gst_event_new_sink_message", libs);
  gidLink(cast(void**)&gst_event_new_step, "gst_event_new_step", libs);
  gidLink(cast(void**)&gst_event_new_stream_collection, "gst_event_new_stream_collection", libs);
  gidLink(cast(void**)&gst_event_new_stream_group_done, "gst_event_new_stream_group_done", libs);
  gidLink(cast(void**)&gst_event_new_stream_start, "gst_event_new_stream_start", libs);
  gidLink(cast(void**)&gst_event_new_tag, "gst_event_new_tag", libs);
  gidLink(cast(void**)&gst_event_new_toc, "gst_event_new_toc", libs);
  gidLink(cast(void**)&gst_event_new_toc_select, "gst_event_new_toc_select", libs);
  gidLink(cast(void**)&gst_event_copy, "gst_event_copy", libs);
  gidLink(cast(void**)&gst_event_copy_segment, "gst_event_copy_segment", libs);
  gidLink(cast(void**)&gst_event_get_running_time_offset, "gst_event_get_running_time_offset", libs);
  gidLink(cast(void**)&gst_event_get_seqnum, "gst_event_get_seqnum", libs);
  gidLink(cast(void**)&gst_event_get_structure, "gst_event_get_structure", libs);
  gidLink(cast(void**)&gst_event_has_name, "gst_event_has_name", libs);
  gidLink(cast(void**)&gst_event_has_name_id, "gst_event_has_name_id", libs);
  gidLink(cast(void**)&gst_event_is_writable, "gst_event_is_writable", libs);
  gidLink(cast(void**)&gst_event_make_writable, "gst_event_make_writable", libs);
  gidLink(cast(void**)&gst_event_parse_buffer_size, "gst_event_parse_buffer_size", libs);
  gidLink(cast(void**)&gst_event_parse_caps, "gst_event_parse_caps", libs);
  gidLink(cast(void**)&gst_event_parse_flush_stop, "gst_event_parse_flush_stop", libs);
  gidLink(cast(void**)&gst_event_parse_gap, "gst_event_parse_gap", libs);
  gidLink(cast(void**)&gst_event_parse_gap_flags, "gst_event_parse_gap_flags", libs);
  gidLink(cast(void**)&gst_event_parse_group_id, "gst_event_parse_group_id", libs);
  gidLink(cast(void**)&gst_event_parse_instant_rate_change, "gst_event_parse_instant_rate_change", libs);
  gidLink(cast(void**)&gst_event_parse_instant_rate_sync_time, "gst_event_parse_instant_rate_sync_time", libs);
  gidLink(cast(void**)&gst_event_parse_latency, "gst_event_parse_latency", libs);
  gidLink(cast(void**)&gst_event_parse_protection, "gst_event_parse_protection", libs);
  gidLink(cast(void**)&gst_event_parse_qos, "gst_event_parse_qos", libs);
  gidLink(cast(void**)&gst_event_parse_seek, "gst_event_parse_seek", libs);
  gidLink(cast(void**)&gst_event_parse_seek_trickmode_interval, "gst_event_parse_seek_trickmode_interval", libs);
  gidLink(cast(void**)&gst_event_parse_segment, "gst_event_parse_segment", libs);
  gidLink(cast(void**)&gst_event_parse_segment_done, "gst_event_parse_segment_done", libs);
  gidLink(cast(void**)&gst_event_parse_select_streams, "gst_event_parse_select_streams", libs);
  gidLink(cast(void**)&gst_event_parse_sink_message, "gst_event_parse_sink_message", libs);
  gidLink(cast(void**)&gst_event_parse_step, "gst_event_parse_step", libs);
  gidLink(cast(void**)&gst_event_parse_stream, "gst_event_parse_stream", libs);
  gidLink(cast(void**)&gst_event_parse_stream_collection, "gst_event_parse_stream_collection", libs);
  gidLink(cast(void**)&gst_event_parse_stream_flags, "gst_event_parse_stream_flags", libs);
  gidLink(cast(void**)&gst_event_parse_stream_group_done, "gst_event_parse_stream_group_done", libs);
  gidLink(cast(void**)&gst_event_parse_stream_start, "gst_event_parse_stream_start", libs);
  gidLink(cast(void**)&gst_event_parse_tag, "gst_event_parse_tag", libs);
  gidLink(cast(void**)&gst_event_parse_toc, "gst_event_parse_toc", libs);
  gidLink(cast(void**)&gst_event_parse_toc_select, "gst_event_parse_toc_select", libs);
  gidLink(cast(void**)&gst_event_ref, "gst_event_ref", libs);
  gidLink(cast(void**)&gst_event_set_gap_flags, "gst_event_set_gap_flags", libs);
  gidLink(cast(void**)&gst_event_set_group_id, "gst_event_set_group_id", libs);
  gidLink(cast(void**)&gst_event_set_running_time_offset, "gst_event_set_running_time_offset", libs);
  gidLink(cast(void**)&gst_event_set_seek_trickmode_interval, "gst_event_set_seek_trickmode_interval", libs);
  gidLink(cast(void**)&gst_event_set_seqnum, "gst_event_set_seqnum", libs);
  gidLink(cast(void**)&gst_event_set_stream, "gst_event_set_stream", libs);
  gidLink(cast(void**)&gst_event_set_stream_flags, "gst_event_set_stream_flags", libs);
  gidLink(cast(void**)&gst_event_unref, "gst_event_unref", libs);
  gidLink(cast(void**)&gst_event_writable_structure, "gst_event_writable_structure", libs);
  gidLink(cast(void**)&gst_event_replace, "gst_event_replace", libs);
  gidLink(cast(void**)&gst_event_steal, "gst_event_steal", libs);
  gidLink(cast(void**)&gst_event_take, "gst_event_take", libs);

  // FlagSet
  gidLink(cast(void**)&gst_flagset_get_type, "gst_flagset_get_type", libs);
  gidLink(cast(void**)&gst_flagset_register, "gst_flagset_register", libs);

  // Fraction
  gidLink(cast(void**)&gst_fraction_get_type, "gst_fraction_get_type", libs);

  // FractionRange
  gidLink(cast(void**)&gst_fraction_range_get_type, "gst_fraction_range_get_type", libs);

  // GhostPad
  gidLink(cast(void**)&gst_ghost_pad_get_type, "gst_ghost_pad_get_type", libs);
  gidLink(cast(void**)&gst_ghost_pad_new, "gst_ghost_pad_new", libs);
  gidLink(cast(void**)&gst_ghost_pad_new_from_template, "gst_ghost_pad_new_from_template", libs);
  gidLink(cast(void**)&gst_ghost_pad_new_no_target, "gst_ghost_pad_new_no_target", libs);
  gidLink(cast(void**)&gst_ghost_pad_new_no_target_from_template, "gst_ghost_pad_new_no_target_from_template", libs);
  gidLink(cast(void**)&gst_ghost_pad_activate_mode_default, "gst_ghost_pad_activate_mode_default", libs);
  gidLink(cast(void**)&gst_ghost_pad_internal_activate_mode_default, "gst_ghost_pad_internal_activate_mode_default", libs);
  gidLink(cast(void**)&gst_ghost_pad_construct, "gst_ghost_pad_construct", libs);
  gidLink(cast(void**)&gst_ghost_pad_get_target, "gst_ghost_pad_get_target", libs);
  gidLink(cast(void**)&gst_ghost_pad_set_target, "gst_ghost_pad_set_target", libs);

  // IdStr
  gidLink(cast(void**)&gst_id_str_get_type, "gst_id_str_get_type", libs);
  gidLink(cast(void**)&gst_id_str_new, "gst_id_str_new", libs);
  gidLink(cast(void**)&gst_id_str_as_str, "gst_id_str_as_str", libs);
  gidLink(cast(void**)&gst_id_str_clear, "gst_id_str_clear", libs);
  gidLink(cast(void**)&gst_id_str_copy, "gst_id_str_copy", libs);
  gidLink(cast(void**)&gst_id_str_copy_into, "gst_id_str_copy_into", libs);
  gidLink(cast(void**)&gst_id_str_free, "gst_id_str_free", libs);
  gidLink(cast(void**)&gst_id_str_get_len, "gst_id_str_get_len", libs);
  gidLink(cast(void**)&gst_id_str_init, "gst_id_str_init", libs);
  gidLink(cast(void**)&gst_id_str_is_equal, "gst_id_str_is_equal", libs);
  gidLink(cast(void**)&gst_id_str_is_equal_to_str, "gst_id_str_is_equal_to_str", libs);
  gidLink(cast(void**)&gst_id_str_is_equal_to_str_with_len, "gst_id_str_is_equal_to_str_with_len", libs);
  gidLink(cast(void**)&gst_id_str_move, "gst_id_str_move", libs);
  gidLink(cast(void**)&gst_id_str_set, "gst_id_str_set", libs);
  gidLink(cast(void**)&gst_id_str_set_static_str, "gst_id_str_set_static_str", libs);
  gidLink(cast(void**)&gst_id_str_set_static_str_with_len, "gst_id_str_set_static_str_with_len", libs);
  gidLink(cast(void**)&gst_id_str_set_with_len, "gst_id_str_set_with_len", libs);

  // Int64Range
  gidLink(cast(void**)&gst_int64_range_get_type, "gst_int64_range_get_type", libs);

  // IntRange
  gidLink(cast(void**)&gst_int_range_get_type, "gst_int_range_get_type", libs);

  // Iterator
  gidLink(cast(void**)&gst_iterator_get_type, "gst_iterator_get_type", libs);
  gidLink(cast(void**)&gst_iterator_new, "gst_iterator_new", libs);
  gidLink(cast(void**)&gst_iterator_new_list, "gst_iterator_new_list", libs);
  gidLink(cast(void**)&gst_iterator_new_single, "gst_iterator_new_single", libs);
  gidLink(cast(void**)&gst_iterator_copy, "gst_iterator_copy", libs);
  gidLink(cast(void**)&gst_iterator_filter, "gst_iterator_filter", libs);
  gidLink(cast(void**)&gst_iterator_find_custom, "gst_iterator_find_custom", libs);
  gidLink(cast(void**)&gst_iterator_fold, "gst_iterator_fold", libs);
  gidLink(cast(void**)&gst_iterator_foreach, "gst_iterator_foreach", libs);
  gidLink(cast(void**)&gst_iterator_free, "gst_iterator_free", libs);
  gidLink(cast(void**)&gst_iterator_next, "gst_iterator_next", libs);
  gidLink(cast(void**)&gst_iterator_push, "gst_iterator_push", libs);
  gidLink(cast(void**)&gst_iterator_resync, "gst_iterator_resync", libs);

  // LogContext
  gidLink(cast(void**)&gst_log_context_free, "gst_log_context_free", libs);
  gidLink(cast(void**)&gst_log_context_get_category, "gst_log_context_get_category", libs);
  gidLink(cast(void**)&gst_log_context_reset, "gst_log_context_reset", libs);

  // LogContextBuilder
  gidLink(cast(void**)&gst_log_context_builder_build, "gst_log_context_builder_build", libs);
  gidLink(cast(void**)&gst_log_context_builder_set_category, "gst_log_context_builder_set_category", libs);
  gidLink(cast(void**)&gst_log_context_builder_set_hash_flags, "gst_log_context_builder_set_hash_flags", libs);
  gidLink(cast(void**)&gst_log_context_builder_set_interval, "gst_log_context_builder_set_interval", libs);
  gidLink(cast(void**)&gst_log_context_builder_new, "gst_log_context_builder_new", libs);

  // MapInfo
  gidLink(cast(void**)&gst_map_info_clear, "gst_map_info_clear", libs);
  gidLink(cast(void**)&gst_map_info_get_data, "gst_map_info_get_data", libs);
  gidLink(cast(void**)&gst_map_info_init, "gst_map_info_init", libs);

  // Memory
  gidLink(cast(void**)&gst_memory_get_type, "gst_memory_get_type", libs);
  gidLink(cast(void**)&gst_memory_new_wrapped, "gst_memory_new_wrapped", libs);
  gidLink(cast(void**)&gst_memory_copy, "gst_memory_copy", libs);
  gidLink(cast(void**)&gst_memory_get_sizes, "gst_memory_get_sizes", libs);
  gidLink(cast(void**)&gst_memory_init, "gst_memory_init", libs);
  gidLink(cast(void**)&gst_memory_is_span, "gst_memory_is_span", libs);
  gidLink(cast(void**)&gst_memory_is_type, "gst_memory_is_type", libs);
  gidLink(cast(void**)&gst_memory_is_writable, "gst_memory_is_writable", libs);
  gidLink(cast(void**)&gst_memory_make_mapped, "gst_memory_make_mapped", libs);
  gidLink(cast(void**)&gst_memory_make_writable, "gst_memory_make_writable", libs);
  gidLink(cast(void**)&gst_memory_map, "gst_memory_map", libs);
  gidLink(cast(void**)&gst_memory_ref, "gst_memory_ref", libs);
  gidLink(cast(void**)&gst_memory_resize, "gst_memory_resize", libs);
  gidLink(cast(void**)&gst_memory_share, "gst_memory_share", libs);
  gidLink(cast(void**)&gst_memory_unmap, "gst_memory_unmap", libs);
  gidLink(cast(void**)&gst_memory_unref, "gst_memory_unref", libs);
  gidLink(cast(void**)&gst_memory_replace, "gst_memory_replace", libs);
  gidLink(cast(void**)&gst_memory_steal, "gst_memory_steal", libs);
  gidLink(cast(void**)&gst_memory_take, "gst_memory_take", libs);

  // Message
  gidLink(cast(void**)&gst_message_get_type, "gst_message_get_type", libs);
  gidLink(cast(void**)&gst_message_new_application, "gst_message_new_application", libs);
  gidLink(cast(void**)&gst_message_new_async_done, "gst_message_new_async_done", libs);
  gidLink(cast(void**)&gst_message_new_async_start, "gst_message_new_async_start", libs);
  gidLink(cast(void**)&gst_message_new_buffering, "gst_message_new_buffering", libs);
  gidLink(cast(void**)&gst_message_new_clock_lost, "gst_message_new_clock_lost", libs);
  gidLink(cast(void**)&gst_message_new_clock_provide, "gst_message_new_clock_provide", libs);
  gidLink(cast(void**)&gst_message_new_custom, "gst_message_new_custom", libs);
  gidLink(cast(void**)&gst_message_new_device_added, "gst_message_new_device_added", libs);
  gidLink(cast(void**)&gst_message_new_device_changed, "gst_message_new_device_changed", libs);
  gidLink(cast(void**)&gst_message_new_device_monitor_started, "gst_message_new_device_monitor_started", libs);
  gidLink(cast(void**)&gst_message_new_device_removed, "gst_message_new_device_removed", libs);
  gidLink(cast(void**)&gst_message_new_duration_changed, "gst_message_new_duration_changed", libs);
  gidLink(cast(void**)&gst_message_new_element, "gst_message_new_element", libs);
  gidLink(cast(void**)&gst_message_new_eos, "gst_message_new_eos", libs);
  gidLink(cast(void**)&gst_message_new_error, "gst_message_new_error", libs);
  gidLink(cast(void**)&gst_message_new_error_with_details, "gst_message_new_error_with_details", libs);
  gidLink(cast(void**)&gst_message_new_have_context, "gst_message_new_have_context", libs);
  gidLink(cast(void**)&gst_message_new_info, "gst_message_new_info", libs);
  gidLink(cast(void**)&gst_message_new_info_with_details, "gst_message_new_info_with_details", libs);
  gidLink(cast(void**)&gst_message_new_instant_rate_request, "gst_message_new_instant_rate_request", libs);
  gidLink(cast(void**)&gst_message_new_latency, "gst_message_new_latency", libs);
  gidLink(cast(void**)&gst_message_new_need_context, "gst_message_new_need_context", libs);
  gidLink(cast(void**)&gst_message_new_new_clock, "gst_message_new_new_clock", libs);
  gidLink(cast(void**)&gst_message_new_progress, "gst_message_new_progress", libs);
  gidLink(cast(void**)&gst_message_new_property_notify, "gst_message_new_property_notify", libs);
  gidLink(cast(void**)&gst_message_new_qos, "gst_message_new_qos", libs);
  gidLink(cast(void**)&gst_message_new_redirect, "gst_message_new_redirect", libs);
  gidLink(cast(void**)&gst_message_new_request_state, "gst_message_new_request_state", libs);
  gidLink(cast(void**)&gst_message_new_reset_time, "gst_message_new_reset_time", libs);
  gidLink(cast(void**)&gst_message_new_segment_done, "gst_message_new_segment_done", libs);
  gidLink(cast(void**)&gst_message_new_segment_start, "gst_message_new_segment_start", libs);
  gidLink(cast(void**)&gst_message_new_state_changed, "gst_message_new_state_changed", libs);
  gidLink(cast(void**)&gst_message_new_state_dirty, "gst_message_new_state_dirty", libs);
  gidLink(cast(void**)&gst_message_new_step_done, "gst_message_new_step_done", libs);
  gidLink(cast(void**)&gst_message_new_step_start, "gst_message_new_step_start", libs);
  gidLink(cast(void**)&gst_message_new_stream_collection, "gst_message_new_stream_collection", libs);
  gidLink(cast(void**)&gst_message_new_stream_start, "gst_message_new_stream_start", libs);
  gidLink(cast(void**)&gst_message_new_stream_status, "gst_message_new_stream_status", libs);
  gidLink(cast(void**)&gst_message_new_streams_selected, "gst_message_new_streams_selected", libs);
  gidLink(cast(void**)&gst_message_new_structure_change, "gst_message_new_structure_change", libs);
  gidLink(cast(void**)&gst_message_new_tag, "gst_message_new_tag", libs);
  gidLink(cast(void**)&gst_message_new_toc, "gst_message_new_toc", libs);
  gidLink(cast(void**)&gst_message_new_warning, "gst_message_new_warning", libs);
  gidLink(cast(void**)&gst_message_new_warning_with_details, "gst_message_new_warning_with_details", libs);
  gidLink(cast(void**)&gst_message_add_redirect_entry, "gst_message_add_redirect_entry", libs);
  gidLink(cast(void**)&gst_message_copy, "gst_message_copy", libs);
  gidLink(cast(void**)&gst_message_get_details, "gst_message_get_details", libs);
  gidLink(cast(void**)&gst_message_get_num_redirect_entries, "gst_message_get_num_redirect_entries", libs);
  gidLink(cast(void**)&gst_message_get_seqnum, "gst_message_get_seqnum", libs);
  gidLink(cast(void**)&gst_message_get_stream_status_object, "gst_message_get_stream_status_object", libs);
  gidLink(cast(void**)&gst_message_get_structure, "gst_message_get_structure", libs);
  gidLink(cast(void**)&gst_message_has_name, "gst_message_has_name", libs);
  gidLink(cast(void**)&gst_message_is_writable, "gst_message_is_writable", libs);
  gidLink(cast(void**)&gst_message_make_writable, "gst_message_make_writable", libs);
  gidLink(cast(void**)&gst_message_parse_async_done, "gst_message_parse_async_done", libs);
  gidLink(cast(void**)&gst_message_parse_buffering, "gst_message_parse_buffering", libs);
  gidLink(cast(void**)&gst_message_parse_buffering_stats, "gst_message_parse_buffering_stats", libs);
  gidLink(cast(void**)&gst_message_parse_clock_lost, "gst_message_parse_clock_lost", libs);
  gidLink(cast(void**)&gst_message_parse_clock_provide, "gst_message_parse_clock_provide", libs);
  gidLink(cast(void**)&gst_message_parse_context_type, "gst_message_parse_context_type", libs);
  gidLink(cast(void**)&gst_message_parse_device_added, "gst_message_parse_device_added", libs);
  gidLink(cast(void**)&gst_message_parse_device_changed, "gst_message_parse_device_changed", libs);
  gidLink(cast(void**)&gst_message_parse_device_monitor_started, "gst_message_parse_device_monitor_started", libs);
  gidLink(cast(void**)&gst_message_parse_device_removed, "gst_message_parse_device_removed", libs);
  gidLink(cast(void**)&gst_message_parse_error, "gst_message_parse_error", libs);
  gidLink(cast(void**)&gst_message_parse_error_details, "gst_message_parse_error_details", libs);
  gidLink(cast(void**)&gst_message_parse_error_writable_details, "gst_message_parse_error_writable_details", libs);
  gidLink(cast(void**)&gst_message_parse_group_id, "gst_message_parse_group_id", libs);
  gidLink(cast(void**)&gst_message_parse_have_context, "gst_message_parse_have_context", libs);
  gidLink(cast(void**)&gst_message_parse_info, "gst_message_parse_info", libs);
  gidLink(cast(void**)&gst_message_parse_info_details, "gst_message_parse_info_details", libs);
  gidLink(cast(void**)&gst_message_parse_info_writable_details, "gst_message_parse_info_writable_details", libs);
  gidLink(cast(void**)&gst_message_parse_instant_rate_request, "gst_message_parse_instant_rate_request", libs);
  gidLink(cast(void**)&gst_message_parse_new_clock, "gst_message_parse_new_clock", libs);
  gidLink(cast(void**)&gst_message_parse_progress, "gst_message_parse_progress", libs);
  gidLink(cast(void**)&gst_message_parse_property_notify, "gst_message_parse_property_notify", libs);
  gidLink(cast(void**)&gst_message_parse_qos, "gst_message_parse_qos", libs);
  gidLink(cast(void**)&gst_message_parse_qos_stats, "gst_message_parse_qos_stats", libs);
  gidLink(cast(void**)&gst_message_parse_qos_values, "gst_message_parse_qos_values", libs);
  gidLink(cast(void**)&gst_message_parse_redirect_entry, "gst_message_parse_redirect_entry", libs);
  gidLink(cast(void**)&gst_message_parse_request_state, "gst_message_parse_request_state", libs);
  gidLink(cast(void**)&gst_message_parse_reset_time, "gst_message_parse_reset_time", libs);
  gidLink(cast(void**)&gst_message_parse_segment_done, "gst_message_parse_segment_done", libs);
  gidLink(cast(void**)&gst_message_parse_segment_start, "gst_message_parse_segment_start", libs);
  gidLink(cast(void**)&gst_message_parse_state_changed, "gst_message_parse_state_changed", libs);
  gidLink(cast(void**)&gst_message_parse_step_done, "gst_message_parse_step_done", libs);
  gidLink(cast(void**)&gst_message_parse_step_start, "gst_message_parse_step_start", libs);
  gidLink(cast(void**)&gst_message_parse_stream_collection, "gst_message_parse_stream_collection", libs);
  gidLink(cast(void**)&gst_message_parse_stream_status, "gst_message_parse_stream_status", libs);
  gidLink(cast(void**)&gst_message_parse_streams_selected, "gst_message_parse_streams_selected", libs);
  gidLink(cast(void**)&gst_message_parse_structure_change, "gst_message_parse_structure_change", libs);
  gidLink(cast(void**)&gst_message_parse_tag, "gst_message_parse_tag", libs);
  gidLink(cast(void**)&gst_message_parse_toc, "gst_message_parse_toc", libs);
  gidLink(cast(void**)&gst_message_parse_warning, "gst_message_parse_warning", libs);
  gidLink(cast(void**)&gst_message_parse_warning_details, "gst_message_parse_warning_details", libs);
  gidLink(cast(void**)&gst_message_parse_warning_writable_details, "gst_message_parse_warning_writable_details", libs);
  gidLink(cast(void**)&gst_message_ref, "gst_message_ref", libs);
  gidLink(cast(void**)&gst_message_set_buffering_stats, "gst_message_set_buffering_stats", libs);
  gidLink(cast(void**)&gst_message_set_details, "gst_message_set_details", libs);
  gidLink(cast(void**)&gst_message_set_group_id, "gst_message_set_group_id", libs);
  gidLink(cast(void**)&gst_message_set_qos_stats, "gst_message_set_qos_stats", libs);
  gidLink(cast(void**)&gst_message_set_qos_values, "gst_message_set_qos_values", libs);
  gidLink(cast(void**)&gst_message_set_seqnum, "gst_message_set_seqnum", libs);
  gidLink(cast(void**)&gst_message_set_stream_status_object, "gst_message_set_stream_status_object", libs);
  gidLink(cast(void**)&gst_message_streams_selected_add, "gst_message_streams_selected_add", libs);
  gidLink(cast(void**)&gst_message_streams_selected_get_size, "gst_message_streams_selected_get_size", libs);
  gidLink(cast(void**)&gst_message_streams_selected_get_stream, "gst_message_streams_selected_get_stream", libs);
  gidLink(cast(void**)&gst_message_unref, "gst_message_unref", libs);
  gidLink(cast(void**)&gst_message_writable_details, "gst_message_writable_details", libs);
  gidLink(cast(void**)&gst_message_writable_structure, "gst_message_writable_structure", libs);
  gidLink(cast(void**)&gst_message_replace, "gst_message_replace", libs);
  gidLink(cast(void**)&gst_message_steal, "gst_message_steal", libs);
  gidLink(cast(void**)&gst_message_take, "gst_message_take", libs);

  // Meta
  gidLink(cast(void**)&gst_meta_compare_seqnum, "gst_meta_compare_seqnum", libs);
  gidLink(cast(void**)&gst_meta_get_seqnum, "gst_meta_get_seqnum", libs);
  gidLink(cast(void**)&gst_meta_serialize, "gst_meta_serialize", libs);
  gidLink(cast(void**)&gst_meta_serialize_simple, "gst_meta_serialize_simple", libs);
  gidLink(cast(void**)&gst_meta_api_type_aggregate_params, "gst_meta_api_type_aggregate_params", libs);
  gidLink(cast(void**)&gst_meta_api_type_get_tags, "gst_meta_api_type_get_tags", libs);
  gidLink(cast(void**)&gst_meta_api_type_has_tag, "gst_meta_api_type_has_tag", libs);
  gidLink(cast(void**)&gst_meta_api_type_register, "gst_meta_api_type_register", libs);
  gidLink(cast(void**)&gst_meta_api_type_set_params_aggregator, "gst_meta_api_type_set_params_aggregator", libs);
  gidLink(cast(void**)&gst_meta_api_type_tags_contain_only, "gst_meta_api_type_tags_contain_only", libs);
  gidLink(cast(void**)&gst_meta_deserialize, "gst_meta_deserialize", libs);
  gidLink(cast(void**)&gst_meta_get_info, "gst_meta_get_info", libs);
  gidLink(cast(void**)&gst_meta_register, "gst_meta_register", libs);
  gidLink(cast(void**)&gst_meta_register_custom, "gst_meta_register_custom", libs);
  gidLink(cast(void**)&gst_meta_register_custom_simple, "gst_meta_register_custom_simple", libs);

  // MetaFactory
  gidLink(cast(void**)&gst_meta_factory_get_type, "gst_meta_factory_get_type", libs);
  gidLink(cast(void**)&gst_meta_factory_load, "gst_meta_factory_load", libs);
  gidLink(cast(void**)&gst_meta_factory_register, "gst_meta_factory_register", libs);

  // MetaInfo
  gidLink(cast(void**)&gst_meta_info_is_custom, "gst_meta_info_is_custom", libs);
  gidLink(cast(void**)&gst_meta_info_register, "gst_meta_info_register", libs);
  gidLink(cast(void**)&gst_meta_info_new, "gst_meta_info_new", libs);

  // MiniObject
  gidLink(cast(void**)&gst_mini_object_get_type, "gst_mini_object_get_type", libs);
  gidLink(cast(void**)&gst_mini_object_add_parent, "gst_mini_object_add_parent", libs);
  gidLink(cast(void**)&gst_mini_object_copy, "gst_mini_object_copy", libs);
  gidLink(cast(void**)&gst_mini_object_get_qdata, "gst_mini_object_get_qdata", libs);
  gidLink(cast(void**)&gst_mini_object_init, "gst_mini_object_init", libs);
  gidLink(cast(void**)&gst_mini_object_is_writable, "gst_mini_object_is_writable", libs);
  gidLink(cast(void**)&gst_mini_object_lock, "gst_mini_object_lock", libs);
  gidLink(cast(void**)&gst_mini_object_make_writable, "gst_mini_object_make_writable", libs);
  gidLink(cast(void**)&gst_mini_object_ref, "gst_mini_object_ref", libs);
  gidLink(cast(void**)&gst_mini_object_remove_parent, "gst_mini_object_remove_parent", libs);
  gidLink(cast(void**)&gst_mini_object_set_qdata, "gst_mini_object_set_qdata", libs);
  gidLink(cast(void**)&gst_mini_object_steal_qdata, "gst_mini_object_steal_qdata", libs);
  gidLink(cast(void**)&gst_mini_object_unlock, "gst_mini_object_unlock", libs);
  gidLink(cast(void**)&gst_mini_object_unref, "gst_mini_object_unref", libs);
  gidLink(cast(void**)&gst_mini_object_weak_ref, "gst_mini_object_weak_ref", libs);
  gidLink(cast(void**)&gst_mini_object_weak_unref, "gst_mini_object_weak_unref", libs);
  gidLink(cast(void**)&gst_mini_object_replace, "gst_mini_object_replace", libs);
  gidLink(cast(void**)&gst_mini_object_steal, "gst_mini_object_steal", libs);
  gidLink(cast(void**)&gst_mini_object_take, "gst_mini_object_take", libs);

  // ObjectWrap
  gidLink(cast(void**)&gst_object_get_type, "gst_object_get_type", libs);
  gidLink(cast(void**)&gst_object_check_uniqueness, "gst_object_check_uniqueness", libs);
  gidLink(cast(void**)&gst_object_default_deep_notify, "gst_object_default_deep_notify", libs);
  gidLink(cast(void**)&gst_object_ref_sink, "gst_object_ref_sink", libs);
  gidLink(cast(void**)&gst_object_replace, "gst_object_replace", libs);
  gidLink(cast(void**)&gst_object_add_control_binding, "gst_object_add_control_binding", libs);
  gidLink(cast(void**)&gst_object_call_async, "gst_object_call_async", libs);
  gidLink(cast(void**)&gst_object_default_error, "gst_object_default_error", libs);
  gidLink(cast(void**)&gst_object_get_control_binding, "gst_object_get_control_binding", libs);
  gidLink(cast(void**)&gst_object_get_control_rate, "gst_object_get_control_rate", libs);
  gidLink(cast(void**)&gst_object_get_g_value_array, "gst_object_get_g_value_array", libs);
  gidLink(cast(void**)&gst_object_get_name, "gst_object_get_name", libs);
  gidLink(cast(void**)&gst_object_get_parent, "gst_object_get_parent", libs);
  gidLink(cast(void**)&gst_object_get_path_string, "gst_object_get_path_string", libs);
  gidLink(cast(void**)&gst_object_get_toplevel, "gst_object_get_toplevel", libs);
  gidLink(cast(void**)&gst_object_get_value, "gst_object_get_value", libs);
  gidLink(cast(void**)&gst_object_get_value_array, "gst_object_get_value_array", libs);
  gidLink(cast(void**)&gst_object_has_active_control_bindings, "gst_object_has_active_control_bindings", libs);
  gidLink(cast(void**)&gst_object_has_ancestor, "gst_object_has_ancestor", libs);
  gidLink(cast(void**)&gst_object_has_as_ancestor, "gst_object_has_as_ancestor", libs);
  gidLink(cast(void**)&gst_object_has_as_parent, "gst_object_has_as_parent", libs);
  gidLink(cast(void**)&gst_object_ref, "gst_object_ref", libs);
  gidLink(cast(void**)&gst_object_remove_control_binding, "gst_object_remove_control_binding", libs);
  gidLink(cast(void**)&gst_object_set_control_binding_disabled, "gst_object_set_control_binding_disabled", libs);
  gidLink(cast(void**)&gst_object_set_control_bindings_disabled, "gst_object_set_control_bindings_disabled", libs);
  gidLink(cast(void**)&gst_object_set_control_rate, "gst_object_set_control_rate", libs);
  gidLink(cast(void**)&gst_object_set_name, "gst_object_set_name", libs);
  gidLink(cast(void**)&gst_object_set_parent, "gst_object_set_parent", libs);
  gidLink(cast(void**)&gst_object_suggest_next_sync, "gst_object_suggest_next_sync", libs);
  gidLink(cast(void**)&gst_object_sync_values, "gst_object_sync_values", libs);
  gidLink(cast(void**)&gst_object_unparent, "gst_object_unparent", libs);
  gidLink(cast(void**)&gst_object_unref, "gst_object_unref", libs);

  // Pad
  gidLink(cast(void**)&gst_pad_get_type, "gst_pad_get_type", libs);
  gidLink(cast(void**)&gst_pad_new, "gst_pad_new", libs);
  gidLink(cast(void**)&gst_pad_new_from_static_template, "gst_pad_new_from_static_template", libs);
  gidLink(cast(void**)&gst_pad_new_from_template, "gst_pad_new_from_template", libs);
  gidLink(cast(void**)&gst_pad_link_get_name, "gst_pad_link_get_name", libs);
  gidLink(cast(void**)&gst_pad_activate_mode, "gst_pad_activate_mode", libs);
  gidLink(cast(void**)&gst_pad_add_probe, "gst_pad_add_probe", libs);
  gidLink(cast(void**)&gst_pad_can_link, "gst_pad_can_link", libs);
  gidLink(cast(void**)&gst_pad_chain, "gst_pad_chain", libs);
  gidLink(cast(void**)&gst_pad_chain_list, "gst_pad_chain_list", libs);
  gidLink(cast(void**)&gst_pad_check_reconfigure, "gst_pad_check_reconfigure", libs);
  gidLink(cast(void**)&gst_pad_create_stream_id, "gst_pad_create_stream_id", libs);
  gidLink(cast(void**)&gst_pad_create_stream_id_printf, "gst_pad_create_stream_id_printf", libs);
  gidLink(cast(void**)&gst_pad_create_stream_id_printf_valist, "gst_pad_create_stream_id_printf_valist", libs);
  gidLink(cast(void**)&gst_pad_event_default, "gst_pad_event_default", libs);
  gidLink(cast(void**)&gst_pad_forward, "gst_pad_forward", libs);
  gidLink(cast(void**)&gst_pad_get_allowed_caps, "gst_pad_get_allowed_caps", libs);
  gidLink(cast(void**)&gst_pad_get_current_caps, "gst_pad_get_current_caps", libs);
  gidLink(cast(void**)&gst_pad_get_direction, "gst_pad_get_direction", libs);
  gidLink(cast(void**)&gst_pad_get_element_private, "gst_pad_get_element_private", libs);
  gidLink(cast(void**)&gst_pad_get_last_flow_return, "gst_pad_get_last_flow_return", libs);
  gidLink(cast(void**)&gst_pad_get_offset, "gst_pad_get_offset", libs);
  gidLink(cast(void**)&gst_pad_get_pad_template, "gst_pad_get_pad_template", libs);
  gidLink(cast(void**)&gst_pad_get_pad_template_caps, "gst_pad_get_pad_template_caps", libs);
  gidLink(cast(void**)&gst_pad_get_parent_element, "gst_pad_get_parent_element", libs);
  gidLink(cast(void**)&gst_pad_get_peer, "gst_pad_get_peer", libs);
  gidLink(cast(void**)&gst_pad_get_range, "gst_pad_get_range", libs);
  gidLink(cast(void**)&gst_pad_get_single_internal_link, "gst_pad_get_single_internal_link", libs);
  gidLink(cast(void**)&gst_pad_get_sticky_event, "gst_pad_get_sticky_event", libs);
  gidLink(cast(void**)&gst_pad_get_stream, "gst_pad_get_stream", libs);
  gidLink(cast(void**)&gst_pad_get_stream_id, "gst_pad_get_stream_id", libs);
  gidLink(cast(void**)&gst_pad_get_task_state, "gst_pad_get_task_state", libs);
  gidLink(cast(void**)&gst_pad_has_current_caps, "gst_pad_has_current_caps", libs);
  gidLink(cast(void**)&gst_pad_is_active, "gst_pad_is_active", libs);
  gidLink(cast(void**)&gst_pad_is_blocked, "gst_pad_is_blocked", libs);
  gidLink(cast(void**)&gst_pad_is_blocking, "gst_pad_is_blocking", libs);
  gidLink(cast(void**)&gst_pad_is_linked, "gst_pad_is_linked", libs);
  gidLink(cast(void**)&gst_pad_iterate_internal_links, "gst_pad_iterate_internal_links", libs);
  gidLink(cast(void**)&gst_pad_iterate_internal_links_default, "gst_pad_iterate_internal_links_default", libs);
  gidLink(cast(void**)&gst_pad_link, "gst_pad_link", libs);
  gidLink(cast(void**)&gst_pad_link_full, "gst_pad_link_full", libs);
  gidLink(cast(void**)&gst_pad_link_maybe_ghosting, "gst_pad_link_maybe_ghosting", libs);
  gidLink(cast(void**)&gst_pad_link_maybe_ghosting_full, "gst_pad_link_maybe_ghosting_full", libs);
  gidLink(cast(void**)&gst_pad_mark_reconfigure, "gst_pad_mark_reconfigure", libs);
  gidLink(cast(void**)&gst_pad_needs_reconfigure, "gst_pad_needs_reconfigure", libs);
  gidLink(cast(void**)&gst_pad_pause_task, "gst_pad_pause_task", libs);
  gidLink(cast(void**)&gst_pad_peer_query, "gst_pad_peer_query", libs);
  gidLink(cast(void**)&gst_pad_peer_query_accept_caps, "gst_pad_peer_query_accept_caps", libs);
  gidLink(cast(void**)&gst_pad_peer_query_caps, "gst_pad_peer_query_caps", libs);
  gidLink(cast(void**)&gst_pad_peer_query_convert, "gst_pad_peer_query_convert", libs);
  gidLink(cast(void**)&gst_pad_peer_query_duration, "gst_pad_peer_query_duration", libs);
  gidLink(cast(void**)&gst_pad_peer_query_position, "gst_pad_peer_query_position", libs);
  gidLink(cast(void**)&gst_pad_proxy_query_accept_caps, "gst_pad_proxy_query_accept_caps", libs);
  gidLink(cast(void**)&gst_pad_proxy_query_caps, "gst_pad_proxy_query_caps", libs);
  gidLink(cast(void**)&gst_pad_pull_range, "gst_pad_pull_range", libs);
  gidLink(cast(void**)&gst_pad_push, "gst_pad_push", libs);
  gidLink(cast(void**)&gst_pad_push_event, "gst_pad_push_event", libs);
  gidLink(cast(void**)&gst_pad_push_list, "gst_pad_push_list", libs);
  gidLink(cast(void**)&gst_pad_query, "gst_pad_query", libs);
  gidLink(cast(void**)&gst_pad_query_accept_caps, "gst_pad_query_accept_caps", libs);
  gidLink(cast(void**)&gst_pad_query_caps, "gst_pad_query_caps", libs);
  gidLink(cast(void**)&gst_pad_query_convert, "gst_pad_query_convert", libs);
  gidLink(cast(void**)&gst_pad_query_default, "gst_pad_query_default", libs);
  gidLink(cast(void**)&gst_pad_query_duration, "gst_pad_query_duration", libs);
  gidLink(cast(void**)&gst_pad_query_position, "gst_pad_query_position", libs);
  gidLink(cast(void**)&gst_pad_remove_probe, "gst_pad_remove_probe", libs);
  gidLink(cast(void**)&gst_pad_send_event, "gst_pad_send_event", libs);
  gidLink(cast(void**)&gst_pad_set_activate_function_full, "gst_pad_set_activate_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_activatemode_function_full, "gst_pad_set_activatemode_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_active, "gst_pad_set_active", libs);
  gidLink(cast(void**)&gst_pad_set_chain_function_full, "gst_pad_set_chain_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_chain_list_function_full, "gst_pad_set_chain_list_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_element_private, "gst_pad_set_element_private", libs);
  gidLink(cast(void**)&gst_pad_set_event_full_function_full, "gst_pad_set_event_full_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_event_function_full, "gst_pad_set_event_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_getrange_function_full, "gst_pad_set_getrange_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_iterate_internal_links_function_full, "gst_pad_set_iterate_internal_links_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_link_function_full, "gst_pad_set_link_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_offset, "gst_pad_set_offset", libs);
  gidLink(cast(void**)&gst_pad_set_query_function_full, "gst_pad_set_query_function_full", libs);
  gidLink(cast(void**)&gst_pad_set_unlink_function_full, "gst_pad_set_unlink_function_full", libs);
  gidLink(cast(void**)&gst_pad_start_task, "gst_pad_start_task", libs);
  gidLink(cast(void**)&gst_pad_sticky_events_foreach, "gst_pad_sticky_events_foreach", libs);
  gidLink(cast(void**)&gst_pad_stop_task, "gst_pad_stop_task", libs);
  gidLink(cast(void**)&gst_pad_store_sticky_event, "gst_pad_store_sticky_event", libs);
  gidLink(cast(void**)&gst_pad_unlink, "gst_pad_unlink", libs);
  gidLink(cast(void**)&gst_pad_use_fixed_caps, "gst_pad_use_fixed_caps", libs);

  // PadProbeInfo
  gidLink(cast(void**)&gst_pad_probe_info_get_buffer, "gst_pad_probe_info_get_buffer", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_buffer_list, "gst_pad_probe_info_get_buffer_list", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_event, "gst_pad_probe_info_get_event", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_flow_return, "gst_pad_probe_info_get_flow_return", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_id, "gst_pad_probe_info_get_id", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_offset, "gst_pad_probe_info_get_offset", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_query, "gst_pad_probe_info_get_query", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_size, "gst_pad_probe_info_get_size", libs);
  gidLink(cast(void**)&gst_pad_probe_info_get_type, "gst_pad_probe_info_get_type", libs);
  gidLink(cast(void**)&gst_pad_probe_info_set_buffer, "gst_pad_probe_info_set_buffer", libs);
  gidLink(cast(void**)&gst_pad_probe_info_set_buffer_list, "gst_pad_probe_info_set_buffer_list", libs);
  gidLink(cast(void**)&gst_pad_probe_info_set_event, "gst_pad_probe_info_set_event", libs);
  gidLink(cast(void**)&gst_pad_probe_info_set_flow_return, "gst_pad_probe_info_set_flow_return", libs);

  // PadTemplate
  gidLink(cast(void**)&gst_pad_template_get_type, "gst_pad_template_get_type", libs);
  gidLink(cast(void**)&gst_pad_template_new, "gst_pad_template_new", libs);
  gidLink(cast(void**)&gst_pad_template_new_from_static_pad_template_with_gtype, "gst_pad_template_new_from_static_pad_template_with_gtype", libs);
  gidLink(cast(void**)&gst_pad_template_new_with_gtype, "gst_pad_template_new_with_gtype", libs);
  gidLink(cast(void**)&gst_pad_template_get_caps, "gst_pad_template_get_caps", libs);
  gidLink(cast(void**)&gst_pad_template_get_documentation_caps, "gst_pad_template_get_documentation_caps", libs);
  gidLink(cast(void**)&gst_pad_template_pad_created, "gst_pad_template_pad_created", libs);
  gidLink(cast(void**)&gst_pad_template_set_documentation_caps, "gst_pad_template_set_documentation_caps", libs);

  // ParamArray
  gidLink(cast(void**)&gst_param_spec_array_get_type, "gst_param_spec_array_get_type", libs);

  // ParamFraction
  gidLink(cast(void**)&gst_param_spec_fraction_get_type, "gst_param_spec_fraction_get_type", libs);

  // ParentBufferMeta
  gidLink(cast(void**)&gst_parent_buffer_meta_get_info, "gst_parent_buffer_meta_get_info", libs);

  // ParseContext
  gidLink(cast(void**)&gst_parse_context_get_type, "gst_parse_context_get_type", libs);
  gidLink(cast(void**)&gst_parse_context_new, "gst_parse_context_new", libs);
  gidLink(cast(void**)&gst_parse_context_copy, "gst_parse_context_copy", libs);
  gidLink(cast(void**)&gst_parse_context_free, "gst_parse_context_free", libs);
  gidLink(cast(void**)&gst_parse_context_get_missing_elements, "gst_parse_context_get_missing_elements", libs);

  // Pipeline
  gidLink(cast(void**)&gst_pipeline_get_type, "gst_pipeline_get_type", libs);
  gidLink(cast(void**)&gst_pipeline_new, "gst_pipeline_new", libs);
  gidLink(cast(void**)&gst_pipeline_auto_clock, "gst_pipeline_auto_clock", libs);
  gidLink(cast(void**)&gst_pipeline_get_auto_flush_bus, "gst_pipeline_get_auto_flush_bus", libs);
  gidLink(cast(void**)&gst_pipeline_get_bus, "gst_pipeline_get_bus", libs);
  gidLink(cast(void**)&gst_pipeline_get_clock, "gst_pipeline_get_clock", libs);
  gidLink(cast(void**)&gst_pipeline_get_configured_latency, "gst_pipeline_get_configured_latency", libs);
  gidLink(cast(void**)&gst_pipeline_get_delay, "gst_pipeline_get_delay", libs);
  gidLink(cast(void**)&gst_pipeline_get_latency, "gst_pipeline_get_latency", libs);
  gidLink(cast(void**)&gst_pipeline_get_pipeline_clock, "gst_pipeline_get_pipeline_clock", libs);
  gidLink(cast(void**)&gst_pipeline_is_live, "gst_pipeline_is_live", libs);
  gidLink(cast(void**)&gst_pipeline_set_auto_flush_bus, "gst_pipeline_set_auto_flush_bus", libs);
  gidLink(cast(void**)&gst_pipeline_set_clock, "gst_pipeline_set_clock", libs);
  gidLink(cast(void**)&gst_pipeline_set_delay, "gst_pipeline_set_delay", libs);
  gidLink(cast(void**)&gst_pipeline_set_latency, "gst_pipeline_set_latency", libs);
  gidLink(cast(void**)&gst_pipeline_use_clock, "gst_pipeline_use_clock", libs);

  // Plugin
  gidLink(cast(void**)&gst_plugin_get_type, "gst_plugin_get_type", libs);
  gidLink(cast(void**)&gst_plugin_list_free, "gst_plugin_list_free", libs);
  gidLink(cast(void**)&gst_plugin_load_by_name, "gst_plugin_load_by_name", libs);
  gidLink(cast(void**)&gst_plugin_load_file, "gst_plugin_load_file", libs);
  gidLink(cast(void**)&gst_plugin_register_static, "gst_plugin_register_static", libs);
  gidLink(cast(void**)&gst_plugin_register_static_full, "gst_plugin_register_static_full", libs);
  gidLink(cast(void**)&gst_plugin_add_dependency, "gst_plugin_add_dependency", libs);
  gidLink(cast(void**)&gst_plugin_add_dependency_simple, "gst_plugin_add_dependency_simple", libs);
  gidLink(cast(void**)&gst_plugin_add_status_error, "gst_plugin_add_status_error", libs);
  gidLink(cast(void**)&gst_plugin_add_status_info, "gst_plugin_add_status_info", libs);
  gidLink(cast(void**)&gst_plugin_add_status_warning, "gst_plugin_add_status_warning", libs);
  gidLink(cast(void**)&gst_plugin_get_cache_data, "gst_plugin_get_cache_data", libs);
  gidLink(cast(void**)&gst_plugin_get_description, "gst_plugin_get_description", libs);
  gidLink(cast(void**)&gst_plugin_get_filename, "gst_plugin_get_filename", libs);
  gidLink(cast(void**)&gst_plugin_get_license, "gst_plugin_get_license", libs);
  gidLink(cast(void**)&gst_plugin_get_name, "gst_plugin_get_name", libs);
  gidLink(cast(void**)&gst_plugin_get_origin, "gst_plugin_get_origin", libs);
  gidLink(cast(void**)&gst_plugin_get_package, "gst_plugin_get_package", libs);
  gidLink(cast(void**)&gst_plugin_get_release_date_string, "gst_plugin_get_release_date_string", libs);
  gidLink(cast(void**)&gst_plugin_get_source, "gst_plugin_get_source", libs);
  gidLink(cast(void**)&gst_plugin_get_status_errors, "gst_plugin_get_status_errors", libs);
  gidLink(cast(void**)&gst_plugin_get_status_infos, "gst_plugin_get_status_infos", libs);
  gidLink(cast(void**)&gst_plugin_get_status_warnings, "gst_plugin_get_status_warnings", libs);
  gidLink(cast(void**)&gst_plugin_get_version, "gst_plugin_get_version", libs);
  gidLink(cast(void**)&gst_plugin_is_loaded, "gst_plugin_is_loaded", libs);
  gidLink(cast(void**)&gst_plugin_load, "gst_plugin_load", libs);
  gidLink(cast(void**)&gst_plugin_set_cache_data, "gst_plugin_set_cache_data", libs);

  // PluginFeature
  gidLink(cast(void**)&gst_plugin_feature_get_type, "gst_plugin_feature_get_type", libs);
  gidLink(cast(void**)&gst_plugin_feature_list_copy, "gst_plugin_feature_list_copy", libs);
  gidLink(cast(void**)&gst_plugin_feature_list_debug, "gst_plugin_feature_list_debug", libs);
  gidLink(cast(void**)&gst_plugin_feature_list_free, "gst_plugin_feature_list_free", libs);
  gidLink(cast(void**)&gst_plugin_feature_rank_compare_func, "gst_plugin_feature_rank_compare_func", libs);
  gidLink(cast(void**)&gst_plugin_feature_check_version, "gst_plugin_feature_check_version", libs);
  gidLink(cast(void**)&gst_plugin_feature_get_plugin, "gst_plugin_feature_get_plugin", libs);
  gidLink(cast(void**)&gst_plugin_feature_get_plugin_name, "gst_plugin_feature_get_plugin_name", libs);
  gidLink(cast(void**)&gst_plugin_feature_get_rank, "gst_plugin_feature_get_rank", libs);
  gidLink(cast(void**)&gst_plugin_feature_load, "gst_plugin_feature_load", libs);
  gidLink(cast(void**)&gst_plugin_feature_set_rank, "gst_plugin_feature_set_rank", libs);

  // Poll
  gidLink(cast(void**)&gst_poll_add_fd, "gst_poll_add_fd", libs);
  gidLink(cast(void**)&gst_poll_fd_can_read, "gst_poll_fd_can_read", libs);
  gidLink(cast(void**)&gst_poll_fd_can_write, "gst_poll_fd_can_write", libs);
  gidLink(cast(void**)&gst_poll_fd_ctl_pri, "gst_poll_fd_ctl_pri", libs);
  gidLink(cast(void**)&gst_poll_fd_ctl_read, "gst_poll_fd_ctl_read", libs);
  gidLink(cast(void**)&gst_poll_fd_ctl_write, "gst_poll_fd_ctl_write", libs);
  gidLink(cast(void**)&gst_poll_fd_has_closed, "gst_poll_fd_has_closed", libs);
  gidLink(cast(void**)&gst_poll_fd_has_error, "gst_poll_fd_has_error", libs);
  gidLink(cast(void**)&gst_poll_fd_has_pri, "gst_poll_fd_has_pri", libs);
  gidLink(cast(void**)&gst_poll_fd_ignored, "gst_poll_fd_ignored", libs);
  gidLink(cast(void**)&gst_poll_free, "gst_poll_free", libs);
  gidLink(cast(void**)&gst_poll_get_read_gpollfd, "gst_poll_get_read_gpollfd", libs);
  gidLink(cast(void**)&gst_poll_read_control, "gst_poll_read_control", libs);
  gidLink(cast(void**)&gst_poll_remove_fd, "gst_poll_remove_fd", libs);
  gidLink(cast(void**)&gst_poll_restart, "gst_poll_restart", libs);
  gidLink(cast(void**)&gst_poll_set_controllable, "gst_poll_set_controllable", libs);
  gidLink(cast(void**)&gst_poll_set_flushing, "gst_poll_set_flushing", libs);
  gidLink(cast(void**)&gst_poll_wait, "gst_poll_wait", libs);
  gidLink(cast(void**)&gst_poll_write_control, "gst_poll_write_control", libs);
  gidLink(cast(void**)&gst_poll_new, "gst_poll_new", libs);
  gidLink(cast(void**)&gst_poll_new_timer, "gst_poll_new_timer", libs);

  // PollFD
  gidLink(cast(void**)&gst_poll_fd_init, "gst_poll_fd_init", libs);

  // Preset
  gidLink(cast(void**)&gst_preset_get_type, "gst_preset_get_type", libs);
  gidLink(cast(void**)&gst_preset_get_app_dir, "gst_preset_get_app_dir", libs);
  gidLink(cast(void**)&gst_preset_set_app_dir, "gst_preset_set_app_dir", libs);
  gidLink(cast(void**)&gst_preset_delete_preset, "gst_preset_delete_preset", libs);
  gidLink(cast(void**)&gst_preset_get_meta, "gst_preset_get_meta", libs);
  gidLink(cast(void**)&gst_preset_get_preset_names, "gst_preset_get_preset_names", libs);
  gidLink(cast(void**)&gst_preset_get_property_names, "gst_preset_get_property_names", libs);
  gidLink(cast(void**)&gst_preset_is_editable, "gst_preset_is_editable", libs);
  gidLink(cast(void**)&gst_preset_load_preset, "gst_preset_load_preset", libs);
  gidLink(cast(void**)&gst_preset_rename_preset, "gst_preset_rename_preset", libs);
  gidLink(cast(void**)&gst_preset_save_preset, "gst_preset_save_preset", libs);
  gidLink(cast(void**)&gst_preset_set_meta, "gst_preset_set_meta", libs);

  // Promise
  gidLink(cast(void**)&gst_promise_get_type, "gst_promise_get_type", libs);
  gidLink(cast(void**)&gst_promise_new, "gst_promise_new", libs);
  gidLink(cast(void**)&gst_promise_new_with_change_func, "gst_promise_new_with_change_func", libs);
  gidLink(cast(void**)&gst_promise_expire, "gst_promise_expire", libs);
  gidLink(cast(void**)&gst_promise_get_reply, "gst_promise_get_reply", libs);
  gidLink(cast(void**)&gst_promise_interrupt, "gst_promise_interrupt", libs);
  gidLink(cast(void**)&gst_promise_ref, "gst_promise_ref", libs);
  gidLink(cast(void**)&gst_promise_reply, "gst_promise_reply", libs);
  gidLink(cast(void**)&gst_promise_unref, "gst_promise_unref", libs);
  gidLink(cast(void**)&gst_promise_wait, "gst_promise_wait", libs);

  // ProtectionMeta
  gidLink(cast(void**)&gst_protection_meta_get_info, "gst_protection_meta_get_info", libs);

  // ProxyPad
  gidLink(cast(void**)&gst_proxy_pad_get_type, "gst_proxy_pad_get_type", libs);
  gidLink(cast(void**)&gst_proxy_pad_chain_default, "gst_proxy_pad_chain_default", libs);
  gidLink(cast(void**)&gst_proxy_pad_chain_list_default, "gst_proxy_pad_chain_list_default", libs);
  gidLink(cast(void**)&gst_proxy_pad_getrange_default, "gst_proxy_pad_getrange_default", libs);
  gidLink(cast(void**)&gst_proxy_pad_iterate_internal_links_default, "gst_proxy_pad_iterate_internal_links_default", libs);
  gidLink(cast(void**)&gst_proxy_pad_get_internal, "gst_proxy_pad_get_internal", libs);

  // Query
  gidLink(cast(void**)&gst_query_get_type, "gst_query_get_type", libs);
  gidLink(cast(void**)&gst_query_new_accept_caps, "gst_query_new_accept_caps", libs);
  gidLink(cast(void**)&gst_query_new_allocation, "gst_query_new_allocation", libs);
  gidLink(cast(void**)&gst_query_new_bitrate, "gst_query_new_bitrate", libs);
  gidLink(cast(void**)&gst_query_new_buffering, "gst_query_new_buffering", libs);
  gidLink(cast(void**)&gst_query_new_caps, "gst_query_new_caps", libs);
  gidLink(cast(void**)&gst_query_new_context, "gst_query_new_context", libs);
  gidLink(cast(void**)&gst_query_new_convert, "gst_query_new_convert", libs);
  gidLink(cast(void**)&gst_query_new_custom, "gst_query_new_custom", libs);
  gidLink(cast(void**)&gst_query_new_drain, "gst_query_new_drain", libs);
  gidLink(cast(void**)&gst_query_new_duration, "gst_query_new_duration", libs);
  gidLink(cast(void**)&gst_query_new_formats, "gst_query_new_formats", libs);
  gidLink(cast(void**)&gst_query_new_latency, "gst_query_new_latency", libs);
  gidLink(cast(void**)&gst_query_new_position, "gst_query_new_position", libs);
  gidLink(cast(void**)&gst_query_new_scheduling, "gst_query_new_scheduling", libs);
  gidLink(cast(void**)&gst_query_new_seeking, "gst_query_new_seeking", libs);
  gidLink(cast(void**)&gst_query_new_segment, "gst_query_new_segment", libs);
  gidLink(cast(void**)&gst_query_new_selectable, "gst_query_new_selectable", libs);
  gidLink(cast(void**)&gst_query_new_uri, "gst_query_new_uri", libs);
  gidLink(cast(void**)&gst_query_add_allocation_meta, "gst_query_add_allocation_meta", libs);
  gidLink(cast(void**)&gst_query_add_allocation_param, "gst_query_add_allocation_param", libs);
  gidLink(cast(void**)&gst_query_add_allocation_pool, "gst_query_add_allocation_pool", libs);
  gidLink(cast(void**)&gst_query_add_buffering_range, "gst_query_add_buffering_range", libs);
  gidLink(cast(void**)&gst_query_add_scheduling_mode, "gst_query_add_scheduling_mode", libs);
  gidLink(cast(void**)&gst_query_copy, "gst_query_copy", libs);
  gidLink(cast(void**)&gst_query_find_allocation_meta, "gst_query_find_allocation_meta", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_metas, "gst_query_get_n_allocation_metas", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_params, "gst_query_get_n_allocation_params", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_pools, "gst_query_get_n_allocation_pools", libs);
  gidLink(cast(void**)&gst_query_get_n_buffering_ranges, "gst_query_get_n_buffering_ranges", libs);
  gidLink(cast(void**)&gst_query_get_n_scheduling_modes, "gst_query_get_n_scheduling_modes", libs);
  gidLink(cast(void**)&gst_query_get_structure, "gst_query_get_structure", libs);
  gidLink(cast(void**)&gst_query_has_scheduling_mode, "gst_query_has_scheduling_mode", libs);
  gidLink(cast(void**)&gst_query_has_scheduling_mode_with_flags, "gst_query_has_scheduling_mode_with_flags", libs);
  gidLink(cast(void**)&gst_query_is_writable, "gst_query_is_writable", libs);
  gidLink(cast(void**)&gst_query_make_writable, "gst_query_make_writable", libs);
  gidLink(cast(void**)&gst_query_parse_accept_caps, "gst_query_parse_accept_caps", libs);
  gidLink(cast(void**)&gst_query_parse_accept_caps_result, "gst_query_parse_accept_caps_result", libs);
  gidLink(cast(void**)&gst_query_parse_allocation, "gst_query_parse_allocation", libs);
  gidLink(cast(void**)&gst_query_parse_bitrate, "gst_query_parse_bitrate", libs);
  gidLink(cast(void**)&gst_query_parse_buffering_percent, "gst_query_parse_buffering_percent", libs);
  gidLink(cast(void**)&gst_query_parse_buffering_range, "gst_query_parse_buffering_range", libs);
  gidLink(cast(void**)&gst_query_parse_buffering_stats, "gst_query_parse_buffering_stats", libs);
  gidLink(cast(void**)&gst_query_parse_caps, "gst_query_parse_caps", libs);
  gidLink(cast(void**)&gst_query_parse_caps_result, "gst_query_parse_caps_result", libs);
  gidLink(cast(void**)&gst_query_parse_context, "gst_query_parse_context", libs);
  gidLink(cast(void**)&gst_query_parse_context_type, "gst_query_parse_context_type", libs);
  gidLink(cast(void**)&gst_query_parse_convert, "gst_query_parse_convert", libs);
  gidLink(cast(void**)&gst_query_parse_duration, "gst_query_parse_duration", libs);
  gidLink(cast(void**)&gst_query_parse_latency, "gst_query_parse_latency", libs);
  gidLink(cast(void**)&gst_query_parse_n_formats, "gst_query_parse_n_formats", libs);
  gidLink(cast(void**)&gst_query_parse_nth_allocation_meta, "gst_query_parse_nth_allocation_meta", libs);
  gidLink(cast(void**)&gst_query_parse_nth_allocation_param, "gst_query_parse_nth_allocation_param", libs);
  gidLink(cast(void**)&gst_query_parse_nth_allocation_pool, "gst_query_parse_nth_allocation_pool", libs);
  gidLink(cast(void**)&gst_query_parse_nth_buffering_range, "gst_query_parse_nth_buffering_range", libs);
  gidLink(cast(void**)&gst_query_parse_nth_format, "gst_query_parse_nth_format", libs);
  gidLink(cast(void**)&gst_query_parse_nth_scheduling_mode, "gst_query_parse_nth_scheduling_mode", libs);
  gidLink(cast(void**)&gst_query_parse_position, "gst_query_parse_position", libs);
  gidLink(cast(void**)&gst_query_parse_scheduling, "gst_query_parse_scheduling", libs);
  gidLink(cast(void**)&gst_query_parse_seeking, "gst_query_parse_seeking", libs);
  gidLink(cast(void**)&gst_query_parse_segment, "gst_query_parse_segment", libs);
  gidLink(cast(void**)&gst_query_parse_selectable, "gst_query_parse_selectable", libs);
  gidLink(cast(void**)&gst_query_parse_uri, "gst_query_parse_uri", libs);
  gidLink(cast(void**)&gst_query_parse_uri_redirection, "gst_query_parse_uri_redirection", libs);
  gidLink(cast(void**)&gst_query_parse_uri_redirection_permanent, "gst_query_parse_uri_redirection_permanent", libs);
  gidLink(cast(void**)&gst_query_ref, "gst_query_ref", libs);
  gidLink(cast(void**)&gst_query_remove_nth_allocation_meta, "gst_query_remove_nth_allocation_meta", libs);
  gidLink(cast(void**)&gst_query_remove_nth_allocation_param, "gst_query_remove_nth_allocation_param", libs);
  gidLink(cast(void**)&gst_query_remove_nth_allocation_pool, "gst_query_remove_nth_allocation_pool", libs);
  gidLink(cast(void**)&gst_query_set_accept_caps_result, "gst_query_set_accept_caps_result", libs);
  gidLink(cast(void**)&gst_query_set_bitrate, "gst_query_set_bitrate", libs);
  gidLink(cast(void**)&gst_query_set_buffering_percent, "gst_query_set_buffering_percent", libs);
  gidLink(cast(void**)&gst_query_set_buffering_range, "gst_query_set_buffering_range", libs);
  gidLink(cast(void**)&gst_query_set_buffering_stats, "gst_query_set_buffering_stats", libs);
  gidLink(cast(void**)&gst_query_set_caps_result, "gst_query_set_caps_result", libs);
  gidLink(cast(void**)&gst_query_set_context, "gst_query_set_context", libs);
  gidLink(cast(void**)&gst_query_set_convert, "gst_query_set_convert", libs);
  gidLink(cast(void**)&gst_query_set_duration, "gst_query_set_duration", libs);
  gidLink(cast(void**)&gst_query_set_formats, "gst_query_set_formats", libs);
  gidLink(cast(void**)&gst_query_set_formatsv, "gst_query_set_formatsv", libs);
  gidLink(cast(void**)&gst_query_set_latency, "gst_query_set_latency", libs);
  gidLink(cast(void**)&gst_query_set_nth_allocation_param, "gst_query_set_nth_allocation_param", libs);
  gidLink(cast(void**)&gst_query_set_nth_allocation_pool, "gst_query_set_nth_allocation_pool", libs);
  gidLink(cast(void**)&gst_query_set_position, "gst_query_set_position", libs);
  gidLink(cast(void**)&gst_query_set_scheduling, "gst_query_set_scheduling", libs);
  gidLink(cast(void**)&gst_query_set_seeking, "gst_query_set_seeking", libs);
  gidLink(cast(void**)&gst_query_set_segment, "gst_query_set_segment", libs);
  gidLink(cast(void**)&gst_query_set_selectable, "gst_query_set_selectable", libs);
  gidLink(cast(void**)&gst_query_set_uri, "gst_query_set_uri", libs);
  gidLink(cast(void**)&gst_query_set_uri_redirection, "gst_query_set_uri_redirection", libs);
  gidLink(cast(void**)&gst_query_set_uri_redirection_permanent, "gst_query_set_uri_redirection_permanent", libs);
  gidLink(cast(void**)&gst_query_unref, "gst_query_unref", libs);
  gidLink(cast(void**)&gst_query_writable_structure, "gst_query_writable_structure", libs);
  gidLink(cast(void**)&gst_query_replace, "gst_query_replace", libs);
  gidLink(cast(void**)&gst_query_steal, "gst_query_steal", libs);
  gidLink(cast(void**)&gst_query_take, "gst_query_take", libs);

  // ReferenceTimestampMeta
  gidLink(cast(void**)&gst_reference_timestamp_meta_get_info, "gst_reference_timestamp_meta_get_info", libs);

  // Registry
  gidLink(cast(void**)&gst_registry_get_type, "gst_registry_get_type", libs);
  gidLink(cast(void**)&gst_registry_fork_is_enabled, "gst_registry_fork_is_enabled", libs);
  gidLink(cast(void**)&gst_registry_fork_set_enabled, "gst_registry_fork_set_enabled", libs);
  gidLink(cast(void**)&gst_registry_get, "gst_registry_get", libs);
  gidLink(cast(void**)&gst_registry_add_feature, "gst_registry_add_feature", libs);
  gidLink(cast(void**)&gst_registry_add_plugin, "gst_registry_add_plugin", libs);
  gidLink(cast(void**)&gst_registry_check_feature_version, "gst_registry_check_feature_version", libs);
  gidLink(cast(void**)&gst_registry_feature_filter, "gst_registry_feature_filter", libs);
  gidLink(cast(void**)&gst_registry_find_feature, "gst_registry_find_feature", libs);
  gidLink(cast(void**)&gst_registry_find_plugin, "gst_registry_find_plugin", libs);
  gidLink(cast(void**)&gst_registry_get_feature_list, "gst_registry_get_feature_list", libs);
  gidLink(cast(void**)&gst_registry_get_feature_list_by_plugin, "gst_registry_get_feature_list_by_plugin", libs);
  gidLink(cast(void**)&gst_registry_get_feature_list_cookie, "gst_registry_get_feature_list_cookie", libs);
  gidLink(cast(void**)&gst_registry_get_plugin_list, "gst_registry_get_plugin_list", libs);
  gidLink(cast(void**)&gst_registry_lookup, "gst_registry_lookup", libs);
  gidLink(cast(void**)&gst_registry_lookup_feature, "gst_registry_lookup_feature", libs);
  gidLink(cast(void**)&gst_registry_plugin_filter, "gst_registry_plugin_filter", libs);
  gidLink(cast(void**)&gst_registry_remove_feature, "gst_registry_remove_feature", libs);
  gidLink(cast(void**)&gst_registry_remove_plugin, "gst_registry_remove_plugin", libs);
  gidLink(cast(void**)&gst_registry_scan_path, "gst_registry_scan_path", libs);

  // Sample
  gidLink(cast(void**)&gst_sample_get_type, "gst_sample_get_type", libs);
  gidLink(cast(void**)&gst_sample_new, "gst_sample_new", libs);
  gidLink(cast(void**)&gst_sample_copy, "gst_sample_copy", libs);
  gidLink(cast(void**)&gst_sample_get_buffer, "gst_sample_get_buffer", libs);
  gidLink(cast(void**)&gst_sample_get_buffer_list, "gst_sample_get_buffer_list", libs);
  gidLink(cast(void**)&gst_sample_get_caps, "gst_sample_get_caps", libs);
  gidLink(cast(void**)&gst_sample_get_info, "gst_sample_get_info", libs);
  gidLink(cast(void**)&gst_sample_get_segment, "gst_sample_get_segment", libs);
  gidLink(cast(void**)&gst_sample_is_writable, "gst_sample_is_writable", libs);
  gidLink(cast(void**)&gst_sample_make_writable, "gst_sample_make_writable", libs);
  gidLink(cast(void**)&gst_sample_ref, "gst_sample_ref", libs);
  gidLink(cast(void**)&gst_sample_set_buffer, "gst_sample_set_buffer", libs);
  gidLink(cast(void**)&gst_sample_set_buffer_list, "gst_sample_set_buffer_list", libs);
  gidLink(cast(void**)&gst_sample_set_caps, "gst_sample_set_caps", libs);
  gidLink(cast(void**)&gst_sample_set_info, "gst_sample_set_info", libs);
  gidLink(cast(void**)&gst_sample_set_segment, "gst_sample_set_segment", libs);
  gidLink(cast(void**)&gst_sample_unref, "gst_sample_unref", libs);

  // Segment
  gidLink(cast(void**)&gst_segment_get_type, "gst_segment_get_type", libs);
  gidLink(cast(void**)&gst_segment_new, "gst_segment_new", libs);
  gidLink(cast(void**)&gst_segment_clip, "gst_segment_clip", libs);
  gidLink(cast(void**)&gst_segment_copy, "gst_segment_copy", libs);
  gidLink(cast(void**)&gst_segment_copy_into, "gst_segment_copy_into", libs);
  gidLink(cast(void**)&gst_segment_do_seek, "gst_segment_do_seek", libs);
  gidLink(cast(void**)&gst_segment_free, "gst_segment_free", libs);
  gidLink(cast(void**)&gst_segment_init, "gst_segment_init", libs);
  gidLink(cast(void**)&gst_segment_is_equal, "gst_segment_is_equal", libs);
  gidLink(cast(void**)&gst_segment_offset_running_time, "gst_segment_offset_running_time", libs);
  gidLink(cast(void**)&gst_segment_position_from_running_time, "gst_segment_position_from_running_time", libs);
  gidLink(cast(void**)&gst_segment_position_from_running_time_full, "gst_segment_position_from_running_time_full", libs);
  gidLink(cast(void**)&gst_segment_position_from_stream_time, "gst_segment_position_from_stream_time", libs);
  gidLink(cast(void**)&gst_segment_position_from_stream_time_full, "gst_segment_position_from_stream_time_full", libs);
  gidLink(cast(void**)&gst_segment_set_running_time, "gst_segment_set_running_time", libs);
  gidLink(cast(void**)&gst_segment_to_position, "gst_segment_to_position", libs);
  gidLink(cast(void**)&gst_segment_to_running_time, "gst_segment_to_running_time", libs);
  gidLink(cast(void**)&gst_segment_to_running_time_full, "gst_segment_to_running_time_full", libs);
  gidLink(cast(void**)&gst_segment_to_stream_time, "gst_segment_to_stream_time", libs);
  gidLink(cast(void**)&gst_segment_to_stream_time_full, "gst_segment_to_stream_time_full", libs);

  // SharedTaskPool
  gidLink(cast(void**)&gst_shared_task_pool_get_type, "gst_shared_task_pool_get_type", libs);
  gidLink(cast(void**)&gst_shared_task_pool_new, "gst_shared_task_pool_new", libs);
  gidLink(cast(void**)&gst_shared_task_pool_get_max_threads, "gst_shared_task_pool_get_max_threads", libs);
  gidLink(cast(void**)&gst_shared_task_pool_set_max_threads, "gst_shared_task_pool_set_max_threads", libs);

  // StaticCaps
  gidLink(cast(void**)&gst_static_caps_get_type, "gst_static_caps_get_type", libs);
  gidLink(cast(void**)&gst_static_caps_cleanup, "gst_static_caps_cleanup", libs);
  gidLink(cast(void**)&gst_static_caps_get, "gst_static_caps_get", libs);

  // StaticPadTemplate
  gidLink(cast(void**)&gst_static_pad_template_get_type, "gst_static_pad_template_get_type", libs);
  gidLink(cast(void**)&gst_static_pad_template_get, "gst_static_pad_template_get", libs);
  gidLink(cast(void**)&gst_static_pad_template_get_caps, "gst_static_pad_template_get_caps", libs);

  // Stream
  gidLink(cast(void**)&gst_stream_get_type, "gst_stream_get_type", libs);
  gidLink(cast(void**)&gst_stream_new, "gst_stream_new", libs);
  gidLink(cast(void**)&gst_stream_get_caps, "gst_stream_get_caps", libs);
  gidLink(cast(void**)&gst_stream_get_stream_flags, "gst_stream_get_stream_flags", libs);
  gidLink(cast(void**)&gst_stream_get_stream_id, "gst_stream_get_stream_id", libs);
  gidLink(cast(void**)&gst_stream_get_stream_type, "gst_stream_get_stream_type", libs);
  gidLink(cast(void**)&gst_stream_get_tags, "gst_stream_get_tags", libs);
  gidLink(cast(void**)&gst_stream_set_caps, "gst_stream_set_caps", libs);
  gidLink(cast(void**)&gst_stream_set_stream_flags, "gst_stream_set_stream_flags", libs);
  gidLink(cast(void**)&gst_stream_set_stream_type, "gst_stream_set_stream_type", libs);
  gidLink(cast(void**)&gst_stream_set_tags, "gst_stream_set_tags", libs);

  // StreamCollection
  gidLink(cast(void**)&gst_stream_collection_get_type, "gst_stream_collection_get_type", libs);
  gidLink(cast(void**)&gst_stream_collection_new, "gst_stream_collection_new", libs);
  gidLink(cast(void**)&gst_stream_collection_add_stream, "gst_stream_collection_add_stream", libs);
  gidLink(cast(void**)&gst_stream_collection_get_size, "gst_stream_collection_get_size", libs);
  gidLink(cast(void**)&gst_stream_collection_get_stream, "gst_stream_collection_get_stream", libs);
  gidLink(cast(void**)&gst_stream_collection_get_upstream_id, "gst_stream_collection_get_upstream_id", libs);

  // Structure
  gidLink(cast(void**)&gst_structure_get_type, "gst_structure_get_type", libs);
  gidLink(cast(void**)&gst_structure_from_string, "gst_structure_from_string", libs);
  gidLink(cast(void**)&gst_structure_new, "gst_structure_new", libs);
  gidLink(cast(void**)&gst_structure_new_empty, "gst_structure_new_empty", libs);
  gidLink(cast(void**)&gst_structure_new_from_string, "gst_structure_new_from_string", libs);
  gidLink(cast(void**)&gst_structure_new_id, "gst_structure_new_id", libs);
  gidLink(cast(void**)&gst_structure_new_id_empty, "gst_structure_new_id_empty", libs);
  gidLink(cast(void**)&gst_structure_new_id_str, "gst_structure_new_id_str", libs);
  gidLink(cast(void**)&gst_structure_new_id_str_empty, "gst_structure_new_id_str_empty", libs);
  gidLink(cast(void**)&gst_structure_new_id_str_valist, "gst_structure_new_id_str_valist", libs);
  gidLink(cast(void**)&gst_structure_new_static_str, "gst_structure_new_static_str", libs);
  gidLink(cast(void**)&gst_structure_new_static_str_empty, "gst_structure_new_static_str_empty", libs);
  gidLink(cast(void**)&gst_structure_new_static_str_valist, "gst_structure_new_static_str_valist", libs);
  gidLink(cast(void**)&gst_structure_new_valist, "gst_structure_new_valist", libs);
  gidLink(cast(void**)&gst_structure_can_intersect, "gst_structure_can_intersect", libs);
  gidLink(cast(void**)&gst_structure_copy, "gst_structure_copy", libs);
  gidLink(cast(void**)&gst_structure_filter_and_map_in_place, "gst_structure_filter_and_map_in_place", libs);
  gidLink(cast(void**)&gst_structure_filter_and_map_in_place_id_str, "gst_structure_filter_and_map_in_place_id_str", libs);
  gidLink(cast(void**)&gst_structure_fixate, "gst_structure_fixate", libs);
  gidLink(cast(void**)&gst_structure_fixate_field, "gst_structure_fixate_field", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_boolean, "gst_structure_fixate_field_boolean", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_double, "gst_structure_fixate_field_nearest_double", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_fraction, "gst_structure_fixate_field_nearest_fraction", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_int, "gst_structure_fixate_field_nearest_int", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_string, "gst_structure_fixate_field_string", libs);
  gidLink(cast(void**)&gst_structure_foreach, "gst_structure_foreach", libs);
  gidLink(cast(void**)&gst_structure_foreach_id_str, "gst_structure_foreach_id_str", libs);
  gidLink(cast(void**)&gst_structure_free, "gst_structure_free", libs);
  gidLink(cast(void**)&gst_structure_get, "gst_structure_get", libs);
  gidLink(cast(void**)&gst_structure_get_array, "gst_structure_get_array", libs);
  gidLink(cast(void**)&gst_structure_get_boolean, "gst_structure_get_boolean", libs);
  gidLink(cast(void**)&gst_structure_get_caps, "gst_structure_get_caps", libs);
  gidLink(cast(void**)&gst_structure_get_clock_time, "gst_structure_get_clock_time", libs);
  gidLink(cast(void**)&gst_structure_get_date, "gst_structure_get_date", libs);
  gidLink(cast(void**)&gst_structure_get_date_time, "gst_structure_get_date_time", libs);
  gidLink(cast(void**)&gst_structure_get_double, "gst_structure_get_double", libs);
  gidLink(cast(void**)&gst_structure_get_enum, "gst_structure_get_enum", libs);
  gidLink(cast(void**)&gst_structure_get_field_type, "gst_structure_get_field_type", libs);
  gidLink(cast(void**)&gst_structure_get_flags, "gst_structure_get_flags", libs);
  gidLink(cast(void**)&gst_structure_get_flagset, "gst_structure_get_flagset", libs);
  gidLink(cast(void**)&gst_structure_get_fraction, "gst_structure_get_fraction", libs);
  gidLink(cast(void**)&gst_structure_get_int, "gst_structure_get_int", libs);
  gidLink(cast(void**)&gst_structure_get_int64, "gst_structure_get_int64", libs);
  gidLink(cast(void**)&gst_structure_get_list, "gst_structure_get_list", libs);
  gidLink(cast(void**)&gst_structure_get_name, "gst_structure_get_name", libs);
  gidLink(cast(void**)&gst_structure_get_name_id, "gst_structure_get_name_id", libs);
  gidLink(cast(void**)&gst_structure_get_name_id_str, "gst_structure_get_name_id_str", libs);
  gidLink(cast(void**)&gst_structure_get_string, "gst_structure_get_string", libs);
  gidLink(cast(void**)&gst_structure_get_uint, "gst_structure_get_uint", libs);
  gidLink(cast(void**)&gst_structure_get_uint64, "gst_structure_get_uint64", libs);
  gidLink(cast(void**)&gst_structure_get_valist, "gst_structure_get_valist", libs);
  gidLink(cast(void**)&gst_structure_get_value, "gst_structure_get_value", libs);
  gidLink(cast(void**)&gst_structure_has_field, "gst_structure_has_field", libs);
  gidLink(cast(void**)&gst_structure_has_field_typed, "gst_structure_has_field_typed", libs);
  gidLink(cast(void**)&gst_structure_has_name, "gst_structure_has_name", libs);
  gidLink(cast(void**)&gst_structure_id_get, "gst_structure_id_get", libs);
  gidLink(cast(void**)&gst_structure_id_get_valist, "gst_structure_id_get_valist", libs);
  gidLink(cast(void**)&gst_structure_id_get_value, "gst_structure_id_get_value", libs);
  gidLink(cast(void**)&gst_structure_id_has_field, "gst_structure_id_has_field", libs);
  gidLink(cast(void**)&gst_structure_id_has_field_typed, "gst_structure_id_has_field_typed", libs);
  gidLink(cast(void**)&gst_structure_id_set, "gst_structure_id_set", libs);
  gidLink(cast(void**)&gst_structure_id_set_valist, "gst_structure_id_set_valist", libs);
  gidLink(cast(void**)&gst_structure_id_set_value, "gst_structure_id_set_value", libs);
  gidLink(cast(void**)&gst_structure_id_str_get, "gst_structure_id_str_get", libs);
  gidLink(cast(void**)&gst_structure_id_str_get_field_type, "gst_structure_id_str_get_field_type", libs);
  gidLink(cast(void**)&gst_structure_id_str_get_valist, "gst_structure_id_str_get_valist", libs);
  gidLink(cast(void**)&gst_structure_id_str_get_value, "gst_structure_id_str_get_value", libs);
  gidLink(cast(void**)&gst_structure_id_str_has_field, "gst_structure_id_str_has_field", libs);
  gidLink(cast(void**)&gst_structure_id_str_has_field_typed, "gst_structure_id_str_has_field_typed", libs);
  gidLink(cast(void**)&gst_structure_id_str_nth_field_name, "gst_structure_id_str_nth_field_name", libs);
  gidLink(cast(void**)&gst_structure_id_str_remove_field, "gst_structure_id_str_remove_field", libs);
  gidLink(cast(void**)&gst_structure_id_str_remove_fields, "gst_structure_id_str_remove_fields", libs);
  gidLink(cast(void**)&gst_structure_id_str_remove_fields_valist, "gst_structure_id_str_remove_fields_valist", libs);
  gidLink(cast(void**)&gst_structure_id_str_set, "gst_structure_id_str_set", libs);
  gidLink(cast(void**)&gst_structure_id_str_set_valist, "gst_structure_id_str_set_valist", libs);
  gidLink(cast(void**)&gst_structure_id_str_set_value, "gst_structure_id_str_set_value", libs);
  gidLink(cast(void**)&gst_structure_id_str_take_value, "gst_structure_id_str_take_value", libs);
  gidLink(cast(void**)&gst_structure_id_take_value, "gst_structure_id_take_value", libs);
  gidLink(cast(void**)&gst_structure_intersect, "gst_structure_intersect", libs);
  gidLink(cast(void**)&gst_structure_is_equal, "gst_structure_is_equal", libs);
  gidLink(cast(void**)&gst_structure_is_subset, "gst_structure_is_subset", libs);
  gidLink(cast(void**)&gst_structure_is_writable, "gst_structure_is_writable", libs);
  gidLink(cast(void**)&gst_structure_map_in_place, "gst_structure_map_in_place", libs);
  gidLink(cast(void**)&gst_structure_map_in_place_id_str, "gst_structure_map_in_place_id_str", libs);
  gidLink(cast(void**)&gst_structure_n_fields, "gst_structure_n_fields", libs);
  gidLink(cast(void**)&gst_structure_nth_field_name, "gst_structure_nth_field_name", libs);
  gidLink(cast(void**)&gst_structure_remove_all_fields, "gst_structure_remove_all_fields", libs);
  gidLink(cast(void**)&gst_structure_remove_field, "gst_structure_remove_field", libs);
  gidLink(cast(void**)&gst_structure_remove_fields, "gst_structure_remove_fields", libs);
  gidLink(cast(void**)&gst_structure_remove_fields_valist, "gst_structure_remove_fields_valist", libs);
  gidLink(cast(void**)&gst_structure_serialize, "gst_structure_serialize", libs);
  gidLink(cast(void**)&gst_structure_serialize_full, "gst_structure_serialize_full", libs);
  gidLink(cast(void**)&gst_structure_set, "gst_structure_set", libs);
  gidLink(cast(void**)&gst_structure_set_array, "gst_structure_set_array", libs);
  gidLink(cast(void**)&gst_structure_set_list, "gst_structure_set_list", libs);
  gidLink(cast(void**)&gst_structure_set_name, "gst_structure_set_name", libs);
  gidLink(cast(void**)&gst_structure_set_name_id_str, "gst_structure_set_name_id_str", libs);
  gidLink(cast(void**)&gst_structure_set_name_static_str, "gst_structure_set_name_static_str", libs);
  gidLink(cast(void**)&gst_structure_set_parent_refcount, "gst_structure_set_parent_refcount", libs);
  gidLink(cast(void**)&gst_structure_set_static_str, "gst_structure_set_static_str", libs);
  gidLink(cast(void**)&gst_structure_set_static_str_valist, "gst_structure_set_static_str_valist", libs);
  gidLink(cast(void**)&gst_structure_set_valist, "gst_structure_set_valist", libs);
  gidLink(cast(void**)&gst_structure_set_value, "gst_structure_set_value", libs);
  gidLink(cast(void**)&gst_structure_set_value_static_str, "gst_structure_set_value_static_str", libs);
  gidLink(cast(void**)&gst_structure_take_value, "gst_structure_take_value", libs);
  gidLink(cast(void**)&gst_structure_take_value_static_str, "gst_structure_take_value_static_str", libs);
  gidLink(cast(void**)&gst_structure_to_string, "gst_structure_to_string", libs);
  gidLink(cast(void**)&gst_structure_take, "gst_structure_take", libs);

  // SystemClock
  gidLink(cast(void**)&gst_system_clock_get_type, "gst_system_clock_get_type", libs);
  gidLink(cast(void**)&gst_system_clock_obtain, "gst_system_clock_obtain", libs);
  gidLink(cast(void**)&gst_system_clock_set_default, "gst_system_clock_set_default", libs);

  // TagList
  gidLink(cast(void**)&gst_tag_list_get_type, "gst_tag_list_get_type", libs);
  gidLink(cast(void**)&gst_tag_list_new, "gst_tag_list_new", libs);
  gidLink(cast(void**)&gst_tag_list_new_empty, "gst_tag_list_new_empty", libs);
  gidLink(cast(void**)&gst_tag_list_new_from_string, "gst_tag_list_new_from_string", libs);
  gidLink(cast(void**)&gst_tag_list_new_valist, "gst_tag_list_new_valist", libs);
  gidLink(cast(void**)&gst_tag_list_add, "gst_tag_list_add", libs);
  gidLink(cast(void**)&gst_tag_list_add_valist, "gst_tag_list_add_valist", libs);
  gidLink(cast(void**)&gst_tag_list_add_valist_values, "gst_tag_list_add_valist_values", libs);
  gidLink(cast(void**)&gst_tag_list_add_value, "gst_tag_list_add_value", libs);
  gidLink(cast(void**)&gst_tag_list_add_values, "gst_tag_list_add_values", libs);
  gidLink(cast(void**)&gst_tag_list_copy, "gst_tag_list_copy", libs);
  gidLink(cast(void**)&gst_tag_list_foreach, "gst_tag_list_foreach", libs);
  gidLink(cast(void**)&gst_tag_list_get_boolean, "gst_tag_list_get_boolean", libs);
  gidLink(cast(void**)&gst_tag_list_get_boolean_index, "gst_tag_list_get_boolean_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_date, "gst_tag_list_get_date", libs);
  gidLink(cast(void**)&gst_tag_list_get_date_index, "gst_tag_list_get_date_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_date_time, "gst_tag_list_get_date_time", libs);
  gidLink(cast(void**)&gst_tag_list_get_date_time_index, "gst_tag_list_get_date_time_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_double, "gst_tag_list_get_double", libs);
  gidLink(cast(void**)&gst_tag_list_get_double_index, "gst_tag_list_get_double_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_float, "gst_tag_list_get_float", libs);
  gidLink(cast(void**)&gst_tag_list_get_float_index, "gst_tag_list_get_float_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_int, "gst_tag_list_get_int", libs);
  gidLink(cast(void**)&gst_tag_list_get_int64, "gst_tag_list_get_int64", libs);
  gidLink(cast(void**)&gst_tag_list_get_int64_index, "gst_tag_list_get_int64_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_int_index, "gst_tag_list_get_int_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_pointer, "gst_tag_list_get_pointer", libs);
  gidLink(cast(void**)&gst_tag_list_get_pointer_index, "gst_tag_list_get_pointer_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_sample, "gst_tag_list_get_sample", libs);
  gidLink(cast(void**)&gst_tag_list_get_sample_index, "gst_tag_list_get_sample_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_scope, "gst_tag_list_get_scope", libs);
  gidLink(cast(void**)&gst_tag_list_get_string, "gst_tag_list_get_string", libs);
  gidLink(cast(void**)&gst_tag_list_get_string_index, "gst_tag_list_get_string_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_tag_size, "gst_tag_list_get_tag_size", libs);
  gidLink(cast(void**)&gst_tag_list_get_uint, "gst_tag_list_get_uint", libs);
  gidLink(cast(void**)&gst_tag_list_get_uint64, "gst_tag_list_get_uint64", libs);
  gidLink(cast(void**)&gst_tag_list_get_uint64_index, "gst_tag_list_get_uint64_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_uint_index, "gst_tag_list_get_uint_index", libs);
  gidLink(cast(void**)&gst_tag_list_get_value_index, "gst_tag_list_get_value_index", libs);
  gidLink(cast(void**)&gst_tag_list_insert, "gst_tag_list_insert", libs);
  gidLink(cast(void**)&gst_tag_list_is_empty, "gst_tag_list_is_empty", libs);
  gidLink(cast(void**)&gst_tag_list_is_equal, "gst_tag_list_is_equal", libs);
  gidLink(cast(void**)&gst_tag_list_is_writable, "gst_tag_list_is_writable", libs);
  gidLink(cast(void**)&gst_tag_list_make_writable, "gst_tag_list_make_writable", libs);
  gidLink(cast(void**)&gst_tag_list_merge, "gst_tag_list_merge", libs);
  gidLink(cast(void**)&gst_tag_list_n_tags, "gst_tag_list_n_tags", libs);
  gidLink(cast(void**)&gst_tag_list_nth_tag_name, "gst_tag_list_nth_tag_name", libs);
  gidLink(cast(void**)&gst_tag_list_peek_string_index, "gst_tag_list_peek_string_index", libs);
  gidLink(cast(void**)&gst_tag_list_ref, "gst_tag_list_ref", libs);
  gidLink(cast(void**)&gst_tag_list_remove_tag, "gst_tag_list_remove_tag", libs);
  gidLink(cast(void**)&gst_tag_list_set_scope, "gst_tag_list_set_scope", libs);
  gidLink(cast(void**)&gst_tag_list_to_string, "gst_tag_list_to_string", libs);
  gidLink(cast(void**)&gst_tag_list_unref, "gst_tag_list_unref", libs);
  gidLink(cast(void**)&gst_tag_list_copy_value, "gst_tag_list_copy_value", libs);
  gidLink(cast(void**)&gst_tag_list_replace, "gst_tag_list_replace", libs);
  gidLink(cast(void**)&gst_tag_list_take, "gst_tag_list_take", libs);

  // TagSetter
  gidLink(cast(void**)&gst_tag_setter_get_type, "gst_tag_setter_get_type", libs);
  gidLink(cast(void**)&gst_tag_setter_add_tag_valist, "gst_tag_setter_add_tag_valist", libs);
  gidLink(cast(void**)&gst_tag_setter_add_tag_valist_values, "gst_tag_setter_add_tag_valist_values", libs);
  gidLink(cast(void**)&gst_tag_setter_add_tag_value, "gst_tag_setter_add_tag_value", libs);
  gidLink(cast(void**)&gst_tag_setter_add_tag_values, "gst_tag_setter_add_tag_values", libs);
  gidLink(cast(void**)&gst_tag_setter_add_tags, "gst_tag_setter_add_tags", libs);
  gidLink(cast(void**)&gst_tag_setter_get_tag_list, "gst_tag_setter_get_tag_list", libs);
  gidLink(cast(void**)&gst_tag_setter_get_tag_merge_mode, "gst_tag_setter_get_tag_merge_mode", libs);
  gidLink(cast(void**)&gst_tag_setter_merge_tags, "gst_tag_setter_merge_tags", libs);
  gidLink(cast(void**)&gst_tag_setter_reset_tags, "gst_tag_setter_reset_tags", libs);
  gidLink(cast(void**)&gst_tag_setter_set_tag_merge_mode, "gst_tag_setter_set_tag_merge_mode", libs);

  // Task
  gidLink(cast(void**)&gst_task_get_type, "gst_task_get_type", libs);
  gidLink(cast(void**)&gst_task_new, "gst_task_new", libs);
  gidLink(cast(void**)&gst_task_cleanup_all, "gst_task_cleanup_all", libs);
  gidLink(cast(void**)&gst_task_get_pool, "gst_task_get_pool", libs);
  gidLink(cast(void**)&gst_task_get_state, "gst_task_get_state", libs);
  gidLink(cast(void**)&gst_task_join, "gst_task_join", libs);
  gidLink(cast(void**)&gst_task_pause, "gst_task_pause", libs);
  gidLink(cast(void**)&gst_task_resume, "gst_task_resume", libs);
  gidLink(cast(void**)&gst_task_set_enter_callback, "gst_task_set_enter_callback", libs);
  gidLink(cast(void**)&gst_task_set_leave_callback, "gst_task_set_leave_callback", libs);
  gidLink(cast(void**)&gst_task_set_lock, "gst_task_set_lock", libs);
  gidLink(cast(void**)&gst_task_set_pool, "gst_task_set_pool", libs);
  gidLink(cast(void**)&gst_task_set_state, "gst_task_set_state", libs);
  gidLink(cast(void**)&gst_task_start, "gst_task_start", libs);
  gidLink(cast(void**)&gst_task_stop, "gst_task_stop", libs);

  // TaskPool
  gidLink(cast(void**)&gst_task_pool_get_type, "gst_task_pool_get_type", libs);
  gidLink(cast(void**)&gst_task_pool_new, "gst_task_pool_new", libs);
  gidLink(cast(void**)&gst_task_pool_cleanup, "gst_task_pool_cleanup", libs);
  gidLink(cast(void**)&gst_task_pool_dispose_handle, "gst_task_pool_dispose_handle", libs);
  gidLink(cast(void**)&gst_task_pool_join, "gst_task_pool_join", libs);
  gidLink(cast(void**)&gst_task_pool_prepare, "gst_task_pool_prepare", libs);
  gidLink(cast(void**)&gst_task_pool_push, "gst_task_pool_push", libs);

  // Toc
  gidLink(cast(void**)&gst_toc_get_type, "gst_toc_get_type", libs);
  gidLink(cast(void**)&gst_toc_new, "gst_toc_new", libs);
  gidLink(cast(void**)&gst_toc_append_entry, "gst_toc_append_entry", libs);
  gidLink(cast(void**)&gst_toc_dump, "gst_toc_dump", libs);
  gidLink(cast(void**)&gst_toc_find_entry, "gst_toc_find_entry", libs);
  gidLink(cast(void**)&gst_toc_get_entries, "gst_toc_get_entries", libs);
  gidLink(cast(void**)&gst_toc_get_scope, "gst_toc_get_scope", libs);
  gidLink(cast(void**)&gst_toc_get_tags, "gst_toc_get_tags", libs);
  gidLink(cast(void**)&gst_toc_merge_tags, "gst_toc_merge_tags", libs);
  gidLink(cast(void**)&gst_toc_set_tags, "gst_toc_set_tags", libs);

  // TocEntry
  gidLink(cast(void**)&gst_toc_entry_get_type, "gst_toc_entry_get_type", libs);
  gidLink(cast(void**)&gst_toc_entry_new, "gst_toc_entry_new", libs);
  gidLink(cast(void**)&gst_toc_entry_append_sub_entry, "gst_toc_entry_append_sub_entry", libs);
  gidLink(cast(void**)&gst_toc_entry_get_entry_type, "gst_toc_entry_get_entry_type", libs);
  gidLink(cast(void**)&gst_toc_entry_get_loop, "gst_toc_entry_get_loop", libs);
  gidLink(cast(void**)&gst_toc_entry_get_parent, "gst_toc_entry_get_parent", libs);
  gidLink(cast(void**)&gst_toc_entry_get_start_stop_times, "gst_toc_entry_get_start_stop_times", libs);
  gidLink(cast(void**)&gst_toc_entry_get_sub_entries, "gst_toc_entry_get_sub_entries", libs);
  gidLink(cast(void**)&gst_toc_entry_get_tags, "gst_toc_entry_get_tags", libs);
  gidLink(cast(void**)&gst_toc_entry_get_toc, "gst_toc_entry_get_toc", libs);
  gidLink(cast(void**)&gst_toc_entry_get_uid, "gst_toc_entry_get_uid", libs);
  gidLink(cast(void**)&gst_toc_entry_is_alternative, "gst_toc_entry_is_alternative", libs);
  gidLink(cast(void**)&gst_toc_entry_is_sequence, "gst_toc_entry_is_sequence", libs);
  gidLink(cast(void**)&gst_toc_entry_merge_tags, "gst_toc_entry_merge_tags", libs);
  gidLink(cast(void**)&gst_toc_entry_set_loop, "gst_toc_entry_set_loop", libs);
  gidLink(cast(void**)&gst_toc_entry_set_start_stop_times, "gst_toc_entry_set_start_stop_times", libs);
  gidLink(cast(void**)&gst_toc_entry_set_tags, "gst_toc_entry_set_tags", libs);

  // TocSetter
  gidLink(cast(void**)&gst_toc_setter_get_type, "gst_toc_setter_get_type", libs);
  gidLink(cast(void**)&gst_toc_setter_get_toc, "gst_toc_setter_get_toc", libs);
  gidLink(cast(void**)&gst_toc_setter_reset, "gst_toc_setter_reset", libs);
  gidLink(cast(void**)&gst_toc_setter_set_toc, "gst_toc_setter_set_toc", libs);

  // Tracer
  gidLink(cast(void**)&gst_tracer_get_type, "gst_tracer_get_type", libs);
  gidLink(cast(void**)&gst_tracer_register, "gst_tracer_register", libs);

  // TracerClass
  gidLink(cast(void**)&gst_tracer_class_set_use_structure_params, "gst_tracer_class_set_use_structure_params", libs);
  gidLink(cast(void**)&gst_tracer_class_uses_structure_params, "gst_tracer_class_uses_structure_params", libs);

  // TracerFactory
  gidLink(cast(void**)&gst_tracer_factory_get_type, "gst_tracer_factory_get_type", libs);
  gidLink(cast(void**)&gst_tracer_factory_get_list, "gst_tracer_factory_get_list", libs);
  gidLink(cast(void**)&gst_tracer_factory_get_tracer_type, "gst_tracer_factory_get_tracer_type", libs);

  // TracerRecord
  gidLink(cast(void**)&gst_tracer_record_get_type, "gst_tracer_record_get_type", libs);
  gidLink(cast(void**)&gst_tracer_record_new, "gst_tracer_record_new", libs);
  gidLink(cast(void**)&gst_tracer_record_log, "gst_tracer_record_log", libs);

  // TypeFind
  gidLink(cast(void**)&gst_type_find_get_type, "gst_type_find_get_type", libs);
  gidLink(cast(void**)&gst_type_find_get_length, "gst_type_find_get_length", libs);
  gidLink(cast(void**)&gst_type_find_peek, "gst_type_find_peek", libs);
  gidLink(cast(void**)&gst_type_find_suggest, "gst_type_find_suggest", libs);
  gidLink(cast(void**)&gst_type_find_suggest_empty_simple, "gst_type_find_suggest_empty_simple", libs);
  gidLink(cast(void**)&gst_type_find_suggest_simple, "gst_type_find_suggest_simple", libs);
  gidLink(cast(void**)&gst_type_find_register, "gst_type_find_register", libs);

  // TypeFindFactory
  gidLink(cast(void**)&gst_type_find_factory_get_type, "gst_type_find_factory_get_type", libs);
  gidLink(cast(void**)&gst_type_find_factory_get_list, "gst_type_find_factory_get_list", libs);
  gidLink(cast(void**)&gst_type_find_factory_call_function, "gst_type_find_factory_call_function", libs);
  gidLink(cast(void**)&gst_type_find_factory_get_caps, "gst_type_find_factory_get_caps", libs);
  gidLink(cast(void**)&gst_type_find_factory_get_extensions, "gst_type_find_factory_get_extensions", libs);
  gidLink(cast(void**)&gst_type_find_factory_has_function, "gst_type_find_factory_has_function", libs);

  // URIHandler
  gidLink(cast(void**)&gst_uri_handler_get_type, "gst_uri_handler_get_type", libs);
  gidLink(cast(void**)&gst_uri_handler_get_protocols, "gst_uri_handler_get_protocols", libs);
  gidLink(cast(void**)&gst_uri_handler_get_uri, "gst_uri_handler_get_uri", libs);
  gidLink(cast(void**)&gst_uri_handler_get_uri_type, "gst_uri_handler_get_uri_type", libs);
  gidLink(cast(void**)&gst_uri_handler_set_uri, "gst_uri_handler_set_uri", libs);

  // Uri
  gidLink(cast(void**)&gst_uri_get_type, "gst_uri_get_type", libs);
  gidLink(cast(void**)&gst_uri_new, "gst_uri_new", libs);
  gidLink(cast(void**)&gst_uri_append_path, "gst_uri_append_path", libs);
  gidLink(cast(void**)&gst_uri_append_path_segment, "gst_uri_append_path_segment", libs);
  gidLink(cast(void**)&gst_uri_copy, "gst_uri_copy", libs);
  gidLink(cast(void**)&gst_uri_equal, "gst_uri_equal", libs);
  gidLink(cast(void**)&gst_uri_from_string_with_base, "gst_uri_from_string_with_base", libs);
  gidLink(cast(void**)&gst_uri_get_fragment, "gst_uri_get_fragment", libs);
  gidLink(cast(void**)&gst_uri_get_host, "gst_uri_get_host", libs);
  gidLink(cast(void**)&gst_uri_get_media_fragment_table, "gst_uri_get_media_fragment_table", libs);
  gidLink(cast(void**)&gst_uri_get_path, "gst_uri_get_path", libs);
  gidLink(cast(void**)&gst_uri_get_path_segments, "gst_uri_get_path_segments", libs);
  gidLink(cast(void**)&gst_uri_get_path_string, "gst_uri_get_path_string", libs);
  gidLink(cast(void**)&gst_uri_get_port, "gst_uri_get_port", libs);
  gidLink(cast(void**)&gst_uri_get_query_keys, "gst_uri_get_query_keys", libs);
  gidLink(cast(void**)&gst_uri_get_query_string, "gst_uri_get_query_string", libs);
  gidLink(cast(void**)&gst_uri_get_query_string_ordered, "gst_uri_get_query_string_ordered", libs);
  gidLink(cast(void**)&gst_uri_get_query_table, "gst_uri_get_query_table", libs);
  gidLink(cast(void**)&gst_uri_get_query_value, "gst_uri_get_query_value", libs);
  gidLink(cast(void**)&gst_uri_get_scheme, "gst_uri_get_scheme", libs);
  gidLink(cast(void**)&gst_uri_get_userinfo, "gst_uri_get_userinfo", libs);
  gidLink(cast(void**)&gst_uri_is_normalized, "gst_uri_is_normalized", libs);
  gidLink(cast(void**)&gst_uri_is_writable, "gst_uri_is_writable", libs);
  gidLink(cast(void**)&gst_uri_join, "gst_uri_join", libs);
  gidLink(cast(void**)&gst_uri_make_writable, "gst_uri_make_writable", libs);
  gidLink(cast(void**)&gst_uri_new_with_base, "gst_uri_new_with_base", libs);
  gidLink(cast(void**)&gst_uri_normalize, "gst_uri_normalize", libs);
  gidLink(cast(void**)&gst_uri_query_has_key, "gst_uri_query_has_key", libs);
  gidLink(cast(void**)&gst_uri_ref, "gst_uri_ref", libs);
  gidLink(cast(void**)&gst_uri_remove_query_key, "gst_uri_remove_query_key", libs);
  gidLink(cast(void**)&gst_uri_set_fragment, "gst_uri_set_fragment", libs);
  gidLink(cast(void**)&gst_uri_set_host, "gst_uri_set_host", libs);
  gidLink(cast(void**)&gst_uri_set_path, "gst_uri_set_path", libs);
  gidLink(cast(void**)&gst_uri_set_path_segments, "gst_uri_set_path_segments", libs);
  gidLink(cast(void**)&gst_uri_set_path_string, "gst_uri_set_path_string", libs);
  gidLink(cast(void**)&gst_uri_set_port, "gst_uri_set_port", libs);
  gidLink(cast(void**)&gst_uri_set_query_string, "gst_uri_set_query_string", libs);
  gidLink(cast(void**)&gst_uri_set_query_table, "gst_uri_set_query_table", libs);
  gidLink(cast(void**)&gst_uri_set_query_value, "gst_uri_set_query_value", libs);
  gidLink(cast(void**)&gst_uri_set_scheme, "gst_uri_set_scheme", libs);
  gidLink(cast(void**)&gst_uri_set_userinfo, "gst_uri_set_userinfo", libs);
  gidLink(cast(void**)&gst_uri_to_string, "gst_uri_to_string", libs);
  gidLink(cast(void**)&gst_uri_to_string_with_keys, "gst_uri_to_string_with_keys", libs);
  gidLink(cast(void**)&gst_uri_unref, "gst_uri_unref", libs);
  gidLink(cast(void**)&gst_uri_construct, "gst_uri_construct", libs);
  gidLink(cast(void**)&gst_uri_from_string, "gst_uri_from_string", libs);
  gidLink(cast(void**)&gst_uri_from_string_escaped, "gst_uri_from_string_escaped", libs);
  gidLink(cast(void**)&gst_uri_get_location, "gst_uri_get_location", libs);
  gidLink(cast(void**)&gst_uri_get_protocol, "gst_uri_get_protocol", libs);
  gidLink(cast(void**)&gst_uri_has_protocol, "gst_uri_has_protocol", libs);
  gidLink(cast(void**)&gst_uri_is_valid, "gst_uri_is_valid", libs);
  gidLink(cast(void**)&gst_uri_join_strings, "gst_uri_join_strings", libs);
  gidLink(cast(void**)&gst_uri_protocol_is_supported, "gst_uri_protocol_is_supported", libs);
  gidLink(cast(void**)&gst_uri_protocol_is_valid, "gst_uri_protocol_is_valid", libs);

  // ValueArray
  gidLink(cast(void**)&gst_value_array_get_type, "gst_value_array_get_type", libs);
  gidLink(cast(void**)&gst_value_array_append_and_take_value, "gst_value_array_append_and_take_value", libs);
  gidLink(cast(void**)&gst_value_array_append_value, "gst_value_array_append_value", libs);
  gidLink(cast(void**)&gst_value_array_get_size, "gst_value_array_get_size", libs);
  gidLink(cast(void**)&gst_value_array_get_value, "gst_value_array_get_value", libs);
  gidLink(cast(void**)&gst_value_array_init, "gst_value_array_init", libs);
  gidLink(cast(void**)&gst_value_array_prepend_value, "gst_value_array_prepend_value", libs);

  // ValueList
  gidLink(cast(void**)&gst_value_list_get_type, "gst_value_list_get_type", libs);
  gidLink(cast(void**)&gst_value_list_append_and_take_value, "gst_value_list_append_and_take_value", libs);
  gidLink(cast(void**)&gst_value_list_append_value, "gst_value_list_append_value", libs);
  gidLink(cast(void**)&gst_value_list_concat, "gst_value_list_concat", libs);
  gidLink(cast(void**)&gst_value_list_get_size, "gst_value_list_get_size", libs);
  gidLink(cast(void**)&gst_value_list_get_value, "gst_value_list_get_value", libs);
  gidLink(cast(void**)&gst_value_list_init, "gst_value_list_init", libs);
  gidLink(cast(void**)&gst_value_list_merge, "gst_value_list_merge", libs);
  gidLink(cast(void**)&gst_value_list_prepend_value, "gst_value_list_prepend_value", libs);

  // ValueUniqueList
  gidLink(cast(void**)&gst_value_unique_list_get_type, "gst_value_unique_list_get_type", libs);
  gidLink(cast(void**)&gst_value_unique_list_append_and_take_value, "gst_value_unique_list_append_and_take_value", libs);
  gidLink(cast(void**)&gst_value_unique_list_append_value, "gst_value_unique_list_append_value", libs);
  gidLink(cast(void**)&gst_value_unique_list_concat, "gst_value_unique_list_concat", libs);
  gidLink(cast(void**)&gst_value_unique_list_get_size, "gst_value_unique_list_get_size", libs);
  gidLink(cast(void**)&gst_value_unique_list_get_value, "gst_value_unique_list_get_value", libs);
  gidLink(cast(void**)&gst_value_unique_list_prepend_value, "gst_value_unique_list_prepend_value", libs);

  // VecDeque
  gidLink(cast(void**)&gst_vec_deque_clear, "gst_vec_deque_clear", libs);
  gidLink(cast(void**)&gst_vec_deque_drop_element, "gst_vec_deque_drop_element", libs);
  gidLink(cast(void**)&gst_vec_deque_drop_struct, "gst_vec_deque_drop_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_find, "gst_vec_deque_find", libs);
  gidLink(cast(void**)&gst_vec_deque_free, "gst_vec_deque_free", libs);
  gidLink(cast(void**)&gst_vec_deque_get_length, "gst_vec_deque_get_length", libs);
  gidLink(cast(void**)&gst_vec_deque_is_empty, "gst_vec_deque_is_empty", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_head, "gst_vec_deque_peek_head", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_head_struct, "gst_vec_deque_peek_head_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_nth, "gst_vec_deque_peek_nth", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_nth_struct, "gst_vec_deque_peek_nth_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_tail, "gst_vec_deque_peek_tail", libs);
  gidLink(cast(void**)&gst_vec_deque_peek_tail_struct, "gst_vec_deque_peek_tail_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_pop_head, "gst_vec_deque_pop_head", libs);
  gidLink(cast(void**)&gst_vec_deque_pop_head_struct, "gst_vec_deque_pop_head_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_pop_tail, "gst_vec_deque_pop_tail", libs);
  gidLink(cast(void**)&gst_vec_deque_pop_tail_struct, "gst_vec_deque_pop_tail_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_push_sorted, "gst_vec_deque_push_sorted", libs);
  gidLink(cast(void**)&gst_vec_deque_push_sorted_struct, "gst_vec_deque_push_sorted_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_push_tail, "gst_vec_deque_push_tail", libs);
  gidLink(cast(void**)&gst_vec_deque_push_tail_struct, "gst_vec_deque_push_tail_struct", libs);
  gidLink(cast(void**)&gst_vec_deque_set_clear_func, "gst_vec_deque_set_clear_func", libs);
  gidLink(cast(void**)&gst_vec_deque_sort, "gst_vec_deque_sort", libs);
  gidLink(cast(void**)&gst_vec_deque_new, "gst_vec_deque_new", libs);
  gidLink(cast(void**)&gst_vec_deque_new_for_struct, "gst_vec_deque_new_for_struct", libs);

  // global
  gidLink(cast(void**)&gst_calculate_linear_regression, "gst_calculate_linear_regression", libs);
  gidLink(cast(void**)&gst_call_async, "gst_call_async", libs);
  gidLink(cast(void**)&gst_check_version, "gst_check_version", libs);
  gidLink(cast(void**)&gst_clear_buffer, "gst_clear_buffer", libs);
  gidLink(cast(void**)&gst_clear_buffer_list, "gst_clear_buffer_list", libs);
  gidLink(cast(void**)&gst_clear_caps, "gst_clear_caps", libs);
  gidLink(cast(void**)&gst_clear_context, "gst_clear_context", libs);
  gidLink(cast(void**)&gst_clear_event, "gst_clear_event", libs);
  gidLink(cast(void**)&gst_clear_message, "gst_clear_message", libs);
  gidLink(cast(void**)&gst_clear_mini_object, "gst_clear_mini_object", libs);
  gidLink(cast(void**)&gst_clear_object, "gst_clear_object", libs);
  gidLink(cast(void**)&gst_clear_promise, "gst_clear_promise", libs);
  gidLink(cast(void**)&gst_clear_query, "gst_clear_query", libs);
  gidLink(cast(void**)&gst_clear_sample, "gst_clear_sample", libs);
  gidLink(cast(void**)&gst_clear_structure, "gst_clear_structure", libs);
  gidLink(cast(void**)&gst_clear_tag_list, "gst_clear_tag_list", libs);
  gidLink(cast(void**)&gst_clear_uri, "gst_clear_uri", libs);
  gidLink(cast(void**)&gst_cpuid_supports_arm_neon, "gst_cpuid_supports_arm_neon", libs);
  gidLink(cast(void**)&gst_cpuid_supports_arm_neon64, "gst_cpuid_supports_arm_neon64", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_3dnow, "gst_cpuid_supports_x86_3dnow", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_avx, "gst_cpuid_supports_x86_avx", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_avx2, "gst_cpuid_supports_x86_avx2", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_mmx, "gst_cpuid_supports_x86_mmx", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_mmxext, "gst_cpuid_supports_x86_mmxext", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_sse2, "gst_cpuid_supports_x86_sse2", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_sse3, "gst_cpuid_supports_x86_sse3", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_sse4_1, "gst_cpuid_supports_x86_sse4_1", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_sse4_2, "gst_cpuid_supports_x86_sse4_2", libs);
  gidLink(cast(void**)&gst_cpuid_supports_x86_ssse3, "gst_cpuid_supports_x86_ssse3", libs);
  gidLink(cast(void**)&gst_debug_add_log_function, "gst_debug_add_log_function", libs);
  gidLink(cast(void**)&gst_debug_add_ring_buffer_logger, "gst_debug_add_ring_buffer_logger", libs);
  gidLink(cast(void**)&gst_debug_bin_to_dot_data, "gst_debug_bin_to_dot_data", libs);
  gidLink(cast(void**)&gst_debug_bin_to_dot_file, "gst_debug_bin_to_dot_file", libs);
  gidLink(cast(void**)&gst_debug_bin_to_dot_file_with_ts, "gst_debug_bin_to_dot_file_with_ts", libs);
  gidLink(cast(void**)&gst_debug_construct_term_color, "gst_debug_construct_term_color", libs);
  gidLink(cast(void**)&gst_debug_construct_win_color, "gst_debug_construct_win_color", libs);
  gidLink(cast(void**)&gst_debug_get_all_categories, "gst_debug_get_all_categories", libs);
  gidLink(cast(void**)&gst_debug_get_color_mode, "gst_debug_get_color_mode", libs);
  gidLink(cast(void**)&gst_debug_get_default_threshold, "gst_debug_get_default_threshold", libs);
  gidLink(cast(void**)&gst_debug_get_stack_trace, "gst_debug_get_stack_trace", libs);
  gidLink(cast(void**)&gst_debug_is_active, "gst_debug_is_active", libs);
  gidLink(cast(void**)&gst_debug_is_colored, "gst_debug_is_colored", libs);
  gidLink(cast(void**)&gst_debug_log, "gst_debug_log", libs);
  gidLink(cast(void**)&gst_debug_log_default, "gst_debug_log_default", libs);
  gidLink(cast(void**)&gst_debug_log_get_line, "gst_debug_log_get_line", libs);
  gidLink(cast(void**)&gst_debug_log_id, "gst_debug_log_id", libs);
  gidLink(cast(void**)&gst_debug_log_id_literal, "gst_debug_log_id_literal", libs);
  gidLink(cast(void**)&gst_debug_log_id_literal_with_context, "gst_debug_log_id_literal_with_context", libs);
  gidLink(cast(void**)&gst_debug_log_id_valist, "gst_debug_log_id_valist", libs);
  gidLink(cast(void**)&gst_debug_log_id_with_context, "gst_debug_log_id_with_context", libs);
  gidLink(cast(void**)&gst_debug_log_id_with_context_valist, "gst_debug_log_id_with_context_valist", libs);
  gidLink(cast(void**)&gst_debug_log_literal, "gst_debug_log_literal", libs);
  gidLink(cast(void**)&gst_debug_log_literal_with_context, "gst_debug_log_literal_with_context", libs);
  gidLink(cast(void**)&gst_debug_log_valist, "gst_debug_log_valist", libs);
  gidLink(cast(void**)&gst_debug_log_with_context, "gst_debug_log_with_context", libs);
  gidLink(cast(void**)&gst_debug_log_with_context_valist, "gst_debug_log_with_context_valist", libs);
  gidLink(cast(void**)&gst_debug_print_object, "gst_debug_print_object", libs);
  gidLink(cast(void**)&gst_debug_print_segment, "gst_debug_print_segment", libs);
  gidLink(cast(void**)&gst_debug_print_stack_trace, "gst_debug_print_stack_trace", libs);
  gidLink(cast(void**)&gst_debug_remove_log_function, "gst_debug_remove_log_function", libs);
  gidLink(cast(void**)&gst_debug_remove_log_function_by_data, "gst_debug_remove_log_function_by_data", libs);
  gidLink(cast(void**)&gst_debug_remove_ring_buffer_logger, "gst_debug_remove_ring_buffer_logger", libs);
  gidLink(cast(void**)&gst_debug_ring_buffer_logger_get_logs, "gst_debug_ring_buffer_logger_get_logs", libs);
  gidLink(cast(void**)&gst_debug_set_active, "gst_debug_set_active", libs);
  gidLink(cast(void**)&gst_debug_set_color_mode, "gst_debug_set_color_mode", libs);
  gidLink(cast(void**)&gst_debug_set_color_mode_from_string, "gst_debug_set_color_mode_from_string", libs);
  gidLink(cast(void**)&gst_debug_set_colored, "gst_debug_set_colored", libs);
  gidLink(cast(void**)&gst_debug_set_default_threshold, "gst_debug_set_default_threshold", libs);
  gidLink(cast(void**)&gst_debug_set_threshold_for_name, "gst_debug_set_threshold_for_name", libs);
  gidLink(cast(void**)&gst_debug_set_threshold_from_string, "gst_debug_set_threshold_from_string", libs);
  gidLink(cast(void**)&gst_debug_unset_threshold_for_name, "gst_debug_unset_threshold_for_name", libs);
  gidLink(cast(void**)&gst_deinit, "gst_deinit", libs);
  gidLink(cast(void**)&gst_dynamic_type_register, "gst_dynamic_type_register", libs);
  gidLink(cast(void**)&gst_error_get_message, "gst_error_get_message", libs);
  gidLink(cast(void**)&gst_filename_to_uri, "gst_filename_to_uri", libs);
  gidLink(cast(void**)&gst_flow_get_name, "gst_flow_get_name", libs);
  gidLink(cast(void**)&gst_flow_to_quark, "gst_flow_to_quark", libs);
  gidLink(cast(void**)&gst_formats_contains, "gst_formats_contains", libs);
  gidLink(cast(void**)&gst_get_main_executable_path, "gst_get_main_executable_path", libs);
  gidLink(cast(void**)&gst_info_strdup_printf, "gst_info_strdup_printf", libs);
  gidLink(cast(void**)&gst_info_strdup_vprintf, "gst_info_strdup_vprintf", libs);
  gidLink(cast(void**)&gst_info_vasprintf, "gst_info_vasprintf", libs);
  gidLink(cast(void**)&gst_init, "gst_init", libs);
  gidLink(cast(void**)&gst_init_check, "gst_init_check", libs);
  gidLink(cast(void**)&gst_init_get_option_group, "gst_init_get_option_group", libs);
  gidLink(cast(void**)&gst_is_caps_features, "gst_is_caps_features", libs);
  gidLink(cast(void**)&gst_is_initialized, "gst_is_initialized", libs);
  gidLink(cast(void**)&gst_make_element_message_details, "gst_make_element_message_details", libs);
  gidLink(cast(void**)&gst_param_spec_array, "gst_param_spec_array", libs);
  gidLink(cast(void**)&gst_param_spec_fraction, "gst_param_spec_fraction", libs);
  gidLink(cast(void**)&gst_parent_buffer_meta_api_get_type, "gst_parent_buffer_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_parse_bin_from_description, "gst_parse_bin_from_description", libs);
  gidLink(cast(void**)&gst_parse_bin_from_description_full, "gst_parse_bin_from_description_full", libs);
  gidLink(cast(void**)&gst_parse_launch, "gst_parse_launch", libs);
  gidLink(cast(void**)&gst_parse_launch_full, "gst_parse_launch_full", libs);
  gidLink(cast(void**)&gst_parse_launchv, "gst_parse_launchv", libs);
  gidLink(cast(void**)&gst_parse_launchv_full, "gst_parse_launchv_full", libs);
  gidLink(cast(void**)&gst_print, "gst_print", libs);
  gidLink(cast(void**)&gst_printerr, "gst_printerr", libs);
  gidLink(cast(void**)&gst_printerrln, "gst_printerrln", libs);
  gidLink(cast(void**)&gst_println, "gst_println", libs);
  gidLink(cast(void**)&gst_protection_filter_systems_by_available_decryptors, "gst_protection_filter_systems_by_available_decryptors", libs);
  gidLink(cast(void**)&gst_protection_meta_api_get_type, "gst_protection_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_protection_select_system, "gst_protection_select_system", libs);
  gidLink(cast(void**)&gst_reference_timestamp_meta_api_get_type, "gst_reference_timestamp_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_segtrap_is_enabled, "gst_segtrap_is_enabled", libs);
  gidLink(cast(void**)&gst_segtrap_set_enabled, "gst_segtrap_set_enabled", libs);
  gidLink(cast(void**)&gst_tag_exists, "gst_tag_exists", libs);
  gidLink(cast(void**)&gst_tag_get_description, "gst_tag_get_description", libs);
  gidLink(cast(void**)&gst_tag_get_flag, "gst_tag_get_flag", libs);
  gidLink(cast(void**)&gst_tag_get_nick, "gst_tag_get_nick", libs);
  gidLink(cast(void**)&gst_tag_get_type, "gst_tag_get_type", libs);
  gidLink(cast(void**)&gst_tag_is_fixed, "gst_tag_is_fixed", libs);
  gidLink(cast(void**)&gst_tag_merge_strings_with_comma, "gst_tag_merge_strings_with_comma", libs);
  gidLink(cast(void**)&gst_tag_merge_use_first, "gst_tag_merge_use_first", libs);
  gidLink(cast(void**)&gst_tag_register, "gst_tag_register", libs);
  gidLink(cast(void**)&gst_tag_register_static, "gst_tag_register_static", libs);
  gidLink(cast(void**)&gst_tracing_get_active_tracers, "gst_tracing_get_active_tracers", libs);
  gidLink(cast(void**)&gst_tracing_register_hook, "gst_tracing_register_hook", libs);
  gidLink(cast(void**)&gst_type_is_plugin_api, "gst_type_is_plugin_api", libs);
  gidLink(cast(void**)&gst_type_mark_as_plugin_api, "gst_type_mark_as_plugin_api", libs);
  gidLink(cast(void**)&gst_update_registry, "gst_update_registry", libs);
  gidLink(cast(void**)&gst_util_array_binary_search, "gst_util_array_binary_search", libs);
  gidLink(cast(void**)&gst_util_ceil_log2, "gst_util_ceil_log2", libs);
  gidLink(cast(void**)&gst_util_double_to_fraction, "gst_util_double_to_fraction", libs);
  gidLink(cast(void**)&gst_util_dump_buffer, "gst_util_dump_buffer", libs);
  gidLink(cast(void**)&gst_util_dump_mem, "gst_util_dump_mem", libs);
  gidLink(cast(void**)&gst_util_filename_compare, "gst_util_filename_compare", libs);
  gidLink(cast(void**)&gst_util_floor_log2, "gst_util_floor_log2", libs);
  gidLink(cast(void**)&gst_util_fraction_add, "gst_util_fraction_add", libs);
  gidLink(cast(void**)&gst_util_fraction_compare, "gst_util_fraction_compare", libs);
  gidLink(cast(void**)&gst_util_fraction_multiply, "gst_util_fraction_multiply", libs);
  gidLink(cast(void**)&gst_util_fraction_multiply_int64, "gst_util_fraction_multiply_int64", libs);
  gidLink(cast(void**)&gst_util_fraction_to_double, "gst_util_fraction_to_double", libs);
  gidLink(cast(void**)&gst_util_gdouble_to_guint64, "gst_util_gdouble_to_guint64", libs);
  gidLink(cast(void**)&gst_util_get_object_array, "gst_util_get_object_array", libs);
  gidLink(cast(void**)&gst_util_get_timestamp, "gst_util_get_timestamp", libs);
  gidLink(cast(void**)&gst_util_greatest_common_divisor, "gst_util_greatest_common_divisor", libs);
  gidLink(cast(void**)&gst_util_greatest_common_divisor_int64, "gst_util_greatest_common_divisor_int64", libs);
  gidLink(cast(void**)&gst_util_group_id_next, "gst_util_group_id_next", libs);
  gidLink(cast(void**)&gst_util_guint64_to_gdouble, "gst_util_guint64_to_gdouble", libs);
  gidLink(cast(void**)&gst_util_seqnum_compare, "gst_util_seqnum_compare", libs);
  gidLink(cast(void**)&gst_util_seqnum_next, "gst_util_seqnum_next", libs);
  gidLink(cast(void**)&gst_util_set_object_arg, "gst_util_set_object_arg", libs);
  gidLink(cast(void**)&gst_util_set_object_array, "gst_util_set_object_array", libs);
  gidLink(cast(void**)&gst_util_set_value_from_string, "gst_util_set_value_from_string", libs);
  gidLink(cast(void**)&gst_util_simplify_fraction, "gst_util_simplify_fraction", libs);
  gidLink(cast(void**)&gst_util_uint64_scale, "gst_util_uint64_scale", libs);
  gidLink(cast(void**)&gst_util_uint64_scale_ceil, "gst_util_uint64_scale_ceil", libs);
  gidLink(cast(void**)&gst_util_uint64_scale_int, "gst_util_uint64_scale_int", libs);
  gidLink(cast(void**)&gst_util_uint64_scale_int_ceil, "gst_util_uint64_scale_int_ceil", libs);
  gidLink(cast(void**)&gst_util_uint64_scale_int_round, "gst_util_uint64_scale_int_round", libs);
  gidLink(cast(void**)&gst_util_uint64_scale_round, "gst_util_uint64_scale_round", libs);
  gidLink(cast(void**)&gst_value_can_compare, "gst_value_can_compare", libs);
  gidLink(cast(void**)&gst_value_can_intersect, "gst_value_can_intersect", libs);
  gidLink(cast(void**)&gst_value_can_subtract, "gst_value_can_subtract", libs);
  gidLink(cast(void**)&gst_value_can_union, "gst_value_can_union", libs);
  gidLink(cast(void**)&gst_value_compare, "gst_value_compare", libs);
  gidLink(cast(void**)&gst_value_deserialize, "gst_value_deserialize", libs);
  gidLink(cast(void**)&gst_value_deserialize_with_pspec, "gst_value_deserialize_with_pspec", libs);
  gidLink(cast(void**)&gst_value_fixate, "gst_value_fixate", libs);
  gidLink(cast(void**)&gst_value_fraction_multiply, "gst_value_fraction_multiply", libs);
  gidLink(cast(void**)&gst_value_fraction_subtract, "gst_value_fraction_subtract", libs);
  gidLink(cast(void**)&gst_value_get_bitmask, "gst_value_get_bitmask", libs);
  gidLink(cast(void**)&gst_value_get_caps, "gst_value_get_caps", libs);
  gidLink(cast(void**)&gst_value_get_caps_features, "gst_value_get_caps_features", libs);
  gidLink(cast(void**)&gst_value_get_double_range_max, "gst_value_get_double_range_max", libs);
  gidLink(cast(void**)&gst_value_get_double_range_min, "gst_value_get_double_range_min", libs);
  gidLink(cast(void**)&gst_value_get_flagset_flags, "gst_value_get_flagset_flags", libs);
  gidLink(cast(void**)&gst_value_get_flagset_mask, "gst_value_get_flagset_mask", libs);
  gidLink(cast(void**)&gst_value_get_fraction_denominator, "gst_value_get_fraction_denominator", libs);
  gidLink(cast(void**)&gst_value_get_fraction_numerator, "gst_value_get_fraction_numerator", libs);
  gidLink(cast(void**)&gst_value_get_fraction_range_max, "gst_value_get_fraction_range_max", libs);
  gidLink(cast(void**)&gst_value_get_fraction_range_min, "gst_value_get_fraction_range_min", libs);
  gidLink(cast(void**)&gst_value_get_int64_range_max, "gst_value_get_int64_range_max", libs);
  gidLink(cast(void**)&gst_value_get_int64_range_min, "gst_value_get_int64_range_min", libs);
  gidLink(cast(void**)&gst_value_get_int64_range_step, "gst_value_get_int64_range_step", libs);
  gidLink(cast(void**)&gst_value_get_int_range_max, "gst_value_get_int_range_max", libs);
  gidLink(cast(void**)&gst_value_get_int_range_min, "gst_value_get_int_range_min", libs);
  gidLink(cast(void**)&gst_value_get_int_range_step, "gst_value_get_int_range_step", libs);
  gidLink(cast(void**)&gst_value_get_structure, "gst_value_get_structure", libs);
  gidLink(cast(void**)&gst_value_hash, "gst_value_hash", libs);
  gidLink(cast(void**)&gst_value_init_and_copy, "gst_value_init_and_copy", libs);
  gidLink(cast(void**)&gst_value_intersect, "gst_value_intersect", libs);
  gidLink(cast(void**)&gst_value_is_fixed, "gst_value_is_fixed", libs);
  gidLink(cast(void**)&gst_value_is_subset, "gst_value_is_subset", libs);
  gidLink(cast(void**)&gst_value_register, "gst_value_register", libs);
  gidLink(cast(void**)&gst_value_serialize, "gst_value_serialize", libs);
  gidLink(cast(void**)&gst_value_set_bitmask, "gst_value_set_bitmask", libs);
  gidLink(cast(void**)&gst_value_set_caps, "gst_value_set_caps", libs);
  gidLink(cast(void**)&gst_value_set_caps_features, "gst_value_set_caps_features", libs);
  gidLink(cast(void**)&gst_value_set_double_range, "gst_value_set_double_range", libs);
  gidLink(cast(void**)&gst_value_set_flagset, "gst_value_set_flagset", libs);
  gidLink(cast(void**)&gst_value_set_fraction, "gst_value_set_fraction", libs);
  gidLink(cast(void**)&gst_value_set_fraction_range, "gst_value_set_fraction_range", libs);
  gidLink(cast(void**)&gst_value_set_fraction_range_full, "gst_value_set_fraction_range_full", libs);
  gidLink(cast(void**)&gst_value_set_int64_range, "gst_value_set_int64_range", libs);
  gidLink(cast(void**)&gst_value_set_int64_range_step, "gst_value_set_int64_range_step", libs);
  gidLink(cast(void**)&gst_value_set_int_range, "gst_value_set_int_range", libs);
  gidLink(cast(void**)&gst_value_set_int_range_step, "gst_value_set_int_range_step", libs);
  gidLink(cast(void**)&gst_value_set_structure, "gst_value_set_structure", libs);
  gidLink(cast(void**)&gst_value_subtract, "gst_value_subtract", libs);
  gidLink(cast(void**)&gst_value_union, "gst_value_union", libs);
  gidLink(cast(void**)&gst_version, "gst_version", libs);
  gidLink(cast(void**)&gst_version_string, "gst_version_string", libs);

  // CoreError
  gidLink(cast(void**)&gst_core_error_quark, "gst_core_error_quark", libs);

  // DebugLevel
  gidLink(cast(void**)&gst_debug_level_get_name, "gst_debug_level_get_name", libs);

  // EventType
  gidLink(cast(void**)&gst_event_type_get_flags, "gst_event_type_get_flags", libs);
  gidLink(cast(void**)&gst_event_type_get_name, "gst_event_type_get_name", libs);
  gidLink(cast(void**)&gst_event_type_to_quark, "gst_event_type_to_quark", libs);
  gidLink(cast(void**)&gst_event_type_to_sticky_ordering, "gst_event_type_to_sticky_ordering", libs);

  // Format
  gidLink(cast(void**)&gst_format_get_by_nick, "gst_format_get_by_nick", libs);
  gidLink(cast(void**)&gst_format_get_details, "gst_format_get_details", libs);
  gidLink(cast(void**)&gst_format_get_name, "gst_format_get_name", libs);
  gidLink(cast(void**)&gst_format_iterate_definitions, "gst_format_iterate_definitions", libs);
  gidLink(cast(void**)&gst_format_register, "gst_format_register", libs);
  gidLink(cast(void**)&gst_format_to_quark, "gst_format_to_quark", libs);

  // LibraryError
  gidLink(cast(void**)&gst_library_error_quark, "gst_library_error_quark", libs);

  // MessageType
  gidLink(cast(void**)&gst_message_type_get_name, "gst_message_type_get_name", libs);
  gidLink(cast(void**)&gst_message_type_to_quark, "gst_message_type_to_quark", libs);

  // PadMode
  gidLink(cast(void**)&gst_pad_mode_get_name, "gst_pad_mode_get_name", libs);

  // ParseError
  gidLink(cast(void**)&gst_parse_error_quark, "gst_parse_error_quark", libs);

  // PluginError
  gidLink(cast(void**)&gst_plugin_error_quark, "gst_plugin_error_quark", libs);

  // QueryType
  gidLink(cast(void**)&gst_query_type_get_flags, "gst_query_type_get_flags", libs);
  gidLink(cast(void**)&gst_query_type_get_name, "gst_query_type_get_name", libs);
  gidLink(cast(void**)&gst_query_type_to_quark, "gst_query_type_to_quark", libs);

  // ResourceError
  gidLink(cast(void**)&gst_resource_error_quark, "gst_resource_error_quark", libs);

  // State
  gidLink(cast(void**)&gst_state_get_name, "gst_state_get_name", libs);

  // StateChange
  gidLink(cast(void**)&gst_state_change_get_name, "gst_state_change_get_name", libs);

  // StateChangeReturn
  gidLink(cast(void**)&gst_state_change_return_get_name, "gst_state_change_return_get_name", libs);

  // StreamError
  gidLink(cast(void**)&gst_stream_error_quark, "gst_stream_error_quark", libs);

  // StreamType
  gidLink(cast(void**)&gst_stream_type_get_name, "gst_stream_type_get_name", libs);

  // TocEntryType
  gidLink(cast(void**)&gst_toc_entry_type_get_nick, "gst_toc_entry_type_get_nick", libs);

  // URIError
  gidLink(cast(void**)&gst_uri_error_quark, "gst_uri_error_quark", libs);
}
