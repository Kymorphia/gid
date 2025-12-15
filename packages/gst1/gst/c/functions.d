/// C functions for gst1 library
module gst.c.functions;

public import gid.basictypes;
import gid.loader;
import gst.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;

version(Windows)
  private immutable LIBS = ["libgstreamer-1.0-0.dll;gstreamer-1.0-0.dll;gstreamer-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstreamer-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstreamer-1.0.so.0"];

__gshared extern(C)
{
  // AllocationParams
  GType function() c_gst_allocation_params_get_type; ///
  GstAllocationParams* function() c_gst_allocation_params_new; ///
  GstAllocationParams* function(const(GstAllocationParams)* params) c_gst_allocation_params_copy; ///
  void function(GstAllocationParams* params) c_gst_allocation_params_free; ///
  void function(GstAllocationParams* params) c_gst_allocation_params_init; ///

  // Allocator
  GType function() c_gst_allocator_get_type; ///
  GstAllocator* function(const(char)* name) c_gst_allocator_find; ///
  void function(const(char)* name, GstAllocator* allocator) c_gst_allocator_register; ///
  GstMemory* function(GstAllocator* allocator, size_t size, GstAllocationParams* params) c_gst_allocator_alloc; ///
  void function(GstAllocator* allocator, GstMemory* memory) c_gst_allocator_free; ///
  void function(GstAllocator* allocator) c_gst_allocator_set_default; ///

  // AtomicQueue
  GType function() c_gst_atomic_queue_get_type; ///
  GstAtomicQueue* function(uint initialSize) c_gst_atomic_queue_new; ///
  uint function(GstAtomicQueue* queue) c_gst_atomic_queue_length; ///
  void* function(GstAtomicQueue* queue) c_gst_atomic_queue_peek; ///
  void* function(GstAtomicQueue* queue) c_gst_atomic_queue_pop; ///
  void function(GstAtomicQueue* queue, void* data) c_gst_atomic_queue_push; ///
  void function(GstAtomicQueue* queue) c_gst_atomic_queue_ref; ///
  void function(GstAtomicQueue* queue) c_gst_atomic_queue_unref; ///

  // Bin
  GType function() c_gst_bin_get_type; ///
  GstElement* function(const(char)* name) c_gst_bin_new; ///
  gboolean function(GstBin* bin, GstElement* element) c_gst_bin_add; ///
  void function(GstBin* bin, GstElement* element1,  ...) c_gst_bin_add_many; ///
  GstPad* function(GstBin* bin, GstPadDirection direction) c_gst_bin_find_unlinked_pad; ///
  GstElement* function(GstBin* bin, GType iface) c_gst_bin_get_by_interface; ///
  GstElement* function(GstBin* bin, const(char)* name) c_gst_bin_get_by_name; ///
  GstElement* function(GstBin* bin, const(char)* name) c_gst_bin_get_by_name_recurse_up; ///
  GstElementFlags function(GstBin* bin) c_gst_bin_get_suppressed_flags; ///
  GstIterator* function(GstBin* bin, const(char)* factoryName) c_gst_bin_iterate_all_by_element_factory_name; ///
  GstIterator* function(GstBin* bin, GType iface) c_gst_bin_iterate_all_by_interface; ///
  GstIterator* function(GstBin* bin) c_gst_bin_iterate_elements; ///
  GstIterator* function(GstBin* bin) c_gst_bin_iterate_recurse; ///
  GstIterator* function(GstBin* bin) c_gst_bin_iterate_sinks; ///
  GstIterator* function(GstBin* bin) c_gst_bin_iterate_sorted; ///
  GstIterator* function(GstBin* bin) c_gst_bin_iterate_sources; ///
  gboolean function(GstBin* bin) c_gst_bin_recalculate_latency; ///
  gboolean function(GstBin* bin, GstElement* element) c_gst_bin_remove; ///
  void function(GstBin* bin, GstElement* element1,  ...) c_gst_bin_remove_many; ///
  void function(GstBin* bin, GstElementFlags flags) c_gst_bin_set_suppressed_flags; ///
  gboolean function(GstBin* bin) c_gst_bin_sync_children_states; ///

  // Bitmask
  GType function() c_gst_bitmask_get_type; ///

  // Buffer
  GType function() c_gst_buffer_get_type; ///
  GstBuffer* function() c_gst_buffer_new; ///
  GstBuffer* function(GstAllocator* allocator, size_t size, GstAllocationParams* params) c_gst_buffer_new_allocate; ///
  GstBuffer* function(const(void)* data, size_t size) c_gst_buffer_new_memdup; ///
  GstBuffer* function(void* data, size_t size) c_gst_buffer_new_wrapped; ///
  GstBuffer* function(GBytes* bytes) c_gst_buffer_new_wrapped_bytes; ///
  GstBuffer* function(GstMemoryFlags flags, void* data, size_t maxsize, size_t offset, size_t size, void* userData, GDestroyNotify notify) c_gst_buffer_new_wrapped_full; ///
  GstCustomMeta* function(GstBuffer* buffer, const(char)* name) c_gst_buffer_add_custom_meta; ///
  GstMeta* function(GstBuffer* buffer, const(GstMetaInfo)* info, void* params) c_gst_buffer_add_meta; ///
  GstParentBufferMeta* function(GstBuffer* buffer, GstBuffer* ref_) c_gst_buffer_add_parent_buffer_meta; ///
  GstProtectionMeta* function(GstBuffer* buffer, GstStructure* info) c_gst_buffer_add_protection_meta; ///
  GstReferenceTimestampMeta* function(GstBuffer* buffer, GstCaps* reference, GstClockTime timestamp, GstClockTime duration) c_gst_buffer_add_reference_timestamp_meta; ///
  GstBuffer* function(GstBuffer* buf1, GstBuffer* buf2) c_gst_buffer_append; ///
  void function(GstBuffer* buffer, GstMemory* mem) c_gst_buffer_append_memory; ///
  GstBuffer* function(GstBuffer* buf1, GstBuffer* buf2, ptrdiff_t offset, ptrdiff_t size) c_gst_buffer_append_region; ///
  GstBuffer* function(const(GstBuffer)* buf) c_gst_buffer_copy_deep; ///
  gboolean function(GstBuffer* dest, GstBuffer* src, GstBufferCopyFlags flags, size_t offset, size_t size) c_gst_buffer_copy_into; ///
  GstBuffer* function(GstBuffer* parent, GstBufferCopyFlags flags, size_t offset, size_t size) c_gst_buffer_copy_region; ///
  size_t function(GstBuffer* buffer, size_t offset, void* dest, size_t size) c_gst_buffer_extract; ///
  void function(GstBuffer* buffer, size_t offset, size_t size, void** dest, size_t* destSize) c_gst_buffer_extract_dup; ///
  size_t function(GstBuffer* buffer, size_t offset, const(void)* src, size_t size) c_gst_buffer_fill; ///
  gboolean function(GstBuffer* buffer, size_t offset, size_t size, uint* idx, uint* length, size_t* skip) c_gst_buffer_find_memory; ///
  gboolean function(GstBuffer* buffer, GstBufferForeachMetaFunc func, void* userData) c_gst_buffer_foreach_meta; ///
  GstMemory* function(GstBuffer* buffer) c_gst_buffer_get_all_memory; ///
  GstCustomMeta* function(GstBuffer* buffer, const(char)* name) c_gst_buffer_get_custom_meta; ///
  GstBufferFlags function(GstBuffer* buffer) c_gst_buffer_get_flags; ///
  GstMemory* function(GstBuffer* buffer, uint idx) c_gst_buffer_get_memory; ///
  GstMemory* function(GstBuffer* buffer, uint idx, int length) c_gst_buffer_get_memory_range; ///
  GstMeta* function(GstBuffer* buffer, GType api) c_gst_buffer_get_meta; ///
  uint function(GstBuffer* buffer, GType apiType) c_gst_buffer_get_n_meta; ///
  GstReferenceTimestampMeta* function(GstBuffer* buffer, GstCaps* reference) c_gst_buffer_get_reference_timestamp_meta; ///
  size_t function(GstBuffer* buffer) c_gst_buffer_get_size; ///
  size_t function(GstBuffer* buffer, size_t* offset, size_t* maxsize) c_gst_buffer_get_sizes; ///
  size_t function(GstBuffer* buffer, uint idx, int length, size_t* offset, size_t* maxsize) c_gst_buffer_get_sizes_range; ///
  gboolean function(GstBuffer* buffer, GstBufferFlags flags) c_gst_buffer_has_flags; ///
  void function(GstBuffer* buffer, int idx, GstMemory* mem) c_gst_buffer_insert_memory; ///
  gboolean function(GstBuffer* buffer) c_gst_buffer_is_all_memory_writable; ///
  gboolean function(GstBuffer* buffer, uint idx, int length) c_gst_buffer_is_memory_range_writable; ///
  GstMeta* function(GstBuffer* buffer, void** state) c_gst_buffer_iterate_meta; ///
  GstMeta* function(GstBuffer* buffer, void** state, GType metaApiType) c_gst_buffer_iterate_meta_filtered; ///
  gboolean function(GstBuffer* buffer, GstMapInfo* info, GstMapFlags flags) c_gst_buffer_map; ///
  gboolean function(GstBuffer* buffer, uint idx, int length, GstMapInfo* info, GstMapFlags flags) c_gst_buffer_map_range; ///
  int function(GstBuffer* buffer, size_t offset, const(void)* mem, size_t size) c_gst_buffer_memcmp; ///
  size_t function(GstBuffer* buffer, size_t offset, ubyte val, size_t size) c_gst_buffer_memset; ///
  uint function(GstBuffer* buffer) c_gst_buffer_n_memory; ///
  GstMemory* function(GstBuffer* buffer, uint idx) c_gst_buffer_peek_memory; ///
  void function(GstBuffer* buffer, GstMemory* mem) c_gst_buffer_prepend_memory; ///
  void function(GstBuffer* buffer) c_gst_buffer_remove_all_memory; ///
  void function(GstBuffer* buffer, uint idx) c_gst_buffer_remove_memory; ///
  void function(GstBuffer* buffer, uint idx, int length) c_gst_buffer_remove_memory_range; ///
  gboolean function(GstBuffer* buffer, GstMeta* meta) c_gst_buffer_remove_meta; ///
  void function(GstBuffer* buffer, GstMemory* mem) c_gst_buffer_replace_all_memory; ///
  void function(GstBuffer* buffer, uint idx, GstMemory* mem) c_gst_buffer_replace_memory; ///
  void function(GstBuffer* buffer, uint idx, int length, GstMemory* mem) c_gst_buffer_replace_memory_range; ///
  void function(GstBuffer* buffer, ptrdiff_t offset, ptrdiff_t size) c_gst_buffer_resize; ///
  gboolean function(GstBuffer* buffer, uint idx, int length, ptrdiff_t offset, ptrdiff_t size) c_gst_buffer_resize_range; ///
  gboolean function(GstBuffer* buffer, GstBufferFlags flags) c_gst_buffer_set_flags; ///
  void function(GstBuffer* buffer, ptrdiff_t size) c_gst_buffer_set_size; ///
  void function(GstBuffer* buffer, GstMapInfo* info) c_gst_buffer_unmap; ///
  gboolean function(GstBuffer* buffer, GstBufferFlags flags) c_gst_buffer_unset_flags; ///
  uint function() c_gst_buffer_get_max_memory; ///

  // BufferList
  GType function() c_gst_buffer_list_get_type; ///
  GstBufferList* function() c_gst_buffer_list_new; ///
  GstBufferList* function(uint size) c_gst_buffer_list_new_sized; ///
  size_t function(GstBufferList* list) c_gst_buffer_list_calculate_size; ///
  GstBufferList* function(const(GstBufferList)* list) c_gst_buffer_list_copy_deep; ///
  gboolean function(GstBufferList* list, GstBufferListFunc func, void* userData) c_gst_buffer_list_foreach; ///
  GstBuffer* function(GstBufferList* list, uint idx) c_gst_buffer_list_get; ///
  GstBuffer* function(GstBufferList* list, uint idx) c_gst_buffer_list_get_writable; ///
  void function(GstBufferList* list, int idx, GstBuffer* buffer) c_gst_buffer_list_insert; ///
  uint function(GstBufferList* list) c_gst_buffer_list_length; ///
  void function(GstBufferList* list, uint idx, uint length) c_gst_buffer_list_remove; ///

  // BufferPool
  GType function() c_gst_buffer_pool_get_type; ///
  GstBufferPool* function() c_gst_buffer_pool_new; ///
  void function(GstStructure* config, const(char)* option) c_gst_buffer_pool_config_add_option; ///
  gboolean function(GstStructure* config, GstAllocator** allocator, GstAllocationParams* params) c_gst_buffer_pool_config_get_allocator; ///
  const(char)* function(GstStructure* config, uint index) c_gst_buffer_pool_config_get_option; ///
  gboolean function(GstStructure* config, GstCaps** caps, uint* size, uint* minBuffers, uint* maxBuffers) c_gst_buffer_pool_config_get_params; ///
  gboolean function(GstStructure* config, const(char)* option) c_gst_buffer_pool_config_has_option; ///
  uint function(GstStructure* config) c_gst_buffer_pool_config_n_options; ///
  void function(GstStructure* config, GstAllocator* allocator, const(GstAllocationParams)* params) c_gst_buffer_pool_config_set_allocator; ///
  void function(GstStructure* config, GstCaps* caps, uint size, uint minBuffers, uint maxBuffers) c_gst_buffer_pool_config_set_params; ///
  gboolean function(GstStructure* config, GstCaps* caps, uint size, uint minBuffers, uint maxBuffers) c_gst_buffer_pool_config_validate_params; ///
  GstFlowReturn function(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) c_gst_buffer_pool_acquire_buffer; ///
  GstStructure* function(GstBufferPool* pool) c_gst_buffer_pool_get_config; ///
  const(char*)* function(GstBufferPool* pool) c_gst_buffer_pool_get_options; ///
  gboolean function(GstBufferPool* pool, const(char)* option) c_gst_buffer_pool_has_option; ///
  gboolean function(GstBufferPool* pool) c_gst_buffer_pool_is_active; ///
  void function(GstBufferPool* pool, GstBuffer* buffer) c_gst_buffer_pool_release_buffer; ///
  gboolean function(GstBufferPool* pool, gboolean active) c_gst_buffer_pool_set_active; ///
  gboolean function(GstBufferPool* pool, GstStructure* config) c_gst_buffer_pool_set_config; ///
  void function(GstBufferPool* pool, gboolean flushing) c_gst_buffer_pool_set_flushing; ///

  // Bus
  GType function() c_gst_bus_get_type; ///
  GstBus* function() c_gst_bus_new; ///
  void function(GstBus* bus) c_gst_bus_add_signal_watch; ///
  void function(GstBus* bus, int priority) c_gst_bus_add_signal_watch_full; ///
  uint function(GstBus* bus, GstBusFunc func, void* userData) c_gst_bus_add_watch; ///
  uint function(GstBus* bus, int priority, GstBusFunc func, void* userData, GDestroyNotify notify) c_gst_bus_add_watch_full; ///
  gboolean function(GstBus* bus, GstMessage* message, void* data) c_gst_bus_async_signal_func; ///
  GSource* function(GstBus* bus) c_gst_bus_create_watch; ///
  void function(GstBus* bus) c_gst_bus_disable_sync_message_emission; ///
  void function(GstBus* bus) c_gst_bus_enable_sync_message_emission; ///
  void function(GstBus* bus, GPollFD* fd) c_gst_bus_get_pollfd; ///
  gboolean function(GstBus* bus) c_gst_bus_have_pending; ///
  GstMessage* function(GstBus* bus) c_gst_bus_peek; ///
  GstMessage* function(GstBus* bus, GstMessageType events, GstClockTime timeout) c_gst_bus_poll; ///
  GstMessage* function(GstBus* bus) c_gst_bus_pop; ///
  GstMessage* function(GstBus* bus, GstMessageType types) c_gst_bus_pop_filtered; ///
  gboolean function(GstBus* bus, GstMessage* message) c_gst_bus_post; ///
  void function(GstBus* bus) c_gst_bus_remove_signal_watch; ///
  gboolean function(GstBus* bus) c_gst_bus_remove_watch; ///
  void function(GstBus* bus, gboolean flushing) c_gst_bus_set_flushing; ///
  void function(GstBus* bus, GstBusSyncHandler func, void* userData, GDestroyNotify notify) c_gst_bus_set_sync_handler; ///
  GstBusSyncReply function(GstBus* bus, GstMessage* message, void* data) c_gst_bus_sync_signal_handler; ///
  GstMessage* function(GstBus* bus, GstClockTime timeout) c_gst_bus_timed_pop; ///
  GstMessage* function(GstBus* bus, GstClockTime timeout, GstMessageType types) c_gst_bus_timed_pop_filtered; ///

  // Caps
  GType function() c_gst_caps_get_type; ///
  GstCaps* function() c_gst_caps_new_any; ///
  GstCaps* function() c_gst_caps_new_empty; ///
  GstCaps* function(const(char)* mediaType) c_gst_caps_new_empty_simple; ///
  GstCaps* function(GstStructure* struct1,  ...) c_gst_caps_new_full; ///
  GstCaps* function(GstStructure* structure, void* varArgs) c_gst_caps_new_full_valist; ///
  GstCaps* function(const(char)* mediaType, const(char)* fieldname,  ...) c_gst_caps_new_simple; ///
  void function(GstCaps* caps1, GstCaps* caps2) c_gst_caps_append; ///
  void function(GstCaps* caps, GstStructure* structure) c_gst_caps_append_structure; ///
  void function(GstCaps* caps, GstStructure* structure, GstCapsFeatures* features) c_gst_caps_append_structure_full; ///
  gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) c_gst_caps_can_intersect; ///
  GstCaps* function(const(GstCaps)* caps) c_gst_caps_copy; ///
  GstCaps* function(const(GstCaps)* caps, uint nth) c_gst_caps_copy_nth; ///
  void function(GstCaps* caps, GstCapsFilterMapFunc func, void* userData) c_gst_caps_filter_and_map_in_place; ///
  GstCaps* function(GstCaps* caps) c_gst_caps_fixate; ///
  gboolean function(const(GstCaps)* caps, GstCapsForeachFunc func, void* userData) c_gst_caps_foreach; ///
  GstCapsFeatures* function(const(GstCaps)* caps, uint index) c_gst_caps_get_features; ///
  uint function(const(GstCaps)* caps) c_gst_caps_get_size; ///
  GstStructure* function(const(GstCaps)* caps, uint index) c_gst_caps_get_structure; ///
  GstCaps* function(GstCaps* caps1, GstCaps* caps2) c_gst_caps_intersect; ///
  GstCaps* function(GstCaps* caps1, GstCaps* caps2, GstCapsIntersectMode mode) c_gst_caps_intersect_full; ///
  gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) c_gst_caps_is_always_compatible; ///
  gboolean function(const(GstCaps)* caps) c_gst_caps_is_any; ///
  gboolean function(const(GstCaps)* caps) c_gst_caps_is_empty; ///
  gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) c_gst_caps_is_equal; ///
  gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) c_gst_caps_is_equal_fixed; ///
  gboolean function(const(GstCaps)* caps) c_gst_caps_is_fixed; ///
  gboolean function(const(GstCaps)* caps1, const(GstCaps)* caps2) c_gst_caps_is_strictly_equal; ///
  gboolean function(const(GstCaps)* subset, const(GstCaps)* superset) c_gst_caps_is_subset; ///
  gboolean function(const(GstCaps)* caps, const(GstStructure)* structure) c_gst_caps_is_subset_structure; ///
  gboolean function(const(GstCaps)* caps, const(GstStructure)* structure, const(GstCapsFeatures)* features) c_gst_caps_is_subset_structure_full; ///
  gboolean function(GstCaps* caps, GstCapsMapFunc func, void* userData) c_gst_caps_map_in_place; ///
  GstCaps* function(GstCaps* caps1, GstCaps* caps2) c_gst_caps_merge; ///
  GstCaps* function(GstCaps* caps, GstStructure* structure) c_gst_caps_merge_structure; ///
  GstCaps* function(GstCaps* caps, GstStructure* structure, GstCapsFeatures* features) c_gst_caps_merge_structure_full; ///
  GstCaps* function(GstCaps* caps) c_gst_caps_normalize; ///
  void function(GstCaps* caps, uint idx) c_gst_caps_remove_structure; ///
  char* function(const(GstCaps)* caps, GstSerializeFlags flags) c_gst_caps_serialize; ///
  void function(GstCaps* caps, uint index, GstCapsFeatures* features) c_gst_caps_set_features; ///
  void function(GstCaps* caps, GstCapsFeatures* features) c_gst_caps_set_features_simple; ///
  void function(GstCaps* caps, const(char)* field,  ...) c_gst_caps_set_simple; ///
  void function(GstCaps* caps, const(char)* field, void* varargs) c_gst_caps_set_simple_valist; ///
  void function(GstCaps* caps, const(char)* field, const(GValue)* value) c_gst_caps_set_value; ///
  GstCaps* function(GstCaps* caps) c_gst_caps_simplify; ///
  GstStructure* function(GstCaps* caps, uint index) c_gst_caps_steal_structure; ///
  GstCaps* function(GstCaps* minuend, GstCaps* subtrahend) c_gst_caps_subtract; ///
  char* function(const(GstCaps)* caps) c_gst_caps_to_string; ///
  GstCaps* function(GstCaps* caps) c_gst_caps_truncate; ///
  GstCaps* function(const(char)* string_) c_gst_caps_from_string; ///

  // CapsFeatures
  GType function() c_gst_caps_features_get_type; ///
  GstCapsFeatures* function(const(char)* feature1,  ...) c_gst_caps_features_new; ///
  GstCapsFeatures* function() c_gst_caps_features_new_any; ///
  GstCapsFeatures* function() c_gst_caps_features_new_empty; ///
  GstCapsFeatures* function(GQuark feature1,  ...) c_gst_caps_features_new_id; ///
  GstCapsFeatures* function(GQuark feature1, void* varargs) c_gst_caps_features_new_id_valist; ///
  GstCapsFeatures* function(const(char)* feature) c_gst_caps_features_new_single; ///
  GstCapsFeatures* function(const(char)* feature1, void* varargs) c_gst_caps_features_new_valist; ///
  void function(GstCapsFeatures* features, const(char)* feature) c_gst_caps_features_add; ///
  void function(GstCapsFeatures* features, GQuark feature) c_gst_caps_features_add_id; ///
  gboolean function(const(GstCapsFeatures)* features, const(char)* feature) c_gst_caps_features_contains; ///
  gboolean function(const(GstCapsFeatures)* features, GQuark feature) c_gst_caps_features_contains_id; ///
  GstCapsFeatures* function(const(GstCapsFeatures)* features) c_gst_caps_features_copy; ///
  void function(GstCapsFeatures* features) c_gst_caps_features_free; ///
  const(char)* function(const(GstCapsFeatures)* features, uint i) c_gst_caps_features_get_nth; ///
  GQuark function(const(GstCapsFeatures)* features, uint i) c_gst_caps_features_get_nth_id; ///
  uint function(const(GstCapsFeatures)* features) c_gst_caps_features_get_size; ///
  gboolean function(const(GstCapsFeatures)* features) c_gst_caps_features_is_any; ///
  gboolean function(const(GstCapsFeatures)* features1, const(GstCapsFeatures)* features2) c_gst_caps_features_is_equal; ///
  void function(GstCapsFeatures* features, const(char)* feature) c_gst_caps_features_remove; ///
  void function(GstCapsFeatures* features, GQuark feature) c_gst_caps_features_remove_id; ///
  gboolean function(GstCapsFeatures* features, int* refcount) c_gst_caps_features_set_parent_refcount; ///
  char* function(const(GstCapsFeatures)* features) c_gst_caps_features_to_string; ///
  GstCapsFeatures* function(const(char)* features) c_gst_caps_features_from_string; ///

  // ChildProxy
  GType function() c_gst_child_proxy_get_type; ///
  void function(GstChildProxy* parent, GObject* child, const(char)* name) c_gst_child_proxy_child_added; ///
  void function(GstChildProxy* parent, GObject* child, const(char)* name) c_gst_child_proxy_child_removed; ///
  void function(GstChildProxy* object, const(char)* firstPropertyName,  ...) c_gst_child_proxy_get; ///
  GObject* function(GstChildProxy* parent, uint index) c_gst_child_proxy_get_child_by_index; ///
  GObject* function(GstChildProxy* parent, const(char)* name) c_gst_child_proxy_get_child_by_name; ///
  GObject* function(GstChildProxy* childProxy, const(char)* name) c_gst_child_proxy_get_child_by_name_recurse; ///
  uint function(GstChildProxy* parent) c_gst_child_proxy_get_children_count; ///
  void function(GstChildProxy* object, const(char)* name, GValue* value) c_gst_child_proxy_get_property; ///
  void function(GstChildProxy* object, const(char)* firstPropertyName, void* varArgs) c_gst_child_proxy_get_valist; ///
  gboolean function(GstChildProxy* object, const(char)* name, GObject** target, GParamSpec** pspec) c_gst_child_proxy_lookup; ///
  void function(GstChildProxy* object, const(char)* firstPropertyName,  ...) c_gst_child_proxy_set; ///
  void function(GstChildProxy* object, const(char)* name, const(GValue)* value) c_gst_child_proxy_set_property; ///
  void function(GstChildProxy* object, const(char)* firstPropertyName, void* varArgs) c_gst_child_proxy_set_valist; ///

  // Clock
  GType function() c_gst_clock_get_type; ///
  int function(const(void)* id1, const(void)* id2) c_gst_clock_id_compare_func; ///
  GstClock* function(GstClockID id) c_gst_clock_id_get_clock; ///
  GstClockTime function(GstClockID id) c_gst_clock_id_get_time; ///
  GstClockID function(GstClockID id) c_gst_clock_id_ref; ///
  void function(GstClockID id) c_gst_clock_id_unref; ///
  void function(GstClockID id) c_gst_clock_id_unschedule; ///
  gboolean function(GstClockID id, GstClock* clock) c_gst_clock_id_uses_clock; ///
  GstClockReturn function(GstClockID id, GstClockTimeDiff* jitter) c_gst_clock_id_wait; ///
  GstClockReturn function(GstClockID id, GstClockCallback func, void* userData, GDestroyNotify destroyData) c_gst_clock_id_wait_async; ///
  gboolean function(GstClock* clock, GstClockTime slave, GstClockTime master, double* rSquared) c_gst_clock_add_observation; ///
  gboolean function(GstClock* clock, GstClockTime slave, GstClockTime master, double* rSquared, GstClockTime* internal, GstClockTime* external, GstClockTime* rateNum, GstClockTime* rateDenom) c_gst_clock_add_observation_unapplied; ///
  GstClockTime function(GstClock* clock, GstClockTime internal) c_gst_clock_adjust_unlocked; ///
  GstClockTime function(GstClock* clock, GstClockTime internalTarget, GstClockTime cinternal, GstClockTime cexternal, GstClockTime cnum, GstClockTime cdenom) c_gst_clock_adjust_with_calibration; ///
  void function(GstClock* clock, GstClockTime* internal, GstClockTime* external, GstClockTime* rateNum, GstClockTime* rateDenom) c_gst_clock_get_calibration; ///
  GstClockTime function(GstClock* clock) c_gst_clock_get_internal_time; ///
  GstClock* function(GstClock* clock) c_gst_clock_get_master; ///
  GstClockTime function(GstClock* clock) c_gst_clock_get_resolution; ///
  GstClockTime function(GstClock* clock) c_gst_clock_get_time; ///
  GstClockTime function(GstClock* clock) c_gst_clock_get_timeout; ///
  gboolean function(GstClock* clock) c_gst_clock_is_synced; ///
  GstClockID function(GstClock* clock, GstClockTime startTime, GstClockTime interval) c_gst_clock_new_periodic_id; ///
  GstClockID function(GstClock* clock, GstClockTime time) c_gst_clock_new_single_shot_id; ///
  gboolean function(GstClock* clock, GstClockID id, GstClockTime startTime, GstClockTime interval) c_gst_clock_periodic_id_reinit; ///
  void function(GstClock* clock, GstClockTime internal, GstClockTime external, GstClockTime rateNum, GstClockTime rateDenom) c_gst_clock_set_calibration; ///
  gboolean function(GstClock* clock, GstClock* master) c_gst_clock_set_master; ///
  GstClockTime function(GstClock* clock, GstClockTime resolution) c_gst_clock_set_resolution; ///
  void function(GstClock* clock, gboolean synced) c_gst_clock_set_synced; ///
  void function(GstClock* clock, GstClockTime timeout) c_gst_clock_set_timeout; ///
  gboolean function(GstClock* clock, GstClockID id, GstClockTime time) c_gst_clock_single_shot_id_reinit; ///
  GstClockTime function(GstClock* clock, GstClockTime external) c_gst_clock_unadjust_unlocked; ///
  GstClockTime function(GstClock* clock, GstClockTime externalTarget, GstClockTime cinternal, GstClockTime cexternal, GstClockTime cnum, GstClockTime cdenom) c_gst_clock_unadjust_with_calibration; ///
  gboolean function(GstClock* clock, GstClockTime timeout) c_gst_clock_wait_for_sync; ///

  // Context
  GType function() c_gst_context_get_type; ///
  GstContext* function(const(char)* contextType, gboolean persistent) c_gst_context_new; ///
  const(char)* function(const(GstContext)* context) c_gst_context_get_context_type; ///
  const(GstStructure)* function(const(GstContext)* context) c_gst_context_get_structure; ///
  gboolean function(const(GstContext)* context, const(char)* contextType) c_gst_context_has_context_type; ///
  gboolean function(const(GstContext)* context) c_gst_context_is_persistent; ///
  GstStructure* function(GstContext* context) c_gst_context_writable_structure; ///

  // ControlBinding
  GType function() c_gst_control_binding_get_type; ///
  gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) c_gst_control_binding_get_g_value_array; ///
  GValue* function(GstControlBinding* binding, GstClockTime timestamp) c_gst_control_binding_get_value; ///
  gboolean function(GstControlBinding* binding, GstClockTime timestamp, GstClockTime interval, uint nValues, void* values) c_gst_control_binding_get_value_array; ///
  gboolean function(GstControlBinding* binding) c_gst_control_binding_is_disabled; ///
  void function(GstControlBinding* binding, gboolean disabled) c_gst_control_binding_set_disabled; ///
  gboolean function(GstControlBinding* binding, GstObject* object, GstClockTime timestamp, GstClockTime lastSync) c_gst_control_binding_sync_values; ///

  // ControlSource
  GType function() c_gst_control_source_get_type; ///
  gboolean function(GstControlSource* self, GstClockTime timestamp, double* value) c_gst_control_source_get_value; ///
  gboolean function(GstControlSource* self, GstClockTime timestamp, GstClockTime interval, uint nValues, double* values) c_gst_control_source_get_value_array; ///

  // CustomMeta
  GstStructure* function(GstCustomMeta* meta) c_gst_custom_meta_get_structure; ///
  gboolean function(GstCustomMeta* meta, const(char)* name) c_gst_custom_meta_has_name; ///

  // DateTime
  GType function() c_gst_date_time_get_type; ///
  GstDateTime* function(float tzoffset, int year, int month, int day, int hour, int minute, double seconds) c_gst_date_time_new; ///
  GstDateTime* function(GDateTime* dt) c_gst_date_time_new_from_g_date_time; ///
  GstDateTime* function(const(char)* string_) c_gst_date_time_new_from_iso8601_string; ///
  GstDateTime* function(long secs) c_gst_date_time_new_from_unix_epoch_local_time; ///
  GstDateTime* function(long usecs) c_gst_date_time_new_from_unix_epoch_local_time_usecs; ///
  GstDateTime* function(long secs) c_gst_date_time_new_from_unix_epoch_utc; ///
  GstDateTime* function(long usecs) c_gst_date_time_new_from_unix_epoch_utc_usecs; ///
  GstDateTime* function(int year, int month, int day, int hour, int minute, double seconds) c_gst_date_time_new_local_time; ///
  GstDateTime* function() c_gst_date_time_new_now_local_time; ///
  GstDateTime* function() c_gst_date_time_new_now_utc; ///
  GstDateTime* function(int year) c_gst_date_time_new_y; ///
  GstDateTime* function(int year, int month) c_gst_date_time_new_ym; ///
  GstDateTime* function(int year, int month, int day) c_gst_date_time_new_ymd; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_day; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_hour; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_microsecond; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_minute; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_month; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_second; ///
  float function(const(GstDateTime)* datetime) c_gst_date_time_get_time_zone_offset; ///
  int function(const(GstDateTime)* datetime) c_gst_date_time_get_year; ///
  gboolean function(const(GstDateTime)* datetime) c_gst_date_time_has_day; ///
  gboolean function(const(GstDateTime)* datetime) c_gst_date_time_has_month; ///
  gboolean function(const(GstDateTime)* datetime) c_gst_date_time_has_second; ///
  gboolean function(const(GstDateTime)* datetime) c_gst_date_time_has_time; ///
  gboolean function(const(GstDateTime)* datetime) c_gst_date_time_has_year; ///
  GstDateTime* function(GstDateTime* datetime) c_gst_date_time_ref; ///
  GDateTime* function(GstDateTime* datetime) c_gst_date_time_to_g_date_time; ///
  char* function(GstDateTime* datetime) c_gst_date_time_to_iso8601_string; ///
  void function(GstDateTime* datetime) c_gst_date_time_unref; ///

  // DebugCategory
  void function(GstDebugCategory* category) c_gst_debug_category_free; ///
  uint function(GstDebugCategory* category) c_gst_debug_category_get_color; ///
  const(char)* function(GstDebugCategory* category) c_gst_debug_category_get_description; ///
  const(char)* function(GstDebugCategory* category) c_gst_debug_category_get_name; ///
  GstDebugLevel function(GstDebugCategory* category) c_gst_debug_category_get_threshold; ///
  void function(GstDebugCategory* category) c_gst_debug_category_reset_threshold; ///
  void function(GstDebugCategory* category, GstDebugLevel level) c_gst_debug_category_set_threshold; ///

  // DebugMessage
  const(char)* function(GstDebugMessage* message) c_gst_debug_message_get; ///
  const(char)* function(GstDebugMessage* message) c_gst_debug_message_get_id; ///

  // Device
  GType function() c_gst_device_get_type; ///
  GstElement* function(GstDevice* device, const(char)* name) c_gst_device_create_element; ///
  GstCaps* function(GstDevice* device) c_gst_device_get_caps; ///
  char* function(GstDevice* device) c_gst_device_get_device_class; ///
  char* function(GstDevice* device) c_gst_device_get_display_name; ///
  GstStructure* function(GstDevice* device) c_gst_device_get_properties; ///
  gboolean function(GstDevice* device, const(char)* classes) c_gst_device_has_classes; ///
  gboolean function(GstDevice* device, char** classes) c_gst_device_has_classesv; ///
  gboolean function(GstDevice* device, GstElement* element) c_gst_device_reconfigure_element; ///

  // DeviceMonitor
  GType function() c_gst_device_monitor_get_type; ///
  GstDeviceMonitor* function() c_gst_device_monitor_new; ///
  uint function(GstDeviceMonitor* monitor, const(char)* classes, GstCaps* caps) c_gst_device_monitor_add_filter; ///
  GstBus* function(GstDeviceMonitor* monitor) c_gst_device_monitor_get_bus; ///
  GList* function(GstDeviceMonitor* monitor) c_gst_device_monitor_get_devices; ///
  char** function(GstDeviceMonitor* monitor) c_gst_device_monitor_get_providers; ///
  gboolean function(GstDeviceMonitor* monitor) c_gst_device_monitor_get_show_all_devices; ///
  gboolean function(GstDeviceMonitor* monitor, uint filterId) c_gst_device_monitor_remove_filter; ///
  void function(GstDeviceMonitor* monitor, gboolean showAll) c_gst_device_monitor_set_show_all_devices; ///
  gboolean function(GstDeviceMonitor* monitor) c_gst_device_monitor_start; ///
  void function(GstDeviceMonitor* monitor) c_gst_device_monitor_stop; ///

  // DeviceProvider
  GType function() c_gst_device_provider_get_type; ///
  gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GType type) c_gst_device_provider_register; ///
  gboolean function(GstDeviceProvider* provider) c_gst_device_provider_can_monitor; ///
  void function(GstDeviceProvider* provider, GstDevice* device) c_gst_device_provider_device_add; ///
  void function(GstDeviceProvider* provider, GstDevice* device, GstDevice* changedDevice) c_gst_device_provider_device_changed; ///
  void function(GstDeviceProvider* provider, GstDevice* device) c_gst_device_provider_device_remove; ///
  GstBus* function(GstDeviceProvider* provider) c_gst_device_provider_get_bus; ///
  GList* function(GstDeviceProvider* provider) c_gst_device_provider_get_devices; ///
  GstDeviceProviderFactory* function(GstDeviceProvider* provider) c_gst_device_provider_get_factory; ///
  char** function(GstDeviceProvider* provider) c_gst_device_provider_get_hidden_providers; ///
  const(char)* function(GstDeviceProvider* provider, const(char)* key) c_gst_device_provider_get_metadata; ///
  void function(GstDeviceProvider* provider, const(char)* name) c_gst_device_provider_hide_provider; ///
  gboolean function(GstDeviceProvider* provider) c_gst_device_provider_is_started; ///
  gboolean function(GstDeviceProvider* provider) c_gst_device_provider_start; ///
  void function(GstDeviceProvider* provider) c_gst_device_provider_stop; ///
  void function(GstDeviceProvider* provider, const(char)* name) c_gst_device_provider_unhide_provider; ///

  // DeviceProviderClass
  void function(GstDeviceProviderClass* klass, const(char)* key, const(char)* value) c_gst_device_provider_class_add_metadata; ///
  void function(GstDeviceProviderClass* klass, const(char)* key, const(char)* value) c_gst_device_provider_class_add_static_metadata; ///
  const(char)* function(GstDeviceProviderClass* klass, const(char)* key) c_gst_device_provider_class_get_metadata; ///
  void function(GstDeviceProviderClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) c_gst_device_provider_class_set_metadata; ///
  void function(GstDeviceProviderClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) c_gst_device_provider_class_set_static_metadata; ///

  // DeviceProviderFactory
  GType function() c_gst_device_provider_factory_get_type; ///
  GstDeviceProviderFactory* function(const(char)* name) c_gst_device_provider_factory_find; ///
  GstDeviceProvider* function(const(char)* factoryname) c_gst_device_provider_factory_get_by_name; ///
  GList* function(GstRank minrank) c_gst_device_provider_factory_list_get_device_providers; ///
  GstDeviceProvider* function(GstDeviceProviderFactory* factory) c_gst_device_provider_factory_get; ///
  GType function(GstDeviceProviderFactory* factory) c_gst_device_provider_factory_get_device_provider_type; ///
  const(char)* function(GstDeviceProviderFactory* factory, const(char)* key) c_gst_device_provider_factory_get_metadata; ///
  char** function(GstDeviceProviderFactory* factory) c_gst_device_provider_factory_get_metadata_keys; ///
  gboolean function(GstDeviceProviderFactory* factory, const(char)* classes) c_gst_device_provider_factory_has_classes; ///
  gboolean function(GstDeviceProviderFactory* factory, char** classes) c_gst_device_provider_factory_has_classesv; ///

  // DoubleRange
  GType function() c_gst_double_range_get_type; ///

  // DynamicTypeFactory
  GType function() c_gst_dynamic_type_factory_get_type; ///
  GType function(const(char)* factoryname) c_gst_dynamic_type_factory_load; ///

  // Element
  GType function() c_gst_element_get_type; ///
  GstElement* function(GstURIType type, const(char)* uri, const(char)* elementname, GError** _err) c_gst_element_make_from_uri; ///
  gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GType type) c_gst_element_register; ///
  const(char)* function(GstStateChangeReturn stateRet) c_gst_element_state_change_return_get_name; ///
  const(char)* function(GstState state) c_gst_element_state_get_name; ///
  void function(GType type) c_gst_element_type_set_skip_documentation; ///
  void function(GstElement* element) c_gst_element_abort_state; ///
  gboolean function(GstElement* element, GstPad* pad) c_gst_element_add_pad; ///
  gulong function(GstElement* element, const(char)* propertyName, gboolean includeValue) c_gst_element_add_property_deep_notify_watch; ///
  gulong function(GstElement* element, const(char)* propertyName, gboolean includeValue) c_gst_element_add_property_notify_watch; ///
  void function(GstElement* element, GstElementCallAsyncFunc func, void* userData, GDestroyNotify destroyNotify) c_gst_element_call_async; ///
  GstStateChangeReturn function(GstElement* element, GstStateChange transition) c_gst_element_change_state; ///
  GstStateChangeReturn function(GstElement* element, GstStateChangeReturn ret) c_gst_element_continue_state; ///
  void function(GstElement* element) c_gst_element_create_all_pads; ///
  char* function(GstElement* element, const(char)* streamId) c_gst_element_decorate_stream_id; ///
  char* function(GstElement* element, const(char)* format,  ...) c_gst_element_decorate_stream_id_printf; ///
  char* function(GstElement* element, const(char)* format, void* varArgs) c_gst_element_decorate_stream_id_printf_valist; ///
  gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) c_gst_element_foreach_pad; ///
  gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) c_gst_element_foreach_sink_pad; ///
  gboolean function(GstElement* element, GstElementForeachPadFunc func, void* userData) c_gst_element_foreach_src_pad; ///
  GstClockTime function(GstElement* element) c_gst_element_get_base_time; ///
  GstBus* function(GstElement* element) c_gst_element_get_bus; ///
  GstClock* function(GstElement* element) c_gst_element_get_clock; ///
  GstPad* function(GstElement* element, GstPad* pad, GstCaps* caps) c_gst_element_get_compatible_pad; ///
  GstPadTemplate* function(GstElement* element, GstPadTemplate* compattempl) c_gst_element_get_compatible_pad_template; ///
  GstContext* function(GstElement* element, const(char)* contextType) c_gst_element_get_context; ///
  GstContext* function(GstElement* element, const(char)* contextType) c_gst_element_get_context_unlocked; ///
  GList* function(GstElement* element) c_gst_element_get_contexts; ///
  GstClockTime function(GstElement* element) c_gst_element_get_current_clock_time; ///
  GstClockTime function(GstElement* element) c_gst_element_get_current_running_time; ///
  GstElementFactory* function(GstElement* element) c_gst_element_get_factory; ///
  const(char)* function(GstElement* element, const(char)* key) c_gst_element_get_metadata; ///
  GstPadTemplate* function(GstElement* element, const(char)* name) c_gst_element_get_pad_template; ///
  GList* function(GstElement* element) c_gst_element_get_pad_template_list; ///
  GstPad* function(GstElement* element, const(char)* name) c_gst_element_get_request_pad; ///
  GstClockTime function(GstElement* element) c_gst_element_get_start_time; ///
  GstStateChangeReturn function(GstElement* element, GstState* state, GstState* pending, GstClockTime timeout) c_gst_element_get_state; ///
  GstPad* function(GstElement* element, const(char)* name) c_gst_element_get_static_pad; ///
  gboolean function(GstElement* element) c_gst_element_is_locked_state; ///
  GstIterator* function(GstElement* element) c_gst_element_iterate_pads; ///
  GstIterator* function(GstElement* element) c_gst_element_iterate_sink_pads; ///
  GstIterator* function(GstElement* element) c_gst_element_iterate_src_pads; ///
  gboolean function(GstElement* src, GstElement* dest) c_gst_element_link; ///
  gboolean function(GstElement* src, GstElement* dest, GstCaps* filter) c_gst_element_link_filtered; ///
  gboolean function(GstElement* element1, GstElement* element2,  ...) c_gst_element_link_many; ///
  gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname) c_gst_element_link_pads; ///
  gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname, GstCaps* filter) c_gst_element_link_pads_filtered; ///
  gboolean function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname, GstPadLinkCheck flags) c_gst_element_link_pads_full; ///
  void function(GstElement* element) c_gst_element_lost_state; ///
  void function(GstElement* element, GstMessageType type, GQuark domain, int code, char* text, char* debug_, const(char)* file, const(char)* function_, int line) c_gst_element_message_full; ///
  void function(GstElement* element, GstMessageType type, GQuark domain, int code, char* text, char* debug_, const(char)* file, const(char)* function_, int line, GstStructure* structure) c_gst_element_message_full_with_details; ///
  void function(GstElement* element) c_gst_element_no_more_pads; ///
  gboolean function(GstElement* element, GstMessage* message) c_gst_element_post_message; ///
  GstClock* function(GstElement* element) c_gst_element_provide_clock; ///
  gboolean function(GstElement* element, GstQuery* query) c_gst_element_query; ///
  gboolean function(GstElement* element, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) c_gst_element_query_convert; ///
  gboolean function(GstElement* element, GstFormat format, long* duration) c_gst_element_query_duration; ///
  gboolean function(GstElement* element, GstFormat format, long* cur) c_gst_element_query_position; ///
  void function(GstElement* element, GstPad* pad) c_gst_element_release_request_pad; ///
  gboolean function(GstElement* element, GstPad* pad) c_gst_element_remove_pad; ///
  void function(GstElement* element, gulong watchId) c_gst_element_remove_property_notify_watch; ///
  GstPad* function(GstElement* element, GstPadTemplate* templ, const(char)* name, const(GstCaps)* caps) c_gst_element_request_pad; ///
  GstPad* function(GstElement* element, const(char)* name) c_gst_element_request_pad_simple; ///
  gboolean function(GstElement* element, double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, long start, GstSeekType stopType, long stop) c_gst_element_seek; ///
  gboolean function(GstElement* element, GstFormat format, GstSeekFlags seekFlags, long seekPos) c_gst_element_seek_simple; ///
  gboolean function(GstElement* element, GstEvent* event) c_gst_element_send_event; ///
  void function(GstElement* element, GstClockTime time) c_gst_element_set_base_time; ///
  void function(GstElement* element, GstBus* bus) c_gst_element_set_bus; ///
  gboolean function(GstElement* element, GstClock* clock) c_gst_element_set_clock; ///
  void function(GstElement* element, GstContext* context) c_gst_element_set_context; ///
  gboolean function(GstElement* element, gboolean lockedState) c_gst_element_set_locked_state; ///
  void function(GstElement* element, GstClockTime time) c_gst_element_set_start_time; ///
  GstStateChangeReturn function(GstElement* element, GstState state) c_gst_element_set_state; ///
  gboolean function(GstElement* element) c_gst_element_sync_state_with_parent; ///
  void function(GstElement* src, GstElement* dest) c_gst_element_unlink; ///
  void function(GstElement* element1, GstElement* element2,  ...) c_gst_element_unlink_many; ///
  void function(GstElement* src, const(char)* srcpadname, GstElement* dest, const(char)* destpadname) c_gst_element_unlink_pads; ///

  // ElementClass
  void function(GstElementClass* klass, const(char)* key, const(char)* value) c_gst_element_class_add_metadata; ///
  void function(GstElementClass* klass, GstPadTemplate* templ) c_gst_element_class_add_pad_template; ///
  void function(GstElementClass* klass, const(char)* key, const(char)* value) c_gst_element_class_add_static_metadata; ///
  void function(GstElementClass* klass, GstStaticPadTemplate* staticTempl) c_gst_element_class_add_static_pad_template; ///
  void function(GstElementClass* klass, GstStaticPadTemplate* staticTempl, GType padType) c_gst_element_class_add_static_pad_template_with_gtype; ///
  const(char)* function(GstElementClass* klass, const(char)* key) c_gst_element_class_get_metadata; ///
  GstPadTemplate* function(GstElementClass* elementClass, const(char)* name) c_gst_element_class_get_pad_template; ///
  GList* function(GstElementClass* elementClass) c_gst_element_class_get_pad_template_list; ///
  void function(GstElementClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) c_gst_element_class_set_metadata; ///
  void function(GstElementClass* klass, const(char)* longname, const(char)* classification, const(char)* description, const(char)* author) c_gst_element_class_set_static_metadata; ///

  // ElementFactory
  GType function() c_gst_element_factory_get_type; ///
  GstElementFactory* function(const(char)* name) c_gst_element_factory_find; ///
  GList* function(GList* list, const(GstCaps)* caps, GstPadDirection direction, gboolean subsetonly) c_gst_element_factory_list_filter; ///
  GList* function(GstElementFactoryListType type, GstRank minrank) c_gst_element_factory_list_get_elements; ///
  GstElement* function(const(char)* factoryname, const(char)* name) c_gst_element_factory_make; ///
  GstElement* function(const(char)* factoryname, const(char)* first,  ...) c_gst_element_factory_make_full; ///
  GstElement* function(const(char)* factoryname, const(char)* first, void* properties) c_gst_element_factory_make_valist; ///
  GstElement* function(const(char)* factoryname, uint n, const(char*)* names, const(GValue)* values) c_gst_element_factory_make_with_properties; ///
  gboolean function(GstElementFactory* factory, const(GstCaps)* caps) c_gst_element_factory_can_sink_all_caps; ///
  gboolean function(GstElementFactory* factory, const(GstCaps)* caps) c_gst_element_factory_can_sink_any_caps; ///
  gboolean function(GstElementFactory* factory, const(GstCaps)* caps) c_gst_element_factory_can_src_all_caps; ///
  gboolean function(GstElementFactory* factory, const(GstCaps)* caps) c_gst_element_factory_can_src_any_caps; ///
  GstElement* function(GstElementFactory* factory, const(char)* name) c_gst_element_factory_create; ///
  GstElement* function(GstElementFactory* factory, const(char)* first,  ...) c_gst_element_factory_create_full; ///
  GstElement* function(GstElementFactory* factory, const(char)* first, void* properties) c_gst_element_factory_create_valist; ///
  GstElement* function(GstElementFactory* factory, uint n, const(char*)* names, const(GValue)* values) c_gst_element_factory_create_with_properties; ///
  GType function(GstElementFactory* factory) c_gst_element_factory_get_element_type; ///
  const(char)* function(GstElementFactory* factory, const(char)* key) c_gst_element_factory_get_metadata; ///
  char** function(GstElementFactory* factory) c_gst_element_factory_get_metadata_keys; ///
  uint function(GstElementFactory* factory) c_gst_element_factory_get_num_pad_templates; ///
  gboolean function(GstElementFactory* factory) c_gst_element_factory_get_skip_documentation; ///
  const(GList)* function(GstElementFactory* factory) c_gst_element_factory_get_static_pad_templates; ///
  const(char*)* function(GstElementFactory* factory) c_gst_element_factory_get_uri_protocols; ///
  GstURIType function(GstElementFactory* factory) c_gst_element_factory_get_uri_type; ///
  gboolean function(GstElementFactory* factory, const(char)* interfacename) c_gst_element_factory_has_interface; ///
  gboolean function(GstElementFactory* factory, GstElementFactoryListType type) c_gst_element_factory_list_is_type; ///

  // Event
  GType function() c_gst_event_get_type; ///
  GstEvent* function(GstFormat format, long minsize, long maxsize, gboolean async) c_gst_event_new_buffer_size; ///
  GstEvent* function(GstCaps* caps) c_gst_event_new_caps; ///
  GstEvent* function(GstEventType type, GstStructure* structure) c_gst_event_new_custom; ///
  GstEvent* function() c_gst_event_new_eos; ///
  GstEvent* function() c_gst_event_new_flush_start; ///
  GstEvent* function(gboolean resetTime) c_gst_event_new_flush_stop; ///
  GstEvent* function(GstClockTime timestamp, GstClockTime duration) c_gst_event_new_gap; ///
  GstEvent* function(double rateMultiplier, GstSegmentFlags newFlags) c_gst_event_new_instant_rate_change; ///
  GstEvent* function(double rateMultiplier, GstClockTime runningTime, GstClockTime upstreamRunningTime) c_gst_event_new_instant_rate_sync_time; ///
  GstEvent* function(GstClockTime latency) c_gst_event_new_latency; ///
  GstEvent* function(GstStructure* structure) c_gst_event_new_navigation; ///
  GstEvent* function(const(char)* systemId, GstBuffer* data, const(char)* origin) c_gst_event_new_protection; ///
  GstEvent* function(GstQOSType type, double proportion, GstClockTimeDiff diff, GstClockTime timestamp) c_gst_event_new_qos; ///
  GstEvent* function() c_gst_event_new_reconfigure; ///
  GstEvent* function(double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, long start, GstSeekType stopType, long stop) c_gst_event_new_seek; ///
  GstEvent* function(const(GstSegment)* segment) c_gst_event_new_segment; ///
  GstEvent* function(GstFormat format, long position) c_gst_event_new_segment_done; ///
  GstEvent* function(GList* streams) c_gst_event_new_select_streams; ///
  GstEvent* function(const(char)* name, GstMessage* msg) c_gst_event_new_sink_message; ///
  GstEvent* function(GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate) c_gst_event_new_step; ///
  GstEvent* function(GstStreamCollection* collection) c_gst_event_new_stream_collection; ///
  GstEvent* function(uint groupId) c_gst_event_new_stream_group_done; ///
  GstEvent* function(const(char)* streamId) c_gst_event_new_stream_start; ///
  GstEvent* function(GstTagList* taglist) c_gst_event_new_tag; ///
  GstEvent* function(GstToc* toc, gboolean updated) c_gst_event_new_toc; ///
  GstEvent* function(const(char)* uid) c_gst_event_new_toc_select; ///
  void function(GstEvent* event, GstSegment* segment) c_gst_event_copy_segment; ///
  long function(GstEvent* event) c_gst_event_get_running_time_offset; ///
  uint function(GstEvent* event) c_gst_event_get_seqnum; ///
  const(GstStructure)* function(GstEvent* event) c_gst_event_get_structure; ///
  gboolean function(GstEvent* event, const(char)* name) c_gst_event_has_name; ///
  gboolean function(GstEvent* event, GQuark name) c_gst_event_has_name_id; ///
  void function(GstEvent* event, GstFormat* format, long* minsize, long* maxsize, gboolean* async) c_gst_event_parse_buffer_size; ///
  void function(GstEvent* event, GstCaps** caps) c_gst_event_parse_caps; ///
  void function(GstEvent* event, gboolean* resetTime) c_gst_event_parse_flush_stop; ///
  void function(GstEvent* event, GstClockTime* timestamp, GstClockTime* duration) c_gst_event_parse_gap; ///
  void function(GstEvent* event, GstGapFlags* flags) c_gst_event_parse_gap_flags; ///
  gboolean function(GstEvent* event, uint* groupId) c_gst_event_parse_group_id; ///
  void function(GstEvent* event, double* rateMultiplier, GstSegmentFlags* newFlags) c_gst_event_parse_instant_rate_change; ///
  void function(GstEvent* event, double* rateMultiplier, GstClockTime* runningTime, GstClockTime* upstreamRunningTime) c_gst_event_parse_instant_rate_sync_time; ///
  void function(GstEvent* event, GstClockTime* latency) c_gst_event_parse_latency; ///
  void function(GstEvent* event, const(char*)* systemId, GstBuffer** data, const(char*)* origin) c_gst_event_parse_protection; ///
  void function(GstEvent* event, GstQOSType* type, double* proportion, GstClockTimeDiff* diff, GstClockTime* timestamp) c_gst_event_parse_qos; ///
  void function(GstEvent* event, double* rate, GstFormat* format, GstSeekFlags* flags, GstSeekType* startType, long* start, GstSeekType* stopType, long* stop) c_gst_event_parse_seek; ///
  void function(GstEvent* event, GstClockTime* interval) c_gst_event_parse_seek_trickmode_interval; ///
  void function(GstEvent* event, const(GstSegment*)* segment) c_gst_event_parse_segment; ///
  void function(GstEvent* event, GstFormat* format, long* position) c_gst_event_parse_segment_done; ///
  void function(GstEvent* event, GList** streams) c_gst_event_parse_select_streams; ///
  void function(GstEvent* event, GstMessage** msg) c_gst_event_parse_sink_message; ///
  void function(GstEvent* event, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate) c_gst_event_parse_step; ///
  void function(GstEvent* event, GstStream** stream) c_gst_event_parse_stream; ///
  void function(GstEvent* event, GstStreamCollection** collection) c_gst_event_parse_stream_collection; ///
  void function(GstEvent* event, GstStreamFlags* flags) c_gst_event_parse_stream_flags; ///
  void function(GstEvent* event, uint* groupId) c_gst_event_parse_stream_group_done; ///
  void function(GstEvent* event, const(char*)* streamId) c_gst_event_parse_stream_start; ///
  void function(GstEvent* event, GstTagList** taglist) c_gst_event_parse_tag; ///
  void function(GstEvent* event, GstToc** toc, gboolean* updated) c_gst_event_parse_toc; ///
  void function(GstEvent* event, char** uid) c_gst_event_parse_toc_select; ///
  void function(GstEvent* event, GstGapFlags flags) c_gst_event_set_gap_flags; ///
  void function(GstEvent* event, uint groupId) c_gst_event_set_group_id; ///
  void function(GstEvent* event, long offset) c_gst_event_set_running_time_offset; ///
  void function(GstEvent* event, GstClockTime interval) c_gst_event_set_seek_trickmode_interval; ///
  void function(GstEvent* event, uint seqnum) c_gst_event_set_seqnum; ///
  void function(GstEvent* event, GstStream* stream) c_gst_event_set_stream; ///
  void function(GstEvent* event, GstStreamFlags flags) c_gst_event_set_stream_flags; ///
  GstStructure* function(GstEvent* event) c_gst_event_writable_structure; ///

  // FlagSet
  GType function() c_gst_flagset_get_type; ///
  GType function(GType flagsType) c_gst_flagset_register; ///

  // Fraction
  GType function() c_gst_fraction_get_type; ///

  // FractionRange
  GType function() c_gst_fraction_range_get_type; ///

  // GhostPad
  GType function() c_gst_ghost_pad_get_type; ///
  GstPad* function(const(char)* name, GstPad* target) c_gst_ghost_pad_new; ///
  GstPad* function(const(char)* name, GstPad* target, GstPadTemplate* templ) c_gst_ghost_pad_new_from_template; ///
  GstPad* function(const(char)* name, GstPadDirection dir) c_gst_ghost_pad_new_no_target; ///
  GstPad* function(const(char)* name, GstPadTemplate* templ) c_gst_ghost_pad_new_no_target_from_template; ///
  gboolean function(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) c_gst_ghost_pad_activate_mode_default; ///
  gboolean function(GstPad* pad, GstObject* parent, GstPadMode mode, gboolean active) c_gst_ghost_pad_internal_activate_mode_default; ///
  gboolean function(GstGhostPad* gpad) c_gst_ghost_pad_construct; ///
  GstPad* function(GstGhostPad* gpad) c_gst_ghost_pad_get_target; ///
  gboolean function(GstGhostPad* gpad, GstPad* newtarget) c_gst_ghost_pad_set_target; ///

  // Int64Range
  GType function() c_gst_int64_range_get_type; ///

  // IntRange
  GType function() c_gst_int_range_get_type; ///

  // Iterator
  GType function() c_gst_iterator_get_type; ///
  GstIterator* function(uint size, GType type, GMutex* lock, uint* masterCookie, GstIteratorCopyFunction copy, GstIteratorNextFunction next, GstIteratorItemFunction item, GstIteratorResyncFunction resync, GstIteratorFreeFunction free) c_gst_iterator_new; ///
  GstIterator* function(GType type, GMutex* lock, uint* masterCookie, GList** list, GObject* owner, GstIteratorItemFunction item) c_gst_iterator_new_list; ///
  GstIterator* function(GType type, const(GValue)* object) c_gst_iterator_new_single; ///
  GstIterator* function(const(GstIterator)* it) c_gst_iterator_copy; ///
  GstIterator* function(GstIterator* it, GCompareFunc func, const(GValue)* userData) c_gst_iterator_filter; ///
  gboolean function(GstIterator* it, GCompareFunc func, GValue* elem, void* userData) c_gst_iterator_find_custom; ///
  GstIteratorResult function(GstIterator* it, GstIteratorFoldFunction func, GValue* ret, void* userData) c_gst_iterator_fold; ///
  GstIteratorResult function(GstIterator* it, GstIteratorForeachFunction func, void* userData) c_gst_iterator_foreach; ///
  void function(GstIterator* it) c_gst_iterator_free; ///
  GstIteratorResult function(GstIterator* it, GValue* elem) c_gst_iterator_next; ///
  void function(GstIterator* it, GstIterator* other) c_gst_iterator_push; ///
  void function(GstIterator* it) c_gst_iterator_resync; ///

  // Memory
  GType function() c_gst_memory_get_type; ///
  GstMemory* function(GstMemoryFlags flags, void* data, size_t maxsize, size_t offset, size_t size, void* userData, GDestroyNotify notify) c_gst_memory_new_wrapped; ///
  GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) c_gst_memory_copy; ///
  size_t function(GstMemory* mem, size_t* offset, size_t* maxsize) c_gst_memory_get_sizes; ///
  void function(GstMemory* mem, GstMemoryFlags flags, GstAllocator* allocator, GstMemory* parent, size_t maxsize, size_t align_, size_t offset, size_t size) c_gst_memory_init; ///
  gboolean function(GstMemory* mem1, GstMemory* mem2, size_t* offset) c_gst_memory_is_span; ///
  gboolean function(GstMemory* mem, const(char)* memType) c_gst_memory_is_type; ///
  GstMemory* function(GstMemory* mem, GstMapInfo* info, GstMapFlags flags) c_gst_memory_make_mapped; ///
  gboolean function(GstMemory* mem, GstMapInfo* info, GstMapFlags flags) c_gst_memory_map; ///
  void function(GstMemory* mem, ptrdiff_t offset, size_t size) c_gst_memory_resize; ///
  GstMemory* function(GstMemory* mem, ptrdiff_t offset, ptrdiff_t size) c_gst_memory_share; ///
  void function(GstMemory* mem, GstMapInfo* info) c_gst_memory_unmap; ///

  // Message
  GType function() c_gst_message_get_type; ///
  GstMessage* function(GstObject* src, GstStructure* structure) c_gst_message_new_application; ///
  GstMessage* function(GstObject* src, GstClockTime runningTime) c_gst_message_new_async_done; ///
  GstMessage* function(GstObject* src) c_gst_message_new_async_start; ///
  GstMessage* function(GstObject* src, int percent) c_gst_message_new_buffering; ///
  GstMessage* function(GstObject* src, GstClock* clock) c_gst_message_new_clock_lost; ///
  GstMessage* function(GstObject* src, GstClock* clock, gboolean ready) c_gst_message_new_clock_provide; ///
  GstMessage* function(GstMessageType type, GstObject* src, GstStructure* structure) c_gst_message_new_custom; ///
  GstMessage* function(GstObject* src, GstDevice* device) c_gst_message_new_device_added; ///
  GstMessage* function(GstObject* src, GstDevice* device, GstDevice* changedDevice) c_gst_message_new_device_changed; ///
  GstMessage* function(GstObject* src, GstDevice* device) c_gst_message_new_device_removed; ///
  GstMessage* function(GstObject* src) c_gst_message_new_duration_changed; ///
  GstMessage* function(GstObject* src, GstStructure* structure) c_gst_message_new_element; ///
  GstMessage* function(GstObject* src) c_gst_message_new_eos; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_) c_gst_message_new_error; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) c_gst_message_new_error_with_details; ///
  GstMessage* function(GstObject* src, GstContext* context) c_gst_message_new_have_context; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_) c_gst_message_new_info; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) c_gst_message_new_info_with_details; ///
  GstMessage* function(GstObject* src, double rateMultiplier) c_gst_message_new_instant_rate_request; ///
  GstMessage* function(GstObject* src) c_gst_message_new_latency; ///
  GstMessage* function(GstObject* src, const(char)* contextType) c_gst_message_new_need_context; ///
  GstMessage* function(GstObject* src, GstClock* clock) c_gst_message_new_new_clock; ///
  GstMessage* function(GstObject* src, GstProgressType type, const(char)* code, const(char)* text) c_gst_message_new_progress; ///
  GstMessage* function(GstObject* src, const(char)* propertyName, GValue* val) c_gst_message_new_property_notify; ///
  GstMessage* function(GstObject* src, gboolean live, ulong runningTime, ulong streamTime, ulong timestamp, ulong duration) c_gst_message_new_qos; ///
  GstMessage* function(GstObject* src, const(char)* location, GstTagList* tagList, const(GstStructure)* entryStruct) c_gst_message_new_redirect; ///
  GstMessage* function(GstObject* src, GstState state) c_gst_message_new_request_state; ///
  GstMessage* function(GstObject* src, GstClockTime runningTime) c_gst_message_new_reset_time; ///
  GstMessage* function(GstObject* src, GstFormat format, long position) c_gst_message_new_segment_done; ///
  GstMessage* function(GstObject* src, GstFormat format, long position) c_gst_message_new_segment_start; ///
  GstMessage* function(GstObject* src, GstState oldstate, GstState newstate, GstState pending) c_gst_message_new_state_changed; ///
  GstMessage* function(GstObject* src) c_gst_message_new_state_dirty; ///
  GstMessage* function(GstObject* src, GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate, ulong duration, gboolean eos) c_gst_message_new_step_done; ///
  GstMessage* function(GstObject* src, gboolean active, GstFormat format, ulong amount, double rate, gboolean flush, gboolean intermediate) c_gst_message_new_step_start; ///
  GstMessage* function(GstObject* src, GstStreamCollection* collection) c_gst_message_new_stream_collection; ///
  GstMessage* function(GstObject* src) c_gst_message_new_stream_start; ///
  GstMessage* function(GstObject* src, GstStreamStatusType type, GstElement* owner) c_gst_message_new_stream_status; ///
  GstMessage* function(GstObject* src, GstStreamCollection* collection) c_gst_message_new_streams_selected; ///
  GstMessage* function(GstObject* src, GstStructureChangeType type, GstElement* owner, gboolean busy) c_gst_message_new_structure_change; ///
  GstMessage* function(GstObject* src, GstTagList* tagList) c_gst_message_new_tag; ///
  GstMessage* function(GstObject* src, GstToc* toc, gboolean updated) c_gst_message_new_toc; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_) c_gst_message_new_warning; ///
  GstMessage* function(GstObject* src, GError* error, const(char)* debug_, GstStructure* details) c_gst_message_new_warning_with_details; ///
  void function(GstMessage* message, const(char)* location, GstTagList* tagList, const(GstStructure)* entryStruct) c_gst_message_add_redirect_entry; ///
  GstMessage* function(const(GstMessage)* msg) c_gst_message_copy; ///
  size_t function(GstMessage* message) c_gst_message_get_num_redirect_entries; ///
  uint function(GstMessage* message) c_gst_message_get_seqnum; ///
  const(GValue)* function(GstMessage* message) c_gst_message_get_stream_status_object; ///
  const(GstStructure)* function(GstMessage* message) c_gst_message_get_structure; ///
  gboolean function(GstMessage* message, const(char)* name) c_gst_message_has_name; ///
  void function(GstMessage* message, GstClockTime* runningTime) c_gst_message_parse_async_done; ///
  void function(GstMessage* message, int* percent) c_gst_message_parse_buffering; ///
  void function(GstMessage* message, GstBufferingMode* mode, int* avgIn, int* avgOut, long* bufferingLeft) c_gst_message_parse_buffering_stats; ///
  void function(GstMessage* message, GstClock** clock) c_gst_message_parse_clock_lost; ///
  void function(GstMessage* message, GstClock** clock, gboolean* ready) c_gst_message_parse_clock_provide; ///
  gboolean function(GstMessage* message, const(char*)* contextType) c_gst_message_parse_context_type; ///
  void function(GstMessage* message, GstDevice** device) c_gst_message_parse_device_added; ///
  void function(GstMessage* message, GstDevice** device, GstDevice** changedDevice) c_gst_message_parse_device_changed; ///
  void function(GstMessage* message, GstDevice** device) c_gst_message_parse_device_removed; ///
  void function(GstMessage* message, GError** gerror, char** debug_) c_gst_message_parse_error; ///
  void function(GstMessage* message, const(GstStructure*)* structure) c_gst_message_parse_error_details; ///
  gboolean function(GstMessage* message, uint* groupId) c_gst_message_parse_group_id; ///
  void function(GstMessage* message, GstContext** context) c_gst_message_parse_have_context; ///
  void function(GstMessage* message, GError** gerror, char** debug_) c_gst_message_parse_info; ///
  void function(GstMessage* message, const(GstStructure*)* structure) c_gst_message_parse_info_details; ///
  void function(GstMessage* message, double* rateMultiplier) c_gst_message_parse_instant_rate_request; ///
  void function(GstMessage* message, GstClock** clock) c_gst_message_parse_new_clock; ///
  void function(GstMessage* message, GstProgressType* type, char** code, char** text) c_gst_message_parse_progress; ///
  void function(GstMessage* message, GstObject** object, const(char*)* propertyName, const(GValue*)* propertyValue) c_gst_message_parse_property_notify; ///
  void function(GstMessage* message, gboolean* live, ulong* runningTime, ulong* streamTime, ulong* timestamp, ulong* duration) c_gst_message_parse_qos; ///
  void function(GstMessage* message, GstFormat* format, ulong* processed, ulong* dropped) c_gst_message_parse_qos_stats; ///
  void function(GstMessage* message, long* jitter, double* proportion, int* quality) c_gst_message_parse_qos_values; ///
  void function(GstMessage* message, size_t entryIndex, const(char*)* location, GstTagList** tagList, const(GstStructure*)* entryStruct) c_gst_message_parse_redirect_entry; ///
  void function(GstMessage* message, GstState* state) c_gst_message_parse_request_state; ///
  void function(GstMessage* message, GstClockTime* runningTime) c_gst_message_parse_reset_time; ///
  void function(GstMessage* message, GstFormat* format, long* position) c_gst_message_parse_segment_done; ///
  void function(GstMessage* message, GstFormat* format, long* position) c_gst_message_parse_segment_start; ///
  void function(GstMessage* message, GstState* oldstate, GstState* newstate, GstState* pending) c_gst_message_parse_state_changed; ///
  void function(GstMessage* message, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate, ulong* duration, gboolean* eos) c_gst_message_parse_step_done; ///
  void function(GstMessage* message, gboolean* active, GstFormat* format, ulong* amount, double* rate, gboolean* flush, gboolean* intermediate) c_gst_message_parse_step_start; ///
  void function(GstMessage* message, GstStreamCollection** collection) c_gst_message_parse_stream_collection; ///
  void function(GstMessage* message, GstStreamStatusType* type, GstElement** owner) c_gst_message_parse_stream_status; ///
  void function(GstMessage* message, GstStreamCollection** collection) c_gst_message_parse_streams_selected; ///
  void function(GstMessage* message, GstStructureChangeType* type, GstElement** owner, gboolean* busy) c_gst_message_parse_structure_change; ///
  void function(GstMessage* message, GstTagList** tagList) c_gst_message_parse_tag; ///
  void function(GstMessage* message, GstToc** toc, gboolean* updated) c_gst_message_parse_toc; ///
  void function(GstMessage* message, GError** gerror, char** debug_) c_gst_message_parse_warning; ///
  void function(GstMessage* message, const(GstStructure*)* structure) c_gst_message_parse_warning_details; ///
  void function(GstMessage* message, GstBufferingMode mode, int avgIn, int avgOut, long bufferingLeft) c_gst_message_set_buffering_stats; ///
  void function(GstMessage* message, uint groupId) c_gst_message_set_group_id; ///
  void function(GstMessage* message, GstFormat format, ulong processed, ulong dropped) c_gst_message_set_qos_stats; ///
  void function(GstMessage* message, long jitter, double proportion, int quality) c_gst_message_set_qos_values; ///
  void function(GstMessage* message, uint seqnum) c_gst_message_set_seqnum; ///
  void function(GstMessage* message, const(GValue)* object) c_gst_message_set_stream_status_object; ///
  void function(GstMessage* message, GstStream* stream) c_gst_message_streams_selected_add; ///
  uint function(GstMessage* message) c_gst_message_streams_selected_get_size; ///
  GstStream* function(GstMessage* message, uint idx) c_gst_message_streams_selected_get_stream; ///
  GstStructure* function(GstMessage* message) c_gst_message_writable_structure; ///
  gboolean function(GstMessage** oldMessage, GstMessage* newMessage) c_gst_message_replace; ///

  // Meta
  int function(const(GstMeta)* meta1, const(GstMeta)* meta2) c_gst_meta_compare_seqnum; ///
  ulong function(const(GstMeta)* meta) c_gst_meta_get_seqnum; ///
  gboolean function(const(GstMeta)* meta, GstByteArrayInterface* data) c_gst_meta_serialize; ///
  gboolean function(const(GstMeta)* meta, GByteArray* data) c_gst_meta_serialize_simple; ///
  const(char*)* function(GType api) c_gst_meta_api_type_get_tags; ///
  gboolean function(GType api, GQuark tag) c_gst_meta_api_type_has_tag; ///
  GType function(const(char)* api, const(char*)* tags) c_gst_meta_api_type_register; ///
  GstMeta* function(GstBuffer* buffer, const(ubyte)* data, size_t size, uint* consumed) c_gst_meta_deserialize; ///
  const(GstMetaInfo)* function(const(char)* impl) c_gst_meta_get_info; ///
  const(GstMetaInfo)* function(GType api, const(char)* impl, size_t size, GstMetaInitFunction initFunc, GstMetaFreeFunction freeFunc, GstMetaTransformFunction transformFunc) c_gst_meta_register; ///
  const(GstMetaInfo)* function(const(char)* name, const(char*)* tags, GstCustomMetaTransformFunction transformFunc, void* userData, GDestroyNotify destroyData) c_gst_meta_register_custom; ///
  const(GstMetaInfo)* function(const(char)* name) c_gst_meta_register_custom_simple; ///

  // MetaInfo
  gboolean function(const(GstMetaInfo)* info) c_gst_meta_info_is_custom; ///
  const(GstMetaInfo)* function(GstMetaInfo* info) c_gst_meta_info_register; ///
  GstMetaInfo* function(GType api, const(char)* impl, size_t size) c_gst_meta_info_new; ///

  // MiniObject
  GType function() c_gst_mini_object_get_type; ///
  void function(GstMiniObject* object, GstMiniObject* parent) c_gst_mini_object_add_parent; ///
  GstMiniObject* function(const(GstMiniObject)* miniObject) c_gst_mini_object_copy; ///
  void* function(GstMiniObject* object, GQuark quark) c_gst_mini_object_get_qdata; ///
  void function(GstMiniObject* miniObject, uint flags, GType type, GstMiniObjectCopyFunction copyFunc, GstMiniObjectDisposeFunction disposeFunc, GstMiniObjectFreeFunction freeFunc) c_gst_mini_object_init; ///
  gboolean function(const(GstMiniObject)* miniObject) c_gst_mini_object_is_writable; ///
  gboolean function(GstMiniObject* object, GstLockFlags flags) c_gst_mini_object_lock; ///
  GstMiniObject* function(GstMiniObject* miniObject) c_gst_mini_object_make_writable; ///
  GstMiniObject* function(GstMiniObject* miniObject) c_gst_mini_object_ref; ///
  void function(GstMiniObject* object, GstMiniObject* parent) c_gst_mini_object_remove_parent; ///
  void function(GstMiniObject* object, GQuark quark, void* data, GDestroyNotify destroy) c_gst_mini_object_set_qdata; ///
  void* function(GstMiniObject* object, GQuark quark) c_gst_mini_object_steal_qdata; ///
  void function(GstMiniObject* object, GstLockFlags flags) c_gst_mini_object_unlock; ///
  void function(GstMiniObject* miniObject) c_gst_mini_object_unref; ///
  void function(GstMiniObject* object, GstMiniObjectNotify notify, void* data) c_gst_mini_object_weak_ref; ///
  void function(GstMiniObject* object, GstMiniObjectNotify notify, void* data) c_gst_mini_object_weak_unref; ///
  gboolean function(GstMiniObject** olddata, GstMiniObject* newdata) c_gst_mini_object_replace; ///
  GstMiniObject* function(GstMiniObject** olddata) c_gst_mini_object_steal; ///
  gboolean function(GstMiniObject** olddata, GstMiniObject* newdata) c_gst_mini_object_take; ///

  // ObjectWrap
  GType function() c_gst_object_get_type; ///
  gboolean function(GList* list, const(char)* name) c_gst_object_check_uniqueness; ///
  void function(GObject* object, GstObject* orig, GParamSpec* pspec, char** excludedProps) c_gst_object_default_deep_notify; ///
  void* function(void* object) c_gst_object_ref_sink; ///
  gboolean function(GstObject** oldobj, GstObject* newobj) c_gst_object_replace; ///
  gboolean function(GstObject* object, GstControlBinding* binding) c_gst_object_add_control_binding; ///
  void function(GstObject* source, const(GError)* error, const(char)* debug_) c_gst_object_default_error; ///
  GstControlBinding* function(GstObject* object, const(char)* propertyName) c_gst_object_get_control_binding; ///
  GstClockTime function(GstObject* object) c_gst_object_get_control_rate; ///
  gboolean function(GstObject* object, const(char)* propertyName, GstClockTime timestamp, GstClockTime interval, uint nValues, GValue* values) c_gst_object_get_g_value_array; ///
  char* function(GstObject* object) c_gst_object_get_name; ///
  GstObject* function(GstObject* object) c_gst_object_get_parent; ///
  char* function(GstObject* object) c_gst_object_get_path_string; ///
  GValue* function(GstObject* object, const(char)* propertyName, GstClockTime timestamp) c_gst_object_get_value; ///
  gboolean function(GstObject* object, const(char)* propertyName, GstClockTime timestamp, GstClockTime interval, uint nValues, void* values) c_gst_object_get_value_array; ///
  gboolean function(GstObject* object) c_gst_object_has_active_control_bindings; ///
  gboolean function(GstObject* object, GstObject* ancestor) c_gst_object_has_ancestor; ///
  gboolean function(GstObject* object, GstObject* ancestor) c_gst_object_has_as_ancestor; ///
  gboolean function(GstObject* object, GstObject* parent) c_gst_object_has_as_parent; ///
  GstObject* function(GstObject* object) c_gst_object_ref; ///
  gboolean function(GstObject* object, GstControlBinding* binding) c_gst_object_remove_control_binding; ///
  void function(GstObject* object, const(char)* propertyName, gboolean disabled) c_gst_object_set_control_binding_disabled; ///
  void function(GstObject* object, gboolean disabled) c_gst_object_set_control_bindings_disabled; ///
  void function(GstObject* object, GstClockTime controlRate) c_gst_object_set_control_rate; ///
  gboolean function(GstObject* object, const(char)* name) c_gst_object_set_name; ///
  gboolean function(GstObject* object, GstObject* parent) c_gst_object_set_parent; ///
  GstClockTime function(GstObject* object) c_gst_object_suggest_next_sync; ///
  gboolean function(GstObject* object, GstClockTime timestamp) c_gst_object_sync_values; ///
  void function(GstObject* object) c_gst_object_unparent; ///
  void function(GstObject* object) c_gst_object_unref; ///

  // Pad
  GType function() c_gst_pad_get_type; ///
  GstPad* function(const(char)* name, GstPadDirection direction) c_gst_pad_new; ///
  GstPad* function(GstStaticPadTemplate* templ, const(char)* name) c_gst_pad_new_from_static_template; ///
  GstPad* function(GstPadTemplate* templ, const(char)* name) c_gst_pad_new_from_template; ///
  const(char)* function(GstPadLinkReturn ret) c_gst_pad_link_get_name; ///
  gboolean function(GstPad* pad, GstPadMode mode, gboolean active) c_gst_pad_activate_mode; ///
  gulong function(GstPad* pad, GstPadProbeType mask, GstPadProbeCallback callback, void* userData, GDestroyNotify destroyData) c_gst_pad_add_probe; ///
  gboolean function(GstPad* srcpad, GstPad* sinkpad) c_gst_pad_can_link; ///
  GstFlowReturn function(GstPad* pad, GstBuffer* buffer) c_gst_pad_chain; ///
  GstFlowReturn function(GstPad* pad, GstBufferList* list) c_gst_pad_chain_list; ///
  gboolean function(GstPad* pad) c_gst_pad_check_reconfigure; ///
  char* function(GstPad* pad, GstElement* parent, const(char)* streamId) c_gst_pad_create_stream_id; ///
  char* function(GstPad* pad, GstElement* parent, const(char)* streamId,  ...) c_gst_pad_create_stream_id_printf; ///
  char* function(GstPad* pad, GstElement* parent, const(char)* streamId, void* varArgs) c_gst_pad_create_stream_id_printf_valist; ///
  gboolean function(GstPad* pad, GstObject* parent, GstEvent* event) c_gst_pad_event_default; ///
  gboolean function(GstPad* pad, GstPadForwardFunction forward, void* userData) c_gst_pad_forward; ///
  GstCaps* function(GstPad* pad) c_gst_pad_get_allowed_caps; ///
  GstCaps* function(GstPad* pad) c_gst_pad_get_current_caps; ///
  GstPadDirection function(GstPad* pad) c_gst_pad_get_direction; ///
  void* function(GstPad* pad) c_gst_pad_get_element_private; ///
  GstFlowReturn function(GstPad* pad) c_gst_pad_get_last_flow_return; ///
  long function(GstPad* pad) c_gst_pad_get_offset; ///
  GstPadTemplate* function(GstPad* pad) c_gst_pad_get_pad_template; ///
  GstCaps* function(GstPad* pad) c_gst_pad_get_pad_template_caps; ///
  GstElement* function(GstPad* pad) c_gst_pad_get_parent_element; ///
  GstPad* function(GstPad* pad) c_gst_pad_get_peer; ///
  GstFlowReturn function(GstPad* pad, ulong offset, uint size, GstBuffer** buffer) c_gst_pad_get_range; ///
  GstPad* function(GstPad* pad) c_gst_pad_get_single_internal_link; ///
  GstEvent* function(GstPad* pad, GstEventType eventType, uint idx) c_gst_pad_get_sticky_event; ///
  GstStream* function(GstPad* pad) c_gst_pad_get_stream; ///
  char* function(GstPad* pad) c_gst_pad_get_stream_id; ///
  GstTaskState function(GstPad* pad) c_gst_pad_get_task_state; ///
  gboolean function(GstPad* pad) c_gst_pad_has_current_caps; ///
  gboolean function(GstPad* pad) c_gst_pad_is_active; ///
  gboolean function(GstPad* pad) c_gst_pad_is_blocked; ///
  gboolean function(GstPad* pad) c_gst_pad_is_blocking; ///
  gboolean function(GstPad* pad) c_gst_pad_is_linked; ///
  GstIterator* function(GstPad* pad) c_gst_pad_iterate_internal_links; ///
  GstIterator* function(GstPad* pad, GstObject* parent) c_gst_pad_iterate_internal_links_default; ///
  GstPadLinkReturn function(GstPad* srcpad, GstPad* sinkpad) c_gst_pad_link; ///
  GstPadLinkReturn function(GstPad* srcpad, GstPad* sinkpad, GstPadLinkCheck flags) c_gst_pad_link_full; ///
  gboolean function(GstPad* src, GstPad* sink) c_gst_pad_link_maybe_ghosting; ///
  gboolean function(GstPad* src, GstPad* sink, GstPadLinkCheck flags) c_gst_pad_link_maybe_ghosting_full; ///
  void function(GstPad* pad) c_gst_pad_mark_reconfigure; ///
  gboolean function(GstPad* pad) c_gst_pad_needs_reconfigure; ///
  gboolean function(GstPad* pad) c_gst_pad_pause_task; ///
  gboolean function(GstPad* pad, GstQuery* query) c_gst_pad_peer_query; ///
  gboolean function(GstPad* pad, GstCaps* caps) c_gst_pad_peer_query_accept_caps; ///
  GstCaps* function(GstPad* pad, GstCaps* filter) c_gst_pad_peer_query_caps; ///
  gboolean function(GstPad* pad, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) c_gst_pad_peer_query_convert; ///
  gboolean function(GstPad* pad, GstFormat format, long* duration) c_gst_pad_peer_query_duration; ///
  gboolean function(GstPad* pad, GstFormat format, long* cur) c_gst_pad_peer_query_position; ///
  gboolean function(GstPad* pad, GstQuery* query) c_gst_pad_proxy_query_accept_caps; ///
  gboolean function(GstPad* pad, GstQuery* query) c_gst_pad_proxy_query_caps; ///
  GstFlowReturn function(GstPad* pad, ulong offset, uint size, GstBuffer** buffer) c_gst_pad_pull_range; ///
  GstFlowReturn function(GstPad* pad, GstBuffer* buffer) c_gst_pad_push; ///
  gboolean function(GstPad* pad, GstEvent* event) c_gst_pad_push_event; ///
  GstFlowReturn function(GstPad* pad, GstBufferList* list) c_gst_pad_push_list; ///
  gboolean function(GstPad* pad, GstQuery* query) c_gst_pad_query; ///
  gboolean function(GstPad* pad, GstCaps* caps) c_gst_pad_query_accept_caps; ///
  GstCaps* function(GstPad* pad, GstCaps* filter) c_gst_pad_query_caps; ///
  gboolean function(GstPad* pad, GstFormat srcFormat, long srcVal, GstFormat destFormat, long* destVal) c_gst_pad_query_convert; ///
  gboolean function(GstPad* pad, GstObject* parent, GstQuery* query) c_gst_pad_query_default; ///
  gboolean function(GstPad* pad, GstFormat format, long* duration) c_gst_pad_query_duration; ///
  gboolean function(GstPad* pad, GstFormat format, long* cur) c_gst_pad_query_position; ///
  void function(GstPad* pad, gulong id) c_gst_pad_remove_probe; ///
  gboolean function(GstPad* pad, GstEvent* event) c_gst_pad_send_event; ///
  void function(GstPad* pad, GstPadActivateFunction activate, void* userData, GDestroyNotify notify) c_gst_pad_set_activate_function_full; ///
  void function(GstPad* pad, GstPadActivateModeFunction activatemode, void* userData, GDestroyNotify notify) c_gst_pad_set_activatemode_function_full; ///
  gboolean function(GstPad* pad, gboolean active) c_gst_pad_set_active; ///
  void function(GstPad* pad, GstPadChainFunction chain, void* userData, GDestroyNotify notify) c_gst_pad_set_chain_function_full; ///
  void function(GstPad* pad, GstPadChainListFunction chainlist, void* userData, GDestroyNotify notify) c_gst_pad_set_chain_list_function_full; ///
  void function(GstPad* pad, void* priv) c_gst_pad_set_element_private; ///
  void function(GstPad* pad, GstPadEventFullFunction event, void* userData, GDestroyNotify notify) c_gst_pad_set_event_full_function_full; ///
  void function(GstPad* pad, GstPadEventFunction event, void* userData, GDestroyNotify notify) c_gst_pad_set_event_function_full; ///
  void function(GstPad* pad, GstPadGetRangeFunction get, void* userData, GDestroyNotify notify) c_gst_pad_set_getrange_function_full; ///
  void function(GstPad* pad, GstPadIterIntLinkFunction iterintlink, void* userData, GDestroyNotify notify) c_gst_pad_set_iterate_internal_links_function_full; ///
  void function(GstPad* pad, GstPadLinkFunction link, void* userData, GDestroyNotify notify) c_gst_pad_set_link_function_full; ///
  void function(GstPad* pad, long offset) c_gst_pad_set_offset; ///
  void function(GstPad* pad, GstPadQueryFunction query, void* userData, GDestroyNotify notify) c_gst_pad_set_query_function_full; ///
  void function(GstPad* pad, GstPadUnlinkFunction unlink, void* userData, GDestroyNotify notify) c_gst_pad_set_unlink_function_full; ///
  gboolean function(GstPad* pad, GstTaskFunction func, void* userData, GDestroyNotify notify) c_gst_pad_start_task; ///
  void function(GstPad* pad, GstPadStickyEventsForeachFunction foreachFunc, void* userData) c_gst_pad_sticky_events_foreach; ///
  gboolean function(GstPad* pad) c_gst_pad_stop_task; ///
  GstFlowReturn function(GstPad* pad, GstEvent* event) c_gst_pad_store_sticky_event; ///
  gboolean function(GstPad* srcpad, GstPad* sinkpad) c_gst_pad_unlink; ///
  void function(GstPad* pad) c_gst_pad_use_fixed_caps; ///

  // PadProbeInfo
  GstBuffer* function(GstPadProbeInfo* info) c_gst_pad_probe_info_get_buffer; ///
  GstBufferList* function(GstPadProbeInfo* info) c_gst_pad_probe_info_get_buffer_list; ///
  GstEvent* function(GstPadProbeInfo* info) c_gst_pad_probe_info_get_event; ///
  GstQuery* function(GstPadProbeInfo* info) c_gst_pad_probe_info_get_query; ///

  // PadTemplate
  GType function() c_gst_pad_template_get_type; ///
  GstPadTemplate* function(const(char)* nameTemplate, GstPadDirection direction, GstPadPresence presence, GstCaps* caps) c_gst_pad_template_new; ///
  GstPadTemplate* function(GstStaticPadTemplate* padTemplate, GType padType) c_gst_pad_template_new_from_static_pad_template_with_gtype; ///
  GstPadTemplate* function(const(char)* nameTemplate, GstPadDirection direction, GstPadPresence presence, GstCaps* caps, GType padType) c_gst_pad_template_new_with_gtype; ///
  GstCaps* function(GstPadTemplate* templ) c_gst_pad_template_get_caps; ///
  GstCaps* function(GstPadTemplate* templ) c_gst_pad_template_get_documentation_caps; ///
  void function(GstPadTemplate* templ, GstPad* pad) c_gst_pad_template_pad_created; ///
  void function(GstPadTemplate* templ, GstCaps* caps) c_gst_pad_template_set_documentation_caps; ///

  // ParamArray
  GType function() c_gst_param_spec_array_get_type; ///

  // ParamFraction
  GType function() c_gst_param_spec_fraction_get_type; ///

  // ParentBufferMeta
  const(GstMetaInfo)* function() c_gst_parent_buffer_meta_get_info; ///

  // ParseContext
  GType function() c_gst_parse_context_get_type; ///
  GstParseContext* function() c_gst_parse_context_new; ///
  GstParseContext* function(const(GstParseContext)* context) c_gst_parse_context_copy; ///
  void function(GstParseContext* context) c_gst_parse_context_free; ///
  char** function(GstParseContext* context) c_gst_parse_context_get_missing_elements; ///

  // Pipeline
  GType function() c_gst_pipeline_get_type; ///
  GstElement* function(const(char)* name) c_gst_pipeline_new; ///
  void function(GstPipeline* pipeline) c_gst_pipeline_auto_clock; ///
  gboolean function(GstPipeline* pipeline) c_gst_pipeline_get_auto_flush_bus; ///
  GstBus* function(GstPipeline* pipeline) c_gst_pipeline_get_bus; ///
  GstClock* function(GstPipeline* pipeline) c_gst_pipeline_get_clock; ///
  GstClockTime function(GstPipeline* pipeline) c_gst_pipeline_get_configured_latency; ///
  GstClockTime function(GstPipeline* pipeline) c_gst_pipeline_get_delay; ///
  GstClockTime function(GstPipeline* pipeline) c_gst_pipeline_get_latency; ///
  GstClock* function(GstPipeline* pipeline) c_gst_pipeline_get_pipeline_clock; ///
  gboolean function(GstPipeline* pipeline) c_gst_pipeline_is_live; ///
  void function(GstPipeline* pipeline, gboolean autoFlush) c_gst_pipeline_set_auto_flush_bus; ///
  gboolean function(GstPipeline* pipeline, GstClock* clock) c_gst_pipeline_set_clock; ///
  void function(GstPipeline* pipeline, GstClockTime delay) c_gst_pipeline_set_delay; ///
  void function(GstPipeline* pipeline, GstClockTime latency) c_gst_pipeline_set_latency; ///
  void function(GstPipeline* pipeline, GstClock* clock) c_gst_pipeline_use_clock; ///

  // Plugin
  GType function() c_gst_plugin_get_type; ///
  void function(GList* list) c_gst_plugin_list_free; ///
  GstPlugin* function(const(char)* name) c_gst_plugin_load_by_name; ///
  GstPlugin* function(const(char)* filename, GError** _err) c_gst_plugin_load_file; ///
  gboolean function(int majorVersion, int minorVersion, const(char)* name, const(char)* description, GstPluginInitFunc initFunc, const(char)* version_, const(char)* license, const(char)* source, const(char)* package_, const(char)* origin) c_gst_plugin_register_static; ///
  gboolean function(int majorVersion, int minorVersion, const(char)* name, const(char)* description, GstPluginInitFullFunc initFullFunc, const(char)* version_, const(char)* license, const(char)* source, const(char)* package_, const(char)* origin, void* userData) c_gst_plugin_register_static_full; ///
  void function(GstPlugin* plugin, const(char*)* envVars, const(char*)* paths, const(char*)* names, GstPluginDependencyFlags flags) c_gst_plugin_add_dependency; ///
  void function(GstPlugin* plugin, const(char)* envVars, const(char)* paths, const(char)* names, GstPluginDependencyFlags flags) c_gst_plugin_add_dependency_simple; ///
  void function(GstPlugin* plugin, const(char)* message) c_gst_plugin_add_status_error; ///
  void function(GstPlugin* plugin, const(char)* message) c_gst_plugin_add_status_info; ///
  void function(GstPlugin* plugin, const(char)* message) c_gst_plugin_add_status_warning; ///
  const(GstStructure)* function(GstPlugin* plugin) c_gst_plugin_get_cache_data; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_description; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_filename; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_license; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_name; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_origin; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_package; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_release_date_string; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_source; ///
  char** function(GstPlugin* plugin) c_gst_plugin_get_status_errors; ///
  char** function(GstPlugin* plugin) c_gst_plugin_get_status_infos; ///
  char** function(GstPlugin* plugin) c_gst_plugin_get_status_warnings; ///
  const(char)* function(GstPlugin* plugin) c_gst_plugin_get_version; ///
  gboolean function(GstPlugin* plugin) c_gst_plugin_is_loaded; ///
  GstPlugin* function(GstPlugin* plugin) c_gst_plugin_load; ///
  void function(GstPlugin* plugin, GstStructure* cacheData) c_gst_plugin_set_cache_data; ///

  // PluginFeature
  GType function() c_gst_plugin_feature_get_type; ///
  GList* function(GList* list) c_gst_plugin_feature_list_copy; ///
  void function(GList* list) c_gst_plugin_feature_list_debug; ///
  void function(GList* list) c_gst_plugin_feature_list_free; ///
  int function(const(void)* p1, const(void)* p2) c_gst_plugin_feature_rank_compare_func; ///
  gboolean function(GstPluginFeature* feature, uint minMajor, uint minMinor, uint minMicro) c_gst_plugin_feature_check_version; ///
  GstPlugin* function(GstPluginFeature* feature) c_gst_plugin_feature_get_plugin; ///
  const(char)* function(GstPluginFeature* feature) c_gst_plugin_feature_get_plugin_name; ///
  uint function(GstPluginFeature* feature) c_gst_plugin_feature_get_rank; ///
  GstPluginFeature* function(GstPluginFeature* feature) c_gst_plugin_feature_load; ///
  void function(GstPluginFeature* feature, uint rank) c_gst_plugin_feature_set_rank; ///

  // Poll
  gboolean function(GstPoll* set, GstPollFD* fd) c_gst_poll_add_fd; ///
  gboolean function(const(GstPoll)* set, GstPollFD* fd) c_gst_poll_fd_can_read; ///
  gboolean function(const(GstPoll)* set, GstPollFD* fd) c_gst_poll_fd_can_write; ///
  gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) c_gst_poll_fd_ctl_pri; ///
  gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) c_gst_poll_fd_ctl_read; ///
  gboolean function(GstPoll* set, GstPollFD* fd, gboolean active) c_gst_poll_fd_ctl_write; ///
  gboolean function(const(GstPoll)* set, GstPollFD* fd) c_gst_poll_fd_has_closed; ///
  gboolean function(const(GstPoll)* set, GstPollFD* fd) c_gst_poll_fd_has_error; ///
  gboolean function(const(GstPoll)* set, GstPollFD* fd) c_gst_poll_fd_has_pri; ///
  void function(GstPoll* set, GstPollFD* fd) c_gst_poll_fd_ignored; ///
  void function(GstPoll* set) c_gst_poll_free; ///
  void function(GstPoll* set, GPollFD* fd) c_gst_poll_get_read_gpollfd; ///
  gboolean function(GstPoll* set) c_gst_poll_read_control; ///
  gboolean function(GstPoll* set, GstPollFD* fd) c_gst_poll_remove_fd; ///
  void function(GstPoll* set) c_gst_poll_restart; ///
  gboolean function(GstPoll* set, gboolean controllable) c_gst_poll_set_controllable; ///
  void function(GstPoll* set, gboolean flushing) c_gst_poll_set_flushing; ///
  int function(GstPoll* set, GstClockTime timeout) c_gst_poll_wait; ///
  gboolean function(GstPoll* set) c_gst_poll_write_control; ///
  GstPoll* function(gboolean controllable) c_gst_poll_new; ///
  GstPoll* function() c_gst_poll_new_timer; ///

  // PollFD
  void function(GstPollFD* fd) c_gst_poll_fd_init; ///

  // Preset
  GType function() c_gst_preset_get_type; ///
  const(char)* function() c_gst_preset_get_app_dir; ///
  gboolean function(const(char)* appDir) c_gst_preset_set_app_dir; ///
  gboolean function(GstPreset* preset, const(char)* name) c_gst_preset_delete_preset; ///
  gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, char** value) c_gst_preset_get_meta; ///
  char** function(GstPreset* preset) c_gst_preset_get_preset_names; ///
  char** function(GstPreset* preset) c_gst_preset_get_property_names; ///
  gboolean function(GstPreset* preset) c_gst_preset_is_editable; ///
  gboolean function(GstPreset* preset, const(char)* name) c_gst_preset_load_preset; ///
  gboolean function(GstPreset* preset, const(char)* oldName, const(char)* newName) c_gst_preset_rename_preset; ///
  gboolean function(GstPreset* preset, const(char)* name) c_gst_preset_save_preset; ///
  gboolean function(GstPreset* preset, const(char)* name, const(char)* tag, const(char)* value) c_gst_preset_set_meta; ///

  // Promise
  GType function() c_gst_promise_get_type; ///
  GstPromise* function() c_gst_promise_new; ///
  GstPromise* function(GstPromiseChangeFunc func, void* userData, GDestroyNotify notify) c_gst_promise_new_with_change_func; ///
  void function(GstPromise* promise) c_gst_promise_expire; ///
  const(GstStructure)* function(GstPromise* promise) c_gst_promise_get_reply; ///
  void function(GstPromise* promise) c_gst_promise_interrupt; ///
  void function(GstPromise* promise, GstStructure* s) c_gst_promise_reply; ///
  GstPromiseResult function(GstPromise* promise) c_gst_promise_wait; ///

  // ProtectionMeta
  const(GstMetaInfo)* function() c_gst_protection_meta_get_info; ///

  // ProxyPad
  GType function() c_gst_proxy_pad_get_type; ///
  GstFlowReturn function(GstPad* pad, GstObject* parent, GstBuffer* buffer) c_gst_proxy_pad_chain_default; ///
  GstFlowReturn function(GstPad* pad, GstObject* parent, GstBufferList* list) c_gst_proxy_pad_chain_list_default; ///
  GstFlowReturn function(GstPad* pad, GstObject* parent, ulong offset, uint size, GstBuffer** buffer) c_gst_proxy_pad_getrange_default; ///
  GstIterator* function(GstPad* pad, GstObject* parent) c_gst_proxy_pad_iterate_internal_links_default; ///
  GstProxyPad* function(GstProxyPad* pad) c_gst_proxy_pad_get_internal; ///

  // Query
  GType function() c_gst_query_get_type; ///
  GstQuery* function(GstCaps* caps) c_gst_query_new_accept_caps; ///
  GstQuery* function(GstCaps* caps, gboolean needPool) c_gst_query_new_allocation; ///
  GstQuery* function() c_gst_query_new_bitrate; ///
  GstQuery* function(GstFormat format) c_gst_query_new_buffering; ///
  GstQuery* function(GstCaps* filter) c_gst_query_new_caps; ///
  GstQuery* function(const(char)* contextType) c_gst_query_new_context; ///
  GstQuery* function(GstFormat srcFormat, long value, GstFormat destFormat) c_gst_query_new_convert; ///
  GstQuery* function(GstQueryType type, GstStructure* structure) c_gst_query_new_custom; ///
  GstQuery* function() c_gst_query_new_drain; ///
  GstQuery* function(GstFormat format) c_gst_query_new_duration; ///
  GstQuery* function() c_gst_query_new_formats; ///
  GstQuery* function() c_gst_query_new_latency; ///
  GstQuery* function(GstFormat format) c_gst_query_new_position; ///
  GstQuery* function() c_gst_query_new_scheduling; ///
  GstQuery* function(GstFormat format) c_gst_query_new_seeking; ///
  GstQuery* function(GstFormat format) c_gst_query_new_segment; ///
  GstQuery* function() c_gst_query_new_selectable; ///
  GstQuery* function() c_gst_query_new_uri; ///
  void function(GstQuery* query, GType api, const(GstStructure)* params) c_gst_query_add_allocation_meta; ///
  void function(GstQuery* query, GstAllocator* allocator, const(GstAllocationParams)* params) c_gst_query_add_allocation_param; ///
  void function(GstQuery* query, GstBufferPool* pool, uint size, uint minBuffers, uint maxBuffers) c_gst_query_add_allocation_pool; ///
  gboolean function(GstQuery* query, long start, long stop) c_gst_query_add_buffering_range; ///
  void function(GstQuery* query, GstPadMode mode) c_gst_query_add_scheduling_mode; ///
  gboolean function(GstQuery* query, GType api, uint* index) c_gst_query_find_allocation_meta; ///
  uint function(GstQuery* query) c_gst_query_get_n_allocation_metas; ///
  uint function(GstQuery* query) c_gst_query_get_n_allocation_params; ///
  uint function(GstQuery* query) c_gst_query_get_n_allocation_pools; ///
  uint function(GstQuery* query) c_gst_query_get_n_buffering_ranges; ///
  uint function(GstQuery* query) c_gst_query_get_n_scheduling_modes; ///
  const(GstStructure)* function(GstQuery* query) c_gst_query_get_structure; ///
  gboolean function(GstQuery* query, GstPadMode mode) c_gst_query_has_scheduling_mode; ///
  gboolean function(GstQuery* query, GstPadMode mode, GstSchedulingFlags flags) c_gst_query_has_scheduling_mode_with_flags; ///
  void function(GstQuery* query, GstCaps** caps) c_gst_query_parse_accept_caps; ///
  void function(GstQuery* query, gboolean* result) c_gst_query_parse_accept_caps_result; ///
  void function(GstQuery* query, GstCaps** caps, gboolean* needPool) c_gst_query_parse_allocation; ///
  void function(GstQuery* query, uint* nominalBitrate) c_gst_query_parse_bitrate; ///
  void function(GstQuery* query, gboolean* busy, int* percent) c_gst_query_parse_buffering_percent; ///
  void function(GstQuery* query, GstFormat* format, long* start, long* stop, long* estimatedTotal) c_gst_query_parse_buffering_range; ///
  void function(GstQuery* query, GstBufferingMode* mode, int* avgIn, int* avgOut, long* bufferingLeft) c_gst_query_parse_buffering_stats; ///
  void function(GstQuery* query, GstCaps** filter) c_gst_query_parse_caps; ///
  void function(GstQuery* query, GstCaps** caps) c_gst_query_parse_caps_result; ///
  void function(GstQuery* query, GstContext** context) c_gst_query_parse_context; ///
  gboolean function(GstQuery* query, const(char*)* contextType) c_gst_query_parse_context_type; ///
  void function(GstQuery* query, GstFormat* srcFormat, long* srcValue, GstFormat* destFormat, long* destValue) c_gst_query_parse_convert; ///
  void function(GstQuery* query, GstFormat* format, long* duration) c_gst_query_parse_duration; ///
  void function(GstQuery* query, gboolean* live, GstClockTime* minLatency, GstClockTime* maxLatency) c_gst_query_parse_latency; ///
  void function(GstQuery* query, uint* nFormats) c_gst_query_parse_n_formats; ///
  GType function(GstQuery* query, uint index, const(GstStructure*)* params) c_gst_query_parse_nth_allocation_meta; ///
  void function(GstQuery* query, uint index, GstAllocator** allocator, GstAllocationParams* params) c_gst_query_parse_nth_allocation_param; ///
  void function(GstQuery* query, uint index, GstBufferPool** pool, uint* size, uint* minBuffers, uint* maxBuffers) c_gst_query_parse_nth_allocation_pool; ///
  gboolean function(GstQuery* query, uint index, long* start, long* stop) c_gst_query_parse_nth_buffering_range; ///
  void function(GstQuery* query, uint nth, GstFormat* format) c_gst_query_parse_nth_format; ///
  GstPadMode function(GstQuery* query, uint index) c_gst_query_parse_nth_scheduling_mode; ///
  void function(GstQuery* query, GstFormat* format, long* cur) c_gst_query_parse_position; ///
  void function(GstQuery* query, GstSchedulingFlags* flags, int* minsize, int* maxsize, int* align_) c_gst_query_parse_scheduling; ///
  void function(GstQuery* query, GstFormat* format, gboolean* seekable, long* segmentStart, long* segmentEnd) c_gst_query_parse_seeking; ///
  void function(GstQuery* query, double* rate, GstFormat* format, long* startValue, long* stopValue) c_gst_query_parse_segment; ///
  void function(GstQuery* query, gboolean* selectable) c_gst_query_parse_selectable; ///
  void function(GstQuery* query, char** uri) c_gst_query_parse_uri; ///
  void function(GstQuery* query, char** uri) c_gst_query_parse_uri_redirection; ///
  void function(GstQuery* query, gboolean* permanent) c_gst_query_parse_uri_redirection_permanent; ///
  void function(GstQuery* query, uint index) c_gst_query_remove_nth_allocation_meta; ///
  void function(GstQuery* query, uint index) c_gst_query_remove_nth_allocation_param; ///
  void function(GstQuery* query, uint index) c_gst_query_remove_nth_allocation_pool; ///
  void function(GstQuery* query, gboolean result) c_gst_query_set_accept_caps_result; ///
  void function(GstQuery* query, uint nominalBitrate) c_gst_query_set_bitrate; ///
  void function(GstQuery* query, gboolean busy, int percent) c_gst_query_set_buffering_percent; ///
  void function(GstQuery* query, GstFormat format, long start, long stop, long estimatedTotal) c_gst_query_set_buffering_range; ///
  void function(GstQuery* query, GstBufferingMode mode, int avgIn, int avgOut, long bufferingLeft) c_gst_query_set_buffering_stats; ///
  void function(GstQuery* query, GstCaps* caps) c_gst_query_set_caps_result; ///
  void function(GstQuery* query, GstContext* context) c_gst_query_set_context; ///
  void function(GstQuery* query, GstFormat srcFormat, long srcValue, GstFormat destFormat, long destValue) c_gst_query_set_convert; ///
  void function(GstQuery* query, GstFormat format, long duration) c_gst_query_set_duration; ///
  void function(GstQuery* query, int nFormats,  ...) c_gst_query_set_formats; ///
  void function(GstQuery* query, int nFormats, const(GstFormat)* formats) c_gst_query_set_formatsv; ///
  void function(GstQuery* query, gboolean live, GstClockTime minLatency, GstClockTime maxLatency) c_gst_query_set_latency; ///
  void function(GstQuery* query, uint index, GstAllocator* allocator, const(GstAllocationParams)* params) c_gst_query_set_nth_allocation_param; ///
  void function(GstQuery* query, uint index, GstBufferPool* pool, uint size, uint minBuffers, uint maxBuffers) c_gst_query_set_nth_allocation_pool; ///
  void function(GstQuery* query, GstFormat format, long cur) c_gst_query_set_position; ///
  void function(GstQuery* query, GstSchedulingFlags flags, int minsize, int maxsize, int align_) c_gst_query_set_scheduling; ///
  void function(GstQuery* query, GstFormat format, gboolean seekable, long segmentStart, long segmentEnd) c_gst_query_set_seeking; ///
  void function(GstQuery* query, double rate, GstFormat format, long startValue, long stopValue) c_gst_query_set_segment; ///
  void function(GstQuery* query, gboolean selectable) c_gst_query_set_selectable; ///
  void function(GstQuery* query, const(char)* uri) c_gst_query_set_uri; ///
  void function(GstQuery* query, const(char)* uri) c_gst_query_set_uri_redirection; ///
  void function(GstQuery* query, gboolean permanent) c_gst_query_set_uri_redirection_permanent; ///
  GstStructure* function(GstQuery* query) c_gst_query_writable_structure; ///

  // ReferenceTimestampMeta
  const(GstMetaInfo)* function() c_gst_reference_timestamp_meta_get_info; ///

  // Registry
  GType function() c_gst_registry_get_type; ///
  gboolean function() c_gst_registry_fork_is_enabled; ///
  void function(gboolean enabled) c_gst_registry_fork_set_enabled; ///
  GstRegistry* function() c_gst_registry_get; ///
  gboolean function(GstRegistry* registry, GstPluginFeature* feature) c_gst_registry_add_feature; ///
  gboolean function(GstRegistry* registry, GstPlugin* plugin) c_gst_registry_add_plugin; ///
  gboolean function(GstRegistry* registry, const(char)* featureName, uint minMajor, uint minMinor, uint minMicro) c_gst_registry_check_feature_version; ///
  GList* function(GstRegistry* registry, GstPluginFeatureFilter filter, gboolean first, void* userData) c_gst_registry_feature_filter; ///
  GstPluginFeature* function(GstRegistry* registry, const(char)* name, GType type) c_gst_registry_find_feature; ///
  GstPlugin* function(GstRegistry* registry, const(char)* name) c_gst_registry_find_plugin; ///
  GList* function(GstRegistry* registry, GType type) c_gst_registry_get_feature_list; ///
  GList* function(GstRegistry* registry, const(char)* name) c_gst_registry_get_feature_list_by_plugin; ///
  uint function(GstRegistry* registry) c_gst_registry_get_feature_list_cookie; ///
  GList* function(GstRegistry* registry) c_gst_registry_get_plugin_list; ///
  GstPlugin* function(GstRegistry* registry, const(char)* filename) c_gst_registry_lookup; ///
  GstPluginFeature* function(GstRegistry* registry, const(char)* name) c_gst_registry_lookup_feature; ///
  GList* function(GstRegistry* registry, GstPluginFilter filter, gboolean first, void* userData) c_gst_registry_plugin_filter; ///
  void function(GstRegistry* registry, GstPluginFeature* feature) c_gst_registry_remove_feature; ///
  void function(GstRegistry* registry, GstPlugin* plugin) c_gst_registry_remove_plugin; ///
  gboolean function(GstRegistry* registry, const(char)* path) c_gst_registry_scan_path; ///

  // Sample
  GType function() c_gst_sample_get_type; ///
  GstSample* function(GstBuffer* buffer, GstCaps* caps, const(GstSegment)* segment, GstStructure* info) c_gst_sample_new; ///
  GstBuffer* function(GstSample* sample) c_gst_sample_get_buffer; ///
  GstBufferList* function(GstSample* sample) c_gst_sample_get_buffer_list; ///
  GstCaps* function(GstSample* sample) c_gst_sample_get_caps; ///
  const(GstStructure)* function(GstSample* sample) c_gst_sample_get_info; ///
  GstSegment* function(GstSample* sample) c_gst_sample_get_segment; ///
  void function(GstSample* sample, GstBuffer* buffer) c_gst_sample_set_buffer; ///
  void function(GstSample* sample, GstBufferList* bufferList) c_gst_sample_set_buffer_list; ///
  void function(GstSample* sample, GstCaps* caps) c_gst_sample_set_caps; ///
  gboolean function(GstSample* sample, GstStructure* info) c_gst_sample_set_info; ///
  void function(GstSample* sample, const(GstSegment)* segment) c_gst_sample_set_segment; ///

  // Segment
  GType function() c_gst_segment_get_type; ///
  GstSegment* function() c_gst_segment_new; ///
  gboolean function(const(GstSegment)* segment, GstFormat format, ulong start, ulong stop, ulong* clipStart, ulong* clipStop) c_gst_segment_clip; ///
  GstSegment* function(const(GstSegment)* segment) c_gst_segment_copy; ///
  void function(const(GstSegment)* src, GstSegment* dest) c_gst_segment_copy_into; ///
  gboolean function(GstSegment* segment, double rate, GstFormat format, GstSeekFlags flags, GstSeekType startType, ulong start, GstSeekType stopType, ulong stop, gboolean* update) c_gst_segment_do_seek; ///
  void function(GstSegment* segment) c_gst_segment_free; ///
  void function(GstSegment* segment, GstFormat format) c_gst_segment_init; ///
  gboolean function(const(GstSegment)* s0, const(GstSegment)* s1) c_gst_segment_is_equal; ///
  gboolean function(GstSegment* segment, GstFormat format, long offset) c_gst_segment_offset_running_time; ///
  ulong function(const(GstSegment)* segment, GstFormat format, ulong runningTime) c_gst_segment_position_from_running_time; ///
  int function(const(GstSegment)* segment, GstFormat format, ulong runningTime, ulong* position) c_gst_segment_position_from_running_time_full; ///
  ulong function(const(GstSegment)* segment, GstFormat format, ulong streamTime) c_gst_segment_position_from_stream_time; ///
  int function(const(GstSegment)* segment, GstFormat format, ulong streamTime, ulong* position) c_gst_segment_position_from_stream_time_full; ///
  gboolean function(GstSegment* segment, GstFormat format, ulong runningTime) c_gst_segment_set_running_time; ///
  ulong function(const(GstSegment)* segment, GstFormat format, ulong runningTime) c_gst_segment_to_position; ///
  ulong function(const(GstSegment)* segment, GstFormat format, ulong position) c_gst_segment_to_running_time; ///
  int function(const(GstSegment)* segment, GstFormat format, ulong position, ulong* runningTime) c_gst_segment_to_running_time_full; ///
  ulong function(const(GstSegment)* segment, GstFormat format, ulong position) c_gst_segment_to_stream_time; ///
  int function(const(GstSegment)* segment, GstFormat format, ulong position, ulong* streamTime) c_gst_segment_to_stream_time_full; ///

  // SharedTaskPool
  GType function() c_gst_shared_task_pool_get_type; ///
  GstTaskPool* function() c_gst_shared_task_pool_new; ///
  uint function(GstSharedTaskPool* pool) c_gst_shared_task_pool_get_max_threads; ///
  void function(GstSharedTaskPool* pool, uint maxThreads) c_gst_shared_task_pool_set_max_threads; ///

  // StaticCaps
  void function(GstStaticCaps* staticCaps) c_gst_static_caps_cleanup; ///
  GstCaps* function(GstStaticCaps* staticCaps) c_gst_static_caps_get; ///

  // StaticPadTemplate
  GstPadTemplate* function(GstStaticPadTemplate* padTemplate) c_gst_static_pad_template_get; ///
  GstCaps* function(GstStaticPadTemplate* templ) c_gst_static_pad_template_get_caps; ///

  // Stream
  GType function() c_gst_stream_get_type; ///
  GstStream* function(const(char)* streamId, GstCaps* caps, GstStreamType type, GstStreamFlags flags) c_gst_stream_new; ///
  GstCaps* function(GstStream* stream) c_gst_stream_get_caps; ///
  GstStreamFlags function(GstStream* stream) c_gst_stream_get_stream_flags; ///
  const(char)* function(GstStream* stream) c_gst_stream_get_stream_id; ///
  GstStreamType function(GstStream* stream) c_gst_stream_get_stream_type; ///
  GstTagList* function(GstStream* stream) c_gst_stream_get_tags; ///
  void function(GstStream* stream, GstCaps* caps) c_gst_stream_set_caps; ///
  void function(GstStream* stream, GstStreamFlags flags) c_gst_stream_set_stream_flags; ///
  void function(GstStream* stream, GstStreamType streamType) c_gst_stream_set_stream_type; ///
  void function(GstStream* stream, GstTagList* tags) c_gst_stream_set_tags; ///

  // StreamCollection
  GType function() c_gst_stream_collection_get_type; ///
  GstStreamCollection* function(const(char)* upstreamId) c_gst_stream_collection_new; ///
  gboolean function(GstStreamCollection* collection, GstStream* stream) c_gst_stream_collection_add_stream; ///
  uint function(GstStreamCollection* collection) c_gst_stream_collection_get_size; ///
  GstStream* function(GstStreamCollection* collection, uint index) c_gst_stream_collection_get_stream; ///
  const(char)* function(GstStreamCollection* collection) c_gst_stream_collection_get_upstream_id; ///

  // Structure
  GType function() c_gst_structure_get_type; ///
  GstStructure* function(const(char)* string_, char** end) c_gst_structure_from_string; ///
  GstStructure* function(const(char)* name, const(char)* firstfield,  ...) c_gst_structure_new; ///
  GstStructure* function(const(char)* name) c_gst_structure_new_empty; ///
  GstStructure* function(const(char)* string_) c_gst_structure_new_from_string; ///
  GstStructure* function(GQuark nameQuark, GQuark fieldQuark,  ...) c_gst_structure_new_id; ///
  GstStructure* function(GQuark quark) c_gst_structure_new_id_empty; ///
  GstStructure* function(const(char)* name, const(char)* firstfield, void* varargs) c_gst_structure_new_valist; ///
  gboolean function(const(GstStructure)* struct1, const(GstStructure)* struct2) c_gst_structure_can_intersect; ///
  GstStructure* function(const(GstStructure)* structure) c_gst_structure_copy; ///
  void function(GstStructure* structure, GstStructureFilterMapFunc func, void* userData) c_gst_structure_filter_and_map_in_place; ///
  void function(GstStructure* structure) c_gst_structure_fixate; ///
  gboolean function(GstStructure* structure, const(char)* fieldName) c_gst_structure_fixate_field; ///
  gboolean function(GstStructure* structure, const(char)* fieldName, gboolean target) c_gst_structure_fixate_field_boolean; ///
  gboolean function(GstStructure* structure, const(char)* fieldName, double target) c_gst_structure_fixate_field_nearest_double; ///
  gboolean function(GstStructure* structure, const(char)* fieldName, int targetNumerator, int targetDenominator) c_gst_structure_fixate_field_nearest_fraction; ///
  gboolean function(GstStructure* structure, const(char)* fieldName, int target) c_gst_structure_fixate_field_nearest_int; ///
  gboolean function(GstStructure* structure, const(char)* fieldName, const(char)* target) c_gst_structure_fixate_field_string; ///
  gboolean function(const(GstStructure)* structure, GstStructureForeachFunc func, void* userData) c_gst_structure_foreach; ///
  void function(GstStructure* structure) c_gst_structure_free; ///
  gboolean function(const(GstStructure)* structure, const(char)* firstFieldname,  ...) c_gst_structure_get; ///
  gboolean function(GstStructure* structure, const(char)* fieldname, GValueArray** array) c_gst_structure_get_array; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, gboolean* value) c_gst_structure_get_boolean; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GstClockTime* value) c_gst_structure_get_clock_time; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GDate** value) c_gst_structure_get_date; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GstDateTime** value) c_gst_structure_get_date_time; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, double* value) c_gst_structure_get_double; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType enumtype, int* value) c_gst_structure_get_enum; ///
  GType function(const(GstStructure)* structure, const(char)* fieldname) c_gst_structure_get_field_type; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType flagsType, uint* value) c_gst_structure_get_flags; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, uint* valueFlags, uint* valueMask) c_gst_structure_get_flagset; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, int* valueNumerator, int* valueDenominator) c_gst_structure_get_fraction; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, int* value) c_gst_structure_get_int; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, long* value) c_gst_structure_get_int64; ///
  gboolean function(GstStructure* structure, const(char)* fieldname, GValueArray** array) c_gst_structure_get_list; ///
  const(char)* function(const(GstStructure)* structure) c_gst_structure_get_name; ///
  GQuark function(const(GstStructure)* structure) c_gst_structure_get_name_id; ///
  const(char)* function(const(GstStructure)* structure, const(char)* fieldname) c_gst_structure_get_string; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, uint* value) c_gst_structure_get_uint; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, ulong* value) c_gst_structure_get_uint64; ///
  gboolean function(const(GstStructure)* structure, const(char)* firstFieldname, void* args) c_gst_structure_get_valist; ///
  const(GValue)* function(const(GstStructure)* structure, const(char)* fieldname) c_gst_structure_get_value; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname) c_gst_structure_has_field; ///
  gboolean function(const(GstStructure)* structure, const(char)* fieldname, GType type) c_gst_structure_has_field_typed; ///
  gboolean function(const(GstStructure)* structure, const(char)* name) c_gst_structure_has_name; ///
  gboolean function(const(GstStructure)* structure, GQuark firstFieldId,  ...) c_gst_structure_id_get; ///
  gboolean function(const(GstStructure)* structure, GQuark firstFieldId, void* args) c_gst_structure_id_get_valist; ///
  const(GValue)* function(const(GstStructure)* structure, GQuark field) c_gst_structure_id_get_value; ///
  gboolean function(const(GstStructure)* structure, GQuark field) c_gst_structure_id_has_field; ///
  gboolean function(const(GstStructure)* structure, GQuark field, GType type) c_gst_structure_id_has_field_typed; ///
  void function(GstStructure* structure, GQuark fieldname,  ...) c_gst_structure_id_set; ///
  void function(GstStructure* structure, GQuark fieldname, void* varargs) c_gst_structure_id_set_valist; ///
  void function(GstStructure* structure, GQuark field, const(GValue)* value) c_gst_structure_id_set_value; ///
  void function(GstStructure* structure, GQuark field, GValue* value) c_gst_structure_id_take_value; ///
  GstStructure* function(const(GstStructure)* struct1, const(GstStructure)* struct2) c_gst_structure_intersect; ///
  gboolean function(const(GstStructure)* structure1, const(GstStructure)* structure2) c_gst_structure_is_equal; ///
  gboolean function(const(GstStructure)* subset, const(GstStructure)* superset) c_gst_structure_is_subset; ///
  gboolean function(GstStructure* structure, GstStructureMapFunc func, void* userData) c_gst_structure_map_in_place; ///
  int function(const(GstStructure)* structure) c_gst_structure_n_fields; ///
  const(char)* function(const(GstStructure)* structure, uint index) c_gst_structure_nth_field_name; ///
  void function(GstStructure* structure) c_gst_structure_remove_all_fields; ///
  void function(GstStructure* structure, const(char)* fieldname) c_gst_structure_remove_field; ///
  void function(GstStructure* structure, const(char)* fieldname,  ...) c_gst_structure_remove_fields; ///
  void function(GstStructure* structure, const(char)* fieldname, void* varargs) c_gst_structure_remove_fields_valist; ///
  char* function(const(GstStructure)* structure, GstSerializeFlags flags) c_gst_structure_serialize; ///
  char* function(const(GstStructure)* structure, GstSerializeFlags flags) c_gst_structure_serialize_full; ///
  void function(GstStructure* structure, const(char)* fieldname,  ...) c_gst_structure_set; ///
  void function(GstStructure* structure, const(char)* fieldname, const(GValueArray)* array) c_gst_structure_set_array; ///
  void function(GstStructure* structure, const(char)* fieldname, const(GValueArray)* array) c_gst_structure_set_list; ///
  void function(GstStructure* structure, const(char)* name) c_gst_structure_set_name; ///
  gboolean function(GstStructure* structure, int* refcount) c_gst_structure_set_parent_refcount; ///
  void function(GstStructure* structure, const(char)* fieldname, void* varargs) c_gst_structure_set_valist; ///
  void function(GstStructure* structure, const(char)* fieldname, const(GValue)* value) c_gst_structure_set_value; ///
  void function(GstStructure* structure, const(char)* fieldname, GValue* value) c_gst_structure_take_value; ///
  char* function(const(GstStructure)* structure) c_gst_structure_to_string; ///
  gboolean function(GstStructure** oldstrPtr, GstStructure* newstr) c_gst_structure_take; ///

  // SystemClock
  GType function() c_gst_system_clock_get_type; ///
  GstClock* function() c_gst_system_clock_obtain; ///
  void function(GstClock* newClock) c_gst_system_clock_set_default; ///

  // TagList
  GType function() c_gst_tag_list_get_type; ///
  GstTagList* function(const(char)* tag,  ...) c_gst_tag_list_new; ///
  GstTagList* function() c_gst_tag_list_new_empty; ///
  GstTagList* function(const(char)* str) c_gst_tag_list_new_from_string; ///
  GstTagList* function(void* varArgs) c_gst_tag_list_new_valist; ///
  void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag,  ...) c_gst_tag_list_add; ///
  void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, void* varArgs) c_gst_tag_list_add_valist; ///
  void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, void* varArgs) c_gst_tag_list_add_valist_values; ///
  void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag, const(GValue)* value) c_gst_tag_list_add_value; ///
  void function(GstTagList* list, GstTagMergeMode mode, const(char)* tag,  ...) c_gst_tag_list_add_values; ///
  GstTagList* function(const(GstTagList)* taglist) c_gst_tag_list_copy; ///
  void function(const(GstTagList)* list, GstTagForeachFunc func, void* userData) c_gst_tag_list_foreach; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, gboolean* value) c_gst_tag_list_get_boolean; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, gboolean* value) c_gst_tag_list_get_boolean_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, GDate** value) c_gst_tag_list_get_date; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GDate** value) c_gst_tag_list_get_date_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, GstDateTime** value) c_gst_tag_list_get_date_time; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GstDateTime** value) c_gst_tag_list_get_date_time_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, double* value) c_gst_tag_list_get_double; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, double* value) c_gst_tag_list_get_double_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, float* value) c_gst_tag_list_get_float; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, float* value) c_gst_tag_list_get_float_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, int* value) c_gst_tag_list_get_int; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, long* value) c_gst_tag_list_get_int64; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, long* value) c_gst_tag_list_get_int64_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, int* value) c_gst_tag_list_get_int_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, void** value) c_gst_tag_list_get_pointer; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, void** value) c_gst_tag_list_get_pointer_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, GstSample** sample) c_gst_tag_list_get_sample; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, GstSample** sample) c_gst_tag_list_get_sample_index; ///
  GstTagScope function(const(GstTagList)* list) c_gst_tag_list_get_scope; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, char** value) c_gst_tag_list_get_string; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, char** value) c_gst_tag_list_get_string_index; ///
  uint function(const(GstTagList)* list, const(char)* tag) c_gst_tag_list_get_tag_size; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint* value) c_gst_tag_list_get_uint; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, ulong* value) c_gst_tag_list_get_uint64; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, ulong* value) c_gst_tag_list_get_uint64_index; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, uint* value) c_gst_tag_list_get_uint_index; ///
  const(GValue)* function(const(GstTagList)* list, const(char)* tag, uint index) c_gst_tag_list_get_value_index; ///
  void function(GstTagList* into, const(GstTagList)* from, GstTagMergeMode mode) c_gst_tag_list_insert; ///
  gboolean function(const(GstTagList)* list) c_gst_tag_list_is_empty; ///
  gboolean function(const(GstTagList)* list1, const(GstTagList)* list2) c_gst_tag_list_is_equal; ///
  GstTagList* function(const(GstTagList)* list1, const(GstTagList)* list2, GstTagMergeMode mode) c_gst_tag_list_merge; ///
  int function(const(GstTagList)* list) c_gst_tag_list_n_tags; ///
  const(char)* function(const(GstTagList)* list, uint index) c_gst_tag_list_nth_tag_name; ///
  gboolean function(const(GstTagList)* list, const(char)* tag, uint index, const(char*)* value) c_gst_tag_list_peek_string_index; ///
  void function(GstTagList* list, const(char)* tag) c_gst_tag_list_remove_tag; ///
  void function(GstTagList* list, GstTagScope scope_) c_gst_tag_list_set_scope; ///
  char* function(const(GstTagList)* list) c_gst_tag_list_to_string; ///
  gboolean function(GValue* dest, const(GstTagList)* list, const(char)* tag) c_gst_tag_list_copy_value; ///

  // TagSetter
  GType function() c_gst_tag_setter_get_type; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, void* varArgs) c_gst_tag_setter_add_tag_valist; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, void* varArgs) c_gst_tag_setter_add_tag_valist_values; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag, const(GValue)* value) c_gst_tag_setter_add_tag_value; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag,  ...) c_gst_tag_setter_add_tag_values; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode, const(char)* tag,  ...) c_gst_tag_setter_add_tags; ///
  const(GstTagList)* function(GstTagSetter* setter) c_gst_tag_setter_get_tag_list; ///
  GstTagMergeMode function(GstTagSetter* setter) c_gst_tag_setter_get_tag_merge_mode; ///
  void function(GstTagSetter* setter, const(GstTagList)* list, GstTagMergeMode mode) c_gst_tag_setter_merge_tags; ///
  void function(GstTagSetter* setter) c_gst_tag_setter_reset_tags; ///
  void function(GstTagSetter* setter, GstTagMergeMode mode) c_gst_tag_setter_set_tag_merge_mode; ///

  // Task
  GType function() c_gst_task_get_type; ///
  GstTask* function(GstTaskFunction func, void* userData, GDestroyNotify notify) c_gst_task_new; ///
  void function() c_gst_task_cleanup_all; ///
  GstTaskPool* function(GstTask* task) c_gst_task_get_pool; ///
  GstTaskState function(GstTask* task) c_gst_task_get_state; ///
  gboolean function(GstTask* task) c_gst_task_join; ///
  gboolean function(GstTask* task) c_gst_task_pause; ///
  gboolean function(GstTask* task) c_gst_task_resume; ///
  void function(GstTask* task, GstTaskThreadFunc enterFunc, void* userData, GDestroyNotify notify) c_gst_task_set_enter_callback; ///
  void function(GstTask* task, GstTaskThreadFunc leaveFunc, void* userData, GDestroyNotify notify) c_gst_task_set_leave_callback; ///
  void function(GstTask* task, GRecMutex* mutex) c_gst_task_set_lock; ///
  void function(GstTask* task, GstTaskPool* pool) c_gst_task_set_pool; ///
  gboolean function(GstTask* task, GstTaskState state) c_gst_task_set_state; ///
  gboolean function(GstTask* task) c_gst_task_start; ///
  gboolean function(GstTask* task) c_gst_task_stop; ///

  // TaskPool
  GType function() c_gst_task_pool_get_type; ///
  GstTaskPool* function() c_gst_task_pool_new; ///
  void function(GstTaskPool* pool) c_gst_task_pool_cleanup; ///
  void function(GstTaskPool* pool, void* id) c_gst_task_pool_dispose_handle; ///
  void function(GstTaskPool* pool, void* id) c_gst_task_pool_join; ///
  void function(GstTaskPool* pool, GError** _err) c_gst_task_pool_prepare; ///
  void* function(GstTaskPool* pool, GstTaskPoolFunction func, void* userData, GError** _err) c_gst_task_pool_push; ///

  // Toc
  GType function() c_gst_toc_get_type; ///
  GstToc* function(GstTocScope scope_) c_gst_toc_new; ///
  void function(GstToc* toc, GstTocEntry* entry) c_gst_toc_append_entry; ///
  void function(GstToc* toc) c_gst_toc_dump; ///
  GstTocEntry* function(const(GstToc)* toc, const(char)* uid) c_gst_toc_find_entry; ///
  GList* function(const(GstToc)* toc) c_gst_toc_get_entries; ///
  GstTocScope function(const(GstToc)* toc) c_gst_toc_get_scope; ///
  GstTagList* function(const(GstToc)* toc) c_gst_toc_get_tags; ///
  void function(GstToc* toc, GstTagList* tags, GstTagMergeMode mode) c_gst_toc_merge_tags; ///
  void function(GstToc* toc, GstTagList* tags) c_gst_toc_set_tags; ///

  // TocEntry
  GType function() c_gst_toc_entry_get_type; ///
  GstTocEntry* function(GstTocEntryType type, const(char)* uid) c_gst_toc_entry_new; ///
  void function(GstTocEntry* entry, GstTocEntry* subentry) c_gst_toc_entry_append_sub_entry; ///
  GstTocEntryType function(const(GstTocEntry)* entry) c_gst_toc_entry_get_entry_type; ///
  gboolean function(const(GstTocEntry)* entry, GstTocLoopType* loopType, int* repeatCount) c_gst_toc_entry_get_loop; ///
  GstTocEntry* function(GstTocEntry* entry) c_gst_toc_entry_get_parent; ///
  gboolean function(const(GstTocEntry)* entry, long* start, long* stop) c_gst_toc_entry_get_start_stop_times; ///
  GList* function(const(GstTocEntry)* entry) c_gst_toc_entry_get_sub_entries; ///
  GstTagList* function(const(GstTocEntry)* entry) c_gst_toc_entry_get_tags; ///
  GstToc* function(GstTocEntry* entry) c_gst_toc_entry_get_toc; ///
  const(char)* function(const(GstTocEntry)* entry) c_gst_toc_entry_get_uid; ///
  gboolean function(const(GstTocEntry)* entry) c_gst_toc_entry_is_alternative; ///
  gboolean function(const(GstTocEntry)* entry) c_gst_toc_entry_is_sequence; ///
  void function(GstTocEntry* entry, GstTagList* tags, GstTagMergeMode mode) c_gst_toc_entry_merge_tags; ///
  void function(GstTocEntry* entry, GstTocLoopType loopType, int repeatCount) c_gst_toc_entry_set_loop; ///
  void function(GstTocEntry* entry, long start, long stop) c_gst_toc_entry_set_start_stop_times; ///
  void function(GstTocEntry* entry, GstTagList* tags) c_gst_toc_entry_set_tags; ///

  // TocSetter
  GType function() c_gst_toc_setter_get_type; ///
  GstToc* function(GstTocSetter* setter) c_gst_toc_setter_get_toc; ///
  void function(GstTocSetter* setter) c_gst_toc_setter_reset; ///
  void function(GstTocSetter* setter, GstToc* toc) c_gst_toc_setter_set_toc; ///

  // Tracer
  GType function() c_gst_tracer_get_type; ///
  gboolean function(GstPlugin* plugin, const(char)* name, GType type) c_gst_tracer_register; ///

  // TracerFactory
  GType function() c_gst_tracer_factory_get_type; ///
  GList* function() c_gst_tracer_factory_get_list; ///
  GType function(GstTracerFactory* factory) c_gst_tracer_factory_get_tracer_type; ///

  // TracerRecord
  GType function() c_gst_tracer_record_get_type; ///
  GstTracerRecord* function(const(char)* name, const(char)* firstfield,  ...) c_gst_tracer_record_new; ///
  void function(GstTracerRecord* self,  ...) c_gst_tracer_record_log; ///

  // TypeFind
  ulong function(GstTypeFind* find) c_gst_type_find_get_length; ///
  const(ubyte)* function(GstTypeFind* find, long offset, uint size) c_gst_type_find_peek; ///
  void function(GstTypeFind* find, uint probability, GstCaps* caps) c_gst_type_find_suggest; ///
  void function(GstTypeFind* find, uint probability, const(char)* mediaType) c_gst_type_find_suggest_empty_simple; ///
  void function(GstTypeFind* find, uint probability, const(char)* mediaType, const(char)* fieldname,  ...) c_gst_type_find_suggest_simple; ///
  gboolean function(GstPlugin* plugin, const(char)* name, uint rank, GstTypeFindFunction func, const(char)* extensions, GstCaps* possibleCaps, void* data, GDestroyNotify dataNotify) c_gst_type_find_register; ///

  // TypeFindFactory
  GType function() c_gst_type_find_factory_get_type; ///
  GList* function() c_gst_type_find_factory_get_list; ///
  void function(GstTypeFindFactory* factory, GstTypeFind* find) c_gst_type_find_factory_call_function; ///
  GstCaps* function(GstTypeFindFactory* factory) c_gst_type_find_factory_get_caps; ///
  const(char*)* function(GstTypeFindFactory* factory) c_gst_type_find_factory_get_extensions; ///
  gboolean function(GstTypeFindFactory* factory) c_gst_type_find_factory_has_function; ///

  // URIHandler
  GType function() c_gst_uri_handler_get_type; ///
  const(char*)* function(GstURIHandler* handler) c_gst_uri_handler_get_protocols; ///
  char* function(GstURIHandler* handler) c_gst_uri_handler_get_uri; ///
  GstURIType function(GstURIHandler* handler) c_gst_uri_handler_get_uri_type; ///
  gboolean function(GstURIHandler* handler, const(char)* uri, GError** _err) c_gst_uri_handler_set_uri; ///

  // Uri
  GType function() c_gst_uri_get_type; ///
  GstUri* function(const(char)* scheme, const(char)* userinfo, const(char)* host, uint port, const(char)* path, const(char)* query, const(char)* fragment) c_gst_uri_new; ///
  gboolean function(GstUri* uri, const(char)* relativePath) c_gst_uri_append_path; ///
  gboolean function(GstUri* uri, const(char)* pathSegment) c_gst_uri_append_path_segment; ///
  gboolean function(const(GstUri)* first, const(GstUri)* second) c_gst_uri_equal; ///
  GstUri* function(GstUri* base, const(char)* uri) c_gst_uri_from_string_with_base; ///
  const(char)* function(const(GstUri)* uri) c_gst_uri_get_fragment; ///
  const(char)* function(const(GstUri)* uri) c_gst_uri_get_host; ///
  GHashTable* function(const(GstUri)* uri) c_gst_uri_get_media_fragment_table; ///
  char* function(const(GstUri)* uri) c_gst_uri_get_path; ///
  GList* function(const(GstUri)* uri) c_gst_uri_get_path_segments; ///
  char* function(const(GstUri)* uri) c_gst_uri_get_path_string; ///
  uint function(const(GstUri)* uri) c_gst_uri_get_port; ///
  GList* function(const(GstUri)* uri) c_gst_uri_get_query_keys; ///
  char* function(const(GstUri)* uri) c_gst_uri_get_query_string; ///
  char* function(const(GstUri)* uri, const(GList)* keys) c_gst_uri_get_query_string_ordered; ///
  GHashTable* function(const(GstUri)* uri) c_gst_uri_get_query_table; ///
  const(char)* function(const(GstUri)* uri, const(char)* queryKey) c_gst_uri_get_query_value; ///
  const(char)* function(const(GstUri)* uri) c_gst_uri_get_scheme; ///
  const(char)* function(const(GstUri)* uri) c_gst_uri_get_userinfo; ///
  gboolean function(const(GstUri)* uri) c_gst_uri_is_normalized; ///
  gboolean function(const(GstUri)* uri) c_gst_uri_is_writable; ///
  GstUri* function(GstUri* baseUri, GstUri* refUri) c_gst_uri_join; ///
  GstUri* function(GstUri* uri) c_gst_uri_make_writable; ///
  GstUri* function(GstUri* base, const(char)* scheme, const(char)* userinfo, const(char)* host, uint port, const(char)* path, const(char)* query, const(char)* fragment) c_gst_uri_new_with_base; ///
  gboolean function(GstUri* uri) c_gst_uri_normalize; ///
  gboolean function(const(GstUri)* uri, const(char)* queryKey) c_gst_uri_query_has_key; ///
  gboolean function(GstUri* uri, const(char)* queryKey) c_gst_uri_remove_query_key; ///
  gboolean function(GstUri* uri, const(char)* fragment) c_gst_uri_set_fragment; ///
  gboolean function(GstUri* uri, const(char)* host) c_gst_uri_set_host; ///
  gboolean function(GstUri* uri, const(char)* path) c_gst_uri_set_path; ///
  gboolean function(GstUri* uri, GList* pathSegments) c_gst_uri_set_path_segments; ///
  gboolean function(GstUri* uri, const(char)* path) c_gst_uri_set_path_string; ///
  gboolean function(GstUri* uri, uint port) c_gst_uri_set_port; ///
  gboolean function(GstUri* uri, const(char)* query) c_gst_uri_set_query_string; ///
  gboolean function(GstUri* uri, GHashTable* queryTable) c_gst_uri_set_query_table; ///
  gboolean function(GstUri* uri, const(char)* queryKey, const(char)* queryValue) c_gst_uri_set_query_value; ///
  gboolean function(GstUri* uri, const(char)* scheme) c_gst_uri_set_scheme; ///
  gboolean function(GstUri* uri, const(char)* userinfo) c_gst_uri_set_userinfo; ///
  char* function(const(GstUri)* uri) c_gst_uri_to_string; ///
  char* function(const(GstUri)* uri, const(GList)* keys) c_gst_uri_to_string_with_keys; ///
  char* function(const(char)* protocol, const(char)* location) c_gst_uri_construct; ///
  GstUri* function(const(char)* uri) c_gst_uri_from_string; ///
  GstUri* function(const(char)* uri) c_gst_uri_from_string_escaped; ///
  char* function(const(char)* uri) c_gst_uri_get_location; ///
  char* function(const(char)* uri) c_gst_uri_get_protocol; ///
  gboolean function(const(char)* uri, const(char)* protocol) c_gst_uri_has_protocol; ///
  gboolean function(const(char)* uri) c_gst_uri_is_valid; ///
  char* function(const(char)* baseUri, const(char)* refUri) c_gst_uri_join_strings; ///
  gboolean function(GstURIType type, const(char)* protocol) c_gst_uri_protocol_is_supported; ///
  gboolean function(const(char)* protocol) c_gst_uri_protocol_is_valid; ///

  // ValueArray
  GType function() c_gst_value_array_get_type; ///
  void function(GValue* value, GValue* appendValue) c_gst_value_array_append_and_take_value; ///
  void function(GValue* value, const(GValue)* appendValue) c_gst_value_array_append_value; ///
  uint function(const(GValue)* value) c_gst_value_array_get_size; ///
  const(GValue)* function(const(GValue)* value, uint index) c_gst_value_array_get_value; ///
  GValue* function(GValue* value, uint prealloc) c_gst_value_array_init; ///
  void function(GValue* value, const(GValue)* prependValue) c_gst_value_array_prepend_value; ///

  // ValueList
  GType function() c_gst_value_list_get_type; ///
  void function(GValue* value, GValue* appendValue) c_gst_value_list_append_and_take_value; ///
  void function(GValue* value, const(GValue)* appendValue) c_gst_value_list_append_value; ///
  void function(GValue* dest, const(GValue)* value1, const(GValue)* value2) c_gst_value_list_concat; ///
  uint function(const(GValue)* value) c_gst_value_list_get_size; ///
  const(GValue)* function(const(GValue)* value, uint index) c_gst_value_list_get_value; ///
  GValue* function(GValue* value, uint prealloc) c_gst_value_list_init; ///
  void function(GValue* dest, const(GValue)* value1, const(GValue)* value2) c_gst_value_list_merge; ///
  void function(GValue* value, const(GValue)* prependValue) c_gst_value_list_prepend_value; ///

  // global
  gboolean function(const(GstClockTime)* xy, GstClockTime* temp, uint n, GstClockTime* mNum, GstClockTime* mDenom, GstClockTime* b, GstClockTime* xbase, double* rSquared) c_gst_calculate_linear_regression; ///
  void function(GstMiniObject** objectPtr) c_gst_clear_mini_object; ///
  void function(GstObject** objectPtr) c_gst_clear_object; ///
  void function(GstStructure** structurePtr) c_gst_clear_structure; ///
  void function(GstLogFunction func, void* userData, GDestroyNotify notify) c_gst_debug_add_log_function; ///
  void function(uint maxSizePerThread, uint threadTimeout) c_gst_debug_add_ring_buffer_logger; ///
  char* function(GstBin* bin, GstDebugGraphDetails details) c_gst_debug_bin_to_dot_data; ///
  void function(GstBin* bin, GstDebugGraphDetails details, const(char)* fileName) c_gst_debug_bin_to_dot_file; ///
  void function(GstBin* bin, GstDebugGraphDetails details, const(char)* fileName) c_gst_debug_bin_to_dot_file_with_ts; ///
  char* function(uint colorinfo) c_gst_debug_construct_term_color; ///
  int function(uint colorinfo) c_gst_debug_construct_win_color; ///
  GSList* function() c_gst_debug_get_all_categories; ///
  GstDebugColorMode function() c_gst_debug_get_color_mode; ///
  GstDebugLevel function() c_gst_debug_get_default_threshold; ///
  char* function(GstStackTraceFlags flags) c_gst_debug_get_stack_trace; ///
  gboolean function() c_gst_debug_is_active; ///
  gboolean function() c_gst_debug_is_colored; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format,  ...) c_gst_debug_log; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message, void* userData) c_gst_debug_log_default; ///
  char* function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, GstDebugMessage* message) c_gst_debug_log_get_line; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format,  ...) c_gst_debug_log_id; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* messageString) c_gst_debug_log_id_literal; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, const(char)* id, const(char)* format, void* args) c_gst_debug_log_id_valist; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* messageString) c_gst_debug_log_literal; ///
  void function(GstDebugCategory* category, GstDebugLevel level, const(char)* file, const(char)* function_, int line, GObject* object, const(char)* format, void* args) c_gst_debug_log_valist; ///
  void function() c_gst_debug_print_stack_trace; ///
  uint function(GstLogFunction func) c_gst_debug_remove_log_function; ///
  uint function(void* data) c_gst_debug_remove_log_function_by_data; ///
  void function() c_gst_debug_remove_ring_buffer_logger; ///
  char** function() c_gst_debug_ring_buffer_logger_get_logs; ///
  void function(gboolean active) c_gst_debug_set_active; ///
  void function(GstDebugColorMode mode) c_gst_debug_set_color_mode; ///
  void function(const(char)* mode) c_gst_debug_set_color_mode_from_string; ///
  void function(gboolean colored) c_gst_debug_set_colored; ///
  void function(GstDebugLevel level) c_gst_debug_set_default_threshold; ///
  void function(const(char)* name, GstDebugLevel level) c_gst_debug_set_threshold_for_name; ///
  void function(const(char)* list, gboolean reset) c_gst_debug_set_threshold_from_string; ///
  void function(const(char)* name) c_gst_debug_unset_threshold_for_name; ///
  void function() c_gst_deinit; ///
  gboolean function(GstPlugin* plugin, GType type) c_gst_dynamic_type_register; ///
  char* function(GQuark domain, int code) c_gst_error_get_message; ///
  char* function(const(char)* filename, GError** _err) c_gst_filename_to_uri; ///
  const(char)* function(GstFlowReturn ret) c_gst_flow_get_name; ///
  GQuark function(GstFlowReturn ret) c_gst_flow_to_quark; ///
  gboolean function(const(GstFormat)* formats, GstFormat format) c_gst_formats_contains; ///
  const(char)* function() c_gst_get_main_executable_path; ///
  char* function(const(char)* format,  ...) c_gst_info_strdup_printf; ///
  char* function(const(char)* format, void* args) c_gst_info_strdup_vprintf; ///
  int function(char** result, const(char)* format, void* args) c_gst_info_vasprintf; ///
  void function(int* argc, char*** argv) c_gst_init; ///
  gboolean function(int* argc, char*** argv, GError** _err) c_gst_init_check; ///
  GOptionGroup* function() c_gst_init_get_option_group; ///
  gboolean function(const(void)* obj) c_gst_is_caps_features; ///
  gboolean function() c_gst_is_initialized; ///
  GstStructure* function(const(char)* name,  ...) c_gst_make_element_message_details; ///
  GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, GParamSpec* elementSpec, GParamFlags flags) c_gst_param_spec_array; ///
  GParamSpec* function(const(char)* name, const(char)* nick, const(char)* blurb, int minNum, int minDenom, int maxNum, int maxDenom, int defaultNum, int defaultDenom, GParamFlags flags) c_gst_param_spec_fraction; ///
  GType function() c_gst_parent_buffer_meta_api_get_type; ///
  GstElement* function(const(char)* binDescription, gboolean ghostUnlinkedPads, GError** _err) c_gst_parse_bin_from_description; ///
  GstElement* function(const(char)* binDescription, gboolean ghostUnlinkedPads, GstParseContext* context, GstParseFlags flags, GError** _err) c_gst_parse_bin_from_description_full; ///
  GstElement* function(const(char)* pipelineDescription, GError** _err) c_gst_parse_launch; ///
  GstElement* function(const(char)* pipelineDescription, GstParseContext* context, GstParseFlags flags, GError** _err) c_gst_parse_launch_full; ///
  GstElement* function(const(char*)* argv, GError** _err) c_gst_parse_launchv; ///
  GstElement* function(const(char*)* argv, GstParseContext* context, GstParseFlags flags, GError** _err) c_gst_parse_launchv_full; ///
  void function(const(char)* format,  ...) c_gst_print; ///
  void function(const(char)* format,  ...) c_gst_printerr; ///
  void function(const(char)* format,  ...) c_gst_printerrln; ///
  void function(const(char)* format,  ...) c_gst_println; ///
  char** function(const(char*)* systemIdentifiers) c_gst_protection_filter_systems_by_available_decryptors; ///
  GType function() c_gst_protection_meta_api_get_type; ///
  const(char)* function(const(char*)* systemIdentifiers) c_gst_protection_select_system; ///
  GType function() c_gst_reference_timestamp_meta_api_get_type; ///
  gboolean function() c_gst_segtrap_is_enabled; ///
  void function(gboolean enabled) c_gst_segtrap_set_enabled; ///
  GType function() c_gst_static_caps_get_type; ///
  GType function() c_gst_static_pad_template_get_type; ///
  gboolean function(const(char)* tag) c_gst_tag_exists; ///
  const(char)* function(const(char)* tag) c_gst_tag_get_description; ///
  GstTagFlag function(const(char)* tag) c_gst_tag_get_flag; ///
  const(char)* function(const(char)* tag) c_gst_tag_get_nick; ///
  GType function(const(char)* tag) c_gst_tag_get_type; ///
  gboolean function(const(char)* tag) c_gst_tag_is_fixed; ///
  void function(GValue* dest, const(GValue)* src) c_gst_tag_merge_strings_with_comma; ///
  void function(GValue* dest, const(GValue)* src) c_gst_tag_merge_use_first; ///
  void function(const(char)* name, GstTagFlag flag, GType type, const(char)* nick, const(char)* blurb, GstTagMergeFunc func) c_gst_tag_register; ///
  void function(const(char)* name, GstTagFlag flag, GType type, const(char)* nick, const(char)* blurb, GstTagMergeFunc func) c_gst_tag_register_static; ///
  GList* function() c_gst_tracing_get_active_tracers; ///
  void function(GstTracer* tracer, const(char)* detail, GCallback func) c_gst_tracing_register_hook; ///
  GType function() c_gst_type_find_get_type; ///
  gboolean function(GType type, GstPluginAPIFlags* flags) c_gst_type_is_plugin_api; ///
  void function(GType type, GstPluginAPIFlags flags) c_gst_type_mark_as_plugin_api; ///
  gboolean function() c_gst_update_registry; ///
  void* function(void* array, uint numElements, size_t elementSize, GCompareDataFunc searchFunc, GstSearchMode mode, const(void)* searchData, void* userData) c_gst_util_array_binary_search; ///
  uint function(uint v) c_gst_util_ceil_log2; ///
  void function(double src, int* destN, int* destD) c_gst_util_double_to_fraction; ///
  void function(GstBuffer* buf) c_gst_util_dump_buffer; ///
  void function(const(ubyte)* mem, uint size) c_gst_util_dump_mem; ///
  int function(const(char)* a, const(char)* b) c_gst_util_filename_compare; ///
  gboolean function(int aN, int aD, int bN, int bD, int* resN, int* resD) c_gst_util_fraction_add; ///
  int function(int aN, int aD, int bN, int bD) c_gst_util_fraction_compare; ///
  gboolean function(int aN, int aD, int bN, int bD, int* resN, int* resD) c_gst_util_fraction_multiply; ///
  void function(int srcN, int srcD, double* dest) c_gst_util_fraction_to_double; ///
  ulong function(double value) c_gst_util_gdouble_to_guint64; ///
  gboolean function(GObject* object, const(char)* name, GValueArray** array) c_gst_util_get_object_array; ///
  GstClockTime function() c_gst_util_get_timestamp; ///
  int function(int a, int b) c_gst_util_greatest_common_divisor; ///
  long function(long a, long b) c_gst_util_greatest_common_divisor_int64; ///
  uint function() c_gst_util_group_id_next; ///
  double function(ulong value) c_gst_util_guint64_to_gdouble; ///
  int function(uint s1, uint s2) c_gst_util_seqnum_compare; ///
  uint function() c_gst_util_seqnum_next; ///
  void function(GObject* object, const(char)* name, const(char)* value) c_gst_util_set_object_arg; ///
  gboolean function(GObject* object, const(char)* name, const(GValueArray)* array) c_gst_util_set_object_array; ///
  void function(GValue* value, const(char)* valueStr) c_gst_util_set_value_from_string; ///
  void function(int* numerator, int* denominator, uint nTerms, uint threshold) c_gst_util_simplify_fraction; ///
  ulong function(ulong val, ulong num, ulong denom) c_gst_util_uint64_scale; ///
  ulong function(ulong val, ulong num, ulong denom) c_gst_util_uint64_scale_ceil; ///
  ulong function(ulong val, int num, int denom) c_gst_util_uint64_scale_int; ///
  ulong function(ulong val, int num, int denom) c_gst_util_uint64_scale_int_ceil; ///
  ulong function(ulong val, int num, int denom) c_gst_util_uint64_scale_int_round; ///
  ulong function(ulong val, ulong num, ulong denom) c_gst_util_uint64_scale_round; ///
  gboolean function(const(GValue)* value1, const(GValue)* value2) c_gst_value_can_compare; ///
  gboolean function(const(GValue)* value1, const(GValue)* value2) c_gst_value_can_intersect; ///
  gboolean function(const(GValue)* minuend, const(GValue)* subtrahend) c_gst_value_can_subtract; ///
  gboolean function(const(GValue)* value1, const(GValue)* value2) c_gst_value_can_union; ///
  int function(const(GValue)* value1, const(GValue)* value2) c_gst_value_compare; ///
  gboolean function(GValue* dest, const(char)* src) c_gst_value_deserialize; ///
  gboolean function(GValue* dest, const(char)* src, GParamSpec* pspec) c_gst_value_deserialize_with_pspec; ///
  gboolean function(GValue* dest, const(GValue)* src) c_gst_value_fixate; ///
  gboolean function(GValue* product, const(GValue)* factor1, const(GValue)* factor2) c_gst_value_fraction_multiply; ///
  gboolean function(GValue* dest, const(GValue)* minuend, const(GValue)* subtrahend) c_gst_value_fraction_subtract; ///
  ulong function(const(GValue)* value) c_gst_value_get_bitmask; ///
  const(GstCaps)* function(const(GValue)* value) c_gst_value_get_caps; ///
  const(GstCapsFeatures)* function(const(GValue)* value) c_gst_value_get_caps_features; ///
  double function(const(GValue)* value) c_gst_value_get_double_range_max; ///
  double function(const(GValue)* value) c_gst_value_get_double_range_min; ///
  uint function(const(GValue)* value) c_gst_value_get_flagset_flags; ///
  uint function(const(GValue)* value) c_gst_value_get_flagset_mask; ///
  int function(const(GValue)* value) c_gst_value_get_fraction_denominator; ///
  int function(const(GValue)* value) c_gst_value_get_fraction_numerator; ///
  const(GValue)* function(const(GValue)* value) c_gst_value_get_fraction_range_max; ///
  const(GValue)* function(const(GValue)* value) c_gst_value_get_fraction_range_min; ///
  long function(const(GValue)* value) c_gst_value_get_int64_range_max; ///
  long function(const(GValue)* value) c_gst_value_get_int64_range_min; ///
  long function(const(GValue)* value) c_gst_value_get_int64_range_step; ///
  int function(const(GValue)* value) c_gst_value_get_int_range_max; ///
  int function(const(GValue)* value) c_gst_value_get_int_range_min; ///
  int function(const(GValue)* value) c_gst_value_get_int_range_step; ///
  const(GstStructure)* function(const(GValue)* value) c_gst_value_get_structure; ///
  void function(GValue* dest, const(GValue)* src) c_gst_value_init_and_copy; ///
  gboolean function(GValue* dest, const(GValue)* value1, const(GValue)* value2) c_gst_value_intersect; ///
  gboolean function(const(GValue)* value) c_gst_value_is_fixed; ///
  gboolean function(const(GValue)* value1, const(GValue)* value2) c_gst_value_is_subset; ///
  void function(const(GstValueTable)* table) c_gst_value_register; ///
  char* function(const(GValue)* value) c_gst_value_serialize; ///
  void function(GValue* value, ulong bitmask) c_gst_value_set_bitmask; ///
  void function(GValue* value, const(GstCaps)* caps) c_gst_value_set_caps; ///
  void function(GValue* value, const(GstCapsFeatures)* features) c_gst_value_set_caps_features; ///
  void function(GValue* value, double start, double end) c_gst_value_set_double_range; ///
  void function(GValue* value, uint flags, uint mask) c_gst_value_set_flagset; ///
  void function(GValue* value, int numerator, int denominator) c_gst_value_set_fraction; ///
  void function(GValue* value, const(GValue)* start, const(GValue)* end) c_gst_value_set_fraction_range; ///
  void function(GValue* value, int numeratorStart, int denominatorStart, int numeratorEnd, int denominatorEnd) c_gst_value_set_fraction_range_full; ///
  void function(GValue* value, long start, long end) c_gst_value_set_int64_range; ///
  void function(GValue* value, long start, long end, long step) c_gst_value_set_int64_range_step; ///
  void function(GValue* value, int start, int end) c_gst_value_set_int_range; ///
  void function(GValue* value, int start, int end, int step) c_gst_value_set_int_range_step; ///
  void function(GValue* value, const(GstStructure)* structure) c_gst_value_set_structure; ///
  gboolean function(GValue* dest, const(GValue)* minuend, const(GValue)* subtrahend) c_gst_value_subtract; ///
  gboolean function(GValue* dest, const(GValue)* value1, const(GValue)* value2) c_gst_value_union; ///
  void function(uint* major, uint* minor, uint* micro, uint* nano) c_gst_version; ///
  char* function() c_gst_version_string; ///

  // CoreError
  GQuark function() c_gst_core_error_quark; ///

  // DebugLevel
  const(char)* function(GstDebugLevel level) c_gst_debug_level_get_name; ///

  // EventType
  GstEventTypeFlags function(GstEventType type) c_gst_event_type_get_flags; ///
  const(char)* function(GstEventType type) c_gst_event_type_get_name; ///
  GQuark function(GstEventType type) c_gst_event_type_to_quark; ///
  uint function(GstEventType type) c_gst_event_type_to_sticky_ordering; ///

  // Format
  GstFormat function(const(char)* nick) c_gst_format_get_by_nick; ///
  const(GstFormatDefinition)* function(GstFormat format) c_gst_format_get_details; ///
  const(char)* function(GstFormat format) c_gst_format_get_name; ///
  GstIterator* function() c_gst_format_iterate_definitions; ///
  GstFormat function(const(char)* nick, const(char)* description) c_gst_format_register; ///
  GQuark function(GstFormat format) c_gst_format_to_quark; ///

  // LibraryError
  GQuark function() c_gst_library_error_quark; ///

  // MessageType
  const(char)* function(GstMessageType type) c_gst_message_type_get_name; ///
  GQuark function(GstMessageType type) c_gst_message_type_to_quark; ///

  // PadMode
  const(char)* function(GstPadMode mode) c_gst_pad_mode_get_name; ///

  // ParseError
  GQuark function() c_gst_parse_error_quark; ///

  // PluginError
  GQuark function() c_gst_plugin_error_quark; ///

  // QueryType
  GstQueryTypeFlags function(GstQueryType type) c_gst_query_type_get_flags; ///
  const(char)* function(GstQueryType type) c_gst_query_type_get_name; ///
  GQuark function(GstQueryType type) c_gst_query_type_to_quark; ///

  // ResourceError
  GQuark function() c_gst_resource_error_quark; ///

  // StateChange
  const(char)* function(GstStateChange transition) c_gst_state_change_get_name; ///

  // StreamError
  GQuark function() c_gst_stream_error_quark; ///

  // StreamType
  const(char)* function(GstStreamType stype) c_gst_stream_type_get_name; ///

  // TocEntryType
  const(char)* function(GstTocEntryType type) c_gst_toc_entry_type_get_nick; ///

  // URIError
  GQuark function() c_gst_uri_error_quark; ///
}

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
alias gst_buffer_iterate_meta = c_gst_buffer_iterate_meta;

