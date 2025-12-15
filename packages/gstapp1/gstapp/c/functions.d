/// C functions for gstapp1 library
module gstapp.c.functions;

public import gid.basictypes;
import gid.loader;
import gstapp.c.types;
public import gst.c.types;
public import gstbase.c.types;

version(Windows)
  private immutable LIBS = ["libgstapp-1.0-0.dll;gstapp-1.0-0.dll;gstapp-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstapp-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstapp-1.0.so.0"];

__gshared extern(C)
{
  // AppSink
  GType function() c_gst_app_sink_get_type; ///
  gboolean function(GstAppSink* appsink) c_gst_app_sink_get_buffer_list_support; ///
  GstCaps* function(GstAppSink* appsink) c_gst_app_sink_get_caps; ///
  gboolean function(GstAppSink* appsink) c_gst_app_sink_get_drop; ///
  gboolean function(GstAppSink* appsink) c_gst_app_sink_get_emit_signals; ///
  uint function(GstAppSink* appsink) c_gst_app_sink_get_max_buffers; ///
  ulong function(GstAppSink* appsink) c_gst_app_sink_get_max_bytes; ///
  GstClockTime function(GstAppSink* appsink) c_gst_app_sink_get_max_time; ///
  gboolean function(GstAppSink* appsink) c_gst_app_sink_get_wait_on_eos; ///
  gboolean function(GstAppSink* appsink) c_gst_app_sink_is_eos; ///
  GstMiniObject* function(GstAppSink* appsink) c_gst_app_sink_pull_object; ///
  GstSample* function(GstAppSink* appsink) c_gst_app_sink_pull_preroll; ///
  GstSample* function(GstAppSink* appsink) c_gst_app_sink_pull_sample; ///
  void function(GstAppSink* appsink, gboolean enableLists) c_gst_app_sink_set_buffer_list_support; ///
  void function(GstAppSink* appsink, GstAppSinkCallbacks* callbacks, void* userData, GDestroyNotify notify) c_gst_app_sink_set_callbacks; ///
  void function(GstAppSink* appsink, const(GstCaps)* caps) c_gst_app_sink_set_caps; ///
  void function(GstAppSink* appsink, gboolean drop) c_gst_app_sink_set_drop; ///
  void function(GstAppSink* appsink, gboolean emit) c_gst_app_sink_set_emit_signals; ///
  void function(GstAppSink* appsink, uint max) c_gst_app_sink_set_max_buffers; ///
  void function(GstAppSink* appsink, ulong max) c_gst_app_sink_set_max_bytes; ///
  void function(GstAppSink* appsink, GstClockTime max) c_gst_app_sink_set_max_time; ///
  void function(GstAppSink* appsink, gboolean wait) c_gst_app_sink_set_wait_on_eos; ///
  GstMiniObject* function(GstAppSink* appsink, GstClockTime timeout) c_gst_app_sink_try_pull_object; ///
  GstSample* function(GstAppSink* appsink, GstClockTime timeout) c_gst_app_sink_try_pull_preroll; ///
  GstSample* function(GstAppSink* appsink, GstClockTime timeout) c_gst_app_sink_try_pull_sample; ///

  // AppSrc
  GType function() c_gst_app_src_get_type; ///
  GstFlowReturn function(GstAppSrc* appsrc) c_gst_app_src_end_of_stream; ///
  GstCaps* function(GstAppSrc* appsrc) c_gst_app_src_get_caps; ///
  ulong function(GstAppSrc* appsrc) c_gst_app_src_get_current_level_buffers; ///
  ulong function(GstAppSrc* appsrc) c_gst_app_src_get_current_level_bytes; ///
  GstClockTime function(GstAppSrc* appsrc) c_gst_app_src_get_current_level_time; ///
  GstClockTime function(GstAppSrc* appsrc) c_gst_app_src_get_duration; ///
  gboolean function(GstAppSrc* appsrc) c_gst_app_src_get_emit_signals; ///
  void function(GstAppSrc* appsrc, ulong* min, ulong* max) c_gst_app_src_get_latency; ///
  GstAppLeakyType function(GstAppSrc* appsrc) c_gst_app_src_get_leaky_type; ///
  ulong function(GstAppSrc* appsrc) c_gst_app_src_get_max_buffers; ///
  ulong function(GstAppSrc* appsrc) c_gst_app_src_get_max_bytes; ///
  GstClockTime function(GstAppSrc* appsrc) c_gst_app_src_get_max_time; ///
  long function(GstAppSrc* appsrc) c_gst_app_src_get_size; ///
  GstAppStreamType function(GstAppSrc* appsrc) c_gst_app_src_get_stream_type; ///
  GstFlowReturn function(GstAppSrc* appsrc, GstBuffer* buffer) c_gst_app_src_push_buffer; ///
  GstFlowReturn function(GstAppSrc* appsrc, GstBufferList* bufferList) c_gst_app_src_push_buffer_list; ///
  GstFlowReturn function(GstAppSrc* appsrc, GstSample* sample) c_gst_app_src_push_sample; ///
  void function(GstAppSrc* appsrc, GstAppSrcCallbacks* callbacks, void* userData, GDestroyNotify notify) c_gst_app_src_set_callbacks; ///
  void function(GstAppSrc* appsrc, const(GstCaps)* caps) c_gst_app_src_set_caps; ///
  void function(GstAppSrc* appsrc, GstClockTime duration) c_gst_app_src_set_duration; ///
  void function(GstAppSrc* appsrc, gboolean emit) c_gst_app_src_set_emit_signals; ///
  void function(GstAppSrc* appsrc, ulong min, ulong max) c_gst_app_src_set_latency; ///
  void function(GstAppSrc* appsrc, GstAppLeakyType leaky) c_gst_app_src_set_leaky_type; ///
  void function(GstAppSrc* appsrc, ulong max) c_gst_app_src_set_max_buffers; ///
  void function(GstAppSrc* appsrc, ulong max) c_gst_app_src_set_max_bytes; ///
  void function(GstAppSrc* appsrc, GstClockTime max) c_gst_app_src_set_max_time; ///
  void function(GstAppSrc* appsrc, long size) c_gst_app_src_set_size; ///
  void function(GstAppSrc* appsrc, GstAppStreamType type) c_gst_app_src_set_stream_type; ///
}

