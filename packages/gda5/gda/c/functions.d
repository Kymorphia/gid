/// C functions for gda5 library
module gda.c.functions;

public import gid.basictypes;
import gid.loader;
import gda.c.types;
public import gobject.c.types;
public import libxml2.c.types;

version(Windows)
  private immutable LIBS = ["libgda-5.0-4.dll;gda-5.0-4.dll;gda-5.dll"];
else version(OSX)
  private immutable LIBS = ["libgda-5.0.4.dylib"];
else
  private immutable LIBS = ["libgda-5.0.so.4"];

__gshared extern(C)
{
  // AttributesManager
  void function(GdaAttributesManager* mgr, void* ptr) c_gda_attributes_manager_clear; ///
  void function(GdaAttributesManager* fromMgr, void** from, GdaAttributesManager* toMgr, void** to) c_gda_attributes_manager_copy; ///
  void function(GdaAttributesManager* mgr, void* ptr, GdaAttributesManagerFunc func, void* data) c_gda_attributes_manager_foreach; ///
  void function(GdaAttributesManager* mgr) c_gda_attributes_manager_free; ///
  const(GValue)* function(GdaAttributesManager* mgr, void* ptr, const(char)* attName) c_gda_attributes_manager_get; ///
  void function(GdaAttributesManager* mgr, void* ptr, const(char)* attName, const(GValue)* value) c_gda_attributes_manager_set; ///
  void function(GdaAttributesManager* mgr, void* ptr, const(char)* attName, const(GValue)* value, GDestroyNotify destroy) c_gda_attributes_manager_set_full; ///
  GdaAttributesManager* function(gboolean forObjects, GdaAttributesManagerSignal signalFunc, void* signalData) c_gda_attributes_manager_new; ///

  // Batch
  GType function() c_gda_batch_get_type; ///
  GdaBatch* function() c_gda_batch_new; ///
  GQuark function() c_gda_batch_error_quark; ///
  void function(GdaBatch* batch, GdaStatement* stmt) c_gda_batch_add_statement; ///
  GdaBatch* function(GdaBatch* orig) c_gda_batch_copy; ///
  gboolean function(GdaBatch* batch, GdaSet** outParams, GError** _err) c_gda_batch_get_parameters; ///
  const(GSList)* function(GdaBatch* batch) c_gda_batch_get_statements; ///
  void function(GdaBatch* batch, GdaStatement* stmt) c_gda_batch_remove_statement; ///
  char* function(GdaBatch* batch) c_gda_batch_serialize; ///

  // Binary
  GType function() c_gda_binary_get_type; ///
  char* function(const(GdaBinary)* bin, uint maxlen) c_gda_binary_to_string; ///
  void* function(void* boxed) c_gda_binary_copy; ///
  void function(void* boxed) c_gda_binary_free; ///

  // Blob
  GType function() c_gda_blob_get_type; ///
  void function(GdaBlob* blob, GdaBlobOp* op) c_gda_blob_set_op; ///
  char* function(GdaBlob* blob, uint maxlen) c_gda_blob_to_string; ///
  void* function(void* boxed) c_gda_blob_copy; ///
  void function(void* boxed) c_gda_blob_free; ///

  // BlobOp
  GType function() c_gda_blob_op_get_type; ///
  glong function(GdaBlobOp* op) c_gda_blob_op_get_length; ///
  glong function(GdaBlobOp* op, GdaBlob* blob, glong offset, glong size) c_gda_blob_op_read; ///
  gboolean function(GdaBlobOp* op, GdaBlob* blob) c_gda_blob_op_read_all; ///
  glong function(GdaBlobOp* op, GdaBlob* blob, glong offset) c_gda_blob_op_write; ///
  gboolean function(GdaBlobOp* op, GdaBlob* blob) c_gda_blob_op_write_all; ///

  // Column
  GType function() c_gda_column_get_type; ///
  GdaColumn* function() c_gda_column_new; ///
  GdaColumn* function(GdaColumn* column) c_gda_column_copy; ///
  gboolean function(GdaColumn* column) c_gda_column_get_allow_null; ///
  const(GValue)* function(GdaColumn* column, const(char)* attribute) c_gda_column_get_attribute; ///
  gboolean function(GdaColumn* column) c_gda_column_get_auto_increment; ///
  const(char)* function(GdaColumn* column) c_gda_column_get_dbms_type; ///
  const(GValue)* function(GdaColumn* column) c_gda_column_get_default_value; ///
  const(char)* function(GdaColumn* column) c_gda_column_get_description; ///
  GType function(GdaColumn* column) c_gda_column_get_g_type; ///
  const(char)* function(GdaColumn* column) c_gda_column_get_name; ///
  int function(GdaColumn* column) c_gda_column_get_position; ///
  void function(GdaColumn* column, gboolean allow) c_gda_column_set_allow_null; ///
  void function(GdaColumn* column, const(char)* attribute, const(GValue)* value, GDestroyNotify destroy) c_gda_column_set_attribute; ///
  void function(GdaColumn* column, gboolean isAuto) c_gda_column_set_auto_increment; ///
  void function(GdaColumn* column, const(char)* dbmsType) c_gda_column_set_dbms_type; ///
  void function(GdaColumn* column, const(GValue)* defaultValue) c_gda_column_set_default_value; ///
  void function(GdaColumn* column, const(char)* title) c_gda_column_set_description; ///
  void function(GdaColumn* column, GType type) c_gda_column_set_g_type; ///
  void function(GdaColumn* column, const(char)* name) c_gda_column_set_name; ///
  void function(GdaColumn* column, int position) c_gda_column_set_position; ///

  // Config
  GType function() c_gda_config_get_type; ///
  gboolean function() c_gda_config_can_modify_system_config; ///
  gboolean function(const(GdaDsnInfo)* info, GError** _err) c_gda_config_define_dsn; ///
  gboolean function(const(char)* dsnName) c_gda_config_dsn_needs_authentication; ///
  GQuark function() c_gda_config_error_quark; ///
  GdaConfig* function() c_gda_config_get; ///
  GdaDsnInfo* function(const(char)* dsnName) c_gda_config_get_dsn_info; ///
  GdaDsnInfo* function(int index) c_gda_config_get_dsn_info_at_index; ///
  int function(const(char)* dsnName) c_gda_config_get_dsn_info_index; ///
  int function() c_gda_config_get_nb_dsn; ///
  GdaServerProvider* function(const(char)* providerName, GError** _err) c_gda_config_get_provider; ///
  GdaProviderInfo* function(const(char)* providerName) c_gda_config_get_provider_info; ///
  GdaDataModel* function() c_gda_config_list_dsn; ///
  GdaDataModel* function() c_gda_config_list_providers; ///
  gboolean function(const(char)* dsnName, GError** _err) c_gda_config_remove_dsn; ///

  // Connection
  GType function() c_gda_connection_get_type; ///
  GdaConnection* function(const(char)* dsn, const(char)* authString, GdaConnectionOptions options, GError** _err) c_gda_connection_new_from_dsn; ///
  GdaConnection* function(const(char)* providerName, const(char)* cncString, const(char)* authString, GdaConnectionOptions options, GError** _err) c_gda_connection_new_from_string; ///
  GQuark function() c_gda_connection_error_quark; ///
  GdaConnection* function(const(char)* dsn, const(char)* authString, GdaConnectionOptions options, GError** _err) c_gda_connection_open_from_dsn; ///
  GdaConnection* function(const(char)* providerName, const(char)* cncString, const(char)* authString, GdaConnectionOptions options, GError** _err) c_gda_connection_open_from_string; ///
  GdaConnection* function(const(char)* directory, const(char)* filename, gboolean autoUnlink) c_gda_connection_open_sqlite; ///
  void function(const(char)* string_, char** outCncParams, char** outProvider, char** outUsername, char** outPassword) c_gda_connection_string_split; ///
  void function(GdaConnection* cnc, GdaConnectionEvent* event) c_gda_connection_add_event; ///
  GdaConnectionEvent* function(GdaConnection* cnc, const(char)* str,  ...) c_gda_connection_add_event_string; ///
  void function(GdaConnection* cnc, GdaStatement* gdaStmt, GdaPStmt* preparedStmt) c_gda_connection_add_prepared_statement; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GError** _err) c_gda_connection_add_savepoint; ///
  gboolean function(GdaConnection* cnc, uint taskId, GError** _err) c_gda_connection_async_cancel; ///
  GObject* function(GdaConnection* cnc, uint taskId, GdaSet** lastInsertRow, GError** _err) c_gda_connection_async_fetch_result; ///
  uint function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementModelUsage modelUsage, GType* colTypes, gboolean needLastInsertRow, GError** _err) c_gda_connection_async_statement_execute; ///
  GSList* function(GdaConnection* cnc, GdaBatch* batch, GdaSet* params, GdaStatementModelUsage modelUsage, GError** _err) c_gda_connection_batch_execute; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GdaTransactionIsolation level, GError** _err) c_gda_connection_begin_transaction; ///
  void function(GdaConnection* cnc) c_gda_connection_clear_events_list; ///
  void function(GdaConnection* cnc) c_gda_connection_close; ///
  void function(GdaConnection* cnc) c_gda_connection_close_no_warning; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GError** _err) c_gda_connection_commit_transaction; ///
  GdaServerOperation* function(GdaConnection* cnc, GdaServerOperationType type, GdaSet* options, GError** _err) c_gda_connection_create_operation; ///
  GdaSqlParser* function(GdaConnection* cnc) c_gda_connection_create_parser; ///
  void function(GdaConnection* cnc, GdaStatement* gdaStmt) c_gda_connection_del_prepared_statement; ///
  gboolean function(GdaConnection* cnc, const(char)* table, const(char)* conditionColumnName, GValue* conditionValue, GError** _err) c_gda_connection_delete_row_from_table; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GError** _err) c_gda_connection_delete_savepoint; ///
  int function(GdaConnection* cnc, const(char)* sql, GError** _err) c_gda_connection_execute_non_select_command; ///
  GdaDataModel* function(GdaConnection* cnc, const(char)* sql, GError** _err) c_gda_connection_execute_select_command; ///
  const(char)* function(GdaConnection* cnc) c_gda_connection_get_authentication; ///
  const(char)* function(GdaConnection* cnc) c_gda_connection_get_cnc_string; ///
  gboolean function(GdaConnection* cnc, GDateDMY* outFirst, GDateDMY* outSecond, GDateDMY* outThird, char* outSep, GError** _err) c_gda_connection_get_date_format; ///
  const(char)* function(GdaConnection* cnc) c_gda_connection_get_dsn; ///
  const(GList)* function(GdaConnection* cnc) c_gda_connection_get_events; ///
  GdaMetaStore* function(GdaConnection* cnc) c_gda_connection_get_meta_store; ///
  GdaDataModel* function(GdaConnection* cnc, GdaConnectionMetaType metaType, GError** error, int nbFilters,  ...) c_gda_connection_get_meta_store_data; ///
  GdaDataModel* function(GdaConnection* cnc, GdaConnectionMetaType metaType, GList* filters, GError** _err) c_gda_connection_get_meta_store_data_v; ///
  GdaConnectionOptions function(GdaConnection* cnc) c_gda_connection_get_options; ///
  GdaPStmt* function(GdaConnection* cnc, GdaStatement* gdaStmt) c_gda_connection_get_prepared_statement; ///
  GdaServerProvider* function(GdaConnection* cnc) c_gda_connection_get_provider; ///
  const(char)* function(GdaConnection* cnc) c_gda_connection_get_provider_name; ///
  GdaTransactionStatus* function(GdaConnection* cnc) c_gda_connection_get_transaction_status; ///
  gboolean function(GdaConnection* cnc, const(char)* table, GError** error,  ...) c_gda_connection_insert_row_into_table; ///
  gboolean function(GdaConnection* cnc, const(char)* table, GSList* colNames, GSList* values, GError** _err) c_gda_connection_insert_row_into_table_v; ///
  void function(GdaConnection* cnc, GdaTransactionStatusState newstate) c_gda_connection_internal_change_transaction_state; ///
  void* function(GdaConnection* cnc) c_gda_connection_internal_get_provider_data; ///
  void* function(GdaConnection* cnc, GError** _err) c_gda_connection_internal_get_provider_data_error; ///
  void function(GdaConnection* cnc) c_gda_connection_internal_reset_transaction_status; ///
  void function(GdaConnection* cnc, const(char)* parentTrans, const(char)* svpName) c_gda_connection_internal_savepoint_added; ///
  void function(GdaConnection* cnc, const(char)* svpName) c_gda_connection_internal_savepoint_removed; ///
  void function(GdaConnection* cnc, const(char)* svpName) c_gda_connection_internal_savepoint_rolledback; ///
  void function(GdaConnection* cnc, void* data, GDestroyNotify destroyFunc) c_gda_connection_internal_set_provider_data; ///
  void function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaConnectionEvent* error) c_gda_connection_internal_statement_executed; ///
  void function(GdaConnection* cnc, const(char)* transName) c_gda_connection_internal_transaction_committed; ///
  void function(GdaConnection* cnc, const(char)* transName) c_gda_connection_internal_transaction_rolledback; ///
  void function(GdaConnection* cnc, const(char)* parentTrans, const(char)* transName, GdaTransactionIsolation isolLevel) c_gda_connection_internal_transaction_started; ///
  gboolean function(GdaConnection* cnc) c_gda_connection_is_opened; ///
  gboolean function(GdaConnection* cnc, GError** _err) c_gda_connection_open; ///
  GdaStatement* function(GdaConnection* cnc, const(char)* sql, GdaSet** params, GError** _err) c_gda_connection_parse_sql_string; ///
  gboolean function(GdaConnection* cnc, GdaServerOperation* op, GError** _err) c_gda_connection_perform_operation; ///
  GdaConnectionEvent* function(GdaConnection* cnc, GdaConnectionEventType type) c_gda_connection_point_available_event; ///
  char* function(GdaConnection* cnc, const(char)* id) c_gda_connection_quote_sql_identifier; ///
  GSList* function(GdaConnection* cnc, GdaRepetitiveStatement* rstmt, GdaStatementModelUsage modelUsage, GType* colTypes, gboolean stopOnError, GError** _err) c_gda_connection_repetitive_statement_execute; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GError** _err) c_gda_connection_rollback_savepoint; ///
  gboolean function(GdaConnection* cnc, const(char)* name, GError** _err) c_gda_connection_rollback_transaction; ///
  GObject* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementModelUsage modelUsage, GdaSet** lastInsertRow, GError** _err) c_gda_connection_statement_execute; ///
  int function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaSet** lastInsertRow, GError** _err) c_gda_connection_statement_execute_non_select; ///
  GdaDataModel* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GError** _err) c_gda_connection_statement_execute_select; ///
  GdaDataModel* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementModelUsage modelUsage, GType* colTypes, GError** _err) c_gda_connection_statement_execute_select_full; ///
  GdaDataModel* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementModelUsage modelUsage, GError** error,  ...) c_gda_connection_statement_execute_select_fullv; ///
  gboolean function(GdaConnection* cnc, GdaStatement* stmt, GError** _err) c_gda_connection_statement_prepare; ///
  char* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params, GdaStatementSqlFlag flags, GSList** paramsUsed, GError** _err) c_gda_connection_statement_to_sql; ///
  gboolean function(GdaConnection* cnc, GdaConnectionFeature feature) c_gda_connection_supports_feature; ///
  gboolean function(GdaConnection* cnc, GdaMetaContext* context, GError** _err) c_gda_connection_update_meta_store; ///
  gboolean function(GdaConnection* cnc, const(char)* table, const(char)* conditionColumnName, GValue* conditionValue, GError** error,  ...) c_gda_connection_update_row_in_table; ///
  gboolean function(GdaConnection* cnc, const(char)* table, const(char)* conditionColumnName, GValue* conditionValue, GSList* colNames, GSList* values, GError** _err) c_gda_connection_update_row_in_table_v; ///
  char* function(GdaConnection* cnc, GValue* from) c_gda_connection_value_to_sql_string; ///

  // ConnectionEvent
  GType function() c_gda_connection_event_get_type; ///
  glong function(GdaConnectionEvent* event) c_gda_connection_event_get_code; ///
  const(char)* function(GdaConnectionEvent* event) c_gda_connection_event_get_description; ///
  GdaConnectionEventType function(GdaConnectionEvent* event) c_gda_connection_event_get_event_type; ///
  GdaConnectionEventCode function(GdaConnectionEvent* event) c_gda_connection_event_get_gda_code; ///
  const(char)* function(GdaConnectionEvent* event) c_gda_connection_event_get_source; ///
  const(char)* function(GdaConnectionEvent* event) c_gda_connection_event_get_sqlstate; ///
  void function(GdaConnectionEvent* event, glong code) c_gda_connection_event_set_code; ///
  void function(GdaConnectionEvent* event, const(char)* description) c_gda_connection_event_set_description; ///
  void function(GdaConnectionEvent* event, GdaConnectionEventType type) c_gda_connection_event_set_event_type; ///
  void function(GdaConnectionEvent* event, GdaConnectionEventCode code) c_gda_connection_event_set_gda_code; ///
  void function(GdaConnectionEvent* event, const(char)* source) c_gda_connection_event_set_source; ///
  void function(GdaConnectionEvent* event, const(char)* sqlstate) c_gda_connection_event_set_sqlstate; ///

  // DataAccessWrapper
  GType function() c_gda_data_access_wrapper_get_type; ///
  GdaDataModel* function(GdaDataModel* model) c_gda_data_access_wrapper_new; ///
  gboolean function(GdaDataAccessWrapper* wrapper, const(int)* mapping, int mappingSize) c_gda_data_access_wrapper_set_mapping; ///

  // DataComparator
  GType function() c_gda_data_comparator_get_type; ///
  GObject* function(GdaDataModel* oldModel, GdaDataModel* newModel) c_gda_data_comparator_new; ///
  GQuark function() c_gda_data_comparator_error_quark; ///
  gboolean function(GdaDataComparator* comp, GError** _err) c_gda_data_comparator_compute_diff; ///
  const(GdaDiff)* function(GdaDataComparator* comp, int pos) c_gda_data_comparator_get_diff; ///
  int function(GdaDataComparator* comp) c_gda_data_comparator_get_n_diffs; ///
  void function(GdaDataComparator* comp, const(int)* colNumbers, int nbCols) c_gda_data_comparator_set_key_columns; ///

  // DataHandler
  GType function() c_gda_data_handler_get_type; ///
  GdaDataHandler* function(GType forType) c_gda_data_handler_get_default; ///
  gboolean function(GdaDataHandler* dh, GType type) c_gda_data_handler_accepts_g_type; ///
  const(char)* function(GdaDataHandler* dh) c_gda_data_handler_get_descr; ///
  GValue* function(GdaDataHandler* dh, GType type) c_gda_data_handler_get_sane_init_value; ///
  char* function(GdaDataHandler* dh, const(GValue)* value) c_gda_data_handler_get_sql_from_value; ///
  char* function(GdaDataHandler* dh, const(GValue)* value) c_gda_data_handler_get_str_from_value; ///
  GValue* function(GdaDataHandler* dh, const(char)* sql, GType type) c_gda_data_handler_get_value_from_sql; ///
  GValue* function(GdaDataHandler* dh, const(char)* str, GType type) c_gda_data_handler_get_value_from_str; ///

  // DataModel
  GType function() c_gda_data_model_get_type; ///
  GQuark function() c_gda_data_model_error_quark; ///
  gboolean function(GdaDataModel* model, xmlNodePtr node, GError** _err) c_gda_data_model_add_data_from_xml_node; ///
  int function(GdaDataModel* model, GError** _err) c_gda_data_model_append_row; ///
  int function(GdaDataModel* model, const(GList)* values, GError** _err) c_gda_data_model_append_values; ///
  GdaDataModelArray* function(GdaDataModel* src, GError** _err) c_gda_data_model_array_copy_model; ///
  GdaDataModelArray* function(GdaDataModel* src, int ncols, int* cols, GError** _err) c_gda_data_model_array_copy_model_ext; ///
  GdaDataModelIter* function(GdaDataModel* model) c_gda_data_model_create_iter; ///
  GdaColumn* function(GdaDataModel* model, int col) c_gda_data_model_describe_column; ///
  void function(GdaDataModel* model, void* toStream) c_gda_data_model_dump; ///
  char* function(GdaDataModel* model) c_gda_data_model_dump_as_string; ///
  gboolean function(GdaDataModel* model, GdaDataModelIOFormat format, const(char)* file, const(int)* cols, int nbCols, const(int)* rows, int nbRows, GdaSet* options, GError** _err) c_gda_data_model_export_to_file; ///
  char* function(GdaDataModel* model, GdaDataModelIOFormat format, const(int)* cols, int nbCols, const(int)* rows, int nbRows, GdaSet* options) c_gda_data_model_export_to_string; ///
  void function(GdaDataModel* model) c_gda_data_model_freeze; ///
  GdaDataModelAccessFlags function(GdaDataModel* model) c_gda_data_model_get_access_flags; ///
  GdaValueAttribute function(GdaDataModel* model, int col, int row) c_gda_data_model_get_attributes_at; ///
  int function(GdaDataModel* model, const(char)* name) c_gda_data_model_get_column_index; ///
  const(char)* function(GdaDataModel* model, int col) c_gda_data_model_get_column_name; ///
  const(char)* function(GdaDataModel* model, int col) c_gda_data_model_get_column_title; ///
  GError** function(GdaDataModel* model) c_gda_data_model_get_exceptions; ///
  int function(GdaDataModel* model) c_gda_data_model_get_n_columns; ///
  int function(GdaDataModel* model) c_gda_data_model_get_n_rows; ///
  gboolean function(GdaDataModel* model) c_gda_data_model_get_notify; ///
  int function(GdaDataModel* model, GSList* values, int* colsIndex) c_gda_data_model_get_row_from_values; ///
  const(GValue)* function(GdaDataModel* model, int col, int row, GType expectedType, gboolean nullok, GError** _err) c_gda_data_model_get_typed_value_at; ///
  const(GValue)* function(GdaDataModel* model, int col, int row, GError** _err) c_gda_data_model_get_value_at; ///
  gboolean function(GdaDataModel* model, const(char)* file, GHashTable* colsTrans, GdaSet* options, GError** _err) c_gda_data_model_import_from_file; ///
  gboolean function(GdaDataModel* to, GdaDataModel* from, gboolean overwrite, GHashTable* colsTrans, GError** _err) c_gda_data_model_import_from_model; ///
  gboolean function(GdaDataModel* model, const(char)* string_, GHashTable* colsTrans, GdaSet* options, GError** _err) c_gda_data_model_import_from_string; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter, int row) c_gda_data_model_iter_at_row; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter) c_gda_data_model_iter_move_next_default; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter) c_gda_data_model_iter_move_prev_default; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter, int row) c_gda_data_model_iter_move_to_row_default; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter) c_gda_data_model_iter_next; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter) c_gda_data_model_iter_prev; ///
  gboolean function(GdaDataModel* model, GdaDataModelIter* iter, int col, const(GValue)* value, GError** _err) c_gda_data_model_iter_set_value; ///
  gboolean function(GdaDataModel* model, int row, GError** _err) c_gda_data_model_remove_row; ///
  void function(GdaDataModel* model) c_gda_data_model_reset; ///
  void function(GdaDataModel* model, int row) c_gda_data_model_row_inserted; ///
  void function(GdaDataModel* model, int row) c_gda_data_model_row_removed; ///
  void function(GdaDataModel* model, int row) c_gda_data_model_row_updated; ///
  void function(GdaDataModel* model, GdaDataModelHint hint, const(GValue)* hintValue) c_gda_data_model_send_hint; ///
  void function(GdaDataModel* model, int col, const(char)* name) c_gda_data_model_set_column_name; ///
  void function(GdaDataModel* model, int col, const(char)* title) c_gda_data_model_set_column_title; ///
  void function(GdaDataModel* model, gboolean doNotifyChanges) c_gda_data_model_set_notify; ///
  gboolean function(GdaDataModel* model, int col, int row, const(GValue)* value, GError** _err) c_gda_data_model_set_value_at; ///
  gboolean function(GdaDataModel* model, int row, GList* values, GError** _err) c_gda_data_model_set_values; ///
  void function(GdaDataModel* model) c_gda_data_model_thaw; ///

  // DataModelArray
  GType function() c_gda_data_model_array_get_type; ///
  GdaDataModel* function(int cols) c_gda_data_model_array_new; ///
  GdaDataModel* function(int cols,  ...) c_gda_data_model_array_new_with_g_types; ///
  GdaDataModel* function(int cols, GType* types) c_gda_data_model_array_new_with_g_types_v; ///
  void function(GdaDataModelArray* model) c_gda_data_model_array_clear; ///
  GdaRow* function(GdaDataModelArray* model, int row, GError** _err) c_gda_data_model_array_get_row; ///
  void function(GdaDataModelArray* model, int cols) c_gda_data_model_array_set_n_columns; ///

  // DataModelDir
  GType function() c_gda_data_model_dir_get_type; ///
  GdaDataModel* function(const(char)* basedir) c_gda_data_model_dir_new; ///
  void function(GdaDataModelDir* model) c_gda_data_model_dir_clean_errors; ///
  const(GSList)* function(GdaDataModelDir* model) c_gda_data_model_dir_get_errors; ///

  // DataModelImport
  GType function() c_gda_data_model_import_get_type; ///
  GdaDataModel* function(const(char)* filename, gboolean randomAccess, GdaSet* options) c_gda_data_model_import_new_file; ///
  GdaDataModel* function(const(char)* data, gboolean randomAccess, GdaSet* options) c_gda_data_model_import_new_mem; ///
  GdaDataModel* function(xmlNodePtr node) c_gda_data_model_import_new_xml_node; ///
  void function(GdaDataModelImport* model) c_gda_data_model_import_clean_errors; ///
  GSList* function(GdaDataModelImport* model) c_gda_data_model_import_get_errors; ///

  // DataModelIter
  GType function() c_gda_data_model_iter_get_type; ///
  GQuark function() c_gda_data_model_iter_error_quark; ///
  int function(GdaDataModelIter* iter, GdaHolder* param) c_gda_data_model_iter_get_column_for_param; ///
  GdaHolder* function(GdaDataModelIter* iter, int col) c_gda_data_model_iter_get_holder_for_field; ///
  int function(GdaDataModelIter* iter) c_gda_data_model_iter_get_row; ///
  const(GValue)* function(GdaDataModelIter* iter, int col) c_gda_data_model_iter_get_value_at; ///
  const(GValue)* function(GdaDataModelIter* iter, int col, GError** _err) c_gda_data_model_iter_get_value_at_e; ///
  const(GValue)* function(GdaDataModelIter* iter, const(char)* fieldName) c_gda_data_model_iter_get_value_for_field; ///
  void function(GdaDataModelIter* iter) c_gda_data_model_iter_invalidate_contents; ///
  gboolean function(GdaDataModelIter* iter) c_gda_data_model_iter_is_valid; ///
  gboolean function(GdaDataModelIter* iter) c_gda_data_model_iter_move_next; ///
  gboolean function(GdaDataModelIter* iter) c_gda_data_model_iter_move_prev; ///
  gboolean function(GdaDataModelIter* iter, int row) c_gda_data_model_iter_move_to_row; ///
  gboolean function(GdaDataModelIter* iter, int col, const(GValue)* value, GError** _err) c_gda_data_model_iter_set_value_at; ///

  // DataPivot
  GType function() c_gda_data_pivot_get_type; ///
  GQuark function() c_gda_data_pivot_error_quark; ///
  GdaDataModel* function(GdaDataModel* model) c_gda_data_pivot_new; ///
  gboolean function(GdaDataPivot* pivot, GdaDataPivotAggregate aggregateType, const(char)* field, const(char)* alias_, GError** _err) c_gda_data_pivot_add_data; ///
  gboolean function(GdaDataPivot* pivot, GdaDataPivotFieldType fieldType, const(char)* field, const(char)* alias_, GError** _err) c_gda_data_pivot_add_field; ///
  gboolean function(GdaDataPivot* pivot, GError** _err) c_gda_data_pivot_populate; ///

  // DataProxy
  GType function() c_gda_data_proxy_get_type; ///
  GObject* function(GdaDataModel* model) c_gda_data_proxy_new; ///
  GdaDataProxy* function(GdaDataModel* model) c_gda_data_proxy_new_with_data_model; ///
  GQuark function() c_gda_data_proxy_error_quark; ///
  void function(GdaDataProxy* proxy, int proxyRow, int col, GdaValueAttribute alterFlags) c_gda_data_proxy_alter_value_attributes; ///
  gboolean function(GdaDataProxy* proxy, GError** _err) c_gda_data_proxy_apply_all_changes; ///
  gboolean function(GdaDataProxy* proxy, int proxyRow, GError** _err) c_gda_data_proxy_apply_row_changes; ///
  gboolean function(GdaDataProxy* proxy) c_gda_data_proxy_cancel_all_changes; ///
  void function(GdaDataProxy* proxy, int proxyRow, int col) c_gda_data_proxy_cancel_row_changes; ///
  void function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_delete; ///
  const(char)* function(GdaDataProxy* proxy) c_gda_data_proxy_get_filter_expr; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_filtered_n_rows; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_n_modified_rows; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_n_new_rows; ///
  GdaDataModel* function(GdaDataProxy* proxy) c_gda_data_proxy_get_proxied_model; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_proxied_model_n_cols; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_proxied_model_n_rows; ///
  int function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_get_proxied_model_row; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_sample_end; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_sample_size; ///
  int function(GdaDataProxy* proxy) c_gda_data_proxy_get_sample_start; ///
  GdaValueAttribute function(GdaDataProxy* proxy, int proxyRow, int col) c_gda_data_proxy_get_value_attributes; ///
  GSList* function(GdaDataProxy* proxy, int proxyRow, int* colsIndex, int nCols) c_gda_data_proxy_get_values; ///
  gboolean function(GdaDataProxy* proxy) c_gda_data_proxy_has_changed; ///
  gboolean function(GdaDataProxy* proxy) c_gda_data_proxy_is_read_only; ///
  gboolean function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_row_has_changed; ///
  gboolean function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_row_is_deleted; ///
  gboolean function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_row_is_inserted; ///
  gboolean function(GdaDataProxy* proxy, const(char)* filterExpr, GError** _err) c_gda_data_proxy_set_filter_expr; ///
  gboolean function(GdaDataProxy* proxy, int col, GError** _err) c_gda_data_proxy_set_ordering_column; ///
  void function(GdaDataProxy* proxy, int sampleSize) c_gda_data_proxy_set_sample_size; ///
  void function(GdaDataProxy* proxy, int sampleStart) c_gda_data_proxy_set_sample_start; ///
  void function(GdaDataProxy* proxy, int proxyRow) c_gda_data_proxy_undelete; ///

  // DataSelect
  GType function() c_gda_data_select_get_type; ///
  GQuark function() c_gda_data_select_error_quark; ///
  gboolean function(GdaDataSelect* model, GError** _err) c_gda_data_select_compute_columns_attributes; ///
  gboolean function(GdaDataSelect* model, GError** _err) c_gda_data_select_compute_modification_statements; ///
  gboolean function(GdaDataSelect* model, GdaDataSelectConditionType condType, GError** _err) c_gda_data_select_compute_modification_statements_ext; ///
  gboolean function(GdaDataSelect* model, GError** _err) c_gda_data_select_compute_row_selection_condition; ///
  GdaConnection* function(GdaDataSelect* model) c_gda_data_select_get_connection; ///
  gboolean function(GdaDataSelect* model, GError** _err) c_gda_data_select_prepare_for_offline; ///
  gboolean function(GdaDataSelect* model, GError** _err) c_gda_data_select_rerun; ///
  gboolean function(GdaDataSelect* model, GdaStatement* modStmt, GError** _err) c_gda_data_select_set_modification_statement; ///
  gboolean function(GdaDataSelect* model, const(char)* sql, GError** _err) c_gda_data_select_set_modification_statement_sql; ///
  gboolean function(GdaDataSelect* model, GdaSqlExpr* expr, GError** _err) c_gda_data_select_set_row_selection_condition; ///
  gboolean function(GdaDataSelect* model, const(char)* sqlWhere, GError** _err) c_gda_data_select_set_row_selection_condition_sql; ///

  // DsnInfo
  GType function() c_gda_dsn_info_get_type; ///
  GdaDsnInfo* function() c_gda_dsn_info_new; ///
  GdaDsnInfo* function(GdaDsnInfo* source) c_gda_dsn_info_copy; ///
  void function(GdaDsnInfo* dsn) c_gda_dsn_info_free; ///

  // GeometricPoint
  GType function() c_gda_geometricpoint_get_type; ///
  void* function(void* boxed) c_gda_geometricpoint_copy; ///
  void function(void* boxed) c_gda_geometricpoint_free; ///

  // HandlerBin
  GType function() c_gda_handler_bin_get_type; ///
  GdaDataHandler* function() c_gda_handler_bin_new; ///

  // HandlerBoolean
  GType function() c_gda_handler_boolean_get_type; ///
  GdaDataHandler* function() c_gda_handler_boolean_new; ///

  // HandlerNumerical
  GType function() c_gda_handler_numerical_get_type; ///
  GdaDataHandler* function() c_gda_handler_numerical_new; ///

  // HandlerString
  GType function() c_gda_handler_string_get_type; ///
  GdaDataHandler* function() c_gda_handler_string_new; ///
  GdaDataHandler* function(GdaServerProvider* prov, GdaConnection* cnc) c_gda_handler_string_new_with_provider; ///

  // HandlerTime
  GType function() c_gda_handler_time_get_type; ///
  GdaDataHandler* function() c_gda_handler_time_new; ///
  GdaDataHandler* function() c_gda_handler_time_new_no_locale; ///
  char* function(GdaHandlerTime* dh, GType type) c_gda_handler_time_get_format; ///
  char* function(GdaHandlerTime* dh, const(GValue)* value) c_gda_handler_time_get_no_locale_str_from_value; ///
  void function(GdaHandlerTime* dh, GDateDMY first, GDateDMY sec, GDateDMY third, char separator, gboolean twodigitsYears) c_gda_handler_time_set_sql_spec; ///
  void function(GdaHandlerTime* dh, GDateDMY first, GDateDMY sec, GDateDMY third, char separator, gboolean twodigitsYears) c_gda_handler_time_set_str_spec; ///

  // HandlerType
  GType function() c_gda_handler_type_get_type; ///
  GdaDataHandler* function() c_gda_handler_type_new; ///

  // Holder
  GType function() c_gda_holder_get_type; ///
  GdaHolder* function(GType type) c_gda_holder_new; ///
  GdaHolder* function(GType type, const(char)* id,  ...) c_gda_holder_new_inline; ///
  GQuark function() c_gda_holder_error_quark; ///
  GdaHolder* function(GdaHolder* orig) c_gda_holder_copy; ///
  void function(GdaHolder* holder) c_gda_holder_force_invalid; ///
  void function(GdaHolder* holder, GError* error) c_gda_holder_force_invalid_e; ///
  char* function(GdaHolder* holder) c_gda_holder_get_alphanum_id; ///
  const(GValue)* function(GdaHolder* holder, const(char)* attribute) c_gda_holder_get_attribute; ///
  GdaHolder* function(GdaHolder* holder) c_gda_holder_get_bind; ///
  const(GValue)* function(GdaHolder* holder) c_gda_holder_get_default_value; ///
  GType function(GdaHolder* holder) c_gda_holder_get_g_type; ///
  const(char)* function(GdaHolder* holder) c_gda_holder_get_id; ///
  gboolean function(GdaHolder* holder) c_gda_holder_get_not_null; ///
  GdaDataModel* function(GdaHolder* holder, int* col) c_gda_holder_get_source_model; ///
  const(GValue)* function(GdaHolder* holder) c_gda_holder_get_value; ///
  char* function(GdaHolder* holder, GdaDataHandler* dh) c_gda_holder_get_value_str; ///
  gboolean function(GdaHolder* holder) c_gda_holder_is_valid; ///
  gboolean function(GdaHolder* holder, GError** _err) c_gda_holder_is_valid_e; ///
  void function(GdaHolder* holder, const(char)* attribute, const(GValue)* value, GDestroyNotify destroy) c_gda_holder_set_attribute; ///
  gboolean function(GdaHolder* holder, GdaHolder* bindTo, GError** _err) c_gda_holder_set_bind; ///
  void function(GdaHolder* holder, const(GValue)* value) c_gda_holder_set_default_value; ///
  void function(GdaHolder* holder, gboolean notNull) c_gda_holder_set_not_null; ///
  gboolean function(GdaHolder* holder, GdaDataModel* model, int col, GError** _err) c_gda_holder_set_source_model; ///
  gboolean function(GdaHolder* holder, const(GValue)* value, GError** _err) c_gda_holder_set_value; ///
  gboolean function(GdaHolder* holder, GdaDataHandler* dh, const(char)* value, GError** _err) c_gda_holder_set_value_str; ///
  gboolean function(GdaHolder* holder) c_gda_holder_set_value_to_default; ///
  GValue* function(GdaHolder* holder, const(GValue)* value, gboolean* valueChanged, GError** _err) c_gda_holder_take_static_value; ///
  gboolean function(GdaHolder* holder, GValue* value, GError** _err) c_gda_holder_take_value; ///
  gboolean function(GdaHolder* holder) c_gda_holder_value_is_default; ///

  // Lockable
  GType function() c_gda_lockable_get_type; ///
  void function(GdaLockable* lockable) c_gda_lockable_lock; ///
  gboolean function(GdaLockable* lockable) c_gda_lockable_trylock; ///
  void function(GdaLockable* lockable) c_gda_lockable_unlock; ///

  // MetaContext
  GType function() c_gda_meta_context_get_type; ///
  GdaMetaContext* function() c_gda_meta_context_new; ///
  GdaMetaContext* function(GdaMetaContext* ctx) c_gda_meta_context_copy; ///
  void function(GdaMetaContext* ctx) c_gda_meta_context_free; ///
  const(char)* function(GdaMetaContext* ctx) c_gda_meta_context_get_table; ///
  void function(GdaMetaContext* ctx, const(char)* column, const(GValue)* value, GdaConnection* cnc) c_gda_meta_context_set_column; ///
  void function(GdaMetaContext* ctx, GHashTable* columns, GdaConnection* cnc) c_gda_meta_context_set_columns; ///
  void function(GdaMetaContext* ctx, const(char)* table) c_gda_meta_context_set_table; ///

  // MetaStore
  GType function() c_gda_meta_store_get_type; ///
  GdaMetaStore* function(const(char)* cncString) c_gda_meta_store_new; ///
  GdaMetaStore* function(const(char)* fileName) c_gda_meta_store_new_with_file; ///
  GQuark function() c_gda_meta_store_error_quark; ///
  char* function(const(char)* id, GdaConnection* cnc) c_gda_meta_store_sql_identifier_quote; ///
  GdaDataModel* function(GdaMetaStore* store, const(char)* tableName) c_gda_meta_store_create_modify_data_model; ///
  gboolean function(GdaMetaStore* store, GdaMetaStruct* mstruct, const(char)* fkName, const(char)* catalog, const(char)* schema, const(char)* table, const(char)* refCatalog, const(char)* refSchema, const(char)* refTable, uint nbCols, char** colnames, char** refColnames, GError** _err) c_gda_meta_store_declare_foreign_key; ///
  GdaDataModel* function(GdaMetaStore* store, const(char)* selectSql, GError** error,  ...) c_gda_meta_store_extract; ///
  GdaDataModel* function(GdaMetaStore* store, const(char)* selectSql, GHashTable* vars, GError** _err) c_gda_meta_store_extract_v; ///
  gboolean function(GdaMetaStore* store, const(char)* attName, char** attValue, GError** _err) c_gda_meta_store_get_attribute_value; ///
  GdaConnection* function(GdaMetaStore* store) c_gda_meta_store_get_internal_connection; ///
  int function(GdaMetaStore* store) c_gda_meta_store_get_version; ///
  gboolean function(GdaMetaStore* store, const(char)* tableName, GdaDataModel* newData, const(char)* condition, GError** error,  ...) c_gda_meta_store_modify; ///
  gboolean function(GdaMetaStore* store, const(char)* tableName, GdaDataModel* newData, const(char)* condition, int nvalues, const(char*)* valueNames, const(GValue*)* values, GError** _err) c_gda_meta_store_modify_v; ///
  gboolean function(GdaMetaStore* store, GdaMetaContext* context, GdaDataModel* newData, GError** _err) c_gda_meta_store_modify_with_context; ///
  gboolean function(GdaMetaStore* store, const(char)* xmlDescription, GError** _err) c_gda_meta_store_schema_add_custom_object; ///
  GSList* function(GdaMetaStore* store) c_gda_meta_store_schema_get_all_tables; ///
  GSList* function(GdaMetaStore* store, const(char)* tableName) c_gda_meta_store_schema_get_depend_tables; ///
  GdaMetaStruct* function(GdaMetaStore* store, GError** _err) c_gda_meta_store_schema_get_structure; ///
  gboolean function(GdaMetaStore* store, const(char)* objName, GError** _err) c_gda_meta_store_schema_remove_custom_object; ///
  gboolean function(GdaMetaStore* store, const(char)* attName, const(char)* attValue, GError** _err) c_gda_meta_store_set_attribute_value; ///
  void function(GdaMetaStore* store, GdaSqlIdentifierStyle style) c_gda_meta_store_set_identifiers_style; ///
  void function(GdaMetaStore* store, GdaSqlReservedKeywordsFunc func) c_gda_meta_store_set_reserved_keywords_func; ///
  gboolean function(GdaMetaStore* store, GdaMetaStruct* mstruct, const(char)* fkName, const(char)* catalog, const(char)* schema, const(char)* table, const(char)* refCatalog, const(char)* refSchema, const(char)* refTable, GError** _err) c_gda_meta_store_undeclare_foreign_key; ///

  // MetaStruct
  GType function() c_gda_meta_struct_get_type; ///
  GdaMetaStruct* function(GdaMetaStore* store, GdaMetaStructFeature features) c_gda_meta_struct_new; ///
  GQuark function() c_gda_meta_struct_error_quark; ///
  GdaMetaDbObject* function(GdaMetaStruct* mstruct, GdaMetaDbObjectType type, const(GValue)* catalog, const(GValue)* schema, const(GValue)* name, GError** _err) c_gda_meta_struct_complement; ///
  gboolean function(GdaMetaStruct* mstruct, GError** _err) c_gda_meta_struct_complement_all; ///
  gboolean function(GdaMetaStruct* mstruct, GError** _err) c_gda_meta_struct_complement_default; ///
  gboolean function(GdaMetaStruct* mstruct, GdaMetaDbObject* dbo, GError** _err) c_gda_meta_struct_complement_depend; ///
  gboolean function(GdaMetaStruct* mstruct, const(GValue)* catalog, const(GValue)* schema, GError** _err) c_gda_meta_struct_complement_schema; ///
  char* function(GdaMetaStruct* mstruct, GdaMetaGraphInfo info, GError** _err) c_gda_meta_struct_dump_as_graph; ///
  GSList* function(GdaMetaStruct* mstruct) c_gda_meta_struct_get_all_db_objects; ///
  GdaMetaDbObject* function(GdaMetaStruct* mstruct, const(GValue)* catalog, const(GValue)* schema, const(GValue)* name) c_gda_meta_struct_get_db_object; ///
  GdaMetaTableColumn* function(GdaMetaStruct* mstruct, GdaMetaTable* table, const(GValue)* colName) c_gda_meta_struct_get_table_column; ///
  gboolean function(GdaMetaStruct* mstruct, const(char)* catalog, const(char)* schema, const(char)* xmlSpecFile, GError** _err) c_gda_meta_struct_load_from_xml_file; ///
  gboolean function(GdaMetaStruct* mstruct, GdaMetaSortType sortType, GError** _err) c_gda_meta_struct_sort_db_objects; ///

  // MetaTableColumn
  void function(GdaMetaTableColumn* tcol, GdaAttributesManagerFunc func, void* data) c_gda_meta_table_column_foreach_attribute; ///
  const(GValue)* function(GdaMetaTableColumn* tcol, const(char)* attribute) c_gda_meta_table_column_get_attribute; ///
  void function(GdaMetaTableColumn* tcol, const(char)* attribute, const(GValue)* value, GDestroyNotify destroy) c_gda_meta_table_column_set_attribute; ///

  // Numeric
  GType function() c_gda_numeric_get_type; ///
  GdaNumeric* function() c_gda_numeric_new; ///
  GdaNumeric* function(GdaNumeric* src) c_gda_numeric_copy; ///
  void function(GdaNumeric* numeric) c_gda_numeric_free; ///
  double function(const(GdaNumeric)* numeric) c_gda_numeric_get_double; ///
  glong function(const(GdaNumeric)* numeric) c_gda_numeric_get_precision; ///
  char* function(const(GdaNumeric)* numeric) c_gda_numeric_get_string; ///
  glong function(const(GdaNumeric)* numeric) c_gda_numeric_get_width; ///
  void function(GdaNumeric* numeric, double number) c_gda_numeric_set_double; ///
  void function(GdaNumeric* numeric, const(char)* str) c_gda_numeric_set_from_string; ///
  void function(GdaNumeric* numeric, glong precision) c_gda_numeric_set_precision; ///
  void function(GdaNumeric* numeric, glong width) c_gda_numeric_set_width; ///

  // PStmt
  GType function() c_gda_pstmt_get_type; ///
  void function(GdaPStmt* src, GdaPStmt* dest) c_gda_pstmt_copy_contents; ///
  GdaStatement* function(GdaPStmt* pstmt) c_gda_pstmt_get_gda_statement; ///
  void function(GdaPStmt* pstmt, GdaStatement* stmt) c_gda_pstmt_set_gda_statement; ///

  // QuarkList
  GType function() c_gda_quark_list_get_type; ///
  GdaQuarkList* function() c_gda_quark_list_new; ///
  GdaQuarkList* function(const(char)* string_) c_gda_quark_list_new_from_string; ///
  void function(GdaQuarkList* qlist, const(char)* string_, gboolean cleanup) c_gda_quark_list_add_from_string; ///
  void function(GdaQuarkList* qlist) c_gda_quark_list_clear; ///
  GdaQuarkList* function(GdaQuarkList* qlist) c_gda_quark_list_copy; ///
  const(char)* function(GdaQuarkList* qlist, const(char)* name) c_gda_quark_list_find; ///
  void function(GdaQuarkList* qlist, GHFunc func, void* userData) c_gda_quark_list_foreach; ///
  void function(GdaQuarkList* qlist) c_gda_quark_list_free; ///
  void function(GdaQuarkList* qlist) c_gda_quark_list_protect_values; ///
  void function(GdaQuarkList* qlist, const(char)* name) c_gda_quark_list_remove; ///

  // RepetitiveStatement
  GType function() c_gda_repetitive_statement_get_type; ///
  GdaRepetitiveStatement* function(GdaStatement* stmt) c_gda_repetitive_statement_new; ///
  gboolean function(GdaRepetitiveStatement* rstmt, GdaSet* values, gboolean makeCopy) c_gda_repetitive_statement_append_set; ///
  GSList* function(GdaRepetitiveStatement* rstmt) c_gda_repetitive_statement_get_all_sets; ///
  gboolean function(GdaRepetitiveStatement* rstmt, GdaSet** set, GError** _err) c_gda_repetitive_statement_get_template_set; ///

  // Row
  GType function() c_gda_row_get_type; ///
  GdaRow* function(int count) c_gda_row_new; ///
  int function(GdaRow* row) c_gda_row_get_length; ///
  GValue* function(GdaRow* row, int num) c_gda_row_get_value; ///
  void function(GdaRow* row, GValue* value) c_gda_row_invalidate_value; ///
  void function(GdaRow* row, GValue* value, GError* error) c_gda_row_invalidate_value_e; ///
  gboolean function(GdaRow* row, GValue* value) c_gda_row_value_is_valid; ///
  gboolean function(GdaRow* row, GValue* value, GError** _err) c_gda_row_value_is_valid_e; ///

  // ServerOperation
  GType function() c_gda_server_operation_get_type; ///
  GdaServerOperation* function(GdaServerOperationType opType, const(char)* xmlFile) c_gda_server_operation_new; ///
  GQuark function() c_gda_server_operation_error_quark; ///
  const(char)* function(GdaServerOperationType type) c_gda_server_operation_op_type_to_string; ///
  GdaServerOperation* function(const(char)* provider, const(char)* dbName, GError** _err) c_gda_server_operation_prepare_create_database; ///
  GdaServerOperation* function(GdaConnection* cnc, const(char)* tableName, GError** error,  ...) c_gda_server_operation_prepare_create_table; ///
  GdaServerOperation* function(const(char)* provider, const(char)* dbName, GError** _err) c_gda_server_operation_prepare_drop_database; ///
  GdaServerOperation* function(GdaConnection* cnc, const(char)* tableName, GError** _err) c_gda_server_operation_prepare_drop_table; ///
  GdaServerOperationType function(const(char)* str) c_gda_server_operation_string_to_op_type; ///
  uint function(GdaServerOperation* op, const(char)* seqPath) c_gda_server_operation_add_item_to_sequence; ///
  gboolean function(GdaServerOperation* op, const(char)* itemPath) c_gda_server_operation_del_item_from_sequence; ///
  GdaServerOperationNode* function(GdaServerOperation* op, const(char)* pathFormat,  ...) c_gda_server_operation_get_node_info; ///
  char* function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_node_parent; ///
  char* function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_node_path_portion; ///
  GdaServerOperationNodeType function(GdaServerOperation* op, const(char)* path, GdaServerOperationNodeStatus* status) c_gda_server_operation_get_node_type; ///
  GdaServerOperationType function(GdaServerOperation* op) c_gda_server_operation_get_op_type; ///
  char** function(GdaServerOperation* op) c_gda_server_operation_get_root_nodes; ///
  char** function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_sequence_item_names; ///
  uint function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_sequence_max_size; ///
  uint function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_sequence_min_size; ///
  const(char)* function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_sequence_name; ///
  uint function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_sequence_size; ///
  char* function(GdaServerOperation* op, GdaConnection* cnc, GdaServerProvider* prov, const(char)* pathFormat,  ...) c_gda_server_operation_get_sql_identifier_at; ///
  char* function(GdaServerOperation* op, GdaConnection* cnc, GdaServerProvider* prov, const(char)* path) c_gda_server_operation_get_sql_identifier_at_path; ///
  const(GValue)* function(GdaServerOperation* op, const(char)* pathFormat,  ...) c_gda_server_operation_get_value_at; ///
  const(GValue)* function(GdaServerOperation* op, const(char)* path) c_gda_server_operation_get_value_at_path; ///
  gboolean function(GdaServerOperation* op, const(char)* xmlFile, GError** _err) c_gda_server_operation_is_valid; ///
  gboolean function(GdaServerOperation* op, xmlNodePtr node, GError** _err) c_gda_server_operation_load_data_from_xml; ///
  gboolean function(GdaServerOperation* op, const(char)* provider, GError** _err) c_gda_server_operation_perform_create_database; ///
  gboolean function(GdaServerOperation* op, GError** _err) c_gda_server_operation_perform_create_table; ///
  gboolean function(GdaServerOperation* op, const(char)* provider, GError** _err) c_gda_server_operation_perform_drop_database; ///
  gboolean function(GdaServerOperation* op, GError** _err) c_gda_server_operation_perform_drop_table; ///
  xmlNodePtr function(GdaServerOperation* op, GError** _err) c_gda_server_operation_save_data_to_xml; ///
  gboolean function(GdaServerOperation* op, const(char)* value, GError** error, const(char)* pathFormat,  ...) c_gda_server_operation_set_value_at; ///
  gboolean function(GdaServerOperation* op, const(char)* value, const(char)* path, GError** _err) c_gda_server_operation_set_value_at_path; ///

  // ServerProvider
  GType function() c_gda_server_provider_get_type; ///
  GQuark function() c_gda_server_provider_error_quark; ///
  char* function(const(char)* instDir, const(char)* dataDir, const(char)* filename) c_gda_server_provider_load_file_contents; ///
  GdaServerOperation* function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperationType type, GdaSet* options, GError** _err) c_gda_server_provider_create_operation; ///
  GdaSqlParser* function(GdaServerProvider* provider, GdaConnection* cnc) c_gda_server_provider_create_parser; ///
  char* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* str) c_gda_server_provider_escape_string; ///
  char* function(GdaServerProvider* prov, const(char)* instDir, const(char)* filename) c_gda_server_provider_find_file; ///
  GdaDataHandler* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* forType) c_gda_server_provider_get_data_handler_dbms; ///
  GdaDataHandler* function(GdaServerProvider* provider, GdaConnection* cnc, GType type, const(char)* dbmsType) c_gda_server_provider_get_data_handler_default; ///
  GdaDataHandler* function(GdaServerProvider* provider, GdaConnection* cnc, GType forType) c_gda_server_provider_get_data_handler_g_type; ///
  const(char)* function(GdaServerProvider* provider, GdaConnection* cnc, GType type) c_gda_server_provider_get_default_dbms_type; ///
  const(char)* function(GdaServerProvider* provider) c_gda_server_provider_get_name; ///
  const(char)* function(GdaServerProvider* provider, GdaConnection* cnc) c_gda_server_provider_get_server_version; ///
  const(char)* function(GdaServerProvider* provider) c_gda_server_provider_get_version; ///
  void function(GdaServerProvider* prov, GdaDataHandler* dh, GdaConnection* cnc, GType gType, const(char)* dbmsType) c_gda_server_provider_handler_declare; ///
  GdaDataHandler* function(GdaServerProvider* prov, GdaConnection* cnc, GType gType, const(char)* dbmsType) c_gda_server_provider_handler_find; ///
  GdaDataHandler* function(GdaServerProvider* provider, GType type) c_gda_server_provider_handler_use_default; ///
  GdaSqlParser* function(GdaServerProvider* prov) c_gda_server_provider_internal_get_parser; ///
  gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperation* op, GError** _err) c_gda_server_provider_perform_operation; ///
  gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperation* op, GError** _err) c_gda_server_provider_perform_operation_default; ///
  char* function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperation* op, GError** _err) c_gda_server_provider_render_operation; ///
  GValue* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* string_, GType preferredType, char** dbmsType) c_gda_server_provider_string_to_value; ///
  gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaConnectionFeature feature) c_gda_server_provider_supports_feature; ///
  gboolean function(GdaServerProvider* provider, GdaConnection* cnc, GdaServerOperationType type, GdaSet* options) c_gda_server_provider_supports_operation; ///
  char* function(GdaServerProvider* provider, GdaConnection* cnc, const(char)* str) c_gda_server_provider_unescape_string; ///
  char* function(GdaServerProvider* provider, GdaConnection* cnc, GValue* from) c_gda_server_provider_value_to_sql_string; ///

  // Set
  GType function() c_gda_set_get_type; ///
  GdaSet* function(GSList* holders) c_gda_set_new; ///
  GdaSet* function(xmlNodePtr xmlSpec, GError** _err) c_gda_set_new_from_spec_node; ///
  GdaSet* function(const(char)* xmlSpec, GError** _err) c_gda_set_new_from_spec_string; ///
  GdaSet* function(int nb,  ...) c_gda_set_new_inline; ///
  GdaSet* function(GSList* holders) c_gda_set_new_read_only; ///
  GQuark function() c_gda_set_error_quark; ///
  gboolean function(GdaSet* set, GdaHolder* holder) c_gda_set_add_holder; ///
  GdaSet* function(GdaSet* set) c_gda_set_copy; ///
  GdaSetGroup* function(GdaSet* set, GdaHolder* holder) c_gda_set_get_group; ///
  GdaHolder* function(GdaSet* set, const(char)* holderId) c_gda_set_get_holder; ///
  const(GValue)* function(GdaSet* set, const(char)* holderId) c_gda_set_get_holder_value; ///
  GdaSetNode* function(GdaSet* set, GdaHolder* holder) c_gda_set_get_node; ///
  GdaHolder* function(GdaSet* set, int pos) c_gda_set_get_nth_holder; ///
  GdaSetSource* function(GdaSet* set, GdaHolder* holder) c_gda_set_get_source; ///
  GdaSetSource* function(GdaSet* set, GdaDataModel* model) c_gda_set_get_source_for_model; ///
  gboolean function(GdaSet* set, GError** _err) c_gda_set_is_valid; ///
  void function(GdaSet* set, GdaSet* setToMerge) c_gda_set_merge_with_set; ///
  void function(GdaSet* set, GdaHolder* holder) c_gda_set_remove_holder; ///
  void function(GdaSet* set, GdaSetSource* source, GdaDataModel* model) c_gda_set_replace_source_model; ///
  gboolean function(GdaSet* set, GError** error, const(char)* holderId,  ...) c_gda_set_set_holder_value; ///

  // SetGroup
  GType function() c_gda_set_group_get_type; ///
  GdaSetGroup* function(GdaSetNode* node) c_gda_set_group_new; ///
  void function(GdaSetGroup* sg, GdaSetNode* node) c_gda_set_group_add_node; ///
  GdaSetGroup* function(GdaSetGroup* sg) c_gda_set_group_copy; ///
  void function(GdaSetGroup* sg) c_gda_set_group_free; ///
  int function(GdaSetGroup* sg) c_gda_set_group_get_n_nodes; ///
  GdaSetNode* function(GdaSetGroup* sg) c_gda_set_group_get_node; ///
  GSList* function(GdaSetGroup* sg) c_gda_set_group_get_nodes; ///
  GdaSetSource* function(GdaSetGroup* sg) c_gda_set_group_get_source; ///
  void function(GdaSetGroup* sg, GdaSetSource* source) c_gda_set_group_set_source; ///

  // SetNode
  GType function() c_gda_set_node_get_type; ///
  GdaSetNode* function(GdaHolder* holder) c_gda_set_node_new; ///
  GdaSetNode* function(GdaSetNode* node) c_gda_set_node_copy; ///
  void function(GdaSetNode* node) c_gda_set_node_free; ///
  GdaDataModel* function(GdaSetNode* node) c_gda_set_node_get_data_model; ///
  GdaHolder* function(GdaSetNode* node) c_gda_set_node_get_holder; ///
  int function(GdaSetNode* node) c_gda_set_node_get_source_column; ///
  void function(GdaSetNode* node, GdaDataModel* model) c_gda_set_node_set_data_model; ///
  void function(GdaSetNode* node, GdaHolder* holder) c_gda_set_node_set_holder; ///
  void function(GdaSetNode* node, int column) c_gda_set_node_set_source_column; ///

  // SetSource
  GType function() c_gda_set_source_get_type; ///
  GdaSetSource* function(GdaDataModel* model) c_gda_set_source_new; ///
  void function(GdaSetSource* s, GdaSetNode* node) c_gda_set_source_add_node; ///
  GdaSetSource* function(GdaSetSource* s) c_gda_set_source_copy; ///
  void function(GdaSetSource* s) c_gda_set_source_free; ///
  GdaDataModel* function(GdaSetSource* s) c_gda_set_source_get_data_model; ///
  int function(GdaSetSource* s) c_gda_set_source_get_n_nodes; ///
  GSList* function(GdaSetSource* s) c_gda_set_source_get_nodes; ///
  void function(GdaSetSource* s, GdaDataModel* model) c_gda_set_source_set_data_model; ///

  // Short
  GType function() c_gda_short_get_type; ///

  // SqlAnyPart
  gboolean function(GdaSqlAnyPart* node, GError** _err) c_gda_sql_any_part_check_structure; ///
  gboolean function(GdaSqlAnyPart* node, GdaSqlForeachFunc func, void* data, GError** _err) c_gda_sql_any_part_foreach; ///

  // SqlBuilder
  GType function() c_gda_sql_builder_get_type; ///
  GdaSqlBuilder* function(GdaSqlStatementType stmtType) c_gda_sql_builder_new; ///
  GQuark function() c_gda_sql_builder_error_quark; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlBuilderId testExpr, GdaSqlBuilderId elseExpr,  ...) c_gda_sql_builder_add_case; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlBuilderId testExpr, GdaSqlBuilderId elseExpr, const(GdaSqlBuilderId)* whenArray, const(GdaSqlBuilderId)* thenArray, int argsSize) c_gda_sql_builder_add_case_v; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlOperatorType op, GdaSqlBuilderId op1, GdaSqlBuilderId op2, GdaSqlBuilderId op3) c_gda_sql_builder_add_cond; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlOperatorType op, const(GdaSqlBuilderId)* opIds, int opIdsSize) c_gda_sql_builder_add_cond_v; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaDataHandler* dh, GType type,  ...) c_gda_sql_builder_add_expr; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaDataHandler* dh, const(GValue)* value) c_gda_sql_builder_add_expr_value; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* fieldName, const(char)* tableName) c_gda_sql_builder_add_field_id; ///
  void function(GdaSqlBuilder* builder, const(char)* fieldName, GType type,  ...) c_gda_sql_builder_add_field_value; ///
  void function(GdaSqlBuilder* builder, const(char)* fieldName, const(GValue)* value) c_gda_sql_builder_add_field_value_as_gvalue; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId fieldId, GdaSqlBuilderId valueId) c_gda_sql_builder_add_field_value_id; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* funcName,  ...) c_gda_sql_builder_add_function; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* funcName, const(GdaSqlBuilderId)* args, int argsSize) c_gda_sql_builder_add_function_v; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* str) c_gda_sql_builder_add_id; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* paramName, GType type, gboolean nullok) c_gda_sql_builder_add_param; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlStatement* sqlst) c_gda_sql_builder_add_sub_select; ///
  void function(GdaSqlBuilder* builder, GdaSqlStatement* sqlst) c_gda_sql_builder_compound_add_sub_select; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilder* subselect) c_gda_sql_builder_compound_add_sub_select_from_builder; ///
  void function(GdaSqlBuilder* builder, GdaSqlStatementCompoundType compoundType) c_gda_sql_builder_compound_set_type; ///
  GdaSqlExpr* function(GdaSqlBuilder* builder, GdaSqlBuilderId id) c_gda_sql_builder_export_expression; ///
  GdaSqlStatement* function(GdaSqlBuilder* builder) c_gda_sql_builder_get_sql_statement; ///
  GdaStatement* function(GdaSqlBuilder* builder, GError** _err) c_gda_sql_builder_get_statement; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlExpr* expr) c_gda_sql_builder_import_expression; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlBuilder* query, GdaSqlBuilderId exprId) c_gda_sql_builder_import_expression_from_builder; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId joinId, const(char)* fieldName) c_gda_sql_builder_join_add_field; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* fieldName, const(char)* tableName, const(char)* alias_) c_gda_sql_builder_select_add_field; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, const(char)* tableName, const(char)* alias_) c_gda_sql_builder_select_add_target; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlBuilderId tableId, const(char)* alias_) c_gda_sql_builder_select_add_target_id; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId exprId) c_gda_sql_builder_select_group_by; ///
  GdaSqlBuilderId function(GdaSqlBuilder* builder, GdaSqlBuilderId leftTargetId, GdaSqlBuilderId rightTargetId, GdaSqlSelectJoinType joinType, GdaSqlBuilderId joinExpr) c_gda_sql_builder_select_join_targets; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId exprId, gboolean asc, const(char)* collationName) c_gda_sql_builder_select_order_by; ///
  void function(GdaSqlBuilder* builder, gboolean distinct, GdaSqlBuilderId exprId) c_gda_sql_builder_select_set_distinct; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId condId) c_gda_sql_builder_select_set_having; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId limitCountExprId, GdaSqlBuilderId limitOffsetExprId) c_gda_sql_builder_select_set_limit; ///
  void function(GdaSqlBuilder* builder, const(char)* tableName) c_gda_sql_builder_set_table; ///
  void function(GdaSqlBuilder* builder, GdaSqlBuilderId condId) c_gda_sql_builder_set_where; ///

  // SqlCase
  GdaSqlCase* function(GdaSqlCase* sc) c_gda_sql_case_copy; ///
  void function(GdaSqlCase* sc) c_gda_sql_case_free; ///
  char* function(GdaSqlCase* sc) c_gda_sql_case_serialize; ///
  GdaSqlCase* function(GdaSqlAnyPart* parent) c_gda_sql_case_new; ///

  // SqlExpr
  GType function() c_gda_sql_expr_get_type; ///
  GdaSqlExpr* function(GdaSqlAnyPart* parent) c_gda_sql_expr_new; ///
  GdaSqlExpr* function(GdaSqlExpr* expr) c_gda_sql_expr_copy; ///
  void function(GdaSqlExpr* expr) c_gda_sql_expr_free; ///
  char* function(GdaSqlExpr* expr) c_gda_sql_expr_serialize; ///
  void function(GdaSqlExpr* expr, GdaSqlStatement* stmt) c_gda_sql_expr_take_select; ///

  // SqlField
  GdaSqlField* function(GdaSqlField* field) c_gda_sql_field_copy; ///
  void function(GdaSqlField* field) c_gda_sql_field_free; ///
  char* function(GdaSqlField* field) c_gda_sql_field_serialize; ///
  void function(GdaSqlField* field, GValue* value) c_gda_sql_field_take_name; ///
  GdaSqlField* function(GdaSqlAnyPart* parent) c_gda_sql_field_new; ///

  // SqlFunction
  void function(GdaSqlFunction* function_) c_gda_sql_function_check_clean; ///
  GdaSqlFunction* function(GdaSqlFunction* function_) c_gda_sql_function_copy; ///
  void function(GdaSqlFunction* function_) c_gda_sql_function_free; ///
  char* function(GdaSqlFunction* function_) c_gda_sql_function_serialize; ///
  void function(GdaSqlFunction* function_, GSList* args) c_gda_sql_function_take_args_list; ///
  void function(GdaSqlFunction* function_, GValue* value) c_gda_sql_function_take_name; ///
  GdaSqlFunction* function(GdaSqlAnyPart* parent) c_gda_sql_function_new; ///

  // SqlOperation
  GdaSqlOperation* function(GdaSqlOperation* operation) c_gda_sql_operation_copy; ///
  void function(GdaSqlOperation* operation) c_gda_sql_operation_free; ///
  char* function(GdaSqlOperation* operation) c_gda_sql_operation_serialize; ///
  GdaSqlOperation* function(GdaSqlAnyPart* parent) c_gda_sql_operation_new; ///
  GdaSqlOperatorType function(const(char)* op) c_gda_sql_operation_operator_from_string; ///
  const(char)* function(GdaSqlOperatorType op) c_gda_sql_operation_operator_to_string; ///

  // SqlParamSpec
  GdaSqlParamSpec* function(GdaSqlParamSpec* pspec) c_gda_sql_param_spec_copy; ///
  void function(GdaSqlParamSpec* pspec) c_gda_sql_param_spec_free; ///
  char* function(GdaSqlParamSpec* pspec) c_gda_sql_param_spec_serialize; ///
  void function(GdaSqlParamSpec* pspec, GValue* value) c_gda_sql_param_spec_take_descr; ///
  void function(GdaSqlParamSpec* pspec, GValue* value) c_gda_sql_param_spec_take_name; ///
  void function(GdaSqlParamSpec* pspec, GValue* value) c_gda_sql_param_spec_take_nullok; ///
  void function(GdaSqlParamSpec* pspec, GValue* value) c_gda_sql_param_spec_take_type; ///
  GdaSqlParamSpec* function(GValue* simpleSpec) c_gda_sql_param_spec_new; ///

  // SqlParser
  GType function() c_gda_sql_parser_get_type; ///
  GdaSqlParser* function() c_gda_sql_parser_new; ///
  GQuark function() c_gda_sql_parser_error_quark; ///
  GdaBatch* function(GdaSqlParser* parser, const(char)* filename, GError** _err) c_gda_sql_parser_parse_file_as_batch; ///
  GdaStatement* function(GdaSqlParser* parser, const(char)* sql, const(char*)* remain, GError** _err) c_gda_sql_parser_parse_string; ///
  GdaBatch* function(GdaSqlParser* parser, const(char)* sql, const(char*)* remain, GError** _err) c_gda_sql_parser_parse_string_as_batch; ///
  void function(GdaSqlParser* parser) c_gda_sql_parser_set_overflow_error; ///
  void function(GdaSqlParser* parser) c_gda_sql_parser_set_syntax_error; ///

  // SqlSelectField
  GdaSqlSelectField* function(GdaSqlSelectField* field) c_gda_sql_select_field_copy; ///
  void function(GdaSqlSelectField* field) c_gda_sql_select_field_free; ///
  char* function(GdaSqlSelectField* field) c_gda_sql_select_field_serialize; ///
  void function(GdaSqlSelectField* field, GValue* alias_) c_gda_sql_select_field_take_alias; ///
  void function(GdaSqlSelectField* field, GdaSqlExpr* expr) c_gda_sql_select_field_take_expr; ///
  void function(GdaSqlSelectField* field, GValue* value) c_gda_sql_select_field_take_star_value; ///
  GdaSqlSelectField* function(GdaSqlAnyPart* parent) c_gda_sql_select_field_new; ///

  // SqlSelectFrom
  GdaSqlSelectFrom* function(GdaSqlSelectFrom* from) c_gda_sql_select_from_copy; ///
  void function(GdaSqlSelectFrom* from) c_gda_sql_select_from_free; ///
  char* function(GdaSqlSelectFrom* from) c_gda_sql_select_from_serialize; ///
  void function(GdaSqlSelectFrom* from, GdaSqlSelectJoin* join) c_gda_sql_select_from_take_new_join; ///
  void function(GdaSqlSelectFrom* from, GdaSqlSelectTarget* target) c_gda_sql_select_from_take_new_target; ///
  GdaSqlSelectFrom* function(GdaSqlAnyPart* parent) c_gda_sql_select_from_new; ///

  // SqlSelectJoin
  GdaSqlSelectJoin* function(GdaSqlSelectJoin* join) c_gda_sql_select_join_copy; ///
  void function(GdaSqlSelectJoin* join) c_gda_sql_select_join_free; ///
  char* function(GdaSqlSelectJoin* join) c_gda_sql_select_join_serialize; ///
  GdaSqlSelectJoin* function(GdaSqlAnyPart* parent) c_gda_sql_select_join_new; ///
  const(char)* function(GdaSqlSelectJoinType type) c_gda_sql_select_join_type_to_string; ///

  // SqlSelectOrder
  GdaSqlSelectOrder* function(GdaSqlSelectOrder* order) c_gda_sql_select_order_copy; ///
  void function(GdaSqlSelectOrder* order) c_gda_sql_select_order_free; ///
  char* function(GdaSqlSelectOrder* order) c_gda_sql_select_order_serialize; ///
  GdaSqlSelectOrder* function(GdaSqlAnyPart* parent) c_gda_sql_select_order_new; ///

  // SqlSelectTarget
  GdaSqlSelectTarget* function(GdaSqlSelectTarget* target) c_gda_sql_select_target_copy; ///
  void function(GdaSqlSelectTarget* target) c_gda_sql_select_target_free; ///
  char* function(GdaSqlSelectTarget* target) c_gda_sql_select_target_serialize; ///
  void function(GdaSqlSelectTarget* target, GValue* alias_) c_gda_sql_select_target_take_alias; ///
  void function(GdaSqlSelectTarget* target, GdaSqlStatement* stmt) c_gda_sql_select_target_take_select; ///
  void function(GdaSqlSelectTarget* target, GValue* value) c_gda_sql_select_target_take_table_name; ///
  GdaSqlSelectTarget* function(GdaSqlAnyPart* parent) c_gda_sql_select_target_new; ///

  // SqlStatement
  GType function() c_gda_sql_statement_get_type; ///
  GdaSqlStatement* function(GdaSqlStatementType type) c_gda_sql_statement_new; ///
  void function(GdaSqlStatement* stmt) c_gda_sql_statement_check_clean; ///
  gboolean function(GdaSqlStatement* stmt, GError** _err) c_gda_sql_statement_check_structure; ///
  gboolean function(GdaSqlStatement* stmt, GdaConnection* cnc, GError** _err) c_gda_sql_statement_check_validity; ///
  gboolean function(GdaSqlStatement* stmt, GdaMetaStruct* mstruct, GError** _err) c_gda_sql_statement_check_validity_m; ///
  void function(GdaSqlStatement* stmt, GdaSqlStatementCompoundType type) c_gda_sql_statement_compound_set_type; ///
  void function(GdaSqlStatement* stmt, GdaSqlStatement* s) c_gda_sql_statement_compound_take_stmt; ///
  GdaSqlStatement* function(GdaSqlStatement* stmt) c_gda_sql_statement_copy; ///
  void function(GdaSqlStatement* stmt, GdaSqlExpr* cond) c_gda_sql_statement_delete_take_condition; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_delete_take_table_name; ///
  void function(GdaSqlStatement* stmt) c_gda_sql_statement_free; ///
  void function(GdaSqlStatement* stmt, GSList* list) c_gda_sql_statement_insert_take_1_values_list; ///
  void function(GdaSqlStatement* stmt, GSList* list) c_gda_sql_statement_insert_take_extra_values_list; ///
  void function(GdaSqlStatement* stmt, GSList* list) c_gda_sql_statement_insert_take_fields_list; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_insert_take_on_conflict; ///
  void function(GdaSqlStatement* stmt, GdaSqlStatement* select) c_gda_sql_statement_insert_take_select; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_insert_take_table_name; ///
  gboolean function(GdaSqlStatement* stmt, GdaConnection* cnc, GError** _err) c_gda_sql_statement_normalize; ///
  void function(GdaSqlStatement* stmt, gboolean distinct, GdaSqlExpr* distinctExpr) c_gda_sql_statement_select_take_distinct; ///
  void function(GdaSqlStatement* stmt, GSList* exprList) c_gda_sql_statement_select_take_expr_list; ///
  void function(GdaSqlStatement* stmt, GdaSqlSelectFrom* from) c_gda_sql_statement_select_take_from; ///
  void function(GdaSqlStatement* stmt, GSList* groupBy) c_gda_sql_statement_select_take_group_by; ///
  void function(GdaSqlStatement* stmt, GdaSqlExpr* expr) c_gda_sql_statement_select_take_having_cond; ///
  void function(GdaSqlStatement* stmt, GdaSqlExpr* count, GdaSqlExpr* offset) c_gda_sql_statement_select_take_limits; ///
  void function(GdaSqlStatement* stmt, GSList* orderBy) c_gda_sql_statement_select_take_order_by; ///
  void function(GdaSqlStatement* stmt, GdaSqlExpr* expr) c_gda_sql_statement_select_take_where_cond; ///
  char* function(GdaSqlStatement* stmt) c_gda_sql_statement_serialize; ///
  void function(GdaSqlStatement* stmt, GdaTransactionIsolation level) c_gda_sql_statement_trans_set_isol_level; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_trans_take_mode; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_trans_take_name; ///
  void function(GdaSqlStatement* stmt, GSList* expressions) c_gda_sql_statement_unknown_take_expressions; ///
  void function(GdaSqlStatement* stmt, GdaSqlExpr* cond) c_gda_sql_statement_update_take_condition; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_update_take_on_conflict; ///
  void function(GdaSqlStatement* stmt, GValue* fname, GdaSqlExpr* expr) c_gda_sql_statement_update_take_set_value; ///
  void function(GdaSqlStatement* stmt, GValue* value) c_gda_sql_statement_update_take_table_name; ///
  GdaSqlStatementContentsInfo* function(GdaSqlStatementType type) c_gda_sql_statement_get_contents_infos; ///
  GdaSqlStatementType function(const(char)* type) c_gda_sql_statement_string_to_type; ///
  const(char)* function(GdaSqlStatementType type) c_gda_sql_statement_type_to_string; ///

  // SqlTable
  GdaSqlTable* function(GdaSqlTable* table) c_gda_sql_table_copy; ///
  void function(GdaSqlTable* table) c_gda_sql_table_free; ///
  char* function(GdaSqlTable* table) c_gda_sql_table_serialize; ///
  void function(GdaSqlTable* table, GValue* value) c_gda_sql_table_take_name; ///
  GdaSqlTable* function(GdaSqlAnyPart* parent) c_gda_sql_table_new; ///

  // Statement
  GType function() c_gda_statement_get_type; ///
  GdaStatement* function() c_gda_statement_new; ///
  GQuark function() c_gda_statement_error_quark; ///
  gboolean function(GdaStatement* stmt, GError** _err) c_gda_statement_check_structure; ///
  gboolean function(GdaStatement* stmt, GdaConnection* cnc, GError** _err) c_gda_statement_check_validity; ///
  GdaStatement* function(GdaStatement* orig) c_gda_statement_copy; ///
  gboolean function(GdaStatement* stmt, GdaSet** outParams, GError** _err) c_gda_statement_get_parameters; ///
  GdaSqlStatementType function(GdaStatement* stmt) c_gda_statement_get_statement_type; ///
  gboolean function(GdaStatement* stmt) c_gda_statement_is_useless; ///
  gboolean function(GdaStatement* stmt, GdaConnection* cnc, GError** _err) c_gda_statement_normalize; ///
  GdaSqlStatement* function(GdaStatement* stmt, GdaSet* params, gboolean remove, GError** _err) c_gda_statement_rewrite_for_default_values; ///
  char* function(GdaStatement* stmt) c_gda_statement_serialize; ///
  char* function(GdaStatement* stmt, GdaConnection* cnc, GdaSet* params, GdaStatementSqlFlag flags, GSList** paramsUsed, GError** _err) c_gda_statement_to_sql_extended; ///
  char* function(GdaStatement* stmt, GdaSqlRenderingContext* context, GError** _err) c_gda_statement_to_sql_real; ///

  // ThreadWrapper
  GType function() c_gda_thread_wrapper_get_type; ///
  GdaThreadWrapper* function() c_gda_thread_wrapper_new; ///
  GQuark function() c_gda_thread_wrapper_error_quark; ///
  gboolean function(GdaThreadWrapper* wrapper, uint id) c_gda_thread_wrapper_cancel; ///
  gulong function(GdaThreadWrapper* wrapper, void* instance, const(char)* sigName, gboolean privateThread, gboolean privateJob, GdaThreadWrapperCallback callback, void* data) c_gda_thread_wrapper_connect_raw; ///
  void function(GdaThreadWrapper* wrapper, gulong id) c_gda_thread_wrapper_disconnect; ///
  uint function(GdaThreadWrapper* wrapper, GdaThreadWrapperFunc func, void* arg, GDestroyNotify argDestroyFunc, GError** _err) c_gda_thread_wrapper_execute; ///
  uint function(GdaThreadWrapper* wrapper, GdaThreadWrapperVoidFunc func, void* arg, GDestroyNotify argDestroyFunc, GError** _err) c_gda_thread_wrapper_execute_void; ///
  void* function(GdaThreadWrapper* wrapper, gboolean mayLock, uint expId, GError** _err) c_gda_thread_wrapper_fetch_result; ///
  GIOChannel* function(GdaThreadWrapper* wrapper) c_gda_thread_wrapper_get_io_channel; ///
  int function(GdaThreadWrapper* wrapper) c_gda_thread_wrapper_get_waiting_size; ///
  void function(GdaThreadWrapper* wrapper, gboolean mayBlock) c_gda_thread_wrapper_iterate; ///
  void function(GdaThreadWrapper* wrapper, gulong id) c_gda_thread_wrapper_steal_signal; ///
  void function(GdaThreadWrapper* wrapper) c_gda_thread_wrapper_unset_io_channel; ///

  // Time
  GType function() c_gda_time_get_type; ///
  void function(GdaTime* time, glong ntz) c_gda_time_change_timezone; ///
  gboolean function(const(GdaTime)* time) c_gda_time_valid; ///
  void* function(void* boxed) c_gda_time_copy; ///
  void function(void* boxed) c_gda_time_free; ///

  // Timestamp
  GType function() c_gda_timestamp_get_type; ///
  void function(GdaTimestamp* ts, glong ntz) c_gda_timestamp_change_timezone; ///
  gboolean function(const(GdaTimestamp)* timestamp) c_gda_timestamp_valid; ///
  void* function(void* boxed) c_gda_timestamp_copy; ///
  void function(void* boxed) c_gda_timestamp_free; ///

  // TransactionStatus
  GType function() c_gda_transaction_status_get_type; ///
  GdaTransactionStatus* function(const(char)* name) c_gda_transaction_status_new; ///
  GdaTransactionStatusEvent* function(GdaTransactionStatus* tstatus, const(char)* sql, GdaConnectionEvent* connEvent) c_gda_transaction_status_add_event_sql; ///
  GdaTransactionStatusEvent* function(GdaTransactionStatus* tstatus, GdaTransactionStatus* subTrans) c_gda_transaction_status_add_event_sub; ///
  GdaTransactionStatusEvent* function(GdaTransactionStatus* tstatus, const(char)* svpName) c_gda_transaction_status_add_event_svp; ///
  GdaTransactionStatus* function(GdaTransactionStatus* tstatus, const(char)* str, GdaTransactionStatusEvent** destev) c_gda_transaction_status_find; ///
  GdaTransactionStatus* function(GdaTransactionStatus* tstatus, GdaTransactionStatusEvent** destev, gboolean unnamedOnly) c_gda_transaction_status_find_current; ///
  void function(GdaTransactionStatus* tstatus, GdaTransactionStatusEvent* event, gboolean freeAfter) c_gda_transaction_status_free_events; ///

  // Tree
  GType function() c_gda_tree_get_type; ///
  GdaTree* function() c_gda_tree_new; ///
  GQuark function() c_gda_tree_error_quark; ///
  void function(GdaTree* tree, GdaTreeManager* manager) c_gda_tree_add_manager; ///
  void function(GdaTree* tree) c_gda_tree_clean; ///
  void function(GdaTree* tree, GdaTreeNode* node, void* stream) c_gda_tree_dump; ///
  GdaTreeNode* function(GdaTree* tree, const(char)* treePath, gboolean useNames) c_gda_tree_get_node; ///
  GdaTreeManager* function(GdaTree* tree, GdaTreeNode* node) c_gda_tree_get_node_manager; ///
  char* function(GdaTree* tree, GdaTreeNode* node) c_gda_tree_get_node_path; ///
  GSList* function(GdaTree* tree, const(char)* treePath, gboolean useNames) c_gda_tree_get_nodes_in_path; ///
  void function(GdaTree* tree, const(char)* attribute, const(GValue)* value, GDestroyNotify destroy) c_gda_tree_set_attribute; ///
  gboolean function(GdaTree* tree, GError** _err) c_gda_tree_update_all; ///
  gboolean function(GdaTree* tree, GdaTreeNode* node, GError** _err) c_gda_tree_update_children; ///
  gboolean function(GdaTree* tree, GdaTreeNode* node, GError** _err) c_gda_tree_update_part; ///

  // TreeManager
  GType function() c_gda_tree_manager_get_type; ///
  GdaTreeManager* function(GdaTreeManagerNodesFunc updateFunc) c_gda_tree_manager_new_with_func; ///
  GQuark function() c_gda_tree_manager_error_quark; ///
  void function(GdaTreeManager* manager, GdaTreeManager* sub) c_gda_tree_manager_add_manager; ///
  void function(GdaTreeManager* manager, const(char)* attribute, const(GValue)* value) c_gda_tree_manager_add_new_node_attribute; ///
  GdaTreeNode* function(GdaTreeManager* manager, GdaTreeNode* parent, const(char)* name) c_gda_tree_manager_create_node; ///
  const(GSList)* function(GdaTreeManager* manager) c_gda_tree_manager_get_managers; ///
  GdaTreeManagerNodeFunc function(GdaTreeManager* manager) c_gda_tree_manager_get_node_create_func; ///
  void function(GdaTreeManager* manager, GdaTreeManagerNodeFunc func) c_gda_tree_manager_set_node_create_func; ///

  // TreeMgrColumns
  GType function() c_gda_tree_mgr_columns_get_type; ///
  GdaTreeManager* function(GdaConnection* cnc, const(char)* schema, const(char)* tableName) c_gda_tree_mgr_columns_new; ///

  // TreeMgrLabel
  GType function() c_gda_tree_mgr_label_get_type; ///
  GdaTreeManager* function(const(char)* label) c_gda_tree_mgr_label_new; ///

  // TreeMgrSchemas
  GType function() c_gda_tree_mgr_schemas_get_type; ///
  GdaTreeManager* function(GdaConnection* cnc) c_gda_tree_mgr_schemas_new; ///

  // TreeMgrSelect
  GType function() c_gda_tree_mgr_select_get_type; ///
  GdaTreeManager* function(GdaConnection* cnc, GdaStatement* stmt, GdaSet* params) c_gda_tree_mgr_select_new; ///

  // TreeMgrTables
  GType function() c_gda_tree_mgr_tables_get_type; ///
  GdaTreeManager* function(GdaConnection* cnc, const(char)* schema) c_gda_tree_mgr_tables_new; ///

  // TreeNode
  GType function() c_gda_tree_node_get_type; ///
  GdaTreeNode* function(const(char)* name) c_gda_tree_node_new; ///
  GQuark function() c_gda_tree_node_error_quark; ///
  const(GValue)* function(GdaTreeNode* node, const(char)* attribute) c_gda_tree_node_fetch_attribute; ///
  GdaTreeNode* function(GdaTreeNode* node, int index) c_gda_tree_node_get_child_index; ///
  GdaTreeNode* function(GdaTreeNode* node, const(char)* name) c_gda_tree_node_get_child_name; ///
  GSList* function(GdaTreeNode* node) c_gda_tree_node_get_children; ///
  const(GValue)* function(GdaTreeNode* node, const(char)* attribute) c_gda_tree_node_get_node_attribute; ///
  GdaTreeNode* function(GdaTreeNode* node) c_gda_tree_node_get_parent; ///
  void function(GdaTreeNode* node, const(char)* attribute, const(GValue)* value, GDestroyNotify destroy) c_gda_tree_node_set_node_attribute; ///

  // UShort
  GType function() c_gda_ushort_get_type; ///

  // XaTransaction
  GType function() c_gda_xa_transaction_get_type; ///
  GdaXaTransaction* function(uint format, const(char)* globalTransactionId) c_gda_xa_transaction_new; ///
  GQuark function() c_gda_xa_transaction_error_quark; ///
  GdaXaTransactionId* function(const(char)* str) c_gda_xa_transaction_string_to_id; ///
  gboolean function(GdaXaTransaction* xaTrans, GError** _err) c_gda_xa_transaction_begin; ///
  gboolean function(GdaXaTransaction* xaTrans, GSList** cncToRecover, GError** _err) c_gda_xa_transaction_commit; ///
  gboolean function(GdaXaTransaction* xaTrans, GSList** cncToRecover, GError** _err) c_gda_xa_transaction_commit_recovered; ///
  gboolean function(GdaXaTransaction* xaTrans, GdaConnection* cnc, const(char)* branch, GError** _err) c_gda_xa_transaction_register_connection; ///
  gboolean function(GdaXaTransaction* xaTrans, GError** _err) c_gda_xa_transaction_rollback; ///
  void function(GdaXaTransaction* xaTrans, GdaConnection* cnc) c_gda_xa_transaction_unregister_connection; ///

  // XaTransactionId
  char* function(const(GdaXaTransactionId)* xid) c_gda_xa_transaction_id_to_string; ///

  // global
  char* function(const(char)* string_) c_gda_default_escape_string; ///
  char* function(const(char)* string_) c_gda_default_unescape_string; ///
  char* function(char* text) c_gda_alphanum_to_text; ///
  char** function(GdaConnection* cnc, const(char)* sql, int start, int end) c_gda_completion_list_get; ///
  gboolean function(GdaConnection* cnc, GdaStatement* selectStmt, gboolean requirePk, GdaStatement** insertStmt, GdaStatement** updateStmt, GdaStatement** deleteStmt, GError** _err) c_gda_compute_dml_statements; ///
  GdaSqlStatement* function(GdaStatement* updateStmt, GError** _err) c_gda_compute_select_statement_from_update; ///
  GdaSqlExpr* function(GdaSqlStatementSelect* stsel, GdaMetaTable* mtable, gboolean requirePk, GError** _err) c_gda_compute_unique_table_row_condition; ///
  GdaSqlExpr* function(GdaConnection* cnc, GdaSqlStatementSelect* stsel, GdaMetaTable* mtable, gboolean requirePk, GError** _err) c_gda_compute_unique_table_row_condition_with_cnc; ///
  void function(const(char)* string_, char** outDsn, char** outUsername, char** outPassword) c_gda_dsn_split; ///
  GType function(const(char)* str) c_gda_g_type_from_string; ///
  const(char)* function(GType type) c_gda_g_type_to_string; ///
  char* function(const(char)* appName) c_gda_get_application_exec_path; ///
  gboolean function(const(char)* id1, const(char)* id2) c_gda_identifier_equal; ///
  uint function(const(char)* id) c_gda_identifier_hash; ///
  void function() c_gda_init; ///
  void function() c_gda_locale_changed; ///
  void function() c_gda_log_disable; ///
  void function() c_gda_log_enable; ///
  void function(const(char)* format,  ...) c_gda_log_error; ///
  gboolean function() c_gda_log_is_enabled; ///
  void function(const(char)* format,  ...) c_gda_log_message; ///
  void function(GdaMutex* mutex) c_gda_mutex_free; ///
  void function(GdaMutex* mutex) c_gda_mutex_lock; ///
  GdaMutex* function() c_gda_mutex_new; ///
  gboolean function(GdaMutex* mutex) c_gda_mutex_trylock; ///
  void function(GdaMutex* mutex) c_gda_mutex_unlock; ///
  gboolean function(GDate* gdate, const(char)* value, GDateDMY first, GDateDMY second, GDateDMY third, char sep) c_gda_parse_formatted_date; ///
  gboolean function(GdaTime* timegda, const(char)* value, char sep) c_gda_parse_formatted_time; ///
  gboolean function(GdaTimestamp* timestamp, const(char)* value, GDateDMY first, GDateDMY second, GDateDMY third, char sep) c_gda_parse_formatted_timestamp; ///
  gboolean function(GDate* gdate, const(char)* value) c_gda_parse_iso8601_date; ///
  gboolean function(GdaTime* timegda, const(char)* value) c_gda_parse_iso8601_time; ///
  gboolean function(GdaTimestamp* timestamp, const(char)* value) c_gda_parse_iso8601_timestamp; ///
  GdaSqlStatement* function(GdaSqlStatement* sqlst, GdaSet* params, gboolean* outModified, GError** _err) c_gda_rewrite_sql_statement_for_null_parameters; ///
  gboolean function(GdaStatement* stmt, GdaSet* params, GdaStatement** outStmt, GError** _err) c_gda_rewrite_statement_for_null_parameters; ///
  gboolean function(char* string_) c_gda_rfc1738_decode; ///
  char* function(const(char)* string_) c_gda_rfc1738_encode; ///
  GdaStatement* function(GdaStatement* stmt, GError** _err) c_gda_select_alter_select_for_empty; ///
  GQuark function() c_gda_sql_error_quark; ///
  char* function(const(char)* str) c_gda_sql_identifier_force_quotes; ///
  char* function(char* str) c_gda_sql_identifier_prepare_for_compare; ///
  char* function(const(char)* id, GdaConnection* cnc, GdaServerProvider* prov, gboolean metaStoreConvention, gboolean forceQuotes) c_gda_sql_identifier_quote; ///
  char** function(const(char)* id) c_gda_sql_identifier_split; ///
  char* function(const(GValue)* value) c_gda_sql_value_stringify; ///
  GdaBinary* function(const(char)* str) c_gda_string_to_binary; ///
  GdaBlob* function(const(char)* str) c_gda_string_to_blob; ///
  char* function(const(char)* text) c_gda_text_to_alphanum; ///
  gboolean function(GdaDataModel* model, int nbcols,  ...) c_gda_utility_check_data_model; ///
  gboolean function(GdaDataModel* model, int nbcols, GType* types) c_gda_utility_check_data_model_v; ///
  gboolean function(GdaDataModel* model, xmlNodePtr parent, const(int)* cols, int nbCols, const(int)* rows, int nbRows, gboolean useColIds) c_gda_utility_data_model_dump_data_to_xml; ///
  const(char)* function(GdaDataSelect* model, const(char)* fieldName) c_gda_utility_data_model_find_column_description; ///
  gboolean function(GdaHolder* holder, xmlNodePtr node, GSList* sources, GError** _err) c_gda_utility_holder_load_attributes; ///
  int function(const(GValue)* value1, const(GValue)* value2) c_gda_value_compare; ///
  GValue* function(const(GValue)* value) c_gda_value_copy; ///
  int function(const(GValue)* value1, const(GValue)* value2) c_gda_value_differ; ///
  void function(GValue* value) c_gda_value_free; ///
  const(GdaBinary)* function(const(GValue)* value) c_gda_value_get_binary; ///
  const(GdaBlob)* function(const(GValue)* value) c_gda_value_get_blob; ///
  const(GdaGeometricPoint)* function(const(GValue)* value) c_gda_value_get_geometric_point; ///
  const(GdaNumeric)* function(const(GValue)* value) c_gda_value_get_numeric; ///
  short function(const(GValue)* value) c_gda_value_get_short; ///
  const(GdaTime)* function(const(GValue)* value) c_gda_value_get_time; ///
  const(GdaTimestamp)* function(const(GValue)* value) c_gda_value_get_timestamp; ///
  ushort function(const(GValue)* value) c_gda_value_get_ushort; ///
  gboolean function(const(GValue)* value) c_gda_value_is_null; ///
  gboolean function(const(GValue)* value) c_gda_value_is_number; ///
  GValue* function(GType type) c_gda_value_new; ///
  GValue* function(const(ubyte)* val, glong size) c_gda_value_new_binary; ///
  GValue* function(const(ubyte)* val, glong size) c_gda_value_new_blob; ///
  GValue* function(const(char)* filename) c_gda_value_new_blob_from_file; ///
  GValue* function(const(char)* defaultVal) c_gda_value_new_default; ///
  GValue* function(const(char)* asString, GType type) c_gda_value_new_from_string; ///
  GValue* function(xmlNodePtr node) c_gda_value_new_from_xml; ///
  GValue* function() c_gda_value_new_null; ///
  GValue* function(long val) c_gda_value_new_timestamp_from_timet; ///
  void function(GValue* value, GType type) c_gda_value_reset_with_type; ///
  void function(GValue* value, const(GdaBinary)* binary) c_gda_value_set_binary; ///
  void function(GValue* value, const(GdaBlob)* blob) c_gda_value_set_blob; ///
  gboolean function(GValue* value, const(char)* asString, GType type) c_gda_value_set_from_string; ///
  gboolean function(GValue* value, const(GValue)* from) c_gda_value_set_from_value; ///
  void function(GValue* value, const(GdaGeometricPoint)* val) c_gda_value_set_geometric_point; ///
  void function(GValue* value) c_gda_value_set_null; ///
  void function(GValue* value, const(GdaNumeric)* val) c_gda_value_set_numeric; ///
  void function(GValue* value, short val) c_gda_value_set_short; ///
  void function(GValue* value, const(GdaTime)* val) c_gda_value_set_time; ///
  void function(GValue* value, const(GdaTimestamp)* val) c_gda_value_set_timestamp; ///
  void function(GValue* value, ushort val) c_gda_value_set_ushort; ///
  char* function(const(GValue)* value) c_gda_value_stringify; ///
  void function(GValue* value, GdaBinary* binary) c_gda_value_take_binary; ///
  void function(GValue* value, GdaBlob* blob) c_gda_value_take_blob; ///
  xmlNodePtr function(const(GValue)* value) c_gda_value_to_xml; ///
}

