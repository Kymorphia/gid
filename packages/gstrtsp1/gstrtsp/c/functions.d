/// C functions for gstrtsp1 library
module gstrtsp.c.functions;

public import gid.basictypes;
import gid.loader;
import gstrtsp.c.types;
public import gio.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstsdp.c.types;

version(Windows)
  private immutable LIBS = ["libgstrtsp-1.0-0.dll;gstrtsp-1.0-0.dll;gstrtsp-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstrtsp-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstrtsp-1.0.so.0"];

__gshared extern(C)
{
  // RTSPAuthCredential
  GType function() c_gst_rtsp_auth_credential_get_type; ///

  // RTSPAuthParam
  GType function() c_gst_rtsp_auth_param_get_type; ///
  GstRTSPAuthParam* function(GstRTSPAuthParam* param) c_gst_rtsp_auth_param_copy; ///
  void function(GstRTSPAuthParam* param) c_gst_rtsp_auth_param_free; ///

  // RTSPConnection
  void function(GstRTSPConnection* conn, const(char)* key, const(char)* value) c_gst_rtsp_connection_add_extra_http_request_header; ///
  void function(GstRTSPConnection* conn) c_gst_rtsp_connection_clear_auth_params; ///
  GstRTSPResult function(GstRTSPConnection* conn) c_gst_rtsp_connection_close; ///
  GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout) c_gst_rtsp_connection_connect; ///
  GstRTSPResult function(GstRTSPConnection* conn, long timeout) c_gst_rtsp_connection_connect_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout, GstRTSPMessage* response) c_gst_rtsp_connection_connect_with_response; ///
  GstRTSPResult function(GstRTSPConnection* conn, long timeout, GstRTSPMessage* response) c_gst_rtsp_connection_connect_with_response_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPConnection* conn2) c_gst_rtsp_connection_do_tunnel; ///
  GstRTSPResult function(GstRTSPConnection* conn, gboolean flush) c_gst_rtsp_connection_flush; ///
  GstRTSPResult function(GstRTSPConnection* conn) c_gst_rtsp_connection_free; ///
  gboolean function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_ignore_x_server_reply; ///
  const(char)* function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_ip; ///
  GSocket* function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_read_socket; ///
  gboolean function(GstRTSPConnection* conn) c_gst_rtsp_connection_get_remember_session_id; ///
  GTlsConnection* function(GstRTSPConnection* conn, GError** _err) c_gst_rtsp_connection_get_tls; ///
  GTlsDatabase* function(GstRTSPConnection* conn) c_gst_rtsp_connection_get_tls_database; ///
  GTlsInteraction* function(GstRTSPConnection* conn) c_gst_rtsp_connection_get_tls_interaction; ///
  GTlsCertificateFlags function(GstRTSPConnection* conn) c_gst_rtsp_connection_get_tls_validation_flags; ///
  const(char)* function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_tunnelid; ///
  GstRTSPUrl* function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_url; ///
  GSocket* function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_get_write_socket; ///
  gboolean function(const(GstRTSPConnection)* conn) c_gst_rtsp_connection_is_tunneled; ///
  GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout) c_gst_rtsp_connection_next_timeout; ///
  long function(GstRTSPConnection* conn) c_gst_rtsp_connection_next_timeout_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPEvent events, GstRTSPEvent* revents, GTimeVal* timeout) c_gst_rtsp_connection_poll; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPEvent events, GstRTSPEvent* revents, long timeout) c_gst_rtsp_connection_poll_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, ubyte* data, uint size, GTimeVal* timeout) c_gst_rtsp_connection_read; ///
  GstRTSPResult function(GstRTSPConnection* conn, ubyte* data, uint size, long timeout) c_gst_rtsp_connection_read_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, GTimeVal* timeout) c_gst_rtsp_connection_receive; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, long timeout) c_gst_rtsp_connection_receive_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn) c_gst_rtsp_connection_reset_timeout; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, GTimeVal* timeout) c_gst_rtsp_connection_send; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* messages, uint nMessages, GTimeVal* timeout) c_gst_rtsp_connection_send_messages; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* messages, uint nMessages, long timeout) c_gst_rtsp_connection_send_messages_usec; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, long timeout) c_gst_rtsp_connection_send_usec; ///
  void function(GstRTSPConnection* conn, GstRTSPConnectionAcceptCertificateFunc func, void* userData, GDestroyNotify destroyNotify) c_gst_rtsp_connection_set_accept_certificate_func; ///
  GstRTSPResult function(GstRTSPConnection* conn, GstRTSPAuthMethod method, const(char)* user, const(char)* pass) c_gst_rtsp_connection_set_auth; ///
  void function(GstRTSPConnection* conn, const(char)* param, const(char)* value) c_gst_rtsp_connection_set_auth_param; ///
  void function(GstRTSPConnection* conn, uint limit) c_gst_rtsp_connection_set_content_length_limit; ///
  void function(GstRTSPConnection* conn, gboolean enable) c_gst_rtsp_connection_set_http_mode; ///
  void function(GstRTSPConnection* conn, gboolean ignore) c_gst_rtsp_connection_set_ignore_x_server_reply; ///
  void function(GstRTSPConnection* conn, const(char)* ip) c_gst_rtsp_connection_set_ip; ///
  GstRTSPResult function(GstRTSPConnection* conn, const(char)* host, uint port) c_gst_rtsp_connection_set_proxy; ///
  GstRTSPResult function(GstRTSPConnection* conn, uint qosDscp) c_gst_rtsp_connection_set_qos_dscp; ///
  void function(GstRTSPConnection* conn, gboolean remember) c_gst_rtsp_connection_set_remember_session_id; ///
  void function(GstRTSPConnection* conn, GTlsDatabase* database) c_gst_rtsp_connection_set_tls_database; ///
  void function(GstRTSPConnection* conn, GTlsInteraction* interaction) c_gst_rtsp_connection_set_tls_interaction; ///
  gboolean function(GstRTSPConnection* conn, GTlsCertificateFlags flags) c_gst_rtsp_connection_set_tls_validation_flags; ///
  void function(GstRTSPConnection* conn, gboolean tunneled) c_gst_rtsp_connection_set_tunneled; ///
  GstRTSPResult function(GstRTSPConnection* conn, const(ubyte)* data, uint size, GTimeVal* timeout) c_gst_rtsp_connection_write; ///
  GstRTSPResult function(GstRTSPConnection* conn, const(ubyte)* data, uint size, long timeout) c_gst_rtsp_connection_write_usec; ///
  GstRTSPResult function(GSocket* socket, GstRTSPConnection** conn, GCancellable* cancellable) c_gst_rtsp_connection_accept; ///
  GstRTSPResult function(const(GstRTSPUrl)* url, GstRTSPConnection** conn) c_gst_rtsp_connection_create; ///
  GstRTSPResult function(GSocket* socket, const(char)* ip, ushort port, const(char)* initialBuffer, GstRTSPConnection** conn) c_gst_rtsp_connection_create_from_socket; ///

  // RTSPExtension
  GType function() c_gst_rtsp_extension_get_type; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) c_gst_rtsp_extension_after_send; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) c_gst_rtsp_extension_before_send; ///
  gboolean function(GstRTSPExtension* ext, GstCaps* caps) c_gst_rtsp_extension_configure_stream; ///
  gboolean function(GstRTSPExtension* ext, GstRTSPMessage* resp) c_gst_rtsp_extension_detect_server; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPLowerTrans protocols, char* transport) c_gst_rtsp_extension_get_transports; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstSDPMessage* sdp, GstStructure* s) c_gst_rtsp_extension_parse_sdp; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) c_gst_rtsp_extension_receive_request; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) c_gst_rtsp_extension_send; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstSDPMedia* media) c_gst_rtsp_extension_setup_media; ///
  GstRTSPResult function(GstRTSPExtension* ext, GstRTSPUrl* url) c_gst_rtsp_extension_stream_select; ///

  // RTSPMessage
  GType function() c_gst_rtsp_msg_get_type; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, const(char)* value) c_gst_rtsp_message_add_header; ///
  GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, const(char)* value) c_gst_rtsp_message_add_header_by_name; ///
  GstRTSPResult function(const(GstRTSPMessage)* msg, GString* str) c_gst_rtsp_message_append_headers; ///
  GstRTSPResult function(const(GstRTSPMessage)* msg, GstRTSPMessage** copy) c_gst_rtsp_message_copy; ///
  GstRTSPResult function(GstRTSPMessage* msg) c_gst_rtsp_message_dump; ///
  GstRTSPResult function(GstRTSPMessage* msg) c_gst_rtsp_message_free; ///
  GstRTSPResult function(const(GstRTSPMessage)* msg, ubyte** data, uint* size) c_gst_rtsp_message_get_body; ///
  GstRTSPResult function(const(GstRTSPMessage)* msg, GstBuffer** buffer) c_gst_rtsp_message_get_body_buffer; ///
  GstRTSPResult function(const(GstRTSPMessage)* msg, GstRTSPHeaderField field, char** value, int indx) c_gst_rtsp_message_get_header; ///
  GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, char** value, int index) c_gst_rtsp_message_get_header_by_name; ///
  GstRTSPMsgType function(GstRTSPMessage* msg) c_gst_rtsp_message_get_type; ///
  gboolean function(const(GstRTSPMessage)* msg) c_gst_rtsp_message_has_body_buffer; ///
  GstRTSPResult function(GstRTSPMessage* msg) c_gst_rtsp_message_init; ///
  GstRTSPResult function(GstRTSPMessage* msg, ubyte channel) c_gst_rtsp_message_init_data; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPMethod method, const(char)* uri) c_gst_rtsp_message_init_request; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPStatusCode code, const(char)* reason, const(GstRTSPMessage)* request) c_gst_rtsp_message_init_response; ///
  GstRTSPAuthCredential** function(GstRTSPMessage* msg, GstRTSPHeaderField field) c_gst_rtsp_message_parse_auth_credentials; ///
  GstRTSPResult function(GstRTSPMessage* msg, ubyte* channel) c_gst_rtsp_message_parse_data; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPMethod* method, const(char*)* uri, GstRTSPVersion* version_) c_gst_rtsp_message_parse_request; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPStatusCode* code, const(char*)* reason, GstRTSPVersion* version_) c_gst_rtsp_message_parse_response; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, int indx) c_gst_rtsp_message_remove_header; ///
  GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, int index) c_gst_rtsp_message_remove_header_by_name; ///
  GstRTSPResult function(GstRTSPMessage* msg, const(ubyte)* data, uint size) c_gst_rtsp_message_set_body; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstBuffer* buffer) c_gst_rtsp_message_set_body_buffer; ///
  GstRTSPResult function(GstRTSPMessage* msg, ubyte** data, uint* size) c_gst_rtsp_message_steal_body; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstBuffer** buffer) c_gst_rtsp_message_steal_body_buffer; ///
  GstRTSPResult function(GstRTSPMessage* msg, ubyte* data, uint size) c_gst_rtsp_message_take_body; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstBuffer* buffer) c_gst_rtsp_message_take_body_buffer; ///
  GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, char* value) c_gst_rtsp_message_take_header; ///
  GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, char* value) c_gst_rtsp_message_take_header_by_name; ///
  GstRTSPResult function(GstRTSPMessage* msg) c_gst_rtsp_message_unset; ///

  // RTSPRange
  gboolean function(GstRTSPTimeRange* range, GstRTSPRangeUnit unit) c_gst_rtsp_range_convert_units; ///
  void function(GstRTSPTimeRange* range) c_gst_rtsp_range_free; ///
  gboolean function(const(GstRTSPTimeRange)* range, GstClockTime* min, GstClockTime* max) c_gst_rtsp_range_get_times; ///
  GstRTSPResult function(const(char)* rangestr, GstRTSPTimeRange** range) c_gst_rtsp_range_parse; ///
  char* function(const(GstRTSPTimeRange)* range) c_gst_rtsp_range_to_string; ///

  // RTSPTransport
  char* function(GstRTSPTransport* transport) c_gst_rtsp_transport_as_text; ///
  GstRTSPResult function(GstRTSPTransport* transport) c_gst_rtsp_transport_free; ///
  GstRTSPResult function(GstRTSPTransport* transport, const(char*)* mediaType) c_gst_rtsp_transport_get_media_type; ///
  GstRTSPResult function(GstRTSPTransMode trans, const(char*)* manager, uint option) c_gst_rtsp_transport_get_manager; ///
  GstRTSPResult function(GstRTSPTransMode trans, const(char*)* mime) c_gst_rtsp_transport_get_mime; ///
  GstRTSPResult function(GstRTSPTransport* transport) c_gst_rtsp_transport_init; ///
  GstRTSPResult function(GstRTSPTransport** transport) c_gst_rtsp_transport_new; ///
  GstRTSPResult function(const(char)* str, GstRTSPTransport* transport) c_gst_rtsp_transport_parse; ///

  // RTSPUrl
  GType function() c_gst_rtsp_url_get_type; ///
  GstRTSPUrl* function(const(GstRTSPUrl)* url) c_gst_rtsp_url_copy; ///
  char** function(const(GstRTSPUrl)* url) c_gst_rtsp_url_decode_path_components; ///
  void function(GstRTSPUrl* url) c_gst_rtsp_url_free; ///
  GstRTSPResult function(const(GstRTSPUrl)* url, ushort* port) c_gst_rtsp_url_get_port; ///
  char* function(const(GstRTSPUrl)* url) c_gst_rtsp_url_get_request_uri; ///
  char* function(const(GstRTSPUrl)* url, const(char)* controlPath) c_gst_rtsp_url_get_request_uri_with_control; ///
  GstRTSPResult function(GstRTSPUrl* url, ushort port) c_gst_rtsp_url_set_port; ///
  GstRTSPResult function(const(char)* urlstr, GstRTSPUrl** url) c_gst_rtsp_url_parse; ///

  // RTSPWatch
  uint function(GstRTSPWatch* watch, GMainContext* context) c_gst_rtsp_watch_attach; ///
  void function(GstRTSPWatch* watch, size_t* bytes, uint* messages) c_gst_rtsp_watch_get_send_backlog; ///
  void function(GstRTSPWatch* watch) c_gst_rtsp_watch_reset; ///
  GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* message, uint* id) c_gst_rtsp_watch_send_message; ///
  GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* messages, uint nMessages, uint* id) c_gst_rtsp_watch_send_messages; ///
  void function(GstRTSPWatch* watch, gboolean flushing) c_gst_rtsp_watch_set_flushing; ///
  void function(GstRTSPWatch* watch, size_t bytes, uint messages) c_gst_rtsp_watch_set_send_backlog; ///
  void function(GstRTSPWatch* watch) c_gst_rtsp_watch_unref; ///
  GstRTSPResult function(GstRTSPWatch* watch, GTimeVal* timeout) c_gst_rtsp_watch_wait_backlog; ///
  GstRTSPResult function(GstRTSPWatch* watch, long timeout) c_gst_rtsp_watch_wait_backlog_usec; ///
  GstRTSPResult function(GstRTSPWatch* watch, const(ubyte)* data, uint size, uint* id) c_gst_rtsp_watch_write_data; ///
  GstRTSPWatch* function(GstRTSPConnection* conn, GstRTSPWatchFuncs* funcs, void* userData, GDestroyNotify notify) c_gst_rtsp_watch_new; ///

  // global
  void function(GstRTSPAuthCredential** credentials) c_gst_rtsp_auth_credentials_free; ///
  GstRTSPHeaderField function(const(char)* header) c_gst_rtsp_find_header_field; ///
  GstRTSPMethod function(const(char)* method) c_gst_rtsp_find_method; ///
  char* function(const(char)* algorithm, const(char)* method, const(char)* realm, const(char)* username, const(char)* password, const(char)* uri, const(char)* nonce) c_gst_rtsp_generate_digest_auth_response; ///
  char* function(const(char)* algorithm, const(char)* method, const(char)* md5, const(char)* uri, const(char)* nonce) c_gst_rtsp_generate_digest_auth_response_from_md5; ///
  gboolean function(GstRTSPHeaderField field) c_gst_rtsp_header_allow_multiple; ///
  const(char)* function(GstRTSPHeaderField field) c_gst_rtsp_header_as_text; ///
  GstRTSPResult function(GstRTSPMessage** msg) c_gst_rtsp_message_new; ///
  GstRTSPResult function(GstRTSPMessage** msg, ubyte channel) c_gst_rtsp_message_new_data; ///
  GstRTSPResult function(GstRTSPMessage** msg, GstRTSPMethod method, const(char)* uri) c_gst_rtsp_message_new_request; ///
  GstRTSPResult function(GstRTSPMessage** msg, GstRTSPStatusCode code, const(char)* reason, const(GstRTSPMessage)* request) c_gst_rtsp_message_new_response; ///
  char* function(GstRTSPMethod options) c_gst_rtsp_options_as_text; ///
  GstRTSPMethod function(const(char)* options) c_gst_rtsp_options_from_text; ///
  const(char)* function(GstRTSPStatusCode code) c_gst_rtsp_status_as_text; ///
  char* function(GstRTSPResult result) c_gst_rtsp_strresult; ///

  // RTSPMethod
  const(char)* function(GstRTSPMethod method) c_gst_rtsp_method_as_text; ///

  // RTSPVersion
  const(char)* function(GstRTSPVersion version_) c_gst_rtsp_version_as_text; ///
}

