/// C functions for gstrtsp1 library
module gid.gstrtsp1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstrtsp1.c.types;
static import gid.gstrtsp1.c._gidlib_GstRtsp;
public import gid.gio2.c.types;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;
public import gid.gstsdp1.c.types;

private immutable LIBS = ["gstrtsp-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gstrtsp1.c._gidlib_GstRtsp.gidLibLinked;

// RTSPAuthCredential
private alias c_gst_rtsp_auth_credential_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtsp_auth_credential_get_typeFn c_gst_rtsp_auth_credential_get_type; ///

// RTSPAuthParam
private alias c_gst_rtsp_auth_param_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtsp_auth_param_get_typeFn c_gst_rtsp_auth_param_get_type; ///
private alias c_gst_rtsp_auth_param_copyFn = extern(C) GstRTSPAuthParam* function(GstRTSPAuthParam* param) nothrow;
__gshared c_gst_rtsp_auth_param_copyFn c_gst_rtsp_auth_param_copy; ///
private alias c_gst_rtsp_auth_param_freeFn = extern(C) void function(GstRTSPAuthParam* param) nothrow;
__gshared c_gst_rtsp_auth_param_freeFn c_gst_rtsp_auth_param_free; ///

// RTSPConnection
private alias c_gst_rtsp_connection_add_extra_http_request_headerFn = extern(C) void function(GstRTSPConnection* conn, const(char)* key, const(char)* value) nothrow;
__gshared c_gst_rtsp_connection_add_extra_http_request_headerFn c_gst_rtsp_connection_add_extra_http_request_header; ///
private alias c_gst_rtsp_connection_clear_auth_paramsFn = extern(C) void function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_clear_auth_paramsFn c_gst_rtsp_connection_clear_auth_params; ///
private alias c_gst_rtsp_connection_closeFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_closeFn c_gst_rtsp_connection_close; ///
private alias c_gst_rtsp_connection_connectFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_connectFn c_gst_rtsp_connection_connect; ///
private alias c_gst_rtsp_connection_connect_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, long timeout) nothrow;
__gshared c_gst_rtsp_connection_connect_usecFn c_gst_rtsp_connection_connect_usec; ///
private alias c_gst_rtsp_connection_connect_with_responseFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout, GstRTSPMessage* response) nothrow;
__gshared c_gst_rtsp_connection_connect_with_responseFn c_gst_rtsp_connection_connect_with_response; ///
private alias c_gst_rtsp_connection_connect_with_response_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, long timeout, GstRTSPMessage* response) nothrow;
__gshared c_gst_rtsp_connection_connect_with_response_usecFn c_gst_rtsp_connection_connect_with_response_usec; ///
private alias c_gst_rtsp_connection_do_tunnelFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPConnection* conn2) nothrow;
__gshared c_gst_rtsp_connection_do_tunnelFn c_gst_rtsp_connection_do_tunnel; ///
private alias c_gst_rtsp_connection_flushFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, gboolean flush) nothrow;
__gshared c_gst_rtsp_connection_flushFn c_gst_rtsp_connection_flush; ///
private alias c_gst_rtsp_connection_freeFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_freeFn c_gst_rtsp_connection_free; ///
private alias c_gst_rtsp_connection_get_ignore_x_server_replyFn = extern(C) gboolean function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_ignore_x_server_replyFn c_gst_rtsp_connection_get_ignore_x_server_reply; ///
private alias c_gst_rtsp_connection_get_ipFn = extern(C) const(char)* function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_ipFn c_gst_rtsp_connection_get_ip; ///
private alias c_gst_rtsp_connection_get_read_socketFn = extern(C) GSocket* function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_read_socketFn c_gst_rtsp_connection_get_read_socket; ///
private alias c_gst_rtsp_connection_get_remember_session_idFn = extern(C) gboolean function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_get_remember_session_idFn c_gst_rtsp_connection_get_remember_session_id; ///
private alias c_gst_rtsp_connection_get_tlsFn = extern(C) GTlsConnection* function(GstRTSPConnection* conn, GError** _err) nothrow;
__gshared c_gst_rtsp_connection_get_tlsFn c_gst_rtsp_connection_get_tls; ///
private alias c_gst_rtsp_connection_get_tls_databaseFn = extern(C) GTlsDatabase* function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_get_tls_databaseFn c_gst_rtsp_connection_get_tls_database; ///
private alias c_gst_rtsp_connection_get_tls_interactionFn = extern(C) GTlsInteraction* function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_get_tls_interactionFn c_gst_rtsp_connection_get_tls_interaction; ///
private alias c_gst_rtsp_connection_get_tls_validation_flagsFn = extern(C) GTlsCertificateFlags function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_get_tls_validation_flagsFn c_gst_rtsp_connection_get_tls_validation_flags; ///
private alias c_gst_rtsp_connection_get_tunnelidFn = extern(C) const(char)* function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_tunnelidFn c_gst_rtsp_connection_get_tunnelid; ///
private alias c_gst_rtsp_connection_get_urlFn = extern(C) GstRTSPUrl* function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_urlFn c_gst_rtsp_connection_get_url; ///
private alias c_gst_rtsp_connection_get_write_socketFn = extern(C) GSocket* function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_get_write_socketFn c_gst_rtsp_connection_get_write_socket; ///
private alias c_gst_rtsp_connection_is_tunneledFn = extern(C) gboolean function(const(GstRTSPConnection)* conn) nothrow;
__gshared c_gst_rtsp_connection_is_tunneledFn c_gst_rtsp_connection_is_tunneled; ///
private alias c_gst_rtsp_connection_next_timeoutFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_next_timeoutFn c_gst_rtsp_connection_next_timeout; ///
private alias c_gst_rtsp_connection_next_timeout_usecFn = extern(C) long function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_next_timeout_usecFn c_gst_rtsp_connection_next_timeout_usec; ///
private alias c_gst_rtsp_connection_pollFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPEvent events, GstRTSPEvent* revents, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_pollFn c_gst_rtsp_connection_poll; ///
private alias c_gst_rtsp_connection_poll_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPEvent events, GstRTSPEvent* revents, long timeout) nothrow;
__gshared c_gst_rtsp_connection_poll_usecFn c_gst_rtsp_connection_poll_usec; ///
private alias c_gst_rtsp_connection_readFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, ubyte* data, uint size, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_readFn c_gst_rtsp_connection_read; ///
private alias c_gst_rtsp_connection_read_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, ubyte* data, uint size, long timeout) nothrow;
__gshared c_gst_rtsp_connection_read_usecFn c_gst_rtsp_connection_read_usec; ///
private alias c_gst_rtsp_connection_receiveFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_receiveFn c_gst_rtsp_connection_receive; ///
private alias c_gst_rtsp_connection_receive_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, long timeout) nothrow;
__gshared c_gst_rtsp_connection_receive_usecFn c_gst_rtsp_connection_receive_usec; ///
private alias c_gst_rtsp_connection_reset_timeoutFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn) nothrow;
__gshared c_gst_rtsp_connection_reset_timeoutFn c_gst_rtsp_connection_reset_timeout; ///
private alias c_gst_rtsp_connection_sendFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_sendFn c_gst_rtsp_connection_send; ///
private alias c_gst_rtsp_connection_send_messagesFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* messages, uint nMessages, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_send_messagesFn c_gst_rtsp_connection_send_messages; ///
private alias c_gst_rtsp_connection_send_messages_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* messages, uint nMessages, long timeout) nothrow;
__gshared c_gst_rtsp_connection_send_messages_usecFn c_gst_rtsp_connection_send_messages_usec; ///
private alias c_gst_rtsp_connection_send_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPMessage* message, long timeout) nothrow;
__gshared c_gst_rtsp_connection_send_usecFn c_gst_rtsp_connection_send_usec; ///
private alias c_gst_rtsp_connection_set_accept_certificate_funcFn = extern(C) void function(GstRTSPConnection* conn, GstRTSPConnectionAcceptCertificateFunc func, void* userData, GDestroyNotify destroyNotify) nothrow;
__gshared c_gst_rtsp_connection_set_accept_certificate_funcFn c_gst_rtsp_connection_set_accept_certificate_func; ///
private alias c_gst_rtsp_connection_set_authFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, GstRTSPAuthMethod method, const(char)* user, const(char)* pass) nothrow;
__gshared c_gst_rtsp_connection_set_authFn c_gst_rtsp_connection_set_auth; ///
private alias c_gst_rtsp_connection_set_auth_paramFn = extern(C) void function(GstRTSPConnection* conn, const(char)* param, const(char)* value) nothrow;
__gshared c_gst_rtsp_connection_set_auth_paramFn c_gst_rtsp_connection_set_auth_param; ///
private alias c_gst_rtsp_connection_set_content_length_limitFn = extern(C) void function(GstRTSPConnection* conn, uint limit) nothrow;
__gshared c_gst_rtsp_connection_set_content_length_limitFn c_gst_rtsp_connection_set_content_length_limit; ///
private alias c_gst_rtsp_connection_set_http_modeFn = extern(C) void function(GstRTSPConnection* conn, gboolean enable) nothrow;
__gshared c_gst_rtsp_connection_set_http_modeFn c_gst_rtsp_connection_set_http_mode; ///
private alias c_gst_rtsp_connection_set_ignore_x_server_replyFn = extern(C) void function(GstRTSPConnection* conn, gboolean ignore) nothrow;
__gshared c_gst_rtsp_connection_set_ignore_x_server_replyFn c_gst_rtsp_connection_set_ignore_x_server_reply; ///
private alias c_gst_rtsp_connection_set_ipFn = extern(C) void function(GstRTSPConnection* conn, const(char)* ip) nothrow;
__gshared c_gst_rtsp_connection_set_ipFn c_gst_rtsp_connection_set_ip; ///
private alias c_gst_rtsp_connection_set_proxyFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, const(char)* host, uint port) nothrow;
__gshared c_gst_rtsp_connection_set_proxyFn c_gst_rtsp_connection_set_proxy; ///
private alias c_gst_rtsp_connection_set_qos_dscpFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, uint qosDscp) nothrow;
__gshared c_gst_rtsp_connection_set_qos_dscpFn c_gst_rtsp_connection_set_qos_dscp; ///
private alias c_gst_rtsp_connection_set_remember_session_idFn = extern(C) void function(GstRTSPConnection* conn, gboolean remember) nothrow;
__gshared c_gst_rtsp_connection_set_remember_session_idFn c_gst_rtsp_connection_set_remember_session_id; ///
private alias c_gst_rtsp_connection_set_tls_databaseFn = extern(C) void function(GstRTSPConnection* conn, GTlsDatabase* database) nothrow;
__gshared c_gst_rtsp_connection_set_tls_databaseFn c_gst_rtsp_connection_set_tls_database; ///
private alias c_gst_rtsp_connection_set_tls_interactionFn = extern(C) void function(GstRTSPConnection* conn, GTlsInteraction* interaction) nothrow;
__gshared c_gst_rtsp_connection_set_tls_interactionFn c_gst_rtsp_connection_set_tls_interaction; ///
private alias c_gst_rtsp_connection_set_tls_validation_flagsFn = extern(C) gboolean function(GstRTSPConnection* conn, GTlsCertificateFlags flags) nothrow;
__gshared c_gst_rtsp_connection_set_tls_validation_flagsFn c_gst_rtsp_connection_set_tls_validation_flags; ///
private alias c_gst_rtsp_connection_set_tunneledFn = extern(C) void function(GstRTSPConnection* conn, gboolean tunneled) nothrow;
__gshared c_gst_rtsp_connection_set_tunneledFn c_gst_rtsp_connection_set_tunneled; ///
private alias c_gst_rtsp_connection_writeFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, const(ubyte)* data, uint size, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_connection_writeFn c_gst_rtsp_connection_write; ///
private alias c_gst_rtsp_connection_write_usecFn = extern(C) GstRTSPResult function(GstRTSPConnection* conn, const(ubyte)* data, uint size, long timeout) nothrow;
__gshared c_gst_rtsp_connection_write_usecFn c_gst_rtsp_connection_write_usec; ///
private alias c_gst_rtsp_connection_acceptFn = extern(C) GstRTSPResult function(GSocket* socket, GstRTSPConnection** conn, GCancellable* cancellable) nothrow;
__gshared c_gst_rtsp_connection_acceptFn c_gst_rtsp_connection_accept; ///
private alias c_gst_rtsp_connection_createFn = extern(C) GstRTSPResult function(const(GstRTSPUrl)* url, GstRTSPConnection** conn) nothrow;
__gshared c_gst_rtsp_connection_createFn c_gst_rtsp_connection_create; ///
private alias c_gst_rtsp_connection_create_from_socketFn = extern(C) GstRTSPResult function(GSocket* socket, const(char)* ip, ushort port, const(char)* initialBuffer, GstRTSPConnection** conn) nothrow;
__gshared c_gst_rtsp_connection_create_from_socketFn c_gst_rtsp_connection_create_from_socket; ///

