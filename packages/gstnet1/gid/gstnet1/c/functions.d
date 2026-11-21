/// C functions for gstnet1 library
module gid.gstnet1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstnet1.c.types;
public import gid.gio2.c.types;
public import gid.glib2.c.types;
public import gid.gmodule2.c.types;
public import gid.gobject2.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstnet-1.0_0"];

// NetAddressMeta
private alias c_gst_net_address_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_net_address_meta_get_infoFn c_gst_net_address_meta_get_info; ///

// NetClientClock
private alias c_gst_net_client_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_net_client_clock_get_typeFn c_gst_net_client_clock_get_type; ///
private alias c_gst_net_client_clock_newFn = extern(C) GstClock* function(const(char)* name, const(char)* remoteAddress, int remotePort, GstClockTime baseTime) nothrow;
__gshared c_gst_net_client_clock_newFn c_gst_net_client_clock_new; ///
private alias c_gst_net_client_clock_deinitFn = extern(C) void function() nothrow;
__gshared c_gst_net_client_clock_deinitFn c_gst_net_client_clock_deinit; ///

// NetControlMessageMeta
private alias c_gst_net_control_message_meta_get_infoFn = extern(C) const(GstMetaInfo)* function() nothrow;
__gshared c_gst_net_control_message_meta_get_infoFn c_gst_net_control_message_meta_get_info; ///

// NetTimePacket
private alias c_gst_net_time_packet_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_net_time_packet_get_typeFn c_gst_net_time_packet_get_type; ///
private alias c_gst_net_time_packet_newFn = extern(C) GstNetTimePacket* function(const(ubyte)* buffer) nothrow;
__gshared c_gst_net_time_packet_newFn c_gst_net_time_packet_new; ///
private alias c_gst_net_time_packet_copyFn = extern(C) GstNetTimePacket* function(const(GstNetTimePacket)* packet) nothrow;
__gshared c_gst_net_time_packet_copyFn c_gst_net_time_packet_copy; ///
private alias c_gst_net_time_packet_freeFn = extern(C) void function(GstNetTimePacket* packet) nothrow;
__gshared c_gst_net_time_packet_freeFn c_gst_net_time_packet_free; ///
private alias c_gst_net_time_packet_sendFn = extern(C) gboolean function(const(GstNetTimePacket)* packet, GSocket* socket, GSocketAddress* destAddress, GError** _err) nothrow;
__gshared c_gst_net_time_packet_sendFn c_gst_net_time_packet_send; ///
private alias c_gst_net_time_packet_serializeFn = extern(C) ubyte* function(const(GstNetTimePacket)* packet) nothrow;
__gshared c_gst_net_time_packet_serializeFn c_gst_net_time_packet_serialize; ///
private alias c_gst_net_time_packet_receiveFn = extern(C) GstNetTimePacket* function(GSocket* socket, GSocketAddress** srcAddress, GError** _err) nothrow;
__gshared c_gst_net_time_packet_receiveFn c_gst_net_time_packet_receive; ///

// NetTimeProvider
private alias c_gst_net_time_provider_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_net_time_provider_get_typeFn c_gst_net_time_provider_get_type; ///
private alias c_gst_net_time_provider_newFn = extern(C) GstNetTimeProvider* function(GstClock* clock, const(char)* address, int port) nothrow;
__gshared c_gst_net_time_provider_newFn c_gst_net_time_provider_new; ///

// NtpClock
private alias c_gst_ntp_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_ntp_clock_get_typeFn c_gst_ntp_clock_get_type; ///
private alias c_gst_ntp_clock_newFn = extern(C) GstClock* function(const(char)* name, const(char)* remoteAddress, int remotePort, GstClockTime baseTime) nothrow;
__gshared c_gst_ntp_clock_newFn c_gst_ntp_clock_new; ///

// PtpClock
private alias c_gst_ptp_clock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_ptp_clock_get_typeFn c_gst_ptp_clock_get_type; ///
private alias c_gst_ptp_clock_newFn = extern(C) GstClock* function(const(char)* name, uint domain) nothrow;
__gshared c_gst_ptp_clock_newFn c_gst_ptp_clock_new; ///