// RTSPAuthCredential

/** */
alias gst_rtsp_auth_credential_get_type = c_gst_rtsp_auth_credential_get_type;

// RTSPAuthParam

/** */
alias gst_rtsp_auth_param_get_type = c_gst_rtsp_auth_param_get_type;

/** */
alias gst_rtsp_auth_param_copy = c_gst_rtsp_auth_param_copy;

/** */
alias gst_rtsp_auth_param_free = c_gst_rtsp_auth_param_free;

// RTSPConnection

/** */
alias gst_rtsp_connection_add_extra_http_request_header = c_gst_rtsp_connection_add_extra_http_request_header;

/** */
alias gst_rtsp_connection_clear_auth_params = c_gst_rtsp_connection_clear_auth_params;

/** */
alias gst_rtsp_connection_close = c_gst_rtsp_connection_close;

/** */
alias gst_rtsp_connection_connect = c_gst_rtsp_connection_connect;

/** */
alias gst_rtsp_connection_connect_usec = c_gst_rtsp_connection_connect_usec;

/** */
alias gst_rtsp_connection_connect_with_response = c_gst_rtsp_connection_connect_with_response;

/** */
alias gst_rtsp_connection_connect_with_response_usec = c_gst_rtsp_connection_connect_with_response_usec;

/** */
alias gst_rtsp_connection_do_tunnel = c_gst_rtsp_connection_do_tunnel;