// RTSPExtension
private alias c_gst_rtsp_extension_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtsp_extension_get_typeFn c_gst_rtsp_extension_get_type; ///
private alias c_gst_rtsp_extension_after_sendFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) nothrow;
__gshared c_gst_rtsp_extension_after_sendFn c_gst_rtsp_extension_after_send; ///
private alias c_gst_rtsp_extension_before_sendFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) nothrow;
__gshared c_gst_rtsp_extension_before_sendFn c_gst_rtsp_extension_before_send; ///
private alias c_gst_rtsp_extension_configure_streamFn = extern(C) gboolean function(GstRTSPExtension* ext, GstCaps* caps) nothrow;
__gshared c_gst_rtsp_extension_configure_streamFn c_gst_rtsp_extension_configure_stream; ///
private alias c_gst_rtsp_extension_detect_serverFn = extern(C) gboolean function(GstRTSPExtension* ext, GstRTSPMessage* resp) nothrow;
__gshared c_gst_rtsp_extension_detect_serverFn c_gst_rtsp_extension_detect_server; ///
private alias c_gst_rtsp_extension_get_transportsFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPLowerTrans protocols, char* transport) nothrow;
__gshared c_gst_rtsp_extension_get_transportsFn c_gst_rtsp_extension_get_transports; ///
private alias c_gst_rtsp_extension_parse_sdpFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMessage* sdp, GstStructure* s) nothrow;
__gshared c_gst_rtsp_extension_parse_sdpFn c_gst_rtsp_extension_parse_sdp; ///
private alias c_gst_rtsp_extension_receive_requestFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) nothrow;
__gshared c_gst_rtsp_extension_receive_requestFn c_gst_rtsp_extension_receive_request; ///
private alias c_gst_rtsp_extension_sendFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) nothrow;
__gshared c_gst_rtsp_extension_sendFn c_gst_rtsp_extension_send; ///
private alias c_gst_rtsp_extension_setup_mediaFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMedia* media) nothrow;
__gshared c_gst_rtsp_extension_setup_mediaFn c_gst_rtsp_extension_setup_media; ///
private alias c_gst_rtsp_extension_stream_selectFn = extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPUrl* url) nothrow;
__gshared c_gst_rtsp_extension_stream_selectFn c_gst_rtsp_extension_stream_select; ///

