/// C functions for arrowflight1 library
module arrowflight.c.functions;

public import gid.basictypes;
import gid.loader;
import arrowflight.c.types;
public import arrow.c.types;

version(Windows)
  private immutable LIBS = ["libarrow-flight-glib-1900.dll;arrow-flight-glib-1900.dll;arrow-flight-glib.dll"];
else version(OSX)
  private immutable LIBS = ["libarrow-flight-glib.1900.dylib"];
else
  private immutable LIBS = ["libarrow-flight-glib.so.1900"];

__gshared extern(C)
{
  // CallOptions
  GType function() c_gaflight_call_options_get_type; ///
  GAFlightCallOptions* function() c_gaflight_call_options_new; ///
  void function(GAFlightCallOptions* options, const(char)* name, const(char)* value) c_gaflight_call_options_add_header; ///
  void function(GAFlightCallOptions* options) c_gaflight_call_options_clear_headers; ///
  void function(GAFlightCallOptions* options, GAFlightHeaderFunc func, void* userData) c_gaflight_call_options_foreach_header; ///

  // Client
  GType function() c_gaflight_client_get_type; ///
  GAFlightClient* function(GAFlightLocation* location, GAFlightClientOptions* options, GError** _err) c_gaflight_client_new; ///
  gboolean function(GAFlightClient* client, const(char)* user, const(char)* password, GAFlightCallOptions* options, char** bearerName, char** bearerValue, GError** _err) c_gaflight_client_authenticate_basic_token; ///
  gboolean function(GAFlightClient* client, GError** _err) c_gaflight_client_close; ///
  GAFlightStreamReader* function(GAFlightClient* client, GAFlightTicket* ticket, GAFlightCallOptions* options, GError** _err) c_gaflight_client_do_get; ///
  GAFlightDoPutResult* function(GAFlightClient* client, GAFlightDescriptor* descriptor, GArrowSchema* schema, GAFlightCallOptions* options, GError** _err) c_gaflight_client_do_put; ///
  GAFlightInfo* function(GAFlightClient* client, GAFlightDescriptor* descriptor, GAFlightCallOptions* options, GError** _err) c_gaflight_client_get_flight_info; ///
  GList* function(GAFlightClient* client, GAFlightCriteria* criteria, GAFlightCallOptions* options, GError** _err) c_gaflight_client_list_flights; ///

  // ClientOptions
  GType function() c_gaflight_client_options_get_type; ///
  GAFlightClientOptions* function() c_gaflight_client_options_new; ///

  // CommandDescriptor
  GType function() c_gaflight_command_descriptor_get_type; ///
  GAFlightCommandDescriptor* function(const(char)* command) c_gaflight_command_descriptor_new; ///
  char* function(GAFlightCommandDescriptor* descriptor) c_gaflight_command_descriptor_get_command; ///

  // Criteria
  GType function() c_gaflight_criteria_get_type; ///
  GAFlightCriteria* function(GBytes* expression) c_gaflight_criteria_new; ///

  // DataStream
  GType function() c_gaflight_data_stream_get_type; ///

  // Descriptor
  GType function() c_gaflight_descriptor_get_type; ///
  gboolean function(GAFlightDescriptor* descriptor, GAFlightDescriptor* otherDescriptor) c_gaflight_descriptor_equal; ///
  char* function(GAFlightDescriptor* descriptor) c_gaflight_descriptor_to_string; ///

  // DoPutResult
  GType function() c_gaflight_do_put_result_get_type; ///

  // Endpoint
  GType function() c_gaflight_endpoint_get_type; ///
  GAFlightEndpoint* function(GAFlightTicket* ticket, GList* locations) c_gaflight_endpoint_new; ///
  gboolean function(GAFlightEndpoint* endpoint, GAFlightEndpoint* otherEndpoint) c_gaflight_endpoint_equal; ///
  GList* function(GAFlightEndpoint* endpoint) c_gaflight_endpoint_get_locations; ///

  // Info
  GType function() c_gaflight_info_get_type; ///
  GAFlightInfo* function(GArrowSchema* schema, GAFlightDescriptor* descriptor, GList* endpoints, long totalRecords, long totalBytes, GError** _err) c_gaflight_info_new; ///
  gboolean function(GAFlightInfo* info, GAFlightInfo* otherInfo) c_gaflight_info_equal; ///
  GAFlightDescriptor* function(GAFlightInfo* info) c_gaflight_info_get_descriptor; ///
  GList* function(GAFlightInfo* info) c_gaflight_info_get_endpoints; ///
  GArrowSchema* function(GAFlightInfo* info, GArrowReadOptions* options, GError** _err) c_gaflight_info_get_schema; ///
  long function(GAFlightInfo* info) c_gaflight_info_get_total_bytes; ///
  long function(GAFlightInfo* info) c_gaflight_info_get_total_records; ///

  // Location
  GType function() c_gaflight_location_get_type; ///
  GAFlightLocation* function(const(char)* uri, GError** _err) c_gaflight_location_new; ///
  gboolean function(GAFlightLocation* location, GAFlightLocation* otherLocation) c_gaflight_location_equal; ///
  char* function(GAFlightLocation* location) c_gaflight_location_get_scheme; ///
  char* function(GAFlightLocation* location) c_gaflight_location_to_string; ///

  // MessageReader
  GType function() c_gaflight_message_reader_get_type; ///
  GAFlightDescriptor* function(GAFlightMessageReader* reader) c_gaflight_message_reader_get_descriptor; ///

  // MetadataReader
  GType function() c_gaflight_metadata_reader_get_type; ///
  GArrowBuffer* function(GAFlightMetadataReader* reader, GError** _err) c_gaflight_metadata_reader_read; ///

  // MetadataWriter
  GType function() c_gaflight_metadata_writer_get_type; ///
  gboolean function(GAFlightMetadataWriter* writer, GArrowBuffer* metadata, GError** _err) c_gaflight_metadata_writer_write; ///

  // PathDescriptor
  GType function() c_gaflight_path_descriptor_get_type; ///
  GAFlightPathDescriptor* function(const(char*)* paths, size_t nPaths) c_gaflight_path_descriptor_new; ///
  char** function(GAFlightPathDescriptor* descriptor) c_gaflight_path_descriptor_get_paths; ///

  // RecordBatchReader
  GType function() c_gaflight_record_batch_reader_get_type; ///
  GArrowTable* function(GAFlightRecordBatchReader* reader, GError** _err) c_gaflight_record_batch_reader_read_all; ///
  GAFlightStreamChunk* function(GAFlightRecordBatchReader* reader, GError** _err) c_gaflight_record_batch_reader_read_next; ///

  // RecordBatchStream
  GType function() c_gaflight_record_batch_stream_get_type; ///
  GAFlightRecordBatchStream* function(GArrowRecordBatchReader* reader, GArrowWriteOptions* options) c_gaflight_record_batch_stream_new; ///

  // RecordBatchWriter
  GType function() c_gaflight_record_batch_writer_get_type; ///
  gboolean function(GAFlightRecordBatchWriter* writer, GArrowSchema* schema, GArrowWriteOptions* options, GError** _err) c_gaflight_record_batch_writer_begin; ///
  gboolean function(GAFlightRecordBatchWriter* writer, GArrowBuffer* metadata, GError** _err) c_gaflight_record_batch_writer_write_metadata; ///
  gboolean function(GAFlightRecordBatchWriter* writer, GArrowRecordBatch* recordBatch, GArrowBuffer* metadata, GError** _err) c_gaflight_record_batch_writer_write_record_batch; ///

  // Servable
  GType function() c_gaflight_servable_get_type; ///

  // Server
  GType function() c_gaflight_server_get_type; ///
  GAFlightDataStream* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightTicket* ticket, GError** _err) c_gaflight_server_do_get; ///
  gboolean function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightMessageReader* reader, GAFlightMetadataWriter* writer, GError** _err) c_gaflight_server_do_put; ///
  GAFlightInfo* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightDescriptor* request, GError** _err) c_gaflight_server_get_flight_info; ///
  int function(GAFlightServer* server) c_gaflight_server_get_port; ///
  GList* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightCriteria* criteria, GError** _err) c_gaflight_server_list_flights; ///
  gboolean function(GAFlightServer* server, GAFlightServerOptions* options, GError** _err) c_gaflight_server_listen; ///
  gboolean function(GAFlightServer* server, GError** _err) c_gaflight_server_shutdown; ///
  gboolean function(GAFlightServer* server, GError** _err) c_gaflight_server_wait; ///

  // ServerAuthHandler
  GType function() c_gaflight_server_auth_handler_get_type; ///

  // ServerAuthReader
  GType function() c_gaflight_server_auth_reader_get_type; ///
  GBytes* function(GAFlightServerAuthReader* reader, GError** _err) c_gaflight_server_auth_reader_read; ///

  // ServerAuthSender
  GType function() c_gaflight_server_auth_sender_get_type; ///
  gboolean function(GAFlightServerAuthSender* sender, GBytes* message, GError** _err) c_gaflight_server_auth_sender_write; ///

  // ServerCallContext
  GType function() c_gaflight_server_call_context_get_type; ///
  void function(GAFlightServerCallContext* context, GAFlightHeaderFunc func, void* userData) c_gaflight_server_call_context_foreach_incoming_header; ///

  // ServerCustomAuthHandler
  GType function() c_gaflight_server_custom_auth_handler_get_type; ///
  void function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GAFlightServerAuthSender* sender, GAFlightServerAuthReader* reader, GError** _err) c_gaflight_server_custom_auth_handler_authenticate; ///
  GBytes* function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GBytes* token, GError** _err) c_gaflight_server_custom_auth_handler_is_valid; ///

  // ServerOptions
  GType function() c_gaflight_server_options_get_type; ///
  GAFlightServerOptions* function(GAFlightLocation* location) c_gaflight_server_options_new; ///

  // StreamChunk
  GType function() c_gaflight_stream_chunk_get_type; ///
  GArrowRecordBatch* function(GAFlightStreamChunk* chunk) c_gaflight_stream_chunk_get_data; ///
  GArrowBuffer* function(GAFlightStreamChunk* chunk) c_gaflight_stream_chunk_get_metadata; ///

  // StreamReader
  GType function() c_gaflight_stream_reader_get_type; ///

  // StreamWriter
  GType function() c_gaflight_stream_writer_get_type; ///
  gboolean function(GAFlightStreamWriter* writer, GError** _err) c_gaflight_stream_writer_done_writing; ///

  // Ticket
  GType function() c_gaflight_ticket_get_type; ///
  GAFlightTicket* function(GBytes* data) c_gaflight_ticket_new; ///
  gboolean function(GAFlightTicket* ticket, GAFlightTicket* otherTicket) c_gaflight_ticket_equal; ///
}