/** */
alias gst_rtsp_connection_flush = c_gst_rtsp_connection_flush;

/** */
alias gst_rtsp_connection_free = c_gst_rtsp_connection_free;

/** */
alias gst_rtsp_connection_get_ignore_x_server_reply = c_gst_rtsp_connection_get_ignore_x_server_reply;

/** */
alias gst_rtsp_connection_get_ip = c_gst_rtsp_connection_get_ip;

/** */
alias gst_rtsp_connection_get_read_socket = c_gst_rtsp_connection_get_read_socket;

/** */
alias gst_rtsp_connection_get_remember_session_id = c_gst_rtsp_connection_get_remember_session_id;

/** */
alias gst_rtsp_connection_get_tls = c_gst_rtsp_connection_get_tls;

/** */
alias gst_rtsp_connection_get_tls_database = c_gst_rtsp_connection_get_tls_database;

/** */
alias gst_rtsp_connection_get_tls_interaction = c_gst_rtsp_connection_get_tls_interaction;

/** */
alias gst_rtsp_connection_get_tls_validation_flags = c_gst_rtsp_connection_get_tls_validation_flags;

/** */
alias gst_rtsp_connection_get_tunnelid = c_gst_rtsp_connection_get_tunnelid;

/** */
alias gst_rtsp_connection_get_url = c_gst_rtsp_connection_get_url;

