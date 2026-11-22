/// C functions for gstcheck1 library
module gid.gstcheck1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstcheck1.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstcheck-1.0_0"];

// Harness
private alias c_gst_harness_add_element_fullFn = extern(C) void function(GstHarness* h, GstElement* element, GstStaticPadTemplate* hsrc, const(char)* elementSinkpadName, GstStaticPadTemplate* hsink, const(char)* elementSrcpadName) nothrow;
__gshared c_gst_harness_add_element_fullFn c_gst_harness_add_element_full; ///
private alias c_gst_harness_add_element_sink_padFn = extern(C) void function(GstHarness* h, GstPad* sinkpad) nothrow;
__gshared c_gst_harness_add_element_sink_padFn c_gst_harness_add_element_sink_pad; ///
private alias c_gst_harness_add_element_src_padFn = extern(C) void function(GstHarness* h, GstPad* srcpad) nothrow;
__gshared c_gst_harness_add_element_src_padFn c_gst_harness_add_element_src_pad; ///
private alias c_gst_harness_add_parseFn = extern(C) void function(GstHarness* h, const(char)* launchline) nothrow;
__gshared c_gst_harness_add_parseFn c_gst_harness_add_parse; ///
private alias c_gst_harness_add_probeFn = extern(C) void function(GstHarness* h, const(char)* elementName, const(char)* padName, GstPadProbeType mask, GstPadProbeCallback callback, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_harness_add_probeFn c_gst_harness_add_probe; ///
private alias c_gst_harness_add_propose_allocation_metaFn = extern(C) void function(GstHarness* h, GType api, const(GstStructure)* params) nothrow;
__gshared c_gst_harness_add_propose_allocation_metaFn c_gst_harness_add_propose_allocation_meta; ///
private alias c_gst_harness_add_sinkFn = extern(C) void function(GstHarness* h, const(char)* sinkElementName) nothrow;
__gshared c_gst_harness_add_sinkFn c_gst_harness_add_sink; ///
private alias c_gst_harness_add_sink_harnessFn = extern(C) void function(GstHarness* h, GstHarness* sinkHarness) nothrow;
__gshared c_gst_harness_add_sink_harnessFn c_gst_harness_add_sink_harness; ///
private alias c_gst_harness_add_sink_parseFn = extern(C) void function(GstHarness* h, const(char)* launchline) nothrow;
__gshared c_gst_harness_add_sink_parseFn c_gst_harness_add_sink_parse; ///
private alias c_gst_harness_add_srcFn = extern(C) void function(GstHarness* h, const(char)* srcElementName, gboolean hasClockWait) nothrow;
__gshared c_gst_harness_add_srcFn c_gst_harness_add_src; ///
private alias c_gst_harness_add_src_harnessFn = extern(C) void function(GstHarness* h, GstHarness* srcHarness, gboolean hasClockWait) nothrow;
__gshared c_gst_harness_add_src_harnessFn c_gst_harness_add_src_harness; ///
private alias c_gst_harness_add_src_parseFn = extern(C) void function(GstHarness* h, const(char)* launchline, gboolean hasClockWait) nothrow;
__gshared c_gst_harness_add_src_parseFn c_gst_harness_add_src_parse; ///
private alias c_gst_harness_buffers_in_queueFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_buffers_in_queueFn c_gst_harness_buffers_in_queue; ///
private alias c_gst_harness_buffers_receivedFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_buffers_receivedFn c_gst_harness_buffers_received; ///
private alias c_gst_harness_crank_multiple_clock_waitsFn = extern(C) gboolean function(GstHarness* h, uint waits) nothrow;
__gshared c_gst_harness_crank_multiple_clock_waitsFn c_gst_harness_crank_multiple_clock_waits; ///
private alias c_gst_harness_crank_single_clock_waitFn = extern(C) gboolean function(GstHarness* h) nothrow;
__gshared c_gst_harness_crank_single_clock_waitFn c_gst_harness_crank_single_clock_wait; ///
private alias c_gst_harness_create_bufferFn = extern(C) GstBuffer* function(GstHarness* h, size_t size) nothrow;
__gshared c_gst_harness_create_bufferFn c_gst_harness_create_buffer; ///
private alias c_gst_harness_dump_to_fileFn = extern(C) void function(GstHarness* h, const(char)* filename) nothrow;
__gshared c_gst_harness_dump_to_fileFn c_gst_harness_dump_to_file; ///
private alias c_gst_harness_events_in_queueFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_events_in_queueFn c_gst_harness_events_in_queue; ///
private alias c_gst_harness_events_receivedFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_events_receivedFn c_gst_harness_events_received; ///
private alias c_gst_harness_find_elementFn = extern(C) GstElement* function(GstHarness* h, const(char)* elementName) nothrow;
__gshared c_gst_harness_find_elementFn c_gst_harness_find_element; ///
private alias c_gst_harness_getFn = extern(C) void function(GstHarness* h, const(char)* elementName, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_gst_harness_getFn c_gst_harness_get; ///
private alias c_gst_harness_get_allocatorFn = extern(C) void function(GstHarness* h, GstAllocator** allocator, GstAllocationParams* params) nothrow;
__gshared c_gst_harness_get_allocatorFn c_gst_harness_get_allocator; ///
private alias c_gst_harness_get_last_pushed_timestampFn = extern(C) GstClockTime function(GstHarness* h) nothrow;
__gshared c_gst_harness_get_last_pushed_timestampFn c_gst_harness_get_last_pushed_timestamp; ///
private alias c_gst_harness_get_testclockFn = extern(C) GstTestClock* function(GstHarness* h) nothrow;
__gshared c_gst_harness_get_testclockFn c_gst_harness_get_testclock; ///
private alias c_gst_harness_playFn = extern(C) void function(GstHarness* h) nothrow;
__gshared c_gst_harness_playFn c_gst_harness_play; ///
private alias c_gst_harness_pullFn = extern(C) GstBuffer* function(GstHarness* h) nothrow;
__gshared c_gst_harness_pullFn c_gst_harness_pull; ///
private alias c_gst_harness_pull_eventFn = extern(C) GstEvent* function(GstHarness* h) nothrow;
__gshared c_gst_harness_pull_eventFn c_gst_harness_pull_event; ///
private alias c_gst_harness_pull_until_eosFn = extern(C) gboolean function(GstHarness* h, GstBuffer** buf) nothrow;
__gshared c_gst_harness_pull_until_eosFn c_gst_harness_pull_until_eos; ///
private alias c_gst_harness_pull_upstream_eventFn = extern(C) GstEvent* function(GstHarness* h) nothrow;
__gshared c_gst_harness_pull_upstream_eventFn c_gst_harness_pull_upstream_event; ///
private alias c_gst_harness_pushFn = extern(C) GstFlowReturn function(GstHarness* h, GstBuffer* buffer) nothrow;
__gshared c_gst_harness_pushFn c_gst_harness_push; ///
private alias c_gst_harness_push_and_pullFn = extern(C) GstBuffer* function(GstHarness* h, GstBuffer* buffer) nothrow;
__gshared c_gst_harness_push_and_pullFn c_gst_harness_push_and_pull; ///
private alias c_gst_harness_push_eventFn = extern(C) gboolean function(GstHarness* h, GstEvent* event) nothrow;
__gshared c_gst_harness_push_eventFn c_gst_harness_push_event; ///
private alias c_gst_harness_push_from_srcFn = extern(C) GstFlowReturn function(GstHarness* h) nothrow;
__gshared c_gst_harness_push_from_srcFn c_gst_harness_push_from_src; ///
private alias c_gst_harness_push_to_sinkFn = extern(C) GstFlowReturn function(GstHarness* h) nothrow;
__gshared c_gst_harness_push_to_sinkFn c_gst_harness_push_to_sink; ///
private alias c_gst_harness_push_upstream_eventFn = extern(C) gboolean function(GstHarness* h, GstEvent* event) nothrow;
__gshared c_gst_harness_push_upstream_eventFn c_gst_harness_push_upstream_event; ///
private alias c_gst_harness_query_latencyFn = extern(C) GstClockTime function(GstHarness* h) nothrow;
__gshared c_gst_harness_query_latencyFn c_gst_harness_query_latency; ///
private alias c_gst_harness_setFn = extern(C) void function(GstHarness* h, const(char)* elementName, const(char)* firstPropertyName,  ...) nothrow;
__gshared c_gst_harness_setFn c_gst_harness_set; ///
private alias c_gst_harness_set_blocking_push_modeFn = extern(C) void function(GstHarness* h) nothrow;
__gshared c_gst_harness_set_blocking_push_modeFn c_gst_harness_set_blocking_push_mode; ///
private alias c_gst_harness_set_capsFn = extern(C) void function(GstHarness* h, GstCaps* in_, GstCaps* out_) nothrow;
__gshared c_gst_harness_set_capsFn c_gst_harness_set_caps; ///
private alias c_gst_harness_set_caps_strFn = extern(C) void function(GstHarness* h, const(char)* in_, const(char)* out_) nothrow;
__gshared c_gst_harness_set_caps_strFn c_gst_harness_set_caps_str; ///
private alias c_gst_harness_set_drop_buffersFn = extern(C) void function(GstHarness* h, gboolean dropBuffers) nothrow;
__gshared c_gst_harness_set_drop_buffersFn c_gst_harness_set_drop_buffers; ///
private alias c_gst_harness_set_forwardingFn = extern(C) void function(GstHarness* h, gboolean forwarding) nothrow;
__gshared c_gst_harness_set_forwardingFn c_gst_harness_set_forwarding; ///
private alias c_gst_harness_set_liveFn = extern(C) void function(GstHarness* h, gboolean isLive) nothrow;
__gshared c_gst_harness_set_liveFn c_gst_harness_set_live; ///
private alias c_gst_harness_set_propose_allocatorFn = extern(C) void function(GstHarness* h, GstAllocator* allocator, const(GstAllocationParams)* params) nothrow;
__gshared c_gst_harness_set_propose_allocatorFn c_gst_harness_set_propose_allocator; ///
private alias c_gst_harness_set_sink_capsFn = extern(C) void function(GstHarness* h, GstCaps* caps) nothrow;
__gshared c_gst_harness_set_sink_capsFn c_gst_harness_set_sink_caps; ///
private alias c_gst_harness_set_sink_caps_strFn = extern(C) void function(GstHarness* h, const(char)* str) nothrow;
__gshared c_gst_harness_set_sink_caps_strFn c_gst_harness_set_sink_caps_str; ///
private alias c_gst_harness_set_src_capsFn = extern(C) void function(GstHarness* h, GstCaps* caps) nothrow;
__gshared c_gst_harness_set_src_capsFn c_gst_harness_set_src_caps; ///
private alias c_gst_harness_set_src_caps_strFn = extern(C) void function(GstHarness* h, const(char)* str) nothrow;
__gshared c_gst_harness_set_src_caps_strFn c_gst_harness_set_src_caps_str; ///
private alias c_gst_harness_set_timeFn = extern(C) gboolean function(GstHarness* h, GstClockTime time) nothrow;
__gshared c_gst_harness_set_timeFn c_gst_harness_set_time; ///
private alias c_gst_harness_set_upstream_latencyFn = extern(C) void function(GstHarness* h, GstClockTime latency) nothrow;
__gshared c_gst_harness_set_upstream_latencyFn c_gst_harness_set_upstream_latency; ///
private alias c_gst_harness_sink_push_manyFn = extern(C) GstFlowReturn function(GstHarness* h, int pushes) nothrow;
__gshared c_gst_harness_sink_push_manyFn c_gst_harness_sink_push_many; ///
private alias c_gst_harness_src_crank_and_push_manyFn = extern(C) GstFlowReturn function(GstHarness* h, int cranks, int pushes) nothrow;
__gshared c_gst_harness_src_crank_and_push_manyFn c_gst_harness_src_crank_and_push_many; ///
private alias c_gst_harness_src_push_eventFn = extern(C) gboolean function(GstHarness* h) nothrow;
__gshared c_gst_harness_src_push_eventFn c_gst_harness_src_push_event; ///
private alias c_gst_harness_stress_custom_startFn = extern(C) GstHarnessThread* function(GstHarness* h, GFunc init_, GFunc callback, void* data, gulong sleep) nothrow;
__gshared c_gst_harness_stress_custom_startFn c_gst_harness_stress_custom_start; ///
private alias c_gst_harness_stress_property_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, const(char)* name, const(GValue)* value, gulong sleep) nothrow;
__gshared c_gst_harness_stress_property_start_fullFn c_gst_harness_stress_property_start_full; ///
private alias c_gst_harness_stress_push_buffer_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstCaps* caps, const(GstSegment)* segment, GstBuffer* buf, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_buffer_start_fullFn c_gst_harness_stress_push_buffer_start_full; ///
private alias c_gst_harness_stress_push_buffer_with_cb_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstCaps* caps, const(GstSegment)* segment, GstHarnessPrepareBufferFunc func, void* data, GDestroyNotify notify, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_buffer_with_cb_start_fullFn c_gst_harness_stress_push_buffer_with_cb_start_full; ///
private alias c_gst_harness_stress_push_event_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstEvent* event, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_event_start_fullFn c_gst_harness_stress_push_event_start_full; ///
private alias c_gst_harness_stress_push_event_with_cb_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstHarnessPrepareEventFunc func, void* data, GDestroyNotify notify, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_event_with_cb_start_fullFn c_gst_harness_stress_push_event_with_cb_start_full; ///
private alias c_gst_harness_stress_push_upstream_event_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstEvent* event, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_upstream_event_start_fullFn c_gst_harness_stress_push_upstream_event_start_full; ///
private alias c_gst_harness_stress_push_upstream_event_with_cb_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstHarnessPrepareEventFunc func, void* data, GDestroyNotify notify, gulong sleep) nothrow;
__gshared c_gst_harness_stress_push_upstream_event_with_cb_start_fullFn c_gst_harness_stress_push_upstream_event_with_cb_start_full; ///
private alias c_gst_harness_stress_requestpad_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, GstPadTemplate* templ, const(char)* name, GstCaps* caps, gboolean release, gulong sleep) nothrow;
__gshared c_gst_harness_stress_requestpad_start_fullFn c_gst_harness_stress_requestpad_start_full; ///
private alias c_gst_harness_stress_statechange_start_fullFn = extern(C) GstHarnessThread* function(GstHarness* h, gulong sleep) nothrow;
__gshared c_gst_harness_stress_statechange_start_fullFn c_gst_harness_stress_statechange_start_full; ///
private alias c_gst_harness_take_all_dataFn = extern(C) ubyte* function(GstHarness* h, size_t* size) nothrow;
__gshared c_gst_harness_take_all_dataFn c_gst_harness_take_all_data; ///
private alias c_gst_harness_take_all_data_as_bufferFn = extern(C) GstBuffer* function(GstHarness* h) nothrow;
__gshared c_gst_harness_take_all_data_as_bufferFn c_gst_harness_take_all_data_as_buffer; ///
private alias c_gst_harness_take_all_data_as_bytesFn = extern(C) GBytes* function(GstHarness* h) nothrow;
__gshared c_gst_harness_take_all_data_as_bytesFn c_gst_harness_take_all_data_as_bytes; ///
private alias c_gst_harness_teardownFn = extern(C) void function(GstHarness* h) nothrow;
__gshared c_gst_harness_teardownFn c_gst_harness_teardown; ///
private alias c_gst_harness_try_pullFn = extern(C) GstBuffer* function(GstHarness* h) nothrow;
__gshared c_gst_harness_try_pullFn c_gst_harness_try_pull; ///
private alias c_gst_harness_try_pull_eventFn = extern(C) GstEvent* function(GstHarness* h) nothrow;
__gshared c_gst_harness_try_pull_eventFn c_gst_harness_try_pull_event; ///
private alias c_gst_harness_try_pull_upstream_eventFn = extern(C) GstEvent* function(GstHarness* h) nothrow;
__gshared c_gst_harness_try_pull_upstream_eventFn c_gst_harness_try_pull_upstream_event; ///
private alias c_gst_harness_upstream_events_in_queueFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_upstream_events_in_queueFn c_gst_harness_upstream_events_in_queue; ///
private alias c_gst_harness_upstream_events_receivedFn = extern(C) uint function(GstHarness* h) nothrow;
__gshared c_gst_harness_upstream_events_receivedFn c_gst_harness_upstream_events_received; ///
private alias c_gst_harness_use_systemclockFn = extern(C) void function(GstHarness* h) nothrow;
__gshared c_gst_harness_use_systemclockFn c_gst_harness_use_systemclock; ///
private alias c_gst_harness_use_testclockFn = extern(C) void function(GstHarness* h) nothrow;
__gshared c_gst_harness_use_testclockFn c_gst_harness_use_testclock; ///
private alias c_gst_harness_wait_for_clock_id_waitsFn = extern(C) gboolean function(GstHarness* h, uint waits, uint timeout) nothrow;
__gshared c_gst_harness_wait_for_clock_id_waitsFn c_gst_harness_wait_for_clock_id_waits; ///
private alias c_gst_harness_newFn = extern(C) GstHarness* function(const(char)* elementName) nothrow;
__gshared c_gst_harness_newFn c_gst_harness_new; ///
private alias c_gst_harness_new_emptyFn = extern(C) GstHarness* function() nothrow;
__gshared c_gst_harness_new_emptyFn c_gst_harness_new_empty; ///
private alias c_gst_harness_new_fullFn = extern(C) GstHarness* function(GstElement* element, GstStaticPadTemplate* hsrc, const(char)* elementSinkpadName, GstStaticPadTemplate* hsink, const(char)* elementSrcpadName) nothrow;
__gshared c_gst_harness_new_fullFn c_gst_harness_new_full; ///
private alias c_gst_harness_new_parseFn = extern(C) GstHarness* function(const(char)* launchline) nothrow;
__gshared c_gst_harness_new_parseFn c_gst_harness_new_parse; ///
private alias c_gst_harness_new_with_elementFn = extern(C) GstHarness* function(GstElement* element, const(char)* elementSinkpadName, const(char)* elementSrcpadName) nothrow;
__gshared c_gst_harness_new_with_elementFn c_gst_harness_new_with_element; ///
private alias c_gst_harness_new_with_padnamesFn = extern(C) GstHarness* function(const(char)* elementName, const(char)* elementSinkpadName, const(char)* elementSrcpadName) nothrow;
__gshared c_gst_harness_new_with_padnamesFn c_gst_harness_new_with_padnames; ///
private alias c_gst_harness_new_with_templatesFn = extern(C) GstHarness* function(const(char)* elementName, GstStaticPadTemplate* hsrc, GstStaticPadTemplate* hsink) nothrow;
__gshared c_gst_harness_new_with_templatesFn c_gst_harness_new_with_templates; ///
private alias c_gst_harness_stress_thread_stopFn = extern(C) uint function(GstHarnessThread* t) nothrow;
__gshared c_gst_harness_stress_thread_stopFn c_gst_harness_stress_thread_stop; ///