// RTSPMessage
private alias c_gst_rtsp_msg_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtsp_msg_get_typeFn c_gst_rtsp_msg_get_type; ///
private alias c_gst_rtsp_message_add_headerFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, const(char)* value) nothrow;
__gshared c_gst_rtsp_message_add_headerFn c_gst_rtsp_message_add_header; ///
private alias c_gst_rtsp_message_add_header_by_nameFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, const(char)* value) nothrow;
__gshared c_gst_rtsp_message_add_header_by_nameFn c_gst_rtsp_message_add_header_by_name; ///
private alias c_gst_rtsp_message_append_headersFn = extern(C) GstRTSPResult function(const(GstRTSPMessage)* msg, GString* str) nothrow;
__gshared c_gst_rtsp_message_append_headersFn c_gst_rtsp_message_append_headers; ///
private alias c_gst_rtsp_message_copyFn = extern(C) GstRTSPResult function(const(GstRTSPMessage)* msg, GstRTSPMessage** copy) nothrow;
__gshared c_gst_rtsp_message_copyFn c_gst_rtsp_message_copy; ///
private alias c_gst_rtsp_message_dumpFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg) nothrow;
__gshared c_gst_rtsp_message_dumpFn c_gst_rtsp_message_dump; ///
private alias c_gst_rtsp_message_freeFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg) nothrow;
__gshared c_gst_rtsp_message_freeFn c_gst_rtsp_message_free; ///
private alias c_gst_rtsp_message_get_bodyFn = extern(C) GstRTSPResult function(const(GstRTSPMessage)* msg, ubyte** data, uint* size) nothrow;
__gshared c_gst_rtsp_message_get_bodyFn c_gst_rtsp_message_get_body; ///
private alias c_gst_rtsp_message_get_body_bufferFn = extern(C) GstRTSPResult function(const(GstRTSPMessage)* msg, GstBuffer** buffer) nothrow;
__gshared c_gst_rtsp_message_get_body_bufferFn c_gst_rtsp_message_get_body_buffer; ///
private alias c_gst_rtsp_message_get_headerFn = extern(C) GstRTSPResult function(const(GstRTSPMessage)* msg, GstRTSPHeaderField field, char** value, int indx) nothrow;
__gshared c_gst_rtsp_message_get_headerFn c_gst_rtsp_message_get_header; ///
private alias c_gst_rtsp_message_get_header_by_nameFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, char** value, int index) nothrow;
__gshared c_gst_rtsp_message_get_header_by_nameFn c_gst_rtsp_message_get_header_by_name; ///
private alias c_gst_rtsp_message_get_typeFn = extern(C) GstRTSPMsgType function(GstRTSPMessage* msg) nothrow;
__gshared c_gst_rtsp_message_get_typeFn c_gst_rtsp_message_get_type; ///
private alias c_gst_rtsp_message_has_body_bufferFn = extern(C) gboolean function(const(GstRTSPMessage)* msg) nothrow;
__gshared c_gst_rtsp_message_has_body_bufferFn c_gst_rtsp_message_has_body_buffer; ///
private alias c_gst_rtsp_message_initFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg) nothrow;
__gshared c_gst_rtsp_message_initFn c_gst_rtsp_message_init; ///
private alias c_gst_rtsp_message_init_dataFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, ubyte channel) nothrow;
__gshared c_gst_rtsp_message_init_dataFn c_gst_rtsp_message_init_data; ///
private alias c_gst_rtsp_message_init_requestFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPMethod method, const(char)* uri) nothrow;
__gshared c_gst_rtsp_message_init_requestFn c_gst_rtsp_message_init_request; ///
private alias c_gst_rtsp_message_init_responseFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPStatusCode code, const(char)* reason, const(GstRTSPMessage)* request) nothrow;
__gshared c_gst_rtsp_message_init_responseFn c_gst_rtsp_message_init_response; ///
private alias c_gst_rtsp_message_parse_auth_credentialsFn = extern(C) GstRTSPAuthCredential** function(GstRTSPMessage* msg, GstRTSPHeaderField field) nothrow;
__gshared c_gst_rtsp_message_parse_auth_credentialsFn c_gst_rtsp_message_parse_auth_credentials; ///
private alias c_gst_rtsp_message_parse_dataFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, ubyte* channel) nothrow;
__gshared c_gst_rtsp_message_parse_dataFn c_gst_rtsp_message_parse_data; ///
private alias c_gst_rtsp_message_parse_requestFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPMethod* method, const(char*)* uri, GstRTSPVersion* version_) nothrow;
__gshared c_gst_rtsp_message_parse_requestFn c_gst_rtsp_message_parse_request; ///
private alias c_gst_rtsp_message_parse_responseFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPStatusCode* code, const(char*)* reason, GstRTSPVersion* version_) nothrow;
__gshared c_gst_rtsp_message_parse_responseFn c_gst_rtsp_message_parse_response; ///
private alias c_gst_rtsp_message_remove_headerFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, int indx) nothrow;
__gshared c_gst_rtsp_message_remove_headerFn c_gst_rtsp_message_remove_header; ///
private alias c_gst_rtsp_message_remove_header_by_nameFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, int index) nothrow;
__gshared c_gst_rtsp_message_remove_header_by_nameFn c_gst_rtsp_message_remove_header_by_name; ///
private alias c_gst_rtsp_message_set_bodyFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, const(ubyte)* data, uint size) nothrow;
__gshared c_gst_rtsp_message_set_bodyFn c_gst_rtsp_message_set_body; ///
private alias c_gst_rtsp_message_set_body_bufferFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstBuffer* buffer) nothrow;
__gshared c_gst_rtsp_message_set_body_bufferFn c_gst_rtsp_message_set_body_buffer; ///
private alias c_gst_rtsp_message_steal_bodyFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, ubyte** data, uint* size) nothrow;
__gshared c_gst_rtsp_message_steal_bodyFn c_gst_rtsp_message_steal_body; ///
private alias c_gst_rtsp_message_steal_body_bufferFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstBuffer** buffer) nothrow;
__gshared c_gst_rtsp_message_steal_body_bufferFn c_gst_rtsp_message_steal_body_buffer; ///
private alias c_gst_rtsp_message_take_bodyFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, ubyte* data, uint size) nothrow;
__gshared c_gst_rtsp_message_take_bodyFn c_gst_rtsp_message_take_body; ///
private alias c_gst_rtsp_message_take_body_bufferFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstBuffer* buffer) nothrow;
__gshared c_gst_rtsp_message_take_body_bufferFn c_gst_rtsp_message_take_body_buffer; ///
private alias c_gst_rtsp_message_take_headerFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, GstRTSPHeaderField field, char* value) nothrow;
__gshared c_gst_rtsp_message_take_headerFn c_gst_rtsp_message_take_header; ///
private alias c_gst_rtsp_message_take_header_by_nameFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg, const(char)* header, char* value) nothrow;
__gshared c_gst_rtsp_message_take_header_by_nameFn c_gst_rtsp_message_take_header_by_name; ///
private alias c_gst_rtsp_message_unsetFn = extern(C) GstRTSPResult function(GstRTSPMessage* msg) nothrow;
__gshared c_gst_rtsp_message_unsetFn c_gst_rtsp_message_unset; ///