// AttributesManager

/** */
alias gda_attributes_manager_clear = c_gda_attributes_manager_clear;

/** */
alias gda_attributes_manager_copy = c_gda_attributes_manager_copy;

/** */
alias gda_attributes_manager_foreach = c_gda_attributes_manager_foreach;

/** */
alias gda_attributes_manager_free = c_gda_attributes_manager_free;

/** */
alias gda_attributes_manager_get = c_gda_attributes_manager_get;

/** */
alias gda_attributes_manager_set = c_gda_attributes_manager_set;

/** */
alias gda_attributes_manager_set_full = c_gda_attributes_manager_set_full;

/** */
alias gda_attributes_manager_new = c_gda_attributes_manager_new;

// Batch

/** */
alias gda_batch_get_type = c_gda_batch_get_type;

/** */
alias gda_batch_new = c_gda_batch_new;

/** */
alias gda_batch_error_quark = c_gda_batch_error_quark;

/** */
alias gda_batch_add_statement = c_gda_batch_add_statement;

/** */
alias gda_batch_copy = c_gda_batch_copy;

/** */
alias gda_batch_get_parameters = c_gda_batch_get_parameters;

/** */
alias gda_batch_get_statements = c_gda_batch_get_statements;

/** */
alias gda_batch_remove_statement = c_gda_batch_remove_statement;