// CallOptions

/** */
alias gaflight_call_options_get_type = c_gaflight_call_options_get_type;

/** */
alias gaflight_call_options_new = c_gaflight_call_options_new;

/** */
alias gaflight_call_options_add_header = c_gaflight_call_options_add_header;

/** */
alias gaflight_call_options_clear_headers = c_gaflight_call_options_clear_headers;

/** */
alias gaflight_call_options_foreach_header = c_gaflight_call_options_foreach_header;

// Client

/** */
alias gaflight_client_get_type = c_gaflight_client_get_type;

/** */
alias gaflight_client_new = c_gaflight_client_new;

/** */
alias gaflight_client_authenticate_basic_token = c_gaflight_client_authenticate_basic_token;

/** */
alias gaflight_client_close = c_gaflight_client_close;

/** */
alias gaflight_client_do_get = c_gaflight_client_do_get;

/** */
alias gaflight_client_do_put = c_gaflight_client_do_put;

/** */
alias gaflight_client_get_flight_info = c_gaflight_client_get_flight_info;

/** */
alias gaflight_client_list_flights = c_gaflight_client_list_flights;

// ClientOptions

/** */
alias gaflight_client_options_get_type = c_gaflight_client_options_get_type;

/** */
alias gaflight_client_options_new = c_gaflight_client_options_new;