// RTSPRange
private alias c_gst_rtsp_range_convert_unitsFn = extern(C) gboolean function(GstRTSPTimeRange* range, GstRTSPRangeUnit unit) nothrow;
__gshared c_gst_rtsp_range_convert_unitsFn c_gst_rtsp_range_convert_units; ///
private alias c_gst_rtsp_range_freeFn = extern(C) void function(GstRTSPTimeRange* range) nothrow;
__gshared c_gst_rtsp_range_freeFn c_gst_rtsp_range_free; ///
private alias c_gst_rtsp_range_get_timesFn = extern(C) gboolean function(const(GstRTSPTimeRange)* range, GstClockTime* min, GstClockTime* max) nothrow;
__gshared c_gst_rtsp_range_get_timesFn c_gst_rtsp_range_get_times; ///
private alias c_gst_rtsp_range_parseFn = extern(C) GstRTSPResult function(const(char)* rangestr, GstRTSPTimeRange** range) nothrow;
__gshared c_gst_rtsp_range_parseFn c_gst_rtsp_range_parse; ///
private alias c_gst_rtsp_range_to_stringFn = extern(C) char* function(const(GstRTSPTimeRange)* range) nothrow;
__gshared c_gst_rtsp_range_to_stringFn c_gst_rtsp_range_to_string; ///