/** */
alias gda_batch_serialize = c_gda_batch_serialize;

// Binary

/** */
alias gda_binary_get_type = c_gda_binary_get_type;

/** */
alias gda_binary_to_string = c_gda_binary_to_string;

/** */
alias gda_binary_copy = c_gda_binary_copy;

/** */
alias gda_binary_free = c_gda_binary_free;

// Blob

/** */
alias gda_blob_get_type = c_gda_blob_get_type;

/** */
alias gda_blob_set_op = c_gda_blob_set_op;

/** */
alias gda_blob_to_string = c_gda_blob_to_string;

/** */
alias gda_blob_copy = c_gda_blob_copy;

/** */
alias gda_blob_free = c_gda_blob_free;

// BlobOp

/** */
alias gda_blob_op_get_type = c_gda_blob_op_get_type;

/** */
alias gda_blob_op_get_length = c_gda_blob_op_get_length;

/** */
alias gda_blob_op_read = c_gda_blob_op_read;

/** */
alias gda_blob_op_read_all = c_gda_blob_op_read_all;

/** */
alias gda_blob_op_write = c_gda_blob_op_write;

/** */
alias gda_blob_op_write_all = c_gda_blob_op_write_all;

// Column

/** */
alias gda_column_get_type = c_gda_column_get_type;

/** */
alias gda_column_new = c_gda_column_new;

/** */
alias gda_column_copy = c_gda_column_copy;

/** */
alias gda_column_get_allow_null = c_gda_column_get_allow_null;

/** */
alias gda_column_get_attribute = c_gda_column_get_attribute;

/** */
alias gda_column_get_auto_increment = c_gda_column_get_auto_increment;

/** */
alias gda_column_get_dbms_type = c_gda_column_get_dbms_type;

/** */
alias gda_column_get_default_value = c_gda_column_get_default_value;

/** */
alias gda_column_get_description = c_gda_column_get_description;

/** */
alias gda_column_get_g_type = c_gda_column_get_g_type;

/** */
alias gda_column_get_name = c_gda_column_get_name;

/** */
alias gda_column_get_position = c_gda_column_get_position;

/** */
alias gda_column_set_allow_null = c_gda_column_set_allow_null;

/** */
alias gda_column_set_attribute = c_gda_column_set_attribute;

/** */
alias gda_column_set_auto_increment = c_gda_column_set_auto_increment;

/** */
alias gda_column_set_dbms_type = c_gda_column_set_dbms_type;

/** */
alias gda_column_set_default_value = c_gda_column_set_default_value;

/** */
alias gda_column_set_description = c_gda_column_set_description;

/** */
alias gda_column_set_g_type = c_gda_column_set_g_type;

/** */
alias gda_column_set_name = c_gda_column_set_name;

/** */
alias gda_column_set_position = c_gda_column_set_position;

// Config

/** */
alias gda_config_get_type = c_gda_config_get_type;

/** */
alias gda_config_can_modify_system_config = c_gda_config_can_modify_system_config;

/** */
alias gda_config_define_dsn = c_gda_config_define_dsn;

/** */
alias gda_config_dsn_needs_authentication = c_gda_config_dsn_needs_authentication;

/** */
alias gda_config_error_quark = c_gda_config_error_quark;

/** */
alias gda_config_get = c_gda_config_get;

/** */
alias gda_config_get_dsn_info = c_gda_config_get_dsn_info;

/** */
alias gda_config_get_dsn_info_at_index = c_gda_config_get_dsn_info_at_index;

/** */
alias gda_config_get_dsn_info_index = c_gda_config_get_dsn_info_index;

/** */
alias gda_config_get_nb_dsn = c_gda_config_get_nb_dsn;

/** */
alias gda_config_get_provider = c_gda_config_get_provider;

/** */
alias gda_config_get_provider_info = c_gda_config_get_provider_info;

/** */
alias gda_config_list_dsn = c_gda_config_list_dsn;

/** */
alias gda_config_list_providers = c_gda_config_list_providers;

/** */
alias gda_config_remove_dsn = c_gda_config_remove_dsn;

// Connection

/** */
alias gda_connection_get_type = c_gda_connection_get_type;

/** */
alias gda_connection_new_from_dsn = c_gda_connection_new_from_dsn;

/** */
alias gda_connection_new_from_string = c_gda_connection_new_from_string;

/** */
alias gda_connection_error_quark = c_gda_connection_error_quark;

/** */
alias gda_connection_open_from_dsn = c_gda_connection_open_from_dsn;

/** */
alias gda_connection_open_from_string = c_gda_connection_open_from_string;

/** */
alias gda_connection_open_sqlite = c_gda_connection_open_sqlite;

/** */
alias gda_connection_string_split = c_gda_connection_string_split;

/** */
alias gda_connection_add_event = c_gda_connection_add_event;

/** */
alias gda_connection_add_event_string = c_gda_connection_add_event_string;

/** */
alias gda_connection_add_prepared_statement = c_gda_connection_add_prepared_statement;

/** */
alias gda_connection_add_savepoint = c_gda_connection_add_savepoint;

/** */
alias gda_connection_async_cancel = c_gda_connection_async_cancel;

/** */
alias gda_connection_async_fetch_result = c_gda_connection_async_fetch_result;

/** */
alias gda_connection_async_statement_execute = c_gda_connection_async_statement_execute;

/** */
alias gda_connection_batch_execute = c_gda_connection_batch_execute;

/** */
alias gda_connection_begin_transaction = c_gda_connection_begin_transaction;

/** */
alias gda_connection_clear_events_list = c_gda_connection_clear_events_list;

/** */
alias gda_connection_close = c_gda_connection_close;

/** */
alias gda_connection_close_no_warning = c_gda_connection_close_no_warning;

/** */
alias gda_connection_commit_transaction = c_gda_connection_commit_transaction;

/** */
alias gda_connection_create_operation = c_gda_connection_create_operation;

/** */
alias gda_connection_create_parser = c_gda_connection_create_parser;

/** */
alias gda_connection_del_prepared_statement = c_gda_connection_del_prepared_statement;

/** */
alias gda_connection_delete_row_from_table = c_gda_connection_delete_row_from_table;

/** */
alias gda_connection_delete_savepoint = c_gda_connection_delete_savepoint;

/** */
alias gda_connection_execute_non_select_command = c_gda_connection_execute_non_select_command;

/** */
alias gda_connection_execute_select_command = c_gda_connection_execute_select_command;

/** */
alias gda_connection_get_authentication = c_gda_connection_get_authentication;

/** */
alias gda_connection_get_cnc_string = c_gda_connection_get_cnc_string;

/** */
alias gda_connection_get_date_format = c_gda_connection_get_date_format;