/** */
alias gst_buffer_iterate_meta_filtered = c_gst_buffer_iterate_meta_filtered;

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
alias gst_buffer_unset_flags = c_gst_buffer_unset_flags;

/** */
alias gst_buffer_get_max_memory = c_gst_buffer_get_max_memory;

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
alias gst_buffer_list_length = c_gst_buffer_list_length;

/** */
alias gst_buffer_list_remove = c_gst_buffer_list_remove;

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
alias gst_caps_new_simple = c_gst_caps_new_simple;

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
alias gst_caps_set_simple_valist = c_gst_caps_set_simple_valist;

/** */
alias gst_caps_set_value = c_gst_caps_set_value;

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
alias gst_caps_from_string = c_gst_caps_from_string;

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
alias gst_caps_features_new_id_valist = c_gst_caps_features_new_id_valist;

/** */
alias gst_caps_features_new_single = c_gst_caps_features_new_single;

/** */
alias gst_caps_features_new_valist = c_gst_caps_features_new_valist;

/** */
alias gst_caps_features_add = c_gst_caps_features_add;

/** */
alias gst_caps_features_add_id = c_gst_caps_features_add_id;

/** */
alias gst_caps_features_contains = c_gst_caps_features_contains;

/** */
alias gst_caps_features_contains_id = c_gst_caps_features_contains_id;