// RTSPTransport
private alias c_gst_rtsp_transport_as_textFn = extern(C) char* function(GstRTSPTransport* transport) nothrow;
__gshared c_gst_rtsp_transport_as_textFn c_gst_rtsp_transport_as_text; ///
private alias c_gst_rtsp_transport_freeFn = extern(C) GstRTSPResult function(GstRTSPTransport* transport) nothrow;
__gshared c_gst_rtsp_transport_freeFn c_gst_rtsp_transport_free; ///
private alias c_gst_rtsp_transport_get_media_typeFn = extern(C) GstRTSPResult function(GstRTSPTransport* transport, const(char*)* mediaType) nothrow;
__gshared c_gst_rtsp_transport_get_media_typeFn c_gst_rtsp_transport_get_media_type; ///
private alias c_gst_rtsp_transport_get_managerFn = extern(C) GstRTSPResult function(GstRTSPTransMode trans, const(char*)* manager, uint option) nothrow;
__gshared c_gst_rtsp_transport_get_managerFn c_gst_rtsp_transport_get_manager; ///
private alias c_gst_rtsp_transport_get_mimeFn = extern(C) GstRTSPResult function(GstRTSPTransMode trans, const(char*)* mime) nothrow;
__gshared c_gst_rtsp_transport_get_mimeFn c_gst_rtsp_transport_get_mime; ///
private alias c_gst_rtsp_transport_initFn = extern(C) GstRTSPResult function(GstRTSPTransport* transport) nothrow;
__gshared c_gst_rtsp_transport_initFn c_gst_rtsp_transport_init; ///
private alias c_gst_rtsp_transport_newFn = extern(C) GstRTSPResult function(GstRTSPTransport** transport) nothrow;
__gshared c_gst_rtsp_transport_newFn c_gst_rtsp_transport_new; ///
private alias c_gst_rtsp_transport_parseFn = extern(C) GstRTSPResult function(const(char)* str, GstRTSPTransport* transport) nothrow;
__gshared c_gst_rtsp_transport_parseFn c_gst_rtsp_transport_parse; ///

