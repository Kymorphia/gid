/// C functions for gstcheck1 library
module gstcheck.c.functions;

public import gid.basictypes;
import gid.loader;
import gstcheck.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstcheck-1.0-0.dll;gstcheck-1.0-0.dll;gstcheck-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstcheck-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstcheck-1.0.so.0"];

__gshared extern(C)
{
  // Harness
  void function(GstHarness* h, GstElement* element, GstStaticPadTemplate* hsrc, const(char)* elementSinkpadName, GstStaticPadTemplate* hsink, const(char)* elementSrcpadName) c_gst_harness_add_element_full; ///
  void function(GstHarness* h, GstPad* sinkpad) c_gst_harness_add_element_sink_pad; ///
  void function(GstHarness* h, GstPad* srcpad) c_gst_harness_add_element_src_pad; ///
  void function(GstHarness* h, const(char)* launchline) c_gst_harness_add_parse; ///
  void function(GstHarness* h, const(char)* elementName, const(char)* padName, GstPadProbeType mask, GstPadProbeCallback callback, void* userData, GDestroyNotify destroyData) c_gst_harness_add_probe; ///
  void function(GstHarness* h, GType api, const(GstStructure)* params) c_gst_harness_add_propose_allocation_meta; ///
  void function(GstHarness* h, const(char)* sinkElementName) c_gst_harness_add_sink; ///
  void function(GstHarness* h, GstHarness* sinkHarness) c_gst_harness_add_sink_harness; ///
  void function(GstHarness* h, const(char)* launchline) c_gst_harness_add_sink_parse; ///
  void function(GstHarness* h, const(char)* srcElementName, gboolean hasClockWait) c_gst_harness_add_src; ///
  void function(GstHarness* h, GstHarness* srcHarness, gboolean hasClockWait) c_gst_harness_add_src_harness; ///
  void function(GstHarness* h, const(char)* launchline, gboolean hasClockWait) c_gst_harness_add_src_parse; ///
  uint function(GstHarness* h) c_gst_harness_buffers_in_queue; ///
  uint function(GstHarness* h) c_gst_harness_buffers_received; ///
  gboolean function(GstHarness* h, uint waits) c_gst_harness_crank_multiple_clock_waits; ///
  gboolean function(GstHarness* h) c_gst_harness_crank_single_clock_wait; ///
  GstBuffer* function(GstHarness* h, size_t size) c_gst_harness_create_buffer; ///
  void function(GstHarness* h, const(char)* filename) c_gst_harness_dump_to_file; ///
  uint function(GstHarness* h) c_gst_harness_events_in_queue; ///
  uint function(GstHarness* h) c_gst_harness_events_received; ///
  GstElement* function(GstHarness* h, const(char)* elementName) c_gst_harness_find_element; ///
  void function(GstHarness* h, const(char)* elementName, const(char)* firstPropertyName,  ...) c_gst_harness_get; ///
  void function(GstHarness* h, GstAllocator** allocator, GstAllocationParams* params) c_gst_harness_get_allocator; ///
  GstClockTime function(GstHarness* h) c_gst_harness_get_last_pushed_timestamp; ///
  GstTestClock* function(GstHarness* h) c_gst_harness_get_testclock; ///
  void function(GstHarness* h) c_gst_harness_play; ///
  GstBuffer* function(GstHarness* h) c_gst_harness_pull; ///
  GstEvent* function(GstHarness* h) c_gst_harness_pull_event; ///
  gboolean function(GstHarness* h, GstBuffer** buf) c_gst_harness_pull_until_eos; ///
  GstEvent* function(GstHarness* h) c_gst_harness_pull_upstream_event; ///
  GstFlowReturn function(GstHarness* h, GstBuffer* buffer) c_gst_harness_push; ///
  GstBuffer* function(GstHarness* h, GstBuffer* buffer) c_gst_harness_push_and_pull; ///
  gboolean function(GstHarness* h, GstEvent* event) c_gst_harness_push_event; ///
  GstFlowReturn function(GstHarness* h) c_gst_harness_push_from_src; ///
  GstFlowReturn function(GstHarness* h) c_gst_harness_push_to_sink; ///
  gboolean function(GstHarness* h, GstEvent* event) c_gst_harness_push_upstream_event; ///
  GstClockTime function(GstHarness* h) c_gst_harness_query_latency; ///
  void function(GstHarness* h, const(char)* elementName, const(char)* firstPropertyName,  ...) c_gst_harness_set; ///
  void function(GstHarness* h) c_gst_harness_set_blocking_push_mode; ///
  void function(GstHarness* h, GstCaps* in_, GstCaps* out_) c_gst_harness_set_caps; ///
  void function(GstHarness* h, const(char)* in_, const(char)* out_) c_gst_harness_set_caps_str; ///
  void function(GstHarness* h, gboolean dropBuffers) c_gst_harness_set_drop_buffers; ///
  void function(GstHarness* h, gboolean forwarding) c_gst_harness_set_forwarding; ///
  void function(GstHarness* h, gboolean isLive) c_gst_harness_set_live; ///
  void function(GstHarness* h, GstAllocator* allocator, const(GstAllocationParams)* params) c_gst_harness_set_propose_allocator; ///
  void function(GstHarness* h, GstCaps* caps) c_gst_harness_set_sink_caps; ///
  void function(GstHarness* h, const(char)* str) c_gst_harness_set_sink_caps_str; ///
  void function(GstHarness* h, GstCaps* caps) c_gst_harness_set_src_caps; ///
  void function(GstHarness* h, const(char)* str) c_gst_harness_set_src_caps_str; ///
  gboolean function(GstHarness* h, GstClockTime time) c_gst_harness_set_time; ///
  void function(GstHarness* h, GstClockTime latency) c_gst_harness_set_upstream_latency; ///
  GstFlowReturn function(GstHarness* h, int pushes) c_gst_harness_sink_push_many; ///
  GstFlowReturn function(GstHarness* h, int cranks, int pushes) c_gst_harness_src_crank_and_push_many; ///
  gboolean function(GstHarness* h) c_gst_harness_src_push_event; ///
  GstHarnessThread* function(GstHarness* h, GFunc init_, GFunc callback, void* data, gulong sleep) c_gst_harness_stress_custom_start; ///
  GstHarnessThread* function(GstHarness* h, const(char)* name, const(GValue)* value, gulong sleep) c_gst_harness_stress_property_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstCaps* caps, const(GstSegment)* segment, GstBuffer* buf, gulong sleep) c_gst_harness_stress_push_buffer_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstCaps* caps, const(GstSegment)* segment, GstHarnessPrepareBufferFunc func, void* data, GDestroyNotify notify, gulong sleep) c_gst_harness_stress_push_buffer_with_cb_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstEvent* event, gulong sleep) c_gst_harness_stress_push_event_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstHarnessPrepareEventFunc func, void* data, GDestroyNotify notify, gulong sleep) c_gst_harness_stress_push_event_with_cb_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstEvent* event, gulong sleep) c_gst_harness_stress_push_upstream_event_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstHarnessPrepareEventFunc func, void* data, GDestroyNotify notify, gulong sleep) c_gst_harness_stress_push_upstream_event_with_cb_start_full; ///
  GstHarnessThread* function(GstHarness* h, GstPadTemplate* templ, const(char)* name, GstCaps* caps, gboolean release, gulong sleep) c_gst_harness_stress_requestpad_start_full; ///
  GstHarnessThread* function(GstHarness* h, gulong sleep) c_gst_harness_stress_statechange_start_full; ///
  ubyte* function(GstHarness* h, size_t* size) c_gst_harness_take_all_data; ///
  GstBuffer* function(GstHarness* h) c_gst_harness_take_all_data_as_buffer; ///
  GBytes* function(GstHarness* h) c_gst_harness_take_all_data_as_bytes; ///
  void function(GstHarness* h) c_gst_harness_teardown; ///
  GstBuffer* function(GstHarness* h) c_gst_harness_try_pull; ///
  GstEvent* function(GstHarness* h) c_gst_harness_try_pull_event; ///
  GstEvent* function(GstHarness* h) c_gst_harness_try_pull_upstream_event; ///
  uint function(GstHarness* h) c_gst_harness_upstream_events_in_queue; ///
  uint function(GstHarness* h) c_gst_harness_upstream_events_received; ///
  void function(GstHarness* h) c_gst_harness_use_systemclock; ///
  void function(GstHarness* h) c_gst_harness_use_testclock; ///
  gboolean function(GstHarness* h, uint waits, uint timeout) c_gst_harness_wait_for_clock_id_waits; ///
  GstHarness* function(const(char)* elementName) c_gst_harness_new; ///
  GstHarness* function() c_gst_harness_new_empty; ///
  GstHarness* function(GstElement* element, GstStaticPadTemplate* hsrc, const(char)* elementSinkpadName, GstStaticPadTemplate* hsink, const(char)* elementSrcpadName) c_gst_harness_new_full; ///
  GstHarness* function(const(char)* launchline) c_gst_harness_new_parse; ///
  GstHarness* function(GstElement* element, const(char)* elementSinkpadName, const(char)* elementSrcpadName) c_gst_harness_new_with_element; ///
  GstHarness* function(const(char)* elementName, const(char)* elementSinkpadName, const(char)* elementSrcpadName) c_gst_harness_new_with_padnames; ///
  GstHarness* function(const(char)* elementName, GstStaticPadTemplate* hsrc, GstStaticPadTemplate* hsink) c_gst_harness_new_with_templates; ///
  uint function(GstHarnessThread* t) c_gst_harness_stress_thread_stop; ///

  // TestClock
  GType function() c_gst_test_clock_get_type; ///
  GstClock* function() c_gst_test_clock_new; ///
  GstClock* function(GstClockTime startTime) c_gst_test_clock_new_with_start_time; ///
  GstClockTime function(const(GList)* pendingList) c_gst_test_clock_id_list_get_latest_time; ///
  void function(GstTestClock* testClock, GstClockTimeDiff delta) c_gst_test_clock_advance_time; ///
  gboolean function(GstTestClock* testClock) c_gst_test_clock_crank; ///
  GstClockTime function(GstTestClock* testClock) c_gst_test_clock_get_next_entry_time; ///
  gboolean function(GstTestClock* testClock, GstClockID id) c_gst_test_clock_has_id; ///
  uint function(GstTestClock* testClock) c_gst_test_clock_peek_id_count; ///
  gboolean function(GstTestClock* testClock, GstClockID* pendingId) c_gst_test_clock_peek_next_pending_id; ///
  gboolean function(GstTestClock* testClock, GstClockID pendingId) c_gst_test_clock_process_id; ///
  uint function(GstTestClock* testClock, const(GList)* pendingList) c_gst_test_clock_process_id_list; ///
  GstClockID function(GstTestClock* testClock) c_gst_test_clock_process_next_clock_id; ///
  void function(GstTestClock* testClock, GstClockTime newTime) c_gst_test_clock_set_time; ///
  gboolean function(GstTestClock* testClock, uint count, uint timeoutMs, GList** pendingList) c_gst_test_clock_timed_wait_for_multiple_pending_ids; ///
  void function(GstTestClock* testClock, uint count, GList** pendingList) c_gst_test_clock_wait_for_multiple_pending_ids; ///
  void function(GstTestClock* testClock, GstClockID* pendingId) c_gst_test_clock_wait_for_next_pending_id; ///
  void function(GstTestClock* testClock, uint count) c_gst_test_clock_wait_for_pending_id_count; ///

  // global
  GstBuffer* function(GstElement* bin, GstPad* pad) c_gst_buffer_straw_get_buffer; ///
  void function(GstElement* bin, GstPad* pad) c_gst_buffer_straw_start_pipeline; ///
  void function(GstElement* bin, GstPad* pad) c_gst_buffer_straw_stop_pipeline; ///
  void function(GstCheckABIStruct* list, gboolean haveAbiSizes) c_gst_check_abi_list; ///
  GstCheckLogFilter* function(const(char)* logDomain, GLogLevelFlags logLevel, GRegex* regex, GstCheckLogFilterFunc func, void* userData, GDestroyNotify destroyData) c_gst_check_add_log_filter; ///
  void function(GstBuffer* buffer, const(void)* data, size_t size) c_gst_check_buffer_data; ///
  void function(GstCaps* caps1, GstCaps* caps2) c_gst_check_caps_equal; ///
  GstFlowReturn function(GstPad* pad, GstObject* parent, GstBuffer* buffer) c_gst_check_chain_func; ///
  void function() c_gst_check_clear_log_filter; ///
  void function() c_gst_check_drop_buffers; ///
  void function(const(char)* elementName, GstBuffer* bufferIn, GstCaps* capsIn, GstBuffer* bufferOut, GstCaps* capsOut) c_gst_check_element_push_buffer; ///
  void function(const(char)* elementName, GList* bufferIn, GstCaps* capsIn, GList* bufferOut, GstCaps* capsOut, GstFlowReturn lastFlowReturn) c_gst_check_element_push_buffer_list; ///
  void function(int* argc, char*** argv) c_gst_check_init; ///
  void function(GstMessage* message, GstMessageType type, GQuark domain, int code) c_gst_check_message_error; ///
  void function(void* objectToUnref) c_gst_check_object_destroyed_on_unref; ///
  void function(void* objectToUnref, void* firstObject,  ...) c_gst_check_objects_destroyed_on_unref; ///
  void function(GstCheckLogFilter* filter) c_gst_check_remove_log_filter; ///
  GstElement* function(const(char)* factory) c_gst_check_setup_element; ///
  void function(GstPad* srcpad, GstElement* element, GstCaps* caps, GstFormat format) c_gst_check_setup_events; ///
  void function(GstPad* srcpad, GstElement* element, GstCaps* caps, GstFormat format, const(char)* streamId) c_gst_check_setup_events_with_stream_id; ///
  GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl) c_gst_check_setup_sink_pad; ///
  GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl, const(char)* name) c_gst_check_setup_sink_pad_by_name; ///
  GstPad* function(GstElement* element, GstPadTemplate* tmpl, const(char)* name) c_gst_check_setup_sink_pad_by_name_from_template; ///
  GstPad* function(GstElement* element, GstPadTemplate* tmpl) c_gst_check_setup_sink_pad_from_template; ///
  GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl) c_gst_check_setup_src_pad; ///
  GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl, const(char)* name) c_gst_check_setup_src_pad_by_name; ///
  GstPad* function(GstElement* element, GstPadTemplate* tmpl, const(char)* name) c_gst_check_setup_src_pad_by_name_from_template; ///
  GstPad* function(GstElement* element, GstPadTemplate* tmpl) c_gst_check_setup_src_pad_from_template; ///
  void function(GstElement* element) c_gst_check_teardown_element; ///
  void function(GstElement* element, const(char)* name) c_gst_check_teardown_pad_by_name; ///
  void function(GstElement* element) c_gst_check_teardown_sink_pad; ///
  void function(GstElement* element) c_gst_check_teardown_src_pad; ///
  gboolean function(GstStreamConsistency* consist, GstPad* pad) c_gst_consistency_checker_add_pad; ///
  void function(GstStreamConsistency* consist) c_gst_consistency_checker_free; ///
  GstStreamConsistency* function(GstPad* pad) c_gst_consistency_checker_new; ///
  void function(GstStreamConsistency* consist) c_gst_consistency_checker_reset; ///
}