// TestClock
private alias c_gst_test_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_test_clock_get_typeFn c_gst_test_clock_get_type; ///
private alias c_gst_test_clock_newFn = extern(C) GstClock* function() nothrow;
__gshared c_gst_test_clock_newFn c_gst_test_clock_new; ///
private alias c_gst_test_clock_new_with_start_timeFn = extern(C) GstClock* function(GstClockTime startTime) nothrow;
__gshared c_gst_test_clock_new_with_start_timeFn c_gst_test_clock_new_with_start_time; ///
private alias c_gst_test_clock_id_list_get_latest_timeFn = extern(C) GstClockTime function(const(GList)* pendingList) nothrow;
__gshared c_gst_test_clock_id_list_get_latest_timeFn c_gst_test_clock_id_list_get_latest_time; ///
private alias c_gst_test_clock_advance_timeFn = extern(C) void function(GstTestClock* testClock, GstClockTimeDiff delta) nothrow;
__gshared c_gst_test_clock_advance_timeFn c_gst_test_clock_advance_time; ///
private alias c_gst_test_clock_crankFn = extern(C) gboolean function(GstTestClock* testClock) nothrow;
__gshared c_gst_test_clock_crankFn c_gst_test_clock_crank; ///
private alias c_gst_test_clock_get_next_entry_timeFn = extern(C) GstClockTime function(GstTestClock* testClock) nothrow;
__gshared c_gst_test_clock_get_next_entry_timeFn c_gst_test_clock_get_next_entry_time; ///
private alias c_gst_test_clock_has_idFn = extern(C) gboolean function(GstTestClock* testClock, GstClockID id) nothrow;
__gshared c_gst_test_clock_has_idFn c_gst_test_clock_has_id; ///
private alias c_gst_test_clock_peek_id_countFn = extern(C) uint function(GstTestClock* testClock) nothrow;
__gshared c_gst_test_clock_peek_id_countFn c_gst_test_clock_peek_id_count; ///
private alias c_gst_test_clock_peek_next_pending_idFn = extern(C) gboolean function(GstTestClock* testClock, GstClockID* pendingId) nothrow;
__gshared c_gst_test_clock_peek_next_pending_idFn c_gst_test_clock_peek_next_pending_id; ///
private alias c_gst_test_clock_process_idFn = extern(C) gboolean function(GstTestClock* testClock, GstClockID pendingId) nothrow;
__gshared c_gst_test_clock_process_idFn c_gst_test_clock_process_id; ///
private alias c_gst_test_clock_process_id_listFn = extern(C) uint function(GstTestClock* testClock, const(GList)* pendingList) nothrow;
__gshared c_gst_test_clock_process_id_listFn c_gst_test_clock_process_id_list; ///
private alias c_gst_test_clock_process_next_clock_idFn = extern(C) GstClockID function(GstTestClock* testClock) nothrow;
__gshared c_gst_test_clock_process_next_clock_idFn c_gst_test_clock_process_next_clock_id; ///
private alias c_gst_test_clock_set_timeFn = extern(C) void function(GstTestClock* testClock, GstClockTime newTime) nothrow;
__gshared c_gst_test_clock_set_timeFn c_gst_test_clock_set_time; ///
private alias c_gst_test_clock_timed_wait_for_multiple_pending_idsFn = extern(C) gboolean function(GstTestClock* testClock, uint count, uint timeoutMs, GList** pendingList) nothrow;
__gshared c_gst_test_clock_timed_wait_for_multiple_pending_idsFn c_gst_test_clock_timed_wait_for_multiple_pending_ids; ///
private alias c_gst_test_clock_wait_for_multiple_pending_idsFn = extern(C) void function(GstTestClock* testClock, uint count, GList** pendingList) nothrow;
__gshared c_gst_test_clock_wait_for_multiple_pending_idsFn c_gst_test_clock_wait_for_multiple_pending_ids; ///
private alias c_gst_test_clock_wait_for_next_pending_idFn = extern(C) void function(GstTestClock* testClock, GstClockID* pendingId) nothrow;
__gshared c_gst_test_clock_wait_for_next_pending_idFn c_gst_test_clock_wait_for_next_pending_id; ///
private alias c_gst_test_clock_wait_for_pending_id_countFn = extern(C) void function(GstTestClock* testClock, uint count) nothrow;
__gshared c_gst_test_clock_wait_for_pending_id_countFn c_gst_test_clock_wait_for_pending_id_count; ///