// RTSPUrl
private alias c_gst_rtsp_url_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_rtsp_url_get_typeFn c_gst_rtsp_url_get_type; ///
private alias c_gst_rtsp_url_copyFn = extern(C) GstRTSPUrl* function(const(GstRTSPUrl)* url) nothrow;
__gshared c_gst_rtsp_url_copyFn c_gst_rtsp_url_copy; ///
private alias c_gst_rtsp_url_decode_path_componentsFn = extern(C) char** function(const(GstRTSPUrl)* url) nothrow;
__gshared c_gst_rtsp_url_decode_path_componentsFn c_gst_rtsp_url_decode_path_components; ///
private alias c_gst_rtsp_url_freeFn = extern(C) void function(GstRTSPUrl* url) nothrow;
__gshared c_gst_rtsp_url_freeFn c_gst_rtsp_url_free; ///
private alias c_gst_rtsp_url_get_portFn = extern(C) GstRTSPResult function(const(GstRTSPUrl)* url, ushort* port) nothrow;
__gshared c_gst_rtsp_url_get_portFn c_gst_rtsp_url_get_port; ///
private alias c_gst_rtsp_url_get_request_uriFn = extern(C) char* function(const(GstRTSPUrl)* url) nothrow;
__gshared c_gst_rtsp_url_get_request_uriFn c_gst_rtsp_url_get_request_uri; ///
private alias c_gst_rtsp_url_get_request_uri_with_controlFn = extern(C) char* function(const(GstRTSPUrl)* url, const(char)* controlPath) nothrow;
__gshared c_gst_rtsp_url_get_request_uri_with_controlFn c_gst_rtsp_url_get_request_uri_with_control; ///
private alias c_gst_rtsp_url_set_portFn = extern(C) GstRTSPResult function(GstRTSPUrl* url, ushort port) nothrow;
__gshared c_gst_rtsp_url_set_portFn c_gst_rtsp_url_set_port; ///
private alias c_gst_rtsp_url_parseFn = extern(C) GstRTSPResult function(const(char)* urlstr, GstRTSPUrl** url) nothrow;
__gshared c_gst_rtsp_url_parseFn c_gst_rtsp_url_parse; ///