// Harness

/** */
alias gst_harness_add_element_full = c_gst_harness_add_element_full;

/** */
alias gst_harness_add_element_sink_pad = c_gst_harness_add_element_sink_pad;

/** */
alias gst_harness_add_element_src_pad = c_gst_harness_add_element_src_pad;

/** */
alias gst_harness_add_parse = c_gst_harness_add_parse;

/** */
alias gst_harness_add_probe = c_gst_harness_add_probe;

/** */
alias gst_harness_add_propose_allocation_meta = c_gst_harness_add_propose_allocation_meta;

/** */
alias gst_harness_add_sink = c_gst_harness_add_sink;

/** */
alias gst_harness_add_sink_harness = c_gst_harness_add_sink_harness;

/** */
alias gst_harness_add_sink_parse = c_gst_harness_add_sink_parse;

/** */
alias gst_harness_add_src = c_gst_harness_add_src;

/** */
alias gst_harness_add_src_harness = c_gst_harness_add_src_harness;

/** */
alias gst_harness_add_src_parse = c_gst_harness_add_src_parse;

/** */
alias gst_harness_buffers_in_queue = c_gst_harness_buffers_in_queue;

/** */
alias gst_harness_buffers_received = c_gst_harness_buffers_received;

/** */
alias gst_harness_crank_multiple_clock_waits = c_gst_harness_crank_multiple_clock_waits;