// CommandDescriptor

/** */
alias gaflight_command_descriptor_get_type = c_gaflight_command_descriptor_get_type;

/** */
alias gaflight_command_descriptor_new = c_gaflight_command_descriptor_new;

/** */
alias gaflight_command_descriptor_get_command = c_gaflight_command_descriptor_get_command;

// Criteria

/** */
alias gaflight_criteria_get_type = c_gaflight_criteria_get_type;

/** */
alias gaflight_criteria_new = c_gaflight_criteria_new;

// DataStream

/** */
alias gaflight_data_stream_get_type = c_gaflight_data_stream_get_type;

// Descriptor

/** */
alias gaflight_descriptor_get_type = c_gaflight_descriptor_get_type;

/** */
alias gaflight_descriptor_equal = c_gaflight_descriptor_equal;

/** */
alias gaflight_descriptor_to_string = c_gaflight_descriptor_to_string;

// DoPutResult

/** */
alias gaflight_do_put_result_get_type = c_gaflight_do_put_result_get_type;

// Endpoint

/** */
alias gaflight_endpoint_get_type = c_gaflight_endpoint_get_type;

/** */
alias gaflight_endpoint_new = c_gaflight_endpoint_new;

/** */
alias gaflight_endpoint_equal = c_gaflight_endpoint_equal;