/** */
alias gst_rtsp_connection_get_write_socket = c_gst_rtsp_connection_get_write_socket;

/** */
alias gst_rtsp_connection_is_tunneled = c_gst_rtsp_connection_is_tunneled;

/** */
alias gst_rtsp_connection_next_timeout = c_gst_rtsp_connection_next_timeout;

/** */
alias gst_rtsp_connection_next_timeout_usec = c_gst_rtsp_connection_next_timeout_usec;

/** */
alias gst_rtsp_connection_poll = c_gst_rtsp_connection_poll;

/** */
alias gst_rtsp_connection_poll_usec = c_gst_rtsp_connection_poll_usec;

/** */
alias gst_rtsp_connection_read = c_gst_rtsp_connection_read;

/** */
alias gst_rtsp_connection_read_usec = c_gst_rtsp_connection_read_usec;

/** */
alias gst_rtsp_connection_receive = c_gst_rtsp_connection_receive;

/** */
alias gst_rtsp_connection_receive_usec = c_gst_rtsp_connection_receive_usec;

/** */
alias gst_rtsp_connection_reset_timeout = c_gst_rtsp_connection_reset_timeout;

/** */
alias gst_rtsp_connection_send = c_gst_rtsp_connection_send;

/** */
alias gst_rtsp_connection_send_messages = c_gst_rtsp_connection_send_messages;

/** */
alias gst_rtsp_connection_send_messages_usec = c_gst_rtsp_connection_send_messages_usec;

/** */
alias gst_rtsp_connection_send_usec = c_gst_rtsp_connection_send_usec;

/** */
alias gst_rtsp_connection_set_accept_certificate_func = c_gst_rtsp_connection_set_accept_certificate_func;

/** */
alias gst_rtsp_connection_set_auth = c_gst_rtsp_connection_set_auth;

/** */
alias gst_rtsp_connection_set_auth_param = c_gst_rtsp_connection_set_auth_param;

/** */
alias gst_rtsp_connection_set_content_length_limit = c_gst_rtsp_connection_set_content_length_limit;

/** */
alias gst_rtsp_connection_set_http_mode = c_gst_rtsp_connection_set_http_mode;

/** */
alias gst_rtsp_connection_set_ignore_x_server_reply = c_gst_rtsp_connection_set_ignore_x_server_reply;

/** */
alias gst_rtsp_connection_set_ip = c_gst_rtsp_connection_set_ip;

/** */
alias gst_rtsp_connection_set_proxy = c_gst_rtsp_connection_set_proxy;

/** */
alias gst_rtsp_connection_set_qos_dscp = c_gst_rtsp_connection_set_qos_dscp;

/** */
alias gst_rtsp_connection_set_remember_session_id = c_gst_rtsp_connection_set_remember_session_id;

/** */
alias gst_rtsp_connection_set_tls_database = c_gst_rtsp_connection_set_tls_database;

/** */
alias gst_rtsp_connection_set_tls_interaction = c_gst_rtsp_connection_set_tls_interaction;

/** */
alias gst_rtsp_connection_set_tls_validation_flags = c_gst_rtsp_connection_set_tls_validation_flags;

/** */
alias gst_rtsp_connection_set_tunneled = c_gst_rtsp_connection_set_tunneled;

/** */
alias gst_rtsp_connection_write = c_gst_rtsp_connection_write;

/** */
alias gst_rtsp_connection_write_usec = c_gst_rtsp_connection_write_usec;

/** */
alias gst_rtsp_connection_accept = c_gst_rtsp_connection_accept;

/** */
alias gst_rtsp_connection_create = c_gst_rtsp_connection_create;

/** */
alias gst_rtsp_connection_create_from_socket = c_gst_rtsp_connection_create_from_socket;

// RTSPExtension

/** */
alias gst_rtsp_extension_get_type = c_gst_rtsp_extension_get_type;

/** */
alias gst_rtsp_extension_after_send = c_gst_rtsp_extension_after_send;

/** */
alias gst_rtsp_extension_before_send = c_gst_rtsp_extension_before_send;

/** */
alias gst_rtsp_extension_configure_stream = c_gst_rtsp_extension_configure_stream;

/** */
alias gst_rtsp_extension_detect_server = c_gst_rtsp_extension_detect_server;

/** */
alias gst_rtsp_extension_get_transports = c_gst_rtsp_extension_get_transports;

/** */
alias gst_rtsp_extension_parse_sdp = c_gst_rtsp_extension_parse_sdp;

/** */
alias gst_rtsp_extension_receive_request = c_gst_rtsp_extension_receive_request;

/** */
alias gst_rtsp_extension_send = c_gst_rtsp_extension_send;

/** */
alias gst_rtsp_extension_setup_media = c_gst_rtsp_extension_setup_media;

/** */
alias gst_rtsp_extension_stream_select = c_gst_rtsp_extension_stream_select;

// RTSPMessage

/** */
alias gst_rtsp_msg_get_type = c_gst_rtsp_msg_get_type;