/** */
alias gst_harness_crank_single_clock_wait = c_gst_harness_crank_single_clock_wait;

/** */
alias gst_harness_create_buffer = c_gst_harness_create_buffer;

/** */
alias gst_harness_dump_to_file = c_gst_harness_dump_to_file;

/** */
alias gst_harness_events_in_queue = c_gst_harness_events_in_queue;

/** */
alias gst_harness_events_received = c_gst_harness_events_received;

/** */
alias gst_harness_find_element = c_gst_harness_find_element;

/** */
alias gst_harness_get = c_gst_harness_get;

/** */
alias gst_harness_get_allocator = c_gst_harness_get_allocator;

/** */
alias gst_harness_get_last_pushed_timestamp = c_gst_harness_get_last_pushed_timestamp;

/** */
alias gst_harness_get_testclock = c_gst_harness_get_testclock;

/** */
alias gst_harness_play = c_gst_harness_play;

/** */
alias gst_harness_pull = c_gst_harness_pull;

/** */
alias gst_harness_pull_event = c_gst_harness_pull_event;

/** */
alias gst_harness_pull_until_eos = c_gst_harness_pull_until_eos;

/** */
alias gst_harness_pull_upstream_event = c_gst_harness_pull_upstream_event;

/** */
alias gst_harness_push = c_gst_harness_push;