// AppSink

/** */
alias gst_app_sink_get_type = c_gst_app_sink_get_type;

/** */
alias gst_app_sink_get_buffer_list_support = c_gst_app_sink_get_buffer_list_support;

/** */
alias gst_app_sink_get_caps = c_gst_app_sink_get_caps;

/** */
alias gst_app_sink_get_drop = c_gst_app_sink_get_drop;

/** */
alias gst_app_sink_get_emit_signals = c_gst_app_sink_get_emit_signals;

/** */
alias gst_app_sink_get_max_buffers = c_gst_app_sink_get_max_buffers;

/** */
alias gst_app_sink_get_max_bytes = c_gst_app_sink_get_max_bytes;

/** */
alias gst_app_sink_get_max_time = c_gst_app_sink_get_max_time;

/** */
alias gst_app_sink_get_wait_on_eos = c_gst_app_sink_get_wait_on_eos;

/** */
alias gst_app_sink_is_eos = c_gst_app_sink_is_eos;

/** */
alias gst_app_sink_pull_object = c_gst_app_sink_pull_object;

/** */
alias gst_app_sink_pull_preroll = c_gst_app_sink_pull_preroll;

/** */
alias gst_app_sink_pull_sample = c_gst_app_sink_pull_sample;

/** */
alias gst_app_sink_set_buffer_list_support = c_gst_app_sink_set_buffer_list_support;

/** */
alias gst_app_sink_set_callbacks = c_gst_app_sink_set_callbacks;

/** */
alias gst_app_sink_set_caps = c_gst_app_sink_set_caps;

/** */
alias gst_app_sink_set_drop = c_gst_app_sink_set_drop;

/** */
alias gst_app_sink_set_emit_signals = c_gst_app_sink_set_emit_signals;

/** */
alias gst_app_sink_set_max_buffers = c_gst_app_sink_set_max_buffers;

/** */
alias gst_app_sink_set_max_bytes = c_gst_app_sink_set_max_bytes;

/** */
alias gst_app_sink_set_max_time = c_gst_app_sink_set_max_time;

/** */
alias gst_app_sink_set_wait_on_eos = c_gst_app_sink_set_wait_on_eos;

/** */
alias gst_app_sink_try_pull_object = c_gst_app_sink_try_pull_object;