/** */
alias gst_rtsp_message_add_header = c_gst_rtsp_message_add_header;

/** */
alias gst_rtsp_message_add_header_by_name = c_gst_rtsp_message_add_header_by_name;

/** */
alias gst_rtsp_message_append_headers = c_gst_rtsp_message_append_headers;

/** */
alias gst_rtsp_message_copy = c_gst_rtsp_message_copy;

/** */
alias gst_rtsp_message_dump = c_gst_rtsp_message_dump;

/** */
alias gst_rtsp_message_free = c_gst_rtsp_message_free;

/** */
alias gst_rtsp_message_get_body = c_gst_rtsp_message_get_body;

/** */
alias gst_rtsp_message_get_body_buffer = c_gst_rtsp_message_get_body_buffer;

/** */
alias gst_rtsp_message_get_header = c_gst_rtsp_message_get_header;

/** */
alias gst_rtsp_message_get_header_by_name = c_gst_rtsp_message_get_header_by_name;

/** */
alias gst_rtsp_message_get_type = c_gst_rtsp_message_get_type;

/** */
alias gst_rtsp_message_has_body_buffer = c_gst_rtsp_message_has_body_buffer;

/** */
alias gst_rtsp_message_init = c_gst_rtsp_message_init;

/** */
alias gst_rtsp_message_init_data = c_gst_rtsp_message_init_data;

/** */
alias gst_rtsp_message_init_request = c_gst_rtsp_message_init_request;

/** */
alias gst_rtsp_message_init_response = c_gst_rtsp_message_init_response;

/** */
alias gst_rtsp_message_parse_auth_credentials = c_gst_rtsp_message_parse_auth_credentials;

/** */
alias gst_rtsp_message_parse_data = c_gst_rtsp_message_parse_data;

/** */
alias gst_rtsp_message_parse_request = c_gst_rtsp_message_parse_request;

/** */
alias gst_rtsp_message_parse_response = c_gst_rtsp_message_parse_response;

/** */
alias gst_rtsp_message_remove_header = c_gst_rtsp_message_remove_header;

/** */
alias gst_rtsp_message_remove_header_by_name = c_gst_rtsp_message_remove_header_by_name;

/** */
alias gst_rtsp_message_set_body = c_gst_rtsp_message_set_body;

/** */
alias gst_rtsp_message_set_body_buffer = c_gst_rtsp_message_set_body_buffer;

/** */
alias gst_rtsp_message_steal_body = c_gst_rtsp_message_steal_body;

/** */
alias gst_rtsp_message_steal_body_buffer = c_gst_rtsp_message_steal_body_buffer;

/** */
alias gst_rtsp_message_take_body = c_gst_rtsp_message_take_body;

/** */
alias gst_rtsp_message_take_body_buffer = c_gst_rtsp_message_take_body_buffer;

/** */
alias gst_rtsp_message_take_header = c_gst_rtsp_message_take_header;

/** */
alias gst_rtsp_message_take_header_by_name = c_gst_rtsp_message_take_header_by_name;

/** */
alias gst_rtsp_message_unset = c_gst_rtsp_message_unset;

// RTSPRange

/** */
alias gst_rtsp_range_convert_units = c_gst_rtsp_range_convert_units;

/** */
alias gst_rtsp_range_free = c_gst_rtsp_range_free;

/** */
alias gst_rtsp_range_get_times = c_gst_rtsp_range_get_times;

/** */
alias gst_rtsp_range_parse = c_gst_rtsp_range_parse;

/** */
alias gst_rtsp_range_to_string = c_gst_rtsp_range_to_string;

// RTSPTransport

/** */
alias gst_rtsp_transport_as_text = c_gst_rtsp_transport_as_text;

/** */
alias gst_rtsp_transport_free = c_gst_rtsp_transport_free;

/** */
alias gst_rtsp_transport_get_media_type = c_gst_rtsp_transport_get_media_type;

/** */
alias gst_rtsp_transport_get_manager = c_gst_rtsp_transport_get_manager;

/** */
alias gst_rtsp_transport_get_mime = c_gst_rtsp_transport_get_mime;

/** */
alias gst_rtsp_transport_init = c_gst_rtsp_transport_init;

/** */
alias gst_rtsp_transport_new = c_gst_rtsp_transport_new;

/** */
alias gst_rtsp_transport_parse = c_gst_rtsp_transport_parse;

// RTSPUrl

/** */
alias gst_rtsp_url_get_type = c_gst_rtsp_url_get_type;

/** */
alias gst_rtsp_url_copy = c_gst_rtsp_url_copy;

/** */
alias gst_rtsp_url_decode_path_components = c_gst_rtsp_url_decode_path_components;

/** */
alias gst_rtsp_url_free = c_gst_rtsp_url_free;

/** */
alias gst_rtsp_url_get_port = c_gst_rtsp_url_get_port;

/** */
alias gst_rtsp_url_get_request_uri = c_gst_rtsp_url_get_request_uri;

/** */
alias gst_rtsp_url_get_request_uri_with_control = c_gst_rtsp_url_get_request_uri_with_control;

/** */
alias gst_rtsp_url_set_port = c_gst_rtsp_url_set_port;

/** */
alias gst_rtsp_url_parse = c_gst_rtsp_url_parse;

// RTSPWatch

/** */
alias gst_rtsp_watch_attach = c_gst_rtsp_watch_attach;

/** */
alias gst_rtsp_watch_get_send_backlog = c_gst_rtsp_watch_get_send_backlog;

/** */
alias gst_rtsp_watch_reset = c_gst_rtsp_watch_reset;

/** */
alias gst_rtsp_watch_send_message = c_gst_rtsp_watch_send_message;

/** */
alias gst_rtsp_watch_send_messages = c_gst_rtsp_watch_send_messages;

/** */
alias gst_rtsp_watch_set_flushing = c_gst_rtsp_watch_set_flushing;

/** */
alias gst_rtsp_watch_set_send_backlog = c_gst_rtsp_watch_set_send_backlog;

/** */
alias gst_rtsp_watch_unref = c_gst_rtsp_watch_unref;

/** */
alias gst_rtsp_watch_wait_backlog = c_gst_rtsp_watch_wait_backlog;

/** */
alias gst_rtsp_watch_wait_backlog_usec = c_gst_rtsp_watch_wait_backlog_usec;

/** */
alias gst_rtsp_watch_write_data = c_gst_rtsp_watch_write_data;