/** */
alias gst_harness_push_and_pull = c_gst_harness_push_and_pull;

/** */
alias gst_harness_push_event = c_gst_harness_push_event;

/** */
alias gst_harness_push_from_src = c_gst_harness_push_from_src;

/** */
alias gst_harness_push_to_sink = c_gst_harness_push_to_sink;

/** */
alias gst_harness_push_upstream_event = c_gst_harness_push_upstream_event;

/** */
alias gst_harness_query_latency = c_gst_harness_query_latency;

/** */
alias gst_harness_set = c_gst_harness_set;

/** */
alias gst_harness_set_blocking_push_mode = c_gst_harness_set_blocking_push_mode;

/** */
alias gst_harness_set_caps = c_gst_harness_set_caps;

/** */
alias gst_harness_set_caps_str = c_gst_harness_set_caps_str;

/** */
alias gst_harness_set_drop_buffers = c_gst_harness_set_drop_buffers;

/** */
alias gst_harness_set_forwarding = c_gst_harness_set_forwarding;

/** */
alias gst_harness_set_live = c_gst_harness_set_live;

/** */
alias gst_harness_set_propose_allocator = c_gst_harness_set_propose_allocator;

/** */
alias gst_harness_set_sink_caps = c_gst_harness_set_sink_caps;

/** */
alias gst_harness_set_sink_caps_str = c_gst_harness_set_sink_caps_str;

/** */
alias gst_harness_set_src_caps = c_gst_harness_set_src_caps;

/** */
alias gst_harness_set_src_caps_str = c_gst_harness_set_src_caps_str;

/** */
alias gst_harness_set_time = c_gst_harness_set_time;

/** */
alias gst_harness_set_upstream_latency = c_gst_harness_set_upstream_latency;

/** */
alias gst_harness_sink_push_many = c_gst_harness_sink_push_many;

/** */
alias gst_harness_src_crank_and_push_many = c_gst_harness_src_crank_and_push_many;

/** */
alias gst_harness_src_push_event = c_gst_harness_src_push_event;

/** */
alias gst_harness_stress_custom_start = c_gst_harness_stress_custom_start;

/** */
alias gst_harness_stress_property_start_full = c_gst_harness_stress_property_start_full;

/** */
alias gst_harness_stress_push_buffer_start_full = c_gst_harness_stress_push_buffer_start_full;

/** */
alias gst_harness_stress_push_buffer_with_cb_start_full = c_gst_harness_stress_push_buffer_with_cb_start_full;

/** */
alias gst_harness_stress_push_event_start_full = c_gst_harness_stress_push_event_start_full;

/** */
alias gst_harness_stress_push_event_with_cb_start_full = c_gst_harness_stress_push_event_with_cb_start_full;

/** */
alias gst_harness_stress_push_upstream_event_start_full = c_gst_harness_stress_push_upstream_event_start_full;

/** */
alias gst_harness_stress_push_upstream_event_with_cb_start_full = c_gst_harness_stress_push_upstream_event_with_cb_start_full;

/** */
alias gst_harness_stress_requestpad_start_full = c_gst_harness_stress_requestpad_start_full;

/** */
alias gst_harness_stress_statechange_start_full = c_gst_harness_stress_statechange_start_full;

/** */
alias gst_harness_take_all_data = c_gst_harness_take_all_data;

/** */
alias gst_harness_take_all_data_as_buffer = c_gst_harness_take_all_data_as_buffer;

/** */
alias gst_harness_take_all_data_as_bytes = c_gst_harness_take_all_data_as_bytes;

/** */
alias gst_harness_teardown = c_gst_harness_teardown;

/** */
alias gst_harness_try_pull = c_gst_harness_try_pull;

