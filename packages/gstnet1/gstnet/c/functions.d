/// C functions for gstnet1 library
module gstnet.c.functions;

public import gid.basictypes;
import gid.loader;
import gstnet.c.types;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gio.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstnet-1.0-0.dll;gstnet-1.0-0.dll;gstnet-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstnet-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstnet-1.0.so.0"];

__gshared extern(C)
{
  // NetAddressMeta
  const(GstMetaInfo)* function() c_gst_net_address_meta_get_info; ///

  // NetClientClock
  GType function() c_gst_net_client_clock_get_type; ///
  GstClock* function(const(char)* name, const(char)* remoteAddress, int remotePort, GstClockTime baseTime) c_gst_net_client_clock_new; ///

  // NetControlMessageMeta
  const(GstMetaInfo)* function() c_gst_net_control_message_meta_get_info; ///

  // NetTimePacket
  GType function() c_gst_net_time_packet_get_type; ///
  GstNetTimePacket* function(const(ubyte)* buffer) c_gst_net_time_packet_new; ///
  GstNetTimePacket* function(const(GstNetTimePacket)* packet) c_gst_net_time_packet_copy; ///
  void function(GstNetTimePacket* packet) c_gst_net_time_packet_free; ///
  gboolean function(const(GstNetTimePacket)* packet, GSocket* socket, GSocketAddress* destAddress, GError** _err) c_gst_net_time_packet_send; ///
  ubyte* function(const(GstNetTimePacket)* packet) c_gst_net_time_packet_serialize; ///
  GstNetTimePacket* function(GSocket* socket, GSocketAddress** srcAddress, GError** _err) c_gst_net_time_packet_receive; ///

  // NetTimeProvider
  GType function() c_gst_net_time_provider_get_type; ///
  GstNetTimeProvider* function(GstClock* clock, const(char)* address, int port) c_gst_net_time_provider_new; ///

  // NtpClock
  GType function() c_gst_ntp_clock_get_type; ///
  GstClock* function(const(char)* name, const(char)* remoteAddress, int remotePort, GstClockTime baseTime) c_gst_ntp_clock_new; ///

  // PtpClock
  GType function() c_gst_ptp_clock_get_type; ///
  GstClock* function(const(char)* name, uint domain) c_gst_ptp_clock_new; ///

  // global
  GstNetAddressMeta* function(GstBuffer* buffer, GSocketAddress* addr) c_gst_buffer_add_net_address_meta; ///
  GstNetControlMessageMeta* function(GstBuffer* buffer, GSocketControlMessage* message) c_gst_buffer_add_net_control_message_meta; ///
  GstNetAddressMeta* function(GstBuffer* buffer) c_gst_buffer_get_net_address_meta; ///
  GType function() c_gst_net_address_meta_api_get_type; ///
  GType function() c_gst_net_control_message_meta_api_get_type; ///
  gboolean function(GSocket* socket, int qosDscp) c_gst_net_utils_set_socket_tos; ///
  void function() c_gst_ptp_deinit; ///
  gboolean function(ulong clockId, char** interfaces) c_gst_ptp_init; ///
  gboolean function(const(GstStructure)* config) c_gst_ptp_init_full; ///
  gboolean function() c_gst_ptp_is_initialized; ///
  gboolean function() c_gst_ptp_is_supported; ///
  gulong function(GstPtpStatisticsCallback callback, void* userData, GDestroyNotify destroyData) c_gst_ptp_statistics_callback_add; ///
  void function(gulong id) c_gst_ptp_statistics_callback_remove; ///
}

// NetAddressMeta

/** */
alias gst_net_address_meta_get_info = c_gst_net_address_meta_get_info;

// NetClientClock

/** */
alias gst_net_client_clock_get_type = c_gst_net_client_clock_get_type;

/** */
alias gst_net_client_clock_new = c_gst_net_client_clock_new;

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