/** */
alias gst_caps_features_copy = c_gst_caps_features_copy;

/** */
alias gst_caps_features_free = c_gst_caps_features_free;

/** */
alias gst_caps_features_get_nth = c_gst_caps_features_get_nth;

/** */
alias gst_caps_features_get_nth_id = c_gst_caps_features_get_nth_id;

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
alias gst_context_get_context_type = c_gst_context_get_context_type;

/** */
alias gst_context_get_structure = c_gst_context_get_structure;

/** */
alias gst_context_has_context_type = c_gst_context_has_context_type;

/** */
alias gst_context_is_persistent = c_gst_context_is_persistent;

/** */
alias gst_context_writable_structure = c_gst_context_writable_structure;

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
alias gst_event_writable_structure = c_gst_event_writable_structure;

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
alias gst_memory_make_mapped = c_gst_memory_make_mapped;

/** */
alias gst_memory_map = c_gst_memory_map;

/** */
alias gst_memory_resize = c_gst_memory_resize;

/** */
alias gst_memory_share = c_gst_memory_share;

/** */
alias gst_memory_unmap = c_gst_memory_unmap;

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
alias gst_message_parse_device_removed = c_gst_message_parse_device_removed;

/** */
alias gst_message_parse_error = c_gst_message_parse_error;