/** */
alias gst_harness_try_pull_event = c_gst_harness_try_pull_event;

/** */
alias gst_harness_try_pull_upstream_event = c_gst_harness_try_pull_upstream_event;

/** */
alias gst_harness_upstream_events_in_queue = c_gst_harness_upstream_events_in_queue;

/** */
alias gst_harness_upstream_events_received = c_gst_harness_upstream_events_received;

/** */
alias gst_harness_use_systemclock = c_gst_harness_use_systemclock;

/** */
alias gst_harness_use_testclock = c_gst_harness_use_testclock;

/** */
alias gst_harness_wait_for_clock_id_waits = c_gst_harness_wait_for_clock_id_waits;

/** */
alias gst_harness_new = c_gst_harness_new;

/** */
alias gst_harness_new_empty = c_gst_harness_new_empty;

/** */
alias gst_harness_new_full = c_gst_harness_new_full;

/** */
alias gst_harness_new_parse = c_gst_harness_new_parse;

/** */
alias gst_harness_new_with_element = c_gst_harness_new_with_element;

/** */
alias gst_harness_new_with_padnames = c_gst_harness_new_with_padnames;

/** */
alias gst_harness_new_with_templates = c_gst_harness_new_with_templates;

/** */
alias gst_harness_stress_thread_stop = c_gst_harness_stress_thread_stop;

// TestClock

/** */
alias gst_test_clock_get_type = c_gst_test_clock_get_type;

/** */
alias gst_test_clock_new = c_gst_test_clock_new;

/** */
alias gst_test_clock_new_with_start_time = c_gst_test_clock_new_with_start_time;

/** */
alias gst_test_clock_id_list_get_latest_time = c_gst_test_clock_id_list_get_latest_time;

/** */
alias gst_test_clock_advance_time = c_gst_test_clock_advance_time;

/** */
alias gst_test_clock_crank = c_gst_test_clock_crank;

/** */
alias gst_test_clock_get_next_entry_time = c_gst_test_clock_get_next_entry_time;

/** */
alias gst_test_clock_has_id = c_gst_test_clock_has_id;

/** */
alias gst_test_clock_peek_id_count = c_gst_test_clock_peek_id_count;

/** */
alias gst_test_clock_peek_next_pending_id = c_gst_test_clock_peek_next_pending_id;

/** */
alias gst_test_clock_process_id = c_gst_test_clock_process_id;

/** */
alias gst_test_clock_process_id_list = c_gst_test_clock_process_id_list;

/** */
alias gst_test_clock_process_next_clock_id = c_gst_test_clock_process_next_clock_id;

/** */
alias gst_test_clock_set_time = c_gst_test_clock_set_time;

/** */
alias gst_test_clock_timed_wait_for_multiple_pending_ids = c_gst_test_clock_timed_wait_for_multiple_pending_ids;

/** */
alias gst_test_clock_wait_for_multiple_pending_ids = c_gst_test_clock_wait_for_multiple_pending_ids;

/** */
alias gst_test_clock_wait_for_next_pending_id = c_gst_test_clock_wait_for_next_pending_id;

/** */
alias gst_test_clock_wait_for_pending_id_count = c_gst_test_clock_wait_for_pending_id_count;

// global

/** */
alias gst_buffer_straw_get_buffer = c_gst_buffer_straw_get_buffer;

/** */
alias gst_buffer_straw_start_pipeline = c_gst_buffer_straw_start_pipeline;

/** */
alias gst_buffer_straw_stop_pipeline = c_gst_buffer_straw_stop_pipeline;

/** */
alias gst_check_abi_list = c_gst_check_abi_list;

/** */
alias gst_check_add_log_filter = c_gst_check_add_log_filter;

/** */
alias gst_check_buffer_data = c_gst_check_buffer_data;

/** */
alias gst_check_caps_equal = c_gst_check_caps_equal;

/** */
alias gst_check_chain_func = c_gst_check_chain_func;

/** */
alias gst_check_clear_log_filter = c_gst_check_clear_log_filter;

/** */
alias gst_check_drop_buffers = c_gst_check_drop_buffers;

/** */
alias gst_check_element_push_buffer = c_gst_check_element_push_buffer;

/** */
alias gst_check_element_push_buffer_list = c_gst_check_element_push_buffer_list;

/** */
alias gst_check_init = c_gst_check_init;

/** */
alias gst_check_message_error = c_gst_check_message_error;

/** */
alias gst_check_object_destroyed_on_unref = c_gst_check_object_destroyed_on_unref;

/** */
alias gst_check_objects_destroyed_on_unref = c_gst_check_objects_destroyed_on_unref;

/** */
alias gst_check_remove_log_filter = c_gst_check_remove_log_filter;

/** */
alias gst_check_setup_element = c_gst_check_setup_element;

/** */
alias gst_check_setup_events = c_gst_check_setup_events;

/** */
alias gst_check_setup_events_with_stream_id = c_gst_check_setup_events_with_stream_id;

/** */
alias gst_check_setup_sink_pad = c_gst_check_setup_sink_pad;

/** */
alias gst_check_setup_sink_pad_by_name = c_gst_check_setup_sink_pad_by_name;

/** */
alias gst_check_setup_sink_pad_by_name_from_template = c_gst_check_setup_sink_pad_by_name_from_template;

/** */
alias gst_check_setup_sink_pad_from_template = c_gst_check_setup_sink_pad_from_template;

/** */
alias gst_check_setup_src_pad = c_gst_check_setup_src_pad;

/** */
alias gst_check_setup_src_pad_by_name = c_gst_check_setup_src_pad_by_name;