// global
private alias c_gst_buffer_straw_get_bufferFn = extern(C) GstBuffer* function(GstElement* bin, GstPad* pad) nothrow;
__gshared c_gst_buffer_straw_get_bufferFn c_gst_buffer_straw_get_buffer; ///
private alias c_gst_buffer_straw_start_pipelineFn = extern(C) void function(GstElement* bin, GstPad* pad) nothrow;
__gshared c_gst_buffer_straw_start_pipelineFn c_gst_buffer_straw_start_pipeline; ///
private alias c_gst_buffer_straw_stop_pipelineFn = extern(C) void function(GstElement* bin, GstPad* pad) nothrow;
__gshared c_gst_buffer_straw_stop_pipelineFn c_gst_buffer_straw_stop_pipeline; ///
private alias c_gst_check_abi_listFn = extern(C) void function(GstCheckABIStruct* list, gboolean haveAbiSizes) nothrow;
__gshared c_gst_check_abi_listFn c_gst_check_abi_list; ///
private alias c_gst_check_add_log_filterFn = extern(C) GstCheckLogFilter* function(const(char)* logDomain, GLogLevelFlags logLevel, GRegex* regex, GstCheckLogFilterFunc func, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_check_add_log_filterFn c_gst_check_add_log_filter; ///
private alias c_gst_check_buffer_dataFn = extern(C) void function(GstBuffer* buffer, const(void)* data, size_t size) nothrow;
__gshared c_gst_check_buffer_dataFn c_gst_check_buffer_data; ///
private alias c_gst_check_caps_equalFn = extern(C) void function(GstCaps* caps1, GstCaps* caps2) nothrow;
__gshared c_gst_check_caps_equalFn c_gst_check_caps_equal; ///
private alias c_gst_check_chain_funcFn = extern(C) GstFlowReturn function(GstPad* pad, GstObject* parent, GstBuffer* buffer) nothrow;
__gshared c_gst_check_chain_funcFn c_gst_check_chain_func; ///
private alias c_gst_check_clear_log_filterFn = extern(C) void function() nothrow;
__gshared c_gst_check_clear_log_filterFn c_gst_check_clear_log_filter; ///
private alias c_gst_check_drop_buffersFn = extern(C) void function() nothrow;
__gshared c_gst_check_drop_buffersFn c_gst_check_drop_buffers; ///
private alias c_gst_check_element_push_bufferFn = extern(C) void function(const(char)* elementName, GstBuffer* bufferIn, GstCaps* capsIn, GstBuffer* bufferOut, GstCaps* capsOut) nothrow;
__gshared c_gst_check_element_push_bufferFn c_gst_check_element_push_buffer; ///
private alias c_gst_check_element_push_buffer_listFn = extern(C) void function(const(char)* elementName, GList* bufferIn, GstCaps* capsIn, GList* bufferOut, GstCaps* capsOut, GstFlowReturn lastFlowReturn) nothrow;
__gshared c_gst_check_element_push_buffer_listFn c_gst_check_element_push_buffer_list; ///
private alias c_gst_check_initFn = extern(C) void function(int* argc, char*** argv) nothrow;
__gshared c_gst_check_initFn c_gst_check_init; ///
private alias c_gst_check_message_errorFn = extern(C) void function(GstMessage* message, GstMessageType type, GQuark domain, int code) nothrow;
__gshared c_gst_check_message_errorFn c_gst_check_message_error; ///
private alias c_gst_check_object_destroyed_on_unrefFn = extern(C) void function(void* objectToUnref) nothrow;
__gshared c_gst_check_object_destroyed_on_unrefFn c_gst_check_object_destroyed_on_unref; ///
private alias c_gst_check_objects_destroyed_on_unrefFn = extern(C) void function(void* objectToUnref, void* firstObject,  ...) nothrow;
__gshared c_gst_check_objects_destroyed_on_unrefFn c_gst_check_objects_destroyed_on_unref; ///
private alias c_gst_check_remove_log_filterFn = extern(C) void function(GstCheckLogFilter* filter) nothrow;
__gshared c_gst_check_remove_log_filterFn c_gst_check_remove_log_filter; ///
private alias c_gst_check_setup_elementFn = extern(C) GstElement* function(const(char)* factory) nothrow;
__gshared c_gst_check_setup_elementFn c_gst_check_setup_element; ///
private alias c_gst_check_setup_eventsFn = extern(C) void function(GstPad* srcpad, GstElement* element, GstCaps* caps, GstFormat format) nothrow;
__gshared c_gst_check_setup_eventsFn c_gst_check_setup_events; ///
private alias c_gst_check_setup_events_with_stream_idFn = extern(C) void function(GstPad* srcpad, GstElement* element, GstCaps* caps, GstFormat format, const(char)* streamId) nothrow;
__gshared c_gst_check_setup_events_with_stream_idFn c_gst_check_setup_events_with_stream_id; ///
private alias c_gst_check_setup_sink_padFn = extern(C) GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl) nothrow;
__gshared c_gst_check_setup_sink_padFn c_gst_check_setup_sink_pad; ///
private alias c_gst_check_setup_sink_pad_by_nameFn = extern(C) GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl, const(char)* name) nothrow;
__gshared c_gst_check_setup_sink_pad_by_nameFn c_gst_check_setup_sink_pad_by_name; ///
private alias c_gst_check_setup_sink_pad_by_name_from_templateFn = extern(C) GstPad* function(GstElement* element, GstPadTemplate* tmpl, const(char)* name) nothrow;
__gshared c_gst_check_setup_sink_pad_by_name_from_templateFn c_gst_check_setup_sink_pad_by_name_from_template; ///
private alias c_gst_check_setup_sink_pad_from_templateFn = extern(C) GstPad* function(GstElement* element, GstPadTemplate* tmpl) nothrow;
__gshared c_gst_check_setup_sink_pad_from_templateFn c_gst_check_setup_sink_pad_from_template; ///
private alias c_gst_check_setup_src_padFn = extern(C) GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl) nothrow;
__gshared c_gst_check_setup_src_padFn c_gst_check_setup_src_pad; ///
private alias c_gst_check_setup_src_pad_by_nameFn = extern(C) GstPad* function(GstElement* element, GstStaticPadTemplate* tmpl, const(char)* name) nothrow;
__gshared c_gst_check_setup_src_pad_by_nameFn c_gst_check_setup_src_pad_by_name; ///
private alias c_gst_check_setup_src_pad_by_name_from_templateFn = extern(C) GstPad* function(GstElement* element, GstPadTemplate* tmpl, const(char)* name) nothrow;
__gshared c_gst_check_setup_src_pad_by_name_from_templateFn c_gst_check_setup_src_pad_by_name_from_template; ///
private alias c_gst_check_setup_src_pad_from_templateFn = extern(C) GstPad* function(GstElement* element, GstPadTemplate* tmpl) nothrow;
__gshared c_gst_check_setup_src_pad_from_templateFn c_gst_check_setup_src_pad_from_template; ///
private alias c_gst_check_teardown_elementFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_check_teardown_elementFn c_gst_check_teardown_element; ///
private alias c_gst_check_teardown_pad_by_nameFn = extern(C) void function(GstElement* element, const(char)* name) nothrow;
__gshared c_gst_check_teardown_pad_by_nameFn c_gst_check_teardown_pad_by_name; ///
private alias c_gst_check_teardown_sink_padFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_check_teardown_sink_padFn c_gst_check_teardown_sink_pad; ///
private alias c_gst_check_teardown_src_padFn = extern(C) void function(GstElement* element) nothrow;
__gshared c_gst_check_teardown_src_padFn c_gst_check_teardown_src_pad; ///
private alias c_gst_consistency_checker_add_padFn = extern(C) gboolean function(GstStreamConsistency* consist, GstPad* pad) nothrow;
__gshared c_gst_consistency_checker_add_padFn c_gst_consistency_checker_add_pad; ///
private alias c_gst_consistency_checker_freeFn = extern(C) void function(GstStreamConsistency* consist) nothrow;
__gshared c_gst_consistency_checker_freeFn c_gst_consistency_checker_free; ///
private alias c_gst_consistency_checker_newFn = extern(C) GstStreamConsistency* function(GstPad* pad) nothrow;
__gshared c_gst_consistency_checker_newFn c_gst_consistency_checker_new; ///
private alias c_gst_consistency_checker_resetFn = extern(C) void function(GstStreamConsistency* consist) nothrow;
__gshared c_gst_consistency_checker_resetFn c_gst_consistency_checker_reset; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.gstcheck1");

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