// global
private alias c_gst_buffer_add_net_address_metaFn = extern(C) GstNetAddressMeta* function(GstBuffer* buffer, GSocketAddress* addr) nothrow;
__gshared c_gst_buffer_add_net_address_metaFn c_gst_buffer_add_net_address_meta; ///
private alias c_gst_buffer_add_net_control_message_metaFn = extern(C) GstNetControlMessageMeta* function(GstBuffer* buffer, GSocketControlMessage* message) nothrow;
__gshared c_gst_buffer_add_net_control_message_metaFn c_gst_buffer_add_net_control_message_meta; ///
private alias c_gst_buffer_get_net_address_metaFn = extern(C) GstNetAddressMeta* function(GstBuffer* buffer) nothrow;
__gshared c_gst_buffer_get_net_address_metaFn c_gst_buffer_get_net_address_meta; ///
private alias c_gst_net_address_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_net_address_meta_api_get_typeFn c_gst_net_address_meta_api_get_type; ///
private alias c_gst_net_control_message_meta_api_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_net_control_message_meta_api_get_typeFn c_gst_net_control_message_meta_api_get_type; ///
private alias c_gst_net_utils_set_socket_tosFn = extern(C) gboolean function(GSocket* socket, int qosDscp) nothrow;
__gshared c_gst_net_utils_set_socket_tosFn c_gst_net_utils_set_socket_tos; ///
private alias c_gst_ptp_deinitFn = extern(C) void function() nothrow;
__gshared c_gst_ptp_deinitFn c_gst_ptp_deinit; ///
private alias c_gst_ptp_initFn = extern(C) gboolean function(ulong clockId, char** interfaces) nothrow;
__gshared c_gst_ptp_initFn c_gst_ptp_init; ///
private alias c_gst_ptp_init_fullFn = extern(C) gboolean function(const(GstStructure)* config) nothrow;
__gshared c_gst_ptp_init_fullFn c_gst_ptp_init_full; ///
private alias c_gst_ptp_is_initializedFn = extern(C) gboolean function() nothrow;
__gshared c_gst_ptp_is_initializedFn c_gst_ptp_is_initialized; ///
private alias c_gst_ptp_is_supportedFn = extern(C) gboolean function() nothrow;
__gshared c_gst_ptp_is_supportedFn c_gst_ptp_is_supported; ///
private alias c_gst_ptp_statistics_callback_addFn = extern(C) gulong function(GstPtpStatisticsCallback callback, void* userData, GDestroyNotify destroyData) nothrow;
__gshared c_gst_ptp_statistics_callback_addFn c_gst_ptp_statistics_callback_add; ///
private alias c_gst_ptp_statistics_callback_removeFn = extern(C) void function(gulong id) nothrow;
__gshared c_gst_ptp_statistics_callback_removeFn c_gst_ptp_statistics_callback_remove; ///

// NetAddressMeta

/** */
alias gst_net_address_meta_get_info = c_gst_net_address_meta_get_info;

// NetClientClock

/** */
alias gst_net_client_clock_get_type = c_gst_net_client_clock_get_type;

/** */
alias gst_net_client_clock_new = c_gst_net_client_clock_new;

/** */
alias gst_net_client_clock_deinit = c_gst_net_client_clock_deinit;

// NetControlMessageMeta

/** */
alias gst_net_control_message_meta_get_info = c_gst_net_control_message_meta_get_info;

// NetTimePacket

/** */
alias gst_net_time_packet_get_type = c_gst_net_time_packet_get_type;

/** */
alias gst_net_time_packet_new = c_gst_net_time_packet_new;

/** */
alias gst_net_time_packet_copy = c_gst_net_time_packet_copy;

/** */
alias gst_net_time_packet_free = c_gst_net_time_packet_free;

/** */
alias gst_net_time_packet_send = c_gst_net_time_packet_send;

/** */
alias gst_net_time_packet_serialize = c_gst_net_time_packet_serialize;

/** */
alias gst_net_time_packet_receive = c_gst_net_time_packet_receive;

// NetTimeProvider

/** */
alias gst_net_time_provider_get_type = c_gst_net_time_provider_get_type;

/** */
alias gst_net_time_provider_new = c_gst_net_time_provider_new;

// NtpClock

/** */
alias gst_ntp_clock_get_type = c_gst_ntp_clock_get_type;

/** */
alias gst_ntp_clock_new = c_gst_ntp_clock_new;

// PtpClock

/** */
alias gst_ptp_clock_get_type = c_gst_ptp_clock_get_type;

/** */
alias gst_ptp_clock_new = c_gst_ptp_clock_new;

// global

/** */
alias gst_buffer_add_net_address_meta = c_gst_buffer_add_net_address_meta;

/** */
alias gst_buffer_add_net_control_message_meta = c_gst_buffer_add_net_control_message_meta;

/** */
alias gst_buffer_get_net_address_meta = c_gst_buffer_get_net_address_meta;