/** */
alias gst_message_parse_error_details = c_gst_message_parse_error_details;

/** */
alias gst_message_parse_group_id = c_gst_message_parse_group_id;

/** */
alias gst_message_parse_have_context = c_gst_message_parse_have_context;

/** */
alias gst_message_parse_info = c_gst_message_parse_info;

/** */
alias gst_message_parse_info_details = c_gst_message_parse_info_details;

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
alias gst_message_set_buffering_stats = c_gst_message_set_buffering_stats;

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
alias gst_message_writable_structure = c_gst_message_writable_structure;

/** */
alias gst_message_replace = c_gst_message_replace;

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
alias gst_meta_api_type_get_tags = c_gst_meta_api_type_get_tags;

/** */
alias gst_meta_api_type_has_tag = c_gst_meta_api_type_has_tag;

/** */
alias gst_meta_api_type_register = c_gst_meta_api_type_register;

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
alias gst_pad_probe_info_get_query = c_gst_pad_probe_info_get_query;

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
alias gst_promise_reply = c_gst_promise_reply;

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
alias gst_query_writable_structure = c_gst_query_writable_structure;

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
alias gst_sample_set_buffer = c_gst_sample_set_buffer;

/** */
alias gst_sample_set_buffer_list = c_gst_sample_set_buffer_list;