/** */
alias gda_connection_get_dsn = c_gda_connection_get_dsn;

/** */
alias gda_connection_get_events = c_gda_connection_get_events;

/** */
alias gda_connection_get_meta_store = c_gda_connection_get_meta_store;

/** */
alias gda_connection_get_meta_store_data = c_gda_connection_get_meta_store_data;

/** */
alias gda_connection_get_meta_store_data_v = c_gda_connection_get_meta_store_data_v;

/** */
alias gda_connection_get_options = c_gda_connection_get_options;

/** */
alias gda_connection_get_prepared_statement = c_gda_connection_get_prepared_statement;

/** */
alias gda_connection_get_provider = c_gda_connection_get_provider;

/** */
alias gda_connection_get_provider_name = c_gda_connection_get_provider_name;

/** */
alias gda_connection_get_transaction_status = c_gda_connection_get_transaction_status;

/** */
alias gda_connection_insert_row_into_table = c_gda_connection_insert_row_into_table;

/** */
alias gda_connection_insert_row_into_table_v = c_gda_connection_insert_row_into_table_v;

/** */
alias gda_connection_internal_change_transaction_state = c_gda_connection_internal_change_transaction_state;

/** */
alias gda_connection_internal_get_provider_data = c_gda_connection_internal_get_provider_data;

/** */
alias gda_connection_internal_get_provider_data_error = c_gda_connection_internal_get_provider_data_error;

/** */
alias gda_connection_internal_reset_transaction_status = c_gda_connection_internal_reset_transaction_status;

/** */
alias gda_connection_internal_savepoint_added = c_gda_connection_internal_savepoint_added;

/** */
alias gda_connection_internal_savepoint_removed = c_gda_connection_internal_savepoint_removed;

/** */
alias gda_connection_internal_savepoint_rolledback = c_gda_connection_internal_savepoint_rolledback;

/** */
alias gda_connection_internal_set_provider_data = c_gda_connection_internal_set_provider_data;

/** */
alias gda_connection_internal_statement_executed = c_gda_connection_internal_statement_executed;

/** */
alias gda_connection_internal_transaction_committed = c_gda_connection_internal_transaction_committed;

/** */
alias gda_connection_internal_transaction_rolledback = c_gda_connection_internal_transaction_rolledback;

/** */
alias gda_connection_internal_transaction_started = c_gda_connection_internal_transaction_started;

/** */
alias gda_connection_is_opened = c_gda_connection_is_opened;

/** */
alias gda_connection_open = c_gda_connection_open;

/** */
alias gda_connection_parse_sql_string = c_gda_connection_parse_sql_string;

/** */
alias gda_connection_perform_operation = c_gda_connection_perform_operation;

/** */
alias gda_connection_point_available_event = c_gda_connection_point_available_event;

/** */
alias gda_connection_quote_sql_identifier = c_gda_connection_quote_sql_identifier;

/** */
alias gda_connection_repetitive_statement_execute = c_gda_connection_repetitive_statement_execute;

/** */
alias gda_connection_rollback_savepoint = c_gda_connection_rollback_savepoint;

/** */
alias gda_connection_rollback_transaction = c_gda_connection_rollback_transaction;

/** */
alias gda_connection_statement_execute = c_gda_connection_statement_execute;

/** */
alias gda_connection_statement_execute_non_select = c_gda_connection_statement_execute_non_select;

/** */
alias gda_connection_statement_execute_select = c_gda_connection_statement_execute_select;

/** */
alias gda_connection_statement_execute_select_full = c_gda_connection_statement_execute_select_full;

/** */
alias gda_connection_statement_execute_select_fullv = c_gda_connection_statement_execute_select_fullv;

/** */
alias gda_connection_statement_prepare = c_gda_connection_statement_prepare;

/** */
alias gda_connection_statement_to_sql = c_gda_connection_statement_to_sql;

/** */
alias gda_connection_supports_feature = c_gda_connection_supports_feature;

/** */
alias gda_connection_update_meta_store = c_gda_connection_update_meta_store;

/** */
alias gda_connection_update_row_in_table = c_gda_connection_update_row_in_table;

/** */
alias gda_connection_update_row_in_table_v = c_gda_connection_update_row_in_table_v;

/** */
alias gda_connection_value_to_sql_string = c_gda_connection_value_to_sql_string;

// ConnectionEvent

/** */
alias gda_connection_event_get_type = c_gda_connection_event_get_type;

/** */
alias gda_connection_event_get_code = c_gda_connection_event_get_code;

/** */
alias gda_connection_event_get_description = c_gda_connection_event_get_description;

/** */
alias gda_connection_event_get_event_type = c_gda_connection_event_get_event_type;

/** */
alias gda_connection_event_get_gda_code = c_gda_connection_event_get_gda_code;

/** */
alias gda_connection_event_get_source = c_gda_connection_event_get_source;

/** */
alias gda_connection_event_get_sqlstate = c_gda_connection_event_get_sqlstate;

/** */
alias gda_connection_event_set_code = c_gda_connection_event_set_code;

/** */
alias gda_connection_event_set_description = c_gda_connection_event_set_description;

/** */
alias gda_connection_event_set_event_type = c_gda_connection_event_set_event_type;

/** */
alias gda_connection_event_set_gda_code = c_gda_connection_event_set_gda_code;

/** */
alias gda_connection_event_set_source = c_gda_connection_event_set_source;

/** */
alias gda_connection_event_set_sqlstate = c_gda_connection_event_set_sqlstate;

// DataAccessWrapper

/** */
alias gda_data_access_wrapper_get_type = c_gda_data_access_wrapper_get_type;

/** */
alias gda_data_access_wrapper_new = c_gda_data_access_wrapper_new;

/** */
alias gda_data_access_wrapper_set_mapping = c_gda_data_access_wrapper_set_mapping;

// DataComparator

/** */
alias gda_data_comparator_get_type = c_gda_data_comparator_get_type;

/** */
alias gda_data_comparator_new = c_gda_data_comparator_new;

/** */
alias gda_data_comparator_error_quark = c_gda_data_comparator_error_quark;

/** */
alias gda_data_comparator_compute_diff = c_gda_data_comparator_compute_diff;

/** */
alias gda_data_comparator_get_diff = c_gda_data_comparator_get_diff;

/** */
alias gda_data_comparator_get_n_diffs = c_gda_data_comparator_get_n_diffs;

/** */
alias gda_data_comparator_set_key_columns = c_gda_data_comparator_set_key_columns;

// DataHandler

/** */
alias gda_data_handler_get_type = c_gda_data_handler_get_type;

/** */
alias gda_data_handler_get_default = c_gda_data_handler_get_default;

/** */
alias gda_data_handler_accepts_g_type = c_gda_data_handler_accepts_g_type;

/** */
alias gda_data_handler_get_descr = c_gda_data_handler_get_descr;

/** */
alias gda_data_handler_get_sane_init_value = c_gda_data_handler_get_sane_init_value;

/** */
alias gda_data_handler_get_sql_from_value = c_gda_data_handler_get_sql_from_value;

/** */
alias gda_data_handler_get_str_from_value = c_gda_data_handler_get_str_from_value;

/** */
alias gda_data_handler_get_value_from_sql = c_gda_data_handler_get_value_from_sql;

/** */
alias gda_data_handler_get_value_from_str = c_gda_data_handler_get_value_from_str;

// DataModel

/** */
alias gda_data_model_get_type = c_gda_data_model_get_type;

/** */
alias gda_data_model_error_quark = c_gda_data_model_error_quark;

/** */
alias gda_data_model_add_data_from_xml_node = c_gda_data_model_add_data_from_xml_node;

/** */
alias gda_data_model_append_row = c_gda_data_model_append_row;

/** */
alias gda_data_model_append_values = c_gda_data_model_append_values;

/** */
alias gda_data_model_array_copy_model = c_gda_data_model_array_copy_model;

/** */
alias gda_data_model_array_copy_model_ext = c_gda_data_model_array_copy_model_ext;

/** */
alias gda_data_model_create_iter = c_gda_data_model_create_iter;

/** */
alias gda_data_model_describe_column = c_gda_data_model_describe_column;

/** */
alias gda_data_model_dump = c_gda_data_model_dump;

/** */
alias gda_data_model_dump_as_string = c_gda_data_model_dump_as_string;

/** */
alias gda_data_model_export_to_file = c_gda_data_model_export_to_file;

/** */
alias gda_data_model_export_to_string = c_gda_data_model_export_to_string;

/** */
alias gda_data_model_freeze = c_gda_data_model_freeze;

/** */
alias gda_data_model_get_access_flags = c_gda_data_model_get_access_flags;

/** */
alias gda_data_model_get_attributes_at = c_gda_data_model_get_attributes_at;

/** */
alias gda_data_model_get_column_index = c_gda_data_model_get_column_index;

/** */
alias gda_data_model_get_column_name = c_gda_data_model_get_column_name;

/** */
alias gda_data_model_get_column_title = c_gda_data_model_get_column_title;

/** */
alias gda_data_model_get_exceptions = c_gda_data_model_get_exceptions;

/** */
alias gda_data_model_get_n_columns = c_gda_data_model_get_n_columns;

/** */
alias gda_data_model_get_n_rows = c_gda_data_model_get_n_rows;

/** */
alias gda_data_model_get_notify = c_gda_data_model_get_notify;

/** */
alias gda_data_model_get_row_from_values = c_gda_data_model_get_row_from_values;

/** */
alias gda_data_model_get_typed_value_at = c_gda_data_model_get_typed_value_at;

/** */
alias gda_data_model_get_value_at = c_gda_data_model_get_value_at;

/** */
alias gda_data_model_import_from_file = c_gda_data_model_import_from_file;

/** */
alias gda_data_model_import_from_model = c_gda_data_model_import_from_model;

/** */
alias gda_data_model_import_from_string = c_gda_data_model_import_from_string;

/** */
alias gda_data_model_iter_at_row = c_gda_data_model_iter_at_row;

/** */
alias gda_data_model_iter_move_next_default = c_gda_data_model_iter_move_next_default;

/** */
alias gda_data_model_iter_move_prev_default = c_gda_data_model_iter_move_prev_default;

/** */
alias gda_data_model_iter_move_to_row_default = c_gda_data_model_iter_move_to_row_default;

/** */
alias gda_data_model_iter_next = c_gda_data_model_iter_next;

/** */
alias gda_data_model_iter_prev = c_gda_data_model_iter_prev;

/** */
alias gda_data_model_iter_set_value = c_gda_data_model_iter_set_value;

/** */
alias gda_data_model_remove_row = c_gda_data_model_remove_row;

/** */
alias gda_data_model_reset = c_gda_data_model_reset;

/** */
alias gda_data_model_row_inserted = c_gda_data_model_row_inserted;

/** */
alias gda_data_model_row_removed = c_gda_data_model_row_removed;

/** */
alias gda_data_model_row_updated = c_gda_data_model_row_updated;

/** */
alias gda_data_model_send_hint = c_gda_data_model_send_hint;

/** */
alias gda_data_model_set_column_name = c_gda_data_model_set_column_name;

/** */
alias gda_data_model_set_column_title = c_gda_data_model_set_column_title;

/** */
alias gda_data_model_set_notify = c_gda_data_model_set_notify;

/** */
alias gda_data_model_set_value_at = c_gda_data_model_set_value_at;

/** */
alias gda_data_model_set_values = c_gda_data_model_set_values;

/** */
alias gda_data_model_thaw = c_gda_data_model_thaw;

// DataModelArray

/** */
alias gda_data_model_array_get_type = c_gda_data_model_array_get_type;

/** */
alias gda_data_model_array_new = c_gda_data_model_array_new;

/** */
alias gda_data_model_array_new_with_g_types = c_gda_data_model_array_new_with_g_types;

/** */
alias gda_data_model_array_new_with_g_types_v = c_gda_data_model_array_new_with_g_types_v;

/** */
alias gda_data_model_array_clear = c_gda_data_model_array_clear;

/** */
alias gda_data_model_array_get_row = c_gda_data_model_array_get_row;

/** */
alias gda_data_model_array_set_n_columns = c_gda_data_model_array_set_n_columns;

// DataModelDir

/** */
alias gda_data_model_dir_get_type = c_gda_data_model_dir_get_type;

/** */
alias gda_data_model_dir_new = c_gda_data_model_dir_new;

/** */
alias gda_data_model_dir_clean_errors = c_gda_data_model_dir_clean_errors;

/** */
alias gda_data_model_dir_get_errors = c_gda_data_model_dir_get_errors;

// DataModelImport

/** */
alias gda_data_model_import_get_type = c_gda_data_model_import_get_type;

/** */
alias gda_data_model_import_new_file = c_gda_data_model_import_new_file;

/** */
alias gda_data_model_import_new_mem = c_gda_data_model_import_new_mem;

/** */
alias gda_data_model_import_new_xml_node = c_gda_data_model_import_new_xml_node;

/** */
alias gda_data_model_import_clean_errors = c_gda_data_model_import_clean_errors;

/** */
alias gda_data_model_import_get_errors = c_gda_data_model_import_get_errors;

// DataModelIter

/** */
alias gda_data_model_iter_get_type = c_gda_data_model_iter_get_type;

/** */
alias gda_data_model_iter_error_quark = c_gda_data_model_iter_error_quark;

/** */
alias gda_data_model_iter_get_column_for_param = c_gda_data_model_iter_get_column_for_param;

/** */
alias gda_data_model_iter_get_holder_for_field = c_gda_data_model_iter_get_holder_for_field;

/** */
alias gda_data_model_iter_get_row = c_gda_data_model_iter_get_row;

/** */
alias gda_data_model_iter_get_value_at = c_gda_data_model_iter_get_value_at;

/** */
alias gda_data_model_iter_get_value_at_e = c_gda_data_model_iter_get_value_at_e;

/** */
alias gda_data_model_iter_get_value_for_field = c_gda_data_model_iter_get_value_for_field;

/** */
alias gda_data_model_iter_invalidate_contents = c_gda_data_model_iter_invalidate_contents;

/** */
alias gda_data_model_iter_is_valid = c_gda_data_model_iter_is_valid;

/** */
alias gda_data_model_iter_move_next = c_gda_data_model_iter_move_next;

/** */
alias gda_data_model_iter_move_prev = c_gda_data_model_iter_move_prev;

/** */
alias gda_data_model_iter_move_to_row = c_gda_data_model_iter_move_to_row;

/** */
alias gda_data_model_iter_set_value_at = c_gda_data_model_iter_set_value_at;

// DataPivot

/** */
alias gda_data_pivot_get_type = c_gda_data_pivot_get_type;

/** */
alias gda_data_pivot_error_quark = c_gda_data_pivot_error_quark;

/** */
alias gda_data_pivot_new = c_gda_data_pivot_new;

/** */
alias gda_data_pivot_add_data = c_gda_data_pivot_add_data;

/** */
alias gda_data_pivot_add_field = c_gda_data_pivot_add_field;

/** */
alias gda_data_pivot_populate = c_gda_data_pivot_populate;

// DataProxy

/** */
alias gda_data_proxy_get_type = c_gda_data_proxy_get_type;

/** */
alias gda_data_proxy_new = c_gda_data_proxy_new;

/** */
alias gda_data_proxy_new_with_data_model = c_gda_data_proxy_new_with_data_model;

/** */
alias gda_data_proxy_error_quark = c_gda_data_proxy_error_quark;

/** */
alias gda_data_proxy_alter_value_attributes = c_gda_data_proxy_alter_value_attributes;

/** */
alias gda_data_proxy_apply_all_changes = c_gda_data_proxy_apply_all_changes;

/** */
alias gda_data_proxy_apply_row_changes = c_gda_data_proxy_apply_row_changes;

/** */
alias gda_data_proxy_cancel_all_changes = c_gda_data_proxy_cancel_all_changes;

/** */
alias gda_data_proxy_cancel_row_changes = c_gda_data_proxy_cancel_row_changes;

/** */
alias gda_data_proxy_delete = c_gda_data_proxy_delete;

/** */
alias gda_data_proxy_get_filter_expr = c_gda_data_proxy_get_filter_expr;

/** */
alias gda_data_proxy_get_filtered_n_rows = c_gda_data_proxy_get_filtered_n_rows;

/** */
alias gda_data_proxy_get_n_modified_rows = c_gda_data_proxy_get_n_modified_rows;

/** */
alias gda_data_proxy_get_n_new_rows = c_gda_data_proxy_get_n_new_rows;

/** */
alias gda_data_proxy_get_proxied_model = c_gda_data_proxy_get_proxied_model;

/** */
alias gda_data_proxy_get_proxied_model_n_cols = c_gda_data_proxy_get_proxied_model_n_cols;

/** */
alias gda_data_proxy_get_proxied_model_n_rows = c_gda_data_proxy_get_proxied_model_n_rows;

/** */
alias gda_data_proxy_get_proxied_model_row = c_gda_data_proxy_get_proxied_model_row;

/** */
alias gda_data_proxy_get_sample_end = c_gda_data_proxy_get_sample_end;

/** */
alias gda_data_proxy_get_sample_size = c_gda_data_proxy_get_sample_size;

/** */
alias gda_data_proxy_get_sample_start = c_gda_data_proxy_get_sample_start;

/** */
alias gda_data_proxy_get_value_attributes = c_gda_data_proxy_get_value_attributes;

/** */
alias gda_data_proxy_get_values = c_gda_data_proxy_get_values;

/** */
alias gda_data_proxy_has_changed = c_gda_data_proxy_has_changed;

/** */
alias gda_data_proxy_is_read_only = c_gda_data_proxy_is_read_only;

/** */
alias gda_data_proxy_row_has_changed = c_gda_data_proxy_row_has_changed;

/** */
alias gda_data_proxy_row_is_deleted = c_gda_data_proxy_row_is_deleted;

/** */
alias gda_data_proxy_row_is_inserted = c_gda_data_proxy_row_is_inserted;

/** */
alias gda_data_proxy_set_filter_expr = c_gda_data_proxy_set_filter_expr;

/** */
alias gda_data_proxy_set_ordering_column = c_gda_data_proxy_set_ordering_column;

/** */
alias gda_data_proxy_set_sample_size = c_gda_data_proxy_set_sample_size;

/** */
alias gda_data_proxy_set_sample_start = c_gda_data_proxy_set_sample_start;

/** */
alias gda_data_proxy_undelete = c_gda_data_proxy_undelete;

// DataSelect

/** */
alias gda_data_select_get_type = c_gda_data_select_get_type;

/** */
alias gda_data_select_error_quark = c_gda_data_select_error_quark;

/** */
alias gda_data_select_compute_columns_attributes = c_gda_data_select_compute_columns_attributes;

/** */
alias gda_data_select_compute_modification_statements = c_gda_data_select_compute_modification_statements;

/** */
alias gda_data_select_compute_modification_statements_ext = c_gda_data_select_compute_modification_statements_ext;

/** */
alias gda_data_select_compute_row_selection_condition = c_gda_data_select_compute_row_selection_condition;

/** */
alias gda_data_select_get_connection = c_gda_data_select_get_connection;

/** */
alias gda_data_select_prepare_for_offline = c_gda_data_select_prepare_for_offline;

/** */
alias gda_data_select_rerun = c_gda_data_select_rerun;

/** */
alias gda_data_select_set_modification_statement = c_gda_data_select_set_modification_statement;

/** */
alias gda_data_select_set_modification_statement_sql = c_gda_data_select_set_modification_statement_sql;

/** */
alias gda_data_select_set_row_selection_condition = c_gda_data_select_set_row_selection_condition;

/** */
alias gda_data_select_set_row_selection_condition_sql = c_gda_data_select_set_row_selection_condition_sql;

// DsnInfo

/** */
alias gda_dsn_info_get_type = c_gda_dsn_info_get_type;

/** */
alias gda_dsn_info_new = c_gda_dsn_info_new;

/** */
alias gda_dsn_info_copy = c_gda_dsn_info_copy;

/** */
alias gda_dsn_info_free = c_gda_dsn_info_free;

// GeometricPoint

/** */
alias gda_geometricpoint_get_type = c_gda_geometricpoint_get_type;

/** */
alias gda_geometricpoint_copy = c_gda_geometricpoint_copy;

/** */
alias gda_geometricpoint_free = c_gda_geometricpoint_free;

// HandlerBin

/** */
alias gda_handler_bin_get_type = c_gda_handler_bin_get_type;

/** */
alias gda_handler_bin_new = c_gda_handler_bin_new;

// HandlerBoolean

/** */
alias gda_handler_boolean_get_type = c_gda_handler_boolean_get_type;

/** */
alias gda_handler_boolean_new = c_gda_handler_boolean_new;

// HandlerNumerical

/** */
alias gda_handler_numerical_get_type = c_gda_handler_numerical_get_type;

/** */
alias gda_handler_numerical_new = c_gda_handler_numerical_new;

// HandlerString

/** */
alias gda_handler_string_get_type = c_gda_handler_string_get_type;

/** */
alias gda_handler_string_new = c_gda_handler_string_new;

/** */
alias gda_handler_string_new_with_provider = c_gda_handler_string_new_with_provider;

// HandlerTime

/** */
alias gda_handler_time_get_type = c_gda_handler_time_get_type;

/** */
alias gda_handler_time_new = c_gda_handler_time_new;

/** */
alias gda_handler_time_new_no_locale = c_gda_handler_time_new_no_locale;

/** */
alias gda_handler_time_get_format = c_gda_handler_time_get_format;

/** */
alias gda_handler_time_get_no_locale_str_from_value = c_gda_handler_time_get_no_locale_str_from_value;

/** */
alias gda_handler_time_set_sql_spec = c_gda_handler_time_set_sql_spec;

/** */
alias gda_handler_time_set_str_spec = c_gda_handler_time_set_str_spec;

// HandlerType

/** */
alias gda_handler_type_get_type = c_gda_handler_type_get_type;

/** */
alias gda_handler_type_new = c_gda_handler_type_new;

// Holder

/** */
alias gda_holder_get_type = c_gda_holder_get_type;

/** */
alias gda_holder_new = c_gda_holder_new;

/** */
alias gda_holder_new_inline = c_gda_holder_new_inline;

/** */
alias gda_holder_error_quark = c_gda_holder_error_quark;

/** */
alias gda_holder_copy = c_gda_holder_copy;

/** */
alias gda_holder_force_invalid = c_gda_holder_force_invalid;

/** */
alias gda_holder_force_invalid_e = c_gda_holder_force_invalid_e;

/** */
alias gda_holder_get_alphanum_id = c_gda_holder_get_alphanum_id;

/** */
alias gda_holder_get_attribute = c_gda_holder_get_attribute;

/** */
alias gda_holder_get_bind = c_gda_holder_get_bind;

/** */
alias gda_holder_get_default_value = c_gda_holder_get_default_value;

/** */
alias gda_holder_get_g_type = c_gda_holder_get_g_type;

/** */
alias gda_holder_get_id = c_gda_holder_get_id;

/** */
alias gda_holder_get_not_null = c_gda_holder_get_not_null;

/** */
alias gda_holder_get_source_model = c_gda_holder_get_source_model;

/** */
alias gda_holder_get_value = c_gda_holder_get_value;

/** */
alias gda_holder_get_value_str = c_gda_holder_get_value_str;

/** */
alias gda_holder_is_valid = c_gda_holder_is_valid;

/** */
alias gda_holder_is_valid_e = c_gda_holder_is_valid_e;

/** */
alias gda_holder_set_attribute = c_gda_holder_set_attribute;

/** */
alias gda_holder_set_bind = c_gda_holder_set_bind;

/** */
alias gda_holder_set_default_value = c_gda_holder_set_default_value;

/** */
alias gda_holder_set_not_null = c_gda_holder_set_not_null;

/** */
alias gda_holder_set_source_model = c_gda_holder_set_source_model;

/** */
alias gda_holder_set_value = c_gda_holder_set_value;

/** */
alias gda_holder_set_value_str = c_gda_holder_set_value_str;

/** */
alias gda_holder_set_value_to_default = c_gda_holder_set_value_to_default;

/** */
alias gda_holder_take_static_value = c_gda_holder_take_static_value;

/** */
alias gda_holder_take_value = c_gda_holder_take_value;

/** */
alias gda_holder_value_is_default = c_gda_holder_value_is_default;

// Lockable

/** */
alias gda_lockable_get_type = c_gda_lockable_get_type;

/** */
alias gda_lockable_lock = c_gda_lockable_lock;

/** */
alias gda_lockable_trylock = c_gda_lockable_trylock;

/** */
alias gda_lockable_unlock = c_gda_lockable_unlock;

// MetaContext

/** */
alias gda_meta_context_get_type = c_gda_meta_context_get_type;

/** */
alias gda_meta_context_new = c_gda_meta_context_new;

/** */
alias gda_meta_context_copy = c_gda_meta_context_copy;

/** */
alias gda_meta_context_free = c_gda_meta_context_free;

/** */
alias gda_meta_context_get_table = c_gda_meta_context_get_table;

/** */
alias gda_meta_context_set_column = c_gda_meta_context_set_column;

/** */
alias gda_meta_context_set_columns = c_gda_meta_context_set_columns;

/** */
alias gda_meta_context_set_table = c_gda_meta_context_set_table;

// MetaStore

/** */
alias gda_meta_store_get_type = c_gda_meta_store_get_type;

/** */
alias gda_meta_store_new = c_gda_meta_store_new;

/** */
alias gda_meta_store_new_with_file = c_gda_meta_store_new_with_file;

/** */
alias gda_meta_store_error_quark = c_gda_meta_store_error_quark;

/** */
alias gda_meta_store_sql_identifier_quote = c_gda_meta_store_sql_identifier_quote;

/** */
alias gda_meta_store_create_modify_data_model = c_gda_meta_store_create_modify_data_model;

/** */
alias gda_meta_store_declare_foreign_key = c_gda_meta_store_declare_foreign_key;

/** */
alias gda_meta_store_extract = c_gda_meta_store_extract;

/** */
alias gda_meta_store_extract_v = c_gda_meta_store_extract_v;

/** */
alias gda_meta_store_get_attribute_value = c_gda_meta_store_get_attribute_value;

/** */
alias gda_meta_store_get_internal_connection = c_gda_meta_store_get_internal_connection;

/** */
alias gda_meta_store_get_version = c_gda_meta_store_get_version;

/** */
alias gda_meta_store_modify = c_gda_meta_store_modify;

/** */
alias gda_meta_store_modify_v = c_gda_meta_store_modify_v;

/** */
alias gda_meta_store_modify_with_context = c_gda_meta_store_modify_with_context;

/** */
alias gda_meta_store_schema_add_custom_object = c_gda_meta_store_schema_add_custom_object;

/** */
alias gda_meta_store_schema_get_all_tables = c_gda_meta_store_schema_get_all_tables;

/** */
alias gda_meta_store_schema_get_depend_tables = c_gda_meta_store_schema_get_depend_tables;

/** */
alias gda_meta_store_schema_get_structure = c_gda_meta_store_schema_get_structure;

/** */
alias gda_meta_store_schema_remove_custom_object = c_gda_meta_store_schema_remove_custom_object;

/** */
alias gda_meta_store_set_attribute_value = c_gda_meta_store_set_attribute_value;

/** */
alias gda_meta_store_set_identifiers_style = c_gda_meta_store_set_identifiers_style;

/** */
alias gda_meta_store_set_reserved_keywords_func = c_gda_meta_store_set_reserved_keywords_func;

/** */
alias gda_meta_store_undeclare_foreign_key = c_gda_meta_store_undeclare_foreign_key;

// MetaStruct

/** */
alias gda_meta_struct_get_type = c_gda_meta_struct_get_type;

/** */
alias gda_meta_struct_new = c_gda_meta_struct_new;

/** */
alias gda_meta_struct_error_quark = c_gda_meta_struct_error_quark;

/** */
alias gda_meta_struct_complement = c_gda_meta_struct_complement;

/** */
alias gda_meta_struct_complement_all = c_gda_meta_struct_complement_all;

/** */
alias gda_meta_struct_complement_default = c_gda_meta_struct_complement_default;

/** */
alias gda_meta_struct_complement_depend = c_gda_meta_struct_complement_depend;

/** */
alias gda_meta_struct_complement_schema = c_gda_meta_struct_complement_schema;

/** */
alias gda_meta_struct_dump_as_graph = c_gda_meta_struct_dump_as_graph;

/** */
alias gda_meta_struct_get_all_db_objects = c_gda_meta_struct_get_all_db_objects;

/** */
alias gda_meta_struct_get_db_object = c_gda_meta_struct_get_db_object;

/** */
alias gda_meta_struct_get_table_column = c_gda_meta_struct_get_table_column;

/** */
alias gda_meta_struct_load_from_xml_file = c_gda_meta_struct_load_from_xml_file;

/** */
alias gda_meta_struct_sort_db_objects = c_gda_meta_struct_sort_db_objects;

// MetaTableColumn

/** */
alias gda_meta_table_column_foreach_attribute = c_gda_meta_table_column_foreach_attribute;

/** */
alias gda_meta_table_column_get_attribute = c_gda_meta_table_column_get_attribute;

/** */
alias gda_meta_table_column_set_attribute = c_gda_meta_table_column_set_attribute;

// Numeric

/** */
alias gda_numeric_get_type = c_gda_numeric_get_type;

/** */
alias gda_numeric_new = c_gda_numeric_new;

/** */
alias gda_numeric_copy = c_gda_numeric_copy;

/** */
alias gda_numeric_free = c_gda_numeric_free;

/** */
alias gda_numeric_get_double = c_gda_numeric_get_double;

/** */
alias gda_numeric_get_precision = c_gda_numeric_get_precision;

/** */
alias gda_numeric_get_string = c_gda_numeric_get_string;

/** */
alias gda_numeric_get_width = c_gda_numeric_get_width;

/** */
alias gda_numeric_set_double = c_gda_numeric_set_double;

/** */
alias gda_numeric_set_from_string = c_gda_numeric_set_from_string;

/** */
alias gda_numeric_set_precision = c_gda_numeric_set_precision;

/** */
alias gda_numeric_set_width = c_gda_numeric_set_width;

// PStmt

/** */
alias gda_pstmt_get_type = c_gda_pstmt_get_type;

/** */
alias gda_pstmt_copy_contents = c_gda_pstmt_copy_contents;

/** */
alias gda_pstmt_get_gda_statement = c_gda_pstmt_get_gda_statement;

/** */
alias gda_pstmt_set_gda_statement = c_gda_pstmt_set_gda_statement;

// QuarkList

/** */
alias gda_quark_list_get_type = c_gda_quark_list_get_type;

/** */
alias gda_quark_list_new = c_gda_quark_list_new;

/** */
alias gda_quark_list_new_from_string = c_gda_quark_list_new_from_string;

/** */
alias gda_quark_list_add_from_string = c_gda_quark_list_add_from_string;

/** */
alias gda_quark_list_clear = c_gda_quark_list_clear;

/** */
alias gda_quark_list_copy = c_gda_quark_list_copy;

/** */
alias gda_quark_list_find = c_gda_quark_list_find;

/** */
alias gda_quark_list_foreach = c_gda_quark_list_foreach;

/** */
alias gda_quark_list_free = c_gda_quark_list_free;

/** */
alias gda_quark_list_protect_values = c_gda_quark_list_protect_values;

/** */
alias gda_quark_list_remove = c_gda_quark_list_remove;

// RepetitiveStatement

/** */
alias gda_repetitive_statement_get_type = c_gda_repetitive_statement_get_type;

/** */
alias gda_repetitive_statement_new = c_gda_repetitive_statement_new;

/** */
alias gda_repetitive_statement_append_set = c_gda_repetitive_statement_append_set;

/** */
alias gda_repetitive_statement_get_all_sets = c_gda_repetitive_statement_get_all_sets;

/** */
alias gda_repetitive_statement_get_template_set = c_gda_repetitive_statement_get_template_set;

// Row

/** */
alias gda_row_get_type = c_gda_row_get_type;

/** */
alias gda_row_new = c_gda_row_new;

/** */
alias gda_row_get_length = c_gda_row_get_length;

/** */
alias gda_row_get_value = c_gda_row_get_value;

/** */
alias gda_row_invalidate_value = c_gda_row_invalidate_value;

/** */
alias gda_row_invalidate_value_e = c_gda_row_invalidate_value_e;

/** */
alias gda_row_value_is_valid = c_gda_row_value_is_valid;

/** */
alias gda_row_value_is_valid_e = c_gda_row_value_is_valid_e;

// ServerOperation

/** */
alias gda_server_operation_get_type = c_gda_server_operation_get_type;

/** */
alias gda_server_operation_new = c_gda_server_operation_new;

/** */
alias gda_server_operation_error_quark = c_gda_server_operation_error_quark;

/** */
alias gda_server_operation_op_type_to_string = c_gda_server_operation_op_type_to_string;

/** */
alias gda_server_operation_prepare_create_database = c_gda_server_operation_prepare_create_database;

/** */
alias gda_server_operation_prepare_create_table = c_gda_server_operation_prepare_create_table;

/** */
alias gda_server_operation_prepare_drop_database = c_gda_server_operation_prepare_drop_database;

/** */
alias gda_server_operation_prepare_drop_table = c_gda_server_operation_prepare_drop_table;

/** */
alias gda_server_operation_string_to_op_type = c_gda_server_operation_string_to_op_type;

/** */
alias gda_server_operation_add_item_to_sequence = c_gda_server_operation_add_item_to_sequence;

/** */
alias gda_server_operation_del_item_from_sequence = c_gda_server_operation_del_item_from_sequence;

/** */
alias gda_server_operation_get_node_info = c_gda_server_operation_get_node_info;

/** */
alias gda_server_operation_get_node_parent = c_gda_server_operation_get_node_parent;

/** */
alias gda_server_operation_get_node_path_portion = c_gda_server_operation_get_node_path_portion;

/** */
alias gda_server_operation_get_node_type = c_gda_server_operation_get_node_type;

/** */
alias gda_server_operation_get_op_type = c_gda_server_operation_get_op_type;

/** */
alias gda_server_operation_get_root_nodes = c_gda_server_operation_get_root_nodes;

/** */
alias gda_server_operation_get_sequence_item_names = c_gda_server_operation_get_sequence_item_names;

/** */
alias gda_server_operation_get_sequence_max_size = c_gda_server_operation_get_sequence_max_size;

/** */
alias gda_server_operation_get_sequence_min_size = c_gda_server_operation_get_sequence_min_size;

/** */
alias gda_server_operation_get_sequence_name = c_gda_server_operation_get_sequence_name;