/** */
alias gst_net_address_meta_api_get_type = c_gst_net_address_meta_api_get_type;

/** */
alias gst_net_control_message_meta_api_get_type = c_gst_net_control_message_meta_api_get_type;

/** */
alias gst_net_utils_set_socket_tos = c_gst_net_utils_set_socket_tos;

/** */
alias gst_ptp_deinit = c_gst_ptp_deinit;

/** */
alias gst_ptp_init = c_gst_ptp_init;

/** */
alias gst_ptp_init_full = c_gst_ptp_init_full;

/** */
alias gst_ptp_is_initialized = c_gst_ptp_is_initialized;

/** */
alias gst_ptp_is_supported = c_gst_ptp_is_supported;

/** */
alias gst_ptp_statistics_callback_add = c_gst_ptp_statistics_callback_add;

/** */
alias gst_ptp_statistics_callback_remove = c_gst_ptp_statistics_callback_remove;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // NetAddressMeta
  gidLink(cast(void**)&gst_net_address_meta_get_info, "gst_net_address_meta_get_info", libs);

  // NetClientClock
  gidLink(cast(void**)&gst_net_client_clock_get_type, "gst_net_client_clock_get_type", libs);
  gidLink(cast(void**)&gst_net_client_clock_new, "gst_net_client_clock_new", libs);
  gidLink(cast(void**)&gst_net_client_clock_deinit, "gst_net_client_clock_deinit", libs);

  // NetControlMessageMeta
  gidLink(cast(void**)&gst_net_control_message_meta_get_info, "gst_net_control_message_meta_get_info", libs);

  // NetTimePacket
  gidLink(cast(void**)&gst_net_time_packet_get_type, "gst_net_time_packet_get_type", libs);
  gidLink(cast(void**)&gst_net_time_packet_new, "gst_net_time_packet_new", libs);
  gidLink(cast(void**)&gst_net_time_packet_copy, "gst_net_time_packet_copy", libs);
  gidLink(cast(void**)&gst_net_time_packet_free, "gst_net_time_packet_free", libs);
  gidLink(cast(void**)&gst_net_time_packet_send, "gst_net_time_packet_send", libs);
  gidLink(cast(void**)&gst_net_time_packet_serialize, "gst_net_time_packet_serialize", libs);
  gidLink(cast(void**)&gst_net_time_packet_receive, "gst_net_time_packet_receive", libs);

  // NetTimeProvider
  gidLink(cast(void**)&gst_net_time_provider_get_type, "gst_net_time_provider_get_type", libs);
  gidLink(cast(void**)&gst_net_time_provider_new, "gst_net_time_provider_new", libs);

  // NtpClock
  gidLink(cast(void**)&gst_ntp_clock_get_type, "gst_ntp_clock_get_type", libs);
  gidLink(cast(void**)&gst_ntp_clock_new, "gst_ntp_clock_new", libs);

  // PtpClock
  gidLink(cast(void**)&gst_ptp_clock_get_type, "gst_ptp_clock_get_type", libs);
  gidLink(cast(void**)&gst_ptp_clock_new, "gst_ptp_clock_new", libs);

  // global
  gidLink(cast(void**)&gst_buffer_add_net_address_meta, "gst_buffer_add_net_address_meta", libs);
  gidLink(cast(void**)&gst_buffer_add_net_control_message_meta, "gst_buffer_add_net_control_message_meta", libs);
  gidLink(cast(void**)&gst_buffer_get_net_address_meta, "gst_buffer_get_net_address_meta", libs);
  gidLink(cast(void**)&gst_net_address_meta_api_get_type, "gst_net_address_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_net_control_message_meta_api_get_type, "gst_net_control_message_meta_api_get_type", libs);
  gidLink(cast(void**)&gst_net_utils_set_socket_tos, "gst_net_utils_set_socket_tos", libs);
  gidLink(cast(void**)&gst_ptp_deinit, "gst_ptp_deinit", libs);
  gidLink(cast(void**)&gst_ptp_init, "gst_ptp_init", libs);
  gidLink(cast(void**)&gst_ptp_init_full, "gst_ptp_init_full", libs);
  gidLink(cast(void**)&gst_ptp_is_initialized, "gst_ptp_is_initialized", libs);
  gidLink(cast(void**)&gst_ptp_is_supported, "gst_ptp_is_supported", libs);
  gidLink(cast(void**)&gst_ptp_statistics_callback_add, "gst_ptp_statistics_callback_add", libs);
  gidLink(cast(void**)&gst_ptp_statistics_callback_remove, "gst_ptp_statistics_callback_remove", libs);
}
