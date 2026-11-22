/// C functions for glib2 library
module gid.glib2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.glib2.c.types;
static import gid.glib2.c._gidlib_GLib;
public import gid.gobject2.c.types;

private immutable LIBS = ["gobject-2.0_0", "glib-2.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.glib2.c._gidlib_GLib.gidLibLinked;

// Allocator
private alias c_g_allocator_freeFn = extern(C) void function(GAllocator* allocator) nothrow;
__gshared c_g_allocator_freeFn c_g_allocator_free; ///
private alias c_g_allocator_newFn = extern(C) GAllocator* function(const(char)* name, uint nPreallocs) nothrow;
__gshared c_g_allocator_newFn c_g_allocator_new; ///

// Array
private alias c_g_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_array_get_typeFn c_g_array_get_type; ///
private alias c_g_array_append_valsFn = extern(C) GArray* function(GArray* array, const(void)* data, uint len) nothrow;
__gshared c_g_array_append_valsFn c_g_array_append_vals; ///
private alias c_g_array_binary_searchFn = extern(C) gboolean function(GArray* array, const(void)* target, GCompareFunc compareFunc, uint* outMatchIndex) nothrow;
__gshared c_g_array_binary_searchFn c_g_array_binary_search; ///
private alias c_g_array_copyFn = extern(C) GArray* function(GArray* array) nothrow;
__gshared c_g_array_copyFn c_g_array_copy; ///
private alias c_g_array_freeFn = extern(C) char* function(GArray* array, gboolean freeSegment) nothrow;
__gshared c_g_array_freeFn c_g_array_free; ///
private alias c_g_array_get_element_sizeFn = extern(C) uint function(GArray* array) nothrow;
__gshared c_g_array_get_element_sizeFn c_g_array_get_element_size; ///
private alias c_g_array_insert_valsFn = extern(C) GArray* function(GArray* array, uint index, const(void)* data, uint len) nothrow;
__gshared c_g_array_insert_valsFn c_g_array_insert_vals; ///
private alias c_g_array_newFn = extern(C) GArray* function(gboolean zeroTerminated, gboolean clear, uint elementSize) nothrow;
__gshared c_g_array_newFn c_g_array_new; ///
private alias c_g_array_new_takeFn = extern(C) GArray* function(void* data, size_t len, gboolean clear, size_t elementSize) nothrow;
__gshared c_g_array_new_takeFn c_g_array_new_take; ///
private alias c_g_array_new_take_zero_terminatedFn = extern(C) GArray* function(void* data, gboolean clear, size_t elementSize) nothrow;
__gshared c_g_array_new_take_zero_terminatedFn c_g_array_new_take_zero_terminated; ///
private alias c_g_array_prepend_valsFn = extern(C) GArray* function(GArray* array, const(void)* data, uint len) nothrow;
__gshared c_g_array_prepend_valsFn c_g_array_prepend_vals; ///
private alias c_g_array_refFn = extern(C) GArray* function(GArray* array) nothrow;
__gshared c_g_array_refFn c_g_array_ref; ///
private alias c_g_array_remove_indexFn = extern(C) GArray* function(GArray* array, uint index) nothrow;
__gshared c_g_array_remove_indexFn c_g_array_remove_index; ///
private alias c_g_array_remove_index_fastFn = extern(C) GArray* function(GArray* array, uint index) nothrow;
__gshared c_g_array_remove_index_fastFn c_g_array_remove_index_fast; ///
private alias c_g_array_remove_rangeFn = extern(C) GArray* function(GArray* array, uint index, uint length) nothrow;
__gshared c_g_array_remove_rangeFn c_g_array_remove_range; ///
private alias c_g_array_set_clear_funcFn = extern(C) void function(GArray* array, GDestroyNotify clearFunc) nothrow;
__gshared c_g_array_set_clear_funcFn c_g_array_set_clear_func; ///
private alias c_g_array_set_sizeFn = extern(C) GArray* function(GArray* array, uint length) nothrow;
__gshared c_g_array_set_sizeFn c_g_array_set_size; ///
private alias c_g_array_sized_newFn = extern(C) GArray* function(gboolean zeroTerminated, gboolean clear, uint elementSize, uint reservedSize) nothrow;
__gshared c_g_array_sized_newFn c_g_array_sized_new; ///
private alias c_g_array_sortFn = extern(C) void function(GArray* array, GCompareFunc compareFunc) nothrow;
__gshared c_g_array_sortFn c_g_array_sort; ///
private alias c_g_array_sort_with_dataFn = extern(C) void function(GArray* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_array_sort_with_dataFn c_g_array_sort_with_data; ///
private alias c_g_array_stealFn = extern(C) void* function(GArray* array, size_t* len) nothrow;
__gshared c_g_array_stealFn c_g_array_steal; ///
private alias c_g_array_unrefFn = extern(C) void function(GArray* array) nothrow;
__gshared c_g_array_unrefFn c_g_array_unref; ///

// AsyncQueue
private alias c_g_async_queue_lengthFn = extern(C) int function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_lengthFn c_g_async_queue_length; ///
private alias c_g_async_queue_length_unlockedFn = extern(C) int function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_length_unlockedFn c_g_async_queue_length_unlocked; ///
private alias c_g_async_queue_lockFn = extern(C) void function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_lockFn c_g_async_queue_lock; ///
private alias c_g_async_queue_popFn = extern(C) void* function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_popFn c_g_async_queue_pop; ///
private alias c_g_async_queue_pop_unlockedFn = extern(C) void* function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_pop_unlockedFn c_g_async_queue_pop_unlocked; ///
private alias c_g_async_queue_pushFn = extern(C) void function(GAsyncQueue* queue, void* data) nothrow;
__gshared c_g_async_queue_pushFn c_g_async_queue_push; ///
private alias c_g_async_queue_push_frontFn = extern(C) void function(GAsyncQueue* queue, void* item) nothrow;
__gshared c_g_async_queue_push_frontFn c_g_async_queue_push_front; ///
private alias c_g_async_queue_push_front_unlockedFn = extern(C) void function(GAsyncQueue* queue, void* item) nothrow;
__gshared c_g_async_queue_push_front_unlockedFn c_g_async_queue_push_front_unlocked; ///
private alias c_g_async_queue_push_sortedFn = extern(C) void function(GAsyncQueue* queue, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_async_queue_push_sortedFn c_g_async_queue_push_sorted; ///
private alias c_g_async_queue_push_sorted_unlockedFn = extern(C) void function(GAsyncQueue* queue, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_async_queue_push_sorted_unlockedFn c_g_async_queue_push_sorted_unlocked; ///
private alias c_g_async_queue_push_unlockedFn = extern(C) void function(GAsyncQueue* queue, void* data) nothrow;
__gshared c_g_async_queue_push_unlockedFn c_g_async_queue_push_unlocked; ///
private alias c_g_async_queue_refFn = extern(C) GAsyncQueue* function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_refFn c_g_async_queue_ref; ///
private alias c_g_async_queue_ref_unlockedFn = extern(C) void function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_ref_unlockedFn c_g_async_queue_ref_unlocked; ///
private alias c_g_async_queue_removeFn = extern(C) gboolean function(GAsyncQueue* queue, void* item) nothrow;
__gshared c_g_async_queue_removeFn c_g_async_queue_remove; ///
private alias c_g_async_queue_remove_unlockedFn = extern(C) gboolean function(GAsyncQueue* queue, void* item) nothrow;
__gshared c_g_async_queue_remove_unlockedFn c_g_async_queue_remove_unlocked; ///
private alias c_g_async_queue_sortFn = extern(C) void function(GAsyncQueue* queue, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_async_queue_sortFn c_g_async_queue_sort; ///
private alias c_g_async_queue_sort_unlockedFn = extern(C) void function(GAsyncQueue* queue, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_async_queue_sort_unlockedFn c_g_async_queue_sort_unlocked; ///
private alias c_g_async_queue_timed_popFn = extern(C) void* function(GAsyncQueue* queue, GTimeVal* endTime) nothrow;
__gshared c_g_async_queue_timed_popFn c_g_async_queue_timed_pop; ///
private alias c_g_async_queue_timed_pop_unlockedFn = extern(C) void* function(GAsyncQueue* queue, GTimeVal* endTime) nothrow;
__gshared c_g_async_queue_timed_pop_unlockedFn c_g_async_queue_timed_pop_unlocked; ///
private alias c_g_async_queue_timeout_popFn = extern(C) void* function(GAsyncQueue* queue, ulong timeout) nothrow;
__gshared c_g_async_queue_timeout_popFn c_g_async_queue_timeout_pop; ///
private alias c_g_async_queue_timeout_pop_unlockedFn = extern(C) void* function(GAsyncQueue* queue, ulong timeout) nothrow;
__gshared c_g_async_queue_timeout_pop_unlockedFn c_g_async_queue_timeout_pop_unlocked; ///
private alias c_g_async_queue_try_popFn = extern(C) void* function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_try_popFn c_g_async_queue_try_pop; ///
private alias c_g_async_queue_try_pop_unlockedFn = extern(C) void* function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_try_pop_unlockedFn c_g_async_queue_try_pop_unlocked; ///
private alias c_g_async_queue_unlockFn = extern(C) void function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_unlockFn c_g_async_queue_unlock; ///
private alias c_g_async_queue_unrefFn = extern(C) void function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_unrefFn c_g_async_queue_unref; ///
private alias c_g_async_queue_unref_and_unlockFn = extern(C) void function(GAsyncQueue* queue) nothrow;
__gshared c_g_async_queue_unref_and_unlockFn c_g_async_queue_unref_and_unlock; ///
private alias c_g_async_queue_newFn = extern(C) GAsyncQueue* function() nothrow;
__gshared c_g_async_queue_newFn c_g_async_queue_new; ///
private alias c_g_async_queue_new_fullFn = extern(C) GAsyncQueue* function(GDestroyNotify itemFreeFunc) nothrow;
__gshared c_g_async_queue_new_fullFn c_g_async_queue_new_full; ///

// BookmarkFile
private alias c_g_bookmark_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_bookmark_file_get_typeFn c_g_bookmark_file_get_type; ///
private alias c_g_bookmark_file_newFn = extern(C) GBookmarkFile* function() nothrow;
__gshared c_g_bookmark_file_newFn c_g_bookmark_file_new; ///
private alias c_g_bookmark_file_add_applicationFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec) nothrow;
__gshared c_g_bookmark_file_add_applicationFn c_g_bookmark_file_add_application; ///
private alias c_g_bookmark_file_add_groupFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group) nothrow;
__gshared c_g_bookmark_file_add_groupFn c_g_bookmark_file_add_group; ///
private alias c_g_bookmark_file_copyFn = extern(C) GBookmarkFile* function(GBookmarkFile* bookmark) nothrow;
__gshared c_g_bookmark_file_copyFn c_g_bookmark_file_copy; ///
private alias c_g_bookmark_file_freeFn = extern(C) void function(GBookmarkFile* bookmark) nothrow;
__gshared c_g_bookmark_file_freeFn c_g_bookmark_file_free; ///
private alias c_g_bookmark_file_get_addedFn = extern(C) long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_addedFn c_g_bookmark_file_get_added; ///
private alias c_g_bookmark_file_get_added_date_timeFn = extern(C) GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_added_date_timeFn c_g_bookmark_file_get_added_date_time; ///
private alias c_g_bookmark_file_get_app_infoFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, char** exec, uint* count, long* stamp, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_app_infoFn c_g_bookmark_file_get_app_info; ///
private alias c_g_bookmark_file_get_application_infoFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, char** exec, uint* count, GDateTime** stamp, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_application_infoFn c_g_bookmark_file_get_application_info; ///
private alias c_g_bookmark_file_get_applicationsFn = extern(C) char** function(GBookmarkFile* bookmark, const(char)* uri, size_t* length, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_applicationsFn c_g_bookmark_file_get_applications; ///
private alias c_g_bookmark_file_get_descriptionFn = extern(C) char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_descriptionFn c_g_bookmark_file_get_description; ///
private alias c_g_bookmark_file_get_groupsFn = extern(C) char** function(GBookmarkFile* bookmark, const(char)* uri, size_t* length, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_groupsFn c_g_bookmark_file_get_groups; ///
private alias c_g_bookmark_file_get_iconFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, char** href, char** mimeType, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_iconFn c_g_bookmark_file_get_icon; ///
private alias c_g_bookmark_file_get_is_privateFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_is_privateFn c_g_bookmark_file_get_is_private; ///
private alias c_g_bookmark_file_get_mime_typeFn = extern(C) char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_mime_typeFn c_g_bookmark_file_get_mime_type; ///
private alias c_g_bookmark_file_get_modifiedFn = extern(C) long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_modifiedFn c_g_bookmark_file_get_modified; ///
private alias c_g_bookmark_file_get_modified_date_timeFn = extern(C) GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_modified_date_timeFn c_g_bookmark_file_get_modified_date_time; ///
private alias c_g_bookmark_file_get_sizeFn = extern(C) int function(GBookmarkFile* bookmark) nothrow;
__gshared c_g_bookmark_file_get_sizeFn c_g_bookmark_file_get_size; ///
private alias c_g_bookmark_file_get_titleFn = extern(C) char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_titleFn c_g_bookmark_file_get_title; ///
private alias c_g_bookmark_file_get_urisFn = extern(C) char** function(GBookmarkFile* bookmark, size_t* length) nothrow;
__gshared c_g_bookmark_file_get_urisFn c_g_bookmark_file_get_uris; ///
private alias c_g_bookmark_file_get_visitedFn = extern(C) long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_visitedFn c_g_bookmark_file_get_visited; ///
private alias c_g_bookmark_file_get_visited_date_timeFn = extern(C) GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_get_visited_date_timeFn c_g_bookmark_file_get_visited_date_time; ///
private alias c_g_bookmark_file_has_applicationFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, GError** _err) nothrow;
__gshared c_g_bookmark_file_has_applicationFn c_g_bookmark_file_has_application; ///
private alias c_g_bookmark_file_has_groupFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group, GError** _err) nothrow;
__gshared c_g_bookmark_file_has_groupFn c_g_bookmark_file_has_group; ///
private alias c_g_bookmark_file_has_itemFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri) nothrow;
__gshared c_g_bookmark_file_has_itemFn c_g_bookmark_file_has_item; ///
private alias c_g_bookmark_file_load_from_dataFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(ubyte)* data, size_t length, GError** _err) nothrow;
__gshared c_g_bookmark_file_load_from_dataFn c_g_bookmark_file_load_from_data; ///
private alias c_g_bookmark_file_load_from_data_dirsFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* file, char** fullPath, GError** _err) nothrow;
__gshared c_g_bookmark_file_load_from_data_dirsFn c_g_bookmark_file_load_from_data_dirs; ///
private alias c_g_bookmark_file_load_from_fileFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* filename, GError** _err) nothrow;
__gshared c_g_bookmark_file_load_from_fileFn c_g_bookmark_file_load_from_file; ///
private alias c_g_bookmark_file_move_itemFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* oldUri, const(char)* newUri, GError** _err) nothrow;
__gshared c_g_bookmark_file_move_itemFn c_g_bookmark_file_move_item; ///
private alias c_g_bookmark_file_remove_applicationFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, GError** _err) nothrow;
__gshared c_g_bookmark_file_remove_applicationFn c_g_bookmark_file_remove_application; ///
private alias c_g_bookmark_file_remove_groupFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group, GError** _err) nothrow;
__gshared c_g_bookmark_file_remove_groupFn c_g_bookmark_file_remove_group; ///
private alias c_g_bookmark_file_remove_itemFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) nothrow;
__gshared c_g_bookmark_file_remove_itemFn c_g_bookmark_file_remove_item; ///
private alias c_g_bookmark_file_set_addedFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, long added) nothrow;
__gshared c_g_bookmark_file_set_addedFn c_g_bookmark_file_set_added; ///
private alias c_g_bookmark_file_set_added_date_timeFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* added) nothrow;
__gshared c_g_bookmark_file_set_added_date_timeFn c_g_bookmark_file_set_added_date_time; ///
private alias c_g_bookmark_file_set_app_infoFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec, int count, long stamp, GError** _err) nothrow;
__gshared c_g_bookmark_file_set_app_infoFn c_g_bookmark_file_set_app_info; ///
private alias c_g_bookmark_file_set_application_infoFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec, int count, GDateTime* stamp, GError** _err) nothrow;
__gshared c_g_bookmark_file_set_application_infoFn c_g_bookmark_file_set_application_info; ///
private alias c_g_bookmark_file_set_descriptionFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* description) nothrow;
__gshared c_g_bookmark_file_set_descriptionFn c_g_bookmark_file_set_description; ///
private alias c_g_bookmark_file_set_groupsFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char*)* groups, size_t length) nothrow;
__gshared c_g_bookmark_file_set_groupsFn c_g_bookmark_file_set_groups; ///
private alias c_g_bookmark_file_set_iconFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* href, const(char)* mimeType) nothrow;
__gshared c_g_bookmark_file_set_iconFn c_g_bookmark_file_set_icon; ///
private alias c_g_bookmark_file_set_is_privateFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, gboolean isPrivate) nothrow;
__gshared c_g_bookmark_file_set_is_privateFn c_g_bookmark_file_set_is_private; ///
private alias c_g_bookmark_file_set_mime_typeFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* mimeType) nothrow;
__gshared c_g_bookmark_file_set_mime_typeFn c_g_bookmark_file_set_mime_type; ///
private alias c_g_bookmark_file_set_modifiedFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, long modified) nothrow;
__gshared c_g_bookmark_file_set_modifiedFn c_g_bookmark_file_set_modified; ///
private alias c_g_bookmark_file_set_modified_date_timeFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* modified) nothrow;
__gshared c_g_bookmark_file_set_modified_date_timeFn c_g_bookmark_file_set_modified_date_time; ///
private alias c_g_bookmark_file_set_titleFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* title) nothrow;
__gshared c_g_bookmark_file_set_titleFn c_g_bookmark_file_set_title; ///
private alias c_g_bookmark_file_set_visitedFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, long visited) nothrow;
__gshared c_g_bookmark_file_set_visitedFn c_g_bookmark_file_set_visited; ///
private alias c_g_bookmark_file_set_visited_date_timeFn = extern(C) void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* visited) nothrow;
__gshared c_g_bookmark_file_set_visited_date_timeFn c_g_bookmark_file_set_visited_date_time; ///
private alias c_g_bookmark_file_to_dataFn = extern(C) ubyte* function(GBookmarkFile* bookmark, size_t* length, GError** _err) nothrow;
__gshared c_g_bookmark_file_to_dataFn c_g_bookmark_file_to_data; ///
private alias c_g_bookmark_file_to_fileFn = extern(C) gboolean function(GBookmarkFile* bookmark, const(char)* filename, GError** _err) nothrow;
__gshared c_g_bookmark_file_to_fileFn c_g_bookmark_file_to_file; ///
private alias c_g_bookmark_file_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_bookmark_file_error_quarkFn c_g_bookmark_file_error_quark; ///

// ByteArray
private alias c_g_byte_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_byte_array_get_typeFn c_g_byte_array_get_type; ///
private alias c_g_byte_array_appendFn = extern(C) GByteArray* function(GByteArray* array, const(ubyte)* data, uint len) nothrow;
__gshared c_g_byte_array_appendFn c_g_byte_array_append; ///
private alias c_g_byte_array_freeFn = extern(C) ubyte* function(GByteArray* array, gboolean freeSegment) nothrow;
__gshared c_g_byte_array_freeFn c_g_byte_array_free; ///
private alias c_g_byte_array_free_to_bytesFn = extern(C) GBytes* function(GByteArray* array) nothrow;
__gshared c_g_byte_array_free_to_bytesFn c_g_byte_array_free_to_bytes; ///
private alias c_g_byte_array_newFn = extern(C) GByteArray* function() nothrow;
__gshared c_g_byte_array_newFn c_g_byte_array_new; ///
private alias c_g_byte_array_new_takeFn = extern(C) GByteArray* function(ubyte* data, size_t len) nothrow;
__gshared c_g_byte_array_new_takeFn c_g_byte_array_new_take; ///
private alias c_g_byte_array_prependFn = extern(C) GByteArray* function(GByteArray* array, const(ubyte)* data, uint len) nothrow;
__gshared c_g_byte_array_prependFn c_g_byte_array_prepend; ///
private alias c_g_byte_array_refFn = extern(C) GByteArray* function(GByteArray* array) nothrow;
__gshared c_g_byte_array_refFn c_g_byte_array_ref; ///
private alias c_g_byte_array_remove_indexFn = extern(C) GByteArray* function(GByteArray* array, uint index) nothrow;
__gshared c_g_byte_array_remove_indexFn c_g_byte_array_remove_index; ///
private alias c_g_byte_array_remove_index_fastFn = extern(C) GByteArray* function(GByteArray* array, uint index) nothrow;
__gshared c_g_byte_array_remove_index_fastFn c_g_byte_array_remove_index_fast; ///
private alias c_g_byte_array_remove_rangeFn = extern(C) GByteArray* function(GByteArray* array, uint index, uint length) nothrow;
__gshared c_g_byte_array_remove_rangeFn c_g_byte_array_remove_range; ///
private alias c_g_byte_array_set_sizeFn = extern(C) GByteArray* function(GByteArray* array, uint length) nothrow;
__gshared c_g_byte_array_set_sizeFn c_g_byte_array_set_size; ///
private alias c_g_byte_array_sized_newFn = extern(C) GByteArray* function(uint reservedSize) nothrow;
__gshared c_g_byte_array_sized_newFn c_g_byte_array_sized_new; ///
private alias c_g_byte_array_sortFn = extern(C) void function(GByteArray* array, GCompareFunc compareFunc) nothrow;
__gshared c_g_byte_array_sortFn c_g_byte_array_sort; ///
private alias c_g_byte_array_sort_with_dataFn = extern(C) void function(GByteArray* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_byte_array_sort_with_dataFn c_g_byte_array_sort_with_data; ///
private alias c_g_byte_array_stealFn = extern(C) ubyte* function(GByteArray* array, size_t* len) nothrow;
__gshared c_g_byte_array_stealFn c_g_byte_array_steal; ///
private alias c_g_byte_array_unrefFn = extern(C) void function(GByteArray* array) nothrow;
__gshared c_g_byte_array_unrefFn c_g_byte_array_unref; ///

// Bytes
private alias c_g_bytes_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_bytes_get_typeFn c_g_bytes_get_type; ///
private alias c_g_bytes_newFn = extern(C) GBytes* function(const(void)* data, size_t size) nothrow;
__gshared c_g_bytes_newFn c_g_bytes_new; ///
private alias c_g_bytes_new_from_bytesFn = extern(C) GBytes* function(GBytes* bytes, size_t offset, size_t length) nothrow;
__gshared c_g_bytes_new_from_bytesFn c_g_bytes_new_from_bytes; ///
private alias c_g_bytes_new_staticFn = extern(C) GBytes* function(const(void)* data, size_t size) nothrow;
__gshared c_g_bytes_new_staticFn c_g_bytes_new_static; ///
private alias c_g_bytes_new_takeFn = extern(C) GBytes* function(void* data, size_t size) nothrow;
__gshared c_g_bytes_new_takeFn c_g_bytes_new_take; ///
private alias c_g_bytes_new_with_free_funcFn = extern(C) GBytes* function(const(void)* data, size_t size, GDestroyNotify freeFunc, void* userData) nothrow;
__gshared c_g_bytes_new_with_free_funcFn c_g_bytes_new_with_free_func; ///
private alias c_g_bytes_compareFn = extern(C) int function(GBytes* bytes1, GBytes* bytes2) nothrow;
__gshared c_g_bytes_compareFn c_g_bytes_compare; ///
private alias c_g_bytes_equalFn = extern(C) gboolean function(GBytes* bytes1, GBytes* bytes2) nothrow;
__gshared c_g_bytes_equalFn c_g_bytes_equal; ///
private alias c_g_bytes_get_dataFn = extern(C) const(void)* function(GBytes* bytes, size_t* size) nothrow;
__gshared c_g_bytes_get_dataFn c_g_bytes_get_data; ///
private alias c_g_bytes_get_regionFn = extern(C) const(void)* function(GBytes* bytes, size_t elementSize, size_t offset, size_t nElements) nothrow;
__gshared c_g_bytes_get_regionFn c_g_bytes_get_region; ///
private alias c_g_bytes_get_sizeFn = extern(C) size_t function(GBytes* bytes) nothrow;
__gshared c_g_bytes_get_sizeFn c_g_bytes_get_size; ///
private alias c_g_bytes_hashFn = extern(C) uint function(GBytes* bytes) nothrow;
__gshared c_g_bytes_hashFn c_g_bytes_hash; ///
private alias c_g_bytes_refFn = extern(C) GBytes* function(GBytes* bytes) nothrow;
__gshared c_g_bytes_refFn c_g_bytes_ref; ///
private alias c_g_bytes_unrefFn = extern(C) void function(GBytes* bytes) nothrow;
__gshared c_g_bytes_unrefFn c_g_bytes_unref; ///
private alias c_g_bytes_unref_to_arrayFn = extern(C) GByteArray* function(GBytes* bytes) nothrow;
__gshared c_g_bytes_unref_to_arrayFn c_g_bytes_unref_to_array; ///
private alias c_g_bytes_unref_to_dataFn = extern(C) void* function(GBytes* bytes, size_t* size) nothrow;
__gshared c_g_bytes_unref_to_dataFn c_g_bytes_unref_to_data; ///

// Cache
private alias c_g_cache_destroyFn = extern(C) void function(GCache* cache) nothrow;
__gshared c_g_cache_destroyFn c_g_cache_destroy; ///
private alias c_g_cache_insertFn = extern(C) void* function(GCache* cache, void* key) nothrow;
__gshared c_g_cache_insertFn c_g_cache_insert; ///
private alias c_g_cache_key_foreachFn = extern(C) void function(GCache* cache, GHFunc func, void* userData) nothrow;
__gshared c_g_cache_key_foreachFn c_g_cache_key_foreach; ///
private alias c_g_cache_removeFn = extern(C) void function(GCache* cache, const(void)* value) nothrow;
__gshared c_g_cache_removeFn c_g_cache_remove; ///
private alias c_g_cache_value_foreachFn = extern(C) void function(GCache* cache, GHFunc func, void* userData) nothrow;
__gshared c_g_cache_value_foreachFn c_g_cache_value_foreach; ///
private alias c_g_cache_newFn = extern(C) GCache* function(GCacheNewFunc valueNewFunc, GCacheDestroyFunc valueDestroyFunc, GCacheDupFunc keyDupFunc, GCacheDestroyFunc keyDestroyFunc, GHashFunc hashKeyFunc, GHashFunc hashValueFunc, GEqualFunc keyEqualFunc) nothrow;
__gshared c_g_cache_newFn c_g_cache_new; ///

// Checksum
private alias c_g_checksum_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_checksum_get_typeFn c_g_checksum_get_type; ///
private alias c_g_checksum_newFn = extern(C) GChecksum* function(GChecksumType checksumType) nothrow;
__gshared c_g_checksum_newFn c_g_checksum_new; ///
private alias c_g_checksum_copyFn = extern(C) GChecksum* function(const(GChecksum)* checksum) nothrow;
__gshared c_g_checksum_copyFn c_g_checksum_copy; ///
private alias c_g_checksum_freeFn = extern(C) void function(GChecksum* checksum) nothrow;
__gshared c_g_checksum_freeFn c_g_checksum_free; ///
private alias c_g_checksum_get_digestFn = extern(C) void function(GChecksum* checksum, ubyte* buffer, size_t* digestLen) nothrow;
__gshared c_g_checksum_get_digestFn c_g_checksum_get_digest; ///
private alias c_g_checksum_get_stringFn = extern(C) const(char)* function(GChecksum* checksum) nothrow;
__gshared c_g_checksum_get_stringFn c_g_checksum_get_string; ///
private alias c_g_checksum_resetFn = extern(C) void function(GChecksum* checksum) nothrow;
__gshared c_g_checksum_resetFn c_g_checksum_reset; ///
private alias c_g_checksum_updateFn = extern(C) void function(GChecksum* checksum, const(ubyte)* data, ptrdiff_t length) nothrow;
__gshared c_g_checksum_updateFn c_g_checksum_update; ///
private alias c_g_checksum_type_get_lengthFn = extern(C) ptrdiff_t function(GChecksumType checksumType) nothrow;
__gshared c_g_checksum_type_get_lengthFn c_g_checksum_type_get_length; ///

// Completion
private alias c_g_completion_add_itemsFn = extern(C) void function(GCompletion* cmp, GList* items) nothrow;
__gshared c_g_completion_add_itemsFn c_g_completion_add_items; ///
private alias c_g_completion_clear_itemsFn = extern(C) void function(GCompletion* cmp) nothrow;
__gshared c_g_completion_clear_itemsFn c_g_completion_clear_items; ///
private alias c_g_completion_completeFn = extern(C) GList* function(GCompletion* cmp, const(char)* prefix, char** newPrefix) nothrow;
__gshared c_g_completion_completeFn c_g_completion_complete; ///
private alias c_g_completion_complete_utf8Fn = extern(C) GList* function(GCompletion* cmp, const(char)* prefix, char** newPrefix) nothrow;
__gshared c_g_completion_complete_utf8Fn c_g_completion_complete_utf8; ///
private alias c_g_completion_freeFn = extern(C) void function(GCompletion* cmp) nothrow;
__gshared c_g_completion_freeFn c_g_completion_free; ///
private alias c_g_completion_remove_itemsFn = extern(C) void function(GCompletion* cmp, GList* items) nothrow;
__gshared c_g_completion_remove_itemsFn c_g_completion_remove_items; ///
private alias c_g_completion_set_compareFn = extern(C) void function(GCompletion* cmp, GCompletionStrncmpFunc strncmpFunc) nothrow;
__gshared c_g_completion_set_compareFn c_g_completion_set_compare; ///
private alias c_g_completion_newFn = extern(C) GCompletion* function(GCompletionFunc func) nothrow;
__gshared c_g_completion_newFn c_g_completion_new; ///

// Cond
private alias c_g_cond_broadcastFn = extern(C) void function(GCond* cond) nothrow;
__gshared c_g_cond_broadcastFn c_g_cond_broadcast; ///
private alias c_g_cond_clearFn = extern(C) void function(GCond* cond) nothrow;
__gshared c_g_cond_clearFn c_g_cond_clear; ///
private alias c_g_cond_freeFn = extern(C) void function(GCond* cond) nothrow;
__gshared c_g_cond_freeFn c_g_cond_free; ///
private alias c_g_cond_initFn = extern(C) void function(GCond* cond) nothrow;
__gshared c_g_cond_initFn c_g_cond_init; ///
private alias c_g_cond_signalFn = extern(C) void function(GCond* cond) nothrow;
__gshared c_g_cond_signalFn c_g_cond_signal; ///
private alias c_g_cond_timed_waitFn = extern(C) gboolean function(GCond* cond, GMutex* mutex, GTimeVal* absTime) nothrow;
__gshared c_g_cond_timed_waitFn c_g_cond_timed_wait; ///
private alias c_g_cond_waitFn = extern(C) void function(GCond* cond, GMutex* mutex) nothrow;
__gshared c_g_cond_waitFn c_g_cond_wait; ///
private alias c_g_cond_wait_untilFn = extern(C) gboolean function(GCond* cond, GMutex* mutex, long endTime) nothrow;
__gshared c_g_cond_wait_untilFn c_g_cond_wait_until; ///
private alias c_g_cond_newFn = extern(C) GCond* function() nothrow;
__gshared c_g_cond_newFn c_g_cond_new; ///

// Date
private alias c_g_date_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_date_get_typeFn c_g_date_get_type; ///
private alias c_g_date_newFn = extern(C) GDate* function() nothrow;
__gshared c_g_date_newFn c_g_date_new; ///
private alias c_g_date_new_dmyFn = extern(C) GDate* function(GDateDay day, GDateMonth month, GDateYear year) nothrow;
__gshared c_g_date_new_dmyFn c_g_date_new_dmy; ///
private alias c_g_date_new_julianFn = extern(C) GDate* function(uint julianDay) nothrow;
__gshared c_g_date_new_julianFn c_g_date_new_julian; ///
private alias c_g_date_add_daysFn = extern(C) void function(GDate* date, uint nDays) nothrow;
__gshared c_g_date_add_daysFn c_g_date_add_days; ///
private alias c_g_date_add_monthsFn = extern(C) void function(GDate* date, uint nMonths) nothrow;
__gshared c_g_date_add_monthsFn c_g_date_add_months; ///
private alias c_g_date_add_yearsFn = extern(C) void function(GDate* date, uint nYears) nothrow;
__gshared c_g_date_add_yearsFn c_g_date_add_years; ///
private alias c_g_date_clampFn = extern(C) void function(GDate* date, const(GDate)* minDate, const(GDate)* maxDate) nothrow;
__gshared c_g_date_clampFn c_g_date_clamp; ///
private alias c_g_date_clearFn = extern(C) void function(GDate* date, uint nDates) nothrow;
__gshared c_g_date_clearFn c_g_date_clear; ///
private alias c_g_date_compareFn = extern(C) int function(const(GDate)* lhs, const(GDate)* rhs) nothrow;
__gshared c_g_date_compareFn c_g_date_compare; ///
private alias c_g_date_copyFn = extern(C) GDate* function(const(GDate)* date) nothrow;
__gshared c_g_date_copyFn c_g_date_copy; ///
private alias c_g_date_days_betweenFn = extern(C) int function(const(GDate)* date1, const(GDate)* date2) nothrow;
__gshared c_g_date_days_betweenFn c_g_date_days_between; ///
private alias c_g_date_freeFn = extern(C) void function(GDate* date) nothrow;
__gshared c_g_date_freeFn c_g_date_free; ///
private alias c_g_date_get_dayFn = extern(C) GDateDay function(const(GDate)* date) nothrow;
__gshared c_g_date_get_dayFn c_g_date_get_day; ///
private alias c_g_date_get_day_of_yearFn = extern(C) uint function(const(GDate)* date) nothrow;
__gshared c_g_date_get_day_of_yearFn c_g_date_get_day_of_year; ///
private alias c_g_date_get_iso8601_week_of_yearFn = extern(C) uint function(const(GDate)* date) nothrow;
__gshared c_g_date_get_iso8601_week_of_yearFn c_g_date_get_iso8601_week_of_year; ///
private alias c_g_date_get_julianFn = extern(C) uint function(const(GDate)* date) nothrow;
__gshared c_g_date_get_julianFn c_g_date_get_julian; ///
private alias c_g_date_get_monday_week_of_yearFn = extern(C) uint function(const(GDate)* date) nothrow;
__gshared c_g_date_get_monday_week_of_yearFn c_g_date_get_monday_week_of_year; ///
private alias c_g_date_get_monthFn = extern(C) GDateMonth function(const(GDate)* date) nothrow;
__gshared c_g_date_get_monthFn c_g_date_get_month; ///
private alias c_g_date_get_sunday_week_of_yearFn = extern(C) uint function(const(GDate)* date) nothrow;
__gshared c_g_date_get_sunday_week_of_yearFn c_g_date_get_sunday_week_of_year; ///
private alias c_g_date_get_week_of_yearFn = extern(C) uint function(const(GDate)* date, GDateWeekday firstDayOfWeek) nothrow;
__gshared c_g_date_get_week_of_yearFn c_g_date_get_week_of_year; ///
private alias c_g_date_get_weekdayFn = extern(C) GDateWeekday function(const(GDate)* date) nothrow;
__gshared c_g_date_get_weekdayFn c_g_date_get_weekday; ///
private alias c_g_date_get_yearFn = extern(C) GDateYear function(const(GDate)* date) nothrow;
__gshared c_g_date_get_yearFn c_g_date_get_year; ///
private alias c_g_date_is_first_of_monthFn = extern(C) gboolean function(const(GDate)* date) nothrow;
__gshared c_g_date_is_first_of_monthFn c_g_date_is_first_of_month; ///
private alias c_g_date_is_last_of_monthFn = extern(C) gboolean function(const(GDate)* date) nothrow;
__gshared c_g_date_is_last_of_monthFn c_g_date_is_last_of_month; ///
private alias c_g_date_orderFn = extern(C) void function(GDate* date1, GDate* date2) nothrow;
__gshared c_g_date_orderFn c_g_date_order; ///
private alias c_g_date_set_dayFn = extern(C) void function(GDate* date, GDateDay day) nothrow;
__gshared c_g_date_set_dayFn c_g_date_set_day; ///
private alias c_g_date_set_dmyFn = extern(C) void function(GDate* date, GDateDay day, GDateMonth month, GDateYear y) nothrow;
__gshared c_g_date_set_dmyFn c_g_date_set_dmy; ///
private alias c_g_date_set_julianFn = extern(C) void function(GDate* date, uint julianDate) nothrow;
__gshared c_g_date_set_julianFn c_g_date_set_julian; ///
private alias c_g_date_set_monthFn = extern(C) void function(GDate* date, GDateMonth month) nothrow;
__gshared c_g_date_set_monthFn c_g_date_set_month; ///
private alias c_g_date_set_parseFn = extern(C) void function(GDate* date, const(char)* str) nothrow;
__gshared c_g_date_set_parseFn c_g_date_set_parse; ///
private alias c_g_date_set_timeFn = extern(C) void function(GDate* date, GTime time) nothrow;
__gshared c_g_date_set_timeFn c_g_date_set_time; ///
private alias c_g_date_set_time_tFn = extern(C) void function(GDate* date, long timet) nothrow;
__gshared c_g_date_set_time_tFn c_g_date_set_time_t; ///
private alias c_g_date_set_time_valFn = extern(C) void function(GDate* date, GTimeVal* timeval) nothrow;
__gshared c_g_date_set_time_valFn c_g_date_set_time_val; ///
private alias c_g_date_set_yearFn = extern(C) void function(GDate* date, GDateYear year) nothrow;
__gshared c_g_date_set_yearFn c_g_date_set_year; ///
private alias c_g_date_subtract_daysFn = extern(C) void function(GDate* date, uint nDays) nothrow;
__gshared c_g_date_subtract_daysFn c_g_date_subtract_days; ///
private alias c_g_date_subtract_monthsFn = extern(C) void function(GDate* date, uint nMonths) nothrow;
__gshared c_g_date_subtract_monthsFn c_g_date_subtract_months; ///
private alias c_g_date_subtract_yearsFn = extern(C) void function(GDate* date, uint nYears) nothrow;
__gshared c_g_date_subtract_yearsFn c_g_date_subtract_years; ///
private alias c_g_date_to_struct_tmFn = extern(C) void function(const(GDate)* date, void* tm) nothrow;
__gshared c_g_date_to_struct_tmFn c_g_date_to_struct_tm; ///
private alias c_g_date_validFn = extern(C) gboolean function(const(GDate)* date) nothrow;
__gshared c_g_date_validFn c_g_date_valid; ///
private alias c_g_date_get_days_in_monthFn = extern(C) ubyte function(GDateMonth month, GDateYear year) nothrow;
__gshared c_g_date_get_days_in_monthFn c_g_date_get_days_in_month; ///
private alias c_g_date_get_monday_weeks_in_yearFn = extern(C) ubyte function(GDateYear year) nothrow;
__gshared c_g_date_get_monday_weeks_in_yearFn c_g_date_get_monday_weeks_in_year; ///
private alias c_g_date_get_sunday_weeks_in_yearFn = extern(C) ubyte function(GDateYear year) nothrow;
__gshared c_g_date_get_sunday_weeks_in_yearFn c_g_date_get_sunday_weeks_in_year; ///
private alias c_g_date_get_weeks_in_yearFn = extern(C) ubyte function(GDateYear year, GDateWeekday firstDayOfWeek) nothrow;
__gshared c_g_date_get_weeks_in_yearFn c_g_date_get_weeks_in_year; ///
private alias c_g_date_is_leap_yearFn = extern(C) gboolean function(GDateYear year) nothrow;
__gshared c_g_date_is_leap_yearFn c_g_date_is_leap_year; ///
private alias c_g_date_strftimeFn = extern(C) size_t function(char* s, size_t slen, const(char)* format, const(GDate)* date) nothrow;
__gshared c_g_date_strftimeFn c_g_date_strftime; ///
private alias c_g_date_valid_dayFn = extern(C) gboolean function(GDateDay day) nothrow;
__gshared c_g_date_valid_dayFn c_g_date_valid_day; ///
private alias c_g_date_valid_dmyFn = extern(C) gboolean function(GDateDay day, GDateMonth month, GDateYear year) nothrow;
__gshared c_g_date_valid_dmyFn c_g_date_valid_dmy; ///
private alias c_g_date_valid_julianFn = extern(C) gboolean function(uint julianDate) nothrow;
__gshared c_g_date_valid_julianFn c_g_date_valid_julian; ///
private alias c_g_date_valid_monthFn = extern(C) gboolean function(GDateMonth month) nothrow;
__gshared c_g_date_valid_monthFn c_g_date_valid_month; ///
private alias c_g_date_valid_weekdayFn = extern(C) gboolean function(GDateWeekday weekday) nothrow;
__gshared c_g_date_valid_weekdayFn c_g_date_valid_weekday; ///
private alias c_g_date_valid_yearFn = extern(C) gboolean function(GDateYear year) nothrow;
__gshared c_g_date_valid_yearFn c_g_date_valid_year; ///

// DateTime
private alias c_g_date_time_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_date_time_get_typeFn c_g_date_time_get_type; ///
private alias c_g_date_time_newFn = extern(C) GDateTime* function(GTimeZone* tz, int year, int month, int day, int hour, int minute, double seconds) nothrow;
__gshared c_g_date_time_newFn c_g_date_time_new; ///
private alias c_g_date_time_new_from_iso8601Fn = extern(C) GDateTime* function(const(char)* text, GTimeZone* defaultTz) nothrow;
__gshared c_g_date_time_new_from_iso8601Fn c_g_date_time_new_from_iso8601; ///
private alias c_g_date_time_new_from_timeval_localFn = extern(C) GDateTime* function(const(GTimeVal)* tv) nothrow;
__gshared c_g_date_time_new_from_timeval_localFn c_g_date_time_new_from_timeval_local; ///
private alias c_g_date_time_new_from_timeval_utcFn = extern(C) GDateTime* function(const(GTimeVal)* tv) nothrow;
__gshared c_g_date_time_new_from_timeval_utcFn c_g_date_time_new_from_timeval_utc; ///
private alias c_g_date_time_new_from_unix_localFn = extern(C) GDateTime* function(long t) nothrow;
__gshared c_g_date_time_new_from_unix_localFn c_g_date_time_new_from_unix_local; ///
private alias c_g_date_time_new_from_unix_local_usecFn = extern(C) GDateTime* function(long usecs) nothrow;
__gshared c_g_date_time_new_from_unix_local_usecFn c_g_date_time_new_from_unix_local_usec; ///
private alias c_g_date_time_new_from_unix_utcFn = extern(C) GDateTime* function(long t) nothrow;
__gshared c_g_date_time_new_from_unix_utcFn c_g_date_time_new_from_unix_utc; ///
private alias c_g_date_time_new_from_unix_utc_usecFn = extern(C) GDateTime* function(long usecs) nothrow;
__gshared c_g_date_time_new_from_unix_utc_usecFn c_g_date_time_new_from_unix_utc_usec; ///
private alias c_g_date_time_new_localFn = extern(C) GDateTime* function(int year, int month, int day, int hour, int minute, double seconds) nothrow;
__gshared c_g_date_time_new_localFn c_g_date_time_new_local; ///
private alias c_g_date_time_new_nowFn = extern(C) GDateTime* function(GTimeZone* tz) nothrow;
__gshared c_g_date_time_new_nowFn c_g_date_time_new_now; ///
private alias c_g_date_time_new_now_localFn = extern(C) GDateTime* function() nothrow;
__gshared c_g_date_time_new_now_localFn c_g_date_time_new_now_local; ///
private alias c_g_date_time_new_now_utcFn = extern(C) GDateTime* function() nothrow;
__gshared c_g_date_time_new_now_utcFn c_g_date_time_new_now_utc; ///
private alias c_g_date_time_new_utcFn = extern(C) GDateTime* function(int year, int month, int day, int hour, int minute, double seconds) nothrow;
__gshared c_g_date_time_new_utcFn c_g_date_time_new_utc; ///
private alias c_g_date_time_addFn = extern(C) GDateTime* function(GDateTime* datetime, GTimeSpan timespan) nothrow;
__gshared c_g_date_time_addFn c_g_date_time_add; ///
private alias c_g_date_time_add_daysFn = extern(C) GDateTime* function(GDateTime* datetime, int days) nothrow;
__gshared c_g_date_time_add_daysFn c_g_date_time_add_days; ///
private alias c_g_date_time_add_fullFn = extern(C) GDateTime* function(GDateTime* datetime, int years, int months, int days, int hours, int minutes, double seconds) nothrow;
__gshared c_g_date_time_add_fullFn c_g_date_time_add_full; ///
private alias c_g_date_time_add_hoursFn = extern(C) GDateTime* function(GDateTime* datetime, int hours) nothrow;
__gshared c_g_date_time_add_hoursFn c_g_date_time_add_hours; ///
private alias c_g_date_time_add_minutesFn = extern(C) GDateTime* function(GDateTime* datetime, int minutes) nothrow;
__gshared c_g_date_time_add_minutesFn c_g_date_time_add_minutes; ///
private alias c_g_date_time_add_monthsFn = extern(C) GDateTime* function(GDateTime* datetime, int months) nothrow;
__gshared c_g_date_time_add_monthsFn c_g_date_time_add_months; ///
private alias c_g_date_time_add_secondsFn = extern(C) GDateTime* function(GDateTime* datetime, double seconds) nothrow;
__gshared c_g_date_time_add_secondsFn c_g_date_time_add_seconds; ///
private alias c_g_date_time_add_weeksFn = extern(C) GDateTime* function(GDateTime* datetime, int weeks) nothrow;
__gshared c_g_date_time_add_weeksFn c_g_date_time_add_weeks; ///
private alias c_g_date_time_add_yearsFn = extern(C) GDateTime* function(GDateTime* datetime, int years) nothrow;
__gshared c_g_date_time_add_yearsFn c_g_date_time_add_years; ///
private alias c_g_date_time_compareFn = extern(C) int function(GDateTime* dt1, GDateTime* dt2) nothrow;
__gshared c_g_date_time_compareFn c_g_date_time_compare; ///
private alias c_g_date_time_differenceFn = extern(C) GTimeSpan function(GDateTime* end, GDateTime* begin) nothrow;
__gshared c_g_date_time_differenceFn c_g_date_time_difference; ///
private alias c_g_date_time_equalFn = extern(C) gboolean function(GDateTime* dt1, GDateTime* dt2) nothrow;
__gshared c_g_date_time_equalFn c_g_date_time_equal; ///
private alias c_g_date_time_formatFn = extern(C) char* function(GDateTime* datetime, const(char)* format) nothrow;
__gshared c_g_date_time_formatFn c_g_date_time_format; ///
private alias c_g_date_time_format_iso8601Fn = extern(C) char* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_format_iso8601Fn c_g_date_time_format_iso8601; ///
private alias c_g_date_time_get_day_of_monthFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_day_of_monthFn c_g_date_time_get_day_of_month; ///
private alias c_g_date_time_get_day_of_weekFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_day_of_weekFn c_g_date_time_get_day_of_week; ///
private alias c_g_date_time_get_day_of_yearFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_day_of_yearFn c_g_date_time_get_day_of_year; ///
private alias c_g_date_time_get_hourFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_hourFn c_g_date_time_get_hour; ///
private alias c_g_date_time_get_microsecondFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_microsecondFn c_g_date_time_get_microsecond; ///
private alias c_g_date_time_get_minuteFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_minuteFn c_g_date_time_get_minute; ///
private alias c_g_date_time_get_monthFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_monthFn c_g_date_time_get_month; ///
private alias c_g_date_time_get_secondFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_secondFn c_g_date_time_get_second; ///
private alias c_g_date_time_get_secondsFn = extern(C) double function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_secondsFn c_g_date_time_get_seconds; ///
private alias c_g_date_time_get_timezoneFn = extern(C) GTimeZone* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_timezoneFn c_g_date_time_get_timezone; ///
private alias c_g_date_time_get_timezone_abbreviationFn = extern(C) const(char)* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_timezone_abbreviationFn c_g_date_time_get_timezone_abbreviation; ///
private alias c_g_date_time_get_utc_offsetFn = extern(C) GTimeSpan function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_utc_offsetFn c_g_date_time_get_utc_offset; ///
private alias c_g_date_time_get_week_numbering_yearFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_week_numbering_yearFn c_g_date_time_get_week_numbering_year; ///
private alias c_g_date_time_get_week_of_yearFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_week_of_yearFn c_g_date_time_get_week_of_year; ///
private alias c_g_date_time_get_yearFn = extern(C) int function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_get_yearFn c_g_date_time_get_year; ///
private alias c_g_date_time_get_ymdFn = extern(C) void function(GDateTime* datetime, int* year, int* month, int* day) nothrow;
__gshared c_g_date_time_get_ymdFn c_g_date_time_get_ymd; ///
private alias c_g_date_time_hashFn = extern(C) uint function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_hashFn c_g_date_time_hash; ///
private alias c_g_date_time_is_daylight_savingsFn = extern(C) gboolean function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_is_daylight_savingsFn c_g_date_time_is_daylight_savings; ///
private alias c_g_date_time_refFn = extern(C) GDateTime* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_refFn c_g_date_time_ref; ///
private alias c_g_date_time_to_localFn = extern(C) GDateTime* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_to_localFn c_g_date_time_to_local; ///
private alias c_g_date_time_to_timevalFn = extern(C) gboolean function(GDateTime* datetime, GTimeVal* tv) nothrow;
__gshared c_g_date_time_to_timevalFn c_g_date_time_to_timeval; ///
private alias c_g_date_time_to_timezoneFn = extern(C) GDateTime* function(GDateTime* datetime, GTimeZone* tz) nothrow;
__gshared c_g_date_time_to_timezoneFn c_g_date_time_to_timezone; ///
private alias c_g_date_time_to_unixFn = extern(C) long function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_to_unixFn c_g_date_time_to_unix; ///
private alias c_g_date_time_to_unix_usecFn = extern(C) long function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_to_unix_usecFn c_g_date_time_to_unix_usec; ///
private alias c_g_date_time_to_utcFn = extern(C) GDateTime* function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_to_utcFn c_g_date_time_to_utc; ///
private alias c_g_date_time_unrefFn = extern(C) void function(GDateTime* datetime) nothrow;
__gshared c_g_date_time_unrefFn c_g_date_time_unref; ///

// Dir
private alias c_g_dir_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_dir_get_typeFn c_g_dir_get_type; ///
private alias c_g_dir_openFn = extern(C) GDir* function(const(char)* path, uint flags, GError** _err) nothrow;
__gshared c_g_dir_openFn c_g_dir_open; ///
private alias c_g_dir_closeFn = extern(C) void function(GDir* dir) nothrow;
__gshared c_g_dir_closeFn c_g_dir_close; ///
private alias c_g_dir_read_nameFn = extern(C) const(char)* function(GDir* dir) nothrow;
__gshared c_g_dir_read_nameFn c_g_dir_read_name; ///
private alias c_g_dir_refFn = extern(C) GDir* function(GDir* dir) nothrow;
__gshared c_g_dir_refFn c_g_dir_ref; ///
private alias c_g_dir_rewindFn = extern(C) void function(GDir* dir) nothrow;
__gshared c_g_dir_rewindFn c_g_dir_rewind; ///
private alias c_g_dir_unrefFn = extern(C) void function(GDir* dir) nothrow;
__gshared c_g_dir_unrefFn c_g_dir_unref; ///
private alias c_g_dir_make_tmpFn = extern(C) char* function(const(char)* tmpl, GError** _err) nothrow;
__gshared c_g_dir_make_tmpFn c_g_dir_make_tmp; ///

// ErrorWrap
private alias c_g_error_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_error_get_typeFn c_g_error_get_type; ///
private alias c_g_error_newFn = extern(C) GError* function(GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_error_newFn c_g_error_new; ///
private alias c_g_error_new_literalFn = extern(C) GError* function(GQuark domain, int code, const(char)* message) nothrow;
__gshared c_g_error_new_literalFn c_g_error_new_literal; ///
private alias c_g_error_new_valistFn = extern(C) GError* function(GQuark domain, int code, const(char)* format, void* args) nothrow;
__gshared c_g_error_new_valistFn c_g_error_new_valist; ///
private alias c_g_error_copyFn = extern(C) GError* function(const(GError)* error) nothrow;
__gshared c_g_error_copyFn c_g_error_copy; ///
private alias c_g_error_freeFn = extern(C) void function(GError* error) nothrow;
__gshared c_g_error_freeFn c_g_error_free; ///
private alias c_g_error_matchesFn = extern(C) gboolean function(const(GError)* error, GQuark domain, int code) nothrow;
__gshared c_g_error_matchesFn c_g_error_matches; ///
private alias c_g_error_domain_registerFn = extern(C) GQuark function(const(char)* errorTypeName, size_t errorTypePrivateSize, GErrorInitFunc errorTypeInit, GErrorCopyFunc errorTypeCopy, GErrorClearFunc errorTypeClear) nothrow;
__gshared c_g_error_domain_registerFn c_g_error_domain_register; ///
private alias c_g_error_domain_register_staticFn = extern(C) GQuark function(const(char)* errorTypeName, size_t errorTypePrivateSize, GErrorInitFunc errorTypeInit, GErrorCopyFunc errorTypeCopy, GErrorClearFunc errorTypeClear) nothrow;
__gshared c_g_error_domain_register_staticFn c_g_error_domain_register_static; ///

// HashTable
private alias c_g_hash_table_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_hash_table_get_typeFn c_g_hash_table_get_type; ///
private alias c_g_hash_table_addFn = extern(C) gboolean function(GHashTable* hashTable, void* key) nothrow;
__gshared c_g_hash_table_addFn c_g_hash_table_add; ///
private alias c_g_hash_table_containsFn = extern(C) gboolean function(GHashTable* hashTable, const(void)* key) nothrow;
__gshared c_g_hash_table_containsFn c_g_hash_table_contains; ///
private alias c_g_hash_table_destroyFn = extern(C) void function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_destroyFn c_g_hash_table_destroy; ///
private alias c_g_hash_table_findFn = extern(C) void* function(GHashTable* hashTable, GHRFunc predicate, void* userData) nothrow;
__gshared c_g_hash_table_findFn c_g_hash_table_find; ///
private alias c_g_hash_table_foreachFn = extern(C) void function(GHashTable* hashTable, GHFunc func, void* userData) nothrow;
__gshared c_g_hash_table_foreachFn c_g_hash_table_foreach; ///
private alias c_g_hash_table_foreach_removeFn = extern(C) uint function(GHashTable* hashTable, GHRFunc func, void* userData) nothrow;
__gshared c_g_hash_table_foreach_removeFn c_g_hash_table_foreach_remove; ///
private alias c_g_hash_table_foreach_stealFn = extern(C) uint function(GHashTable* hashTable, GHRFunc func, void* userData) nothrow;
__gshared c_g_hash_table_foreach_stealFn c_g_hash_table_foreach_steal; ///
private alias c_g_hash_table_get_keysFn = extern(C) GList* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_get_keysFn c_g_hash_table_get_keys; ///
private alias c_g_hash_table_get_keys_as_arrayFn = extern(C) void** function(GHashTable* hashTable, uint* length) nothrow;
__gshared c_g_hash_table_get_keys_as_arrayFn c_g_hash_table_get_keys_as_array; ///
private alias c_g_hash_table_get_keys_as_ptr_arrayFn = extern(C) GPtrArray* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_get_keys_as_ptr_arrayFn c_g_hash_table_get_keys_as_ptr_array; ///
private alias c_g_hash_table_get_valuesFn = extern(C) GList* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_get_valuesFn c_g_hash_table_get_values; ///
private alias c_g_hash_table_get_values_as_ptr_arrayFn = extern(C) GPtrArray* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_get_values_as_ptr_arrayFn c_g_hash_table_get_values_as_ptr_array; ///
private alias c_g_hash_table_insertFn = extern(C) gboolean function(GHashTable* hashTable, void* key, void* value) nothrow;
__gshared c_g_hash_table_insertFn c_g_hash_table_insert; ///
private alias c_g_hash_table_lookupFn = extern(C) void* function(GHashTable* hashTable, const(void)* key) nothrow;
__gshared c_g_hash_table_lookupFn c_g_hash_table_lookup; ///
private alias c_g_hash_table_lookup_extendedFn = extern(C) gboolean function(GHashTable* hashTable, const(void)* lookupKey, void** origKey, void** value) nothrow;
__gshared c_g_hash_table_lookup_extendedFn c_g_hash_table_lookup_extended; ///
private alias c_g_hash_table_newFn = extern(C) GHashTable* function(GHashFunc hashFunc, GEqualFunc keyEqualFunc) nothrow;
__gshared c_g_hash_table_newFn c_g_hash_table_new; ///
private alias c_g_hash_table_new_fullFn = extern(C) GHashTable* function(GHashFunc hashFunc, GEqualFunc keyEqualFunc, GDestroyNotify keyDestroyFunc, GDestroyNotify valueDestroyFunc) nothrow;
__gshared c_g_hash_table_new_fullFn c_g_hash_table_new_full; ///
private alias c_g_hash_table_new_similarFn = extern(C) GHashTable* function(GHashTable* otherHashTable) nothrow;
__gshared c_g_hash_table_new_similarFn c_g_hash_table_new_similar; ///
private alias c_g_hash_table_refFn = extern(C) GHashTable* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_refFn c_g_hash_table_ref; ///
private alias c_g_hash_table_removeFn = extern(C) gboolean function(GHashTable* hashTable, const(void)* key) nothrow;
__gshared c_g_hash_table_removeFn c_g_hash_table_remove; ///
private alias c_g_hash_table_remove_allFn = extern(C) void function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_remove_allFn c_g_hash_table_remove_all; ///
private alias c_g_hash_table_replaceFn = extern(C) gboolean function(GHashTable* hashTable, void* key, void* value) nothrow;
__gshared c_g_hash_table_replaceFn c_g_hash_table_replace; ///
private alias c_g_hash_table_sizeFn = extern(C) uint function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_sizeFn c_g_hash_table_size; ///
private alias c_g_hash_table_stealFn = extern(C) gboolean function(GHashTable* hashTable, const(void)* key) nothrow;
__gshared c_g_hash_table_stealFn c_g_hash_table_steal; ///
private alias c_g_hash_table_steal_allFn = extern(C) void function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_steal_allFn c_g_hash_table_steal_all; ///
private alias c_g_hash_table_steal_all_keysFn = extern(C) GPtrArray* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_steal_all_keysFn c_g_hash_table_steal_all_keys; ///
private alias c_g_hash_table_steal_all_valuesFn = extern(C) GPtrArray* function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_steal_all_valuesFn c_g_hash_table_steal_all_values; ///
private alias c_g_hash_table_steal_extendedFn = extern(C) gboolean function(GHashTable* hashTable, const(void)* lookupKey, void** stolenKey, void** stolenValue) nothrow;
__gshared c_g_hash_table_steal_extendedFn c_g_hash_table_steal_extended; ///
private alias c_g_hash_table_unrefFn = extern(C) void function(GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_unrefFn c_g_hash_table_unref; ///

// HashTableIter
private alias c_g_hash_table_iter_get_hash_tableFn = extern(C) GHashTable* function(GHashTableIter* iter) nothrow;
__gshared c_g_hash_table_iter_get_hash_tableFn c_g_hash_table_iter_get_hash_table; ///
private alias c_g_hash_table_iter_initFn = extern(C) void function(GHashTableIter* iter, GHashTable* hashTable) nothrow;
__gshared c_g_hash_table_iter_initFn c_g_hash_table_iter_init; ///
private alias c_g_hash_table_iter_nextFn = extern(C) gboolean function(GHashTableIter* iter, void** key, void** value) nothrow;
__gshared c_g_hash_table_iter_nextFn c_g_hash_table_iter_next; ///
private alias c_g_hash_table_iter_removeFn = extern(C) void function(GHashTableIter* iter) nothrow;
__gshared c_g_hash_table_iter_removeFn c_g_hash_table_iter_remove; ///
private alias c_g_hash_table_iter_replaceFn = extern(C) void function(GHashTableIter* iter, void* value) nothrow;
__gshared c_g_hash_table_iter_replaceFn c_g_hash_table_iter_replace; ///
private alias c_g_hash_table_iter_stealFn = extern(C) void function(GHashTableIter* iter) nothrow;
__gshared c_g_hash_table_iter_stealFn c_g_hash_table_iter_steal; ///

// Hmac
private alias c_g_hmac_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_hmac_get_typeFn c_g_hmac_get_type; ///
private alias c_g_hmac_newFn = extern(C) GHmac* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen) nothrow;
__gshared c_g_hmac_newFn c_g_hmac_new; ///
private alias c_g_hmac_copyFn = extern(C) GHmac* function(const(GHmac)* hmac) nothrow;
__gshared c_g_hmac_copyFn c_g_hmac_copy; ///
private alias c_g_hmac_get_digestFn = extern(C) void function(GHmac* hmac, ubyte* buffer, size_t* digestLen) nothrow;
__gshared c_g_hmac_get_digestFn c_g_hmac_get_digest; ///
private alias c_g_hmac_get_stringFn = extern(C) const(char)* function(GHmac* hmac) nothrow;
__gshared c_g_hmac_get_stringFn c_g_hmac_get_string; ///
private alias c_g_hmac_refFn = extern(C) GHmac* function(GHmac* hmac) nothrow;
__gshared c_g_hmac_refFn c_g_hmac_ref; ///
private alias c_g_hmac_unrefFn = extern(C) void function(GHmac* hmac) nothrow;
__gshared c_g_hmac_unrefFn c_g_hmac_unref; ///
private alias c_g_hmac_updateFn = extern(C) void function(GHmac* hmac, const(ubyte)* data, ptrdiff_t length) nothrow;
__gshared c_g_hmac_updateFn c_g_hmac_update; ///

// Hook
private alias c_g_hook_compare_idsFn = extern(C) int function(GHook* newHook, GHook* sibling) nothrow;
__gshared c_g_hook_compare_idsFn c_g_hook_compare_ids; ///
private alias c_g_hook_allocFn = extern(C) GHook* function(GHookList* hookList) nothrow;
__gshared c_g_hook_allocFn c_g_hook_alloc; ///
private alias c_g_hook_destroyFn = extern(C) gboolean function(GHookList* hookList, gulong hookId) nothrow;
__gshared c_g_hook_destroyFn c_g_hook_destroy; ///
private alias c_g_hook_destroy_linkFn = extern(C) void function(GHookList* hookList, GHook* hook) nothrow;
__gshared c_g_hook_destroy_linkFn c_g_hook_destroy_link; ///
private alias c_g_hook_findFn = extern(C) GHook* function(GHookList* hookList, gboolean needValids, GHookFindFunc func, void* data) nothrow;
__gshared c_g_hook_findFn c_g_hook_find; ///
private alias c_g_hook_find_dataFn = extern(C) GHook* function(GHookList* hookList, gboolean needValids, void* data) nothrow;
__gshared c_g_hook_find_dataFn c_g_hook_find_data; ///
private alias c_g_hook_find_funcFn = extern(C) GHook* function(GHookList* hookList, gboolean needValids, void* func) nothrow;
__gshared c_g_hook_find_funcFn c_g_hook_find_func; ///
private alias c_g_hook_find_func_dataFn = extern(C) GHook* function(GHookList* hookList, gboolean needValids, void* func, void* data) nothrow;
__gshared c_g_hook_find_func_dataFn c_g_hook_find_func_data; ///
private alias c_g_hook_first_validFn = extern(C) GHook* function(GHookList* hookList, gboolean mayBeInCall) nothrow;
__gshared c_g_hook_first_validFn c_g_hook_first_valid; ///
private alias c_g_hook_freeFn = extern(C) void function(GHookList* hookList, GHook* hook) nothrow;
__gshared c_g_hook_freeFn c_g_hook_free; ///
private alias c_g_hook_getFn = extern(C) GHook* function(GHookList* hookList, gulong hookId) nothrow;
__gshared c_g_hook_getFn c_g_hook_get; ///
private alias c_g_hook_insert_beforeFn = extern(C) void function(GHookList* hookList, GHook* sibling, GHook* hook) nothrow;
__gshared c_g_hook_insert_beforeFn c_g_hook_insert_before; ///
private alias c_g_hook_insert_sortedFn = extern(C) void function(GHookList* hookList, GHook* hook, GHookCompareFunc func) nothrow;
__gshared c_g_hook_insert_sortedFn c_g_hook_insert_sorted; ///
private alias c_g_hook_next_validFn = extern(C) GHook* function(GHookList* hookList, GHook* hook, gboolean mayBeInCall) nothrow;
__gshared c_g_hook_next_validFn c_g_hook_next_valid; ///
private alias c_g_hook_prependFn = extern(C) void function(GHookList* hookList, GHook* hook) nothrow;
__gshared c_g_hook_prependFn c_g_hook_prepend; ///
private alias c_g_hook_refFn = extern(C) GHook* function(GHookList* hookList, GHook* hook) nothrow;
__gshared c_g_hook_refFn c_g_hook_ref; ///
private alias c_g_hook_unrefFn = extern(C) void function(GHookList* hookList, GHook* hook) nothrow;
__gshared c_g_hook_unrefFn c_g_hook_unref; ///

// HookList
private alias c_g_hook_list_clearFn = extern(C) void function(GHookList* hookList) nothrow;
__gshared c_g_hook_list_clearFn c_g_hook_list_clear; ///
private alias c_g_hook_list_initFn = extern(C) void function(GHookList* hookList, uint hookSize) nothrow;
__gshared c_g_hook_list_initFn c_g_hook_list_init; ///
private alias c_g_hook_list_invokeFn = extern(C) void function(GHookList* hookList, gboolean mayRecurse) nothrow;
__gshared c_g_hook_list_invokeFn c_g_hook_list_invoke; ///
private alias c_g_hook_list_invoke_checkFn = extern(C) void function(GHookList* hookList, gboolean mayRecurse) nothrow;
__gshared c_g_hook_list_invoke_checkFn c_g_hook_list_invoke_check; ///
private alias c_g_hook_list_marshalFn = extern(C) void function(GHookList* hookList, gboolean mayRecurse, GHookMarshaller marshaller, void* marshalData) nothrow;
__gshared c_g_hook_list_marshalFn c_g_hook_list_marshal; ///
private alias c_g_hook_list_marshal_checkFn = extern(C) void function(GHookList* hookList, gboolean mayRecurse, GHookCheckMarshaller marshaller, void* marshalData) nothrow;
__gshared c_g_hook_list_marshal_checkFn c_g_hook_list_marshal_check; ///

// IOChannel
private alias c_g_io_channel_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_io_channel_get_typeFn c_g_io_channel_get_type; ///
private alias c_g_io_channel_new_fileFn = extern(C) GIOChannel* function(const(char)* filename, const(char)* mode, GError** _err) nothrow;
__gshared c_g_io_channel_new_fileFn c_g_io_channel_new_file; ///
private alias c_g_io_channel_unix_newFn = extern(C) GIOChannel* function(int fd) nothrow;
__gshared c_g_io_channel_unix_newFn c_g_io_channel_unix_new; ///
private alias c_g_io_channel_closeFn = extern(C) void function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_closeFn c_g_io_channel_close; ///
private alias c_g_io_channel_flushFn = extern(C) GIOStatus function(GIOChannel* channel, GError** _err) nothrow;
__gshared c_g_io_channel_flushFn c_g_io_channel_flush; ///
private alias c_g_io_channel_get_buffer_conditionFn = extern(C) GIOCondition function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_buffer_conditionFn c_g_io_channel_get_buffer_condition; ///
private alias c_g_io_channel_get_buffer_sizeFn = extern(C) size_t function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_buffer_sizeFn c_g_io_channel_get_buffer_size; ///
private alias c_g_io_channel_get_bufferedFn = extern(C) gboolean function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_bufferedFn c_g_io_channel_get_buffered; ///
private alias c_g_io_channel_get_close_on_unrefFn = extern(C) gboolean function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_close_on_unrefFn c_g_io_channel_get_close_on_unref; ///
private alias c_g_io_channel_get_encodingFn = extern(C) const(char)* function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_encodingFn c_g_io_channel_get_encoding; ///
private alias c_g_io_channel_get_flagsFn = extern(C) GIOFlags function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_get_flagsFn c_g_io_channel_get_flags; ///
private alias c_g_io_channel_get_line_termFn = extern(C) const(char)* function(GIOChannel* channel, int* length) nothrow;
__gshared c_g_io_channel_get_line_termFn c_g_io_channel_get_line_term; ///
private alias c_g_io_channel_initFn = extern(C) void function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_initFn c_g_io_channel_init; ///
private alias c_g_io_channel_readFn = extern(C) GIOError function(GIOChannel* channel, ubyte* buf, size_t count, size_t* bytesRead) nothrow;
__gshared c_g_io_channel_readFn c_g_io_channel_read; ///
private alias c_g_io_channel_read_charsFn = extern(C) GIOStatus function(GIOChannel* channel, ubyte* buf, size_t count, size_t* bytesRead, GError** _err) nothrow;
__gshared c_g_io_channel_read_charsFn c_g_io_channel_read_chars; ///
private alias c_g_io_channel_read_lineFn = extern(C) GIOStatus function(GIOChannel* channel, char** strReturn, size_t* length, size_t* terminatorPos, GError** _err) nothrow;
__gshared c_g_io_channel_read_lineFn c_g_io_channel_read_line; ///
private alias c_g_io_channel_read_line_stringFn = extern(C) GIOStatus function(GIOChannel* channel, GString* buffer, size_t* terminatorPos, GError** _err) nothrow;
__gshared c_g_io_channel_read_line_stringFn c_g_io_channel_read_line_string; ///
private alias c_g_io_channel_read_to_endFn = extern(C) GIOStatus function(GIOChannel* channel, ubyte** strReturn, size_t* length, GError** _err) nothrow;
__gshared c_g_io_channel_read_to_endFn c_g_io_channel_read_to_end; ///
private alias c_g_io_channel_read_unicharFn = extern(C) GIOStatus function(GIOChannel* channel, dchar* thechar, GError** _err) nothrow;
__gshared c_g_io_channel_read_unicharFn c_g_io_channel_read_unichar; ///
private alias c_g_io_channel_refFn = extern(C) GIOChannel* function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_refFn c_g_io_channel_ref; ///
private alias c_g_io_channel_seekFn = extern(C) GIOError function(GIOChannel* channel, long offset, GSeekType type) nothrow;
__gshared c_g_io_channel_seekFn c_g_io_channel_seek; ///
private alias c_g_io_channel_seek_positionFn = extern(C) GIOStatus function(GIOChannel* channel, long offset, GSeekType type, GError** _err) nothrow;
__gshared c_g_io_channel_seek_positionFn c_g_io_channel_seek_position; ///
private alias c_g_io_channel_set_buffer_sizeFn = extern(C) void function(GIOChannel* channel, size_t size) nothrow;
__gshared c_g_io_channel_set_buffer_sizeFn c_g_io_channel_set_buffer_size; ///
private alias c_g_io_channel_set_bufferedFn = extern(C) void function(GIOChannel* channel, gboolean buffered) nothrow;
__gshared c_g_io_channel_set_bufferedFn c_g_io_channel_set_buffered; ///
private alias c_g_io_channel_set_close_on_unrefFn = extern(C) void function(GIOChannel* channel, gboolean doClose) nothrow;
__gshared c_g_io_channel_set_close_on_unrefFn c_g_io_channel_set_close_on_unref; ///
private alias c_g_io_channel_set_encodingFn = extern(C) GIOStatus function(GIOChannel* channel, const(char)* encoding, GError** _err) nothrow;
__gshared c_g_io_channel_set_encodingFn c_g_io_channel_set_encoding; ///
private alias c_g_io_channel_set_flagsFn = extern(C) GIOStatus function(GIOChannel* channel, GIOFlags flags, GError** _err) nothrow;
__gshared c_g_io_channel_set_flagsFn c_g_io_channel_set_flags; ///
private alias c_g_io_channel_set_line_termFn = extern(C) void function(GIOChannel* channel, const(char)* lineTerm, int length) nothrow;
__gshared c_g_io_channel_set_line_termFn c_g_io_channel_set_line_term; ///
private alias c_g_io_channel_shutdownFn = extern(C) GIOStatus function(GIOChannel* channel, gboolean flush, GError** _err) nothrow;
__gshared c_g_io_channel_shutdownFn c_g_io_channel_shutdown; ///
private alias c_g_io_channel_unix_get_fdFn = extern(C) int function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_unix_get_fdFn c_g_io_channel_unix_get_fd; ///
private alias c_g_io_channel_unrefFn = extern(C) void function(GIOChannel* channel) nothrow;
__gshared c_g_io_channel_unrefFn c_g_io_channel_unref; ///
private alias c_g_io_channel_writeFn = extern(C) GIOError function(GIOChannel* channel, const(char)* buf, size_t count, size_t* bytesWritten) nothrow;
__gshared c_g_io_channel_writeFn c_g_io_channel_write; ///
private alias c_g_io_channel_write_charsFn = extern(C) GIOStatus function(GIOChannel* channel, const(ubyte)* buf, ptrdiff_t count, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_io_channel_write_charsFn c_g_io_channel_write_chars; ///
private alias c_g_io_channel_write_unicharFn = extern(C) GIOStatus function(GIOChannel* channel, dchar thechar, GError** _err) nothrow;
__gshared c_g_io_channel_write_unicharFn c_g_io_channel_write_unichar; ///
private alias c_g_io_channel_error_from_errnoFn = extern(C) GIOChannelError function(int en) nothrow;
__gshared c_g_io_channel_error_from_errnoFn c_g_io_channel_error_from_errno; ///
private alias c_g_io_channel_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_io_channel_error_quarkFn c_g_io_channel_error_quark; ///

// KeyFile
private alias c_g_key_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_key_file_get_typeFn c_g_key_file_get_type; ///
private alias c_g_key_file_newFn = extern(C) GKeyFile* function() nothrow;
__gshared c_g_key_file_newFn c_g_key_file_new; ///
private alias c_g_key_file_freeFn = extern(C) void function(GKeyFile* keyFile) nothrow;
__gshared c_g_key_file_freeFn c_g_key_file_free; ///
private alias c_g_key_file_get_booleanFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_booleanFn c_g_key_file_get_boolean; ///
private alias c_g_key_file_get_boolean_listFn = extern(C) gboolean* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_boolean_listFn c_g_key_file_get_boolean_list; ///
private alias c_g_key_file_get_commentFn = extern(C) char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_commentFn c_g_key_file_get_comment; ///
private alias c_g_key_file_get_doubleFn = extern(C) double function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_doubleFn c_g_key_file_get_double; ///
private alias c_g_key_file_get_double_listFn = extern(C) double* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_double_listFn c_g_key_file_get_double_list; ///
private alias c_g_key_file_get_groupsFn = extern(C) char** function(GKeyFile* keyFile, size_t* length) nothrow;
__gshared c_g_key_file_get_groupsFn c_g_key_file_get_groups; ///
private alias c_g_key_file_get_int64Fn = extern(C) long function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_int64Fn c_g_key_file_get_int64; ///
private alias c_g_key_file_get_integerFn = extern(C) int function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_integerFn c_g_key_file_get_integer; ///
private alias c_g_key_file_get_integer_listFn = extern(C) int* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_integer_listFn c_g_key_file_get_integer_list; ///
private alias c_g_key_file_get_keysFn = extern(C) char** function(GKeyFile* keyFile, const(char)* groupName, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_keysFn c_g_key_file_get_keys; ///
private alias c_g_key_file_get_locale_for_keyFn = extern(C) char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale) nothrow;
__gshared c_g_key_file_get_locale_for_keyFn c_g_key_file_get_locale_for_key; ///
private alias c_g_key_file_get_locale_stringFn = extern(C) char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, GError** _err) nothrow;
__gshared c_g_key_file_get_locale_stringFn c_g_key_file_get_locale_string; ///
private alias c_g_key_file_get_locale_string_listFn = extern(C) char** function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_locale_string_listFn c_g_key_file_get_locale_string_list; ///
private alias c_g_key_file_get_start_groupFn = extern(C) char* function(GKeyFile* keyFile) nothrow;
__gshared c_g_key_file_get_start_groupFn c_g_key_file_get_start_group; ///
private alias c_g_key_file_get_stringFn = extern(C) char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_stringFn c_g_key_file_get_string; ///
private alias c_g_key_file_get_string_listFn = extern(C) char** function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_get_string_listFn c_g_key_file_get_string_list; ///
private alias c_g_key_file_get_uint64Fn = extern(C) ulong function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_uint64Fn c_g_key_file_get_uint64; ///
private alias c_g_key_file_get_valueFn = extern(C) char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_get_valueFn c_g_key_file_get_value; ///
private alias c_g_key_file_has_groupFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName) nothrow;
__gshared c_g_key_file_has_groupFn c_g_key_file_has_group; ///
private alias c_g_key_file_has_keyFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_has_keyFn c_g_key_file_has_key; ///
private alias c_g_key_file_load_from_bytesFn = extern(C) gboolean function(GKeyFile* keyFile, GBytes* bytes, GKeyFileFlags flags, GError** _err) nothrow;
__gshared c_g_key_file_load_from_bytesFn c_g_key_file_load_from_bytes; ///
private alias c_g_key_file_load_from_dataFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* data, size_t length, GKeyFileFlags flags, GError** _err) nothrow;
__gshared c_g_key_file_load_from_dataFn c_g_key_file_load_from_data; ///
private alias c_g_key_file_load_from_data_dirsFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* file, char** fullPath, GKeyFileFlags flags, GError** _err) nothrow;
__gshared c_g_key_file_load_from_data_dirsFn c_g_key_file_load_from_data_dirs; ///
private alias c_g_key_file_load_from_dirsFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* file, const(char*)* searchDirs, char** fullPath, GKeyFileFlags flags, GError** _err) nothrow;
__gshared c_g_key_file_load_from_dirsFn c_g_key_file_load_from_dirs; ///
private alias c_g_key_file_load_from_fileFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* file, GKeyFileFlags flags, GError** _err) nothrow;
__gshared c_g_key_file_load_from_fileFn c_g_key_file_load_from_file; ///
private alias c_g_key_file_refFn = extern(C) GKeyFile* function(GKeyFile* keyFile) nothrow;
__gshared c_g_key_file_refFn c_g_key_file_ref; ///
private alias c_g_key_file_remove_commentFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_remove_commentFn c_g_key_file_remove_comment; ///
private alias c_g_key_file_remove_groupFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, GError** _err) nothrow;
__gshared c_g_key_file_remove_groupFn c_g_key_file_remove_group; ///
private alias c_g_key_file_remove_keyFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) nothrow;
__gshared c_g_key_file_remove_keyFn c_g_key_file_remove_key; ///
private alias c_g_key_file_save_to_fileFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* filename, GError** _err) nothrow;
__gshared c_g_key_file_save_to_fileFn c_g_key_file_save_to_file; ///
private alias c_g_key_file_set_booleanFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, gboolean value) nothrow;
__gshared c_g_key_file_set_booleanFn c_g_key_file_set_boolean; ///
private alias c_g_key_file_set_boolean_listFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, gboolean* list, size_t length) nothrow;
__gshared c_g_key_file_set_boolean_listFn c_g_key_file_set_boolean_list; ///
private alias c_g_key_file_set_commentFn = extern(C) gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* comment, GError** _err) nothrow;
__gshared c_g_key_file_set_commentFn c_g_key_file_set_comment; ///
private alias c_g_key_file_set_doubleFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, double value) nothrow;
__gshared c_g_key_file_set_doubleFn c_g_key_file_set_double; ///
private alias c_g_key_file_set_double_listFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, double* list, size_t length) nothrow;
__gshared c_g_key_file_set_double_listFn c_g_key_file_set_double_list; ///
private alias c_g_key_file_set_int64Fn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, long value) nothrow;
__gshared c_g_key_file_set_int64Fn c_g_key_file_set_int64; ///
private alias c_g_key_file_set_integerFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, int value) nothrow;
__gshared c_g_key_file_set_integerFn c_g_key_file_set_integer; ///
private alias c_g_key_file_set_integer_listFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, int* list, size_t length) nothrow;
__gshared c_g_key_file_set_integer_listFn c_g_key_file_set_integer_list; ///
private alias c_g_key_file_set_list_separatorFn = extern(C) void function(GKeyFile* keyFile, char separator) nothrow;
__gshared c_g_key_file_set_list_separatorFn c_g_key_file_set_list_separator; ///
private alias c_g_key_file_set_locale_stringFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, const(char)* string_) nothrow;
__gshared c_g_key_file_set_locale_stringFn c_g_key_file_set_locale_string; ///
private alias c_g_key_file_set_locale_string_listFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, const(char*)* list, size_t length) nothrow;
__gshared c_g_key_file_set_locale_string_listFn c_g_key_file_set_locale_string_list; ///
private alias c_g_key_file_set_stringFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* string_) nothrow;
__gshared c_g_key_file_set_stringFn c_g_key_file_set_string; ///
private alias c_g_key_file_set_string_listFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char*)* list, size_t length) nothrow;
__gshared c_g_key_file_set_string_listFn c_g_key_file_set_string_list; ///
private alias c_g_key_file_set_uint64Fn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, ulong value) nothrow;
__gshared c_g_key_file_set_uint64Fn c_g_key_file_set_uint64; ///
private alias c_g_key_file_set_valueFn = extern(C) void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* value) nothrow;
__gshared c_g_key_file_set_valueFn c_g_key_file_set_value; ///
private alias c_g_key_file_to_dataFn = extern(C) char* function(GKeyFile* keyFile, size_t* length, GError** _err) nothrow;
__gshared c_g_key_file_to_dataFn c_g_key_file_to_data; ///
private alias c_g_key_file_unrefFn = extern(C) void function(GKeyFile* keyFile) nothrow;
__gshared c_g_key_file_unrefFn c_g_key_file_unref; ///
private alias c_g_key_file_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_key_file_error_quarkFn c_g_key_file_error_quark; ///

// List
private alias c_g_list_allocFn = extern(C) GList* function() nothrow;
__gshared c_g_list_allocFn c_g_list_alloc; ///
private alias c_g_list_appendFn = extern(C) GList* function(GList* list, void* data) nothrow;
__gshared c_g_list_appendFn c_g_list_append; ///
private alias c_g_list_concatFn = extern(C) GList* function(GList* list1, GList* list2) nothrow;
__gshared c_g_list_concatFn c_g_list_concat; ///
private alias c_g_list_copyFn = extern(C) GList* function(GList* list) nothrow;
__gshared c_g_list_copyFn c_g_list_copy; ///
private alias c_g_list_copy_deepFn = extern(C) GList* function(GList* list, GCopyFunc func, void* userData) nothrow;
__gshared c_g_list_copy_deepFn c_g_list_copy_deep; ///
private alias c_g_list_delete_linkFn = extern(C) GList* function(GList* list, GList* link) nothrow;
__gshared c_g_list_delete_linkFn c_g_list_delete_link; ///
private alias c_g_list_findFn = extern(C) GList* function(GList* list, const(void)* data) nothrow;
__gshared c_g_list_findFn c_g_list_find; ///
private alias c_g_list_find_customFn = extern(C) GList* function(GList* list, const(void)* data, GCompareFunc func) nothrow;
__gshared c_g_list_find_customFn c_g_list_find_custom; ///
private alias c_g_list_firstFn = extern(C) GList* function(GList* list) nothrow;
__gshared c_g_list_firstFn c_g_list_first; ///
private alias c_g_list_foreachFn = extern(C) void function(GList* list, GFunc func, void* userData) nothrow;
__gshared c_g_list_foreachFn c_g_list_foreach; ///
private alias c_g_list_freeFn = extern(C) void function(GList* list) nothrow;
__gshared c_g_list_freeFn c_g_list_free; ///
private alias c_g_list_free_1Fn = extern(C) void function(GList* list) nothrow;
__gshared c_g_list_free_1Fn c_g_list_free_1; ///
private alias c_g_list_free_fullFn = extern(C) void function(GList* list, GDestroyNotify freeFunc) nothrow;
__gshared c_g_list_free_fullFn c_g_list_free_full; ///
private alias c_g_list_indexFn = extern(C) int function(GList* list, const(void)* data) nothrow;
__gshared c_g_list_indexFn c_g_list_index; ///
private alias c_g_list_insertFn = extern(C) GList* function(GList* list, void* data, int position) nothrow;
__gshared c_g_list_insertFn c_g_list_insert; ///
private alias c_g_list_insert_beforeFn = extern(C) GList* function(GList* list, GList* sibling, void* data) nothrow;
__gshared c_g_list_insert_beforeFn c_g_list_insert_before; ///
private alias c_g_list_insert_before_linkFn = extern(C) GList* function(GList* list, GList* sibling, GList* link) nothrow;
__gshared c_g_list_insert_before_linkFn c_g_list_insert_before_link; ///
private alias c_g_list_insert_sortedFn = extern(C) GList* function(GList* list, void* data, GCompareFunc func) nothrow;
__gshared c_g_list_insert_sortedFn c_g_list_insert_sorted; ///
private alias c_g_list_insert_sorted_with_dataFn = extern(C) GList* function(GList* list, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_list_insert_sorted_with_dataFn c_g_list_insert_sorted_with_data; ///
private alias c_g_list_lastFn = extern(C) GList* function(GList* list) nothrow;
__gshared c_g_list_lastFn c_g_list_last; ///
private alias c_g_list_lengthFn = extern(C) uint function(GList* list) nothrow;
__gshared c_g_list_lengthFn c_g_list_length; ///
private alias c_g_list_nthFn = extern(C) GList* function(GList* list, uint n) nothrow;
__gshared c_g_list_nthFn c_g_list_nth; ///
private alias c_g_list_nth_dataFn = extern(C) void* function(GList* list, uint n) nothrow;
__gshared c_g_list_nth_dataFn c_g_list_nth_data; ///
private alias c_g_list_nth_prevFn = extern(C) GList* function(GList* list, uint n) nothrow;
__gshared c_g_list_nth_prevFn c_g_list_nth_prev; ///
private alias c_g_list_pop_allocatorFn = extern(C) void function() nothrow;
__gshared c_g_list_pop_allocatorFn c_g_list_pop_allocator; ///
private alias c_g_list_positionFn = extern(C) int function(GList* list, GList* llink) nothrow;
__gshared c_g_list_positionFn c_g_list_position; ///
private alias c_g_list_prependFn = extern(C) GList* function(GList* list, void* data) nothrow;
__gshared c_g_list_prependFn c_g_list_prepend; ///
private alias c_g_list_push_allocatorFn = extern(C) void function(GAllocator* allocator) nothrow;
__gshared c_g_list_push_allocatorFn c_g_list_push_allocator; ///
private alias c_g_list_removeFn = extern(C) GList* function(GList* list, const(void)* data) nothrow;
__gshared c_g_list_removeFn c_g_list_remove; ///
private alias c_g_list_remove_allFn = extern(C) GList* function(GList* list, const(void)* data) nothrow;
__gshared c_g_list_remove_allFn c_g_list_remove_all; ///
private alias c_g_list_remove_linkFn = extern(C) GList* function(GList* list, GList* llink) nothrow;
__gshared c_g_list_remove_linkFn c_g_list_remove_link; ///
private alias c_g_list_reverseFn = extern(C) GList* function(GList* list) nothrow;
__gshared c_g_list_reverseFn c_g_list_reverse; ///
private alias c_g_list_sortFn = extern(C) GList* function(GList* list, GCompareFunc compareFunc) nothrow;
__gshared c_g_list_sortFn c_g_list_sort; ///
private alias c_g_list_sort_with_dataFn = extern(C) GList* function(GList* list, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_list_sort_with_dataFn c_g_list_sort_with_data; ///

// MainContext
private alias c_g_main_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_main_context_get_typeFn c_g_main_context_get_type; ///
private alias c_g_main_context_newFn = extern(C) GMainContext* function() nothrow;
__gshared c_g_main_context_newFn c_g_main_context_new; ///
private alias c_g_main_context_new_with_flagsFn = extern(C) GMainContext* function(GMainContextFlags flags) nothrow;
__gshared c_g_main_context_new_with_flagsFn c_g_main_context_new_with_flags; ///
private alias c_g_main_context_acquireFn = extern(C) gboolean function(GMainContext* context) nothrow;
__gshared c_g_main_context_acquireFn c_g_main_context_acquire; ///
private alias c_g_main_context_add_pollFn = extern(C) void function(GMainContext* context, GPollFD* fd, int priority) nothrow;
__gshared c_g_main_context_add_pollFn c_g_main_context_add_poll; ///
private alias c_g_main_context_checkFn = extern(C) gboolean function(GMainContext* context, int maxPriority, GPollFD* fds, int nFds) nothrow;
__gshared c_g_main_context_checkFn c_g_main_context_check; ///
private alias c_g_main_context_dispatchFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_dispatchFn c_g_main_context_dispatch; ///
private alias c_g_main_context_find_source_by_funcs_user_dataFn = extern(C) GSource* function(GMainContext* context, GSourceFuncs* funcs, void* userData) nothrow;
__gshared c_g_main_context_find_source_by_funcs_user_dataFn c_g_main_context_find_source_by_funcs_user_data; ///
private alias c_g_main_context_find_source_by_idFn = extern(C) GSource* function(GMainContext* context, uint sourceId) nothrow;
__gshared c_g_main_context_find_source_by_idFn c_g_main_context_find_source_by_id; ///
private alias c_g_main_context_find_source_by_user_dataFn = extern(C) GSource* function(GMainContext* context, void* userData) nothrow;
__gshared c_g_main_context_find_source_by_user_dataFn c_g_main_context_find_source_by_user_data; ///
private alias c_g_main_context_get_poll_funcFn = extern(C) GPollFunc function(GMainContext* context) nothrow;
__gshared c_g_main_context_get_poll_funcFn c_g_main_context_get_poll_func; ///
private alias c_g_main_context_invokeFn = extern(C) void function(GMainContext* context, GSourceFunc function_, void* data) nothrow;
__gshared c_g_main_context_invokeFn c_g_main_context_invoke; ///
private alias c_g_main_context_invoke_fullFn = extern(C) void function(GMainContext* context, int priority, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_main_context_invoke_fullFn c_g_main_context_invoke_full; ///
private alias c_g_main_context_is_ownerFn = extern(C) gboolean function(GMainContext* context) nothrow;
__gshared c_g_main_context_is_ownerFn c_g_main_context_is_owner; ///
private alias c_g_main_context_iterationFn = extern(C) gboolean function(GMainContext* context, gboolean mayBlock) nothrow;
__gshared c_g_main_context_iterationFn c_g_main_context_iteration; ///
private alias c_g_main_context_pendingFn = extern(C) gboolean function(GMainContext* context) nothrow;
__gshared c_g_main_context_pendingFn c_g_main_context_pending; ///
private alias c_g_main_context_pop_thread_defaultFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_pop_thread_defaultFn c_g_main_context_pop_thread_default; ///
private alias c_g_main_context_prepareFn = extern(C) gboolean function(GMainContext* context, int* priority) nothrow;
__gshared c_g_main_context_prepareFn c_g_main_context_prepare; ///
private alias c_g_main_context_push_thread_defaultFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_push_thread_defaultFn c_g_main_context_push_thread_default; ///
private alias c_g_main_context_pusher_newFn = extern(C) GMainContextPusher* function(GMainContext* mainContext) nothrow;
__gshared c_g_main_context_pusher_newFn c_g_main_context_pusher_new; ///
private alias c_g_main_context_queryFn = extern(C) int function(GMainContext* context, int maxPriority, int* timeout, GPollFD* fds, int nFds) nothrow;
__gshared c_g_main_context_queryFn c_g_main_context_query; ///
private alias c_g_main_context_refFn = extern(C) GMainContext* function(GMainContext* context) nothrow;
__gshared c_g_main_context_refFn c_g_main_context_ref; ///
private alias c_g_main_context_releaseFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_releaseFn c_g_main_context_release; ///
private alias c_g_main_context_remove_pollFn = extern(C) void function(GMainContext* context, GPollFD* fd) nothrow;
__gshared c_g_main_context_remove_pollFn c_g_main_context_remove_poll; ///
private alias c_g_main_context_set_poll_funcFn = extern(C) void function(GMainContext* context, GPollFunc func) nothrow;
__gshared c_g_main_context_set_poll_funcFn c_g_main_context_set_poll_func; ///
private alias c_g_main_context_unrefFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_unrefFn c_g_main_context_unref; ///
private alias c_g_main_context_waitFn = extern(C) gboolean function(GMainContext* context, GCond* cond, GMutex* mutex) nothrow;
__gshared c_g_main_context_waitFn c_g_main_context_wait; ///
private alias c_g_main_context_wakeupFn = extern(C) void function(GMainContext* context) nothrow;
__gshared c_g_main_context_wakeupFn c_g_main_context_wakeup; ///
private alias c_g_main_context_defaultFn = extern(C) GMainContext* function() nothrow;
__gshared c_g_main_context_defaultFn c_g_main_context_default; ///
private alias c_g_main_context_get_thread_defaultFn = extern(C) GMainContext* function() nothrow;
__gshared c_g_main_context_get_thread_defaultFn c_g_main_context_get_thread_default; ///
private alias c_g_main_context_pusher_freeFn = extern(C) void function(GMainContextPusher* pusher) nothrow;
__gshared c_g_main_context_pusher_freeFn c_g_main_context_pusher_free; ///
private alias c_g_main_context_ref_thread_defaultFn = extern(C) GMainContext* function() nothrow;
__gshared c_g_main_context_ref_thread_defaultFn c_g_main_context_ref_thread_default; ///

// MainLoop
private alias c_g_main_loop_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_main_loop_get_typeFn c_g_main_loop_get_type; ///
private alias c_g_main_loop_newFn = extern(C) GMainLoop* function(GMainContext* context, gboolean isRunning) nothrow;
__gshared c_g_main_loop_newFn c_g_main_loop_new; ///
private alias c_g_main_loop_get_contextFn = extern(C) GMainContext* function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_get_contextFn c_g_main_loop_get_context; ///
private alias c_g_main_loop_is_runningFn = extern(C) gboolean function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_is_runningFn c_g_main_loop_is_running; ///
private alias c_g_main_loop_quitFn = extern(C) void function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_quitFn c_g_main_loop_quit; ///
private alias c_g_main_loop_refFn = extern(C) GMainLoop* function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_refFn c_g_main_loop_ref; ///
private alias c_g_main_loop_runFn = extern(C) void function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_runFn c_g_main_loop_run; ///
private alias c_g_main_loop_unrefFn = extern(C) void function(GMainLoop* loop) nothrow;
__gshared c_g_main_loop_unrefFn c_g_main_loop_unref; ///

// MappedFile
private alias c_g_mapped_file_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_mapped_file_get_typeFn c_g_mapped_file_get_type; ///
private alias c_g_mapped_file_newFn = extern(C) GMappedFile* function(const(char)* filename, gboolean writable, GError** _err) nothrow;
__gshared c_g_mapped_file_newFn c_g_mapped_file_new; ///
private alias c_g_mapped_file_new_from_fdFn = extern(C) GMappedFile* function(int fd, gboolean writable, GError** _err) nothrow;
__gshared c_g_mapped_file_new_from_fdFn c_g_mapped_file_new_from_fd; ///
private alias c_g_mapped_file_freeFn = extern(C) void function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_freeFn c_g_mapped_file_free; ///
private alias c_g_mapped_file_get_bytesFn = extern(C) GBytes* function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_get_bytesFn c_g_mapped_file_get_bytes; ///
private alias c_g_mapped_file_get_contentsFn = extern(C) char* function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_get_contentsFn c_g_mapped_file_get_contents; ///
private alias c_g_mapped_file_get_lengthFn = extern(C) size_t function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_get_lengthFn c_g_mapped_file_get_length; ///
private alias c_g_mapped_file_refFn = extern(C) GMappedFile* function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_refFn c_g_mapped_file_ref; ///
private alias c_g_mapped_file_unrefFn = extern(C) void function(GMappedFile* file) nothrow;
__gshared c_g_mapped_file_unrefFn c_g_mapped_file_unref; ///

// MarkupParseContext
private alias c_g_markup_parse_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_markup_parse_context_get_typeFn c_g_markup_parse_context_get_type; ///
private alias c_g_markup_parse_context_newFn = extern(C) GMarkupParseContext* function(const(GMarkupParser)* parser, GMarkupParseFlags flags, void* userData, GDestroyNotify userDataDnotify) nothrow;
__gshared c_g_markup_parse_context_newFn c_g_markup_parse_context_new; ///
private alias c_g_markup_parse_context_end_parseFn = extern(C) gboolean function(GMarkupParseContext* context, GError** _err) nothrow;
__gshared c_g_markup_parse_context_end_parseFn c_g_markup_parse_context_end_parse; ///
private alias c_g_markup_parse_context_freeFn = extern(C) void function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_freeFn c_g_markup_parse_context_free; ///
private alias c_g_markup_parse_context_get_elementFn = extern(C) const(char)* function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_get_elementFn c_g_markup_parse_context_get_element; ///
private alias c_g_markup_parse_context_get_element_stackFn = extern(C) const(GSList)* function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_get_element_stackFn c_g_markup_parse_context_get_element_stack; ///
private alias c_g_markup_parse_context_get_offsetFn = extern(C) size_t function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_get_offsetFn c_g_markup_parse_context_get_offset; ///
private alias c_g_markup_parse_context_get_positionFn = extern(C) void function(GMarkupParseContext* context, int* lineNumber, int* charNumber) nothrow;
__gshared c_g_markup_parse_context_get_positionFn c_g_markup_parse_context_get_position; ///
private alias c_g_markup_parse_context_get_tag_startFn = extern(C) void function(GMarkupParseContext* context, size_t* lineNumber, size_t* charNumber, size_t* offset) nothrow;
__gshared c_g_markup_parse_context_get_tag_startFn c_g_markup_parse_context_get_tag_start; ///
private alias c_g_markup_parse_context_get_user_dataFn = extern(C) void* function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_get_user_dataFn c_g_markup_parse_context_get_user_data; ///
private alias c_g_markup_parse_context_parseFn = extern(C) gboolean function(GMarkupParseContext* context, const(char)* text, ptrdiff_t textLen, GError** _err) nothrow;
__gshared c_g_markup_parse_context_parseFn c_g_markup_parse_context_parse; ///
private alias c_g_markup_parse_context_popFn = extern(C) void* function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_popFn c_g_markup_parse_context_pop; ///
private alias c_g_markup_parse_context_pushFn = extern(C) void function(GMarkupParseContext* context, const(GMarkupParser)* parser, void* userData) nothrow;
__gshared c_g_markup_parse_context_pushFn c_g_markup_parse_context_push; ///
private alias c_g_markup_parse_context_refFn = extern(C) GMarkupParseContext* function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_refFn c_g_markup_parse_context_ref; ///
private alias c_g_markup_parse_context_unrefFn = extern(C) void function(GMarkupParseContext* context) nothrow;
__gshared c_g_markup_parse_context_unrefFn c_g_markup_parse_context_unref; ///

// MatchInfo
private alias c_g_match_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_match_info_get_typeFn c_g_match_info_get_type; ///
private alias c_g_match_info_expand_referencesFn = extern(C) char* function(const(GMatchInfo)* matchInfo, const(char)* stringToExpand, GError** _err) nothrow;
__gshared c_g_match_info_expand_referencesFn c_g_match_info_expand_references; ///
private alias c_g_match_info_fetchFn = extern(C) char* function(const(GMatchInfo)* matchInfo, int matchNum) nothrow;
__gshared c_g_match_info_fetchFn c_g_match_info_fetch; ///
private alias c_g_match_info_fetch_allFn = extern(C) char** function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_fetch_allFn c_g_match_info_fetch_all; ///
private alias c_g_match_info_fetch_namedFn = extern(C) char* function(const(GMatchInfo)* matchInfo, const(char)* name) nothrow;
__gshared c_g_match_info_fetch_namedFn c_g_match_info_fetch_named; ///
private alias c_g_match_info_fetch_named_posFn = extern(C) gboolean function(const(GMatchInfo)* matchInfo, const(char)* name, int* startPos, int* endPos) nothrow;
__gshared c_g_match_info_fetch_named_posFn c_g_match_info_fetch_named_pos; ///
private alias c_g_match_info_fetch_posFn = extern(C) gboolean function(const(GMatchInfo)* matchInfo, int matchNum, int* startPos, int* endPos) nothrow;
__gshared c_g_match_info_fetch_posFn c_g_match_info_fetch_pos; ///
private alias c_g_match_info_freeFn = extern(C) void function(GMatchInfo* matchInfo) nothrow;
__gshared c_g_match_info_freeFn c_g_match_info_free; ///
private alias c_g_match_info_get_match_countFn = extern(C) int function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_get_match_countFn c_g_match_info_get_match_count; ///
private alias c_g_match_info_get_regexFn = extern(C) GRegex* function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_get_regexFn c_g_match_info_get_regex; ///
private alias c_g_match_info_get_stringFn = extern(C) const(char)* function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_get_stringFn c_g_match_info_get_string; ///
private alias c_g_match_info_is_partial_matchFn = extern(C) gboolean function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_is_partial_matchFn c_g_match_info_is_partial_match; ///
private alias c_g_match_info_matchesFn = extern(C) gboolean function(const(GMatchInfo)* matchInfo) nothrow;
__gshared c_g_match_info_matchesFn c_g_match_info_matches; ///
private alias c_g_match_info_nextFn = extern(C) gboolean function(GMatchInfo* matchInfo, GError** _err) nothrow;
__gshared c_g_match_info_nextFn c_g_match_info_next; ///
private alias c_g_match_info_refFn = extern(C) GMatchInfo* function(GMatchInfo* matchInfo) nothrow;
__gshared c_g_match_info_refFn c_g_match_info_ref; ///
private alias c_g_match_info_unrefFn = extern(C) void function(GMatchInfo* matchInfo) nothrow;
__gshared c_g_match_info_unrefFn c_g_match_info_unref; ///

// MemChunk
private alias c_g_mem_chunk_allocFn = extern(C) void* function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_allocFn c_g_mem_chunk_alloc; ///
private alias c_g_mem_chunk_alloc0Fn = extern(C) void* function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_alloc0Fn c_g_mem_chunk_alloc0; ///
private alias c_g_mem_chunk_cleanFn = extern(C) void function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_cleanFn c_g_mem_chunk_clean; ///
private alias c_g_mem_chunk_destroyFn = extern(C) void function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_destroyFn c_g_mem_chunk_destroy; ///
private alias c_g_mem_chunk_freeFn = extern(C) void function(GMemChunk* memChunk, void* mem) nothrow;
__gshared c_g_mem_chunk_freeFn c_g_mem_chunk_free; ///
private alias c_g_mem_chunk_printFn = extern(C) void function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_printFn c_g_mem_chunk_print; ///
private alias c_g_mem_chunk_resetFn = extern(C) void function(GMemChunk* memChunk) nothrow;
__gshared c_g_mem_chunk_resetFn c_g_mem_chunk_reset; ///
private alias c_g_mem_chunk_infoFn = extern(C) void function() nothrow;
__gshared c_g_mem_chunk_infoFn c_g_mem_chunk_info; ///
private alias c_g_mem_chunk_newFn = extern(C) GMemChunk* function(const(char)* name, int atomSize, size_t areaSize, int type) nothrow;
__gshared c_g_mem_chunk_newFn c_g_mem_chunk_new; ///

// Mutex
private alias c_g_mutex_clearFn = extern(C) void function(GMutex* mutex) nothrow;
__gshared c_g_mutex_clearFn c_g_mutex_clear; ///
private alias c_g_mutex_freeFn = extern(C) void function(GMutex* mutex) nothrow;
__gshared c_g_mutex_freeFn c_g_mutex_free; ///
private alias c_g_mutex_initFn = extern(C) void function(GMutex* mutex) nothrow;
__gshared c_g_mutex_initFn c_g_mutex_init; ///
private alias c_g_mutex_lockFn = extern(C) void function(GMutex* mutex) nothrow;
__gshared c_g_mutex_lockFn c_g_mutex_lock; ///
private alias c_g_mutex_trylockFn = extern(C) gboolean function(GMutex* mutex) nothrow;
__gshared c_g_mutex_trylockFn c_g_mutex_trylock; ///
private alias c_g_mutex_unlockFn = extern(C) void function(GMutex* mutex) nothrow;
__gshared c_g_mutex_unlockFn c_g_mutex_unlock; ///
private alias c_g_mutex_newFn = extern(C) GMutex* function() nothrow;
__gshared c_g_mutex_newFn c_g_mutex_new; ///

// Node
private alias c_g_node_child_indexFn = extern(C) int function(GNode* node, void* data) nothrow;
__gshared c_g_node_child_indexFn c_g_node_child_index; ///
private alias c_g_node_child_positionFn = extern(C) int function(GNode* node, GNode* child) nothrow;
__gshared c_g_node_child_positionFn c_g_node_child_position; ///
private alias c_g_node_children_foreachFn = extern(C) void function(GNode* node, GTraverseFlags flags, GNodeForeachFunc func, void* data) nothrow;
__gshared c_g_node_children_foreachFn c_g_node_children_foreach; ///
private alias c_g_node_copyFn = extern(C) GNode* function(GNode* node) nothrow;
__gshared c_g_node_copyFn c_g_node_copy; ///
private alias c_g_node_copy_deepFn = extern(C) GNode* function(GNode* node, GCopyFunc copyFunc, void* data) nothrow;
__gshared c_g_node_copy_deepFn c_g_node_copy_deep; ///
private alias c_g_node_depthFn = extern(C) uint function(GNode* node) nothrow;
__gshared c_g_node_depthFn c_g_node_depth; ///
private alias c_g_node_destroyFn = extern(C) void function(GNode* root) nothrow;
__gshared c_g_node_destroyFn c_g_node_destroy; ///
private alias c_g_node_findFn = extern(C) GNode* function(GNode* root, GTraverseType order, GTraverseFlags flags, void* data) nothrow;
__gshared c_g_node_findFn c_g_node_find; ///
private alias c_g_node_find_childFn = extern(C) GNode* function(GNode* node, GTraverseFlags flags, void* data) nothrow;
__gshared c_g_node_find_childFn c_g_node_find_child; ///
private alias c_g_node_first_siblingFn = extern(C) GNode* function(GNode* node) nothrow;
__gshared c_g_node_first_siblingFn c_g_node_first_sibling; ///
private alias c_g_node_get_rootFn = extern(C) GNode* function(GNode* node) nothrow;
__gshared c_g_node_get_rootFn c_g_node_get_root; ///
private alias c_g_node_insertFn = extern(C) GNode* function(GNode* parent, int position, GNode* node) nothrow;
__gshared c_g_node_insertFn c_g_node_insert; ///
private alias c_g_node_insert_afterFn = extern(C) GNode* function(GNode* parent, GNode* sibling, GNode* node) nothrow;
__gshared c_g_node_insert_afterFn c_g_node_insert_after; ///
private alias c_g_node_insert_beforeFn = extern(C) GNode* function(GNode* parent, GNode* sibling, GNode* node) nothrow;
__gshared c_g_node_insert_beforeFn c_g_node_insert_before; ///
private alias c_g_node_is_ancestorFn = extern(C) gboolean function(GNode* node, GNode* descendant) nothrow;
__gshared c_g_node_is_ancestorFn c_g_node_is_ancestor; ///
private alias c_g_node_last_childFn = extern(C) GNode* function(GNode* node) nothrow;
__gshared c_g_node_last_childFn c_g_node_last_child; ///
private alias c_g_node_last_siblingFn = extern(C) GNode* function(GNode* node) nothrow;
__gshared c_g_node_last_siblingFn c_g_node_last_sibling; ///
private alias c_g_node_max_heightFn = extern(C) uint function(GNode* root) nothrow;
__gshared c_g_node_max_heightFn c_g_node_max_height; ///
private alias c_g_node_n_childrenFn = extern(C) uint function(GNode* node) nothrow;
__gshared c_g_node_n_childrenFn c_g_node_n_children; ///
private alias c_g_node_n_nodesFn = extern(C) uint function(GNode* root, GTraverseFlags flags) nothrow;
__gshared c_g_node_n_nodesFn c_g_node_n_nodes; ///
private alias c_g_node_nth_childFn = extern(C) GNode* function(GNode* node, uint n) nothrow;
__gshared c_g_node_nth_childFn c_g_node_nth_child; ///
private alias c_g_node_prependFn = extern(C) GNode* function(GNode* parent, GNode* node) nothrow;
__gshared c_g_node_prependFn c_g_node_prepend; ///
private alias c_g_node_reverse_childrenFn = extern(C) void function(GNode* node) nothrow;
__gshared c_g_node_reverse_childrenFn c_g_node_reverse_children; ///
private alias c_g_node_traverseFn = extern(C) void function(GNode* root, GTraverseType order, GTraverseFlags flags, int maxDepth, GNodeTraverseFunc func, void* data) nothrow;
__gshared c_g_node_traverseFn c_g_node_traverse; ///
private alias c_g_node_unlinkFn = extern(C) void function(GNode* node) nothrow;
__gshared c_g_node_unlinkFn c_g_node_unlink; ///
private alias c_g_node_newFn = extern(C) GNode* function(void* data) nothrow;
__gshared c_g_node_newFn c_g_node_new; ///
private alias c_g_node_pop_allocatorFn = extern(C) void function() nothrow;
__gshared c_g_node_pop_allocatorFn c_g_node_pop_allocator; ///
private alias c_g_node_push_allocatorFn = extern(C) void function(GAllocator* allocator) nothrow;
__gshared c_g_node_push_allocatorFn c_g_node_push_allocator; ///

// Once
private alias c_g_once_implFn = extern(C) void* function(GOnce* once, GThreadFunc func, void* arg) nothrow;
__gshared c_g_once_implFn c_g_once_impl; ///
private alias c_g_once_init_enterFn = extern(C) gboolean function(void* location) nothrow;
__gshared c_g_once_init_enterFn c_g_once_init_enter; ///
private alias c_g_once_init_enter_implFn = extern(C) gboolean function(size_t* location) nothrow;
__gshared c_g_once_init_enter_implFn c_g_once_init_enter_impl; ///
private alias c_g_once_init_enter_pointerFn = extern(C) gboolean function(void* location) nothrow;
__gshared c_g_once_init_enter_pointerFn c_g_once_init_enter_pointer; ///
private alias c_g_once_init_leaveFn = extern(C) void function(void* location, size_t result) nothrow;
__gshared c_g_once_init_leaveFn c_g_once_init_leave; ///
private alias c_g_once_init_leave_pointerFn = extern(C) void function(void* location, void* result) nothrow;
__gshared c_g_once_init_leave_pointerFn c_g_once_init_leave_pointer; ///

// OptionContext
private alias c_g_option_context_add_groupFn = extern(C) void function(GOptionContext* context, GOptionGroup* group) nothrow;
__gshared c_g_option_context_add_groupFn c_g_option_context_add_group; ///
private alias c_g_option_context_add_main_entriesFn = extern(C) void function(GOptionContext* context, const(GOptionEntry)* entries, const(char)* translationDomain) nothrow;
__gshared c_g_option_context_add_main_entriesFn c_g_option_context_add_main_entries; ///
private alias c_g_option_context_freeFn = extern(C) void function(GOptionContext* context) nothrow;
__gshared c_g_option_context_freeFn c_g_option_context_free; ///
private alias c_g_option_context_get_descriptionFn = extern(C) const(char)* function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_descriptionFn c_g_option_context_get_description; ///
private alias c_g_option_context_get_helpFn = extern(C) char* function(GOptionContext* context, gboolean mainHelp, GOptionGroup* group) nothrow;
__gshared c_g_option_context_get_helpFn c_g_option_context_get_help; ///
private alias c_g_option_context_get_help_enabledFn = extern(C) gboolean function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_help_enabledFn c_g_option_context_get_help_enabled; ///
private alias c_g_option_context_get_ignore_unknown_optionsFn = extern(C) gboolean function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_ignore_unknown_optionsFn c_g_option_context_get_ignore_unknown_options; ///
private alias c_g_option_context_get_main_groupFn = extern(C) GOptionGroup* function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_main_groupFn c_g_option_context_get_main_group; ///
private alias c_g_option_context_get_strict_posixFn = extern(C) gboolean function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_strict_posixFn c_g_option_context_get_strict_posix; ///
private alias c_g_option_context_get_summaryFn = extern(C) const(char)* function(GOptionContext* context) nothrow;
__gshared c_g_option_context_get_summaryFn c_g_option_context_get_summary; ///
private alias c_g_option_context_parseFn = extern(C) gboolean function(GOptionContext* context, int* argc, char*** argv, GError** _err) nothrow;
__gshared c_g_option_context_parseFn c_g_option_context_parse; ///
private alias c_g_option_context_parse_strvFn = extern(C) gboolean function(GOptionContext* context, char*** arguments, GError** _err) nothrow;
__gshared c_g_option_context_parse_strvFn c_g_option_context_parse_strv; ///
private alias c_g_option_context_set_descriptionFn = extern(C) void function(GOptionContext* context, const(char)* description) nothrow;
__gshared c_g_option_context_set_descriptionFn c_g_option_context_set_description; ///
private alias c_g_option_context_set_help_enabledFn = extern(C) void function(GOptionContext* context, gboolean helpEnabled) nothrow;
__gshared c_g_option_context_set_help_enabledFn c_g_option_context_set_help_enabled; ///
private alias c_g_option_context_set_ignore_unknown_optionsFn = extern(C) void function(GOptionContext* context, gboolean ignoreUnknown) nothrow;
__gshared c_g_option_context_set_ignore_unknown_optionsFn c_g_option_context_set_ignore_unknown_options; ///
private alias c_g_option_context_set_main_groupFn = extern(C) void function(GOptionContext* context, GOptionGroup* group) nothrow;
__gshared c_g_option_context_set_main_groupFn c_g_option_context_set_main_group; ///
private alias c_g_option_context_set_strict_posixFn = extern(C) void function(GOptionContext* context, gboolean strictPosix) nothrow;
__gshared c_g_option_context_set_strict_posixFn c_g_option_context_set_strict_posix; ///
private alias c_g_option_context_set_summaryFn = extern(C) void function(GOptionContext* context, const(char)* summary) nothrow;
__gshared c_g_option_context_set_summaryFn c_g_option_context_set_summary; ///
private alias c_g_option_context_set_translate_funcFn = extern(C) void function(GOptionContext* context, GTranslateFunc func, void* data, GDestroyNotify destroyNotify) nothrow;
__gshared c_g_option_context_set_translate_funcFn c_g_option_context_set_translate_func; ///
private alias c_g_option_context_set_translation_domainFn = extern(C) void function(GOptionContext* context, const(char)* domain) nothrow;
__gshared c_g_option_context_set_translation_domainFn c_g_option_context_set_translation_domain; ///
private alias c_g_option_context_newFn = extern(C) GOptionContext* function(const(char)* parameterString) nothrow;
__gshared c_g_option_context_newFn c_g_option_context_new; ///

// OptionGroup
private alias c_g_option_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_option_group_get_typeFn c_g_option_group_get_type; ///
private alias c_g_option_group_newFn = extern(C) GOptionGroup* function(const(char)* name, const(char)* description, const(char)* helpDescription, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_g_option_group_newFn c_g_option_group_new; ///
private alias c_g_option_group_add_entriesFn = extern(C) void function(GOptionGroup* group, const(GOptionEntry)* entries) nothrow;
__gshared c_g_option_group_add_entriesFn c_g_option_group_add_entries; ///
private alias c_g_option_group_freeFn = extern(C) void function(GOptionGroup* group) nothrow;
__gshared c_g_option_group_freeFn c_g_option_group_free; ///
private alias c_g_option_group_refFn = extern(C) GOptionGroup* function(GOptionGroup* group) nothrow;
__gshared c_g_option_group_refFn c_g_option_group_ref; ///
private alias c_g_option_group_set_error_hookFn = extern(C) void function(GOptionGroup* group, GOptionErrorFunc errorFunc) nothrow;
__gshared c_g_option_group_set_error_hookFn c_g_option_group_set_error_hook; ///
private alias c_g_option_group_set_parse_hooksFn = extern(C) void function(GOptionGroup* group, GOptionParseFunc preParseFunc, GOptionParseFunc postParseFunc) nothrow;
__gshared c_g_option_group_set_parse_hooksFn c_g_option_group_set_parse_hooks; ///
private alias c_g_option_group_set_translate_funcFn = extern(C) void function(GOptionGroup* group, GTranslateFunc func, void* data, GDestroyNotify destroyNotify) nothrow;
__gshared c_g_option_group_set_translate_funcFn c_g_option_group_set_translate_func; ///
private alias c_g_option_group_set_translation_domainFn = extern(C) void function(GOptionGroup* group, const(char)* domain) nothrow;
__gshared c_g_option_group_set_translation_domainFn c_g_option_group_set_translation_domain; ///
private alias c_g_option_group_unrefFn = extern(C) void function(GOptionGroup* group) nothrow;
__gshared c_g_option_group_unrefFn c_g_option_group_unref; ///

// PathBuf
private alias c_g_path_buf_clearFn = extern(C) void function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_clearFn c_g_path_buf_clear; ///
private alias c_g_path_buf_clear_to_pathFn = extern(C) char* function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_clear_to_pathFn c_g_path_buf_clear_to_path; ///
private alias c_g_path_buf_copyFn = extern(C) GPathBuf* function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_copyFn c_g_path_buf_copy; ///
private alias c_g_path_buf_freeFn = extern(C) void function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_freeFn c_g_path_buf_free; ///
private alias c_g_path_buf_free_to_pathFn = extern(C) char* function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_free_to_pathFn c_g_path_buf_free_to_path; ///
private alias c_g_path_buf_initFn = extern(C) GPathBuf* function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_initFn c_g_path_buf_init; ///
private alias c_g_path_buf_init_from_pathFn = extern(C) GPathBuf* function(GPathBuf* buf, const(char)* path) nothrow;
__gshared c_g_path_buf_init_from_pathFn c_g_path_buf_init_from_path; ///
private alias c_g_path_buf_popFn = extern(C) gboolean function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_popFn c_g_path_buf_pop; ///
private alias c_g_path_buf_pushFn = extern(C) GPathBuf* function(GPathBuf* buf, const(char)* path) nothrow;
__gshared c_g_path_buf_pushFn c_g_path_buf_push; ///
private alias c_g_path_buf_set_extensionFn = extern(C) gboolean function(GPathBuf* buf, const(char)* extension) nothrow;
__gshared c_g_path_buf_set_extensionFn c_g_path_buf_set_extension; ///
private alias c_g_path_buf_set_filenameFn = extern(C) gboolean function(GPathBuf* buf, const(char)* fileName) nothrow;
__gshared c_g_path_buf_set_filenameFn c_g_path_buf_set_filename; ///
private alias c_g_path_buf_to_pathFn = extern(C) char* function(GPathBuf* buf) nothrow;
__gshared c_g_path_buf_to_pathFn c_g_path_buf_to_path; ///
private alias c_g_path_buf_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_path_buf_equalFn c_g_path_buf_equal; ///
private alias c_g_path_buf_newFn = extern(C) GPathBuf* function() nothrow;
__gshared c_g_path_buf_newFn c_g_path_buf_new; ///
private alias c_g_path_buf_new_from_pathFn = extern(C) GPathBuf* function(const(char)* path) nothrow;
__gshared c_g_path_buf_new_from_pathFn c_g_path_buf_new_from_path; ///

// PatternSpec
private alias c_g_pattern_spec_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_pattern_spec_get_typeFn c_g_pattern_spec_get_type; ///
private alias c_g_pattern_spec_newFn = extern(C) GPatternSpec* function(const(char)* pattern) nothrow;
__gshared c_g_pattern_spec_newFn c_g_pattern_spec_new; ///
private alias c_g_pattern_spec_copyFn = extern(C) GPatternSpec* function(GPatternSpec* pspec) nothrow;
__gshared c_g_pattern_spec_copyFn c_g_pattern_spec_copy; ///
private alias c_g_pattern_spec_equalFn = extern(C) gboolean function(GPatternSpec* pspec1, GPatternSpec* pspec2) nothrow;
__gshared c_g_pattern_spec_equalFn c_g_pattern_spec_equal; ///
private alias c_g_pattern_spec_freeFn = extern(C) void function(GPatternSpec* pspec) nothrow;
__gshared c_g_pattern_spec_freeFn c_g_pattern_spec_free; ///
private alias c_g_pattern_spec_matchFn = extern(C) gboolean function(GPatternSpec* pspec, size_t stringLength, const(char)* string_, const(char)* stringReversed) nothrow;
__gshared c_g_pattern_spec_matchFn c_g_pattern_spec_match; ///
private alias c_g_pattern_spec_match_stringFn = extern(C) gboolean function(GPatternSpec* pspec, const(char)* string_) nothrow;
__gshared c_g_pattern_spec_match_stringFn c_g_pattern_spec_match_string; ///

// PollFD
private alias c_g_pollfd_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_pollfd_get_typeFn c_g_pollfd_get_type; ///

// Private
private alias c_g_private_getFn = extern(C) void* function(GPrivate* key) nothrow;
__gshared c_g_private_getFn c_g_private_get; ///
private alias c_g_private_replaceFn = extern(C) void function(GPrivate* key, void* value) nothrow;
__gshared c_g_private_replaceFn c_g_private_replace; ///
private alias c_g_private_setFn = extern(C) void function(GPrivate* key, void* value) nothrow;
__gshared c_g_private_setFn c_g_private_set; ///
private alias c_g_private_newFn = extern(C) GPrivate* function(GDestroyNotify notify) nothrow;
__gshared c_g_private_newFn c_g_private_new; ///

// PtrArray
private alias c_g_ptr_array_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_ptr_array_get_typeFn c_g_ptr_array_get_type; ///
private alias c_g_ptr_array_addFn = extern(C) void function(GPtrArray* array, void* data) nothrow;
__gshared c_g_ptr_array_addFn c_g_ptr_array_add; ///
private alias c_g_ptr_array_copyFn = extern(C) GPtrArray* function(GPtrArray* array, GCopyFunc func, void* userData) nothrow;
__gshared c_g_ptr_array_copyFn c_g_ptr_array_copy; ///
private alias c_g_ptr_array_extendFn = extern(C) void function(GPtrArray* arrayToExtend, GPtrArray* array, GCopyFunc func, void* userData) nothrow;
__gshared c_g_ptr_array_extendFn c_g_ptr_array_extend; ///
private alias c_g_ptr_array_extend_and_stealFn = extern(C) void function(GPtrArray* arrayToExtend, GPtrArray* array) nothrow;
__gshared c_g_ptr_array_extend_and_stealFn c_g_ptr_array_extend_and_steal; ///
private alias c_g_ptr_array_findFn = extern(C) gboolean function(GPtrArray* haystack, const(void)* needle, uint* index) nothrow;
__gshared c_g_ptr_array_findFn c_g_ptr_array_find; ///
private alias c_g_ptr_array_find_with_equal_funcFn = extern(C) gboolean function(GPtrArray* haystack, const(void)* needle, GEqualFunc equalFunc, uint* index) nothrow;
__gshared c_g_ptr_array_find_with_equal_funcFn c_g_ptr_array_find_with_equal_func; ///
private alias c_g_ptr_array_foreachFn = extern(C) void function(GPtrArray* array, GFunc func, void* userData) nothrow;
__gshared c_g_ptr_array_foreachFn c_g_ptr_array_foreach; ///
private alias c_g_ptr_array_freeFn = extern(C) void** function(GPtrArray* array, gboolean freeSegment) nothrow;
__gshared c_g_ptr_array_freeFn c_g_ptr_array_free; ///
private alias c_g_ptr_array_insertFn = extern(C) void function(GPtrArray* array, int index, void* data) nothrow;
__gshared c_g_ptr_array_insertFn c_g_ptr_array_insert; ///
private alias c_g_ptr_array_is_null_terminatedFn = extern(C) gboolean function(GPtrArray* array) nothrow;
__gshared c_g_ptr_array_is_null_terminatedFn c_g_ptr_array_is_null_terminated; ///
private alias c_g_ptr_array_newFn = extern(C) GPtrArray* function() nothrow;
__gshared c_g_ptr_array_newFn c_g_ptr_array_new; ///
private alias c_g_ptr_array_new_from_arrayFn = extern(C) GPtrArray* function(void** data, size_t len, GCopyFunc copyFunc, void* copyFuncUserData, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_from_arrayFn c_g_ptr_array_new_from_array; ///
private alias c_g_ptr_array_new_from_null_terminated_arrayFn = extern(C) GPtrArray* function(void** data, GCopyFunc copyFunc, void* copyFuncUserData, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_from_null_terminated_arrayFn c_g_ptr_array_new_from_null_terminated_array; ///
private alias c_g_ptr_array_new_fullFn = extern(C) GPtrArray* function(uint reservedSize, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_fullFn c_g_ptr_array_new_full; ///
private alias c_g_ptr_array_new_null_terminatedFn = extern(C) GPtrArray* function(uint reservedSize, GDestroyNotify elementFreeFunc, gboolean nullTerminated) nothrow;
__gshared c_g_ptr_array_new_null_terminatedFn c_g_ptr_array_new_null_terminated; ///
private alias c_g_ptr_array_new_takeFn = extern(C) GPtrArray* function(void** data, size_t len, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_takeFn c_g_ptr_array_new_take; ///
private alias c_g_ptr_array_new_take_null_terminatedFn = extern(C) GPtrArray* function(void** data, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_take_null_terminatedFn c_g_ptr_array_new_take_null_terminated; ///
private alias c_g_ptr_array_new_with_free_funcFn = extern(C) GPtrArray* function(GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_new_with_free_funcFn c_g_ptr_array_new_with_free_func; ///
private alias c_g_ptr_array_refFn = extern(C) GPtrArray* function(GPtrArray* array) nothrow;
__gshared c_g_ptr_array_refFn c_g_ptr_array_ref; ///
private alias c_g_ptr_array_removeFn = extern(C) gboolean function(GPtrArray* array, void* data) nothrow;
__gshared c_g_ptr_array_removeFn c_g_ptr_array_remove; ///
private alias c_g_ptr_array_remove_fastFn = extern(C) gboolean function(GPtrArray* array, void* data) nothrow;
__gshared c_g_ptr_array_remove_fastFn c_g_ptr_array_remove_fast; ///
private alias c_g_ptr_array_remove_indexFn = extern(C) void* function(GPtrArray* array, uint index) nothrow;
__gshared c_g_ptr_array_remove_indexFn c_g_ptr_array_remove_index; ///
private alias c_g_ptr_array_remove_index_fastFn = extern(C) void* function(GPtrArray* array, uint index) nothrow;
__gshared c_g_ptr_array_remove_index_fastFn c_g_ptr_array_remove_index_fast; ///
private alias c_g_ptr_array_remove_rangeFn = extern(C) GPtrArray* function(GPtrArray* array, uint index, uint length) nothrow;
__gshared c_g_ptr_array_remove_rangeFn c_g_ptr_array_remove_range; ///
private alias c_g_ptr_array_set_free_funcFn = extern(C) void function(GPtrArray* array, GDestroyNotify elementFreeFunc) nothrow;
__gshared c_g_ptr_array_set_free_funcFn c_g_ptr_array_set_free_func; ///
private alias c_g_ptr_array_set_sizeFn = extern(C) void function(GPtrArray* array, int length) nothrow;
__gshared c_g_ptr_array_set_sizeFn c_g_ptr_array_set_size; ///
private alias c_g_ptr_array_sized_newFn = extern(C) GPtrArray* function(uint reservedSize) nothrow;
__gshared c_g_ptr_array_sized_newFn c_g_ptr_array_sized_new; ///
private alias c_g_ptr_array_sortFn = extern(C) void function(GPtrArray* array, GCompareFunc compareFunc) nothrow;
__gshared c_g_ptr_array_sortFn c_g_ptr_array_sort; ///
private alias c_g_ptr_array_sort_valuesFn = extern(C) void function(GPtrArray* array, GCompareFunc compareFunc) nothrow;
__gshared c_g_ptr_array_sort_valuesFn c_g_ptr_array_sort_values; ///
private alias c_g_ptr_array_sort_values_with_dataFn = extern(C) void function(GPtrArray* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_ptr_array_sort_values_with_dataFn c_g_ptr_array_sort_values_with_data; ///
private alias c_g_ptr_array_sort_with_dataFn = extern(C) void function(GPtrArray* array, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_ptr_array_sort_with_dataFn c_g_ptr_array_sort_with_data; ///
private alias c_g_ptr_array_stealFn = extern(C) void** function(GPtrArray* array, size_t* len) nothrow;
__gshared c_g_ptr_array_stealFn c_g_ptr_array_steal; ///
private alias c_g_ptr_array_steal_indexFn = extern(C) void* function(GPtrArray* array, uint index) nothrow;
__gshared c_g_ptr_array_steal_indexFn c_g_ptr_array_steal_index; ///
private alias c_g_ptr_array_steal_index_fastFn = extern(C) void* function(GPtrArray* array, uint index) nothrow;
__gshared c_g_ptr_array_steal_index_fastFn c_g_ptr_array_steal_index_fast; ///
private alias c_g_ptr_array_unrefFn = extern(C) void function(GPtrArray* array) nothrow;
__gshared c_g_ptr_array_unrefFn c_g_ptr_array_unref; ///

// Queue
private alias c_g_queue_clearFn = extern(C) void function(GQueue* queue) nothrow;
__gshared c_g_queue_clearFn c_g_queue_clear; ///
private alias c_g_queue_clear_fullFn = extern(C) void function(GQueue* queue, GDestroyNotify freeFunc) nothrow;
__gshared c_g_queue_clear_fullFn c_g_queue_clear_full; ///
private alias c_g_queue_copyFn = extern(C) GQueue* function(GQueue* queue) nothrow;
__gshared c_g_queue_copyFn c_g_queue_copy; ///
private alias c_g_queue_delete_linkFn = extern(C) void function(GQueue* queue, GList* link) nothrow;
__gshared c_g_queue_delete_linkFn c_g_queue_delete_link; ///
private alias c_g_queue_findFn = extern(C) GList* function(GQueue* queue, const(void)* data) nothrow;
__gshared c_g_queue_findFn c_g_queue_find; ///
private alias c_g_queue_find_customFn = extern(C) GList* function(GQueue* queue, const(void)* data, GCompareFunc func) nothrow;
__gshared c_g_queue_find_customFn c_g_queue_find_custom; ///
private alias c_g_queue_foreachFn = extern(C) void function(GQueue* queue, GFunc func, void* userData) nothrow;
__gshared c_g_queue_foreachFn c_g_queue_foreach; ///
private alias c_g_queue_freeFn = extern(C) void function(GQueue* queue) nothrow;
__gshared c_g_queue_freeFn c_g_queue_free; ///
private alias c_g_queue_free_fullFn = extern(C) void function(GQueue* queue, GDestroyNotify freeFunc) nothrow;
__gshared c_g_queue_free_fullFn c_g_queue_free_full; ///
private alias c_g_queue_get_lengthFn = extern(C) uint function(GQueue* queue) nothrow;
__gshared c_g_queue_get_lengthFn c_g_queue_get_length; ///
private alias c_g_queue_indexFn = extern(C) int function(GQueue* queue, const(void)* data) nothrow;
__gshared c_g_queue_indexFn c_g_queue_index; ///
private alias c_g_queue_initFn = extern(C) void function(GQueue* queue) nothrow;
__gshared c_g_queue_initFn c_g_queue_init; ///
private alias c_g_queue_insert_afterFn = extern(C) void function(GQueue* queue, GList* sibling, void* data) nothrow;
__gshared c_g_queue_insert_afterFn c_g_queue_insert_after; ///
private alias c_g_queue_insert_after_linkFn = extern(C) void function(GQueue* queue, GList* sibling, GList* link) nothrow;
__gshared c_g_queue_insert_after_linkFn c_g_queue_insert_after_link; ///
private alias c_g_queue_insert_beforeFn = extern(C) void function(GQueue* queue, GList* sibling, void* data) nothrow;
__gshared c_g_queue_insert_beforeFn c_g_queue_insert_before; ///
private alias c_g_queue_insert_before_linkFn = extern(C) void function(GQueue* queue, GList* sibling, GList* link) nothrow;
__gshared c_g_queue_insert_before_linkFn c_g_queue_insert_before_link; ///
private alias c_g_queue_insert_sortedFn = extern(C) void function(GQueue* queue, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_queue_insert_sortedFn c_g_queue_insert_sorted; ///
private alias c_g_queue_is_emptyFn = extern(C) gboolean function(GQueue* queue) nothrow;
__gshared c_g_queue_is_emptyFn c_g_queue_is_empty; ///
private alias c_g_queue_link_indexFn = extern(C) int function(GQueue* queue, GList* link) nothrow;
__gshared c_g_queue_link_indexFn c_g_queue_link_index; ///
private alias c_g_queue_peek_headFn = extern(C) void* function(GQueue* queue) nothrow;
__gshared c_g_queue_peek_headFn c_g_queue_peek_head; ///
private alias c_g_queue_peek_head_linkFn = extern(C) GList* function(GQueue* queue) nothrow;
__gshared c_g_queue_peek_head_linkFn c_g_queue_peek_head_link; ///
private alias c_g_queue_peek_nthFn = extern(C) void* function(GQueue* queue, uint n) nothrow;
__gshared c_g_queue_peek_nthFn c_g_queue_peek_nth; ///
private alias c_g_queue_peek_nth_linkFn = extern(C) GList* function(GQueue* queue, uint n) nothrow;
__gshared c_g_queue_peek_nth_linkFn c_g_queue_peek_nth_link; ///
private alias c_g_queue_peek_tailFn = extern(C) void* function(GQueue* queue) nothrow;
__gshared c_g_queue_peek_tailFn c_g_queue_peek_tail; ///
private alias c_g_queue_peek_tail_linkFn = extern(C) GList* function(GQueue* queue) nothrow;
__gshared c_g_queue_peek_tail_linkFn c_g_queue_peek_tail_link; ///
private alias c_g_queue_pop_headFn = extern(C) void* function(GQueue* queue) nothrow;
__gshared c_g_queue_pop_headFn c_g_queue_pop_head; ///
private alias c_g_queue_pop_head_linkFn = extern(C) GList* function(GQueue* queue) nothrow;
__gshared c_g_queue_pop_head_linkFn c_g_queue_pop_head_link; ///
private alias c_g_queue_pop_nthFn = extern(C) void* function(GQueue* queue, uint n) nothrow;
__gshared c_g_queue_pop_nthFn c_g_queue_pop_nth; ///
private alias c_g_queue_pop_nth_linkFn = extern(C) GList* function(GQueue* queue, uint n) nothrow;
__gshared c_g_queue_pop_nth_linkFn c_g_queue_pop_nth_link; ///
private alias c_g_queue_pop_tailFn = extern(C) void* function(GQueue* queue) nothrow;
__gshared c_g_queue_pop_tailFn c_g_queue_pop_tail; ///
private alias c_g_queue_pop_tail_linkFn = extern(C) GList* function(GQueue* queue) nothrow;
__gshared c_g_queue_pop_tail_linkFn c_g_queue_pop_tail_link; ///
private alias c_g_queue_push_headFn = extern(C) void function(GQueue* queue, void* data) nothrow;
__gshared c_g_queue_push_headFn c_g_queue_push_head; ///
private alias c_g_queue_push_head_linkFn = extern(C) void function(GQueue* queue, GList* link) nothrow;
__gshared c_g_queue_push_head_linkFn c_g_queue_push_head_link; ///
private alias c_g_queue_push_nthFn = extern(C) void function(GQueue* queue, void* data, int n) nothrow;
__gshared c_g_queue_push_nthFn c_g_queue_push_nth; ///
private alias c_g_queue_push_nth_linkFn = extern(C) void function(GQueue* queue, int n, GList* link) nothrow;
__gshared c_g_queue_push_nth_linkFn c_g_queue_push_nth_link; ///
private alias c_g_queue_push_tailFn = extern(C) void function(GQueue* queue, void* data) nothrow;
__gshared c_g_queue_push_tailFn c_g_queue_push_tail; ///
private alias c_g_queue_push_tail_linkFn = extern(C) void function(GQueue* queue, GList* link) nothrow;
__gshared c_g_queue_push_tail_linkFn c_g_queue_push_tail_link; ///
private alias c_g_queue_removeFn = extern(C) gboolean function(GQueue* queue, const(void)* data) nothrow;
__gshared c_g_queue_removeFn c_g_queue_remove; ///
private alias c_g_queue_remove_allFn = extern(C) uint function(GQueue* queue, const(void)* data) nothrow;
__gshared c_g_queue_remove_allFn c_g_queue_remove_all; ///
private alias c_g_queue_reverseFn = extern(C) void function(GQueue* queue) nothrow;
__gshared c_g_queue_reverseFn c_g_queue_reverse; ///
private alias c_g_queue_sortFn = extern(C) void function(GQueue* queue, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_queue_sortFn c_g_queue_sort; ///
private alias c_g_queue_unlinkFn = extern(C) void function(GQueue* queue, GList* link) nothrow;
__gshared c_g_queue_unlinkFn c_g_queue_unlink; ///
private alias c_g_queue_newFn = extern(C) GQueue* function() nothrow;
__gshared c_g_queue_newFn c_g_queue_new; ///

// RWLock
private alias c_g_rw_lock_clearFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_clearFn c_g_rw_lock_clear; ///
private alias c_g_rw_lock_initFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_initFn c_g_rw_lock_init; ///
private alias c_g_rw_lock_reader_lockFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_reader_lockFn c_g_rw_lock_reader_lock; ///
private alias c_g_rw_lock_reader_trylockFn = extern(C) gboolean function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_reader_trylockFn c_g_rw_lock_reader_trylock; ///
private alias c_g_rw_lock_reader_unlockFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_reader_unlockFn c_g_rw_lock_reader_unlock; ///
private alias c_g_rw_lock_writer_lockFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_writer_lockFn c_g_rw_lock_writer_lock; ///
private alias c_g_rw_lock_writer_trylockFn = extern(C) gboolean function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_writer_trylockFn c_g_rw_lock_writer_trylock; ///
private alias c_g_rw_lock_writer_unlockFn = extern(C) void function(GRWLock* rwLock) nothrow;
__gshared c_g_rw_lock_writer_unlockFn c_g_rw_lock_writer_unlock; ///

// Rand
private alias c_g_rand_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_rand_get_typeFn c_g_rand_get_type; ///
private alias c_g_rand_newFn = extern(C) GRand* function() nothrow;
__gshared c_g_rand_newFn c_g_rand_new; ///
private alias c_g_rand_new_with_seedFn = extern(C) GRand* function(uint seed) nothrow;
__gshared c_g_rand_new_with_seedFn c_g_rand_new_with_seed; ///
private alias c_g_rand_new_with_seed_arrayFn = extern(C) GRand* function(const(uint)* seed, uint seedLength) nothrow;
__gshared c_g_rand_new_with_seed_arrayFn c_g_rand_new_with_seed_array; ///
private alias c_g_rand_copyFn = extern(C) GRand* function(GRand* rand) nothrow;
__gshared c_g_rand_copyFn c_g_rand_copy; ///
private alias c_g_rand_doubleFn = extern(C) double function(GRand* rand) nothrow;
__gshared c_g_rand_doubleFn c_g_rand_double; ///
private alias c_g_rand_double_rangeFn = extern(C) double function(GRand* rand, double begin, double end) nothrow;
__gshared c_g_rand_double_rangeFn c_g_rand_double_range; ///
private alias c_g_rand_freeFn = extern(C) void function(GRand* rand) nothrow;
__gshared c_g_rand_freeFn c_g_rand_free; ///
private alias c_g_rand_intFn = extern(C) uint function(GRand* rand) nothrow;
__gshared c_g_rand_intFn c_g_rand_int; ///
private alias c_g_rand_int_rangeFn = extern(C) int function(GRand* rand, int begin, int end) nothrow;
__gshared c_g_rand_int_rangeFn c_g_rand_int_range; ///
private alias c_g_rand_set_seedFn = extern(C) void function(GRand* rand, uint seed) nothrow;
__gshared c_g_rand_set_seedFn c_g_rand_set_seed; ///
private alias c_g_rand_set_seed_arrayFn = extern(C) void function(GRand* rand, const(uint)* seed, uint seedLength) nothrow;
__gshared c_g_rand_set_seed_arrayFn c_g_rand_set_seed_array; ///

// RecMutex
private alias c_g_rec_mutex_clearFn = extern(C) void function(GRecMutex* recMutex) nothrow;
__gshared c_g_rec_mutex_clearFn c_g_rec_mutex_clear; ///
private alias c_g_rec_mutex_initFn = extern(C) void function(GRecMutex* recMutex) nothrow;
__gshared c_g_rec_mutex_initFn c_g_rec_mutex_init; ///
private alias c_g_rec_mutex_lockFn = extern(C) void function(GRecMutex* recMutex) nothrow;
__gshared c_g_rec_mutex_lockFn c_g_rec_mutex_lock; ///
private alias c_g_rec_mutex_trylockFn = extern(C) gboolean function(GRecMutex* recMutex) nothrow;
__gshared c_g_rec_mutex_trylockFn c_g_rec_mutex_trylock; ///
private alias c_g_rec_mutex_unlockFn = extern(C) void function(GRecMutex* recMutex) nothrow;
__gshared c_g_rec_mutex_unlockFn c_g_rec_mutex_unlock; ///

// Regex
private alias c_g_regex_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_regex_get_typeFn c_g_regex_get_type; ///
private alias c_g_regex_newFn = extern(C) GRegex* function(const(char)* pattern, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions, GError** _err) nothrow;
__gshared c_g_regex_newFn c_g_regex_new; ///
private alias c_g_regex_get_capture_countFn = extern(C) int function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_capture_countFn c_g_regex_get_capture_count; ///
private alias c_g_regex_get_compile_flagsFn = extern(C) GRegexCompileFlags function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_compile_flagsFn c_g_regex_get_compile_flags; ///
private alias c_g_regex_get_has_cr_or_lfFn = extern(C) gboolean function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_has_cr_or_lfFn c_g_regex_get_has_cr_or_lf; ///
private alias c_g_regex_get_match_flagsFn = extern(C) GRegexMatchFlags function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_match_flagsFn c_g_regex_get_match_flags; ///
private alias c_g_regex_get_max_backrefFn = extern(C) int function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_max_backrefFn c_g_regex_get_max_backref; ///
private alias c_g_regex_get_max_lookbehindFn = extern(C) int function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_max_lookbehindFn c_g_regex_get_max_lookbehind; ///
private alias c_g_regex_get_patternFn = extern(C) const(char)* function(const(GRegex)* regex) nothrow;
__gshared c_g_regex_get_patternFn c_g_regex_get_pattern; ///
private alias c_g_regex_get_string_numberFn = extern(C) int function(const(GRegex)* regex, const(char)* name) nothrow;
__gshared c_g_regex_get_string_numberFn c_g_regex_get_string_number; ///
private alias c_g_regex_matchFn = extern(C) gboolean function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo) nothrow;
__gshared c_g_regex_matchFn c_g_regex_match; ///
private alias c_g_regex_match_allFn = extern(C) gboolean function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo) nothrow;
__gshared c_g_regex_match_allFn c_g_regex_match_all; ///
private alias c_g_regex_match_all_fullFn = extern(C) gboolean function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo, GError** _err) nothrow;
__gshared c_g_regex_match_all_fullFn c_g_regex_match_all_full; ///
private alias c_g_regex_match_fullFn = extern(C) gboolean function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo, GError** _err) nothrow;
__gshared c_g_regex_match_fullFn c_g_regex_match_full; ///
private alias c_g_regex_refFn = extern(C) GRegex* function(GRegex* regex) nothrow;
__gshared c_g_regex_refFn c_g_regex_ref; ///
private alias c_g_regex_replaceFn = extern(C) char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, const(char)* replacement, GRegexMatchFlags matchOptions, GError** _err) nothrow;
__gshared c_g_regex_replaceFn c_g_regex_replace; ///
private alias c_g_regex_replace_evalFn = extern(C) char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GRegexEvalCallback eval, void* userData, GError** _err) nothrow;
__gshared c_g_regex_replace_evalFn c_g_regex_replace_eval; ///
private alias c_g_regex_replace_literalFn = extern(C) char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, const(char)* replacement, GRegexMatchFlags matchOptions, GError** _err) nothrow;
__gshared c_g_regex_replace_literalFn c_g_regex_replace_literal; ///
private alias c_g_regex_splitFn = extern(C) char** function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions) nothrow;
__gshared c_g_regex_splitFn c_g_regex_split; ///
private alias c_g_regex_split_fullFn = extern(C) char** function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, int maxTokens, GError** _err) nothrow;
__gshared c_g_regex_split_fullFn c_g_regex_split_full; ///
private alias c_g_regex_unrefFn = extern(C) void function(GRegex* regex) nothrow;
__gshared c_g_regex_unrefFn c_g_regex_unref; ///
private alias c_g_regex_check_replacementFn = extern(C) gboolean function(const(char)* replacement, gboolean* hasReferences, GError** _err) nothrow;
__gshared c_g_regex_check_replacementFn c_g_regex_check_replacement; ///
private alias c_g_regex_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_regex_error_quarkFn c_g_regex_error_quark; ///
private alias c_g_regex_escape_nulFn = extern(C) char* function(const(char)* string_, int length) nothrow;
__gshared c_g_regex_escape_nulFn c_g_regex_escape_nul; ///
private alias c_g_regex_escape_stringFn = extern(C) char* function(const(char)* string_, int length) nothrow;
__gshared c_g_regex_escape_stringFn c_g_regex_escape_string; ///
private alias c_g_regex_match_simpleFn = extern(C) gboolean function(const(char)* pattern, const(char)* string_, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions) nothrow;
__gshared c_g_regex_match_simpleFn c_g_regex_match_simple; ///
private alias c_g_regex_split_simpleFn = extern(C) char** function(const(char)* pattern, const(char)* string_, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions) nothrow;
__gshared c_g_regex_split_simpleFn c_g_regex_split_simple; ///

// Relation
private alias c_g_relation_countFn = extern(C) int function(GRelation* relation, const(void)* key, int field) nothrow;
__gshared c_g_relation_countFn c_g_relation_count; ///
private alias c_g_relation_deleteFn = extern(C) int function(GRelation* relation, const(void)* key, int field) nothrow;
__gshared c_g_relation_deleteFn c_g_relation_delete; ///
private alias c_g_relation_destroyFn = extern(C) void function(GRelation* relation) nothrow;
__gshared c_g_relation_destroyFn c_g_relation_destroy; ///
private alias c_g_relation_existsFn = extern(C) gboolean function(GRelation* relation,  ...) nothrow;
__gshared c_g_relation_existsFn c_g_relation_exists; ///
private alias c_g_relation_indexFn = extern(C) void function(GRelation* relation, int field, GHashFunc hashFunc, GEqualFunc keyEqualFunc) nothrow;
__gshared c_g_relation_indexFn c_g_relation_index; ///
private alias c_g_relation_insertFn = extern(C) void function(GRelation* relation,  ...) nothrow;
__gshared c_g_relation_insertFn c_g_relation_insert; ///
private alias c_g_relation_printFn = extern(C) void function(GRelation* relation) nothrow;
__gshared c_g_relation_printFn c_g_relation_print; ///
private alias c_g_relation_selectFn = extern(C) GTuples* function(GRelation* relation, const(void)* key, int field) nothrow;
__gshared c_g_relation_selectFn c_g_relation_select; ///
private alias c_g_relation_newFn = extern(C) GRelation* function(int fields) nothrow;
__gshared c_g_relation_newFn c_g_relation_new; ///

// SList
private alias c_g_slist_allocFn = extern(C) GSList* function() nothrow;
__gshared c_g_slist_allocFn c_g_slist_alloc; ///
private alias c_g_slist_appendFn = extern(C) GSList* function(GSList* list, void* data) nothrow;
__gshared c_g_slist_appendFn c_g_slist_append; ///
private alias c_g_slist_concatFn = extern(C) GSList* function(GSList* list1, GSList* list2) nothrow;
__gshared c_g_slist_concatFn c_g_slist_concat; ///
private alias c_g_slist_copyFn = extern(C) GSList* function(GSList* list) nothrow;
__gshared c_g_slist_copyFn c_g_slist_copy; ///
private alias c_g_slist_copy_deepFn = extern(C) GSList* function(GSList* list, GCopyFunc func, void* userData) nothrow;
__gshared c_g_slist_copy_deepFn c_g_slist_copy_deep; ///
private alias c_g_slist_delete_linkFn = extern(C) GSList* function(GSList* list, GSList* link) nothrow;
__gshared c_g_slist_delete_linkFn c_g_slist_delete_link; ///
private alias c_g_slist_findFn = extern(C) GSList* function(GSList* list, const(void)* data) nothrow;
__gshared c_g_slist_findFn c_g_slist_find; ///
private alias c_g_slist_find_customFn = extern(C) GSList* function(GSList* list, const(void)* data, GCompareFunc func) nothrow;
__gshared c_g_slist_find_customFn c_g_slist_find_custom; ///
private alias c_g_slist_foreachFn = extern(C) void function(GSList* list, GFunc func, void* userData) nothrow;
__gshared c_g_slist_foreachFn c_g_slist_foreach; ///
private alias c_g_slist_freeFn = extern(C) void function(GSList* list) nothrow;
__gshared c_g_slist_freeFn c_g_slist_free; ///
private alias c_g_slist_free_1Fn = extern(C) void function(GSList* list) nothrow;
__gshared c_g_slist_free_1Fn c_g_slist_free_1; ///
private alias c_g_slist_free_fullFn = extern(C) void function(GSList* list, GDestroyNotify freeFunc) nothrow;
__gshared c_g_slist_free_fullFn c_g_slist_free_full; ///
private alias c_g_slist_indexFn = extern(C) int function(GSList* list, const(void)* data) nothrow;
__gshared c_g_slist_indexFn c_g_slist_index; ///
private alias c_g_slist_insertFn = extern(C) GSList* function(GSList* list, void* data, int position) nothrow;
__gshared c_g_slist_insertFn c_g_slist_insert; ///
private alias c_g_slist_insert_beforeFn = extern(C) GSList* function(GSList* slist, GSList* sibling, void* data) nothrow;
__gshared c_g_slist_insert_beforeFn c_g_slist_insert_before; ///
private alias c_g_slist_insert_sortedFn = extern(C) GSList* function(GSList* list, void* data, GCompareFunc func) nothrow;
__gshared c_g_slist_insert_sortedFn c_g_slist_insert_sorted; ///
private alias c_g_slist_insert_sorted_with_dataFn = extern(C) GSList* function(GSList* list, void* data, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_slist_insert_sorted_with_dataFn c_g_slist_insert_sorted_with_data; ///
private alias c_g_slist_lastFn = extern(C) GSList* function(GSList* list) nothrow;
__gshared c_g_slist_lastFn c_g_slist_last; ///
private alias c_g_slist_lengthFn = extern(C) uint function(GSList* list) nothrow;
__gshared c_g_slist_lengthFn c_g_slist_length; ///
private alias c_g_slist_nthFn = extern(C) GSList* function(GSList* list, uint n) nothrow;
__gshared c_g_slist_nthFn c_g_slist_nth; ///
private alias c_g_slist_nth_dataFn = extern(C) void* function(GSList* list, uint n) nothrow;
__gshared c_g_slist_nth_dataFn c_g_slist_nth_data; ///
private alias c_g_slist_pop_allocatorFn = extern(C) void function() nothrow;
__gshared c_g_slist_pop_allocatorFn c_g_slist_pop_allocator; ///
private alias c_g_slist_positionFn = extern(C) int function(GSList* list, GSList* llink) nothrow;
__gshared c_g_slist_positionFn c_g_slist_position; ///
private alias c_g_slist_prependFn = extern(C) GSList* function(GSList* list, void* data) nothrow;
__gshared c_g_slist_prependFn c_g_slist_prepend; ///
private alias c_g_slist_push_allocatorFn = extern(C) void function(GAllocator* allocator) nothrow;
__gshared c_g_slist_push_allocatorFn c_g_slist_push_allocator; ///
private alias c_g_slist_removeFn = extern(C) GSList* function(GSList* list, const(void)* data) nothrow;
__gshared c_g_slist_removeFn c_g_slist_remove; ///
private alias c_g_slist_remove_allFn = extern(C) GSList* function(GSList* list, const(void)* data) nothrow;
__gshared c_g_slist_remove_allFn c_g_slist_remove_all; ///
private alias c_g_slist_remove_linkFn = extern(C) GSList* function(GSList* list, GSList* link) nothrow;
__gshared c_g_slist_remove_linkFn c_g_slist_remove_link; ///
private alias c_g_slist_reverseFn = extern(C) GSList* function(GSList* list) nothrow;
__gshared c_g_slist_reverseFn c_g_slist_reverse; ///
private alias c_g_slist_sortFn = extern(C) GSList* function(GSList* list, GCompareFunc compareFunc) nothrow;
__gshared c_g_slist_sortFn c_g_slist_sort; ///
private alias c_g_slist_sort_with_dataFn = extern(C) GSList* function(GSList* list, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_slist_sort_with_dataFn c_g_slist_sort_with_data; ///

// Scanner
private alias c_g_scanner_cur_lineFn = extern(C) uint function(GScanner* scanner) nothrow;
__gshared c_g_scanner_cur_lineFn c_g_scanner_cur_line; ///
private alias c_g_scanner_cur_positionFn = extern(C) uint function(GScanner* scanner) nothrow;
__gshared c_g_scanner_cur_positionFn c_g_scanner_cur_position; ///
private alias c_g_scanner_cur_tokenFn = extern(C) GTokenType function(GScanner* scanner) nothrow;
__gshared c_g_scanner_cur_tokenFn c_g_scanner_cur_token; ///
private alias c_g_scanner_cur_valueFn = extern(C) GTokenValue function(GScanner* scanner) nothrow;
__gshared c_g_scanner_cur_valueFn c_g_scanner_cur_value; ///
private alias c_g_scanner_destroyFn = extern(C) void function(GScanner* scanner) nothrow;
__gshared c_g_scanner_destroyFn c_g_scanner_destroy; ///
private alias c_g_scanner_eofFn = extern(C) gboolean function(GScanner* scanner) nothrow;
__gshared c_g_scanner_eofFn c_g_scanner_eof; ///
private alias c_g_scanner_errorFn = extern(C) void function(GScanner* scanner, const(char)* format,  ...) nothrow;
__gshared c_g_scanner_errorFn c_g_scanner_error; ///
private alias c_g_scanner_get_next_tokenFn = extern(C) GTokenType function(GScanner* scanner) nothrow;
__gshared c_g_scanner_get_next_tokenFn c_g_scanner_get_next_token; ///
private alias c_g_scanner_input_fileFn = extern(C) void function(GScanner* scanner, int inputFd) nothrow;
__gshared c_g_scanner_input_fileFn c_g_scanner_input_file; ///
private alias c_g_scanner_input_textFn = extern(C) void function(GScanner* scanner, const(char)* text, uint textLen) nothrow;
__gshared c_g_scanner_input_textFn c_g_scanner_input_text; ///
private alias c_g_scanner_lookup_symbolFn = extern(C) void* function(GScanner* scanner, const(char)* symbol) nothrow;
__gshared c_g_scanner_lookup_symbolFn c_g_scanner_lookup_symbol; ///
private alias c_g_scanner_peek_next_tokenFn = extern(C) GTokenType function(GScanner* scanner) nothrow;
__gshared c_g_scanner_peek_next_tokenFn c_g_scanner_peek_next_token; ///
private alias c_g_scanner_scope_add_symbolFn = extern(C) void function(GScanner* scanner, uint scopeId, const(char)* symbol, void* value) nothrow;
__gshared c_g_scanner_scope_add_symbolFn c_g_scanner_scope_add_symbol; ///
private alias c_g_scanner_scope_foreach_symbolFn = extern(C) void function(GScanner* scanner, uint scopeId, GHFunc func, void* userData) nothrow;
__gshared c_g_scanner_scope_foreach_symbolFn c_g_scanner_scope_foreach_symbol; ///
private alias c_g_scanner_scope_lookup_symbolFn = extern(C) void* function(GScanner* scanner, uint scopeId, const(char)* symbol) nothrow;
__gshared c_g_scanner_scope_lookup_symbolFn c_g_scanner_scope_lookup_symbol; ///
private alias c_g_scanner_scope_remove_symbolFn = extern(C) void function(GScanner* scanner, uint scopeId, const(char)* symbol) nothrow;
__gshared c_g_scanner_scope_remove_symbolFn c_g_scanner_scope_remove_symbol; ///
private alias c_g_scanner_set_scopeFn = extern(C) uint function(GScanner* scanner, uint scopeId) nothrow;
__gshared c_g_scanner_set_scopeFn c_g_scanner_set_scope; ///
private alias c_g_scanner_sync_file_offsetFn = extern(C) void function(GScanner* scanner) nothrow;
__gshared c_g_scanner_sync_file_offsetFn c_g_scanner_sync_file_offset; ///
private alias c_g_scanner_unexp_tokenFn = extern(C) void function(GScanner* scanner, GTokenType expectedToken, const(char)* identifierSpec, const(char)* symbolSpec, const(char)* symbolName, const(char)* message, int isError) nothrow;
__gshared c_g_scanner_unexp_tokenFn c_g_scanner_unexp_token; ///
private alias c_g_scanner_warnFn = extern(C) void function(GScanner* scanner, const(char)* format,  ...) nothrow;
__gshared c_g_scanner_warnFn c_g_scanner_warn; ///
private alias c_g_scanner_newFn = extern(C) GScanner* function(const(GScannerConfig)* configTempl) nothrow;
__gshared c_g_scanner_newFn c_g_scanner_new; ///

// Sequence
private alias c_g_sequence_appendFn = extern(C) GSequenceIter* function(GSequence* seq, void* data) nothrow;
__gshared c_g_sequence_appendFn c_g_sequence_append; ///
private alias c_g_sequence_foreachFn = extern(C) void function(GSequence* seq, GFunc func, void* userData) nothrow;
__gshared c_g_sequence_foreachFn c_g_sequence_foreach; ///
private alias c_g_sequence_freeFn = extern(C) void function(GSequence* seq) nothrow;
__gshared c_g_sequence_freeFn c_g_sequence_free; ///
private alias c_g_sequence_get_begin_iterFn = extern(C) GSequenceIter* function(GSequence* seq) nothrow;
__gshared c_g_sequence_get_begin_iterFn c_g_sequence_get_begin_iter; ///
private alias c_g_sequence_get_end_iterFn = extern(C) GSequenceIter* function(GSequence* seq) nothrow;
__gshared c_g_sequence_get_end_iterFn c_g_sequence_get_end_iter; ///
private alias c_g_sequence_get_iter_at_posFn = extern(C) GSequenceIter* function(GSequence* seq, int pos) nothrow;
__gshared c_g_sequence_get_iter_at_posFn c_g_sequence_get_iter_at_pos; ///
private alias c_g_sequence_get_lengthFn = extern(C) int function(GSequence* seq) nothrow;
__gshared c_g_sequence_get_lengthFn c_g_sequence_get_length; ///
private alias c_g_sequence_insert_sortedFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_insert_sortedFn c_g_sequence_insert_sorted; ///
private alias c_g_sequence_insert_sorted_iterFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) nothrow;
__gshared c_g_sequence_insert_sorted_iterFn c_g_sequence_insert_sorted_iter; ///
private alias c_g_sequence_is_emptyFn = extern(C) gboolean function(GSequence* seq) nothrow;
__gshared c_g_sequence_is_emptyFn c_g_sequence_is_empty; ///
private alias c_g_sequence_lookupFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_lookupFn c_g_sequence_lookup; ///
private alias c_g_sequence_lookup_iterFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) nothrow;
__gshared c_g_sequence_lookup_iterFn c_g_sequence_lookup_iter; ///
private alias c_g_sequence_prependFn = extern(C) GSequenceIter* function(GSequence* seq, void* data) nothrow;
__gshared c_g_sequence_prependFn c_g_sequence_prepend; ///
private alias c_g_sequence_searchFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_searchFn c_g_sequence_search; ///
private alias c_g_sequence_search_iterFn = extern(C) GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) nothrow;
__gshared c_g_sequence_search_iterFn c_g_sequence_search_iter; ///
private alias c_g_sequence_sortFn = extern(C) void function(GSequence* seq, GCompareDataFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_sortFn c_g_sequence_sort; ///
private alias c_g_sequence_sort_iterFn = extern(C) void function(GSequence* seq, GSequenceIterCompareFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_sort_iterFn c_g_sequence_sort_iter; ///
private alias c_g_sequence_foreach_rangeFn = extern(C) void function(GSequenceIter* begin, GSequenceIter* end, GFunc func, void* userData) nothrow;
__gshared c_g_sequence_foreach_rangeFn c_g_sequence_foreach_range; ///
private alias c_g_sequence_getFn = extern(C) void* function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_getFn c_g_sequence_get; ///
private alias c_g_sequence_insert_beforeFn = extern(C) GSequenceIter* function(GSequenceIter* iter, void* data) nothrow;
__gshared c_g_sequence_insert_beforeFn c_g_sequence_insert_before; ///
private alias c_g_sequence_moveFn = extern(C) void function(GSequenceIter* src, GSequenceIter* dest) nothrow;
__gshared c_g_sequence_moveFn c_g_sequence_move; ///
private alias c_g_sequence_move_rangeFn = extern(C) void function(GSequenceIter* dest, GSequenceIter* begin, GSequenceIter* end) nothrow;
__gshared c_g_sequence_move_rangeFn c_g_sequence_move_range; ///
private alias c_g_sequence_newFn = extern(C) GSequence* function(GDestroyNotify dataDestroy) nothrow;
__gshared c_g_sequence_newFn c_g_sequence_new; ///
private alias c_g_sequence_range_get_midpointFn = extern(C) GSequenceIter* function(GSequenceIter* begin, GSequenceIter* end) nothrow;
__gshared c_g_sequence_range_get_midpointFn c_g_sequence_range_get_midpoint; ///
private alias c_g_sequence_removeFn = extern(C) void function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_removeFn c_g_sequence_remove; ///
private alias c_g_sequence_remove_rangeFn = extern(C) void function(GSequenceIter* begin, GSequenceIter* end) nothrow;
__gshared c_g_sequence_remove_rangeFn c_g_sequence_remove_range; ///
private alias c_g_sequence_setFn = extern(C) void function(GSequenceIter* iter, void* data) nothrow;
__gshared c_g_sequence_setFn c_g_sequence_set; ///
private alias c_g_sequence_sort_changedFn = extern(C) void function(GSequenceIter* iter, GCompareDataFunc cmpFunc, void* cmpData) nothrow;
__gshared c_g_sequence_sort_changedFn c_g_sequence_sort_changed; ///
private alias c_g_sequence_sort_changed_iterFn = extern(C) void function(GSequenceIter* iter, GSequenceIterCompareFunc iterCmp, void* cmpData) nothrow;
__gshared c_g_sequence_sort_changed_iterFn c_g_sequence_sort_changed_iter; ///
private alias c_g_sequence_swapFn = extern(C) void function(GSequenceIter* a, GSequenceIter* b) nothrow;
__gshared c_g_sequence_swapFn c_g_sequence_swap; ///

// SequenceIter
private alias c_g_sequence_iter_compareFn = extern(C) int function(GSequenceIter* a, GSequenceIter* b) nothrow;
__gshared c_g_sequence_iter_compareFn c_g_sequence_iter_compare; ///
private alias c_g_sequence_iter_get_positionFn = extern(C) int function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_get_positionFn c_g_sequence_iter_get_position; ///
private alias c_g_sequence_iter_get_sequenceFn = extern(C) GSequence* function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_get_sequenceFn c_g_sequence_iter_get_sequence; ///
private alias c_g_sequence_iter_is_beginFn = extern(C) gboolean function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_is_beginFn c_g_sequence_iter_is_begin; ///
private alias c_g_sequence_iter_is_endFn = extern(C) gboolean function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_is_endFn c_g_sequence_iter_is_end; ///
private alias c_g_sequence_iter_moveFn = extern(C) GSequenceIter* function(GSequenceIter* iter, int delta) nothrow;
__gshared c_g_sequence_iter_moveFn c_g_sequence_iter_move; ///
private alias c_g_sequence_iter_nextFn = extern(C) GSequenceIter* function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_nextFn c_g_sequence_iter_next; ///
private alias c_g_sequence_iter_prevFn = extern(C) GSequenceIter* function(GSequenceIter* iter) nothrow;
__gshared c_g_sequence_iter_prevFn c_g_sequence_iter_prev; ///

// Source
private alias c_g_source_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_source_get_typeFn c_g_source_get_type; ///
private alias c_g_source_newFn = extern(C) GSource* function(GSourceFuncs* sourceFuncs, uint structSize) nothrow;
__gshared c_g_source_newFn c_g_source_new; ///
private alias c_g_source_add_child_sourceFn = extern(C) void function(GSource* source, GSource* childSource) nothrow;
__gshared c_g_source_add_child_sourceFn c_g_source_add_child_source; ///
private alias c_g_source_add_pollFn = extern(C) void function(GSource* source, GPollFD* fd) nothrow;
__gshared c_g_source_add_pollFn c_g_source_add_poll; ///
private alias c_g_source_add_unix_fdFn = extern(C) void* function(GSource* source, int fd, GIOCondition events) nothrow;
__gshared c_g_source_add_unix_fdFn c_g_source_add_unix_fd; ///
private alias c_g_source_attachFn = extern(C) uint function(GSource* source, GMainContext* context) nothrow;
__gshared c_g_source_attachFn c_g_source_attach; ///
private alias c_g_source_destroyFn = extern(C) void function(GSource* source) nothrow;
__gshared c_g_source_destroyFn c_g_source_destroy; ///
private alias c_g_source_dup_contextFn = extern(C) GMainContext* function(GSource* source) nothrow;
__gshared c_g_source_dup_contextFn c_g_source_dup_context; ///
private alias c_g_source_get_can_recurseFn = extern(C) gboolean function(GSource* source) nothrow;
__gshared c_g_source_get_can_recurseFn c_g_source_get_can_recurse; ///
private alias c_g_source_get_contextFn = extern(C) GMainContext* function(GSource* source) nothrow;
__gshared c_g_source_get_contextFn c_g_source_get_context; ///
private alias c_g_source_get_current_timeFn = extern(C) void function(GSource* source, GTimeVal* timeval) nothrow;
__gshared c_g_source_get_current_timeFn c_g_source_get_current_time; ///
private alias c_g_source_get_idFn = extern(C) uint function(GSource* source) nothrow;
__gshared c_g_source_get_idFn c_g_source_get_id; ///
private alias c_g_source_get_nameFn = extern(C) const(char)* function(GSource* source) nothrow;
__gshared c_g_source_get_nameFn c_g_source_get_name; ///
private alias c_g_source_get_priorityFn = extern(C) int function(GSource* source) nothrow;
__gshared c_g_source_get_priorityFn c_g_source_get_priority; ///
private alias c_g_source_get_ready_timeFn = extern(C) long function(GSource* source) nothrow;
__gshared c_g_source_get_ready_timeFn c_g_source_get_ready_time; ///
private alias c_g_source_get_timeFn = extern(C) long function(GSource* source) nothrow;
__gshared c_g_source_get_timeFn c_g_source_get_time; ///
private alias c_g_source_is_destroyedFn = extern(C) gboolean function(GSource* source) nothrow;
__gshared c_g_source_is_destroyedFn c_g_source_is_destroyed; ///
private alias c_g_source_modify_unix_fdFn = extern(C) void function(GSource* source, void* tag, GIOCondition newEvents) nothrow;
__gshared c_g_source_modify_unix_fdFn c_g_source_modify_unix_fd; ///
private alias c_g_source_query_unix_fdFn = extern(C) GIOCondition function(GSource* source, void* tag) nothrow;
__gshared c_g_source_query_unix_fdFn c_g_source_query_unix_fd; ///
private alias c_g_source_refFn = extern(C) GSource* function(GSource* source) nothrow;
__gshared c_g_source_refFn c_g_source_ref; ///
private alias c_g_source_remove_child_sourceFn = extern(C) void function(GSource* source, GSource* childSource) nothrow;
__gshared c_g_source_remove_child_sourceFn c_g_source_remove_child_source; ///
private alias c_g_source_remove_pollFn = extern(C) void function(GSource* source, GPollFD* fd) nothrow;
__gshared c_g_source_remove_pollFn c_g_source_remove_poll; ///
private alias c_g_source_remove_unix_fdFn = extern(C) void function(GSource* source, void* tag) nothrow;
__gshared c_g_source_remove_unix_fdFn c_g_source_remove_unix_fd; ///
private alias c_g_source_set_callbackFn = extern(C) void function(GSource* source, GSourceFunc func, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_source_set_callbackFn c_g_source_set_callback; ///
private alias c_g_source_set_callback_indirectFn = extern(C) void function(GSource* source, void* callbackData, GSourceCallbackFuncs* callbackFuncs) nothrow;
__gshared c_g_source_set_callback_indirectFn c_g_source_set_callback_indirect; ///
private alias c_g_source_set_can_recurseFn = extern(C) void function(GSource* source, gboolean canRecurse) nothrow;
__gshared c_g_source_set_can_recurseFn c_g_source_set_can_recurse; ///
private alias c_g_source_set_dispose_functionFn = extern(C) void function(GSource* source, GSourceDisposeFunc dispose) nothrow;
__gshared c_g_source_set_dispose_functionFn c_g_source_set_dispose_function; ///
private alias c_g_source_set_funcsFn = extern(C) void function(GSource* source, GSourceFuncs* funcs) nothrow;
__gshared c_g_source_set_funcsFn c_g_source_set_funcs; ///
private alias c_g_source_set_nameFn = extern(C) void function(GSource* source, const(char)* name) nothrow;
__gshared c_g_source_set_nameFn c_g_source_set_name; ///
private alias c_g_source_set_priorityFn = extern(C) void function(GSource* source, int priority) nothrow;
__gshared c_g_source_set_priorityFn c_g_source_set_priority; ///
private alias c_g_source_set_ready_timeFn = extern(C) void function(GSource* source, long readyTime) nothrow;
__gshared c_g_source_set_ready_timeFn c_g_source_set_ready_time; ///
private alias c_g_source_set_static_nameFn = extern(C) void function(GSource* source, const(char)* name) nothrow;
__gshared c_g_source_set_static_nameFn c_g_source_set_static_name; ///
private alias c_g_source_unrefFn = extern(C) void function(GSource* source) nothrow;
__gshared c_g_source_unrefFn c_g_source_unref; ///
private alias c_g_source_removeFn = extern(C) gboolean function(uint tag) nothrow;
__gshared c_g_source_removeFn c_g_source_remove; ///
private alias c_g_source_remove_by_funcs_user_dataFn = extern(C) gboolean function(GSourceFuncs* funcs, void* userData) nothrow;
__gshared c_g_source_remove_by_funcs_user_dataFn c_g_source_remove_by_funcs_user_data; ///
private alias c_g_source_remove_by_user_dataFn = extern(C) gboolean function(void* userData) nothrow;
__gshared c_g_source_remove_by_user_dataFn c_g_source_remove_by_user_data; ///
private alias c_g_source_set_name_by_idFn = extern(C) void function(uint tag, const(char)* name) nothrow;
__gshared c_g_source_set_name_by_idFn c_g_source_set_name_by_id; ///

// StaticMutex
private alias c_g_static_mutex_freeFn = extern(C) void function(GStaticMutex* mutex) nothrow;
__gshared c_g_static_mutex_freeFn c_g_static_mutex_free; ///
private alias c_g_static_mutex_get_mutex_implFn = extern(C) GMutex* function(GStaticMutex* mutex) nothrow;
__gshared c_g_static_mutex_get_mutex_implFn c_g_static_mutex_get_mutex_impl; ///
private alias c_g_static_mutex_initFn = extern(C) void function(GStaticMutex* mutex) nothrow;
__gshared c_g_static_mutex_initFn c_g_static_mutex_init; ///

// StaticPrivate
private alias c_g_static_private_freeFn = extern(C) void function(GStaticPrivate* privateKey) nothrow;
__gshared c_g_static_private_freeFn c_g_static_private_free; ///
private alias c_g_static_private_getFn = extern(C) void* function(GStaticPrivate* privateKey) nothrow;
__gshared c_g_static_private_getFn c_g_static_private_get; ///
private alias c_g_static_private_initFn = extern(C) void function(GStaticPrivate* privateKey) nothrow;
__gshared c_g_static_private_initFn c_g_static_private_init; ///
private alias c_g_static_private_setFn = extern(C) void function(GStaticPrivate* privateKey, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_static_private_setFn c_g_static_private_set; ///

// StaticRWLock
private alias c_g_static_rw_lock_freeFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_freeFn c_g_static_rw_lock_free; ///
private alias c_g_static_rw_lock_initFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_initFn c_g_static_rw_lock_init; ///
private alias c_g_static_rw_lock_reader_lockFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_reader_lockFn c_g_static_rw_lock_reader_lock; ///
private alias c_g_static_rw_lock_reader_trylockFn = extern(C) gboolean function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_reader_trylockFn c_g_static_rw_lock_reader_trylock; ///
private alias c_g_static_rw_lock_reader_unlockFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_reader_unlockFn c_g_static_rw_lock_reader_unlock; ///
private alias c_g_static_rw_lock_writer_lockFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_writer_lockFn c_g_static_rw_lock_writer_lock; ///
private alias c_g_static_rw_lock_writer_trylockFn = extern(C) gboolean function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_writer_trylockFn c_g_static_rw_lock_writer_trylock; ///
private alias c_g_static_rw_lock_writer_unlockFn = extern(C) void function(GStaticRWLock* lock) nothrow;
__gshared c_g_static_rw_lock_writer_unlockFn c_g_static_rw_lock_writer_unlock; ///

// StaticRecMutex
private alias c_g_static_rec_mutex_freeFn = extern(C) void function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_freeFn c_g_static_rec_mutex_free; ///
private alias c_g_static_rec_mutex_initFn = extern(C) void function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_initFn c_g_static_rec_mutex_init; ///
private alias c_g_static_rec_mutex_lockFn = extern(C) void function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_lockFn c_g_static_rec_mutex_lock; ///
private alias c_g_static_rec_mutex_lock_fullFn = extern(C) void function(GStaticRecMutex* mutex, uint depth) nothrow;
__gshared c_g_static_rec_mutex_lock_fullFn c_g_static_rec_mutex_lock_full; ///
private alias c_g_static_rec_mutex_trylockFn = extern(C) gboolean function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_trylockFn c_g_static_rec_mutex_trylock; ///
private alias c_g_static_rec_mutex_unlockFn = extern(C) void function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_unlockFn c_g_static_rec_mutex_unlock; ///
private alias c_g_static_rec_mutex_unlock_fullFn = extern(C) uint function(GStaticRecMutex* mutex) nothrow;
__gshared c_g_static_rec_mutex_unlock_fullFn c_g_static_rec_mutex_unlock_full; ///

// String
private alias c_g_gstring_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_gstring_get_typeFn c_g_gstring_get_type; ///
private alias c_g_string_newFn = extern(C) GString* function(const(char)* init_) nothrow;
__gshared c_g_string_newFn c_g_string_new; ///
private alias c_g_string_new_lenFn = extern(C) GString* function(const(char)* init_, ptrdiff_t len) nothrow;
__gshared c_g_string_new_lenFn c_g_string_new_len; ///
private alias c_g_string_new_takeFn = extern(C) GString* function(char* init_) nothrow;
__gshared c_g_string_new_takeFn c_g_string_new_take; ///
private alias c_g_string_sized_newFn = extern(C) GString* function(size_t dflSize) nothrow;
__gshared c_g_string_sized_newFn c_g_string_sized_new; ///
private alias c_g_string_appendFn = extern(C) GString* function(GString* string_, const(char)* val) nothrow;
__gshared c_g_string_appendFn c_g_string_append; ///
private alias c_g_string_append_cFn = extern(C) GString* function(GString* string_, char c) nothrow;
__gshared c_g_string_append_cFn c_g_string_append_c; ///
private alias c_g_string_append_lenFn = extern(C) GString* function(GString* string_, const(char)* val, ptrdiff_t len) nothrow;
__gshared c_g_string_append_lenFn c_g_string_append_len; ///
private alias c_g_string_append_printfFn = extern(C) void function(GString* string_, const(char)* format,  ...) nothrow;
__gshared c_g_string_append_printfFn c_g_string_append_printf; ///
private alias c_g_string_append_unicharFn = extern(C) GString* function(GString* string_, dchar wc) nothrow;
__gshared c_g_string_append_unicharFn c_g_string_append_unichar; ///
private alias c_g_string_append_uri_escapedFn = extern(C) GString* function(GString* string_, const(char)* unescaped, const(char)* reservedCharsAllowed, gboolean allowUtf8) nothrow;
__gshared c_g_string_append_uri_escapedFn c_g_string_append_uri_escaped; ///
private alias c_g_string_append_vprintfFn = extern(C) void function(GString* string_, const(char)* format, void* args) nothrow;
__gshared c_g_string_append_vprintfFn c_g_string_append_vprintf; ///
private alias c_g_string_ascii_downFn = extern(C) GString* function(GString* string_) nothrow;
__gshared c_g_string_ascii_downFn c_g_string_ascii_down; ///
private alias c_g_string_ascii_upFn = extern(C) GString* function(GString* string_) nothrow;
__gshared c_g_string_ascii_upFn c_g_string_ascii_up; ///
private alias c_g_string_assignFn = extern(C) GString* function(GString* string_, const(char)* rval) nothrow;
__gshared c_g_string_assignFn c_g_string_assign; ///
private alias c_g_string_copyFn = extern(C) GString* function(GString* string_) nothrow;
__gshared c_g_string_copyFn c_g_string_copy; ///
private alias c_g_string_downFn = extern(C) GString* function(GString* string_) nothrow;
__gshared c_g_string_downFn c_g_string_down; ///
private alias c_g_string_equalFn = extern(C) gboolean function(const(GString)* v, const(GString)* v2) nothrow;
__gshared c_g_string_equalFn c_g_string_equal; ///
private alias c_g_string_eraseFn = extern(C) GString* function(GString* string_, ptrdiff_t pos, ptrdiff_t len) nothrow;
__gshared c_g_string_eraseFn c_g_string_erase; ///
private alias c_g_string_freeFn = extern(C) char* function(GString* string_, gboolean freeSegment) nothrow;
__gshared c_g_string_freeFn c_g_string_free; ///
private alias c_g_string_free_and_stealFn = extern(C) char* function(GString* string_) nothrow;
__gshared c_g_string_free_and_stealFn c_g_string_free_and_steal; ///
private alias c_g_string_free_to_bytesFn = extern(C) GBytes* function(GString* string_) nothrow;
__gshared c_g_string_free_to_bytesFn c_g_string_free_to_bytes; ///
private alias c_g_string_hashFn = extern(C) uint function(const(GString)* str) nothrow;
__gshared c_g_string_hashFn c_g_string_hash; ///
private alias c_g_string_insertFn = extern(C) GString* function(GString* string_, ptrdiff_t pos, const(char)* val) nothrow;
__gshared c_g_string_insertFn c_g_string_insert; ///
private alias c_g_string_insert_cFn = extern(C) GString* function(GString* string_, ptrdiff_t pos, char c) nothrow;
__gshared c_g_string_insert_cFn c_g_string_insert_c; ///
private alias c_g_string_insert_lenFn = extern(C) GString* function(GString* string_, ptrdiff_t pos, const(char)* val, ptrdiff_t len) nothrow;
__gshared c_g_string_insert_lenFn c_g_string_insert_len; ///
private alias c_g_string_insert_unicharFn = extern(C) GString* function(GString* string_, ptrdiff_t pos, dchar wc) nothrow;
__gshared c_g_string_insert_unicharFn c_g_string_insert_unichar; ///
private alias c_g_string_overwriteFn = extern(C) GString* function(GString* string_, size_t pos, const(char)* val) nothrow;
__gshared c_g_string_overwriteFn c_g_string_overwrite; ///
private alias c_g_string_overwrite_lenFn = extern(C) GString* function(GString* string_, size_t pos, const(char)* val, ptrdiff_t len) nothrow;
__gshared c_g_string_overwrite_lenFn c_g_string_overwrite_len; ///
private alias c_g_string_prependFn = extern(C) GString* function(GString* string_, const(char)* val) nothrow;
__gshared c_g_string_prependFn c_g_string_prepend; ///
private alias c_g_string_prepend_cFn = extern(C) GString* function(GString* string_, char c) nothrow;
__gshared c_g_string_prepend_cFn c_g_string_prepend_c; ///
private alias c_g_string_prepend_lenFn = extern(C) GString* function(GString* string_, const(char)* val, ptrdiff_t len) nothrow;
__gshared c_g_string_prepend_lenFn c_g_string_prepend_len; ///
private alias c_g_string_prepend_unicharFn = extern(C) GString* function(GString* string_, dchar wc) nothrow;
__gshared c_g_string_prepend_unicharFn c_g_string_prepend_unichar; ///
private alias c_g_string_printfFn = extern(C) void function(GString* string_, const(char)* format,  ...) nothrow;
__gshared c_g_string_printfFn c_g_string_printf; ///
private alias c_g_string_replaceFn = extern(C) uint function(GString* string_, const(char)* find, const(char)* replace, uint limit) nothrow;
__gshared c_g_string_replaceFn c_g_string_replace; ///
private alias c_g_string_set_sizeFn = extern(C) GString* function(GString* string_, size_t len) nothrow;
__gshared c_g_string_set_sizeFn c_g_string_set_size; ///
private alias c_g_string_truncateFn = extern(C) GString* function(GString* string_, size_t len) nothrow;
__gshared c_g_string_truncateFn c_g_string_truncate; ///
private alias c_g_string_upFn = extern(C) GString* function(GString* string_) nothrow;
__gshared c_g_string_upFn c_g_string_up; ///
private alias c_g_string_vprintfFn = extern(C) void function(GString* string_, const(char)* format, void* args) nothrow;
__gshared c_g_string_vprintfFn c_g_string_vprintf; ///

// StringChunk
private alias c_g_string_chunk_clearFn = extern(C) void function(GStringChunk* chunk) nothrow;
__gshared c_g_string_chunk_clearFn c_g_string_chunk_clear; ///
private alias c_g_string_chunk_freeFn = extern(C) void function(GStringChunk* chunk) nothrow;
__gshared c_g_string_chunk_freeFn c_g_string_chunk_free; ///
private alias c_g_string_chunk_insertFn = extern(C) char* function(GStringChunk* chunk, const(char)* string_) nothrow;
__gshared c_g_string_chunk_insertFn c_g_string_chunk_insert; ///
private alias c_g_string_chunk_insert_constFn = extern(C) char* function(GStringChunk* chunk, const(char)* string_) nothrow;
__gshared c_g_string_chunk_insert_constFn c_g_string_chunk_insert_const; ///
private alias c_g_string_chunk_insert_lenFn = extern(C) char* function(GStringChunk* chunk, const(char)* string_, ptrdiff_t len) nothrow;
__gshared c_g_string_chunk_insert_lenFn c_g_string_chunk_insert_len; ///
private alias c_g_string_chunk_newFn = extern(C) GStringChunk* function(size_t size) nothrow;
__gshared c_g_string_chunk_newFn c_g_string_chunk_new; ///

// StrvBuilder
private alias c_g_strv_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_strv_builder_get_typeFn c_g_strv_builder_get_type; ///
private alias c_g_strv_builder_newFn = extern(C) GStrvBuilder* function() nothrow;
__gshared c_g_strv_builder_newFn c_g_strv_builder_new; ///
private alias c_g_strv_builder_addFn = extern(C) void function(GStrvBuilder* builder, const(char)* value) nothrow;
__gshared c_g_strv_builder_addFn c_g_strv_builder_add; ///
private alias c_g_strv_builder_add_manyFn = extern(C) void function(GStrvBuilder* builder,  ...) nothrow;
__gshared c_g_strv_builder_add_manyFn c_g_strv_builder_add_many; ///
private alias c_g_strv_builder_addvFn = extern(C) void function(GStrvBuilder* builder, const(char*)* value) nothrow;
__gshared c_g_strv_builder_addvFn c_g_strv_builder_addv; ///
private alias c_g_strv_builder_endFn = extern(C) char** function(GStrvBuilder* builder) nothrow;
__gshared c_g_strv_builder_endFn c_g_strv_builder_end; ///
private alias c_g_strv_builder_refFn = extern(C) GStrvBuilder* function(GStrvBuilder* builder) nothrow;
__gshared c_g_strv_builder_refFn c_g_strv_builder_ref; ///
private alias c_g_strv_builder_takeFn = extern(C) void function(GStrvBuilder* builder, char* value) nothrow;
__gshared c_g_strv_builder_takeFn c_g_strv_builder_take; ///
private alias c_g_strv_builder_unrefFn = extern(C) void function(GStrvBuilder* builder) nothrow;
__gshared c_g_strv_builder_unrefFn c_g_strv_builder_unref; ///
private alias c_g_strv_builder_unref_to_strvFn = extern(C) GStrv function(GStrvBuilder* builder) nothrow;
__gshared c_g_strv_builder_unref_to_strvFn c_g_strv_builder_unref_to_strv; ///

// TestCase
private alias c_g_test_case_freeFn = extern(C) void function(GTestCase* testCase) nothrow;
__gshared c_g_test_case_freeFn c_g_test_case_free; ///

// TestLogBuffer
private alias c_g_test_log_buffer_freeFn = extern(C) void function(GTestLogBuffer* tbuffer) nothrow;
__gshared c_g_test_log_buffer_freeFn c_g_test_log_buffer_free; ///
private alias c_g_test_log_buffer_popFn = extern(C) GTestLogMsg* function(GTestLogBuffer* tbuffer) nothrow;
__gshared c_g_test_log_buffer_popFn c_g_test_log_buffer_pop; ///
private alias c_g_test_log_buffer_pushFn = extern(C) void function(GTestLogBuffer* tbuffer, uint nBytes, const(ubyte)* bytes) nothrow;
__gshared c_g_test_log_buffer_pushFn c_g_test_log_buffer_push; ///
private alias c_g_test_log_buffer_newFn = extern(C) GTestLogBuffer* function() nothrow;
__gshared c_g_test_log_buffer_newFn c_g_test_log_buffer_new; ///

// TestLogMsg
private alias c_g_test_log_msg_freeFn = extern(C) void function(GTestLogMsg* tmsg) nothrow;
__gshared c_g_test_log_msg_freeFn c_g_test_log_msg_free; ///

// TestSuite
private alias c_g_test_suite_addFn = extern(C) void function(GTestSuite* suite, GTestCase* testCase) nothrow;
__gshared c_g_test_suite_addFn c_g_test_suite_add; ///
private alias c_g_test_suite_add_suiteFn = extern(C) void function(GTestSuite* suite, GTestSuite* nestedsuite) nothrow;
__gshared c_g_test_suite_add_suiteFn c_g_test_suite_add_suite; ///
private alias c_g_test_suite_freeFn = extern(C) void function(GTestSuite* suite) nothrow;
__gshared c_g_test_suite_freeFn c_g_test_suite_free; ///

// Thread
private alias c_g_thread_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_thread_get_typeFn c_g_thread_get_type; ///
private alias c_g_thread_newFn = extern(C) GThread* function(const(char)* name, GThreadFunc func, void* data) nothrow;
__gshared c_g_thread_newFn c_g_thread_new; ///
private alias c_g_thread_try_newFn = extern(C) GThread* function(const(char)* name, GThreadFunc func, void* data, GError** _err) nothrow;
__gshared c_g_thread_try_newFn c_g_thread_try_new; ///
private alias c_g_thread_get_nameFn = extern(C) const(char)* function(GThread* thread) nothrow;
__gshared c_g_thread_get_nameFn c_g_thread_get_name; ///
private alias c_g_thread_joinFn = extern(C) void* function(GThread* thread) nothrow;
__gshared c_g_thread_joinFn c_g_thread_join; ///
private alias c_g_thread_refFn = extern(C) GThread* function(GThread* thread) nothrow;
__gshared c_g_thread_refFn c_g_thread_ref; ///
private alias c_g_thread_set_priorityFn = extern(C) void function(GThread* thread, GThreadPriority priority) nothrow;
__gshared c_g_thread_set_priorityFn c_g_thread_set_priority; ///
private alias c_g_thread_unrefFn = extern(C) void function(GThread* thread) nothrow;
__gshared c_g_thread_unrefFn c_g_thread_unref; ///
private alias c_g_thread_createFn = extern(C) GThread* function(GThreadFunc func, void* data, gboolean joinable, GError** _err) nothrow;
__gshared c_g_thread_createFn c_g_thread_create; ///
private alias c_g_thread_create_fullFn = extern(C) GThread* function(GThreadFunc func, void* data, gulong stackSize, gboolean joinable, gboolean bound, GThreadPriority priority, GError** _err) nothrow;
__gshared c_g_thread_create_fullFn c_g_thread_create_full; ///
private alias c_g_thread_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_thread_error_quarkFn c_g_thread_error_quark; ///
private alias c_g_thread_exitFn = extern(C) void function(void* retval) nothrow;
__gshared c_g_thread_exitFn c_g_thread_exit; ///
private alias c_g_thread_foreachFn = extern(C) void function(GFunc threadFunc, void* userData) nothrow;
__gshared c_g_thread_foreachFn c_g_thread_foreach; ///
private alias c_g_thread_get_initializedFn = extern(C) gboolean function() nothrow;
__gshared c_g_thread_get_initializedFn c_g_thread_get_initialized; ///
private alias c_g_thread_initFn = extern(C) void function(void* vtable) nothrow;
__gshared c_g_thread_initFn c_g_thread_init; ///
private alias c_g_thread_init_with_errorcheck_mutexesFn = extern(C) void function(void* vtable) nothrow;
__gshared c_g_thread_init_with_errorcheck_mutexesFn c_g_thread_init_with_errorcheck_mutexes; ///
private alias c_g_thread_selfFn = extern(C) GThread* function() nothrow;
__gshared c_g_thread_selfFn c_g_thread_self; ///
private alias c_g_thread_yieldFn = extern(C) void function() nothrow;
__gshared c_g_thread_yieldFn c_g_thread_yield; ///

// ThreadPool
private alias c_g_thread_pool_freeFn = extern(C) void function(GThreadPool* pool, gboolean immediate, gboolean wait) nothrow;
__gshared c_g_thread_pool_freeFn c_g_thread_pool_free; ///
private alias c_g_thread_pool_get_max_threadsFn = extern(C) int function(GThreadPool* pool) nothrow;
__gshared c_g_thread_pool_get_max_threadsFn c_g_thread_pool_get_max_threads; ///
private alias c_g_thread_pool_get_num_threadsFn = extern(C) uint function(GThreadPool* pool) nothrow;
__gshared c_g_thread_pool_get_num_threadsFn c_g_thread_pool_get_num_threads; ///
private alias c_g_thread_pool_move_to_frontFn = extern(C) gboolean function(GThreadPool* pool, void* data) nothrow;
__gshared c_g_thread_pool_move_to_frontFn c_g_thread_pool_move_to_front; ///
private alias c_g_thread_pool_pushFn = extern(C) gboolean function(GThreadPool* pool, void* data, GError** _err) nothrow;
__gshared c_g_thread_pool_pushFn c_g_thread_pool_push; ///
private alias c_g_thread_pool_set_max_threadsFn = extern(C) gboolean function(GThreadPool* pool, int maxThreads, GError** _err) nothrow;
__gshared c_g_thread_pool_set_max_threadsFn c_g_thread_pool_set_max_threads; ///
private alias c_g_thread_pool_set_sort_functionFn = extern(C) void function(GThreadPool* pool, GCompareDataFunc func, void* userData) nothrow;
__gshared c_g_thread_pool_set_sort_functionFn c_g_thread_pool_set_sort_function; ///
private alias c_g_thread_pool_unprocessedFn = extern(C) uint function(GThreadPool* pool) nothrow;
__gshared c_g_thread_pool_unprocessedFn c_g_thread_pool_unprocessed; ///
private alias c_g_thread_pool_get_max_idle_timeFn = extern(C) uint function() nothrow;
__gshared c_g_thread_pool_get_max_idle_timeFn c_g_thread_pool_get_max_idle_time; ///
private alias c_g_thread_pool_get_max_unused_threadsFn = extern(C) int function() nothrow;
__gshared c_g_thread_pool_get_max_unused_threadsFn c_g_thread_pool_get_max_unused_threads; ///
private alias c_g_thread_pool_get_num_unused_threadsFn = extern(C) uint function() nothrow;
__gshared c_g_thread_pool_get_num_unused_threadsFn c_g_thread_pool_get_num_unused_threads; ///
private alias c_g_thread_pool_newFn = extern(C) GThreadPool* function(GFunc func, void* userData, int maxThreads, gboolean exclusive, GError** _err) nothrow;
__gshared c_g_thread_pool_newFn c_g_thread_pool_new; ///
private alias c_g_thread_pool_new_fullFn = extern(C) GThreadPool* function(GFunc func, void* userData, GDestroyNotify itemFreeFunc, int maxThreads, gboolean exclusive, GError** _err) nothrow;
__gshared c_g_thread_pool_new_fullFn c_g_thread_pool_new_full; ///
private alias c_g_thread_pool_set_max_idle_timeFn = extern(C) void function(uint interval) nothrow;
__gshared c_g_thread_pool_set_max_idle_timeFn c_g_thread_pool_set_max_idle_time; ///
private alias c_g_thread_pool_set_max_unused_threadsFn = extern(C) void function(int maxThreads) nothrow;
__gshared c_g_thread_pool_set_max_unused_threadsFn c_g_thread_pool_set_max_unused_threads; ///
private alias c_g_thread_pool_stop_unused_threadsFn = extern(C) void function() nothrow;
__gshared c_g_thread_pool_stop_unused_threadsFn c_g_thread_pool_stop_unused_threads; ///

// TimeVal
private alias c_g_time_val_addFn = extern(C) void function(GTimeVal* time, glong microseconds) nothrow;
__gshared c_g_time_val_addFn c_g_time_val_add; ///
private alias c_g_time_val_to_iso8601Fn = extern(C) char* function(GTimeVal* time) nothrow;
__gshared c_g_time_val_to_iso8601Fn c_g_time_val_to_iso8601; ///
private alias c_g_time_val_from_iso8601Fn = extern(C) gboolean function(const(char)* isoDate, GTimeVal* time) nothrow;
__gshared c_g_time_val_from_iso8601Fn c_g_time_val_from_iso8601; ///

// TimeZone
private alias c_g_time_zone_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_time_zone_get_typeFn c_g_time_zone_get_type; ///
private alias c_g_time_zone_newFn = extern(C) GTimeZone* function(const(char)* identifier) nothrow;
__gshared c_g_time_zone_newFn c_g_time_zone_new; ///
private alias c_g_time_zone_new_identifierFn = extern(C) GTimeZone* function(const(char)* identifier) nothrow;
__gshared c_g_time_zone_new_identifierFn c_g_time_zone_new_identifier; ///
private alias c_g_time_zone_new_localFn = extern(C) GTimeZone* function() nothrow;
__gshared c_g_time_zone_new_localFn c_g_time_zone_new_local; ///
private alias c_g_time_zone_new_offsetFn = extern(C) GTimeZone* function(int seconds) nothrow;
__gshared c_g_time_zone_new_offsetFn c_g_time_zone_new_offset; ///
private alias c_g_time_zone_new_utcFn = extern(C) GTimeZone* function() nothrow;
__gshared c_g_time_zone_new_utcFn c_g_time_zone_new_utc; ///
private alias c_g_time_zone_adjust_timeFn = extern(C) int function(GTimeZone* tz, GTimeType type, long* time) nothrow;
__gshared c_g_time_zone_adjust_timeFn c_g_time_zone_adjust_time; ///
private alias c_g_time_zone_find_intervalFn = extern(C) int function(GTimeZone* tz, GTimeType type, long time) nothrow;
__gshared c_g_time_zone_find_intervalFn c_g_time_zone_find_interval; ///
private alias c_g_time_zone_get_abbreviationFn = extern(C) const(char)* function(GTimeZone* tz, int interval) nothrow;
__gshared c_g_time_zone_get_abbreviationFn c_g_time_zone_get_abbreviation; ///
private alias c_g_time_zone_get_identifierFn = extern(C) const(char)* function(GTimeZone* tz) nothrow;
__gshared c_g_time_zone_get_identifierFn c_g_time_zone_get_identifier; ///
private alias c_g_time_zone_get_offsetFn = extern(C) int function(GTimeZone* tz, int interval) nothrow;
__gshared c_g_time_zone_get_offsetFn c_g_time_zone_get_offset; ///
private alias c_g_time_zone_is_dstFn = extern(C) gboolean function(GTimeZone* tz, int interval) nothrow;
__gshared c_g_time_zone_is_dstFn c_g_time_zone_is_dst; ///
private alias c_g_time_zone_refFn = extern(C) GTimeZone* function(GTimeZone* tz) nothrow;
__gshared c_g_time_zone_refFn c_g_time_zone_ref; ///
private alias c_g_time_zone_unrefFn = extern(C) void function(GTimeZone* tz) nothrow;
__gshared c_g_time_zone_unrefFn c_g_time_zone_unref; ///

// Timer
private alias c_g_timer_continueFn = extern(C) void function(GTimer* timer) nothrow;
__gshared c_g_timer_continueFn c_g_timer_continue; ///
private alias c_g_timer_destroyFn = extern(C) void function(GTimer* timer) nothrow;
__gshared c_g_timer_destroyFn c_g_timer_destroy; ///
private alias c_g_timer_elapsedFn = extern(C) double function(GTimer* timer, gulong* microseconds) nothrow;
__gshared c_g_timer_elapsedFn c_g_timer_elapsed; ///
private alias c_g_timer_is_activeFn = extern(C) gboolean function(GTimer* timer) nothrow;
__gshared c_g_timer_is_activeFn c_g_timer_is_active; ///
private alias c_g_timer_resetFn = extern(C) void function(GTimer* timer) nothrow;
__gshared c_g_timer_resetFn c_g_timer_reset; ///
private alias c_g_timer_startFn = extern(C) void function(GTimer* timer) nothrow;
__gshared c_g_timer_startFn c_g_timer_start; ///
private alias c_g_timer_stopFn = extern(C) void function(GTimer* timer) nothrow;
__gshared c_g_timer_stopFn c_g_timer_stop; ///
private alias c_g_timer_newFn = extern(C) GTimer* function() nothrow;
__gshared c_g_timer_newFn c_g_timer_new; ///

// TrashStack
private alias c_g_trash_stack_heightFn = extern(C) uint function(GTrashStack** stackP) nothrow;
__gshared c_g_trash_stack_heightFn c_g_trash_stack_height; ///
private alias c_g_trash_stack_peekFn = extern(C) void* function(GTrashStack** stackP) nothrow;
__gshared c_g_trash_stack_peekFn c_g_trash_stack_peek; ///
private alias c_g_trash_stack_popFn = extern(C) void* function(GTrashStack** stackP) nothrow;
__gshared c_g_trash_stack_popFn c_g_trash_stack_pop; ///
private alias c_g_trash_stack_pushFn = extern(C) void function(GTrashStack** stackP, void* dataP) nothrow;
__gshared c_g_trash_stack_pushFn c_g_trash_stack_push; ///

// Tree
private alias c_g_tree_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_tree_get_typeFn c_g_tree_get_type; ///
private alias c_g_tree_newFn = extern(C) GTree* function(GCompareFunc keyCompareFunc) nothrow;
__gshared c_g_tree_newFn c_g_tree_new; ///
private alias c_g_tree_new_fullFn = extern(C) GTree* function(GCompareDataFunc keyCompareFunc, void* keyCompareData, GDestroyNotify keyDestroyFunc, GDestroyNotify valueDestroyFunc) nothrow;
__gshared c_g_tree_new_fullFn c_g_tree_new_full; ///
private alias c_g_tree_new_with_dataFn = extern(C) GTree* function(GCompareDataFunc keyCompareFunc, void* keyCompareData) nothrow;
__gshared c_g_tree_new_with_dataFn c_g_tree_new_with_data; ///
private alias c_g_tree_destroyFn = extern(C) void function(GTree* tree) nothrow;
__gshared c_g_tree_destroyFn c_g_tree_destroy; ///
private alias c_g_tree_foreachFn = extern(C) void function(GTree* tree, GTraverseFunc func, void* userData) nothrow;
__gshared c_g_tree_foreachFn c_g_tree_foreach; ///
private alias c_g_tree_foreach_nodeFn = extern(C) void function(GTree* tree, GTraverseNodeFunc func, void* userData) nothrow;
__gshared c_g_tree_foreach_nodeFn c_g_tree_foreach_node; ///
private alias c_g_tree_heightFn = extern(C) int function(GTree* tree) nothrow;
__gshared c_g_tree_heightFn c_g_tree_height; ///
private alias c_g_tree_insertFn = extern(C) void function(GTree* tree, void* key, void* value) nothrow;
__gshared c_g_tree_insertFn c_g_tree_insert; ///
private alias c_g_tree_insert_nodeFn = extern(C) GTreeNode* function(GTree* tree, void* key, void* value) nothrow;
__gshared c_g_tree_insert_nodeFn c_g_tree_insert_node; ///
private alias c_g_tree_lookupFn = extern(C) void* function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_lookupFn c_g_tree_lookup; ///
private alias c_g_tree_lookup_extendedFn = extern(C) gboolean function(GTree* tree, const(void)* lookupKey, void** origKey, void** value) nothrow;
__gshared c_g_tree_lookup_extendedFn c_g_tree_lookup_extended; ///
private alias c_g_tree_lookup_nodeFn = extern(C) GTreeNode* function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_lookup_nodeFn c_g_tree_lookup_node; ///
private alias c_g_tree_lower_boundFn = extern(C) GTreeNode* function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_lower_boundFn c_g_tree_lower_bound; ///
private alias c_g_tree_nnodesFn = extern(C) int function(GTree* tree) nothrow;
__gshared c_g_tree_nnodesFn c_g_tree_nnodes; ///
private alias c_g_tree_node_firstFn = extern(C) GTreeNode* function(GTree* tree) nothrow;
__gshared c_g_tree_node_firstFn c_g_tree_node_first; ///
private alias c_g_tree_node_lastFn = extern(C) GTreeNode* function(GTree* tree) nothrow;
__gshared c_g_tree_node_lastFn c_g_tree_node_last; ///
private alias c_g_tree_refFn = extern(C) GTree* function(GTree* tree) nothrow;
__gshared c_g_tree_refFn c_g_tree_ref; ///
private alias c_g_tree_removeFn = extern(C) gboolean function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_removeFn c_g_tree_remove; ///
private alias c_g_tree_remove_allFn = extern(C) void function(GTree* tree) nothrow;
__gshared c_g_tree_remove_allFn c_g_tree_remove_all; ///
private alias c_g_tree_replaceFn = extern(C) void function(GTree* tree, void* key, void* value) nothrow;
__gshared c_g_tree_replaceFn c_g_tree_replace; ///
private alias c_g_tree_replace_nodeFn = extern(C) GTreeNode* function(GTree* tree, void* key, void* value) nothrow;
__gshared c_g_tree_replace_nodeFn c_g_tree_replace_node; ///
private alias c_g_tree_searchFn = extern(C) void* function(GTree* tree, GCompareFunc searchFunc, const(void)* userData) nothrow;
__gshared c_g_tree_searchFn c_g_tree_search; ///
private alias c_g_tree_search_nodeFn = extern(C) GTreeNode* function(GTree* tree, GCompareFunc searchFunc, const(void)* userData) nothrow;
__gshared c_g_tree_search_nodeFn c_g_tree_search_node; ///
private alias c_g_tree_stealFn = extern(C) gboolean function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_stealFn c_g_tree_steal; ///
private alias c_g_tree_traverseFn = extern(C) void function(GTree* tree, GTraverseFunc traverseFunc, GTraverseType traverseType, void* userData) nothrow;
__gshared c_g_tree_traverseFn c_g_tree_traverse; ///
private alias c_g_tree_unrefFn = extern(C) void function(GTree* tree) nothrow;
__gshared c_g_tree_unrefFn c_g_tree_unref; ///
private alias c_g_tree_upper_boundFn = extern(C) GTreeNode* function(GTree* tree, const(void)* key) nothrow;
__gshared c_g_tree_upper_boundFn c_g_tree_upper_bound; ///

// TreeNode
private alias c_g_tree_node_keyFn = extern(C) void* function(GTreeNode* node) nothrow;
__gshared c_g_tree_node_keyFn c_g_tree_node_key; ///
private alias c_g_tree_node_nextFn = extern(C) GTreeNode* function(GTreeNode* node) nothrow;
__gshared c_g_tree_node_nextFn c_g_tree_node_next; ///
private alias c_g_tree_node_previousFn = extern(C) GTreeNode* function(GTreeNode* node) nothrow;
__gshared c_g_tree_node_previousFn c_g_tree_node_previous; ///
private alias c_g_tree_node_valueFn = extern(C) void* function(GTreeNode* node) nothrow;
__gshared c_g_tree_node_valueFn c_g_tree_node_value; ///

// Tuples
private alias c_g_tuples_destroyFn = extern(C) void function(GTuples* tuples) nothrow;
__gshared c_g_tuples_destroyFn c_g_tuples_destroy; ///
private alias c_g_tuples_indexFn = extern(C) void* function(GTuples* tuples, int index, int field) nothrow;
__gshared c_g_tuples_indexFn c_g_tuples_index; ///

// Uri
private alias c_g_uri_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_uri_get_typeFn c_g_uri_get_type; ///
private alias c_g_uri_get_auth_paramsFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_auth_paramsFn c_g_uri_get_auth_params; ///
private alias c_g_uri_get_flagsFn = extern(C) GUriFlags function(GUri* uri) nothrow;
__gshared c_g_uri_get_flagsFn c_g_uri_get_flags; ///
private alias c_g_uri_get_fragmentFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_fragmentFn c_g_uri_get_fragment; ///
private alias c_g_uri_get_hostFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_hostFn c_g_uri_get_host; ///
private alias c_g_uri_get_passwordFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_passwordFn c_g_uri_get_password; ///
private alias c_g_uri_get_pathFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_pathFn c_g_uri_get_path; ///
private alias c_g_uri_get_portFn = extern(C) int function(GUri* uri) nothrow;
__gshared c_g_uri_get_portFn c_g_uri_get_port; ///
private alias c_g_uri_get_queryFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_queryFn c_g_uri_get_query; ///
private alias c_g_uri_get_schemeFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_schemeFn c_g_uri_get_scheme; ///
private alias c_g_uri_get_userFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_userFn c_g_uri_get_user; ///
private alias c_g_uri_get_userinfoFn = extern(C) const(char)* function(GUri* uri) nothrow;
__gshared c_g_uri_get_userinfoFn c_g_uri_get_userinfo; ///
private alias c_g_uri_parse_relativeFn = extern(C) GUri* function(GUri* baseUri, const(char)* uriRef, GUriFlags flags, GError** _err) nothrow;
__gshared c_g_uri_parse_relativeFn c_g_uri_parse_relative; ///
private alias c_g_uri_refFn = extern(C) GUri* function(GUri* uri) nothrow;
__gshared c_g_uri_refFn c_g_uri_ref; ///
private alias c_g_uri_to_stringFn = extern(C) char* function(GUri* uri) nothrow;
__gshared c_g_uri_to_stringFn c_g_uri_to_string; ///
private alias c_g_uri_to_string_partialFn = extern(C) char* function(GUri* uri, GUriHideFlags flags) nothrow;
__gshared c_g_uri_to_string_partialFn c_g_uri_to_string_partial; ///
private alias c_g_uri_unrefFn = extern(C) void function(GUri* uri) nothrow;
__gshared c_g_uri_unrefFn c_g_uri_unref; ///
private alias c_g_uri_buildFn = extern(C) GUri* function(GUriFlags flags, const(char)* scheme, const(char)* userinfo, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_g_uri_buildFn c_g_uri_build; ///
private alias c_g_uri_build_with_userFn = extern(C) GUri* function(GUriFlags flags, const(char)* scheme, const(char)* user, const(char)* password, const(char)* authParams, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_g_uri_build_with_userFn c_g_uri_build_with_user; ///
private alias c_g_uri_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_uri_error_quarkFn c_g_uri_error_quark; ///
private alias c_g_uri_escape_bytesFn = extern(C) char* function(const(ubyte)* unescaped, size_t length, const(char)* reservedCharsAllowed) nothrow;
__gshared c_g_uri_escape_bytesFn c_g_uri_escape_bytes; ///
private alias c_g_uri_escape_stringFn = extern(C) char* function(const(char)* unescaped, const(char)* reservedCharsAllowed, gboolean allowUtf8) nothrow;
__gshared c_g_uri_escape_stringFn c_g_uri_escape_string; ///
private alias c_g_uri_is_validFn = extern(C) gboolean function(const(char)* uriString, GUriFlags flags, GError** _err) nothrow;
__gshared c_g_uri_is_validFn c_g_uri_is_valid; ///
private alias c_g_uri_joinFn = extern(C) char* function(GUriFlags flags, const(char)* scheme, const(char)* userinfo, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_g_uri_joinFn c_g_uri_join; ///
private alias c_g_uri_join_with_userFn = extern(C) char* function(GUriFlags flags, const(char)* scheme, const(char)* user, const(char)* password, const(char)* authParams, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) nothrow;
__gshared c_g_uri_join_with_userFn c_g_uri_join_with_user; ///
private alias c_g_uri_list_extract_urisFn = extern(C) char** function(const(char)* uriList) nothrow;
__gshared c_g_uri_list_extract_urisFn c_g_uri_list_extract_uris; ///
private alias c_g_uri_parseFn = extern(C) GUri* function(const(char)* uriString, GUriFlags flags, GError** _err) nothrow;
__gshared c_g_uri_parseFn c_g_uri_parse; ///
private alias c_g_uri_parse_paramsFn = extern(C) GHashTable* function(const(char)* params, ptrdiff_t length, const(char)* separators, GUriParamsFlags flags, GError** _err) nothrow;
__gshared c_g_uri_parse_paramsFn c_g_uri_parse_params; ///
private alias c_g_uri_parse_schemeFn = extern(C) char* function(const(char)* uri) nothrow;
__gshared c_g_uri_parse_schemeFn c_g_uri_parse_scheme; ///
private alias c_g_uri_peek_schemeFn = extern(C) const(char)* function(const(char)* uri) nothrow;
__gshared c_g_uri_peek_schemeFn c_g_uri_peek_scheme; ///
private alias c_g_uri_resolve_relativeFn = extern(C) char* function(const(char)* baseUriString, const(char)* uriRef, GUriFlags flags, GError** _err) nothrow;
__gshared c_g_uri_resolve_relativeFn c_g_uri_resolve_relative; ///
private alias c_g_uri_splitFn = extern(C) gboolean function(const(char)* uriRef, GUriFlags flags, char** scheme, char** userinfo, char** host, int* port, char** path, char** query, char** fragment, GError** _err) nothrow;
__gshared c_g_uri_splitFn c_g_uri_split; ///
private alias c_g_uri_split_networkFn = extern(C) gboolean function(const(char)* uriString, GUriFlags flags, char** scheme, char** host, int* port, GError** _err) nothrow;
__gshared c_g_uri_split_networkFn c_g_uri_split_network; ///
private alias c_g_uri_split_with_userFn = extern(C) gboolean function(const(char)* uriRef, GUriFlags flags, char** scheme, char** user, char** password, char** authParams, char** host, int* port, char** path, char** query, char** fragment, GError** _err) nothrow;
__gshared c_g_uri_split_with_userFn c_g_uri_split_with_user; ///
private alias c_g_uri_unescape_bytesFn = extern(C) GBytes* function(const(char)* escapedString, ptrdiff_t length, const(char)* illegalCharacters, GError** _err) nothrow;
__gshared c_g_uri_unescape_bytesFn c_g_uri_unescape_bytes; ///
private alias c_g_uri_unescape_segmentFn = extern(C) char* function(const(char)* escapedString, const(char)* escapedStringEnd, const(char)* illegalCharacters) nothrow;
__gshared c_g_uri_unescape_segmentFn c_g_uri_unescape_segment; ///
private alias c_g_uri_unescape_stringFn = extern(C) char* function(const(char)* escapedString, const(char)* illegalCharacters) nothrow;
__gshared c_g_uri_unescape_stringFn c_g_uri_unescape_string; ///

// UriParamsIter
private alias c_g_uri_params_iter_initFn = extern(C) void function(GUriParamsIter* iter, const(char)* params, ptrdiff_t length, const(char)* separators, GUriParamsFlags flags) nothrow;
__gshared c_g_uri_params_iter_initFn c_g_uri_params_iter_init; ///
private alias c_g_uri_params_iter_nextFn = extern(C) gboolean function(GUriParamsIter* iter, char** attribute, char** value, GError** _err) nothrow;
__gshared c_g_uri_params_iter_nextFn c_g_uri_params_iter_next; ///

// Variant
private alias c_internFn = extern(C) GType function() nothrow;
__gshared c_internFn c_intern; ///
private alias c_g_variant_newFn = extern(C) GVariant* function(const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_newFn c_g_variant_new; ///
private alias c_g_variant_new_arrayFn = extern(C) GVariant* function(const(GVariantType)* childType, const(GVariant*)* children, size_t nChildren) nothrow;
__gshared c_g_variant_new_arrayFn c_g_variant_new_array; ///
private alias c_g_variant_new_booleanFn = extern(C) GVariant* function(gboolean value) nothrow;
__gshared c_g_variant_new_booleanFn c_g_variant_new_boolean; ///
private alias c_g_variant_new_byteFn = extern(C) GVariant* function(ubyte value) nothrow;
__gshared c_g_variant_new_byteFn c_g_variant_new_byte; ///
private alias c_g_variant_new_bytestringFn = extern(C) GVariant* function(const(char)* string_) nothrow;
__gshared c_g_variant_new_bytestringFn c_g_variant_new_bytestring; ///
private alias c_g_variant_new_bytestring_arrayFn = extern(C) GVariant* function(const(char*)* strv, ptrdiff_t length) nothrow;
__gshared c_g_variant_new_bytestring_arrayFn c_g_variant_new_bytestring_array; ///
private alias c_g_variant_new_dict_entryFn = extern(C) GVariant* function(GVariant* key, GVariant* value) nothrow;
__gshared c_g_variant_new_dict_entryFn c_g_variant_new_dict_entry; ///
private alias c_g_variant_new_doubleFn = extern(C) GVariant* function(double value) nothrow;
__gshared c_g_variant_new_doubleFn c_g_variant_new_double; ///
private alias c_g_variant_new_fixed_arrayFn = extern(C) GVariant* function(const(GVariantType)* elementType, const(void)* elements, size_t nElements, size_t elementSize) nothrow;
__gshared c_g_variant_new_fixed_arrayFn c_g_variant_new_fixed_array; ///
private alias c_g_variant_new_from_bytesFn = extern(C) GVariant* function(const(GVariantType)* type, GBytes* bytes, gboolean trusted) nothrow;
__gshared c_g_variant_new_from_bytesFn c_g_variant_new_from_bytes; ///
private alias c_g_variant_new_from_dataFn = extern(C) GVariant* function(const(GVariantType)* type, const(void)* data, size_t size, gboolean trusted, GDestroyNotify notify, void* userData) nothrow;
__gshared c_g_variant_new_from_dataFn c_g_variant_new_from_data; ///
private alias c_g_variant_new_handleFn = extern(C) GVariant* function(int value) nothrow;
__gshared c_g_variant_new_handleFn c_g_variant_new_handle; ///
private alias c_g_variant_new_int16Fn = extern(C) GVariant* function(short value) nothrow;
__gshared c_g_variant_new_int16Fn c_g_variant_new_int16; ///
private alias c_g_variant_new_int32Fn = extern(C) GVariant* function(int value) nothrow;
__gshared c_g_variant_new_int32Fn c_g_variant_new_int32; ///
private alias c_g_variant_new_int64Fn = extern(C) GVariant* function(long value) nothrow;
__gshared c_g_variant_new_int64Fn c_g_variant_new_int64; ///
private alias c_g_variant_new_maybeFn = extern(C) GVariant* function(const(GVariantType)* childType, GVariant* child) nothrow;
__gshared c_g_variant_new_maybeFn c_g_variant_new_maybe; ///
private alias c_g_variant_new_object_pathFn = extern(C) GVariant* function(const(char)* objectPath) nothrow;
__gshared c_g_variant_new_object_pathFn c_g_variant_new_object_path; ///
private alias c_g_variant_new_objvFn = extern(C) GVariant* function(const(char*)* strv, ptrdiff_t length) nothrow;
__gshared c_g_variant_new_objvFn c_g_variant_new_objv; ///
private alias c_g_variant_new_parsedFn = extern(C) GVariant* function(const(char)* format,  ...) nothrow;
__gshared c_g_variant_new_parsedFn c_g_variant_new_parsed; ///
private alias c_g_variant_new_parsed_vaFn = extern(C) GVariant* function(const(char)* format, void** app) nothrow;
__gshared c_g_variant_new_parsed_vaFn c_g_variant_new_parsed_va; ///
private alias c_g_variant_new_printfFn = extern(C) GVariant* function(const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_new_printfFn c_g_variant_new_printf; ///
private alias c_g_variant_new_signatureFn = extern(C) GVariant* function(const(char)* signature) nothrow;
__gshared c_g_variant_new_signatureFn c_g_variant_new_signature; ///
private alias c_g_variant_new_stringFn = extern(C) GVariant* function(const(char)* string_) nothrow;
__gshared c_g_variant_new_stringFn c_g_variant_new_string; ///
private alias c_g_variant_new_strvFn = extern(C) GVariant* function(const(char*)* strv, ptrdiff_t length) nothrow;
__gshared c_g_variant_new_strvFn c_g_variant_new_strv; ///
private alias c_g_variant_new_take_stringFn = extern(C) GVariant* function(char* string_) nothrow;
__gshared c_g_variant_new_take_stringFn c_g_variant_new_take_string; ///
private alias c_g_variant_new_tupleFn = extern(C) GVariant* function(const(GVariant*)* children, size_t nChildren) nothrow;
__gshared c_g_variant_new_tupleFn c_g_variant_new_tuple; ///
private alias c_g_variant_new_uint16Fn = extern(C) GVariant* function(ushort value) nothrow;
__gshared c_g_variant_new_uint16Fn c_g_variant_new_uint16; ///
private alias c_g_variant_new_uint32Fn = extern(C) GVariant* function(uint value) nothrow;
__gshared c_g_variant_new_uint32Fn c_g_variant_new_uint32; ///
private alias c_g_variant_new_uint64Fn = extern(C) GVariant* function(ulong value) nothrow;
__gshared c_g_variant_new_uint64Fn c_g_variant_new_uint64; ///
private alias c_g_variant_new_vaFn = extern(C) GVariant* function(const(char)* formatString, const(char*)* endptr, void** app) nothrow;
__gshared c_g_variant_new_vaFn c_g_variant_new_va; ///
private alias c_g_variant_new_variantFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_new_variantFn c_g_variant_new_variant; ///
private alias c_g_variant_byteswapFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_byteswapFn c_g_variant_byteswap; ///
private alias c_g_variant_check_format_stringFn = extern(C) gboolean function(GVariant* value, const(char)* formatString, gboolean copyOnly) nothrow;
__gshared c_g_variant_check_format_stringFn c_g_variant_check_format_string; ///
private alias c_g_variant_classifyFn = extern(C) GVariantClass function(GVariant* value) nothrow;
__gshared c_g_variant_classifyFn c_g_variant_classify; ///
private alias c_g_variant_compareFn = extern(C) int function(GVariant* one, GVariant* two) nothrow;
__gshared c_g_variant_compareFn c_g_variant_compare; ///
private alias c_g_variant_dup_bytestringFn = extern(C) ubyte* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_dup_bytestringFn c_g_variant_dup_bytestring; ///
private alias c_g_variant_dup_bytestring_arrayFn = extern(C) char** function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_dup_bytestring_arrayFn c_g_variant_dup_bytestring_array; ///
private alias c_g_variant_dup_objvFn = extern(C) char** function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_dup_objvFn c_g_variant_dup_objv; ///
private alias c_g_variant_dup_stringFn = extern(C) char* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_dup_stringFn c_g_variant_dup_string; ///
private alias c_g_variant_dup_strvFn = extern(C) char** function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_dup_strvFn c_g_variant_dup_strv; ///
private alias c_g_variant_equalFn = extern(C) gboolean function(GVariant* one, GVariant* two) nothrow;
__gshared c_g_variant_equalFn c_g_variant_equal; ///
private alias c_g_variant_getFn = extern(C) void function(GVariant* value, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_getFn c_g_variant_get; ///
private alias c_g_variant_get_booleanFn = extern(C) gboolean function(GVariant* value) nothrow;
__gshared c_g_variant_get_booleanFn c_g_variant_get_boolean; ///
private alias c_g_variant_get_byteFn = extern(C) ubyte function(GVariant* value) nothrow;
__gshared c_g_variant_get_byteFn c_g_variant_get_byte; ///
private alias c_g_variant_get_bytestringFn = extern(C) const(char)* function(GVariant* value) nothrow;
__gshared c_g_variant_get_bytestringFn c_g_variant_get_bytestring; ///
private alias c_g_variant_get_bytestring_arrayFn = extern(C) const(char*)* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_get_bytestring_arrayFn c_g_variant_get_bytestring_array; ///
private alias c_g_variant_get_childFn = extern(C) void function(GVariant* value, size_t index, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_get_childFn c_g_variant_get_child; ///
private alias c_g_variant_get_child_valueFn = extern(C) GVariant* function(GVariant* value, size_t index) nothrow;
__gshared c_g_variant_get_child_valueFn c_g_variant_get_child_value; ///
private alias c_g_variant_get_dataFn = extern(C) const(void)* function(GVariant* value) nothrow;
__gshared c_g_variant_get_dataFn c_g_variant_get_data; ///
private alias c_g_variant_get_data_as_bytesFn = extern(C) GBytes* function(GVariant* value) nothrow;
__gshared c_g_variant_get_data_as_bytesFn c_g_variant_get_data_as_bytes; ///
private alias c_g_variant_get_doubleFn = extern(C) double function(GVariant* value) nothrow;
__gshared c_g_variant_get_doubleFn c_g_variant_get_double; ///
private alias c_g_variant_get_fixed_arrayFn = extern(C) const(void)* function(GVariant* value, size_t* nElements, size_t elementSize) nothrow;
__gshared c_g_variant_get_fixed_arrayFn c_g_variant_get_fixed_array; ///
private alias c_g_variant_get_handleFn = extern(C) int function(GVariant* value) nothrow;
__gshared c_g_variant_get_handleFn c_g_variant_get_handle; ///
private alias c_g_variant_get_int16Fn = extern(C) short function(GVariant* value) nothrow;
__gshared c_g_variant_get_int16Fn c_g_variant_get_int16; ///
private alias c_g_variant_get_int32Fn = extern(C) int function(GVariant* value) nothrow;
__gshared c_g_variant_get_int32Fn c_g_variant_get_int32; ///
private alias c_g_variant_get_int64Fn = extern(C) long function(GVariant* value) nothrow;
__gshared c_g_variant_get_int64Fn c_g_variant_get_int64; ///
private alias c_g_variant_get_maybeFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_get_maybeFn c_g_variant_get_maybe; ///
private alias c_g_variant_get_normal_formFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_get_normal_formFn c_g_variant_get_normal_form; ///
private alias c_g_variant_get_objvFn = extern(C) const(char*)* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_get_objvFn c_g_variant_get_objv; ///
private alias c_g_variant_get_sizeFn = extern(C) size_t function(GVariant* value) nothrow;
__gshared c_g_variant_get_sizeFn c_g_variant_get_size; ///
private alias c_g_variant_get_stringFn = extern(C) char* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_get_stringFn c_g_variant_get_string; ///
private alias c_g_variant_get_strvFn = extern(C) const(char*)* function(GVariant* value, size_t* length) nothrow;
__gshared c_g_variant_get_strvFn c_g_variant_get_strv; ///
private alias c_g_variant_get_typeFn = extern(C) const(GVariantType)* function(GVariant* value) nothrow;
__gshared c_g_variant_get_typeFn c_g_variant_get_type; ///
private alias c_g_variant_get_type_stringFn = extern(C) const(char)* function(GVariant* value) nothrow;
__gshared c_g_variant_get_type_stringFn c_g_variant_get_type_string; ///
private alias c_g_variant_get_uint16Fn = extern(C) ushort function(GVariant* value) nothrow;
__gshared c_g_variant_get_uint16Fn c_g_variant_get_uint16; ///
private alias c_g_variant_get_uint32Fn = extern(C) uint function(GVariant* value) nothrow;
__gshared c_g_variant_get_uint32Fn c_g_variant_get_uint32; ///
private alias c_g_variant_get_uint64Fn = extern(C) ulong function(GVariant* value) nothrow;
__gshared c_g_variant_get_uint64Fn c_g_variant_get_uint64; ///
private alias c_g_variant_get_vaFn = extern(C) void function(GVariant* value, const(char)* formatString, const(char*)* endptr, void** app) nothrow;
__gshared c_g_variant_get_vaFn c_g_variant_get_va; ///
private alias c_g_variant_get_variantFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_get_variantFn c_g_variant_get_variant; ///
private alias c_g_variant_hashFn = extern(C) uint function(GVariant* value) nothrow;
__gshared c_g_variant_hashFn c_g_variant_hash; ///
private alias c_g_variant_is_containerFn = extern(C) gboolean function(GVariant* value) nothrow;
__gshared c_g_variant_is_containerFn c_g_variant_is_container; ///
private alias c_g_variant_is_floatingFn = extern(C) gboolean function(GVariant* value) nothrow;
__gshared c_g_variant_is_floatingFn c_g_variant_is_floating; ///
private alias c_g_variant_is_normal_formFn = extern(C) gboolean function(GVariant* value) nothrow;
__gshared c_g_variant_is_normal_formFn c_g_variant_is_normal_form; ///
private alias c_g_variant_is_of_typeFn = extern(C) gboolean function(GVariant* value, const(GVariantType)* type) nothrow;
__gshared c_g_variant_is_of_typeFn c_g_variant_is_of_type; ///
private alias c_g_variant_iter_newFn = extern(C) GVariantIter* function(GVariant* value) nothrow;
__gshared c_g_variant_iter_newFn c_g_variant_iter_new; ///
private alias c_g_variant_lookupFn = extern(C) gboolean function(GVariant* dictionary, const(char)* key, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_lookupFn c_g_variant_lookup; ///
private alias c_g_variant_lookup_valueFn = extern(C) GVariant* function(GVariant* dictionary, const(char)* key, const(GVariantType)* expectedType) nothrow;
__gshared c_g_variant_lookup_valueFn c_g_variant_lookup_value; ///
private alias c_g_variant_n_childrenFn = extern(C) size_t function(GVariant* value) nothrow;
__gshared c_g_variant_n_childrenFn c_g_variant_n_children; ///
private alias c_g_variant_printFn = extern(C) char* function(GVariant* value, gboolean typeAnnotate) nothrow;
__gshared c_g_variant_printFn c_g_variant_print; ///
private alias c_g_variant_print_stringFn = extern(C) GString* function(GVariant* value, GString* string_, gboolean typeAnnotate) nothrow;
__gshared c_g_variant_print_stringFn c_g_variant_print_string; ///
private alias c_g_variant_refFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_refFn c_g_variant_ref; ///
private alias c_g_variant_ref_sinkFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_ref_sinkFn c_g_variant_ref_sink; ///
private alias c_g_variant_storeFn = extern(C) void function(GVariant* value, void* data) nothrow;
__gshared c_g_variant_storeFn c_g_variant_store; ///
private alias c_g_variant_take_refFn = extern(C) GVariant* function(GVariant* value) nothrow;
__gshared c_g_variant_take_refFn c_g_variant_take_ref; ///
private alias c_g_variant_unrefFn = extern(C) void function(GVariant* value) nothrow;
__gshared c_g_variant_unrefFn c_g_variant_unref; ///
private alias c_g_variant_is_object_pathFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_variant_is_object_pathFn c_g_variant_is_object_path; ///
private alias c_g_variant_is_signatureFn = extern(C) gboolean function(const(char)* string_) nothrow;
__gshared c_g_variant_is_signatureFn c_g_variant_is_signature; ///
private alias c_g_variant_parseFn = extern(C) GVariant* function(const(GVariantType)* type, const(char)* text, const(char)* limit, const(char*)* endptr, GError** _err) nothrow;
__gshared c_g_variant_parseFn c_g_variant_parse; ///
private alias c_g_variant_parse_error_print_contextFn = extern(C) char* function(GError* error, const(char)* sourceStr) nothrow;
__gshared c_g_variant_parse_error_print_contextFn c_g_variant_parse_error_print_context; ///
private alias c_g_variant_parse_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_variant_parse_error_quarkFn c_g_variant_parse_error_quark; ///
private alias c_g_variant_parser_get_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_variant_parser_get_error_quarkFn c_g_variant_parser_get_error_quark; ///

// VariantBuilder
private alias c_g_variant_builder_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_variant_builder_get_typeFn c_g_variant_builder_get_type; ///
private alias c_g_variant_builder_newFn = extern(C) GVariantBuilder* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_builder_newFn c_g_variant_builder_new; ///
private alias c_g_variant_builder_addFn = extern(C) void function(GVariantBuilder* builder, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_builder_addFn c_g_variant_builder_add; ///
private alias c_g_variant_builder_add_parsedFn = extern(C) void function(GVariantBuilder* builder, const(char)* format,  ...) nothrow;
__gshared c_g_variant_builder_add_parsedFn c_g_variant_builder_add_parsed; ///
private alias c_g_variant_builder_add_valueFn = extern(C) void function(GVariantBuilder* builder, GVariant* value) nothrow;
__gshared c_g_variant_builder_add_valueFn c_g_variant_builder_add_value; ///
private alias c_g_variant_builder_clearFn = extern(C) void function(GVariantBuilder* builder) nothrow;
__gshared c_g_variant_builder_clearFn c_g_variant_builder_clear; ///
private alias c_g_variant_builder_closeFn = extern(C) void function(GVariantBuilder* builder) nothrow;
__gshared c_g_variant_builder_closeFn c_g_variant_builder_close; ///
private alias c_g_variant_builder_endFn = extern(C) GVariant* function(GVariantBuilder* builder) nothrow;
__gshared c_g_variant_builder_endFn c_g_variant_builder_end; ///
private alias c_g_variant_builder_initFn = extern(C) void function(GVariantBuilder* builder, const(GVariantType)* type) nothrow;
__gshared c_g_variant_builder_initFn c_g_variant_builder_init; ///
private alias c_g_variant_builder_init_staticFn = extern(C) void function(GVariantBuilder* builder, const(GVariantType)* type) nothrow;
__gshared c_g_variant_builder_init_staticFn c_g_variant_builder_init_static; ///
private alias c_g_variant_builder_openFn = extern(C) void function(GVariantBuilder* builder, const(GVariantType)* type) nothrow;
__gshared c_g_variant_builder_openFn c_g_variant_builder_open; ///
private alias c_g_variant_builder_refFn = extern(C) GVariantBuilder* function(GVariantBuilder* builder) nothrow;
__gshared c_g_variant_builder_refFn c_g_variant_builder_ref; ///
private alias c_g_variant_builder_unrefFn = extern(C) void function(GVariantBuilder* builder) nothrow;
__gshared c_g_variant_builder_unrefFn c_g_variant_builder_unref; ///

// VariantDict
private alias c_g_variant_dict_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_variant_dict_get_typeFn c_g_variant_dict_get_type; ///
private alias c_g_variant_dict_newFn = extern(C) GVariantDict* function(GVariant* fromAsv) nothrow;
__gshared c_g_variant_dict_newFn c_g_variant_dict_new; ///
private alias c_g_variant_dict_clearFn = extern(C) void function(GVariantDict* dict) nothrow;
__gshared c_g_variant_dict_clearFn c_g_variant_dict_clear; ///
private alias c_g_variant_dict_containsFn = extern(C) gboolean function(GVariantDict* dict, const(char)* key) nothrow;
__gshared c_g_variant_dict_containsFn c_g_variant_dict_contains; ///
private alias c_g_variant_dict_endFn = extern(C) GVariant* function(GVariantDict* dict) nothrow;
__gshared c_g_variant_dict_endFn c_g_variant_dict_end; ///
private alias c_g_variant_dict_initFn = extern(C) void function(GVariantDict* dict, GVariant* fromAsv) nothrow;
__gshared c_g_variant_dict_initFn c_g_variant_dict_init; ///
private alias c_g_variant_dict_insertFn = extern(C) void function(GVariantDict* dict, const(char)* key, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_dict_insertFn c_g_variant_dict_insert; ///
private alias c_g_variant_dict_insert_valueFn = extern(C) void function(GVariantDict* dict, const(char)* key, GVariant* value) nothrow;
__gshared c_g_variant_dict_insert_valueFn c_g_variant_dict_insert_value; ///
private alias c_g_variant_dict_lookupFn = extern(C) gboolean function(GVariantDict* dict, const(char)* key, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_dict_lookupFn c_g_variant_dict_lookup; ///
private alias c_g_variant_dict_lookup_valueFn = extern(C) GVariant* function(GVariantDict* dict, const(char)* key, const(GVariantType)* expectedType) nothrow;
__gshared c_g_variant_dict_lookup_valueFn c_g_variant_dict_lookup_value; ///
private alias c_g_variant_dict_refFn = extern(C) GVariantDict* function(GVariantDict* dict) nothrow;
__gshared c_g_variant_dict_refFn c_g_variant_dict_ref; ///
private alias c_g_variant_dict_removeFn = extern(C) gboolean function(GVariantDict* dict, const(char)* key) nothrow;
__gshared c_g_variant_dict_removeFn c_g_variant_dict_remove; ///
private alias c_g_variant_dict_unrefFn = extern(C) void function(GVariantDict* dict) nothrow;
__gshared c_g_variant_dict_unrefFn c_g_variant_dict_unref; ///

// VariantIter
private alias c_g_variant_iter_copyFn = extern(C) GVariantIter* function(GVariantIter* iter) nothrow;
__gshared c_g_variant_iter_copyFn c_g_variant_iter_copy; ///
private alias c_g_variant_iter_freeFn = extern(C) void function(GVariantIter* iter) nothrow;
__gshared c_g_variant_iter_freeFn c_g_variant_iter_free; ///
private alias c_g_variant_iter_initFn = extern(C) size_t function(GVariantIter* iter, GVariant* value) nothrow;
__gshared c_g_variant_iter_initFn c_g_variant_iter_init; ///
private alias c_g_variant_iter_loopFn = extern(C) gboolean function(GVariantIter* iter, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_iter_loopFn c_g_variant_iter_loop; ///
private alias c_g_variant_iter_n_childrenFn = extern(C) size_t function(GVariantIter* iter) nothrow;
__gshared c_g_variant_iter_n_childrenFn c_g_variant_iter_n_children; ///
private alias c_g_variant_iter_nextFn = extern(C) gboolean function(GVariantIter* iter, const(char)* formatString,  ...) nothrow;
__gshared c_g_variant_iter_nextFn c_g_variant_iter_next; ///
private alias c_g_variant_iter_next_valueFn = extern(C) GVariant* function(GVariantIter* iter) nothrow;
__gshared c_g_variant_iter_next_valueFn c_g_variant_iter_next_value; ///

// VariantType
private alias c_g_variant_type_get_gtypeFn = extern(C) GType function() nothrow;
__gshared c_g_variant_type_get_gtypeFn c_g_variant_type_get_gtype; ///
private alias c_g_variant_type_newFn = extern(C) GVariantType* function(const(char)* typeString) nothrow;
__gshared c_g_variant_type_newFn c_g_variant_type_new; ///
private alias c_g_variant_type_new_arrayFn = extern(C) GVariantType* function(const(GVariantType)* element) nothrow;
__gshared c_g_variant_type_new_arrayFn c_g_variant_type_new_array; ///
private alias c_g_variant_type_new_dict_entryFn = extern(C) GVariantType* function(const(GVariantType)* key, const(GVariantType)* value) nothrow;
__gshared c_g_variant_type_new_dict_entryFn c_g_variant_type_new_dict_entry; ///
private alias c_g_variant_type_new_maybeFn = extern(C) GVariantType* function(const(GVariantType)* element) nothrow;
__gshared c_g_variant_type_new_maybeFn c_g_variant_type_new_maybe; ///
private alias c_g_variant_type_new_tupleFn = extern(C) GVariantType* function(const(GVariantType*)* items, int length) nothrow;
__gshared c_g_variant_type_new_tupleFn c_g_variant_type_new_tuple; ///
private alias c_g_variant_type_copyFn = extern(C) GVariantType* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_copyFn c_g_variant_type_copy; ///
private alias c_g_variant_type_dup_stringFn = extern(C) char* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_dup_stringFn c_g_variant_type_dup_string; ///
private alias c_g_variant_type_elementFn = extern(C) const(GVariantType)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_elementFn c_g_variant_type_element; ///
private alias c_g_variant_type_equalFn = extern(C) gboolean function(GVariantType* type1, GVariantType* type2) nothrow;
__gshared c_g_variant_type_equalFn c_g_variant_type_equal; ///
private alias c_g_variant_type_firstFn = extern(C) const(GVariantType)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_firstFn c_g_variant_type_first; ///
private alias c_g_variant_type_freeFn = extern(C) void function(GVariantType* type) nothrow;
__gshared c_g_variant_type_freeFn c_g_variant_type_free; ///
private alias c_g_variant_type_get_string_lengthFn = extern(C) size_t function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_get_string_lengthFn c_g_variant_type_get_string_length; ///
private alias c_g_variant_type_hashFn = extern(C) uint function(GVariantType* type) nothrow;
__gshared c_g_variant_type_hashFn c_g_variant_type_hash; ///
private alias c_g_variant_type_is_arrayFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_arrayFn c_g_variant_type_is_array; ///
private alias c_g_variant_type_is_basicFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_basicFn c_g_variant_type_is_basic; ///
private alias c_g_variant_type_is_containerFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_containerFn c_g_variant_type_is_container; ///
private alias c_g_variant_type_is_definiteFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_definiteFn c_g_variant_type_is_definite; ///
private alias c_g_variant_type_is_dict_entryFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_dict_entryFn c_g_variant_type_is_dict_entry; ///
private alias c_g_variant_type_is_maybeFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_maybeFn c_g_variant_type_is_maybe; ///
private alias c_g_variant_type_is_subtype_ofFn = extern(C) gboolean function(const(GVariantType)* type, const(GVariantType)* supertype) nothrow;
__gshared c_g_variant_type_is_subtype_ofFn c_g_variant_type_is_subtype_of; ///
private alias c_g_variant_type_is_tupleFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_tupleFn c_g_variant_type_is_tuple; ///
private alias c_g_variant_type_is_variantFn = extern(C) gboolean function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_is_variantFn c_g_variant_type_is_variant; ///
private alias c_g_variant_type_keyFn = extern(C) const(GVariantType)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_keyFn c_g_variant_type_key; ///
private alias c_g_variant_type_n_itemsFn = extern(C) size_t function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_n_itemsFn c_g_variant_type_n_items; ///
private alias c_g_variant_type_nextFn = extern(C) const(GVariantType)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_nextFn c_g_variant_type_next; ///
private alias c_g_variant_type_peek_stringFn = extern(C) const(char)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_peek_stringFn c_g_variant_type_peek_string; ///
private alias c_g_variant_type_valueFn = extern(C) const(GVariantType)* function(const(GVariantType)* type) nothrow;
__gshared c_g_variant_type_valueFn c_g_variant_type_value; ///
private alias c_g_variant_type_checked_Fn = extern(C) const(GVariantType)* function(const(char)* typeString) nothrow;
__gshared c_g_variant_type_checked_Fn c_g_variant_type_checked_; ///
private alias c_g_variant_type_string_get_depth_Fn = extern(C) size_t function(const(char)* typeString) nothrow;
__gshared c_g_variant_type_string_get_depth_Fn c_g_variant_type_string_get_depth_; ///
private alias c_g_variant_type_string_is_validFn = extern(C) gboolean function(const(char)* typeString) nothrow;
__gshared c_g_variant_type_string_is_validFn c_g_variant_type_string_is_valid; ///
private alias c_g_variant_type_string_scanFn = extern(C) gboolean function(const(char)* string_, const(char)* limit, const(char*)* endptr) nothrow;
__gshared c_g_variant_type_string_scanFn c_g_variant_type_string_scan; ///

// global
private alias c_g_accessFn = extern(C) int function(const(char)* filename, int mode) nothrow;
__gshared c_g_accessFn c_g_access; ///
private alias c_g_aligned_allocFn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes, size_t alignment) nothrow;
__gshared c_g_aligned_allocFn c_g_aligned_alloc; ///
private alias c_g_aligned_alloc0Fn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes, size_t alignment) nothrow;
__gshared c_g_aligned_alloc0Fn c_g_aligned_alloc0; ///
private alias c_g_aligned_freeFn = extern(C) void function(void* mem) nothrow;
__gshared c_g_aligned_freeFn c_g_aligned_free; ///
private alias c_g_aligned_free_sizedFn = extern(C) void function(void* mem, size_t alignment, size_t size) nothrow;
__gshared c_g_aligned_free_sizedFn c_g_aligned_free_sized; ///
private alias c_g_ascii_digit_valueFn = extern(C) int function(char c) nothrow;
__gshared c_g_ascii_digit_valueFn c_g_ascii_digit_value; ///
private alias c_g_ascii_dtostrFn = extern(C) char* function(char* buffer, int bufLen, double d) nothrow;
__gshared c_g_ascii_dtostrFn c_g_ascii_dtostr; ///
private alias c_g_ascii_formatdFn = extern(C) char* function(char* buffer, int bufLen, const(char)* format, double d) nothrow;
__gshared c_g_ascii_formatdFn c_g_ascii_formatd; ///
private alias c_g_ascii_strcasecmpFn = extern(C) int function(const(char)* s1, const(char)* s2) nothrow;
__gshared c_g_ascii_strcasecmpFn c_g_ascii_strcasecmp; ///
private alias c_g_ascii_strdownFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_ascii_strdownFn c_g_ascii_strdown; ///
private alias c_g_ascii_string_to_signedFn = extern(C) gboolean function(const(char)* str, uint base, long min, long max, long* outNum, GError** _err) nothrow;
__gshared c_g_ascii_string_to_signedFn c_g_ascii_string_to_signed; ///
private alias c_g_ascii_string_to_unsignedFn = extern(C) gboolean function(const(char)* str, uint base, ulong min, ulong max, ulong* outNum, GError** _err) nothrow;
__gshared c_g_ascii_string_to_unsignedFn c_g_ascii_string_to_unsigned; ///
private alias c_g_ascii_strncasecmpFn = extern(C) int function(const(char)* s1, const(char)* s2, size_t n) nothrow;
__gshared c_g_ascii_strncasecmpFn c_g_ascii_strncasecmp; ///
private alias c_g_ascii_strtodFn = extern(C) double function(const(char)* nptr, char** endptr) nothrow;
__gshared c_g_ascii_strtodFn c_g_ascii_strtod; ///
private alias c_g_ascii_strtollFn = extern(C) long function(const(char)* nptr, char** endptr, uint base) nothrow;
__gshared c_g_ascii_strtollFn c_g_ascii_strtoll; ///
private alias c_g_ascii_strtoullFn = extern(C) ulong function(const(char)* nptr, char** endptr, uint base) nothrow;
__gshared c_g_ascii_strtoullFn c_g_ascii_strtoull; ///
private alias c_g_ascii_strupFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_ascii_strupFn c_g_ascii_strup; ///
private alias c_g_ascii_tolowerFn = extern(C) char function(char c) nothrow;
__gshared c_g_ascii_tolowerFn c_g_ascii_tolower; ///
private alias c_g_ascii_toupperFn = extern(C) char function(char c) nothrow;
__gshared c_g_ascii_toupperFn c_g_ascii_toupper; ///
private alias c_g_ascii_xdigit_valueFn = extern(C) int function(char c) nothrow;
__gshared c_g_ascii_xdigit_valueFn c_g_ascii_xdigit_value; ///
private alias c_g_assert_warningFn = extern(C) void function(const(char)* logDomain, const(char)* file, int line, const(char)* prettyFunction, const(char)* expression) nothrow;
__gshared c_g_assert_warningFn c_g_assert_warning; ///
private alias c_g_assertion_messageFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* message) nothrow;
__gshared c_g_assertion_messageFn c_g_assertion_message; ///
private alias c_g_assertion_message_cmpintFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, ulong arg1, const(char)* cmp, ulong arg2, char numtype) nothrow;
__gshared c_g_assertion_message_cmpintFn c_g_assertion_message_cmpint; ///
private alias c_g_assertion_message_cmpnumFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, real arg1, const(char)* cmp, real arg2, char numtype) nothrow;
__gshared c_g_assertion_message_cmpnumFn c_g_assertion_message_cmpnum; ///
private alias c_g_assertion_message_cmpstrFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(char)* arg1, const(char)* cmp, const(char)* arg2) nothrow;
__gshared c_g_assertion_message_cmpstrFn c_g_assertion_message_cmpstr; ///
private alias c_g_assertion_message_cmpstrvFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(char*)* arg1, const(char*)* arg2, size_t firstWrongIdx) nothrow;
__gshared c_g_assertion_message_cmpstrvFn c_g_assertion_message_cmpstrv; ///
private alias c_g_assertion_message_errorFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(GError)* error, GQuark errorDomain, int errorCode) nothrow;
__gshared c_g_assertion_message_errorFn c_g_assertion_message_error; ///
private alias c_g_assertion_message_exprFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr) nothrow;
__gshared c_g_assertion_message_exprFn c_g_assertion_message_expr; ///
private alias c_g_atexitFn = extern(C) void function(GVoidFunc func) nothrow;
__gshared c_g_atexitFn c_g_atexit; ///
private alias c_g_atomic_int_addFn = extern(C) int function(int* atomic, int val) nothrow;
__gshared c_g_atomic_int_addFn c_g_atomic_int_add; ///
private alias c_g_atomic_int_andFn = extern(C) uint function(uint* atomic, uint val) nothrow;
__gshared c_g_atomic_int_andFn c_g_atomic_int_and; ///
private alias c_g_atomic_int_compare_and_exchangeFn = extern(C) gboolean function(int* atomic, int oldval, int newval) nothrow;
__gshared c_g_atomic_int_compare_and_exchangeFn c_g_atomic_int_compare_and_exchange; ///
private alias c_g_atomic_int_compare_and_exchange_fullFn = extern(C) gboolean function(int* atomic, int oldval, int newval, int* preval) nothrow;
__gshared c_g_atomic_int_compare_and_exchange_fullFn c_g_atomic_int_compare_and_exchange_full; ///
private alias c_g_atomic_int_dec_and_testFn = extern(C) gboolean function(int* atomic) nothrow;
__gshared c_g_atomic_int_dec_and_testFn c_g_atomic_int_dec_and_test; ///
private alias c_g_atomic_int_exchangeFn = extern(C) int function(int* atomic, int newval) nothrow;
__gshared c_g_atomic_int_exchangeFn c_g_atomic_int_exchange; ///
private alias c_g_atomic_int_exchange_and_addFn = extern(C) int function(int* atomic, int val) nothrow;
__gshared c_g_atomic_int_exchange_and_addFn c_g_atomic_int_exchange_and_add; ///
private alias c_g_atomic_int_getFn = extern(C) int function(const(int)* atomic) nothrow;
__gshared c_g_atomic_int_getFn c_g_atomic_int_get; ///
private alias c_g_atomic_int_incFn = extern(C) void function(int* atomic) nothrow;
__gshared c_g_atomic_int_incFn c_g_atomic_int_inc; ///
private alias c_g_atomic_int_orFn = extern(C) uint function(uint* atomic, uint val) nothrow;
__gshared c_g_atomic_int_orFn c_g_atomic_int_or; ///
private alias c_g_atomic_int_setFn = extern(C) void function(int* atomic, int newval) nothrow;
__gshared c_g_atomic_int_setFn c_g_atomic_int_set; ///
private alias c_g_atomic_int_xorFn = extern(C) uint function(uint* atomic, uint val) nothrow;
__gshared c_g_atomic_int_xorFn c_g_atomic_int_xor; ///
private alias c_g_atomic_pointer_addFn = extern(C) ptrdiff_t function(void* atomic, ptrdiff_t val) nothrow;
__gshared c_g_atomic_pointer_addFn c_g_atomic_pointer_add; ///
private alias c_g_atomic_pointer_andFn = extern(C) size_t function(void* atomic, size_t val) nothrow;
__gshared c_g_atomic_pointer_andFn c_g_atomic_pointer_and; ///
private alias c_g_atomic_pointer_compare_and_exchangeFn = extern(C) gboolean function(void* atomic, void* oldval, void* newval) nothrow;
__gshared c_g_atomic_pointer_compare_and_exchangeFn c_g_atomic_pointer_compare_and_exchange; ///
private alias c_g_atomic_pointer_compare_and_exchange_fullFn = extern(C) gboolean function(void* atomic, void* oldval, void* newval, void* preval) nothrow;
__gshared c_g_atomic_pointer_compare_and_exchange_fullFn c_g_atomic_pointer_compare_and_exchange_full; ///
private alias c_g_atomic_pointer_exchangeFn = extern(C) void* function(void* atomic, void* newval) nothrow;
__gshared c_g_atomic_pointer_exchangeFn c_g_atomic_pointer_exchange; ///
private alias c_g_atomic_pointer_getFn = extern(C) void* function(void* atomic) nothrow;
__gshared c_g_atomic_pointer_getFn c_g_atomic_pointer_get; ///
private alias c_g_atomic_pointer_orFn = extern(C) size_t function(void* atomic, size_t val) nothrow;
__gshared c_g_atomic_pointer_orFn c_g_atomic_pointer_or; ///
private alias c_g_atomic_pointer_setFn = extern(C) void function(void* atomic, void* newval) nothrow;
__gshared c_g_atomic_pointer_setFn c_g_atomic_pointer_set; ///
private alias c_g_atomic_pointer_xorFn = extern(C) size_t function(void* atomic, size_t val) nothrow;
__gshared c_g_atomic_pointer_xorFn c_g_atomic_pointer_xor; ///
private alias c_g_atomic_rc_box_acquireFn = extern(C) void* function(void* memBlock) nothrow;
__gshared c_g_atomic_rc_box_acquireFn c_g_atomic_rc_box_acquire; ///
private alias c_g_atomic_rc_box_allocFn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_atomic_rc_box_allocFn c_g_atomic_rc_box_alloc; ///
private alias c_g_atomic_rc_box_alloc0Fn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_atomic_rc_box_alloc0Fn c_g_atomic_rc_box_alloc0; ///
private alias c_g_atomic_rc_box_dupFn = extern(C) void* function(size_t blockSize, const(void)* memBlock) nothrow;
__gshared c_g_atomic_rc_box_dupFn c_g_atomic_rc_box_dup; ///
private alias c_g_atomic_rc_box_get_sizeFn = extern(C) size_t function(void* memBlock) nothrow;
__gshared c_g_atomic_rc_box_get_sizeFn c_g_atomic_rc_box_get_size; ///
private alias c_g_atomic_rc_box_releaseFn = extern(C) void function(void* memBlock) nothrow;
__gshared c_g_atomic_rc_box_releaseFn c_g_atomic_rc_box_release; ///
private alias c_g_atomic_rc_box_release_fullFn = extern(C) void function(void* memBlock, GDestroyNotify clearFunc) nothrow;
__gshared c_g_atomic_rc_box_release_fullFn c_g_atomic_rc_box_release_full; ///
private alias c_g_atomic_ref_count_compareFn = extern(C) gboolean function(int* arc, int val) nothrow;
__gshared c_g_atomic_ref_count_compareFn c_g_atomic_ref_count_compare; ///
private alias c_g_atomic_ref_count_decFn = extern(C) gboolean function(int* arc) nothrow;
__gshared c_g_atomic_ref_count_decFn c_g_atomic_ref_count_dec; ///
private alias c_g_atomic_ref_count_incFn = extern(C) void function(int* arc) nothrow;
__gshared c_g_atomic_ref_count_incFn c_g_atomic_ref_count_inc; ///
private alias c_g_atomic_ref_count_initFn = extern(C) void function(int* arc) nothrow;
__gshared c_g_atomic_ref_count_initFn c_g_atomic_ref_count_init; ///
private alias c_g_base64_decodeFn = extern(C) ubyte* function(const(char)* text, size_t* outLen) nothrow;
__gshared c_g_base64_decodeFn c_g_base64_decode; ///
private alias c_g_base64_decode_inplaceFn = extern(C) ubyte* function(ubyte* text, size_t* outLen) nothrow;
__gshared c_g_base64_decode_inplaceFn c_g_base64_decode_inplace; ///
private alias c_g_base64_decode_stepFn = extern(C) size_t function(const(ubyte)* in_, size_t len, ubyte* out_, int* state, uint* save) nothrow;
__gshared c_g_base64_decode_stepFn c_g_base64_decode_step; ///
private alias c_g_base64_encodeFn = extern(C) char* function(const(ubyte)* data, size_t len) nothrow;
__gshared c_g_base64_encodeFn c_g_base64_encode; ///
private alias c_g_base64_encode_closeFn = extern(C) size_t function(gboolean breakLines, char* out_, int* state, int* save) nothrow;
__gshared c_g_base64_encode_closeFn c_g_base64_encode_close; ///
private alias c_g_base64_encode_stepFn = extern(C) size_t function(const(ubyte)* in_, size_t len, gboolean breakLines, char* out_, int* state, int* save) nothrow;
__gshared c_g_base64_encode_stepFn c_g_base64_encode_step; ///
private alias c_g_basenameFn = extern(C) const(char)* function(const(char)* fileName) nothrow;
__gshared c_g_basenameFn c_g_basename; ///
private alias c_g_bit_lockFn = extern(C) void function(int* address, int lockBit) nothrow;
__gshared c_g_bit_lockFn c_g_bit_lock; ///
private alias c_g_bit_lock_and_getFn = extern(C) void function(int* address, uint lockBit, int* outVal) nothrow;
__gshared c_g_bit_lock_and_getFn c_g_bit_lock_and_get; ///
private alias c_g_bit_nth_lsfFn = extern(C) int function(gulong mask, int nthBit) nothrow;
__gshared c_g_bit_nth_lsfFn c_g_bit_nth_lsf; ///
private alias c_g_bit_nth_msfFn = extern(C) int function(gulong mask, int nthBit) nothrow;
__gshared c_g_bit_nth_msfFn c_g_bit_nth_msf; ///
private alias c_g_bit_storageFn = extern(C) uint function(gulong number) nothrow;
__gshared c_g_bit_storageFn c_g_bit_storage; ///
private alias c_g_bit_trylockFn = extern(C) gboolean function(int* address, int lockBit) nothrow;
__gshared c_g_bit_trylockFn c_g_bit_trylock; ///
private alias c_g_bit_unlockFn = extern(C) void function(int* address, int lockBit) nothrow;
__gshared c_g_bit_unlockFn c_g_bit_unlock; ///
private alias c_g_bit_unlock_and_setFn = extern(C) void function(int* address, uint lockBit, int newVal, int preserveMask) nothrow;
__gshared c_g_bit_unlock_and_setFn c_g_bit_unlock_and_set; ///
private alias c_g_blow_chunksFn = extern(C) void function() nothrow;
__gshared c_g_blow_chunksFn c_g_blow_chunks; ///
private alias c_g_build_filenameFn = extern(C) char* function(const(char)* firstElement,  ...) nothrow;
__gshared c_g_build_filenameFn c_g_build_filename; ///
private alias c_g_build_filename_valistFn = extern(C) char* function(const(char)* firstElement, void** args) nothrow;
__gshared c_g_build_filename_valistFn c_g_build_filename_valist; ///
private alias c_g_build_filenamevFn = extern(C) char* function(char** args) nothrow;
__gshared c_g_build_filenamevFn c_g_build_filenamev; ///
private alias c_g_build_pathFn = extern(C) char* function(const(char)* separator, const(char)* firstElement,  ...) nothrow;
__gshared c_g_build_pathFn c_g_build_path; ///
private alias c_g_build_pathvFn = extern(C) char* function(const(char)* separator, char** args) nothrow;
__gshared c_g_build_pathvFn c_g_build_pathv; ///
private alias c_g_canonicalize_filenameFn = extern(C) char* function(const(char)* filename, const(char)* relativeTo) nothrow;
__gshared c_g_canonicalize_filenameFn c_g_canonicalize_filename; ///
private alias c_g_chdirFn = extern(C) int function(const(char)* path) nothrow;
__gshared c_g_chdirFn c_g_chdir; ///
private alias c_glib_check_versionFn = extern(C) const(char)* function(uint requiredMajor, uint requiredMinor, uint requiredMicro) nothrow;
__gshared c_glib_check_versionFn c_glib_check_version; ///
private alias c_g_child_watch_addFn = extern(C) uint function(GPid pid, GChildWatchFunc function_, void* data) nothrow;
__gshared c_g_child_watch_addFn c_g_child_watch_add; ///
private alias c_g_child_watch_add_fullFn = extern(C) uint function(int priority, GPid pid, GChildWatchFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_child_watch_add_fullFn c_g_child_watch_add_full; ///
private alias c_g_child_watch_source_newFn = extern(C) GSource* function(GPid pid) nothrow;
__gshared c_g_child_watch_source_newFn c_g_child_watch_source_new; ///
private alias c_g_chmodFn = extern(C) int function(const(char)* filename, int mode) nothrow;
__gshared c_g_chmodFn c_g_chmod; ///
private alias c_g_clear_errorFn = extern(C) void function(GError** _err) nothrow;
__gshared c_g_clear_errorFn c_g_clear_error; ///
private alias c_g_clear_handle_idFn = extern(C) void function(uint* tagPtr, GClearHandleFunc clearFunc) nothrow;
__gshared c_g_clear_handle_idFn c_g_clear_handle_id; ///
private alias c_g_clear_listFn = extern(C) void function(GList** listPtr, GDestroyNotify destroy) nothrow;
__gshared c_g_clear_listFn c_g_clear_list; ///
private alias c_g_clear_pointerFn = extern(C) void function(void** pp, GDestroyNotify destroy) nothrow;
__gshared c_g_clear_pointerFn c_g_clear_pointer; ///
private alias c_g_clear_slistFn = extern(C) void function(GSList** slistPtr, GDestroyNotify destroy) nothrow;
__gshared c_g_clear_slistFn c_g_clear_slist; ///
private alias c_g_closeFn = extern(C) gboolean function(int fd, GError** _err) nothrow;
__gshared c_g_closeFn c_g_close; ///
private alias c_g_compute_checksum_for_bytesFn = extern(C) char* function(GChecksumType checksumType, GBytes* data) nothrow;
__gshared c_g_compute_checksum_for_bytesFn c_g_compute_checksum_for_bytes; ///
private alias c_g_compute_checksum_for_dataFn = extern(C) char* function(GChecksumType checksumType, const(ubyte)* data, size_t length) nothrow;
__gshared c_g_compute_checksum_for_dataFn c_g_compute_checksum_for_data; ///
private alias c_g_compute_checksum_for_stringFn = extern(C) char* function(GChecksumType checksumType, const(char)* str, ptrdiff_t length) nothrow;
__gshared c_g_compute_checksum_for_stringFn c_g_compute_checksum_for_string; ///
private alias c_g_compute_hmac_for_bytesFn = extern(C) char* function(GChecksumType digestType, GBytes* key, GBytes* data) nothrow;
__gshared c_g_compute_hmac_for_bytesFn c_g_compute_hmac_for_bytes; ///
private alias c_g_compute_hmac_for_dataFn = extern(C) char* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen, const(ubyte)* data, size_t length) nothrow;
__gshared c_g_compute_hmac_for_dataFn c_g_compute_hmac_for_data; ///
private alias c_g_compute_hmac_for_stringFn = extern(C) char* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen, const(char)* str, ptrdiff_t length) nothrow;
__gshared c_g_compute_hmac_for_stringFn c_g_compute_hmac_for_string; ///
private alias c_g_convertFn = extern(C) ubyte* function(const(ubyte)* str, ptrdiff_t len, const(char)* toCodeset, const(char)* fromCodeset, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_convertFn c_g_convert; ///
private alias c_g_convert_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_convert_error_quarkFn c_g_convert_error_quark; ///
private alias c_g_convert_with_fallbackFn = extern(C) ubyte* function(const(ubyte)* str, ptrdiff_t len, const(char)* toCodeset, const(char)* fromCodeset, const(char)* fallback, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_convert_with_fallbackFn c_g_convert_with_fallback; ///
private alias c_g_convert_with_iconvFn = extern(C) ubyte* function(const(ubyte)* str, ptrdiff_t len, GIConv converter, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_convert_with_iconvFn c_g_convert_with_iconv; ///
private alias c_g_creatFn = extern(C) int function(const(char)* filename, int mode) nothrow;
__gshared c_g_creatFn c_g_creat; ///
private alias c_g_datalist_clearFn = extern(C) void function(GData** datalist) nothrow;
__gshared c_g_datalist_clearFn c_g_datalist_clear; ///
private alias c_g_datalist_foreachFn = extern(C) void function(GData** datalist, GDataForeachFunc func, void* userData) nothrow;
__gshared c_g_datalist_foreachFn c_g_datalist_foreach; ///
private alias c_g_datalist_get_dataFn = extern(C) void* function(GData** datalist, const(char)* key) nothrow;
__gshared c_g_datalist_get_dataFn c_g_datalist_get_data; ///
private alias c_g_datalist_get_flagsFn = extern(C) uint function(GData** datalist) nothrow;
__gshared c_g_datalist_get_flagsFn c_g_datalist_get_flags; ///
private alias c_g_datalist_id_dup_dataFn = extern(C) void* function(GData** datalist, GQuark keyId, GDuplicateFunc dupFunc, void* userData) nothrow;
__gshared c_g_datalist_id_dup_dataFn c_g_datalist_id_dup_data; ///
private alias c_g_datalist_id_get_dataFn = extern(C) void* function(GData** datalist, GQuark keyId) nothrow;
__gshared c_g_datalist_id_get_dataFn c_g_datalist_id_get_data; ///
private alias c_g_datalist_id_remove_multipleFn = extern(C) void function(GData** datalist, GQuark* keys, size_t nKeys) nothrow;
__gshared c_g_datalist_id_remove_multipleFn c_g_datalist_id_remove_multiple; ///
private alias c_g_datalist_id_remove_no_notifyFn = extern(C) void* function(GData** datalist, GQuark keyId) nothrow;
__gshared c_g_datalist_id_remove_no_notifyFn c_g_datalist_id_remove_no_notify; ///
private alias c_g_datalist_id_replace_dataFn = extern(C) gboolean function(GData** datalist, GQuark keyId, void* oldval, void* newval, GDestroyNotify destroy, GDestroyNotify* oldDestroy) nothrow;
__gshared c_g_datalist_id_replace_dataFn c_g_datalist_id_replace_data; ///
private alias c_g_datalist_id_set_data_fullFn = extern(C) void function(GData** datalist, GQuark keyId, void* data, GDestroyNotify destroyFunc) nothrow;
__gshared c_g_datalist_id_set_data_fullFn c_g_datalist_id_set_data_full; ///
private alias c_g_datalist_initFn = extern(C) void function(GData** datalist) nothrow;
__gshared c_g_datalist_initFn c_g_datalist_init; ///
private alias c_g_datalist_set_flagsFn = extern(C) void function(GData** datalist, uint flags) nothrow;
__gshared c_g_datalist_set_flagsFn c_g_datalist_set_flags; ///
private alias c_g_datalist_unset_flagsFn = extern(C) void function(GData** datalist, uint flags) nothrow;
__gshared c_g_datalist_unset_flagsFn c_g_datalist_unset_flags; ///
private alias c_g_dataset_destroyFn = extern(C) void function(const(void)* datasetLocation) nothrow;
__gshared c_g_dataset_destroyFn c_g_dataset_destroy; ///
private alias c_g_dataset_foreachFn = extern(C) void function(const(void)* datasetLocation, GDataForeachFunc func, void* userData) nothrow;
__gshared c_g_dataset_foreachFn c_g_dataset_foreach; ///
private alias c_g_dataset_id_get_dataFn = extern(C) void* function(const(void)* datasetLocation, GQuark keyId) nothrow;
__gshared c_g_dataset_id_get_dataFn c_g_dataset_id_get_data; ///
private alias c_g_dataset_id_remove_no_notifyFn = extern(C) void* function(const(void)* datasetLocation, GQuark keyId) nothrow;
__gshared c_g_dataset_id_remove_no_notifyFn c_g_dataset_id_remove_no_notify; ///
private alias c_g_dataset_id_set_data_fullFn = extern(C) void function(const(void)* datasetLocation, GQuark keyId, void* data, GDestroyNotify destroyFunc) nothrow;
__gshared c_g_dataset_id_set_data_fullFn c_g_dataset_id_set_data_full; ///
private alias c_g_dcgettextFn = extern(C) const(char)* function(const(char)* domain, const(char)* msgid, int category) nothrow;
__gshared c_g_dcgettextFn c_g_dcgettext; ///
private alias c_g_dgettextFn = extern(C) const(char)* function(const(char)* domain, const(char)* msgid) nothrow;
__gshared c_g_dgettextFn c_g_dgettext; ///
private alias c_g_direct_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_direct_equalFn c_g_direct_equal; ///
private alias c_g_direct_hashFn = extern(C) uint function(const(void)* v) nothrow;
__gshared c_g_direct_hashFn c_g_direct_hash; ///
private alias c_g_dngettextFn = extern(C) const(char)* function(const(char)* domain, const(char)* msgid, const(char)* msgidPlural, gulong n) nothrow;
__gshared c_g_dngettextFn c_g_dngettext; ///
private alias c_g_double_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_double_equalFn c_g_double_equal; ///
private alias c_g_double_hashFn = extern(C) uint function(const(void)* v) nothrow;
__gshared c_g_double_hashFn c_g_double_hash; ///
private alias c_g_dpgettextFn = extern(C) const(char)* function(const(char)* domain, const(char)* msgctxtid, size_t msgidoffset) nothrow;
__gshared c_g_dpgettextFn c_g_dpgettext; ///
private alias c_g_dpgettext2Fn = extern(C) const(char)* function(const(char)* domain, const(char)* context, const(char)* msgid) nothrow;
__gshared c_g_dpgettext2Fn c_g_dpgettext2; ///
private alias c_g_environ_getenvFn = extern(C) const(char)* function(char** envp, const(char)* variable) nothrow;
__gshared c_g_environ_getenvFn c_g_environ_getenv; ///
private alias c_g_environ_setenvFn = extern(C) char** function(char** envp, const(char)* variable, const(char)* value, gboolean overwrite) nothrow;
__gshared c_g_environ_setenvFn c_g_environ_setenv; ///
private alias c_g_environ_unsetenvFn = extern(C) char** function(char** envp, const(char)* variable) nothrow;
__gshared c_g_environ_unsetenvFn c_g_environ_unsetenv; ///
private alias c_g_file_error_from_errnoFn = extern(C) GFileError function(int errNo) nothrow;
__gshared c_g_file_error_from_errnoFn c_g_file_error_from_errno; ///
private alias c_g_file_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_file_error_quarkFn c_g_file_error_quark; ///
private alias c_g_file_get_contentsFn = extern(C) gboolean function(const(char)* filename, ubyte** contents, size_t* length, GError** _err) nothrow;
__gshared c_g_file_get_contentsFn c_g_file_get_contents; ///
private alias c_g_file_open_tmpFn = extern(C) int function(const(char)* tmpl, char** nameUsed, GError** _err) nothrow;
__gshared c_g_file_open_tmpFn c_g_file_open_tmp; ///
private alias c_g_file_read_linkFn = extern(C) char* function(const(char)* filename, GError** _err) nothrow;
__gshared c_g_file_read_linkFn c_g_file_read_link; ///
private alias c_g_file_set_contentsFn = extern(C) gboolean function(const(char)* filename, const(ubyte)* contents, ptrdiff_t length, GError** _err) nothrow;
__gshared c_g_file_set_contentsFn c_g_file_set_contents; ///
private alias c_g_file_set_contents_fullFn = extern(C) gboolean function(const(char)* filename, const(ubyte)* contents, ptrdiff_t length, GFileSetContentsFlags flags, int mode, GError** _err) nothrow;
__gshared c_g_file_set_contents_fullFn c_g_file_set_contents_full; ///
private alias c_g_file_testFn = extern(C) gboolean function(const(char)* filename, GFileTest test) nothrow;
__gshared c_g_file_testFn c_g_file_test; ///
private alias c_g_filename_display_basenameFn = extern(C) char* function(const(char)* filename) nothrow;
__gshared c_g_filename_display_basenameFn c_g_filename_display_basename; ///
private alias c_g_filename_display_nameFn = extern(C) char* function(const(char)* filename) nothrow;
__gshared c_g_filename_display_nameFn c_g_filename_display_name; ///
private alias c_g_filename_from_uriFn = extern(C) char* function(const(char)* uri, char** hostname, GError** _err) nothrow;
__gshared c_g_filename_from_uriFn c_g_filename_from_uri; ///
private alias c_g_filename_from_utf8Fn = extern(C) ubyte* function(const(ubyte)* utf8string, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_filename_from_utf8Fn c_g_filename_from_utf8; ///
private alias c_g_filename_to_uriFn = extern(C) char* function(const(char)* filename, const(char)* hostname, GError** _err) nothrow;
__gshared c_g_filename_to_uriFn c_g_filename_to_uri; ///
private alias c_g_filename_to_utf8Fn = extern(C) char* function(const(ubyte)* opsysstring, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_filename_to_utf8Fn c_g_filename_to_utf8; ///
private alias c_g_find_program_in_pathFn = extern(C) char* function(const(char)* program) nothrow;
__gshared c_g_find_program_in_pathFn c_g_find_program_in_path; ///
private alias c_g_fopenFn = extern(C) void* function(const(char)* filename, const(char)* mode) nothrow;
__gshared c_g_fopenFn c_g_fopen; ///
private alias c_g_format_sizeFn = extern(C) char* function(ulong size) nothrow;
__gshared c_g_format_sizeFn c_g_format_size; ///
private alias c_g_format_size_for_displayFn = extern(C) char* function(long size) nothrow;
__gshared c_g_format_size_for_displayFn c_g_format_size_for_display; ///
private alias c_g_format_size_fullFn = extern(C) char* function(ulong size, GFormatSizeFlags flags) nothrow;
__gshared c_g_format_size_fullFn c_g_format_size_full; ///
private alias c_g_fprintfFn = extern(C) int function(void* file, const(char)* format,  ...) nothrow;
__gshared c_g_fprintfFn c_g_fprintf; ///
private alias c_g_freeFn = extern(C) void function(void* mem) nothrow;
__gshared c_g_freeFn c_g_free; ///
private alias c_g_free_sizedFn = extern(C) void function(void* mem, size_t size) nothrow;
__gshared c_g_free_sizedFn c_g_free_sized; ///
private alias c_g_freopenFn = extern(C) void* function(const(char)* filename, const(char)* mode, void* stream) nothrow;
__gshared c_g_freopenFn c_g_freopen; ///
private alias c_g_fsyncFn = extern(C) int function(int fd) nothrow;
__gshared c_g_fsyncFn c_g_fsync; ///
private alias c_g_get_application_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_application_nameFn c_g_get_application_name; ///
private alias c_g_get_charsetFn = extern(C) gboolean function(const(char*)* charset) nothrow;
__gshared c_g_get_charsetFn c_g_get_charset; ///
private alias c_g_get_codesetFn = extern(C) char* function() nothrow;
__gshared c_g_get_codesetFn c_g_get_codeset; ///
private alias c_g_get_console_charsetFn = extern(C) gboolean function(const(char*)* charset) nothrow;
__gshared c_g_get_console_charsetFn c_g_get_console_charset; ///
private alias c_g_get_current_dirFn = extern(C) char* function() nothrow;
__gshared c_g_get_current_dirFn c_g_get_current_dir; ///
private alias c_g_get_current_timeFn = extern(C) void function(GTimeVal* result) nothrow;
__gshared c_g_get_current_timeFn c_g_get_current_time; ///
private alias c_g_get_environFn = extern(C) char** function() nothrow;
__gshared c_g_get_environFn c_g_get_environ; ///
private alias c_g_get_filename_charsetsFn = extern(C) gboolean function(const(char**)* filenameCharsets) nothrow;
__gshared c_g_get_filename_charsetsFn c_g_get_filename_charsets; ///
private alias c_g_get_home_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_home_dirFn c_g_get_home_dir; ///
private alias c_g_get_host_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_host_nameFn c_g_get_host_name; ///
private alias c_g_get_language_namesFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_get_language_namesFn c_g_get_language_names; ///
private alias c_g_get_language_names_with_categoryFn = extern(C) const(char*)* function(const(char)* categoryName) nothrow;
__gshared c_g_get_language_names_with_categoryFn c_g_get_language_names_with_category; ///
private alias c_g_get_locale_variantsFn = extern(C) char** function(const(char)* locale) nothrow;
__gshared c_g_get_locale_variantsFn c_g_get_locale_variants; ///
private alias c_g_get_monotonic_timeFn = extern(C) long function() nothrow;
__gshared c_g_get_monotonic_timeFn c_g_get_monotonic_time; ///
private alias c_g_get_monotonic_time_nsFn = extern(C) ulong function() nothrow;
__gshared c_g_get_monotonic_time_nsFn c_g_get_monotonic_time_ns; ///
private alias c_g_get_num_processorsFn = extern(C) uint function() nothrow;
__gshared c_g_get_num_processorsFn c_g_get_num_processors; ///
private alias c_g_get_os_infoFn = extern(C) char* function(const(char)* keyName) nothrow;
__gshared c_g_get_os_infoFn c_g_get_os_info; ///
private alias c_g_get_prgnameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_prgnameFn c_g_get_prgname; ///
private alias c_g_get_real_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_real_nameFn c_g_get_real_name; ///
private alias c_g_get_real_timeFn = extern(C) long function() nothrow;
__gshared c_g_get_real_timeFn c_g_get_real_time; ///
private alias c_g_get_system_config_dirsFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_get_system_config_dirsFn c_g_get_system_config_dirs; ///
private alias c_g_get_system_data_dirsFn = extern(C) const(char*)* function() nothrow;
__gshared c_g_get_system_data_dirsFn c_g_get_system_data_dirs; ///
private alias c_g_get_tmp_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_tmp_dirFn c_g_get_tmp_dir; ///
private alias c_g_get_user_cache_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_cache_dirFn c_g_get_user_cache_dir; ///
private alias c_g_get_user_config_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_config_dirFn c_g_get_user_config_dir; ///
private alias c_g_get_user_data_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_data_dirFn c_g_get_user_data_dir; ///
private alias c_g_get_user_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_nameFn c_g_get_user_name; ///
private alias c_g_get_user_runtime_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_runtime_dirFn c_g_get_user_runtime_dir; ///
private alias c_g_get_user_special_dirFn = extern(C) const(char)* function(GUserDirectory directory) nothrow;
__gshared c_g_get_user_special_dirFn c_g_get_user_special_dir; ///
private alias c_g_get_user_state_dirFn = extern(C) const(char)* function() nothrow;
__gshared c_g_get_user_state_dirFn c_g_get_user_state_dir; ///
private alias c_g_getenvFn = extern(C) const(char)* function(const(char)* variable) nothrow;
__gshared c_g_getenvFn c_g_getenv; ///
private alias c_g_hostname_is_ascii_encodedFn = extern(C) gboolean function(const(char)* hostname) nothrow;
__gshared c_g_hostname_is_ascii_encodedFn c_g_hostname_is_ascii_encoded; ///
private alias c_g_hostname_is_ip_addressFn = extern(C) gboolean function(const(char)* hostname) nothrow;
__gshared c_g_hostname_is_ip_addressFn c_g_hostname_is_ip_address; ///
private alias c_g_hostname_is_non_asciiFn = extern(C) gboolean function(const(char)* hostname) nothrow;
__gshared c_g_hostname_is_non_asciiFn c_g_hostname_is_non_ascii; ///
private alias c_g_hostname_to_asciiFn = extern(C) char* function(const(char)* hostname) nothrow;
__gshared c_g_hostname_to_asciiFn c_g_hostname_to_ascii; ///
private alias c_g_hostname_to_unicodeFn = extern(C) char* function(const(char)* hostname) nothrow;
__gshared c_g_hostname_to_unicodeFn c_g_hostname_to_unicode; ///
private alias c_g_iconvFn = extern(C) size_t function(GIConv converter, char** inbuf, size_t* inbytesLeft, char** outbuf, size_t* outbytesLeft) nothrow;
__gshared c_g_iconvFn c_g_iconv; ///
private alias c_g_idle_addFn = extern(C) uint function(GSourceFunc function_, void* data) nothrow;
__gshared c_g_idle_addFn c_g_idle_add; ///
private alias c_g_idle_add_fullFn = extern(C) uint function(int priority, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_idle_add_fullFn c_g_idle_add_full; ///
private alias c_g_idle_add_onceFn = extern(C) uint function(GSourceOnceFunc function_, void* data) nothrow;
__gshared c_g_idle_add_onceFn c_g_idle_add_once; ///
private alias c_g_idle_remove_by_dataFn = extern(C) gboolean function(void* data) nothrow;
__gshared c_g_idle_remove_by_dataFn c_g_idle_remove_by_data; ///
private alias c_g_idle_source_newFn = extern(C) GSource* function() nothrow;
__gshared c_g_idle_source_newFn c_g_idle_source_new; ///
private alias c_g_int64_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_int64_equalFn c_g_int64_equal; ///
private alias c_g_int64_hashFn = extern(C) uint function(const(void)* v) nothrow;
__gshared c_g_int64_hashFn c_g_int64_hash; ///
private alias c_g_int_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_int_equalFn c_g_int_equal; ///
private alias c_g_int_hashFn = extern(C) uint function(const(void)* v) nothrow;
__gshared c_g_int_hashFn c_g_int_hash; ///
private alias c_g_intern_static_stringFn = extern(C) const(char)* function(const(char)* string_) nothrow;
__gshared c_g_intern_static_stringFn c_g_intern_static_string; ///
private alias c_g_intern_stringFn = extern(C) const(char)* function(const(char)* string_) nothrow;
__gshared c_g_intern_stringFn c_g_intern_string; ///
private alias c_g_io_add_watchFn = extern(C) uint function(GIOChannel* channel, GIOCondition condition, GIOFunc func, void* userData) nothrow;
__gshared c_g_io_add_watchFn c_g_io_add_watch; ///
private alias c_g_io_add_watch_fullFn = extern(C) uint function(GIOChannel* channel, int priority, GIOCondition condition, GIOFunc func, void* userData, GDestroyNotify notify) nothrow;
__gshared c_g_io_add_watch_fullFn c_g_io_add_watch_full; ///
private alias c_g_io_create_watchFn = extern(C) GSource* function(GIOChannel* channel, GIOCondition condition) nothrow;
__gshared c_g_io_create_watchFn c_g_io_create_watch; ///
private alias c_g_listenvFn = extern(C) char** function() nothrow;
__gshared c_g_listenvFn c_g_listenv; ///
private alias c_g_locale_from_utf8Fn = extern(C) ubyte* function(const(ubyte)* utf8string, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_locale_from_utf8Fn c_g_locale_from_utf8; ///
private alias c_g_locale_to_utf8Fn = extern(C) char* function(const(ubyte)* opsysstring, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) nothrow;
__gshared c_g_locale_to_utf8Fn c_g_locale_to_utf8; ///
private alias c_g_logFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* format,  ...) nothrow;
__gshared c_g_logFn c_g_log; ///
private alias c_g_log_default_handlerFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* unusedData) nothrow;
__gshared c_g_log_default_handlerFn c_g_log_default_handler; ///
private alias c_g_log_get_always_fatalFn = extern(C) GLogLevelFlags function() nothrow;
__gshared c_g_log_get_always_fatalFn c_g_log_get_always_fatal; ///
private alias c_g_log_get_debug_enabledFn = extern(C) gboolean function() nothrow;
__gshared c_g_log_get_debug_enabledFn c_g_log_get_debug_enabled; ///
private alias c_g_log_remove_handlerFn = extern(C) void function(const(char)* logDomain, uint handlerId) nothrow;
__gshared c_g_log_remove_handlerFn c_g_log_remove_handler; ///
private alias c_g_log_set_always_fatalFn = extern(C) GLogLevelFlags function(GLogLevelFlags fatalMask) nothrow;
__gshared c_g_log_set_always_fatalFn c_g_log_set_always_fatal; ///
private alias c_g_log_set_debug_enabledFn = extern(C) void function(gboolean enabled) nothrow;
__gshared c_g_log_set_debug_enabledFn c_g_log_set_debug_enabled; ///
private alias c_g_log_set_default_handlerFn = extern(C) GLogFunc function(GLogFunc logFunc, void* userData) nothrow;
__gshared c_g_log_set_default_handlerFn c_g_log_set_default_handler; ///
private alias c_g_log_set_fatal_maskFn = extern(C) GLogLevelFlags function(const(char)* logDomain, GLogLevelFlags fatalMask) nothrow;
__gshared c_g_log_set_fatal_maskFn c_g_log_set_fatal_mask; ///
private alias c_g_log_set_handlerFn = extern(C) uint function(const(char)* logDomain, GLogLevelFlags logLevels, GLogFunc logFunc, void* userData) nothrow;
__gshared c_g_log_set_handlerFn c_g_log_set_handler; ///
private alias c_g_log_set_handler_fullFn = extern(C) uint function(const(char)* logDomain, GLogLevelFlags logLevels, GLogFunc logFunc, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_g_log_set_handler_fullFn c_g_log_set_handler_full; ///
private alias c_g_log_set_writer_funcFn = extern(C) void function(GLogWriterFunc func, void* userData, GDestroyNotify userDataFree) nothrow;
__gshared c_g_log_set_writer_funcFn c_g_log_set_writer_func; ///
private alias c_g_log_structuredFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel,  ...) nothrow;
__gshared c_g_log_structuredFn c_g_log_structured; ///
private alias c_g_log_structured_arrayFn = extern(C) void function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields) nothrow;
__gshared c_g_log_structured_arrayFn c_g_log_structured_array; ///
private alias c_g_log_structured_standardFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* file, const(char)* line, const(char)* func, const(char)* messageFormat,  ...) nothrow;
__gshared c_g_log_structured_standardFn c_g_log_structured_standard; ///
private alias c_g_log_variantFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, GVariant* fields) nothrow;
__gshared c_g_log_variantFn c_g_log_variant; ///
private alias c_g_log_writer_defaultFn = extern(C) GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) nothrow;
__gshared c_g_log_writer_defaultFn c_g_log_writer_default; ///
private alias c_g_log_writer_default_set_debug_domainsFn = extern(C) void function(const(char*)* domains) nothrow;
__gshared c_g_log_writer_default_set_debug_domainsFn c_g_log_writer_default_set_debug_domains; ///
private alias c_g_log_writer_default_set_use_stderrFn = extern(C) void function(gboolean useStderr) nothrow;
__gshared c_g_log_writer_default_set_use_stderrFn c_g_log_writer_default_set_use_stderr; ///
private alias c_g_log_writer_default_would_dropFn = extern(C) gboolean function(GLogLevelFlags logLevel, const(char)* logDomain) nothrow;
__gshared c_g_log_writer_default_would_dropFn c_g_log_writer_default_would_drop; ///
private alias c_g_log_writer_format_fieldsFn = extern(C) char* function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, gboolean useColor) nothrow;
__gshared c_g_log_writer_format_fieldsFn c_g_log_writer_format_fields; ///
private alias c_g_log_writer_is_journaldFn = extern(C) gboolean function(int outputFd) nothrow;
__gshared c_g_log_writer_is_journaldFn c_g_log_writer_is_journald; ///
private alias c_g_log_writer_journaldFn = extern(C) GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) nothrow;
__gshared c_g_log_writer_journaldFn c_g_log_writer_journald; ///
private alias c_g_log_writer_standard_streamsFn = extern(C) GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) nothrow;
__gshared c_g_log_writer_standard_streamsFn c_g_log_writer_standard_streams; ///
private alias c_g_log_writer_supports_colorFn = extern(C) gboolean function(int outputFd) nothrow;
__gshared c_g_log_writer_supports_colorFn c_g_log_writer_supports_color; ///
private alias c_g_log_writer_syslogFn = extern(C) GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) nothrow;
__gshared c_g_log_writer_syslogFn c_g_log_writer_syslog; ///
private alias c_g_logvFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* format, void* args) nothrow;
__gshared c_g_logvFn c_g_logv; ///
private alias c_g_lstatFn = extern(C) int function(const(char)* filename, GStatBuf* buf) nothrow;
__gshared c_g_lstatFn c_g_lstat; ///
private alias c_g_main_current_sourceFn = extern(C) GSource* function() nothrow;
__gshared c_g_main_current_sourceFn c_g_main_current_source; ///
private alias c_g_main_depthFn = extern(C) int function() nothrow;
__gshared c_g_main_depthFn c_g_main_depth; ///
private alias c_g_mallocFn = extern(C) void* function(size_t nBytes) nothrow;
__gshared c_g_mallocFn c_g_malloc; ///
private alias c_g_malloc0Fn = extern(C) void* function(size_t nBytes) nothrow;
__gshared c_g_malloc0Fn c_g_malloc0; ///
private alias c_g_malloc0_nFn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_malloc0_nFn c_g_malloc0_n; ///
private alias c_g_malloc_nFn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_malloc_nFn c_g_malloc_n; ///
private alias c_g_markup_collect_attributesFn = extern(C) gboolean function(const(char)* elementName, const(char*)* attributeNames, const(char*)* attributeValues, GError** error, GMarkupCollectType firstType, const(char)* firstAttr,  ...) nothrow;
__gshared c_g_markup_collect_attributesFn c_g_markup_collect_attributes; ///
private alias c_g_markup_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_markup_error_quarkFn c_g_markup_error_quark; ///
private alias c_g_markup_escape_textFn = extern(C) char* function(const(char)* text, ptrdiff_t length) nothrow;
__gshared c_g_markup_escape_textFn c_g_markup_escape_text; ///
private alias c_g_markup_printf_escapedFn = extern(C) char* function(const(char)* format,  ...) nothrow;
__gshared c_g_markup_printf_escapedFn c_g_markup_printf_escaped; ///
private alias c_g_markup_vprintf_escapedFn = extern(C) char* function(const(char)* format, void* args) nothrow;
__gshared c_g_markup_vprintf_escapedFn c_g_markup_vprintf_escaped; ///
private alias c_g_mem_is_system_mallocFn = extern(C) gboolean function() nothrow;
__gshared c_g_mem_is_system_mallocFn c_g_mem_is_system_malloc; ///
private alias c_g_mem_profileFn = extern(C) void function() nothrow;
__gshared c_g_mem_profileFn c_g_mem_profile; ///
private alias c_g_mem_set_vtableFn = extern(C) void function(GMemVTable* vtable) nothrow;
__gshared c_g_mem_set_vtableFn c_g_mem_set_vtable; ///
private alias c_g_memdupFn = extern(C) void* function(const(void)* mem, uint byteSize) nothrow;
__gshared c_g_memdupFn c_g_memdup; ///
private alias c_g_memdup2Fn = extern(C) void* function(const(void)* mem, size_t byteSize) nothrow;
__gshared c_g_memdup2Fn c_g_memdup2; ///
private alias c_g_mkdirFn = extern(C) int function(const(char)* filename, int mode) nothrow;
__gshared c_g_mkdirFn c_g_mkdir; ///
private alias c_g_mkdir_with_parentsFn = extern(C) int function(const(char)* pathname, int mode) nothrow;
__gshared c_g_mkdir_with_parentsFn c_g_mkdir_with_parents; ///
private alias c_g_mkdtempFn = extern(C) char* function(char* tmpl) nothrow;
__gshared c_g_mkdtempFn c_g_mkdtemp; ///
private alias c_g_mkdtemp_fullFn = extern(C) char* function(char* tmpl, int mode) nothrow;
__gshared c_g_mkdtemp_fullFn c_g_mkdtemp_full; ///
private alias c_g_mkstempFn = extern(C) int function(char* tmpl) nothrow;
__gshared c_g_mkstempFn c_g_mkstemp; ///
private alias c_g_mkstemp_fullFn = extern(C) int function(char* tmpl, int flags, int mode) nothrow;
__gshared c_g_mkstemp_fullFn c_g_mkstemp_full; ///
private alias c_g_nullify_pointerFn = extern(C) void function(void** nullifyLocation) nothrow;
__gshared c_g_nullify_pointerFn c_g_nullify_pointer; ///
private alias c_g_number_parser_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_number_parser_error_quarkFn c_g_number_parser_error_quark; ///
private alias c_g_on_error_queryFn = extern(C) void function(const(char)* prgName) nothrow;
__gshared c_g_on_error_queryFn c_g_on_error_query; ///
private alias c_g_on_error_stack_traceFn = extern(C) void function(const(char)* prgName) nothrow;
__gshared c_g_on_error_stack_traceFn c_g_on_error_stack_trace; ///
private alias c_g_openFn = extern(C) int function(const(char)* filename, int flags, int mode) nothrow;
__gshared c_g_openFn c_g_open; ///
private alias c_g_option_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_option_error_quarkFn c_g_option_error_quark; ///
private alias c_g_parse_debug_stringFn = extern(C) uint function(const(char)* string_, const(GDebugKey)* keys, uint nkeys) nothrow;
__gshared c_g_parse_debug_stringFn c_g_parse_debug_string; ///
private alias c_g_path_get_basenameFn = extern(C) char* function(const(char)* fileName) nothrow;
__gshared c_g_path_get_basenameFn c_g_path_get_basename; ///
private alias c_g_path_get_dirnameFn = extern(C) char* function(const(char)* fileName) nothrow;
__gshared c_g_path_get_dirnameFn c_g_path_get_dirname; ///
private alias c_g_path_is_absoluteFn = extern(C) gboolean function(const(char)* fileName) nothrow;
__gshared c_g_path_is_absoluteFn c_g_path_is_absolute; ///
private alias c_g_path_skip_rootFn = extern(C) const(char)* function(const(char)* fileName) nothrow;
__gshared c_g_path_skip_rootFn c_g_path_skip_root; ///
private alias c_g_pattern_matchFn = extern(C) gboolean function(GPatternSpec* pspec, uint stringLength, const(char)* string_, const(char)* stringReversed) nothrow;
__gshared c_g_pattern_matchFn c_g_pattern_match; ///
private alias c_g_pattern_match_simpleFn = extern(C) gboolean function(const(char)* pattern, const(char)* string_) nothrow;
__gshared c_g_pattern_match_simpleFn c_g_pattern_match_simple; ///
private alias c_g_pattern_match_stringFn = extern(C) gboolean function(GPatternSpec* pspec, const(char)* string_) nothrow;
__gshared c_g_pattern_match_stringFn c_g_pattern_match_string; ///
private alias c_g_pointer_bit_lockFn = extern(C) void function(void* address, int lockBit) nothrow;
__gshared c_g_pointer_bit_lockFn c_g_pointer_bit_lock; ///
private alias c_g_pointer_bit_lock_and_getFn = extern(C) void function(void* address, uint lockBit, size_t* outPtr) nothrow;
__gshared c_g_pointer_bit_lock_and_getFn c_g_pointer_bit_lock_and_get; ///
private alias c_g_pointer_bit_lock_mask_ptrFn = extern(C) void* function(void* ptr, uint lockBit, gboolean set, size_t preserveMask, void* preservePtr) nothrow;
__gshared c_g_pointer_bit_lock_mask_ptrFn c_g_pointer_bit_lock_mask_ptr; ///
private alias c_g_pointer_bit_trylockFn = extern(C) gboolean function(void* address, int lockBit) nothrow;
__gshared c_g_pointer_bit_trylockFn c_g_pointer_bit_trylock; ///
private alias c_g_pointer_bit_unlockFn = extern(C) void function(void* address, int lockBit) nothrow;
__gshared c_g_pointer_bit_unlockFn c_g_pointer_bit_unlock; ///
private alias c_g_pointer_bit_unlock_and_setFn = extern(C) void function(void* address, uint lockBit, void* ptr, size_t preserveMask) nothrow;
__gshared c_g_pointer_bit_unlock_and_setFn c_g_pointer_bit_unlock_and_set; ///
private alias c_g_pollFn = extern(C) int function(GPollFD* fds, uint nfds, int timeout) nothrow;
__gshared c_g_pollFn c_g_poll; ///
private alias c_g_prefix_errorFn = extern(C) void function(GError** err, const(char)* format,  ...) nothrow;
__gshared c_g_prefix_errorFn c_g_prefix_error; ///
private alias c_g_prefix_error_literalFn = extern(C) void function(GError** err, const(char)* prefix) nothrow;
__gshared c_g_prefix_error_literalFn c_g_prefix_error_literal; ///
private alias c_g_printFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_printFn c_g_print; ///
private alias c_g_printerrFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_printerrFn c_g_printerr; ///
private alias c_g_printfFn = extern(C) int function(const(char)* format,  ...) nothrow;
__gshared c_g_printfFn c_g_printf; ///
private alias c_g_printf_string_upper_boundFn = extern(C) size_t function(const(char)* format, void* args) nothrow;
__gshared c_g_printf_string_upper_boundFn c_g_printf_string_upper_bound; ///
private alias c_g_propagate_errorFn = extern(C) void function(GError** dest, GError* src) nothrow;
__gshared c_g_propagate_errorFn c_g_propagate_error; ///
private alias c_g_propagate_prefixed_errorFn = extern(C) void function(GError** dest, GError* src, const(char)* format,  ...) nothrow;
__gshared c_g_propagate_prefixed_errorFn c_g_propagate_prefixed_error; ///
private alias c_g_qsort_with_dataFn = extern(C) void function(const(void)* pbase, int totalElems, size_t size, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_qsort_with_dataFn c_g_qsort_with_data; ///
private alias c_g_quark_from_static_stringFn = extern(C) GQuark function(const(char)* string_) nothrow;
__gshared c_g_quark_from_static_stringFn c_g_quark_from_static_string; ///
private alias c_g_quark_from_stringFn = extern(C) GQuark function(const(char)* string_) nothrow;
__gshared c_g_quark_from_stringFn c_g_quark_from_string; ///
private alias c_g_quark_to_stringFn = extern(C) const(char)* function(GQuark quark) nothrow;
__gshared c_g_quark_to_stringFn c_g_quark_to_string; ///
private alias c_g_quark_try_stringFn = extern(C) GQuark function(const(char)* string_) nothrow;
__gshared c_g_quark_try_stringFn c_g_quark_try_string; ///
private alias c_g_random_doubleFn = extern(C) double function() nothrow;
__gshared c_g_random_doubleFn c_g_random_double; ///
private alias c_g_random_double_rangeFn = extern(C) double function(double begin, double end) nothrow;
__gshared c_g_random_double_rangeFn c_g_random_double_range; ///
private alias c_g_random_intFn = extern(C) uint function() nothrow;
__gshared c_g_random_intFn c_g_random_int; ///
private alias c_g_random_int_rangeFn = extern(C) int function(int begin, int end) nothrow;
__gshared c_g_random_int_rangeFn c_g_random_int_range; ///
private alias c_g_random_set_seedFn = extern(C) void function(uint seed) nothrow;
__gshared c_g_random_set_seedFn c_g_random_set_seed; ///
private alias c_g_rc_box_acquireFn = extern(C) void* function(void* memBlock) nothrow;
__gshared c_g_rc_box_acquireFn c_g_rc_box_acquire; ///
private alias c_g_rc_box_allocFn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_rc_box_allocFn c_g_rc_box_alloc; ///
private alias c_g_rc_box_alloc0Fn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_rc_box_alloc0Fn c_g_rc_box_alloc0; ///
private alias c_g_rc_box_dupFn = extern(C) void* function(size_t blockSize, const(void)* memBlock) nothrow;
__gshared c_g_rc_box_dupFn c_g_rc_box_dup; ///
private alias c_g_rc_box_get_sizeFn = extern(C) size_t function(void* memBlock) nothrow;
__gshared c_g_rc_box_get_sizeFn c_g_rc_box_get_size; ///
private alias c_g_rc_box_releaseFn = extern(C) void function(void* memBlock) nothrow;
__gshared c_g_rc_box_releaseFn c_g_rc_box_release; ///
private alias c_g_rc_box_release_fullFn = extern(C) void function(void* memBlock, GDestroyNotify clearFunc) nothrow;
__gshared c_g_rc_box_release_fullFn c_g_rc_box_release_full; ///
private alias c_g_reallocFn = extern(C) void* function(void* mem, size_t nBytes) nothrow;
__gshared c_g_reallocFn c_g_realloc; ///
private alias c_g_realloc_nFn = extern(C) void* function(void* mem, size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_realloc_nFn c_g_realloc_n; ///
private alias c_g_ref_count_compareFn = extern(C) gboolean function(int* rc, int val) nothrow;
__gshared c_g_ref_count_compareFn c_g_ref_count_compare; ///
private alias c_g_ref_count_decFn = extern(C) gboolean function(int* rc) nothrow;
__gshared c_g_ref_count_decFn c_g_ref_count_dec; ///
private alias c_g_ref_count_incFn = extern(C) void function(int* rc) nothrow;
__gshared c_g_ref_count_incFn c_g_ref_count_inc; ///
private alias c_g_ref_count_initFn = extern(C) void function(int* rc) nothrow;
__gshared c_g_ref_count_initFn c_g_ref_count_init; ///
private alias c_g_ref_string_acquireFn = extern(C) char* function(char* str) nothrow;
__gshared c_g_ref_string_acquireFn c_g_ref_string_acquire; ///
private alias c_g_ref_string_equalFn = extern(C) gboolean function(const(char)* str1, const(char)* str2) nothrow;
__gshared c_g_ref_string_equalFn c_g_ref_string_equal; ///
private alias c_g_ref_string_lengthFn = extern(C) size_t function(char* str) nothrow;
__gshared c_g_ref_string_lengthFn c_g_ref_string_length; ///
private alias c_g_ref_string_newFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_ref_string_newFn c_g_ref_string_new; ///
private alias c_g_ref_string_new_internFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_ref_string_new_internFn c_g_ref_string_new_intern; ///
private alias c_g_ref_string_new_lenFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_ref_string_new_lenFn c_g_ref_string_new_len; ///
private alias c_g_ref_string_releaseFn = extern(C) void function(char* str) nothrow;
__gshared c_g_ref_string_releaseFn c_g_ref_string_release; ///
private alias c_g_reload_user_special_dirs_cacheFn = extern(C) void function() nothrow;
__gshared c_g_reload_user_special_dirs_cacheFn c_g_reload_user_special_dirs_cache; ///
private alias c_g_removeFn = extern(C) int function(const(char)* filename) nothrow;
__gshared c_g_removeFn c_g_remove; ///
private alias c_g_renameFn = extern(C) int function(const(char)* oldfilename, const(char)* newfilename) nothrow;
__gshared c_g_renameFn c_g_rename; ///
private alias c_g_return_if_fail_warningFn = extern(C) void function(const(char)* logDomain, const(char)* prettyFunction, const(char)* expression) nothrow;
__gshared c_g_return_if_fail_warningFn c_g_return_if_fail_warning; ///
private alias c_g_rmdirFn = extern(C) int function(const(char)* filename) nothrow;
__gshared c_g_rmdirFn c_g_rmdir; ///
private alias c_g_set_application_nameFn = extern(C) void function(const(char)* applicationName) nothrow;
__gshared c_g_set_application_nameFn c_g_set_application_name; ///
private alias c_g_set_errorFn = extern(C) void function(GError** err, GQuark domain, int code, const(char)* format,  ...) nothrow;
__gshared c_g_set_errorFn c_g_set_error; ///
private alias c_g_set_error_literalFn = extern(C) void function(GError** err, GQuark domain, int code, const(char)* message) nothrow;
__gshared c_g_set_error_literalFn c_g_set_error_literal; ///
private alias c_g_set_prgnameFn = extern(C) void function(const(char)* prgname) nothrow;
__gshared c_g_set_prgnameFn c_g_set_prgname; ///
private alias c_g_set_print_handlerFn = extern(C) GPrintFunc function(GPrintFunc func) nothrow;
__gshared c_g_set_print_handlerFn c_g_set_print_handler; ///
private alias c_g_set_printerr_handlerFn = extern(C) GPrintFunc function(GPrintFunc func) nothrow;
__gshared c_g_set_printerr_handlerFn c_g_set_printerr_handler; ///
private alias c_g_setenvFn = extern(C) gboolean function(const(char)* variable, const(char)* value, gboolean overwrite) nothrow;
__gshared c_g_setenvFn c_g_setenv; ///
private alias c_g_shell_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_shell_error_quarkFn c_g_shell_error_quark; ///
private alias c_g_shell_parse_argvFn = extern(C) gboolean function(const(char)* commandLine, int* argcp, char*** argvp, GError** _err) nothrow;
__gshared c_g_shell_parse_argvFn c_g_shell_parse_argv; ///
private alias c_g_shell_quoteFn = extern(C) char* function(const(char)* unquotedString) nothrow;
__gshared c_g_shell_quoteFn c_g_shell_quote; ///
private alias c_g_shell_unquoteFn = extern(C) char* function(const(char)* quotedString, GError** _err) nothrow;
__gshared c_g_shell_unquoteFn c_g_shell_unquote; ///
private alias c_g_slice_allocFn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_slice_allocFn c_g_slice_alloc; ///
private alias c_g_slice_alloc0Fn = extern(C) void* function(size_t blockSize) nothrow;
__gshared c_g_slice_alloc0Fn c_g_slice_alloc0; ///
private alias c_g_slice_copyFn = extern(C) void* function(size_t blockSize, const(void)* memBlock) nothrow;
__gshared c_g_slice_copyFn c_g_slice_copy; ///
private alias c_g_slice_free1Fn = extern(C) void function(size_t blockSize, void* memBlock) nothrow;
__gshared c_g_slice_free1Fn c_g_slice_free1; ///
private alias c_g_slice_free_chain_with_offsetFn = extern(C) void function(size_t blockSize, void* memChain, size_t nextOffset) nothrow;
__gshared c_g_slice_free_chain_with_offsetFn c_g_slice_free_chain_with_offset; ///
private alias c_g_slice_get_configFn = extern(C) long function(GSliceConfig ckey) nothrow;
__gshared c_g_slice_get_configFn c_g_slice_get_config; ///
private alias c_g_slice_get_config_stateFn = extern(C) const(long)* function(GSliceConfig ckey, long address, uint* nValues) nothrow;
__gshared c_g_slice_get_config_stateFn c_g_slice_get_config_state; ///
private alias c_g_slice_set_configFn = extern(C) void function(GSliceConfig ckey, long value) nothrow;
__gshared c_g_slice_set_configFn c_g_slice_set_config; ///
private alias c_g_snprintfFn = extern(C) int function(char* string_, gulong n, const(char)* format,  ...) nothrow;
__gshared c_g_snprintfFn c_g_snprintf; ///
private alias c_g_sort_arrayFn = extern(C) void function(void* array, size_t nElements, size_t elementSize, GCompareDataFunc compareFunc, void* userData) nothrow;
__gshared c_g_sort_arrayFn c_g_sort_array; ///
private alias c_g_spaced_primes_closestFn = extern(C) uint function(uint num) nothrow;
__gshared c_g_spaced_primes_closestFn c_g_spaced_primes_closest; ///
private alias c_g_spawn_asyncFn = extern(C) gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, GError** _err) nothrow;
__gshared c_g_spawn_asyncFn c_g_spawn_async; ///
private alias c_g_spawn_async_with_fdsFn = extern(C) gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, int stdinFd, int stdoutFd, int stderrFd, GError** _err) nothrow;
__gshared c_g_spawn_async_with_fdsFn c_g_spawn_async_with_fds; ///
private alias c_g_spawn_async_with_pipesFn = extern(C) gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, int* standardInput, int* standardOutput, int* standardError, GError** _err) nothrow;
__gshared c_g_spawn_async_with_pipesFn c_g_spawn_async_with_pipes; ///
private alias c_g_spawn_async_with_pipes_and_fdsFn = extern(C) gboolean function(const(char)* workingDirectory, const(char*)* argv, const(char*)* envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, int stdinFd, int stdoutFd, int stderrFd, const(int)* sourceFds, const(int)* targetFds, size_t nFds, GPid* childPidOut, int* stdinPipeOut, int* stdoutPipeOut, int* stderrPipeOut, GError** _err) nothrow;
__gshared c_g_spawn_async_with_pipes_and_fdsFn c_g_spawn_async_with_pipes_and_fds; ///
private alias c_g_spawn_check_exit_statusFn = extern(C) gboolean function(int waitStatus, GError** _err) nothrow;
__gshared c_g_spawn_check_exit_statusFn c_g_spawn_check_exit_status; ///
private alias c_g_spawn_check_wait_statusFn = extern(C) gboolean function(int waitStatus, GError** _err) nothrow;
__gshared c_g_spawn_check_wait_statusFn c_g_spawn_check_wait_status; ///
private alias c_g_spawn_close_pidFn = extern(C) void function(GPid pid) nothrow;
__gshared c_g_spawn_close_pidFn c_g_spawn_close_pid; ///
private alias c_g_spawn_command_line_asyncFn = extern(C) gboolean function(const(char)* commandLine, GError** _err) nothrow;
__gshared c_g_spawn_command_line_asyncFn c_g_spawn_command_line_async; ///
private alias c_g_spawn_command_line_syncFn = extern(C) gboolean function(const(char)* commandLine, char** standardOutput, char** standardError, int* waitStatus, GError** _err) nothrow;
__gshared c_g_spawn_command_line_syncFn c_g_spawn_command_line_sync; ///
private alias c_g_spawn_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_spawn_error_quarkFn c_g_spawn_error_quark; ///
private alias c_g_spawn_exit_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_g_spawn_exit_error_quarkFn c_g_spawn_exit_error_quark; ///
private alias c_g_spawn_syncFn = extern(C) gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, char** standardOutput, char** standardError, int* waitStatus, GError** _err) nothrow;
__gshared c_g_spawn_syncFn c_g_spawn_sync; ///
private alias c_g_sprintfFn = extern(C) int function(char* string_, const(char)* format,  ...) nothrow;
__gshared c_g_sprintfFn c_g_sprintf; ///
private alias c_g_statFn = extern(C) int function(const(char)* filename, GStatBuf* buf) nothrow;
__gshared c_g_statFn c_g_stat; ///
private alias c_g_stpcpyFn = extern(C) char* function(char* dest, const(char)* src) nothrow;
__gshared c_g_stpcpyFn c_g_stpcpy; ///
private alias c_g_str_equalFn = extern(C) gboolean function(const(void)* v1, const(void)* v2) nothrow;
__gshared c_g_str_equalFn c_g_str_equal; ///
private alias c_g_str_has_prefixFn = extern(C) gboolean function(const(char)* str, const(char)* prefix) nothrow;
__gshared c_g_str_has_prefixFn c_g_str_has_prefix; ///
private alias c_g_str_has_suffixFn = extern(C) gboolean function(const(char)* str, const(char)* suffix) nothrow;
__gshared c_g_str_has_suffixFn c_g_str_has_suffix; ///
private alias c_g_str_hashFn = extern(C) uint function(const(void)* v) nothrow;
__gshared c_g_str_hashFn c_g_str_hash; ///
private alias c_g_str_is_asciiFn = extern(C) gboolean function(const(char)* str) nothrow;
__gshared c_g_str_is_asciiFn c_g_str_is_ascii; ///
private alias c_g_str_match_stringFn = extern(C) gboolean function(const(char)* searchTerm, const(char)* potentialHit, gboolean acceptAlternates) nothrow;
__gshared c_g_str_match_stringFn c_g_str_match_string; ///
private alias c_g_str_to_asciiFn = extern(C) char* function(const(char)* str, const(char)* fromLocale) nothrow;
__gshared c_g_str_to_asciiFn c_g_str_to_ascii; ///
private alias c_g_str_tokenize_and_foldFn = extern(C) char** function(const(char)* string_, const(char)* translitLocale, char*** asciiAlternates) nothrow;
__gshared c_g_str_tokenize_and_foldFn c_g_str_tokenize_and_fold; ///
private alias c_g_strcanonFn = extern(C) char* function(char* string_, const(char)* validChars, char substitutor) nothrow;
__gshared c_g_strcanonFn c_g_strcanon; ///
private alias c_g_strcasecmpFn = extern(C) int function(const(char)* s1, const(char)* s2) nothrow;
__gshared c_g_strcasecmpFn c_g_strcasecmp; ///
private alias c_g_strchompFn = extern(C) char* function(char* string_) nothrow;
__gshared c_g_strchompFn c_g_strchomp; ///
private alias c_g_strchugFn = extern(C) char* function(char* string_) nothrow;
__gshared c_g_strchugFn c_g_strchug; ///
private alias c_g_strcmp0Fn = extern(C) int function(const(char)* str1, const(char)* str2) nothrow;
__gshared c_g_strcmp0Fn c_g_strcmp0; ///
private alias c_g_strcompressFn = extern(C) char* function(const(char)* source) nothrow;
__gshared c_g_strcompressFn c_g_strcompress; ///
private alias c_g_strconcatFn = extern(C) char* function(const(char)* string1,  ...) nothrow;
__gshared c_g_strconcatFn c_g_strconcat; ///
private alias c_g_strdelimitFn = extern(C) char* function(char* string_, const(char)* delimiters, char newDelimiter) nothrow;
__gshared c_g_strdelimitFn c_g_strdelimit; ///
private alias c_g_strdownFn = extern(C) char* function(char* string_) nothrow;
__gshared c_g_strdownFn c_g_strdown; ///
private alias c_g_strdupFn = extern(C) char* function(const(char)* str) nothrow;
__gshared c_g_strdupFn c_g_strdup; ///
private alias c_g_strdup_printfFn = extern(C) char* function(const(char)* format,  ...) nothrow;
__gshared c_g_strdup_printfFn c_g_strdup_printf; ///
private alias c_g_strdup_vprintfFn = extern(C) char* function(const(char)* format, void* args) nothrow;
__gshared c_g_strdup_vprintfFn c_g_strdup_vprintf; ///
private alias c_g_strdupvFn = extern(C) char** function(char** strArray) nothrow;
__gshared c_g_strdupvFn c_g_strdupv; ///
private alias c_g_strerrorFn = extern(C) const(char)* function(int errnum) nothrow;
__gshared c_g_strerrorFn c_g_strerror; ///
private alias c_g_strescapeFn = extern(C) char* function(const(char)* source, const(char)* exceptions) nothrow;
__gshared c_g_strescapeFn c_g_strescape; ///
private alias c_g_strfreevFn = extern(C) void function(char** strArray) nothrow;
__gshared c_g_strfreevFn c_g_strfreev; ///
private alias c_g_strip_contextFn = extern(C) const(char)* function(const(char)* msgid, const(char)* msgval) nothrow;
__gshared c_g_strip_contextFn c_g_strip_context; ///
private alias c_g_strjoinFn = extern(C) char* function(const(char)* separator,  ...) nothrow;
__gshared c_g_strjoinFn c_g_strjoin; ///
private alias c_g_strjoinvFn = extern(C) char* function(const(char)* separator, char** strArray) nothrow;
__gshared c_g_strjoinvFn c_g_strjoinv; ///
private alias c_g_strlcatFn = extern(C) size_t function(char* dest, const(char)* src, size_t destSize) nothrow;
__gshared c_g_strlcatFn c_g_strlcat; ///
private alias c_g_strlcpyFn = extern(C) size_t function(char* dest, const(char)* src, size_t destSize) nothrow;
__gshared c_g_strlcpyFn c_g_strlcpy; ///
private alias c_g_strncasecmpFn = extern(C) int function(const(char)* s1, const(char)* s2, uint n) nothrow;
__gshared c_g_strncasecmpFn c_g_strncasecmp; ///
private alias c_g_strndupFn = extern(C) char* function(const(char)* str, size_t n) nothrow;
__gshared c_g_strndupFn c_g_strndup; ///
private alias c_g_strnfillFn = extern(C) char* function(size_t length, char fillChar) nothrow;
__gshared c_g_strnfillFn c_g_strnfill; ///
private alias c_g_strreverseFn = extern(C) char* function(char* string_) nothrow;
__gshared c_g_strreverseFn c_g_strreverse; ///
private alias c_g_strrstrFn = extern(C) char* function(const(char)* haystack, const(char)* needle) nothrow;
__gshared c_g_strrstrFn c_g_strrstr; ///
private alias c_g_strrstr_lenFn = extern(C) char* function(const(char)* haystack, ptrdiff_t haystackLen, const(char)* needle) nothrow;
__gshared c_g_strrstr_lenFn c_g_strrstr_len; ///
private alias c_g_strsignalFn = extern(C) const(char)* function(int signum) nothrow;
__gshared c_g_strsignalFn c_g_strsignal; ///
private alias c_g_strsplitFn = extern(C) char** function(const(char)* string_, const(char)* delimiter, int maxTokens) nothrow;
__gshared c_g_strsplitFn c_g_strsplit; ///
private alias c_g_strsplit_setFn = extern(C) char** function(const(char)* string_, const(char)* delimiters, int maxTokens) nothrow;
__gshared c_g_strsplit_setFn c_g_strsplit_set; ///
private alias c_g_strstr_lenFn = extern(C) char* function(const(char)* haystack, ptrdiff_t haystackLen, const(char)* needle) nothrow;
__gshared c_g_strstr_lenFn c_g_strstr_len; ///
private alias c_g_strtodFn = extern(C) double function(const(char)* nptr, char** endptr) nothrow;
__gshared c_g_strtodFn c_g_strtod; ///
private alias c_g_strupFn = extern(C) char* function(char* string_) nothrow;
__gshared c_g_strupFn c_g_strup; ///
private alias c_g_strv_containsFn = extern(C) gboolean function(const(char*)* strv, const(char)* str) nothrow;
__gshared c_g_strv_containsFn c_g_strv_contains; ///
private alias c_g_strv_equalFn = extern(C) gboolean function(const(char*)* strv1, const(char*)* strv2) nothrow;
__gshared c_g_strv_equalFn c_g_strv_equal; ///
private alias c_g_strv_get_typeFn = extern(C) GType function() nothrow;
__gshared c_g_strv_get_typeFn c_g_strv_get_type; ///
private alias c_g_strv_lengthFn = extern(C) uint function(char** strArray) nothrow;
__gshared c_g_strv_lengthFn c_g_strv_length; ///
private alias c_g_test_add_data_funcFn = extern(C) void function(const(char)* testpath, const(void)* testData, GTestDataFunc testFunc) nothrow;
__gshared c_g_test_add_data_funcFn c_g_test_add_data_func; ///
private alias c_g_test_add_data_func_fullFn = extern(C) void function(const(char)* testpath, void* testData, GTestDataFunc testFunc, GDestroyNotify dataFreeFunc) nothrow;
__gshared c_g_test_add_data_func_fullFn c_g_test_add_data_func_full; ///
private alias c_g_test_add_funcFn = extern(C) void function(const(char)* testpath, GTestFunc testFunc) nothrow;
__gshared c_g_test_add_funcFn c_g_test_add_func; ///
private alias c_g_test_add_vtableFn = extern(C) void function(const(char)* testpath, size_t dataSize, const(void)* testData, GTestFixtureFunc dataSetup, GTestFixtureFunc dataTest, GTestFixtureFunc dataTeardown) nothrow;
__gshared c_g_test_add_vtableFn c_g_test_add_vtable; ///
private alias c_g_test_assert_expected_messages_internalFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func) nothrow;
__gshared c_g_test_assert_expected_messages_internalFn c_g_test_assert_expected_messages_internal; ///
private alias c_g_test_bugFn = extern(C) void function(const(char)* bugUriSnippet) nothrow;
__gshared c_g_test_bugFn c_g_test_bug; ///
private alias c_g_test_bug_baseFn = extern(C) void function(const(char)* uriPattern) nothrow;
__gshared c_g_test_bug_baseFn c_g_test_bug_base; ///
private alias c_g_test_build_filenameFn = extern(C) char* function(GTestFileType fileType, const(char)* firstPath,  ...) nothrow;
__gshared c_g_test_build_filenameFn c_g_test_build_filename; ///
private alias c_g_test_create_caseFn = extern(C) GTestCase* function(const(char)* testName, size_t dataSize, const(void)* testData, GTestFixtureFunc dataSetup, GTestFixtureFunc dataTest, GTestFixtureFunc dataTeardown) nothrow;
__gshared c_g_test_create_caseFn c_g_test_create_case; ///
private alias c_g_test_create_suiteFn = extern(C) GTestSuite* function(const(char)* suiteName) nothrow;
__gshared c_g_test_create_suiteFn c_g_test_create_suite; ///
private alias c_g_test_disable_crash_reportingFn = extern(C) void function() nothrow;
__gshared c_g_test_disable_crash_reportingFn c_g_test_disable_crash_reporting; ///
private alias c_g_test_expect_messageFn = extern(C) void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* pattern) nothrow;
__gshared c_g_test_expect_messageFn c_g_test_expect_message; ///
private alias c_g_test_failFn = extern(C) void function() nothrow;
__gshared c_g_test_failFn c_g_test_fail; ///
private alias c_g_test_fail_printfFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_test_fail_printfFn c_g_test_fail_printf; ///
private alias c_g_test_failedFn = extern(C) gboolean function() nothrow;
__gshared c_g_test_failedFn c_g_test_failed; ///
private alias c_g_test_get_dirFn = extern(C) const(char)* function(GTestFileType fileType) nothrow;
__gshared c_g_test_get_dirFn c_g_test_get_dir; ///
private alias c_g_test_get_filenameFn = extern(C) const(char)* function(GTestFileType fileType, const(char)* firstPath,  ...) nothrow;
__gshared c_g_test_get_filenameFn c_g_test_get_filename; ///
private alias c_g_test_get_pathFn = extern(C) const(char)* function() nothrow;
__gshared c_g_test_get_pathFn c_g_test_get_path; ///
private alias c_g_test_get_rootFn = extern(C) GTestSuite* function() nothrow;
__gshared c_g_test_get_rootFn c_g_test_get_root; ///
private alias c_g_test_incompleteFn = extern(C) void function(const(char)* msg) nothrow;
__gshared c_g_test_incompleteFn c_g_test_incomplete; ///
private alias c_g_test_incomplete_printfFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_test_incomplete_printfFn c_g_test_incomplete_printf; ///
private alias c_g_test_initFn = extern(C) void function(int* argc, char*** argv,  ...) nothrow;
__gshared c_g_test_initFn c_g_test_init; ///
private alias c_g_test_log_set_fatal_handlerFn = extern(C) void function(GTestLogFatalFunc logFunc, void* userData) nothrow;
__gshared c_g_test_log_set_fatal_handlerFn c_g_test_log_set_fatal_handler; ///
private alias c_g_test_log_type_nameFn = extern(C) const(char)* function(GTestLogType logType) nothrow;
__gshared c_g_test_log_type_nameFn c_g_test_log_type_name; ///
private alias c_g_test_maximized_resultFn = extern(C) void function(double maximizedQuantity, const(char)* format,  ...) nothrow;
__gshared c_g_test_maximized_resultFn c_g_test_maximized_result; ///
private alias c_g_test_messageFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_test_messageFn c_g_test_message; ///
private alias c_g_test_minimized_resultFn = extern(C) void function(double minimizedQuantity, const(char)* format,  ...) nothrow;
__gshared c_g_test_minimized_resultFn c_g_test_minimized_result; ///
private alias c_g_test_queue_destroyFn = extern(C) void function(GDestroyNotify destroyFunc, void* destroyData) nothrow;
__gshared c_g_test_queue_destroyFn c_g_test_queue_destroy; ///
private alias c_g_test_queue_freeFn = extern(C) void function(void* gfreePointer) nothrow;
__gshared c_g_test_queue_freeFn c_g_test_queue_free; ///
private alias c_g_test_rand_doubleFn = extern(C) double function() nothrow;
__gshared c_g_test_rand_doubleFn c_g_test_rand_double; ///
private alias c_g_test_rand_double_rangeFn = extern(C) double function(double rangeStart, double rangeEnd) nothrow;
__gshared c_g_test_rand_double_rangeFn c_g_test_rand_double_range; ///
private alias c_g_test_rand_intFn = extern(C) int function() nothrow;
__gshared c_g_test_rand_intFn c_g_test_rand_int; ///
private alias c_g_test_rand_int_rangeFn = extern(C) int function(int begin, int end) nothrow;
__gshared c_g_test_rand_int_rangeFn c_g_test_rand_int_range; ///
private alias c_g_test_runFn = extern(C) int function() nothrow;
__gshared c_g_test_runFn c_g_test_run; ///
private alias c_g_test_run_suiteFn = extern(C) int function(GTestSuite* suite) nothrow;
__gshared c_g_test_run_suiteFn c_g_test_run_suite; ///
private alias c_g_test_set_nonfatal_assertionsFn = extern(C) void function() nothrow;
__gshared c_g_test_set_nonfatal_assertionsFn c_g_test_set_nonfatal_assertions; ///
private alias c_g_test_skipFn = extern(C) void function(const(char)* msg) nothrow;
__gshared c_g_test_skipFn c_g_test_skip; ///
private alias c_g_test_skip_printfFn = extern(C) void function(const(char)* format,  ...) nothrow;
__gshared c_g_test_skip_printfFn c_g_test_skip_printf; ///
private alias c_g_test_subprocessFn = extern(C) gboolean function() nothrow;
__gshared c_g_test_subprocessFn c_g_test_subprocess; ///
private alias c_g_test_summaryFn = extern(C) void function(const(char)* summary) nothrow;
__gshared c_g_test_summaryFn c_g_test_summary; ///
private alias c_g_test_timer_elapsedFn = extern(C) double function() nothrow;
__gshared c_g_test_timer_elapsedFn c_g_test_timer_elapsed; ///
private alias c_g_test_timer_lastFn = extern(C) double function() nothrow;
__gshared c_g_test_timer_lastFn c_g_test_timer_last; ///
private alias c_g_test_timer_startFn = extern(C) void function() nothrow;
__gshared c_g_test_timer_startFn c_g_test_timer_start; ///
private alias c_g_test_trap_assertionsFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, ulong assertionFlags, const(char)* pattern) nothrow;
__gshared c_g_test_trap_assertionsFn c_g_test_trap_assertions; ///
private alias c_g_test_trap_forkFn = extern(C) gboolean function(ulong usecTimeout, GTestTrapFlags testTrapFlags) nothrow;
__gshared c_g_test_trap_forkFn c_g_test_trap_fork; ///
private alias c_g_test_trap_has_passedFn = extern(C) gboolean function() nothrow;
__gshared c_g_test_trap_has_passedFn c_g_test_trap_has_passed; ///
private alias c_g_test_trap_has_skippedFn = extern(C) gboolean function() nothrow;
__gshared c_g_test_trap_has_skippedFn c_g_test_trap_has_skipped; ///
private alias c_g_test_trap_reached_timeoutFn = extern(C) gboolean function() nothrow;
__gshared c_g_test_trap_reached_timeoutFn c_g_test_trap_reached_timeout; ///
private alias c_g_test_trap_subprocessFn = extern(C) void function(const(char)* testPath, ulong usecTimeout, GTestSubprocessFlags testFlags) nothrow;
__gshared c_g_test_trap_subprocessFn c_g_test_trap_subprocess; ///
private alias c_g_test_trap_subprocess_with_envpFn = extern(C) void function(const(char)* testPath, const(char*)* envp, ulong usecTimeout, GTestSubprocessFlags testFlags) nothrow;
__gshared c_g_test_trap_subprocess_with_envpFn c_g_test_trap_subprocess_with_envp; ///
private alias c_g_timeout_addFn = extern(C) uint function(uint interval, GSourceFunc function_, void* data) nothrow;
__gshared c_g_timeout_addFn c_g_timeout_add; ///
private alias c_g_timeout_add_fullFn = extern(C) uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_timeout_add_fullFn c_g_timeout_add_full; ///
private alias c_g_timeout_add_onceFn = extern(C) uint function(uint interval, GSourceOnceFunc function_, void* data) nothrow;
__gshared c_g_timeout_add_onceFn c_g_timeout_add_once; ///
private alias c_g_timeout_add_secondsFn = extern(C) uint function(uint interval, GSourceFunc function_, void* data) nothrow;
__gshared c_g_timeout_add_secondsFn c_g_timeout_add_seconds; ///
private alias c_g_timeout_add_seconds_fullFn = extern(C) uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) nothrow;
__gshared c_g_timeout_add_seconds_fullFn c_g_timeout_add_seconds_full; ///
private alias c_g_timeout_add_seconds_onceFn = extern(C) uint function(uint interval, GSourceOnceFunc function_, void* data) nothrow;
__gshared c_g_timeout_add_seconds_onceFn c_g_timeout_add_seconds_once; ///
private alias c_g_timeout_source_newFn = extern(C) GSource* function(uint interval) nothrow;
__gshared c_g_timeout_source_newFn c_g_timeout_source_new; ///
private alias c_g_timeout_source_new_secondsFn = extern(C) GSource* function(uint interval) nothrow;
__gshared c_g_timeout_source_new_secondsFn c_g_timeout_source_new_seconds; ///
private alias c_g_try_mallocFn = extern(C) void* function(size_t nBytes) nothrow;
__gshared c_g_try_mallocFn c_g_try_malloc; ///
private alias c_g_try_malloc0Fn = extern(C) void* function(size_t nBytes) nothrow;
__gshared c_g_try_malloc0Fn c_g_try_malloc0; ///
private alias c_g_try_malloc0_nFn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_try_malloc0_nFn c_g_try_malloc0_n; ///
private alias c_g_try_malloc_nFn = extern(C) void* function(size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_try_malloc_nFn c_g_try_malloc_n; ///
private alias c_g_try_reallocFn = extern(C) void* function(void* mem, size_t nBytes) nothrow;
__gshared c_g_try_reallocFn c_g_try_realloc; ///
private alias c_g_try_realloc_nFn = extern(C) void* function(void* mem, size_t nBlocks, size_t nBlockBytes) nothrow;
__gshared c_g_try_realloc_nFn c_g_try_realloc_n; ///
private alias c_g_ucs4_to_utf16Fn = extern(C) ushort* function(const(dchar)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_ucs4_to_utf16Fn c_g_ucs4_to_utf16; ///
private alias c_g_ucs4_to_utf8Fn = extern(C) char* function(const(dchar)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_ucs4_to_utf8Fn c_g_ucs4_to_utf8; ///
private alias c_g_unichar_break_typeFn = extern(C) GUnicodeBreakType function(dchar c) nothrow;
__gshared c_g_unichar_break_typeFn c_g_unichar_break_type; ///
private alias c_g_unichar_combining_classFn = extern(C) int function(dchar uc) nothrow;
__gshared c_g_unichar_combining_classFn c_g_unichar_combining_class; ///
private alias c_g_unichar_composeFn = extern(C) gboolean function(dchar a, dchar b, dchar* ch) nothrow;
__gshared c_g_unichar_composeFn c_g_unichar_compose; ///
private alias c_g_unichar_decomposeFn = extern(C) gboolean function(dchar ch, dchar* a, dchar* b) nothrow;
__gshared c_g_unichar_decomposeFn c_g_unichar_decompose; ///
private alias c_g_unichar_digit_valueFn = extern(C) int function(dchar c) nothrow;
__gshared c_g_unichar_digit_valueFn c_g_unichar_digit_value; ///
private alias c_g_unichar_fully_decomposeFn = extern(C) size_t function(dchar ch, gboolean compat, dchar* result, size_t resultLen) nothrow;
__gshared c_g_unichar_fully_decomposeFn c_g_unichar_fully_decompose; ///
private alias c_g_unichar_get_mirror_charFn = extern(C) gboolean function(dchar ch, dchar* mirroredCh) nothrow;
__gshared c_g_unichar_get_mirror_charFn c_g_unichar_get_mirror_char; ///
private alias c_g_unichar_get_scriptFn = extern(C) GUnicodeScript function(dchar ch) nothrow;
__gshared c_g_unichar_get_scriptFn c_g_unichar_get_script; ///
private alias c_g_unichar_isalnumFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isalnumFn c_g_unichar_isalnum; ///
private alias c_g_unichar_isalphaFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isalphaFn c_g_unichar_isalpha; ///
private alias c_g_unichar_iscntrlFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_iscntrlFn c_g_unichar_iscntrl; ///
private alias c_g_unichar_isdefinedFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isdefinedFn c_g_unichar_isdefined; ///
private alias c_g_unichar_isdigitFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isdigitFn c_g_unichar_isdigit; ///
private alias c_g_unichar_isgraphFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isgraphFn c_g_unichar_isgraph; ///
private alias c_g_unichar_islowerFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_islowerFn c_g_unichar_islower; ///
private alias c_g_unichar_ismarkFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_ismarkFn c_g_unichar_ismark; ///
private alias c_g_unichar_isprintFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isprintFn c_g_unichar_isprint; ///
private alias c_g_unichar_ispunctFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_ispunctFn c_g_unichar_ispunct; ///
private alias c_g_unichar_isspaceFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isspaceFn c_g_unichar_isspace; ///
private alias c_g_unichar_istitleFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_istitleFn c_g_unichar_istitle; ///
private alias c_g_unichar_isupperFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isupperFn c_g_unichar_isupper; ///
private alias c_g_unichar_iswideFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_iswideFn c_g_unichar_iswide; ///
private alias c_g_unichar_iswide_cjkFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_iswide_cjkFn c_g_unichar_iswide_cjk; ///
private alias c_g_unichar_isxdigitFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_isxdigitFn c_g_unichar_isxdigit; ///
private alias c_g_unichar_iszerowidthFn = extern(C) gboolean function(dchar c) nothrow;
__gshared c_g_unichar_iszerowidthFn c_g_unichar_iszerowidth; ///
private alias c_g_unichar_to_utf8Fn = extern(C) int function(dchar c, char* outbuf) nothrow;
__gshared c_g_unichar_to_utf8Fn c_g_unichar_to_utf8; ///
private alias c_g_unichar_tolowerFn = extern(C) dchar function(dchar c) nothrow;
__gshared c_g_unichar_tolowerFn c_g_unichar_tolower; ///
private alias c_g_unichar_totitleFn = extern(C) dchar function(dchar c) nothrow;
__gshared c_g_unichar_totitleFn c_g_unichar_totitle; ///
private alias c_g_unichar_toupperFn = extern(C) dchar function(dchar c) nothrow;
__gshared c_g_unichar_toupperFn c_g_unichar_toupper; ///
private alias c_g_unichar_typeFn = extern(C) GUnicodeType function(dchar c) nothrow;
__gshared c_g_unichar_typeFn c_g_unichar_type; ///
private alias c_g_unichar_validateFn = extern(C) gboolean function(dchar ch) nothrow;
__gshared c_g_unichar_validateFn c_g_unichar_validate; ///
private alias c_g_unichar_xdigit_valueFn = extern(C) int function(dchar c) nothrow;
__gshared c_g_unichar_xdigit_valueFn c_g_unichar_xdigit_value; ///
private alias c_g_unicode_canonical_decompositionFn = extern(C) dchar* function(dchar ch, size_t* resultLen) nothrow;
__gshared c_g_unicode_canonical_decompositionFn c_g_unicode_canonical_decomposition; ///
private alias c_g_unicode_canonical_orderingFn = extern(C) void function(dchar* string_, size_t len) nothrow;
__gshared c_g_unicode_canonical_orderingFn c_g_unicode_canonical_ordering; ///
private alias c_g_unlinkFn = extern(C) int function(const(char)* filename) nothrow;
__gshared c_g_unlinkFn c_g_unlink; ///
private alias c_g_unsetenvFn = extern(C) void function(const(char)* variable) nothrow;
__gshared c_g_unsetenvFn c_g_unsetenv; ///
private alias c_g_usleepFn = extern(C) void function(gulong microseconds) nothrow;
__gshared c_g_usleepFn c_g_usleep; ///
private alias c_g_utf16_to_ucs4Fn = extern(C) dchar* function(const(ushort)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_utf16_to_ucs4Fn c_g_utf16_to_ucs4; ///
private alias c_g_utf16_to_utf8Fn = extern(C) char* function(const(ushort)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_utf16_to_utf8Fn c_g_utf16_to_utf8; ///
private alias c_g_utf8_casefoldFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_casefoldFn c_g_utf8_casefold; ///
private alias c_g_utf8_collateFn = extern(C) int function(const(char)* str1, const(char)* str2) nothrow;
__gshared c_g_utf8_collateFn c_g_utf8_collate; ///
private alias c_g_utf8_collate_keyFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_collate_keyFn c_g_utf8_collate_key; ///
private alias c_g_utf8_collate_key_for_filenameFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_collate_key_for_filenameFn c_g_utf8_collate_key_for_filename; ///
private alias c_g_utf8_find_next_charFn = extern(C) char* function(const(char)* p, const(char)* end) nothrow;
__gshared c_g_utf8_find_next_charFn c_g_utf8_find_next_char; ///
private alias c_g_utf8_find_prev_charFn = extern(C) char* function(const(char)* str, const(char)* p) nothrow;
__gshared c_g_utf8_find_prev_charFn c_g_utf8_find_prev_char; ///
private alias c_g_utf8_get_charFn = extern(C) dchar function(const(char)* p) nothrow;
__gshared c_g_utf8_get_charFn c_g_utf8_get_char; ///
private alias c_g_utf8_get_char_validatedFn = extern(C) dchar function(const(char)* p, ptrdiff_t maxLen) nothrow;
__gshared c_g_utf8_get_char_validatedFn c_g_utf8_get_char_validated; ///
private alias c_g_utf8_make_validFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_make_validFn c_g_utf8_make_valid; ///
private alias c_g_utf8_normalizeFn = extern(C) char* function(const(char)* str, ptrdiff_t len, GNormalizeMode mode) nothrow;
__gshared c_g_utf8_normalizeFn c_g_utf8_normalize; ///
private alias c_g_utf8_offset_to_pointerFn = extern(C) char* function(const(char)* str, glong offset) nothrow;
__gshared c_g_utf8_offset_to_pointerFn c_g_utf8_offset_to_pointer; ///
private alias c_g_utf8_pointer_to_offsetFn = extern(C) glong function(const(char)* str, const(char)* pos) nothrow;
__gshared c_g_utf8_pointer_to_offsetFn c_g_utf8_pointer_to_offset; ///
private alias c_g_utf8_prev_charFn = extern(C) char* function(const(char)* p) nothrow;
__gshared c_g_utf8_prev_charFn c_g_utf8_prev_char; ///
private alias c_g_utf8_strchrFn = extern(C) char* function(const(char)* p, ptrdiff_t len, dchar c) nothrow;
__gshared c_g_utf8_strchrFn c_g_utf8_strchr; ///
private alias c_g_utf8_strdownFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_strdownFn c_g_utf8_strdown; ///
private alias c_g_utf8_strlenFn = extern(C) glong function(const(char)* p, ptrdiff_t max) nothrow;
__gshared c_g_utf8_strlenFn c_g_utf8_strlen; ///
private alias c_g_utf8_strncpyFn = extern(C) char* function(char* dest, const(char)* src, size_t n) nothrow;
__gshared c_g_utf8_strncpyFn c_g_utf8_strncpy; ///
private alias c_g_utf8_strrchrFn = extern(C) char* function(const(char)* p, ptrdiff_t len, dchar c) nothrow;
__gshared c_g_utf8_strrchrFn c_g_utf8_strrchr; ///
private alias c_g_utf8_strreverseFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_strreverseFn c_g_utf8_strreverse; ///
private alias c_g_utf8_strupFn = extern(C) char* function(const(char)* str, ptrdiff_t len) nothrow;
__gshared c_g_utf8_strupFn c_g_utf8_strup; ///
private alias c_g_utf8_substringFn = extern(C) char* function(const(char)* str, glong startPos, glong endPos) nothrow;
__gshared c_g_utf8_substringFn c_g_utf8_substring; ///
private alias c_g_utf8_to_ucs4Fn = extern(C) dchar* function(const(char)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_utf8_to_ucs4Fn c_g_utf8_to_ucs4; ///
private alias c_g_utf8_to_ucs4_fastFn = extern(C) dchar* function(const(char)* str, glong len, glong* itemsWritten) nothrow;
__gshared c_g_utf8_to_ucs4_fastFn c_g_utf8_to_ucs4_fast; ///
private alias c_g_utf8_to_utf16Fn = extern(C) ushort* function(const(char)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) nothrow;
__gshared c_g_utf8_to_utf16Fn c_g_utf8_to_utf16; ///
private alias c_g_utf8_truncate_middleFn = extern(C) char* function(const(char)* string_, size_t truncateLength) nothrow;
__gshared c_g_utf8_truncate_middleFn c_g_utf8_truncate_middle; ///
private alias c_g_utf8_validateFn = extern(C) gboolean function(const(ubyte)* str, ptrdiff_t maxLen, const(char*)* end) nothrow;
__gshared c_g_utf8_validateFn c_g_utf8_validate; ///
private alias c_g_utf8_validate_lenFn = extern(C) gboolean function(const(ubyte)* str, size_t maxLen, const(char*)* end) nothrow;
__gshared c_g_utf8_validate_lenFn c_g_utf8_validate_len; ///
private alias c_g_uuid_string_is_validFn = extern(C) gboolean function(const(char)* str) nothrow;
__gshared c_g_uuid_string_is_validFn c_g_uuid_string_is_valid; ///
private alias c_g_uuid_string_randomFn = extern(C) char* function() nothrow;
__gshared c_g_uuid_string_randomFn c_g_uuid_string_random; ///
private alias c_g_variant_get_gtypeFn = extern(C) GType function() nothrow;
__gshared c_g_variant_get_gtypeFn c_g_variant_get_gtype; ///
private alias c_g_vasprintfFn = extern(C) int function(char** string_, const(char)* format, void* args) nothrow;
__gshared c_g_vasprintfFn c_g_vasprintf; ///
private alias c_g_vfprintfFn = extern(C) int function(void* file, const(char)* format, void* args) nothrow;
__gshared c_g_vfprintfFn c_g_vfprintf; ///
private alias c_g_vprintfFn = extern(C) int function(const(char)* format, void* args) nothrow;
__gshared c_g_vprintfFn c_g_vprintf; ///
private alias c_g_vsnprintfFn = extern(C) int function(char* string_, gulong n, const(char)* format, void* args) nothrow;
__gshared c_g_vsnprintfFn c_g_vsnprintf; ///
private alias c_g_vsprintfFn = extern(C) int function(char* string_, const(char)* format, void* args) nothrow;
__gshared c_g_vsprintfFn c_g_vsprintf; ///
private alias c_g_warn_messageFn = extern(C) void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* warnexpr) nothrow;
__gshared c_g_warn_messageFn c_g_warn_message; ///

// UnicodeScript
private alias c_g_unicode_script_from_iso15924Fn = extern(C) GUnicodeScript function(uint iso15924) nothrow;
__gshared c_g_unicode_script_from_iso15924Fn c_g_unicode_script_from_iso15924; ///
private alias c_g_unicode_script_to_iso15924Fn = extern(C) uint function(GUnicodeScript script) nothrow;
__gshared c_g_unicode_script_to_iso15924Fn c_g_unicode_script_to_iso15924; ///

// Allocator

/** */
alias g_allocator_free = c_g_allocator_free;

/** */
alias g_allocator_new = c_g_allocator_new;

// Array

/** */
alias g_array_get_type = c_g_array_get_type;

/** */
alias g_array_append_vals = c_g_array_append_vals;

/** */
alias g_array_binary_search = c_g_array_binary_search;

/** */
alias g_array_copy = c_g_array_copy;

/** */
alias g_array_free = c_g_array_free;

/** */
alias g_array_get_element_size = c_g_array_get_element_size;

/** */
alias g_array_insert_vals = c_g_array_insert_vals;

/** */
alias g_array_new = c_g_array_new;

/** */
alias g_array_new_take = c_g_array_new_take;

/** */
alias g_array_new_take_zero_terminated = c_g_array_new_take_zero_terminated;

/** */
alias g_array_prepend_vals = c_g_array_prepend_vals;

/** */
alias g_array_ref = c_g_array_ref;

/** */
alias g_array_remove_index = c_g_array_remove_index;

/** */
alias g_array_remove_index_fast = c_g_array_remove_index_fast;

/** */
alias g_array_remove_range = c_g_array_remove_range;

/** */
alias g_array_set_clear_func = c_g_array_set_clear_func;

/** */
alias g_array_set_size = c_g_array_set_size;

/** */
alias g_array_sized_new = c_g_array_sized_new;

/** */
alias g_array_sort = c_g_array_sort;

/** */
alias g_array_sort_with_data = c_g_array_sort_with_data;

/** */
alias g_array_steal = c_g_array_steal;

/** */
alias g_array_unref = c_g_array_unref;

// AsyncQueue

/** */
alias g_async_queue_length = c_g_async_queue_length;

/** */
alias g_async_queue_length_unlocked = c_g_async_queue_length_unlocked;

/** */
alias g_async_queue_lock = c_g_async_queue_lock;

/** */
alias g_async_queue_pop = c_g_async_queue_pop;

/** */
alias g_async_queue_pop_unlocked = c_g_async_queue_pop_unlocked;

/** */
alias g_async_queue_push = c_g_async_queue_push;

/** */
alias g_async_queue_push_front = c_g_async_queue_push_front;

/** */
alias g_async_queue_push_front_unlocked = c_g_async_queue_push_front_unlocked;

/** */
alias g_async_queue_push_sorted = c_g_async_queue_push_sorted;

/** */
alias g_async_queue_push_sorted_unlocked = c_g_async_queue_push_sorted_unlocked;

/** */
alias g_async_queue_push_unlocked = c_g_async_queue_push_unlocked;

/** */
alias g_async_queue_ref = c_g_async_queue_ref;

/** */
alias g_async_queue_ref_unlocked = c_g_async_queue_ref_unlocked;

/** */
alias g_async_queue_remove = c_g_async_queue_remove;

/** */
alias g_async_queue_remove_unlocked = c_g_async_queue_remove_unlocked;

/** */
alias g_async_queue_sort = c_g_async_queue_sort;

/** */
alias g_async_queue_sort_unlocked = c_g_async_queue_sort_unlocked;

/** */
alias g_async_queue_timed_pop = c_g_async_queue_timed_pop;

/** */
alias g_async_queue_timed_pop_unlocked = c_g_async_queue_timed_pop_unlocked;

/** */
alias g_async_queue_timeout_pop = c_g_async_queue_timeout_pop;

/** */
alias g_async_queue_timeout_pop_unlocked = c_g_async_queue_timeout_pop_unlocked;

/** */
alias g_async_queue_try_pop = c_g_async_queue_try_pop;

/** */
alias g_async_queue_try_pop_unlocked = c_g_async_queue_try_pop_unlocked;

/** */
alias g_async_queue_unlock = c_g_async_queue_unlock;

/** */
alias g_async_queue_unref = c_g_async_queue_unref;

/** */
alias g_async_queue_unref_and_unlock = c_g_async_queue_unref_and_unlock;

/** */
alias g_async_queue_new = c_g_async_queue_new;

/** */
alias g_async_queue_new_full = c_g_async_queue_new_full;

// BookmarkFile

/** */
alias g_bookmark_file_get_type = c_g_bookmark_file_get_type;

/** */
alias g_bookmark_file_new = c_g_bookmark_file_new;

/** */
alias g_bookmark_file_add_application = c_g_bookmark_file_add_application;

/** */
alias g_bookmark_file_add_group = c_g_bookmark_file_add_group;

/** */
alias g_bookmark_file_copy = c_g_bookmark_file_copy;

/** */
alias g_bookmark_file_free = c_g_bookmark_file_free;

/** */
alias g_bookmark_file_get_added = c_g_bookmark_file_get_added;

/** */
alias g_bookmark_file_get_added_date_time = c_g_bookmark_file_get_added_date_time;

/** */
alias g_bookmark_file_get_app_info = c_g_bookmark_file_get_app_info;

/** */
alias g_bookmark_file_get_application_info = c_g_bookmark_file_get_application_info;

/** */
alias g_bookmark_file_get_applications = c_g_bookmark_file_get_applications;

/** */
alias g_bookmark_file_get_description = c_g_bookmark_file_get_description;

/** */
alias g_bookmark_file_get_groups = c_g_bookmark_file_get_groups;

/** */
alias g_bookmark_file_get_icon = c_g_bookmark_file_get_icon;

/** */
alias g_bookmark_file_get_is_private = c_g_bookmark_file_get_is_private;

/** */
alias g_bookmark_file_get_mime_type = c_g_bookmark_file_get_mime_type;

/** */
alias g_bookmark_file_get_modified = c_g_bookmark_file_get_modified;

/** */
alias g_bookmark_file_get_modified_date_time = c_g_bookmark_file_get_modified_date_time;

/** */
alias g_bookmark_file_get_size = c_g_bookmark_file_get_size;

/** */
alias g_bookmark_file_get_title = c_g_bookmark_file_get_title;

/** */
alias g_bookmark_file_get_uris = c_g_bookmark_file_get_uris;

/** */
alias g_bookmark_file_get_visited = c_g_bookmark_file_get_visited;

/** */
alias g_bookmark_file_get_visited_date_time = c_g_bookmark_file_get_visited_date_time;

/** */
alias g_bookmark_file_has_application = c_g_bookmark_file_has_application;

/** */
alias g_bookmark_file_has_group = c_g_bookmark_file_has_group;

/** */
alias g_bookmark_file_has_item = c_g_bookmark_file_has_item;

/** */
alias g_bookmark_file_load_from_data = c_g_bookmark_file_load_from_data;

/** */
alias g_bookmark_file_load_from_data_dirs = c_g_bookmark_file_load_from_data_dirs;

/** */
alias g_bookmark_file_load_from_file = c_g_bookmark_file_load_from_file;

/** */
alias g_bookmark_file_move_item = c_g_bookmark_file_move_item;

/** */
alias g_bookmark_file_remove_application = c_g_bookmark_file_remove_application;

/** */
alias g_bookmark_file_remove_group = c_g_bookmark_file_remove_group;

/** */
alias g_bookmark_file_remove_item = c_g_bookmark_file_remove_item;

/** */
alias g_bookmark_file_set_added = c_g_bookmark_file_set_added;

/** */
alias g_bookmark_file_set_added_date_time = c_g_bookmark_file_set_added_date_time;

/** */
alias g_bookmark_file_set_app_info = c_g_bookmark_file_set_app_info;

/** */
alias g_bookmark_file_set_application_info = c_g_bookmark_file_set_application_info;

/** */
alias g_bookmark_file_set_description = c_g_bookmark_file_set_description;

/** */
alias g_bookmark_file_set_groups = c_g_bookmark_file_set_groups;

/** */
alias g_bookmark_file_set_icon = c_g_bookmark_file_set_icon;

/** */
alias g_bookmark_file_set_is_private = c_g_bookmark_file_set_is_private;

/** */
alias g_bookmark_file_set_mime_type = c_g_bookmark_file_set_mime_type;

/** */
alias g_bookmark_file_set_modified = c_g_bookmark_file_set_modified;

/** */
alias g_bookmark_file_set_modified_date_time = c_g_bookmark_file_set_modified_date_time;

/** */
alias g_bookmark_file_set_title = c_g_bookmark_file_set_title;

/** */
alias g_bookmark_file_set_visited = c_g_bookmark_file_set_visited;

/** */
alias g_bookmark_file_set_visited_date_time = c_g_bookmark_file_set_visited_date_time;

/** */
alias g_bookmark_file_to_data = c_g_bookmark_file_to_data;

/** */
alias g_bookmark_file_to_file = c_g_bookmark_file_to_file;

/** */
alias g_bookmark_file_error_quark = c_g_bookmark_file_error_quark;

// ByteArray

/** */
alias g_byte_array_get_type = c_g_byte_array_get_type;

/** */
alias g_byte_array_append = c_g_byte_array_append;

/** */
alias g_byte_array_free = c_g_byte_array_free;

/** */
alias g_byte_array_free_to_bytes = c_g_byte_array_free_to_bytes;

/** */
alias g_byte_array_new = c_g_byte_array_new;

/** */
alias g_byte_array_new_take = c_g_byte_array_new_take;

/** */
alias g_byte_array_prepend = c_g_byte_array_prepend;

/** */
alias g_byte_array_ref = c_g_byte_array_ref;

/** */
alias g_byte_array_remove_index = c_g_byte_array_remove_index;

/** */
alias g_byte_array_remove_index_fast = c_g_byte_array_remove_index_fast;

/** */
alias g_byte_array_remove_range = c_g_byte_array_remove_range;

/** */
alias g_byte_array_set_size = c_g_byte_array_set_size;

/** */
alias g_byte_array_sized_new = c_g_byte_array_sized_new;

/** */
alias g_byte_array_sort = c_g_byte_array_sort;

/** */
alias g_byte_array_sort_with_data = c_g_byte_array_sort_with_data;

/** */
alias g_byte_array_steal = c_g_byte_array_steal;

/** */
alias g_byte_array_unref = c_g_byte_array_unref;

// Bytes

/** */
alias g_bytes_get_type = c_g_bytes_get_type;

/** */
alias g_bytes_new = c_g_bytes_new;

/** */
alias g_bytes_new_from_bytes = c_g_bytes_new_from_bytes;

/** */
alias g_bytes_new_static = c_g_bytes_new_static;

/** */
alias g_bytes_new_take = c_g_bytes_new_take;

/** */
alias g_bytes_new_with_free_func = c_g_bytes_new_with_free_func;

/** */
alias g_bytes_compare = c_g_bytes_compare;

/** */
alias g_bytes_equal = c_g_bytes_equal;

/** */
alias g_bytes_get_data = c_g_bytes_get_data;

/** */
alias g_bytes_get_region = c_g_bytes_get_region;

/** */
alias g_bytes_get_size = c_g_bytes_get_size;

/** */
alias g_bytes_hash = c_g_bytes_hash;

/** */
alias g_bytes_ref = c_g_bytes_ref;

/** */
alias g_bytes_unref = c_g_bytes_unref;

/** */
alias g_bytes_unref_to_array = c_g_bytes_unref_to_array;

/** */
alias g_bytes_unref_to_data = c_g_bytes_unref_to_data;

// Cache

/** */
alias g_cache_destroy = c_g_cache_destroy;

/** */
alias g_cache_insert = c_g_cache_insert;

/** */
alias g_cache_key_foreach = c_g_cache_key_foreach;

/** */
alias g_cache_remove = c_g_cache_remove;

/** */
alias g_cache_value_foreach = c_g_cache_value_foreach;

/** */
alias g_cache_new = c_g_cache_new;

// Checksum

/** */
alias g_checksum_get_type = c_g_checksum_get_type;

/** */
alias g_checksum_new = c_g_checksum_new;

/** */
alias g_checksum_copy = c_g_checksum_copy;

/** */
alias g_checksum_free = c_g_checksum_free;

/** */
alias g_checksum_get_digest = c_g_checksum_get_digest;

/** */
alias g_checksum_get_string = c_g_checksum_get_string;

/** */
alias g_checksum_reset = c_g_checksum_reset;

/** */
alias g_checksum_update = c_g_checksum_update;

/** */
alias g_checksum_type_get_length = c_g_checksum_type_get_length;

// Completion

/** */
alias g_completion_add_items = c_g_completion_add_items;

/** */
alias g_completion_clear_items = c_g_completion_clear_items;

/** */
alias g_completion_complete = c_g_completion_complete;

/** */
alias g_completion_complete_utf8 = c_g_completion_complete_utf8;

/** */
alias g_completion_free = c_g_completion_free;

/** */
alias g_completion_remove_items = c_g_completion_remove_items;

/** */
alias g_completion_set_compare = c_g_completion_set_compare;

/** */
alias g_completion_new = c_g_completion_new;

// Cond

/** */
alias g_cond_broadcast = c_g_cond_broadcast;

/** */
alias g_cond_clear = c_g_cond_clear;

/** */
alias g_cond_free = c_g_cond_free;

/** */
alias g_cond_init = c_g_cond_init;

/** */
alias g_cond_signal = c_g_cond_signal;

/** */
alias g_cond_timed_wait = c_g_cond_timed_wait;

/** */
alias g_cond_wait = c_g_cond_wait;

/** */
alias g_cond_wait_until = c_g_cond_wait_until;

/** */
alias g_cond_new = c_g_cond_new;

// Date

/** */
alias g_date_get_type = c_g_date_get_type;

/** */
alias g_date_new = c_g_date_new;

/** */
alias g_date_new_dmy = c_g_date_new_dmy;

/** */
alias g_date_new_julian = c_g_date_new_julian;

/** */
alias g_date_add_days = c_g_date_add_days;

/** */
alias g_date_add_months = c_g_date_add_months;

/** */
alias g_date_add_years = c_g_date_add_years;

/** */
alias g_date_clamp = c_g_date_clamp;

/** */
alias g_date_clear = c_g_date_clear;

/** */
alias g_date_compare = c_g_date_compare;

/** */
alias g_date_copy = c_g_date_copy;

/** */
alias g_date_days_between = c_g_date_days_between;

/** */
alias g_date_free = c_g_date_free;

/** */
alias g_date_get_day = c_g_date_get_day;

/** */
alias g_date_get_day_of_year = c_g_date_get_day_of_year;

/** */
alias g_date_get_iso8601_week_of_year = c_g_date_get_iso8601_week_of_year;

/** */
alias g_date_get_julian = c_g_date_get_julian;

/** */
alias g_date_get_monday_week_of_year = c_g_date_get_monday_week_of_year;

/** */
alias g_date_get_month = c_g_date_get_month;

/** */
alias g_date_get_sunday_week_of_year = c_g_date_get_sunday_week_of_year;

/** */
alias g_date_get_week_of_year = c_g_date_get_week_of_year;

/** */
alias g_date_get_weekday = c_g_date_get_weekday;

/** */
alias g_date_get_year = c_g_date_get_year;

/** */
alias g_date_is_first_of_month = c_g_date_is_first_of_month;

/** */
alias g_date_is_last_of_month = c_g_date_is_last_of_month;

/** */
alias g_date_order = c_g_date_order;

/** */
alias g_date_set_day = c_g_date_set_day;

/** */
alias g_date_set_dmy = c_g_date_set_dmy;

/** */
alias g_date_set_julian = c_g_date_set_julian;

/** */
alias g_date_set_month = c_g_date_set_month;

/** */
alias g_date_set_parse = c_g_date_set_parse;

/** */
alias g_date_set_time = c_g_date_set_time;

/** */
alias g_date_set_time_t = c_g_date_set_time_t;

/** */
alias g_date_set_time_val = c_g_date_set_time_val;

/** */
alias g_date_set_year = c_g_date_set_year;

/** */
alias g_date_subtract_days = c_g_date_subtract_days;

/** */
alias g_date_subtract_months = c_g_date_subtract_months;

/** */
alias g_date_subtract_years = c_g_date_subtract_years;

/** */
alias g_date_to_struct_tm = c_g_date_to_struct_tm;

/** */
alias g_date_valid = c_g_date_valid;

/** */
alias g_date_get_days_in_month = c_g_date_get_days_in_month;

/** */
alias g_date_get_monday_weeks_in_year = c_g_date_get_monday_weeks_in_year;

/** */
alias g_date_get_sunday_weeks_in_year = c_g_date_get_sunday_weeks_in_year;

/** */
alias g_date_get_weeks_in_year = c_g_date_get_weeks_in_year;

/** */
alias g_date_is_leap_year = c_g_date_is_leap_year;

/** */
alias g_date_strftime = c_g_date_strftime;

/** */
alias g_date_valid_day = c_g_date_valid_day;

/** */
alias g_date_valid_dmy = c_g_date_valid_dmy;

/** */
alias g_date_valid_julian = c_g_date_valid_julian;

/** */
alias g_date_valid_month = c_g_date_valid_month;

/** */
alias g_date_valid_weekday = c_g_date_valid_weekday;

/** */
alias g_date_valid_year = c_g_date_valid_year;

// DateTime

/** */
alias g_date_time_get_type = c_g_date_time_get_type;

/** */
alias g_date_time_new = c_g_date_time_new;

/** */
alias g_date_time_new_from_iso8601 = c_g_date_time_new_from_iso8601;

/** */
alias g_date_time_new_from_timeval_local = c_g_date_time_new_from_timeval_local;

/** */
alias g_date_time_new_from_timeval_utc = c_g_date_time_new_from_timeval_utc;

/** */
alias g_date_time_new_from_unix_local = c_g_date_time_new_from_unix_local;

/** */
alias g_date_time_new_from_unix_local_usec = c_g_date_time_new_from_unix_local_usec;

/** */
alias g_date_time_new_from_unix_utc = c_g_date_time_new_from_unix_utc;

/** */
alias g_date_time_new_from_unix_utc_usec = c_g_date_time_new_from_unix_utc_usec;

/** */
alias g_date_time_new_local = c_g_date_time_new_local;

/** */
alias g_date_time_new_now = c_g_date_time_new_now;

/** */
alias g_date_time_new_now_local = c_g_date_time_new_now_local;

/** */
alias g_date_time_new_now_utc = c_g_date_time_new_now_utc;

/** */
alias g_date_time_new_utc = c_g_date_time_new_utc;

/** */
alias g_date_time_add = c_g_date_time_add;

/** */
alias g_date_time_add_days = c_g_date_time_add_days;

/** */
alias g_date_time_add_full = c_g_date_time_add_full;

/** */
alias g_date_time_add_hours = c_g_date_time_add_hours;

/** */
alias g_date_time_add_minutes = c_g_date_time_add_minutes;

/** */
alias g_date_time_add_months = c_g_date_time_add_months;

/** */
alias g_date_time_add_seconds = c_g_date_time_add_seconds;

/** */
alias g_date_time_add_weeks = c_g_date_time_add_weeks;

/** */
alias g_date_time_add_years = c_g_date_time_add_years;

/** */
alias g_date_time_compare = c_g_date_time_compare;

/** */
alias g_date_time_difference = c_g_date_time_difference;

/** */
alias g_date_time_equal = c_g_date_time_equal;

/** */
alias g_date_time_format = c_g_date_time_format;

/** */
alias g_date_time_format_iso8601 = c_g_date_time_format_iso8601;

/** */
alias g_date_time_get_day_of_month = c_g_date_time_get_day_of_month;

/** */
alias g_date_time_get_day_of_week = c_g_date_time_get_day_of_week;

/** */
alias g_date_time_get_day_of_year = c_g_date_time_get_day_of_year;

/** */
alias g_date_time_get_hour = c_g_date_time_get_hour;

/** */
alias g_date_time_get_microsecond = c_g_date_time_get_microsecond;

/** */
alias g_date_time_get_minute = c_g_date_time_get_minute;

/** */
alias g_date_time_get_month = c_g_date_time_get_month;

/** */
alias g_date_time_get_second = c_g_date_time_get_second;

/** */
alias g_date_time_get_seconds = c_g_date_time_get_seconds;

/** */
alias g_date_time_get_timezone = c_g_date_time_get_timezone;

/** */
alias g_date_time_get_timezone_abbreviation = c_g_date_time_get_timezone_abbreviation;

/** */
alias g_date_time_get_utc_offset = c_g_date_time_get_utc_offset;

/** */
alias g_date_time_get_week_numbering_year = c_g_date_time_get_week_numbering_year;

/** */
alias g_date_time_get_week_of_year = c_g_date_time_get_week_of_year;

/** */
alias g_date_time_get_year = c_g_date_time_get_year;

/** */
alias g_date_time_get_ymd = c_g_date_time_get_ymd;

/** */
alias g_date_time_hash = c_g_date_time_hash;

/** */
alias g_date_time_is_daylight_savings = c_g_date_time_is_daylight_savings;

/** */
alias g_date_time_ref = c_g_date_time_ref;

/** */
alias g_date_time_to_local = c_g_date_time_to_local;

/** */
alias g_date_time_to_timeval = c_g_date_time_to_timeval;

/** */
alias g_date_time_to_timezone = c_g_date_time_to_timezone;

/** */
alias g_date_time_to_unix = c_g_date_time_to_unix;

/** */
alias g_date_time_to_unix_usec = c_g_date_time_to_unix_usec;

/** */
alias g_date_time_to_utc = c_g_date_time_to_utc;

/** */
alias g_date_time_unref = c_g_date_time_unref;

// Dir

/** */
alias g_dir_get_type = c_g_dir_get_type;

/** */
alias g_dir_open = c_g_dir_open;

/** */
alias g_dir_close = c_g_dir_close;

/** */
alias g_dir_read_name = c_g_dir_read_name;

/** */
alias g_dir_ref = c_g_dir_ref;

/** */
alias g_dir_rewind = c_g_dir_rewind;

/** */
alias g_dir_unref = c_g_dir_unref;

/** */
alias g_dir_make_tmp = c_g_dir_make_tmp;

// ErrorWrap

/** */
alias g_error_get_type = c_g_error_get_type;

/** */
alias g_error_new = c_g_error_new;

/** */
alias g_error_new_literal = c_g_error_new_literal;

/** */
alias g_error_new_valist = c_g_error_new_valist;

/** */
alias g_error_copy = c_g_error_copy;

/** */
alias g_error_free = c_g_error_free;

/** */
alias g_error_matches = c_g_error_matches;

/** */
alias g_error_domain_register = c_g_error_domain_register;

/** */
alias g_error_domain_register_static = c_g_error_domain_register_static;

// HashTable

/** */
alias g_hash_table_get_type = c_g_hash_table_get_type;

/** */
alias g_hash_table_add = c_g_hash_table_add;

/** */
alias g_hash_table_contains = c_g_hash_table_contains;

/** */
alias g_hash_table_destroy = c_g_hash_table_destroy;

/** */
alias g_hash_table_find = c_g_hash_table_find;

/** */
alias g_hash_table_foreach = c_g_hash_table_foreach;

/** */
alias g_hash_table_foreach_remove = c_g_hash_table_foreach_remove;

/** */
alias g_hash_table_foreach_steal = c_g_hash_table_foreach_steal;

/** */
alias g_hash_table_get_keys = c_g_hash_table_get_keys;

/** */
alias g_hash_table_get_keys_as_array = c_g_hash_table_get_keys_as_array;

/** */
alias g_hash_table_get_keys_as_ptr_array = c_g_hash_table_get_keys_as_ptr_array;

/** */
alias g_hash_table_get_values = c_g_hash_table_get_values;

/** */
alias g_hash_table_get_values_as_ptr_array = c_g_hash_table_get_values_as_ptr_array;

/** */
alias g_hash_table_insert = c_g_hash_table_insert;

/** */
alias g_hash_table_lookup = c_g_hash_table_lookup;

/** */
alias g_hash_table_lookup_extended = c_g_hash_table_lookup_extended;

/** */
alias g_hash_table_new = c_g_hash_table_new;

/** */
alias g_hash_table_new_full = c_g_hash_table_new_full;

/** */
alias g_hash_table_new_similar = c_g_hash_table_new_similar;

/** */
alias g_hash_table_ref = c_g_hash_table_ref;

/** */
alias g_hash_table_remove = c_g_hash_table_remove;

/** */
alias g_hash_table_remove_all = c_g_hash_table_remove_all;

/** */
alias g_hash_table_replace = c_g_hash_table_replace;

/** */
alias g_hash_table_size = c_g_hash_table_size;

/** */
alias g_hash_table_steal = c_g_hash_table_steal;

/** */
alias g_hash_table_steal_all = c_g_hash_table_steal_all;

/** */
alias g_hash_table_steal_all_keys = c_g_hash_table_steal_all_keys;

/** */
alias g_hash_table_steal_all_values = c_g_hash_table_steal_all_values;

/** */
alias g_hash_table_steal_extended = c_g_hash_table_steal_extended;

/** */
alias g_hash_table_unref = c_g_hash_table_unref;

// HashTableIter

/** */
alias g_hash_table_iter_get_hash_table = c_g_hash_table_iter_get_hash_table;

/** */
alias g_hash_table_iter_init = c_g_hash_table_iter_init;

/** */
alias g_hash_table_iter_next = c_g_hash_table_iter_next;

/** */
alias g_hash_table_iter_remove = c_g_hash_table_iter_remove;

/** */
alias g_hash_table_iter_replace = c_g_hash_table_iter_replace;

/** */
alias g_hash_table_iter_steal = c_g_hash_table_iter_steal;

// Hmac

/** */
alias g_hmac_get_type = c_g_hmac_get_type;

/** */
alias g_hmac_new = c_g_hmac_new;

/** */
alias g_hmac_copy = c_g_hmac_copy;

/** */
alias g_hmac_get_digest = c_g_hmac_get_digest;

/** */
alias g_hmac_get_string = c_g_hmac_get_string;

/** */
alias g_hmac_ref = c_g_hmac_ref;

/** */
alias g_hmac_unref = c_g_hmac_unref;

/** */
alias g_hmac_update = c_g_hmac_update;

// Hook

/** */
alias g_hook_compare_ids = c_g_hook_compare_ids;

/** */
alias g_hook_alloc = c_g_hook_alloc;

/** */
alias g_hook_destroy = c_g_hook_destroy;

/** */
alias g_hook_destroy_link = c_g_hook_destroy_link;

/** */
alias g_hook_find = c_g_hook_find;

/** */
alias g_hook_find_data = c_g_hook_find_data;

/** */
alias g_hook_find_func = c_g_hook_find_func;

/** */
alias g_hook_find_func_data = c_g_hook_find_func_data;

/** */
alias g_hook_first_valid = c_g_hook_first_valid;

/** */
alias g_hook_free = c_g_hook_free;

/** */
alias g_hook_get = c_g_hook_get;

/** */
alias g_hook_insert_before = c_g_hook_insert_before;

/** */
alias g_hook_insert_sorted = c_g_hook_insert_sorted;

/** */
alias g_hook_next_valid = c_g_hook_next_valid;

/** */
alias g_hook_prepend = c_g_hook_prepend;

/** */
alias g_hook_ref = c_g_hook_ref;

/** */
alias g_hook_unref = c_g_hook_unref;

// HookList

/** */
alias g_hook_list_clear = c_g_hook_list_clear;

/** */
alias g_hook_list_init = c_g_hook_list_init;

/** */
alias g_hook_list_invoke = c_g_hook_list_invoke;

/** */
alias g_hook_list_invoke_check = c_g_hook_list_invoke_check;

/** */
alias g_hook_list_marshal = c_g_hook_list_marshal;

/** */
alias g_hook_list_marshal_check = c_g_hook_list_marshal_check;

// IOChannel

/** */
alias g_io_channel_get_type = c_g_io_channel_get_type;

/** */
alias g_io_channel_new_file = c_g_io_channel_new_file;

/** */
alias g_io_channel_unix_new = c_g_io_channel_unix_new;

/** */
alias g_io_channel_close = c_g_io_channel_close;

/** */
alias g_io_channel_flush = c_g_io_channel_flush;

/** */
alias g_io_channel_get_buffer_condition = c_g_io_channel_get_buffer_condition;

/** */
alias g_io_channel_get_buffer_size = c_g_io_channel_get_buffer_size;

/** */
alias g_io_channel_get_buffered = c_g_io_channel_get_buffered;

/** */
alias g_io_channel_get_close_on_unref = c_g_io_channel_get_close_on_unref;

/** */
alias g_io_channel_get_encoding = c_g_io_channel_get_encoding;

/** */
alias g_io_channel_get_flags = c_g_io_channel_get_flags;

/** */
alias g_io_channel_get_line_term = c_g_io_channel_get_line_term;

/** */
alias g_io_channel_init = c_g_io_channel_init;

/** */
alias g_io_channel_read = c_g_io_channel_read;

/** */
alias g_io_channel_read_chars = c_g_io_channel_read_chars;

/** */
alias g_io_channel_read_line = c_g_io_channel_read_line;

/** */
alias g_io_channel_read_line_string = c_g_io_channel_read_line_string;

/** */
alias g_io_channel_read_to_end = c_g_io_channel_read_to_end;

/** */
alias g_io_channel_read_unichar = c_g_io_channel_read_unichar;

/** */
alias g_io_channel_ref = c_g_io_channel_ref;

/** */
alias g_io_channel_seek = c_g_io_channel_seek;

/** */
alias g_io_channel_seek_position = c_g_io_channel_seek_position;

/** */
alias g_io_channel_set_buffer_size = c_g_io_channel_set_buffer_size;

/** */
alias g_io_channel_set_buffered = c_g_io_channel_set_buffered;

/** */
alias g_io_channel_set_close_on_unref = c_g_io_channel_set_close_on_unref;

/** */
alias g_io_channel_set_encoding = c_g_io_channel_set_encoding;

/** */
alias g_io_channel_set_flags = c_g_io_channel_set_flags;

/** */
alias g_io_channel_set_line_term = c_g_io_channel_set_line_term;

/** */
alias g_io_channel_shutdown = c_g_io_channel_shutdown;

/** */
alias g_io_channel_unix_get_fd = c_g_io_channel_unix_get_fd;

/** */
alias g_io_channel_unref = c_g_io_channel_unref;

/** */
alias g_io_channel_write = c_g_io_channel_write;

/** */
alias g_io_channel_write_chars = c_g_io_channel_write_chars;

/** */
alias g_io_channel_write_unichar = c_g_io_channel_write_unichar;

/** */
alias g_io_channel_error_from_errno = c_g_io_channel_error_from_errno;

/** */
alias g_io_channel_error_quark = c_g_io_channel_error_quark;

// KeyFile

/** */
alias g_key_file_get_type = c_g_key_file_get_type;

/** */
alias g_key_file_new = c_g_key_file_new;

/** */
alias g_key_file_free = c_g_key_file_free;

/** */
alias g_key_file_get_boolean = c_g_key_file_get_boolean;

/** */
alias g_key_file_get_boolean_list = c_g_key_file_get_boolean_list;

/** */
alias g_key_file_get_comment = c_g_key_file_get_comment;

/** */
alias g_key_file_get_double = c_g_key_file_get_double;

/** */
alias g_key_file_get_double_list = c_g_key_file_get_double_list;

/** */
alias g_key_file_get_groups = c_g_key_file_get_groups;

/** */
alias g_key_file_get_int64 = c_g_key_file_get_int64;

/** */
alias g_key_file_get_integer = c_g_key_file_get_integer;

/** */
alias g_key_file_get_integer_list = c_g_key_file_get_integer_list;

/** */
alias g_key_file_get_keys = c_g_key_file_get_keys;

/** */
alias g_key_file_get_locale_for_key = c_g_key_file_get_locale_for_key;

/** */
alias g_key_file_get_locale_string = c_g_key_file_get_locale_string;

/** */
alias g_key_file_get_locale_string_list = c_g_key_file_get_locale_string_list;

/** */
alias g_key_file_get_start_group = c_g_key_file_get_start_group;

/** */
alias g_key_file_get_string = c_g_key_file_get_string;

/** */
alias g_key_file_get_string_list = c_g_key_file_get_string_list;

/** */
alias g_key_file_get_uint64 = c_g_key_file_get_uint64;

/** */
alias g_key_file_get_value = c_g_key_file_get_value;

/** */
alias g_key_file_has_group = c_g_key_file_has_group;

/** */
alias g_key_file_has_key = c_g_key_file_has_key;

/** */
alias g_key_file_load_from_bytes = c_g_key_file_load_from_bytes;

/** */
alias g_key_file_load_from_data = c_g_key_file_load_from_data;

/** */
alias g_key_file_load_from_data_dirs = c_g_key_file_load_from_data_dirs;

/** */
alias g_key_file_load_from_dirs = c_g_key_file_load_from_dirs;

/** */
alias g_key_file_load_from_file = c_g_key_file_load_from_file;

/** */
alias g_key_file_ref = c_g_key_file_ref;

/** */
alias g_key_file_remove_comment = c_g_key_file_remove_comment;

/** */
alias g_key_file_remove_group = c_g_key_file_remove_group;

/** */
alias g_key_file_remove_key = c_g_key_file_remove_key;

/** */
alias g_key_file_save_to_file = c_g_key_file_save_to_file;

/** */
alias g_key_file_set_boolean = c_g_key_file_set_boolean;

/** */
alias g_key_file_set_boolean_list = c_g_key_file_set_boolean_list;

/** */
alias g_key_file_set_comment = c_g_key_file_set_comment;

/** */
alias g_key_file_set_double = c_g_key_file_set_double;

/** */
alias g_key_file_set_double_list = c_g_key_file_set_double_list;

/** */
alias g_key_file_set_int64 = c_g_key_file_set_int64;

/** */
alias g_key_file_set_integer = c_g_key_file_set_integer;

/** */
alias g_key_file_set_integer_list = c_g_key_file_set_integer_list;

/** */
alias g_key_file_set_list_separator = c_g_key_file_set_list_separator;

/** */
alias g_key_file_set_locale_string = c_g_key_file_set_locale_string;

/** */
alias g_key_file_set_locale_string_list = c_g_key_file_set_locale_string_list;

/** */
alias g_key_file_set_string = c_g_key_file_set_string;

/** */
alias g_key_file_set_string_list = c_g_key_file_set_string_list;

/** */
alias g_key_file_set_uint64 = c_g_key_file_set_uint64;

/** */
alias g_key_file_set_value = c_g_key_file_set_value;

/** */
alias g_key_file_to_data = c_g_key_file_to_data;

/** */
alias g_key_file_unref = c_g_key_file_unref;

/** */
alias g_key_file_error_quark = c_g_key_file_error_quark;

// List

/** */
alias g_list_alloc = c_g_list_alloc;

/** */
alias g_list_append = c_g_list_append;

/** */
alias g_list_concat = c_g_list_concat;

/** */
alias g_list_copy = c_g_list_copy;

/** */
alias g_list_copy_deep = c_g_list_copy_deep;

/** */
alias g_list_delete_link = c_g_list_delete_link;

/** */
alias g_list_find = c_g_list_find;

/** */
alias g_list_find_custom = c_g_list_find_custom;

/** */
alias g_list_first = c_g_list_first;

/** */
alias g_list_foreach = c_g_list_foreach;

/** */
alias g_list_free = c_g_list_free;

/** */
alias g_list_free_1 = c_g_list_free_1;

/** */
alias g_list_free_full = c_g_list_free_full;

/** */
alias g_list_index = c_g_list_index;

/** */
alias g_list_insert = c_g_list_insert;

/** */
alias g_list_insert_before = c_g_list_insert_before;

/** */
alias g_list_insert_before_link = c_g_list_insert_before_link;

/** */
alias g_list_insert_sorted = c_g_list_insert_sorted;

/** */
alias g_list_insert_sorted_with_data = c_g_list_insert_sorted_with_data;

/** */
alias g_list_last = c_g_list_last;

/** */
alias g_list_length = c_g_list_length;

/** */
alias g_list_nth = c_g_list_nth;

/** */
alias g_list_nth_data = c_g_list_nth_data;

/** */
alias g_list_nth_prev = c_g_list_nth_prev;

/** */
alias g_list_pop_allocator = c_g_list_pop_allocator;

/** */
alias g_list_position = c_g_list_position;

/** */
alias g_list_prepend = c_g_list_prepend;

/** */
alias g_list_push_allocator = c_g_list_push_allocator;

/** */
alias g_list_remove = c_g_list_remove;

/** */
alias g_list_remove_all = c_g_list_remove_all;

/** */
alias g_list_remove_link = c_g_list_remove_link;

/** */
alias g_list_reverse = c_g_list_reverse;

/** */
alias g_list_sort = c_g_list_sort;

/** */
alias g_list_sort_with_data = c_g_list_sort_with_data;

// MainContext

/** */
alias g_main_context_get_type = c_g_main_context_get_type;

/** */
alias g_main_context_new = c_g_main_context_new;

/** */
alias g_main_context_new_with_flags = c_g_main_context_new_with_flags;

/** */
alias g_main_context_acquire = c_g_main_context_acquire;

/** */
alias g_main_context_add_poll = c_g_main_context_add_poll;

/** */
alias g_main_context_check = c_g_main_context_check;

/** */
alias g_main_context_dispatch = c_g_main_context_dispatch;

/** */
alias g_main_context_find_source_by_funcs_user_data = c_g_main_context_find_source_by_funcs_user_data;

/** */
alias g_main_context_find_source_by_id = c_g_main_context_find_source_by_id;

/** */
alias g_main_context_find_source_by_user_data = c_g_main_context_find_source_by_user_data;

/** */
alias g_main_context_get_poll_func = c_g_main_context_get_poll_func;

/** */
alias g_main_context_invoke = c_g_main_context_invoke;

/** */
alias g_main_context_invoke_full = c_g_main_context_invoke_full;

/** */
alias g_main_context_is_owner = c_g_main_context_is_owner;

/** */
alias g_main_context_iteration = c_g_main_context_iteration;

/** */
alias g_main_context_pending = c_g_main_context_pending;

/** */
alias g_main_context_pop_thread_default = c_g_main_context_pop_thread_default;

/** */
alias g_main_context_prepare = c_g_main_context_prepare;

/** */
alias g_main_context_push_thread_default = c_g_main_context_push_thread_default;

/** */
alias g_main_context_pusher_new = c_g_main_context_pusher_new;

/** */
alias g_main_context_query = c_g_main_context_query;

/** */
alias g_main_context_ref = c_g_main_context_ref;

/** */
alias g_main_context_release = c_g_main_context_release;

/** */
alias g_main_context_remove_poll = c_g_main_context_remove_poll;

/** */
alias g_main_context_set_poll_func = c_g_main_context_set_poll_func;

/** */
alias g_main_context_unref = c_g_main_context_unref;

/** */
alias g_main_context_wait = c_g_main_context_wait;

/** */
alias g_main_context_wakeup = c_g_main_context_wakeup;

/** */
alias g_main_context_default = c_g_main_context_default;

/** */
alias g_main_context_get_thread_default = c_g_main_context_get_thread_default;

/** */
alias g_main_context_pusher_free = c_g_main_context_pusher_free;

/** */
alias g_main_context_ref_thread_default = c_g_main_context_ref_thread_default;

// MainLoop

/** */
alias g_main_loop_get_type = c_g_main_loop_get_type;

/** */
alias g_main_loop_new = c_g_main_loop_new;

/** */
alias g_main_loop_get_context = c_g_main_loop_get_context;

/** */
alias g_main_loop_is_running = c_g_main_loop_is_running;

/** */
alias g_main_loop_quit = c_g_main_loop_quit;

/** */
alias g_main_loop_ref = c_g_main_loop_ref;

/** */
alias g_main_loop_run = c_g_main_loop_run;

/** */
alias g_main_loop_unref = c_g_main_loop_unref;

// MappedFile

/** */
alias g_mapped_file_get_type = c_g_mapped_file_get_type;

/** */
alias g_mapped_file_new = c_g_mapped_file_new;

/** */
alias g_mapped_file_new_from_fd = c_g_mapped_file_new_from_fd;

/** */
alias g_mapped_file_free = c_g_mapped_file_free;

/** */
alias g_mapped_file_get_bytes = c_g_mapped_file_get_bytes;

/** */
alias g_mapped_file_get_contents = c_g_mapped_file_get_contents;

/** */
alias g_mapped_file_get_length = c_g_mapped_file_get_length;

/** */
alias g_mapped_file_ref = c_g_mapped_file_ref;

/** */
alias g_mapped_file_unref = c_g_mapped_file_unref;

// MarkupParseContext

/** */
alias g_markup_parse_context_get_type = c_g_markup_parse_context_get_type;

/** */
alias g_markup_parse_context_new = c_g_markup_parse_context_new;

/** */
alias g_markup_parse_context_end_parse = c_g_markup_parse_context_end_parse;

/** */
alias g_markup_parse_context_free = c_g_markup_parse_context_free;

/** */
alias g_markup_parse_context_get_element = c_g_markup_parse_context_get_element;

/** */
alias g_markup_parse_context_get_element_stack = c_g_markup_parse_context_get_element_stack;

/** */
alias g_markup_parse_context_get_offset = c_g_markup_parse_context_get_offset;

/** */
alias g_markup_parse_context_get_position = c_g_markup_parse_context_get_position;

/** */
alias g_markup_parse_context_get_tag_start = c_g_markup_parse_context_get_tag_start;

/** */
alias g_markup_parse_context_get_user_data = c_g_markup_parse_context_get_user_data;

/** */
alias g_markup_parse_context_parse = c_g_markup_parse_context_parse;

/** */
alias g_markup_parse_context_pop = c_g_markup_parse_context_pop;

/** */
alias g_markup_parse_context_push = c_g_markup_parse_context_push;

/** */
alias g_markup_parse_context_ref = c_g_markup_parse_context_ref;

/** */
alias g_markup_parse_context_unref = c_g_markup_parse_context_unref;

// MatchInfo

/** */
alias g_match_info_get_type = c_g_match_info_get_type;

/** */
alias g_match_info_expand_references = c_g_match_info_expand_references;

/** */
alias g_match_info_fetch = c_g_match_info_fetch;

/** */
alias g_match_info_fetch_all = c_g_match_info_fetch_all;

/** */
alias g_match_info_fetch_named = c_g_match_info_fetch_named;

/** */
alias g_match_info_fetch_named_pos = c_g_match_info_fetch_named_pos;

/** */
alias g_match_info_fetch_pos = c_g_match_info_fetch_pos;

/** */
alias g_match_info_free = c_g_match_info_free;

/** */
alias g_match_info_get_match_count = c_g_match_info_get_match_count;

/** */
alias g_match_info_get_regex = c_g_match_info_get_regex;

/** */
alias g_match_info_get_string = c_g_match_info_get_string;

/** */
alias g_match_info_is_partial_match = c_g_match_info_is_partial_match;

/** */
alias g_match_info_matches = c_g_match_info_matches;

/** */
alias g_match_info_next = c_g_match_info_next;

/** */
alias g_match_info_ref = c_g_match_info_ref;

/** */
alias g_match_info_unref = c_g_match_info_unref;

// MemChunk

/** */
alias g_mem_chunk_alloc = c_g_mem_chunk_alloc;

/** */
alias g_mem_chunk_alloc0 = c_g_mem_chunk_alloc0;

/** */
alias g_mem_chunk_clean = c_g_mem_chunk_clean;

/** */
alias g_mem_chunk_destroy = c_g_mem_chunk_destroy;

/** */
alias g_mem_chunk_free = c_g_mem_chunk_free;

/** */
alias g_mem_chunk_print = c_g_mem_chunk_print;

/** */
alias g_mem_chunk_reset = c_g_mem_chunk_reset;

/** */
alias g_mem_chunk_info = c_g_mem_chunk_info;

/** */
alias g_mem_chunk_new = c_g_mem_chunk_new;

// Mutex

/** */
alias g_mutex_clear = c_g_mutex_clear;

/** */
alias g_mutex_free = c_g_mutex_free;

/** */
alias g_mutex_init = c_g_mutex_init;

/** */
alias g_mutex_lock = c_g_mutex_lock;

/** */
alias g_mutex_trylock = c_g_mutex_trylock;

/** */
alias g_mutex_unlock = c_g_mutex_unlock;

/** */
alias g_mutex_new = c_g_mutex_new;

// Node

/** */
alias g_node_child_index = c_g_node_child_index;

/** */
alias g_node_child_position = c_g_node_child_position;

/** */
alias g_node_children_foreach = c_g_node_children_foreach;

/** */
alias g_node_copy = c_g_node_copy;

/** */
alias g_node_copy_deep = c_g_node_copy_deep;

/** */
alias g_node_depth = c_g_node_depth;

/** */
alias g_node_destroy = c_g_node_destroy;

/** */
alias g_node_find = c_g_node_find;

/** */
alias g_node_find_child = c_g_node_find_child;

/** */
alias g_node_first_sibling = c_g_node_first_sibling;

/** */
alias g_node_get_root = c_g_node_get_root;

/** */
alias g_node_insert = c_g_node_insert;

/** */
alias g_node_insert_after = c_g_node_insert_after;

/** */
alias g_node_insert_before = c_g_node_insert_before;

/** */
alias g_node_is_ancestor = c_g_node_is_ancestor;

/** */
alias g_node_last_child = c_g_node_last_child;

/** */
alias g_node_last_sibling = c_g_node_last_sibling;

/** */
alias g_node_max_height = c_g_node_max_height;

/** */
alias g_node_n_children = c_g_node_n_children;

/** */
alias g_node_n_nodes = c_g_node_n_nodes;

/** */
alias g_node_nth_child = c_g_node_nth_child;

/** */
alias g_node_prepend = c_g_node_prepend;

/** */
alias g_node_reverse_children = c_g_node_reverse_children;

/** */
alias g_node_traverse = c_g_node_traverse;

/** */
alias g_node_unlink = c_g_node_unlink;

/** */
alias g_node_new = c_g_node_new;

/** */
alias g_node_pop_allocator = c_g_node_pop_allocator;

/** */
alias g_node_push_allocator = c_g_node_push_allocator;

// Once

/** */
alias g_once_impl = c_g_once_impl;

/** */
alias g_once_init_enter = c_g_once_init_enter;

/** */
alias g_once_init_enter_impl = c_g_once_init_enter_impl;

/** */
alias g_once_init_enter_pointer = c_g_once_init_enter_pointer;

/** */
alias g_once_init_leave = c_g_once_init_leave;

/** */
alias g_once_init_leave_pointer = c_g_once_init_leave_pointer;

// OptionContext

/** */
alias g_option_context_add_group = c_g_option_context_add_group;

/** */
alias g_option_context_add_main_entries = c_g_option_context_add_main_entries;

/** */
alias g_option_context_free = c_g_option_context_free;

/** */
alias g_option_context_get_description = c_g_option_context_get_description;

/** */
alias g_option_context_get_help = c_g_option_context_get_help;

/** */
alias g_option_context_get_help_enabled = c_g_option_context_get_help_enabled;

/** */
alias g_option_context_get_ignore_unknown_options = c_g_option_context_get_ignore_unknown_options;

/** */
alias g_option_context_get_main_group = c_g_option_context_get_main_group;

/** */
alias g_option_context_get_strict_posix = c_g_option_context_get_strict_posix;

/** */
alias g_option_context_get_summary = c_g_option_context_get_summary;

/** */
alias g_option_context_parse = c_g_option_context_parse;

/** */
alias g_option_context_parse_strv = c_g_option_context_parse_strv;

/** */
alias g_option_context_set_description = c_g_option_context_set_description;

/** */
alias g_option_context_set_help_enabled = c_g_option_context_set_help_enabled;

/** */
alias g_option_context_set_ignore_unknown_options = c_g_option_context_set_ignore_unknown_options;

/** */
alias g_option_context_set_main_group = c_g_option_context_set_main_group;

/** */
alias g_option_context_set_strict_posix = c_g_option_context_set_strict_posix;

/** */
alias g_option_context_set_summary = c_g_option_context_set_summary;

/** */
alias g_option_context_set_translate_func = c_g_option_context_set_translate_func;

/** */
alias g_option_context_set_translation_domain = c_g_option_context_set_translation_domain;

/** */
alias g_option_context_new = c_g_option_context_new;

// OptionGroup

/** */
alias g_option_group_get_type = c_g_option_group_get_type;

/** */
alias g_option_group_new = c_g_option_group_new;

/** */
alias g_option_group_add_entries = c_g_option_group_add_entries;

/** */
alias g_option_group_free = c_g_option_group_free;

/** */
alias g_option_group_ref = c_g_option_group_ref;

/** */
alias g_option_group_set_error_hook = c_g_option_group_set_error_hook;

/** */
alias g_option_group_set_parse_hooks = c_g_option_group_set_parse_hooks;

/** */
alias g_option_group_set_translate_func = c_g_option_group_set_translate_func;

/** */
alias g_option_group_set_translation_domain = c_g_option_group_set_translation_domain;

/** */
alias g_option_group_unref = c_g_option_group_unref;

// PathBuf

/** */
alias g_path_buf_clear = c_g_path_buf_clear;

/** */
alias g_path_buf_clear_to_path = c_g_path_buf_clear_to_path;

/** */
alias g_path_buf_copy = c_g_path_buf_copy;

/** */
alias g_path_buf_free = c_g_path_buf_free;

/** */
alias g_path_buf_free_to_path = c_g_path_buf_free_to_path;

/** */
alias g_path_buf_init = c_g_path_buf_init;

/** */
alias g_path_buf_init_from_path = c_g_path_buf_init_from_path;

/** */
alias g_path_buf_pop = c_g_path_buf_pop;

/** */
alias g_path_buf_push = c_g_path_buf_push;

/** */
alias g_path_buf_set_extension = c_g_path_buf_set_extension;

/** */
alias g_path_buf_set_filename = c_g_path_buf_set_filename;

/** */
alias g_path_buf_to_path = c_g_path_buf_to_path;

/** */
alias g_path_buf_equal = c_g_path_buf_equal;

/** */
alias g_path_buf_new = c_g_path_buf_new;

/** */
alias g_path_buf_new_from_path = c_g_path_buf_new_from_path;

// PatternSpec

/** */
alias g_pattern_spec_get_type = c_g_pattern_spec_get_type;

/** */
alias g_pattern_spec_new = c_g_pattern_spec_new;

/** */
alias g_pattern_spec_copy = c_g_pattern_spec_copy;

/** */
alias g_pattern_spec_equal = c_g_pattern_spec_equal;

/** */
alias g_pattern_spec_free = c_g_pattern_spec_free;

/** */
alias g_pattern_spec_match = c_g_pattern_spec_match;

/** */
alias g_pattern_spec_match_string = c_g_pattern_spec_match_string;

// PollFD

/** */
alias g_pollfd_get_type = c_g_pollfd_get_type;

// Private

/** */
alias g_private_get = c_g_private_get;

/** */
alias g_private_replace = c_g_private_replace;

/** */
alias g_private_set = c_g_private_set;

/** */
alias g_private_new = c_g_private_new;

// PtrArray

/** */
alias g_ptr_array_get_type = c_g_ptr_array_get_type;

/** */
alias g_ptr_array_add = c_g_ptr_array_add;

/** */
alias g_ptr_array_copy = c_g_ptr_array_copy;

/** */
alias g_ptr_array_extend = c_g_ptr_array_extend;

/** */
alias g_ptr_array_extend_and_steal = c_g_ptr_array_extend_and_steal;

/** */
alias g_ptr_array_find = c_g_ptr_array_find;

/** */
alias g_ptr_array_find_with_equal_func = c_g_ptr_array_find_with_equal_func;

/** */
alias g_ptr_array_foreach = c_g_ptr_array_foreach;

/** */
alias g_ptr_array_free = c_g_ptr_array_free;

/** */
alias g_ptr_array_insert = c_g_ptr_array_insert;

/** */
alias g_ptr_array_is_null_terminated = c_g_ptr_array_is_null_terminated;

/** */
alias g_ptr_array_new = c_g_ptr_array_new;

/** */
alias g_ptr_array_new_from_array = c_g_ptr_array_new_from_array;

/** */
alias g_ptr_array_new_from_null_terminated_array = c_g_ptr_array_new_from_null_terminated_array;

/** */
alias g_ptr_array_new_full = c_g_ptr_array_new_full;

/** */
alias g_ptr_array_new_null_terminated = c_g_ptr_array_new_null_terminated;

/** */
alias g_ptr_array_new_take = c_g_ptr_array_new_take;

/** */
alias g_ptr_array_new_take_null_terminated = c_g_ptr_array_new_take_null_terminated;

/** */
alias g_ptr_array_new_with_free_func = c_g_ptr_array_new_with_free_func;

/** */
alias g_ptr_array_ref = c_g_ptr_array_ref;

/** */
alias g_ptr_array_remove = c_g_ptr_array_remove;

/** */
alias g_ptr_array_remove_fast = c_g_ptr_array_remove_fast;

/** */
alias g_ptr_array_remove_index = c_g_ptr_array_remove_index;

/** */
alias g_ptr_array_remove_index_fast = c_g_ptr_array_remove_index_fast;

/** */
alias g_ptr_array_remove_range = c_g_ptr_array_remove_range;

/** */
alias g_ptr_array_set_free_func = c_g_ptr_array_set_free_func;

/** */
alias g_ptr_array_set_size = c_g_ptr_array_set_size;

/** */
alias g_ptr_array_sized_new = c_g_ptr_array_sized_new;

/** */
alias g_ptr_array_sort = c_g_ptr_array_sort;

/** */
alias g_ptr_array_sort_values = c_g_ptr_array_sort_values;

/** */
alias g_ptr_array_sort_values_with_data = c_g_ptr_array_sort_values_with_data;

/** */
alias g_ptr_array_sort_with_data = c_g_ptr_array_sort_with_data;

/** */
alias g_ptr_array_steal = c_g_ptr_array_steal;

/** */
alias g_ptr_array_steal_index = c_g_ptr_array_steal_index;

/** */
alias g_ptr_array_steal_index_fast = c_g_ptr_array_steal_index_fast;

/** */
alias g_ptr_array_unref = c_g_ptr_array_unref;

// Queue

/** */
alias g_queue_clear = c_g_queue_clear;

/** */
alias g_queue_clear_full = c_g_queue_clear_full;

/** */
alias g_queue_copy = c_g_queue_copy;

/** */
alias g_queue_delete_link = c_g_queue_delete_link;

/** */
alias g_queue_find = c_g_queue_find;

/** */
alias g_queue_find_custom = c_g_queue_find_custom;

/** */
alias g_queue_foreach = c_g_queue_foreach;

/** */
alias g_queue_free = c_g_queue_free;

/** */
alias g_queue_free_full = c_g_queue_free_full;

/** */
alias g_queue_get_length = c_g_queue_get_length;

/** */
alias g_queue_index = c_g_queue_index;

/** */
alias g_queue_init = c_g_queue_init;

/** */
alias g_queue_insert_after = c_g_queue_insert_after;

/** */
alias g_queue_insert_after_link = c_g_queue_insert_after_link;

/** */
alias g_queue_insert_before = c_g_queue_insert_before;

/** */
alias g_queue_insert_before_link = c_g_queue_insert_before_link;

/** */
alias g_queue_insert_sorted = c_g_queue_insert_sorted;

/** */
alias g_queue_is_empty = c_g_queue_is_empty;

/** */
alias g_queue_link_index = c_g_queue_link_index;

/** */
alias g_queue_peek_head = c_g_queue_peek_head;

/** */
alias g_queue_peek_head_link = c_g_queue_peek_head_link;

/** */
alias g_queue_peek_nth = c_g_queue_peek_nth;

/** */
alias g_queue_peek_nth_link = c_g_queue_peek_nth_link;

/** */
alias g_queue_peek_tail = c_g_queue_peek_tail;

/** */
alias g_queue_peek_tail_link = c_g_queue_peek_tail_link;

/** */
alias g_queue_pop_head = c_g_queue_pop_head;

/** */
alias g_queue_pop_head_link = c_g_queue_pop_head_link;

/** */
alias g_queue_pop_nth = c_g_queue_pop_nth;

/** */
alias g_queue_pop_nth_link = c_g_queue_pop_nth_link;

/** */
alias g_queue_pop_tail = c_g_queue_pop_tail;

/** */
alias g_queue_pop_tail_link = c_g_queue_pop_tail_link;

/** */
alias g_queue_push_head = c_g_queue_push_head;

/** */
alias g_queue_push_head_link = c_g_queue_push_head_link;

/** */
alias g_queue_push_nth = c_g_queue_push_nth;

/** */
alias g_queue_push_nth_link = c_g_queue_push_nth_link;

/** */
alias g_queue_push_tail = c_g_queue_push_tail;

/** */
alias g_queue_push_tail_link = c_g_queue_push_tail_link;

/** */
alias g_queue_remove = c_g_queue_remove;

/** */
alias g_queue_remove_all = c_g_queue_remove_all;

/** */
alias g_queue_reverse = c_g_queue_reverse;

/** */
alias g_queue_sort = c_g_queue_sort;

/** */
alias g_queue_unlink = c_g_queue_unlink;

/** */
alias g_queue_new = c_g_queue_new;

// RWLock

/** */
alias g_rw_lock_clear = c_g_rw_lock_clear;

/** */
alias g_rw_lock_init = c_g_rw_lock_init;

/** */
alias g_rw_lock_reader_lock = c_g_rw_lock_reader_lock;

/** */
alias g_rw_lock_reader_trylock = c_g_rw_lock_reader_trylock;

/** */
alias g_rw_lock_reader_unlock = c_g_rw_lock_reader_unlock;

/** */
alias g_rw_lock_writer_lock = c_g_rw_lock_writer_lock;

/** */
alias g_rw_lock_writer_trylock = c_g_rw_lock_writer_trylock;

/** */
alias g_rw_lock_writer_unlock = c_g_rw_lock_writer_unlock;

// Rand

/** */
alias g_rand_get_type = c_g_rand_get_type;

/** */
alias g_rand_new = c_g_rand_new;

/** */
alias g_rand_new_with_seed = c_g_rand_new_with_seed;

/** */
alias g_rand_new_with_seed_array = c_g_rand_new_with_seed_array;

/** */
alias g_rand_copy = c_g_rand_copy;

/** */
alias g_rand_double = c_g_rand_double;

/** */
alias g_rand_double_range = c_g_rand_double_range;

/** */
alias g_rand_free = c_g_rand_free;

/** */
alias g_rand_int = c_g_rand_int;

/** */
alias g_rand_int_range = c_g_rand_int_range;

/** */
alias g_rand_set_seed = c_g_rand_set_seed;

/** */
alias g_rand_set_seed_array = c_g_rand_set_seed_array;

// RecMutex

/** */
alias g_rec_mutex_clear = c_g_rec_mutex_clear;

/** */
alias g_rec_mutex_init = c_g_rec_mutex_init;

/** */
alias g_rec_mutex_lock = c_g_rec_mutex_lock;

/** */
alias g_rec_mutex_trylock = c_g_rec_mutex_trylock;

/** */
alias g_rec_mutex_unlock = c_g_rec_mutex_unlock;

// Regex

/** */
alias g_regex_get_type = c_g_regex_get_type;

/** */
alias g_regex_new = c_g_regex_new;

/** */
alias g_regex_get_capture_count = c_g_regex_get_capture_count;

/** */
alias g_regex_get_compile_flags = c_g_regex_get_compile_flags;

/** */
alias g_regex_get_has_cr_or_lf = c_g_regex_get_has_cr_or_lf;

/** */
alias g_regex_get_match_flags = c_g_regex_get_match_flags;

/** */
alias g_regex_get_max_backref = c_g_regex_get_max_backref;

/** */
alias g_regex_get_max_lookbehind = c_g_regex_get_max_lookbehind;

/** */
alias g_regex_get_pattern = c_g_regex_get_pattern;

/** */
alias g_regex_get_string_number = c_g_regex_get_string_number;

/** */
alias g_regex_match = c_g_regex_match;

/** */
alias g_regex_match_all = c_g_regex_match_all;

/** */
alias g_regex_match_all_full = c_g_regex_match_all_full;

/** */
alias g_regex_match_full = c_g_regex_match_full;

/** */
alias g_regex_ref = c_g_regex_ref;

/** */
alias g_regex_replace = c_g_regex_replace;

/** */
alias g_regex_replace_eval = c_g_regex_replace_eval;

/** */
alias g_regex_replace_literal = c_g_regex_replace_literal;

/** */
alias g_regex_split = c_g_regex_split;

/** */
alias g_regex_split_full = c_g_regex_split_full;

/** */
alias g_regex_unref = c_g_regex_unref;

/** */
alias g_regex_check_replacement = c_g_regex_check_replacement;

/** */
alias g_regex_error_quark = c_g_regex_error_quark;

/** */
alias g_regex_escape_nul = c_g_regex_escape_nul;

/** */
alias g_regex_escape_string = c_g_regex_escape_string;

/** */
alias g_regex_match_simple = c_g_regex_match_simple;

/** */
alias g_regex_split_simple = c_g_regex_split_simple;

// Relation

/** */
alias g_relation_count = c_g_relation_count;

/** */
alias g_relation_delete = c_g_relation_delete;

/** */
alias g_relation_destroy = c_g_relation_destroy;

/** */
alias g_relation_exists = c_g_relation_exists;

/** */
alias g_relation_index = c_g_relation_index;

/** */
alias g_relation_insert = c_g_relation_insert;

/** */
alias g_relation_print = c_g_relation_print;

/** */
alias g_relation_select = c_g_relation_select;

/** */
alias g_relation_new = c_g_relation_new;

// SList

/** */
alias g_slist_alloc = c_g_slist_alloc;

/** */
alias g_slist_append = c_g_slist_append;

/** */
alias g_slist_concat = c_g_slist_concat;

/** */
alias g_slist_copy = c_g_slist_copy;

/** */
alias g_slist_copy_deep = c_g_slist_copy_deep;

/** */
alias g_slist_delete_link = c_g_slist_delete_link;

/** */
alias g_slist_find = c_g_slist_find;

/** */
alias g_slist_find_custom = c_g_slist_find_custom;

/** */
alias g_slist_foreach = c_g_slist_foreach;

/** */
alias g_slist_free = c_g_slist_free;

/** */
alias g_slist_free_1 = c_g_slist_free_1;

/** */
alias g_slist_free_full = c_g_slist_free_full;

/** */
alias g_slist_index = c_g_slist_index;

/** */
alias g_slist_insert = c_g_slist_insert;

/** */
alias g_slist_insert_before = c_g_slist_insert_before;

/** */
alias g_slist_insert_sorted = c_g_slist_insert_sorted;

/** */
alias g_slist_insert_sorted_with_data = c_g_slist_insert_sorted_with_data;

/** */
alias g_slist_last = c_g_slist_last;

/** */
alias g_slist_length = c_g_slist_length;

/** */
alias g_slist_nth = c_g_slist_nth;

/** */
alias g_slist_nth_data = c_g_slist_nth_data;

/** */
alias g_slist_pop_allocator = c_g_slist_pop_allocator;

/** */
alias g_slist_position = c_g_slist_position;

/** */
alias g_slist_prepend = c_g_slist_prepend;

/** */
alias g_slist_push_allocator = c_g_slist_push_allocator;

/** */
alias g_slist_remove = c_g_slist_remove;

/** */
alias g_slist_remove_all = c_g_slist_remove_all;

/** */
alias g_slist_remove_link = c_g_slist_remove_link;

/** */
alias g_slist_reverse = c_g_slist_reverse;

/** */
alias g_slist_sort = c_g_slist_sort;

/** */
alias g_slist_sort_with_data = c_g_slist_sort_with_data;

// Scanner

/** */
alias g_scanner_cur_line = c_g_scanner_cur_line;

/** */
alias g_scanner_cur_position = c_g_scanner_cur_position;

/** */
alias g_scanner_cur_token = c_g_scanner_cur_token;

/** */
alias g_scanner_cur_value = c_g_scanner_cur_value;

/** */
alias g_scanner_destroy = c_g_scanner_destroy;

/** */
alias g_scanner_eof = c_g_scanner_eof;

/** */
alias g_scanner_error = c_g_scanner_error;

/** */
alias g_scanner_get_next_token = c_g_scanner_get_next_token;

/** */
alias g_scanner_input_file = c_g_scanner_input_file;

/** */
alias g_scanner_input_text = c_g_scanner_input_text;

/** */
alias g_scanner_lookup_symbol = c_g_scanner_lookup_symbol;

/** */
alias g_scanner_peek_next_token = c_g_scanner_peek_next_token;

/** */
alias g_scanner_scope_add_symbol = c_g_scanner_scope_add_symbol;

/** */
alias g_scanner_scope_foreach_symbol = c_g_scanner_scope_foreach_symbol;

/** */
alias g_scanner_scope_lookup_symbol = c_g_scanner_scope_lookup_symbol;

/** */
alias g_scanner_scope_remove_symbol = c_g_scanner_scope_remove_symbol;

/** */
alias g_scanner_set_scope = c_g_scanner_set_scope;

/** */
alias g_scanner_sync_file_offset = c_g_scanner_sync_file_offset;

/** */
alias g_scanner_unexp_token = c_g_scanner_unexp_token;

/** */
alias g_scanner_warn = c_g_scanner_warn;

/** */
alias g_scanner_new = c_g_scanner_new;

// Sequence

/** */
alias g_sequence_append = c_g_sequence_append;

/** */
alias g_sequence_foreach = c_g_sequence_foreach;

/** */
alias g_sequence_free = c_g_sequence_free;

/** */
alias g_sequence_get_begin_iter = c_g_sequence_get_begin_iter;

/** */
alias g_sequence_get_end_iter = c_g_sequence_get_end_iter;

/** */
alias g_sequence_get_iter_at_pos = c_g_sequence_get_iter_at_pos;

/** */
alias g_sequence_get_length = c_g_sequence_get_length;

/** */
alias g_sequence_insert_sorted = c_g_sequence_insert_sorted;

/** */
alias g_sequence_insert_sorted_iter = c_g_sequence_insert_sorted_iter;

/** */
alias g_sequence_is_empty = c_g_sequence_is_empty;

/** */
alias g_sequence_lookup = c_g_sequence_lookup;

/** */
alias g_sequence_lookup_iter = c_g_sequence_lookup_iter;

/** */
alias g_sequence_prepend = c_g_sequence_prepend;

/** */
alias g_sequence_search = c_g_sequence_search;

/** */
alias g_sequence_search_iter = c_g_sequence_search_iter;

/** */
alias g_sequence_sort = c_g_sequence_sort;

/** */
alias g_sequence_sort_iter = c_g_sequence_sort_iter;

/** */
alias g_sequence_foreach_range = c_g_sequence_foreach_range;

/** */
alias g_sequence_get = c_g_sequence_get;

/** */
alias g_sequence_insert_before = c_g_sequence_insert_before;

/** */
alias g_sequence_move = c_g_sequence_move;

/** */
alias g_sequence_move_range = c_g_sequence_move_range;

/** */
alias g_sequence_new = c_g_sequence_new;

/** */
alias g_sequence_range_get_midpoint = c_g_sequence_range_get_midpoint;

/** */
alias g_sequence_remove = c_g_sequence_remove;

/** */
alias g_sequence_remove_range = c_g_sequence_remove_range;

/** */
alias g_sequence_set = c_g_sequence_set;

/** */
alias g_sequence_sort_changed = c_g_sequence_sort_changed;

/** */
alias g_sequence_sort_changed_iter = c_g_sequence_sort_changed_iter;

/** */
alias g_sequence_swap = c_g_sequence_swap;

// SequenceIter

/** */
alias g_sequence_iter_compare = c_g_sequence_iter_compare;

/** */
alias g_sequence_iter_get_position = c_g_sequence_iter_get_position;

/** */
alias g_sequence_iter_get_sequence = c_g_sequence_iter_get_sequence;

/** */
alias g_sequence_iter_is_begin = c_g_sequence_iter_is_begin;

/** */
alias g_sequence_iter_is_end = c_g_sequence_iter_is_end;

/** */
alias g_sequence_iter_move = c_g_sequence_iter_move;

/** */
alias g_sequence_iter_next = c_g_sequence_iter_next;

/** */
alias g_sequence_iter_prev = c_g_sequence_iter_prev;

// Source

/** */
alias g_source_get_type = c_g_source_get_type;

/** */
alias g_source_new = c_g_source_new;

/** */
alias g_source_add_child_source = c_g_source_add_child_source;

/** */
alias g_source_add_poll = c_g_source_add_poll;

/** */
alias g_source_add_unix_fd = c_g_source_add_unix_fd;

/** */
alias g_source_attach = c_g_source_attach;

/** */
alias g_source_destroy = c_g_source_destroy;

/** */
alias g_source_dup_context = c_g_source_dup_context;

/** */
alias g_source_get_can_recurse = c_g_source_get_can_recurse;

/** */
alias g_source_get_context = c_g_source_get_context;

/** */
alias g_source_get_current_time = c_g_source_get_current_time;

/** */
alias g_source_get_id = c_g_source_get_id;

/** */
alias g_source_get_name = c_g_source_get_name;

/** */
alias g_source_get_priority = c_g_source_get_priority;

/** */
alias g_source_get_ready_time = c_g_source_get_ready_time;

/** */
alias g_source_get_time = c_g_source_get_time;

/** */
alias g_source_is_destroyed = c_g_source_is_destroyed;

/** */
alias g_source_modify_unix_fd = c_g_source_modify_unix_fd;

/** */
alias g_source_query_unix_fd = c_g_source_query_unix_fd;

/** */
alias g_source_ref = c_g_source_ref;

/** */
alias g_source_remove_child_source = c_g_source_remove_child_source;

/** */
alias g_source_remove_poll = c_g_source_remove_poll;

/** */
alias g_source_remove_unix_fd = c_g_source_remove_unix_fd;

/** */
alias g_source_set_callback = c_g_source_set_callback;

/** */
alias g_source_set_callback_indirect = c_g_source_set_callback_indirect;

/** */
alias g_source_set_can_recurse = c_g_source_set_can_recurse;

/** */
alias g_source_set_dispose_function = c_g_source_set_dispose_function;

/** */
alias g_source_set_funcs = c_g_source_set_funcs;

/** */
alias g_source_set_name = c_g_source_set_name;

/** */
alias g_source_set_priority = c_g_source_set_priority;

/** */
alias g_source_set_ready_time = c_g_source_set_ready_time;

/** */
alias g_source_set_static_name = c_g_source_set_static_name;

/** */
alias g_source_unref = c_g_source_unref;

/** */
alias g_source_remove = c_g_source_remove;

/** */
alias g_source_remove_by_funcs_user_data = c_g_source_remove_by_funcs_user_data;

/** */
alias g_source_remove_by_user_data = c_g_source_remove_by_user_data;

/** */
alias g_source_set_name_by_id = c_g_source_set_name_by_id;

// StaticMutex

/** */
alias g_static_mutex_free = c_g_static_mutex_free;

/** */
alias g_static_mutex_get_mutex_impl = c_g_static_mutex_get_mutex_impl;

/** */
alias g_static_mutex_init = c_g_static_mutex_init;

// StaticPrivate

/** */
alias g_static_private_free = c_g_static_private_free;

/** */
alias g_static_private_get = c_g_static_private_get;

/** */
alias g_static_private_init = c_g_static_private_init;

/** */
alias g_static_private_set = c_g_static_private_set;

// StaticRWLock

/** */
alias g_static_rw_lock_free = c_g_static_rw_lock_free;

/** */
alias g_static_rw_lock_init = c_g_static_rw_lock_init;

/** */
alias g_static_rw_lock_reader_lock = c_g_static_rw_lock_reader_lock;

/** */
alias g_static_rw_lock_reader_trylock = c_g_static_rw_lock_reader_trylock;

/** */
alias g_static_rw_lock_reader_unlock = c_g_static_rw_lock_reader_unlock;

/** */
alias g_static_rw_lock_writer_lock = c_g_static_rw_lock_writer_lock;

/** */
alias g_static_rw_lock_writer_trylock = c_g_static_rw_lock_writer_trylock;

/** */
alias g_static_rw_lock_writer_unlock = c_g_static_rw_lock_writer_unlock;

// StaticRecMutex

/** */
alias g_static_rec_mutex_free = c_g_static_rec_mutex_free;

/** */
alias g_static_rec_mutex_init = c_g_static_rec_mutex_init;

/** */
alias g_static_rec_mutex_lock = c_g_static_rec_mutex_lock;

/** */
alias g_static_rec_mutex_lock_full = c_g_static_rec_mutex_lock_full;

/** */
alias g_static_rec_mutex_trylock = c_g_static_rec_mutex_trylock;

/** */
alias g_static_rec_mutex_unlock = c_g_static_rec_mutex_unlock;

/** */
alias g_static_rec_mutex_unlock_full = c_g_static_rec_mutex_unlock_full;

// String

/** */
alias g_gstring_get_type = c_g_gstring_get_type;

/** */
alias g_string_new = c_g_string_new;

/** */
alias g_string_new_len = c_g_string_new_len;

/** */
alias g_string_new_take = c_g_string_new_take;

/** */
alias g_string_sized_new = c_g_string_sized_new;

/** */
alias g_string_append = c_g_string_append;

/** */
alias g_string_append_c = c_g_string_append_c;

/** */
alias g_string_append_len = c_g_string_append_len;

/** */
alias g_string_append_printf = c_g_string_append_printf;

/** */
alias g_string_append_unichar = c_g_string_append_unichar;

/** */
alias g_string_append_uri_escaped = c_g_string_append_uri_escaped;

/** */
alias g_string_append_vprintf = c_g_string_append_vprintf;

/** */
alias g_string_ascii_down = c_g_string_ascii_down;

/** */
alias g_string_ascii_up = c_g_string_ascii_up;

/** */
alias g_string_assign = c_g_string_assign;

/** */
alias g_string_copy = c_g_string_copy;

/** */
alias g_string_down = c_g_string_down;

/** */
alias g_string_equal = c_g_string_equal;

/** */
alias g_string_erase = c_g_string_erase;

/** */
alias g_string_free = c_g_string_free;

/** */
alias g_string_free_and_steal = c_g_string_free_and_steal;

/** */
alias g_string_free_to_bytes = c_g_string_free_to_bytes;

/** */
alias g_string_hash = c_g_string_hash;

/** */
alias g_string_insert = c_g_string_insert;

/** */
alias g_string_insert_c = c_g_string_insert_c;

/** */
alias g_string_insert_len = c_g_string_insert_len;

/** */
alias g_string_insert_unichar = c_g_string_insert_unichar;

/** */
alias g_string_overwrite = c_g_string_overwrite;

/** */
alias g_string_overwrite_len = c_g_string_overwrite_len;

/** */
alias g_string_prepend = c_g_string_prepend;

/** */
alias g_string_prepend_c = c_g_string_prepend_c;

/** */
alias g_string_prepend_len = c_g_string_prepend_len;

/** */
alias g_string_prepend_unichar = c_g_string_prepend_unichar;

/** */
alias g_string_printf = c_g_string_printf;

/** */
alias g_string_replace = c_g_string_replace;

/** */
alias g_string_set_size = c_g_string_set_size;

/** */
alias g_string_truncate = c_g_string_truncate;

/** */
alias g_string_up = c_g_string_up;

/** */
alias g_string_vprintf = c_g_string_vprintf;

// StringChunk

/** */
alias g_string_chunk_clear = c_g_string_chunk_clear;

/** */
alias g_string_chunk_free = c_g_string_chunk_free;

/** */
alias g_string_chunk_insert = c_g_string_chunk_insert;

/** */
alias g_string_chunk_insert_const = c_g_string_chunk_insert_const;

/** */
alias g_string_chunk_insert_len = c_g_string_chunk_insert_len;

/** */
alias g_string_chunk_new = c_g_string_chunk_new;

// StrvBuilder

/** */
alias g_strv_builder_get_type = c_g_strv_builder_get_type;

/** */
alias g_strv_builder_new = c_g_strv_builder_new;

/** */
alias g_strv_builder_add = c_g_strv_builder_add;

/** */
alias g_strv_builder_add_many = c_g_strv_builder_add_many;

/** */
alias g_strv_builder_addv = c_g_strv_builder_addv;

/** */
alias g_strv_builder_end = c_g_strv_builder_end;

/** */
alias g_strv_builder_ref = c_g_strv_builder_ref;

/** */
alias g_strv_builder_take = c_g_strv_builder_take;

/** */
alias g_strv_builder_unref = c_g_strv_builder_unref;

/** */
alias g_strv_builder_unref_to_strv = c_g_strv_builder_unref_to_strv;

// TestCase

/** */
alias g_test_case_free = c_g_test_case_free;

// TestLogBuffer

/** */
alias g_test_log_buffer_free = c_g_test_log_buffer_free;

/** */
alias g_test_log_buffer_pop = c_g_test_log_buffer_pop;

/** */
alias g_test_log_buffer_push = c_g_test_log_buffer_push;

/** */
alias g_test_log_buffer_new = c_g_test_log_buffer_new;

// TestLogMsg

/** */
alias g_test_log_msg_free = c_g_test_log_msg_free;

// TestSuite

/** */
alias g_test_suite_add = c_g_test_suite_add;

/** */
alias g_test_suite_add_suite = c_g_test_suite_add_suite;

/** */
alias g_test_suite_free = c_g_test_suite_free;

// Thread

/** */
alias g_thread_get_type = c_g_thread_get_type;

/** */
alias g_thread_new = c_g_thread_new;

/** */
alias g_thread_try_new = c_g_thread_try_new;

/** */
alias g_thread_get_name = c_g_thread_get_name;

/** */
alias g_thread_join = c_g_thread_join;

/** */
alias g_thread_ref = c_g_thread_ref;

/** */
alias g_thread_set_priority = c_g_thread_set_priority;

/** */
alias g_thread_unref = c_g_thread_unref;

/** */
alias g_thread_create = c_g_thread_create;

/** */
alias g_thread_create_full = c_g_thread_create_full;

/** */
alias g_thread_error_quark = c_g_thread_error_quark;

/** */
alias g_thread_exit = c_g_thread_exit;

/** */
alias g_thread_foreach = c_g_thread_foreach;

/** */
alias g_thread_get_initialized = c_g_thread_get_initialized;

/** */
alias g_thread_init = c_g_thread_init;

/** */
alias g_thread_init_with_errorcheck_mutexes = c_g_thread_init_with_errorcheck_mutexes;

/** */
alias g_thread_self = c_g_thread_self;

/** */
alias g_thread_yield = c_g_thread_yield;

// ThreadPool

/** */
alias g_thread_pool_free = c_g_thread_pool_free;

/** */
alias g_thread_pool_get_max_threads = c_g_thread_pool_get_max_threads;

/** */
alias g_thread_pool_get_num_threads = c_g_thread_pool_get_num_threads;

/** */
alias g_thread_pool_move_to_front = c_g_thread_pool_move_to_front;

/** */
alias g_thread_pool_push = c_g_thread_pool_push;

/** */
alias g_thread_pool_set_max_threads = c_g_thread_pool_set_max_threads;

/** */
alias g_thread_pool_set_sort_function = c_g_thread_pool_set_sort_function;

/** */
alias g_thread_pool_unprocessed = c_g_thread_pool_unprocessed;

/** */
alias g_thread_pool_get_max_idle_time = c_g_thread_pool_get_max_idle_time;

/** */
alias g_thread_pool_get_max_unused_threads = c_g_thread_pool_get_max_unused_threads;

/** */
alias g_thread_pool_get_num_unused_threads = c_g_thread_pool_get_num_unused_threads;

/** */
alias g_thread_pool_new = c_g_thread_pool_new;

/** */
alias g_thread_pool_new_full = c_g_thread_pool_new_full;

/** */
alias g_thread_pool_set_max_idle_time = c_g_thread_pool_set_max_idle_time;

/** */
alias g_thread_pool_set_max_unused_threads = c_g_thread_pool_set_max_unused_threads;

/** */
alias g_thread_pool_stop_unused_threads = c_g_thread_pool_stop_unused_threads;

// TimeVal

/** */
alias g_time_val_add = c_g_time_val_add;

/** */
alias g_time_val_to_iso8601 = c_g_time_val_to_iso8601;

/** */
alias g_time_val_from_iso8601 = c_g_time_val_from_iso8601;

// TimeZone

/** */
alias g_time_zone_get_type = c_g_time_zone_get_type;

/** */
alias g_time_zone_new = c_g_time_zone_new;

/** */
alias g_time_zone_new_identifier = c_g_time_zone_new_identifier;

/** */
alias g_time_zone_new_local = c_g_time_zone_new_local;

/** */
alias g_time_zone_new_offset = c_g_time_zone_new_offset;

/** */
alias g_time_zone_new_utc = c_g_time_zone_new_utc;

/** */
alias g_time_zone_adjust_time = c_g_time_zone_adjust_time;

/** */
alias g_time_zone_find_interval = c_g_time_zone_find_interval;

/** */
alias g_time_zone_get_abbreviation = c_g_time_zone_get_abbreviation;

/** */
alias g_time_zone_get_identifier = c_g_time_zone_get_identifier;

/** */
alias g_time_zone_get_offset = c_g_time_zone_get_offset;

/** */
alias g_time_zone_is_dst = c_g_time_zone_is_dst;

/** */
alias g_time_zone_ref = c_g_time_zone_ref;

/** */
alias g_time_zone_unref = c_g_time_zone_unref;

// Timer

/** */
alias g_timer_continue = c_g_timer_continue;

/** */
alias g_timer_destroy = c_g_timer_destroy;

/** */
alias g_timer_elapsed = c_g_timer_elapsed;

/** */
alias g_timer_is_active = c_g_timer_is_active;

/** */
alias g_timer_reset = c_g_timer_reset;

/** */
alias g_timer_start = c_g_timer_start;

/** */
alias g_timer_stop = c_g_timer_stop;

/** */
alias g_timer_new = c_g_timer_new;

// TrashStack

/** */
alias g_trash_stack_height = c_g_trash_stack_height;

/** */
alias g_trash_stack_peek = c_g_trash_stack_peek;

/** */
alias g_trash_stack_pop = c_g_trash_stack_pop;

/** */
alias g_trash_stack_push = c_g_trash_stack_push;

// Tree

/** */
alias g_tree_get_type = c_g_tree_get_type;

/** */
alias g_tree_new = c_g_tree_new;

/** */
alias g_tree_new_full = c_g_tree_new_full;

/** */
alias g_tree_new_with_data = c_g_tree_new_with_data;

/** */
alias g_tree_destroy = c_g_tree_destroy;

/** */
alias g_tree_foreach = c_g_tree_foreach;

/** */
alias g_tree_foreach_node = c_g_tree_foreach_node;

/** */
alias g_tree_height = c_g_tree_height;

/** */
alias g_tree_insert = c_g_tree_insert;

/** */
alias g_tree_insert_node = c_g_tree_insert_node;

/** */
alias g_tree_lookup = c_g_tree_lookup;

/** */
alias g_tree_lookup_extended = c_g_tree_lookup_extended;

/** */
alias g_tree_lookup_node = c_g_tree_lookup_node;

/** */
alias g_tree_lower_bound = c_g_tree_lower_bound;

/** */
alias g_tree_nnodes = c_g_tree_nnodes;

/** */
alias g_tree_node_first = c_g_tree_node_first;

/** */
alias g_tree_node_last = c_g_tree_node_last;

/** */
alias g_tree_ref = c_g_tree_ref;

/** */
alias g_tree_remove = c_g_tree_remove;

/** */
alias g_tree_remove_all = c_g_tree_remove_all;

/** */
alias g_tree_replace = c_g_tree_replace;

/** */
alias g_tree_replace_node = c_g_tree_replace_node;

/** */
alias g_tree_search = c_g_tree_search;

/** */
alias g_tree_search_node = c_g_tree_search_node;

/** */
alias g_tree_steal = c_g_tree_steal;

/** */
alias g_tree_traverse = c_g_tree_traverse;

/** */
alias g_tree_unref = c_g_tree_unref;

/** */
alias g_tree_upper_bound = c_g_tree_upper_bound;

// TreeNode

/** */
alias g_tree_node_key = c_g_tree_node_key;

/** */
alias g_tree_node_next = c_g_tree_node_next;

/** */
alias g_tree_node_previous = c_g_tree_node_previous;

/** */
alias g_tree_node_value = c_g_tree_node_value;

// Tuples

/** */
alias g_tuples_destroy = c_g_tuples_destroy;

/** */
alias g_tuples_index = c_g_tuples_index;

// Uri

/** */
alias g_uri_get_type = c_g_uri_get_type;

/** */
alias g_uri_get_auth_params = c_g_uri_get_auth_params;

/** */
alias g_uri_get_flags = c_g_uri_get_flags;

/** */
alias g_uri_get_fragment = c_g_uri_get_fragment;

/** */
alias g_uri_get_host = c_g_uri_get_host;

/** */
alias g_uri_get_password = c_g_uri_get_password;

/** */
alias g_uri_get_path = c_g_uri_get_path;

/** */
alias g_uri_get_port = c_g_uri_get_port;

/** */
alias g_uri_get_query = c_g_uri_get_query;

/** */
alias g_uri_get_scheme = c_g_uri_get_scheme;

/** */
alias g_uri_get_user = c_g_uri_get_user;

/** */
alias g_uri_get_userinfo = c_g_uri_get_userinfo;

/** */
alias g_uri_parse_relative = c_g_uri_parse_relative;

/** */
alias g_uri_ref = c_g_uri_ref;

/** */
alias g_uri_to_string = c_g_uri_to_string;

/** */
alias g_uri_to_string_partial = c_g_uri_to_string_partial;

/** */
alias g_uri_unref = c_g_uri_unref;

/** */
alias g_uri_build = c_g_uri_build;

/** */
alias g_uri_build_with_user = c_g_uri_build_with_user;

/** */
alias g_uri_error_quark = c_g_uri_error_quark;

/** */
alias g_uri_escape_bytes = c_g_uri_escape_bytes;

/** */
alias g_uri_escape_string = c_g_uri_escape_string;

/** */
alias g_uri_is_valid = c_g_uri_is_valid;

/** */
alias g_uri_join = c_g_uri_join;

/** */
alias g_uri_join_with_user = c_g_uri_join_with_user;

/** */
alias g_uri_list_extract_uris = c_g_uri_list_extract_uris;

/** */
alias g_uri_parse = c_g_uri_parse;

/** */
alias g_uri_parse_params = c_g_uri_parse_params;

/** */
alias g_uri_parse_scheme = c_g_uri_parse_scheme;

/** */
alias g_uri_peek_scheme = c_g_uri_peek_scheme;

/** */
alias g_uri_resolve_relative = c_g_uri_resolve_relative;

/** */
alias g_uri_split = c_g_uri_split;

/** */
alias g_uri_split_network = c_g_uri_split_network;

/** */
alias g_uri_split_with_user = c_g_uri_split_with_user;

/** */
alias g_uri_unescape_bytes = c_g_uri_unescape_bytes;

/** */
alias g_uri_unescape_segment = c_g_uri_unescape_segment;

/** */
alias g_uri_unescape_string = c_g_uri_unescape_string;

// UriParamsIter

/** */
alias g_uri_params_iter_init = c_g_uri_params_iter_init;

/** */
alias g_uri_params_iter_next = c_g_uri_params_iter_next;

// Variant

/** */
alias intern = c_intern;

/** */
alias g_variant_new = c_g_variant_new;

/** */
alias g_variant_new_array = c_g_variant_new_array;

/** */
alias g_variant_new_boolean = c_g_variant_new_boolean;

/** */
alias g_variant_new_byte = c_g_variant_new_byte;

/** */
alias g_variant_new_bytestring = c_g_variant_new_bytestring;

/** */
alias g_variant_new_bytestring_array = c_g_variant_new_bytestring_array;

/** */
alias g_variant_new_dict_entry = c_g_variant_new_dict_entry;

/** */
alias g_variant_new_double = c_g_variant_new_double;

/** */
alias g_variant_new_fixed_array = c_g_variant_new_fixed_array;

/** */
alias g_variant_new_from_bytes = c_g_variant_new_from_bytes;

/** */
alias g_variant_new_from_data = c_g_variant_new_from_data;

/** */
alias g_variant_new_handle = c_g_variant_new_handle;

/** */
alias g_variant_new_int16 = c_g_variant_new_int16;

/** */
alias g_variant_new_int32 = c_g_variant_new_int32;

/** */
alias g_variant_new_int64 = c_g_variant_new_int64;

/** */
alias g_variant_new_maybe = c_g_variant_new_maybe;

/** */
alias g_variant_new_object_path = c_g_variant_new_object_path;

/** */
alias g_variant_new_objv = c_g_variant_new_objv;

/** */
alias g_variant_new_parsed = c_g_variant_new_parsed;

/** */
alias g_variant_new_parsed_va = c_g_variant_new_parsed_va;

/** */
alias g_variant_new_printf = c_g_variant_new_printf;

/** */
alias g_variant_new_signature = c_g_variant_new_signature;

/** */
alias g_variant_new_string = c_g_variant_new_string;

/** */
alias g_variant_new_strv = c_g_variant_new_strv;

/** */
alias g_variant_new_take_string = c_g_variant_new_take_string;

/** */
alias g_variant_new_tuple = c_g_variant_new_tuple;

/** */
alias g_variant_new_uint16 = c_g_variant_new_uint16;

/** */
alias g_variant_new_uint32 = c_g_variant_new_uint32;

/** */
alias g_variant_new_uint64 = c_g_variant_new_uint64;

/** */
alias g_variant_new_va = c_g_variant_new_va;

/** */
alias g_variant_new_variant = c_g_variant_new_variant;

/** */
alias g_variant_byteswap = c_g_variant_byteswap;

/** */
alias g_variant_check_format_string = c_g_variant_check_format_string;

/** */
alias g_variant_classify = c_g_variant_classify;

/** */
alias g_variant_compare = c_g_variant_compare;

/** */
alias g_variant_dup_bytestring = c_g_variant_dup_bytestring;

/** */
alias g_variant_dup_bytestring_array = c_g_variant_dup_bytestring_array;

/** */
alias g_variant_dup_objv = c_g_variant_dup_objv;

/** */
alias g_variant_dup_string = c_g_variant_dup_string;

/** */
alias g_variant_dup_strv = c_g_variant_dup_strv;

/** */
alias g_variant_equal = c_g_variant_equal;

/** */
alias g_variant_get = c_g_variant_get;

/** */
alias g_variant_get_boolean = c_g_variant_get_boolean;

/** */
alias g_variant_get_byte = c_g_variant_get_byte;

/** */
alias g_variant_get_bytestring = c_g_variant_get_bytestring;

/** */
alias g_variant_get_bytestring_array = c_g_variant_get_bytestring_array;

/** */
alias g_variant_get_child = c_g_variant_get_child;

/** */
alias g_variant_get_child_value = c_g_variant_get_child_value;

/** */
alias g_variant_get_data = c_g_variant_get_data;

/** */
alias g_variant_get_data_as_bytes = c_g_variant_get_data_as_bytes;

/** */
alias g_variant_get_double = c_g_variant_get_double;

/** */
alias g_variant_get_fixed_array = c_g_variant_get_fixed_array;

/** */
alias g_variant_get_handle = c_g_variant_get_handle;

/** */
alias g_variant_get_int16 = c_g_variant_get_int16;

/** */
alias g_variant_get_int32 = c_g_variant_get_int32;

/** */
alias g_variant_get_int64 = c_g_variant_get_int64;

/** */
alias g_variant_get_maybe = c_g_variant_get_maybe;

/** */
alias g_variant_get_normal_form = c_g_variant_get_normal_form;

/** */
alias g_variant_get_objv = c_g_variant_get_objv;

/** */
alias g_variant_get_size = c_g_variant_get_size;

/** */
alias g_variant_get_string = c_g_variant_get_string;

/** */
alias g_variant_get_strv = c_g_variant_get_strv;

/** */
alias g_variant_get_type = c_g_variant_get_type;

/** */
alias g_variant_get_type_string = c_g_variant_get_type_string;

/** */
alias g_variant_get_uint16 = c_g_variant_get_uint16;

/** */
alias g_variant_get_uint32 = c_g_variant_get_uint32;

/** */
alias g_variant_get_uint64 = c_g_variant_get_uint64;

/** */
alias g_variant_get_va = c_g_variant_get_va;

/** */
alias g_variant_get_variant = c_g_variant_get_variant;

/** */
alias g_variant_hash = c_g_variant_hash;

/** */
alias g_variant_is_container = c_g_variant_is_container;

/** */
alias g_variant_is_floating = c_g_variant_is_floating;

/** */
alias g_variant_is_normal_form = c_g_variant_is_normal_form;

/** */
alias g_variant_is_of_type = c_g_variant_is_of_type;

/** */
alias g_variant_iter_new = c_g_variant_iter_new;

/** */
alias g_variant_lookup = c_g_variant_lookup;

/** */
alias g_variant_lookup_value = c_g_variant_lookup_value;

/** */
alias g_variant_n_children = c_g_variant_n_children;

/** */
alias g_variant_print = c_g_variant_print;

/** */
alias g_variant_print_string = c_g_variant_print_string;

/** */
alias g_variant_ref = c_g_variant_ref;

/** */
alias g_variant_ref_sink = c_g_variant_ref_sink;

/** */
alias g_variant_store = c_g_variant_store;

/** */
alias g_variant_take_ref = c_g_variant_take_ref;

/** */
alias g_variant_unref = c_g_variant_unref;

/** */
alias g_variant_is_object_path = c_g_variant_is_object_path;

/** */
alias g_variant_is_signature = c_g_variant_is_signature;

/** */
alias g_variant_parse = c_g_variant_parse;

/** */
alias g_variant_parse_error_print_context = c_g_variant_parse_error_print_context;

/** */
alias g_variant_parse_error_quark = c_g_variant_parse_error_quark;

/** */
alias g_variant_parser_get_error_quark = c_g_variant_parser_get_error_quark;

// VariantBuilder

/** */
alias g_variant_builder_get_type = c_g_variant_builder_get_type;

/** */
alias g_variant_builder_new = c_g_variant_builder_new;

/** */
alias g_variant_builder_add = c_g_variant_builder_add;

/** */
alias g_variant_builder_add_parsed = c_g_variant_builder_add_parsed;

/** */
alias g_variant_builder_add_value = c_g_variant_builder_add_value;

/** */
alias g_variant_builder_clear = c_g_variant_builder_clear;

/** */
alias g_variant_builder_close = c_g_variant_builder_close;

/** */
alias g_variant_builder_end = c_g_variant_builder_end;

/** */
alias g_variant_builder_init = c_g_variant_builder_init;

/** */
alias g_variant_builder_init_static = c_g_variant_builder_init_static;

/** */
alias g_variant_builder_open = c_g_variant_builder_open;

/** */
alias g_variant_builder_ref = c_g_variant_builder_ref;

/** */
alias g_variant_builder_unref = c_g_variant_builder_unref;

// VariantDict

/** */
alias g_variant_dict_get_type = c_g_variant_dict_get_type;

/** */
alias g_variant_dict_new = c_g_variant_dict_new;

/** */
alias g_variant_dict_clear = c_g_variant_dict_clear;

/** */
alias g_variant_dict_contains = c_g_variant_dict_contains;

/** */
alias g_variant_dict_end = c_g_variant_dict_end;

/** */
alias g_variant_dict_init = c_g_variant_dict_init;

/** */
alias g_variant_dict_insert = c_g_variant_dict_insert;

/** */
alias g_variant_dict_insert_value = c_g_variant_dict_insert_value;

/** */
alias g_variant_dict_lookup = c_g_variant_dict_lookup;

/** */
alias g_variant_dict_lookup_value = c_g_variant_dict_lookup_value;

/** */
alias g_variant_dict_ref = c_g_variant_dict_ref;

/** */
alias g_variant_dict_remove = c_g_variant_dict_remove;

/** */
alias g_variant_dict_unref = c_g_variant_dict_unref;

// VariantIter

/** */
alias g_variant_iter_copy = c_g_variant_iter_copy;

/** */
alias g_variant_iter_free = c_g_variant_iter_free;

/** */
alias g_variant_iter_init = c_g_variant_iter_init;

/** */
alias g_variant_iter_loop = c_g_variant_iter_loop;

/** */
alias g_variant_iter_n_children = c_g_variant_iter_n_children;

/** */
alias g_variant_iter_next = c_g_variant_iter_next;

/** */
alias g_variant_iter_next_value = c_g_variant_iter_next_value;

// VariantType

/** */
alias g_variant_type_get_gtype = c_g_variant_type_get_gtype;

/** */
alias g_variant_type_new = c_g_variant_type_new;

/** */
alias g_variant_type_new_array = c_g_variant_type_new_array;

/** */
alias g_variant_type_new_dict_entry = c_g_variant_type_new_dict_entry;

/** */
alias g_variant_type_new_maybe = c_g_variant_type_new_maybe;

/** */
alias g_variant_type_new_tuple = c_g_variant_type_new_tuple;

/** */
alias g_variant_type_copy = c_g_variant_type_copy;

/** */
alias g_variant_type_dup_string = c_g_variant_type_dup_string;

/** */
alias g_variant_type_element = c_g_variant_type_element;

/** */
alias g_variant_type_equal = c_g_variant_type_equal;

/** */
alias g_variant_type_first = c_g_variant_type_first;

/** */
alias g_variant_type_free = c_g_variant_type_free;

/** */
alias g_variant_type_get_string_length = c_g_variant_type_get_string_length;

/** */
alias g_variant_type_hash = c_g_variant_type_hash;

/** */
alias g_variant_type_is_array = c_g_variant_type_is_array;

/** */
alias g_variant_type_is_basic = c_g_variant_type_is_basic;

/** */
alias g_variant_type_is_container = c_g_variant_type_is_container;

/** */
alias g_variant_type_is_definite = c_g_variant_type_is_definite;

/** */
alias g_variant_type_is_dict_entry = c_g_variant_type_is_dict_entry;

/** */
alias g_variant_type_is_maybe = c_g_variant_type_is_maybe;

/** */
alias g_variant_type_is_subtype_of = c_g_variant_type_is_subtype_of;

/** */
alias g_variant_type_is_tuple = c_g_variant_type_is_tuple;

/** */
alias g_variant_type_is_variant = c_g_variant_type_is_variant;

/** */
alias g_variant_type_key = c_g_variant_type_key;

/** */
alias g_variant_type_n_items = c_g_variant_type_n_items;

/** */
alias g_variant_type_next = c_g_variant_type_next;

/** */
alias g_variant_type_peek_string = c_g_variant_type_peek_string;

/** */
alias g_variant_type_value = c_g_variant_type_value;

/** */
alias g_variant_type_checked_ = c_g_variant_type_checked_;

/** */
alias g_variant_type_string_get_depth_ = c_g_variant_type_string_get_depth_;

/** */
alias g_variant_type_string_is_valid = c_g_variant_type_string_is_valid;

/** */
alias g_variant_type_string_scan = c_g_variant_type_string_scan;

// global

/** */
alias g_access = c_g_access;

/** */
alias g_aligned_alloc = c_g_aligned_alloc;

/** */
alias g_aligned_alloc0 = c_g_aligned_alloc0;

/** */
alias g_aligned_free = c_g_aligned_free;

/** */
alias g_aligned_free_sized = c_g_aligned_free_sized;

/** */
alias g_ascii_digit_value = c_g_ascii_digit_value;

/** */
alias g_ascii_dtostr = c_g_ascii_dtostr;

/** */
alias g_ascii_formatd = c_g_ascii_formatd;

/** */
alias g_ascii_strcasecmp = c_g_ascii_strcasecmp;

/** */
alias g_ascii_strdown = c_g_ascii_strdown;

/** */
alias g_ascii_string_to_signed = c_g_ascii_string_to_signed;

/** */
alias g_ascii_string_to_unsigned = c_g_ascii_string_to_unsigned;

/** */
alias g_ascii_strncasecmp = c_g_ascii_strncasecmp;

/** */
alias g_ascii_strtod = c_g_ascii_strtod;

/** */
alias g_ascii_strtoll = c_g_ascii_strtoll;

/** */
alias g_ascii_strtoull = c_g_ascii_strtoull;

/** */
alias g_ascii_strup = c_g_ascii_strup;

/** */
alias g_ascii_tolower = c_g_ascii_tolower;

/** */
alias g_ascii_toupper = c_g_ascii_toupper;

/** */
alias g_ascii_xdigit_value = c_g_ascii_xdigit_value;

/** */
alias g_assert_warning = c_g_assert_warning;

/** */
alias g_assertion_message = c_g_assertion_message;

/** */
alias g_assertion_message_cmpint = c_g_assertion_message_cmpint;

/** */
alias g_assertion_message_cmpnum = c_g_assertion_message_cmpnum;

/** */
alias g_assertion_message_cmpstr = c_g_assertion_message_cmpstr;

/** */
alias g_assertion_message_cmpstrv = c_g_assertion_message_cmpstrv;

/** */
alias g_assertion_message_error = c_g_assertion_message_error;

/** */
alias g_assertion_message_expr = c_g_assertion_message_expr;

/** */
alias g_atexit = c_g_atexit;

/** */
alias g_atomic_int_add = c_g_atomic_int_add;

/** */
alias g_atomic_int_and = c_g_atomic_int_and;

/** */
alias g_atomic_int_compare_and_exchange = c_g_atomic_int_compare_and_exchange;

/** */
alias g_atomic_int_compare_and_exchange_full = c_g_atomic_int_compare_and_exchange_full;

/** */
alias g_atomic_int_dec_and_test = c_g_atomic_int_dec_and_test;

/** */
alias g_atomic_int_exchange = c_g_atomic_int_exchange;

/** */
alias g_atomic_int_exchange_and_add = c_g_atomic_int_exchange_and_add;

/** */
alias g_atomic_int_get = c_g_atomic_int_get;

/** */
alias g_atomic_int_inc = c_g_atomic_int_inc;

/** */
alias g_atomic_int_or = c_g_atomic_int_or;

/** */
alias g_atomic_int_set = c_g_atomic_int_set;

/** */
alias g_atomic_int_xor = c_g_atomic_int_xor;

/** */
alias g_atomic_pointer_add = c_g_atomic_pointer_add;

/** */
alias g_atomic_pointer_and = c_g_atomic_pointer_and;

/** */
alias g_atomic_pointer_compare_and_exchange = c_g_atomic_pointer_compare_and_exchange;

/** */
alias g_atomic_pointer_compare_and_exchange_full = c_g_atomic_pointer_compare_and_exchange_full;

/** */
alias g_atomic_pointer_exchange = c_g_atomic_pointer_exchange;

/** */
alias g_atomic_pointer_get = c_g_atomic_pointer_get;

/** */
alias g_atomic_pointer_or = c_g_atomic_pointer_or;

/** */
alias g_atomic_pointer_set = c_g_atomic_pointer_set;

/** */
alias g_atomic_pointer_xor = c_g_atomic_pointer_xor;

/** */
alias g_atomic_rc_box_acquire = c_g_atomic_rc_box_acquire;

/** */
alias g_atomic_rc_box_alloc = c_g_atomic_rc_box_alloc;

/** */
alias g_atomic_rc_box_alloc0 = c_g_atomic_rc_box_alloc0;

/** */
alias g_atomic_rc_box_dup = c_g_atomic_rc_box_dup;

/** */
alias g_atomic_rc_box_get_size = c_g_atomic_rc_box_get_size;

/** */
alias g_atomic_rc_box_release = c_g_atomic_rc_box_release;

/** */
alias g_atomic_rc_box_release_full = c_g_atomic_rc_box_release_full;

/** */
alias g_atomic_ref_count_compare = c_g_atomic_ref_count_compare;

/** */
alias g_atomic_ref_count_dec = c_g_atomic_ref_count_dec;

/** */
alias g_atomic_ref_count_inc = c_g_atomic_ref_count_inc;

/** */
alias g_atomic_ref_count_init = c_g_atomic_ref_count_init;

/** */
alias g_base64_decode = c_g_base64_decode;

/** */
alias g_base64_decode_inplace = c_g_base64_decode_inplace;

/** */
alias g_base64_decode_step = c_g_base64_decode_step;

/** */
alias g_base64_encode = c_g_base64_encode;

/** */
alias g_base64_encode_close = c_g_base64_encode_close;

/** */
alias g_base64_encode_step = c_g_base64_encode_step;

/** */
alias g_basename = c_g_basename;

/** */
alias g_bit_lock = c_g_bit_lock;

/** */
alias g_bit_lock_and_get = c_g_bit_lock_and_get;

/** */
alias g_bit_nth_lsf = c_g_bit_nth_lsf;

/** */
alias g_bit_nth_msf = c_g_bit_nth_msf;

/** */
alias g_bit_storage = c_g_bit_storage;

/** */
alias g_bit_trylock = c_g_bit_trylock;

/** */
alias g_bit_unlock = c_g_bit_unlock;

/** */
alias g_bit_unlock_and_set = c_g_bit_unlock_and_set;

/** */
alias g_blow_chunks = c_g_blow_chunks;

/** */
alias g_build_filename = c_g_build_filename;

/** */
alias g_build_filename_valist = c_g_build_filename_valist;

/** */
alias g_build_filenamev = c_g_build_filenamev;

/** */
alias g_build_path = c_g_build_path;

/** */
alias g_build_pathv = c_g_build_pathv;

/** */
alias g_canonicalize_filename = c_g_canonicalize_filename;

/** */
alias g_chdir = c_g_chdir;

/** */
alias glib_check_version = c_glib_check_version;

/** */
alias g_child_watch_add = c_g_child_watch_add;

/** */
alias g_child_watch_add_full = c_g_child_watch_add_full;

/** */
alias g_child_watch_source_new = c_g_child_watch_source_new;

/** */
alias g_chmod = c_g_chmod;

/** */
alias g_clear_error = c_g_clear_error;

/** */
alias g_clear_handle_id = c_g_clear_handle_id;

/** */
alias g_clear_list = c_g_clear_list;

/** */
alias g_clear_pointer = c_g_clear_pointer;

/** */
alias g_clear_slist = c_g_clear_slist;

/** */
alias g_close = c_g_close;

/** */
alias g_compute_checksum_for_bytes = c_g_compute_checksum_for_bytes;

/** */
alias g_compute_checksum_for_data = c_g_compute_checksum_for_data;

/** */
alias g_compute_checksum_for_string = c_g_compute_checksum_for_string;

/** */
alias g_compute_hmac_for_bytes = c_g_compute_hmac_for_bytes;

/** */
alias g_compute_hmac_for_data = c_g_compute_hmac_for_data;

/** */
alias g_compute_hmac_for_string = c_g_compute_hmac_for_string;

/** */
alias g_convert = c_g_convert;

/** */
alias g_convert_error_quark = c_g_convert_error_quark;

/** */
alias g_convert_with_fallback = c_g_convert_with_fallback;

/** */
alias g_convert_with_iconv = c_g_convert_with_iconv;

/** */
alias g_creat = c_g_creat;

/** */
alias g_datalist_clear = c_g_datalist_clear;

/** */
alias g_datalist_foreach = c_g_datalist_foreach;

/** */
alias g_datalist_get_data = c_g_datalist_get_data;

/** */
alias g_datalist_get_flags = c_g_datalist_get_flags;

/** */
alias g_datalist_id_dup_data = c_g_datalist_id_dup_data;

/** */
alias g_datalist_id_get_data = c_g_datalist_id_get_data;

/** */
alias g_datalist_id_remove_multiple = c_g_datalist_id_remove_multiple;

/** */
alias g_datalist_id_remove_no_notify = c_g_datalist_id_remove_no_notify;

/** */
alias g_datalist_id_replace_data = c_g_datalist_id_replace_data;

/** */
alias g_datalist_id_set_data_full = c_g_datalist_id_set_data_full;

/** */
alias g_datalist_init = c_g_datalist_init;

/** */
alias g_datalist_set_flags = c_g_datalist_set_flags;

/** */
alias g_datalist_unset_flags = c_g_datalist_unset_flags;

/** */
alias g_dataset_destroy = c_g_dataset_destroy;

/** */
alias g_dataset_foreach = c_g_dataset_foreach;

/** */
alias g_dataset_id_get_data = c_g_dataset_id_get_data;

/** */
alias g_dataset_id_remove_no_notify = c_g_dataset_id_remove_no_notify;

/** */
alias g_dataset_id_set_data_full = c_g_dataset_id_set_data_full;

/** */
alias g_dcgettext = c_g_dcgettext;

/** */
alias g_dgettext = c_g_dgettext;

/** */
alias g_direct_equal = c_g_direct_equal;

/** */
alias g_direct_hash = c_g_direct_hash;

/** */
alias g_dngettext = c_g_dngettext;

/** */
alias g_double_equal = c_g_double_equal;

/** */
alias g_double_hash = c_g_double_hash;

/** */
alias g_dpgettext = c_g_dpgettext;

/** */
alias g_dpgettext2 = c_g_dpgettext2;

/** */
alias g_environ_getenv = c_g_environ_getenv;

/** */
alias g_environ_setenv = c_g_environ_setenv;

/** */
alias g_environ_unsetenv = c_g_environ_unsetenv;

/** */
alias g_file_error_from_errno = c_g_file_error_from_errno;

/** */
alias g_file_error_quark = c_g_file_error_quark;

/** */
alias g_file_get_contents = c_g_file_get_contents;

/** */
alias g_file_open_tmp = c_g_file_open_tmp;

/** */
alias g_file_read_link = c_g_file_read_link;

/** */
alias g_file_set_contents = c_g_file_set_contents;

/** */
alias g_file_set_contents_full = c_g_file_set_contents_full;

/** */
alias g_file_test = c_g_file_test;

/** */
alias g_filename_display_basename = c_g_filename_display_basename;

/** */
alias g_filename_display_name = c_g_filename_display_name;

/** */
alias g_filename_from_uri = c_g_filename_from_uri;

/** */
alias g_filename_from_utf8 = c_g_filename_from_utf8;

/** */
alias g_filename_to_uri = c_g_filename_to_uri;

/** */
alias g_filename_to_utf8 = c_g_filename_to_utf8;

/** */
alias g_find_program_in_path = c_g_find_program_in_path;

/** */
alias g_fopen = c_g_fopen;

/** */
alias g_format_size = c_g_format_size;

/** */
alias g_format_size_for_display = c_g_format_size_for_display;

/** */
alias g_format_size_full = c_g_format_size_full;

/** */
alias g_fprintf = c_g_fprintf;

/** */
alias g_free = c_g_free;

/** */
alias g_free_sized = c_g_free_sized;

/** */
alias g_freopen = c_g_freopen;

/** */
alias g_fsync = c_g_fsync;

/** */
alias g_get_application_name = c_g_get_application_name;

/** */
alias g_get_charset = c_g_get_charset;

/** */
alias g_get_codeset = c_g_get_codeset;

/** */
alias g_get_console_charset = c_g_get_console_charset;

/** */
alias g_get_current_dir = c_g_get_current_dir;

/** */
alias g_get_current_time = c_g_get_current_time;

/** */
alias g_get_environ = c_g_get_environ;

/** */
alias g_get_filename_charsets = c_g_get_filename_charsets;

/** */
alias g_get_home_dir = c_g_get_home_dir;

/** */
alias g_get_host_name = c_g_get_host_name;

/** */
alias g_get_language_names = c_g_get_language_names;

/** */
alias g_get_language_names_with_category = c_g_get_language_names_with_category;

/** */
alias g_get_locale_variants = c_g_get_locale_variants;

/** */
alias g_get_monotonic_time = c_g_get_monotonic_time;

/** */
alias g_get_monotonic_time_ns = c_g_get_monotonic_time_ns;

/** */
alias g_get_num_processors = c_g_get_num_processors;

/** */
alias g_get_os_info = c_g_get_os_info;

/** */
alias g_get_prgname = c_g_get_prgname;

/** */
alias g_get_real_name = c_g_get_real_name;

/** */
alias g_get_real_time = c_g_get_real_time;

/** */
alias g_get_system_config_dirs = c_g_get_system_config_dirs;

/** */
alias g_get_system_data_dirs = c_g_get_system_data_dirs;

/** */
alias g_get_tmp_dir = c_g_get_tmp_dir;

/** */
alias g_get_user_cache_dir = c_g_get_user_cache_dir;

/** */
alias g_get_user_config_dir = c_g_get_user_config_dir;

/** */
alias g_get_user_data_dir = c_g_get_user_data_dir;

/** */
alias g_get_user_name = c_g_get_user_name;

/** */
alias g_get_user_runtime_dir = c_g_get_user_runtime_dir;

/** */
alias g_get_user_special_dir = c_g_get_user_special_dir;

/** */
alias g_get_user_state_dir = c_g_get_user_state_dir;

/** */
alias g_getenv = c_g_getenv;

/** */
alias g_hostname_is_ascii_encoded = c_g_hostname_is_ascii_encoded;

/** */
alias g_hostname_is_ip_address = c_g_hostname_is_ip_address;

/** */
alias g_hostname_is_non_ascii = c_g_hostname_is_non_ascii;

/** */
alias g_hostname_to_ascii = c_g_hostname_to_ascii;

/** */
alias g_hostname_to_unicode = c_g_hostname_to_unicode;

/** */
alias g_iconv = c_g_iconv;

/** */
alias g_idle_add = c_g_idle_add;

/** */
alias g_idle_add_full = c_g_idle_add_full;

/** */
alias g_idle_add_once = c_g_idle_add_once;

/** */
alias g_idle_remove_by_data = c_g_idle_remove_by_data;

/** */
alias g_idle_source_new = c_g_idle_source_new;

/** */
alias g_int64_equal = c_g_int64_equal;

/** */
alias g_int64_hash = c_g_int64_hash;

/** */
alias g_int_equal = c_g_int_equal;

/** */
alias g_int_hash = c_g_int_hash;

/** */
alias g_intern_static_string = c_g_intern_static_string;

/** */
alias g_intern_string = c_g_intern_string;

/** */
alias g_io_add_watch = c_g_io_add_watch;

/** */
alias g_io_add_watch_full = c_g_io_add_watch_full;

/** */
alias g_io_create_watch = c_g_io_create_watch;

/** */
alias g_listenv = c_g_listenv;

/** */
alias g_locale_from_utf8 = c_g_locale_from_utf8;

/** */
alias g_locale_to_utf8 = c_g_locale_to_utf8;

/** */
alias g_log = c_g_log;

/** */
alias g_log_default_handler = c_g_log_default_handler;

/** */
alias g_log_get_always_fatal = c_g_log_get_always_fatal;

/** */
alias g_log_get_debug_enabled = c_g_log_get_debug_enabled;

/** */
alias g_log_remove_handler = c_g_log_remove_handler;

/** */
alias g_log_set_always_fatal = c_g_log_set_always_fatal;

/** */
alias g_log_set_debug_enabled = c_g_log_set_debug_enabled;

/** */
alias g_log_set_default_handler = c_g_log_set_default_handler;

/** */
alias g_log_set_fatal_mask = c_g_log_set_fatal_mask;

/** */
alias g_log_set_handler = c_g_log_set_handler;

/** */
alias g_log_set_handler_full = c_g_log_set_handler_full;

/** */
alias g_log_set_writer_func = c_g_log_set_writer_func;

/** */
alias g_log_structured = c_g_log_structured;

/** */
alias g_log_structured_array = c_g_log_structured_array;

/** */
alias g_log_structured_standard = c_g_log_structured_standard;

/** */
alias g_log_variant = c_g_log_variant;

/** */
alias g_log_writer_default = c_g_log_writer_default;

/** */
alias g_log_writer_default_set_debug_domains = c_g_log_writer_default_set_debug_domains;

/** */
alias g_log_writer_default_set_use_stderr = c_g_log_writer_default_set_use_stderr;

/** */
alias g_log_writer_default_would_drop = c_g_log_writer_default_would_drop;

/** */
alias g_log_writer_format_fields = c_g_log_writer_format_fields;

/** */
alias g_log_writer_is_journald = c_g_log_writer_is_journald;

/** */
alias g_log_writer_journald = c_g_log_writer_journald;

/** */
alias g_log_writer_standard_streams = c_g_log_writer_standard_streams;

/** */
alias g_log_writer_supports_color = c_g_log_writer_supports_color;

/** */
alias g_log_writer_syslog = c_g_log_writer_syslog;

/** */
alias g_logv = c_g_logv;

/** */
alias g_lstat = c_g_lstat;

/** */
alias g_main_current_source = c_g_main_current_source;

/** */
alias g_main_depth = c_g_main_depth;

/** */
alias g_malloc = c_g_malloc;

/** */
alias g_malloc0 = c_g_malloc0;

/** */
alias g_malloc0_n = c_g_malloc0_n;

/** */
alias g_malloc_n = c_g_malloc_n;

/** */
alias g_markup_collect_attributes = c_g_markup_collect_attributes;

/** */
alias g_markup_error_quark = c_g_markup_error_quark;

/** */
alias g_markup_escape_text = c_g_markup_escape_text;

/** */
alias g_markup_printf_escaped = c_g_markup_printf_escaped;

/** */
alias g_markup_vprintf_escaped = c_g_markup_vprintf_escaped;

/** */
alias g_mem_is_system_malloc = c_g_mem_is_system_malloc;

/** */
alias g_mem_profile = c_g_mem_profile;

/** */
alias g_mem_set_vtable = c_g_mem_set_vtable;

/** */
alias g_memdup = c_g_memdup;

/** */
alias g_memdup2 = c_g_memdup2;

/** */
alias g_mkdir = c_g_mkdir;

/** */
alias g_mkdir_with_parents = c_g_mkdir_with_parents;

/** */
alias g_mkdtemp = c_g_mkdtemp;

/** */
alias g_mkdtemp_full = c_g_mkdtemp_full;

/** */
alias g_mkstemp = c_g_mkstemp;

/** */
alias g_mkstemp_full = c_g_mkstemp_full;

/** */
alias g_nullify_pointer = c_g_nullify_pointer;

/** */
alias g_number_parser_error_quark = c_g_number_parser_error_quark;

/** */
alias g_on_error_query = c_g_on_error_query;

/** */
alias g_on_error_stack_trace = c_g_on_error_stack_trace;

/** */
alias g_open = c_g_open;

/** */
alias g_option_error_quark = c_g_option_error_quark;

/** */
alias g_parse_debug_string = c_g_parse_debug_string;

/** */
alias g_path_get_basename = c_g_path_get_basename;

/** */
alias g_path_get_dirname = c_g_path_get_dirname;

/** */
alias g_path_is_absolute = c_g_path_is_absolute;

/** */
alias g_path_skip_root = c_g_path_skip_root;

/** */
alias g_pattern_match = c_g_pattern_match;

/** */
alias g_pattern_match_simple = c_g_pattern_match_simple;

/** */
alias g_pattern_match_string = c_g_pattern_match_string;

/** */
alias g_pointer_bit_lock = c_g_pointer_bit_lock;

/** */
alias g_pointer_bit_lock_and_get = c_g_pointer_bit_lock_and_get;

/** */
alias g_pointer_bit_lock_mask_ptr = c_g_pointer_bit_lock_mask_ptr;

/** */
alias g_pointer_bit_trylock = c_g_pointer_bit_trylock;

/** */
alias g_pointer_bit_unlock = c_g_pointer_bit_unlock;

/** */
alias g_pointer_bit_unlock_and_set = c_g_pointer_bit_unlock_and_set;

/** */
alias g_poll = c_g_poll;

/** */
alias g_prefix_error = c_g_prefix_error;

/** */
alias g_prefix_error_literal = c_g_prefix_error_literal;

/** */
alias g_print = c_g_print;

/** */
alias g_printerr = c_g_printerr;

/** */
alias g_printf = c_g_printf;

/** */
alias g_printf_string_upper_bound = c_g_printf_string_upper_bound;

/** */
alias g_propagate_error = c_g_propagate_error;

/** */
alias g_propagate_prefixed_error = c_g_propagate_prefixed_error;

/** */
alias g_qsort_with_data = c_g_qsort_with_data;

/** */
alias g_quark_from_static_string = c_g_quark_from_static_string;

/** */
alias g_quark_from_string = c_g_quark_from_string;

/** */
alias g_quark_to_string = c_g_quark_to_string;

/** */
alias g_quark_try_string = c_g_quark_try_string;

/** */
alias g_random_double = c_g_random_double;

/** */
alias g_random_double_range = c_g_random_double_range;

/** */
alias g_random_int = c_g_random_int;

/** */
alias g_random_int_range = c_g_random_int_range;

/** */
alias g_random_set_seed = c_g_random_set_seed;

/** */
alias g_rc_box_acquire = c_g_rc_box_acquire;

/** */
alias g_rc_box_alloc = c_g_rc_box_alloc;

/** */
alias g_rc_box_alloc0 = c_g_rc_box_alloc0;

/** */
alias g_rc_box_dup = c_g_rc_box_dup;

/** */
alias g_rc_box_get_size = c_g_rc_box_get_size;

/** */
alias g_rc_box_release = c_g_rc_box_release;

/** */
alias g_rc_box_release_full = c_g_rc_box_release_full;

/** */
alias g_realloc = c_g_realloc;

/** */
alias g_realloc_n = c_g_realloc_n;

/** */
alias g_ref_count_compare = c_g_ref_count_compare;

/** */
alias g_ref_count_dec = c_g_ref_count_dec;

/** */
alias g_ref_count_inc = c_g_ref_count_inc;

/** */
alias g_ref_count_init = c_g_ref_count_init;

/** */
alias g_ref_string_acquire = c_g_ref_string_acquire;

/** */
alias g_ref_string_equal = c_g_ref_string_equal;

/** */
alias g_ref_string_length = c_g_ref_string_length;

/** */
alias g_ref_string_new = c_g_ref_string_new;

/** */
alias g_ref_string_new_intern = c_g_ref_string_new_intern;

/** */
alias g_ref_string_new_len = c_g_ref_string_new_len;

/** */
alias g_ref_string_release = c_g_ref_string_release;

/** */
alias g_reload_user_special_dirs_cache = c_g_reload_user_special_dirs_cache;

/** */
alias g_remove = c_g_remove;

/** */
alias g_rename = c_g_rename;

/** */
alias g_return_if_fail_warning = c_g_return_if_fail_warning;

/** */
alias g_rmdir = c_g_rmdir;

/** */
alias g_set_application_name = c_g_set_application_name;

/** */
alias g_set_error = c_g_set_error;

/** */
alias g_set_error_literal = c_g_set_error_literal;

/** */
alias g_set_prgname = c_g_set_prgname;

/** */
alias g_set_print_handler = c_g_set_print_handler;

/** */
alias g_set_printerr_handler = c_g_set_printerr_handler;

/** */
alias g_setenv = c_g_setenv;

/** */
alias g_shell_error_quark = c_g_shell_error_quark;

/** */
alias g_shell_parse_argv = c_g_shell_parse_argv;

/** */
alias g_shell_quote = c_g_shell_quote;

/** */
alias g_shell_unquote = c_g_shell_unquote;

/** */
alias g_slice_alloc = c_g_slice_alloc;

/** */
alias g_slice_alloc0 = c_g_slice_alloc0;

/** */
alias g_slice_copy = c_g_slice_copy;

/** */
alias g_slice_free1 = c_g_slice_free1;

/** */
alias g_slice_free_chain_with_offset = c_g_slice_free_chain_with_offset;

/** */
alias g_slice_get_config = c_g_slice_get_config;

/** */
alias g_slice_get_config_state = c_g_slice_get_config_state;

/** */
alias g_slice_set_config = c_g_slice_set_config;

/** */
alias g_snprintf = c_g_snprintf;

/** */
alias g_sort_array = c_g_sort_array;

/** */
alias g_spaced_primes_closest = c_g_spaced_primes_closest;

/** */
alias g_spawn_async = c_g_spawn_async;

/** */
alias g_spawn_async_with_fds = c_g_spawn_async_with_fds;

/** */
alias g_spawn_async_with_pipes = c_g_spawn_async_with_pipes;

/** */
alias g_spawn_async_with_pipes_and_fds = c_g_spawn_async_with_pipes_and_fds;

/** */
alias g_spawn_check_exit_status = c_g_spawn_check_exit_status;

/** */
alias g_spawn_check_wait_status = c_g_spawn_check_wait_status;

/** */
alias g_spawn_close_pid = c_g_spawn_close_pid;

/** */
alias g_spawn_command_line_async = c_g_spawn_command_line_async;

/** */
alias g_spawn_command_line_sync = c_g_spawn_command_line_sync;

/** */
alias g_spawn_error_quark = c_g_spawn_error_quark;

/** */
alias g_spawn_exit_error_quark = c_g_spawn_exit_error_quark;

/** */
alias g_spawn_sync = c_g_spawn_sync;

/** */
alias g_sprintf = c_g_sprintf;

/** */
alias g_stat = c_g_stat;

/** */
alias g_stpcpy = c_g_stpcpy;

/** */
alias g_str_equal = c_g_str_equal;

/** */
alias g_str_has_prefix = c_g_str_has_prefix;

/** */
alias g_str_has_suffix = c_g_str_has_suffix;

/** */
alias g_str_hash = c_g_str_hash;

/** */
alias g_str_is_ascii = c_g_str_is_ascii;

/** */
alias g_str_match_string = c_g_str_match_string;

/** */
alias g_str_to_ascii = c_g_str_to_ascii;

/** */
alias g_str_tokenize_and_fold = c_g_str_tokenize_and_fold;

/** */
alias g_strcanon = c_g_strcanon;

/** */
alias g_strcasecmp = c_g_strcasecmp;

/** */
alias g_strchomp = c_g_strchomp;

/** */
alias g_strchug = c_g_strchug;

/** */
alias g_strcmp0 = c_g_strcmp0;

/** */
alias g_strcompress = c_g_strcompress;

/** */
alias g_strconcat = c_g_strconcat;

/** */
alias g_strdelimit = c_g_strdelimit;

/** */
alias g_strdown = c_g_strdown;

/** */
alias g_strdup = c_g_strdup;

/** */
alias g_strdup_printf = c_g_strdup_printf;

/** */
alias g_strdup_vprintf = c_g_strdup_vprintf;

/** */
alias g_strdupv = c_g_strdupv;

/** */
alias g_strerror = c_g_strerror;

/** */
alias g_strescape = c_g_strescape;

/** */
alias g_strfreev = c_g_strfreev;

/** */
alias g_strip_context = c_g_strip_context;

/** */
alias g_strjoin = c_g_strjoin;

/** */
alias g_strjoinv = c_g_strjoinv;

/** */
alias g_strlcat = c_g_strlcat;

/** */
alias g_strlcpy = c_g_strlcpy;

/** */
alias g_strncasecmp = c_g_strncasecmp;

/** */
alias g_strndup = c_g_strndup;

/** */
alias g_strnfill = c_g_strnfill;

/** */
alias g_strreverse = c_g_strreverse;

/** */
alias g_strrstr = c_g_strrstr;

/** */
alias g_strrstr_len = c_g_strrstr_len;

/** */
alias g_strsignal = c_g_strsignal;

/** */
alias g_strsplit = c_g_strsplit;

/** */
alias g_strsplit_set = c_g_strsplit_set;

/** */
alias g_strstr_len = c_g_strstr_len;

/** */
alias g_strtod = c_g_strtod;

/** */
alias g_strup = c_g_strup;

/** */
alias g_strv_contains = c_g_strv_contains;

/** */
alias g_strv_equal = c_g_strv_equal;

/** */
alias g_strv_get_type = c_g_strv_get_type;

/** */
alias g_strv_length = c_g_strv_length;

/** */
alias g_test_add_data_func = c_g_test_add_data_func;

/** */
alias g_test_add_data_func_full = c_g_test_add_data_func_full;

/** */
alias g_test_add_func = c_g_test_add_func;

/** */
alias g_test_add_vtable = c_g_test_add_vtable;

/** */
alias g_test_assert_expected_messages_internal = c_g_test_assert_expected_messages_internal;

/** */
alias g_test_bug = c_g_test_bug;

/** */
alias g_test_bug_base = c_g_test_bug_base;

/** */
alias g_test_build_filename = c_g_test_build_filename;

/** */
alias g_test_create_case = c_g_test_create_case;

/** */
alias g_test_create_suite = c_g_test_create_suite;

/** */
alias g_test_disable_crash_reporting = c_g_test_disable_crash_reporting;

/** */
alias g_test_expect_message = c_g_test_expect_message;

/** */
alias g_test_fail = c_g_test_fail;

/** */
alias g_test_fail_printf = c_g_test_fail_printf;

/** */
alias g_test_failed = c_g_test_failed;

/** */
alias g_test_get_dir = c_g_test_get_dir;

/** */
alias g_test_get_filename = c_g_test_get_filename;

/** */
alias g_test_get_path = c_g_test_get_path;

/** */
alias g_test_get_root = c_g_test_get_root;

/** */
alias g_test_incomplete = c_g_test_incomplete;

/** */
alias g_test_incomplete_printf = c_g_test_incomplete_printf;

/** */
alias g_test_init = c_g_test_init;

/** */
alias g_test_log_set_fatal_handler = c_g_test_log_set_fatal_handler;

/** */
alias g_test_log_type_name = c_g_test_log_type_name;

/** */
alias g_test_maximized_result = c_g_test_maximized_result;

/** */
alias g_test_message = c_g_test_message;

/** */
alias g_test_minimized_result = c_g_test_minimized_result;

/** */
alias g_test_queue_destroy = c_g_test_queue_destroy;

/** */
alias g_test_queue_free = c_g_test_queue_free;

/** */
alias g_test_rand_double = c_g_test_rand_double;

/** */
alias g_test_rand_double_range = c_g_test_rand_double_range;

/** */
alias g_test_rand_int = c_g_test_rand_int;

/** */
alias g_test_rand_int_range = c_g_test_rand_int_range;

/** */
alias g_test_run = c_g_test_run;

/** */
alias g_test_run_suite = c_g_test_run_suite;

/** */
alias g_test_set_nonfatal_assertions = c_g_test_set_nonfatal_assertions;

/** */
alias g_test_skip = c_g_test_skip;

/** */
alias g_test_skip_printf = c_g_test_skip_printf;

/** */
alias g_test_subprocess = c_g_test_subprocess;

/** */
alias g_test_summary = c_g_test_summary;

/** */
alias g_test_timer_elapsed = c_g_test_timer_elapsed;

/** */
alias g_test_timer_last = c_g_test_timer_last;

/** */
alias g_test_timer_start = c_g_test_timer_start;

/** */
alias g_test_trap_assertions = c_g_test_trap_assertions;

/** */
alias g_test_trap_fork = c_g_test_trap_fork;

/** */
alias g_test_trap_has_passed = c_g_test_trap_has_passed;

/** */
alias g_test_trap_has_skipped = c_g_test_trap_has_skipped;

/** */
alias g_test_trap_reached_timeout = c_g_test_trap_reached_timeout;

/** */
alias g_test_trap_subprocess = c_g_test_trap_subprocess;

/** */
alias g_test_trap_subprocess_with_envp = c_g_test_trap_subprocess_with_envp;

/** */
alias g_timeout_add = c_g_timeout_add;

/** */
alias g_timeout_add_full = c_g_timeout_add_full;

/** */
alias g_timeout_add_once = c_g_timeout_add_once;

/** */
alias g_timeout_add_seconds = c_g_timeout_add_seconds;

/** */
alias g_timeout_add_seconds_full = c_g_timeout_add_seconds_full;

/** */
alias g_timeout_add_seconds_once = c_g_timeout_add_seconds_once;

/** */
alias g_timeout_source_new = c_g_timeout_source_new;

/** */
alias g_timeout_source_new_seconds = c_g_timeout_source_new_seconds;

/** */
alias g_try_malloc = c_g_try_malloc;

/** */
alias g_try_malloc0 = c_g_try_malloc0;

/** */
alias g_try_malloc0_n = c_g_try_malloc0_n;

/** */
alias g_try_malloc_n = c_g_try_malloc_n;

/** */
alias g_try_realloc = c_g_try_realloc;

/** */
alias g_try_realloc_n = c_g_try_realloc_n;

/** */
alias g_ucs4_to_utf16 = c_g_ucs4_to_utf16;

/** */
alias g_ucs4_to_utf8 = c_g_ucs4_to_utf8;

/** */
alias g_unichar_break_type = c_g_unichar_break_type;

/** */
alias g_unichar_combining_class = c_g_unichar_combining_class;

/** */
alias g_unichar_compose = c_g_unichar_compose;

/** */
alias g_unichar_decompose = c_g_unichar_decompose;

/** */
alias g_unichar_digit_value = c_g_unichar_digit_value;

/** */
alias g_unichar_fully_decompose = c_g_unichar_fully_decompose;

/** */
alias g_unichar_get_mirror_char = c_g_unichar_get_mirror_char;

/** */
alias g_unichar_get_script = c_g_unichar_get_script;

/** */
alias g_unichar_isalnum = c_g_unichar_isalnum;

/** */
alias g_unichar_isalpha = c_g_unichar_isalpha;

/** */
alias g_unichar_iscntrl = c_g_unichar_iscntrl;

/** */
alias g_unichar_isdefined = c_g_unichar_isdefined;

/** */
alias g_unichar_isdigit = c_g_unichar_isdigit;

/** */
alias g_unichar_isgraph = c_g_unichar_isgraph;

/** */
alias g_unichar_islower = c_g_unichar_islower;

/** */
alias g_unichar_ismark = c_g_unichar_ismark;

/** */
alias g_unichar_isprint = c_g_unichar_isprint;

/** */
alias g_unichar_ispunct = c_g_unichar_ispunct;

/** */
alias g_unichar_isspace = c_g_unichar_isspace;

/** */
alias g_unichar_istitle = c_g_unichar_istitle;

/** */
alias g_unichar_isupper = c_g_unichar_isupper;

/** */
alias g_unichar_iswide = c_g_unichar_iswide;

/** */
alias g_unichar_iswide_cjk = c_g_unichar_iswide_cjk;

/** */
alias g_unichar_isxdigit = c_g_unichar_isxdigit;

/** */
alias g_unichar_iszerowidth = c_g_unichar_iszerowidth;

/** */
alias g_unichar_to_utf8 = c_g_unichar_to_utf8;

/** */
alias g_unichar_tolower = c_g_unichar_tolower;

/** */
alias g_unichar_totitle = c_g_unichar_totitle;

/** */
alias g_unichar_toupper = c_g_unichar_toupper;

/** */
alias g_unichar_type = c_g_unichar_type;

/** */
alias g_unichar_validate = c_g_unichar_validate;

/** */
alias g_unichar_xdigit_value = c_g_unichar_xdigit_value;

/** */
alias g_unicode_canonical_decomposition = c_g_unicode_canonical_decomposition;

/** */
alias g_unicode_canonical_ordering = c_g_unicode_canonical_ordering;

/** */
alias g_unlink = c_g_unlink;

/** */
alias g_unsetenv = c_g_unsetenv;

/** */
alias g_usleep = c_g_usleep;

/** */
alias g_utf16_to_ucs4 = c_g_utf16_to_ucs4;

/** */
alias g_utf16_to_utf8 = c_g_utf16_to_utf8;

/** */
alias g_utf8_casefold = c_g_utf8_casefold;

/** */
alias g_utf8_collate = c_g_utf8_collate;

/** */
alias g_utf8_collate_key = c_g_utf8_collate_key;

/** */
alias g_utf8_collate_key_for_filename = c_g_utf8_collate_key_for_filename;

/** */
alias g_utf8_find_next_char = c_g_utf8_find_next_char;

/** */
alias g_utf8_find_prev_char = c_g_utf8_find_prev_char;

/** */
alias g_utf8_get_char = c_g_utf8_get_char;

/** */
alias g_utf8_get_char_validated = c_g_utf8_get_char_validated;

/** */
alias g_utf8_make_valid = c_g_utf8_make_valid;

/** */
alias g_utf8_normalize = c_g_utf8_normalize;

/** */
alias g_utf8_offset_to_pointer = c_g_utf8_offset_to_pointer;

/** */
alias g_utf8_pointer_to_offset = c_g_utf8_pointer_to_offset;

/** */
alias g_utf8_prev_char = c_g_utf8_prev_char;

/** */
alias g_utf8_strchr = c_g_utf8_strchr;

/** */
alias g_utf8_strdown = c_g_utf8_strdown;

/** */
alias g_utf8_strlen = c_g_utf8_strlen;

/** */
alias g_utf8_strncpy = c_g_utf8_strncpy;

/** */
alias g_utf8_strrchr = c_g_utf8_strrchr;

/** */
alias g_utf8_strreverse = c_g_utf8_strreverse;

/** */
alias g_utf8_strup = c_g_utf8_strup;

/** */
alias g_utf8_substring = c_g_utf8_substring;

/** */
alias g_utf8_to_ucs4 = c_g_utf8_to_ucs4;

/** */
alias g_utf8_to_ucs4_fast = c_g_utf8_to_ucs4_fast;

/** */
alias g_utf8_to_utf16 = c_g_utf8_to_utf16;

/** */
alias g_utf8_truncate_middle = c_g_utf8_truncate_middle;

/** */
alias g_utf8_validate = c_g_utf8_validate;

/** */
alias g_utf8_validate_len = c_g_utf8_validate_len;

/** */
alias g_uuid_string_is_valid = c_g_uuid_string_is_valid;

/** */
alias g_uuid_string_random = c_g_uuid_string_random;

/** */
alias g_variant_get_gtype = c_g_variant_get_gtype;

/** */
alias g_vasprintf = c_g_vasprintf;

/** */
alias g_vfprintf = c_g_vfprintf;

/** */
alias g_vprintf = c_g_vprintf;

/** */
alias g_vsnprintf = c_g_vsnprintf;

/** */
alias g_vsprintf = c_g_vsprintf;

/** */
alias g_warn_message = c_g_warn_message;

// UnicodeScript

/** */
alias g_unicode_script_from_iso15924 = c_g_unicode_script_from_iso15924;

/** */
alias g_unicode_script_to_iso15924 = c_g_unicode_script_to_iso15924;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.glib2", "GLib");

  // Allocator
  gidLink(cast(void**)&g_allocator_free, "g_allocator_free", libs);
  gidLink(cast(void**)&g_allocator_new, "g_allocator_new", libs);

  // Array
  gidLink(cast(void**)&g_array_get_type, "g_array_get_type", libs);
  gidLink(cast(void**)&g_array_append_vals, "g_array_append_vals", libs);
  gidLink(cast(void**)&g_array_binary_search, "g_array_binary_search", libs);
  gidLink(cast(void**)&g_array_copy, "g_array_copy", libs);
  gidLink(cast(void**)&g_array_free, "g_array_free", libs);
  gidLink(cast(void**)&g_array_get_element_size, "g_array_get_element_size", libs);
  gidLink(cast(void**)&g_array_insert_vals, "g_array_insert_vals", libs);
  gidLink(cast(void**)&g_array_new, "g_array_new", libs);
  gidLink(cast(void**)&g_array_new_take, "g_array_new_take", libs);
  gidLink(cast(void**)&g_array_new_take_zero_terminated, "g_array_new_take_zero_terminated", libs);
  gidLink(cast(void**)&g_array_prepend_vals, "g_array_prepend_vals", libs);
  gidLink(cast(void**)&g_array_ref, "g_array_ref", libs);
  gidLink(cast(void**)&g_array_remove_index, "g_array_remove_index", libs);
  gidLink(cast(void**)&g_array_remove_index_fast, "g_array_remove_index_fast", libs);
  gidLink(cast(void**)&g_array_remove_range, "g_array_remove_range", libs);
  gidLink(cast(void**)&g_array_set_clear_func, "g_array_set_clear_func", libs);
  gidLink(cast(void**)&g_array_set_size, "g_array_set_size", libs);
  gidLink(cast(void**)&g_array_sized_new, "g_array_sized_new", libs);
  gidLink(cast(void**)&g_array_sort, "g_array_sort", libs);
  gidLink(cast(void**)&g_array_sort_with_data, "g_array_sort_with_data", libs);
  gidLink(cast(void**)&g_array_steal, "g_array_steal", libs);
  gidLink(cast(void**)&g_array_unref, "g_array_unref", libs);

  // AsyncQueue
  gidLink(cast(void**)&g_async_queue_length, "g_async_queue_length", libs);
  gidLink(cast(void**)&g_async_queue_length_unlocked, "g_async_queue_length_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_lock, "g_async_queue_lock", libs);
  gidLink(cast(void**)&g_async_queue_pop, "g_async_queue_pop", libs);
  gidLink(cast(void**)&g_async_queue_pop_unlocked, "g_async_queue_pop_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_push, "g_async_queue_push", libs);
  gidLink(cast(void**)&g_async_queue_push_front, "g_async_queue_push_front", libs);
  gidLink(cast(void**)&g_async_queue_push_front_unlocked, "g_async_queue_push_front_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_push_sorted, "g_async_queue_push_sorted", libs);
  gidLink(cast(void**)&g_async_queue_push_sorted_unlocked, "g_async_queue_push_sorted_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_push_unlocked, "g_async_queue_push_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_ref, "g_async_queue_ref", libs);
  gidLink(cast(void**)&g_async_queue_ref_unlocked, "g_async_queue_ref_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_remove, "g_async_queue_remove", libs);
  gidLink(cast(void**)&g_async_queue_remove_unlocked, "g_async_queue_remove_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_sort, "g_async_queue_sort", libs);
  gidLink(cast(void**)&g_async_queue_sort_unlocked, "g_async_queue_sort_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_timed_pop, "g_async_queue_timed_pop", libs);
  gidLink(cast(void**)&g_async_queue_timed_pop_unlocked, "g_async_queue_timed_pop_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_timeout_pop, "g_async_queue_timeout_pop", libs);
  gidLink(cast(void**)&g_async_queue_timeout_pop_unlocked, "g_async_queue_timeout_pop_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_try_pop, "g_async_queue_try_pop", libs);
  gidLink(cast(void**)&g_async_queue_try_pop_unlocked, "g_async_queue_try_pop_unlocked", libs);
  gidLink(cast(void**)&g_async_queue_unlock, "g_async_queue_unlock", libs);
  gidLink(cast(void**)&g_async_queue_unref, "g_async_queue_unref", libs);
  gidLink(cast(void**)&g_async_queue_unref_and_unlock, "g_async_queue_unref_and_unlock", libs);
  gidLink(cast(void**)&g_async_queue_new, "g_async_queue_new", libs);
  gidLink(cast(void**)&g_async_queue_new_full, "g_async_queue_new_full", libs);

  // BookmarkFile
  gidLink(cast(void**)&g_bookmark_file_get_type, "g_bookmark_file_get_type", libs);
  gidLink(cast(void**)&g_bookmark_file_new, "g_bookmark_file_new", libs);
  gidLink(cast(void**)&g_bookmark_file_add_application, "g_bookmark_file_add_application", libs);
  gidLink(cast(void**)&g_bookmark_file_add_group, "g_bookmark_file_add_group", libs);
  gidLink(cast(void**)&g_bookmark_file_copy, "g_bookmark_file_copy", libs);
  gidLink(cast(void**)&g_bookmark_file_free, "g_bookmark_file_free", libs);
  gidLink(cast(void**)&g_bookmark_file_get_added, "g_bookmark_file_get_added", libs);
  gidLink(cast(void**)&g_bookmark_file_get_added_date_time, "g_bookmark_file_get_added_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_get_app_info, "g_bookmark_file_get_app_info", libs);
  gidLink(cast(void**)&g_bookmark_file_get_application_info, "g_bookmark_file_get_application_info", libs);
  gidLink(cast(void**)&g_bookmark_file_get_applications, "g_bookmark_file_get_applications", libs);
  gidLink(cast(void**)&g_bookmark_file_get_description, "g_bookmark_file_get_description", libs);
  gidLink(cast(void**)&g_bookmark_file_get_groups, "g_bookmark_file_get_groups", libs);
  gidLink(cast(void**)&g_bookmark_file_get_icon, "g_bookmark_file_get_icon", libs);
  gidLink(cast(void**)&g_bookmark_file_get_is_private, "g_bookmark_file_get_is_private", libs);
  gidLink(cast(void**)&g_bookmark_file_get_mime_type, "g_bookmark_file_get_mime_type", libs);
  gidLink(cast(void**)&g_bookmark_file_get_modified, "g_bookmark_file_get_modified", libs);
  gidLink(cast(void**)&g_bookmark_file_get_modified_date_time, "g_bookmark_file_get_modified_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_get_size, "g_bookmark_file_get_size", libs);
  gidLink(cast(void**)&g_bookmark_file_get_title, "g_bookmark_file_get_title", libs);
  gidLink(cast(void**)&g_bookmark_file_get_uris, "g_bookmark_file_get_uris", libs);
  gidLink(cast(void**)&g_bookmark_file_get_visited, "g_bookmark_file_get_visited", libs);
  gidLink(cast(void**)&g_bookmark_file_get_visited_date_time, "g_bookmark_file_get_visited_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_has_application, "g_bookmark_file_has_application", libs);
  gidLink(cast(void**)&g_bookmark_file_has_group, "g_bookmark_file_has_group", libs);
  gidLink(cast(void**)&g_bookmark_file_has_item, "g_bookmark_file_has_item", libs);
  gidLink(cast(void**)&g_bookmark_file_load_from_data, "g_bookmark_file_load_from_data", libs);
  gidLink(cast(void**)&g_bookmark_file_load_from_data_dirs, "g_bookmark_file_load_from_data_dirs", libs);
  gidLink(cast(void**)&g_bookmark_file_load_from_file, "g_bookmark_file_load_from_file", libs);
  gidLink(cast(void**)&g_bookmark_file_move_item, "g_bookmark_file_move_item", libs);
  gidLink(cast(void**)&g_bookmark_file_remove_application, "g_bookmark_file_remove_application", libs);
  gidLink(cast(void**)&g_bookmark_file_remove_group, "g_bookmark_file_remove_group", libs);
  gidLink(cast(void**)&g_bookmark_file_remove_item, "g_bookmark_file_remove_item", libs);
  gidLink(cast(void**)&g_bookmark_file_set_added, "g_bookmark_file_set_added", libs);
  gidLink(cast(void**)&g_bookmark_file_set_added_date_time, "g_bookmark_file_set_added_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_set_app_info, "g_bookmark_file_set_app_info", libs);
  gidLink(cast(void**)&g_bookmark_file_set_application_info, "g_bookmark_file_set_application_info", libs);
  gidLink(cast(void**)&g_bookmark_file_set_description, "g_bookmark_file_set_description", libs);
  gidLink(cast(void**)&g_bookmark_file_set_groups, "g_bookmark_file_set_groups", libs);
  gidLink(cast(void**)&g_bookmark_file_set_icon, "g_bookmark_file_set_icon", libs);
  gidLink(cast(void**)&g_bookmark_file_set_is_private, "g_bookmark_file_set_is_private", libs);
  gidLink(cast(void**)&g_bookmark_file_set_mime_type, "g_bookmark_file_set_mime_type", libs);
  gidLink(cast(void**)&g_bookmark_file_set_modified, "g_bookmark_file_set_modified", libs);
  gidLink(cast(void**)&g_bookmark_file_set_modified_date_time, "g_bookmark_file_set_modified_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_set_title, "g_bookmark_file_set_title", libs);
  gidLink(cast(void**)&g_bookmark_file_set_visited, "g_bookmark_file_set_visited", libs);
  gidLink(cast(void**)&g_bookmark_file_set_visited_date_time, "g_bookmark_file_set_visited_date_time", libs);
  gidLink(cast(void**)&g_bookmark_file_to_data, "g_bookmark_file_to_data", libs);
  gidLink(cast(void**)&g_bookmark_file_to_file, "g_bookmark_file_to_file", libs);
  gidLink(cast(void**)&g_bookmark_file_error_quark, "g_bookmark_file_error_quark", libs);

  // ByteArray
  gidLink(cast(void**)&g_byte_array_get_type, "g_byte_array_get_type", libs);
  gidLink(cast(void**)&g_byte_array_append, "g_byte_array_append", libs);
  gidLink(cast(void**)&g_byte_array_free, "g_byte_array_free", libs);
  gidLink(cast(void**)&g_byte_array_free_to_bytes, "g_byte_array_free_to_bytes", libs);
  gidLink(cast(void**)&g_byte_array_new, "g_byte_array_new", libs);
  gidLink(cast(void**)&g_byte_array_new_take, "g_byte_array_new_take", libs);
  gidLink(cast(void**)&g_byte_array_prepend, "g_byte_array_prepend", libs);
  gidLink(cast(void**)&g_byte_array_ref, "g_byte_array_ref", libs);
  gidLink(cast(void**)&g_byte_array_remove_index, "g_byte_array_remove_index", libs);
  gidLink(cast(void**)&g_byte_array_remove_index_fast, "g_byte_array_remove_index_fast", libs);
  gidLink(cast(void**)&g_byte_array_remove_range, "g_byte_array_remove_range", libs);
  gidLink(cast(void**)&g_byte_array_set_size, "g_byte_array_set_size", libs);
  gidLink(cast(void**)&g_byte_array_sized_new, "g_byte_array_sized_new", libs);
  gidLink(cast(void**)&g_byte_array_sort, "g_byte_array_sort", libs);
  gidLink(cast(void**)&g_byte_array_sort_with_data, "g_byte_array_sort_with_data", libs);
  gidLink(cast(void**)&g_byte_array_steal, "g_byte_array_steal", libs);
  gidLink(cast(void**)&g_byte_array_unref, "g_byte_array_unref", libs);

  // Bytes
  gidLink(cast(void**)&g_bytes_get_type, "g_bytes_get_type", libs);
  gidLink(cast(void**)&g_bytes_new, "g_bytes_new", libs);
  gidLink(cast(void**)&g_bytes_new_from_bytes, "g_bytes_new_from_bytes", libs);
  gidLink(cast(void**)&g_bytes_new_static, "g_bytes_new_static", libs);
  gidLink(cast(void**)&g_bytes_new_take, "g_bytes_new_take", libs);
  gidLink(cast(void**)&g_bytes_new_with_free_func, "g_bytes_new_with_free_func", libs);
  gidLink(cast(void**)&g_bytes_compare, "g_bytes_compare", libs);
  gidLink(cast(void**)&g_bytes_equal, "g_bytes_equal", libs);
  gidLink(cast(void**)&g_bytes_get_data, "g_bytes_get_data", libs);
  gidLink(cast(void**)&g_bytes_get_region, "g_bytes_get_region", libs);
  gidLink(cast(void**)&g_bytes_get_size, "g_bytes_get_size", libs);
  gidLink(cast(void**)&g_bytes_hash, "g_bytes_hash", libs);
  gidLink(cast(void**)&g_bytes_ref, "g_bytes_ref", libs);
  gidLink(cast(void**)&g_bytes_unref, "g_bytes_unref", libs);
  gidLink(cast(void**)&g_bytes_unref_to_array, "g_bytes_unref_to_array", libs);
  gidLink(cast(void**)&g_bytes_unref_to_data, "g_bytes_unref_to_data", libs);

  // Cache
  gidLink(cast(void**)&g_cache_destroy, "g_cache_destroy", libs);
  gidLink(cast(void**)&g_cache_insert, "g_cache_insert", libs);
  gidLink(cast(void**)&g_cache_key_foreach, "g_cache_key_foreach", libs);
  gidLink(cast(void**)&g_cache_remove, "g_cache_remove", libs);
  gidLink(cast(void**)&g_cache_value_foreach, "g_cache_value_foreach", libs);
  gidLink(cast(void**)&g_cache_new, "g_cache_new", libs);

  // Checksum
  gidLink(cast(void**)&g_checksum_get_type, "g_checksum_get_type", libs);
  gidLink(cast(void**)&g_checksum_new, "g_checksum_new", libs);
  gidLink(cast(void**)&g_checksum_copy, "g_checksum_copy", libs);
  gidLink(cast(void**)&g_checksum_free, "g_checksum_free", libs);
  gidLink(cast(void**)&g_checksum_get_digest, "g_checksum_get_digest", libs);
  gidLink(cast(void**)&g_checksum_get_string, "g_checksum_get_string", libs);
  gidLink(cast(void**)&g_checksum_reset, "g_checksum_reset", libs);
  gidLink(cast(void**)&g_checksum_update, "g_checksum_update", libs);
  gidLink(cast(void**)&g_checksum_type_get_length, "g_checksum_type_get_length", libs);

  // Completion
  gidLink(cast(void**)&g_completion_add_items, "g_completion_add_items", libs);
  gidLink(cast(void**)&g_completion_clear_items, "g_completion_clear_items", libs);
  gidLink(cast(void**)&g_completion_complete, "g_completion_complete", libs);
  gidLink(cast(void**)&g_completion_complete_utf8, "g_completion_complete_utf8", libs);
  gidLink(cast(void**)&g_completion_free, "g_completion_free", libs);
  gidLink(cast(void**)&g_completion_remove_items, "g_completion_remove_items", libs);
  gidLink(cast(void**)&g_completion_set_compare, "g_completion_set_compare", libs);
  gidLink(cast(void**)&g_completion_new, "g_completion_new", libs);

  // Cond
  gidLink(cast(void**)&g_cond_broadcast, "g_cond_broadcast", libs);
  gidLink(cast(void**)&g_cond_clear, "g_cond_clear", libs);
  gidLink(cast(void**)&g_cond_free, "g_cond_free", libs);
  gidLink(cast(void**)&g_cond_init, "g_cond_init", libs);
  gidLink(cast(void**)&g_cond_signal, "g_cond_signal", libs);
  gidLink(cast(void**)&g_cond_timed_wait, "g_cond_timed_wait", libs);
  gidLink(cast(void**)&g_cond_wait, "g_cond_wait", libs);
  gidLink(cast(void**)&g_cond_wait_until, "g_cond_wait_until", libs);
  gidLink(cast(void**)&g_cond_new, "g_cond_new", libs);

  // Date
  gidLink(cast(void**)&g_date_get_type, "g_date_get_type", libs);
  gidLink(cast(void**)&g_date_new, "g_date_new", libs);
  gidLink(cast(void**)&g_date_new_dmy, "g_date_new_dmy", libs);
  gidLink(cast(void**)&g_date_new_julian, "g_date_new_julian", libs);
  gidLink(cast(void**)&g_date_add_days, "g_date_add_days", libs);
  gidLink(cast(void**)&g_date_add_months, "g_date_add_months", libs);
  gidLink(cast(void**)&g_date_add_years, "g_date_add_years", libs);
  gidLink(cast(void**)&g_date_clamp, "g_date_clamp", libs);
  gidLink(cast(void**)&g_date_clear, "g_date_clear", libs);
  gidLink(cast(void**)&g_date_compare, "g_date_compare", libs);
  gidLink(cast(void**)&g_date_copy, "g_date_copy", libs);
  gidLink(cast(void**)&g_date_days_between, "g_date_days_between", libs);
  gidLink(cast(void**)&g_date_free, "g_date_free", libs);
  gidLink(cast(void**)&g_date_get_day, "g_date_get_day", libs);
  gidLink(cast(void**)&g_date_get_day_of_year, "g_date_get_day_of_year", libs);
  gidLink(cast(void**)&g_date_get_iso8601_week_of_year, "g_date_get_iso8601_week_of_year", libs);
  gidLink(cast(void**)&g_date_get_julian, "g_date_get_julian", libs);
  gidLink(cast(void**)&g_date_get_monday_week_of_year, "g_date_get_monday_week_of_year", libs);
  gidLink(cast(void**)&g_date_get_month, "g_date_get_month", libs);
  gidLink(cast(void**)&g_date_get_sunday_week_of_year, "g_date_get_sunday_week_of_year", libs);
  gidLink(cast(void**)&g_date_get_week_of_year, "g_date_get_week_of_year", libs);
  gidLink(cast(void**)&g_date_get_weekday, "g_date_get_weekday", libs);
  gidLink(cast(void**)&g_date_get_year, "g_date_get_year", libs);
  gidLink(cast(void**)&g_date_is_first_of_month, "g_date_is_first_of_month", libs);
  gidLink(cast(void**)&g_date_is_last_of_month, "g_date_is_last_of_month", libs);
  gidLink(cast(void**)&g_date_order, "g_date_order", libs);
  gidLink(cast(void**)&g_date_set_day, "g_date_set_day", libs);
  gidLink(cast(void**)&g_date_set_dmy, "g_date_set_dmy", libs);
  gidLink(cast(void**)&g_date_set_julian, "g_date_set_julian", libs);
  gidLink(cast(void**)&g_date_set_month, "g_date_set_month", libs);
  gidLink(cast(void**)&g_date_set_parse, "g_date_set_parse", libs);
  gidLink(cast(void**)&g_date_set_time, "g_date_set_time", libs);
  gidLink(cast(void**)&g_date_set_time_t, "g_date_set_time_t", libs);
  gidLink(cast(void**)&g_date_set_time_val, "g_date_set_time_val", libs);
  gidLink(cast(void**)&g_date_set_year, "g_date_set_year", libs);
  gidLink(cast(void**)&g_date_subtract_days, "g_date_subtract_days", libs);
  gidLink(cast(void**)&g_date_subtract_months, "g_date_subtract_months", libs);
  gidLink(cast(void**)&g_date_subtract_years, "g_date_subtract_years", libs);
  gidLink(cast(void**)&g_date_to_struct_tm, "g_date_to_struct_tm", libs);
  gidLink(cast(void**)&g_date_valid, "g_date_valid", libs);
  gidLink(cast(void**)&g_date_get_days_in_month, "g_date_get_days_in_month", libs);
  gidLink(cast(void**)&g_date_get_monday_weeks_in_year, "g_date_get_monday_weeks_in_year", libs);
  gidLink(cast(void**)&g_date_get_sunday_weeks_in_year, "g_date_get_sunday_weeks_in_year", libs);
  gidLink(cast(void**)&g_date_get_weeks_in_year, "g_date_get_weeks_in_year", libs);
  gidLink(cast(void**)&g_date_is_leap_year, "g_date_is_leap_year", libs);
  gidLink(cast(void**)&g_date_strftime, "g_date_strftime", libs);
  gidLink(cast(void**)&g_date_valid_day, "g_date_valid_day", libs);
  gidLink(cast(void**)&g_date_valid_dmy, "g_date_valid_dmy", libs);
  gidLink(cast(void**)&g_date_valid_julian, "g_date_valid_julian", libs);
  gidLink(cast(void**)&g_date_valid_month, "g_date_valid_month", libs);
  gidLink(cast(void**)&g_date_valid_weekday, "g_date_valid_weekday", libs);
  gidLink(cast(void**)&g_date_valid_year, "g_date_valid_year", libs);

  // DateTime
  gidLink(cast(void**)&g_date_time_get_type, "g_date_time_get_type", libs);
  gidLink(cast(void**)&g_date_time_new, "g_date_time_new", libs);
  gidLink(cast(void**)&g_date_time_new_from_iso8601, "g_date_time_new_from_iso8601", libs);
  gidLink(cast(void**)&g_date_time_new_from_timeval_local, "g_date_time_new_from_timeval_local", libs);
  gidLink(cast(void**)&g_date_time_new_from_timeval_utc, "g_date_time_new_from_timeval_utc", libs);
  gidLink(cast(void**)&g_date_time_new_from_unix_local, "g_date_time_new_from_unix_local", libs);
  gidLink(cast(void**)&g_date_time_new_from_unix_local_usec, "g_date_time_new_from_unix_local_usec", libs);
  gidLink(cast(void**)&g_date_time_new_from_unix_utc, "g_date_time_new_from_unix_utc", libs);
  gidLink(cast(void**)&g_date_time_new_from_unix_utc_usec, "g_date_time_new_from_unix_utc_usec", libs);
  gidLink(cast(void**)&g_date_time_new_local, "g_date_time_new_local", libs);
  gidLink(cast(void**)&g_date_time_new_now, "g_date_time_new_now", libs);
  gidLink(cast(void**)&g_date_time_new_now_local, "g_date_time_new_now_local", libs);
  gidLink(cast(void**)&g_date_time_new_now_utc, "g_date_time_new_now_utc", libs);
  gidLink(cast(void**)&g_date_time_new_utc, "g_date_time_new_utc", libs);
  gidLink(cast(void**)&g_date_time_add, "g_date_time_add", libs);
  gidLink(cast(void**)&g_date_time_add_days, "g_date_time_add_days", libs);
  gidLink(cast(void**)&g_date_time_add_full, "g_date_time_add_full", libs);
  gidLink(cast(void**)&g_date_time_add_hours, "g_date_time_add_hours", libs);
  gidLink(cast(void**)&g_date_time_add_minutes, "g_date_time_add_minutes", libs);
  gidLink(cast(void**)&g_date_time_add_months, "g_date_time_add_months", libs);
  gidLink(cast(void**)&g_date_time_add_seconds, "g_date_time_add_seconds", libs);
  gidLink(cast(void**)&g_date_time_add_weeks, "g_date_time_add_weeks", libs);
  gidLink(cast(void**)&g_date_time_add_years, "g_date_time_add_years", libs);
  gidLink(cast(void**)&g_date_time_compare, "g_date_time_compare", libs);
  gidLink(cast(void**)&g_date_time_difference, "g_date_time_difference", libs);
  gidLink(cast(void**)&g_date_time_equal, "g_date_time_equal", libs);
  gidLink(cast(void**)&g_date_time_format, "g_date_time_format", libs);
  gidLink(cast(void**)&g_date_time_format_iso8601, "g_date_time_format_iso8601", libs);
  gidLink(cast(void**)&g_date_time_get_day_of_month, "g_date_time_get_day_of_month", libs);
  gidLink(cast(void**)&g_date_time_get_day_of_week, "g_date_time_get_day_of_week", libs);
  gidLink(cast(void**)&g_date_time_get_day_of_year, "g_date_time_get_day_of_year", libs);
  gidLink(cast(void**)&g_date_time_get_hour, "g_date_time_get_hour", libs);
  gidLink(cast(void**)&g_date_time_get_microsecond, "g_date_time_get_microsecond", libs);
  gidLink(cast(void**)&g_date_time_get_minute, "g_date_time_get_minute", libs);
  gidLink(cast(void**)&g_date_time_get_month, "g_date_time_get_month", libs);
  gidLink(cast(void**)&g_date_time_get_second, "g_date_time_get_second", libs);
  gidLink(cast(void**)&g_date_time_get_seconds, "g_date_time_get_seconds", libs);
  gidLink(cast(void**)&g_date_time_get_timezone, "g_date_time_get_timezone", libs);
  gidLink(cast(void**)&g_date_time_get_timezone_abbreviation, "g_date_time_get_timezone_abbreviation", libs);
  gidLink(cast(void**)&g_date_time_get_utc_offset, "g_date_time_get_utc_offset", libs);
  gidLink(cast(void**)&g_date_time_get_week_numbering_year, "g_date_time_get_week_numbering_year", libs);
  gidLink(cast(void**)&g_date_time_get_week_of_year, "g_date_time_get_week_of_year", libs);
  gidLink(cast(void**)&g_date_time_get_year, "g_date_time_get_year", libs);
  gidLink(cast(void**)&g_date_time_get_ymd, "g_date_time_get_ymd", libs);
  gidLink(cast(void**)&g_date_time_hash, "g_date_time_hash", libs);
  gidLink(cast(void**)&g_date_time_is_daylight_savings, "g_date_time_is_daylight_savings", libs);
  gidLink(cast(void**)&g_date_time_ref, "g_date_time_ref", libs);
  gidLink(cast(void**)&g_date_time_to_local, "g_date_time_to_local", libs);
  gidLink(cast(void**)&g_date_time_to_timeval, "g_date_time_to_timeval", libs);
  gidLink(cast(void**)&g_date_time_to_timezone, "g_date_time_to_timezone", libs);
  gidLink(cast(void**)&g_date_time_to_unix, "g_date_time_to_unix", libs);
  gidLink(cast(void**)&g_date_time_to_unix_usec, "g_date_time_to_unix_usec", libs);
  gidLink(cast(void**)&g_date_time_to_utc, "g_date_time_to_utc", libs);
  gidLink(cast(void**)&g_date_time_unref, "g_date_time_unref", libs);

  // Dir
  gidLink(cast(void**)&g_dir_get_type, "g_dir_get_type", libs);
  gidLink(cast(void**)&g_dir_open, "g_dir_open", libs);
  gidLink(cast(void**)&g_dir_close, "g_dir_close", libs);
  gidLink(cast(void**)&g_dir_read_name, "g_dir_read_name", libs);
  gidLink(cast(void**)&g_dir_ref, "g_dir_ref", libs);
  gidLink(cast(void**)&g_dir_rewind, "g_dir_rewind", libs);
  gidLink(cast(void**)&g_dir_unref, "g_dir_unref", libs);
  gidLink(cast(void**)&g_dir_make_tmp, "g_dir_make_tmp", libs);

  // ErrorWrap
  gidLink(cast(void**)&g_error_get_type, "g_error_get_type", libs);
  gidLink(cast(void**)&g_error_new, "g_error_new", libs);
  gidLink(cast(void**)&g_error_new_literal, "g_error_new_literal", libs);
  gidLink(cast(void**)&g_error_new_valist, "g_error_new_valist", libs);
  gidLink(cast(void**)&g_error_copy, "g_error_copy", libs);
  gidLink(cast(void**)&g_error_free, "g_error_free", libs);
  gidLink(cast(void**)&g_error_matches, "g_error_matches", libs);
  gidLink(cast(void**)&g_error_domain_register, "g_error_domain_register", libs);
  gidLink(cast(void**)&g_error_domain_register_static, "g_error_domain_register_static", libs);

  // HashTable
  gidLink(cast(void**)&g_hash_table_get_type, "g_hash_table_get_type", libs);
  gidLink(cast(void**)&g_hash_table_add, "g_hash_table_add", libs);
  gidLink(cast(void**)&g_hash_table_contains, "g_hash_table_contains", libs);
  gidLink(cast(void**)&g_hash_table_destroy, "g_hash_table_destroy", libs);
  gidLink(cast(void**)&g_hash_table_find, "g_hash_table_find", libs);
  gidLink(cast(void**)&g_hash_table_foreach, "g_hash_table_foreach", libs);
  gidLink(cast(void**)&g_hash_table_foreach_remove, "g_hash_table_foreach_remove", libs);
  gidLink(cast(void**)&g_hash_table_foreach_steal, "g_hash_table_foreach_steal", libs);
  gidLink(cast(void**)&g_hash_table_get_keys, "g_hash_table_get_keys", libs);
  gidLink(cast(void**)&g_hash_table_get_keys_as_array, "g_hash_table_get_keys_as_array", libs);
  gidLink(cast(void**)&g_hash_table_get_keys_as_ptr_array, "g_hash_table_get_keys_as_ptr_array", libs);
  gidLink(cast(void**)&g_hash_table_get_values, "g_hash_table_get_values", libs);
  gidLink(cast(void**)&g_hash_table_get_values_as_ptr_array, "g_hash_table_get_values_as_ptr_array", libs);
  gidLink(cast(void**)&g_hash_table_insert, "g_hash_table_insert", libs);
  gidLink(cast(void**)&g_hash_table_lookup, "g_hash_table_lookup", libs);
  gidLink(cast(void**)&g_hash_table_lookup_extended, "g_hash_table_lookup_extended", libs);
  gidLink(cast(void**)&g_hash_table_new, "g_hash_table_new", libs);
  gidLink(cast(void**)&g_hash_table_new_full, "g_hash_table_new_full", libs);
  gidLink(cast(void**)&g_hash_table_new_similar, "g_hash_table_new_similar", libs);
  gidLink(cast(void**)&g_hash_table_ref, "g_hash_table_ref", libs);
  gidLink(cast(void**)&g_hash_table_remove, "g_hash_table_remove", libs);
  gidLink(cast(void**)&g_hash_table_remove_all, "g_hash_table_remove_all", libs);
  gidLink(cast(void**)&g_hash_table_replace, "g_hash_table_replace", libs);
  gidLink(cast(void**)&g_hash_table_size, "g_hash_table_size", libs);
  gidLink(cast(void**)&g_hash_table_steal, "g_hash_table_steal", libs);
  gidLink(cast(void**)&g_hash_table_steal_all, "g_hash_table_steal_all", libs);
  gidLink(cast(void**)&g_hash_table_steal_all_keys, "g_hash_table_steal_all_keys", libs);
  gidLink(cast(void**)&g_hash_table_steal_all_values, "g_hash_table_steal_all_values", libs);
  gidLink(cast(void**)&g_hash_table_steal_extended, "g_hash_table_steal_extended", libs);
  gidLink(cast(void**)&g_hash_table_unref, "g_hash_table_unref", libs);

  // HashTableIter
  gidLink(cast(void**)&g_hash_table_iter_get_hash_table, "g_hash_table_iter_get_hash_table", libs);
  gidLink(cast(void**)&g_hash_table_iter_init, "g_hash_table_iter_init", libs);
  gidLink(cast(void**)&g_hash_table_iter_next, "g_hash_table_iter_next", libs);
  gidLink(cast(void**)&g_hash_table_iter_remove, "g_hash_table_iter_remove", libs);
  gidLink(cast(void**)&g_hash_table_iter_replace, "g_hash_table_iter_replace", libs);
  gidLink(cast(void**)&g_hash_table_iter_steal, "g_hash_table_iter_steal", libs);

  // Hmac
  gidLink(cast(void**)&g_hmac_get_type, "g_hmac_get_type", libs);
  gidLink(cast(void**)&g_hmac_new, "g_hmac_new", libs);
  gidLink(cast(void**)&g_hmac_copy, "g_hmac_copy", libs);
  gidLink(cast(void**)&g_hmac_get_digest, "g_hmac_get_digest", libs);
  gidLink(cast(void**)&g_hmac_get_string, "g_hmac_get_string", libs);
  gidLink(cast(void**)&g_hmac_ref, "g_hmac_ref", libs);
  gidLink(cast(void**)&g_hmac_unref, "g_hmac_unref", libs);
  gidLink(cast(void**)&g_hmac_update, "g_hmac_update", libs);

  // Hook
  gidLink(cast(void**)&g_hook_compare_ids, "g_hook_compare_ids", libs);
  gidLink(cast(void**)&g_hook_alloc, "g_hook_alloc", libs);
  gidLink(cast(void**)&g_hook_destroy, "g_hook_destroy", libs);
  gidLink(cast(void**)&g_hook_destroy_link, "g_hook_destroy_link", libs);
  gidLink(cast(void**)&g_hook_find, "g_hook_find", libs);
  gidLink(cast(void**)&g_hook_find_data, "g_hook_find_data", libs);
  gidLink(cast(void**)&g_hook_find_func, "g_hook_find_func", libs);
  gidLink(cast(void**)&g_hook_find_func_data, "g_hook_find_func_data", libs);
  gidLink(cast(void**)&g_hook_first_valid, "g_hook_first_valid", libs);
  gidLink(cast(void**)&g_hook_free, "g_hook_free", libs);
  gidLink(cast(void**)&g_hook_get, "g_hook_get", libs);
  gidLink(cast(void**)&g_hook_insert_before, "g_hook_insert_before", libs);
  gidLink(cast(void**)&g_hook_insert_sorted, "g_hook_insert_sorted", libs);
  gidLink(cast(void**)&g_hook_next_valid, "g_hook_next_valid", libs);
  gidLink(cast(void**)&g_hook_prepend, "g_hook_prepend", libs);
  gidLink(cast(void**)&g_hook_ref, "g_hook_ref", libs);
  gidLink(cast(void**)&g_hook_unref, "g_hook_unref", libs);

  // HookList
  gidLink(cast(void**)&g_hook_list_clear, "g_hook_list_clear", libs);
  gidLink(cast(void**)&g_hook_list_init, "g_hook_list_init", libs);
  gidLink(cast(void**)&g_hook_list_invoke, "g_hook_list_invoke", libs);
  gidLink(cast(void**)&g_hook_list_invoke_check, "g_hook_list_invoke_check", libs);
  gidLink(cast(void**)&g_hook_list_marshal, "g_hook_list_marshal", libs);
  gidLink(cast(void**)&g_hook_list_marshal_check, "g_hook_list_marshal_check", libs);

  // IOChannel
  gidLink(cast(void**)&g_io_channel_get_type, "g_io_channel_get_type", libs);
  gidLink(cast(void**)&g_io_channel_new_file, "g_io_channel_new_file", libs);
  gidLink(cast(void**)&g_io_channel_unix_new, "g_io_channel_unix_new", libs);
  gidLink(cast(void**)&g_io_channel_close, "g_io_channel_close", libs);
  gidLink(cast(void**)&g_io_channel_flush, "g_io_channel_flush", libs);
  gidLink(cast(void**)&g_io_channel_get_buffer_condition, "g_io_channel_get_buffer_condition", libs);
  gidLink(cast(void**)&g_io_channel_get_buffer_size, "g_io_channel_get_buffer_size", libs);
  gidLink(cast(void**)&g_io_channel_get_buffered, "g_io_channel_get_buffered", libs);
  gidLink(cast(void**)&g_io_channel_get_close_on_unref, "g_io_channel_get_close_on_unref", libs);
  gidLink(cast(void**)&g_io_channel_get_encoding, "g_io_channel_get_encoding", libs);
  gidLink(cast(void**)&g_io_channel_get_flags, "g_io_channel_get_flags", libs);
  gidLink(cast(void**)&g_io_channel_get_line_term, "g_io_channel_get_line_term", libs);
  gidLink(cast(void**)&g_io_channel_init, "g_io_channel_init", libs);
  gidLink(cast(void**)&g_io_channel_read, "g_io_channel_read", libs);
  gidLink(cast(void**)&g_io_channel_read_chars, "g_io_channel_read_chars", libs);
  gidLink(cast(void**)&g_io_channel_read_line, "g_io_channel_read_line", libs);
  gidLink(cast(void**)&g_io_channel_read_line_string, "g_io_channel_read_line_string", libs);
  gidLink(cast(void**)&g_io_channel_read_to_end, "g_io_channel_read_to_end", libs);
  gidLink(cast(void**)&g_io_channel_read_unichar, "g_io_channel_read_unichar", libs);
  gidLink(cast(void**)&g_io_channel_ref, "g_io_channel_ref", libs);
  gidLink(cast(void**)&g_io_channel_seek, "g_io_channel_seek", libs);
  gidLink(cast(void**)&g_io_channel_seek_position, "g_io_channel_seek_position", libs);
  gidLink(cast(void**)&g_io_channel_set_buffer_size, "g_io_channel_set_buffer_size", libs);
  gidLink(cast(void**)&g_io_channel_set_buffered, "g_io_channel_set_buffered", libs);
  gidLink(cast(void**)&g_io_channel_set_close_on_unref, "g_io_channel_set_close_on_unref", libs);
  gidLink(cast(void**)&g_io_channel_set_encoding, "g_io_channel_set_encoding", libs);
  gidLink(cast(void**)&g_io_channel_set_flags, "g_io_channel_set_flags", libs);
  gidLink(cast(void**)&g_io_channel_set_line_term, "g_io_channel_set_line_term", libs);
  gidLink(cast(void**)&g_io_channel_shutdown, "g_io_channel_shutdown", libs);
  gidLink(cast(void**)&g_io_channel_unix_get_fd, "g_io_channel_unix_get_fd", libs);
  gidLink(cast(void**)&g_io_channel_unref, "g_io_channel_unref", libs);
  gidLink(cast(void**)&g_io_channel_write, "g_io_channel_write", libs);
  gidLink(cast(void**)&g_io_channel_write_chars, "g_io_channel_write_chars", libs);
  gidLink(cast(void**)&g_io_channel_write_unichar, "g_io_channel_write_unichar", libs);
  gidLink(cast(void**)&g_io_channel_error_from_errno, "g_io_channel_error_from_errno", libs);
  gidLink(cast(void**)&g_io_channel_error_quark, "g_io_channel_error_quark", libs);

  // KeyFile
  gidLink(cast(void**)&g_key_file_get_type, "g_key_file_get_type", libs);
  gidLink(cast(void**)&g_key_file_new, "g_key_file_new", libs);
  gidLink(cast(void**)&g_key_file_free, "g_key_file_free", libs);
  gidLink(cast(void**)&g_key_file_get_boolean, "g_key_file_get_boolean", libs);
  gidLink(cast(void**)&g_key_file_get_boolean_list, "g_key_file_get_boolean_list", libs);
  gidLink(cast(void**)&g_key_file_get_comment, "g_key_file_get_comment", libs);
  gidLink(cast(void**)&g_key_file_get_double, "g_key_file_get_double", libs);
  gidLink(cast(void**)&g_key_file_get_double_list, "g_key_file_get_double_list", libs);
  gidLink(cast(void**)&g_key_file_get_groups, "g_key_file_get_groups", libs);
  gidLink(cast(void**)&g_key_file_get_int64, "g_key_file_get_int64", libs);
  gidLink(cast(void**)&g_key_file_get_integer, "g_key_file_get_integer", libs);
  gidLink(cast(void**)&g_key_file_get_integer_list, "g_key_file_get_integer_list", libs);
  gidLink(cast(void**)&g_key_file_get_keys, "g_key_file_get_keys", libs);
  gidLink(cast(void**)&g_key_file_get_locale_for_key, "g_key_file_get_locale_for_key", libs);
  gidLink(cast(void**)&g_key_file_get_locale_string, "g_key_file_get_locale_string", libs);
  gidLink(cast(void**)&g_key_file_get_locale_string_list, "g_key_file_get_locale_string_list", libs);
  gidLink(cast(void**)&g_key_file_get_start_group, "g_key_file_get_start_group", libs);
  gidLink(cast(void**)&g_key_file_get_string, "g_key_file_get_string", libs);
  gidLink(cast(void**)&g_key_file_get_string_list, "g_key_file_get_string_list", libs);
  gidLink(cast(void**)&g_key_file_get_uint64, "g_key_file_get_uint64", libs);
  gidLink(cast(void**)&g_key_file_get_value, "g_key_file_get_value", libs);
  gidLink(cast(void**)&g_key_file_has_group, "g_key_file_has_group", libs);
  gidLink(cast(void**)&g_key_file_has_key, "g_key_file_has_key", libs);
  gidLink(cast(void**)&g_key_file_load_from_bytes, "g_key_file_load_from_bytes", libs);
  gidLink(cast(void**)&g_key_file_load_from_data, "g_key_file_load_from_data", libs);
  gidLink(cast(void**)&g_key_file_load_from_data_dirs, "g_key_file_load_from_data_dirs", libs);
  gidLink(cast(void**)&g_key_file_load_from_dirs, "g_key_file_load_from_dirs", libs);
  gidLink(cast(void**)&g_key_file_load_from_file, "g_key_file_load_from_file", libs);
  gidLink(cast(void**)&g_key_file_ref, "g_key_file_ref", libs);
  gidLink(cast(void**)&g_key_file_remove_comment, "g_key_file_remove_comment", libs);
  gidLink(cast(void**)&g_key_file_remove_group, "g_key_file_remove_group", libs);
  gidLink(cast(void**)&g_key_file_remove_key, "g_key_file_remove_key", libs);
  gidLink(cast(void**)&g_key_file_save_to_file, "g_key_file_save_to_file", libs);
  gidLink(cast(void**)&g_key_file_set_boolean, "g_key_file_set_boolean", libs);
  gidLink(cast(void**)&g_key_file_set_boolean_list, "g_key_file_set_boolean_list", libs);
  gidLink(cast(void**)&g_key_file_set_comment, "g_key_file_set_comment", libs);
  gidLink(cast(void**)&g_key_file_set_double, "g_key_file_set_double", libs);
  gidLink(cast(void**)&g_key_file_set_double_list, "g_key_file_set_double_list", libs);
  gidLink(cast(void**)&g_key_file_set_int64, "g_key_file_set_int64", libs);
  gidLink(cast(void**)&g_key_file_set_integer, "g_key_file_set_integer", libs);
  gidLink(cast(void**)&g_key_file_set_integer_list, "g_key_file_set_integer_list", libs);
  gidLink(cast(void**)&g_key_file_set_list_separator, "g_key_file_set_list_separator", libs);
  gidLink(cast(void**)&g_key_file_set_locale_string, "g_key_file_set_locale_string", libs);
  gidLink(cast(void**)&g_key_file_set_locale_string_list, "g_key_file_set_locale_string_list", libs);
  gidLink(cast(void**)&g_key_file_set_string, "g_key_file_set_string", libs);
  gidLink(cast(void**)&g_key_file_set_string_list, "g_key_file_set_string_list", libs);
  gidLink(cast(void**)&g_key_file_set_uint64, "g_key_file_set_uint64", libs);
  gidLink(cast(void**)&g_key_file_set_value, "g_key_file_set_value", libs);
  gidLink(cast(void**)&g_key_file_to_data, "g_key_file_to_data", libs);
  gidLink(cast(void**)&g_key_file_unref, "g_key_file_unref", libs);
  gidLink(cast(void**)&g_key_file_error_quark, "g_key_file_error_quark", libs);

  // List
  gidLink(cast(void**)&g_list_alloc, "g_list_alloc", libs);
  gidLink(cast(void**)&g_list_append, "g_list_append", libs);
  gidLink(cast(void**)&g_list_concat, "g_list_concat", libs);
  gidLink(cast(void**)&g_list_copy, "g_list_copy", libs);
  gidLink(cast(void**)&g_list_copy_deep, "g_list_copy_deep", libs);
  gidLink(cast(void**)&g_list_delete_link, "g_list_delete_link", libs);
  gidLink(cast(void**)&g_list_find, "g_list_find", libs);
  gidLink(cast(void**)&g_list_find_custom, "g_list_find_custom", libs);
  gidLink(cast(void**)&g_list_first, "g_list_first", libs);
  gidLink(cast(void**)&g_list_foreach, "g_list_foreach", libs);
  gidLink(cast(void**)&g_list_free, "g_list_free", libs);
  gidLink(cast(void**)&g_list_free_1, "g_list_free_1", libs);
  gidLink(cast(void**)&g_list_free_full, "g_list_free_full", libs);
  gidLink(cast(void**)&g_list_index, "g_list_index", libs);
  gidLink(cast(void**)&g_list_insert, "g_list_insert", libs);
  gidLink(cast(void**)&g_list_insert_before, "g_list_insert_before", libs);
  gidLink(cast(void**)&g_list_insert_before_link, "g_list_insert_before_link", libs);
  gidLink(cast(void**)&g_list_insert_sorted, "g_list_insert_sorted", libs);
  gidLink(cast(void**)&g_list_insert_sorted_with_data, "g_list_insert_sorted_with_data", libs);
  gidLink(cast(void**)&g_list_last, "g_list_last", libs);
  gidLink(cast(void**)&g_list_length, "g_list_length", libs);
  gidLink(cast(void**)&g_list_nth, "g_list_nth", libs);
  gidLink(cast(void**)&g_list_nth_data, "g_list_nth_data", libs);
  gidLink(cast(void**)&g_list_nth_prev, "g_list_nth_prev", libs);
  gidLink(cast(void**)&g_list_pop_allocator, "g_list_pop_allocator", libs);
  gidLink(cast(void**)&g_list_position, "g_list_position", libs);
  gidLink(cast(void**)&g_list_prepend, "g_list_prepend", libs);
  gidLink(cast(void**)&g_list_push_allocator, "g_list_push_allocator", libs);
  gidLink(cast(void**)&g_list_remove, "g_list_remove", libs);
  gidLink(cast(void**)&g_list_remove_all, "g_list_remove_all", libs);
  gidLink(cast(void**)&g_list_remove_link, "g_list_remove_link", libs);
  gidLink(cast(void**)&g_list_reverse, "g_list_reverse", libs);
  gidLink(cast(void**)&g_list_sort, "g_list_sort", libs);
  gidLink(cast(void**)&g_list_sort_with_data, "g_list_sort_with_data", libs);

  // MainContext
  gidLink(cast(void**)&g_main_context_get_type, "g_main_context_get_type", libs);
  gidLink(cast(void**)&g_main_context_new, "g_main_context_new", libs);
  gidLink(cast(void**)&g_main_context_new_with_flags, "g_main_context_new_with_flags", libs);
  gidLink(cast(void**)&g_main_context_acquire, "g_main_context_acquire", libs);
  gidLink(cast(void**)&g_main_context_add_poll, "g_main_context_add_poll", libs);
  gidLink(cast(void**)&g_main_context_check, "g_main_context_check", libs);
  gidLink(cast(void**)&g_main_context_dispatch, "g_main_context_dispatch", libs);
  gidLink(cast(void**)&g_main_context_find_source_by_funcs_user_data, "g_main_context_find_source_by_funcs_user_data", libs);
  gidLink(cast(void**)&g_main_context_find_source_by_id, "g_main_context_find_source_by_id", libs);
  gidLink(cast(void**)&g_main_context_find_source_by_user_data, "g_main_context_find_source_by_user_data", libs);
  gidLink(cast(void**)&g_main_context_get_poll_func, "g_main_context_get_poll_func", libs);
  gidLink(cast(void**)&g_main_context_invoke, "g_main_context_invoke", libs);
  gidLink(cast(void**)&g_main_context_invoke_full, "g_main_context_invoke_full", libs);
  gidLink(cast(void**)&g_main_context_is_owner, "g_main_context_is_owner", libs);
  gidLink(cast(void**)&g_main_context_iteration, "g_main_context_iteration", libs);
  gidLink(cast(void**)&g_main_context_pending, "g_main_context_pending", libs);
  gidLink(cast(void**)&g_main_context_pop_thread_default, "g_main_context_pop_thread_default", libs);
  gidLink(cast(void**)&g_main_context_prepare, "g_main_context_prepare", libs);
  gidLink(cast(void**)&g_main_context_push_thread_default, "g_main_context_push_thread_default", libs);
  gidLink(cast(void**)&g_main_context_pusher_new, "g_main_context_pusher_new", libs);
  gidLink(cast(void**)&g_main_context_query, "g_main_context_query", libs);
  gidLink(cast(void**)&g_main_context_ref, "g_main_context_ref", libs);
  gidLink(cast(void**)&g_main_context_release, "g_main_context_release", libs);
  gidLink(cast(void**)&g_main_context_remove_poll, "g_main_context_remove_poll", libs);
  gidLink(cast(void**)&g_main_context_set_poll_func, "g_main_context_set_poll_func", libs);
  gidLink(cast(void**)&g_main_context_unref, "g_main_context_unref", libs);
  gidLink(cast(void**)&g_main_context_wait, "g_main_context_wait", libs);
  gidLink(cast(void**)&g_main_context_wakeup, "g_main_context_wakeup", libs);
  gidLink(cast(void**)&g_main_context_default, "g_main_context_default", libs);
  gidLink(cast(void**)&g_main_context_get_thread_default, "g_main_context_get_thread_default", libs);
  gidLink(cast(void**)&g_main_context_pusher_free, "g_main_context_pusher_free", libs);
  gidLink(cast(void**)&g_main_context_ref_thread_default, "g_main_context_ref_thread_default", libs);

  // MainLoop
  gidLink(cast(void**)&g_main_loop_get_type, "g_main_loop_get_type", libs);
  gidLink(cast(void**)&g_main_loop_new, "g_main_loop_new", libs);
  gidLink(cast(void**)&g_main_loop_get_context, "g_main_loop_get_context", libs);
  gidLink(cast(void**)&g_main_loop_is_running, "g_main_loop_is_running", libs);
  gidLink(cast(void**)&g_main_loop_quit, "g_main_loop_quit", libs);
  gidLink(cast(void**)&g_main_loop_ref, "g_main_loop_ref", libs);
  gidLink(cast(void**)&g_main_loop_run, "g_main_loop_run", libs);
  gidLink(cast(void**)&g_main_loop_unref, "g_main_loop_unref", libs);

  // MappedFile
  gidLink(cast(void**)&g_mapped_file_get_type, "g_mapped_file_get_type", libs);
  gidLink(cast(void**)&g_mapped_file_new, "g_mapped_file_new", libs);
  gidLink(cast(void**)&g_mapped_file_new_from_fd, "g_mapped_file_new_from_fd", libs);
  gidLink(cast(void**)&g_mapped_file_free, "g_mapped_file_free", libs);
  gidLink(cast(void**)&g_mapped_file_get_bytes, "g_mapped_file_get_bytes", libs);
  gidLink(cast(void**)&g_mapped_file_get_contents, "g_mapped_file_get_contents", libs);
  gidLink(cast(void**)&g_mapped_file_get_length, "g_mapped_file_get_length", libs);
  gidLink(cast(void**)&g_mapped_file_ref, "g_mapped_file_ref", libs);
  gidLink(cast(void**)&g_mapped_file_unref, "g_mapped_file_unref", libs);

  // MarkupParseContext
  gidLink(cast(void**)&g_markup_parse_context_get_type, "g_markup_parse_context_get_type", libs);
  gidLink(cast(void**)&g_markup_parse_context_new, "g_markup_parse_context_new", libs);
  gidLink(cast(void**)&g_markup_parse_context_end_parse, "g_markup_parse_context_end_parse", libs);
  gidLink(cast(void**)&g_markup_parse_context_free, "g_markup_parse_context_free", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_element, "g_markup_parse_context_get_element", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_element_stack, "g_markup_parse_context_get_element_stack", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_offset, "g_markup_parse_context_get_offset", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_position, "g_markup_parse_context_get_position", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_tag_start, "g_markup_parse_context_get_tag_start", libs);
  gidLink(cast(void**)&g_markup_parse_context_get_user_data, "g_markup_parse_context_get_user_data", libs);
  gidLink(cast(void**)&g_markup_parse_context_parse, "g_markup_parse_context_parse", libs);
  gidLink(cast(void**)&g_markup_parse_context_pop, "g_markup_parse_context_pop", libs);
  gidLink(cast(void**)&g_markup_parse_context_push, "g_markup_parse_context_push", libs);
  gidLink(cast(void**)&g_markup_parse_context_ref, "g_markup_parse_context_ref", libs);
  gidLink(cast(void**)&g_markup_parse_context_unref, "g_markup_parse_context_unref", libs);

  // MatchInfo
  gidLink(cast(void**)&g_match_info_get_type, "g_match_info_get_type", libs);
  gidLink(cast(void**)&g_match_info_expand_references, "g_match_info_expand_references", libs);
  gidLink(cast(void**)&g_match_info_fetch, "g_match_info_fetch", libs);
  gidLink(cast(void**)&g_match_info_fetch_all, "g_match_info_fetch_all", libs);
  gidLink(cast(void**)&g_match_info_fetch_named, "g_match_info_fetch_named", libs);
  gidLink(cast(void**)&g_match_info_fetch_named_pos, "g_match_info_fetch_named_pos", libs);
  gidLink(cast(void**)&g_match_info_fetch_pos, "g_match_info_fetch_pos", libs);
  gidLink(cast(void**)&g_match_info_free, "g_match_info_free", libs);
  gidLink(cast(void**)&g_match_info_get_match_count, "g_match_info_get_match_count", libs);
  gidLink(cast(void**)&g_match_info_get_regex, "g_match_info_get_regex", libs);
  gidLink(cast(void**)&g_match_info_get_string, "g_match_info_get_string", libs);
  gidLink(cast(void**)&g_match_info_is_partial_match, "g_match_info_is_partial_match", libs);
  gidLink(cast(void**)&g_match_info_matches, "g_match_info_matches", libs);
  gidLink(cast(void**)&g_match_info_next, "g_match_info_next", libs);
  gidLink(cast(void**)&g_match_info_ref, "g_match_info_ref", libs);
  gidLink(cast(void**)&g_match_info_unref, "g_match_info_unref", libs);

  // MemChunk
  gidLink(cast(void**)&g_mem_chunk_alloc, "g_mem_chunk_alloc", libs);
  gidLink(cast(void**)&g_mem_chunk_alloc0, "g_mem_chunk_alloc0", libs);
  gidLink(cast(void**)&g_mem_chunk_clean, "g_mem_chunk_clean", libs);
  gidLink(cast(void**)&g_mem_chunk_destroy, "g_mem_chunk_destroy", libs);
  gidLink(cast(void**)&g_mem_chunk_free, "g_mem_chunk_free", libs);
  gidLink(cast(void**)&g_mem_chunk_print, "g_mem_chunk_print", libs);
  gidLink(cast(void**)&g_mem_chunk_reset, "g_mem_chunk_reset", libs);
  gidLink(cast(void**)&g_mem_chunk_info, "g_mem_chunk_info", libs);
  gidLink(cast(void**)&g_mem_chunk_new, "g_mem_chunk_new", libs);

  // Mutex
  gidLink(cast(void**)&g_mutex_clear, "g_mutex_clear", libs);
  gidLink(cast(void**)&g_mutex_free, "g_mutex_free", libs);
  gidLink(cast(void**)&g_mutex_init, "g_mutex_init", libs);
  gidLink(cast(void**)&g_mutex_lock, "g_mutex_lock", libs);
  gidLink(cast(void**)&g_mutex_trylock, "g_mutex_trylock", libs);
  gidLink(cast(void**)&g_mutex_unlock, "g_mutex_unlock", libs);
  gidLink(cast(void**)&g_mutex_new, "g_mutex_new", libs);

  // Node
  gidLink(cast(void**)&g_node_child_index, "g_node_child_index", libs);
  gidLink(cast(void**)&g_node_child_position, "g_node_child_position", libs);
  gidLink(cast(void**)&g_node_children_foreach, "g_node_children_foreach", libs);
  gidLink(cast(void**)&g_node_copy, "g_node_copy", libs);
  gidLink(cast(void**)&g_node_copy_deep, "g_node_copy_deep", libs);
  gidLink(cast(void**)&g_node_depth, "g_node_depth", libs);
  gidLink(cast(void**)&g_node_destroy, "g_node_destroy", libs);
  gidLink(cast(void**)&g_node_find, "g_node_find", libs);
  gidLink(cast(void**)&g_node_find_child, "g_node_find_child", libs);
  gidLink(cast(void**)&g_node_first_sibling, "g_node_first_sibling", libs);
  gidLink(cast(void**)&g_node_get_root, "g_node_get_root", libs);
  gidLink(cast(void**)&g_node_insert, "g_node_insert", libs);
  gidLink(cast(void**)&g_node_insert_after, "g_node_insert_after", libs);
  gidLink(cast(void**)&g_node_insert_before, "g_node_insert_before", libs);
  gidLink(cast(void**)&g_node_is_ancestor, "g_node_is_ancestor", libs);
  gidLink(cast(void**)&g_node_last_child, "g_node_last_child", libs);
  gidLink(cast(void**)&g_node_last_sibling, "g_node_last_sibling", libs);
  gidLink(cast(void**)&g_node_max_height, "g_node_max_height", libs);
  gidLink(cast(void**)&g_node_n_children, "g_node_n_children", libs);
  gidLink(cast(void**)&g_node_n_nodes, "g_node_n_nodes", libs);
  gidLink(cast(void**)&g_node_nth_child, "g_node_nth_child", libs);
  gidLink(cast(void**)&g_node_prepend, "g_node_prepend", libs);
  gidLink(cast(void**)&g_node_reverse_children, "g_node_reverse_children", libs);
  gidLink(cast(void**)&g_node_traverse, "g_node_traverse", libs);
  gidLink(cast(void**)&g_node_unlink, "g_node_unlink", libs);
  gidLink(cast(void**)&g_node_new, "g_node_new", libs);
  gidLink(cast(void**)&g_node_pop_allocator, "g_node_pop_allocator", libs);
  gidLink(cast(void**)&g_node_push_allocator, "g_node_push_allocator", libs);

  // Once
  gidLink(cast(void**)&g_once_impl, "g_once_impl", libs);
  gidLink(cast(void**)&g_once_init_enter, "g_once_init_enter", libs);
  gidLink(cast(void**)&g_once_init_enter_impl, "g_once_init_enter_impl", libs);
  gidLink(cast(void**)&g_once_init_enter_pointer, "g_once_init_enter_pointer", libs);
  gidLink(cast(void**)&g_once_init_leave, "g_once_init_leave", libs);
  gidLink(cast(void**)&g_once_init_leave_pointer, "g_once_init_leave_pointer", libs);

  // OptionContext
  gidLink(cast(void**)&g_option_context_add_group, "g_option_context_add_group", libs);
  gidLink(cast(void**)&g_option_context_add_main_entries, "g_option_context_add_main_entries", libs);
  gidLink(cast(void**)&g_option_context_free, "g_option_context_free", libs);
  gidLink(cast(void**)&g_option_context_get_description, "g_option_context_get_description", libs);
  gidLink(cast(void**)&g_option_context_get_help, "g_option_context_get_help", libs);
  gidLink(cast(void**)&g_option_context_get_help_enabled, "g_option_context_get_help_enabled", libs);
  gidLink(cast(void**)&g_option_context_get_ignore_unknown_options, "g_option_context_get_ignore_unknown_options", libs);
  gidLink(cast(void**)&g_option_context_get_main_group, "g_option_context_get_main_group", libs);
  gidLink(cast(void**)&g_option_context_get_strict_posix, "g_option_context_get_strict_posix", libs);
  gidLink(cast(void**)&g_option_context_get_summary, "g_option_context_get_summary", libs);
  gidLink(cast(void**)&g_option_context_parse, "g_option_context_parse", libs);
  gidLink(cast(void**)&g_option_context_parse_strv, "g_option_context_parse_strv", libs);
  gidLink(cast(void**)&g_option_context_set_description, "g_option_context_set_description", libs);
  gidLink(cast(void**)&g_option_context_set_help_enabled, "g_option_context_set_help_enabled", libs);
  gidLink(cast(void**)&g_option_context_set_ignore_unknown_options, "g_option_context_set_ignore_unknown_options", libs);
  gidLink(cast(void**)&g_option_context_set_main_group, "g_option_context_set_main_group", libs);
  gidLink(cast(void**)&g_option_context_set_strict_posix, "g_option_context_set_strict_posix", libs);
  gidLink(cast(void**)&g_option_context_set_summary, "g_option_context_set_summary", libs);
  gidLink(cast(void**)&g_option_context_set_translate_func, "g_option_context_set_translate_func", libs);
  gidLink(cast(void**)&g_option_context_set_translation_domain, "g_option_context_set_translation_domain", libs);
  gidLink(cast(void**)&g_option_context_new, "g_option_context_new", libs);

  // OptionGroup
  gidLink(cast(void**)&g_option_group_get_type, "g_option_group_get_type", libs);
  gidLink(cast(void**)&g_option_group_new, "g_option_group_new", libs);
  gidLink(cast(void**)&g_option_group_add_entries, "g_option_group_add_entries", libs);
  gidLink(cast(void**)&g_option_group_free, "g_option_group_free", libs);
  gidLink(cast(void**)&g_option_group_ref, "g_option_group_ref", libs);
  gidLink(cast(void**)&g_option_group_set_error_hook, "g_option_group_set_error_hook", libs);
  gidLink(cast(void**)&g_option_group_set_parse_hooks, "g_option_group_set_parse_hooks", libs);
  gidLink(cast(void**)&g_option_group_set_translate_func, "g_option_group_set_translate_func", libs);
  gidLink(cast(void**)&g_option_group_set_translation_domain, "g_option_group_set_translation_domain", libs);
  gidLink(cast(void**)&g_option_group_unref, "g_option_group_unref", libs);

  // PathBuf
  gidLink(cast(void**)&g_path_buf_clear, "g_path_buf_clear", libs);
  gidLink(cast(void**)&g_path_buf_clear_to_path, "g_path_buf_clear_to_path", libs);
  gidLink(cast(void**)&g_path_buf_copy, "g_path_buf_copy", libs);
  gidLink(cast(void**)&g_path_buf_free, "g_path_buf_free", libs);
  gidLink(cast(void**)&g_path_buf_free_to_path, "g_path_buf_free_to_path", libs);
  gidLink(cast(void**)&g_path_buf_init, "g_path_buf_init", libs);
  gidLink(cast(void**)&g_path_buf_init_from_path, "g_path_buf_init_from_path", libs);
  gidLink(cast(void**)&g_path_buf_pop, "g_path_buf_pop", libs);
  gidLink(cast(void**)&g_path_buf_push, "g_path_buf_push", libs);
  gidLink(cast(void**)&g_path_buf_set_extension, "g_path_buf_set_extension", libs);
  gidLink(cast(void**)&g_path_buf_set_filename, "g_path_buf_set_filename", libs);
  gidLink(cast(void**)&g_path_buf_to_path, "g_path_buf_to_path", libs);
  gidLink(cast(void**)&g_path_buf_equal, "g_path_buf_equal", libs);
  gidLink(cast(void**)&g_path_buf_new, "g_path_buf_new", libs);
  gidLink(cast(void**)&g_path_buf_new_from_path, "g_path_buf_new_from_path", libs);

  // PatternSpec
  gidLink(cast(void**)&g_pattern_spec_get_type, "g_pattern_spec_get_type", libs);
  gidLink(cast(void**)&g_pattern_spec_new, "g_pattern_spec_new", libs);
  gidLink(cast(void**)&g_pattern_spec_copy, "g_pattern_spec_copy", libs);
  gidLink(cast(void**)&g_pattern_spec_equal, "g_pattern_spec_equal", libs);
  gidLink(cast(void**)&g_pattern_spec_free, "g_pattern_spec_free", libs);
  gidLink(cast(void**)&g_pattern_spec_match, "g_pattern_spec_match", libs);
  gidLink(cast(void**)&g_pattern_spec_match_string, "g_pattern_spec_match_string", libs);

  // PollFD
  gidLink(cast(void**)&g_pollfd_get_type, "g_pollfd_get_type", libs);

  // Private
  gidLink(cast(void**)&g_private_get, "g_private_get", libs);
  gidLink(cast(void**)&g_private_replace, "g_private_replace", libs);
  gidLink(cast(void**)&g_private_set, "g_private_set", libs);
  gidLink(cast(void**)&g_private_new, "g_private_new", libs);

  // PtrArray
  gidLink(cast(void**)&g_ptr_array_get_type, "g_ptr_array_get_type", libs);
  gidLink(cast(void**)&g_ptr_array_add, "g_ptr_array_add", libs);
  gidLink(cast(void**)&g_ptr_array_copy, "g_ptr_array_copy", libs);
  gidLink(cast(void**)&g_ptr_array_extend, "g_ptr_array_extend", libs);
  gidLink(cast(void**)&g_ptr_array_extend_and_steal, "g_ptr_array_extend_and_steal", libs);
  gidLink(cast(void**)&g_ptr_array_find, "g_ptr_array_find", libs);
  gidLink(cast(void**)&g_ptr_array_find_with_equal_func, "g_ptr_array_find_with_equal_func", libs);
  gidLink(cast(void**)&g_ptr_array_foreach, "g_ptr_array_foreach", libs);
  gidLink(cast(void**)&g_ptr_array_free, "g_ptr_array_free", libs);
  gidLink(cast(void**)&g_ptr_array_insert, "g_ptr_array_insert", libs);
  gidLink(cast(void**)&g_ptr_array_is_null_terminated, "g_ptr_array_is_null_terminated", libs);
  gidLink(cast(void**)&g_ptr_array_new, "g_ptr_array_new", libs);
  gidLink(cast(void**)&g_ptr_array_new_from_array, "g_ptr_array_new_from_array", libs);
  gidLink(cast(void**)&g_ptr_array_new_from_null_terminated_array, "g_ptr_array_new_from_null_terminated_array", libs);
  gidLink(cast(void**)&g_ptr_array_new_full, "g_ptr_array_new_full", libs);
  gidLink(cast(void**)&g_ptr_array_new_null_terminated, "g_ptr_array_new_null_terminated", libs);
  gidLink(cast(void**)&g_ptr_array_new_take, "g_ptr_array_new_take", libs);
  gidLink(cast(void**)&g_ptr_array_new_take_null_terminated, "g_ptr_array_new_take_null_terminated", libs);
  gidLink(cast(void**)&g_ptr_array_new_with_free_func, "g_ptr_array_new_with_free_func", libs);
  gidLink(cast(void**)&g_ptr_array_ref, "g_ptr_array_ref", libs);
  gidLink(cast(void**)&g_ptr_array_remove, "g_ptr_array_remove", libs);
  gidLink(cast(void**)&g_ptr_array_remove_fast, "g_ptr_array_remove_fast", libs);
  gidLink(cast(void**)&g_ptr_array_remove_index, "g_ptr_array_remove_index", libs);
  gidLink(cast(void**)&g_ptr_array_remove_index_fast, "g_ptr_array_remove_index_fast", libs);
  gidLink(cast(void**)&g_ptr_array_remove_range, "g_ptr_array_remove_range", libs);
  gidLink(cast(void**)&g_ptr_array_set_free_func, "g_ptr_array_set_free_func", libs);
  gidLink(cast(void**)&g_ptr_array_set_size, "g_ptr_array_set_size", libs);
  gidLink(cast(void**)&g_ptr_array_sized_new, "g_ptr_array_sized_new", libs);
  gidLink(cast(void**)&g_ptr_array_sort, "g_ptr_array_sort", libs);
  gidLink(cast(void**)&g_ptr_array_sort_values, "g_ptr_array_sort_values", libs);
  gidLink(cast(void**)&g_ptr_array_sort_values_with_data, "g_ptr_array_sort_values_with_data", libs);
  gidLink(cast(void**)&g_ptr_array_sort_with_data, "g_ptr_array_sort_with_data", libs);
  gidLink(cast(void**)&g_ptr_array_steal, "g_ptr_array_steal", libs);
  gidLink(cast(void**)&g_ptr_array_steal_index, "g_ptr_array_steal_index", libs);
  gidLink(cast(void**)&g_ptr_array_steal_index_fast, "g_ptr_array_steal_index_fast", libs);
  gidLink(cast(void**)&g_ptr_array_unref, "g_ptr_array_unref", libs);

  // Queue
  gidLink(cast(void**)&g_queue_clear, "g_queue_clear", libs);
  gidLink(cast(void**)&g_queue_clear_full, "g_queue_clear_full", libs);
  gidLink(cast(void**)&g_queue_copy, "g_queue_copy", libs);
  gidLink(cast(void**)&g_queue_delete_link, "g_queue_delete_link", libs);
  gidLink(cast(void**)&g_queue_find, "g_queue_find", libs);
  gidLink(cast(void**)&g_queue_find_custom, "g_queue_find_custom", libs);
  gidLink(cast(void**)&g_queue_foreach, "g_queue_foreach", libs);
  gidLink(cast(void**)&g_queue_free, "g_queue_free", libs);
  gidLink(cast(void**)&g_queue_free_full, "g_queue_free_full", libs);
  gidLink(cast(void**)&g_queue_get_length, "g_queue_get_length", libs);
  gidLink(cast(void**)&g_queue_index, "g_queue_index", libs);
  gidLink(cast(void**)&g_queue_init, "g_queue_init", libs);
  gidLink(cast(void**)&g_queue_insert_after, "g_queue_insert_after", libs);
  gidLink(cast(void**)&g_queue_insert_after_link, "g_queue_insert_after_link", libs);
  gidLink(cast(void**)&g_queue_insert_before, "g_queue_insert_before", libs);
  gidLink(cast(void**)&g_queue_insert_before_link, "g_queue_insert_before_link", libs);
  gidLink(cast(void**)&g_queue_insert_sorted, "g_queue_insert_sorted", libs);
  gidLink(cast(void**)&g_queue_is_empty, "g_queue_is_empty", libs);
  gidLink(cast(void**)&g_queue_link_index, "g_queue_link_index", libs);
  gidLink(cast(void**)&g_queue_peek_head, "g_queue_peek_head", libs);
  gidLink(cast(void**)&g_queue_peek_head_link, "g_queue_peek_head_link", libs);
  gidLink(cast(void**)&g_queue_peek_nth, "g_queue_peek_nth", libs);
  gidLink(cast(void**)&g_queue_peek_nth_link, "g_queue_peek_nth_link", libs);
  gidLink(cast(void**)&g_queue_peek_tail, "g_queue_peek_tail", libs);
  gidLink(cast(void**)&g_queue_peek_tail_link, "g_queue_peek_tail_link", libs);
  gidLink(cast(void**)&g_queue_pop_head, "g_queue_pop_head", libs);
  gidLink(cast(void**)&g_queue_pop_head_link, "g_queue_pop_head_link", libs);
  gidLink(cast(void**)&g_queue_pop_nth, "g_queue_pop_nth", libs);
  gidLink(cast(void**)&g_queue_pop_nth_link, "g_queue_pop_nth_link", libs);
  gidLink(cast(void**)&g_queue_pop_tail, "g_queue_pop_tail", libs);
  gidLink(cast(void**)&g_queue_pop_tail_link, "g_queue_pop_tail_link", libs);
  gidLink(cast(void**)&g_queue_push_head, "g_queue_push_head", libs);
  gidLink(cast(void**)&g_queue_push_head_link, "g_queue_push_head_link", libs);
  gidLink(cast(void**)&g_queue_push_nth, "g_queue_push_nth", libs);
  gidLink(cast(void**)&g_queue_push_nth_link, "g_queue_push_nth_link", libs);
  gidLink(cast(void**)&g_queue_push_tail, "g_queue_push_tail", libs);
  gidLink(cast(void**)&g_queue_push_tail_link, "g_queue_push_tail_link", libs);
  gidLink(cast(void**)&g_queue_remove, "g_queue_remove", libs);
  gidLink(cast(void**)&g_queue_remove_all, "g_queue_remove_all", libs);
  gidLink(cast(void**)&g_queue_reverse, "g_queue_reverse", libs);
  gidLink(cast(void**)&g_queue_sort, "g_queue_sort", libs);
  gidLink(cast(void**)&g_queue_unlink, "g_queue_unlink", libs);
  gidLink(cast(void**)&g_queue_new, "g_queue_new", libs);

  // RWLock
  gidLink(cast(void**)&g_rw_lock_clear, "g_rw_lock_clear", libs);
  gidLink(cast(void**)&g_rw_lock_init, "g_rw_lock_init", libs);
  gidLink(cast(void**)&g_rw_lock_reader_lock, "g_rw_lock_reader_lock", libs);
  gidLink(cast(void**)&g_rw_lock_reader_trylock, "g_rw_lock_reader_trylock", libs);
  gidLink(cast(void**)&g_rw_lock_reader_unlock, "g_rw_lock_reader_unlock", libs);
  gidLink(cast(void**)&g_rw_lock_writer_lock, "g_rw_lock_writer_lock", libs);
  gidLink(cast(void**)&g_rw_lock_writer_trylock, "g_rw_lock_writer_trylock", libs);
  gidLink(cast(void**)&g_rw_lock_writer_unlock, "g_rw_lock_writer_unlock", libs);

  // Rand
  gidLink(cast(void**)&g_rand_get_type, "g_rand_get_type", libs);
  gidLink(cast(void**)&g_rand_new, "g_rand_new", libs);
  gidLink(cast(void**)&g_rand_new_with_seed, "g_rand_new_with_seed", libs);
  gidLink(cast(void**)&g_rand_new_with_seed_array, "g_rand_new_with_seed_array", libs);
  gidLink(cast(void**)&g_rand_copy, "g_rand_copy", libs);
  gidLink(cast(void**)&g_rand_double, "g_rand_double", libs);
  gidLink(cast(void**)&g_rand_double_range, "g_rand_double_range", libs);
  gidLink(cast(void**)&g_rand_free, "g_rand_free", libs);
  gidLink(cast(void**)&g_rand_int, "g_rand_int", libs);
  gidLink(cast(void**)&g_rand_int_range, "g_rand_int_range", libs);
  gidLink(cast(void**)&g_rand_set_seed, "g_rand_set_seed", libs);
  gidLink(cast(void**)&g_rand_set_seed_array, "g_rand_set_seed_array", libs);

  // RecMutex
  gidLink(cast(void**)&g_rec_mutex_clear, "g_rec_mutex_clear", libs);
  gidLink(cast(void**)&g_rec_mutex_init, "g_rec_mutex_init", libs);
  gidLink(cast(void**)&g_rec_mutex_lock, "g_rec_mutex_lock", libs);
  gidLink(cast(void**)&g_rec_mutex_trylock, "g_rec_mutex_trylock", libs);
  gidLink(cast(void**)&g_rec_mutex_unlock, "g_rec_mutex_unlock", libs);

  // Regex
  gidLink(cast(void**)&g_regex_get_type, "g_regex_get_type", libs);
  gidLink(cast(void**)&g_regex_new, "g_regex_new", libs);
  gidLink(cast(void**)&g_regex_get_capture_count, "g_regex_get_capture_count", libs);
  gidLink(cast(void**)&g_regex_get_compile_flags, "g_regex_get_compile_flags", libs);
  gidLink(cast(void**)&g_regex_get_has_cr_or_lf, "g_regex_get_has_cr_or_lf", libs);
  gidLink(cast(void**)&g_regex_get_match_flags, "g_regex_get_match_flags", libs);
  gidLink(cast(void**)&g_regex_get_max_backref, "g_regex_get_max_backref", libs);
  gidLink(cast(void**)&g_regex_get_max_lookbehind, "g_regex_get_max_lookbehind", libs);
  gidLink(cast(void**)&g_regex_get_pattern, "g_regex_get_pattern", libs);
  gidLink(cast(void**)&g_regex_get_string_number, "g_regex_get_string_number", libs);
  gidLink(cast(void**)&g_regex_match, "g_regex_match", libs);
  gidLink(cast(void**)&g_regex_match_all, "g_regex_match_all", libs);
  gidLink(cast(void**)&g_regex_match_all_full, "g_regex_match_all_full", libs);
  gidLink(cast(void**)&g_regex_match_full, "g_regex_match_full", libs);
  gidLink(cast(void**)&g_regex_ref, "g_regex_ref", libs);
  gidLink(cast(void**)&g_regex_replace, "g_regex_replace", libs);
  gidLink(cast(void**)&g_regex_replace_eval, "g_regex_replace_eval", libs);
  gidLink(cast(void**)&g_regex_replace_literal, "g_regex_replace_literal", libs);
  gidLink(cast(void**)&g_regex_split, "g_regex_split", libs);
  gidLink(cast(void**)&g_regex_split_full, "g_regex_split_full", libs);
  gidLink(cast(void**)&g_regex_unref, "g_regex_unref", libs);
  gidLink(cast(void**)&g_regex_check_replacement, "g_regex_check_replacement", libs);
  gidLink(cast(void**)&g_regex_error_quark, "g_regex_error_quark", libs);
  gidLink(cast(void**)&g_regex_escape_nul, "g_regex_escape_nul", libs);
  gidLink(cast(void**)&g_regex_escape_string, "g_regex_escape_string", libs);
  gidLink(cast(void**)&g_regex_match_simple, "g_regex_match_simple", libs);
  gidLink(cast(void**)&g_regex_split_simple, "g_regex_split_simple", libs);

  // Relation
  gidLink(cast(void**)&g_relation_count, "g_relation_count", libs);
  gidLink(cast(void**)&g_relation_delete, "g_relation_delete", libs);
  gidLink(cast(void**)&g_relation_destroy, "g_relation_destroy", libs);
  gidLink(cast(void**)&g_relation_exists, "g_relation_exists", libs);
  gidLink(cast(void**)&g_relation_index, "g_relation_index", libs);
  gidLink(cast(void**)&g_relation_insert, "g_relation_insert", libs);
  gidLink(cast(void**)&g_relation_print, "g_relation_print", libs);
  gidLink(cast(void**)&g_relation_select, "g_relation_select", libs);
  gidLink(cast(void**)&g_relation_new, "g_relation_new", libs);

  // SList
  gidLink(cast(void**)&g_slist_alloc, "g_slist_alloc", libs);
  gidLink(cast(void**)&g_slist_append, "g_slist_append", libs);
  gidLink(cast(void**)&g_slist_concat, "g_slist_concat", libs);
  gidLink(cast(void**)&g_slist_copy, "g_slist_copy", libs);
  gidLink(cast(void**)&g_slist_copy_deep, "g_slist_copy_deep", libs);
  gidLink(cast(void**)&g_slist_delete_link, "g_slist_delete_link", libs);
  gidLink(cast(void**)&g_slist_find, "g_slist_find", libs);
  gidLink(cast(void**)&g_slist_find_custom, "g_slist_find_custom", libs);
  gidLink(cast(void**)&g_slist_foreach, "g_slist_foreach", libs);
  gidLink(cast(void**)&g_slist_free, "g_slist_free", libs);
  gidLink(cast(void**)&g_slist_free_1, "g_slist_free_1", libs);
  gidLink(cast(void**)&g_slist_free_full, "g_slist_free_full", libs);
  gidLink(cast(void**)&g_slist_index, "g_slist_index", libs);
  gidLink(cast(void**)&g_slist_insert, "g_slist_insert", libs);
  gidLink(cast(void**)&g_slist_insert_before, "g_slist_insert_before", libs);
  gidLink(cast(void**)&g_slist_insert_sorted, "g_slist_insert_sorted", libs);
  gidLink(cast(void**)&g_slist_insert_sorted_with_data, "g_slist_insert_sorted_with_data", libs);
  gidLink(cast(void**)&g_slist_last, "g_slist_last", libs);
  gidLink(cast(void**)&g_slist_length, "g_slist_length", libs);
  gidLink(cast(void**)&g_slist_nth, "g_slist_nth", libs);
  gidLink(cast(void**)&g_slist_nth_data, "g_slist_nth_data", libs);
  gidLink(cast(void**)&g_slist_pop_allocator, "g_slist_pop_allocator", libs);
  gidLink(cast(void**)&g_slist_position, "g_slist_position", libs);
  gidLink(cast(void**)&g_slist_prepend, "g_slist_prepend", libs);
  gidLink(cast(void**)&g_slist_push_allocator, "g_slist_push_allocator", libs);
  gidLink(cast(void**)&g_slist_remove, "g_slist_remove", libs);
  gidLink(cast(void**)&g_slist_remove_all, "g_slist_remove_all", libs);
  gidLink(cast(void**)&g_slist_remove_link, "g_slist_remove_link", libs);
  gidLink(cast(void**)&g_slist_reverse, "g_slist_reverse", libs);
  gidLink(cast(void**)&g_slist_sort, "g_slist_sort", libs);
  gidLink(cast(void**)&g_slist_sort_with_data, "g_slist_sort_with_data", libs);

  // Scanner
  gidLink(cast(void**)&g_scanner_cur_line, "g_scanner_cur_line", libs);
  gidLink(cast(void**)&g_scanner_cur_position, "g_scanner_cur_position", libs);
  gidLink(cast(void**)&g_scanner_cur_token, "g_scanner_cur_token", libs);
  gidLink(cast(void**)&g_scanner_cur_value, "g_scanner_cur_value", libs);
  gidLink(cast(void**)&g_scanner_destroy, "g_scanner_destroy", libs);
  gidLink(cast(void**)&g_scanner_eof, "g_scanner_eof", libs);
  gidLink(cast(void**)&g_scanner_error, "g_scanner_error", libs);
  gidLink(cast(void**)&g_scanner_get_next_token, "g_scanner_get_next_token", libs);
  gidLink(cast(void**)&g_scanner_input_file, "g_scanner_input_file", libs);
  gidLink(cast(void**)&g_scanner_input_text, "g_scanner_input_text", libs);
  gidLink(cast(void**)&g_scanner_lookup_symbol, "g_scanner_lookup_symbol", libs);
  gidLink(cast(void**)&g_scanner_peek_next_token, "g_scanner_peek_next_token", libs);
  gidLink(cast(void**)&g_scanner_scope_add_symbol, "g_scanner_scope_add_symbol", libs);
  gidLink(cast(void**)&g_scanner_scope_foreach_symbol, "g_scanner_scope_foreach_symbol", libs);
  gidLink(cast(void**)&g_scanner_scope_lookup_symbol, "g_scanner_scope_lookup_symbol", libs);
  gidLink(cast(void**)&g_scanner_scope_remove_symbol, "g_scanner_scope_remove_symbol", libs);
  gidLink(cast(void**)&g_scanner_set_scope, "g_scanner_set_scope", libs);
  gidLink(cast(void**)&g_scanner_sync_file_offset, "g_scanner_sync_file_offset", libs);
  gidLink(cast(void**)&g_scanner_unexp_token, "g_scanner_unexp_token", libs);
  gidLink(cast(void**)&g_scanner_warn, "g_scanner_warn", libs);
  gidLink(cast(void**)&g_scanner_new, "g_scanner_new", libs);

  // Sequence
  gidLink(cast(void**)&g_sequence_append, "g_sequence_append", libs);
  gidLink(cast(void**)&g_sequence_foreach, "g_sequence_foreach", libs);
  gidLink(cast(void**)&g_sequence_free, "g_sequence_free", libs);
  gidLink(cast(void**)&g_sequence_get_begin_iter, "g_sequence_get_begin_iter", libs);
  gidLink(cast(void**)&g_sequence_get_end_iter, "g_sequence_get_end_iter", libs);
  gidLink(cast(void**)&g_sequence_get_iter_at_pos, "g_sequence_get_iter_at_pos", libs);
  gidLink(cast(void**)&g_sequence_get_length, "g_sequence_get_length", libs);
  gidLink(cast(void**)&g_sequence_insert_sorted, "g_sequence_insert_sorted", libs);
  gidLink(cast(void**)&g_sequence_insert_sorted_iter, "g_sequence_insert_sorted_iter", libs);
  gidLink(cast(void**)&g_sequence_is_empty, "g_sequence_is_empty", libs);
  gidLink(cast(void**)&g_sequence_lookup, "g_sequence_lookup", libs);
  gidLink(cast(void**)&g_sequence_lookup_iter, "g_sequence_lookup_iter", libs);
  gidLink(cast(void**)&g_sequence_prepend, "g_sequence_prepend", libs);
  gidLink(cast(void**)&g_sequence_search, "g_sequence_search", libs);
  gidLink(cast(void**)&g_sequence_search_iter, "g_sequence_search_iter", libs);
  gidLink(cast(void**)&g_sequence_sort, "g_sequence_sort", libs);
  gidLink(cast(void**)&g_sequence_sort_iter, "g_sequence_sort_iter", libs);
  gidLink(cast(void**)&g_sequence_foreach_range, "g_sequence_foreach_range", libs);
  gidLink(cast(void**)&g_sequence_get, "g_sequence_get", libs);
  gidLink(cast(void**)&g_sequence_insert_before, "g_sequence_insert_before", libs);
  gidLink(cast(void**)&g_sequence_move, "g_sequence_move", libs);
  gidLink(cast(void**)&g_sequence_move_range, "g_sequence_move_range", libs);
  gidLink(cast(void**)&g_sequence_new, "g_sequence_new", libs);
  gidLink(cast(void**)&g_sequence_range_get_midpoint, "g_sequence_range_get_midpoint", libs);
  gidLink(cast(void**)&g_sequence_remove, "g_sequence_remove", libs);
  gidLink(cast(void**)&g_sequence_remove_range, "g_sequence_remove_range", libs);
  gidLink(cast(void**)&g_sequence_set, "g_sequence_set", libs);
  gidLink(cast(void**)&g_sequence_sort_changed, "g_sequence_sort_changed", libs);
  gidLink(cast(void**)&g_sequence_sort_changed_iter, "g_sequence_sort_changed_iter", libs);
  gidLink(cast(void**)&g_sequence_swap, "g_sequence_swap", libs);

  // SequenceIter
  gidLink(cast(void**)&g_sequence_iter_compare, "g_sequence_iter_compare", libs);
  gidLink(cast(void**)&g_sequence_iter_get_position, "g_sequence_iter_get_position", libs);
  gidLink(cast(void**)&g_sequence_iter_get_sequence, "g_sequence_iter_get_sequence", libs);
  gidLink(cast(void**)&g_sequence_iter_is_begin, "g_sequence_iter_is_begin", libs);
  gidLink(cast(void**)&g_sequence_iter_is_end, "g_sequence_iter_is_end", libs);
  gidLink(cast(void**)&g_sequence_iter_move, "g_sequence_iter_move", libs);
  gidLink(cast(void**)&g_sequence_iter_next, "g_sequence_iter_next", libs);
  gidLink(cast(void**)&g_sequence_iter_prev, "g_sequence_iter_prev", libs);

  // Source
  gidLink(cast(void**)&g_source_get_type, "g_source_get_type", libs);
  gidLink(cast(void**)&g_source_new, "g_source_new", libs);
  gidLink(cast(void**)&g_source_add_child_source, "g_source_add_child_source", libs);
  gidLink(cast(void**)&g_source_add_poll, "g_source_add_poll", libs);
  gidLink(cast(void**)&g_source_add_unix_fd, "g_source_add_unix_fd", libs);
  gidLink(cast(void**)&g_source_attach, "g_source_attach", libs);
  gidLink(cast(void**)&g_source_destroy, "g_source_destroy", libs);
  gidLink(cast(void**)&g_source_dup_context, "g_source_dup_context", libs);
  gidLink(cast(void**)&g_source_get_can_recurse, "g_source_get_can_recurse", libs);
  gidLink(cast(void**)&g_source_get_context, "g_source_get_context", libs);
  gidLink(cast(void**)&g_source_get_current_time, "g_source_get_current_time", libs);
  gidLink(cast(void**)&g_source_get_id, "g_source_get_id", libs);
  gidLink(cast(void**)&g_source_get_name, "g_source_get_name", libs);
  gidLink(cast(void**)&g_source_get_priority, "g_source_get_priority", libs);
  gidLink(cast(void**)&g_source_get_ready_time, "g_source_get_ready_time", libs);
  gidLink(cast(void**)&g_source_get_time, "g_source_get_time", libs);
  gidLink(cast(void**)&g_source_is_destroyed, "g_source_is_destroyed", libs);
  gidLink(cast(void**)&g_source_modify_unix_fd, "g_source_modify_unix_fd", libs);
  gidLink(cast(void**)&g_source_query_unix_fd, "g_source_query_unix_fd", libs);
  gidLink(cast(void**)&g_source_ref, "g_source_ref", libs);
  gidLink(cast(void**)&g_source_remove_child_source, "g_source_remove_child_source", libs);
  gidLink(cast(void**)&g_source_remove_poll, "g_source_remove_poll", libs);
  gidLink(cast(void**)&g_source_remove_unix_fd, "g_source_remove_unix_fd", libs);
  gidLink(cast(void**)&g_source_set_callback, "g_source_set_callback", libs);
  gidLink(cast(void**)&g_source_set_callback_indirect, "g_source_set_callback_indirect", libs);
  gidLink(cast(void**)&g_source_set_can_recurse, "g_source_set_can_recurse", libs);
  gidLink(cast(void**)&g_source_set_dispose_function, "g_source_set_dispose_function", libs);
  gidLink(cast(void**)&g_source_set_funcs, "g_source_set_funcs", libs);
  gidLink(cast(void**)&g_source_set_name, "g_source_set_name", libs);
  gidLink(cast(void**)&g_source_set_priority, "g_source_set_priority", libs);
  gidLink(cast(void**)&g_source_set_ready_time, "g_source_set_ready_time", libs);
  gidLink(cast(void**)&g_source_set_static_name, "g_source_set_static_name", libs);
  gidLink(cast(void**)&g_source_unref, "g_source_unref", libs);
  gidLink(cast(void**)&g_source_remove, "g_source_remove", libs);
  gidLink(cast(void**)&g_source_remove_by_funcs_user_data, "g_source_remove_by_funcs_user_data", libs);
  gidLink(cast(void**)&g_source_remove_by_user_data, "g_source_remove_by_user_data", libs);
  gidLink(cast(void**)&g_source_set_name_by_id, "g_source_set_name_by_id", libs);

  // StaticMutex
  gidLink(cast(void**)&g_static_mutex_free, "g_static_mutex_free", libs);
  gidLink(cast(void**)&g_static_mutex_get_mutex_impl, "g_static_mutex_get_mutex_impl", libs);
  gidLink(cast(void**)&g_static_mutex_init, "g_static_mutex_init", libs);

  // StaticPrivate
  gidLink(cast(void**)&g_static_private_free, "g_static_private_free", libs);
  gidLink(cast(void**)&g_static_private_get, "g_static_private_get", libs);
  gidLink(cast(void**)&g_static_private_init, "g_static_private_init", libs);
  gidLink(cast(void**)&g_static_private_set, "g_static_private_set", libs);

  // StaticRWLock
  gidLink(cast(void**)&g_static_rw_lock_free, "g_static_rw_lock_free", libs);
  gidLink(cast(void**)&g_static_rw_lock_init, "g_static_rw_lock_init", libs);
  gidLink(cast(void**)&g_static_rw_lock_reader_lock, "g_static_rw_lock_reader_lock", libs);
  gidLink(cast(void**)&g_static_rw_lock_reader_trylock, "g_static_rw_lock_reader_trylock", libs);
  gidLink(cast(void**)&g_static_rw_lock_reader_unlock, "g_static_rw_lock_reader_unlock", libs);
  gidLink(cast(void**)&g_static_rw_lock_writer_lock, "g_static_rw_lock_writer_lock", libs);
  gidLink(cast(void**)&g_static_rw_lock_writer_trylock, "g_static_rw_lock_writer_trylock", libs);
  gidLink(cast(void**)&g_static_rw_lock_writer_unlock, "g_static_rw_lock_writer_unlock", libs);

  // StaticRecMutex
  gidLink(cast(void**)&g_static_rec_mutex_free, "g_static_rec_mutex_free", libs);
  gidLink(cast(void**)&g_static_rec_mutex_init, "g_static_rec_mutex_init", libs);
  gidLink(cast(void**)&g_static_rec_mutex_lock, "g_static_rec_mutex_lock", libs);
  gidLink(cast(void**)&g_static_rec_mutex_lock_full, "g_static_rec_mutex_lock_full", libs);
  gidLink(cast(void**)&g_static_rec_mutex_trylock, "g_static_rec_mutex_trylock", libs);
  gidLink(cast(void**)&g_static_rec_mutex_unlock, "g_static_rec_mutex_unlock", libs);
  gidLink(cast(void**)&g_static_rec_mutex_unlock_full, "g_static_rec_mutex_unlock_full", libs);

  // String
  gidLink(cast(void**)&g_gstring_get_type, "g_gstring_get_type", libs);
  gidLink(cast(void**)&g_string_new, "g_string_new", libs);
  gidLink(cast(void**)&g_string_new_len, "g_string_new_len", libs);
  gidLink(cast(void**)&g_string_new_take, "g_string_new_take", libs);
  gidLink(cast(void**)&g_string_sized_new, "g_string_sized_new", libs);
  gidLink(cast(void**)&g_string_append, "g_string_append", libs);
  gidLink(cast(void**)&g_string_append_c, "g_string_append_c", libs);
  gidLink(cast(void**)&g_string_append_len, "g_string_append_len", libs);
  gidLink(cast(void**)&g_string_append_printf, "g_string_append_printf", libs);
  gidLink(cast(void**)&g_string_append_unichar, "g_string_append_unichar", libs);
  gidLink(cast(void**)&g_string_append_uri_escaped, "g_string_append_uri_escaped", libs);
  gidLink(cast(void**)&g_string_append_vprintf, "g_string_append_vprintf", libs);
  gidLink(cast(void**)&g_string_ascii_down, "g_string_ascii_down", libs);
  gidLink(cast(void**)&g_string_ascii_up, "g_string_ascii_up", libs);
  gidLink(cast(void**)&g_string_assign, "g_string_assign", libs);
  gidLink(cast(void**)&g_string_copy, "g_string_copy", libs);
  gidLink(cast(void**)&g_string_down, "g_string_down", libs);
  gidLink(cast(void**)&g_string_equal, "g_string_equal", libs);
  gidLink(cast(void**)&g_string_erase, "g_string_erase", libs);
  gidLink(cast(void**)&g_string_free, "g_string_free", libs);
  gidLink(cast(void**)&g_string_free_and_steal, "g_string_free_and_steal", libs);
  gidLink(cast(void**)&g_string_free_to_bytes, "g_string_free_to_bytes", libs);
  gidLink(cast(void**)&g_string_hash, "g_string_hash", libs);
  gidLink(cast(void**)&g_string_insert, "g_string_insert", libs);
  gidLink(cast(void**)&g_string_insert_c, "g_string_insert_c", libs);
  gidLink(cast(void**)&g_string_insert_len, "g_string_insert_len", libs);
  gidLink(cast(void**)&g_string_insert_unichar, "g_string_insert_unichar", libs);
  gidLink(cast(void**)&g_string_overwrite, "g_string_overwrite", libs);
  gidLink(cast(void**)&g_string_overwrite_len, "g_string_overwrite_len", libs);
  gidLink(cast(void**)&g_string_prepend, "g_string_prepend", libs);
  gidLink(cast(void**)&g_string_prepend_c, "g_string_prepend_c", libs);
  gidLink(cast(void**)&g_string_prepend_len, "g_string_prepend_len", libs);
  gidLink(cast(void**)&g_string_prepend_unichar, "g_string_prepend_unichar", libs);
  gidLink(cast(void**)&g_string_printf, "g_string_printf", libs);
  gidLink(cast(void**)&g_string_replace, "g_string_replace", libs);
  gidLink(cast(void**)&g_string_set_size, "g_string_set_size", libs);
  gidLink(cast(void**)&g_string_truncate, "g_string_truncate", libs);
  gidLink(cast(void**)&g_string_up, "g_string_up", libs);
  gidLink(cast(void**)&g_string_vprintf, "g_string_vprintf", libs);

  // StringChunk
  gidLink(cast(void**)&g_string_chunk_clear, "g_string_chunk_clear", libs);
  gidLink(cast(void**)&g_string_chunk_free, "g_string_chunk_free", libs);
  gidLink(cast(void**)&g_string_chunk_insert, "g_string_chunk_insert", libs);
  gidLink(cast(void**)&g_string_chunk_insert_const, "g_string_chunk_insert_const", libs);
  gidLink(cast(void**)&g_string_chunk_insert_len, "g_string_chunk_insert_len", libs);
  gidLink(cast(void**)&g_string_chunk_new, "g_string_chunk_new", libs);

  // StrvBuilder
  gidLink(cast(void**)&g_strv_builder_get_type, "g_strv_builder_get_type", libs);
  gidLink(cast(void**)&g_strv_builder_new, "g_strv_builder_new", libs);
  gidLink(cast(void**)&g_strv_builder_add, "g_strv_builder_add", libs);
  gidLink(cast(void**)&g_strv_builder_add_many, "g_strv_builder_add_many", libs);
  gidLink(cast(void**)&g_strv_builder_addv, "g_strv_builder_addv", libs);
  gidLink(cast(void**)&g_strv_builder_end, "g_strv_builder_end", libs);
  gidLink(cast(void**)&g_strv_builder_ref, "g_strv_builder_ref", libs);
  gidLink(cast(void**)&g_strv_builder_take, "g_strv_builder_take", libs);
  gidLink(cast(void**)&g_strv_builder_unref, "g_strv_builder_unref", libs);
  gidLink(cast(void**)&g_strv_builder_unref_to_strv, "g_strv_builder_unref_to_strv", libs);

  // TestCase
  gidLink(cast(void**)&g_test_case_free, "g_test_case_free", libs);

  // TestLogBuffer
  gidLink(cast(void**)&g_test_log_buffer_free, "g_test_log_buffer_free", libs);
  gidLink(cast(void**)&g_test_log_buffer_pop, "g_test_log_buffer_pop", libs);
  gidLink(cast(void**)&g_test_log_buffer_push, "g_test_log_buffer_push", libs);
  gidLink(cast(void**)&g_test_log_buffer_new, "g_test_log_buffer_new", libs);

  // TestLogMsg
  gidLink(cast(void**)&g_test_log_msg_free, "g_test_log_msg_free", libs);

  // TestSuite
  gidLink(cast(void**)&g_test_suite_add, "g_test_suite_add", libs);
  gidLink(cast(void**)&g_test_suite_add_suite, "g_test_suite_add_suite", libs);
  gidLink(cast(void**)&g_test_suite_free, "g_test_suite_free", libs);

  // Thread
  gidLink(cast(void**)&g_thread_get_type, "g_thread_get_type", libs);
  gidLink(cast(void**)&g_thread_new, "g_thread_new", libs);
  gidLink(cast(void**)&g_thread_try_new, "g_thread_try_new", libs);
  gidLink(cast(void**)&g_thread_get_name, "g_thread_get_name", libs);
  gidLink(cast(void**)&g_thread_join, "g_thread_join", libs);
  gidLink(cast(void**)&g_thread_ref, "g_thread_ref", libs);
  gidLink(cast(void**)&g_thread_set_priority, "g_thread_set_priority", libs);
  gidLink(cast(void**)&g_thread_unref, "g_thread_unref", libs);
  gidLink(cast(void**)&g_thread_create, "g_thread_create", libs);
  gidLink(cast(void**)&g_thread_create_full, "g_thread_create_full", libs);
  gidLink(cast(void**)&g_thread_error_quark, "g_thread_error_quark", libs);
  gidLink(cast(void**)&g_thread_exit, "g_thread_exit", libs);
  gidLink(cast(void**)&g_thread_foreach, "g_thread_foreach", libs);
  gidLink(cast(void**)&g_thread_get_initialized, "g_thread_get_initialized", libs);
  gidLink(cast(void**)&g_thread_init, "g_thread_init", libs);
  gidLink(cast(void**)&g_thread_init_with_errorcheck_mutexes, "g_thread_init_with_errorcheck_mutexes", libs);
  gidLink(cast(void**)&g_thread_self, "g_thread_self", libs);
  gidLink(cast(void**)&g_thread_yield, "g_thread_yield", libs);

  // ThreadPool
  gidLink(cast(void**)&g_thread_pool_free, "g_thread_pool_free", libs);
  gidLink(cast(void**)&g_thread_pool_get_max_threads, "g_thread_pool_get_max_threads", libs);
  gidLink(cast(void**)&g_thread_pool_get_num_threads, "g_thread_pool_get_num_threads", libs);
  gidLink(cast(void**)&g_thread_pool_move_to_front, "g_thread_pool_move_to_front", libs);
  gidLink(cast(void**)&g_thread_pool_push, "g_thread_pool_push", libs);
  gidLink(cast(void**)&g_thread_pool_set_max_threads, "g_thread_pool_set_max_threads", libs);
  gidLink(cast(void**)&g_thread_pool_set_sort_function, "g_thread_pool_set_sort_function", libs);
  gidLink(cast(void**)&g_thread_pool_unprocessed, "g_thread_pool_unprocessed", libs);
  gidLink(cast(void**)&g_thread_pool_get_max_idle_time, "g_thread_pool_get_max_idle_time", libs);
  gidLink(cast(void**)&g_thread_pool_get_max_unused_threads, "g_thread_pool_get_max_unused_threads", libs);
  gidLink(cast(void**)&g_thread_pool_get_num_unused_threads, "g_thread_pool_get_num_unused_threads", libs);
  gidLink(cast(void**)&g_thread_pool_new, "g_thread_pool_new", libs);
  gidLink(cast(void**)&g_thread_pool_new_full, "g_thread_pool_new_full", libs);
  gidLink(cast(void**)&g_thread_pool_set_max_idle_time, "g_thread_pool_set_max_idle_time", libs);
  gidLink(cast(void**)&g_thread_pool_set_max_unused_threads, "g_thread_pool_set_max_unused_threads", libs);
  gidLink(cast(void**)&g_thread_pool_stop_unused_threads, "g_thread_pool_stop_unused_threads", libs);

  // TimeVal
  gidLink(cast(void**)&g_time_val_add, "g_time_val_add", libs);
  gidLink(cast(void**)&g_time_val_to_iso8601, "g_time_val_to_iso8601", libs);
  gidLink(cast(void**)&g_time_val_from_iso8601, "g_time_val_from_iso8601", libs);

  // TimeZone
  gidLink(cast(void**)&g_time_zone_get_type, "g_time_zone_get_type", libs);
  gidLink(cast(void**)&g_time_zone_new, "g_time_zone_new", libs);
  gidLink(cast(void**)&g_time_zone_new_identifier, "g_time_zone_new_identifier", libs);
  gidLink(cast(void**)&g_time_zone_new_local, "g_time_zone_new_local", libs);
  gidLink(cast(void**)&g_time_zone_new_offset, "g_time_zone_new_offset", libs);
  gidLink(cast(void**)&g_time_zone_new_utc, "g_time_zone_new_utc", libs);
  gidLink(cast(void**)&g_time_zone_adjust_time, "g_time_zone_adjust_time", libs);
  gidLink(cast(void**)&g_time_zone_find_interval, "g_time_zone_find_interval", libs);
  gidLink(cast(void**)&g_time_zone_get_abbreviation, "g_time_zone_get_abbreviation", libs);
  gidLink(cast(void**)&g_time_zone_get_identifier, "g_time_zone_get_identifier", libs);
  gidLink(cast(void**)&g_time_zone_get_offset, "g_time_zone_get_offset", libs);
  gidLink(cast(void**)&g_time_zone_is_dst, "g_time_zone_is_dst", libs);
  gidLink(cast(void**)&g_time_zone_ref, "g_time_zone_ref", libs);
  gidLink(cast(void**)&g_time_zone_unref, "g_time_zone_unref", libs);

  // Timer
  gidLink(cast(void**)&g_timer_continue, "g_timer_continue", libs);
  gidLink(cast(void**)&g_timer_destroy, "g_timer_destroy", libs);
  gidLink(cast(void**)&g_timer_elapsed, "g_timer_elapsed", libs);
  gidLink(cast(void**)&g_timer_is_active, "g_timer_is_active", libs);
  gidLink(cast(void**)&g_timer_reset, "g_timer_reset", libs);
  gidLink(cast(void**)&g_timer_start, "g_timer_start", libs);
  gidLink(cast(void**)&g_timer_stop, "g_timer_stop", libs);
  gidLink(cast(void**)&g_timer_new, "g_timer_new", libs);

  // TrashStack
  gidLink(cast(void**)&g_trash_stack_height, "g_trash_stack_height", libs);
  gidLink(cast(void**)&g_trash_stack_peek, "g_trash_stack_peek", libs);
  gidLink(cast(void**)&g_trash_stack_pop, "g_trash_stack_pop", libs);
  gidLink(cast(void**)&g_trash_stack_push, "g_trash_stack_push", libs);

  // Tree
  gidLink(cast(void**)&g_tree_get_type, "g_tree_get_type", libs);
  gidLink(cast(void**)&g_tree_new, "g_tree_new", libs);
  gidLink(cast(void**)&g_tree_new_full, "g_tree_new_full", libs);
  gidLink(cast(void**)&g_tree_new_with_data, "g_tree_new_with_data", libs);
  gidLink(cast(void**)&g_tree_destroy, "g_tree_destroy", libs);
  gidLink(cast(void**)&g_tree_foreach, "g_tree_foreach", libs);
  gidLink(cast(void**)&g_tree_foreach_node, "g_tree_foreach_node", libs);
  gidLink(cast(void**)&g_tree_height, "g_tree_height", libs);
  gidLink(cast(void**)&g_tree_insert, "g_tree_insert", libs);
  gidLink(cast(void**)&g_tree_insert_node, "g_tree_insert_node", libs);
  gidLink(cast(void**)&g_tree_lookup, "g_tree_lookup", libs);
  gidLink(cast(void**)&g_tree_lookup_extended, "g_tree_lookup_extended", libs);
  gidLink(cast(void**)&g_tree_lookup_node, "g_tree_lookup_node", libs);
  gidLink(cast(void**)&g_tree_lower_bound, "g_tree_lower_bound", libs);
  gidLink(cast(void**)&g_tree_nnodes, "g_tree_nnodes", libs);
  gidLink(cast(void**)&g_tree_node_first, "g_tree_node_first", libs);
  gidLink(cast(void**)&g_tree_node_last, "g_tree_node_last", libs);
  gidLink(cast(void**)&g_tree_ref, "g_tree_ref", libs);
  gidLink(cast(void**)&g_tree_remove, "g_tree_remove", libs);
  gidLink(cast(void**)&g_tree_remove_all, "g_tree_remove_all", libs);
  gidLink(cast(void**)&g_tree_replace, "g_tree_replace", libs);
  gidLink(cast(void**)&g_tree_replace_node, "g_tree_replace_node", libs);
  gidLink(cast(void**)&g_tree_search, "g_tree_search", libs);
  gidLink(cast(void**)&g_tree_search_node, "g_tree_search_node", libs);
  gidLink(cast(void**)&g_tree_steal, "g_tree_steal", libs);
  gidLink(cast(void**)&g_tree_traverse, "g_tree_traverse", libs);
  gidLink(cast(void**)&g_tree_unref, "g_tree_unref", libs);
  gidLink(cast(void**)&g_tree_upper_bound, "g_tree_upper_bound", libs);

  // TreeNode
  gidLink(cast(void**)&g_tree_node_key, "g_tree_node_key", libs);
  gidLink(cast(void**)&g_tree_node_next, "g_tree_node_next", libs);
  gidLink(cast(void**)&g_tree_node_previous, "g_tree_node_previous", libs);
  gidLink(cast(void**)&g_tree_node_value, "g_tree_node_value", libs);

  // Tuples
  gidLink(cast(void**)&g_tuples_destroy, "g_tuples_destroy", libs);
  gidLink(cast(void**)&g_tuples_index, "g_tuples_index", libs);

  // Uri
  gidLink(cast(void**)&g_uri_get_type, "g_uri_get_type", libs);
  gidLink(cast(void**)&g_uri_get_auth_params, "g_uri_get_auth_params", libs);
  gidLink(cast(void**)&g_uri_get_flags, "g_uri_get_flags", libs);
  gidLink(cast(void**)&g_uri_get_fragment, "g_uri_get_fragment", libs);
  gidLink(cast(void**)&g_uri_get_host, "g_uri_get_host", libs);
  gidLink(cast(void**)&g_uri_get_password, "g_uri_get_password", libs);
  gidLink(cast(void**)&g_uri_get_path, "g_uri_get_path", libs);
  gidLink(cast(void**)&g_uri_get_port, "g_uri_get_port", libs);
  gidLink(cast(void**)&g_uri_get_query, "g_uri_get_query", libs);
  gidLink(cast(void**)&g_uri_get_scheme, "g_uri_get_scheme", libs);
  gidLink(cast(void**)&g_uri_get_user, "g_uri_get_user", libs);
  gidLink(cast(void**)&g_uri_get_userinfo, "g_uri_get_userinfo", libs);
  gidLink(cast(void**)&g_uri_parse_relative, "g_uri_parse_relative", libs);
  gidLink(cast(void**)&g_uri_ref, "g_uri_ref", libs);
  gidLink(cast(void**)&g_uri_to_string, "g_uri_to_string", libs);
  gidLink(cast(void**)&g_uri_to_string_partial, "g_uri_to_string_partial", libs);
  gidLink(cast(void**)&g_uri_unref, "g_uri_unref", libs);
  gidLink(cast(void**)&g_uri_build, "g_uri_build", libs);
  gidLink(cast(void**)&g_uri_build_with_user, "g_uri_build_with_user", libs);
  gidLink(cast(void**)&g_uri_error_quark, "g_uri_error_quark", libs);
  gidLink(cast(void**)&g_uri_escape_bytes, "g_uri_escape_bytes", libs);
  gidLink(cast(void**)&g_uri_escape_string, "g_uri_escape_string", libs);
  gidLink(cast(void**)&g_uri_is_valid, "g_uri_is_valid", libs);
  gidLink(cast(void**)&g_uri_join, "g_uri_join", libs);
  gidLink(cast(void**)&g_uri_join_with_user, "g_uri_join_with_user", libs);
  gidLink(cast(void**)&g_uri_list_extract_uris, "g_uri_list_extract_uris", libs);
  gidLink(cast(void**)&g_uri_parse, "g_uri_parse", libs);
  gidLink(cast(void**)&g_uri_parse_params, "g_uri_parse_params", libs);
  gidLink(cast(void**)&g_uri_parse_scheme, "g_uri_parse_scheme", libs);
  gidLink(cast(void**)&g_uri_peek_scheme, "g_uri_peek_scheme", libs);
  gidLink(cast(void**)&g_uri_resolve_relative, "g_uri_resolve_relative", libs);
  gidLink(cast(void**)&g_uri_split, "g_uri_split", libs);
  gidLink(cast(void**)&g_uri_split_network, "g_uri_split_network", libs);
  gidLink(cast(void**)&g_uri_split_with_user, "g_uri_split_with_user", libs);
  gidLink(cast(void**)&g_uri_unescape_bytes, "g_uri_unescape_bytes", libs);
  gidLink(cast(void**)&g_uri_unescape_segment, "g_uri_unescape_segment", libs);
  gidLink(cast(void**)&g_uri_unescape_string, "g_uri_unescape_string", libs);

  // UriParamsIter
  gidLink(cast(void**)&g_uri_params_iter_init, "g_uri_params_iter_init", libs);
  gidLink(cast(void**)&g_uri_params_iter_next, "g_uri_params_iter_next", libs);

  // Variant
  gidLink(cast(void**)&intern, "intern", libs);
  gidLink(cast(void**)&g_variant_new, "g_variant_new", libs);
  gidLink(cast(void**)&g_variant_new_array, "g_variant_new_array", libs);
  gidLink(cast(void**)&g_variant_new_boolean, "g_variant_new_boolean", libs);
  gidLink(cast(void**)&g_variant_new_byte, "g_variant_new_byte", libs);
  gidLink(cast(void**)&g_variant_new_bytestring, "g_variant_new_bytestring", libs);
  gidLink(cast(void**)&g_variant_new_bytestring_array, "g_variant_new_bytestring_array", libs);
  gidLink(cast(void**)&g_variant_new_dict_entry, "g_variant_new_dict_entry", libs);
  gidLink(cast(void**)&g_variant_new_double, "g_variant_new_double", libs);
  gidLink(cast(void**)&g_variant_new_fixed_array, "g_variant_new_fixed_array", libs);
  gidLink(cast(void**)&g_variant_new_from_bytes, "g_variant_new_from_bytes", libs);
  gidLink(cast(void**)&g_variant_new_from_data, "g_variant_new_from_data", libs);
  gidLink(cast(void**)&g_variant_new_handle, "g_variant_new_handle", libs);
  gidLink(cast(void**)&g_variant_new_int16, "g_variant_new_int16", libs);
  gidLink(cast(void**)&g_variant_new_int32, "g_variant_new_int32", libs);
  gidLink(cast(void**)&g_variant_new_int64, "g_variant_new_int64", libs);
  gidLink(cast(void**)&g_variant_new_maybe, "g_variant_new_maybe", libs);
  gidLink(cast(void**)&g_variant_new_object_path, "g_variant_new_object_path", libs);
  gidLink(cast(void**)&g_variant_new_objv, "g_variant_new_objv", libs);
  gidLink(cast(void**)&g_variant_new_parsed, "g_variant_new_parsed", libs);
  gidLink(cast(void**)&g_variant_new_parsed_va, "g_variant_new_parsed_va", libs);
  gidLink(cast(void**)&g_variant_new_printf, "g_variant_new_printf", libs);
  gidLink(cast(void**)&g_variant_new_signature, "g_variant_new_signature", libs);
  gidLink(cast(void**)&g_variant_new_string, "g_variant_new_string", libs);
  gidLink(cast(void**)&g_variant_new_strv, "g_variant_new_strv", libs);
  gidLink(cast(void**)&g_variant_new_take_string, "g_variant_new_take_string", libs);
  gidLink(cast(void**)&g_variant_new_tuple, "g_variant_new_tuple", libs);
  gidLink(cast(void**)&g_variant_new_uint16, "g_variant_new_uint16", libs);
  gidLink(cast(void**)&g_variant_new_uint32, "g_variant_new_uint32", libs);
  gidLink(cast(void**)&g_variant_new_uint64, "g_variant_new_uint64", libs);
  gidLink(cast(void**)&g_variant_new_va, "g_variant_new_va", libs);
  gidLink(cast(void**)&g_variant_new_variant, "g_variant_new_variant", libs);
  gidLink(cast(void**)&g_variant_byteswap, "g_variant_byteswap", libs);
  gidLink(cast(void**)&g_variant_check_format_string, "g_variant_check_format_string", libs);
  gidLink(cast(void**)&g_variant_classify, "g_variant_classify", libs);
  gidLink(cast(void**)&g_variant_compare, "g_variant_compare", libs);
  gidLink(cast(void**)&g_variant_dup_bytestring, "g_variant_dup_bytestring", libs);
  gidLink(cast(void**)&g_variant_dup_bytestring_array, "g_variant_dup_bytestring_array", libs);
  gidLink(cast(void**)&g_variant_dup_objv, "g_variant_dup_objv", libs);
  gidLink(cast(void**)&g_variant_dup_string, "g_variant_dup_string", libs);
  gidLink(cast(void**)&g_variant_dup_strv, "g_variant_dup_strv", libs);
  gidLink(cast(void**)&g_variant_equal, "g_variant_equal", libs);
  gidLink(cast(void**)&g_variant_get, "g_variant_get", libs);
  gidLink(cast(void**)&g_variant_get_boolean, "g_variant_get_boolean", libs);
  gidLink(cast(void**)&g_variant_get_byte, "g_variant_get_byte", libs);
  gidLink(cast(void**)&g_variant_get_bytestring, "g_variant_get_bytestring", libs);
  gidLink(cast(void**)&g_variant_get_bytestring_array, "g_variant_get_bytestring_array", libs);
  gidLink(cast(void**)&g_variant_get_child, "g_variant_get_child", libs);
  gidLink(cast(void**)&g_variant_get_child_value, "g_variant_get_child_value", libs);
  gidLink(cast(void**)&g_variant_get_data, "g_variant_get_data", libs);
  gidLink(cast(void**)&g_variant_get_data_as_bytes, "g_variant_get_data_as_bytes", libs);
  gidLink(cast(void**)&g_variant_get_double, "g_variant_get_double", libs);
  gidLink(cast(void**)&g_variant_get_fixed_array, "g_variant_get_fixed_array", libs);
  gidLink(cast(void**)&g_variant_get_handle, "g_variant_get_handle", libs);
  gidLink(cast(void**)&g_variant_get_int16, "g_variant_get_int16", libs);
  gidLink(cast(void**)&g_variant_get_int32, "g_variant_get_int32", libs);
  gidLink(cast(void**)&g_variant_get_int64, "g_variant_get_int64", libs);
  gidLink(cast(void**)&g_variant_get_maybe, "g_variant_get_maybe", libs);
  gidLink(cast(void**)&g_variant_get_normal_form, "g_variant_get_normal_form", libs);
  gidLink(cast(void**)&g_variant_get_objv, "g_variant_get_objv", libs);
  gidLink(cast(void**)&g_variant_get_size, "g_variant_get_size", libs);
  gidLink(cast(void**)&g_variant_get_string, "g_variant_get_string", libs);
  gidLink(cast(void**)&g_variant_get_strv, "g_variant_get_strv", libs);
  gidLink(cast(void**)&g_variant_get_type, "g_variant_get_type", libs);
  gidLink(cast(void**)&g_variant_get_type_string, "g_variant_get_type_string", libs);
  gidLink(cast(void**)&g_variant_get_uint16, "g_variant_get_uint16", libs);
  gidLink(cast(void**)&g_variant_get_uint32, "g_variant_get_uint32", libs);
  gidLink(cast(void**)&g_variant_get_uint64, "g_variant_get_uint64", libs);
  gidLink(cast(void**)&g_variant_get_va, "g_variant_get_va", libs);
  gidLink(cast(void**)&g_variant_get_variant, "g_variant_get_variant", libs);
  gidLink(cast(void**)&g_variant_hash, "g_variant_hash", libs);
  gidLink(cast(void**)&g_variant_is_container, "g_variant_is_container", libs);
  gidLink(cast(void**)&g_variant_is_floating, "g_variant_is_floating", libs);
  gidLink(cast(void**)&g_variant_is_normal_form, "g_variant_is_normal_form", libs);
  gidLink(cast(void**)&g_variant_is_of_type, "g_variant_is_of_type", libs);
  gidLink(cast(void**)&g_variant_iter_new, "g_variant_iter_new", libs);
  gidLink(cast(void**)&g_variant_lookup, "g_variant_lookup", libs);
  gidLink(cast(void**)&g_variant_lookup_value, "g_variant_lookup_value", libs);
  gidLink(cast(void**)&g_variant_n_children, "g_variant_n_children", libs);
  gidLink(cast(void**)&g_variant_print, "g_variant_print", libs);
  gidLink(cast(void**)&g_variant_print_string, "g_variant_print_string", libs);
  gidLink(cast(void**)&g_variant_ref, "g_variant_ref", libs);
  gidLink(cast(void**)&g_variant_ref_sink, "g_variant_ref_sink", libs);
  gidLink(cast(void**)&g_variant_store, "g_variant_store", libs);
  gidLink(cast(void**)&g_variant_take_ref, "g_variant_take_ref", libs);
  gidLink(cast(void**)&g_variant_unref, "g_variant_unref", libs);
  gidLink(cast(void**)&g_variant_is_object_path, "g_variant_is_object_path", libs);
  gidLink(cast(void**)&g_variant_is_signature, "g_variant_is_signature", libs);
  gidLink(cast(void**)&g_variant_parse, "g_variant_parse", libs);
  gidLink(cast(void**)&g_variant_parse_error_print_context, "g_variant_parse_error_print_context", libs);
  gidLink(cast(void**)&g_variant_parse_error_quark, "g_variant_parse_error_quark", libs);
  gidLink(cast(void**)&g_variant_parser_get_error_quark, "g_variant_parser_get_error_quark", libs);

  // VariantBuilder
  gidLink(cast(void**)&g_variant_builder_get_type, "g_variant_builder_get_type", libs);
  gidLink(cast(void**)&g_variant_builder_new, "g_variant_builder_new", libs);
  gidLink(cast(void**)&g_variant_builder_add, "g_variant_builder_add", libs);
  gidLink(cast(void**)&g_variant_builder_add_parsed, "g_variant_builder_add_parsed", libs);
  gidLink(cast(void**)&g_variant_builder_add_value, "g_variant_builder_add_value", libs);
  gidLink(cast(void**)&g_variant_builder_clear, "g_variant_builder_clear", libs);
  gidLink(cast(void**)&g_variant_builder_close, "g_variant_builder_close", libs);
  gidLink(cast(void**)&g_variant_builder_end, "g_variant_builder_end", libs);
  gidLink(cast(void**)&g_variant_builder_init, "g_variant_builder_init", libs);
  gidLink(cast(void**)&g_variant_builder_init_static, "g_variant_builder_init_static", libs);
  gidLink(cast(void**)&g_variant_builder_open, "g_variant_builder_open", libs);
  gidLink(cast(void**)&g_variant_builder_ref, "g_variant_builder_ref", libs);
  gidLink(cast(void**)&g_variant_builder_unref, "g_variant_builder_unref", libs);

  // VariantDict
  gidLink(cast(void**)&g_variant_dict_get_type, "g_variant_dict_get_type", libs);
  gidLink(cast(void**)&g_variant_dict_new, "g_variant_dict_new", libs);
  gidLink(cast(void**)&g_variant_dict_clear, "g_variant_dict_clear", libs);
  gidLink(cast(void**)&g_variant_dict_contains, "g_variant_dict_contains", libs);
  gidLink(cast(void**)&g_variant_dict_end, "g_variant_dict_end", libs);
  gidLink(cast(void**)&g_variant_dict_init, "g_variant_dict_init", libs);
  gidLink(cast(void**)&g_variant_dict_insert, "g_variant_dict_insert", libs);
  gidLink(cast(void**)&g_variant_dict_insert_value, "g_variant_dict_insert_value", libs);
  gidLink(cast(void**)&g_variant_dict_lookup, "g_variant_dict_lookup", libs);
  gidLink(cast(void**)&g_variant_dict_lookup_value, "g_variant_dict_lookup_value", libs);
  gidLink(cast(void**)&g_variant_dict_ref, "g_variant_dict_ref", libs);
  gidLink(cast(void**)&g_variant_dict_remove, "g_variant_dict_remove", libs);
  gidLink(cast(void**)&g_variant_dict_unref, "g_variant_dict_unref", libs);

  // VariantIter
  gidLink(cast(void**)&g_variant_iter_copy, "g_variant_iter_copy", libs);
  gidLink(cast(void**)&g_variant_iter_free, "g_variant_iter_free", libs);
  gidLink(cast(void**)&g_variant_iter_init, "g_variant_iter_init", libs);
  gidLink(cast(void**)&g_variant_iter_loop, "g_variant_iter_loop", libs);
  gidLink(cast(void**)&g_variant_iter_n_children, "g_variant_iter_n_children", libs);
  gidLink(cast(void**)&g_variant_iter_next, "g_variant_iter_next", libs);
  gidLink(cast(void**)&g_variant_iter_next_value, "g_variant_iter_next_value", libs);

  // VariantType
  gidLink(cast(void**)&g_variant_type_get_gtype, "g_variant_type_get_gtype", libs);
  gidLink(cast(void**)&g_variant_type_new, "g_variant_type_new", libs);
  gidLink(cast(void**)&g_variant_type_new_array, "g_variant_type_new_array", libs);
  gidLink(cast(void**)&g_variant_type_new_dict_entry, "g_variant_type_new_dict_entry", libs);
  gidLink(cast(void**)&g_variant_type_new_maybe, "g_variant_type_new_maybe", libs);
  gidLink(cast(void**)&g_variant_type_new_tuple, "g_variant_type_new_tuple", libs);
  gidLink(cast(void**)&g_variant_type_copy, "g_variant_type_copy", libs);
  gidLink(cast(void**)&g_variant_type_dup_string, "g_variant_type_dup_string", libs);
  gidLink(cast(void**)&g_variant_type_element, "g_variant_type_element", libs);
  gidLink(cast(void**)&g_variant_type_equal, "g_variant_type_equal", libs);
  gidLink(cast(void**)&g_variant_type_first, "g_variant_type_first", libs);
  gidLink(cast(void**)&g_variant_type_free, "g_variant_type_free", libs);
  gidLink(cast(void**)&g_variant_type_get_string_length, "g_variant_type_get_string_length", libs);
  gidLink(cast(void**)&g_variant_type_hash, "g_variant_type_hash", libs);
  gidLink(cast(void**)&g_variant_type_is_array, "g_variant_type_is_array", libs);
  gidLink(cast(void**)&g_variant_type_is_basic, "g_variant_type_is_basic", libs);
  gidLink(cast(void**)&g_variant_type_is_container, "g_variant_type_is_container", libs);
  gidLink(cast(void**)&g_variant_type_is_definite, "g_variant_type_is_definite", libs);
  gidLink(cast(void**)&g_variant_type_is_dict_entry, "g_variant_type_is_dict_entry", libs);
  gidLink(cast(void**)&g_variant_type_is_maybe, "g_variant_type_is_maybe", libs);
  gidLink(cast(void**)&g_variant_type_is_subtype_of, "g_variant_type_is_subtype_of", libs);
  gidLink(cast(void**)&g_variant_type_is_tuple, "g_variant_type_is_tuple", libs);
  gidLink(cast(void**)&g_variant_type_is_variant, "g_variant_type_is_variant", libs);
  gidLink(cast(void**)&g_variant_type_key, "g_variant_type_key", libs);
  gidLink(cast(void**)&g_variant_type_n_items, "g_variant_type_n_items", libs);
  gidLink(cast(void**)&g_variant_type_next, "g_variant_type_next", libs);
  gidLink(cast(void**)&g_variant_type_peek_string, "g_variant_type_peek_string", libs);
  gidLink(cast(void**)&g_variant_type_value, "g_variant_type_value", libs);
  gidLink(cast(void**)&g_variant_type_checked_, "g_variant_type_checked_", libs);
  gidLink(cast(void**)&g_variant_type_string_get_depth_, "g_variant_type_string_get_depth_", libs);
  gidLink(cast(void**)&g_variant_type_string_is_valid, "g_variant_type_string_is_valid", libs);
  gidLink(cast(void**)&g_variant_type_string_scan, "g_variant_type_string_scan", libs);

  // global
  gidLink(cast(void**)&g_access, "g_access", libs);
  gidLink(cast(void**)&g_aligned_alloc, "g_aligned_alloc", libs);
  gidLink(cast(void**)&g_aligned_alloc0, "g_aligned_alloc0", libs);
  gidLink(cast(void**)&g_aligned_free, "g_aligned_free", libs);
  gidLink(cast(void**)&g_aligned_free_sized, "g_aligned_free_sized", libs);
  gidLink(cast(void**)&g_ascii_digit_value, "g_ascii_digit_value", libs);
  gidLink(cast(void**)&g_ascii_dtostr, "g_ascii_dtostr", libs);
  gidLink(cast(void**)&g_ascii_formatd, "g_ascii_formatd", libs);
  gidLink(cast(void**)&g_ascii_strcasecmp, "g_ascii_strcasecmp", libs);
  gidLink(cast(void**)&g_ascii_strdown, "g_ascii_strdown", libs);
  gidLink(cast(void**)&g_ascii_string_to_signed, "g_ascii_string_to_signed", libs);
  gidLink(cast(void**)&g_ascii_string_to_unsigned, "g_ascii_string_to_unsigned", libs);
  gidLink(cast(void**)&g_ascii_strncasecmp, "g_ascii_strncasecmp", libs);
  gidLink(cast(void**)&g_ascii_strtod, "g_ascii_strtod", libs);
  gidLink(cast(void**)&g_ascii_strtoll, "g_ascii_strtoll", libs);
  gidLink(cast(void**)&g_ascii_strtoull, "g_ascii_strtoull", libs);
  gidLink(cast(void**)&g_ascii_strup, "g_ascii_strup", libs);
  gidLink(cast(void**)&g_ascii_tolower, "g_ascii_tolower", libs);
  gidLink(cast(void**)&g_ascii_toupper, "g_ascii_toupper", libs);
  gidLink(cast(void**)&g_ascii_xdigit_value, "g_ascii_xdigit_value", libs);
  gidLink(cast(void**)&g_assert_warning, "g_assert_warning", libs);
  gidLink(cast(void**)&g_assertion_message, "g_assertion_message", libs);
  gidLink(cast(void**)&g_assertion_message_cmpint, "g_assertion_message_cmpint", libs);
  gidLink(cast(void**)&g_assertion_message_cmpnum, "g_assertion_message_cmpnum", libs);
  gidLink(cast(void**)&g_assertion_message_cmpstr, "g_assertion_message_cmpstr", libs);
  gidLink(cast(void**)&g_assertion_message_cmpstrv, "g_assertion_message_cmpstrv", libs);
  gidLink(cast(void**)&g_assertion_message_error, "g_assertion_message_error", libs);
  gidLink(cast(void**)&g_assertion_message_expr, "g_assertion_message_expr", libs);
  gidLink(cast(void**)&g_atexit, "g_atexit", libs);
  gidLink(cast(void**)&g_atomic_int_add, "g_atomic_int_add", libs);
  gidLink(cast(void**)&g_atomic_int_and, "g_atomic_int_and", libs);
  gidLink(cast(void**)&g_atomic_int_compare_and_exchange, "g_atomic_int_compare_and_exchange", libs);
  gidLink(cast(void**)&g_atomic_int_compare_and_exchange_full, "g_atomic_int_compare_and_exchange_full", libs);
  gidLink(cast(void**)&g_atomic_int_dec_and_test, "g_atomic_int_dec_and_test", libs);
  gidLink(cast(void**)&g_atomic_int_exchange, "g_atomic_int_exchange", libs);
  gidLink(cast(void**)&g_atomic_int_exchange_and_add, "g_atomic_int_exchange_and_add", libs);
  gidLink(cast(void**)&g_atomic_int_get, "g_atomic_int_get", libs);
  gidLink(cast(void**)&g_atomic_int_inc, "g_atomic_int_inc", libs);
  gidLink(cast(void**)&g_atomic_int_or, "g_atomic_int_or", libs);
  gidLink(cast(void**)&g_atomic_int_set, "g_atomic_int_set", libs);
  gidLink(cast(void**)&g_atomic_int_xor, "g_atomic_int_xor", libs);
  gidLink(cast(void**)&g_atomic_pointer_add, "g_atomic_pointer_add", libs);
  gidLink(cast(void**)&g_atomic_pointer_and, "g_atomic_pointer_and", libs);
  gidLink(cast(void**)&g_atomic_pointer_compare_and_exchange, "g_atomic_pointer_compare_and_exchange", libs);
  gidLink(cast(void**)&g_atomic_pointer_compare_and_exchange_full, "g_atomic_pointer_compare_and_exchange_full", libs);
  gidLink(cast(void**)&g_atomic_pointer_exchange, "g_atomic_pointer_exchange", libs);
  gidLink(cast(void**)&g_atomic_pointer_get, "g_atomic_pointer_get", libs);
  gidLink(cast(void**)&g_atomic_pointer_or, "g_atomic_pointer_or", libs);
  gidLink(cast(void**)&g_atomic_pointer_set, "g_atomic_pointer_set", libs);
  gidLink(cast(void**)&g_atomic_pointer_xor, "g_atomic_pointer_xor", libs);
  gidLink(cast(void**)&g_atomic_rc_box_acquire, "g_atomic_rc_box_acquire", libs);
  gidLink(cast(void**)&g_atomic_rc_box_alloc, "g_atomic_rc_box_alloc", libs);
  gidLink(cast(void**)&g_atomic_rc_box_alloc0, "g_atomic_rc_box_alloc0", libs);
  gidLink(cast(void**)&g_atomic_rc_box_dup, "g_atomic_rc_box_dup", libs);
  gidLink(cast(void**)&g_atomic_rc_box_get_size, "g_atomic_rc_box_get_size", libs);
  gidLink(cast(void**)&g_atomic_rc_box_release, "g_atomic_rc_box_release", libs);
  gidLink(cast(void**)&g_atomic_rc_box_release_full, "g_atomic_rc_box_release_full", libs);
  gidLink(cast(void**)&g_atomic_ref_count_compare, "g_atomic_ref_count_compare", libs);
  gidLink(cast(void**)&g_atomic_ref_count_dec, "g_atomic_ref_count_dec", libs);
  gidLink(cast(void**)&g_atomic_ref_count_inc, "g_atomic_ref_count_inc", libs);
  gidLink(cast(void**)&g_atomic_ref_count_init, "g_atomic_ref_count_init", libs);
  gidLink(cast(void**)&g_base64_decode, "g_base64_decode", libs);
  gidLink(cast(void**)&g_base64_decode_inplace, "g_base64_decode_inplace", libs);
  gidLink(cast(void**)&g_base64_decode_step, "g_base64_decode_step", libs);
  gidLink(cast(void**)&g_base64_encode, "g_base64_encode", libs);
  gidLink(cast(void**)&g_base64_encode_close, "g_base64_encode_close", libs);
  gidLink(cast(void**)&g_base64_encode_step, "g_base64_encode_step", libs);
  gidLink(cast(void**)&g_basename, "g_basename", libs);
  gidLink(cast(void**)&g_bit_lock, "g_bit_lock", libs);
  gidLink(cast(void**)&g_bit_lock_and_get, "g_bit_lock_and_get", libs);
  gidLink(cast(void**)&g_bit_nth_lsf, "g_bit_nth_lsf", libs);
  gidLink(cast(void**)&g_bit_nth_msf, "g_bit_nth_msf", libs);
  gidLink(cast(void**)&g_bit_storage, "g_bit_storage", libs);
  gidLink(cast(void**)&g_bit_trylock, "g_bit_trylock", libs);
  gidLink(cast(void**)&g_bit_unlock, "g_bit_unlock", libs);
  gidLink(cast(void**)&g_bit_unlock_and_set, "g_bit_unlock_and_set", libs);
  gidLink(cast(void**)&g_blow_chunks, "g_blow_chunks", libs);
  gidLink(cast(void**)&g_build_filename, "g_build_filename", libs);
  gidLink(cast(void**)&g_build_filename_valist, "g_build_filename_valist", libs);
  gidLink(cast(void**)&g_build_filenamev, "g_build_filenamev", libs);
  gidLink(cast(void**)&g_build_path, "g_build_path", libs);
  gidLink(cast(void**)&g_build_pathv, "g_build_pathv", libs);
  gidLink(cast(void**)&g_canonicalize_filename, "g_canonicalize_filename", libs);
  gidLink(cast(void**)&g_chdir, "g_chdir", libs);
  gidLink(cast(void**)&glib_check_version, "glib_check_version", libs);
  gidLink(cast(void**)&g_child_watch_add, "g_child_watch_add", libs);
  gidLink(cast(void**)&g_child_watch_add_full, "g_child_watch_add_full", libs);
  gidLink(cast(void**)&g_child_watch_source_new, "g_child_watch_source_new", libs);
  gidLink(cast(void**)&g_chmod, "g_chmod", libs);
  gidLink(cast(void**)&g_clear_error, "g_clear_error", libs);
  gidLink(cast(void**)&g_clear_handle_id, "g_clear_handle_id", libs);
  gidLink(cast(void**)&g_clear_list, "g_clear_list", libs);
  gidLink(cast(void**)&g_clear_pointer, "g_clear_pointer", libs);
  gidLink(cast(void**)&g_clear_slist, "g_clear_slist", libs);
  gidLink(cast(void**)&g_close, "g_close", libs);
  gidLink(cast(void**)&g_compute_checksum_for_bytes, "g_compute_checksum_for_bytes", libs);
  gidLink(cast(void**)&g_compute_checksum_for_data, "g_compute_checksum_for_data", libs);
  gidLink(cast(void**)&g_compute_checksum_for_string, "g_compute_checksum_for_string", libs);
  gidLink(cast(void**)&g_compute_hmac_for_bytes, "g_compute_hmac_for_bytes", libs);
  gidLink(cast(void**)&g_compute_hmac_for_data, "g_compute_hmac_for_data", libs);
  gidLink(cast(void**)&g_compute_hmac_for_string, "g_compute_hmac_for_string", libs);
  gidLink(cast(void**)&g_convert, "g_convert", libs);
  gidLink(cast(void**)&g_convert_error_quark, "g_convert_error_quark", libs);
  gidLink(cast(void**)&g_convert_with_fallback, "g_convert_with_fallback", libs);
  gidLink(cast(void**)&g_convert_with_iconv, "g_convert_with_iconv", libs);
  gidLink(cast(void**)&g_creat, "g_creat", libs);
  gidLink(cast(void**)&g_datalist_clear, "g_datalist_clear", libs);
  gidLink(cast(void**)&g_datalist_foreach, "g_datalist_foreach", libs);
  gidLink(cast(void**)&g_datalist_get_data, "g_datalist_get_data", libs);
  gidLink(cast(void**)&g_datalist_get_flags, "g_datalist_get_flags", libs);
  gidLink(cast(void**)&g_datalist_id_dup_data, "g_datalist_id_dup_data", libs);
  gidLink(cast(void**)&g_datalist_id_get_data, "g_datalist_id_get_data", libs);
  gidLink(cast(void**)&g_datalist_id_remove_multiple, "g_datalist_id_remove_multiple", libs);
  gidLink(cast(void**)&g_datalist_id_remove_no_notify, "g_datalist_id_remove_no_notify", libs);
  gidLink(cast(void**)&g_datalist_id_replace_data, "g_datalist_id_replace_data", libs);
  gidLink(cast(void**)&g_datalist_id_set_data_full, "g_datalist_id_set_data_full", libs);
  gidLink(cast(void**)&g_datalist_init, "g_datalist_init", libs);
  gidLink(cast(void**)&g_datalist_set_flags, "g_datalist_set_flags", libs);
  gidLink(cast(void**)&g_datalist_unset_flags, "g_datalist_unset_flags", libs);
  gidLink(cast(void**)&g_dataset_destroy, "g_dataset_destroy", libs);
  gidLink(cast(void**)&g_dataset_foreach, "g_dataset_foreach", libs);
  gidLink(cast(void**)&g_dataset_id_get_data, "g_dataset_id_get_data", libs);
  gidLink(cast(void**)&g_dataset_id_remove_no_notify, "g_dataset_id_remove_no_notify", libs);
  gidLink(cast(void**)&g_dataset_id_set_data_full, "g_dataset_id_set_data_full", libs);
  gidLink(cast(void**)&g_dcgettext, "g_dcgettext", libs);
  gidLink(cast(void**)&g_dgettext, "g_dgettext", libs);
  gidLink(cast(void**)&g_direct_equal, "g_direct_equal", libs);
  gidLink(cast(void**)&g_direct_hash, "g_direct_hash", libs);
  gidLink(cast(void**)&g_dngettext, "g_dngettext", libs);
  gidLink(cast(void**)&g_double_equal, "g_double_equal", libs);
  gidLink(cast(void**)&g_double_hash, "g_double_hash", libs);
  gidLink(cast(void**)&g_dpgettext, "g_dpgettext", libs);
  gidLink(cast(void**)&g_dpgettext2, "g_dpgettext2", libs);
  gidLink(cast(void**)&g_environ_getenv, "g_environ_getenv", libs);
  gidLink(cast(void**)&g_environ_setenv, "g_environ_setenv", libs);
  gidLink(cast(void**)&g_environ_unsetenv, "g_environ_unsetenv", libs);
  gidLink(cast(void**)&g_file_error_from_errno, "g_file_error_from_errno", libs);
  gidLink(cast(void**)&g_file_error_quark, "g_file_error_quark", libs);
  gidLink(cast(void**)&g_file_get_contents, "g_file_get_contents", libs);
  gidLink(cast(void**)&g_file_open_tmp, "g_file_open_tmp", libs);
  gidLink(cast(void**)&g_file_read_link, "g_file_read_link", libs);
  gidLink(cast(void**)&g_file_set_contents, "g_file_set_contents", libs);
  gidLink(cast(void**)&g_file_set_contents_full, "g_file_set_contents_full", libs);
  gidLink(cast(void**)&g_file_test, "g_file_test", libs);
  gidLink(cast(void**)&g_filename_display_basename, "g_filename_display_basename", libs);
  gidLink(cast(void**)&g_filename_display_name, "g_filename_display_name", libs);
  gidLink(cast(void**)&g_filename_from_uri, "g_filename_from_uri", libs);
  gidLink(cast(void**)&g_filename_from_utf8, "g_filename_from_utf8", libs);
  gidLink(cast(void**)&g_filename_to_uri, "g_filename_to_uri", libs);
  gidLink(cast(void**)&g_filename_to_utf8, "g_filename_to_utf8", libs);
  gidLink(cast(void**)&g_find_program_in_path, "g_find_program_in_path", libs);
  gidLink(cast(void**)&g_fopen, "g_fopen", libs);
  gidLink(cast(void**)&g_format_size, "g_format_size", libs);
  gidLink(cast(void**)&g_format_size_for_display, "g_format_size_for_display", libs);
  gidLink(cast(void**)&g_format_size_full, "g_format_size_full", libs);
  gidLink(cast(void**)&g_fprintf, "g_fprintf", libs);
  gidLink(cast(void**)&g_free, "g_free", libs);
  gidLink(cast(void**)&g_free_sized, "g_free_sized", libs);
  gidLink(cast(void**)&g_freopen, "g_freopen", libs);
  gidLink(cast(void**)&g_fsync, "g_fsync", libs);
  gidLink(cast(void**)&g_get_application_name, "g_get_application_name", libs);
  gidLink(cast(void**)&g_get_charset, "g_get_charset", libs);
  gidLink(cast(void**)&g_get_codeset, "g_get_codeset", libs);
  gidLink(cast(void**)&g_get_console_charset, "g_get_console_charset", libs);
  gidLink(cast(void**)&g_get_current_dir, "g_get_current_dir", libs);
  gidLink(cast(void**)&g_get_current_time, "g_get_current_time", libs);
  gidLink(cast(void**)&g_get_environ, "g_get_environ", libs);
  gidLink(cast(void**)&g_get_filename_charsets, "g_get_filename_charsets", libs);
  gidLink(cast(void**)&g_get_home_dir, "g_get_home_dir", libs);
  gidLink(cast(void**)&g_get_host_name, "g_get_host_name", libs);
  gidLink(cast(void**)&g_get_language_names, "g_get_language_names", libs);
  gidLink(cast(void**)&g_get_language_names_with_category, "g_get_language_names_with_category", libs);
  gidLink(cast(void**)&g_get_locale_variants, "g_get_locale_variants", libs);
  gidLink(cast(void**)&g_get_monotonic_time, "g_get_monotonic_time", libs);
  gidLink(cast(void**)&g_get_monotonic_time_ns, "g_get_monotonic_time_ns", libs);
  gidLink(cast(void**)&g_get_num_processors, "g_get_num_processors", libs);
  gidLink(cast(void**)&g_get_os_info, "g_get_os_info", libs);
  gidLink(cast(void**)&g_get_prgname, "g_get_prgname", libs);
  gidLink(cast(void**)&g_get_real_name, "g_get_real_name", libs);
  gidLink(cast(void**)&g_get_real_time, "g_get_real_time", libs);
  gidLink(cast(void**)&g_get_system_config_dirs, "g_get_system_config_dirs", libs);
  gidLink(cast(void**)&g_get_system_data_dirs, "g_get_system_data_dirs", libs);
  gidLink(cast(void**)&g_get_tmp_dir, "g_get_tmp_dir", libs);
  gidLink(cast(void**)&g_get_user_cache_dir, "g_get_user_cache_dir", libs);
  gidLink(cast(void**)&g_get_user_config_dir, "g_get_user_config_dir", libs);
  gidLink(cast(void**)&g_get_user_data_dir, "g_get_user_data_dir", libs);
  gidLink(cast(void**)&g_get_user_name, "g_get_user_name", libs);
  gidLink(cast(void**)&g_get_user_runtime_dir, "g_get_user_runtime_dir", libs);
  gidLink(cast(void**)&g_get_user_special_dir, "g_get_user_special_dir", libs);
  gidLink(cast(void**)&g_get_user_state_dir, "g_get_user_state_dir", libs);
  gidLink(cast(void**)&g_getenv, "g_getenv", libs);
  gidLink(cast(void**)&g_hostname_is_ascii_encoded, "g_hostname_is_ascii_encoded", libs);
  gidLink(cast(void**)&g_hostname_is_ip_address, "g_hostname_is_ip_address", libs);
  gidLink(cast(void**)&g_hostname_is_non_ascii, "g_hostname_is_non_ascii", libs);
  gidLink(cast(void**)&g_hostname_to_ascii, "g_hostname_to_ascii", libs);
  gidLink(cast(void**)&g_hostname_to_unicode, "g_hostname_to_unicode", libs);
  gidLink(cast(void**)&g_iconv, "g_iconv", libs);
  gidLink(cast(void**)&g_idle_add, "g_idle_add", libs);
  gidLink(cast(void**)&g_idle_add_full, "g_idle_add_full", libs);
  gidLink(cast(void**)&g_idle_add_once, "g_idle_add_once", libs);
  gidLink(cast(void**)&g_idle_remove_by_data, "g_idle_remove_by_data", libs);
  gidLink(cast(void**)&g_idle_source_new, "g_idle_source_new", libs);
  gidLink(cast(void**)&g_int64_equal, "g_int64_equal", libs);
  gidLink(cast(void**)&g_int64_hash, "g_int64_hash", libs);
  gidLink(cast(void**)&g_int_equal, "g_int_equal", libs);
  gidLink(cast(void**)&g_int_hash, "g_int_hash", libs);
  gidLink(cast(void**)&g_intern_static_string, "g_intern_static_string", libs);
  gidLink(cast(void**)&g_intern_string, "g_intern_string", libs);
  gidLink(cast(void**)&g_io_add_watch, "g_io_add_watch", libs);
  gidLink(cast(void**)&g_io_add_watch_full, "g_io_add_watch_full", libs);
  gidLink(cast(void**)&g_io_create_watch, "g_io_create_watch", libs);
  gidLink(cast(void**)&g_listenv, "g_listenv", libs);
  gidLink(cast(void**)&g_locale_from_utf8, "g_locale_from_utf8", libs);
  gidLink(cast(void**)&g_locale_to_utf8, "g_locale_to_utf8", libs);
  gidLink(cast(void**)&g_log, "g_log", libs);
  gidLink(cast(void**)&g_log_default_handler, "g_log_default_handler", libs);
  gidLink(cast(void**)&g_log_get_always_fatal, "g_log_get_always_fatal", libs);
  gidLink(cast(void**)&g_log_get_debug_enabled, "g_log_get_debug_enabled", libs);
  gidLink(cast(void**)&g_log_remove_handler, "g_log_remove_handler", libs);
  gidLink(cast(void**)&g_log_set_always_fatal, "g_log_set_always_fatal", libs);
  gidLink(cast(void**)&g_log_set_debug_enabled, "g_log_set_debug_enabled", libs);
  gidLink(cast(void**)&g_log_set_default_handler, "g_log_set_default_handler", libs);
  gidLink(cast(void**)&g_log_set_fatal_mask, "g_log_set_fatal_mask", libs);
  gidLink(cast(void**)&g_log_set_handler, "g_log_set_handler", libs);
  gidLink(cast(void**)&g_log_set_handler_full, "g_log_set_handler_full", libs);
  gidLink(cast(void**)&g_log_set_writer_func, "g_log_set_writer_func", libs);
  gidLink(cast(void**)&g_log_structured, "g_log_structured", libs);
  gidLink(cast(void**)&g_log_structured_array, "g_log_structured_array", libs);
  gidLink(cast(void**)&g_log_structured_standard, "g_log_structured_standard", libs);
  gidLink(cast(void**)&g_log_variant, "g_log_variant", libs);
  gidLink(cast(void**)&g_log_writer_default, "g_log_writer_default", libs);
  gidLink(cast(void**)&g_log_writer_default_set_debug_domains, "g_log_writer_default_set_debug_domains", libs);
  gidLink(cast(void**)&g_log_writer_default_set_use_stderr, "g_log_writer_default_set_use_stderr", libs);
  gidLink(cast(void**)&g_log_writer_default_would_drop, "g_log_writer_default_would_drop", libs);
  gidLink(cast(void**)&g_log_writer_format_fields, "g_log_writer_format_fields", libs);
  gidLink(cast(void**)&g_log_writer_is_journald, "g_log_writer_is_journald", libs);
  gidLink(cast(void**)&g_log_writer_journald, "g_log_writer_journald", libs);
  gidLink(cast(void**)&g_log_writer_standard_streams, "g_log_writer_standard_streams", libs);
  gidLink(cast(void**)&g_log_writer_supports_color, "g_log_writer_supports_color", libs);
  gidLink(cast(void**)&g_log_writer_syslog, "g_log_writer_syslog", libs);
  gidLink(cast(void**)&g_logv, "g_logv", libs);
  gidLink(cast(void**)&g_lstat, "g_lstat", libs);
  gidLink(cast(void**)&g_main_current_source, "g_main_current_source", libs);
  gidLink(cast(void**)&g_main_depth, "g_main_depth", libs);
  gidLink(cast(void**)&g_malloc, "g_malloc", libs);
  gidLink(cast(void**)&g_malloc0, "g_malloc0", libs);
  gidLink(cast(void**)&g_malloc0_n, "g_malloc0_n", libs);
  gidLink(cast(void**)&g_malloc_n, "g_malloc_n", libs);
  gidLink(cast(void**)&g_markup_collect_attributes, "g_markup_collect_attributes", libs);
  gidLink(cast(void**)&g_markup_error_quark, "g_markup_error_quark", libs);
  gidLink(cast(void**)&g_markup_escape_text, "g_markup_escape_text", libs);
  gidLink(cast(void**)&g_markup_printf_escaped, "g_markup_printf_escaped", libs);
  gidLink(cast(void**)&g_markup_vprintf_escaped, "g_markup_vprintf_escaped", libs);
  gidLink(cast(void**)&g_mem_is_system_malloc, "g_mem_is_system_malloc", libs);
  gidLink(cast(void**)&g_mem_profile, "g_mem_profile", libs);
  gidLink(cast(void**)&g_mem_set_vtable, "g_mem_set_vtable", libs);
  gidLink(cast(void**)&g_memdup, "g_memdup", libs);
  gidLink(cast(void**)&g_memdup2, "g_memdup2", libs);
  gidLink(cast(void**)&g_mkdir, "g_mkdir", libs);
  gidLink(cast(void**)&g_mkdir_with_parents, "g_mkdir_with_parents", libs);
  gidLink(cast(void**)&g_mkdtemp, "g_mkdtemp", libs);
  gidLink(cast(void**)&g_mkdtemp_full, "g_mkdtemp_full", libs);
  gidLink(cast(void**)&g_mkstemp, "g_mkstemp", libs);
  gidLink(cast(void**)&g_mkstemp_full, "g_mkstemp_full", libs);
  gidLink(cast(void**)&g_nullify_pointer, "g_nullify_pointer", libs);
  gidLink(cast(void**)&g_number_parser_error_quark, "g_number_parser_error_quark", libs);
  gidLink(cast(void**)&g_on_error_query, "g_on_error_query", libs);
  gidLink(cast(void**)&g_on_error_stack_trace, "g_on_error_stack_trace", libs);
  gidLink(cast(void**)&g_open, "g_open", libs);
  gidLink(cast(void**)&g_option_error_quark, "g_option_error_quark", libs);
  gidLink(cast(void**)&g_parse_debug_string, "g_parse_debug_string", libs);
  gidLink(cast(void**)&g_path_get_basename, "g_path_get_basename", libs);
  gidLink(cast(void**)&g_path_get_dirname, "g_path_get_dirname", libs);
  gidLink(cast(void**)&g_path_is_absolute, "g_path_is_absolute", libs);
  gidLink(cast(void**)&g_path_skip_root, "g_path_skip_root", libs);
  gidLink(cast(void**)&g_pattern_match, "g_pattern_match", libs);
  gidLink(cast(void**)&g_pattern_match_simple, "g_pattern_match_simple", libs);
  gidLink(cast(void**)&g_pattern_match_string, "g_pattern_match_string", libs);
  gidLink(cast(void**)&g_pointer_bit_lock, "g_pointer_bit_lock", libs);
  gidLink(cast(void**)&g_pointer_bit_lock_and_get, "g_pointer_bit_lock_and_get", libs);
  gidLink(cast(void**)&g_pointer_bit_lock_mask_ptr, "g_pointer_bit_lock_mask_ptr", libs);
  gidLink(cast(void**)&g_pointer_bit_trylock, "g_pointer_bit_trylock", libs);
  gidLink(cast(void**)&g_pointer_bit_unlock, "g_pointer_bit_unlock", libs);
  gidLink(cast(void**)&g_pointer_bit_unlock_and_set, "g_pointer_bit_unlock_and_set", libs);
  gidLink(cast(void**)&g_poll, "g_poll", libs);
  gidLink(cast(void**)&g_prefix_error, "g_prefix_error", libs);
  gidLink(cast(void**)&g_prefix_error_literal, "g_prefix_error_literal", libs);
  gidLink(cast(void**)&g_print, "g_print", libs);
  gidLink(cast(void**)&g_printerr, "g_printerr", libs);
  gidLink(cast(void**)&g_printf, "g_printf", libs);
  gidLink(cast(void**)&g_printf_string_upper_bound, "g_printf_string_upper_bound", libs);
  gidLink(cast(void**)&g_propagate_error, "g_propagate_error", libs);
  gidLink(cast(void**)&g_propagate_prefixed_error, "g_propagate_prefixed_error", libs);
  gidLink(cast(void**)&g_qsort_with_data, "g_qsort_with_data", libs);
  gidLink(cast(void**)&g_quark_from_static_string, "g_quark_from_static_string", libs);
  gidLink(cast(void**)&g_quark_from_string, "g_quark_from_string", libs);
  gidLink(cast(void**)&g_quark_to_string, "g_quark_to_string", libs);
  gidLink(cast(void**)&g_quark_try_string, "g_quark_try_string", libs);
  gidLink(cast(void**)&g_random_double, "g_random_double", libs);
  gidLink(cast(void**)&g_random_double_range, "g_random_double_range", libs);
  gidLink(cast(void**)&g_random_int, "g_random_int", libs);
  gidLink(cast(void**)&g_random_int_range, "g_random_int_range", libs);
  gidLink(cast(void**)&g_random_set_seed, "g_random_set_seed", libs);
  gidLink(cast(void**)&g_rc_box_acquire, "g_rc_box_acquire", libs);
  gidLink(cast(void**)&g_rc_box_alloc, "g_rc_box_alloc", libs);
  gidLink(cast(void**)&g_rc_box_alloc0, "g_rc_box_alloc0", libs);
  gidLink(cast(void**)&g_rc_box_dup, "g_rc_box_dup", libs);
  gidLink(cast(void**)&g_rc_box_get_size, "g_rc_box_get_size", libs);
  gidLink(cast(void**)&g_rc_box_release, "g_rc_box_release", libs);
  gidLink(cast(void**)&g_rc_box_release_full, "g_rc_box_release_full", libs);
  gidLink(cast(void**)&g_realloc, "g_realloc", libs);
  gidLink(cast(void**)&g_realloc_n, "g_realloc_n", libs);
  gidLink(cast(void**)&g_ref_count_compare, "g_ref_count_compare", libs);
  gidLink(cast(void**)&g_ref_count_dec, "g_ref_count_dec", libs);
  gidLink(cast(void**)&g_ref_count_inc, "g_ref_count_inc", libs);
  gidLink(cast(void**)&g_ref_count_init, "g_ref_count_init", libs);
  gidLink(cast(void**)&g_ref_string_acquire, "g_ref_string_acquire", libs);
  gidLink(cast(void**)&g_ref_string_equal, "g_ref_string_equal", libs);
  gidLink(cast(void**)&g_ref_string_length, "g_ref_string_length", libs);
  gidLink(cast(void**)&g_ref_string_new, "g_ref_string_new", libs);
  gidLink(cast(void**)&g_ref_string_new_intern, "g_ref_string_new_intern", libs);
  gidLink(cast(void**)&g_ref_string_new_len, "g_ref_string_new_len", libs);
  gidLink(cast(void**)&g_ref_string_release, "g_ref_string_release", libs);
  gidLink(cast(void**)&g_reload_user_special_dirs_cache, "g_reload_user_special_dirs_cache", libs);
  gidLink(cast(void**)&g_remove, "g_remove", libs);
  gidLink(cast(void**)&g_rename, "g_rename", libs);
  gidLink(cast(void**)&g_return_if_fail_warning, "g_return_if_fail_warning", libs);
  gidLink(cast(void**)&g_rmdir, "g_rmdir", libs);
  gidLink(cast(void**)&g_set_application_name, "g_set_application_name", libs);
  gidLink(cast(void**)&g_set_error, "g_set_error", libs);
  gidLink(cast(void**)&g_set_error_literal, "g_set_error_literal", libs);
  gidLink(cast(void**)&g_set_prgname, "g_set_prgname", libs);
  gidLink(cast(void**)&g_set_print_handler, "g_set_print_handler", libs);
  gidLink(cast(void**)&g_set_printerr_handler, "g_set_printerr_handler", libs);
  gidLink(cast(void**)&g_setenv, "g_setenv", libs);
  gidLink(cast(void**)&g_shell_error_quark, "g_shell_error_quark", libs);
  gidLink(cast(void**)&g_shell_parse_argv, "g_shell_parse_argv", libs);
  gidLink(cast(void**)&g_shell_quote, "g_shell_quote", libs);
  gidLink(cast(void**)&g_shell_unquote, "g_shell_unquote", libs);
  gidLink(cast(void**)&g_slice_alloc, "g_slice_alloc", libs);
  gidLink(cast(void**)&g_slice_alloc0, "g_slice_alloc0", libs);
  gidLink(cast(void**)&g_slice_copy, "g_slice_copy", libs);
  gidLink(cast(void**)&g_slice_free1, "g_slice_free1", libs);
  gidLink(cast(void**)&g_slice_free_chain_with_offset, "g_slice_free_chain_with_offset", libs);
  gidLink(cast(void**)&g_slice_get_config, "g_slice_get_config", libs);
  gidLink(cast(void**)&g_slice_get_config_state, "g_slice_get_config_state", libs);
  gidLink(cast(void**)&g_slice_set_config, "g_slice_set_config", libs);
  gidLink(cast(void**)&g_snprintf, "g_snprintf", libs);
  gidLink(cast(void**)&g_sort_array, "g_sort_array", libs);
  gidLink(cast(void**)&g_spaced_primes_closest, "g_spaced_primes_closest", libs);
  gidLink(cast(void**)&g_spawn_async, "g_spawn_async", libs);
  gidLink(cast(void**)&g_spawn_async_with_fds, "g_spawn_async_with_fds", libs);
  gidLink(cast(void**)&g_spawn_async_with_pipes, "g_spawn_async_with_pipes", libs);
  gidLink(cast(void**)&g_spawn_async_with_pipes_and_fds, "g_spawn_async_with_pipes_and_fds", libs);
  gidLink(cast(void**)&g_spawn_check_exit_status, "g_spawn_check_exit_status", libs);
  gidLink(cast(void**)&g_spawn_check_wait_status, "g_spawn_check_wait_status", libs);
  gidLink(cast(void**)&g_spawn_close_pid, "g_spawn_close_pid", libs);
  gidLink(cast(void**)&g_spawn_command_line_async, "g_spawn_command_line_async", libs);
  gidLink(cast(void**)&g_spawn_command_line_sync, "g_spawn_command_line_sync", libs);
  gidLink(cast(void**)&g_spawn_error_quark, "g_spawn_error_quark", libs);
  gidLink(cast(void**)&g_spawn_exit_error_quark, "g_spawn_exit_error_quark", libs);
  gidLink(cast(void**)&g_spawn_sync, "g_spawn_sync", libs);
  gidLink(cast(void**)&g_sprintf, "g_sprintf", libs);
  gidLink(cast(void**)&g_stat, "g_stat", libs);
  gidLink(cast(void**)&g_stpcpy, "g_stpcpy", libs);
  gidLink(cast(void**)&g_str_equal, "g_str_equal", libs);
  gidLink(cast(void**)&g_str_has_prefix, "g_str_has_prefix", libs);
  gidLink(cast(void**)&g_str_has_suffix, "g_str_has_suffix", libs);
  gidLink(cast(void**)&g_str_hash, "g_str_hash", libs);
  gidLink(cast(void**)&g_str_is_ascii, "g_str_is_ascii", libs);
  gidLink(cast(void**)&g_str_match_string, "g_str_match_string", libs);
  gidLink(cast(void**)&g_str_to_ascii, "g_str_to_ascii", libs);
  gidLink(cast(void**)&g_str_tokenize_and_fold, "g_str_tokenize_and_fold", libs);
  gidLink(cast(void**)&g_strcanon, "g_strcanon", libs);
  gidLink(cast(void**)&g_strcasecmp, "g_strcasecmp", libs);
  gidLink(cast(void**)&g_strchomp, "g_strchomp", libs);
  gidLink(cast(void**)&g_strchug, "g_strchug", libs);
  gidLink(cast(void**)&g_strcmp0, "g_strcmp0", libs);
  gidLink(cast(void**)&g_strcompress, "g_strcompress", libs);
  gidLink(cast(void**)&g_strconcat, "g_strconcat", libs);
  gidLink(cast(void**)&g_strdelimit, "g_strdelimit", libs);
  gidLink(cast(void**)&g_strdown, "g_strdown", libs);
  gidLink(cast(void**)&g_strdup, "g_strdup", libs);
  gidLink(cast(void**)&g_strdup_printf, "g_strdup_printf", libs);
  gidLink(cast(void**)&g_strdup_vprintf, "g_strdup_vprintf", libs);
  gidLink(cast(void**)&g_strdupv, "g_strdupv", libs);
  gidLink(cast(void**)&g_strerror, "g_strerror", libs);
  gidLink(cast(void**)&g_strescape, "g_strescape", libs);
  gidLink(cast(void**)&g_strfreev, "g_strfreev", libs);
  gidLink(cast(void**)&g_strip_context, "g_strip_context", libs);
  gidLink(cast(void**)&g_strjoin, "g_strjoin", libs);
  gidLink(cast(void**)&g_strjoinv, "g_strjoinv", libs);
  gidLink(cast(void**)&g_strlcat, "g_strlcat", libs);
  gidLink(cast(void**)&g_strlcpy, "g_strlcpy", libs);
  gidLink(cast(void**)&g_strncasecmp, "g_strncasecmp", libs);
  gidLink(cast(void**)&g_strndup, "g_strndup", libs);
  gidLink(cast(void**)&g_strnfill, "g_strnfill", libs);
  gidLink(cast(void**)&g_strreverse, "g_strreverse", libs);
  gidLink(cast(void**)&g_strrstr, "g_strrstr", libs);
  gidLink(cast(void**)&g_strrstr_len, "g_strrstr_len", libs);
  gidLink(cast(void**)&g_strsignal, "g_strsignal", libs);
  gidLink(cast(void**)&g_strsplit, "g_strsplit", libs);
  gidLink(cast(void**)&g_strsplit_set, "g_strsplit_set", libs);
  gidLink(cast(void**)&g_strstr_len, "g_strstr_len", libs);
  gidLink(cast(void**)&g_strtod, "g_strtod", libs);
  gidLink(cast(void**)&g_strup, "g_strup", libs);
  gidLink(cast(void**)&g_strv_contains, "g_strv_contains", libs);
  gidLink(cast(void**)&g_strv_equal, "g_strv_equal", libs);
  gidLink(cast(void**)&g_strv_get_type, "g_strv_get_type", libs);
  gidLink(cast(void**)&g_strv_length, "g_strv_length", libs);
  gidLink(cast(void**)&g_test_add_data_func, "g_test_add_data_func", libs);
  gidLink(cast(void**)&g_test_add_data_func_full, "g_test_add_data_func_full", libs);
  gidLink(cast(void**)&g_test_add_func, "g_test_add_func", libs);
  gidLink(cast(void**)&g_test_add_vtable, "g_test_add_vtable", libs);
  gidLink(cast(void**)&g_test_assert_expected_messages_internal, "g_test_assert_expected_messages_internal", libs);
  gidLink(cast(void**)&g_test_bug, "g_test_bug", libs);
  gidLink(cast(void**)&g_test_bug_base, "g_test_bug_base", libs);
  gidLink(cast(void**)&g_test_build_filename, "g_test_build_filename", libs);
  gidLink(cast(void**)&g_test_create_case, "g_test_create_case", libs);
  gidLink(cast(void**)&g_test_create_suite, "g_test_create_suite", libs);
  gidLink(cast(void**)&g_test_disable_crash_reporting, "g_test_disable_crash_reporting", libs);
  gidLink(cast(void**)&g_test_expect_message, "g_test_expect_message", libs);
  gidLink(cast(void**)&g_test_fail, "g_test_fail", libs);
  gidLink(cast(void**)&g_test_fail_printf, "g_test_fail_printf", libs);
  gidLink(cast(void**)&g_test_failed, "g_test_failed", libs);
  gidLink(cast(void**)&g_test_get_dir, "g_test_get_dir", libs);
  gidLink(cast(void**)&g_test_get_filename, "g_test_get_filename", libs);
  gidLink(cast(void**)&g_test_get_path, "g_test_get_path", libs);
  gidLink(cast(void**)&g_test_get_root, "g_test_get_root", libs);
  gidLink(cast(void**)&g_test_incomplete, "g_test_incomplete", libs);
  gidLink(cast(void**)&g_test_incomplete_printf, "g_test_incomplete_printf", libs);
  gidLink(cast(void**)&g_test_init, "g_test_init", libs);
  gidLink(cast(void**)&g_test_log_set_fatal_handler, "g_test_log_set_fatal_handler", libs);
  gidLink(cast(void**)&g_test_log_type_name, "g_test_log_type_name", libs);
  gidLink(cast(void**)&g_test_maximized_result, "g_test_maximized_result", libs);
  gidLink(cast(void**)&g_test_message, "g_test_message", libs);
  gidLink(cast(void**)&g_test_minimized_result, "g_test_minimized_result", libs);
  gidLink(cast(void**)&g_test_queue_destroy, "g_test_queue_destroy", libs);
  gidLink(cast(void**)&g_test_queue_free, "g_test_queue_free", libs);
  gidLink(cast(void**)&g_test_rand_double, "g_test_rand_double", libs);
  gidLink(cast(void**)&g_test_rand_double_range, "g_test_rand_double_range", libs);
  gidLink(cast(void**)&g_test_rand_int, "g_test_rand_int", libs);
  gidLink(cast(void**)&g_test_rand_int_range, "g_test_rand_int_range", libs);
  gidLink(cast(void**)&g_test_run, "g_test_run", libs);
  gidLink(cast(void**)&g_test_run_suite, "g_test_run_suite", libs);
  gidLink(cast(void**)&g_test_set_nonfatal_assertions, "g_test_set_nonfatal_assertions", libs);
  gidLink(cast(void**)&g_test_skip, "g_test_skip", libs);
  gidLink(cast(void**)&g_test_skip_printf, "g_test_skip_printf", libs);
  gidLink(cast(void**)&g_test_subprocess, "g_test_subprocess", libs);
  gidLink(cast(void**)&g_test_summary, "g_test_summary", libs);
  gidLink(cast(void**)&g_test_timer_elapsed, "g_test_timer_elapsed", libs);
  gidLink(cast(void**)&g_test_timer_last, "g_test_timer_last", libs);
  gidLink(cast(void**)&g_test_timer_start, "g_test_timer_start", libs);
  gidLink(cast(void**)&g_test_trap_assertions, "g_test_trap_assertions", libs);
  gidLink(cast(void**)&g_test_trap_fork, "g_test_trap_fork", libs);
  gidLink(cast(void**)&g_test_trap_has_passed, "g_test_trap_has_passed", libs);
  gidLink(cast(void**)&g_test_trap_has_skipped, "g_test_trap_has_skipped", libs);
  gidLink(cast(void**)&g_test_trap_reached_timeout, "g_test_trap_reached_timeout", libs);
  gidLink(cast(void**)&g_test_trap_subprocess, "g_test_trap_subprocess", libs);
  gidLink(cast(void**)&g_test_trap_subprocess_with_envp, "g_test_trap_subprocess_with_envp", libs);
  gidLink(cast(void**)&g_timeout_add, "g_timeout_add", libs);
  gidLink(cast(void**)&g_timeout_add_full, "g_timeout_add_full", libs);
  gidLink(cast(void**)&g_timeout_add_once, "g_timeout_add_once", libs);
  gidLink(cast(void**)&g_timeout_add_seconds, "g_timeout_add_seconds", libs);
  gidLink(cast(void**)&g_timeout_add_seconds_full, "g_timeout_add_seconds_full", libs);
  gidLink(cast(void**)&g_timeout_add_seconds_once, "g_timeout_add_seconds_once", libs);
  gidLink(cast(void**)&g_timeout_source_new, "g_timeout_source_new", libs);
  gidLink(cast(void**)&g_timeout_source_new_seconds, "g_timeout_source_new_seconds", libs);
  gidLink(cast(void**)&g_try_malloc, "g_try_malloc", libs);
  gidLink(cast(void**)&g_try_malloc0, "g_try_malloc0", libs);
  gidLink(cast(void**)&g_try_malloc0_n, "g_try_malloc0_n", libs);
  gidLink(cast(void**)&g_try_malloc_n, "g_try_malloc_n", libs);
  gidLink(cast(void**)&g_try_realloc, "g_try_realloc", libs);
  gidLink(cast(void**)&g_try_realloc_n, "g_try_realloc_n", libs);
  gidLink(cast(void**)&g_ucs4_to_utf16, "g_ucs4_to_utf16", libs);
  gidLink(cast(void**)&g_ucs4_to_utf8, "g_ucs4_to_utf8", libs);
  gidLink(cast(void**)&g_unichar_break_type, "g_unichar_break_type", libs);
  gidLink(cast(void**)&g_unichar_combining_class, "g_unichar_combining_class", libs);
  gidLink(cast(void**)&g_unichar_compose, "g_unichar_compose", libs);
  gidLink(cast(void**)&g_unichar_decompose, "g_unichar_decompose", libs);
  gidLink(cast(void**)&g_unichar_digit_value, "g_unichar_digit_value", libs);
  gidLink(cast(void**)&g_unichar_fully_decompose, "g_unichar_fully_decompose", libs);
  gidLink(cast(void**)&g_unichar_get_mirror_char, "g_unichar_get_mirror_char", libs);
  gidLink(cast(void**)&g_unichar_get_script, "g_unichar_get_script", libs);
  gidLink(cast(void**)&g_unichar_isalnum, "g_unichar_isalnum", libs);
  gidLink(cast(void**)&g_unichar_isalpha, "g_unichar_isalpha", libs);
  gidLink(cast(void**)&g_unichar_iscntrl, "g_unichar_iscntrl", libs);
  gidLink(cast(void**)&g_unichar_isdefined, "g_unichar_isdefined", libs);
  gidLink(cast(void**)&g_unichar_isdigit, "g_unichar_isdigit", libs);
  gidLink(cast(void**)&g_unichar_isgraph, "g_unichar_isgraph", libs);
  gidLink(cast(void**)&g_unichar_islower, "g_unichar_islower", libs);
  gidLink(cast(void**)&g_unichar_ismark, "g_unichar_ismark", libs);
  gidLink(cast(void**)&g_unichar_isprint, "g_unichar_isprint", libs);
  gidLink(cast(void**)&g_unichar_ispunct, "g_unichar_ispunct", libs);
  gidLink(cast(void**)&g_unichar_isspace, "g_unichar_isspace", libs);
  gidLink(cast(void**)&g_unichar_istitle, "g_unichar_istitle", libs);
  gidLink(cast(void**)&g_unichar_isupper, "g_unichar_isupper", libs);
  gidLink(cast(void**)&g_unichar_iswide, "g_unichar_iswide", libs);
  gidLink(cast(void**)&g_unichar_iswide_cjk, "g_unichar_iswide_cjk", libs);
  gidLink(cast(void**)&g_unichar_isxdigit, "g_unichar_isxdigit", libs);
  gidLink(cast(void**)&g_unichar_iszerowidth, "g_unichar_iszerowidth", libs);
  gidLink(cast(void**)&g_unichar_to_utf8, "g_unichar_to_utf8", libs);
  gidLink(cast(void**)&g_unichar_tolower, "g_unichar_tolower", libs);
  gidLink(cast(void**)&g_unichar_totitle, "g_unichar_totitle", libs);
  gidLink(cast(void**)&g_unichar_toupper, "g_unichar_toupper", libs);
  gidLink(cast(void**)&g_unichar_type, "g_unichar_type", libs);
  gidLink(cast(void**)&g_unichar_validate, "g_unichar_validate", libs);
  gidLink(cast(void**)&g_unichar_xdigit_value, "g_unichar_xdigit_value", libs);
  gidLink(cast(void**)&g_unicode_canonical_decomposition, "g_unicode_canonical_decomposition", libs);
  gidLink(cast(void**)&g_unicode_canonical_ordering, "g_unicode_canonical_ordering", libs);
  gidLink(cast(void**)&g_unlink, "g_unlink", libs);
  gidLink(cast(void**)&g_unsetenv, "g_unsetenv", libs);
  gidLink(cast(void**)&g_usleep, "g_usleep", libs);
  gidLink(cast(void**)&g_utf16_to_ucs4, "g_utf16_to_ucs4", libs);
  gidLink(cast(void**)&g_utf16_to_utf8, "g_utf16_to_utf8", libs);
  gidLink(cast(void**)&g_utf8_casefold, "g_utf8_casefold", libs);
  gidLink(cast(void**)&g_utf8_collate, "g_utf8_collate", libs);
  gidLink(cast(void**)&g_utf8_collate_key, "g_utf8_collate_key", libs);
  gidLink(cast(void**)&g_utf8_collate_key_for_filename, "g_utf8_collate_key_for_filename", libs);
  gidLink(cast(void**)&g_utf8_find_next_char, "g_utf8_find_next_char", libs);
  gidLink(cast(void**)&g_utf8_find_prev_char, "g_utf8_find_prev_char", libs);
  gidLink(cast(void**)&g_utf8_get_char, "g_utf8_get_char", libs);
  gidLink(cast(void**)&g_utf8_get_char_validated, "g_utf8_get_char_validated", libs);
  gidLink(cast(void**)&g_utf8_make_valid, "g_utf8_make_valid", libs);
  gidLink(cast(void**)&g_utf8_normalize, "g_utf8_normalize", libs);
  gidLink(cast(void**)&g_utf8_offset_to_pointer, "g_utf8_offset_to_pointer", libs);
  gidLink(cast(void**)&g_utf8_pointer_to_offset, "g_utf8_pointer_to_offset", libs);
  gidLink(cast(void**)&g_utf8_prev_char, "g_utf8_prev_char", libs);
  gidLink(cast(void**)&g_utf8_strchr, "g_utf8_strchr", libs);
  gidLink(cast(void**)&g_utf8_strdown, "g_utf8_strdown", libs);
  gidLink(cast(void**)&g_utf8_strlen, "g_utf8_strlen", libs);
  gidLink(cast(void**)&g_utf8_strncpy, "g_utf8_strncpy", libs);
  gidLink(cast(void**)&g_utf8_strrchr, "g_utf8_strrchr", libs);
  gidLink(cast(void**)&g_utf8_strreverse, "g_utf8_strreverse", libs);
  gidLink(cast(void**)&g_utf8_strup, "g_utf8_strup", libs);
  gidLink(cast(void**)&g_utf8_substring, "g_utf8_substring", libs);
  gidLink(cast(void**)&g_utf8_to_ucs4, "g_utf8_to_ucs4", libs);
  gidLink(cast(void**)&g_utf8_to_ucs4_fast, "g_utf8_to_ucs4_fast", libs);
  gidLink(cast(void**)&g_utf8_to_utf16, "g_utf8_to_utf16", libs);
  gidLink(cast(void**)&g_utf8_truncate_middle, "g_utf8_truncate_middle", libs);
  gidLink(cast(void**)&g_utf8_validate, "g_utf8_validate", libs);
  gidLink(cast(void**)&g_utf8_validate_len, "g_utf8_validate_len", libs);
  gidLink(cast(void**)&g_uuid_string_is_valid, "g_uuid_string_is_valid", libs);
  gidLink(cast(void**)&g_uuid_string_random, "g_uuid_string_random", libs);
  gidLink(cast(void**)&g_variant_get_gtype, "g_variant_get_gtype", libs);
  gidLink(cast(void**)&g_vasprintf, "g_vasprintf", libs);
  gidLink(cast(void**)&g_vfprintf, "g_vfprintf", libs);
  gidLink(cast(void**)&g_vprintf, "g_vprintf", libs);
  gidLink(cast(void**)&g_vsnprintf, "g_vsnprintf", libs);
  gidLink(cast(void**)&g_vsprintf, "g_vsprintf", libs);
  gidLink(cast(void**)&g_warn_message, "g_warn_message", libs);

  // UnicodeScript
  gidLink(cast(void**)&g_unicode_script_from_iso15924, "g_unicode_script_from_iso15924", libs);
  gidLink(cast(void**)&g_unicode_script_to_iso15924, "g_unicode_script_to_iso15924", libs);
}