/** */
alias gst_sample_set_caps = c_gst_sample_set_caps;

/** */
alias gst_sample_set_info = c_gst_sample_set_info;

/** */
alias gst_sample_set_segment = c_gst_sample_set_segment;

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
alias gst_static_caps_cleanup = c_gst_static_caps_cleanup;

/** */
alias gst_static_caps_get = c_gst_static_caps_get;

// StaticPadTemplate

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
alias gst_structure_new_valist = c_gst_structure_new_valist;

/** */
alias gst_structure_can_intersect = c_gst_structure_can_intersect;

/** */
alias gst_structure_copy = c_gst_structure_copy;

/** */
alias gst_structure_filter_and_map_in_place = c_gst_structure_filter_and_map_in_place;

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
alias gst_structure_free = c_gst_structure_free;

/** */
alias gst_structure_get = c_gst_structure_get;

/** */
alias gst_structure_get_array = c_gst_structure_get_array;

/** */
alias gst_structure_get_boolean = c_gst_structure_get_boolean;

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
alias gst_structure_id_take_value = c_gst_structure_id_take_value;

/** */
alias gst_structure_intersect = c_gst_structure_intersect;

/** */
alias gst_structure_is_equal = c_gst_structure_is_equal;

/** */
alias gst_structure_is_subset = c_gst_structure_is_subset;