/** */
alias gst_app_sink_try_pull_preroll = c_gst_app_sink_try_pull_preroll;

/** */
alias gst_app_sink_try_pull_sample = c_gst_app_sink_try_pull_sample;

// AppSrc

/** */
alias gst_app_src_get_type = c_gst_app_src_get_type;

/** */
alias gst_app_src_end_of_stream = c_gst_app_src_end_of_stream;

/** */
alias gst_app_src_get_caps = c_gst_app_src_get_caps;

/** */
alias gst_app_src_get_current_level_buffers = c_gst_app_src_get_current_level_buffers;

/** */
alias gst_app_src_get_current_level_bytes = c_gst_app_src_get_current_level_bytes;

/** */
alias gst_app_src_get_current_level_time = c_gst_app_src_get_current_level_time;

/** */
alias gst_app_src_get_duration = c_gst_app_src_get_duration;

/** */
alias gst_app_src_get_emit_signals = c_gst_app_src_get_emit_signals;

/** */
alias gst_app_src_get_latency = c_gst_app_src_get_latency;

/** */
alias gst_app_src_get_leaky_type = c_gst_app_src_get_leaky_type;

/** */
alias gst_app_src_get_max_buffers = c_gst_app_src_get_max_buffers;

/** */
alias gst_app_src_get_max_bytes = c_gst_app_src_get_max_bytes;

/** */
alias gst_app_src_get_max_time = c_gst_app_src_get_max_time;

/** */
alias gst_app_src_get_size = c_gst_app_src_get_size;

/** */
alias gst_app_src_get_stream_type = c_gst_app_src_get_stream_type;

/** */
alias gst_app_src_push_buffer = c_gst_app_src_push_buffer;

/** */
alias gst_app_src_push_buffer_list = c_gst_app_src_push_buffer_list;

/** */
alias gst_app_src_push_sample = c_gst_app_src_push_sample;

/** */
alias gst_app_src_set_callbacks = c_gst_app_src_set_callbacks;

/** */
alias gst_app_src_set_caps = c_gst_app_src_set_caps;

/** */
alias gst_app_src_set_duration = c_gst_app_src_set_duration;

/** */
alias gst_app_src_set_emit_signals = c_gst_app_src_set_emit_signals;

/** */
alias gst_app_src_set_latency = c_gst_app_src_set_latency;

/** */
alias gst_app_src_set_leaky_type = c_gst_app_src_set_leaky_type;

/** */
alias gst_app_src_set_max_buffers = c_gst_app_src_set_max_buffers;

/** */
alias gst_app_src_set_max_bytes = c_gst_app_src_set_max_bytes;

/** */
alias gst_app_src_set_max_time = c_gst_app_src_set_max_time;

/** */
alias gst_app_src_set_size = c_gst_app_src_set_size;