/** */
alias gda_server_operation_get_sequence_size = c_gda_server_operation_get_sequence_size;

/** */
alias gda_server_operation_get_sql_identifier_at = c_gda_server_operation_get_sql_identifier_at;

/** */
alias gda_server_operation_get_sql_identifier_at_path = c_gda_server_operation_get_sql_identifier_at_path;

/** */
alias gda_server_operation_get_value_at = c_gda_server_operation_get_value_at;

/** */
alias gda_server_operation_get_value_at_path = c_gda_server_operation_get_value_at_path;

/** */
alias gda_server_operation_is_valid = c_gda_server_operation_is_valid;

/** */
alias gda_server_operation_load_data_from_xml = c_gda_server_operation_load_data_from_xml;

/** */
alias gda_server_operation_perform_create_database = c_gda_server_operation_perform_create_database;

/** */
alias gda_server_operation_perform_create_table = c_gda_server_operation_perform_create_table;

/** */
alias gda_server_operation_perform_drop_database = c_gda_server_operation_perform_drop_database;

/** */
alias gda_server_operation_perform_drop_table = c_gda_server_operation_perform_drop_table;

/** */
alias gda_server_operation_save_data_to_xml = c_gda_server_operation_save_data_to_xml;

/** */
alias gda_server_operation_set_value_at = c_gda_server_operation_set_value_at;

/** */
alias gda_server_operation_set_value_at_path = c_gda_server_operation_set_value_at_path;

// ServerProvider

/** */
alias gda_server_provider_get_type = c_gda_server_provider_get_type;

/** */
alias gda_server_provider_error_quark = c_gda_server_provider_error_quark;

/** */
alias gda_server_provider_load_file_contents = c_gda_server_provider_load_file_contents;

/** */
alias gda_server_provider_create_operation = c_gda_server_provider_create_operation;

/** */
alias gda_server_provider_create_parser = c_gda_server_provider_create_parser;

/** */
alias gda_server_provider_escape_string = c_gda_server_provider_escape_string;

/** */
alias gda_server_provider_find_file = c_gda_server_provider_find_file;

/** */
alias gda_server_provider_get_data_handler_dbms = c_gda_server_provider_get_data_handler_dbms;

/** */
alias gda_server_provider_get_data_handler_default = c_gda_server_provider_get_data_handler_default;

/** */
alias gda_server_provider_get_data_handler_g_type = c_gda_server_provider_get_data_handler_g_type;

/** */
alias gda_server_provider_get_default_dbms_type = c_gda_server_provider_get_default_dbms_type;

/** */
alias gda_server_provider_get_name = c_gda_server_provider_get_name;

/** */
alias gda_server_provider_get_server_version = c_gda_server_provider_get_server_version;

/** */
alias gda_server_provider_get_version = c_gda_server_provider_get_version;

/** */
alias gda_server_provider_handler_declare = c_gda_server_provider_handler_declare;

/** */
alias gda_server_provider_handler_find = c_gda_server_provider_handler_find;

/** */
alias gda_server_provider_handler_use_default = c_gda_server_provider_handler_use_default;

/** */
alias gda_server_provider_internal_get_parser = c_gda_server_provider_internal_get_parser;

/** */
alias gda_server_provider_perform_operation = c_gda_server_provider_perform_operation;

/** */
alias gda_server_provider_perform_operation_default = c_gda_server_provider_perform_operation_default;

/** */
alias gda_server_provider_render_operation = c_gda_server_provider_render_operation;

/** */
alias gda_server_provider_string_to_value = c_gda_server_provider_string_to_value;

/** */
alias gda_server_provider_supports_feature = c_gda_server_provider_supports_feature;

/** */
alias gda_server_provider_supports_operation = c_gda_server_provider_supports_operation;

/** */
alias gda_server_provider_unescape_string = c_gda_server_provider_unescape_string;

/** */
alias gda_server_provider_value_to_sql_string = c_gda_server_provider_value_to_sql_string;

// Set

/** */
alias gda_set_get_type = c_gda_set_get_type;

/** */
alias gda_set_new = c_gda_set_new;

/** */
alias gda_set_new_from_spec_node = c_gda_set_new_from_spec_node;

/** */
alias gda_set_new_from_spec_string = c_gda_set_new_from_spec_string;

/** */
alias gda_set_new_inline = c_gda_set_new_inline;

/** */
alias gda_set_new_read_only = c_gda_set_new_read_only;

/** */
alias gda_set_error_quark = c_gda_set_error_quark;

/** */
alias gda_set_add_holder = c_gda_set_add_holder;

/** */
alias gda_set_copy = c_gda_set_copy;

/** */
alias gda_set_get_group = c_gda_set_get_group;

/** */
alias gda_set_get_holder = c_gda_set_get_holder;

/** */
alias gda_set_get_holder_value = c_gda_set_get_holder_value;

/** */
alias gda_set_get_node = c_gda_set_get_node;

/** */
alias gda_set_get_nth_holder = c_gda_set_get_nth_holder;

/** */
alias gda_set_get_source = c_gda_set_get_source;

/** */
alias gda_set_get_source_for_model = c_gda_set_get_source_for_model;

/** */
alias gda_set_is_valid = c_gda_set_is_valid;

/** */
alias gda_set_merge_with_set = c_gda_set_merge_with_set;

/** */
alias gda_set_remove_holder = c_gda_set_remove_holder;

/** */
alias gda_set_replace_source_model = c_gda_set_replace_source_model;

/** */
alias gda_set_set_holder_value = c_gda_set_set_holder_value;

// SetGroup

/** */
alias gda_set_group_get_type = c_gda_set_group_get_type;

/** */
alias gda_set_group_new = c_gda_set_group_new;

/** */
alias gda_set_group_add_node = c_gda_set_group_add_node;

/** */
alias gda_set_group_copy = c_gda_set_group_copy;

/** */
alias gda_set_group_free = c_gda_set_group_free;

/** */
alias gda_set_group_get_n_nodes = c_gda_set_group_get_n_nodes;

/** */
alias gda_set_group_get_node = c_gda_set_group_get_node;

/** */
alias gda_set_group_get_nodes = c_gda_set_group_get_nodes;

/** */
alias gda_set_group_get_source = c_gda_set_group_get_source;

/** */
alias gda_set_group_set_source = c_gda_set_group_set_source;

// SetNode

/** */
alias gda_set_node_get_type = c_gda_set_node_get_type;

/** */
alias gda_set_node_new = c_gda_set_node_new;

/** */
alias gda_set_node_copy = c_gda_set_node_copy;

/** */
alias gda_set_node_free = c_gda_set_node_free;

/** */
alias gda_set_node_get_data_model = c_gda_set_node_get_data_model;

/** */
alias gda_set_node_get_holder = c_gda_set_node_get_holder;

/** */
alias gda_set_node_get_source_column = c_gda_set_node_get_source_column;

/** */
alias gda_set_node_set_data_model = c_gda_set_node_set_data_model;

/** */
alias gda_set_node_set_holder = c_gda_set_node_set_holder;

/** */
alias gda_set_node_set_source_column = c_gda_set_node_set_source_column;

// SetSource

/** */
alias gda_set_source_get_type = c_gda_set_source_get_type;

/** */
alias gda_set_source_new = c_gda_set_source_new;

/** */
alias gda_set_source_add_node = c_gda_set_source_add_node;

/** */
alias gda_set_source_copy = c_gda_set_source_copy;

/** */
alias gda_set_source_free = c_gda_set_source_free;

/** */
alias gda_set_source_get_data_model = c_gda_set_source_get_data_model;

/** */
alias gda_set_source_get_n_nodes = c_gda_set_source_get_n_nodes;

/** */
alias gda_set_source_get_nodes = c_gda_set_source_get_nodes;

/** */
alias gda_set_source_set_data_model = c_gda_set_source_set_data_model;

// Short

/** */
alias gda_short_get_type = c_gda_short_get_type;

// SqlAnyPart

/** */
alias gda_sql_any_part_check_structure = c_gda_sql_any_part_check_structure;

/** */
alias gda_sql_any_part_foreach = c_gda_sql_any_part_foreach;

// SqlBuilder

/** */
alias gda_sql_builder_get_type = c_gda_sql_builder_get_type;

/** */
alias gda_sql_builder_new = c_gda_sql_builder_new;

/** */
alias gda_sql_builder_error_quark = c_gda_sql_builder_error_quark;

/** */
alias gda_sql_builder_add_case = c_gda_sql_builder_add_case;

/** */
alias gda_sql_builder_add_case_v = c_gda_sql_builder_add_case_v;

/** */
alias gda_sql_builder_add_cond = c_gda_sql_builder_add_cond;

/** */
alias gda_sql_builder_add_cond_v = c_gda_sql_builder_add_cond_v;

/** */
alias gda_sql_builder_add_expr = c_gda_sql_builder_add_expr;

/** */
alias gda_sql_builder_add_expr_value = c_gda_sql_builder_add_expr_value;

/** */
alias gda_sql_builder_add_field_id = c_gda_sql_builder_add_field_id;

/** */
alias gda_sql_builder_add_field_value = c_gda_sql_builder_add_field_value;

/** */
alias gda_sql_builder_add_field_value_as_gvalue = c_gda_sql_builder_add_field_value_as_gvalue;

/** */
alias gda_sql_builder_add_field_value_id = c_gda_sql_builder_add_field_value_id;

/** */
alias gda_sql_builder_add_function = c_gda_sql_builder_add_function;

/** */
alias gda_sql_builder_add_function_v = c_gda_sql_builder_add_function_v;

/** */
alias gda_sql_builder_add_id = c_gda_sql_builder_add_id;

/** */
alias gda_sql_builder_add_param = c_gda_sql_builder_add_param;

/** */
alias gda_sql_builder_add_sub_select = c_gda_sql_builder_add_sub_select;

/** */
alias gda_sql_builder_compound_add_sub_select = c_gda_sql_builder_compound_add_sub_select;

/** */
alias gda_sql_builder_compound_add_sub_select_from_builder = c_gda_sql_builder_compound_add_sub_select_from_builder;

/** */
alias gda_sql_builder_compound_set_type = c_gda_sql_builder_compound_set_type;

/** */
alias gda_sql_builder_export_expression = c_gda_sql_builder_export_expression;

/** */
alias gda_sql_builder_get_sql_statement = c_gda_sql_builder_get_sql_statement;

/** */
alias gda_sql_builder_get_statement = c_gda_sql_builder_get_statement;

/** */
alias gda_sql_builder_import_expression = c_gda_sql_builder_import_expression;

/** */
alias gda_sql_builder_import_expression_from_builder = c_gda_sql_builder_import_expression_from_builder;

/** */
alias gda_sql_builder_join_add_field = c_gda_sql_builder_join_add_field;

/** */
alias gda_sql_builder_select_add_field = c_gda_sql_builder_select_add_field;

/** */
alias gda_sql_builder_select_add_target = c_gda_sql_builder_select_add_target;

/** */
alias gda_sql_builder_select_add_target_id = c_gda_sql_builder_select_add_target_id;

/** */
alias gda_sql_builder_select_group_by = c_gda_sql_builder_select_group_by;

/** */
alias gda_sql_builder_select_join_targets = c_gda_sql_builder_select_join_targets;

/** */
alias gda_sql_builder_select_order_by = c_gda_sql_builder_select_order_by;

/** */
alias gda_sql_builder_select_set_distinct = c_gda_sql_builder_select_set_distinct;

/** */
alias gda_sql_builder_select_set_having = c_gda_sql_builder_select_set_having;

/** */
alias gda_sql_builder_select_set_limit = c_gda_sql_builder_select_set_limit;

/** */
alias gda_sql_builder_set_table = c_gda_sql_builder_set_table;

/** */
alias gda_sql_builder_set_where = c_gda_sql_builder_set_where;

// SqlCase

/** */
alias gda_sql_case_copy = c_gda_sql_case_copy;

/** */
alias gda_sql_case_free = c_gda_sql_case_free;

/** */
alias gda_sql_case_serialize = c_gda_sql_case_serialize;

/** */
alias gda_sql_case_new = c_gda_sql_case_new;

// SqlExpr

/** */
alias gda_sql_expr_get_type = c_gda_sql_expr_get_type;

/** */
alias gda_sql_expr_new = c_gda_sql_expr_new;

/** */
alias gda_sql_expr_copy = c_gda_sql_expr_copy;

/** */
alias gda_sql_expr_free = c_gda_sql_expr_free;

/** */
alias gda_sql_expr_serialize = c_gda_sql_expr_serialize;

/** */
alias gda_sql_expr_take_select = c_gda_sql_expr_take_select;

// SqlField

/** */
alias gda_sql_field_copy = c_gda_sql_field_copy;

/** */
alias gda_sql_field_free = c_gda_sql_field_free;

/** */
alias gda_sql_field_serialize = c_gda_sql_field_serialize;

/** */
alias gda_sql_field_take_name = c_gda_sql_field_take_name;

/** */
alias gda_sql_field_new = c_gda_sql_field_new;

// SqlFunction

/** */
alias gda_sql_function_check_clean = c_gda_sql_function_check_clean;

/** */
alias gda_sql_function_copy = c_gda_sql_function_copy;

/** */
alias gda_sql_function_free = c_gda_sql_function_free;

/** */
alias gda_sql_function_serialize = c_gda_sql_function_serialize;

/** */
alias gda_sql_function_take_args_list = c_gda_sql_function_take_args_list;

/** */
alias gda_sql_function_take_name = c_gda_sql_function_take_name;

/** */
alias gda_sql_function_new = c_gda_sql_function_new;

// SqlOperation

/** */
alias gda_sql_operation_copy = c_gda_sql_operation_copy;

/** */
alias gda_sql_operation_free = c_gda_sql_operation_free;

/** */
alias gda_sql_operation_serialize = c_gda_sql_operation_serialize;

/** */
alias gda_sql_operation_new = c_gda_sql_operation_new;

/** */
alias gda_sql_operation_operator_from_string = c_gda_sql_operation_operator_from_string;

/** */
alias gda_sql_operation_operator_to_string = c_gda_sql_operation_operator_to_string;

// SqlParamSpec

/** */
alias gda_sql_param_spec_copy = c_gda_sql_param_spec_copy;

/** */
alias gda_sql_param_spec_free = c_gda_sql_param_spec_free;

/** */
alias gda_sql_param_spec_serialize = c_gda_sql_param_spec_serialize;

/** */
alias gda_sql_param_spec_take_descr = c_gda_sql_param_spec_take_descr;

/** */
alias gda_sql_param_spec_take_name = c_gda_sql_param_spec_take_name;

/** */
alias gda_sql_param_spec_take_nullok = c_gda_sql_param_spec_take_nullok;

/** */
alias gda_sql_param_spec_take_type = c_gda_sql_param_spec_take_type;

/** */
alias gda_sql_param_spec_new = c_gda_sql_param_spec_new;

// SqlParser

/** */
alias gda_sql_parser_get_type = c_gda_sql_parser_get_type;

/** */
alias gda_sql_parser_new = c_gda_sql_parser_new;

/** */
alias gda_sql_parser_error_quark = c_gda_sql_parser_error_quark;

/** */
alias gda_sql_parser_parse_file_as_batch = c_gda_sql_parser_parse_file_as_batch;

/** */
alias gda_sql_parser_parse_string = c_gda_sql_parser_parse_string;

/** */
alias gda_sql_parser_parse_string_as_batch = c_gda_sql_parser_parse_string_as_batch;

/** */
alias gda_sql_parser_set_overflow_error = c_gda_sql_parser_set_overflow_error;

/** */
alias gda_sql_parser_set_syntax_error = c_gda_sql_parser_set_syntax_error;

// SqlSelectField

/** */
alias gda_sql_select_field_copy = c_gda_sql_select_field_copy;

/** */
alias gda_sql_select_field_free = c_gda_sql_select_field_free;

/** */
alias gda_sql_select_field_serialize = c_gda_sql_select_field_serialize;

/** */
alias gda_sql_select_field_take_alias = c_gda_sql_select_field_take_alias;

/** */
alias gda_sql_select_field_take_expr = c_gda_sql_select_field_take_expr;

/** */
alias gda_sql_select_field_take_star_value = c_gda_sql_select_field_take_star_value;

/** */
alias gda_sql_select_field_new = c_gda_sql_select_field_new;

// SqlSelectFrom

/** */
alias gda_sql_select_from_copy = c_gda_sql_select_from_copy;

/** */
alias gda_sql_select_from_free = c_gda_sql_select_from_free;

/** */
alias gda_sql_select_from_serialize = c_gda_sql_select_from_serialize;

/** */
alias gda_sql_select_from_take_new_join = c_gda_sql_select_from_take_new_join;

/** */
alias gda_sql_select_from_take_new_target = c_gda_sql_select_from_take_new_target;

/** */
alias gda_sql_select_from_new = c_gda_sql_select_from_new;

// SqlSelectJoin

/** */
alias gda_sql_select_join_copy = c_gda_sql_select_join_copy;

/** */
alias gda_sql_select_join_free = c_gda_sql_select_join_free;

/** */
alias gda_sql_select_join_serialize = c_gda_sql_select_join_serialize;

/** */
alias gda_sql_select_join_new = c_gda_sql_select_join_new;

/** */
alias gda_sql_select_join_type_to_string = c_gda_sql_select_join_type_to_string;

// SqlSelectOrder

/** */
alias gda_sql_select_order_copy = c_gda_sql_select_order_copy;

/** */
alias gda_sql_select_order_free = c_gda_sql_select_order_free;

/** */
alias gda_sql_select_order_serialize = c_gda_sql_select_order_serialize;

/** */
alias gda_sql_select_order_new = c_gda_sql_select_order_new;

// SqlSelectTarget

/** */
alias gda_sql_select_target_copy = c_gda_sql_select_target_copy;

/** */
alias gda_sql_select_target_free = c_gda_sql_select_target_free;

/** */
alias gda_sql_select_target_serialize = c_gda_sql_select_target_serialize;

/** */
alias gda_sql_select_target_take_alias = c_gda_sql_select_target_take_alias;

/** */
alias gda_sql_select_target_take_select = c_gda_sql_select_target_take_select;

/** */
alias gda_sql_select_target_take_table_name = c_gda_sql_select_target_take_table_name;

/** */
alias gda_sql_select_target_new = c_gda_sql_select_target_new;

// SqlStatement

/** */
alias gda_sql_statement_get_type = c_gda_sql_statement_get_type;

/** */
alias gda_sql_statement_new = c_gda_sql_statement_new;

/** */
alias gda_sql_statement_check_clean = c_gda_sql_statement_check_clean;

/** */
alias gda_sql_statement_check_structure = c_gda_sql_statement_check_structure;

/** */
alias gda_sql_statement_check_validity = c_gda_sql_statement_check_validity;

/** */
alias gda_sql_statement_check_validity_m = c_gda_sql_statement_check_validity_m;

/** */
alias gda_sql_statement_compound_set_type = c_gda_sql_statement_compound_set_type;

/** */
alias gda_sql_statement_compound_take_stmt = c_gda_sql_statement_compound_take_stmt;

/** */
alias gda_sql_statement_copy = c_gda_sql_statement_copy;

/** */
alias gda_sql_statement_delete_take_condition = c_gda_sql_statement_delete_take_condition;

/** */
alias gda_sql_statement_delete_take_table_name = c_gda_sql_statement_delete_take_table_name;

/** */
alias gda_sql_statement_free = c_gda_sql_statement_free;

/** */
alias gda_sql_statement_insert_take_1_values_list = c_gda_sql_statement_insert_take_1_values_list;

/** */
alias gda_sql_statement_insert_take_extra_values_list = c_gda_sql_statement_insert_take_extra_values_list;

/** */
alias gda_sql_statement_insert_take_fields_list = c_gda_sql_statement_insert_take_fields_list;

/** */
alias gda_sql_statement_insert_take_on_conflict = c_gda_sql_statement_insert_take_on_conflict;

/** */
alias gda_sql_statement_insert_take_select = c_gda_sql_statement_insert_take_select;

/** */
alias gda_sql_statement_insert_take_table_name = c_gda_sql_statement_insert_take_table_name;

/** */
alias gda_sql_statement_normalize = c_gda_sql_statement_normalize;

/** */
alias gda_sql_statement_select_take_distinct = c_gda_sql_statement_select_take_distinct;

/** */
alias gda_sql_statement_select_take_expr_list = c_gda_sql_statement_select_take_expr_list;

/** */
alias gda_sql_statement_select_take_from = c_gda_sql_statement_select_take_from;

/** */
alias gda_sql_statement_select_take_group_by = c_gda_sql_statement_select_take_group_by;

/** */
alias gda_sql_statement_select_take_having_cond = c_gda_sql_statement_select_take_having_cond;

/** */
alias gda_sql_statement_select_take_limits = c_gda_sql_statement_select_take_limits;

/** */
alias gda_sql_statement_select_take_order_by = c_gda_sql_statement_select_take_order_by;

/** */
alias gda_sql_statement_select_take_where_cond = c_gda_sql_statement_select_take_where_cond;

/** */
alias gda_sql_statement_serialize = c_gda_sql_statement_serialize;

/** */
alias gda_sql_statement_trans_set_isol_level = c_gda_sql_statement_trans_set_isol_level;

/** */
alias gda_sql_statement_trans_take_mode = c_gda_sql_statement_trans_take_mode;

/** */
alias gda_sql_statement_trans_take_name = c_gda_sql_statement_trans_take_name;

/** */
alias gda_sql_statement_unknown_take_expressions = c_gda_sql_statement_unknown_take_expressions;

/** */
alias gda_sql_statement_update_take_condition = c_gda_sql_statement_update_take_condition;

/** */
alias gda_sql_statement_update_take_on_conflict = c_gda_sql_statement_update_take_on_conflict;

/** */
alias gda_sql_statement_update_take_set_value = c_gda_sql_statement_update_take_set_value;

/** */
alias gda_sql_statement_update_take_table_name = c_gda_sql_statement_update_take_table_name;

/** */
alias gda_sql_statement_get_contents_infos = c_gda_sql_statement_get_contents_infos;

/** */
alias gda_sql_statement_string_to_type = c_gda_sql_statement_string_to_type;

/** */
alias gda_sql_statement_type_to_string = c_gda_sql_statement_type_to_string;

// SqlTable

/** */
alias gda_sql_table_copy = c_gda_sql_table_copy;

/** */
alias gda_sql_table_free = c_gda_sql_table_free;

/** */
alias gda_sql_table_serialize = c_gda_sql_table_serialize;

/** */
alias gda_sql_table_take_name = c_gda_sql_table_take_name;

/** */
alias gda_sql_table_new = c_gda_sql_table_new;

// Statement

/** */
alias gda_statement_get_type = c_gda_statement_get_type;

/** */
alias gda_statement_new = c_gda_statement_new;

/** */
alias gda_statement_error_quark = c_gda_statement_error_quark;

/** */
alias gda_statement_check_structure = c_gda_statement_check_structure;

/** */
alias gda_statement_check_validity = c_gda_statement_check_validity;

/** */
alias gda_statement_copy = c_gda_statement_copy;

/** */
alias gda_statement_get_parameters = c_gda_statement_get_parameters;

/** */
alias gda_statement_get_statement_type = c_gda_statement_get_statement_type;

/** */
alias gda_statement_is_useless = c_gda_statement_is_useless;

/** */
alias gda_statement_normalize = c_gda_statement_normalize;

/** */
alias gda_statement_rewrite_for_default_values = c_gda_statement_rewrite_for_default_values;

/** */
alias gda_statement_serialize = c_gda_statement_serialize;

/** */
alias gda_statement_to_sql_extended = c_gda_statement_to_sql_extended;

/** */
alias gda_statement_to_sql_real = c_gda_statement_to_sql_real;

// ThreadWrapper

/** */
alias gda_thread_wrapper_get_type = c_gda_thread_wrapper_get_type;

/** */
alias gda_thread_wrapper_new = c_gda_thread_wrapper_new;

/** */
alias gda_thread_wrapper_error_quark = c_gda_thread_wrapper_error_quark;

/** */
alias gda_thread_wrapper_cancel = c_gda_thread_wrapper_cancel;

/** */
alias gda_thread_wrapper_connect_raw = c_gda_thread_wrapper_connect_raw;

/** */
alias gda_thread_wrapper_disconnect = c_gda_thread_wrapper_disconnect;

/** */
alias gda_thread_wrapper_execute = c_gda_thread_wrapper_execute;

/** */
alias gda_thread_wrapper_execute_void = c_gda_thread_wrapper_execute_void;

/** */
alias gda_thread_wrapper_fetch_result = c_gda_thread_wrapper_fetch_result;

/** */
alias gda_thread_wrapper_get_io_channel = c_gda_thread_wrapper_get_io_channel;

/** */
alias gda_thread_wrapper_get_waiting_size = c_gda_thread_wrapper_get_waiting_size;

/** */
alias gda_thread_wrapper_iterate = c_gda_thread_wrapper_iterate;

/** */
alias gda_thread_wrapper_steal_signal = c_gda_thread_wrapper_steal_signal;

/** */
alias gda_thread_wrapper_unset_io_channel = c_gda_thread_wrapper_unset_io_channel;

// Time

/** */
alias gda_time_get_type = c_gda_time_get_type;

/** */
alias gda_time_change_timezone = c_gda_time_change_timezone;

/** */
alias gda_time_valid = c_gda_time_valid;

/** */
alias gda_time_copy = c_gda_time_copy;

/** */
alias gda_time_free = c_gda_time_free;

// Timestamp

/** */
alias gda_timestamp_get_type = c_gda_timestamp_get_type;

/** */
alias gda_timestamp_change_timezone = c_gda_timestamp_change_timezone;

/** */
alias gda_timestamp_valid = c_gda_timestamp_valid;

/** */
alias gda_timestamp_copy = c_gda_timestamp_copy;

/** */
alias gda_timestamp_free = c_gda_timestamp_free;

// TransactionStatus

/** */
alias gda_transaction_status_get_type = c_gda_transaction_status_get_type;

/** */
alias gda_transaction_status_new = c_gda_transaction_status_new;

/** */
alias gda_transaction_status_add_event_sql = c_gda_transaction_status_add_event_sql;

/** */
alias gda_transaction_status_add_event_sub = c_gda_transaction_status_add_event_sub;

/** */
alias gda_transaction_status_add_event_svp = c_gda_transaction_status_add_event_svp;

/** */
alias gda_transaction_status_find = c_gda_transaction_status_find;

/** */
alias gda_transaction_status_find_current = c_gda_transaction_status_find_current;

/** */
alias gda_transaction_status_free_events = c_gda_transaction_status_free_events;

// Tree

/** */
alias gda_tree_get_type = c_gda_tree_get_type;

/** */
alias gda_tree_new = c_gda_tree_new;

/** */
alias gda_tree_error_quark = c_gda_tree_error_quark;

/** */
alias gda_tree_add_manager = c_gda_tree_add_manager;

/** */
alias gda_tree_clean = c_gda_tree_clean;

/** */
alias gda_tree_dump = c_gda_tree_dump;

/** */
alias gda_tree_get_node = c_gda_tree_get_node;

/** */
alias gda_tree_get_node_manager = c_gda_tree_get_node_manager;

/** */
alias gda_tree_get_node_path = c_gda_tree_get_node_path;

/** */
alias gda_tree_get_nodes_in_path = c_gda_tree_get_nodes_in_path;

/** */
alias gda_tree_set_attribute = c_gda_tree_set_attribute;

/** */
alias gda_tree_update_all = c_gda_tree_update_all;

/** */
alias gda_tree_update_children = c_gda_tree_update_children;

/** */
alias gda_tree_update_part = c_gda_tree_update_part;

// TreeManager

/** */
alias gda_tree_manager_get_type = c_gda_tree_manager_get_type;

/** */
alias gda_tree_manager_new_with_func = c_gda_tree_manager_new_with_func;

/** */
alias gda_tree_manager_error_quark = c_gda_tree_manager_error_quark;

/** */
alias gda_tree_manager_add_manager = c_gda_tree_manager_add_manager;

/** */
alias gda_tree_manager_add_new_node_attribute = c_gda_tree_manager_add_new_node_attribute;

/** */
alias gda_tree_manager_create_node = c_gda_tree_manager_create_node;

/** */
alias gda_tree_manager_get_managers = c_gda_tree_manager_get_managers;

/** */
alias gda_tree_manager_get_node_create_func = c_gda_tree_manager_get_node_create_func;

/** */
alias gda_tree_manager_set_node_create_func = c_gda_tree_manager_set_node_create_func;

// TreeMgrColumns

/** */
alias gda_tree_mgr_columns_get_type = c_gda_tree_mgr_columns_get_type;

/** */
alias gda_tree_mgr_columns_new = c_gda_tree_mgr_columns_new;

// TreeMgrLabel

/** */
alias gda_tree_mgr_label_get_type = c_gda_tree_mgr_label_get_type;

/** */
alias gda_tree_mgr_label_new = c_gda_tree_mgr_label_new;

// TreeMgrSchemas

/** */
alias gda_tree_mgr_schemas_get_type = c_gda_tree_mgr_schemas_get_type;

/** */
alias gda_tree_mgr_schemas_new = c_gda_tree_mgr_schemas_new;

// TreeMgrSelect

/** */
alias gda_tree_mgr_select_get_type = c_gda_tree_mgr_select_get_type;

/** */
alias gda_tree_mgr_select_new = c_gda_tree_mgr_select_new;

// TreeMgrTables

/** */
alias gda_tree_mgr_tables_get_type = c_gda_tree_mgr_tables_get_type;

/** */
alias gda_tree_mgr_tables_new = c_gda_tree_mgr_tables_new;

// TreeNode

/** */
alias gda_tree_node_get_type = c_gda_tree_node_get_type;

/** */
alias gda_tree_node_new = c_gda_tree_node_new;

/** */
alias gda_tree_node_error_quark = c_gda_tree_node_error_quark;

/** */
alias gda_tree_node_fetch_attribute = c_gda_tree_node_fetch_attribute;

/** */
alias gda_tree_node_get_child_index = c_gda_tree_node_get_child_index;

/** */
alias gda_tree_node_get_child_name = c_gda_tree_node_get_child_name;

/** */
alias gda_tree_node_get_children = c_gda_tree_node_get_children;

/** */
alias gda_tree_node_get_node_attribute = c_gda_tree_node_get_node_attribute;

/** */
alias gda_tree_node_get_parent = c_gda_tree_node_get_parent;

/** */
alias gda_tree_node_set_node_attribute = c_gda_tree_node_set_node_attribute;

// UShort

/** */
alias gda_ushort_get_type = c_gda_ushort_get_type;

// XaTransaction

/** */
alias gda_xa_transaction_get_type = c_gda_xa_transaction_get_type;

/** */
alias gda_xa_transaction_new = c_gda_xa_transaction_new;

/** */
alias gda_xa_transaction_error_quark = c_gda_xa_transaction_error_quark;

/** */
alias gda_xa_transaction_string_to_id = c_gda_xa_transaction_string_to_id;

/** */
alias gda_xa_transaction_begin = c_gda_xa_transaction_begin;

/** */
alias gda_xa_transaction_commit = c_gda_xa_transaction_commit;

/** */
alias gda_xa_transaction_commit_recovered = c_gda_xa_transaction_commit_recovered;

/** */
alias gda_xa_transaction_register_connection = c_gda_xa_transaction_register_connection;

/** */
alias gda_xa_transaction_rollback = c_gda_xa_transaction_rollback;

/** */
alias gda_xa_transaction_unregister_connection = c_gda_xa_transaction_unregister_connection;

// XaTransactionId

/** */
alias gda_xa_transaction_id_to_string = c_gda_xa_transaction_id_to_string;

// global

/** */
alias gda_default_escape_string = c_gda_default_escape_string;

/** */
alias gda_default_unescape_string = c_gda_default_unescape_string;

/** */
alias gda_alphanum_to_text = c_gda_alphanum_to_text;

/** */
alias gda_completion_list_get = c_gda_completion_list_get;

/** */
alias gda_compute_dml_statements = c_gda_compute_dml_statements;

/** */
alias gda_compute_select_statement_from_update = c_gda_compute_select_statement_from_update;

/** */
alias gda_compute_unique_table_row_condition = c_gda_compute_unique_table_row_condition;

/** */
alias gda_compute_unique_table_row_condition_with_cnc = c_gda_compute_unique_table_row_condition_with_cnc;

/** */
alias gda_dsn_split = c_gda_dsn_split;

/** */
alias gda_g_type_from_string = c_gda_g_type_from_string;

/** */
alias gda_g_type_to_string = c_gda_g_type_to_string;

/** */
alias gda_get_application_exec_path = c_gda_get_application_exec_path;

/** */
alias gda_identifier_equal = c_gda_identifier_equal;

/** */
alias gda_identifier_hash = c_gda_identifier_hash;

/** */
alias gda_init = c_gda_init;

/** */
alias gda_locale_changed = c_gda_locale_changed;

/** */
alias gda_log_disable = c_gda_log_disable;

/** */
alias gda_log_enable = c_gda_log_enable;

/** */
alias gda_log_error = c_gda_log_error;

/** */
alias gda_log_is_enabled = c_gda_log_is_enabled;

/** */
alias gda_log_message = c_gda_log_message;

/** */
alias gda_mutex_free = c_gda_mutex_free;

/** */
alias gda_mutex_lock = c_gda_mutex_lock;

/** */
alias gda_mutex_new = c_gda_mutex_new;

/** */
alias gda_mutex_trylock = c_gda_mutex_trylock;

/** */
alias gda_mutex_unlock = c_gda_mutex_unlock;

/** */
alias gda_parse_formatted_date = c_gda_parse_formatted_date;

/** */
alias gda_parse_formatted_time = c_gda_parse_formatted_time;

/** */
alias gda_parse_formatted_timestamp = c_gda_parse_formatted_timestamp;

/** */
alias gda_parse_iso8601_date = c_gda_parse_iso8601_date;

/** */
alias gda_parse_iso8601_time = c_gda_parse_iso8601_time;

/** */
alias gda_parse_iso8601_timestamp = c_gda_parse_iso8601_timestamp;

/** */
alias gda_rewrite_sql_statement_for_null_parameters = c_gda_rewrite_sql_statement_for_null_parameters;

/** */
alias gda_rewrite_statement_for_null_parameters = c_gda_rewrite_statement_for_null_parameters;

/** */
alias gda_rfc1738_decode = c_gda_rfc1738_decode;

/** */
alias gda_rfc1738_encode = c_gda_rfc1738_encode;

/** */
alias gda_select_alter_select_for_empty = c_gda_select_alter_select_for_empty;