// RTSPWatch
private alias c_gst_rtsp_watch_attachFn = extern(C) uint function(GstRTSPWatch* watch, GMainContext* context) nothrow;
__gshared c_gst_rtsp_watch_attachFn c_gst_rtsp_watch_attach; ///
private alias c_gst_rtsp_watch_get_send_backlogFn = extern(C) void function(GstRTSPWatch* watch, size_t* bytes, uint* messages) nothrow;
__gshared c_gst_rtsp_watch_get_send_backlogFn c_gst_rtsp_watch_get_send_backlog; ///
private alias c_gst_rtsp_watch_resetFn = extern(C) void function(GstRTSPWatch* watch) nothrow;
__gshared c_gst_rtsp_watch_resetFn c_gst_rtsp_watch_reset; ///
private alias c_gst_rtsp_watch_send_messageFn = extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* message, uint* id) nothrow;
__gshared c_gst_rtsp_watch_send_messageFn c_gst_rtsp_watch_send_message; ///
private alias c_gst_rtsp_watch_send_messagesFn = extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* messages, uint nMessages, uint* id) nothrow;
__gshared c_gst_rtsp_watch_send_messagesFn c_gst_rtsp_watch_send_messages; ///
private alias c_gst_rtsp_watch_set_flushingFn = extern(C) void function(GstRTSPWatch* watch, gboolean flushing) nothrow;
__gshared c_gst_rtsp_watch_set_flushingFn c_gst_rtsp_watch_set_flushing; ///
private alias c_gst_rtsp_watch_set_send_backlogFn = extern(C) void function(GstRTSPWatch* watch, size_t bytes, uint messages) nothrow;
__gshared c_gst_rtsp_watch_set_send_backlogFn c_gst_rtsp_watch_set_send_backlog; ///
private alias c_gst_rtsp_watch_unrefFn = extern(C) void function(GstRTSPWatch* watch) nothrow;
__gshared c_gst_rtsp_watch_unrefFn c_gst_rtsp_watch_unref; ///
private alias c_gst_rtsp_watch_wait_backlogFn = extern(C) GstRTSPResult function(GstRTSPWatch* watch, GTimeVal* timeout) nothrow;
__gshared c_gst_rtsp_watch_wait_backlogFn c_gst_rtsp_watch_wait_backlog; ///
private alias c_gst_rtsp_watch_wait_backlog_usecFn = extern(C) GstRTSPResult function(GstRTSPWatch* watch, long timeout) nothrow;
__gshared c_gst_rtsp_watch_wait_backlog_usecFn c_gst_rtsp_watch_wait_backlog_usec; ///
private alias c_gst_rtsp_watch_write_dataFn = extern(C) GstRTSPResult function(GstRTSPWatch* watch, const(ubyte)* data, uint size, uint* id) nothrow;
__gshared c_gst_rtsp_watch_write_dataFn c_gst_rtsp_watch_write_data; ///
private alias c_gst_rtsp_watch_newFn = extern(C) GstRTSPWatch* function(GstRTSPConnection* conn, GstRTSPWatchFuncs* funcs, void* userData, GDestroyNotify notify) nothrow;
__gshared c_gst_rtsp_watch_newFn c_gst_rtsp_watch_new; ///