/** */
alias gst_rtsp_watch_new = c_gst_rtsp_watch_new;

// global

/** */
alias gst_rtsp_auth_credentials_free = c_gst_rtsp_auth_credentials_free;

/** */
alias gst_rtsp_find_header_field = c_gst_rtsp_find_header_field;

/** */
alias gst_rtsp_find_method = c_gst_rtsp_find_method;

/** */
alias gst_rtsp_generate_digest_auth_response = c_gst_rtsp_generate_digest_auth_response;

/** */
alias gst_rtsp_generate_digest_auth_response_from_md5 = c_gst_rtsp_generate_digest_auth_response_from_md5;

/** */
alias gst_rtsp_header_allow_multiple = c_gst_rtsp_header_allow_multiple;

/** */
alias gst_rtsp_header_as_text = c_gst_rtsp_header_as_text;

/** */
alias gst_rtsp_message_new = c_gst_rtsp_message_new;

/** */
alias gst_rtsp_message_new_data = c_gst_rtsp_message_new_data;

/** */
alias gst_rtsp_message_new_request = c_gst_rtsp_message_new_request;

/** */
alias gst_rtsp_message_new_response = c_gst_rtsp_message_new_response;

/** */
alias gst_rtsp_options_as_text = c_gst_rtsp_options_as_text;

/** */
alias gst_rtsp_options_from_text = c_gst_rtsp_options_from_text;

/** */
alias gst_rtsp_status_as_text = c_gst_rtsp_status_as_text;

/** */
alias gst_rtsp_strresult = c_gst_rtsp_strresult;

// RTSPMethod

/** */
alias gst_rtsp_method_as_text = c_gst_rtsp_method_as_text;

// RTSPVersion