/** */
alias gda_sql_error_quark = c_gda_sql_error_quark;

/** */
alias gda_sql_identifier_force_quotes = c_gda_sql_identifier_force_quotes;

/** */
alias gda_sql_identifier_prepare_for_compare = c_gda_sql_identifier_prepare_for_compare;

/** */
alias gda_sql_identifier_quote = c_gda_sql_identifier_quote;

/** */
alias gda_sql_identifier_split = c_gda_sql_identifier_split;

/** */
alias gda_sql_value_stringify = c_gda_sql_value_stringify;

/** */
alias gda_string_to_binary = c_gda_string_to_binary;

/** */
alias gda_string_to_blob = c_gda_string_to_blob;

/** */
alias gda_text_to_alphanum = c_gda_text_to_alphanum;

/** */
alias gda_utility_check_data_model = c_gda_utility_check_data_model;

/** */
alias gda_utility_check_data_model_v = c_gda_utility_check_data_model_v;

/** */
alias gda_utility_data_model_dump_data_to_xml = c_gda_utility_data_model_dump_data_to_xml;

/** */
alias gda_utility_data_model_find_column_description = c_gda_utility_data_model_find_column_description;

/** */
alias gda_utility_holder_load_attributes = c_gda_utility_holder_load_attributes;

/** */
alias gda_value_compare = c_gda_value_compare;

/** */
alias gda_value_copy = c_gda_value_copy;

/** */
alias gda_value_differ = c_gda_value_differ;

/** */
alias gda_value_free = c_gda_value_free;

/** */
alias gda_value_get_binary = c_gda_value_get_binary;

/** */
alias gda_value_get_blob = c_gda_value_get_blob;

/** */
alias gda_value_get_geometric_point = c_gda_value_get_geometric_point;

/** */
alias gda_value_get_numeric = c_gda_value_get_numeric;

/** */
alias gda_value_get_short = c_gda_value_get_short;

/** */
alias gda_value_get_time = c_gda_value_get_time;

/** */
alias gda_value_get_timestamp = c_gda_value_get_timestamp;

/** */
alias gda_value_get_ushort = c_gda_value_get_ushort;

/** */
alias gda_value_is_null = c_gda_value_is_null;

/** */
alias gda_value_is_number = c_gda_value_is_number;

/** */
alias gda_value_new = c_gda_value_new;

/** */
alias gda_value_new_binary = c_gda_value_new_binary;

/** */
alias gda_value_new_blob = c_gda_value_new_blob;

/** */
alias gda_value_new_blob_from_file = c_gda_value_new_blob_from_file;

/** */
alias gda_value_new_default = c_gda_value_new_default;

/** */
alias gda_value_new_from_string = c_gda_value_new_from_string;

/** */
alias gda_value_new_from_xml = c_gda_value_new_from_xml;

/** */
alias gda_value_new_null = c_gda_value_new_null;

/** */
alias gda_value_new_timestamp_from_timet = c_gda_value_new_timestamp_from_timet;

/** */
alias gda_value_reset_with_type = c_gda_value_reset_with_type;

/** */
alias gda_value_set_binary = c_gda_value_set_binary;

/** */
alias gda_value_set_blob = c_gda_value_set_blob;

/** */
alias gda_value_set_from_string = c_gda_value_set_from_string;

/** */
alias gda_value_set_from_value = c_gda_value_set_from_value;

/** */
alias gda_value_set_geometric_point = c_gda_value_set_geometric_point;

/** */
alias gda_value_set_null = c_gda_value_set_null;

/** */
alias gda_value_set_numeric = c_gda_value_set_numeric;

/** */
alias gda_value_set_short = c_gda_value_set_short;

/** */
alias gda_value_set_time = c_gda_value_set_time;

/** */
alias gda_value_set_timestamp = c_gda_value_set_timestamp;

/** */
alias gda_value_set_ushort = c_gda_value_set_ushort;

/** */
alias gda_value_stringify = c_gda_value_stringify;

/** */
alias gda_value_take_binary = c_gda_value_take_binary;

/** */
alias gda_value_take_blob = c_gda_value_take_blob;