/** */
alias gaflight_endpoint_get_locations = c_gaflight_endpoint_get_locations;

// Info

/** */
alias gaflight_info_get_type = c_gaflight_info_get_type;

/** */
alias gaflight_info_new = c_gaflight_info_new;

/** */
alias gaflight_info_equal = c_gaflight_info_equal;

/** */
alias gaflight_info_get_descriptor = c_gaflight_info_get_descriptor;

/** */
alias gaflight_info_get_endpoints = c_gaflight_info_get_endpoints;

/** */
alias gaflight_info_get_schema = c_gaflight_info_get_schema;

/** */
alias gaflight_info_get_total_bytes = c_gaflight_info_get_total_bytes;

/** */
alias gaflight_info_get_total_records = c_gaflight_info_get_total_records;

// Location

/** */
alias gaflight_location_get_type = c_gaflight_location_get_type;

/** */
alias gaflight_location_new = c_gaflight_location_new;

/** */
alias gaflight_location_equal = c_gaflight_location_equal;

/** */
alias gaflight_location_get_scheme = c_gaflight_location_get_scheme;

/** */
alias gaflight_location_to_string = c_gaflight_location_to_string;

// MessageReader

/** */
alias gaflight_message_reader_get_type = c_gaflight_message_reader_get_type;

/** */
alias gaflight_message_reader_get_descriptor = c_gaflight_message_reader_get_descriptor;

// MetadataReader

/** */
alias gaflight_metadata_reader_get_type = c_gaflight_metadata_reader_get_type;

/** */
alias gaflight_metadata_reader_read = c_gaflight_metadata_reader_read;

// MetadataWriter

/** */
alias gaflight_metadata_writer_get_type = c_gaflight_metadata_writer_get_type;

/** */
alias gaflight_metadata_writer_write = c_gaflight_metadata_writer_write;

// PathDescriptor

/** */
alias gaflight_path_descriptor_get_type = c_gaflight_path_descriptor_get_type;

/** */
alias gaflight_path_descriptor_new = c_gaflight_path_descriptor_new;