/** */
alias gst_structure_map_in_place = c_gst_structure_map_in_place;

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
alias gst_structure_set_parent_refcount = c_gst_structure_set_parent_refcount;

/** */
alias gst_structure_set_valist = c_gst_structure_set_valist;

/** */
alias gst_structure_set_value = c_gst_structure_set_value;

/** */
alias gst_structure_take_value = c_gst_structure_take_value;

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
alias gst_tag_list_merge = c_gst_tag_list_merge;

/** */
alias gst_tag_list_n_tags = c_gst_tag_list_n_tags;

/** */
alias gst_tag_list_nth_tag_name = c_gst_tag_list_nth_tag_name;

/** */
alias gst_tag_list_peek_string_index = c_gst_tag_list_peek_string_index;

/** */
alias gst_tag_list_remove_tag = c_gst_tag_list_remove_tag;

/** */
alias gst_tag_list_set_scope = c_gst_tag_list_set_scope;

/** */
alias gst_tag_list_to_string = c_gst_tag_list_to_string;

/** */
alias gst_tag_list_copy_value = c_gst_tag_list_copy_value;

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

// global

/** */
alias gst_calculate_linear_regression = c_gst_calculate_linear_regression;

/** */
alias gst_clear_mini_object = c_gst_clear_mini_object;