/** */
alias gda_value_to_xml = c_gda_value_to_xml;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // AttributesManager
  gidLink(cast(void**)&gda_attributes_manager_clear, "gda_attributes_manager_clear", libs);
  gidLink(cast(void**)&gda_attributes_manager_copy, "gda_attributes_manager_copy", libs);
  gidLink(cast(void**)&gda_attributes_manager_foreach, "gda_attributes_manager_foreach", libs);
  gidLink(cast(void**)&gda_attributes_manager_free, "gda_attributes_manager_free", libs);
  gidLink(cast(void**)&gda_attributes_manager_get, "gda_attributes_manager_get", libs);
  gidLink(cast(void**)&gda_attributes_manager_set, "gda_attributes_manager_set", libs);
  gidLink(cast(void**)&gda_attributes_manager_set_full, "gda_attributes_manager_set_full", libs);
  gidLink(cast(void**)&gda_attributes_manager_new, "gda_attributes_manager_new", libs);

  // Batch
  gidLink(cast(void**)&gda_batch_get_type, "gda_batch_get_type", libs);
  gidLink(cast(void**)&gda_batch_new, "gda_batch_new", libs);
  gidLink(cast(void**)&gda_batch_error_quark, "gda_batch_error_quark", libs);
  gidLink(cast(void**)&gda_batch_add_statement, "gda_batch_add_statement", libs);
  gidLink(cast(void**)&gda_batch_copy, "gda_batch_copy", libs);
  gidLink(cast(void**)&gda_batch_get_parameters, "gda_batch_get_parameters", libs);
  gidLink(cast(void**)&gda_batch_get_statements, "gda_batch_get_statements", libs);
  gidLink(cast(void**)&gda_batch_remove_statement, "gda_batch_remove_statement", libs);
  gidLink(cast(void**)&gda_batch_serialize, "gda_batch_serialize", libs);

  // Binary
  gidLink(cast(void**)&gda_binary_get_type, "gda_binary_get_type", libs);
  gidLink(cast(void**)&gda_binary_to_string, "gda_binary_to_string", libs);
  gidLink(cast(void**)&gda_binary_copy, "gda_binary_copy", libs);
  gidLink(cast(void**)&gda_binary_free, "gda_binary_free", libs);

  // Blob
  gidLink(cast(void**)&gda_blob_get_type, "gda_blob_get_type", libs);
  gidLink(cast(void**)&gda_blob_set_op, "gda_blob_set_op", libs);
  gidLink(cast(void**)&gda_blob_to_string, "gda_blob_to_string", libs);
  gidLink(cast(void**)&gda_blob_copy, "gda_blob_copy", libs);
  gidLink(cast(void**)&gda_blob_free, "gda_blob_free", libs);

  // BlobOp
  gidLink(cast(void**)&gda_blob_op_get_type, "gda_blob_op_get_type", libs);
  gidLink(cast(void**)&gda_blob_op_get_length, "gda_blob_op_get_length", libs);
  gidLink(cast(void**)&gda_blob_op_read, "gda_blob_op_read", libs);
  gidLink(cast(void**)&gda_blob_op_read_all, "gda_blob_op_read_all", libs);
  gidLink(cast(void**)&gda_blob_op_write, "gda_blob_op_write", libs);
  gidLink(cast(void**)&gda_blob_op_write_all, "gda_blob_op_write_all", libs);

  // Column
  gidLink(cast(void**)&gda_column_get_type, "gda_column_get_type", libs);
  gidLink(cast(void**)&gda_column_new, "gda_column_new", libs);
  gidLink(cast(void**)&gda_column_copy, "gda_column_copy", libs);
  gidLink(cast(void**)&gda_column_get_allow_null, "gda_column_get_allow_null", libs);
  gidLink(cast(void**)&gda_column_get_attribute, "gda_column_get_attribute", libs);
  gidLink(cast(void**)&gda_column_get_auto_increment, "gda_column_get_auto_increment", libs);
  gidLink(cast(void**)&gda_column_get_dbms_type, "gda_column_get_dbms_type", libs);
  gidLink(cast(void**)&gda_column_get_default_value, "gda_column_get_default_value", libs);
  gidLink(cast(void**)&gda_column_get_description, "gda_column_get_description", libs);
  gidLink(cast(void**)&gda_column_get_g_type, "gda_column_get_g_type", libs);
  gidLink(cast(void**)&gda_column_get_name, "gda_column_get_name", libs);
  gidLink(cast(void**)&gda_column_get_position, "gda_column_get_position", libs);
  gidLink(cast(void**)&gda_column_set_allow_null, "gda_column_set_allow_null", libs);
  gidLink(cast(void**)&gda_column_set_attribute, "gda_column_set_attribute", libs);
  gidLink(cast(void**)&gda_column_set_auto_increment, "gda_column_set_auto_increment", libs);
  gidLink(cast(void**)&gda_column_set_dbms_type, "gda_column_set_dbms_type", libs);
  gidLink(cast(void**)&gda_column_set_default_value, "gda_column_set_default_value", libs);
  gidLink(cast(void**)&gda_column_set_description, "gda_column_set_description", libs);
  gidLink(cast(void**)&gda_column_set_g_type, "gda_column_set_g_type", libs);
  gidLink(cast(void**)&gda_column_set_name, "gda_column_set_name", libs);
  gidLink(cast(void**)&gda_column_set_position, "gda_column_set_position", libs);

  // Config
  gidLink(cast(void**)&gda_config_get_type, "gda_config_get_type", libs);
  gidLink(cast(void**)&gda_config_can_modify_system_config, "gda_config_can_modify_system_config", libs);
  gidLink(cast(void**)&gda_config_define_dsn, "gda_config_define_dsn", libs);
  gidLink(cast(void**)&gda_config_dsn_needs_authentication, "gda_config_dsn_needs_authentication", libs);
  gidLink(cast(void**)&gda_config_error_quark, "gda_config_error_quark", libs);
  gidLink(cast(void**)&gda_config_get, "gda_config_get", libs);
  gidLink(cast(void**)&gda_config_get_dsn_info, "gda_config_get_dsn_info", libs);
  gidLink(cast(void**)&gda_config_get_dsn_info_at_index, "gda_config_get_dsn_info_at_index", libs);
  gidLink(cast(void**)&gda_config_get_dsn_info_index, "gda_config_get_dsn_info_index", libs);
  gidLink(cast(void**)&gda_config_get_nb_dsn, "gda_config_get_nb_dsn", libs);
  gidLink(cast(void**)&gda_config_get_provider, "gda_config_get_provider", libs);
  gidLink(cast(void**)&gda_config_get_provider_info, "gda_config_get_provider_info", libs);
  gidLink(cast(void**)&gda_config_list_dsn, "gda_config_list_dsn", libs);
  gidLink(cast(void**)&gda_config_list_providers, "gda_config_list_providers", libs);
  gidLink(cast(void**)&gda_config_remove_dsn, "gda_config_remove_dsn", libs);

  // Connection
  gidLink(cast(void**)&gda_connection_get_type, "gda_connection_get_type", libs);
  gidLink(cast(void**)&gda_connection_new_from_dsn, "gda_connection_new_from_dsn", libs);
  gidLink(cast(void**)&gda_connection_new_from_string, "gda_connection_new_from_string", libs);
  gidLink(cast(void**)&gda_connection_error_quark, "gda_connection_error_quark", libs);
  gidLink(cast(void**)&gda_connection_open_from_dsn, "gda_connection_open_from_dsn", libs);
  gidLink(cast(void**)&gda_connection_open_from_string, "gda_connection_open_from_string", libs);
  gidLink(cast(void**)&gda_connection_open_sqlite, "gda_connection_open_sqlite", libs);
  gidLink(cast(void**)&gda_connection_string_split, "gda_connection_string_split", libs);
  gidLink(cast(void**)&gda_connection_add_event, "gda_connection_add_event", libs);
  gidLink(cast(void**)&gda_connection_add_event_string, "gda_connection_add_event_string", libs);
  gidLink(cast(void**)&gda_connection_add_prepared_statement, "gda_connection_add_prepared_statement", libs);
  gidLink(cast(void**)&gda_connection_add_savepoint, "gda_connection_add_savepoint", libs);
  gidLink(cast(void**)&gda_connection_async_cancel, "gda_connection_async_cancel", libs);
  gidLink(cast(void**)&gda_connection_async_fetch_result, "gda_connection_async_fetch_result", libs);
  gidLink(cast(void**)&gda_connection_async_statement_execute, "gda_connection_async_statement_execute", libs);
  gidLink(cast(void**)&gda_connection_batch_execute, "gda_connection_batch_execute", libs);
  gidLink(cast(void**)&gda_connection_begin_transaction, "gda_connection_begin_transaction", libs);
  gidLink(cast(void**)&gda_connection_clear_events_list, "gda_connection_clear_events_list", libs);
  gidLink(cast(void**)&gda_connection_close, "gda_connection_close", libs);
  gidLink(cast(void**)&gda_connection_close_no_warning, "gda_connection_close_no_warning", libs);
  gidLink(cast(void**)&gda_connection_commit_transaction, "gda_connection_commit_transaction", libs);
  gidLink(cast(void**)&gda_connection_create_operation, "gda_connection_create_operation", libs);
  gidLink(cast(void**)&gda_connection_create_parser, "gda_connection_create_parser", libs);
  gidLink(cast(void**)&gda_connection_del_prepared_statement, "gda_connection_del_prepared_statement", libs);
  gidLink(cast(void**)&gda_connection_delete_row_from_table, "gda_connection_delete_row_from_table", libs);
  gidLink(cast(void**)&gda_connection_delete_savepoint, "gda_connection_delete_savepoint", libs);
  gidLink(cast(void**)&gda_connection_execute_non_select_command, "gda_connection_execute_non_select_command", libs);
  gidLink(cast(void**)&gda_connection_execute_select_command, "gda_connection_execute_select_command", libs);
  gidLink(cast(void**)&gda_connection_get_authentication, "gda_connection_get_authentication", libs);
  gidLink(cast(void**)&gda_connection_get_cnc_string, "gda_connection_get_cnc_string", libs);
  gidLink(cast(void**)&gda_connection_get_date_format, "gda_connection_get_date_format", libs);
  gidLink(cast(void**)&gda_connection_get_dsn, "gda_connection_get_dsn", libs);
  gidLink(cast(void**)&gda_connection_get_events, "gda_connection_get_events", libs);
  gidLink(cast(void**)&gda_connection_get_meta_store, "gda_connection_get_meta_store", libs);
  gidLink(cast(void**)&gda_connection_get_meta_store_data, "gda_connection_get_meta_store_data", libs);
  gidLink(cast(void**)&gda_connection_get_meta_store_data_v, "gda_connection_get_meta_store_data_v", libs);
  gidLink(cast(void**)&gda_connection_get_options, "gda_connection_get_options", libs);
  gidLink(cast(void**)&gda_connection_get_prepared_statement, "gda_connection_get_prepared_statement", libs);
  gidLink(cast(void**)&gda_connection_get_provider, "gda_connection_get_provider", libs);
  gidLink(cast(void**)&gda_connection_get_provider_name, "gda_connection_get_provider_name", libs);
  gidLink(cast(void**)&gda_connection_get_transaction_status, "gda_connection_get_transaction_status", libs);
  gidLink(cast(void**)&gda_connection_insert_row_into_table, "gda_connection_insert_row_into_table", libs);
  gidLink(cast(void**)&gda_connection_insert_row_into_table_v, "gda_connection_insert_row_into_table_v", libs);
  gidLink(cast(void**)&gda_connection_internal_change_transaction_state, "gda_connection_internal_change_transaction_state", libs);
  gidLink(cast(void**)&gda_connection_internal_get_provider_data, "gda_connection_internal_get_provider_data", libs);
  gidLink(cast(void**)&gda_connection_internal_get_provider_data_error, "gda_connection_internal_get_provider_data_error", libs);
  gidLink(cast(void**)&gda_connection_internal_reset_transaction_status, "gda_connection_internal_reset_transaction_status", libs);
  gidLink(cast(void**)&gda_connection_internal_savepoint_added, "gda_connection_internal_savepoint_added", libs);
  gidLink(cast(void**)&gda_connection_internal_savepoint_removed, "gda_connection_internal_savepoint_removed", libs);
  gidLink(cast(void**)&gda_connection_internal_savepoint_rolledback, "gda_connection_internal_savepoint_rolledback", libs);
  gidLink(cast(void**)&gda_connection_internal_set_provider_data, "gda_connection_internal_set_provider_data", libs);
  gidLink(cast(void**)&gda_connection_internal_statement_executed, "gda_connection_internal_statement_executed", libs);
  gidLink(cast(void**)&gda_connection_internal_transaction_committed, "gda_connection_internal_transaction_committed", libs);
  gidLink(cast(void**)&gda_connection_internal_transaction_rolledback, "gda_connection_internal_transaction_rolledback", libs);
  gidLink(cast(void**)&gda_connection_internal_transaction_started, "gda_connection_internal_transaction_started", libs);
  gidLink(cast(void**)&gda_connection_is_opened, "gda_connection_is_opened", libs);
  gidLink(cast(void**)&gda_connection_open, "gda_connection_open", libs);
  gidLink(cast(void**)&gda_connection_parse_sql_string, "gda_connection_parse_sql_string", libs);
  gidLink(cast(void**)&gda_connection_perform_operation, "gda_connection_perform_operation", libs);
  gidLink(cast(void**)&gda_connection_point_available_event, "gda_connection_point_available_event", libs);
  gidLink(cast(void**)&gda_connection_quote_sql_identifier, "gda_connection_quote_sql_identifier", libs);
  gidLink(cast(void**)&gda_connection_repetitive_statement_execute, "gda_connection_repetitive_statement_execute", libs);
  gidLink(cast(void**)&gda_connection_rollback_savepoint, "gda_connection_rollback_savepoint", libs);
  gidLink(cast(void**)&gda_connection_rollback_transaction, "gda_connection_rollback_transaction", libs);
  gidLink(cast(void**)&gda_connection_statement_execute, "gda_connection_statement_execute", libs);
  gidLink(cast(void**)&gda_connection_statement_execute_non_select, "gda_connection_statement_execute_non_select", libs);
  gidLink(cast(void**)&gda_connection_statement_execute_select, "gda_connection_statement_execute_select", libs);
  gidLink(cast(void**)&gda_connection_statement_execute_select_full, "gda_connection_statement_execute_select_full", libs);
  gidLink(cast(void**)&gda_connection_statement_execute_select_fullv, "gda_connection_statement_execute_select_fullv", libs);
  gidLink(cast(void**)&gda_connection_statement_prepare, "gda_connection_statement_prepare", libs);
  gidLink(cast(void**)&gda_connection_statement_to_sql, "gda_connection_statement_to_sql", libs);
  gidLink(cast(void**)&gda_connection_supports_feature, "gda_connection_supports_feature", libs);
  gidLink(cast(void**)&gda_connection_update_meta_store, "gda_connection_update_meta_store", libs);
  gidLink(cast(void**)&gda_connection_update_row_in_table, "gda_connection_update_row_in_table", libs);
  gidLink(cast(void**)&gda_connection_update_row_in_table_v, "gda_connection_update_row_in_table_v", libs);
  gidLink(cast(void**)&gda_connection_value_to_sql_string, "gda_connection_value_to_sql_string", libs);

  // ConnectionEvent
  gidLink(cast(void**)&gda_connection_event_get_type, "gda_connection_event_get_type", libs);
  gidLink(cast(void**)&gda_connection_event_get_code, "gda_connection_event_get_code", libs);
  gidLink(cast(void**)&gda_connection_event_get_description, "gda_connection_event_get_description", libs);
  gidLink(cast(void**)&gda_connection_event_get_event_type, "gda_connection_event_get_event_type", libs);
  gidLink(cast(void**)&gda_connection_event_get_gda_code, "gda_connection_event_get_gda_code", libs);
  gidLink(cast(void**)&gda_connection_event_get_source, "gda_connection_event_get_source", libs);
  gidLink(cast(void**)&gda_connection_event_get_sqlstate, "gda_connection_event_get_sqlstate", libs);
  gidLink(cast(void**)&gda_connection_event_set_code, "gda_connection_event_set_code", libs);
  gidLink(cast(void**)&gda_connection_event_set_description, "gda_connection_event_set_description", libs);
  gidLink(cast(void**)&gda_connection_event_set_event_type, "gda_connection_event_set_event_type", libs);
  gidLink(cast(void**)&gda_connection_event_set_gda_code, "gda_connection_event_set_gda_code", libs);
  gidLink(cast(void**)&gda_connection_event_set_source, "gda_connection_event_set_source", libs);
  gidLink(cast(void**)&gda_connection_event_set_sqlstate, "gda_connection_event_set_sqlstate", libs);

  // DataAccessWrapper
  gidLink(cast(void**)&gda_data_access_wrapper_get_type, "gda_data_access_wrapper_get_type", libs);
  gidLink(cast(void**)&gda_data_access_wrapper_new, "gda_data_access_wrapper_new", libs);
  gidLink(cast(void**)&gda_data_access_wrapper_set_mapping, "gda_data_access_wrapper_set_mapping", libs);

  // DataComparator
  gidLink(cast(void**)&gda_data_comparator_get_type, "gda_data_comparator_get_type", libs);
  gidLink(cast(void**)&gda_data_comparator_new, "gda_data_comparator_new", libs);
  gidLink(cast(void**)&gda_data_comparator_error_quark, "gda_data_comparator_error_quark", libs);
  gidLink(cast(void**)&gda_data_comparator_compute_diff, "gda_data_comparator_compute_diff", libs);
  gidLink(cast(void**)&gda_data_comparator_get_diff, "gda_data_comparator_get_diff", libs);
  gidLink(cast(void**)&gda_data_comparator_get_n_diffs, "gda_data_comparator_get_n_diffs", libs);
  gidLink(cast(void**)&gda_data_comparator_set_key_columns, "gda_data_comparator_set_key_columns", libs);

  // DataHandler
  gidLink(cast(void**)&gda_data_handler_get_type, "gda_data_handler_get_type", libs);
  gidLink(cast(void**)&gda_data_handler_get_default, "gda_data_handler_get_default", libs);
  gidLink(cast(void**)&gda_data_handler_accepts_g_type, "gda_data_handler_accepts_g_type", libs);
  gidLink(cast(void**)&gda_data_handler_get_descr, "gda_data_handler_get_descr", libs);
  gidLink(cast(void**)&gda_data_handler_get_sane_init_value, "gda_data_handler_get_sane_init_value", libs);
  gidLink(cast(void**)&gda_data_handler_get_sql_from_value, "gda_data_handler_get_sql_from_value", libs);
  gidLink(cast(void**)&gda_data_handler_get_str_from_value, "gda_data_handler_get_str_from_value", libs);
  gidLink(cast(void**)&gda_data_handler_get_value_from_sql, "gda_data_handler_get_value_from_sql", libs);
  gidLink(cast(void**)&gda_data_handler_get_value_from_str, "gda_data_handler_get_value_from_str", libs);

  // DataModel
  gidLink(cast(void**)&gda_data_model_get_type, "gda_data_model_get_type", libs);
  gidLink(cast(void**)&gda_data_model_error_quark, "gda_data_model_error_quark", libs);
  gidLink(cast(void**)&gda_data_model_add_data_from_xml_node, "gda_data_model_add_data_from_xml_node", libs);
  gidLink(cast(void**)&gda_data_model_append_row, "gda_data_model_append_row", libs);
  gidLink(cast(void**)&gda_data_model_append_values, "gda_data_model_append_values", libs);
  gidLink(cast(void**)&gda_data_model_array_copy_model, "gda_data_model_array_copy_model", libs);
  gidLink(cast(void**)&gda_data_model_array_copy_model_ext, "gda_data_model_array_copy_model_ext", libs);
  gidLink(cast(void**)&gda_data_model_create_iter, "gda_data_model_create_iter", libs);
  gidLink(cast(void**)&gda_data_model_describe_column, "gda_data_model_describe_column", libs);
  gidLink(cast(void**)&gda_data_model_dump, "gda_data_model_dump", libs);
  gidLink(cast(void**)&gda_data_model_dump_as_string, "gda_data_model_dump_as_string", libs);
  gidLink(cast(void**)&gda_data_model_export_to_file, "gda_data_model_export_to_file", libs);
  gidLink(cast(void**)&gda_data_model_export_to_string, "gda_data_model_export_to_string", libs);
  gidLink(cast(void**)&gda_data_model_freeze, "gda_data_model_freeze", libs);
  gidLink(cast(void**)&gda_data_model_get_access_flags, "gda_data_model_get_access_flags", libs);
  gidLink(cast(void**)&gda_data_model_get_attributes_at, "gda_data_model_get_attributes_at", libs);
  gidLink(cast(void**)&gda_data_model_get_column_index, "gda_data_model_get_column_index", libs);
  gidLink(cast(void**)&gda_data_model_get_column_name, "gda_data_model_get_column_name", libs);
  gidLink(cast(void**)&gda_data_model_get_column_title, "gda_data_model_get_column_title", libs);
  gidLink(cast(void**)&gda_data_model_get_exceptions, "gda_data_model_get_exceptions", libs);
  gidLink(cast(void**)&gda_data_model_get_n_columns, "gda_data_model_get_n_columns", libs);
  gidLink(cast(void**)&gda_data_model_get_n_rows, "gda_data_model_get_n_rows", libs);
  gidLink(cast(void**)&gda_data_model_get_notify, "gda_data_model_get_notify", libs);
  gidLink(cast(void**)&gda_data_model_get_row_from_values, "gda_data_model_get_row_from_values", libs);
  gidLink(cast(void**)&gda_data_model_get_typed_value_at, "gda_data_model_get_typed_value_at", libs);
  gidLink(cast(void**)&gda_data_model_get_value_at, "gda_data_model_get_value_at", libs);
  gidLink(cast(void**)&gda_data_model_import_from_file, "gda_data_model_import_from_file", libs);
  gidLink(cast(void**)&gda_data_model_import_from_model, "gda_data_model_import_from_model", libs);
  gidLink(cast(void**)&gda_data_model_import_from_string, "gda_data_model_import_from_string", libs);
  gidLink(cast(void**)&gda_data_model_iter_at_row, "gda_data_model_iter_at_row", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_next_default, "gda_data_model_iter_move_next_default", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_prev_default, "gda_data_model_iter_move_prev_default", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_to_row_default, "gda_data_model_iter_move_to_row_default", libs);
  gidLink(cast(void**)&gda_data_model_iter_next, "gda_data_model_iter_next", libs);
  gidLink(cast(void**)&gda_data_model_iter_prev, "gda_data_model_iter_prev", libs);
  gidLink(cast(void**)&gda_data_model_iter_set_value, "gda_data_model_iter_set_value", libs);
  gidLink(cast(void**)&gda_data_model_remove_row, "gda_data_model_remove_row", libs);
  gidLink(cast(void**)&gda_data_model_reset, "gda_data_model_reset", libs);
  gidLink(cast(void**)&gda_data_model_row_inserted, "gda_data_model_row_inserted", libs);
  gidLink(cast(void**)&gda_data_model_row_removed, "gda_data_model_row_removed", libs);
  gidLink(cast(void**)&gda_data_model_row_updated, "gda_data_model_row_updated", libs);
  gidLink(cast(void**)&gda_data_model_send_hint, "gda_data_model_send_hint", libs);
  gidLink(cast(void**)&gda_data_model_set_column_name, "gda_data_model_set_column_name", libs);
  gidLink(cast(void**)&gda_data_model_set_column_title, "gda_data_model_set_column_title", libs);
  gidLink(cast(void**)&gda_data_model_set_notify, "gda_data_model_set_notify", libs);
  gidLink(cast(void**)&gda_data_model_set_value_at, "gda_data_model_set_value_at", libs);
  gidLink(cast(void**)&gda_data_model_set_values, "gda_data_model_set_values", libs);
  gidLink(cast(void**)&gda_data_model_thaw, "gda_data_model_thaw", libs);

  // DataModelArray
  gidLink(cast(void**)&gda_data_model_array_get_type, "gda_data_model_array_get_type", libs);
  gidLink(cast(void**)&gda_data_model_array_new, "gda_data_model_array_new", libs);
  gidLink(cast(void**)&gda_data_model_array_new_with_g_types, "gda_data_model_array_new_with_g_types", libs);
  gidLink(cast(void**)&gda_data_model_array_new_with_g_types_v, "gda_data_model_array_new_with_g_types_v", libs);
  gidLink(cast(void**)&gda_data_model_array_clear, "gda_data_model_array_clear", libs);
  gidLink(cast(void**)&gda_data_model_array_get_row, "gda_data_model_array_get_row", libs);
  gidLink(cast(void**)&gda_data_model_array_set_n_columns, "gda_data_model_array_set_n_columns", libs);

  // DataModelDir
  gidLink(cast(void**)&gda_data_model_dir_get_type, "gda_data_model_dir_get_type", libs);
  gidLink(cast(void**)&gda_data_model_dir_new, "gda_data_model_dir_new", libs);
  gidLink(cast(void**)&gda_data_model_dir_clean_errors, "gda_data_model_dir_clean_errors", libs);
  gidLink(cast(void**)&gda_data_model_dir_get_errors, "gda_data_model_dir_get_errors", libs);

  // DataModelImport
  gidLink(cast(void**)&gda_data_model_import_get_type, "gda_data_model_import_get_type", libs);
  gidLink(cast(void**)&gda_data_model_import_new_file, "gda_data_model_import_new_file", libs);
  gidLink(cast(void**)&gda_data_model_import_new_mem, "gda_data_model_import_new_mem", libs);
  gidLink(cast(void**)&gda_data_model_import_new_xml_node, "gda_data_model_import_new_xml_node", libs);
  gidLink(cast(void**)&gda_data_model_import_clean_errors, "gda_data_model_import_clean_errors", libs);
  gidLink(cast(void**)&gda_data_model_import_get_errors, "gda_data_model_import_get_errors", libs);

  // DataModelIter
  gidLink(cast(void**)&gda_data_model_iter_get_type, "gda_data_model_iter_get_type", libs);
  gidLink(cast(void**)&gda_data_model_iter_error_quark, "gda_data_model_iter_error_quark", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_column_for_param, "gda_data_model_iter_get_column_for_param", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_holder_for_field, "gda_data_model_iter_get_holder_for_field", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_row, "gda_data_model_iter_get_row", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_value_at, "gda_data_model_iter_get_value_at", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_value_at_e, "gda_data_model_iter_get_value_at_e", libs);
  gidLink(cast(void**)&gda_data_model_iter_get_value_for_field, "gda_data_model_iter_get_value_for_field", libs);
  gidLink(cast(void**)&gda_data_model_iter_invalidate_contents, "gda_data_model_iter_invalidate_contents", libs);
  gidLink(cast(void**)&gda_data_model_iter_is_valid, "gda_data_model_iter_is_valid", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_next, "gda_data_model_iter_move_next", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_prev, "gda_data_model_iter_move_prev", libs);
  gidLink(cast(void**)&gda_data_model_iter_move_to_row, "gda_data_model_iter_move_to_row", libs);
  gidLink(cast(void**)&gda_data_model_iter_set_value_at, "gda_data_model_iter_set_value_at", libs);

  // DataPivot
  gidLink(cast(void**)&gda_data_pivot_get_type, "gda_data_pivot_get_type", libs);
  gidLink(cast(void**)&gda_data_pivot_error_quark, "gda_data_pivot_error_quark", libs);
  gidLink(cast(void**)&gda_data_pivot_new, "gda_data_pivot_new", libs);
  gidLink(cast(void**)&gda_data_pivot_add_data, "gda_data_pivot_add_data", libs);
  gidLink(cast(void**)&gda_data_pivot_add_field, "gda_data_pivot_add_field", libs);
  gidLink(cast(void**)&gda_data_pivot_populate, "gda_data_pivot_populate", libs);

  // DataProxy
  gidLink(cast(void**)&gda_data_proxy_get_type, "gda_data_proxy_get_type", libs);
  gidLink(cast(void**)&gda_data_proxy_new, "gda_data_proxy_new", libs);
  gidLink(cast(void**)&gda_data_proxy_new_with_data_model, "gda_data_proxy_new_with_data_model", libs);
  gidLink(cast(void**)&gda_data_proxy_error_quark, "gda_data_proxy_error_quark", libs);
  gidLink(cast(void**)&gda_data_proxy_alter_value_attributes, "gda_data_proxy_alter_value_attributes", libs);
  gidLink(cast(void**)&gda_data_proxy_apply_all_changes, "gda_data_proxy_apply_all_changes", libs);
  gidLink(cast(void**)&gda_data_proxy_apply_row_changes, "gda_data_proxy_apply_row_changes", libs);
  gidLink(cast(void**)&gda_data_proxy_cancel_all_changes, "gda_data_proxy_cancel_all_changes", libs);
  gidLink(cast(void**)&gda_data_proxy_cancel_row_changes, "gda_data_proxy_cancel_row_changes", libs);
  gidLink(cast(void**)&gda_data_proxy_delete, "gda_data_proxy_delete", libs);
  gidLink(cast(void**)&gda_data_proxy_get_filter_expr, "gda_data_proxy_get_filter_expr", libs);
  gidLink(cast(void**)&gda_data_proxy_get_filtered_n_rows, "gda_data_proxy_get_filtered_n_rows", libs);
  gidLink(cast(void**)&gda_data_proxy_get_n_modified_rows, "gda_data_proxy_get_n_modified_rows", libs);
  gidLink(cast(void**)&gda_data_proxy_get_n_new_rows, "gda_data_proxy_get_n_new_rows", libs);
  gidLink(cast(void**)&gda_data_proxy_get_proxied_model, "gda_data_proxy_get_proxied_model", libs);
  gidLink(cast(void**)&gda_data_proxy_get_proxied_model_n_cols, "gda_data_proxy_get_proxied_model_n_cols", libs);
  gidLink(cast(void**)&gda_data_proxy_get_proxied_model_n_rows, "gda_data_proxy_get_proxied_model_n_rows", libs);
  gidLink(cast(void**)&gda_data_proxy_get_proxied_model_row, "gda_data_proxy_get_proxied_model_row", libs);
  gidLink(cast(void**)&gda_data_proxy_get_sample_end, "gda_data_proxy_get_sample_end", libs);
  gidLink(cast(void**)&gda_data_proxy_get_sample_size, "gda_data_proxy_get_sample_size", libs);
  gidLink(cast(void**)&gda_data_proxy_get_sample_start, "gda_data_proxy_get_sample_start", libs);
  gidLink(cast(void**)&gda_data_proxy_get_value_attributes, "gda_data_proxy_get_value_attributes", libs);
  gidLink(cast(void**)&gda_data_proxy_get_values, "gda_data_proxy_get_values", libs);
  gidLink(cast(void**)&gda_data_proxy_has_changed, "gda_data_proxy_has_changed", libs);
  gidLink(cast(void**)&gda_data_proxy_is_read_only, "gda_data_proxy_is_read_only", libs);
  gidLink(cast(void**)&gda_data_proxy_row_has_changed, "gda_data_proxy_row_has_changed", libs);
  gidLink(cast(void**)&gda_data_proxy_row_is_deleted, "gda_data_proxy_row_is_deleted", libs);
  gidLink(cast(void**)&gda_data_proxy_row_is_inserted, "gda_data_proxy_row_is_inserted", libs);
  gidLink(cast(void**)&gda_data_proxy_set_filter_expr, "gda_data_proxy_set_filter_expr", libs);
  gidLink(cast(void**)&gda_data_proxy_set_ordering_column, "gda_data_proxy_set_ordering_column", libs);
  gidLink(cast(void**)&gda_data_proxy_set_sample_size, "gda_data_proxy_set_sample_size", libs);
  gidLink(cast(void**)&gda_data_proxy_set_sample_start, "gda_data_proxy_set_sample_start", libs);
  gidLink(cast(void**)&gda_data_proxy_undelete, "gda_data_proxy_undelete", libs);

  // DataSelect
  gidLink(cast(void**)&gda_data_select_get_type, "gda_data_select_get_type", libs);
  gidLink(cast(void**)&gda_data_select_error_quark, "gda_data_select_error_quark", libs);
  gidLink(cast(void**)&gda_data_select_compute_columns_attributes, "gda_data_select_compute_columns_attributes", libs);
  gidLink(cast(void**)&gda_data_select_compute_modification_statements, "gda_data_select_compute_modification_statements", libs);
  gidLink(cast(void**)&gda_data_select_compute_modification_statements_ext, "gda_data_select_compute_modification_statements_ext", libs);
  gidLink(cast(void**)&gda_data_select_compute_row_selection_condition, "gda_data_select_compute_row_selection_condition", libs);
  gidLink(cast(void**)&gda_data_select_get_connection, "gda_data_select_get_connection", libs);
  gidLink(cast(void**)&gda_data_select_prepare_for_offline, "gda_data_select_prepare_for_offline", libs);
  gidLink(cast(void**)&gda_data_select_rerun, "gda_data_select_rerun", libs);
  gidLink(cast(void**)&gda_data_select_set_modification_statement, "gda_data_select_set_modification_statement", libs);
  gidLink(cast(void**)&gda_data_select_set_modification_statement_sql, "gda_data_select_set_modification_statement_sql", libs);
  gidLink(cast(void**)&gda_data_select_set_row_selection_condition, "gda_data_select_set_row_selection_condition", libs);
  gidLink(cast(void**)&gda_data_select_set_row_selection_condition_sql, "gda_data_select_set_row_selection_condition_sql", libs);

  // DsnInfo
  gidLink(cast(void**)&gda_dsn_info_get_type, "gda_dsn_info_get_type", libs);
  gidLink(cast(void**)&gda_dsn_info_new, "gda_dsn_info_new", libs);
  gidLink(cast(void**)&gda_dsn_info_copy, "gda_dsn_info_copy", libs);
  gidLink(cast(void**)&gda_dsn_info_free, "gda_dsn_info_free", libs);

  // GeometricPoint
  gidLink(cast(void**)&gda_geometricpoint_get_type, "gda_geometricpoint_get_type", libs);
  gidLink(cast(void**)&gda_geometricpoint_copy, "gda_geometricpoint_copy", libs);
  gidLink(cast(void**)&gda_geometricpoint_free, "gda_geometricpoint_free", libs);

  // HandlerBin
  gidLink(cast(void**)&gda_handler_bin_get_type, "gda_handler_bin_get_type", libs);
  gidLink(cast(void**)&gda_handler_bin_new, "gda_handler_bin_new", libs);

  // HandlerBoolean
  gidLink(cast(void**)&gda_handler_boolean_get_type, "gda_handler_boolean_get_type", libs);
  gidLink(cast(void**)&gda_handler_boolean_new, "gda_handler_boolean_new", libs);

  // HandlerNumerical
  gidLink(cast(void**)&gda_handler_numerical_get_type, "gda_handler_numerical_get_type", libs);
  gidLink(cast(void**)&gda_handler_numerical_new, "gda_handler_numerical_new", libs);

  // HandlerString
  gidLink(cast(void**)&gda_handler_string_get_type, "gda_handler_string_get_type", libs);
  gidLink(cast(void**)&gda_handler_string_new, "gda_handler_string_new", libs);
  gidLink(cast(void**)&gda_handler_string_new_with_provider, "gda_handler_string_new_with_provider", libs);

  // HandlerTime
  gidLink(cast(void**)&gda_handler_time_get_type, "gda_handler_time_get_type", libs);
  gidLink(cast(void**)&gda_handler_time_new, "gda_handler_time_new", libs);
  gidLink(cast(void**)&gda_handler_time_new_no_locale, "gda_handler_time_new_no_locale", libs);
  gidLink(cast(void**)&gda_handler_time_get_format, "gda_handler_time_get_format", libs);
  gidLink(cast(void**)&gda_handler_time_get_no_locale_str_from_value, "gda_handler_time_get_no_locale_str_from_value", libs);
  gidLink(cast(void**)&gda_handler_time_set_sql_spec, "gda_handler_time_set_sql_spec", libs);
  gidLink(cast(void**)&gda_handler_time_set_str_spec, "gda_handler_time_set_str_spec", libs);

  // HandlerType
  gidLink(cast(void**)&gda_handler_type_get_type, "gda_handler_type_get_type", libs);
  gidLink(cast(void**)&gda_handler_type_new, "gda_handler_type_new", libs);

  // Holder
  gidLink(cast(void**)&gda_holder_get_type, "gda_holder_get_type", libs);
  gidLink(cast(void**)&gda_holder_new, "gda_holder_new", libs);
  gidLink(cast(void**)&gda_holder_new_inline, "gda_holder_new_inline", libs);
  gidLink(cast(void**)&gda_holder_error_quark, "gda_holder_error_quark", libs);
  gidLink(cast(void**)&gda_holder_copy, "gda_holder_copy", libs);
  gidLink(cast(void**)&gda_holder_force_invalid, "gda_holder_force_invalid", libs);
  gidLink(cast(void**)&gda_holder_force_invalid_e, "gda_holder_force_invalid_e", libs);
  gidLink(cast(void**)&gda_holder_get_alphanum_id, "gda_holder_get_alphanum_id", libs);
  gidLink(cast(void**)&gda_holder_get_attribute, "gda_holder_get_attribute", libs);
  gidLink(cast(void**)&gda_holder_get_bind, "gda_holder_get_bind", libs);
  gidLink(cast(void**)&gda_holder_get_default_value, "gda_holder_get_default_value", libs);
  gidLink(cast(void**)&gda_holder_get_g_type, "gda_holder_get_g_type", libs);
  gidLink(cast(void**)&gda_holder_get_id, "gda_holder_get_id", libs);
  gidLink(cast(void**)&gda_holder_get_not_null, "gda_holder_get_not_null", libs);
  gidLink(cast(void**)&gda_holder_get_source_model, "gda_holder_get_source_model", libs);
  gidLink(cast(void**)&gda_holder_get_value, "gda_holder_get_value", libs);
  gidLink(cast(void**)&gda_holder_get_value_str, "gda_holder_get_value_str", libs);
  gidLink(cast(void**)&gda_holder_is_valid, "gda_holder_is_valid", libs);
  gidLink(cast(void**)&gda_holder_is_valid_e, "gda_holder_is_valid_e", libs);
  gidLink(cast(void**)&gda_holder_set_attribute, "gda_holder_set_attribute", libs);
  gidLink(cast(void**)&gda_holder_set_bind, "gda_holder_set_bind", libs);
  gidLink(cast(void**)&gda_holder_set_default_value, "gda_holder_set_default_value", libs);
  gidLink(cast(void**)&gda_holder_set_not_null, "gda_holder_set_not_null", libs);
  gidLink(cast(void**)&gda_holder_set_source_model, "gda_holder_set_source_model", libs);
  gidLink(cast(void**)&gda_holder_set_value, "gda_holder_set_value", libs);
  gidLink(cast(void**)&gda_holder_set_value_str, "gda_holder_set_value_str", libs);
  gidLink(cast(void**)&gda_holder_set_value_to_default, "gda_holder_set_value_to_default", libs);
  gidLink(cast(void**)&gda_holder_take_static_value, "gda_holder_take_static_value", libs);
  gidLink(cast(void**)&gda_holder_take_value, "gda_holder_take_value", libs);
  gidLink(cast(void**)&gda_holder_value_is_default, "gda_holder_value_is_default", libs);

  // Lockable
  gidLink(cast(void**)&gda_lockable_get_type, "gda_lockable_get_type", libs);
  gidLink(cast(void**)&gda_lockable_lock, "gda_lockable_lock", libs);
  gidLink(cast(void**)&gda_lockable_trylock, "gda_lockable_trylock", libs);
  gidLink(cast(void**)&gda_lockable_unlock, "gda_lockable_unlock", libs);

  // MetaContext
  gidLink(cast(void**)&gda_meta_context_get_type, "gda_meta_context_get_type", libs);
  gidLink(cast(void**)&gda_meta_context_new, "gda_meta_context_new", libs);
  gidLink(cast(void**)&gda_meta_context_copy, "gda_meta_context_copy", libs);
  gidLink(cast(void**)&gda_meta_context_free, "gda_meta_context_free", libs);
  gidLink(cast(void**)&gda_meta_context_get_table, "gda_meta_context_get_table", libs);
  gidLink(cast(void**)&gda_meta_context_set_column, "gda_meta_context_set_column", libs);
  gidLink(cast(void**)&gda_meta_context_set_columns, "gda_meta_context_set_columns", libs);
  gidLink(cast(void**)&gda_meta_context_set_table, "gda_meta_context_set_table", libs);

  // MetaStore
  gidLink(cast(void**)&gda_meta_store_get_type, "gda_meta_store_get_type", libs);
  gidLink(cast(void**)&gda_meta_store_new, "gda_meta_store_new", libs);
  gidLink(cast(void**)&gda_meta_store_new_with_file, "gda_meta_store_new_with_file", libs);
  gidLink(cast(void**)&gda_meta_store_error_quark, "gda_meta_store_error_quark", libs);
  gidLink(cast(void**)&gda_meta_store_sql_identifier_quote, "gda_meta_store_sql_identifier_quote", libs);
  gidLink(cast(void**)&gda_meta_store_create_modify_data_model, "gda_meta_store_create_modify_data_model", libs);
  gidLink(cast(void**)&gda_meta_store_declare_foreign_key, "gda_meta_store_declare_foreign_key", libs);
  gidLink(cast(void**)&gda_meta_store_extract, "gda_meta_store_extract", libs);
  gidLink(cast(void**)&gda_meta_store_extract_v, "gda_meta_store_extract_v", libs);
  gidLink(cast(void**)&gda_meta_store_get_attribute_value, "gda_meta_store_get_attribute_value", libs);
  gidLink(cast(void**)&gda_meta_store_get_internal_connection, "gda_meta_store_get_internal_connection", libs);
  gidLink(cast(void**)&gda_meta_store_get_version, "gda_meta_store_get_version", libs);
  gidLink(cast(void**)&gda_meta_store_modify, "gda_meta_store_modify", libs);
  gidLink(cast(void**)&gda_meta_store_modify_v, "gda_meta_store_modify_v", libs);
  gidLink(cast(void**)&gda_meta_store_modify_with_context, "gda_meta_store_modify_with_context", libs);
  gidLink(cast(void**)&gda_meta_store_schema_add_custom_object, "gda_meta_store_schema_add_custom_object", libs);
  gidLink(cast(void**)&gda_meta_store_schema_get_all_tables, "gda_meta_store_schema_get_all_tables", libs);
  gidLink(cast(void**)&gda_meta_store_schema_get_depend_tables, "gda_meta_store_schema_get_depend_tables", libs);
  gidLink(cast(void**)&gda_meta_store_schema_get_structure, "gda_meta_store_schema_get_structure", libs);
  gidLink(cast(void**)&gda_meta_store_schema_remove_custom_object, "gda_meta_store_schema_remove_custom_object", libs);
  gidLink(cast(void**)&gda_meta_store_set_attribute_value, "gda_meta_store_set_attribute_value", libs);
  gidLink(cast(void**)&gda_meta_store_set_identifiers_style, "gda_meta_store_set_identifiers_style", libs);
  gidLink(cast(void**)&gda_meta_store_set_reserved_keywords_func, "gda_meta_store_set_reserved_keywords_func", libs);
  gidLink(cast(void**)&gda_meta_store_undeclare_foreign_key, "gda_meta_store_undeclare_foreign_key", libs);

  // MetaStruct
  gidLink(cast(void**)&gda_meta_struct_get_type, "gda_meta_struct_get_type", libs);
  gidLink(cast(void**)&gda_meta_struct_new, "gda_meta_struct_new", libs);
  gidLink(cast(void**)&gda_meta_struct_error_quark, "gda_meta_struct_error_quark", libs);
  gidLink(cast(void**)&gda_meta_struct_complement, "gda_meta_struct_complement", libs);
  gidLink(cast(void**)&gda_meta_struct_complement_all, "gda_meta_struct_complement_all", libs);
  gidLink(cast(void**)&gda_meta_struct_complement_default, "gda_meta_struct_complement_default", libs);
  gidLink(cast(void**)&gda_meta_struct_complement_depend, "gda_meta_struct_complement_depend", libs);
  gidLink(cast(void**)&gda_meta_struct_complement_schema, "gda_meta_struct_complement_schema", libs);
  gidLink(cast(void**)&gda_meta_struct_dump_as_graph, "gda_meta_struct_dump_as_graph", libs);
  gidLink(cast(void**)&gda_meta_struct_get_all_db_objects, "gda_meta_struct_get_all_db_objects", libs);
  gidLink(cast(void**)&gda_meta_struct_get_db_object, "gda_meta_struct_get_db_object", libs);
  gidLink(cast(void**)&gda_meta_struct_get_table_column, "gda_meta_struct_get_table_column", libs);
  gidLink(cast(void**)&gda_meta_struct_load_from_xml_file, "gda_meta_struct_load_from_xml_file", libs);
  gidLink(cast(void**)&gda_meta_struct_sort_db_objects, "gda_meta_struct_sort_db_objects", libs);

  // MetaTableColumn
  gidLink(cast(void**)&gda_meta_table_column_foreach_attribute, "gda_meta_table_column_foreach_attribute", libs);
  gidLink(cast(void**)&gda_meta_table_column_get_attribute, "gda_meta_table_column_get_attribute", libs);
  gidLink(cast(void**)&gda_meta_table_column_set_attribute, "gda_meta_table_column_set_attribute", libs);

  // Numeric
  gidLink(cast(void**)&gda_numeric_get_type, "gda_numeric_get_type", libs);
  gidLink(cast(void**)&gda_numeric_new, "gda_numeric_new", libs);
  gidLink(cast(void**)&gda_numeric_copy, "gda_numeric_copy", libs);
  gidLink(cast(void**)&gda_numeric_free, "gda_numeric_free", libs);
  gidLink(cast(void**)&gda_numeric_get_double, "gda_numeric_get_double", libs);
  gidLink(cast(void**)&gda_numeric_get_precision, "gda_numeric_get_precision", libs);
  gidLink(cast(void**)&gda_numeric_get_string, "gda_numeric_get_string", libs);
  gidLink(cast(void**)&gda_numeric_get_width, "gda_numeric_get_width", libs);
  gidLink(cast(void**)&gda_numeric_set_double, "gda_numeric_set_double", libs);
  gidLink(cast(void**)&gda_numeric_set_from_string, "gda_numeric_set_from_string", libs);
  gidLink(cast(void**)&gda_numeric_set_precision, "gda_numeric_set_precision", libs);
  gidLink(cast(void**)&gda_numeric_set_width, "gda_numeric_set_width", libs);

  // PStmt
  gidLink(cast(void**)&gda_pstmt_get_type, "gda_pstmt_get_type", libs);
  gidLink(cast(void**)&gda_pstmt_copy_contents, "gda_pstmt_copy_contents", libs);
  gidLink(cast(void**)&gda_pstmt_get_gda_statement, "gda_pstmt_get_gda_statement", libs);
  gidLink(cast(void**)&gda_pstmt_set_gda_statement, "gda_pstmt_set_gda_statement", libs);

  // QuarkList
  gidLink(cast(void**)&gda_quark_list_get_type, "gda_quark_list_get_type", libs);
  gidLink(cast(void**)&gda_quark_list_new, "gda_quark_list_new", libs);
  gidLink(cast(void**)&gda_quark_list_new_from_string, "gda_quark_list_new_from_string", libs);
  gidLink(cast(void**)&gda_quark_list_add_from_string, "gda_quark_list_add_from_string", libs);
  gidLink(cast(void**)&gda_quark_list_clear, "gda_quark_list_clear", libs);
  gidLink(cast(void**)&gda_quark_list_copy, "gda_quark_list_copy", libs);
  gidLink(cast(void**)&gda_quark_list_find, "gda_quark_list_find", libs);
  gidLink(cast(void**)&gda_quark_list_foreach, "gda_quark_list_foreach", libs);
  gidLink(cast(void**)&gda_quark_list_free, "gda_quark_list_free", libs);
  gidLink(cast(void**)&gda_quark_list_protect_values, "gda_quark_list_protect_values", libs);
  gidLink(cast(void**)&gda_quark_list_remove, "gda_quark_list_remove", libs);

  // RepetitiveStatement
  gidLink(cast(void**)&gda_repetitive_statement_get_type, "gda_repetitive_statement_get_type", libs);
  gidLink(cast(void**)&gda_repetitive_statement_new, "gda_repetitive_statement_new", libs);
  gidLink(cast(void**)&gda_repetitive_statement_append_set, "gda_repetitive_statement_append_set", libs);
  gidLink(cast(void**)&gda_repetitive_statement_get_all_sets, "gda_repetitive_statement_get_all_sets", libs);
  gidLink(cast(void**)&gda_repetitive_statement_get_template_set, "gda_repetitive_statement_get_template_set", libs);

  // Row
  gidLink(cast(void**)&gda_row_get_type, "gda_row_get_type", libs);
  gidLink(cast(void**)&gda_row_new, "gda_row_new", libs);
  gidLink(cast(void**)&gda_row_get_length, "gda_row_get_length", libs);
  gidLink(cast(void**)&gda_row_get_value, "gda_row_get_value", libs);
  gidLink(cast(void**)&gda_row_invalidate_value, "gda_row_invalidate_value", libs);
  gidLink(cast(void**)&gda_row_invalidate_value_e, "gda_row_invalidate_value_e", libs);
  gidLink(cast(void**)&gda_row_value_is_valid, "gda_row_value_is_valid", libs);
  gidLink(cast(void**)&gda_row_value_is_valid_e, "gda_row_value_is_valid_e", libs);

  // ServerOperation
  gidLink(cast(void**)&gda_server_operation_get_type, "gda_server_operation_get_type", libs);
  gidLink(cast(void**)&gda_server_operation_new, "gda_server_operation_new", libs);
  gidLink(cast(void**)&gda_server_operation_error_quark, "gda_server_operation_error_quark", libs);
  gidLink(cast(void**)&gda_server_operation_op_type_to_string, "gda_server_operation_op_type_to_string", libs);
  gidLink(cast(void**)&gda_server_operation_prepare_create_database, "gda_server_operation_prepare_create_database", libs);
  gidLink(cast(void**)&gda_server_operation_prepare_create_table, "gda_server_operation_prepare_create_table", libs);
  gidLink(cast(void**)&gda_server_operation_prepare_drop_database, "gda_server_operation_prepare_drop_database", libs);
  gidLink(cast(void**)&gda_server_operation_prepare_drop_table, "gda_server_operation_prepare_drop_table", libs);
  gidLink(cast(void**)&gda_server_operation_string_to_op_type, "gda_server_operation_string_to_op_type", libs);
  gidLink(cast(void**)&gda_server_operation_add_item_to_sequence, "gda_server_operation_add_item_to_sequence", libs);
  gidLink(cast(void**)&gda_server_operation_del_item_from_sequence, "gda_server_operation_del_item_from_sequence", libs);
  gidLink(cast(void**)&gda_server_operation_get_node_info, "gda_server_operation_get_node_info", libs);
  gidLink(cast(void**)&gda_server_operation_get_node_parent, "gda_server_operation_get_node_parent", libs);
  gidLink(cast(void**)&gda_server_operation_get_node_path_portion, "gda_server_operation_get_node_path_portion", libs);
  gidLink(cast(void**)&gda_server_operation_get_node_type, "gda_server_operation_get_node_type", libs);
  gidLink(cast(void**)&gda_server_operation_get_op_type, "gda_server_operation_get_op_type", libs);
  gidLink(cast(void**)&gda_server_operation_get_root_nodes, "gda_server_operation_get_root_nodes", libs);
  gidLink(cast(void**)&gda_server_operation_get_sequence_item_names, "gda_server_operation_get_sequence_item_names", libs);
  gidLink(cast(void**)&gda_server_operation_get_sequence_max_size, "gda_server_operation_get_sequence_max_size", libs);
  gidLink(cast(void**)&gda_server_operation_get_sequence_min_size, "gda_server_operation_get_sequence_min_size", libs);
  gidLink(cast(void**)&gda_server_operation_get_sequence_name, "gda_server_operation_get_sequence_name", libs);
  gidLink(cast(void**)&gda_server_operation_get_sequence_size, "gda_server_operation_get_sequence_size", libs);
  gidLink(cast(void**)&gda_server_operation_get_sql_identifier_at, "gda_server_operation_get_sql_identifier_at", libs);
  gidLink(cast(void**)&gda_server_operation_get_sql_identifier_at_path, "gda_server_operation_get_sql_identifier_at_path", libs);
  gidLink(cast(void**)&gda_server_operation_get_value_at, "gda_server_operation_get_value_at", libs);
  gidLink(cast(void**)&gda_server_operation_get_value_at_path, "gda_server_operation_get_value_at_path", libs);
  gidLink(cast(void**)&gda_server_operation_is_valid, "gda_server_operation_is_valid", libs);
  gidLink(cast(void**)&gda_server_operation_load_data_from_xml, "gda_server_operation_load_data_from_xml", libs);
  gidLink(cast(void**)&gda_server_operation_perform_create_database, "gda_server_operation_perform_create_database", libs);
  gidLink(cast(void**)&gda_server_operation_perform_create_table, "gda_server_operation_perform_create_table", libs);
  gidLink(cast(void**)&gda_server_operation_perform_drop_database, "gda_server_operation_perform_drop_database", libs);
  gidLink(cast(void**)&gda_server_operation_perform_drop_table, "gda_server_operation_perform_drop_table", libs);
  gidLink(cast(void**)&gda_server_operation_save_data_to_xml, "gda_server_operation_save_data_to_xml", libs);
  gidLink(cast(void**)&gda_server_operation_set_value_at, "gda_server_operation_set_value_at", libs);
  gidLink(cast(void**)&gda_server_operation_set_value_at_path, "gda_server_operation_set_value_at_path", libs);

  // ServerProvider
  gidLink(cast(void**)&gda_server_provider_get_type, "gda_server_provider_get_type", libs);
  gidLink(cast(void**)&gda_server_provider_error_quark, "gda_server_provider_error_quark", libs);
  gidLink(cast(void**)&gda_server_provider_load_file_contents, "gda_server_provider_load_file_contents", libs);
  gidLink(cast(void**)&gda_server_provider_create_operation, "gda_server_provider_create_operation", libs);
  gidLink(cast(void**)&gda_server_provider_create_parser, "gda_server_provider_create_parser", libs);
  gidLink(cast(void**)&gda_server_provider_escape_string, "gda_server_provider_escape_string", libs);
  gidLink(cast(void**)&gda_server_provider_find_file, "gda_server_provider_find_file", libs);
  gidLink(cast(void**)&gda_server_provider_get_data_handler_dbms, "gda_server_provider_get_data_handler_dbms", libs);
  gidLink(cast(void**)&gda_server_provider_get_data_handler_default, "gda_server_provider_get_data_handler_default", libs);
  gidLink(cast(void**)&gda_server_provider_get_data_handler_g_type, "gda_server_provider_get_data_handler_g_type", libs);
  gidLink(cast(void**)&gda_server_provider_get_default_dbms_type, "gda_server_provider_get_default_dbms_type", libs);
  gidLink(cast(void**)&gda_server_provider_get_name, "gda_server_provider_get_name", libs);
  gidLink(cast(void**)&gda_server_provider_get_server_version, "gda_server_provider_get_server_version", libs);
  gidLink(cast(void**)&gda_server_provider_get_version, "gda_server_provider_get_version", libs);
  gidLink(cast(void**)&gda_server_provider_handler_declare, "gda_server_provider_handler_declare", libs);
  gidLink(cast(void**)&gda_server_provider_handler_find, "gda_server_provider_handler_find", libs);
  gidLink(cast(void**)&gda_server_provider_handler_use_default, "gda_server_provider_handler_use_default", libs);
  gidLink(cast(void**)&gda_server_provider_internal_get_parser, "gda_server_provider_internal_get_parser", libs);
  gidLink(cast(void**)&gda_server_provider_perform_operation, "gda_server_provider_perform_operation", libs);
  gidLink(cast(void**)&gda_server_provider_perform_operation_default, "gda_server_provider_perform_operation_default", libs);
  gidLink(cast(void**)&gda_server_provider_render_operation, "gda_server_provider_render_operation", libs);
  gidLink(cast(void**)&gda_server_provider_string_to_value, "gda_server_provider_string_to_value", libs);
  gidLink(cast(void**)&gda_server_provider_supports_feature, "gda_server_provider_supports_feature", libs);
  gidLink(cast(void**)&gda_server_provider_supports_operation, "gda_server_provider_supports_operation", libs);
  gidLink(cast(void**)&gda_server_provider_unescape_string, "gda_server_provider_unescape_string", libs);
  gidLink(cast(void**)&gda_server_provider_value_to_sql_string, "gda_server_provider_value_to_sql_string", libs);

  // Set
  gidLink(cast(void**)&gda_set_get_type, "gda_set_get_type", libs);
  gidLink(cast(void**)&gda_set_new, "gda_set_new", libs);
  gidLink(cast(void**)&gda_set_new_from_spec_node, "gda_set_new_from_spec_node", libs);
  gidLink(cast(void**)&gda_set_new_from_spec_string, "gda_set_new_from_spec_string", libs);
  gidLink(cast(void**)&gda_set_new_inline, "gda_set_new_inline", libs);
  gidLink(cast(void**)&gda_set_new_read_only, "gda_set_new_read_only", libs);
  gidLink(cast(void**)&gda_set_error_quark, "gda_set_error_quark", libs);
  gidLink(cast(void**)&gda_set_add_holder, "gda_set_add_holder", libs);
  gidLink(cast(void**)&gda_set_copy, "gda_set_copy", libs);
  gidLink(cast(void**)&gda_set_get_group, "gda_set_get_group", libs);
  gidLink(cast(void**)&gda_set_get_holder, "gda_set_get_holder", libs);
  gidLink(cast(void**)&gda_set_get_holder_value, "gda_set_get_holder_value", libs);
  gidLink(cast(void**)&gda_set_get_node, "gda_set_get_node", libs);
  gidLink(cast(void**)&gda_set_get_nth_holder, "gda_set_get_nth_holder", libs);
  gidLink(cast(void**)&gda_set_get_source, "gda_set_get_source", libs);
  gidLink(cast(void**)&gda_set_get_source_for_model, "gda_set_get_source_for_model", libs);
  gidLink(cast(void**)&gda_set_is_valid, "gda_set_is_valid", libs);
  gidLink(cast(void**)&gda_set_merge_with_set, "gda_set_merge_with_set", libs);
  gidLink(cast(void**)&gda_set_remove_holder, "gda_set_remove_holder", libs);
  gidLink(cast(void**)&gda_set_replace_source_model, "gda_set_replace_source_model", libs);
  gidLink(cast(void**)&gda_set_set_holder_value, "gda_set_set_holder_value", libs);

  // SetGroup
  gidLink(cast(void**)&gda_set_group_get_type, "gda_set_group_get_type", libs);
  gidLink(cast(void**)&gda_set_group_new, "gda_set_group_new", libs);
  gidLink(cast(void**)&gda_set_group_add_node, "gda_set_group_add_node", libs);
  gidLink(cast(void**)&gda_set_group_copy, "gda_set_group_copy", libs);
  gidLink(cast(void**)&gda_set_group_free, "gda_set_group_free", libs);
  gidLink(cast(void**)&gda_set_group_get_n_nodes, "gda_set_group_get_n_nodes", libs);
  gidLink(cast(void**)&gda_set_group_get_node, "gda_set_group_get_node", libs);
  gidLink(cast(void**)&gda_set_group_get_nodes, "gda_set_group_get_nodes", libs);
  gidLink(cast(void**)&gda_set_group_get_source, "gda_set_group_get_source", libs);
  gidLink(cast(void**)&gda_set_group_set_source, "gda_set_group_set_source", libs);

  // SetNode
  gidLink(cast(void**)&gda_set_node_get_type, "gda_set_node_get_type", libs);
  gidLink(cast(void**)&gda_set_node_new, "gda_set_node_new", libs);
  gidLink(cast(void**)&gda_set_node_copy, "gda_set_node_copy", libs);
  gidLink(cast(void**)&gda_set_node_free, "gda_set_node_free", libs);
  gidLink(cast(void**)&gda_set_node_get_data_model, "gda_set_node_get_data_model", libs);
  gidLink(cast(void**)&gda_set_node_get_holder, "gda_set_node_get_holder", libs);
  gidLink(cast(void**)&gda_set_node_get_source_column, "gda_set_node_get_source_column", libs);
  gidLink(cast(void**)&gda_set_node_set_data_model, "gda_set_node_set_data_model", libs);
  gidLink(cast(void**)&gda_set_node_set_holder, "gda_set_node_set_holder", libs);
  gidLink(cast(void**)&gda_set_node_set_source_column, "gda_set_node_set_source_column", libs);

  // SetSource
  gidLink(cast(void**)&gda_set_source_get_type, "gda_set_source_get_type", libs);
  gidLink(cast(void**)&gda_set_source_new, "gda_set_source_new", libs);
  gidLink(cast(void**)&gda_set_source_add_node, "gda_set_source_add_node", libs);
  gidLink(cast(void**)&gda_set_source_copy, "gda_set_source_copy", libs);
  gidLink(cast(void**)&gda_set_source_free, "gda_set_source_free", libs);
  gidLink(cast(void**)&gda_set_source_get_data_model, "gda_set_source_get_data_model", libs);
  gidLink(cast(void**)&gda_set_source_get_n_nodes, "gda_set_source_get_n_nodes", libs);
  gidLink(cast(void**)&gda_set_source_get_nodes, "gda_set_source_get_nodes", libs);
  gidLink(cast(void**)&gda_set_source_set_data_model, "gda_set_source_set_data_model", libs);

  // Short
  gidLink(cast(void**)&gda_short_get_type, "gda_short_get_type", libs);

  // SqlAnyPart
  gidLink(cast(void**)&gda_sql_any_part_check_structure, "gda_sql_any_part_check_structure", libs);
  gidLink(cast(void**)&gda_sql_any_part_foreach, "gda_sql_any_part_foreach", libs);

  // SqlBuilder
  gidLink(cast(void**)&gda_sql_builder_get_type, "gda_sql_builder_get_type", libs);
  gidLink(cast(void**)&gda_sql_builder_new, "gda_sql_builder_new", libs);
  gidLink(cast(void**)&gda_sql_builder_error_quark, "gda_sql_builder_error_quark", libs);
  gidLink(cast(void**)&gda_sql_builder_add_case, "gda_sql_builder_add_case", libs);
  gidLink(cast(void**)&gda_sql_builder_add_case_v, "gda_sql_builder_add_case_v", libs);
  gidLink(cast(void**)&gda_sql_builder_add_cond, "gda_sql_builder_add_cond", libs);
  gidLink(cast(void**)&gda_sql_builder_add_cond_v, "gda_sql_builder_add_cond_v", libs);
  gidLink(cast(void**)&gda_sql_builder_add_expr, "gda_sql_builder_add_expr", libs);
  gidLink(cast(void**)&gda_sql_builder_add_expr_value, "gda_sql_builder_add_expr_value", libs);
  gidLink(cast(void**)&gda_sql_builder_add_field_id, "gda_sql_builder_add_field_id", libs);
  gidLink(cast(void**)&gda_sql_builder_add_field_value, "gda_sql_builder_add_field_value", libs);
  gidLink(cast(void**)&gda_sql_builder_add_field_value_as_gvalue, "gda_sql_builder_add_field_value_as_gvalue", libs);
  gidLink(cast(void**)&gda_sql_builder_add_field_value_id, "gda_sql_builder_add_field_value_id", libs);
  gidLink(cast(void**)&gda_sql_builder_add_function, "gda_sql_builder_add_function", libs);
  gidLink(cast(void**)&gda_sql_builder_add_function_v, "gda_sql_builder_add_function_v", libs);
  gidLink(cast(void**)&gda_sql_builder_add_id, "gda_sql_builder_add_id", libs);
  gidLink(cast(void**)&gda_sql_builder_add_param, "gda_sql_builder_add_param", libs);
  gidLink(cast(void**)&gda_sql_builder_add_sub_select, "gda_sql_builder_add_sub_select", libs);
  gidLink(cast(void**)&gda_sql_builder_compound_add_sub_select, "gda_sql_builder_compound_add_sub_select", libs);
  gidLink(cast(void**)&gda_sql_builder_compound_add_sub_select_from_builder, "gda_sql_builder_compound_add_sub_select_from_builder", libs);
  gidLink(cast(void**)&gda_sql_builder_compound_set_type, "gda_sql_builder_compound_set_type", libs);
  gidLink(cast(void**)&gda_sql_builder_export_expression, "gda_sql_builder_export_expression", libs);
  gidLink(cast(void**)&gda_sql_builder_get_sql_statement, "gda_sql_builder_get_sql_statement", libs);
  gidLink(cast(void**)&gda_sql_builder_get_statement, "gda_sql_builder_get_statement", libs);
  gidLink(cast(void**)&gda_sql_builder_import_expression, "gda_sql_builder_import_expression", libs);
  gidLink(cast(void**)&gda_sql_builder_import_expression_from_builder, "gda_sql_builder_import_expression_from_builder", libs);
  gidLink(cast(void**)&gda_sql_builder_join_add_field, "gda_sql_builder_join_add_field", libs);
  gidLink(cast(void**)&gda_sql_builder_select_add_field, "gda_sql_builder_select_add_field", libs);
  gidLink(cast(void**)&gda_sql_builder_select_add_target, "gda_sql_builder_select_add_target", libs);
  gidLink(cast(void**)&gda_sql_builder_select_add_target_id, "gda_sql_builder_select_add_target_id", libs);
  gidLink(cast(void**)&gda_sql_builder_select_group_by, "gda_sql_builder_select_group_by", libs);
  gidLink(cast(void**)&gda_sql_builder_select_join_targets, "gda_sql_builder_select_join_targets", libs);
  gidLink(cast(void**)&gda_sql_builder_select_order_by, "gda_sql_builder_select_order_by", libs);
  gidLink(cast(void**)&gda_sql_builder_select_set_distinct, "gda_sql_builder_select_set_distinct", libs);
  gidLink(cast(void**)&gda_sql_builder_select_set_having, "gda_sql_builder_select_set_having", libs);
  gidLink(cast(void**)&gda_sql_builder_select_set_limit, "gda_sql_builder_select_set_limit", libs);
  gidLink(cast(void**)&gda_sql_builder_set_table, "gda_sql_builder_set_table", libs);
  gidLink(cast(void**)&gda_sql_builder_set_where, "gda_sql_builder_set_where", libs);

  // SqlCase
  gidLink(cast(void**)&gda_sql_case_copy, "gda_sql_case_copy", libs);
  gidLink(cast(void**)&gda_sql_case_free, "gda_sql_case_free", libs);
  gidLink(cast(void**)&gda_sql_case_serialize, "gda_sql_case_serialize", libs);
  gidLink(cast(void**)&gda_sql_case_new, "gda_sql_case_new", libs);

  // SqlExpr
  gidLink(cast(void**)&gda_sql_expr_get_type, "gda_sql_expr_get_type", libs);
  gidLink(cast(void**)&gda_sql_expr_new, "gda_sql_expr_new", libs);
  gidLink(cast(void**)&gda_sql_expr_copy, "gda_sql_expr_copy", libs);
  gidLink(cast(void**)&gda_sql_expr_free, "gda_sql_expr_free", libs);
  gidLink(cast(void**)&gda_sql_expr_serialize, "gda_sql_expr_serialize", libs);
  gidLink(cast(void**)&gda_sql_expr_take_select, "gda_sql_expr_take_select", libs);

  // SqlField
  gidLink(cast(void**)&gda_sql_field_copy, "gda_sql_field_copy", libs);
  gidLink(cast(void**)&gda_sql_field_free, "gda_sql_field_free", libs);
  gidLink(cast(void**)&gda_sql_field_serialize, "gda_sql_field_serialize", libs);
  gidLink(cast(void**)&gda_sql_field_take_name, "gda_sql_field_take_name", libs);
  gidLink(cast(void**)&gda_sql_field_new, "gda_sql_field_new", libs);

  // SqlFunction
  gidLink(cast(void**)&gda_sql_function_check_clean, "gda_sql_function_check_clean", libs);
  gidLink(cast(void**)&gda_sql_function_copy, "gda_sql_function_copy", libs);
  gidLink(cast(void**)&gda_sql_function_free, "gda_sql_function_free", libs);
  gidLink(cast(void**)&gda_sql_function_serialize, "gda_sql_function_serialize", libs);
  gidLink(cast(void**)&gda_sql_function_take_args_list, "gda_sql_function_take_args_list", libs);
  gidLink(cast(void**)&gda_sql_function_take_name, "gda_sql_function_take_name", libs);
  gidLink(cast(void**)&gda_sql_function_new, "gda_sql_function_new", libs);

  // SqlOperation
  gidLink(cast(void**)&gda_sql_operation_copy, "gda_sql_operation_copy", libs);
  gidLink(cast(void**)&gda_sql_operation_free, "gda_sql_operation_free", libs);
  gidLink(cast(void**)&gda_sql_operation_serialize, "gda_sql_operation_serialize", libs);
  gidLink(cast(void**)&gda_sql_operation_new, "gda_sql_operation_new", libs);
  gidLink(cast(void**)&gda_sql_operation_operator_from_string, "gda_sql_operation_operator_from_string", libs);
  gidLink(cast(void**)&gda_sql_operation_operator_to_string, "gda_sql_operation_operator_to_string", libs);

  // SqlParamSpec
  gidLink(cast(void**)&gda_sql_param_spec_copy, "gda_sql_param_spec_copy", libs);
  gidLink(cast(void**)&gda_sql_param_spec_free, "gda_sql_param_spec_free", libs);
  gidLink(cast(void**)&gda_sql_param_spec_serialize, "gda_sql_param_spec_serialize", libs);
  gidLink(cast(void**)&gda_sql_param_spec_take_descr, "gda_sql_param_spec_take_descr", libs);
  gidLink(cast(void**)&gda_sql_param_spec_take_name, "gda_sql_param_spec_take_name", libs);
  gidLink(cast(void**)&gda_sql_param_spec_take_nullok, "gda_sql_param_spec_take_nullok", libs);
  gidLink(cast(void**)&gda_sql_param_spec_take_type, "gda_sql_param_spec_take_type", libs);
  gidLink(cast(void**)&gda_sql_param_spec_new, "gda_sql_param_spec_new", libs);

  // SqlParser
  gidLink(cast(void**)&gda_sql_parser_get_type, "gda_sql_parser_get_type", libs);
  gidLink(cast(void**)&gda_sql_parser_new, "gda_sql_parser_new", libs);
  gidLink(cast(void**)&gda_sql_parser_error_quark, "gda_sql_parser_error_quark", libs);
  gidLink(cast(void**)&gda_sql_parser_parse_file_as_batch, "gda_sql_parser_parse_file_as_batch", libs);
  gidLink(cast(void**)&gda_sql_parser_parse_string, "gda_sql_parser_parse_string", libs);
  gidLink(cast(void**)&gda_sql_parser_parse_string_as_batch, "gda_sql_parser_parse_string_as_batch", libs);
  gidLink(cast(void**)&gda_sql_parser_set_overflow_error, "gda_sql_parser_set_overflow_error", libs);
  gidLink(cast(void**)&gda_sql_parser_set_syntax_error, "gda_sql_parser_set_syntax_error", libs);

  // SqlSelectField
  gidLink(cast(void**)&gda_sql_select_field_copy, "gda_sql_select_field_copy", libs);
  gidLink(cast(void**)&gda_sql_select_field_free, "gda_sql_select_field_free", libs);
  gidLink(cast(void**)&gda_sql_select_field_serialize, "gda_sql_select_field_serialize", libs);
  gidLink(cast(void**)&gda_sql_select_field_take_alias, "gda_sql_select_field_take_alias", libs);
  gidLink(cast(void**)&gda_sql_select_field_take_expr, "gda_sql_select_field_take_expr", libs);
  gidLink(cast(void**)&gda_sql_select_field_take_star_value, "gda_sql_select_field_take_star_value", libs);
  gidLink(cast(void**)&gda_sql_select_field_new, "gda_sql_select_field_new", libs);

  // SqlSelectFrom
  gidLink(cast(void**)&gda_sql_select_from_copy, "gda_sql_select_from_copy", libs);
  gidLink(cast(void**)&gda_sql_select_from_free, "gda_sql_select_from_free", libs);
  gidLink(cast(void**)&gda_sql_select_from_serialize, "gda_sql_select_from_serialize", libs);
  gidLink(cast(void**)&gda_sql_select_from_take_new_join, "gda_sql_select_from_take_new_join", libs);
  gidLink(cast(void**)&gda_sql_select_from_take_new_target, "gda_sql_select_from_take_new_target", libs);
  gidLink(cast(void**)&gda_sql_select_from_new, "gda_sql_select_from_new", libs);

  // SqlSelectJoin
  gidLink(cast(void**)&gda_sql_select_join_copy, "gda_sql_select_join_copy", libs);
  gidLink(cast(void**)&gda_sql_select_join_free, "gda_sql_select_join_free", libs);
  gidLink(cast(void**)&gda_sql_select_join_serialize, "gda_sql_select_join_serialize", libs);
  gidLink(cast(void**)&gda_sql_select_join_new, "gda_sql_select_join_new", libs);
  gidLink(cast(void**)&gda_sql_select_join_type_to_string, "gda_sql_select_join_type_to_string", libs);

  // SqlSelectOrder
  gidLink(cast(void**)&gda_sql_select_order_copy, "gda_sql_select_order_copy", libs);
  gidLink(cast(void**)&gda_sql_select_order_free, "gda_sql_select_order_free", libs);
  gidLink(cast(void**)&gda_sql_select_order_serialize, "gda_sql_select_order_serialize", libs);
  gidLink(cast(void**)&gda_sql_select_order_new, "gda_sql_select_order_new", libs);

  // SqlSelectTarget
  gidLink(cast(void**)&gda_sql_select_target_copy, "gda_sql_select_target_copy", libs);
  gidLink(cast(void**)&gda_sql_select_target_free, "gda_sql_select_target_free", libs);
  gidLink(cast(void**)&gda_sql_select_target_serialize, "gda_sql_select_target_serialize", libs);
  gidLink(cast(void**)&gda_sql_select_target_take_alias, "gda_sql_select_target_take_alias", libs);
  gidLink(cast(void**)&gda_sql_select_target_take_select, "gda_sql_select_target_take_select", libs);
  gidLink(cast(void**)&gda_sql_select_target_take_table_name, "gda_sql_select_target_take_table_name", libs);
  gidLink(cast(void**)&gda_sql_select_target_new, "gda_sql_select_target_new", libs);

  // SqlStatement
  gidLink(cast(void**)&gda_sql_statement_get_type, "gda_sql_statement_get_type", libs);
  gidLink(cast(void**)&gda_sql_statement_new, "gda_sql_statement_new", libs);
  gidLink(cast(void**)&gda_sql_statement_check_clean, "gda_sql_statement_check_clean", libs);
  gidLink(cast(void**)&gda_sql_statement_check_structure, "gda_sql_statement_check_structure", libs);
  gidLink(cast(void**)&gda_sql_statement_check_validity, "gda_sql_statement_check_validity", libs);
  gidLink(cast(void**)&gda_sql_statement_check_validity_m, "gda_sql_statement_check_validity_m", libs);
  gidLink(cast(void**)&gda_sql_statement_compound_set_type, "gda_sql_statement_compound_set_type", libs);
  gidLink(cast(void**)&gda_sql_statement_compound_take_stmt, "gda_sql_statement_compound_take_stmt", libs);
  gidLink(cast(void**)&gda_sql_statement_copy, "gda_sql_statement_copy", libs);
  gidLink(cast(void**)&gda_sql_statement_delete_take_condition, "gda_sql_statement_delete_take_condition", libs);
  gidLink(cast(void**)&gda_sql_statement_delete_take_table_name, "gda_sql_statement_delete_take_table_name", libs);
  gidLink(cast(void**)&gda_sql_statement_free, "gda_sql_statement_free", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_1_values_list, "gda_sql_statement_insert_take_1_values_list", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_extra_values_list, "gda_sql_statement_insert_take_extra_values_list", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_fields_list, "gda_sql_statement_insert_take_fields_list", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_on_conflict, "gda_sql_statement_insert_take_on_conflict", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_select, "gda_sql_statement_insert_take_select", libs);
  gidLink(cast(void**)&gda_sql_statement_insert_take_table_name, "gda_sql_statement_insert_take_table_name", libs);
  gidLink(cast(void**)&gda_sql_statement_normalize, "gda_sql_statement_normalize", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_distinct, "gda_sql_statement_select_take_distinct", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_expr_list, "gda_sql_statement_select_take_expr_list", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_from, "gda_sql_statement_select_take_from", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_group_by, "gda_sql_statement_select_take_group_by", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_having_cond, "gda_sql_statement_select_take_having_cond", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_limits, "gda_sql_statement_select_take_limits", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_order_by, "gda_sql_statement_select_take_order_by", libs);
  gidLink(cast(void**)&gda_sql_statement_select_take_where_cond, "gda_sql_statement_select_take_where_cond", libs);
  gidLink(cast(void**)&gda_sql_statement_serialize, "gda_sql_statement_serialize", libs);
  gidLink(cast(void**)&gda_sql_statement_trans_set_isol_level, "gda_sql_statement_trans_set_isol_level", libs);
  gidLink(cast(void**)&gda_sql_statement_trans_take_mode, "gda_sql_statement_trans_take_mode", libs);
  gidLink(cast(void**)&gda_sql_statement_trans_take_name, "gda_sql_statement_trans_take_name", libs);
  gidLink(cast(void**)&gda_sql_statement_unknown_take_expressions, "gda_sql_statement_unknown_take_expressions", libs);
  gidLink(cast(void**)&gda_sql_statement_update_take_condition, "gda_sql_statement_update_take_condition", libs);
  gidLink(cast(void**)&gda_sql_statement_update_take_on_conflict, "gda_sql_statement_update_take_on_conflict", libs);
  gidLink(cast(void**)&gda_sql_statement_update_take_set_value, "gda_sql_statement_update_take_set_value", libs);
  gidLink(cast(void**)&gda_sql_statement_update_take_table_name, "gda_sql_statement_update_take_table_name", libs);
  gidLink(cast(void**)&gda_sql_statement_get_contents_infos, "gda_sql_statement_get_contents_infos", libs);
  gidLink(cast(void**)&gda_sql_statement_string_to_type, "gda_sql_statement_string_to_type", libs);
  gidLink(cast(void**)&gda_sql_statement_type_to_string, "gda_sql_statement_type_to_string", libs);

  // SqlTable
  gidLink(cast(void**)&gda_sql_table_copy, "gda_sql_table_copy", libs);
  gidLink(cast(void**)&gda_sql_table_free, "gda_sql_table_free", libs);
  gidLink(cast(void**)&gda_sql_table_serialize, "gda_sql_table_serialize", libs);
  gidLink(cast(void**)&gda_sql_table_take_name, "gda_sql_table_take_name", libs);
  gidLink(cast(void**)&gda_sql_table_new, "gda_sql_table_new", libs);

  // Statement
  gidLink(cast(void**)&gda_statement_get_type, "gda_statement_get_type", libs);
  gidLink(cast(void**)&gda_statement_new, "gda_statement_new", libs);
  gidLink(cast(void**)&gda_statement_error_quark, "gda_statement_error_quark", libs);
  gidLink(cast(void**)&gda_statement_check_structure, "gda_statement_check_structure", libs);
  gidLink(cast(void**)&gda_statement_check_validity, "gda_statement_check_validity", libs);
  gidLink(cast(void**)&gda_statement_copy, "gda_statement_copy", libs);
  gidLink(cast(void**)&gda_statement_get_parameters, "gda_statement_get_parameters", libs);
  gidLink(cast(void**)&gda_statement_get_statement_type, "gda_statement_get_statement_type", libs);
  gidLink(cast(void**)&gda_statement_is_useless, "gda_statement_is_useless", libs);
  gidLink(cast(void**)&gda_statement_normalize, "gda_statement_normalize", libs);
  gidLink(cast(void**)&gda_statement_rewrite_for_default_values, "gda_statement_rewrite_for_default_values", libs);
  gidLink(cast(void**)&gda_statement_serialize, "gda_statement_serialize", libs);
  gidLink(cast(void**)&gda_statement_to_sql_extended, "gda_statement_to_sql_extended", libs);
  gidLink(cast(void**)&gda_statement_to_sql_real, "gda_statement_to_sql_real", libs);

  // ThreadWrapper
  gidLink(cast(void**)&gda_thread_wrapper_get_type, "gda_thread_wrapper_get_type", libs);
  gidLink(cast(void**)&gda_thread_wrapper_new, "gda_thread_wrapper_new", libs);
  gidLink(cast(void**)&gda_thread_wrapper_error_quark, "gda_thread_wrapper_error_quark", libs);
  gidLink(cast(void**)&gda_thread_wrapper_cancel, "gda_thread_wrapper_cancel", libs);
  gidLink(cast(void**)&gda_thread_wrapper_connect_raw, "gda_thread_wrapper_connect_raw", libs);
  gidLink(cast(void**)&gda_thread_wrapper_disconnect, "gda_thread_wrapper_disconnect", libs);
  gidLink(cast(void**)&gda_thread_wrapper_execute, "gda_thread_wrapper_execute", libs);
  gidLink(cast(void**)&gda_thread_wrapper_execute_void, "gda_thread_wrapper_execute_void", libs);
  gidLink(cast(void**)&gda_thread_wrapper_fetch_result, "gda_thread_wrapper_fetch_result", libs);
  gidLink(cast(void**)&gda_thread_wrapper_get_io_channel, "gda_thread_wrapper_get_io_channel", libs);
  gidLink(cast(void**)&gda_thread_wrapper_get_waiting_size, "gda_thread_wrapper_get_waiting_size", libs);
  gidLink(cast(void**)&gda_thread_wrapper_iterate, "gda_thread_wrapper_iterate", libs);
  gidLink(cast(void**)&gda_thread_wrapper_steal_signal, "gda_thread_wrapper_steal_signal", libs);
  gidLink(cast(void**)&gda_thread_wrapper_unset_io_channel, "gda_thread_wrapper_unset_io_channel", libs);

  // Time
  gidLink(cast(void**)&gda_time_get_type, "gda_time_get_type", libs);
  gidLink(cast(void**)&gda_time_change_timezone, "gda_time_change_timezone", libs);
  gidLink(cast(void**)&gda_time_valid, "gda_time_valid", libs);
  gidLink(cast(void**)&gda_time_copy, "gda_time_copy", libs);
  gidLink(cast(void**)&gda_time_free, "gda_time_free", libs);

  // Timestamp
  gidLink(cast(void**)&gda_timestamp_get_type, "gda_timestamp_get_type", libs);
  gidLink(cast(void**)&gda_timestamp_change_timezone, "gda_timestamp_change_timezone", libs);
  gidLink(cast(void**)&gda_timestamp_valid, "gda_timestamp_valid", libs);
  gidLink(cast(void**)&gda_timestamp_copy, "gda_timestamp_copy", libs);
  gidLink(cast(void**)&gda_timestamp_free, "gda_timestamp_free", libs);

  // TransactionStatus
  gidLink(cast(void**)&gda_transaction_status_get_type, "gda_transaction_status_get_type", libs);
  gidLink(cast(void**)&gda_transaction_status_new, "gda_transaction_status_new", libs);
  gidLink(cast(void**)&gda_transaction_status_add_event_sql, "gda_transaction_status_add_event_sql", libs);
  gidLink(cast(void**)&gda_transaction_status_add_event_sub, "gda_transaction_status_add_event_sub", libs);
  gidLink(cast(void**)&gda_transaction_status_add_event_svp, "gda_transaction_status_add_event_svp", libs);
  gidLink(cast(void**)&gda_transaction_status_find, "gda_transaction_status_find", libs);
  gidLink(cast(void**)&gda_transaction_status_find_current, "gda_transaction_status_find_current", libs);
  gidLink(cast(void**)&gda_transaction_status_free_events, "gda_transaction_status_free_events", libs);

  // Tree
  gidLink(cast(void**)&gda_tree_get_type, "gda_tree_get_type", libs);
  gidLink(cast(void**)&gda_tree_new, "gda_tree_new", libs);
  gidLink(cast(void**)&gda_tree_error_quark, "gda_tree_error_quark", libs);
  gidLink(cast(void**)&gda_tree_add_manager, "gda_tree_add_manager", libs);
  gidLink(cast(void**)&gda_tree_clean, "gda_tree_clean", libs);
  gidLink(cast(void**)&gda_tree_dump, "gda_tree_dump", libs);
  gidLink(cast(void**)&gda_tree_get_node, "gda_tree_get_node", libs);
  gidLink(cast(void**)&gda_tree_get_node_manager, "gda_tree_get_node_manager", libs);
  gidLink(cast(void**)&gda_tree_get_node_path, "gda_tree_get_node_path", libs);
  gidLink(cast(void**)&gda_tree_get_nodes_in_path, "gda_tree_get_nodes_in_path", libs);
  gidLink(cast(void**)&gda_tree_set_attribute, "gda_tree_set_attribute", libs);
  gidLink(cast(void**)&gda_tree_update_all, "gda_tree_update_all", libs);
  gidLink(cast(void**)&gda_tree_update_children, "gda_tree_update_children", libs);
  gidLink(cast(void**)&gda_tree_update_part, "gda_tree_update_part", libs);

  // TreeManager
  gidLink(cast(void**)&gda_tree_manager_get_type, "gda_tree_manager_get_type", libs);
  gidLink(cast(void**)&gda_tree_manager_new_with_func, "gda_tree_manager_new_with_func", libs);
  gidLink(cast(void**)&gda_tree_manager_error_quark, "gda_tree_manager_error_quark", libs);
  gidLink(cast(void**)&gda_tree_manager_add_manager, "gda_tree_manager_add_manager", libs);
  gidLink(cast(void**)&gda_tree_manager_add_new_node_attribute, "gda_tree_manager_add_new_node_attribute", libs);
  gidLink(cast(void**)&gda_tree_manager_create_node, "gda_tree_manager_create_node", libs);
  gidLink(cast(void**)&gda_tree_manager_get_managers, "gda_tree_manager_get_managers", libs);
  gidLink(cast(void**)&gda_tree_manager_get_node_create_func, "gda_tree_manager_get_node_create_func", libs);
  gidLink(cast(void**)&gda_tree_manager_set_node_create_func, "gda_tree_manager_set_node_create_func", libs);

  // TreeMgrColumns
  gidLink(cast(void**)&gda_tree_mgr_columns_get_type, "gda_tree_mgr_columns_get_type", libs);
  gidLink(cast(void**)&gda_tree_mgr_columns_new, "gda_tree_mgr_columns_new", libs);

  // TreeMgrLabel
  gidLink(cast(void**)&gda_tree_mgr_label_get_type, "gda_tree_mgr_label_get_type", libs);
  gidLink(cast(void**)&gda_tree_mgr_label_new, "gda_tree_mgr_label_new", libs);

  // TreeMgrSchemas
  gidLink(cast(void**)&gda_tree_mgr_schemas_get_type, "gda_tree_mgr_schemas_get_type", libs);
  gidLink(cast(void**)&gda_tree_mgr_schemas_new, "gda_tree_mgr_schemas_new", libs);

  // TreeMgrSelect
  gidLink(cast(void**)&gda_tree_mgr_select_get_type, "gda_tree_mgr_select_get_type", libs);
  gidLink(cast(void**)&gda_tree_mgr_select_new, "gda_tree_mgr_select_new", libs);

  // TreeMgrTables
  gidLink(cast(void**)&gda_tree_mgr_tables_get_type, "gda_tree_mgr_tables_get_type", libs);
  gidLink(cast(void**)&gda_tree_mgr_tables_new, "gda_tree_mgr_tables_new", libs);

  // TreeNode
  gidLink(cast(void**)&gda_tree_node_get_type, "gda_tree_node_get_type", libs);
  gidLink(cast(void**)&gda_tree_node_new, "gda_tree_node_new", libs);
  gidLink(cast(void**)&gda_tree_node_error_quark, "gda_tree_node_error_quark", libs);
  gidLink(cast(void**)&gda_tree_node_fetch_attribute, "gda_tree_node_fetch_attribute", libs);
  gidLink(cast(void**)&gda_tree_node_get_child_index, "gda_tree_node_get_child_index", libs);
  gidLink(cast(void**)&gda_tree_node_get_child_name, "gda_tree_node_get_child_name", libs);
  gidLink(cast(void**)&gda_tree_node_get_children, "gda_tree_node_get_children", libs);
  gidLink(cast(void**)&gda_tree_node_get_node_attribute, "gda_tree_node_get_node_attribute", libs);
  gidLink(cast(void**)&gda_tree_node_get_parent, "gda_tree_node_get_parent", libs);
  gidLink(cast(void**)&gda_tree_node_set_node_attribute, "gda_tree_node_set_node_attribute", libs);

  // UShort
  gidLink(cast(void**)&gda_ushort_get_type, "gda_ushort_get_type", libs);

  // XaTransaction
  gidLink(cast(void**)&gda_xa_transaction_get_type, "gda_xa_transaction_get_type", libs);
  gidLink(cast(void**)&gda_xa_transaction_new, "gda_xa_transaction_new", libs);
  gidLink(cast(void**)&gda_xa_transaction_error_quark, "gda_xa_transaction_error_quark", libs);
  gidLink(cast(void**)&gda_xa_transaction_string_to_id, "gda_xa_transaction_string_to_id", libs);
  gidLink(cast(void**)&gda_xa_transaction_begin, "gda_xa_transaction_begin", libs);
  gidLink(cast(void**)&gda_xa_transaction_commit, "gda_xa_transaction_commit", libs);
  gidLink(cast(void**)&gda_xa_transaction_commit_recovered, "gda_xa_transaction_commit_recovered", libs);
  gidLink(cast(void**)&gda_xa_transaction_register_connection, "gda_xa_transaction_register_connection", libs);
  gidLink(cast(void**)&gda_xa_transaction_rollback, "gda_xa_transaction_rollback", libs);
  gidLink(cast(void**)&gda_xa_transaction_unregister_connection, "gda_xa_transaction_unregister_connection", libs);

  // XaTransactionId
  gidLink(cast(void**)&gda_xa_transaction_id_to_string, "gda_xa_transaction_id_to_string", libs);

  // global
  gidLink(cast(void**)&gda_default_escape_string, "gda_default_escape_string", libs);
  gidLink(cast(void**)&gda_default_unescape_string, "gda_default_unescape_string", libs);
  gidLink(cast(void**)&gda_alphanum_to_text, "gda_alphanum_to_text", libs);
  gidLink(cast(void**)&gda_completion_list_get, "gda_completion_list_get", libs);
  gidLink(cast(void**)&gda_compute_dml_statements, "gda_compute_dml_statements", libs);
  gidLink(cast(void**)&gda_compute_select_statement_from_update, "gda_compute_select_statement_from_update", libs);
  gidLink(cast(void**)&gda_compute_unique_table_row_condition, "gda_compute_unique_table_row_condition", libs);
  gidLink(cast(void**)&gda_compute_unique_table_row_condition_with_cnc, "gda_compute_unique_table_row_condition_with_cnc", libs);
  gidLink(cast(void**)&gda_dsn_split, "gda_dsn_split", libs);
  gidLink(cast(void**)&gda_g_type_from_string, "gda_g_type_from_string", libs);
  gidLink(cast(void**)&gda_g_type_to_string, "gda_g_type_to_string", libs);
  gidLink(cast(void**)&gda_get_application_exec_path, "gda_get_application_exec_path", libs);
  gidLink(cast(void**)&gda_identifier_equal, "gda_identifier_equal", libs);
  gidLink(cast(void**)&gda_identifier_hash, "gda_identifier_hash", libs);
  gidLink(cast(void**)&gda_init, "gda_init", libs);
  gidLink(cast(void**)&gda_locale_changed, "gda_locale_changed", libs);
  gidLink(cast(void**)&gda_log_disable, "gda_log_disable", libs);
  gidLink(cast(void**)&gda_log_enable, "gda_log_enable", libs);
  gidLink(cast(void**)&gda_log_error, "gda_log_error", libs);
  gidLink(cast(void**)&gda_log_is_enabled, "gda_log_is_enabled", libs);
  gidLink(cast(void**)&gda_log_message, "gda_log_message", libs);
  gidLink(cast(void**)&gda_mutex_free, "gda_mutex_free", libs);
  gidLink(cast(void**)&gda_mutex_lock, "gda_mutex_lock", libs);
  gidLink(cast(void**)&gda_mutex_new, "gda_mutex_new", libs);
  gidLink(cast(void**)&gda_mutex_trylock, "gda_mutex_trylock", libs);
  gidLink(cast(void**)&gda_mutex_unlock, "gda_mutex_unlock", libs);
  gidLink(cast(void**)&gda_parse_formatted_date, "gda_parse_formatted_date", libs);
  gidLink(cast(void**)&gda_parse_formatted_time, "gda_parse_formatted_time", libs);
  gidLink(cast(void**)&gda_parse_formatted_timestamp, "gda_parse_formatted_timestamp", libs);
  gidLink(cast(void**)&gda_parse_iso8601_date, "gda_parse_iso8601_date", libs);
  gidLink(cast(void**)&gda_parse_iso8601_time, "gda_parse_iso8601_time", libs);
  gidLink(cast(void**)&gda_parse_iso8601_timestamp, "gda_parse_iso8601_timestamp", libs);
  gidLink(cast(void**)&gda_rewrite_sql_statement_for_null_parameters, "gda_rewrite_sql_statement_for_null_parameters", libs);
  gidLink(cast(void**)&gda_rewrite_statement_for_null_parameters, "gda_rewrite_statement_for_null_parameters", libs);
  gidLink(cast(void**)&gda_rfc1738_decode, "gda_rfc1738_decode", libs);
  gidLink(cast(void**)&gda_rfc1738_encode, "gda_rfc1738_encode", libs);
  gidLink(cast(void**)&gda_select_alter_select_for_empty, "gda_select_alter_select_for_empty", libs);
  gidLink(cast(void**)&gda_sql_error_quark, "gda_sql_error_quark", libs);
  gidLink(cast(void**)&gda_sql_identifier_force_quotes, "gda_sql_identifier_force_quotes", libs);
  gidLink(cast(void**)&gda_sql_identifier_prepare_for_compare, "gda_sql_identifier_prepare_for_compare", libs);
  gidLink(cast(void**)&gda_sql_identifier_quote, "gda_sql_identifier_quote", libs);
  gidLink(cast(void**)&gda_sql_identifier_split, "gda_sql_identifier_split", libs);
  gidLink(cast(void**)&gda_sql_value_stringify, "gda_sql_value_stringify", libs);
  gidLink(cast(void**)&gda_string_to_binary, "gda_string_to_binary", libs);
  gidLink(cast(void**)&gda_string_to_blob, "gda_string_to_blob", libs);
  gidLink(cast(void**)&gda_text_to_alphanum, "gda_text_to_alphanum", libs);
  gidLink(cast(void**)&gda_utility_check_data_model, "gda_utility_check_data_model", libs);
  gidLink(cast(void**)&gda_utility_check_data_model_v, "gda_utility_check_data_model_v", libs);
  gidLink(cast(void**)&gda_utility_data_model_dump_data_to_xml, "gda_utility_data_model_dump_data_to_xml", libs);
  gidLink(cast(void**)&gda_utility_data_model_find_column_description, "gda_utility_data_model_find_column_description", libs);
  gidLink(cast(void**)&gda_utility_holder_load_attributes, "gda_utility_holder_load_attributes", libs);
  gidLink(cast(void**)&gda_value_compare, "gda_value_compare", libs);
  gidLink(cast(void**)&gda_value_copy, "gda_value_copy", libs);
  gidLink(cast(void**)&gda_value_differ, "gda_value_differ", libs);
  gidLink(cast(void**)&gda_value_free, "gda_value_free", libs);
  gidLink(cast(void**)&gda_value_get_binary, "gda_value_get_binary", libs);
  gidLink(cast(void**)&gda_value_get_blob, "gda_value_get_blob", libs);
  gidLink(cast(void**)&gda_value_get_geometric_point, "gda_value_get_geometric_point", libs);
  gidLink(cast(void**)&gda_value_get_numeric, "gda_value_get_numeric", libs);
  gidLink(cast(void**)&gda_value_get_short, "gda_value_get_short", libs);
  gidLink(cast(void**)&gda_value_get_time, "gda_value_get_time", libs);
  gidLink(cast(void**)&gda_value_get_timestamp, "gda_value_get_timestamp", libs);
  gidLink(cast(void**)&gda_value_get_ushort, "gda_value_get_ushort", libs);
  gidLink(cast(void**)&gda_value_is_null, "gda_value_is_null", libs);
  gidLink(cast(void**)&gda_value_is_number, "gda_value_is_number", libs);
  gidLink(cast(void**)&gda_value_new, "gda_value_new", libs);
  gidLink(cast(void**)&gda_value_new_binary, "gda_value_new_binary", libs);
  gidLink(cast(void**)&gda_value_new_blob, "gda_value_new_blob", libs);
  gidLink(cast(void**)&gda_value_new_blob_from_file, "gda_value_new_blob_from_file", libs);
  gidLink(cast(void**)&gda_value_new_default, "gda_value_new_default", libs);
  gidLink(cast(void**)&gda_value_new_from_string, "gda_value_new_from_string", libs);
  gidLink(cast(void**)&gda_value_new_from_xml, "gda_value_new_from_xml", libs);
  gidLink(cast(void**)&gda_value_new_null, "gda_value_new_null", libs);
  gidLink(cast(void**)&gda_value_new_timestamp_from_timet, "gda_value_new_timestamp_from_timet", libs);
  gidLink(cast(void**)&gda_value_reset_with_type, "gda_value_reset_with_type", libs);
  gidLink(cast(void**)&gda_value_set_binary, "gda_value_set_binary", libs);
  gidLink(cast(void**)&gda_value_set_blob, "gda_value_set_blob", libs);
  gidLink(cast(void**)&gda_value_set_from_string, "gda_value_set_from_string", libs);
  gidLink(cast(void**)&gda_value_set_from_value, "gda_value_set_from_value", libs);
  gidLink(cast(void**)&gda_value_set_geometric_point, "gda_value_set_geometric_point", libs);
  gidLink(cast(void**)&gda_value_set_null, "gda_value_set_null", libs);
  gidLink(cast(void**)&gda_value_set_numeric, "gda_value_set_numeric", libs);
  gidLink(cast(void**)&gda_value_set_short, "gda_value_set_short", libs);
  gidLink(cast(void**)&gda_value_set_time, "gda_value_set_time", libs);
  gidLink(cast(void**)&gda_value_set_timestamp, "gda_value_set_timestamp", libs);
  gidLink(cast(void**)&gda_value_set_ushort, "gda_value_set_ushort", libs);
  gidLink(cast(void**)&gda_value_stringify, "gda_value_stringify", libs);
  gidLink(cast(void**)&gda_value_take_binary, "gda_value_take_binary", libs);
  gidLink(cast(void**)&gda_value_take_blob, "gda_value_take_blob", libs);
  gidLink(cast(void**)&gda_value_to_xml, "gda_value_to_xml", libs);
}