/** */
alias gst_rtsp_version_as_text = c_gst_rtsp_version_as_text;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // RTSPAuthCredential
  gidLink(cast(void**)&gst_rtsp_auth_credential_get_type, "gst_rtsp_auth_credential_get_type", libs);

  // RTSPAuthParam
  gidLink(cast(void**)&gst_rtsp_auth_param_get_type, "gst_rtsp_auth_param_get_type", libs);
  gidLink(cast(void**)&gst_rtsp_auth_param_copy, "gst_rtsp_auth_param_copy", libs);
  gidLink(cast(void**)&gst_rtsp_auth_param_free, "gst_rtsp_auth_param_free", libs);

  // RTSPConnection
  gidLink(cast(void**)&gst_rtsp_connection_add_extra_http_request_header, "gst_rtsp_connection_add_extra_http_request_header", libs);
  gidLink(cast(void**)&gst_rtsp_connection_clear_auth_params, "gst_rtsp_connection_clear_auth_params", libs);
  gidLink(cast(void**)&gst_rtsp_connection_close, "gst_rtsp_connection_close", libs);
  gidLink(cast(void**)&gst_rtsp_connection_connect, "gst_rtsp_connection_connect", libs);
  gidLink(cast(void**)&gst_rtsp_connection_connect_usec, "gst_rtsp_connection_connect_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_connect_with_response, "gst_rtsp_connection_connect_with_response", libs);
  gidLink(cast(void**)&gst_rtsp_connection_connect_with_response_usec, "gst_rtsp_connection_connect_with_response_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_do_tunnel, "gst_rtsp_connection_do_tunnel", libs);
  gidLink(cast(void**)&gst_rtsp_connection_flush, "gst_rtsp_connection_flush", libs);
  gidLink(cast(void**)&gst_rtsp_connection_free, "gst_rtsp_connection_free", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_ignore_x_server_reply, "gst_rtsp_connection_get_ignore_x_server_reply", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_ip, "gst_rtsp_connection_get_ip", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_read_socket, "gst_rtsp_connection_get_read_socket", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_remember_session_id, "gst_rtsp_connection_get_remember_session_id", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_tls, "gst_rtsp_connection_get_tls", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_tls_database, "gst_rtsp_connection_get_tls_database", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_tls_interaction, "gst_rtsp_connection_get_tls_interaction", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_tls_validation_flags, "gst_rtsp_connection_get_tls_validation_flags", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_tunnelid, "gst_rtsp_connection_get_tunnelid", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_url, "gst_rtsp_connection_get_url", libs);
  gidLink(cast(void**)&gst_rtsp_connection_get_write_socket, "gst_rtsp_connection_get_write_socket", libs);
  gidLink(cast(void**)&gst_rtsp_connection_is_tunneled, "gst_rtsp_connection_is_tunneled", libs);
  gidLink(cast(void**)&gst_rtsp_connection_next_timeout, "gst_rtsp_connection_next_timeout", libs);
  gidLink(cast(void**)&gst_rtsp_connection_next_timeout_usec, "gst_rtsp_connection_next_timeout_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_poll, "gst_rtsp_connection_poll", libs);
  gidLink(cast(void**)&gst_rtsp_connection_poll_usec, "gst_rtsp_connection_poll_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_read, "gst_rtsp_connection_read", libs);
  gidLink(cast(void**)&gst_rtsp_connection_read_usec, "gst_rtsp_connection_read_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_receive, "gst_rtsp_connection_receive", libs);
  gidLink(cast(void**)&gst_rtsp_connection_receive_usec, "gst_rtsp_connection_receive_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_reset_timeout, "gst_rtsp_connection_reset_timeout", libs);
  gidLink(cast(void**)&gst_rtsp_connection_send, "gst_rtsp_connection_send", libs);
  gidLink(cast(void**)&gst_rtsp_connection_send_messages, "gst_rtsp_connection_send_messages", libs);
  gidLink(cast(void**)&gst_rtsp_connection_send_messages_usec, "gst_rtsp_connection_send_messages_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_send_usec, "gst_rtsp_connection_send_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_accept_certificate_func, "gst_rtsp_connection_set_accept_certificate_func", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_auth, "gst_rtsp_connection_set_auth", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_auth_param, "gst_rtsp_connection_set_auth_param", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_content_length_limit, "gst_rtsp_connection_set_content_length_limit", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_http_mode, "gst_rtsp_connection_set_http_mode", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_ignore_x_server_reply, "gst_rtsp_connection_set_ignore_x_server_reply", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_ip, "gst_rtsp_connection_set_ip", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_proxy, "gst_rtsp_connection_set_proxy", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_qos_dscp, "gst_rtsp_connection_set_qos_dscp", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_remember_session_id, "gst_rtsp_connection_set_remember_session_id", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_tls_database, "gst_rtsp_connection_set_tls_database", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_tls_interaction, "gst_rtsp_connection_set_tls_interaction", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_tls_validation_flags, "gst_rtsp_connection_set_tls_validation_flags", libs);
  gidLink(cast(void**)&gst_rtsp_connection_set_tunneled, "gst_rtsp_connection_set_tunneled", libs);
  gidLink(cast(void**)&gst_rtsp_connection_write, "gst_rtsp_connection_write", libs);
  gidLink(cast(void**)&gst_rtsp_connection_write_usec, "gst_rtsp_connection_write_usec", libs);
  gidLink(cast(void**)&gst_rtsp_connection_accept, "gst_rtsp_connection_accept", libs);
  gidLink(cast(void**)&gst_rtsp_connection_create, "gst_rtsp_connection_create", libs);
  gidLink(cast(void**)&gst_rtsp_connection_create_from_socket, "gst_rtsp_connection_create_from_socket", libs);

  // RTSPExtension
  gidLink(cast(void**)&gst_rtsp_extension_get_type, "gst_rtsp_extension_get_type", libs);
  gidLink(cast(void**)&gst_rtsp_extension_after_send, "gst_rtsp_extension_after_send", libs);
  gidLink(cast(void**)&gst_rtsp_extension_before_send, "gst_rtsp_extension_before_send", libs);
  gidLink(cast(void**)&gst_rtsp_extension_configure_stream, "gst_rtsp_extension_configure_stream", libs);
  gidLink(cast(void**)&gst_rtsp_extension_detect_server, "gst_rtsp_extension_detect_server", libs);
  gidLink(cast(void**)&gst_rtsp_extension_get_transports, "gst_rtsp_extension_get_transports", libs);
  gidLink(cast(void**)&gst_rtsp_extension_parse_sdp, "gst_rtsp_extension_parse_sdp", libs);
  gidLink(cast(void**)&gst_rtsp_extension_receive_request, "gst_rtsp_extension_receive_request", libs);
  gidLink(cast(void**)&gst_rtsp_extension_send, "gst_rtsp_extension_send", libs);
  gidLink(cast(void**)&gst_rtsp_extension_setup_media, "gst_rtsp_extension_setup_media", libs);
  gidLink(cast(void**)&gst_rtsp_extension_stream_select, "gst_rtsp_extension_stream_select", libs);

  // RTSPMessage
  gidLink(cast(void**)&gst_rtsp_msg_get_type, "gst_rtsp_msg_get_type", libs);
  gidLink(cast(void**)&gst_rtsp_message_add_header, "gst_rtsp_message_add_header", libs);
  gidLink(cast(void**)&gst_rtsp_message_add_header_by_name, "gst_rtsp_message_add_header_by_name", libs);
  gidLink(cast(void**)&gst_rtsp_message_append_headers, "gst_rtsp_message_append_headers", libs);
  gidLink(cast(void**)&gst_rtsp_message_copy, "gst_rtsp_message_copy", libs);
  gidLink(cast(void**)&gst_rtsp_message_dump, "gst_rtsp_message_dump", libs);
  gidLink(cast(void**)&gst_rtsp_message_free, "gst_rtsp_message_free", libs);
  gidLink(cast(void**)&gst_rtsp_message_get_body, "gst_rtsp_message_get_body", libs);
  gidLink(cast(void**)&gst_rtsp_message_get_body_buffer, "gst_rtsp_message_get_body_buffer", libs);
  gidLink(cast(void**)&gst_rtsp_message_get_header, "gst_rtsp_message_get_header", libs);
  gidLink(cast(void**)&gst_rtsp_message_get_header_by_name, "gst_rtsp_message_get_header_by_name", libs);
  gidLink(cast(void**)&gst_rtsp_message_get_type, "gst_rtsp_message_get_type", libs);
  gidLink(cast(void**)&gst_rtsp_message_has_body_buffer, "gst_rtsp_message_has_body_buffer", libs);
  gidLink(cast(void**)&gst_rtsp_message_init, "gst_rtsp_message_init", libs);
  gidLink(cast(void**)&gst_rtsp_message_init_data, "gst_rtsp_message_init_data", libs);
  gidLink(cast(void**)&gst_rtsp_message_init_request, "gst_rtsp_message_init_request", libs);
  gidLink(cast(void**)&gst_rtsp_message_init_response, "gst_rtsp_message_init_response", libs);
  gidLink(cast(void**)&gst_rtsp_message_parse_auth_credentials, "gst_rtsp_message_parse_auth_credentials", libs);
  gidLink(cast(void**)&gst_rtsp_message_parse_data, "gst_rtsp_message_parse_data", libs);
  gidLink(cast(void**)&gst_rtsp_message_parse_request, "gst_rtsp_message_parse_request", libs);
  gidLink(cast(void**)&gst_rtsp_message_parse_response, "gst_rtsp_message_parse_response", libs);
  gidLink(cast(void**)&gst_rtsp_message_remove_header, "gst_rtsp_message_remove_header", libs);
  gidLink(cast(void**)&gst_rtsp_message_remove_header_by_name, "gst_rtsp_message_remove_header_by_name", libs);
  gidLink(cast(void**)&gst_rtsp_message_set_body, "gst_rtsp_message_set_body", libs);
  gidLink(cast(void**)&gst_rtsp_message_set_body_buffer, "gst_rtsp_message_set_body_buffer", libs);
  gidLink(cast(void**)&gst_rtsp_message_steal_body, "gst_rtsp_message_steal_body", libs);
  gidLink(cast(void**)&gst_rtsp_message_steal_body_buffer, "gst_rtsp_message_steal_body_buffer", libs);
  gidLink(cast(void**)&gst_rtsp_message_take_body, "gst_rtsp_message_take_body", libs);
  gidLink(cast(void**)&gst_rtsp_message_take_body_buffer, "gst_rtsp_message_take_body_buffer", libs);
  gidLink(cast(void**)&gst_rtsp_message_take_header, "gst_rtsp_message_take_header", libs);
  gidLink(cast(void**)&gst_rtsp_message_take_header_by_name, "gst_rtsp_message_take_header_by_name", libs);
  gidLink(cast(void**)&gst_rtsp_message_unset, "gst_rtsp_message_unset", libs);

  // RTSPRange
  gidLink(cast(void**)&gst_rtsp_range_convert_units, "gst_rtsp_range_convert_units", libs);
  gidLink(cast(void**)&gst_rtsp_range_free, "gst_rtsp_range_free", libs);
  gidLink(cast(void**)&gst_rtsp_range_get_times, "gst_rtsp_range_get_times", libs);
  gidLink(cast(void**)&gst_rtsp_range_parse, "gst_rtsp_range_parse", libs);
  gidLink(cast(void**)&gst_rtsp_range_to_string, "gst_rtsp_range_to_string", libs);

  // RTSPTransport
  gidLink(cast(void**)&gst_rtsp_transport_as_text, "gst_rtsp_transport_as_text", libs);
  gidLink(cast(void**)&gst_rtsp_transport_free, "gst_rtsp_transport_free", libs);
  gidLink(cast(void**)&gst_rtsp_transport_get_media_type, "gst_rtsp_transport_get_media_type", libs);
  gidLink(cast(void**)&gst_rtsp_transport_get_manager, "gst_rtsp_transport_get_manager", libs);
  gidLink(cast(void**)&gst_rtsp_transport_get_mime, "gst_rtsp_transport_get_mime", libs);
  gidLink(cast(void**)&gst_rtsp_transport_init, "gst_rtsp_transport_init", libs);
  gidLink(cast(void**)&gst_rtsp_transport_new, "gst_rtsp_transport_new", libs);
  gidLink(cast(void**)&gst_rtsp_transport_parse, "gst_rtsp_transport_parse", libs);

  // RTSPUrl
  gidLink(cast(void**)&gst_rtsp_url_get_type, "gst_rtsp_url_get_type", libs);
  gidLink(cast(void**)&gst_rtsp_url_copy, "gst_rtsp_url_copy", libs);
  gidLink(cast(void**)&gst_rtsp_url_decode_path_components, "gst_rtsp_url_decode_path_components", libs);
  gidLink(cast(void**)&gst_rtsp_url_free, "gst_rtsp_url_free", libs);
  gidLink(cast(void**)&gst_rtsp_url_get_port, "gst_rtsp_url_get_port", libs);
  gidLink(cast(void**)&gst_rtsp_url_get_request_uri, "gst_rtsp_url_get_request_uri", libs);
  gidLink(cast(void**)&gst_rtsp_url_get_request_uri_with_control, "gst_rtsp_url_get_request_uri_with_control", libs);
  gidLink(cast(void**)&gst_rtsp_url_set_port, "gst_rtsp_url_set_port", libs);
  gidLink(cast(void**)&gst_rtsp_url_parse, "gst_rtsp_url_parse", libs);

  // RTSPWatch
  gidLink(cast(void**)&gst_rtsp_watch_attach, "gst_rtsp_watch_attach", libs);
  gidLink(cast(void**)&gst_rtsp_watch_get_send_backlog, "gst_rtsp_watch_get_send_backlog", libs);
  gidLink(cast(void**)&gst_rtsp_watch_reset, "gst_rtsp_watch_reset", libs);
  gidLink(cast(void**)&gst_rtsp_watch_send_message, "gst_rtsp_watch_send_message", libs);
  gidLink(cast(void**)&gst_rtsp_watch_send_messages, "gst_rtsp_watch_send_messages", libs);
  gidLink(cast(void**)&gst_rtsp_watch_set_flushing, "gst_rtsp_watch_set_flushing", libs);
  gidLink(cast(void**)&gst_rtsp_watch_set_send_backlog, "gst_rtsp_watch_set_send_backlog", libs);
  gidLink(cast(void**)&gst_rtsp_watch_unref, "gst_rtsp_watch_unref", libs);
  gidLink(cast(void**)&gst_rtsp_watch_wait_backlog, "gst_rtsp_watch_wait_backlog", libs);
  gidLink(cast(void**)&gst_rtsp_watch_wait_backlog_usec, "gst_rtsp_watch_wait_backlog_usec", libs);
  gidLink(cast(void**)&gst_rtsp_watch_write_data, "gst_rtsp_watch_write_data", libs);
  gidLink(cast(void**)&gst_rtsp_watch_new, "gst_rtsp_watch_new", libs);

  // global
  gidLink(cast(void**)&gst_rtsp_auth_credentials_free, "gst_rtsp_auth_credentials_free", libs);
  gidLink(cast(void**)&gst_rtsp_find_header_field, "gst_rtsp_find_header_field", libs);
  gidLink(cast(void**)&gst_rtsp_find_method, "gst_rtsp_find_method", libs);
  gidLink(cast(void**)&gst_rtsp_generate_digest_auth_response, "gst_rtsp_generate_digest_auth_response", libs);
  gidLink(cast(void**)&gst_rtsp_generate_digest_auth_response_from_md5, "gst_rtsp_generate_digest_auth_response_from_md5", libs);
  gidLink(cast(void**)&gst_rtsp_header_allow_multiple, "gst_rtsp_header_allow_multiple", libs);
  gidLink(cast(void**)&gst_rtsp_header_as_text, "gst_rtsp_header_as_text", libs);
  gidLink(cast(void**)&gst_rtsp_message_new, "gst_rtsp_message_new", libs);
  gidLink(cast(void**)&gst_rtsp_message_new_data, "gst_rtsp_message_new_data", libs);
  gidLink(cast(void**)&gst_rtsp_message_new_request, "gst_rtsp_message_new_request", libs);
  gidLink(cast(void**)&gst_rtsp_message_new_response, "gst_rtsp_message_new_response", libs);
  gidLink(cast(void**)&gst_rtsp_options_as_text, "gst_rtsp_options_as_text", libs);
  gidLink(cast(void**)&gst_rtsp_options_from_text, "gst_rtsp_options_from_text", libs);
  gidLink(cast(void**)&gst_rtsp_status_as_text, "gst_rtsp_status_as_text", libs);
  gidLink(cast(void**)&gst_rtsp_strresult, "gst_rtsp_strresult", libs);

  // RTSPMethod
  gidLink(cast(void**)&gst_rtsp_method_as_text, "gst_rtsp_method_as_text", libs);

  // RTSPVersion
  gidLink(cast(void**)&gst_rtsp_version_as_text, "gst_rtsp_version_as_text", libs);
}
