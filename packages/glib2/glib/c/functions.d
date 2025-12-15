/// C functions for glib2 library
module glib.c.functions;

public import gid.basictypes;
import gid.loader;
import glib.c.types;
public import gobject.c.types;

version(Windows)
  private immutable LIBS = ["libgobject-2.0-0.dll;gobject-2.0-0.dll;gobject-2.dll", "libglib-2.0-0.dll;glib-2.0-0.dll;glib-2.dll"];
else version(OSX)
  private immutable LIBS = ["libgobject-2.0.0.dylib", "libglib-2.0.0.dylib"];
else
  private immutable LIBS = ["libgobject-2.0.so.0", "libglib-2.0.so.0"];

__gshared extern(C)
{
  // Allocator
  void function(GAllocator* allocator) c_g_allocator_free; ///
  GAllocator* function(const(char)* name, uint nPreallocs) c_g_allocator_new; ///

  // Array
  GType function() c_g_array_get_type; ///
  GArray* function(GArray* array, const(void)* data, uint len) c_g_array_append_vals; ///
  gboolean function(GArray* array, const(void)* target, GCompareFunc compareFunc, uint* outMatchIndex) c_g_array_binary_search; ///
  GArray* function(GArray* array) c_g_array_copy; ///
  char* function(GArray* array, gboolean freeSegment) c_g_array_free; ///
  uint function(GArray* array) c_g_array_get_element_size; ///
  GArray* function(GArray* array, uint index, const(void)* data, uint len) c_g_array_insert_vals; ///
  GArray* function(gboolean zeroTerminated, gboolean clear, uint elementSize) c_g_array_new; ///
  GArray* function(void* data, size_t len, gboolean clear, size_t elementSize) c_g_array_new_take; ///
  GArray* function(void* data, gboolean clear, size_t elementSize) c_g_array_new_take_zero_terminated; ///
  GArray* function(GArray* array, const(void)* data, uint len) c_g_array_prepend_vals; ///
  GArray* function(GArray* array) c_g_array_ref; ///
  GArray* function(GArray* array, uint index) c_g_array_remove_index; ///
  GArray* function(GArray* array, uint index) c_g_array_remove_index_fast; ///
  GArray* function(GArray* array, uint index, uint length) c_g_array_remove_range; ///
  void function(GArray* array, GDestroyNotify clearFunc) c_g_array_set_clear_func; ///
  GArray* function(GArray* array, uint length) c_g_array_set_size; ///
  GArray* function(gboolean zeroTerminated, gboolean clear, uint elementSize, uint reservedSize) c_g_array_sized_new; ///
  void function(GArray* array, GCompareFunc compareFunc) c_g_array_sort; ///
  void function(GArray* array, GCompareDataFunc compareFunc, void* userData) c_g_array_sort_with_data; ///
  void* function(GArray* array, size_t* len) c_g_array_steal; ///
  void function(GArray* array) c_g_array_unref; ///

  // AsyncQueue
  int function(GAsyncQueue* queue) c_g_async_queue_length; ///
  int function(GAsyncQueue* queue) c_g_async_queue_length_unlocked; ///
  void function(GAsyncQueue* queue) c_g_async_queue_lock; ///
  void* function(GAsyncQueue* queue) c_g_async_queue_pop; ///
  void* function(GAsyncQueue* queue) c_g_async_queue_pop_unlocked; ///
  void function(GAsyncQueue* queue, void* data) c_g_async_queue_push; ///
  void function(GAsyncQueue* queue, void* item) c_g_async_queue_push_front; ///
  void function(GAsyncQueue* queue, void* item) c_g_async_queue_push_front_unlocked; ///
  void function(GAsyncQueue* queue, void* data, GCompareDataFunc func, void* userData) c_g_async_queue_push_sorted; ///
  void function(GAsyncQueue* queue, void* data, GCompareDataFunc func, void* userData) c_g_async_queue_push_sorted_unlocked; ///
  void function(GAsyncQueue* queue, void* data) c_g_async_queue_push_unlocked; ///
  GAsyncQueue* function(GAsyncQueue* queue) c_g_async_queue_ref; ///
  void function(GAsyncQueue* queue) c_g_async_queue_ref_unlocked; ///
  gboolean function(GAsyncQueue* queue, void* item) c_g_async_queue_remove; ///
  gboolean function(GAsyncQueue* queue, void* item) c_g_async_queue_remove_unlocked; ///
  void function(GAsyncQueue* queue, GCompareDataFunc func, void* userData) c_g_async_queue_sort; ///
  void function(GAsyncQueue* queue, GCompareDataFunc func, void* userData) c_g_async_queue_sort_unlocked; ///
  void* function(GAsyncQueue* queue, GTimeVal* endTime) c_g_async_queue_timed_pop; ///
  void* function(GAsyncQueue* queue, GTimeVal* endTime) c_g_async_queue_timed_pop_unlocked; ///
  void* function(GAsyncQueue* queue, ulong timeout) c_g_async_queue_timeout_pop; ///
  void* function(GAsyncQueue* queue, ulong timeout) c_g_async_queue_timeout_pop_unlocked; ///
  void* function(GAsyncQueue* queue) c_g_async_queue_try_pop; ///
  void* function(GAsyncQueue* queue) c_g_async_queue_try_pop_unlocked; ///
  void function(GAsyncQueue* queue) c_g_async_queue_unlock; ///
  void function(GAsyncQueue* queue) c_g_async_queue_unref; ///
  void function(GAsyncQueue* queue) c_g_async_queue_unref_and_unlock; ///
  GAsyncQueue* function() c_g_async_queue_new; ///
  GAsyncQueue* function(GDestroyNotify itemFreeFunc) c_g_async_queue_new_full; ///

  // BookmarkFile
  GType function() c_g_bookmark_file_get_type; ///
  GBookmarkFile* function() c_g_bookmark_file_new; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec) c_g_bookmark_file_add_application; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group) c_g_bookmark_file_add_group; ///
  GBookmarkFile* function(GBookmarkFile* bookmark) c_g_bookmark_file_copy; ///
  void function(GBookmarkFile* bookmark) c_g_bookmark_file_free; ///
  long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_added; ///
  GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_added_date_time; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, char** exec, uint* count, long* stamp, GError** _err) c_g_bookmark_file_get_app_info; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, char** exec, uint* count, GDateTime** stamp, GError** _err) c_g_bookmark_file_get_application_info; ///
  char** function(GBookmarkFile* bookmark, const(char)* uri, size_t* length, GError** _err) c_g_bookmark_file_get_applications; ///
  char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_description; ///
  char** function(GBookmarkFile* bookmark, const(char)* uri, size_t* length, GError** _err) c_g_bookmark_file_get_groups; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, char** href, char** mimeType, GError** _err) c_g_bookmark_file_get_icon; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_is_private; ///
  char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_mime_type; ///
  long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_modified; ///
  GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_modified_date_time; ///
  int function(GBookmarkFile* bookmark) c_g_bookmark_file_get_size; ///
  char* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_title; ///
  char** function(GBookmarkFile* bookmark, size_t* length) c_g_bookmark_file_get_uris; ///
  long function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_visited; ///
  GDateTime* function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_get_visited_date_time; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, GError** _err) c_g_bookmark_file_has_application; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group, GError** _err) c_g_bookmark_file_has_group; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri) c_g_bookmark_file_has_item; ///
  gboolean function(GBookmarkFile* bookmark, const(ubyte)* data, size_t length, GError** _err) c_g_bookmark_file_load_from_data; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* file, char** fullPath, GError** _err) c_g_bookmark_file_load_from_data_dirs; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* filename, GError** _err) c_g_bookmark_file_load_from_file; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* oldUri, const(char)* newUri, GError** _err) c_g_bookmark_file_move_item; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, GError** _err) c_g_bookmark_file_remove_application; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* group, GError** _err) c_g_bookmark_file_remove_group; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, GError** _err) c_g_bookmark_file_remove_item; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, long added) c_g_bookmark_file_set_added; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* added) c_g_bookmark_file_set_added_date_time; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec, int count, long stamp, GError** _err) c_g_bookmark_file_set_app_info; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* uri, const(char)* name, const(char)* exec, int count, GDateTime* stamp, GError** _err) c_g_bookmark_file_set_application_info; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* description) c_g_bookmark_file_set_description; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char*)* groups, size_t length) c_g_bookmark_file_set_groups; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* href, const(char)* mimeType) c_g_bookmark_file_set_icon; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, gboolean isPrivate) c_g_bookmark_file_set_is_private; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* mimeType) c_g_bookmark_file_set_mime_type; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, long modified) c_g_bookmark_file_set_modified; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* modified) c_g_bookmark_file_set_modified_date_time; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, const(char)* title) c_g_bookmark_file_set_title; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, long visited) c_g_bookmark_file_set_visited; ///
  void function(GBookmarkFile* bookmark, const(char)* uri, GDateTime* visited) c_g_bookmark_file_set_visited_date_time; ///
  ubyte* function(GBookmarkFile* bookmark, size_t* length, GError** _err) c_g_bookmark_file_to_data; ///
  gboolean function(GBookmarkFile* bookmark, const(char)* filename, GError** _err) c_g_bookmark_file_to_file; ///
  GQuark function() c_g_bookmark_file_error_quark; ///

  // ByteArray
  GType function() c_g_byte_array_get_type; ///
  GByteArray* function(GByteArray* array, const(ubyte)* data, uint len) c_g_byte_array_append; ///
  ubyte* function(GByteArray* array, gboolean freeSegment) c_g_byte_array_free; ///
  GBytes* function(GByteArray* array) c_g_byte_array_free_to_bytes; ///
  GByteArray* function() c_g_byte_array_new; ///
  GByteArray* function(ubyte* data, size_t len) c_g_byte_array_new_take; ///
  GByteArray* function(GByteArray* array, const(ubyte)* data, uint len) c_g_byte_array_prepend; ///
  GByteArray* function(GByteArray* array) c_g_byte_array_ref; ///
  GByteArray* function(GByteArray* array, uint index) c_g_byte_array_remove_index; ///
  GByteArray* function(GByteArray* array, uint index) c_g_byte_array_remove_index_fast; ///
  GByteArray* function(GByteArray* array, uint index, uint length) c_g_byte_array_remove_range; ///
  GByteArray* function(GByteArray* array, uint length) c_g_byte_array_set_size; ///
  GByteArray* function(uint reservedSize) c_g_byte_array_sized_new; ///
  void function(GByteArray* array, GCompareFunc compareFunc) c_g_byte_array_sort; ///
  void function(GByteArray* array, GCompareDataFunc compareFunc, void* userData) c_g_byte_array_sort_with_data; ///
  ubyte* function(GByteArray* array, size_t* len) c_g_byte_array_steal; ///
  void function(GByteArray* array) c_g_byte_array_unref; ///

  // Bytes
  GType function() c_g_bytes_get_type; ///
  GBytes* function(const(void)* data, size_t size) c_g_bytes_new; ///
  GBytes* function(const(void)* data, size_t size) c_g_bytes_new_static; ///
  GBytes* function(void* data, size_t size) c_g_bytes_new_take; ///
  GBytes* function(const(void)* data, size_t size, GDestroyNotify freeFunc, void* userData) c_g_bytes_new_with_free_func; ///
  int function(GBytes* bytes1, GBytes* bytes2) c_g_bytes_compare; ///
  gboolean function(GBytes* bytes1, GBytes* bytes2) c_g_bytes_equal; ///
  const(void)* function(GBytes* bytes, size_t* size) c_g_bytes_get_data; ///
  const(void)* function(GBytes* bytes, size_t elementSize, size_t offset, size_t nElements) c_g_bytes_get_region; ///
  size_t function(GBytes* bytes) c_g_bytes_get_size; ///
  uint function(GBytes* bytes) c_g_bytes_hash; ///
  GBytes* function(GBytes* bytes, size_t offset, size_t length) c_g_bytes_new_from_bytes; ///
  GBytes* function(GBytes* bytes) c_g_bytes_ref; ///
  void function(GBytes* bytes) c_g_bytes_unref; ///
  GByteArray* function(GBytes* bytes) c_g_bytes_unref_to_array; ///
  void* function(GBytes* bytes, size_t* size) c_g_bytes_unref_to_data; ///

  // Cache
  void function(GCache* cache) c_g_cache_destroy; ///
  void* function(GCache* cache, void* key) c_g_cache_insert; ///
  void function(GCache* cache, GHFunc func, void* userData) c_g_cache_key_foreach; ///
  void function(GCache* cache, const(void)* value) c_g_cache_remove; ///
  void function(GCache* cache, GHFunc func, void* userData) c_g_cache_value_foreach; ///
  GCache* function(GCacheNewFunc valueNewFunc, GCacheDestroyFunc valueDestroyFunc, GCacheDupFunc keyDupFunc, GCacheDestroyFunc keyDestroyFunc, GHashFunc hashKeyFunc, GHashFunc hashValueFunc, GEqualFunc keyEqualFunc) c_g_cache_new; ///

  // Checksum
  GType function() c_g_checksum_get_type; ///
  GChecksum* function(GChecksumType checksumType) c_g_checksum_new; ///
  GChecksum* function(const(GChecksum)* checksum) c_g_checksum_copy; ///
  void function(GChecksum* checksum) c_g_checksum_free; ///
  void function(GChecksum* checksum, ubyte* buffer, size_t* digestLen) c_g_checksum_get_digest; ///
  const(char)* function(GChecksum* checksum) c_g_checksum_get_string; ///
  void function(GChecksum* checksum) c_g_checksum_reset; ///
  void function(GChecksum* checksum, const(ubyte)* data, ptrdiff_t length) c_g_checksum_update; ///
  ptrdiff_t function(GChecksumType checksumType) c_g_checksum_type_get_length; ///

  // Completion
  void function(GCompletion* cmp, GList* items) c_g_completion_add_items; ///
  void function(GCompletion* cmp) c_g_completion_clear_items; ///
  GList* function(GCompletion* cmp, const(char)* prefix, char** newPrefix) c_g_completion_complete; ///
  GList* function(GCompletion* cmp, const(char)* prefix, char** newPrefix) c_g_completion_complete_utf8; ///
  void function(GCompletion* cmp) c_g_completion_free; ///
  void function(GCompletion* cmp, GList* items) c_g_completion_remove_items; ///
  void function(GCompletion* cmp, GCompletionStrncmpFunc strncmpFunc) c_g_completion_set_compare; ///
  GCompletion* function(GCompletionFunc func) c_g_completion_new; ///

  // Cond
  void function(GCond* cond) c_g_cond_broadcast; ///
  void function(GCond* cond) c_g_cond_clear; ///
  void function(GCond* cond) c_g_cond_free; ///
  void function(GCond* cond) c_g_cond_init; ///
  void function(GCond* cond) c_g_cond_signal; ///
  gboolean function(GCond* cond, GMutex* mutex, GTimeVal* absTime) c_g_cond_timed_wait; ///
  void function(GCond* cond, GMutex* mutex) c_g_cond_wait; ///
  gboolean function(GCond* cond, GMutex* mutex, long endTime) c_g_cond_wait_until; ///
  GCond* function() c_g_cond_new; ///

  // Date
  GType function() c_g_date_get_type; ///
  GDate* function() c_g_date_new; ///
  GDate* function(GDateDay day, GDateMonth month, GDateYear year) c_g_date_new_dmy; ///
  GDate* function(uint julianDay) c_g_date_new_julian; ///
  void function(GDate* date, uint nDays) c_g_date_add_days; ///
  void function(GDate* date, uint nMonths) c_g_date_add_months; ///
  void function(GDate* date, uint nYears) c_g_date_add_years; ///
  void function(GDate* date, const(GDate)* minDate, const(GDate)* maxDate) c_g_date_clamp; ///
  void function(GDate* date, uint nDates) c_g_date_clear; ///
  int function(const(GDate)* lhs, const(GDate)* rhs) c_g_date_compare; ///
  GDate* function(const(GDate)* date) c_g_date_copy; ///
  int function(const(GDate)* date1, const(GDate)* date2) c_g_date_days_between; ///
  void function(GDate* date) c_g_date_free; ///
  GDateDay function(const(GDate)* date) c_g_date_get_day; ///
  uint function(const(GDate)* date) c_g_date_get_day_of_year; ///
  uint function(const(GDate)* date) c_g_date_get_iso8601_week_of_year; ///
  uint function(const(GDate)* date) c_g_date_get_julian; ///
  uint function(const(GDate)* date) c_g_date_get_monday_week_of_year; ///
  GDateMonth function(const(GDate)* date) c_g_date_get_month; ///
  uint function(const(GDate)* date) c_g_date_get_sunday_week_of_year; ///
  GDateWeekday function(const(GDate)* date) c_g_date_get_weekday; ///
  GDateYear function(const(GDate)* date) c_g_date_get_year; ///
  gboolean function(const(GDate)* date) c_g_date_is_first_of_month; ///
  gboolean function(const(GDate)* date) c_g_date_is_last_of_month; ///
  void function(GDate* date1, GDate* date2) c_g_date_order; ///
  void function(GDate* date, GDateDay day) c_g_date_set_day; ///
  void function(GDate* date, GDateDay day, GDateMonth month, GDateYear y) c_g_date_set_dmy; ///
  void function(GDate* date, uint julianDate) c_g_date_set_julian; ///
  void function(GDate* date, GDateMonth month) c_g_date_set_month; ///
  void function(GDate* date, const(char)* str) c_g_date_set_parse; ///
  void function(GDate* date, GTime time) c_g_date_set_time; ///
  void function(GDate* date, long timet) c_g_date_set_time_t; ///
  void function(GDate* date, GTimeVal* timeval) c_g_date_set_time_val; ///
  void function(GDate* date, GDateYear year) c_g_date_set_year; ///
  void function(GDate* date, uint nDays) c_g_date_subtract_days; ///
  void function(GDate* date, uint nMonths) c_g_date_subtract_months; ///
  void function(GDate* date, uint nYears) c_g_date_subtract_years; ///
  void function(const(GDate)* date, void* tm) c_g_date_to_struct_tm; ///
  gboolean function(const(GDate)* date) c_g_date_valid; ///
  ubyte function(GDateMonth month, GDateYear year) c_g_date_get_days_in_month; ///
  ubyte function(GDateYear year) c_g_date_get_monday_weeks_in_year; ///
  ubyte function(GDateYear year) c_g_date_get_sunday_weeks_in_year; ///
  gboolean function(GDateYear year) c_g_date_is_leap_year; ///
  size_t function(char* s, size_t slen, const(char)* format, const(GDate)* date) c_g_date_strftime; ///
  gboolean function(GDateDay day) c_g_date_valid_day; ///
  gboolean function(GDateDay day, GDateMonth month, GDateYear year) c_g_date_valid_dmy; ///
  gboolean function(uint julianDate) c_g_date_valid_julian; ///
  gboolean function(GDateMonth month) c_g_date_valid_month; ///
  gboolean function(GDateWeekday weekday) c_g_date_valid_weekday; ///
  gboolean function(GDateYear year) c_g_date_valid_year; ///

  // DateTime
  GType function() c_g_date_time_get_type; ///
  GDateTime* function(GTimeZone* tz, int year, int month, int day, int hour, int minute, double seconds) c_g_date_time_new; ///
  GDateTime* function(const(char)* text, GTimeZone* defaultTz) c_g_date_time_new_from_iso8601; ///
  GDateTime* function(const(GTimeVal)* tv) c_g_date_time_new_from_timeval_local; ///
  GDateTime* function(const(GTimeVal)* tv) c_g_date_time_new_from_timeval_utc; ///
  GDateTime* function(long t) c_g_date_time_new_from_unix_local; ///
  GDateTime* function(long usecs) c_g_date_time_new_from_unix_local_usec; ///
  GDateTime* function(long t) c_g_date_time_new_from_unix_utc; ///
  GDateTime* function(long usecs) c_g_date_time_new_from_unix_utc_usec; ///
  GDateTime* function(int year, int month, int day, int hour, int minute, double seconds) c_g_date_time_new_local; ///
  GDateTime* function(GTimeZone* tz) c_g_date_time_new_now; ///
  GDateTime* function() c_g_date_time_new_now_local; ///
  GDateTime* function() c_g_date_time_new_now_utc; ///
  GDateTime* function(int year, int month, int day, int hour, int minute, double seconds) c_g_date_time_new_utc; ///
  GDateTime* function(GDateTime* datetime, GTimeSpan timespan) c_g_date_time_add; ///
  GDateTime* function(GDateTime* datetime, int days) c_g_date_time_add_days; ///
  GDateTime* function(GDateTime* datetime, int years, int months, int days, int hours, int minutes, double seconds) c_g_date_time_add_full; ///
  GDateTime* function(GDateTime* datetime, int hours) c_g_date_time_add_hours; ///
  GDateTime* function(GDateTime* datetime, int minutes) c_g_date_time_add_minutes; ///
  GDateTime* function(GDateTime* datetime, int months) c_g_date_time_add_months; ///
  GDateTime* function(GDateTime* datetime, double seconds) c_g_date_time_add_seconds; ///
  GDateTime* function(GDateTime* datetime, int weeks) c_g_date_time_add_weeks; ///
  GDateTime* function(GDateTime* datetime, int years) c_g_date_time_add_years; ///
  int function(GDateTime* dt1, GDateTime* dt2) c_g_date_time_compare; ///
  GTimeSpan function(GDateTime* end, GDateTime* begin) c_g_date_time_difference; ///
  gboolean function(GDateTime* dt1, GDateTime* dt2) c_g_date_time_equal; ///
  char* function(GDateTime* datetime, const(char)* format) c_g_date_time_format; ///
  char* function(GDateTime* datetime) c_g_date_time_format_iso8601; ///
  int function(GDateTime* datetime) c_g_date_time_get_day_of_month; ///
  int function(GDateTime* datetime) c_g_date_time_get_day_of_week; ///
  int function(GDateTime* datetime) c_g_date_time_get_day_of_year; ///
  int function(GDateTime* datetime) c_g_date_time_get_hour; ///
  int function(GDateTime* datetime) c_g_date_time_get_microsecond; ///
  int function(GDateTime* datetime) c_g_date_time_get_minute; ///
  int function(GDateTime* datetime) c_g_date_time_get_month; ///
  int function(GDateTime* datetime) c_g_date_time_get_second; ///
  double function(GDateTime* datetime) c_g_date_time_get_seconds; ///
  GTimeZone* function(GDateTime* datetime) c_g_date_time_get_timezone; ///
  const(char)* function(GDateTime* datetime) c_g_date_time_get_timezone_abbreviation; ///
  GTimeSpan function(GDateTime* datetime) c_g_date_time_get_utc_offset; ///
  int function(GDateTime* datetime) c_g_date_time_get_week_numbering_year; ///
  int function(GDateTime* datetime) c_g_date_time_get_week_of_year; ///
  int function(GDateTime* datetime) c_g_date_time_get_year; ///
  void function(GDateTime* datetime, int* year, int* month, int* day) c_g_date_time_get_ymd; ///
  uint function(GDateTime* datetime) c_g_date_time_hash; ///
  gboolean function(GDateTime* datetime) c_g_date_time_is_daylight_savings; ///
  GDateTime* function(GDateTime* datetime) c_g_date_time_ref; ///
  GDateTime* function(GDateTime* datetime) c_g_date_time_to_local; ///
  gboolean function(GDateTime* datetime, GTimeVal* tv) c_g_date_time_to_timeval; ///
  GDateTime* function(GDateTime* datetime, GTimeZone* tz) c_g_date_time_to_timezone; ///
  long function(GDateTime* datetime) c_g_date_time_to_unix; ///
  long function(GDateTime* datetime) c_g_date_time_to_unix_usec; ///
  GDateTime* function(GDateTime* datetime) c_g_date_time_to_utc; ///
  void function(GDateTime* datetime) c_g_date_time_unref; ///

  // Dir
  GType function() c_g_dir_get_type; ///
  GDir* function(const(char)* path, uint flags, GError** _err) c_g_dir_open; ///
  void function(GDir* dir) c_g_dir_close; ///
  const(char)* function(GDir* dir) c_g_dir_read_name; ///
  GDir* function(GDir* dir) c_g_dir_ref; ///
  void function(GDir* dir) c_g_dir_rewind; ///
  void function(GDir* dir) c_g_dir_unref; ///
  char* function(const(char)* tmpl, GError** _err) c_g_dir_make_tmp; ///

  // ErrorWrap
  GType function() c_g_error_get_type; ///
  GError* function(GQuark domain, int code, const(char)* format,  ...) c_g_error_new; ///
  GError* function(GQuark domain, int code, const(char)* message) c_g_error_new_literal; ///
  GError* function(GQuark domain, int code, const(char)* format, void* args) c_g_error_new_valist; ///
  GError* function(const(GError)* error) c_g_error_copy; ///
  void function(GError* error) c_g_error_free; ///
  gboolean function(const(GError)* error, GQuark domain, int code) c_g_error_matches; ///
  GQuark function(const(char)* errorTypeName, size_t errorTypePrivateSize, GErrorInitFunc errorTypeInit, GErrorCopyFunc errorTypeCopy, GErrorClearFunc errorTypeClear) c_g_error_domain_register; ///
  GQuark function(const(char)* errorTypeName, size_t errorTypePrivateSize, GErrorInitFunc errorTypeInit, GErrorCopyFunc errorTypeCopy, GErrorClearFunc errorTypeClear) c_g_error_domain_register_static; ///

  // HashTable
  GType function() c_g_hash_table_get_type; ///
  gboolean function(GHashTable* hashTable, void* key) c_g_hash_table_add; ///
  gboolean function(GHashTable* hashTable, const(void)* key) c_g_hash_table_contains; ///
  void function(GHashTable* hashTable) c_g_hash_table_destroy; ///
  void* function(GHashTable* hashTable, GHRFunc predicate, void* userData) c_g_hash_table_find; ///
  void function(GHashTable* hashTable, GHFunc func, void* userData) c_g_hash_table_foreach; ///
  uint function(GHashTable* hashTable, GHRFunc func, void* userData) c_g_hash_table_foreach_remove; ///
  uint function(GHashTable* hashTable, GHRFunc func, void* userData) c_g_hash_table_foreach_steal; ///
  GList* function(GHashTable* hashTable) c_g_hash_table_get_keys; ///
  void** function(GHashTable* hashTable, uint* length) c_g_hash_table_get_keys_as_array; ///
  GPtrArray* function(GHashTable* hashTable) c_g_hash_table_get_keys_as_ptr_array; ///
  GList* function(GHashTable* hashTable) c_g_hash_table_get_values; ///
  GPtrArray* function(GHashTable* hashTable) c_g_hash_table_get_values_as_ptr_array; ///
  gboolean function(GHashTable* hashTable, void* key, void* value) c_g_hash_table_insert; ///
  void* function(GHashTable* hashTable, const(void)* key) c_g_hash_table_lookup; ///
  gboolean function(GHashTable* hashTable, const(void)* lookupKey, void** origKey, void** value) c_g_hash_table_lookup_extended; ///
  GHashTable* function(GHashFunc hashFunc, GEqualFunc keyEqualFunc) c_g_hash_table_new; ///
  GHashTable* function(GHashFunc hashFunc, GEqualFunc keyEqualFunc, GDestroyNotify keyDestroyFunc, GDestroyNotify valueDestroyFunc) c_g_hash_table_new_full; ///
  GHashTable* function(GHashTable* otherHashTable) c_g_hash_table_new_similar; ///
  GHashTable* function(GHashTable* hashTable) c_g_hash_table_ref; ///
  gboolean function(GHashTable* hashTable, const(void)* key) c_g_hash_table_remove; ///
  void function(GHashTable* hashTable) c_g_hash_table_remove_all; ///
  gboolean function(GHashTable* hashTable, void* key, void* value) c_g_hash_table_replace; ///
  uint function(GHashTable* hashTable) c_g_hash_table_size; ///
  gboolean function(GHashTable* hashTable, const(void)* key) c_g_hash_table_steal; ///
  void function(GHashTable* hashTable) c_g_hash_table_steal_all; ///
  GPtrArray* function(GHashTable* hashTable) c_g_hash_table_steal_all_keys; ///
  GPtrArray* function(GHashTable* hashTable) c_g_hash_table_steal_all_values; ///
  gboolean function(GHashTable* hashTable, const(void)* lookupKey, void** stolenKey, void** stolenValue) c_g_hash_table_steal_extended; ///
  void function(GHashTable* hashTable) c_g_hash_table_unref; ///

  // HashTableIter
  GHashTable* function(GHashTableIter* iter) c_g_hash_table_iter_get_hash_table; ///
  void function(GHashTableIter* iter, GHashTable* hashTable) c_g_hash_table_iter_init; ///
  gboolean function(GHashTableIter* iter, void** key, void** value) c_g_hash_table_iter_next; ///
  void function(GHashTableIter* iter) c_g_hash_table_iter_remove; ///
  void function(GHashTableIter* iter, void* value) c_g_hash_table_iter_replace; ///
  void function(GHashTableIter* iter) c_g_hash_table_iter_steal; ///

  // Hmac
  GType function() c_g_hmac_get_type; ///
  GHmac* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen) c_g_hmac_new; ///
  GHmac* function(const(GHmac)* hmac) c_g_hmac_copy; ///
  void function(GHmac* hmac, ubyte* buffer, size_t* digestLen) c_g_hmac_get_digest; ///
  const(char)* function(GHmac* hmac) c_g_hmac_get_string; ///
  GHmac* function(GHmac* hmac) c_g_hmac_ref; ///
  void function(GHmac* hmac) c_g_hmac_unref; ///
  void function(GHmac* hmac, const(ubyte)* data, ptrdiff_t length) c_g_hmac_update; ///

  // Hook
  int function(GHook* newHook, GHook* sibling) c_g_hook_compare_ids; ///
  GHook* function(GHookList* hookList) c_g_hook_alloc; ///
  gboolean function(GHookList* hookList, gulong hookId) c_g_hook_destroy; ///
  void function(GHookList* hookList, GHook* hook) c_g_hook_destroy_link; ///
  GHook* function(GHookList* hookList, gboolean needValids, GHookFindFunc func, void* data) c_g_hook_find; ///
  GHook* function(GHookList* hookList, gboolean needValids, void* data) c_g_hook_find_data; ///
  GHook* function(GHookList* hookList, gboolean needValids, void* func) c_g_hook_find_func; ///
  GHook* function(GHookList* hookList, gboolean needValids, void* func, void* data) c_g_hook_find_func_data; ///
  GHook* function(GHookList* hookList, gboolean mayBeInCall) c_g_hook_first_valid; ///
  void function(GHookList* hookList, GHook* hook) c_g_hook_free; ///
  GHook* function(GHookList* hookList, gulong hookId) c_g_hook_get; ///
  void function(GHookList* hookList, GHook* sibling, GHook* hook) c_g_hook_insert_before; ///
  void function(GHookList* hookList, GHook* hook, GHookCompareFunc func) c_g_hook_insert_sorted; ///
  GHook* function(GHookList* hookList, GHook* hook, gboolean mayBeInCall) c_g_hook_next_valid; ///
  void function(GHookList* hookList, GHook* hook) c_g_hook_prepend; ///
  GHook* function(GHookList* hookList, GHook* hook) c_g_hook_ref; ///
  void function(GHookList* hookList, GHook* hook) c_g_hook_unref; ///

  // HookList
  void function(GHookList* hookList) c_g_hook_list_clear; ///
  void function(GHookList* hookList, uint hookSize) c_g_hook_list_init; ///
  void function(GHookList* hookList, gboolean mayRecurse) c_g_hook_list_invoke; ///
  void function(GHookList* hookList, gboolean mayRecurse) c_g_hook_list_invoke_check; ///
  void function(GHookList* hookList, gboolean mayRecurse, GHookMarshaller marshaller, void* marshalData) c_g_hook_list_marshal; ///
  void function(GHookList* hookList, gboolean mayRecurse, GHookCheckMarshaller marshaller, void* marshalData) c_g_hook_list_marshal_check; ///

  // IOChannel
  GType function() c_g_io_channel_get_type; ///
  GIOChannel* function(const(char)* filename, const(char)* mode, GError** _err) c_g_io_channel_new_file; ///
  GIOChannel* function(int fd) c_g_io_channel_unix_new; ///
  void function(GIOChannel* channel) c_g_io_channel_close; ///
  GIOStatus function(GIOChannel* channel, GError** _err) c_g_io_channel_flush; ///
  GIOCondition function(GIOChannel* channel) c_g_io_channel_get_buffer_condition; ///
  size_t function(GIOChannel* channel) c_g_io_channel_get_buffer_size; ///
  gboolean function(GIOChannel* channel) c_g_io_channel_get_buffered; ///
  gboolean function(GIOChannel* channel) c_g_io_channel_get_close_on_unref; ///
  const(char)* function(GIOChannel* channel) c_g_io_channel_get_encoding; ///
  GIOFlags function(GIOChannel* channel) c_g_io_channel_get_flags; ///
  const(char)* function(GIOChannel* channel, int* length) c_g_io_channel_get_line_term; ///
  void function(GIOChannel* channel) c_g_io_channel_init; ///
  GIOError function(GIOChannel* channel, ubyte* buf, size_t count, size_t* bytesRead) c_g_io_channel_read; ///
  GIOStatus function(GIOChannel* channel, ubyte* buf, size_t count, size_t* bytesRead, GError** _err) c_g_io_channel_read_chars; ///
  GIOStatus function(GIOChannel* channel, char** strReturn, size_t* length, size_t* terminatorPos, GError** _err) c_g_io_channel_read_line; ///
  GIOStatus function(GIOChannel* channel, GString* buffer, size_t* terminatorPos, GError** _err) c_g_io_channel_read_line_string; ///
  GIOStatus function(GIOChannel* channel, ubyte** strReturn, size_t* length, GError** _err) c_g_io_channel_read_to_end; ///
  GIOStatus function(GIOChannel* channel, dchar* thechar, GError** _err) c_g_io_channel_read_unichar; ///
  GIOChannel* function(GIOChannel* channel) c_g_io_channel_ref; ///
  GIOError function(GIOChannel* channel, long offset, GSeekType type) c_g_io_channel_seek; ///
  GIOStatus function(GIOChannel* channel, long offset, GSeekType type, GError** _err) c_g_io_channel_seek_position; ///
  void function(GIOChannel* channel, size_t size) c_g_io_channel_set_buffer_size; ///
  void function(GIOChannel* channel, gboolean buffered) c_g_io_channel_set_buffered; ///
  void function(GIOChannel* channel, gboolean doClose) c_g_io_channel_set_close_on_unref; ///
  GIOStatus function(GIOChannel* channel, const(char)* encoding, GError** _err) c_g_io_channel_set_encoding; ///
  GIOStatus function(GIOChannel* channel, GIOFlags flags, GError** _err) c_g_io_channel_set_flags; ///
  void function(GIOChannel* channel, const(char)* lineTerm, int length) c_g_io_channel_set_line_term; ///
  GIOStatus function(GIOChannel* channel, gboolean flush, GError** _err) c_g_io_channel_shutdown; ///
  int function(GIOChannel* channel) c_g_io_channel_unix_get_fd; ///
  void function(GIOChannel* channel) c_g_io_channel_unref; ///
  GIOError function(GIOChannel* channel, const(char)* buf, size_t count, size_t* bytesWritten) c_g_io_channel_write; ///
  GIOStatus function(GIOChannel* channel, const(ubyte)* buf, ptrdiff_t count, size_t* bytesWritten, GError** _err) c_g_io_channel_write_chars; ///
  GIOStatus function(GIOChannel* channel, dchar thechar, GError** _err) c_g_io_channel_write_unichar; ///
  GIOChannelError function(int en) c_g_io_channel_error_from_errno; ///
  GQuark function() c_g_io_channel_error_quark; ///

  // KeyFile
  GType function() c_g_key_file_get_type; ///
  GKeyFile* function() c_g_key_file_new; ///
  void function(GKeyFile* keyFile) c_g_key_file_free; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_boolean; ///
  gboolean* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) c_g_key_file_get_boolean_list; ///
  char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_comment; ///
  double function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_double; ///
  double* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) c_g_key_file_get_double_list; ///
  char** function(GKeyFile* keyFile, size_t* length) c_g_key_file_get_groups; ///
  long function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_int64; ///
  int function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_integer; ///
  int* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) c_g_key_file_get_integer_list; ///
  char** function(GKeyFile* keyFile, const(char)* groupName, size_t* length, GError** _err) c_g_key_file_get_keys; ///
  char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale) c_g_key_file_get_locale_for_key; ///
  char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, GError** _err) c_g_key_file_get_locale_string; ///
  char** function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, size_t* length, GError** _err) c_g_key_file_get_locale_string_list; ///
  char* function(GKeyFile* keyFile) c_g_key_file_get_start_group; ///
  char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_string; ///
  char** function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, size_t* length, GError** _err) c_g_key_file_get_string_list; ///
  ulong function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_uint64; ///
  char* function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_get_value; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName) c_g_key_file_has_group; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_has_key; ///
  gboolean function(GKeyFile* keyFile, GBytes* bytes, GKeyFileFlags flags, GError** _err) c_g_key_file_load_from_bytes; ///
  gboolean function(GKeyFile* keyFile, const(char)* data, size_t length, GKeyFileFlags flags, GError** _err) c_g_key_file_load_from_data; ///
  gboolean function(GKeyFile* keyFile, const(char)* file, char** fullPath, GKeyFileFlags flags, GError** _err) c_g_key_file_load_from_data_dirs; ///
  gboolean function(GKeyFile* keyFile, const(char)* file, const(char*)* searchDirs, char** fullPath, GKeyFileFlags flags, GError** _err) c_g_key_file_load_from_dirs; ///
  gboolean function(GKeyFile* keyFile, const(char)* file, GKeyFileFlags flags, GError** _err) c_g_key_file_load_from_file; ///
  GKeyFile* function(GKeyFile* keyFile) c_g_key_file_ref; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_remove_comment; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, GError** _err) c_g_key_file_remove_group; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, GError** _err) c_g_key_file_remove_key; ///
  gboolean function(GKeyFile* keyFile, const(char)* filename, GError** _err) c_g_key_file_save_to_file; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, gboolean value) c_g_key_file_set_boolean; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, gboolean* list, size_t length) c_g_key_file_set_boolean_list; ///
  gboolean function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* comment, GError** _err) c_g_key_file_set_comment; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, double value) c_g_key_file_set_double; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, double* list, size_t length) c_g_key_file_set_double_list; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, long value) c_g_key_file_set_int64; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, int value) c_g_key_file_set_integer; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, int* list, size_t length) c_g_key_file_set_integer_list; ///
  void function(GKeyFile* keyFile, char separator) c_g_key_file_set_list_separator; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, const(char)* string_) c_g_key_file_set_locale_string; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* locale, const(char*)* list, size_t length) c_g_key_file_set_locale_string_list; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* string_) c_g_key_file_set_string; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char*)* list, size_t length) c_g_key_file_set_string_list; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, ulong value) c_g_key_file_set_uint64; ///
  void function(GKeyFile* keyFile, const(char)* groupName, const(char)* key, const(char)* value) c_g_key_file_set_value; ///
  char* function(GKeyFile* keyFile, size_t* length, GError** _err) c_g_key_file_to_data; ///
  void function(GKeyFile* keyFile) c_g_key_file_unref; ///
  GQuark function() c_g_key_file_error_quark; ///

  // List
  GList* function() c_g_list_alloc; ///
  GList* function(GList* list, void* data) c_g_list_append; ///
  GList* function(GList* list1, GList* list2) c_g_list_concat; ///
  GList* function(GList* list) c_g_list_copy; ///
  GList* function(GList* list, GCopyFunc func, void* userData) c_g_list_copy_deep; ///
  GList* function(GList* list, GList* link) c_g_list_delete_link; ///
  GList* function(GList* list, const(void)* data) c_g_list_find; ///
  GList* function(GList* list, const(void)* data, GCompareFunc func) c_g_list_find_custom; ///
  GList* function(GList* list) c_g_list_first; ///
  void function(GList* list, GFunc func, void* userData) c_g_list_foreach; ///
  void function(GList* list) c_g_list_free; ///
  void function(GList* list) c_g_list_free_1; ///
  void function(GList* list, GDestroyNotify freeFunc) c_g_list_free_full; ///
  int function(GList* list, const(void)* data) c_g_list_index; ///
  GList* function(GList* list, void* data, int position) c_g_list_insert; ///
  GList* function(GList* list, GList* sibling, void* data) c_g_list_insert_before; ///
  GList* function(GList* list, GList* sibling, GList* link) c_g_list_insert_before_link; ///
  GList* function(GList* list, void* data, GCompareFunc func) c_g_list_insert_sorted; ///
  GList* function(GList* list, void* data, GCompareDataFunc func, void* userData) c_g_list_insert_sorted_with_data; ///
  GList* function(GList* list) c_g_list_last; ///
  uint function(GList* list) c_g_list_length; ///
  GList* function(GList* list, uint n) c_g_list_nth; ///
  void* function(GList* list, uint n) c_g_list_nth_data; ///
  GList* function(GList* list, uint n) c_g_list_nth_prev; ///
  void function() c_g_list_pop_allocator; ///
  int function(GList* list, GList* llink) c_g_list_position; ///
  GList* function(GList* list, void* data) c_g_list_prepend; ///
  void function(GAllocator* allocator) c_g_list_push_allocator; ///
  GList* function(GList* list, const(void)* data) c_g_list_remove; ///
  GList* function(GList* list, const(void)* data) c_g_list_remove_all; ///
  GList* function(GList* list, GList* llink) c_g_list_remove_link; ///
  GList* function(GList* list) c_g_list_reverse; ///
  GList* function(GList* list, GCompareFunc compareFunc) c_g_list_sort; ///
  GList* function(GList* list, GCompareDataFunc compareFunc, void* userData) c_g_list_sort_with_data; ///

  // MainContext
  GType function() c_g_main_context_get_type; ///
  GMainContext* function() c_g_main_context_new; ///
  GMainContext* function(GMainContextFlags flags) c_g_main_context_new_with_flags; ///
  gboolean function(GMainContext* context) c_g_main_context_acquire; ///
  void function(GMainContext* context, GPollFD* fd, int priority) c_g_main_context_add_poll; ///
  gboolean function(GMainContext* context, int maxPriority, GPollFD* fds, int nFds) c_g_main_context_check; ///
  void function(GMainContext* context) c_g_main_context_dispatch; ///
  GSource* function(GMainContext* context, GSourceFuncs* funcs, void* userData) c_g_main_context_find_source_by_funcs_user_data; ///
  GSource* function(GMainContext* context, uint sourceId) c_g_main_context_find_source_by_id; ///
  GSource* function(GMainContext* context, void* userData) c_g_main_context_find_source_by_user_data; ///
  GPollFunc function(GMainContext* context) c_g_main_context_get_poll_func; ///
  void function(GMainContext* context, GSourceFunc function_, void* data) c_g_main_context_invoke; ///
  void function(GMainContext* context, int priority, GSourceFunc function_, void* data, GDestroyNotify notify) c_g_main_context_invoke_full; ///
  gboolean function(GMainContext* context) c_g_main_context_is_owner; ///
  gboolean function(GMainContext* context, gboolean mayBlock) c_g_main_context_iteration; ///
  gboolean function(GMainContext* context) c_g_main_context_pending; ///
  void function(GMainContext* context) c_g_main_context_pop_thread_default; ///
  gboolean function(GMainContext* context, int* priority) c_g_main_context_prepare; ///
  void function(GMainContext* context) c_g_main_context_push_thread_default; ///
  int function(GMainContext* context, int maxPriority, int* timeout, GPollFD* fds, int nFds) c_g_main_context_query; ///
  GMainContext* function(GMainContext* context) c_g_main_context_ref; ///
  void function(GMainContext* context) c_g_main_context_release; ///
  void function(GMainContext* context, GPollFD* fd) c_g_main_context_remove_poll; ///
  void function(GMainContext* context, GPollFunc func) c_g_main_context_set_poll_func; ///
  void function(GMainContext* context) c_g_main_context_unref; ///
  gboolean function(GMainContext* context, GCond* cond, GMutex* mutex) c_g_main_context_wait; ///
  void function(GMainContext* context) c_g_main_context_wakeup; ///
  GMainContext* function() c_g_main_context_default; ///
  GMainContext* function() c_g_main_context_get_thread_default; ///
  GMainContext* function() c_g_main_context_ref_thread_default; ///

  // MainLoop
  GType function() c_g_main_loop_get_type; ///
  GMainLoop* function(GMainContext* context, gboolean isRunning) c_g_main_loop_new; ///
  GMainContext* function(GMainLoop* loop) c_g_main_loop_get_context; ///
  gboolean function(GMainLoop* loop) c_g_main_loop_is_running; ///
  void function(GMainLoop* loop) c_g_main_loop_quit; ///
  GMainLoop* function(GMainLoop* loop) c_g_main_loop_ref; ///
  void function(GMainLoop* loop) c_g_main_loop_run; ///
  void function(GMainLoop* loop) c_g_main_loop_unref; ///

  // MappedFile
  GType function() c_g_mapped_file_get_type; ///
  GMappedFile* function(const(char)* filename, gboolean writable, GError** _err) c_g_mapped_file_new; ///
  GMappedFile* function(int fd, gboolean writable, GError** _err) c_g_mapped_file_new_from_fd; ///
  void function(GMappedFile* file) c_g_mapped_file_free; ///
  GBytes* function(GMappedFile* file) c_g_mapped_file_get_bytes; ///
  char* function(GMappedFile* file) c_g_mapped_file_get_contents; ///
  size_t function(GMappedFile* file) c_g_mapped_file_get_length; ///
  GMappedFile* function(GMappedFile* file) c_g_mapped_file_ref; ///
  void function(GMappedFile* file) c_g_mapped_file_unref; ///

  // MarkupParseContext
  GType function() c_g_markup_parse_context_get_type; ///
  GMarkupParseContext* function(const(GMarkupParser)* parser, GMarkupParseFlags flags, void* userData, GDestroyNotify userDataDnotify) c_g_markup_parse_context_new; ///
  gboolean function(GMarkupParseContext* context, GError** _err) c_g_markup_parse_context_end_parse; ///
  void function(GMarkupParseContext* context) c_g_markup_parse_context_free; ///
  const(char)* function(GMarkupParseContext* context) c_g_markup_parse_context_get_element; ///
  const(GSList)* function(GMarkupParseContext* context) c_g_markup_parse_context_get_element_stack; ///
  void function(GMarkupParseContext* context, int* lineNumber, int* charNumber) c_g_markup_parse_context_get_position; ///
  void* function(GMarkupParseContext* context) c_g_markup_parse_context_get_user_data; ///
  gboolean function(GMarkupParseContext* context, const(char)* text, ptrdiff_t textLen, GError** _err) c_g_markup_parse_context_parse; ///
  void* function(GMarkupParseContext* context) c_g_markup_parse_context_pop; ///
  void function(GMarkupParseContext* context, const(GMarkupParser)* parser, void* userData) c_g_markup_parse_context_push; ///
  GMarkupParseContext* function(GMarkupParseContext* context) c_g_markup_parse_context_ref; ///
  void function(GMarkupParseContext* context) c_g_markup_parse_context_unref; ///

  // MatchInfo
  GType function() c_g_match_info_get_type; ///
  char* function(const(GMatchInfo)* matchInfo, const(char)* stringToExpand, GError** _err) c_g_match_info_expand_references; ///
  char* function(const(GMatchInfo)* matchInfo, int matchNum) c_g_match_info_fetch; ///
  char** function(const(GMatchInfo)* matchInfo) c_g_match_info_fetch_all; ///
  char* function(const(GMatchInfo)* matchInfo, const(char)* name) c_g_match_info_fetch_named; ///
  gboolean function(const(GMatchInfo)* matchInfo, const(char)* name, int* startPos, int* endPos) c_g_match_info_fetch_named_pos; ///
  gboolean function(const(GMatchInfo)* matchInfo, int matchNum, int* startPos, int* endPos) c_g_match_info_fetch_pos; ///
  void function(GMatchInfo* matchInfo) c_g_match_info_free; ///
  int function(const(GMatchInfo)* matchInfo) c_g_match_info_get_match_count; ///
  GRegex* function(const(GMatchInfo)* matchInfo) c_g_match_info_get_regex; ///
  const(char)* function(const(GMatchInfo)* matchInfo) c_g_match_info_get_string; ///
  gboolean function(const(GMatchInfo)* matchInfo) c_g_match_info_is_partial_match; ///
  gboolean function(const(GMatchInfo)* matchInfo) c_g_match_info_matches; ///
  gboolean function(GMatchInfo* matchInfo, GError** _err) c_g_match_info_next; ///
  GMatchInfo* function(GMatchInfo* matchInfo) c_g_match_info_ref; ///
  void function(GMatchInfo* matchInfo) c_g_match_info_unref; ///

  // MemChunk
  void* function(GMemChunk* memChunk) c_g_mem_chunk_alloc; ///
  void* function(GMemChunk* memChunk) c_g_mem_chunk_alloc0; ///
  void function(GMemChunk* memChunk) c_g_mem_chunk_clean; ///
  void function(GMemChunk* memChunk) c_g_mem_chunk_destroy; ///
  void function(GMemChunk* memChunk, void* mem) c_g_mem_chunk_free; ///
  void function(GMemChunk* memChunk) c_g_mem_chunk_print; ///
  void function(GMemChunk* memChunk) c_g_mem_chunk_reset; ///
  void function() c_g_mem_chunk_info; ///
  GMemChunk* function(const(char)* name, int atomSize, size_t areaSize, int type) c_g_mem_chunk_new; ///

  // Mutex
  void function(GMutex* mutex) c_g_mutex_clear; ///
  void function(GMutex* mutex) c_g_mutex_free; ///
  void function(GMutex* mutex) c_g_mutex_init; ///
  void function(GMutex* mutex) c_g_mutex_lock; ///
  gboolean function(GMutex* mutex) c_g_mutex_trylock; ///
  void function(GMutex* mutex) c_g_mutex_unlock; ///
  GMutex* function() c_g_mutex_new; ///

  // Node
  int function(GNode* node, void* data) c_g_node_child_index; ///
  int function(GNode* node, GNode* child) c_g_node_child_position; ///
  void function(GNode* node, GTraverseFlags flags, GNodeForeachFunc func, void* data) c_g_node_children_foreach; ///
  GNode* function(GNode* node) c_g_node_copy; ///
  GNode* function(GNode* node, GCopyFunc copyFunc, void* data) c_g_node_copy_deep; ///
  uint function(GNode* node) c_g_node_depth; ///
  void function(GNode* root) c_g_node_destroy; ///
  GNode* function(GNode* root, GTraverseType order, GTraverseFlags flags, void* data) c_g_node_find; ///
  GNode* function(GNode* node, GTraverseFlags flags, void* data) c_g_node_find_child; ///
  GNode* function(GNode* node) c_g_node_first_sibling; ///
  GNode* function(GNode* node) c_g_node_get_root; ///
  GNode* function(GNode* parent, int position, GNode* node) c_g_node_insert; ///
  GNode* function(GNode* parent, GNode* sibling, GNode* node) c_g_node_insert_after; ///
  GNode* function(GNode* parent, GNode* sibling, GNode* node) c_g_node_insert_before; ///
  gboolean function(GNode* node, GNode* descendant) c_g_node_is_ancestor; ///
  GNode* function(GNode* node) c_g_node_last_child; ///
  GNode* function(GNode* node) c_g_node_last_sibling; ///
  uint function(GNode* root) c_g_node_max_height; ///
  uint function(GNode* node) c_g_node_n_children; ///
  uint function(GNode* root, GTraverseFlags flags) c_g_node_n_nodes; ///
  GNode* function(GNode* node, uint n) c_g_node_nth_child; ///
  GNode* function(GNode* parent, GNode* node) c_g_node_prepend; ///
  void function(GNode* node) c_g_node_reverse_children; ///
  void function(GNode* root, GTraverseType order, GTraverseFlags flags, int maxDepth, GNodeTraverseFunc func, void* data) c_g_node_traverse; ///
  void function(GNode* node) c_g_node_unlink; ///
  GNode* function(void* data) c_g_node_new; ///
  void function() c_g_node_pop_allocator; ///
  void function(GAllocator* allocator) c_g_node_push_allocator; ///

  // Once
  void* function(GOnce* once, GThreadFunc func, void* arg) c_g_once_impl; ///
  gboolean function(void* location) c_g_once_init_enter; ///
  gboolean function(size_t* location) c_g_once_init_enter_impl; ///
  gboolean function(void* location) c_g_once_init_enter_pointer; ///
  void function(void* location, size_t result) c_g_once_init_leave; ///
  void function(void* location, void* result) c_g_once_init_leave_pointer; ///

  // OptionContext
  void function(GOptionContext* context, GOptionGroup* group) c_g_option_context_add_group; ///
  void function(GOptionContext* context, const(GOptionEntry)* entries, const(char)* translationDomain) c_g_option_context_add_main_entries; ///
  void function(GOptionContext* context) c_g_option_context_free; ///
  const(char)* function(GOptionContext* context) c_g_option_context_get_description; ///
  char* function(GOptionContext* context, gboolean mainHelp, GOptionGroup* group) c_g_option_context_get_help; ///
  gboolean function(GOptionContext* context) c_g_option_context_get_help_enabled; ///
  gboolean function(GOptionContext* context) c_g_option_context_get_ignore_unknown_options; ///
  GOptionGroup* function(GOptionContext* context) c_g_option_context_get_main_group; ///
  gboolean function(GOptionContext* context) c_g_option_context_get_strict_posix; ///
  const(char)* function(GOptionContext* context) c_g_option_context_get_summary; ///
  gboolean function(GOptionContext* context, int* argc, char*** argv, GError** _err) c_g_option_context_parse; ///
  gboolean function(GOptionContext* context, char*** arguments, GError** _err) c_g_option_context_parse_strv; ///
  void function(GOptionContext* context, const(char)* description) c_g_option_context_set_description; ///
  void function(GOptionContext* context, gboolean helpEnabled) c_g_option_context_set_help_enabled; ///
  void function(GOptionContext* context, gboolean ignoreUnknown) c_g_option_context_set_ignore_unknown_options; ///
  void function(GOptionContext* context, GOptionGroup* group) c_g_option_context_set_main_group; ///
  void function(GOptionContext* context, gboolean strictPosix) c_g_option_context_set_strict_posix; ///
  void function(GOptionContext* context, const(char)* summary) c_g_option_context_set_summary; ///
  void function(GOptionContext* context, GTranslateFunc func, void* data, GDestroyNotify destroyNotify) c_g_option_context_set_translate_func; ///
  void function(GOptionContext* context, const(char)* domain) c_g_option_context_set_translation_domain; ///
  GOptionContext* function(const(char)* parameterString) c_g_option_context_new; ///

  // OptionGroup
  GType function() c_g_option_group_get_type; ///
  GOptionGroup* function(const(char)* name, const(char)* description, const(char)* helpDescription, void* userData, GDestroyNotify destroy) c_g_option_group_new; ///
  void function(GOptionGroup* group, const(GOptionEntry)* entries) c_g_option_group_add_entries; ///
  void function(GOptionGroup* group) c_g_option_group_free; ///
  GOptionGroup* function(GOptionGroup* group) c_g_option_group_ref; ///
  void function(GOptionGroup* group, GOptionErrorFunc errorFunc) c_g_option_group_set_error_hook; ///
  void function(GOptionGroup* group, GOptionParseFunc preParseFunc, GOptionParseFunc postParseFunc) c_g_option_group_set_parse_hooks; ///
  void function(GOptionGroup* group, GTranslateFunc func, void* data, GDestroyNotify destroyNotify) c_g_option_group_set_translate_func; ///
  void function(GOptionGroup* group, const(char)* domain) c_g_option_group_set_translation_domain; ///
  void function(GOptionGroup* group) c_g_option_group_unref; ///

  // PathBuf
  void function(GPathBuf* buf) c_g_path_buf_clear; ///
  char* function(GPathBuf* buf) c_g_path_buf_clear_to_path; ///
  GPathBuf* function(GPathBuf* buf) c_g_path_buf_copy; ///
  void function(GPathBuf* buf) c_g_path_buf_free; ///
  char* function(GPathBuf* buf) c_g_path_buf_free_to_path; ///
  GPathBuf* function(GPathBuf* buf) c_g_path_buf_init; ///
  GPathBuf* function(GPathBuf* buf, const(char)* path) c_g_path_buf_init_from_path; ///
  gboolean function(GPathBuf* buf) c_g_path_buf_pop; ///
  GPathBuf* function(GPathBuf* buf, const(char)* path) c_g_path_buf_push; ///
  gboolean function(GPathBuf* buf, const(char)* extension) c_g_path_buf_set_extension; ///
  gboolean function(GPathBuf* buf, const(char)* fileName) c_g_path_buf_set_filename; ///
  char* function(GPathBuf* buf) c_g_path_buf_to_path; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_path_buf_equal; ///
  GPathBuf* function() c_g_path_buf_new; ///
  GPathBuf* function(const(char)* path) c_g_path_buf_new_from_path; ///

  // PatternSpec
  GType function() c_g_pattern_spec_get_type; ///
  GPatternSpec* function(const(char)* pattern) c_g_pattern_spec_new; ///
  GPatternSpec* function(GPatternSpec* pspec) c_g_pattern_spec_copy; ///
  gboolean function(GPatternSpec* pspec1, GPatternSpec* pspec2) c_g_pattern_spec_equal; ///
  void function(GPatternSpec* pspec) c_g_pattern_spec_free; ///
  gboolean function(GPatternSpec* pspec, size_t stringLength, const(char)* string_, const(char)* stringReversed) c_g_pattern_spec_match; ///
  gboolean function(GPatternSpec* pspec, const(char)* string_) c_g_pattern_spec_match_string; ///

  // PollFD
  GType function() c_g_pollfd_get_type; ///

  // Private
  void* function(GPrivate* key) c_g_private_get; ///
  void function(GPrivate* key, void* value) c_g_private_replace; ///
  void function(GPrivate* key, void* value) c_g_private_set; ///
  GPrivate* function(GDestroyNotify notify) c_g_private_new; ///

  // PtrArray
  GType function() c_g_ptr_array_get_type; ///
  void function(GPtrArray* array, void* data) c_g_ptr_array_add; ///
  GPtrArray* function(GPtrArray* array, GCopyFunc func, void* userData) c_g_ptr_array_copy; ///
  void function(GPtrArray* arrayToExtend, GPtrArray* array, GCopyFunc func, void* userData) c_g_ptr_array_extend; ///
  void function(GPtrArray* arrayToExtend, GPtrArray* array) c_g_ptr_array_extend_and_steal; ///
  gboolean function(GPtrArray* haystack, const(void)* needle, uint* index) c_g_ptr_array_find; ///
  gboolean function(GPtrArray* haystack, const(void)* needle, GEqualFunc equalFunc, uint* index) c_g_ptr_array_find_with_equal_func; ///
  void function(GPtrArray* array, GFunc func, void* userData) c_g_ptr_array_foreach; ///
  void** function(GPtrArray* array, gboolean freeSeg) c_g_ptr_array_free; ///
  void function(GPtrArray* array, int index, void* data) c_g_ptr_array_insert; ///
  gboolean function(GPtrArray* array) c_g_ptr_array_is_null_terminated; ///
  GPtrArray* function() c_g_ptr_array_new; ///
  GPtrArray* function(void** data, size_t len, GCopyFunc copyFunc, void* copyFuncUserData, GDestroyNotify elementFreeFunc) c_g_ptr_array_new_from_array; ///
  GPtrArray* function(void** data, GCopyFunc copyFunc, void* copyFuncUserData, GDestroyNotify elementFreeFunc) c_g_ptr_array_new_from_null_terminated_array; ///
  GPtrArray* function(uint reservedSize, GDestroyNotify elementFreeFunc) c_g_ptr_array_new_full; ///
  GPtrArray* function(uint reservedSize, GDestroyNotify elementFreeFunc, gboolean nullTerminated) c_g_ptr_array_new_null_terminated; ///
  GPtrArray* function(void** data, size_t len, GDestroyNotify elementFreeFunc) c_g_ptr_array_new_take; ///
  GPtrArray* function(void** data, GDestroyNotify elementFreeFunc) c_g_ptr_array_new_take_null_terminated; ///
  GPtrArray* function(GDestroyNotify elementFreeFunc) c_g_ptr_array_new_with_free_func; ///
  GPtrArray* function(GPtrArray* array) c_g_ptr_array_ref; ///
  gboolean function(GPtrArray* array, void* data) c_g_ptr_array_remove; ///
  gboolean function(GPtrArray* array, void* data) c_g_ptr_array_remove_fast; ///
  void* function(GPtrArray* array, uint index) c_g_ptr_array_remove_index; ///
  void* function(GPtrArray* array, uint index) c_g_ptr_array_remove_index_fast; ///
  GPtrArray* function(GPtrArray* array, uint index, uint length) c_g_ptr_array_remove_range; ///
  void function(GPtrArray* array, GDestroyNotify elementFreeFunc) c_g_ptr_array_set_free_func; ///
  void function(GPtrArray* array, int length) c_g_ptr_array_set_size; ///
  GPtrArray* function(uint reservedSize) c_g_ptr_array_sized_new; ///
  void function(GPtrArray* array, GCompareFunc compareFunc) c_g_ptr_array_sort; ///
  void function(GPtrArray* array, GCompareFunc compareFunc) c_g_ptr_array_sort_values; ///
  void function(GPtrArray* array, GCompareDataFunc compareFunc, void* userData) c_g_ptr_array_sort_values_with_data; ///
  void function(GPtrArray* array, GCompareDataFunc compareFunc, void* userData) c_g_ptr_array_sort_with_data; ///
  void** function(GPtrArray* array, size_t* len) c_g_ptr_array_steal; ///
  void* function(GPtrArray* array, uint index) c_g_ptr_array_steal_index; ///
  void* function(GPtrArray* array, uint index) c_g_ptr_array_steal_index_fast; ///
  void function(GPtrArray* array) c_g_ptr_array_unref; ///

  // Queue
  void function(GQueue* queue) c_g_queue_clear; ///
  void function(GQueue* queue, GDestroyNotify freeFunc) c_g_queue_clear_full; ///
  GQueue* function(GQueue* queue) c_g_queue_copy; ///
  void function(GQueue* queue, GList* link) c_g_queue_delete_link; ///
  GList* function(GQueue* queue, const(void)* data) c_g_queue_find; ///
  GList* function(GQueue* queue, const(void)* data, GCompareFunc func) c_g_queue_find_custom; ///
  void function(GQueue* queue, GFunc func, void* userData) c_g_queue_foreach; ///
  void function(GQueue* queue) c_g_queue_free; ///
  void function(GQueue* queue, GDestroyNotify freeFunc) c_g_queue_free_full; ///
  uint function(GQueue* queue) c_g_queue_get_length; ///
  int function(GQueue* queue, const(void)* data) c_g_queue_index; ///
  void function(GQueue* queue) c_g_queue_init; ///
  void function(GQueue* queue, GList* sibling, void* data) c_g_queue_insert_after; ///
  void function(GQueue* queue, GList* sibling, GList* link) c_g_queue_insert_after_link; ///
  void function(GQueue* queue, GList* sibling, void* data) c_g_queue_insert_before; ///
  void function(GQueue* queue, GList* sibling, GList* link) c_g_queue_insert_before_link; ///
  void function(GQueue* queue, void* data, GCompareDataFunc func, void* userData) c_g_queue_insert_sorted; ///
  gboolean function(GQueue* queue) c_g_queue_is_empty; ///
  int function(GQueue* queue, GList* link) c_g_queue_link_index; ///
  void* function(GQueue* queue) c_g_queue_peek_head; ///
  GList* function(GQueue* queue) c_g_queue_peek_head_link; ///
  void* function(GQueue* queue, uint n) c_g_queue_peek_nth; ///
  GList* function(GQueue* queue, uint n) c_g_queue_peek_nth_link; ///
  void* function(GQueue* queue) c_g_queue_peek_tail; ///
  GList* function(GQueue* queue) c_g_queue_peek_tail_link; ///
  void* function(GQueue* queue) c_g_queue_pop_head; ///
  GList* function(GQueue* queue) c_g_queue_pop_head_link; ///
  void* function(GQueue* queue, uint n) c_g_queue_pop_nth; ///
  GList* function(GQueue* queue, uint n) c_g_queue_pop_nth_link; ///
  void* function(GQueue* queue) c_g_queue_pop_tail; ///
  GList* function(GQueue* queue) c_g_queue_pop_tail_link; ///
  void function(GQueue* queue, void* data) c_g_queue_push_head; ///
  void function(GQueue* queue, GList* link) c_g_queue_push_head_link; ///
  void function(GQueue* queue, void* data, int n) c_g_queue_push_nth; ///
  void function(GQueue* queue, int n, GList* link) c_g_queue_push_nth_link; ///
  void function(GQueue* queue, void* data) c_g_queue_push_tail; ///
  void function(GQueue* queue, GList* link) c_g_queue_push_tail_link; ///
  gboolean function(GQueue* queue, const(void)* data) c_g_queue_remove; ///
  uint function(GQueue* queue, const(void)* data) c_g_queue_remove_all; ///
  void function(GQueue* queue) c_g_queue_reverse; ///
  void function(GQueue* queue, GCompareDataFunc compareFunc, void* userData) c_g_queue_sort; ///
  void function(GQueue* queue, GList* link) c_g_queue_unlink; ///
  GQueue* function() c_g_queue_new; ///

  // RWLock
  void function(GRWLock* rwLock) c_g_rw_lock_clear; ///
  void function(GRWLock* rwLock) c_g_rw_lock_init; ///
  void function(GRWLock* rwLock) c_g_rw_lock_reader_lock; ///
  gboolean function(GRWLock* rwLock) c_g_rw_lock_reader_trylock; ///
  void function(GRWLock* rwLock) c_g_rw_lock_reader_unlock; ///
  void function(GRWLock* rwLock) c_g_rw_lock_writer_lock; ///
  gboolean function(GRWLock* rwLock) c_g_rw_lock_writer_trylock; ///
  void function(GRWLock* rwLock) c_g_rw_lock_writer_unlock; ///

  // Rand
  GType function() c_g_rand_get_type; ///
  GRand* function() c_g_rand_new; ///
  GRand* function(uint seed) c_g_rand_new_with_seed; ///
  GRand* function(const(uint)* seed, uint seedLength) c_g_rand_new_with_seed_array; ///
  GRand* function(GRand* rand) c_g_rand_copy; ///
  double function(GRand* rand) c_g_rand_double; ///
  double function(GRand* rand, double begin, double end) c_g_rand_double_range; ///
  void function(GRand* rand) c_g_rand_free; ///
  uint function(GRand* rand) c_g_rand_int; ///
  int function(GRand* rand, int begin, int end) c_g_rand_int_range; ///
  void function(GRand* rand, uint seed) c_g_rand_set_seed; ///
  void function(GRand* rand, const(uint)* seed, uint seedLength) c_g_rand_set_seed_array; ///

  // RecMutex
  void function(GRecMutex* recMutex) c_g_rec_mutex_clear; ///
  void function(GRecMutex* recMutex) c_g_rec_mutex_init; ///
  void function(GRecMutex* recMutex) c_g_rec_mutex_lock; ///
  gboolean function(GRecMutex* recMutex) c_g_rec_mutex_trylock; ///
  void function(GRecMutex* recMutex) c_g_rec_mutex_unlock; ///

  // Regex
  GType function() c_g_regex_get_type; ///
  GRegex* function(const(char)* pattern, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions, GError** _err) c_g_regex_new; ///
  int function(const(GRegex)* regex) c_g_regex_get_capture_count; ///
  GRegexCompileFlags function(const(GRegex)* regex) c_g_regex_get_compile_flags; ///
  gboolean function(const(GRegex)* regex) c_g_regex_get_has_cr_or_lf; ///
  GRegexMatchFlags function(const(GRegex)* regex) c_g_regex_get_match_flags; ///
  int function(const(GRegex)* regex) c_g_regex_get_max_backref; ///
  int function(const(GRegex)* regex) c_g_regex_get_max_lookbehind; ///
  const(char)* function(const(GRegex)* regex) c_g_regex_get_pattern; ///
  int function(const(GRegex)* regex, const(char)* name) c_g_regex_get_string_number; ///
  gboolean function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo) c_g_regex_match; ///
  gboolean function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo) c_g_regex_match_all; ///
  gboolean function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo, GError** _err) c_g_regex_match_all_full; ///
  gboolean function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GMatchInfo** matchInfo, GError** _err) c_g_regex_match_full; ///
  GRegex* function(GRegex* regex) c_g_regex_ref; ///
  char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, const(char)* replacement, GRegexMatchFlags matchOptions, GError** _err) c_g_regex_replace; ///
  char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, GRegexEvalCallback eval, void* userData, GError** _err) c_g_regex_replace_eval; ///
  char* function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, const(char)* replacement, GRegexMatchFlags matchOptions, GError** _err) c_g_regex_replace_literal; ///
  char** function(const(GRegex)* regex, const(char)* string_, GRegexMatchFlags matchOptions) c_g_regex_split; ///
  char** function(const(GRegex)* regex, const(char)* string_, ptrdiff_t stringLen, int startPosition, GRegexMatchFlags matchOptions, int maxTokens, GError** _err) c_g_regex_split_full; ///
  void function(GRegex* regex) c_g_regex_unref; ///
  gboolean function(const(char)* replacement, gboolean* hasReferences, GError** _err) c_g_regex_check_replacement; ///
  GQuark function() c_g_regex_error_quark; ///
  char* function(const(char)* string_, int length) c_g_regex_escape_nul; ///
  char* function(const(char)* string_, int length) c_g_regex_escape_string; ///
  gboolean function(const(char)* pattern, const(char)* string_, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions) c_g_regex_match_simple; ///
  char** function(const(char)* pattern, const(char)* string_, GRegexCompileFlags compileOptions, GRegexMatchFlags matchOptions) c_g_regex_split_simple; ///

  // Relation
  int function(GRelation* relation, const(void)* key, int field) c_g_relation_count; ///
  int function(GRelation* relation, const(void)* key, int field) c_g_relation_delete; ///
  void function(GRelation* relation) c_g_relation_destroy; ///
  gboolean function(GRelation* relation,  ...) c_g_relation_exists; ///
  void function(GRelation* relation, int field, GHashFunc hashFunc, GEqualFunc keyEqualFunc) c_g_relation_index; ///
  void function(GRelation* relation,  ...) c_g_relation_insert; ///
  void function(GRelation* relation) c_g_relation_print; ///
  GTuples* function(GRelation* relation, const(void)* key, int field) c_g_relation_select; ///
  GRelation* function(int fields) c_g_relation_new; ///

  // SList
  GSList* function() c_g_slist_alloc; ///
  GSList* function(GSList* list, void* data) c_g_slist_append; ///
  GSList* function(GSList* list1, GSList* list2) c_g_slist_concat; ///
  GSList* function(GSList* list) c_g_slist_copy; ///
  GSList* function(GSList* list, GCopyFunc func, void* userData) c_g_slist_copy_deep; ///
  GSList* function(GSList* list, GSList* link) c_g_slist_delete_link; ///
  GSList* function(GSList* list, const(void)* data) c_g_slist_find; ///
  GSList* function(GSList* list, const(void)* data, GCompareFunc func) c_g_slist_find_custom; ///
  void function(GSList* list, GFunc func, void* userData) c_g_slist_foreach; ///
  void function(GSList* list) c_g_slist_free; ///
  void function(GSList* list) c_g_slist_free_1; ///
  void function(GSList* list, GDestroyNotify freeFunc) c_g_slist_free_full; ///
  int function(GSList* list, const(void)* data) c_g_slist_index; ///
  GSList* function(GSList* list, void* data, int position) c_g_slist_insert; ///
  GSList* function(GSList* slist, GSList* sibling, void* data) c_g_slist_insert_before; ///
  GSList* function(GSList* list, void* data, GCompareFunc func) c_g_slist_insert_sorted; ///
  GSList* function(GSList* list, void* data, GCompareDataFunc func, void* userData) c_g_slist_insert_sorted_with_data; ///
  GSList* function(GSList* list) c_g_slist_last; ///
  uint function(GSList* list) c_g_slist_length; ///
  GSList* function(GSList* list, uint n) c_g_slist_nth; ///
  void* function(GSList* list, uint n) c_g_slist_nth_data; ///
  void function() c_g_slist_pop_allocator; ///
  int function(GSList* list, GSList* llink) c_g_slist_position; ///
  GSList* function(GSList* list, void* data) c_g_slist_prepend; ///
  void function(GAllocator* allocator) c_g_slist_push_allocator; ///
  GSList* function(GSList* list, const(void)* data) c_g_slist_remove; ///
  GSList* function(GSList* list, const(void)* data) c_g_slist_remove_all; ///
  GSList* function(GSList* list, GSList* link) c_g_slist_remove_link; ///
  GSList* function(GSList* list) c_g_slist_reverse; ///
  GSList* function(GSList* list, GCompareFunc compareFunc) c_g_slist_sort; ///
  GSList* function(GSList* list, GCompareDataFunc compareFunc, void* userData) c_g_slist_sort_with_data; ///

  // Scanner
  uint function(GScanner* scanner) c_g_scanner_cur_line; ///
  uint function(GScanner* scanner) c_g_scanner_cur_position; ///
  GTokenType function(GScanner* scanner) c_g_scanner_cur_token; ///
  GTokenValue function(GScanner* scanner) c_g_scanner_cur_value; ///
  void function(GScanner* scanner) c_g_scanner_destroy; ///
  gboolean function(GScanner* scanner) c_g_scanner_eof; ///
  void function(GScanner* scanner, const(char)* format,  ...) c_g_scanner_error; ///
  GTokenType function(GScanner* scanner) c_g_scanner_get_next_token; ///
  void function(GScanner* scanner, int inputFd) c_g_scanner_input_file; ///
  void function(GScanner* scanner, const(char)* text, uint textLen) c_g_scanner_input_text; ///
  void* function(GScanner* scanner, const(char)* symbol) c_g_scanner_lookup_symbol; ///
  GTokenType function(GScanner* scanner) c_g_scanner_peek_next_token; ///
  void function(GScanner* scanner, uint scopeId, const(char)* symbol, void* value) c_g_scanner_scope_add_symbol; ///
  void function(GScanner* scanner, uint scopeId, GHFunc func, void* userData) c_g_scanner_scope_foreach_symbol; ///
  void* function(GScanner* scanner, uint scopeId, const(char)* symbol) c_g_scanner_scope_lookup_symbol; ///
  void function(GScanner* scanner, uint scopeId, const(char)* symbol) c_g_scanner_scope_remove_symbol; ///
  uint function(GScanner* scanner, uint scopeId) c_g_scanner_set_scope; ///
  void function(GScanner* scanner) c_g_scanner_sync_file_offset; ///
  void function(GScanner* scanner, GTokenType expectedToken, const(char)* identifierSpec, const(char)* symbolSpec, const(char)* symbolName, const(char)* message, int isError) c_g_scanner_unexp_token; ///
  void function(GScanner* scanner, const(char)* format,  ...) c_g_scanner_warn; ///
  GScanner* function(const(GScannerConfig)* configTempl) c_g_scanner_new; ///

  // Sequence
  GSequenceIter* function(GSequence* seq, void* data) c_g_sequence_append; ///
  void function(GSequence* seq, GFunc func, void* userData) c_g_sequence_foreach; ///
  void function(GSequence* seq) c_g_sequence_free; ///
  GSequenceIter* function(GSequence* seq) c_g_sequence_get_begin_iter; ///
  GSequenceIter* function(GSequence* seq) c_g_sequence_get_end_iter; ///
  GSequenceIter* function(GSequence* seq, int pos) c_g_sequence_get_iter_at_pos; ///
  int function(GSequence* seq) c_g_sequence_get_length; ///
  GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) c_g_sequence_insert_sorted; ///
  GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) c_g_sequence_insert_sorted_iter; ///
  gboolean function(GSequence* seq) c_g_sequence_is_empty; ///
  GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) c_g_sequence_lookup; ///
  GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) c_g_sequence_lookup_iter; ///
  GSequenceIter* function(GSequence* seq, void* data) c_g_sequence_prepend; ///
  GSequenceIter* function(GSequence* seq, void* data, GCompareDataFunc cmpFunc, void* cmpData) c_g_sequence_search; ///
  GSequenceIter* function(GSequence* seq, void* data, GSequenceIterCompareFunc iterCmp, void* cmpData) c_g_sequence_search_iter; ///
  void function(GSequence* seq, GCompareDataFunc cmpFunc, void* cmpData) c_g_sequence_sort; ///
  void function(GSequence* seq, GSequenceIterCompareFunc cmpFunc, void* cmpData) c_g_sequence_sort_iter; ///
  void function(GSequenceIter* begin, GSequenceIter* end, GFunc func, void* userData) c_g_sequence_foreach_range; ///
  void* function(GSequenceIter* iter) c_g_sequence_get; ///
  GSequenceIter* function(GSequenceIter* iter, void* data) c_g_sequence_insert_before; ///
  void function(GSequenceIter* src, GSequenceIter* dest) c_g_sequence_move; ///
  void function(GSequenceIter* dest, GSequenceIter* begin, GSequenceIter* end) c_g_sequence_move_range; ///
  GSequence* function(GDestroyNotify dataDestroy) c_g_sequence_new; ///
  GSequenceIter* function(GSequenceIter* begin, GSequenceIter* end) c_g_sequence_range_get_midpoint; ///
  void function(GSequenceIter* iter) c_g_sequence_remove; ///
  void function(GSequenceIter* begin, GSequenceIter* end) c_g_sequence_remove_range; ///
  void function(GSequenceIter* iter, void* data) c_g_sequence_set; ///
  void function(GSequenceIter* iter, GCompareDataFunc cmpFunc, void* cmpData) c_g_sequence_sort_changed; ///
  void function(GSequenceIter* iter, GSequenceIterCompareFunc iterCmp, void* cmpData) c_g_sequence_sort_changed_iter; ///
  void function(GSequenceIter* a, GSequenceIter* b) c_g_sequence_swap; ///

  // SequenceIter
  int function(GSequenceIter* a, GSequenceIter* b) c_g_sequence_iter_compare; ///
  int function(GSequenceIter* iter) c_g_sequence_iter_get_position; ///
  GSequence* function(GSequenceIter* iter) c_g_sequence_iter_get_sequence; ///
  gboolean function(GSequenceIter* iter) c_g_sequence_iter_is_begin; ///
  gboolean function(GSequenceIter* iter) c_g_sequence_iter_is_end; ///
  GSequenceIter* function(GSequenceIter* iter, int delta) c_g_sequence_iter_move; ///
  GSequenceIter* function(GSequenceIter* iter) c_g_sequence_iter_next; ///
  GSequenceIter* function(GSequenceIter* iter) c_g_sequence_iter_prev; ///

  // Source
  GType function() c_g_source_get_type; ///
  GSource* function(GSourceFuncs* sourceFuncs, uint structSize) c_g_source_new; ///
  void function(GSource* source, GSource* childSource) c_g_source_add_child_source; ///
  void function(GSource* source, GPollFD* fd) c_g_source_add_poll; ///
  void* function(GSource* source, int fd, GIOCondition events) c_g_source_add_unix_fd; ///
  uint function(GSource* source, GMainContext* context) c_g_source_attach; ///
  void function(GSource* source) c_g_source_destroy; ///
  gboolean function(GSource* source) c_g_source_get_can_recurse; ///
  GMainContext* function(GSource* source) c_g_source_get_context; ///
  void function(GSource* source, GTimeVal* timeval) c_g_source_get_current_time; ///
  uint function(GSource* source) c_g_source_get_id; ///
  const(char)* function(GSource* source) c_g_source_get_name; ///
  int function(GSource* source) c_g_source_get_priority; ///
  long function(GSource* source) c_g_source_get_ready_time; ///
  long function(GSource* source) c_g_source_get_time; ///
  gboolean function(GSource* source) c_g_source_is_destroyed; ///
  void function(GSource* source, void* tag, GIOCondition newEvents) c_g_source_modify_unix_fd; ///
  GIOCondition function(GSource* source, void* tag) c_g_source_query_unix_fd; ///
  GSource* function(GSource* source) c_g_source_ref; ///
  void function(GSource* source, GSource* childSource) c_g_source_remove_child_source; ///
  void function(GSource* source, GPollFD* fd) c_g_source_remove_poll; ///
  void function(GSource* source, void* tag) c_g_source_remove_unix_fd; ///
  void function(GSource* source, GSourceFunc func, void* data, GDestroyNotify notify) c_g_source_set_callback; ///
  void function(GSource* source, void* callbackData, GSourceCallbackFuncs* callbackFuncs) c_g_source_set_callback_indirect; ///
  void function(GSource* source, gboolean canRecurse) c_g_source_set_can_recurse; ///
  void function(GSource* source, GSourceDisposeFunc dispose) c_g_source_set_dispose_function; ///
  void function(GSource* source, GSourceFuncs* funcs) c_g_source_set_funcs; ///
  void function(GSource* source, const(char)* name) c_g_source_set_name; ///
  void function(GSource* source, int priority) c_g_source_set_priority; ///
  void function(GSource* source, long readyTime) c_g_source_set_ready_time; ///
  void function(GSource* source, const(char)* name) c_g_source_set_static_name; ///
  void function(GSource* source) c_g_source_unref; ///
  gboolean function(uint tag) c_g_source_remove; ///
  gboolean function(GSourceFuncs* funcs, void* userData) c_g_source_remove_by_funcs_user_data; ///
  gboolean function(void* userData) c_g_source_remove_by_user_data; ///
  void function(uint tag, const(char)* name) c_g_source_set_name_by_id; ///

  // StaticMutex
  void function(GStaticMutex* mutex) c_g_static_mutex_free; ///
  GMutex* function(GStaticMutex* mutex) c_g_static_mutex_get_mutex_impl; ///
  void function(GStaticMutex* mutex) c_g_static_mutex_init; ///

  // StaticPrivate
  void function(GStaticPrivate* privateKey) c_g_static_private_free; ///
  void* function(GStaticPrivate* privateKey) c_g_static_private_get; ///
  void function(GStaticPrivate* privateKey) c_g_static_private_init; ///
  void function(GStaticPrivate* privateKey, void* data, GDestroyNotify notify) c_g_static_private_set; ///

  // StaticRWLock
  void function(GStaticRWLock* lock) c_g_static_rw_lock_free; ///
  void function(GStaticRWLock* lock) c_g_static_rw_lock_init; ///
  void function(GStaticRWLock* lock) c_g_static_rw_lock_reader_lock; ///
  gboolean function(GStaticRWLock* lock) c_g_static_rw_lock_reader_trylock; ///
  void function(GStaticRWLock* lock) c_g_static_rw_lock_reader_unlock; ///
  void function(GStaticRWLock* lock) c_g_static_rw_lock_writer_lock; ///
  gboolean function(GStaticRWLock* lock) c_g_static_rw_lock_writer_trylock; ///
  void function(GStaticRWLock* lock) c_g_static_rw_lock_writer_unlock; ///

  // StaticRecMutex
  void function(GStaticRecMutex* mutex) c_g_static_rec_mutex_free; ///
  void function(GStaticRecMutex* mutex) c_g_static_rec_mutex_init; ///
  void function(GStaticRecMutex* mutex) c_g_static_rec_mutex_lock; ///
  void function(GStaticRecMutex* mutex, uint depth) c_g_static_rec_mutex_lock_full; ///
  gboolean function(GStaticRecMutex* mutex) c_g_static_rec_mutex_trylock; ///
  void function(GStaticRecMutex* mutex) c_g_static_rec_mutex_unlock; ///
  uint function(GStaticRecMutex* mutex) c_g_static_rec_mutex_unlock_full; ///

  // String
  GType function() c_g_gstring_get_type; ///
  GString* function(const(char)* init_) c_g_string_new; ///
  GString* function(const(char)* init_, ptrdiff_t len) c_g_string_new_len; ///
  GString* function(char* init_) c_g_string_new_take; ///
  GString* function(size_t dflSize) c_g_string_sized_new; ///
  GString* function(GString* string_, const(char)* val) c_g_string_append; ///
  GString* function(GString* string_, char c) c_g_string_append_c; ///
  GString* function(GString* string_, const(char)* val, ptrdiff_t len) c_g_string_append_len; ///
  void function(GString* string_, const(char)* format,  ...) c_g_string_append_printf; ///
  GString* function(GString* string_, dchar wc) c_g_string_append_unichar; ///
  GString* function(GString* string_, const(char)* unescaped, const(char)* reservedCharsAllowed, gboolean allowUtf8) c_g_string_append_uri_escaped; ///
  void function(GString* string_, const(char)* format, void* args) c_g_string_append_vprintf; ///
  GString* function(GString* string_) c_g_string_ascii_down; ///
  GString* function(GString* string_) c_g_string_ascii_up; ///
  GString* function(GString* string_, const(char)* rval) c_g_string_assign; ///
  GString* function(GString* string_) c_g_string_down; ///
  gboolean function(const(GString)* v, const(GString)* v2) c_g_string_equal; ///
  GString* function(GString* string_, ptrdiff_t pos, ptrdiff_t len) c_g_string_erase; ///
  char* function(GString* string_, gboolean freeSegment) c_g_string_free; ///
  char* function(GString* string_) c_g_string_free_and_steal; ///
  GBytes* function(GString* string_) c_g_string_free_to_bytes; ///
  uint function(const(GString)* str) c_g_string_hash; ///
  GString* function(GString* string_, ptrdiff_t pos, const(char)* val) c_g_string_insert; ///
  GString* function(GString* string_, ptrdiff_t pos, char c) c_g_string_insert_c; ///
  GString* function(GString* string_, ptrdiff_t pos, const(char)* val, ptrdiff_t len) c_g_string_insert_len; ///
  GString* function(GString* string_, ptrdiff_t pos, dchar wc) c_g_string_insert_unichar; ///
  GString* function(GString* string_, size_t pos, const(char)* val) c_g_string_overwrite; ///
  GString* function(GString* string_, size_t pos, const(char)* val, ptrdiff_t len) c_g_string_overwrite_len; ///
  GString* function(GString* string_, const(char)* val) c_g_string_prepend; ///
  GString* function(GString* string_, char c) c_g_string_prepend_c; ///
  GString* function(GString* string_, const(char)* val, ptrdiff_t len) c_g_string_prepend_len; ///
  GString* function(GString* string_, dchar wc) c_g_string_prepend_unichar; ///
  void function(GString* string_, const(char)* format,  ...) c_g_string_printf; ///
  uint function(GString* string_, const(char)* find, const(char)* replace, uint limit) c_g_string_replace; ///
  GString* function(GString* string_, size_t len) c_g_string_set_size; ///
  GString* function(GString* string_, size_t len) c_g_string_truncate; ///
  GString* function(GString* string_) c_g_string_up; ///
  void function(GString* string_, const(char)* format, void* args) c_g_string_vprintf; ///

  // StringChunk
  void function(GStringChunk* chunk) c_g_string_chunk_clear; ///
  void function(GStringChunk* chunk) c_g_string_chunk_free; ///
  char* function(GStringChunk* chunk, const(char)* string_) c_g_string_chunk_insert; ///
  char* function(GStringChunk* chunk, const(char)* string_) c_g_string_chunk_insert_const; ///
  char* function(GStringChunk* chunk, const(char)* string_, ptrdiff_t len) c_g_string_chunk_insert_len; ///
  GStringChunk* function(size_t size) c_g_string_chunk_new; ///

  // StrvBuilder
  GType function() c_g_strv_builder_get_type; ///
  GStrvBuilder* function() c_g_strv_builder_new; ///
  void function(GStrvBuilder* builder, const(char)* value) c_g_strv_builder_add; ///
  void function(GStrvBuilder* builder,  ...) c_g_strv_builder_add_many; ///
  void function(GStrvBuilder* builder, const(char*)* value) c_g_strv_builder_addv; ///
  char** function(GStrvBuilder* builder) c_g_strv_builder_end; ///
  GStrvBuilder* function(GStrvBuilder* builder) c_g_strv_builder_ref; ///
  void function(GStrvBuilder* builder, char* value) c_g_strv_builder_take; ///
  void function(GStrvBuilder* builder) c_g_strv_builder_unref; ///

  // TestCase
  void function(GTestCase* testCase) c_g_test_case_free; ///

  // TestLogBuffer
  void function(GTestLogBuffer* tbuffer) c_g_test_log_buffer_free; ///
  GTestLogMsg* function(GTestLogBuffer* tbuffer) c_g_test_log_buffer_pop; ///
  void function(GTestLogBuffer* tbuffer, uint nBytes, const(ubyte)* bytes) c_g_test_log_buffer_push; ///
  GTestLogBuffer* function() c_g_test_log_buffer_new; ///

  // TestLogMsg
  void function(GTestLogMsg* tmsg) c_g_test_log_msg_free; ///

  // TestSuite
  void function(GTestSuite* suite, GTestCase* testCase) c_g_test_suite_add; ///
  void function(GTestSuite* suite, GTestSuite* nestedsuite) c_g_test_suite_add_suite; ///
  void function(GTestSuite* suite) c_g_test_suite_free; ///

  // Thread
  GType function() c_g_thread_get_type; ///
  GThread* function(const(char)* name, GThreadFunc func, void* data) c_g_thread_new; ///
  GThread* function(const(char)* name, GThreadFunc func, void* data, GError** _err) c_g_thread_try_new; ///
  void* function(GThread* thread) c_g_thread_join; ///
  GThread* function(GThread* thread) c_g_thread_ref; ///
  void function(GThread* thread, GThreadPriority priority) c_g_thread_set_priority; ///
  void function(GThread* thread) c_g_thread_unref; ///
  GThread* function(GThreadFunc func, void* data, gboolean joinable, GError** _err) c_g_thread_create; ///
  GThread* function(GThreadFunc func, void* data, gulong stackSize, gboolean joinable, gboolean bound, GThreadPriority priority, GError** _err) c_g_thread_create_full; ///
  GQuark function() c_g_thread_error_quark; ///
  void function(void* retval) c_g_thread_exit; ///
  void function(GFunc threadFunc, void* userData) c_g_thread_foreach; ///
  gboolean function() c_g_thread_get_initialized; ///
  void function(void* vtable) c_g_thread_init; ///
  void function(void* vtable) c_g_thread_init_with_errorcheck_mutexes; ///
  GThread* function() c_g_thread_self; ///
  void function() c_g_thread_yield; ///

  // ThreadPool
  void function(GThreadPool* pool, gboolean immediate, gboolean wait) c_g_thread_pool_free; ///
  int function(GThreadPool* pool) c_g_thread_pool_get_max_threads; ///
  uint function(GThreadPool* pool) c_g_thread_pool_get_num_threads; ///
  gboolean function(GThreadPool* pool, void* data) c_g_thread_pool_move_to_front; ///
  gboolean function(GThreadPool* pool, void* data, GError** _err) c_g_thread_pool_push; ///
  gboolean function(GThreadPool* pool, int maxThreads, GError** _err) c_g_thread_pool_set_max_threads; ///
  void function(GThreadPool* pool, GCompareDataFunc func, void* userData) c_g_thread_pool_set_sort_function; ///
  uint function(GThreadPool* pool) c_g_thread_pool_unprocessed; ///
  uint function() c_g_thread_pool_get_max_idle_time; ///
  int function() c_g_thread_pool_get_max_unused_threads; ///
  uint function() c_g_thread_pool_get_num_unused_threads; ///
  GThreadPool* function(GFunc func, void* userData, int maxThreads, gboolean exclusive, GError** _err) c_g_thread_pool_new; ///
  GThreadPool* function(GFunc func, void* userData, GDestroyNotify itemFreeFunc, int maxThreads, gboolean exclusive, GError** _err) c_g_thread_pool_new_full; ///
  void function(uint interval) c_g_thread_pool_set_max_idle_time; ///
  void function(int maxThreads) c_g_thread_pool_set_max_unused_threads; ///
  void function() c_g_thread_pool_stop_unused_threads; ///

  // TimeVal
  void function(GTimeVal* time, glong microseconds) c_g_time_val_add; ///
  char* function(GTimeVal* time) c_g_time_val_to_iso8601; ///
  gboolean function(const(char)* isoDate, GTimeVal* time) c_g_time_val_from_iso8601; ///

  // TimeZone
  GType function() c_g_time_zone_get_type; ///
  GTimeZone* function(const(char)* identifier) c_g_time_zone_new; ///
  GTimeZone* function(const(char)* identifier) c_g_time_zone_new_identifier; ///
  GTimeZone* function() c_g_time_zone_new_local; ///
  GTimeZone* function(int seconds) c_g_time_zone_new_offset; ///
  GTimeZone* function() c_g_time_zone_new_utc; ///
  int function(GTimeZone* tz, GTimeType type, long* time) c_g_time_zone_adjust_time; ///
  int function(GTimeZone* tz, GTimeType type, long time) c_g_time_zone_find_interval; ///
  const(char)* function(GTimeZone* tz, int interval) c_g_time_zone_get_abbreviation; ///
  const(char)* function(GTimeZone* tz) c_g_time_zone_get_identifier; ///
  int function(GTimeZone* tz, int interval) c_g_time_zone_get_offset; ///
  gboolean function(GTimeZone* tz, int interval) c_g_time_zone_is_dst; ///
  GTimeZone* function(GTimeZone* tz) c_g_time_zone_ref; ///
  void function(GTimeZone* tz) c_g_time_zone_unref; ///

  // Timer
  void function(GTimer* timer) c_g_timer_continue; ///
  void function(GTimer* timer) c_g_timer_destroy; ///
  double function(GTimer* timer, gulong* microseconds) c_g_timer_elapsed; ///
  gboolean function(GTimer* timer) c_g_timer_is_active; ///
  void function(GTimer* timer) c_g_timer_reset; ///
  void function(GTimer* timer) c_g_timer_start; ///
  void function(GTimer* timer) c_g_timer_stop; ///
  GTimer* function() c_g_timer_new; ///

  // TrashStack
  uint function(GTrashStack** stackP) c_g_trash_stack_height; ///
  void* function(GTrashStack** stackP) c_g_trash_stack_peek; ///
  void* function(GTrashStack** stackP) c_g_trash_stack_pop; ///
  void function(GTrashStack** stackP, void* dataP) c_g_trash_stack_push; ///

  // Tree
  GType function() c_g_tree_get_type; ///
  GTree* function(GCompareFunc keyCompareFunc) c_g_tree_new; ///
  GTree* function(GCompareDataFunc keyCompareFunc, void* keyCompareData, GDestroyNotify keyDestroyFunc, GDestroyNotify valueDestroyFunc) c_g_tree_new_full; ///
  GTree* function(GCompareDataFunc keyCompareFunc, void* keyCompareData) c_g_tree_new_with_data; ///
  void function(GTree* tree) c_g_tree_destroy; ///
  void function(GTree* tree, GTraverseFunc func, void* userData) c_g_tree_foreach; ///
  void function(GTree* tree, GTraverseNodeFunc func, void* userData) c_g_tree_foreach_node; ///
  int function(GTree* tree) c_g_tree_height; ///
  void function(GTree* tree, void* key, void* value) c_g_tree_insert; ///
  GTreeNode* function(GTree* tree, void* key, void* value) c_g_tree_insert_node; ///
  void* function(GTree* tree, const(void)* key) c_g_tree_lookup; ///
  gboolean function(GTree* tree, const(void)* lookupKey, void** origKey, void** value) c_g_tree_lookup_extended; ///
  GTreeNode* function(GTree* tree, const(void)* key) c_g_tree_lookup_node; ///
  GTreeNode* function(GTree* tree, const(void)* key) c_g_tree_lower_bound; ///
  int function(GTree* tree) c_g_tree_nnodes; ///
  GTreeNode* function(GTree* tree) c_g_tree_node_first; ///
  GTreeNode* function(GTree* tree) c_g_tree_node_last; ///
  GTree* function(GTree* tree) c_g_tree_ref; ///
  gboolean function(GTree* tree, const(void)* key) c_g_tree_remove; ///
  void function(GTree* tree) c_g_tree_remove_all; ///
  void function(GTree* tree, void* key, void* value) c_g_tree_replace; ///
  GTreeNode* function(GTree* tree, void* key, void* value) c_g_tree_replace_node; ///
  void* function(GTree* tree, GCompareFunc searchFunc, const(void)* userData) c_g_tree_search; ///
  GTreeNode* function(GTree* tree, GCompareFunc searchFunc, const(void)* userData) c_g_tree_search_node; ///
  gboolean function(GTree* tree, const(void)* key) c_g_tree_steal; ///
  void function(GTree* tree, GTraverseFunc traverseFunc, GTraverseType traverseType, void* userData) c_g_tree_traverse; ///
  void function(GTree* tree) c_g_tree_unref; ///
  GTreeNode* function(GTree* tree, const(void)* key) c_g_tree_upper_bound; ///

  // TreeNode
  void* function(GTreeNode* node) c_g_tree_node_key; ///
  GTreeNode* function(GTreeNode* node) c_g_tree_node_next; ///
  GTreeNode* function(GTreeNode* node) c_g_tree_node_previous; ///
  void* function(GTreeNode* node) c_g_tree_node_value; ///

  // Tuples
  void function(GTuples* tuples) c_g_tuples_destroy; ///
  void* function(GTuples* tuples, int index, int field) c_g_tuples_index; ///

  // Uri
  GType function() c_g_uri_get_type; ///
  const(char)* function(GUri* uri) c_g_uri_get_auth_params; ///
  GUriFlags function(GUri* uri) c_g_uri_get_flags; ///
  const(char)* function(GUri* uri) c_g_uri_get_fragment; ///
  const(char)* function(GUri* uri) c_g_uri_get_host; ///
  const(char)* function(GUri* uri) c_g_uri_get_password; ///
  const(char)* function(GUri* uri) c_g_uri_get_path; ///
  int function(GUri* uri) c_g_uri_get_port; ///
  const(char)* function(GUri* uri) c_g_uri_get_query; ///
  const(char)* function(GUri* uri) c_g_uri_get_scheme; ///
  const(char)* function(GUri* uri) c_g_uri_get_user; ///
  const(char)* function(GUri* uri) c_g_uri_get_userinfo; ///
  GUri* function(GUri* baseUri, const(char)* uriRef, GUriFlags flags, GError** _err) c_g_uri_parse_relative; ///
  GUri* function(GUri* uri) c_g_uri_ref; ///
  char* function(GUri* uri) c_g_uri_to_string; ///
  char* function(GUri* uri, GUriHideFlags flags) c_g_uri_to_string_partial; ///
  void function(GUri* uri) c_g_uri_unref; ///
  GUri* function(GUriFlags flags, const(char)* scheme, const(char)* userinfo, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) c_g_uri_build; ///
  GUri* function(GUriFlags flags, const(char)* scheme, const(char)* user, const(char)* password, const(char)* authParams, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) c_g_uri_build_with_user; ///
  GQuark function() c_g_uri_error_quark; ///
  char* function(const(ubyte)* unescaped, size_t length, const(char)* reservedCharsAllowed) c_g_uri_escape_bytes; ///
  char* function(const(char)* unescaped, const(char)* reservedCharsAllowed, gboolean allowUtf8) c_g_uri_escape_string; ///
  gboolean function(const(char)* uriString, GUriFlags flags, GError** _err) c_g_uri_is_valid; ///
  char* function(GUriFlags flags, const(char)* scheme, const(char)* userinfo, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) c_g_uri_join; ///
  char* function(GUriFlags flags, const(char)* scheme, const(char)* user, const(char)* password, const(char)* authParams, const(char)* host, int port, const(char)* path, const(char)* query, const(char)* fragment) c_g_uri_join_with_user; ///
  char** function(const(char)* uriList) c_g_uri_list_extract_uris; ///
  GUri* function(const(char)* uriString, GUriFlags flags, GError** _err) c_g_uri_parse; ///
  GHashTable* function(const(char)* params, ptrdiff_t length, const(char)* separators, GUriParamsFlags flags, GError** _err) c_g_uri_parse_params; ///
  char* function(const(char)* uri) c_g_uri_parse_scheme; ///
  const(char)* function(const(char)* uri) c_g_uri_peek_scheme; ///
  char* function(const(char)* baseUriString, const(char)* uriRef, GUriFlags flags, GError** _err) c_g_uri_resolve_relative; ///
  gboolean function(const(char)* uriRef, GUriFlags flags, char** scheme, char** userinfo, char** host, int* port, char** path, char** query, char** fragment, GError** _err) c_g_uri_split; ///
  gboolean function(const(char)* uriString, GUriFlags flags, char** scheme, char** host, int* port, GError** _err) c_g_uri_split_network; ///
  gboolean function(const(char)* uriRef, GUriFlags flags, char** scheme, char** user, char** password, char** authParams, char** host, int* port, char** path, char** query, char** fragment, GError** _err) c_g_uri_split_with_user; ///
  GBytes* function(const(char)* escapedString, ptrdiff_t length, const(char)* illegalCharacters, GError** _err) c_g_uri_unescape_bytes; ///
  char* function(const(char)* escapedString, const(char)* escapedStringEnd, const(char)* illegalCharacters) c_g_uri_unescape_segment; ///
  char* function(const(char)* escapedString, const(char)* illegalCharacters) c_g_uri_unescape_string; ///

  // UriParamsIter
  void function(GUriParamsIter* iter, const(char)* params, ptrdiff_t length, const(char)* separators, GUriParamsFlags flags) c_g_uri_params_iter_init; ///
  gboolean function(GUriParamsIter* iter, char** attribute, char** value, GError** _err) c_g_uri_params_iter_next; ///

  // Variant
  GType function() c_intern; ///
  GVariant* function(const(char)* formatString,  ...) c_g_variant_new; ///
  GVariant* function(const(GVariantType)* childType, const(GVariant*)* children, size_t nChildren) c_g_variant_new_array; ///
  GVariant* function(gboolean value) c_g_variant_new_boolean; ///
  GVariant* function(ubyte value) c_g_variant_new_byte; ///
  GVariant* function(const(char)* string_) c_g_variant_new_bytestring; ///
  GVariant* function(const(char*)* strv, ptrdiff_t length) c_g_variant_new_bytestring_array; ///
  GVariant* function(GVariant* key, GVariant* value) c_g_variant_new_dict_entry; ///
  GVariant* function(double value) c_g_variant_new_double; ///
  GVariant* function(const(GVariantType)* elementType, const(void)* elements, size_t nElements, size_t elementSize) c_g_variant_new_fixed_array; ///
  GVariant* function(const(GVariantType)* type, GBytes* bytes, gboolean trusted) c_g_variant_new_from_bytes; ///
  GVariant* function(const(GVariantType)* type, const(void)* data, size_t size, gboolean trusted, GDestroyNotify notify, void* userData) c_g_variant_new_from_data; ///
  GVariant* function(int value) c_g_variant_new_handle; ///
  GVariant* function(short value) c_g_variant_new_int16; ///
  GVariant* function(int value) c_g_variant_new_int32; ///
  GVariant* function(long value) c_g_variant_new_int64; ///
  GVariant* function(const(GVariantType)* childType, GVariant* child) c_g_variant_new_maybe; ///
  GVariant* function(const(char)* objectPath) c_g_variant_new_object_path; ///
  GVariant* function(const(char*)* strv, ptrdiff_t length) c_g_variant_new_objv; ///
  GVariant* function(const(char)* format,  ...) c_g_variant_new_parsed; ///
  GVariant* function(const(char)* format, void** app) c_g_variant_new_parsed_va; ///
  GVariant* function(const(char)* formatString,  ...) c_g_variant_new_printf; ///
  GVariant* function(const(char)* signature) c_g_variant_new_signature; ///
  GVariant* function(const(char)* string_) c_g_variant_new_string; ///
  GVariant* function(const(char*)* strv, ptrdiff_t length) c_g_variant_new_strv; ///
  GVariant* function(char* string_) c_g_variant_new_take_string; ///
  GVariant* function(const(GVariant*)* children, size_t nChildren) c_g_variant_new_tuple; ///
  GVariant* function(ushort value) c_g_variant_new_uint16; ///
  GVariant* function(uint value) c_g_variant_new_uint32; ///
  GVariant* function(ulong value) c_g_variant_new_uint64; ///
  GVariant* function(const(char)* formatString, const(char*)* endptr, void** app) c_g_variant_new_va; ///
  GVariant* function(GVariant* value) c_g_variant_new_variant; ///
  GVariant* function(GVariant* value) c_g_variant_byteswap; ///
  gboolean function(GVariant* value, const(char)* formatString, gboolean copyOnly) c_g_variant_check_format_string; ///
  GVariantClass function(GVariant* value) c_g_variant_classify; ///
  int function(GVariant* one, GVariant* two) c_g_variant_compare; ///
  ubyte* function(GVariant* value, size_t* length) c_g_variant_dup_bytestring; ///
  char** function(GVariant* value, size_t* length) c_g_variant_dup_bytestring_array; ///
  char** function(GVariant* value, size_t* length) c_g_variant_dup_objv; ///
  char* function(GVariant* value, size_t* length) c_g_variant_dup_string; ///
  char** function(GVariant* value, size_t* length) c_g_variant_dup_strv; ///
  gboolean function(GVariant* one, GVariant* two) c_g_variant_equal; ///
  void function(GVariant* value, const(char)* formatString,  ...) c_g_variant_get; ///
  gboolean function(GVariant* value) c_g_variant_get_boolean; ///
  ubyte function(GVariant* value) c_g_variant_get_byte; ///
  const(char)* function(GVariant* value) c_g_variant_get_bytestring; ///
  const(char*)* function(GVariant* value, size_t* length) c_g_variant_get_bytestring_array; ///
  void function(GVariant* value, size_t index, const(char)* formatString,  ...) c_g_variant_get_child; ///
  GVariant* function(GVariant* value, size_t index) c_g_variant_get_child_value; ///
  const(void)* function(GVariant* value) c_g_variant_get_data; ///
  GBytes* function(GVariant* value) c_g_variant_get_data_as_bytes; ///
  double function(GVariant* value) c_g_variant_get_double; ///
  const(void)* function(GVariant* value, size_t* nElements, size_t elementSize) c_g_variant_get_fixed_array; ///
  int function(GVariant* value) c_g_variant_get_handle; ///
  short function(GVariant* value) c_g_variant_get_int16; ///
  int function(GVariant* value) c_g_variant_get_int32; ///
  long function(GVariant* value) c_g_variant_get_int64; ///
  GVariant* function(GVariant* value) c_g_variant_get_maybe; ///
  GVariant* function(GVariant* value) c_g_variant_get_normal_form; ///
  const(char*)* function(GVariant* value, size_t* length) c_g_variant_get_objv; ///
  size_t function(GVariant* value) c_g_variant_get_size; ///
  char* function(GVariant* value, size_t* length) c_g_variant_get_string; ///
  const(char*)* function(GVariant* value, size_t* length) c_g_variant_get_strv; ///
  const(GVariantType)* function(GVariant* value) c_g_variant_get_type; ///
  const(char)* function(GVariant* value) c_g_variant_get_type_string; ///
  ushort function(GVariant* value) c_g_variant_get_uint16; ///
  uint function(GVariant* value) c_g_variant_get_uint32; ///
  ulong function(GVariant* value) c_g_variant_get_uint64; ///
  void function(GVariant* value, const(char)* formatString, const(char*)* endptr, void** app) c_g_variant_get_va; ///
  GVariant* function(GVariant* value) c_g_variant_get_variant; ///
  uint function(GVariant* value) c_g_variant_hash; ///
  gboolean function(GVariant* value) c_g_variant_is_container; ///
  gboolean function(GVariant* value) c_g_variant_is_floating; ///
  gboolean function(GVariant* value) c_g_variant_is_normal_form; ///
  gboolean function(GVariant* value, const(GVariantType)* type) c_g_variant_is_of_type; ///
  GVariantIter* function(GVariant* value) c_g_variant_iter_new; ///
  gboolean function(GVariant* dictionary, const(char)* key, const(char)* formatString,  ...) c_g_variant_lookup; ///
  GVariant* function(GVariant* dictionary, const(char)* key, const(GVariantType)* expectedType) c_g_variant_lookup_value; ///
  size_t function(GVariant* value) c_g_variant_n_children; ///
  char* function(GVariant* value, gboolean typeAnnotate) c_g_variant_print; ///
  GString* function(GVariant* value, GString* string_, gboolean typeAnnotate) c_g_variant_print_string; ///
  GVariant* function(GVariant* value) c_g_variant_ref; ///
  GVariant* function(GVariant* value) c_g_variant_ref_sink; ///
  void function(GVariant* value, void* data) c_g_variant_store; ///
  GVariant* function(GVariant* value) c_g_variant_take_ref; ///
  void function(GVariant* value) c_g_variant_unref; ///
  gboolean function(const(char)* string_) c_g_variant_is_object_path; ///
  gboolean function(const(char)* string_) c_g_variant_is_signature; ///
  GVariant* function(const(GVariantType)* type, const(char)* text, const(char)* limit, const(char*)* endptr, GError** _err) c_g_variant_parse; ///
  char* function(GError* error, const(char)* sourceStr) c_g_variant_parse_error_print_context; ///
  GQuark function() c_g_variant_parse_error_quark; ///
  GQuark function() c_g_variant_parser_get_error_quark; ///

  // VariantBuilder
  GType function() c_g_variant_builder_get_type; ///
  GVariantBuilder* function(const(GVariantType)* type) c_g_variant_builder_new; ///
  void function(GVariantBuilder* builder, const(char)* formatString,  ...) c_g_variant_builder_add; ///
  void function(GVariantBuilder* builder, const(char)* format,  ...) c_g_variant_builder_add_parsed; ///
  void function(GVariantBuilder* builder, GVariant* value) c_g_variant_builder_add_value; ///
  void function(GVariantBuilder* builder) c_g_variant_builder_clear; ///
  void function(GVariantBuilder* builder) c_g_variant_builder_close; ///
  GVariant* function(GVariantBuilder* builder) c_g_variant_builder_end; ///
  void function(GVariantBuilder* builder, const(GVariantType)* type) c_g_variant_builder_init; ///
  void function(GVariantBuilder* builder, const(GVariantType)* type) c_g_variant_builder_open; ///
  GVariantBuilder* function(GVariantBuilder* builder) c_g_variant_builder_ref; ///
  void function(GVariantBuilder* builder) c_g_variant_builder_unref; ///

  // VariantDict
  GType function() c_g_variant_dict_get_type; ///
  GVariantDict* function(GVariant* fromAsv) c_g_variant_dict_new; ///
  void function(GVariantDict* dict) c_g_variant_dict_clear; ///
  gboolean function(GVariantDict* dict, const(char)* key) c_g_variant_dict_contains; ///
  GVariant* function(GVariantDict* dict) c_g_variant_dict_end; ///
  void function(GVariantDict* dict, GVariant* fromAsv) c_g_variant_dict_init; ///
  void function(GVariantDict* dict, const(char)* key, const(char)* formatString,  ...) c_g_variant_dict_insert; ///
  void function(GVariantDict* dict, const(char)* key, GVariant* value) c_g_variant_dict_insert_value; ///
  gboolean function(GVariantDict* dict, const(char)* key, const(char)* formatString,  ...) c_g_variant_dict_lookup; ///
  GVariant* function(GVariantDict* dict, const(char)* key, const(GVariantType)* expectedType) c_g_variant_dict_lookup_value; ///
  GVariantDict* function(GVariantDict* dict) c_g_variant_dict_ref; ///
  gboolean function(GVariantDict* dict, const(char)* key) c_g_variant_dict_remove; ///
  void function(GVariantDict* dict) c_g_variant_dict_unref; ///

  // VariantIter
  GVariantIter* function(GVariantIter* iter) c_g_variant_iter_copy; ///
  void function(GVariantIter* iter) c_g_variant_iter_free; ///
  size_t function(GVariantIter* iter, GVariant* value) c_g_variant_iter_init; ///
  gboolean function(GVariantIter* iter, const(char)* formatString,  ...) c_g_variant_iter_loop; ///
  size_t function(GVariantIter* iter) c_g_variant_iter_n_children; ///
  gboolean function(GVariantIter* iter, const(char)* formatString,  ...) c_g_variant_iter_next; ///
  GVariant* function(GVariantIter* iter) c_g_variant_iter_next_value; ///

  // VariantType
  GType function() c_g_variant_type_get_gtype; ///
  GVariantType* function(const(char)* typeString) c_g_variant_type_new; ///
  GVariantType* function(const(GVariantType)* element) c_g_variant_type_new_array; ///
  GVariantType* function(const(GVariantType)* key, const(GVariantType)* value) c_g_variant_type_new_dict_entry; ///
  GVariantType* function(const(GVariantType)* element) c_g_variant_type_new_maybe; ///
  GVariantType* function(const(GVariantType*)* items, int length) c_g_variant_type_new_tuple; ///
  GVariantType* function(const(GVariantType)* type) c_g_variant_type_copy; ///
  char* function(const(GVariantType)* type) c_g_variant_type_dup_string; ///
  const(GVariantType)* function(const(GVariantType)* type) c_g_variant_type_element; ///
  gboolean function(GVariantType* type1, GVariantType* type2) c_g_variant_type_equal; ///
  const(GVariantType)* function(const(GVariantType)* type) c_g_variant_type_first; ///
  void function(GVariantType* type) c_g_variant_type_free; ///
  size_t function(const(GVariantType)* type) c_g_variant_type_get_string_length; ///
  uint function(GVariantType* type) c_g_variant_type_hash; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_array; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_basic; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_container; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_definite; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_dict_entry; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_maybe; ///
  gboolean function(const(GVariantType)* type, const(GVariantType)* supertype) c_g_variant_type_is_subtype_of; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_tuple; ///
  gboolean function(const(GVariantType)* type) c_g_variant_type_is_variant; ///
  const(GVariantType)* function(const(GVariantType)* type) c_g_variant_type_key; ///
  size_t function(const(GVariantType)* type) c_g_variant_type_n_items; ///
  const(GVariantType)* function(const(GVariantType)* type) c_g_variant_type_next; ///
  const(char)* function(const(GVariantType)* type) c_g_variant_type_peek_string; ///
  const(GVariantType)* function(const(GVariantType)* type) c_g_variant_type_value; ///
  const(GVariantType)* function(const(char)* typeString) c_g_variant_type_checked_; ///
  size_t function(const(char)* typeString) c_g_variant_type_string_get_depth_; ///
  gboolean function(const(char)* typeString) c_g_variant_type_string_is_valid; ///
  gboolean function(const(char)* string_, const(char)* limit, const(char*)* endptr) c_g_variant_type_string_scan; ///

  // global
  int function(const(char)* filename, int mode) c_g_access; ///
  void* function(size_t nBlocks, size_t nBlockBytes, size_t alignment) c_g_aligned_alloc; ///
  void* function(size_t nBlocks, size_t nBlockBytes, size_t alignment) c_g_aligned_alloc0; ///
  void function(void* mem) c_g_aligned_free; ///
  void function(void* mem, size_t alignment, size_t size) c_g_aligned_free_sized; ///
  int function(char c) c_g_ascii_digit_value; ///
  char* function(char* buffer, int bufLen, double d) c_g_ascii_dtostr; ///
  char* function(char* buffer, int bufLen, const(char)* format, double d) c_g_ascii_formatd; ///
  int function(const(char)* s1, const(char)* s2) c_g_ascii_strcasecmp; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_ascii_strdown; ///
  gboolean function(const(char)* str, uint base, long min, long max, long* outNum, GError** _err) c_g_ascii_string_to_signed; ///
  gboolean function(const(char)* str, uint base, ulong min, ulong max, ulong* outNum, GError** _err) c_g_ascii_string_to_unsigned; ///
  int function(const(char)* s1, const(char)* s2, size_t n) c_g_ascii_strncasecmp; ///
  double function(const(char)* nptr, char** endptr) c_g_ascii_strtod; ///
  long function(const(char)* nptr, char** endptr, uint base) c_g_ascii_strtoll; ///
  ulong function(const(char)* nptr, char** endptr, uint base) c_g_ascii_strtoull; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_ascii_strup; ///
  char function(char c) c_g_ascii_tolower; ///
  char function(char c) c_g_ascii_toupper; ///
  int function(char c) c_g_ascii_xdigit_value; ///
  void function(const(char)* logDomain, const(char)* file, int line, const(char)* prettyFunction, const(char)* expression) c_g_assert_warning; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* message) c_g_assertion_message; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, ulong arg1, const(char)* cmp, ulong arg2, char numtype) c_g_assertion_message_cmpint; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, real arg1, const(char)* cmp, real arg2, char numtype) c_g_assertion_message_cmpnum; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(char)* arg1, const(char)* cmp, const(char)* arg2) c_g_assertion_message_cmpstr; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(char*)* arg1, const(char*)* arg2, size_t firstWrongIdx) c_g_assertion_message_cmpstrv; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr, const(GError)* error, GQuark errorDomain, int errorCode) c_g_assertion_message_error; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* expr) c_g_assertion_message_expr; ///
  void function(GVoidFunc func) c_g_atexit; ///
  int function(int* atomic, int val) c_g_atomic_int_add; ///
  uint function(uint* atomic, uint val) c_g_atomic_int_and; ///
  gboolean function(int* atomic, int oldval, int newval) c_g_atomic_int_compare_and_exchange; ///
  gboolean function(int* atomic, int oldval, int newval, int* preval) c_g_atomic_int_compare_and_exchange_full; ///
  gboolean function(int* atomic) c_g_atomic_int_dec_and_test; ///
  int function(int* atomic, int newval) c_g_atomic_int_exchange; ///
  int function(int* atomic, int val) c_g_atomic_int_exchange_and_add; ///
  int function(const(int)* atomic) c_g_atomic_int_get; ///
  void function(int* atomic) c_g_atomic_int_inc; ///
  uint function(uint* atomic, uint val) c_g_atomic_int_or; ///
  void function(int* atomic, int newval) c_g_atomic_int_set; ///
  uint function(uint* atomic, uint val) c_g_atomic_int_xor; ///
  ptrdiff_t function(void* atomic, ptrdiff_t val) c_g_atomic_pointer_add; ///
  size_t function(void* atomic, size_t val) c_g_atomic_pointer_and; ///
  gboolean function(void* atomic, void* oldval, void* newval) c_g_atomic_pointer_compare_and_exchange; ///
  gboolean function(void* atomic, void* oldval, void* newval, void* preval) c_g_atomic_pointer_compare_and_exchange_full; ///
  void* function(void* atomic, void* newval) c_g_atomic_pointer_exchange; ///
  void* function(void* atomic) c_g_atomic_pointer_get; ///
  size_t function(void* atomic, size_t val) c_g_atomic_pointer_or; ///
  void function(void* atomic, void* newval) c_g_atomic_pointer_set; ///
  size_t function(void* atomic, size_t val) c_g_atomic_pointer_xor; ///
  void* function(void* memBlock) c_g_atomic_rc_box_acquire; ///
  void* function(size_t blockSize) c_g_atomic_rc_box_alloc; ///
  void* function(size_t blockSize) c_g_atomic_rc_box_alloc0; ///
  void* function(size_t blockSize, const(void)* memBlock) c_g_atomic_rc_box_dup; ///
  size_t function(void* memBlock) c_g_atomic_rc_box_get_size; ///
  void function(void* memBlock) c_g_atomic_rc_box_release; ///
  void function(void* memBlock, GDestroyNotify clearFunc) c_g_atomic_rc_box_release_full; ///
  gboolean function(int* arc, int val) c_g_atomic_ref_count_compare; ///
  gboolean function(int* arc) c_g_atomic_ref_count_dec; ///
  void function(int* arc) c_g_atomic_ref_count_inc; ///
  void function(int* arc) c_g_atomic_ref_count_init; ///
  ubyte* function(const(char)* text, size_t* outLen) c_g_base64_decode; ///
  ubyte* function(ubyte* text, size_t* outLen) c_g_base64_decode_inplace; ///
  size_t function(const(ubyte)* in_, size_t len, ubyte* out_, int* state, uint* save) c_g_base64_decode_step; ///
  char* function(const(ubyte)* data, size_t len) c_g_base64_encode; ///
  size_t function(gboolean breakLines, char* out_, int* state, int* save) c_g_base64_encode_close; ///
  size_t function(const(ubyte)* in_, size_t len, gboolean breakLines, char* out_, int* state, int* save) c_g_base64_encode_step; ///
  const(char)* function(const(char)* fileName) c_g_basename; ///
  void function(int* address, int lockBit) c_g_bit_lock; ///
  int function(gulong mask, int nthBit) c_g_bit_nth_lsf; ///
  int function(gulong mask, int nthBit) c_g_bit_nth_msf; ///
  uint function(gulong number) c_g_bit_storage; ///
  gboolean function(int* address, int lockBit) c_g_bit_trylock; ///
  void function(int* address, int lockBit) c_g_bit_unlock; ///
  void function() c_g_blow_chunks; ///
  char* function(const(char)* firstElement,  ...) c_g_build_filename; ///
  char* function(const(char)* firstElement, void** args) c_g_build_filename_valist; ///
  char* function(char** args) c_g_build_filenamev; ///
  char* function(const(char)* separator, const(char)* firstElement,  ...) c_g_build_path; ///
  char* function(const(char)* separator, char** args) c_g_build_pathv; ///
  char* function(const(char)* filename, const(char)* relativeTo) c_g_canonicalize_filename; ///
  int function(const(char)* path) c_g_chdir; ///
  const(char)* function(uint requiredMajor, uint requiredMinor, uint requiredMicro) c_glib_check_version; ///
  uint function(GPid pid, GChildWatchFunc function_, void* data) c_g_child_watch_add; ///
  uint function(int priority, GPid pid, GChildWatchFunc function_, void* data, GDestroyNotify notify) c_g_child_watch_add_full; ///
  GSource* function(GPid pid) c_g_child_watch_source_new; ///
  int function(const(char)* filename, int mode) c_g_chmod; ///
  void function(GError** _err) c_g_clear_error; ///
  void function(uint* tagPtr, GClearHandleFunc clearFunc) c_g_clear_handle_id; ///
  void function(GList** listPtr, GDestroyNotify destroy) c_g_clear_list; ///
  void function(void** pp, GDestroyNotify destroy) c_g_clear_pointer; ///
  void function(GSList** slistPtr, GDestroyNotify destroy) c_g_clear_slist; ///
  gboolean function(int fd, GError** _err) c_g_close; ///
  int function(int lowfd) c_g_closefrom; ///
  char* function(GChecksumType checksumType, GBytes* data) c_g_compute_checksum_for_bytes; ///
  char* function(GChecksumType checksumType, const(ubyte)* data, size_t length) c_g_compute_checksum_for_data; ///
  char* function(GChecksumType checksumType, const(char)* str, ptrdiff_t length) c_g_compute_checksum_for_string; ///
  char* function(GChecksumType digestType, GBytes* key, GBytes* data) c_g_compute_hmac_for_bytes; ///
  char* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen, const(ubyte)* data, size_t length) c_g_compute_hmac_for_data; ///
  char* function(GChecksumType digestType, const(ubyte)* key, size_t keyLen, const(char)* str, ptrdiff_t length) c_g_compute_hmac_for_string; ///
  ubyte* function(const(ubyte)* str, ptrdiff_t len, const(char)* toCodeset, const(char)* fromCodeset, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_convert; ///
  GQuark function() c_g_convert_error_quark; ///
  ubyte* function(const(ubyte)* str, ptrdiff_t len, const(char)* toCodeset, const(char)* fromCodeset, const(char)* fallback, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_convert_with_fallback; ///
  ubyte* function(const(ubyte)* str, ptrdiff_t len, GIConv converter, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_convert_with_iconv; ///
  int function(const(char)* filename, int mode) c_g_creat; ///
  void function(GData** datalist) c_g_datalist_clear; ///
  void function(GData** datalist, GDataForeachFunc func, void* userData) c_g_datalist_foreach; ///
  void* function(GData** datalist, const(char)* key) c_g_datalist_get_data; ///
  uint function(GData** datalist) c_g_datalist_get_flags; ///
  void* function(GData** datalist, GQuark keyId, GDuplicateFunc dupFunc, void* userData) c_g_datalist_id_dup_data; ///
  void* function(GData** datalist, GQuark keyId) c_g_datalist_id_get_data; ///
  void function(GData** datalist, GQuark* keys, size_t nKeys) c_g_datalist_id_remove_multiple; ///
  void* function(GData** datalist, GQuark keyId) c_g_datalist_id_remove_no_notify; ///
  gboolean function(GData** datalist, GQuark keyId, void* oldval, void* newval, GDestroyNotify destroy, GDestroyNotify* oldDestroy) c_g_datalist_id_replace_data; ///
  void function(GData** datalist, GQuark keyId, void* data, GDestroyNotify destroyFunc) c_g_datalist_id_set_data_full; ///
  void function(GData** datalist) c_g_datalist_init; ///
  void function(GData** datalist, uint flags) c_g_datalist_set_flags; ///
  void function(GData** datalist, uint flags) c_g_datalist_unset_flags; ///
  void function(const(void)* datasetLocation) c_g_dataset_destroy; ///
  void function(const(void)* datasetLocation, GDataForeachFunc func, void* userData) c_g_dataset_foreach; ///
  void* function(const(void)* datasetLocation, GQuark keyId) c_g_dataset_id_get_data; ///
  void* function(const(void)* datasetLocation, GQuark keyId) c_g_dataset_id_remove_no_notify; ///
  void function(const(void)* datasetLocation, GQuark keyId, void* data, GDestroyNotify destroyFunc) c_g_dataset_id_set_data_full; ///
  const(char)* function(const(char)* domain, const(char)* msgid, int category) c_g_dcgettext; ///
  const(char)* function(const(char)* domain, const(char)* msgid) c_g_dgettext; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_direct_equal; ///
  uint function(const(void)* v) c_g_direct_hash; ///
  const(char)* function(const(char)* domain, const(char)* msgid, const(char)* msgidPlural, gulong n) c_g_dngettext; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_double_equal; ///
  uint function(const(void)* v) c_g_double_hash; ///
  const(char)* function(const(char)* domain, const(char)* msgctxtid, size_t msgidoffset) c_g_dpgettext; ///
  const(char)* function(const(char)* domain, const(char)* context, const(char)* msgid) c_g_dpgettext2; ///
  const(char)* function(char** envp, const(char)* variable) c_g_environ_getenv; ///
  char** function(char** envp, const(char)* variable, const(char)* value, gboolean overwrite) c_g_environ_setenv; ///
  char** function(char** envp, const(char)* variable) c_g_environ_unsetenv; ///
  int function(int lowfd) c_g_fdwalk_set_cloexec; ///
  GFileError function(int errNo) c_g_file_error_from_errno; ///
  GQuark function() c_g_file_error_quark; ///
  gboolean function(const(char)* filename, ubyte** contents, size_t* length, GError** _err) c_g_file_get_contents; ///
  int function(const(char)* tmpl, char** nameUsed, GError** _err) c_g_file_open_tmp; ///
  char* function(const(char)* filename, GError** _err) c_g_file_read_link; ///
  gboolean function(const(char)* filename, const(ubyte)* contents, ptrdiff_t length, GError** _err) c_g_file_set_contents; ///
  gboolean function(const(char)* filename, const(ubyte)* contents, ptrdiff_t length, GFileSetContentsFlags flags, int mode, GError** _err) c_g_file_set_contents_full; ///
  gboolean function(const(char)* filename, GFileTest test) c_g_file_test; ///
  char* function(const(char)* filename) c_g_filename_display_basename; ///
  char* function(const(char)* filename) c_g_filename_display_name; ///
  char* function(const(char)* uri, char** hostname, GError** _err) c_g_filename_from_uri; ///
  ubyte* function(const(ubyte)* utf8string, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_filename_from_utf8; ///
  char* function(const(char)* filename, const(char)* hostname, GError** _err) c_g_filename_to_uri; ///
  char* function(const(ubyte)* opsysstring, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_filename_to_utf8; ///
  char* function(const(char)* program) c_g_find_program_in_path; ///
  void* function(const(char)* filename, const(char)* mode) c_g_fopen; ///
  char* function(ulong size) c_g_format_size; ///
  char* function(long size) c_g_format_size_for_display; ///
  char* function(ulong size, GFormatSizeFlags flags) c_g_format_size_full; ///
  int function(void* file, const(char)* format,  ...) c_g_fprintf; ///
  void function(void* mem) c_g_free; ///
  void function(void* mem, size_t size) c_g_free_sized; ///
  void* function(const(char)* filename, const(char)* mode, void* stream) c_g_freopen; ///
  int function(int fd) c_g_fsync; ///
  const(char)* function() c_g_get_application_name; ///
  gboolean function(const(char*)* charset) c_g_get_charset; ///
  char* function() c_g_get_codeset; ///
  gboolean function(const(char*)* charset) c_g_get_console_charset; ///
  char* function() c_g_get_current_dir; ///
  void function(GTimeVal* result) c_g_get_current_time; ///
  char** function() c_g_get_environ; ///
  gboolean function(const(char**)* filenameCharsets) c_g_get_filename_charsets; ///
  const(char)* function() c_g_get_home_dir; ///
  const(char)* function() c_g_get_host_name; ///
  const(char*)* function() c_g_get_language_names; ///
  const(char*)* function(const(char)* categoryName) c_g_get_language_names_with_category; ///
  char** function(const(char)* locale) c_g_get_locale_variants; ///
  long function() c_g_get_monotonic_time; ///
  uint function() c_g_get_num_processors; ///
  char* function(const(char)* keyName) c_g_get_os_info; ///
  const(char)* function() c_g_get_prgname; ///
  const(char)* function() c_g_get_real_name; ///
  long function() c_g_get_real_time; ///
  const(char*)* function() c_g_get_system_config_dirs; ///
  const(char*)* function() c_g_get_system_data_dirs; ///
  const(char)* function() c_g_get_tmp_dir; ///
  const(char)* function() c_g_get_user_cache_dir; ///
  const(char)* function() c_g_get_user_config_dir; ///
  const(char)* function() c_g_get_user_data_dir; ///
  const(char)* function() c_g_get_user_name; ///
  const(char)* function() c_g_get_user_runtime_dir; ///
  const(char)* function(GUserDirectory directory) c_g_get_user_special_dir; ///
  const(char)* function() c_g_get_user_state_dir; ///
  const(char)* function(const(char)* variable) c_g_getenv; ///
  gboolean function(const(char)* hostname) c_g_hostname_is_ascii_encoded; ///
  gboolean function(const(char)* hostname) c_g_hostname_is_ip_address; ///
  gboolean function(const(char)* hostname) c_g_hostname_is_non_ascii; ///
  char* function(const(char)* hostname) c_g_hostname_to_ascii; ///
  char* function(const(char)* hostname) c_g_hostname_to_unicode; ///
  size_t function(GIConv converter, char** inbuf, size_t* inbytesLeft, char** outbuf, size_t* outbytesLeft) c_g_iconv; ///
  uint function(GSourceFunc function_, void* data) c_g_idle_add; ///
  uint function(int priority, GSourceFunc function_, void* data, GDestroyNotify notify) c_g_idle_add_full; ///
  uint function(GSourceOnceFunc function_, void* data) c_g_idle_add_once; ///
  gboolean function(void* data) c_g_idle_remove_by_data; ///
  GSource* function() c_g_idle_source_new; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_int64_equal; ///
  uint function(const(void)* v) c_g_int64_hash; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_int_equal; ///
  uint function(const(void)* v) c_g_int_hash; ///
  const(char)* function(const(char)* string_) c_g_intern_static_string; ///
  const(char)* function(const(char)* string_) c_g_intern_string; ///
  uint function(GIOChannel* channel, GIOCondition condition, GIOFunc func, void* userData) c_g_io_add_watch; ///
  uint function(GIOChannel* channel, int priority, GIOCondition condition, GIOFunc func, void* userData, GDestroyNotify notify) c_g_io_add_watch_full; ///
  GSource* function(GIOChannel* channel, GIOCondition condition) c_g_io_create_watch; ///
  char** function() c_g_listenv; ///
  ubyte* function(const(ubyte)* utf8string, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_locale_from_utf8; ///
  char* function(const(ubyte)* opsysstring, ptrdiff_t len, size_t* bytesRead, size_t* bytesWritten, GError** _err) c_g_locale_to_utf8; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* format,  ...) c_g_log; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* unusedData) c_g_log_default_handler; ///
  gboolean function() c_g_log_get_debug_enabled; ///
  void function(const(char)* logDomain, uint handlerId) c_g_log_remove_handler; ///
  GLogLevelFlags function(GLogLevelFlags fatalMask) c_g_log_set_always_fatal; ///
  void function(gboolean enabled) c_g_log_set_debug_enabled; ///
  GLogFunc function(GLogFunc logFunc, void* userData) c_g_log_set_default_handler; ///
  GLogLevelFlags function(const(char)* logDomain, GLogLevelFlags fatalMask) c_g_log_set_fatal_mask; ///
  uint function(const(char)* logDomain, GLogLevelFlags logLevels, GLogFunc logFunc, void* userData) c_g_log_set_handler; ///
  uint function(const(char)* logDomain, GLogLevelFlags logLevels, GLogFunc logFunc, void* userData, GDestroyNotify destroy) c_g_log_set_handler_full; ///
  void function(GLogWriterFunc func, void* userData, GDestroyNotify userDataFree) c_g_log_set_writer_func; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel,  ...) c_g_log_structured; ///
  void function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields) c_g_log_structured_array; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* file, const(char)* line, const(char)* func, const(char)* messageFormat,  ...) c_g_log_structured_standard; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, GVariant* fields) c_g_log_variant; ///
  GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) c_g_log_writer_default; ///
  void function(const(char*)* domains) c_g_log_writer_default_set_debug_domains; ///
  void function(gboolean useStderr) c_g_log_writer_default_set_use_stderr; ///
  gboolean function(GLogLevelFlags logLevel, const(char)* logDomain) c_g_log_writer_default_would_drop; ///
  char* function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, gboolean useColor) c_g_log_writer_format_fields; ///
  gboolean function(int outputFd) c_g_log_writer_is_journald; ///
  GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) c_g_log_writer_journald; ///
  GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) c_g_log_writer_standard_streams; ///
  gboolean function(int outputFd) c_g_log_writer_supports_color; ///
  GLogWriterOutput function(GLogLevelFlags logLevel, const(GLogField)* fields, size_t nFields, void* userData) c_g_log_writer_syslog; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* format, void* args) c_g_logv; ///
  int function(const(char)* filename, GStatBuf* buf) c_g_lstat; ///
  GSource* function() c_g_main_current_source; ///
  int function() c_g_main_depth; ///
  void* function(size_t nBytes) c_g_malloc; ///
  void* function(size_t nBytes) c_g_malloc0; ///
  void* function(size_t nBlocks, size_t nBlockBytes) c_g_malloc0_n; ///
  void* function(size_t nBlocks, size_t nBlockBytes) c_g_malloc_n; ///
  gboolean function(const(char)* elementName, const(char*)* attributeNames, const(char*)* attributeValues, GError** error, GMarkupCollectType firstType, const(char)* firstAttr,  ...) c_g_markup_collect_attributes; ///
  GQuark function() c_g_markup_error_quark; ///
  char* function(const(char)* text, ptrdiff_t length) c_g_markup_escape_text; ///
  char* function(const(char)* format,  ...) c_g_markup_printf_escaped; ///
  char* function(const(char)* format, void* args) c_g_markup_vprintf_escaped; ///
  gboolean function() c_g_mem_is_system_malloc; ///
  void function() c_g_mem_profile; ///
  void function(GMemVTable* vtable) c_g_mem_set_vtable; ///
  void* function(const(void)* mem, uint byteSize) c_g_memdup; ///
  void* function(const(void)* mem, size_t byteSize) c_g_memdup2; ///
  int function(const(char)* filename, int mode) c_g_mkdir; ///
  int function(const(char)* pathname, int mode) c_g_mkdir_with_parents; ///
  char* function(char* tmpl) c_g_mkdtemp; ///
  char* function(char* tmpl, int mode) c_g_mkdtemp_full; ///
  int function(char* tmpl) c_g_mkstemp; ///
  int function(char* tmpl, int flags, int mode) c_g_mkstemp_full; ///
  void function(void** nullifyLocation) c_g_nullify_pointer; ///
  GQuark function() c_g_number_parser_error_quark; ///
  void function(const(char)* prgName) c_g_on_error_query; ///
  void function(const(char)* prgName) c_g_on_error_stack_trace; ///
  int function(const(char)* filename, int flags, int mode) c_g_open; ///
  GQuark function() c_g_option_error_quark; ///
  uint function(const(char)* string_, const(GDebugKey)* keys, uint nkeys) c_g_parse_debug_string; ///
  char* function(const(char)* fileName) c_g_path_get_basename; ///
  char* function(const(char)* fileName) c_g_path_get_dirname; ///
  gboolean function(const(char)* fileName) c_g_path_is_absolute; ///
  const(char)* function(const(char)* fileName) c_g_path_skip_root; ///
  gboolean function(GPatternSpec* pspec, uint stringLength, const(char)* string_, const(char)* stringReversed) c_g_pattern_match; ///
  gboolean function(const(char)* pattern, const(char)* string_) c_g_pattern_match_simple; ///
  gboolean function(GPatternSpec* pspec, const(char)* string_) c_g_pattern_match_string; ///
  void function(void* address, int lockBit) c_g_pointer_bit_lock; ///
  void function(void* address, uint lockBit, size_t* outPtr) c_g_pointer_bit_lock_and_get; ///
  void* function(void* ptr, uint lockBit, gboolean set, size_t preserveMask, void* preservePtr) c_g_pointer_bit_lock_mask_ptr; ///
  gboolean function(void* address, int lockBit) c_g_pointer_bit_trylock; ///
  void function(void* address, int lockBit) c_g_pointer_bit_unlock; ///
  void function(void* address, uint lockBit, void* ptr, size_t preserveMask) c_g_pointer_bit_unlock_and_set; ///
  int function(GPollFD* fds, uint nfds, int timeout) c_g_poll; ///
  void function(GError** err, const(char)* format,  ...) c_g_prefix_error; ///
  void function(GError** err, const(char)* prefix) c_g_prefix_error_literal; ///
  void function(const(char)* format,  ...) c_g_print; ///
  void function(const(char)* format,  ...) c_g_printerr; ///
  int function(const(char)* format,  ...) c_g_printf; ///
  size_t function(const(char)* format, void* args) c_g_printf_string_upper_bound; ///
  void function(GError** dest, GError* src) c_g_propagate_error; ///
  void function(GError** dest, GError* src, const(char)* format,  ...) c_g_propagate_prefixed_error; ///
  void function(const(void)* pbase, int totalElems, size_t size, GCompareDataFunc compareFunc, void* userData) c_g_qsort_with_data; ///
  GQuark function(const(char)* string_) c_g_quark_from_static_string; ///
  GQuark function(const(char)* string_) c_g_quark_from_string; ///
  const(char)* function(GQuark quark) c_g_quark_to_string; ///
  GQuark function(const(char)* string_) c_g_quark_try_string; ///
  double function() c_g_random_double; ///
  double function(double begin, double end) c_g_random_double_range; ///
  uint function() c_g_random_int; ///
  int function(int begin, int end) c_g_random_int_range; ///
  void function(uint seed) c_g_random_set_seed; ///
  void* function(void* memBlock) c_g_rc_box_acquire; ///
  void* function(size_t blockSize) c_g_rc_box_alloc; ///
  void* function(size_t blockSize) c_g_rc_box_alloc0; ///
  void* function(size_t blockSize, const(void)* memBlock) c_g_rc_box_dup; ///
  size_t function(void* memBlock) c_g_rc_box_get_size; ///
  void function(void* memBlock) c_g_rc_box_release; ///
  void function(void* memBlock, GDestroyNotify clearFunc) c_g_rc_box_release_full; ///
  void* function(void* mem, size_t nBytes) c_g_realloc; ///
  void* function(void* mem, size_t nBlocks, size_t nBlockBytes) c_g_realloc_n; ///
  gboolean function(int* rc, int val) c_g_ref_count_compare; ///
  gboolean function(int* rc) c_g_ref_count_dec; ///
  void function(int* rc) c_g_ref_count_inc; ///
  void function(int* rc) c_g_ref_count_init; ///
  char* function(char* str) c_g_ref_string_acquire; ///
  size_t function(char* str) c_g_ref_string_length; ///
  char* function(const(char)* str) c_g_ref_string_new; ///
  char* function(const(char)* str) c_g_ref_string_new_intern; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_ref_string_new_len; ///
  void function(char* str) c_g_ref_string_release; ///
  void function() c_g_reload_user_special_dirs_cache; ///
  int function(const(char)* filename) c_g_remove; ///
  int function(const(char)* oldfilename, const(char)* newfilename) c_g_rename; ///
  void function(const(char)* logDomain, const(char)* prettyFunction, const(char)* expression) c_g_return_if_fail_warning; ///
  int function(const(char)* filename) c_g_rmdir; ///
  void function(const(char)* applicationName) c_g_set_application_name; ///
  void function(GError** err, GQuark domain, int code, const(char)* format,  ...) c_g_set_error; ///
  void function(GError** err, GQuark domain, int code, const(char)* message) c_g_set_error_literal; ///
  void function(const(char)* prgname) c_g_set_prgname; ///
  GPrintFunc function(GPrintFunc func) c_g_set_print_handler; ///
  GPrintFunc function(GPrintFunc func) c_g_set_printerr_handler; ///
  gboolean function(const(char)* variable, const(char)* value, gboolean overwrite) c_g_setenv; ///
  GQuark function() c_g_shell_error_quark; ///
  gboolean function(const(char)* commandLine, int* argcp, char*** argvp, GError** _err) c_g_shell_parse_argv; ///
  char* function(const(char)* unquotedString) c_g_shell_quote; ///
  char* function(const(char)* quotedString, GError** _err) c_g_shell_unquote; ///
  void* function(size_t blockSize) c_g_slice_alloc; ///
  void* function(size_t blockSize) c_g_slice_alloc0; ///
  void* function(size_t blockSize, const(void)* memBlock) c_g_slice_copy; ///
  void function(size_t blockSize, void* memBlock) c_g_slice_free1; ///
  void function(size_t blockSize, void* memChain, size_t nextOffset) c_g_slice_free_chain_with_offset; ///
  long function(GSliceConfig ckey) c_g_slice_get_config; ///
  const(long)* function(GSliceConfig ckey, long address, uint* nValues) c_g_slice_get_config_state; ///
  void function(GSliceConfig ckey, long value) c_g_slice_set_config; ///
  int function(char* string_, gulong n, const(char)* format,  ...) c_g_snprintf; ///
  uint function(uint num) c_g_spaced_primes_closest; ///
  gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, GError** _err) c_g_spawn_async; ///
  gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, int stdinFd, int stdoutFd, int stderrFd, GError** _err) c_g_spawn_async_with_fds; ///
  gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, GPid* childPid, int* standardInput, int* standardOutput, int* standardError, GError** _err) c_g_spawn_async_with_pipes; ///
  gboolean function(const(char)* workingDirectory, const(char*)* argv, const(char*)* envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, int stdinFd, int stdoutFd, int stderrFd, const(int)* sourceFds, const(int)* targetFds, size_t nFds, GPid* childPidOut, int* stdinPipeOut, int* stdoutPipeOut, int* stderrPipeOut, GError** _err) c_g_spawn_async_with_pipes_and_fds; ///
  gboolean function(int waitStatus, GError** _err) c_g_spawn_check_exit_status; ///
  gboolean function(int waitStatus, GError** _err) c_g_spawn_check_wait_status; ///
  void function(GPid pid) c_g_spawn_close_pid; ///
  gboolean function(const(char)* commandLine, GError** _err) c_g_spawn_command_line_async; ///
  gboolean function(const(char)* commandLine, char** standardOutput, char** standardError, int* waitStatus, GError** _err) c_g_spawn_command_line_sync; ///
  GQuark function() c_g_spawn_error_quark; ///
  GQuark function() c_g_spawn_exit_error_quark; ///
  gboolean function(const(char)* workingDirectory, char** argv, char** envp, GSpawnFlags flags, GSpawnChildSetupFunc childSetup, void* userData, char** standardOutput, char** standardError, int* waitStatus, GError** _err) c_g_spawn_sync; ///
  int function(char* string_, const(char)* format,  ...) c_g_sprintf; ///
  int function(const(char)* filename, GStatBuf* buf) c_g_stat; ///
  char* function(char* dest, const(char)* src) c_g_stpcpy; ///
  gboolean function(const(void)* v1, const(void)* v2) c_g_str_equal; ///
  gboolean function(const(char)* str, const(char)* prefix) c_g_str_has_prefix; ///
  gboolean function(const(char)* str, const(char)* suffix) c_g_str_has_suffix; ///
  uint function(const(void)* v) c_g_str_hash; ///
  gboolean function(const(char)* str) c_g_str_is_ascii; ///
  gboolean function(const(char)* searchTerm, const(char)* potentialHit, gboolean acceptAlternates) c_g_str_match_string; ///
  char* function(const(char)* str, const(char)* fromLocale) c_g_str_to_ascii; ///
  char** function(const(char)* string_, const(char)* translitLocale, char*** asciiAlternates) c_g_str_tokenize_and_fold; ///
  char* function(char* string_, const(char)* validChars, char substitutor) c_g_strcanon; ///
  int function(const(char)* s1, const(char)* s2) c_g_strcasecmp; ///
  char* function(char* string_) c_g_strchomp; ///
  char* function(char* string_) c_g_strchug; ///
  int function(const(char)* str1, const(char)* str2) c_g_strcmp0; ///
  char* function(const(char)* source) c_g_strcompress; ///
  char* function(const(char)* string1,  ...) c_g_strconcat; ///
  char* function(char* string_, const(char)* delimiters, char newDelimiter) c_g_strdelimit; ///
  char* function(char* string_) c_g_strdown; ///
  char* function(const(char)* str) c_g_strdup; ///
  char* function(const(char)* format,  ...) c_g_strdup_printf; ///
  char* function(const(char)* format, void* args) c_g_strdup_vprintf; ///
  char** function(char** strArray) c_g_strdupv; ///
  const(char)* function(int errnum) c_g_strerror; ///
  char* function(const(char)* source, const(char)* exceptions) c_g_strescape; ///
  void function(char** strArray) c_g_strfreev; ///
  const(char)* function(const(char)* msgid, const(char)* msgval) c_g_strip_context; ///
  char* function(const(char)* separator,  ...) c_g_strjoin; ///
  char* function(const(char)* separator, char** strArray) c_g_strjoinv; ///
  size_t function(char* dest, const(char)* src, size_t destSize) c_g_strlcat; ///
  size_t function(char* dest, const(char)* src, size_t destSize) c_g_strlcpy; ///
  int function(const(char)* s1, const(char)* s2, uint n) c_g_strncasecmp; ///
  char* function(const(char)* str, size_t n) c_g_strndup; ///
  char* function(size_t length, char fillChar) c_g_strnfill; ///
  char* function(char* string_) c_g_strreverse; ///
  char* function(const(char)* haystack, const(char)* needle) c_g_strrstr; ///
  char* function(const(char)* haystack, ptrdiff_t haystackLen, const(char)* needle) c_g_strrstr_len; ///
  const(char)* function(int signum) c_g_strsignal; ///
  char** function(const(char)* string_, const(char)* delimiter, int maxTokens) c_g_strsplit; ///
  char** function(const(char)* string_, const(char)* delimiters, int maxTokens) c_g_strsplit_set; ///
  char* function(const(char)* haystack, ptrdiff_t haystackLen, const(char)* needle) c_g_strstr_len; ///
  double function(const(char)* nptr, char** endptr) c_g_strtod; ///
  char* function(char* string_) c_g_strup; ///
  gboolean function(const(char*)* strv, const(char)* str) c_g_strv_contains; ///
  gboolean function(const(char*)* strv1, const(char*)* strv2) c_g_strv_equal; ///
  GType function() c_g_strv_get_type; ///
  uint function(char** strArray) c_g_strv_length; ///
  void function(const(char)* testpath, const(void)* testData, GTestDataFunc testFunc) c_g_test_add_data_func; ///
  void function(const(char)* testpath, void* testData, GTestDataFunc testFunc, GDestroyNotify dataFreeFunc) c_g_test_add_data_func_full; ///
  void function(const(char)* testpath, GTestFunc testFunc) c_g_test_add_func; ///
  void function(const(char)* testpath, size_t dataSize, const(void)* testData, GTestFixtureFunc dataSetup, GTestFixtureFunc dataTest, GTestFixtureFunc dataTeardown) c_g_test_add_vtable; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func) c_g_test_assert_expected_messages_internal; ///
  void function(const(char)* bugUriSnippet) c_g_test_bug; ///
  void function(const(char)* uriPattern) c_g_test_bug_base; ///
  char* function(GTestFileType fileType, const(char)* firstPath,  ...) c_g_test_build_filename; ///
  GTestCase* function(const(char)* testName, size_t dataSize, const(void)* testData, GTestFixtureFunc dataSetup, GTestFixtureFunc dataTest, GTestFixtureFunc dataTeardown) c_g_test_create_case; ///
  GTestSuite* function(const(char)* suiteName) c_g_test_create_suite; ///
  void function() c_g_test_disable_crash_reporting; ///
  void function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* pattern) c_g_test_expect_message; ///
  void function() c_g_test_fail; ///
  void function(const(char)* format,  ...) c_g_test_fail_printf; ///
  gboolean function() c_g_test_failed; ///
  const(char)* function(GTestFileType fileType) c_g_test_get_dir; ///
  const(char)* function(GTestFileType fileType, const(char)* firstPath,  ...) c_g_test_get_filename; ///
  const(char)* function() c_g_test_get_path; ///
  GTestSuite* function() c_g_test_get_root; ///
  void function(const(char)* msg) c_g_test_incomplete; ///
  void function(const(char)* format,  ...) c_g_test_incomplete_printf; ///
  void function(int* argc, char*** argv,  ...) c_g_test_init; ///
  void function(GTestLogFatalFunc logFunc, void* userData) c_g_test_log_set_fatal_handler; ///
  const(char)* function(GTestLogType logType) c_g_test_log_type_name; ///
  void function(double maximizedQuantity, const(char)* format,  ...) c_g_test_maximized_result; ///
  void function(const(char)* format,  ...) c_g_test_message; ///
  void function(double minimizedQuantity, const(char)* format,  ...) c_g_test_minimized_result; ///
  void function(GDestroyNotify destroyFunc, void* destroyData) c_g_test_queue_destroy; ///
  void function(void* gfreePointer) c_g_test_queue_free; ///
  double function() c_g_test_rand_double; ///
  double function(double rangeStart, double rangeEnd) c_g_test_rand_double_range; ///
  int function() c_g_test_rand_int; ///
  int function(int begin, int end) c_g_test_rand_int_range; ///
  int function() c_g_test_run; ///
  int function(GTestSuite* suite) c_g_test_run_suite; ///
  void function() c_g_test_set_nonfatal_assertions; ///
  void function(const(char)* msg) c_g_test_skip; ///
  void function(const(char)* format,  ...) c_g_test_skip_printf; ///
  gboolean function() c_g_test_subprocess; ///
  void function(const(char)* summary) c_g_test_summary; ///
  double function() c_g_test_timer_elapsed; ///
  double function() c_g_test_timer_last; ///
  void function() c_g_test_timer_start; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, ulong assertionFlags, const(char)* pattern) c_g_test_trap_assertions; ///
  gboolean function(ulong usecTimeout, GTestTrapFlags testTrapFlags) c_g_test_trap_fork; ///
  gboolean function() c_g_test_trap_has_passed; ///
  gboolean function() c_g_test_trap_reached_timeout; ///
  void function(const(char)* testPath, ulong usecTimeout, GTestSubprocessFlags testFlags) c_g_test_trap_subprocess; ///
  void function(const(char)* testPath, const(char*)* envp, ulong usecTimeout, GTestSubprocessFlags testFlags) c_g_test_trap_subprocess_with_envp; ///
  uint function(uint interval, GSourceFunc function_, void* data) c_g_timeout_add; ///
  uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) c_g_timeout_add_full; ///
  uint function(uint interval, GSourceOnceFunc function_, void* data) c_g_timeout_add_once; ///
  uint function(uint interval, GSourceFunc function_, void* data) c_g_timeout_add_seconds; ///
  uint function(int priority, uint interval, GSourceFunc function_, void* data, GDestroyNotify notify) c_g_timeout_add_seconds_full; ///
  uint function(uint interval, GSourceOnceFunc function_, void* data) c_g_timeout_add_seconds_once; ///
  GSource* function(uint interval) c_g_timeout_source_new; ///
  GSource* function(uint interval) c_g_timeout_source_new_seconds; ///
  void* function(size_t nBytes) c_g_try_malloc; ///
  void* function(size_t nBytes) c_g_try_malloc0; ///
  void* function(size_t nBlocks, size_t nBlockBytes) c_g_try_malloc0_n; ///
  void* function(size_t nBlocks, size_t nBlockBytes) c_g_try_malloc_n; ///
  void* function(void* mem, size_t nBytes) c_g_try_realloc; ///
  void* function(void* mem, size_t nBlocks, size_t nBlockBytes) c_g_try_realloc_n; ///
  ushort* function(const(dchar)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_ucs4_to_utf16; ///
  char* function(const(dchar)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_ucs4_to_utf8; ///
  GUnicodeBreakType function(dchar c) c_g_unichar_break_type; ///
  int function(dchar uc) c_g_unichar_combining_class; ///
  gboolean function(dchar a, dchar b, dchar* ch) c_g_unichar_compose; ///
  gboolean function(dchar ch, dchar* a, dchar* b) c_g_unichar_decompose; ///
  int function(dchar c) c_g_unichar_digit_value; ///
  size_t function(dchar ch, gboolean compat, dchar* result, size_t resultLen) c_g_unichar_fully_decompose; ///
  gboolean function(dchar ch, dchar* mirroredCh) c_g_unichar_get_mirror_char; ///
  GUnicodeScript function(dchar ch) c_g_unichar_get_script; ///
  gboolean function(dchar c) c_g_unichar_isalnum; ///
  gboolean function(dchar c) c_g_unichar_isalpha; ///
  gboolean function(dchar c) c_g_unichar_iscntrl; ///
  gboolean function(dchar c) c_g_unichar_isdefined; ///
  gboolean function(dchar c) c_g_unichar_isdigit; ///
  gboolean function(dchar c) c_g_unichar_isgraph; ///
  gboolean function(dchar c) c_g_unichar_islower; ///
  gboolean function(dchar c) c_g_unichar_ismark; ///
  gboolean function(dchar c) c_g_unichar_isprint; ///
  gboolean function(dchar c) c_g_unichar_ispunct; ///
  gboolean function(dchar c) c_g_unichar_isspace; ///
  gboolean function(dchar c) c_g_unichar_istitle; ///
  gboolean function(dchar c) c_g_unichar_isupper; ///
  gboolean function(dchar c) c_g_unichar_iswide; ///
  gboolean function(dchar c) c_g_unichar_iswide_cjk; ///
  gboolean function(dchar c) c_g_unichar_isxdigit; ///
  gboolean function(dchar c) c_g_unichar_iszerowidth; ///
  int function(dchar c, char* outbuf) c_g_unichar_to_utf8; ///
  dchar function(dchar c) c_g_unichar_tolower; ///
  dchar function(dchar c) c_g_unichar_totitle; ///
  dchar function(dchar c) c_g_unichar_toupper; ///
  GUnicodeType function(dchar c) c_g_unichar_type; ///
  gboolean function(dchar ch) c_g_unichar_validate; ///
  int function(dchar c) c_g_unichar_xdigit_value; ///
  dchar* function(dchar ch, size_t* resultLen) c_g_unicode_canonical_decomposition; ///
  void function(dchar* string_, size_t len) c_g_unicode_canonical_ordering; ///
  GQuark function() c_g_unix_error_quark; ///
  uint function(int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData) c_g_unix_fd_add; ///
  uint function(int priority, int fd, GIOCondition condition, GUnixFDSourceFunc function_, void* userData, GDestroyNotify notify) c_g_unix_fd_add_full; ///
  GSource* function(int fd, GIOCondition condition) c_g_unix_fd_source_new; ///
  void* function(const(char)* userName, GError** _err) c_g_unix_get_passwd_entry; ///
  gboolean function(int* fds, int flags, GError** _err) c_g_unix_open_pipe; ///
  gboolean function(int fd, gboolean nonblock, GError** _err) c_g_unix_set_fd_nonblocking; ///
  uint function(int signum, GSourceFunc handler, void* userData) c_g_unix_signal_add; ///
  uint function(int priority, int signum, GSourceFunc handler, void* userData, GDestroyNotify notify) c_g_unix_signal_add_full; ///
  GSource* function(int signum) c_g_unix_signal_source_new; ///
  int function(const(char)* filename) c_g_unlink; ///
  void function(const(char)* variable) c_g_unsetenv; ///
  void function(gulong microseconds) c_g_usleep; ///
  dchar* function(const(ushort)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_utf16_to_ucs4; ///
  char* function(const(ushort)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_utf16_to_utf8; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_casefold; ///
  int function(const(char)* str1, const(char)* str2) c_g_utf8_collate; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_collate_key; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_collate_key_for_filename; ///
  char* function(const(char)* p, const(char)* end) c_g_utf8_find_next_char; ///
  char* function(const(char)* str, const(char)* p) c_g_utf8_find_prev_char; ///
  dchar function(const(char)* p) c_g_utf8_get_char; ///
  dchar function(const(char)* p, ptrdiff_t maxLen) c_g_utf8_get_char_validated; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_make_valid; ///
  char* function(const(char)* str, ptrdiff_t len, GNormalizeMode mode) c_g_utf8_normalize; ///
  char* function(const(char)* str, glong offset) c_g_utf8_offset_to_pointer; ///
  glong function(const(char)* str, const(char)* pos) c_g_utf8_pointer_to_offset; ///
  char* function(const(char)* p) c_g_utf8_prev_char; ///
  char* function(const(char)* p, ptrdiff_t len, dchar c) c_g_utf8_strchr; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_strdown; ///
  glong function(const(char)* p, ptrdiff_t max) c_g_utf8_strlen; ///
  char* function(char* dest, const(char)* src, size_t n) c_g_utf8_strncpy; ///
  char* function(const(char)* p, ptrdiff_t len, dchar c) c_g_utf8_strrchr; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_strreverse; ///
  char* function(const(char)* str, ptrdiff_t len) c_g_utf8_strup; ///
  char* function(const(char)* str, glong startPos, glong endPos) c_g_utf8_substring; ///
  dchar* function(const(char)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_utf8_to_ucs4; ///
  dchar* function(const(char)* str, glong len, glong* itemsWritten) c_g_utf8_to_ucs4_fast; ///
  ushort* function(const(char)* str, glong len, glong* itemsRead, glong* itemsWritten, GError** _err) c_g_utf8_to_utf16; ///
  char* function(const(char)* string_, size_t truncateLength) c_g_utf8_truncate_middle; ///
  gboolean function(const(ubyte)* str, ptrdiff_t maxLen, const(char*)* end) c_g_utf8_validate; ///
  gboolean function(const(ubyte)* str, size_t maxLen, const(char*)* end) c_g_utf8_validate_len; ///
  gboolean function(const(char)* str) c_g_uuid_string_is_valid; ///
  char* function() c_g_uuid_string_random; ///
  GType function() c_g_variant_get_gtype; ///
  int function(char** string_, const(char)* format, void* args) c_g_vasprintf; ///
  int function(void* file, const(char)* format, void* args) c_g_vfprintf; ///
  int function(const(char)* format, void* args) c_g_vprintf; ///
  int function(char* string_, gulong n, const(char)* format, void* args) c_g_vsnprintf; ///
  int function(char* string_, const(char)* format, void* args) c_g_vsprintf; ///
  void function(const(char)* domain, const(char)* file, int line, const(char)* func, const(char)* warnexpr) c_g_warn_message; ///

  // UnicodeScript
  GUnicodeScript function(uint iso15924) c_g_unicode_script_from_iso15924; ///
  uint function(GUnicodeScript script) c_g_unicode_script_to_iso15924; ///
}

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
alias g_bytes_new_from_bytes = c_g_bytes_new_from_bytes;

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
alias g_markup_parse_context_get_position = c_g_markup_parse_context_get_position;

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
alias g_closefrom = c_g_closefrom;

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
alias g_fdwalk_set_cloexec = c_g_fdwalk_set_cloexec;

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
alias g_unix_error_quark = c_g_unix_error_quark;

/** */
alias g_unix_fd_add = c_g_unix_fd_add;

/** */
alias g_unix_fd_add_full = c_g_unix_fd_add_full;

/** */
alias g_unix_fd_source_new = c_g_unix_fd_source_new;

/** */
alias g_unix_get_passwd_entry = c_g_unix_get_passwd_entry;

/** */
alias g_unix_open_pipe = c_g_unix_open_pipe;

/** */
alias g_unix_set_fd_nonblocking = c_g_unix_set_fd_nonblocking;

/** */
alias g_unix_signal_add = c_g_unix_signal_add;

/** */
alias g_unix_signal_add_full = c_g_unix_signal_add_full;

/** */
alias g_unix_signal_source_new = c_g_unix_signal_source_new;

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
  auto libs = gidResolveLibs(LIBS);

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
  gidLink(cast(void**)&g_bytes_new_static, "g_bytes_new_static", libs);
  gidLink(cast(void**)&g_bytes_new_take, "g_bytes_new_take", libs);
  gidLink(cast(void**)&g_bytes_new_with_free_func, "g_bytes_new_with_free_func", libs);
  gidLink(cast(void**)&g_bytes_compare, "g_bytes_compare", libs);
  gidLink(cast(void**)&g_bytes_equal, "g_bytes_equal", libs);
  gidLink(cast(void**)&g_bytes_get_data, "g_bytes_get_data", libs);
  gidLink(cast(void**)&g_bytes_get_region, "g_bytes_get_region", libs);
  gidLink(cast(void**)&g_bytes_get_size, "g_bytes_get_size", libs);
  gidLink(cast(void**)&g_bytes_hash, "g_bytes_hash", libs);
  gidLink(cast(void**)&g_bytes_new_from_bytes, "g_bytes_new_from_bytes", libs);
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
  gidLink(cast(void**)&g_markup_parse_context_get_position, "g_markup_parse_context_get_position", libs);
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
  gidLink(cast(void**)&g_bit_nth_lsf, "g_bit_nth_lsf", libs);
  gidLink(cast(void**)&g_bit_nth_msf, "g_bit_nth_msf", libs);
  gidLink(cast(void**)&g_bit_storage, "g_bit_storage", libs);
  gidLink(cast(void**)&g_bit_trylock, "g_bit_trylock", libs);
  gidLink(cast(void**)&g_bit_unlock, "g_bit_unlock", libs);
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
  gidLink(cast(void**)&g_closefrom, "g_closefrom", libs);
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
  gidLink(cast(void**)&g_fdwalk_set_cloexec, "g_fdwalk_set_cloexec", libs);
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
  gidLink(cast(void**)&g_unix_error_quark, "g_unix_error_quark", libs);
  gidLink(cast(void**)&g_unix_fd_add, "g_unix_fd_add", libs);
  gidLink(cast(void**)&g_unix_fd_add_full, "g_unix_fd_add_full", libs);
  gidLink(cast(void**)&g_unix_fd_source_new, "g_unix_fd_source_new", libs);
  gidLink(cast(void**)&g_unix_get_passwd_entry, "g_unix_get_passwd_entry", libs);
  gidLink(cast(void**)&g_unix_open_pipe, "g_unix_open_pipe", libs);
  gidLink(cast(void**)&g_unix_set_fd_nonblocking, "g_unix_set_fd_nonblocking", libs);
  gidLink(cast(void**)&g_unix_signal_add, "g_unix_signal_add", libs);
  gidLink(cast(void**)&g_unix_signal_add_full, "g_unix_signal_add_full", libs);
  gidLink(cast(void**)&g_unix_signal_source_new, "g_unix_signal_source_new", libs);
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