// global
private alias c_gst_rtsp_auth_credentials_freeFn = extern(C) void function(GstRTSPAuthCredential** credentials) nothrow;
__gshared c_gst_rtsp_auth_credentials_freeFn c_gst_rtsp_auth_credentials_free; ///
private alias c_gst_rtsp_find_header_fieldFn = extern(C) GstRTSPHeaderField function(const(char)* header) nothrow;
__gshared c_gst_rtsp_find_header_fieldFn c_gst_rtsp_find_header_field; ///
private alias c_gst_rtsp_find_methodFn = extern(C) GstRTSPMethod function(const(char)* method) nothrow;
__gshared c_gst_rtsp_find_methodFn c_gst_rtsp_find_method; ///
private alias c_gst_rtsp_generate_digest_auth_responseFn = extern(C) char* function(const(char)* algorithm, const(char)* method, const(char)* realm, const(char)* username, const(char)* password, const(char)* uri, const(char)* nonce) nothrow;
__gshared c_gst_rtsp_generate_digest_auth_responseFn c_gst_rtsp_generate_digest_auth_response; ///
private alias c_gst_rtsp_generate_digest_auth_response_from_md5Fn = extern(C) char* function(const(char)* algorithm, const(char)* method, const(char)* md5, const(char)* uri, const(char)* nonce) nothrow;
__gshared c_gst_rtsp_generate_digest_auth_response_from_md5Fn c_gst_rtsp_generate_digest_auth_response_from_md5; ///
private alias c_gst_rtsp_header_allow_multipleFn = extern(C) gboolean function(GstRTSPHeaderField field) nothrow;
__gshared c_gst_rtsp_header_allow_multipleFn c_gst_rtsp_header_allow_multiple; ///
private alias c_gst_rtsp_header_as_textFn = extern(C) const(char)* function(GstRTSPHeaderField field) nothrow;
__gshared c_gst_rtsp_header_as_textFn c_gst_rtsp_header_as_text; ///
private alias c_gst_rtsp_message_newFn = extern(C) GstRTSPResult function(GstRTSPMessage** msg) nothrow;
__gshared c_gst_rtsp_message_newFn c_gst_rtsp_message_new; ///
private alias c_gst_rtsp_message_new_dataFn = extern(C) GstRTSPResult function(GstRTSPMessage** msg, ubyte channel) nothrow;
__gshared c_gst_rtsp_message_new_dataFn c_gst_rtsp_message_new_data; ///
private alias c_gst_rtsp_message_new_requestFn = extern(C) GstRTSPResult function(GstRTSPMessage** msg, GstRTSPMethod method, const(char)* uri) nothrow;
__gshared c_gst_rtsp_message_new_requestFn c_gst_rtsp_message_new_request; ///
private alias c_gst_rtsp_message_new_responseFn = extern(C) GstRTSPResult function(GstRTSPMessage** msg, GstRTSPStatusCode code, const(char)* reason, const(GstRTSPMessage)* request) nothrow;
__gshared c_gst_rtsp_message_new_responseFn c_gst_rtsp_message_new_response; ///
private alias c_gst_rtsp_options_as_textFn = extern(C) char* function(GstRTSPMethod options) nothrow;
__gshared c_gst_rtsp_options_as_textFn c_gst_rtsp_options_as_text; ///
private alias c_gst_rtsp_options_from_textFn = extern(C) GstRTSPMethod function(const(char)* options) nothrow;
__gshared c_gst_rtsp_options_from_textFn c_gst_rtsp_options_from_text; ///
private alias c_gst_rtsp_status_as_textFn = extern(C) const(char)* function(GstRTSPStatusCode code) nothrow;
__gshared c_gst_rtsp_status_as_textFn c_gst_rtsp_status_as_text; ///
private alias c_gst_rtsp_strresultFn = extern(C) char* function(GstRTSPResult result) nothrow;
__gshared c_gst_rtsp_strresultFn c_gst_rtsp_strresult; ///

// RTSPMethod
private alias c_gst_rtsp_method_as_textFn = extern(C) const(char)* function(GstRTSPMethod method) nothrow;
__gshared c_gst_rtsp_method_as_textFn c_gst_rtsp_method_as_text; ///

// RTSPVersion
private alias c_gst_rtsp_version_as_textFn = extern(C) const(char)* function(GstRTSPVersion version_) nothrow;
__gshared c_gst_rtsp_version_as_textFn c_gst_rtsp_version_as_text; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.gstrtsp1", "GstRtsp");

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