/** */
alias gaflight_path_descriptor_get_paths = c_gaflight_path_descriptor_get_paths;

// RecordBatchReader

/** */
alias gaflight_record_batch_reader_get_type = c_gaflight_record_batch_reader_get_type;

/** */
alias gaflight_record_batch_reader_read_all = c_gaflight_record_batch_reader_read_all;

/** */
alias gaflight_record_batch_reader_read_next = c_gaflight_record_batch_reader_read_next;

// RecordBatchStream

/** */
alias gaflight_record_batch_stream_get_type = c_gaflight_record_batch_stream_get_type;

/** */
alias gaflight_record_batch_stream_new = c_gaflight_record_batch_stream_new;

// RecordBatchWriter

/** */
alias gaflight_record_batch_writer_get_type = c_gaflight_record_batch_writer_get_type;

/** */
alias gaflight_record_batch_writer_begin = c_gaflight_record_batch_writer_begin;

/** */
alias gaflight_record_batch_writer_write_metadata = c_gaflight_record_batch_writer_write_metadata;

/** */
alias gaflight_record_batch_writer_write_record_batch = c_gaflight_record_batch_writer_write_record_batch;

// Servable

/** */
alias gaflight_servable_get_type = c_gaflight_servable_get_type;

// Server

/** */
alias gaflight_server_get_type = c_gaflight_server_get_type;

/** */
alias gaflight_server_do_get = c_gaflight_server_do_get;

/** */
alias gaflight_server_do_put = c_gaflight_server_do_put;

/** */
alias gaflight_server_get_flight_info = c_gaflight_server_get_flight_info;

/** */
alias gaflight_server_get_port = c_gaflight_server_get_port;

/** */
alias gaflight_server_list_flights = c_gaflight_server_list_flights;

/** */
alias gaflight_server_listen = c_gaflight_server_listen;

/** */
alias gaflight_server_shutdown = c_gaflight_server_shutdown;

/** */
alias gaflight_server_wait = c_gaflight_server_wait;

// ServerAuthHandler

/** */
alias gaflight_server_auth_handler_get_type = c_gaflight_server_auth_handler_get_type;

// ServerAuthReader

/** */
alias gaflight_server_auth_reader_get_type = c_gaflight_server_auth_reader_get_type;

/** */
alias gaflight_server_auth_reader_read = c_gaflight_server_auth_reader_read;

// ServerAuthSender

/** */
alias gaflight_server_auth_sender_get_type = c_gaflight_server_auth_sender_get_type;

/** */
alias gaflight_server_auth_sender_write = c_gaflight_server_auth_sender_write;

// ServerCallContext

/** */
alias gaflight_server_call_context_get_type = c_gaflight_server_call_context_get_type;

/** */
alias gaflight_server_call_context_foreach_incoming_header = c_gaflight_server_call_context_foreach_incoming_header;

// ServerCustomAuthHandler

/** */
alias gaflight_server_custom_auth_handler_get_type = c_gaflight_server_custom_auth_handler_get_type;

/** */
alias gaflight_server_custom_auth_handler_authenticate = c_gaflight_server_custom_auth_handler_authenticate;

/** */
alias gaflight_server_custom_auth_handler_is_valid = c_gaflight_server_custom_auth_handler_is_valid;

// ServerOptions

/** */
alias gaflight_server_options_get_type = c_gaflight_server_options_get_type;

/** */
alias gaflight_server_options_new = c_gaflight_server_options_new;

// StreamChunk

/** */
alias gaflight_stream_chunk_get_type = c_gaflight_stream_chunk_get_type;

/** */
alias gaflight_stream_chunk_get_data = c_gaflight_stream_chunk_get_data;

/** */
alias gaflight_stream_chunk_get_metadata = c_gaflight_stream_chunk_get_metadata;

// StreamReader

/** */
alias gaflight_stream_reader_get_type = c_gaflight_stream_reader_get_type;