/** */
alias gst_app_src_set_stream_type = c_gst_app_src_set_stream_type;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AppSink
  gidLink(cast(void**)&gst_app_sink_get_type, "gst_app_sink_get_type", libs);
  gidLink(cast(void**)&gst_app_sink_get_buffer_list_support, "gst_app_sink_get_buffer_list_support", libs);
  gidLink(cast(void**)&gst_app_sink_get_caps, "gst_app_sink_get_caps", libs);
  gidLink(cast(void**)&gst_app_sink_get_drop, "gst_app_sink_get_drop", libs);
  gidLink(cast(void**)&gst_app_sink_get_emit_signals, "gst_app_sink_get_emit_signals", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_buffers, "gst_app_sink_get_max_buffers", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_bytes, "gst_app_sink_get_max_bytes", libs);
  gidLink(cast(void**)&gst_app_sink_get_max_time, "gst_app_sink_get_max_time", libs);
  gidLink(cast(void**)&gst_app_sink_get_wait_on_eos, "gst_app_sink_get_wait_on_eos", libs);
  gidLink(cast(void**)&gst_app_sink_is_eos, "gst_app_sink_is_eos", libs);
  gidLink(cast(void**)&gst_app_sink_pull_object, "gst_app_sink_pull_object", libs);
  gidLink(cast(void**)&gst_app_sink_pull_preroll, "gst_app_sink_pull_preroll", libs);
  gidLink(cast(void**)&gst_app_sink_pull_sample, "gst_app_sink_pull_sample", libs);
  gidLink(cast(void**)&gst_app_sink_set_buffer_list_support, "gst_app_sink_set_buffer_list_support", libs);
  gidLink(cast(void**)&gst_app_sink_set_callbacks, "gst_app_sink_set_callbacks", libs);
  gidLink(cast(void**)&gst_app_sink_set_caps, "gst_app_sink_set_caps", libs);
  gidLink(cast(void**)&gst_app_sink_set_drop, "gst_app_sink_set_drop", libs);
  gidLink(cast(void**)&gst_app_sink_set_emit_signals, "gst_app_sink_set_emit_signals", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_buffers, "gst_app_sink_set_max_buffers", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_bytes, "gst_app_sink_set_max_bytes", libs);
  gidLink(cast(void**)&gst_app_sink_set_max_time, "gst_app_sink_set_max_time", libs);
  gidLink(cast(void**)&gst_app_sink_set_wait_on_eos, "gst_app_sink_set_wait_on_eos", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_object, "gst_app_sink_try_pull_object", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_preroll, "gst_app_sink_try_pull_preroll", libs);
  gidLink(cast(void**)&gst_app_sink_try_pull_sample, "gst_app_sink_try_pull_sample", libs);

  // AppSrc
  gidLink(cast(void**)&gst_app_src_get_type, "gst_app_src_get_type", libs);
  gidLink(cast(void**)&gst_app_src_end_of_stream, "gst_app_src_end_of_stream", libs);
  gidLink(cast(void**)&gst_app_src_get_caps, "gst_app_src_get_caps", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_buffers, "gst_app_src_get_current_level_buffers", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_bytes, "gst_app_src_get_current_level_bytes", libs);
  gidLink(cast(void**)&gst_app_src_get_current_level_time, "gst_app_src_get_current_level_time", libs);
  gidLink(cast(void**)&gst_app_src_get_duration, "gst_app_src_get_duration", libs);
  gidLink(cast(void**)&gst_app_src_get_emit_signals, "gst_app_src_get_emit_signals", libs);
  gidLink(cast(void**)&gst_app_src_get_latency, "gst_app_src_get_latency", libs);
  gidLink(cast(void**)&gst_app_src_get_leaky_type, "gst_app_src_get_leaky_type", libs);
  gidLink(cast(void**)&gst_app_src_get_max_buffers, "gst_app_src_get_max_buffers", libs);
  gidLink(cast(void**)&gst_app_src_get_max_bytes, "gst_app_src_get_max_bytes", libs);
  gidLink(cast(void**)&gst_app_src_get_max_time, "gst_app_src_get_max_time", libs);
  gidLink(cast(void**)&gst_app_src_get_size, "gst_app_src_get_size", libs);
  gidLink(cast(void**)&gst_app_src_get_stream_type, "gst_app_src_get_stream_type", libs);
  gidLink(cast(void**)&gst_app_src_push_buffer, "gst_app_src_push_buffer", libs);
  gidLink(cast(void**)&gst_app_src_push_buffer_list, "gst_app_src_push_buffer_list", libs);
  gidLink(cast(void**)&gst_app_src_push_sample, "gst_app_src_push_sample", libs);
  gidLink(cast(void**)&gst_app_src_set_callbacks, "gst_app_src_set_callbacks", libs);
  gidLink(cast(void**)&gst_app_src_set_caps, "gst_app_src_set_caps", libs);
  gidLink(cast(void**)&gst_app_src_set_duration, "gst_app_src_set_duration", libs);
  gidLink(cast(void**)&gst_app_src_set_emit_signals, "gst_app_src_set_emit_signals", libs);
  gidLink(cast(void**)&gst_app_src_set_latency, "gst_app_src_set_latency", libs);
  gidLink(cast(void**)&gst_app_src_set_leaky_type, "gst_app_src_set_leaky_type", libs);
  gidLink(cast(void**)&gst_app_src_set_max_buffers, "gst_app_src_set_max_buffers", libs);
  gidLink(cast(void**)&gst_app_src_set_max_bytes, "gst_app_src_set_max_bytes", libs);
  gidLink(cast(void**)&gst_app_src_set_max_time, "gst_app_src_set_max_time", libs);
  gidLink(cast(void**)&gst_app_src_set_size, "gst_app_src_set_size", libs);
  gidLink(cast(void**)&gst_app_src_set_stream_type, "gst_app_src_set_stream_type", libs);
}