/** */
alias gst_check_setup_src_pad_by_name_from_template = c_gst_check_setup_src_pad_by_name_from_template;

/** */
alias gst_check_setup_src_pad_from_template = c_gst_check_setup_src_pad_from_template;

/** */
alias gst_check_teardown_element = c_gst_check_teardown_element;

/** */
alias gst_check_teardown_pad_by_name = c_gst_check_teardown_pad_by_name;

/** */
alias gst_check_teardown_sink_pad = c_gst_check_teardown_sink_pad;

/** */
alias gst_check_teardown_src_pad = c_gst_check_teardown_src_pad;

/** */
alias gst_consistency_checker_add_pad = c_gst_consistency_checker_add_pad;

/** */
alias gst_consistency_checker_free = c_gst_consistency_checker_free;

/** */
alias gst_consistency_checker_new = c_gst_consistency_checker_new;

/** */
alias gst_consistency_checker_reset = c_gst_consistency_checker_reset;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Harness
  gidLink(cast(void**)&gst_harness_add_element_full, "gst_harness_add_element_full", libs);
  gidLink(cast(void**)&gst_harness_add_element_sink_pad, "gst_harness_add_element_sink_pad", libs);
  gidLink(cast(void**)&gst_harness_add_element_src_pad, "gst_harness_add_element_src_pad", libs);
  gidLink(cast(void**)&gst_harness_add_parse, "gst_harness_add_parse", libs);
  gidLink(cast(void**)&gst_harness_add_probe, "gst_harness_add_probe", libs);
  gidLink(cast(void**)&gst_harness_add_propose_allocation_meta, "gst_harness_add_propose_allocation_meta", libs);
  gidLink(cast(void**)&gst_harness_add_sink, "gst_harness_add_sink", libs);
  gidLink(cast(void**)&gst_harness_add_sink_harness, "gst_harness_add_sink_harness", libs);
  gidLink(cast(void**)&gst_harness_add_sink_parse, "gst_harness_add_sink_parse", libs);
  gidLink(cast(void**)&gst_harness_add_src, "gst_harness_add_src", libs);
  gidLink(cast(void**)&gst_harness_add_src_harness, "gst_harness_add_src_harness", libs);
  gidLink(cast(void**)&gst_harness_add_src_parse, "gst_harness_add_src_parse", libs);
  gidLink(cast(void**)&gst_harness_buffers_in_queue, "gst_harness_buffers_in_queue", libs);
  gidLink(cast(void**)&gst_harness_buffers_received, "gst_harness_buffers_received", libs);
  gidLink(cast(void**)&gst_harness_crank_multiple_clock_waits, "gst_harness_crank_multiple_clock_waits", libs);
  gidLink(cast(void**)&gst_harness_crank_single_clock_wait, "gst_harness_crank_single_clock_wait", libs);
  gidLink(cast(void**)&gst_harness_create_buffer, "gst_harness_create_buffer", libs);
  gidLink(cast(void**)&gst_harness_dump_to_file, "gst_harness_dump_to_file", libs);
  gidLink(cast(void**)&gst_harness_events_in_queue, "gst_harness_events_in_queue", libs);
  gidLink(cast(void**)&gst_harness_events_received, "gst_harness_events_received", libs);
  gidLink(cast(void**)&gst_harness_find_element, "gst_harness_find_element", libs);
  gidLink(cast(void**)&gst_harness_get, "gst_harness_get", libs);
  gidLink(cast(void**)&gst_harness_get_allocator, "gst_harness_get_allocator", libs);
  gidLink(cast(void**)&gst_harness_get_last_pushed_timestamp, "gst_harness_get_last_pushed_timestamp", libs);
  gidLink(cast(void**)&gst_harness_get_testclock, "gst_harness_get_testclock", libs);
  gidLink(cast(void**)&gst_harness_play, "gst_harness_play", libs);
  gidLink(cast(void**)&gst_harness_pull, "gst_harness_pull", libs);
  gidLink(cast(void**)&gst_harness_pull_event, "gst_harness_pull_event", libs);
  gidLink(cast(void**)&gst_harness_pull_until_eos, "gst_harness_pull_until_eos", libs);
  gidLink(cast(void**)&gst_harness_pull_upstream_event, "gst_harness_pull_upstream_event", libs);
  gidLink(cast(void**)&gst_harness_push, "gst_harness_push", libs);
  gidLink(cast(void**)&gst_harness_push_and_pull, "gst_harness_push_and_pull", libs);
  gidLink(cast(void**)&gst_harness_push_event, "gst_harness_push_event", libs);
  gidLink(cast(void**)&gst_harness_push_from_src, "gst_harness_push_from_src", libs);
  gidLink(cast(void**)&gst_harness_push_to_sink, "gst_harness_push_to_sink", libs);
  gidLink(cast(void**)&gst_harness_push_upstream_event, "gst_harness_push_upstream_event", libs);
  gidLink(cast(void**)&gst_harness_query_latency, "gst_harness_query_latency", libs);
  gidLink(cast(void**)&gst_harness_set, "gst_harness_set", libs);
  gidLink(cast(void**)&gst_harness_set_blocking_push_mode, "gst_harness_set_blocking_push_mode", libs);
  gidLink(cast(void**)&gst_harness_set_caps, "gst_harness_set_caps", libs);
  gidLink(cast(void**)&gst_harness_set_caps_str, "gst_harness_set_caps_str", libs);
  gidLink(cast(void**)&gst_harness_set_drop_buffers, "gst_harness_set_drop_buffers", libs);
  gidLink(cast(void**)&gst_harness_set_forwarding, "gst_harness_set_forwarding", libs);
  gidLink(cast(void**)&gst_harness_set_live, "gst_harness_set_live", libs);
  gidLink(cast(void**)&gst_harness_set_propose_allocator, "gst_harness_set_propose_allocator", libs);
  gidLink(cast(void**)&gst_harness_set_sink_caps, "gst_harness_set_sink_caps", libs);
  gidLink(cast(void**)&gst_harness_set_sink_caps_str, "gst_harness_set_sink_caps_str", libs);
  gidLink(cast(void**)&gst_harness_set_src_caps, "gst_harness_set_src_caps", libs);
  gidLink(cast(void**)&gst_harness_set_src_caps_str, "gst_harness_set_src_caps_str", libs);
  gidLink(cast(void**)&gst_harness_set_time, "gst_harness_set_time", libs);
  gidLink(cast(void**)&gst_harness_set_upstream_latency, "gst_harness_set_upstream_latency", libs);
  gidLink(cast(void**)&gst_harness_sink_push_many, "gst_harness_sink_push_many", libs);
  gidLink(cast(void**)&gst_harness_src_crank_and_push_many, "gst_harness_src_crank_and_push_many", libs);
  gidLink(cast(void**)&gst_harness_src_push_event, "gst_harness_src_push_event", libs);
  gidLink(cast(void**)&gst_harness_stress_custom_start, "gst_harness_stress_custom_start", libs);
  gidLink(cast(void**)&gst_harness_stress_property_start_full, "gst_harness_stress_property_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_buffer_start_full, "gst_harness_stress_push_buffer_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_buffer_with_cb_start_full, "gst_harness_stress_push_buffer_with_cb_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_event_start_full, "gst_harness_stress_push_event_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_event_with_cb_start_full, "gst_harness_stress_push_event_with_cb_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_upstream_event_start_full, "gst_harness_stress_push_upstream_event_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_push_upstream_event_with_cb_start_full, "gst_harness_stress_push_upstream_event_with_cb_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_requestpad_start_full, "gst_harness_stress_requestpad_start_full", libs);
  gidLink(cast(void**)&gst_harness_stress_statechange_start_full, "gst_harness_stress_statechange_start_full", libs);
  gidLink(cast(void**)&gst_harness_take_all_data, "gst_harness_take_all_data", libs);
  gidLink(cast(void**)&gst_harness_take_all_data_as_buffer, "gst_harness_take_all_data_as_buffer", libs);
  gidLink(cast(void**)&gst_harness_take_all_data_as_bytes, "gst_harness_take_all_data_as_bytes", libs);
  gidLink(cast(void**)&gst_harness_teardown, "gst_harness_teardown", libs);
  gidLink(cast(void**)&gst_harness_try_pull, "gst_harness_try_pull", libs);
  gidLink(cast(void**)&gst_harness_try_pull_event, "gst_harness_try_pull_event", libs);
  gidLink(cast(void**)&gst_harness_try_pull_upstream_event, "gst_harness_try_pull_upstream_event", libs);
  gidLink(cast(void**)&gst_harness_upstream_events_in_queue, "gst_harness_upstream_events_in_queue", libs);
  gidLink(cast(void**)&gst_harness_upstream_events_received, "gst_harness_upstream_events_received", libs);
  gidLink(cast(void**)&gst_harness_use_systemclock, "gst_harness_use_systemclock", libs);
  gidLink(cast(void**)&gst_harness_use_testclock, "gst_harness_use_testclock", libs);
  gidLink(cast(void**)&gst_harness_wait_for_clock_id_waits, "gst_harness_wait_for_clock_id_waits", libs);
  gidLink(cast(void**)&gst_harness_new, "gst_harness_new", libs);
  gidLink(cast(void**)&gst_harness_new_empty, "gst_harness_new_empty", libs);
  gidLink(cast(void**)&gst_harness_new_full, "gst_harness_new_full", libs);
  gidLink(cast(void**)&gst_harness_new_parse, "gst_harness_new_parse", libs);
  gidLink(cast(void**)&gst_harness_new_with_element, "gst_harness_new_with_element", libs);
  gidLink(cast(void**)&gst_harness_new_with_padnames, "gst_harness_new_with_padnames", libs);
  gidLink(cast(void**)&gst_harness_new_with_templates, "gst_harness_new_with_templates", libs);
  gidLink(cast(void**)&gst_harness_stress_thread_stop, "gst_harness_stress_thread_stop", libs);

  // TestClock
  gidLink(cast(void**)&gst_test_clock_get_type, "gst_test_clock_get_type", libs);
  gidLink(cast(void**)&gst_test_clock_new, "gst_test_clock_new", libs);
  gidLink(cast(void**)&gst_test_clock_new_with_start_time, "gst_test_clock_new_with_start_time", libs);
  gidLink(cast(void**)&gst_test_clock_id_list_get_latest_time, "gst_test_clock_id_list_get_latest_time", libs);
  gidLink(cast(void**)&gst_test_clock_advance_time, "gst_test_clock_advance_time", libs);
  gidLink(cast(void**)&gst_test_clock_crank, "gst_test_clock_crank", libs);
  gidLink(cast(void**)&gst_test_clock_get_next_entry_time, "gst_test_clock_get_next_entry_time", libs);
  gidLink(cast(void**)&gst_test_clock_has_id, "gst_test_clock_has_id", libs);
  gidLink(cast(void**)&gst_test_clock_peek_id_count, "gst_test_clock_peek_id_count", libs);
  gidLink(cast(void**)&gst_test_clock_peek_next_pending_id, "gst_test_clock_peek_next_pending_id", libs);
  gidLink(cast(void**)&gst_test_clock_process_id, "gst_test_clock_process_id", libs);
  gidLink(cast(void**)&gst_test_clock_process_id_list, "gst_test_clock_process_id_list", libs);
  gidLink(cast(void**)&gst_test_clock_process_next_clock_id, "gst_test_clock_process_next_clock_id", libs);
  gidLink(cast(void**)&gst_test_clock_set_time, "gst_test_clock_set_time", libs);
  gidLink(cast(void**)&gst_test_clock_timed_wait_for_multiple_pending_ids, "gst_test_clock_timed_wait_for_multiple_pending_ids", libs);
  gidLink(cast(void**)&gst_test_clock_wait_for_multiple_pending_ids, "gst_test_clock_wait_for_multiple_pending_ids", libs);
  gidLink(cast(void**)&gst_test_clock_wait_for_next_pending_id, "gst_test_clock_wait_for_next_pending_id", libs);
  gidLink(cast(void**)&gst_test_clock_wait_for_pending_id_count, "gst_test_clock_wait_for_pending_id_count", libs);

  // global
  gidLink(cast(void**)&gst_buffer_straw_get_buffer, "gst_buffer_straw_get_buffer", libs);
  gidLink(cast(void**)&gst_buffer_straw_start_pipeline, "gst_buffer_straw_start_pipeline", libs);
  gidLink(cast(void**)&gst_buffer_straw_stop_pipeline, "gst_buffer_straw_stop_pipeline", libs);
  gidLink(cast(void**)&gst_check_abi_list, "gst_check_abi_list", libs);
  gidLink(cast(void**)&gst_check_add_log_filter, "gst_check_add_log_filter", libs);
  gidLink(cast(void**)&gst_check_buffer_data, "gst_check_buffer_data", libs);
  gidLink(cast(void**)&gst_check_caps_equal, "gst_check_caps_equal", libs);
  gidLink(cast(void**)&gst_check_chain_func, "gst_check_chain_func", libs);
  gidLink(cast(void**)&gst_check_clear_log_filter, "gst_check_clear_log_filter", libs);
  gidLink(cast(void**)&gst_check_drop_buffers, "gst_check_drop_buffers", libs);
  gidLink(cast(void**)&gst_check_element_push_buffer, "gst_check_element_push_buffer", libs);
  gidLink(cast(void**)&gst_check_element_push_buffer_list, "gst_check_element_push_buffer_list", libs);
  gidLink(cast(void**)&gst_check_init, "gst_check_init", libs);
  gidLink(cast(void**)&gst_check_message_error, "gst_check_message_error", libs);
  gidLink(cast(void**)&gst_check_object_destroyed_on_unref, "gst_check_object_destroyed_on_unref", libs);
  gidLink(cast(void**)&gst_check_objects_destroyed_on_unref, "gst_check_objects_destroyed_on_unref", libs);
  gidLink(cast(void**)&gst_check_remove_log_filter, "gst_check_remove_log_filter", libs);
  gidLink(cast(void**)&gst_check_setup_element, "gst_check_setup_element", libs);
  gidLink(cast(void**)&gst_check_setup_events, "gst_check_setup_events", libs);
  gidLink(cast(void**)&gst_check_setup_events_with_stream_id, "gst_check_setup_events_with_stream_id", libs);
  gidLink(cast(void**)&gst_check_setup_sink_pad, "gst_check_setup_sink_pad", libs);
  gidLink(cast(void**)&gst_check_setup_sink_pad_by_name, "gst_check_setup_sink_pad_by_name", libs);
  gidLink(cast(void**)&gst_check_setup_sink_pad_by_name_from_template, "gst_check_setup_sink_pad_by_name_from_template", libs);
  gidLink(cast(void**)&gst_check_setup_sink_pad_from_template, "gst_check_setup_sink_pad_from_template", libs);
  gidLink(cast(void**)&gst_check_setup_src_pad, "gst_check_setup_src_pad", libs);
  gidLink(cast(void**)&gst_check_setup_src_pad_by_name, "gst_check_setup_src_pad_by_name", libs);
  gidLink(cast(void**)&gst_check_setup_src_pad_by_name_from_template, "gst_check_setup_src_pad_by_name_from_template", libs);
  gidLink(cast(void**)&gst_check_setup_src_pad_from_template, "gst_check_setup_src_pad_from_template", libs);
  gidLink(cast(void**)&gst_check_teardown_element, "gst_check_teardown_element", libs);
  gidLink(cast(void**)&gst_check_teardown_pad_by_name, "gst_check_teardown_pad_by_name", libs);
  gidLink(cast(void**)&gst_check_teardown_sink_pad, "gst_check_teardown_sink_pad", libs);
  gidLink(cast(void**)&gst_check_teardown_src_pad, "gst_check_teardown_src_pad", libs);
  gidLink(cast(void**)&gst_consistency_checker_add_pad, "gst_consistency_checker_add_pad", libs);
  gidLink(cast(void**)&gst_consistency_checker_free, "gst_consistency_checker_free", libs);
  gidLink(cast(void**)&gst_consistency_checker_new, "gst_consistency_checker_new", libs);
  gidLink(cast(void**)&gst_consistency_checker_reset, "gst_consistency_checker_reset", libs);
}