// StreamWriter

/** */
alias gaflight_stream_writer_get_type = c_gaflight_stream_writer_get_type;

/** */
alias gaflight_stream_writer_done_writing = c_gaflight_stream_writer_done_writing;

// Ticket

/** */
alias gaflight_ticket_get_type = c_gaflight_ticket_get_type;

/** */
alias gaflight_ticket_new = c_gaflight_ticket_new;

/** */
alias gaflight_ticket_equal = c_gaflight_ticket_equal;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // CallOptions
  gidLink(cast(void**)&gaflight_call_options_get_type, "gaflight_call_options_get_type", libs);
  gidLink(cast(void**)&gaflight_call_options_new, "gaflight_call_options_new", libs);
  gidLink(cast(void**)&gaflight_call_options_add_header, "gaflight_call_options_add_header", libs);
  gidLink(cast(void**)&gaflight_call_options_clear_headers, "gaflight_call_options_clear_headers", libs);
  gidLink(cast(void**)&gaflight_call_options_foreach_header, "gaflight_call_options_foreach_header", libs);

  // Client
  gidLink(cast(void**)&gaflight_client_get_type, "gaflight_client_get_type", libs);
  gidLink(cast(void**)&gaflight_client_new, "gaflight_client_new", libs);
  gidLink(cast(void**)&gaflight_client_authenticate_basic_token, "gaflight_client_authenticate_basic_token", libs);
  gidLink(cast(void**)&gaflight_client_close, "gaflight_client_close", libs);
  gidLink(cast(void**)&gaflight_client_do_get, "gaflight_client_do_get", libs);
  gidLink(cast(void**)&gaflight_client_do_put, "gaflight_client_do_put", libs);
  gidLink(cast(void**)&gaflight_client_get_flight_info, "gaflight_client_get_flight_info", libs);
  gidLink(cast(void**)&gaflight_client_list_flights, "gaflight_client_list_flights", libs);

  // ClientOptions
  gidLink(cast(void**)&gaflight_client_options_get_type, "gaflight_client_options_get_type", libs);
  gidLink(cast(void**)&gaflight_client_options_new, "gaflight_client_options_new", libs);

  // CommandDescriptor
  gidLink(cast(void**)&gaflight_command_descriptor_get_type, "gaflight_command_descriptor_get_type", libs);
  gidLink(cast(void**)&gaflight_command_descriptor_new, "gaflight_command_descriptor_new", libs);
  gidLink(cast(void**)&gaflight_command_descriptor_get_command, "gaflight_command_descriptor_get_command", libs);

  // Criteria
  gidLink(cast(void**)&gaflight_criteria_get_type, "gaflight_criteria_get_type", libs);
  gidLink(cast(void**)&gaflight_criteria_new, "gaflight_criteria_new", libs);

  // DataStream
  gidLink(cast(void**)&gaflight_data_stream_get_type, "gaflight_data_stream_get_type", libs);

  // Descriptor
  gidLink(cast(void**)&gaflight_descriptor_get_type, "gaflight_descriptor_get_type", libs);
  gidLink(cast(void**)&gaflight_descriptor_equal, "gaflight_descriptor_equal", libs);
  gidLink(cast(void**)&gaflight_descriptor_to_string, "gaflight_descriptor_to_string", libs);

  // DoPutResult
  gidLink(cast(void**)&gaflight_do_put_result_get_type, "gaflight_do_put_result_get_type", libs);

  // Endpoint
  gidLink(cast(void**)&gaflight_endpoint_get_type, "gaflight_endpoint_get_type", libs);
  gidLink(cast(void**)&gaflight_endpoint_new, "gaflight_endpoint_new", libs);
  gidLink(cast(void**)&gaflight_endpoint_equal, "gaflight_endpoint_equal", libs);
  gidLink(cast(void**)&gaflight_endpoint_get_locations, "gaflight_endpoint_get_locations", libs);

  // Info
  gidLink(cast(void**)&gaflight_info_get_type, "gaflight_info_get_type", libs);
  gidLink(cast(void**)&gaflight_info_new, "gaflight_info_new", libs);
  gidLink(cast(void**)&gaflight_info_equal, "gaflight_info_equal", libs);
  gidLink(cast(void**)&gaflight_info_get_descriptor, "gaflight_info_get_descriptor", libs);
  gidLink(cast(void**)&gaflight_info_get_endpoints, "gaflight_info_get_endpoints", libs);
  gidLink(cast(void**)&gaflight_info_get_schema, "gaflight_info_get_schema", libs);
  gidLink(cast(void**)&gaflight_info_get_total_bytes, "gaflight_info_get_total_bytes", libs);
  gidLink(cast(void**)&gaflight_info_get_total_records, "gaflight_info_get_total_records", libs);

  // Location
  gidLink(cast(void**)&gaflight_location_get_type, "gaflight_location_get_type", libs);
  gidLink(cast(void**)&gaflight_location_new, "gaflight_location_new", libs);
  gidLink(cast(void**)&gaflight_location_equal, "gaflight_location_equal", libs);
  gidLink(cast(void**)&gaflight_location_get_scheme, "gaflight_location_get_scheme", libs);
  gidLink(cast(void**)&gaflight_location_to_string, "gaflight_location_to_string", libs);

  // MessageReader
  gidLink(cast(void**)&gaflight_message_reader_get_type, "gaflight_message_reader_get_type", libs);
  gidLink(cast(void**)&gaflight_message_reader_get_descriptor, "gaflight_message_reader_get_descriptor", libs);

  // MetadataReader
  gidLink(cast(void**)&gaflight_metadata_reader_get_type, "gaflight_metadata_reader_get_type", libs);
  gidLink(cast(void**)&gaflight_metadata_reader_read, "gaflight_metadata_reader_read", libs);

  // MetadataWriter
  gidLink(cast(void**)&gaflight_metadata_writer_get_type, "gaflight_metadata_writer_get_type", libs);
  gidLink(cast(void**)&gaflight_metadata_writer_write, "gaflight_metadata_writer_write", libs);

  // PathDescriptor
  gidLink(cast(void**)&gaflight_path_descriptor_get_type, "gaflight_path_descriptor_get_type", libs);
  gidLink(cast(void**)&gaflight_path_descriptor_new, "gaflight_path_descriptor_new", libs);
  gidLink(cast(void**)&gaflight_path_descriptor_get_paths, "gaflight_path_descriptor_get_paths", libs);

  // RecordBatchReader
  gidLink(cast(void**)&gaflight_record_batch_reader_get_type, "gaflight_record_batch_reader_get_type", libs);
  gidLink(cast(void**)&gaflight_record_batch_reader_read_all, "gaflight_record_batch_reader_read_all", libs);
  gidLink(cast(void**)&gaflight_record_batch_reader_read_next, "gaflight_record_batch_reader_read_next", libs);

  // RecordBatchStream
  gidLink(cast(void**)&gaflight_record_batch_stream_get_type, "gaflight_record_batch_stream_get_type", libs);
  gidLink(cast(void**)&gaflight_record_batch_stream_new, "gaflight_record_batch_stream_new", libs);

  // RecordBatchWriter
  gidLink(cast(void**)&gaflight_record_batch_writer_get_type, "gaflight_record_batch_writer_get_type", libs);
  gidLink(cast(void**)&gaflight_record_batch_writer_begin, "gaflight_record_batch_writer_begin", libs);
  gidLink(cast(void**)&gaflight_record_batch_writer_write_metadata, "gaflight_record_batch_writer_write_metadata", libs);
  gidLink(cast(void**)&gaflight_record_batch_writer_write_record_batch, "gaflight_record_batch_writer_write_record_batch", libs);

  // Servable
  gidLink(cast(void**)&gaflight_servable_get_type, "gaflight_servable_get_type", libs);

  // Server
  gidLink(cast(void**)&gaflight_server_get_type, "gaflight_server_get_type", libs);
  gidLink(cast(void**)&gaflight_server_do_get, "gaflight_server_do_get", libs);
  gidLink(cast(void**)&gaflight_server_do_put, "gaflight_server_do_put", libs);
  gidLink(cast(void**)&gaflight_server_get_flight_info, "gaflight_server_get_flight_info", libs);
  gidLink(cast(void**)&gaflight_server_get_port, "gaflight_server_get_port", libs);
  gidLink(cast(void**)&gaflight_server_list_flights, "gaflight_server_list_flights", libs);
  gidLink(cast(void**)&gaflight_server_listen, "gaflight_server_listen", libs);
  gidLink(cast(void**)&gaflight_server_shutdown, "gaflight_server_shutdown", libs);
  gidLink(cast(void**)&gaflight_server_wait, "gaflight_server_wait", libs);

  // ServerAuthHandler
  gidLink(cast(void**)&gaflight_server_auth_handler_get_type, "gaflight_server_auth_handler_get_type", libs);

  // ServerAuthReader
  gidLink(cast(void**)&gaflight_server_auth_reader_get_type, "gaflight_server_auth_reader_get_type", libs);
  gidLink(cast(void**)&gaflight_server_auth_reader_read, "gaflight_server_auth_reader_read", libs);

  // ServerAuthSender
  gidLink(cast(void**)&gaflight_server_auth_sender_get_type, "gaflight_server_auth_sender_get_type", libs);
  gidLink(cast(void**)&gaflight_server_auth_sender_write, "gaflight_server_auth_sender_write", libs);

  // ServerCallContext
  gidLink(cast(void**)&gaflight_server_call_context_get_type, "gaflight_server_call_context_get_type", libs);
  gidLink(cast(void**)&gaflight_server_call_context_foreach_incoming_header, "gaflight_server_call_context_foreach_incoming_header", libs);

  // ServerCustomAuthHandler
  gidLink(cast(void**)&gaflight_server_custom_auth_handler_get_type, "gaflight_server_custom_auth_handler_get_type", libs);
  gidLink(cast(void**)&gaflight_server_custom_auth_handler_authenticate, "gaflight_server_custom_auth_handler_authenticate", libs);
  gidLink(cast(void**)&gaflight_server_custom_auth_handler_is_valid, "gaflight_server_custom_auth_handler_is_valid", libs);

  // ServerOptions
  gidLink(cast(void**)&gaflight_server_options_get_type, "gaflight_server_options_get_type", libs);
  gidLink(cast(void**)&gaflight_server_options_new, "gaflight_server_options_new", libs);

  // StreamChunk
  gidLink(cast(void**)&gaflight_stream_chunk_get_type, "gaflight_stream_chunk_get_type", libs);
  gidLink(cast(void**)&gaflight_stream_chunk_get_data, "gaflight_stream_chunk_get_data", libs);
  gidLink(cast(void**)&gaflight_stream_chunk_get_metadata, "gaflight_stream_chunk_get_metadata", libs);

  // StreamReader
  gidLink(cast(void**)&gaflight_stream_reader_get_type, "gaflight_stream_reader_get_type", libs);

  // StreamWriter
  gidLink(cast(void**)&gaflight_stream_writer_get_type, "gaflight_stream_writer_get_type", libs);
  gidLink(cast(void**)&gaflight_stream_writer_done_writing, "gaflight_stream_writer_done_writing", libs);

  // Ticket
  gidLink(cast(void**)&gaflight_ticket_get_type, "gaflight_ticket_get_type", libs);
  gidLink(cast(void**)&gaflight_ticket_new, "gaflight_ticket_new", libs);
  gidLink(cast(void**)&gaflight_ticket_equal, "gaflight_ticket_equal", libs);
}