/** */
alias gst_clear_object = c_gst_clear_object;

/** */
alias gst_clear_structure = c_gst_clear_structure;

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
alias gst_debug_log_id_valist = c_gst_debug_log_id_valist;

/** */
alias gst_debug_log_literal = c_gst_debug_log_literal;

/** */
alias gst_debug_log_valist = c_gst_debug_log_valist;

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
alias gst_static_caps_get_type = c_gst_static_caps_get_type;

/** */
alias gst_static_pad_template_get_type = c_gst_static_pad_template_get_type;

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
alias gst_type_find_get_type = c_gst_type_find_get_type;

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
alias gst_util_fraction_add = c_gst_util_fraction_add;

/** */
alias gst_util_fraction_compare = c_gst_util_fraction_compare;

/** */
alias gst_util_fraction_multiply = c_gst_util_fraction_multiply;

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

// StateChange

/** */
alias gst_state_change_get_name = c_gst_state_change_get_name;

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
  auto libs = gidResolveLibs(LIBS);

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
  gidLink(cast(void**)&gst_buffer_iterate_meta, "gst_buffer_iterate_meta", libs);
  gidLink(cast(void**)&gst_buffer_iterate_meta_filtered, "gst_buffer_iterate_meta_filtered", libs);
  gidLink(cast(void**)&gst_buffer_map, "gst_buffer_map", libs);
  gidLink(cast(void**)&gst_buffer_map_range, "gst_buffer_map_range", libs);
  gidLink(cast(void**)&gst_buffer_memcmp, "gst_buffer_memcmp", libs);
  gidLink(cast(void**)&gst_buffer_memset, "gst_buffer_memset", libs);
  gidLink(cast(void**)&gst_buffer_n_memory, "gst_buffer_n_memory", libs);
  gidLink(cast(void**)&gst_buffer_peek_memory, "gst_buffer_peek_memory", libs);
  gidLink(cast(void**)&gst_buffer_prepend_memory, "gst_buffer_prepend_memory", libs);
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
  gidLink(cast(void**)&gst_buffer_unset_flags, "gst_buffer_unset_flags", libs);
  gidLink(cast(void**)&gst_buffer_get_max_memory, "gst_buffer_get_max_memory", libs);

  // BufferList
  gidLink(cast(void**)&gst_buffer_list_get_type, "gst_buffer_list_get_type", libs);
  gidLink(cast(void**)&gst_buffer_list_new, "gst_buffer_list_new", libs);
  gidLink(cast(void**)&gst_buffer_list_new_sized, "gst_buffer_list_new_sized", libs);
  gidLink(cast(void**)&gst_buffer_list_calculate_size, "gst_buffer_list_calculate_size", libs);
  gidLink(cast(void**)&gst_buffer_list_copy_deep, "gst_buffer_list_copy_deep", libs);
  gidLink(cast(void**)&gst_buffer_list_foreach, "gst_buffer_list_foreach", libs);
  gidLink(cast(void**)&gst_buffer_list_get, "gst_buffer_list_get", libs);
  gidLink(cast(void**)&gst_buffer_list_get_writable, "gst_buffer_list_get_writable", libs);
  gidLink(cast(void**)&gst_buffer_list_insert, "gst_buffer_list_insert", libs);
  gidLink(cast(void**)&gst_buffer_list_length, "gst_buffer_list_length", libs);
  gidLink(cast(void**)&gst_buffer_list_remove, "gst_buffer_list_remove", libs);

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
  gidLink(cast(void**)&gst_caps_new_simple, "gst_caps_new_simple", libs);
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
  gidLink(cast(void**)&gst_caps_map_in_place, "gst_caps_map_in_place", libs);
  gidLink(cast(void**)&gst_caps_merge, "gst_caps_merge", libs);
  gidLink(cast(void**)&gst_caps_merge_structure, "gst_caps_merge_structure", libs);
  gidLink(cast(void**)&gst_caps_merge_structure_full, "gst_caps_merge_structure_full", libs);
  gidLink(cast(void**)&gst_caps_normalize, "gst_caps_normalize", libs);
  gidLink(cast(void**)&gst_caps_remove_structure, "gst_caps_remove_structure", libs);
  gidLink(cast(void**)&gst_caps_serialize, "gst_caps_serialize", libs);
  gidLink(cast(void**)&gst_caps_set_features, "gst_caps_set_features", libs);
  gidLink(cast(void**)&gst_caps_set_features_simple, "gst_caps_set_features_simple", libs);
  gidLink(cast(void**)&gst_caps_set_simple, "gst_caps_set_simple", libs);
  gidLink(cast(void**)&gst_caps_set_simple_valist, "gst_caps_set_simple_valist", libs);
  gidLink(cast(void**)&gst_caps_set_value, "gst_caps_set_value", libs);
  gidLink(cast(void**)&gst_caps_simplify, "gst_caps_simplify", libs);
  gidLink(cast(void**)&gst_caps_steal_structure, "gst_caps_steal_structure", libs);
  gidLink(cast(void**)&gst_caps_subtract, "gst_caps_subtract", libs);
  gidLink(cast(void**)&gst_caps_to_string, "gst_caps_to_string", libs);
  gidLink(cast(void**)&gst_caps_truncate, "gst_caps_truncate", libs);
  gidLink(cast(void**)&gst_caps_from_string, "gst_caps_from_string", libs);

  // CapsFeatures
  gidLink(cast(void**)&gst_caps_features_get_type, "gst_caps_features_get_type", libs);
  gidLink(cast(void**)&gst_caps_features_new, "gst_caps_features_new", libs);
  gidLink(cast(void**)&gst_caps_features_new_any, "gst_caps_features_new_any", libs);
  gidLink(cast(void**)&gst_caps_features_new_empty, "gst_caps_features_new_empty", libs);
  gidLink(cast(void**)&gst_caps_features_new_id, "gst_caps_features_new_id", libs);
  gidLink(cast(void**)&gst_caps_features_new_id_valist, "gst_caps_features_new_id_valist", libs);
  gidLink(cast(void**)&gst_caps_features_new_single, "gst_caps_features_new_single", libs);
  gidLink(cast(void**)&gst_caps_features_new_valist, "gst_caps_features_new_valist", libs);
  gidLink(cast(void**)&gst_caps_features_add, "gst_caps_features_add", libs);
  gidLink(cast(void**)&gst_caps_features_add_id, "gst_caps_features_add_id", libs);
  gidLink(cast(void**)&gst_caps_features_contains, "gst_caps_features_contains", libs);
  gidLink(cast(void**)&gst_caps_features_contains_id, "gst_caps_features_contains_id", libs);
  gidLink(cast(void**)&gst_caps_features_copy, "gst_caps_features_copy", libs);
  gidLink(cast(void**)&gst_caps_features_free, "gst_caps_features_free", libs);
  gidLink(cast(void**)&gst_caps_features_get_nth, "gst_caps_features_get_nth", libs);
  gidLink(cast(void**)&gst_caps_features_get_nth_id, "gst_caps_features_get_nth_id", libs);
  gidLink(cast(void**)&gst_caps_features_get_size, "gst_caps_features_get_size", libs);
  gidLink(cast(void**)&gst_caps_features_is_any, "gst_caps_features_is_any", libs);
  gidLink(cast(void**)&gst_caps_features_is_equal, "gst_caps_features_is_equal", libs);
  gidLink(cast(void**)&gst_caps_features_remove, "gst_caps_features_remove", libs);
  gidLink(cast(void**)&gst_caps_features_remove_id, "gst_caps_features_remove_id", libs);
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
  gidLink(cast(void**)&gst_context_get_context_type, "gst_context_get_context_type", libs);
  gidLink(cast(void**)&gst_context_get_structure, "gst_context_get_structure", libs);
  gidLink(cast(void**)&gst_context_has_context_type, "gst_context_has_context_type", libs);
  gidLink(cast(void**)&gst_context_is_persistent, "gst_context_is_persistent", libs);
  gidLink(cast(void**)&gst_context_writable_structure, "gst_context_writable_structure", libs);

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
  gidLink(cast(void**)&gst_event_copy_segment, "gst_event_copy_segment", libs);
  gidLink(cast(void**)&gst_event_get_running_time_offset, "gst_event_get_running_time_offset", libs);
  gidLink(cast(void**)&gst_event_get_seqnum, "gst_event_get_seqnum", libs);
  gidLink(cast(void**)&gst_event_get_structure, "gst_event_get_structure", libs);
  gidLink(cast(void**)&gst_event_has_name, "gst_event_has_name", libs);
  gidLink(cast(void**)&gst_event_has_name_id, "gst_event_has_name_id", libs);
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
  gidLink(cast(void**)&gst_event_set_gap_flags, "gst_event_set_gap_flags", libs);
  gidLink(cast(void**)&gst_event_set_group_id, "gst_event_set_group_id", libs);
  gidLink(cast(void**)&gst_event_set_running_time_offset, "gst_event_set_running_time_offset", libs);
  gidLink(cast(void**)&gst_event_set_seek_trickmode_interval, "gst_event_set_seek_trickmode_interval", libs);
  gidLink(cast(void**)&gst_event_set_seqnum, "gst_event_set_seqnum", libs);
  gidLink(cast(void**)&gst_event_set_stream, "gst_event_set_stream", libs);
  gidLink(cast(void**)&gst_event_set_stream_flags, "gst_event_set_stream_flags", libs);
  gidLink(cast(void**)&gst_event_writable_structure, "gst_event_writable_structure", libs);

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

  // Memory
  gidLink(cast(void**)&gst_memory_get_type, "gst_memory_get_type", libs);
  gidLink(cast(void**)&gst_memory_new_wrapped, "gst_memory_new_wrapped", libs);
  gidLink(cast(void**)&gst_memory_copy, "gst_memory_copy", libs);
  gidLink(cast(void**)&gst_memory_get_sizes, "gst_memory_get_sizes", libs);
  gidLink(cast(void**)&gst_memory_init, "gst_memory_init", libs);
  gidLink(cast(void**)&gst_memory_is_span, "gst_memory_is_span", libs);
  gidLink(cast(void**)&gst_memory_is_type, "gst_memory_is_type", libs);
  gidLink(cast(void**)&gst_memory_make_mapped, "gst_memory_make_mapped", libs);
  gidLink(cast(void**)&gst_memory_map, "gst_memory_map", libs);
  gidLink(cast(void**)&gst_memory_resize, "gst_memory_resize", libs);
  gidLink(cast(void**)&gst_memory_share, "gst_memory_share", libs);
  gidLink(cast(void**)&gst_memory_unmap, "gst_memory_unmap", libs);

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
  gidLink(cast(void**)&gst_message_get_num_redirect_entries, "gst_message_get_num_redirect_entries", libs);
  gidLink(cast(void**)&gst_message_get_seqnum, "gst_message_get_seqnum", libs);
  gidLink(cast(void**)&gst_message_get_stream_status_object, "gst_message_get_stream_status_object", libs);
  gidLink(cast(void**)&gst_message_get_structure, "gst_message_get_structure", libs);
  gidLink(cast(void**)&gst_message_has_name, "gst_message_has_name", libs);
  gidLink(cast(void**)&gst_message_parse_async_done, "gst_message_parse_async_done", libs);
  gidLink(cast(void**)&gst_message_parse_buffering, "gst_message_parse_buffering", libs);
  gidLink(cast(void**)&gst_message_parse_buffering_stats, "gst_message_parse_buffering_stats", libs);
  gidLink(cast(void**)&gst_message_parse_clock_lost, "gst_message_parse_clock_lost", libs);
  gidLink(cast(void**)&gst_message_parse_clock_provide, "gst_message_parse_clock_provide", libs);
  gidLink(cast(void**)&gst_message_parse_context_type, "gst_message_parse_context_type", libs);
  gidLink(cast(void**)&gst_message_parse_device_added, "gst_message_parse_device_added", libs);
  gidLink(cast(void**)&gst_message_parse_device_changed, "gst_message_parse_device_changed", libs);
  gidLink(cast(void**)&gst_message_parse_device_removed, "gst_message_parse_device_removed", libs);
  gidLink(cast(void**)&gst_message_parse_error, "gst_message_parse_error", libs);
  gidLink(cast(void**)&gst_message_parse_error_details, "gst_message_parse_error_details", libs);
  gidLink(cast(void**)&gst_message_parse_group_id, "gst_message_parse_group_id", libs);
  gidLink(cast(void**)&gst_message_parse_have_context, "gst_message_parse_have_context", libs);
  gidLink(cast(void**)&gst_message_parse_info, "gst_message_parse_info", libs);
  gidLink(cast(void**)&gst_message_parse_info_details, "gst_message_parse_info_details", libs);
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
  gidLink(cast(void**)&gst_message_set_buffering_stats, "gst_message_set_buffering_stats", libs);
  gidLink(cast(void**)&gst_message_set_group_id, "gst_message_set_group_id", libs);
  gidLink(cast(void**)&gst_message_set_qos_stats, "gst_message_set_qos_stats", libs);
  gidLink(cast(void**)&gst_message_set_qos_values, "gst_message_set_qos_values", libs);
  gidLink(cast(void**)&gst_message_set_seqnum, "gst_message_set_seqnum", libs);
  gidLink(cast(void**)&gst_message_set_stream_status_object, "gst_message_set_stream_status_object", libs);
  gidLink(cast(void**)&gst_message_streams_selected_add, "gst_message_streams_selected_add", libs);
  gidLink(cast(void**)&gst_message_streams_selected_get_size, "gst_message_streams_selected_get_size", libs);
  gidLink(cast(void**)&gst_message_streams_selected_get_stream, "gst_message_streams_selected_get_stream", libs);
  gidLink(cast(void**)&gst_message_writable_structure, "gst_message_writable_structure", libs);
  gidLink(cast(void**)&gst_message_replace, "gst_message_replace", libs);

  // Meta
  gidLink(cast(void**)&gst_meta_compare_seqnum, "gst_meta_compare_seqnum", libs);
  gidLink(cast(void**)&gst_meta_get_seqnum, "gst_meta_get_seqnum", libs);
  gidLink(cast(void**)&gst_meta_serialize, "gst_meta_serialize", libs);
  gidLink(cast(void**)&gst_meta_serialize_simple, "gst_meta_serialize_simple", libs);
  gidLink(cast(void**)&gst_meta_api_type_get_tags, "gst_meta_api_type_get_tags", libs);
  gidLink(cast(void**)&gst_meta_api_type_has_tag, "gst_meta_api_type_has_tag", libs);
  gidLink(cast(void**)&gst_meta_api_type_register, "gst_meta_api_type_register", libs);
  gidLink(cast(void**)&gst_meta_deserialize, "gst_meta_deserialize", libs);
  gidLink(cast(void**)&gst_meta_get_info, "gst_meta_get_info", libs);
  gidLink(cast(void**)&gst_meta_register, "gst_meta_register", libs);
  gidLink(cast(void**)&gst_meta_register_custom, "gst_meta_register_custom", libs);
  gidLink(cast(void**)&gst_meta_register_custom_simple, "gst_meta_register_custom_simple", libs);

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
  gidLink(cast(void**)&gst_object_default_error, "gst_object_default_error", libs);
  gidLink(cast(void**)&gst_object_get_control_binding, "gst_object_get_control_binding", libs);
  gidLink(cast(void**)&gst_object_get_control_rate, "gst_object_get_control_rate", libs);
  gidLink(cast(void**)&gst_object_get_g_value_array, "gst_object_get_g_value_array", libs);
  gidLink(cast(void**)&gst_object_get_name, "gst_object_get_name", libs);
  gidLink(cast(void**)&gst_object_get_parent, "gst_object_get_parent", libs);
  gidLink(cast(void**)&gst_object_get_path_string, "gst_object_get_path_string", libs);
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
  gidLink(cast(void**)&gst_pad_probe_info_get_query, "gst_pad_probe_info_get_query", libs);

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
  gidLink(cast(void**)&gst_promise_reply, "gst_promise_reply", libs);
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
  gidLink(cast(void**)&gst_query_find_allocation_meta, "gst_query_find_allocation_meta", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_metas, "gst_query_get_n_allocation_metas", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_params, "gst_query_get_n_allocation_params", libs);
  gidLink(cast(void**)&gst_query_get_n_allocation_pools, "gst_query_get_n_allocation_pools", libs);
  gidLink(cast(void**)&gst_query_get_n_buffering_ranges, "gst_query_get_n_buffering_ranges", libs);
  gidLink(cast(void**)&gst_query_get_n_scheduling_modes, "gst_query_get_n_scheduling_modes", libs);
  gidLink(cast(void**)&gst_query_get_structure, "gst_query_get_structure", libs);
  gidLink(cast(void**)&gst_query_has_scheduling_mode, "gst_query_has_scheduling_mode", libs);
  gidLink(cast(void**)&gst_query_has_scheduling_mode_with_flags, "gst_query_has_scheduling_mode_with_flags", libs);
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
  gidLink(cast(void**)&gst_query_writable_structure, "gst_query_writable_structure", libs);

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
  gidLink(cast(void**)&gst_sample_get_buffer, "gst_sample_get_buffer", libs);
  gidLink(cast(void**)&gst_sample_get_buffer_list, "gst_sample_get_buffer_list", libs);
  gidLink(cast(void**)&gst_sample_get_caps, "gst_sample_get_caps", libs);
  gidLink(cast(void**)&gst_sample_get_info, "gst_sample_get_info", libs);
  gidLink(cast(void**)&gst_sample_get_segment, "gst_sample_get_segment", libs);
  gidLink(cast(void**)&gst_sample_set_buffer, "gst_sample_set_buffer", libs);
  gidLink(cast(void**)&gst_sample_set_buffer_list, "gst_sample_set_buffer_list", libs);
  gidLink(cast(void**)&gst_sample_set_caps, "gst_sample_set_caps", libs);
  gidLink(cast(void**)&gst_sample_set_info, "gst_sample_set_info", libs);
  gidLink(cast(void**)&gst_sample_set_segment, "gst_sample_set_segment", libs);

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
  gidLink(cast(void**)&gst_static_caps_cleanup, "gst_static_caps_cleanup", libs);
  gidLink(cast(void**)&gst_static_caps_get, "gst_static_caps_get", libs);

  // StaticPadTemplate
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
  gidLink(cast(void**)&gst_structure_new_valist, "gst_structure_new_valist", libs);
  gidLink(cast(void**)&gst_structure_can_intersect, "gst_structure_can_intersect", libs);
  gidLink(cast(void**)&gst_structure_copy, "gst_structure_copy", libs);
  gidLink(cast(void**)&gst_structure_filter_and_map_in_place, "gst_structure_filter_and_map_in_place", libs);
  gidLink(cast(void**)&gst_structure_fixate, "gst_structure_fixate", libs);
  gidLink(cast(void**)&gst_structure_fixate_field, "gst_structure_fixate_field", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_boolean, "gst_structure_fixate_field_boolean", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_double, "gst_structure_fixate_field_nearest_double", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_fraction, "gst_structure_fixate_field_nearest_fraction", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_nearest_int, "gst_structure_fixate_field_nearest_int", libs);
  gidLink(cast(void**)&gst_structure_fixate_field_string, "gst_structure_fixate_field_string", libs);
  gidLink(cast(void**)&gst_structure_foreach, "gst_structure_foreach", libs);
  gidLink(cast(void**)&gst_structure_free, "gst_structure_free", libs);
  gidLink(cast(void**)&gst_structure_get, "gst_structure_get", libs);
  gidLink(cast(void**)&gst_structure_get_array, "gst_structure_get_array", libs);
  gidLink(cast(void**)&gst_structure_get_boolean, "gst_structure_get_boolean", libs);
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
  gidLink(cast(void**)&gst_structure_id_take_value, "gst_structure_id_take_value", libs);
  gidLink(cast(void**)&gst_structure_intersect, "gst_structure_intersect", libs);
  gidLink(cast(void**)&gst_structure_is_equal, "gst_structure_is_equal", libs);
  gidLink(cast(void**)&gst_structure_is_subset, "gst_structure_is_subset", libs);
  gidLink(cast(void**)&gst_structure_map_in_place, "gst_structure_map_in_place", libs);
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
  gidLink(cast(void**)&gst_structure_set_parent_refcount, "gst_structure_set_parent_refcount", libs);
  gidLink(cast(void**)&gst_structure_set_valist, "gst_structure_set_valist", libs);
  gidLink(cast(void**)&gst_structure_set_value, "gst_structure_set_value", libs);
  gidLink(cast(void**)&gst_structure_take_value, "gst_structure_take_value", libs);
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
  gidLink(cast(void**)&gst_tag_list_merge, "gst_tag_list_merge", libs);
  gidLink(cast(void**)&gst_tag_list_n_tags, "gst_tag_list_n_tags", libs);
  gidLink(cast(void**)&gst_tag_list_nth_tag_name, "gst_tag_list_nth_tag_name", libs);
  gidLink(cast(void**)&gst_tag_list_peek_string_index, "gst_tag_list_peek_string_index", libs);
  gidLink(cast(void**)&gst_tag_list_remove_tag, "gst_tag_list_remove_tag", libs);
  gidLink(cast(void**)&gst_tag_list_set_scope, "gst_tag_list_set_scope", libs);
  gidLink(cast(void**)&gst_tag_list_to_string, "gst_tag_list_to_string", libs);
  gidLink(cast(void**)&gst_tag_list_copy_value, "gst_tag_list_copy_value", libs);

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

  // TracerFactory
  gidLink(cast(void**)&gst_tracer_factory_get_type, "gst_tracer_factory_get_type", libs);
  gidLink(cast(void**)&gst_tracer_factory_get_list, "gst_tracer_factory_get_list", libs);
  gidLink(cast(void**)&gst_tracer_factory_get_tracer_type, "gst_tracer_factory_get_tracer_type", libs);

  // TracerRecord
  gidLink(cast(void**)&gst_tracer_record_get_type, "gst_tracer_record_get_type", libs);
  gidLink(cast(void**)&gst_tracer_record_new, "gst_tracer_record_new", libs);
  gidLink(cast(void**)&gst_tracer_record_log, "gst_tracer_record_log", libs);

  // TypeFind
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

  // global
  gidLink(cast(void**)&gst_calculate_linear_regression, "gst_calculate_linear_regression", libs);
  gidLink(cast(void**)&gst_clear_mini_object, "gst_clear_mini_object", libs);
  gidLink(cast(void**)&gst_clear_object, "gst_clear_object", libs);
  gidLink(cast(void**)&gst_clear_structure, "gst_clear_structure", libs);
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
  gidLink(cast(void**)&gst_debug_log_id_valist, "gst_debug_log_id_valist", libs);
  gidLink(cast(void**)&gst_debug_log_literal, "gst_debug_log_literal", libs);
  gidLink(cast(void**)&gst_debug_log_valist, "gst_debug_log_valist", libs);
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
  gidLink(cast(void**)&gst_static_caps_get_type, "gst_static_caps_get_type", libs);
  gidLink(cast(void**)&gst_static_pad_template_get_type, "gst_static_pad_template_get_type", libs);
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
  gidLink(cast(void**)&gst_type_find_get_type, "gst_type_find_get_type", libs);
  gidLink(cast(void**)&gst_type_is_plugin_api, "gst_type_is_plugin_api", libs);
  gidLink(cast(void**)&gst_type_mark_as_plugin_api, "gst_type_mark_as_plugin_api", libs);
  gidLink(cast(void**)&gst_update_registry, "gst_update_registry", libs);
  gidLink(cast(void**)&gst_util_array_binary_search, "gst_util_array_binary_search", libs);
  gidLink(cast(void**)&gst_util_ceil_log2, "gst_util_ceil_log2", libs);
  gidLink(cast(void**)&gst_util_double_to_fraction, "gst_util_double_to_fraction", libs);
  gidLink(cast(void**)&gst_util_dump_buffer, "gst_util_dump_buffer", libs);
  gidLink(cast(void**)&gst_util_dump_mem, "gst_util_dump_mem", libs);
  gidLink(cast(void**)&gst_util_filename_compare, "gst_util_filename_compare", libs);
  gidLink(cast(void**)&gst_util_fraction_add, "gst_util_fraction_add", libs);
  gidLink(cast(void**)&gst_util_fraction_compare, "gst_util_fraction_compare", libs);
  gidLink(cast(void**)&gst_util_fraction_multiply, "gst_util_fraction_multiply", libs);
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

  // StateChange
  gidLink(cast(void**)&gst_state_change_get_name, "gst_state_change_get_name", libs);

  // StreamError
  gidLink(cast(void**)&gst_stream_error_quark, "gst_stream_error_quark", libs);

  // StreamType
  gidLink(cast(void**)&gst_stream_type_get_name, "gst_stream_type_get_name", libs);

  // TocEntryType
  gidLink(cast(void**)&gst_toc_entry_type_get_nick, "gst_toc_entry_type_get_nick", libs);

  // URIError
  gidLink(cast(void**)&gst_uri_error_quark, "gst_uri_error_quark", libs);
}
