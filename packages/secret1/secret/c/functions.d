/// C functions for secret1 library
module secret.c.functions;

public import gid.basictypes;
import gid.loader;
import secret.c.types;
public import gobject.c.types;
public import gio.c.types;

version(Windows)
  private immutable LIBS = ["libsecret-1-0.dll;secret-1-0.dll;secret-1.dll"];
else version(OSX)
  private immutable LIBS = ["libsecret-1.0.dylib"];
else
  private immutable LIBS = ["libsecret-1.so.0"];

__gshared extern(C)
{
  // Backend
  GType function() c_secret_backend_get_type; ///
  void function(SecretBackendFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_backend_get; ///
  SecretBackend* function(GAsyncResult* result, GError** _err) c_secret_backend_get_finish; ///

  // Collection
  GType function() c_secret_collection_get_type; ///
  SecretCollection* function(GAsyncResult* result, GError** _err) c_secret_collection_new_for_dbus_path_finish; ///
  SecretCollection* function(SecretService* service, const(char)* collectionPath, SecretCollectionFlags flags, GCancellable* cancellable, GError** _err) c_secret_collection_new_for_dbus_path_sync; ///
  void function(SecretService* service, const(char)* label, const(char)* alias_, SecretCollectionCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_create; ///
  SecretCollection* function(GAsyncResult* result, GError** _err) c_secret_collection_create_finish; ///
  SecretCollection* function(SecretService* service, const(char)* label, const(char)* alias_, SecretCollectionCreateFlags flags, GCancellable* cancellable, GError** _err) c_secret_collection_create_sync; ///
  void function(SecretService* service, const(char)* alias_, SecretCollectionFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_for_alias; ///
  SecretCollection* function(GAsyncResult* result, GError** _err) c_secret_collection_for_alias_finish; ///
  SecretCollection* function(SecretService* service, const(char)* alias_, SecretCollectionFlags flags, GCancellable* cancellable, GError** _err) c_secret_collection_for_alias_sync; ///
  void function(SecretService* service, const(char)* collectionPath, SecretCollectionFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_new_for_dbus_path; ///
  void function(SecretCollection* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_delete; ///
  gboolean function(SecretCollection* self, GAsyncResult* result, GError** _err) c_secret_collection_delete_finish; ///
  gboolean function(SecretCollection* self, GCancellable* cancellable, GError** _err) c_secret_collection_delete_sync; ///
  ulong function(SecretCollection* self) c_secret_collection_get_created; ///
  SecretCollectionFlags function(SecretCollection* self) c_secret_collection_get_flags; ///
  GList* function(SecretCollection* self) c_secret_collection_get_items; ///
  char* function(SecretCollection* self) c_secret_collection_get_label; ///
  gboolean function(SecretCollection* self) c_secret_collection_get_locked; ///
  ulong function(SecretCollection* self) c_secret_collection_get_modified; ///
  SecretService* function(SecretCollection* self) c_secret_collection_get_service; ///
  void function(SecretCollection* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_load_items; ///
  gboolean function(SecretCollection* self, GAsyncResult* result, GError** _err) c_secret_collection_load_items_finish; ///
  gboolean function(SecretCollection* self, GCancellable* cancellable, GError** _err) c_secret_collection_load_items_sync; ///
  void function(SecretCollection* self) c_secret_collection_refresh; ///
  void function(SecretCollection* self, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_search; ///
  GList* function(SecretCollection* self, GAsyncResult* result, GError** _err) c_secret_collection_search_finish; ///
  void function(SecretCollection* collection, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_search_for_dbus_paths; ///
  char** function(SecretCollection* collection, GAsyncResult* result, GError** _err) c_secret_collection_search_for_dbus_paths_finish; ///
  char** function(SecretCollection* collection, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_collection_search_for_dbus_paths_sync; ///
  GList* function(SecretCollection* self, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GError** _err) c_secret_collection_search_sync; ///
  void function(SecretCollection* self, const(char)* label, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_collection_set_label; ///
  gboolean function(SecretCollection* self, GAsyncResult* result, GError** _err) c_secret_collection_set_label_finish; ///
  gboolean function(SecretCollection* self, const(char)* label, GCancellable* cancellable, GError** _err) c_secret_collection_set_label_sync; ///

  // Item
  GType function() c_secret_item_get_type; ///
  SecretItem* function(GAsyncResult* result, GError** _err) c_secret_item_new_for_dbus_path_finish; ///
  SecretItem* function(SecretService* service, const(char)* itemPath, SecretItemFlags flags, GCancellable* cancellable, GError** _err) c_secret_item_new_for_dbus_path_sync; ///
  void function(SecretCollection* collection, const(SecretSchema)* schema, GHashTable* attributes, const(char)* label, SecretValue* value, SecretItemCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_create; ///
  SecretItem* function(GAsyncResult* result, GError** _err) c_secret_item_create_finish; ///
  SecretItem* function(SecretCollection* collection, const(SecretSchema)* schema, GHashTable* attributes, const(char)* label, SecretValue* value, SecretItemCreateFlags flags, GCancellable* cancellable, GError** _err) c_secret_item_create_sync; ///
  void function(GList* items, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_load_secrets; ///
  gboolean function(GAsyncResult* result, GError** _err) c_secret_item_load_secrets_finish; ///
  gboolean function(GList* items, GCancellable* cancellable, GError** _err) c_secret_item_load_secrets_sync; ///
  void function(SecretService* service, const(char)* itemPath, SecretItemFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_new_for_dbus_path; ///
  void function(SecretItem* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_delete; ///
  gboolean function(SecretItem* self, GAsyncResult* result, GError** _err) c_secret_item_delete_finish; ///
  gboolean function(SecretItem* self, GCancellable* cancellable, GError** _err) c_secret_item_delete_sync; ///
  GHashTable* function(SecretItem* self) c_secret_item_get_attributes; ///
  ulong function(SecretItem* self) c_secret_item_get_created; ///
  SecretItemFlags function(SecretItem* self) c_secret_item_get_flags; ///
  char* function(SecretItem* self) c_secret_item_get_label; ///
  gboolean function(SecretItem* self) c_secret_item_get_locked; ///
  ulong function(SecretItem* self) c_secret_item_get_modified; ///
  char* function(SecretItem* self) c_secret_item_get_schema_name; ///
  SecretValue* function(SecretItem* self) c_secret_item_get_secret; ///
  SecretService* function(SecretItem* self) c_secret_item_get_service; ///
  void function(SecretItem* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_load_secret; ///
  gboolean function(SecretItem* self, GAsyncResult* result, GError** _err) c_secret_item_load_secret_finish; ///
  gboolean function(SecretItem* self, GCancellable* cancellable, GError** _err) c_secret_item_load_secret_sync; ///
  void function(SecretItem* self) c_secret_item_refresh; ///
  void function(SecretItem* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_set_attributes; ///
  gboolean function(SecretItem* self, GAsyncResult* result, GError** _err) c_secret_item_set_attributes_finish; ///
  gboolean function(SecretItem* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_item_set_attributes_sync; ///
  void function(SecretItem* self, const(char)* label, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_set_label; ///
  gboolean function(SecretItem* self, GAsyncResult* result, GError** _err) c_secret_item_set_label_finish; ///
  gboolean function(SecretItem* self, const(char)* label, GCancellable* cancellable, GError** _err) c_secret_item_set_label_sync; ///
  void function(SecretItem* self, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_item_set_secret; ///
  gboolean function(SecretItem* self, GAsyncResult* result, GError** _err) c_secret_item_set_secret_finish; ///
  gboolean function(SecretItem* self, SecretValue* value, GCancellable* cancellable, GError** _err) c_secret_item_set_secret_sync; ///

  // Prompt
  GType function() c_secret_prompt_get_type; ///
  void function(SecretPrompt* self, const(char)* windowId, const(GVariantType)* returnType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_prompt_perform; ///
  GVariant* function(SecretPrompt* self, GAsyncResult* result, GError** _err) c_secret_prompt_perform_finish; ///
  GVariant* function(SecretPrompt* self, const(char)* windowId, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) c_secret_prompt_perform_sync; ///
  GVariant* function(SecretPrompt* self, const(char)* windowId, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) c_secret_prompt_run; ///

  // Retrievable
  GType function() c_secret_retrievable_get_type; ///
  GHashTable* function(SecretRetrievable* self) c_secret_retrievable_get_attributes; ///
  ulong function(SecretRetrievable* self) c_secret_retrievable_get_created; ///
  char* function(SecretRetrievable* self) c_secret_retrievable_get_label; ///
  ulong function(SecretRetrievable* self) c_secret_retrievable_get_modified; ///
  void function(SecretRetrievable* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_retrievable_retrieve_secret; ///
  SecretValue* function(SecretRetrievable* self, GAsyncResult* result, GError** _err) c_secret_retrievable_retrieve_secret_finish; ///
  SecretValue* function(SecretRetrievable* self, GCancellable* cancellable, GError** _err) c_secret_retrievable_retrieve_secret_sync; ///

  // Schema
  GType function() c_secret_schema_get_type; ///
  SecretSchema* function(const(char)* name, SecretSchemaFlags flags,  ...) c_secret_schema_new; ///
  SecretSchema* function(const(char)* name, SecretSchemaFlags flags, GHashTable* attributeNamesAndTypes) c_secret_schema_newv; ///
  SecretSchema* function(SecretSchema* schema) c_secret_schema_ref; ///
  void function(SecretSchema* schema) c_secret_schema_unref; ///

  // SchemaAttribute
  GType function() c_secret_schema_attribute_get_type; ///

  // Service
  GType function() c_secret_service_get_type; ///
  void function() c_secret_service_disconnect; ///
  void function(SecretServiceFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_get; ///
  SecretService* function(GAsyncResult* result, GError** _err) c_secret_service_get_finish; ///
  SecretService* function(SecretServiceFlags flags, GCancellable* cancellable, GError** _err) c_secret_service_get_sync; ///
  void function(GType serviceGtype, const(char)* serviceBusName, SecretServiceFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_open; ///
  SecretService* function(GAsyncResult* result, GError** _err) c_secret_service_open_finish; ///
  SecretService* function(GType serviceGtype, const(char)* serviceBusName, SecretServiceFlags flags, GCancellable* cancellable, GError** _err) c_secret_service_open_sync; ///
  void function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_clear; ///
  gboolean function(SecretService* service, GAsyncResult* result, GError** _err) c_secret_service_clear_finish; ///
  gboolean function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_service_clear_sync; ///
  void function(SecretService* self, GHashTable* properties, const(char)* alias_, SecretCollectionCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_create_collection_dbus_path; ///
  char* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_create_collection_dbus_path_finish; ///
  char* function(SecretService* self, GHashTable* properties, const(char)* alias_, SecretCollectionCreateFlags flags, GCancellable* cancellable, GError** _err) c_secret_service_create_collection_dbus_path_sync; ///
  void function(SecretService* self, const(char)* collectionPath, GHashTable* properties, SecretValue* value, SecretItemCreateFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_create_item_dbus_path; ///
  char* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_create_item_dbus_path_finish; ///
  char* function(SecretService* self, const(char)* collectionPath, GHashTable* properties, SecretValue* value, SecretItemCreateFlags flags, GCancellable* cancellable, GError** _err) c_secret_service_create_item_dbus_path_sync; ///
  SecretValue* function(SecretService* service, GVariant* value) c_secret_service_decode_dbus_secret; ///
  void function(SecretService* self, const(char)* itemPath, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_delete_item_dbus_path; ///
  gboolean function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_delete_item_dbus_path_finish; ///
  gboolean function(SecretService* self, const(char)* itemPath, GCancellable* cancellable, GError** _err) c_secret_service_delete_item_dbus_path_sync; ///
  GVariant* function(SecretService* service, SecretValue* value) c_secret_service_encode_dbus_secret; ///
  void function(SecretService* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_ensure_session; ///
  gboolean function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_ensure_session_finish; ///
  gboolean function(SecretService* self, GCancellable* cancellable, GError** _err) c_secret_service_ensure_session_sync; ///
  GType function(SecretService* self) c_secret_service_get_collection_gtype; ///
  GList* function(SecretService* self) c_secret_service_get_collections; ///
  SecretServiceFlags function(SecretService* self) c_secret_service_get_flags; ///
  GType function(SecretService* self) c_secret_service_get_item_gtype; ///
  void function(SecretService* self, const(char)* itemPath, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_get_secret_for_dbus_path; ///
  SecretValue* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_get_secret_for_dbus_path_finish; ///
  SecretValue* function(SecretService* self, const(char)* itemPath, GCancellable* cancellable, GError** _err) c_secret_service_get_secret_for_dbus_path_sync; ///
  void function(SecretService* self, const(char*)* itemPaths, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_get_secrets_for_dbus_paths; ///
  GHashTable* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_get_secrets_for_dbus_paths_finish; ///
  GHashTable* function(SecretService* self, const(char*)* itemPaths, GCancellable* cancellable, GError** _err) c_secret_service_get_secrets_for_dbus_paths_sync; ///
  const(char)* function(SecretService* self) c_secret_service_get_session_algorithms; ///
  const(char)* function(SecretService* self) c_secret_service_get_session_dbus_path; ///
  void function(SecretService* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_load_collections; ///
  gboolean function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_load_collections_finish; ///
  gboolean function(SecretService* self, GCancellable* cancellable, GError** _err) c_secret_service_load_collections_sync; ///
  void function(SecretService* service, GList* objects, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_lock; ///
  void function(SecretService* self, const(char*)* paths, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_lock_dbus_paths; ///
  int function(SecretService* self, GAsyncResult* result, char*** locked, GError** _err) c_secret_service_lock_dbus_paths_finish; ///
  int function(SecretService* self, const(char*)* paths, GCancellable* cancellable, char*** locked, GError** _err) c_secret_service_lock_dbus_paths_sync; ///
  int function(SecretService* service, GAsyncResult* result, GList** locked, GError** _err) c_secret_service_lock_finish; ///
  int function(SecretService* service, GList* objects, GCancellable* cancellable, GList** locked, GError** _err) c_secret_service_lock_sync; ///
  void function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_lookup; ///
  SecretValue* function(SecretService* service, GAsyncResult* result, GError** _err) c_secret_service_lookup_finish; ///
  SecretValue* function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_service_lookup_sync; ///
  void function(SecretService* self, SecretPrompt* prompt, const(GVariantType)* returnType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_prompt; ///
  void function(SecretService* self, const(char)* promptPath, const(GVariantType)* returnType, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_prompt_at_dbus_path; ///
  GVariant* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_prompt_at_dbus_path_finish; ///
  GVariant* function(SecretService* self, const(char)* promptPath, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) c_secret_service_prompt_at_dbus_path_sync; ///
  GVariant* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_prompt_finish; ///
  GVariant* function(SecretService* self, SecretPrompt* prompt, GCancellable* cancellable, const(GVariantType)* returnType, GError** _err) c_secret_service_prompt_sync; ///
  void function(SecretService* self, const(char)* alias_, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_read_alias_dbus_path; ///
  char* function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_read_alias_dbus_path_finish; ///
  char* function(SecretService* self, const(char)* alias_, GCancellable* cancellable, GError** _err) c_secret_service_read_alias_dbus_path_sync; ///
  void function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_search; ///
  GList* function(SecretService* service, GAsyncResult* result, GError** _err) c_secret_service_search_finish; ///
  void function(SecretService* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_search_for_dbus_paths; ///
  gboolean function(SecretService* self, GAsyncResult* result, char*** unlocked, char*** locked, GError** _err) c_secret_service_search_for_dbus_paths_finish; ///
  gboolean function(SecretService* self, const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, char*** unlocked, char*** locked, GError** _err) c_secret_service_search_for_dbus_paths_sync; ///
  GList* function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GError** _err) c_secret_service_search_sync; ///
  void function(SecretService* service, const(char)* alias_, SecretCollection* collection, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_set_alias; ///
  gboolean function(SecretService* service, GAsyncResult* result, GError** _err) c_secret_service_set_alias_finish; ///
  gboolean function(SecretService* service, const(char)* alias_, SecretCollection* collection, GCancellable* cancellable, GError** _err) c_secret_service_set_alias_sync; ///
  void function(SecretService* self, const(char)* alias_, const(char)* collectionPath, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_set_alias_to_dbus_path; ///
  gboolean function(SecretService* self, GAsyncResult* result, GError** _err) c_secret_service_set_alias_to_dbus_path_finish; ///
  gboolean function(SecretService* self, const(char)* alias_, const(char)* collectionPath, GCancellable* cancellable, GError** _err) c_secret_service_set_alias_to_dbus_path_sync; ///
  void function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_store; ///
  gboolean function(SecretService* service, GAsyncResult* result, GError** _err) c_secret_service_store_finish; ///
  gboolean function(SecretService* service, const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GError** _err) c_secret_service_store_sync; ///
  void function(SecretService* service, GList* objects, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_unlock; ///
  void function(SecretService* self, const(char*)* paths, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_service_unlock_dbus_paths; ///
  int function(SecretService* self, GAsyncResult* result, char*** unlocked, GError** _err) c_secret_service_unlock_dbus_paths_finish; ///
  int function(SecretService* self, const(char*)* paths, GCancellable* cancellable, char*** unlocked, GError** _err) c_secret_service_unlock_dbus_paths_sync; ///
  int function(SecretService* service, GAsyncResult* result, GList** unlocked, GError** _err) c_secret_service_unlock_finish; ///
  int function(SecretService* service, GList* objects, GCancellable* cancellable, GList** unlocked, GError** _err) c_secret_service_unlock_sync; ///

  // Value
  GType function() c_secret_value_get_type; ///
  SecretValue* function(const(char)* secret, ptrdiff_t length, const(char)* contentType) c_secret_value_new; ///
  SecretValue* function(char* secretData, ptrdiff_t length, const(char)* contentType, GDestroyNotify destroy) c_secret_value_new_full; ///
  const(ubyte)* function(SecretValue* value, size_t* length) c_secret_value_get; ///
  const(char)* function(SecretValue* value) c_secret_value_get_content_type; ///
  const(char)* function(SecretValue* value) c_secret_value_get_text; ///
  SecretValue* function(SecretValue* value) c_secret_value_ref; ///
  void function(SecretValue* value) c_secret_value_unref; ///
  char* function(SecretValue* value, size_t* length) c_secret_value_unref_to_password; ///

  // global
  GHashTable* function(const(SecretSchema)* schema,  ...) c_secret_attributes_build; ///
  GHashTable* function(const(SecretSchema)* schema, void* va) c_secret_attributes_buildv; ///
  gboolean function(const(SecretSchema)* schema, GHashTable* attributes, GError** _err) c_secret_attributes_validate; ///
  const(SecretSchema)* function(SecretSchemaType type) c_secret_get_schema; ///
  void function(const(SecretSchema)* schema, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_secret_password_clear; ///
  gboolean function(GAsyncResult* result, GError** _err) c_secret_password_clear_finish; ///
  gboolean function(const(SecretSchema)* schema, GCancellable* cancellable, GError** error,  ...) c_secret_password_clear_sync; ///
  void function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_password_clearv; ///
  gboolean function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_password_clearv_sync; ///
  void function(char* password) c_secret_password_free; ///
  void function(const(SecretSchema)* schema, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_secret_password_lookup; ///
  SecretValue* function(GAsyncResult* result, GError** _err) c_secret_password_lookup_binary_finish; ///
  SecretValue* function(const(SecretSchema)* schema, GCancellable* cancellable, GError** error,  ...) c_secret_password_lookup_binary_sync; ///
  char* function(GAsyncResult* result, GError** _err) c_secret_password_lookup_finish; ///
  char* function(GAsyncResult* result, GError** _err) c_secret_password_lookup_nonpageable_finish; ///
  char* function(const(SecretSchema)* schema, GCancellable* cancellable, GError** error,  ...) c_secret_password_lookup_nonpageable_sync; ///
  char* function(const(SecretSchema)* schema, GCancellable* cancellable, GError** error,  ...) c_secret_password_lookup_sync; ///
  void function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_password_lookupv; ///
  SecretValue* function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_password_lookupv_binary_sync; ///
  char* function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_password_lookupv_nonpageable_sync; ///
  char* function(const(SecretSchema)* schema, GHashTable* attributes, GCancellable* cancellable, GError** _err) c_secret_password_lookupv_sync; ///
  void function(const(SecretSchema)* schema, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_secret_password_search; ///
  GList* function(GAsyncResult* result, GError** _err) c_secret_password_search_finish; ///
  GList* function(const(SecretSchema)* schema, SecretSearchFlags flags, GCancellable* cancellable, GError** error,  ...) c_secret_password_search_sync; ///
  void function(const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_password_searchv; ///
  GList* function(const(SecretSchema)* schema, GHashTable* attributes, SecretSearchFlags flags, GCancellable* cancellable, GError** _err) c_secret_password_searchv_sync; ///
  void function(const(SecretSchema)* schema, const(char)* collection, const(char)* label, const(char)* password, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_secret_password_store; ///
  void function(const(SecretSchema)* schema, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData,  ...) c_secret_password_store_binary; ///
  gboolean function(const(SecretSchema)* schema, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GError** error,  ...) c_secret_password_store_binary_sync; ///
  gboolean function(GAsyncResult* result, GError** _err) c_secret_password_store_finish; ///
  gboolean function(const(SecretSchema)* schema, const(char)* collection, const(char)* label, const(char)* password, GCancellable* cancellable, GError** error,  ...) c_secret_password_store_sync; ///
  void function(const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, const(char)* password, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_password_storev; ///
  void function(const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_secret_password_storev_binary; ///
  gboolean function(const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, SecretValue* value, GCancellable* cancellable, GError** _err) c_secret_password_storev_binary_sync; ///
  gboolean function(const(SecretSchema)* schema, GHashTable* attributes, const(char)* collection, const(char)* label, const(char)* password, GCancellable* cancellable, GError** _err) c_secret_password_storev_sync; ///
  void function(char* password) c_secret_password_wipe; ///

  // Error
  GQuark function() c_secret_error_get_quark; ///
}

// Backend

/** */
alias secret_backend_get_type = c_secret_backend_get_type;

/** */
alias secret_backend_get = c_secret_backend_get;

/** */
alias secret_backend_get_finish = c_secret_backend_get_finish;

// Collection

/** */
alias secret_collection_get_type = c_secret_collection_get_type;

/** */
alias secret_collection_new_for_dbus_path_finish = c_secret_collection_new_for_dbus_path_finish;

/** */
alias secret_collection_new_for_dbus_path_sync = c_secret_collection_new_for_dbus_path_sync;

/** */
alias secret_collection_create = c_secret_collection_create;

/** */
alias secret_collection_create_finish = c_secret_collection_create_finish;

/** */
alias secret_collection_create_sync = c_secret_collection_create_sync;

/** */
alias secret_collection_for_alias = c_secret_collection_for_alias;

/** */
alias secret_collection_for_alias_finish = c_secret_collection_for_alias_finish;

/** */
alias secret_collection_for_alias_sync = c_secret_collection_for_alias_sync;

/** */
alias secret_collection_new_for_dbus_path = c_secret_collection_new_for_dbus_path;

/** */
alias secret_collection_delete = c_secret_collection_delete;

/** */
alias secret_collection_delete_finish = c_secret_collection_delete_finish;

/** */
alias secret_collection_delete_sync = c_secret_collection_delete_sync;

/** */
alias secret_collection_get_created = c_secret_collection_get_created;

/** */
alias secret_collection_get_flags = c_secret_collection_get_flags;

/** */
alias secret_collection_get_items = c_secret_collection_get_items;

/** */
alias secret_collection_get_label = c_secret_collection_get_label;

/** */
alias secret_collection_get_locked = c_secret_collection_get_locked;

/** */
alias secret_collection_get_modified = c_secret_collection_get_modified;

/** */
alias secret_collection_get_service = c_secret_collection_get_service;

/** */
alias secret_collection_load_items = c_secret_collection_load_items;

/** */
alias secret_collection_load_items_finish = c_secret_collection_load_items_finish;

/** */
alias secret_collection_load_items_sync = c_secret_collection_load_items_sync;

/** */
alias secret_collection_refresh = c_secret_collection_refresh;

/** */
alias secret_collection_search = c_secret_collection_search;

/** */
alias secret_collection_search_finish = c_secret_collection_search_finish;

/** */
alias secret_collection_search_for_dbus_paths = c_secret_collection_search_for_dbus_paths;

/** */
alias secret_collection_search_for_dbus_paths_finish = c_secret_collection_search_for_dbus_paths_finish;

/** */
alias secret_collection_search_for_dbus_paths_sync = c_secret_collection_search_for_dbus_paths_sync;

/** */
alias secret_collection_search_sync = c_secret_collection_search_sync;

/** */
alias secret_collection_set_label = c_secret_collection_set_label;

/** */
alias secret_collection_set_label_finish = c_secret_collection_set_label_finish;

/** */
alias secret_collection_set_label_sync = c_secret_collection_set_label_sync;

// Item

/** */
alias secret_item_get_type = c_secret_item_get_type;

/** */
alias secret_item_new_for_dbus_path_finish = c_secret_item_new_for_dbus_path_finish;

/** */
alias secret_item_new_for_dbus_path_sync = c_secret_item_new_for_dbus_path_sync;

/** */
alias secret_item_create = c_secret_item_create;

/** */
alias secret_item_create_finish = c_secret_item_create_finish;

/** */
alias secret_item_create_sync = c_secret_item_create_sync;

/** */
alias secret_item_load_secrets = c_secret_item_load_secrets;

/** */
alias secret_item_load_secrets_finish = c_secret_item_load_secrets_finish;

/** */
alias secret_item_load_secrets_sync = c_secret_item_load_secrets_sync;

/** */
alias secret_item_new_for_dbus_path = c_secret_item_new_for_dbus_path;

/** */
alias secret_item_delete = c_secret_item_delete;

/** */
alias secret_item_delete_finish = c_secret_item_delete_finish;

/** */
alias secret_item_delete_sync = c_secret_item_delete_sync;

/** */
alias secret_item_get_attributes = c_secret_item_get_attributes;

/** */
alias secret_item_get_created = c_secret_item_get_created;

/** */
alias secret_item_get_flags = c_secret_item_get_flags;

/** */
alias secret_item_get_label = c_secret_item_get_label;

/** */
alias secret_item_get_locked = c_secret_item_get_locked;

/** */
alias secret_item_get_modified = c_secret_item_get_modified;

/** */
alias secret_item_get_schema_name = c_secret_item_get_schema_name;

/** */
alias secret_item_get_secret = c_secret_item_get_secret;

/** */
alias secret_item_get_service = c_secret_item_get_service;

/** */
alias secret_item_load_secret = c_secret_item_load_secret;

/** */
alias secret_item_load_secret_finish = c_secret_item_load_secret_finish;

/** */
alias secret_item_load_secret_sync = c_secret_item_load_secret_sync;

/** */
alias secret_item_refresh = c_secret_item_refresh;

/** */
alias secret_item_set_attributes = c_secret_item_set_attributes;

/** */
alias secret_item_set_attributes_finish = c_secret_item_set_attributes_finish;

/** */
alias secret_item_set_attributes_sync = c_secret_item_set_attributes_sync;

/** */
alias secret_item_set_label = c_secret_item_set_label;

/** */
alias secret_item_set_label_finish = c_secret_item_set_label_finish;

/** */
alias secret_item_set_label_sync = c_secret_item_set_label_sync;

/** */
alias secret_item_set_secret = c_secret_item_set_secret;

/** */
alias secret_item_set_secret_finish = c_secret_item_set_secret_finish;

/** */
alias secret_item_set_secret_sync = c_secret_item_set_secret_sync;

// Prompt

/** */
alias secret_prompt_get_type = c_secret_prompt_get_type;

/** */
alias secret_prompt_perform = c_secret_prompt_perform;

/** */
alias secret_prompt_perform_finish = c_secret_prompt_perform_finish;

/** */
alias secret_prompt_perform_sync = c_secret_prompt_perform_sync;

/** */
alias secret_prompt_run = c_secret_prompt_run;

// Retrievable

/** */
alias secret_retrievable_get_type = c_secret_retrievable_get_type;

/** */
alias secret_retrievable_get_attributes = c_secret_retrievable_get_attributes;

/** */
alias secret_retrievable_get_created = c_secret_retrievable_get_created;

/** */
alias secret_retrievable_get_label = c_secret_retrievable_get_label;

/** */
alias secret_retrievable_get_modified = c_secret_retrievable_get_modified;

/** */
alias secret_retrievable_retrieve_secret = c_secret_retrievable_retrieve_secret;

/** */
alias secret_retrievable_retrieve_secret_finish = c_secret_retrievable_retrieve_secret_finish;

/** */
alias secret_retrievable_retrieve_secret_sync = c_secret_retrievable_retrieve_secret_sync;

// Schema

/** */
alias secret_schema_get_type = c_secret_schema_get_type;

/** */
alias secret_schema_new = c_secret_schema_new;

/** */
alias secret_schema_newv = c_secret_schema_newv;

/** */
alias secret_schema_ref = c_secret_schema_ref;

/** */
alias secret_schema_unref = c_secret_schema_unref;

// SchemaAttribute

/** */
alias secret_schema_attribute_get_type = c_secret_schema_attribute_get_type;

// Service

/** */
alias secret_service_get_type = c_secret_service_get_type;

/** */
alias secret_service_disconnect = c_secret_service_disconnect;

/** */
alias secret_service_get = c_secret_service_get;

/** */
alias secret_service_get_finish = c_secret_service_get_finish;

/** */
alias secret_service_get_sync = c_secret_service_get_sync;

/** */
alias secret_service_open = c_secret_service_open;

/** */
alias secret_service_open_finish = c_secret_service_open_finish;

/** */
alias secret_service_open_sync = c_secret_service_open_sync;

/** */
alias secret_service_clear = c_secret_service_clear;

/** */
alias secret_service_clear_finish = c_secret_service_clear_finish;

/** */
alias secret_service_clear_sync = c_secret_service_clear_sync;

/** */
alias secret_service_create_collection_dbus_path = c_secret_service_create_collection_dbus_path;

/** */
alias secret_service_create_collection_dbus_path_finish = c_secret_service_create_collection_dbus_path_finish;

/** */
alias secret_service_create_collection_dbus_path_sync = c_secret_service_create_collection_dbus_path_sync;

/** */
alias secret_service_create_item_dbus_path = c_secret_service_create_item_dbus_path;

/** */
alias secret_service_create_item_dbus_path_finish = c_secret_service_create_item_dbus_path_finish;

/** */
alias secret_service_create_item_dbus_path_sync = c_secret_service_create_item_dbus_path_sync;

/** */
alias secret_service_decode_dbus_secret = c_secret_service_decode_dbus_secret;

/** */
alias secret_service_delete_item_dbus_path = c_secret_service_delete_item_dbus_path;

/** */
alias secret_service_delete_item_dbus_path_finish = c_secret_service_delete_item_dbus_path_finish;

/** */
alias secret_service_delete_item_dbus_path_sync = c_secret_service_delete_item_dbus_path_sync;

/** */
alias secret_service_encode_dbus_secret = c_secret_service_encode_dbus_secret;

/** */
alias secret_service_ensure_session = c_secret_service_ensure_session;

/** */
alias secret_service_ensure_session_finish = c_secret_service_ensure_session_finish;

/** */
alias secret_service_ensure_session_sync = c_secret_service_ensure_session_sync;

/** */
alias secret_service_get_collection_gtype = c_secret_service_get_collection_gtype;

/** */
alias secret_service_get_collections = c_secret_service_get_collections;

/** */
alias secret_service_get_flags = c_secret_service_get_flags;

/** */
alias secret_service_get_item_gtype = c_secret_service_get_item_gtype;

/** */
alias secret_service_get_secret_for_dbus_path = c_secret_service_get_secret_for_dbus_path;

/** */
alias secret_service_get_secret_for_dbus_path_finish = c_secret_service_get_secret_for_dbus_path_finish;

/** */
alias secret_service_get_secret_for_dbus_path_sync = c_secret_service_get_secret_for_dbus_path_sync;

/** */
alias secret_service_get_secrets_for_dbus_paths = c_secret_service_get_secrets_for_dbus_paths;

/** */
alias secret_service_get_secrets_for_dbus_paths_finish = c_secret_service_get_secrets_for_dbus_paths_finish;

/** */
alias secret_service_get_secrets_for_dbus_paths_sync = c_secret_service_get_secrets_for_dbus_paths_sync;

/** */
alias secret_service_get_session_algorithms = c_secret_service_get_session_algorithms;

/** */
alias secret_service_get_session_dbus_path = c_secret_service_get_session_dbus_path;

/** */
alias secret_service_load_collections = c_secret_service_load_collections;

/** */
alias secret_service_load_collections_finish = c_secret_service_load_collections_finish;

/** */
alias secret_service_load_collections_sync = c_secret_service_load_collections_sync;

/** */
alias secret_service_lock = c_secret_service_lock;

/** */
alias secret_service_lock_dbus_paths = c_secret_service_lock_dbus_paths;

/** */
alias secret_service_lock_dbus_paths_finish = c_secret_service_lock_dbus_paths_finish;

/** */
alias secret_service_lock_dbus_paths_sync = c_secret_service_lock_dbus_paths_sync;

/** */
alias secret_service_lock_finish = c_secret_service_lock_finish;

/** */
alias secret_service_lock_sync = c_secret_service_lock_sync;

/** */
alias secret_service_lookup = c_secret_service_lookup;

/** */
alias secret_service_lookup_finish = c_secret_service_lookup_finish;

/** */
alias secret_service_lookup_sync = c_secret_service_lookup_sync;

/** */
alias secret_service_prompt = c_secret_service_prompt;

/** */
alias secret_service_prompt_at_dbus_path = c_secret_service_prompt_at_dbus_path;

/** */
alias secret_service_prompt_at_dbus_path_finish = c_secret_service_prompt_at_dbus_path_finish;

/** */
alias secret_service_prompt_at_dbus_path_sync = c_secret_service_prompt_at_dbus_path_sync;

/** */
alias secret_service_prompt_finish = c_secret_service_prompt_finish;

/** */
alias secret_service_prompt_sync = c_secret_service_prompt_sync;

/** */
alias secret_service_read_alias_dbus_path = c_secret_service_read_alias_dbus_path;

/** */
alias secret_service_read_alias_dbus_path_finish = c_secret_service_read_alias_dbus_path_finish;

/** */
alias secret_service_read_alias_dbus_path_sync = c_secret_service_read_alias_dbus_path_sync;

/** */
alias secret_service_search = c_secret_service_search;

/** */
alias secret_service_search_finish = c_secret_service_search_finish;

/** */
alias secret_service_search_for_dbus_paths = c_secret_service_search_for_dbus_paths;

/** */
alias secret_service_search_for_dbus_paths_finish = c_secret_service_search_for_dbus_paths_finish;

/** */
alias secret_service_search_for_dbus_paths_sync = c_secret_service_search_for_dbus_paths_sync;

/** */
alias secret_service_search_sync = c_secret_service_search_sync;

/** */
alias secret_service_set_alias = c_secret_service_set_alias;

/** */
alias secret_service_set_alias_finish = c_secret_service_set_alias_finish;

/** */
alias secret_service_set_alias_sync = c_secret_service_set_alias_sync;

/** */
alias secret_service_set_alias_to_dbus_path = c_secret_service_set_alias_to_dbus_path;

/** */
alias secret_service_set_alias_to_dbus_path_finish = c_secret_service_set_alias_to_dbus_path_finish;

/** */
alias secret_service_set_alias_to_dbus_path_sync = c_secret_service_set_alias_to_dbus_path_sync;

/** */
alias secret_service_store = c_secret_service_store;

/** */
alias secret_service_store_finish = c_secret_service_store_finish;

/** */
alias secret_service_store_sync = c_secret_service_store_sync;

/** */
alias secret_service_unlock = c_secret_service_unlock;

/** */
alias secret_service_unlock_dbus_paths = c_secret_service_unlock_dbus_paths;

/** */
alias secret_service_unlock_dbus_paths_finish = c_secret_service_unlock_dbus_paths_finish;

/** */
alias secret_service_unlock_dbus_paths_sync = c_secret_service_unlock_dbus_paths_sync;

/** */
alias secret_service_unlock_finish = c_secret_service_unlock_finish;

/** */
alias secret_service_unlock_sync = c_secret_service_unlock_sync;

// Value

/** */
alias secret_value_get_type = c_secret_value_get_type;

/** */
alias secret_value_new = c_secret_value_new;

/** */
alias secret_value_new_full = c_secret_value_new_full;

/** */
alias secret_value_get = c_secret_value_get;

/** */
alias secret_value_get_content_type = c_secret_value_get_content_type;

/** */
alias secret_value_get_text = c_secret_value_get_text;

/** */
alias secret_value_ref = c_secret_value_ref;

/** */
alias secret_value_unref = c_secret_value_unref;

/** */
alias secret_value_unref_to_password = c_secret_value_unref_to_password;

// global

/** */
alias secret_attributes_build = c_secret_attributes_build;

/** */
alias secret_attributes_buildv = c_secret_attributes_buildv;

/** */
alias secret_attributes_validate = c_secret_attributes_validate;

/** */
alias secret_get_schema = c_secret_get_schema;

/** */
alias secret_password_clear = c_secret_password_clear;

/** */
alias secret_password_clear_finish = c_secret_password_clear_finish;

/** */
alias secret_password_clear_sync = c_secret_password_clear_sync;

/** */
alias secret_password_clearv = c_secret_password_clearv;

/** */
alias secret_password_clearv_sync = c_secret_password_clearv_sync;

/** */
alias secret_password_free = c_secret_password_free;

/** */
alias secret_password_lookup = c_secret_password_lookup;

/** */
alias secret_password_lookup_binary_finish = c_secret_password_lookup_binary_finish;

/** */
alias secret_password_lookup_binary_sync = c_secret_password_lookup_binary_sync;

/** */
alias secret_password_lookup_finish = c_secret_password_lookup_finish;

/** */
alias secret_password_lookup_nonpageable_finish = c_secret_password_lookup_nonpageable_finish;

/** */
alias secret_password_lookup_nonpageable_sync = c_secret_password_lookup_nonpageable_sync;

/** */
alias secret_password_lookup_sync = c_secret_password_lookup_sync;

/** */
alias secret_password_lookupv = c_secret_password_lookupv;

/** */
alias secret_password_lookupv_binary_sync = c_secret_password_lookupv_binary_sync;

/** */
alias secret_password_lookupv_nonpageable_sync = c_secret_password_lookupv_nonpageable_sync;

/** */
alias secret_password_lookupv_sync = c_secret_password_lookupv_sync;

/** */
alias secret_password_search = c_secret_password_search;

/** */
alias secret_password_search_finish = c_secret_password_search_finish;

/** */
alias secret_password_search_sync = c_secret_password_search_sync;

/** */
alias secret_password_searchv = c_secret_password_searchv;

/** */
alias secret_password_searchv_sync = c_secret_password_searchv_sync;

/** */
alias secret_password_store = c_secret_password_store;

/** */
alias secret_password_store_binary = c_secret_password_store_binary;

/** */
alias secret_password_store_binary_sync = c_secret_password_store_binary_sync;

/** */
alias secret_password_store_finish = c_secret_password_store_finish;

/** */
alias secret_password_store_sync = c_secret_password_store_sync;

/** */
alias secret_password_storev = c_secret_password_storev;

/** */
alias secret_password_storev_binary = c_secret_password_storev_binary;

/** */
alias secret_password_storev_binary_sync = c_secret_password_storev_binary_sync;

/** */
alias secret_password_storev_sync = c_secret_password_storev_sync;

/** */
alias secret_password_wipe = c_secret_password_wipe;

// Error

/** */
alias secret_error_get_quark = c_secret_error_get_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Backend
  gidLink(cast(void**)&secret_backend_get_type, "secret_backend_get_type", libs);
  gidLink(cast(void**)&secret_backend_get, "secret_backend_get", libs);
  gidLink(cast(void**)&secret_backend_get_finish, "secret_backend_get_finish", libs);

  // Collection
  gidLink(cast(void**)&secret_collection_get_type, "secret_collection_get_type", libs);
  gidLink(cast(void**)&secret_collection_new_for_dbus_path_finish, "secret_collection_new_for_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_collection_new_for_dbus_path_sync, "secret_collection_new_for_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_collection_create, "secret_collection_create", libs);
  gidLink(cast(void**)&secret_collection_create_finish, "secret_collection_create_finish", libs);
  gidLink(cast(void**)&secret_collection_create_sync, "secret_collection_create_sync", libs);
  gidLink(cast(void**)&secret_collection_for_alias, "secret_collection_for_alias", libs);
  gidLink(cast(void**)&secret_collection_for_alias_finish, "secret_collection_for_alias_finish", libs);
  gidLink(cast(void**)&secret_collection_for_alias_sync, "secret_collection_for_alias_sync", libs);
  gidLink(cast(void**)&secret_collection_new_for_dbus_path, "secret_collection_new_for_dbus_path", libs);
  gidLink(cast(void**)&secret_collection_delete, "secret_collection_delete", libs);
  gidLink(cast(void**)&secret_collection_delete_finish, "secret_collection_delete_finish", libs);
  gidLink(cast(void**)&secret_collection_delete_sync, "secret_collection_delete_sync", libs);
  gidLink(cast(void**)&secret_collection_get_created, "secret_collection_get_created", libs);
  gidLink(cast(void**)&secret_collection_get_flags, "secret_collection_get_flags", libs);
  gidLink(cast(void**)&secret_collection_get_items, "secret_collection_get_items", libs);
  gidLink(cast(void**)&secret_collection_get_label, "secret_collection_get_label", libs);
  gidLink(cast(void**)&secret_collection_get_locked, "secret_collection_get_locked", libs);
  gidLink(cast(void**)&secret_collection_get_modified, "secret_collection_get_modified", libs);
  gidLink(cast(void**)&secret_collection_get_service, "secret_collection_get_service", libs);
  gidLink(cast(void**)&secret_collection_load_items, "secret_collection_load_items", libs);
  gidLink(cast(void**)&secret_collection_load_items_finish, "secret_collection_load_items_finish", libs);
  gidLink(cast(void**)&secret_collection_load_items_sync, "secret_collection_load_items_sync", libs);
  gidLink(cast(void**)&secret_collection_refresh, "secret_collection_refresh", libs);
  gidLink(cast(void**)&secret_collection_search, "secret_collection_search", libs);
  gidLink(cast(void**)&secret_collection_search_finish, "secret_collection_search_finish", libs);
  gidLink(cast(void**)&secret_collection_search_for_dbus_paths, "secret_collection_search_for_dbus_paths", libs);
  gidLink(cast(void**)&secret_collection_search_for_dbus_paths_finish, "secret_collection_search_for_dbus_paths_finish", libs);
  gidLink(cast(void**)&secret_collection_search_for_dbus_paths_sync, "secret_collection_search_for_dbus_paths_sync", libs);
  gidLink(cast(void**)&secret_collection_search_sync, "secret_collection_search_sync", libs);
  gidLink(cast(void**)&secret_collection_set_label, "secret_collection_set_label", libs);
  gidLink(cast(void**)&secret_collection_set_label_finish, "secret_collection_set_label_finish", libs);
  gidLink(cast(void**)&secret_collection_set_label_sync, "secret_collection_set_label_sync", libs);

  // Item
  gidLink(cast(void**)&secret_item_get_type, "secret_item_get_type", libs);
  gidLink(cast(void**)&secret_item_new_for_dbus_path_finish, "secret_item_new_for_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_item_new_for_dbus_path_sync, "secret_item_new_for_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_item_create, "secret_item_create", libs);
  gidLink(cast(void**)&secret_item_create_finish, "secret_item_create_finish", libs);
  gidLink(cast(void**)&secret_item_create_sync, "secret_item_create_sync", libs);
  gidLink(cast(void**)&secret_item_load_secrets, "secret_item_load_secrets", libs);
  gidLink(cast(void**)&secret_item_load_secrets_finish, "secret_item_load_secrets_finish", libs);
  gidLink(cast(void**)&secret_item_load_secrets_sync, "secret_item_load_secrets_sync", libs);
  gidLink(cast(void**)&secret_item_new_for_dbus_path, "secret_item_new_for_dbus_path", libs);
  gidLink(cast(void**)&secret_item_delete, "secret_item_delete", libs);
  gidLink(cast(void**)&secret_item_delete_finish, "secret_item_delete_finish", libs);
  gidLink(cast(void**)&secret_item_delete_sync, "secret_item_delete_sync", libs);
  gidLink(cast(void**)&secret_item_get_attributes, "secret_item_get_attributes", libs);
  gidLink(cast(void**)&secret_item_get_created, "secret_item_get_created", libs);
  gidLink(cast(void**)&secret_item_get_flags, "secret_item_get_flags", libs);
  gidLink(cast(void**)&secret_item_get_label, "secret_item_get_label", libs);
  gidLink(cast(void**)&secret_item_get_locked, "secret_item_get_locked", libs);
  gidLink(cast(void**)&secret_item_get_modified, "secret_item_get_modified", libs);
  gidLink(cast(void**)&secret_item_get_schema_name, "secret_item_get_schema_name", libs);
  gidLink(cast(void**)&secret_item_get_secret, "secret_item_get_secret", libs);
  gidLink(cast(void**)&secret_item_get_service, "secret_item_get_service", libs);
  gidLink(cast(void**)&secret_item_load_secret, "secret_item_load_secret", libs);
  gidLink(cast(void**)&secret_item_load_secret_finish, "secret_item_load_secret_finish", libs);
  gidLink(cast(void**)&secret_item_load_secret_sync, "secret_item_load_secret_sync", libs);
  gidLink(cast(void**)&secret_item_refresh, "secret_item_refresh", libs);
  gidLink(cast(void**)&secret_item_set_attributes, "secret_item_set_attributes", libs);
  gidLink(cast(void**)&secret_item_set_attributes_finish, "secret_item_set_attributes_finish", libs);
  gidLink(cast(void**)&secret_item_set_attributes_sync, "secret_item_set_attributes_sync", libs);
  gidLink(cast(void**)&secret_item_set_label, "secret_item_set_label", libs);
  gidLink(cast(void**)&secret_item_set_label_finish, "secret_item_set_label_finish", libs);
  gidLink(cast(void**)&secret_item_set_label_sync, "secret_item_set_label_sync", libs);
  gidLink(cast(void**)&secret_item_set_secret, "secret_item_set_secret", libs);
  gidLink(cast(void**)&secret_item_set_secret_finish, "secret_item_set_secret_finish", libs);
  gidLink(cast(void**)&secret_item_set_secret_sync, "secret_item_set_secret_sync", libs);

  // Prompt
  gidLink(cast(void**)&secret_prompt_get_type, "secret_prompt_get_type", libs);
  gidLink(cast(void**)&secret_prompt_perform, "secret_prompt_perform", libs);
  gidLink(cast(void**)&secret_prompt_perform_finish, "secret_prompt_perform_finish", libs);
  gidLink(cast(void**)&secret_prompt_perform_sync, "secret_prompt_perform_sync", libs);
  gidLink(cast(void**)&secret_prompt_run, "secret_prompt_run", libs);

  // Retrievable
  gidLink(cast(void**)&secret_retrievable_get_type, "secret_retrievable_get_type", libs);
  gidLink(cast(void**)&secret_retrievable_get_attributes, "secret_retrievable_get_attributes", libs);
  gidLink(cast(void**)&secret_retrievable_get_created, "secret_retrievable_get_created", libs);
  gidLink(cast(void**)&secret_retrievable_get_label, "secret_retrievable_get_label", libs);
  gidLink(cast(void**)&secret_retrievable_get_modified, "secret_retrievable_get_modified", libs);
  gidLink(cast(void**)&secret_retrievable_retrieve_secret, "secret_retrievable_retrieve_secret", libs);
  gidLink(cast(void**)&secret_retrievable_retrieve_secret_finish, "secret_retrievable_retrieve_secret_finish", libs);
  gidLink(cast(void**)&secret_retrievable_retrieve_secret_sync, "secret_retrievable_retrieve_secret_sync", libs);

  // Schema
  gidLink(cast(void**)&secret_schema_get_type, "secret_schema_get_type", libs);
  gidLink(cast(void**)&secret_schema_new, "secret_schema_new", libs);
  gidLink(cast(void**)&secret_schema_newv, "secret_schema_newv", libs);
  gidLink(cast(void**)&secret_schema_ref, "secret_schema_ref", libs);
  gidLink(cast(void**)&secret_schema_unref, "secret_schema_unref", libs);

  // SchemaAttribute
  gidLink(cast(void**)&secret_schema_attribute_get_type, "secret_schema_attribute_get_type", libs);

  // Service
  gidLink(cast(void**)&secret_service_get_type, "secret_service_get_type", libs);
  gidLink(cast(void**)&secret_service_disconnect, "secret_service_disconnect", libs);
  gidLink(cast(void**)&secret_service_get, "secret_service_get", libs);
  gidLink(cast(void**)&secret_service_get_finish, "secret_service_get_finish", libs);
  gidLink(cast(void**)&secret_service_get_sync, "secret_service_get_sync", libs);
  gidLink(cast(void**)&secret_service_open, "secret_service_open", libs);
  gidLink(cast(void**)&secret_service_open_finish, "secret_service_open_finish", libs);
  gidLink(cast(void**)&secret_service_open_sync, "secret_service_open_sync", libs);
  gidLink(cast(void**)&secret_service_clear, "secret_service_clear", libs);
  gidLink(cast(void**)&secret_service_clear_finish, "secret_service_clear_finish", libs);
  gidLink(cast(void**)&secret_service_clear_sync, "secret_service_clear_sync", libs);
  gidLink(cast(void**)&secret_service_create_collection_dbus_path, "secret_service_create_collection_dbus_path", libs);
  gidLink(cast(void**)&secret_service_create_collection_dbus_path_finish, "secret_service_create_collection_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_create_collection_dbus_path_sync, "secret_service_create_collection_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_create_item_dbus_path, "secret_service_create_item_dbus_path", libs);
  gidLink(cast(void**)&secret_service_create_item_dbus_path_finish, "secret_service_create_item_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_create_item_dbus_path_sync, "secret_service_create_item_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_decode_dbus_secret, "secret_service_decode_dbus_secret", libs);
  gidLink(cast(void**)&secret_service_delete_item_dbus_path, "secret_service_delete_item_dbus_path", libs);
  gidLink(cast(void**)&secret_service_delete_item_dbus_path_finish, "secret_service_delete_item_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_delete_item_dbus_path_sync, "secret_service_delete_item_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_encode_dbus_secret, "secret_service_encode_dbus_secret", libs);
  gidLink(cast(void**)&secret_service_ensure_session, "secret_service_ensure_session", libs);
  gidLink(cast(void**)&secret_service_ensure_session_finish, "secret_service_ensure_session_finish", libs);
  gidLink(cast(void**)&secret_service_ensure_session_sync, "secret_service_ensure_session_sync", libs);
  gidLink(cast(void**)&secret_service_get_collection_gtype, "secret_service_get_collection_gtype", libs);
  gidLink(cast(void**)&secret_service_get_collections, "secret_service_get_collections", libs);
  gidLink(cast(void**)&secret_service_get_flags, "secret_service_get_flags", libs);
  gidLink(cast(void**)&secret_service_get_item_gtype, "secret_service_get_item_gtype", libs);
  gidLink(cast(void**)&secret_service_get_secret_for_dbus_path, "secret_service_get_secret_for_dbus_path", libs);
  gidLink(cast(void**)&secret_service_get_secret_for_dbus_path_finish, "secret_service_get_secret_for_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_get_secret_for_dbus_path_sync, "secret_service_get_secret_for_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_get_secrets_for_dbus_paths, "secret_service_get_secrets_for_dbus_paths", libs);
  gidLink(cast(void**)&secret_service_get_secrets_for_dbus_paths_finish, "secret_service_get_secrets_for_dbus_paths_finish", libs);
  gidLink(cast(void**)&secret_service_get_secrets_for_dbus_paths_sync, "secret_service_get_secrets_for_dbus_paths_sync", libs);
  gidLink(cast(void**)&secret_service_get_session_algorithms, "secret_service_get_session_algorithms", libs);
  gidLink(cast(void**)&secret_service_get_session_dbus_path, "secret_service_get_session_dbus_path", libs);
  gidLink(cast(void**)&secret_service_load_collections, "secret_service_load_collections", libs);
  gidLink(cast(void**)&secret_service_load_collections_finish, "secret_service_load_collections_finish", libs);
  gidLink(cast(void**)&secret_service_load_collections_sync, "secret_service_load_collections_sync", libs);
  gidLink(cast(void**)&secret_service_lock, "secret_service_lock", libs);
  gidLink(cast(void**)&secret_service_lock_dbus_paths, "secret_service_lock_dbus_paths", libs);
  gidLink(cast(void**)&secret_service_lock_dbus_paths_finish, "secret_service_lock_dbus_paths_finish", libs);
  gidLink(cast(void**)&secret_service_lock_dbus_paths_sync, "secret_service_lock_dbus_paths_sync", libs);
  gidLink(cast(void**)&secret_service_lock_finish, "secret_service_lock_finish", libs);
  gidLink(cast(void**)&secret_service_lock_sync, "secret_service_lock_sync", libs);
  gidLink(cast(void**)&secret_service_lookup, "secret_service_lookup", libs);
  gidLink(cast(void**)&secret_service_lookup_finish, "secret_service_lookup_finish", libs);
  gidLink(cast(void**)&secret_service_lookup_sync, "secret_service_lookup_sync", libs);
  gidLink(cast(void**)&secret_service_prompt, "secret_service_prompt", libs);
  gidLink(cast(void**)&secret_service_prompt_at_dbus_path, "secret_service_prompt_at_dbus_path", libs);
  gidLink(cast(void**)&secret_service_prompt_at_dbus_path_finish, "secret_service_prompt_at_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_prompt_at_dbus_path_sync, "secret_service_prompt_at_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_prompt_finish, "secret_service_prompt_finish", libs);
  gidLink(cast(void**)&secret_service_prompt_sync, "secret_service_prompt_sync", libs);
  gidLink(cast(void**)&secret_service_read_alias_dbus_path, "secret_service_read_alias_dbus_path", libs);
  gidLink(cast(void**)&secret_service_read_alias_dbus_path_finish, "secret_service_read_alias_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_read_alias_dbus_path_sync, "secret_service_read_alias_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_search, "secret_service_search", libs);
  gidLink(cast(void**)&secret_service_search_finish, "secret_service_search_finish", libs);
  gidLink(cast(void**)&secret_service_search_for_dbus_paths, "secret_service_search_for_dbus_paths", libs);
  gidLink(cast(void**)&secret_service_search_for_dbus_paths_finish, "secret_service_search_for_dbus_paths_finish", libs);
  gidLink(cast(void**)&secret_service_search_for_dbus_paths_sync, "secret_service_search_for_dbus_paths_sync", libs);
  gidLink(cast(void**)&secret_service_search_sync, "secret_service_search_sync", libs);
  gidLink(cast(void**)&secret_service_set_alias, "secret_service_set_alias", libs);
  gidLink(cast(void**)&secret_service_set_alias_finish, "secret_service_set_alias_finish", libs);
  gidLink(cast(void**)&secret_service_set_alias_sync, "secret_service_set_alias_sync", libs);
  gidLink(cast(void**)&secret_service_set_alias_to_dbus_path, "secret_service_set_alias_to_dbus_path", libs);
  gidLink(cast(void**)&secret_service_set_alias_to_dbus_path_finish, "secret_service_set_alias_to_dbus_path_finish", libs);
  gidLink(cast(void**)&secret_service_set_alias_to_dbus_path_sync, "secret_service_set_alias_to_dbus_path_sync", libs);
  gidLink(cast(void**)&secret_service_store, "secret_service_store", libs);
  gidLink(cast(void**)&secret_service_store_finish, "secret_service_store_finish", libs);
  gidLink(cast(void**)&secret_service_store_sync, "secret_service_store_sync", libs);
  gidLink(cast(void**)&secret_service_unlock, "secret_service_unlock", libs);
  gidLink(cast(void**)&secret_service_unlock_dbus_paths, "secret_service_unlock_dbus_paths", libs);
  gidLink(cast(void**)&secret_service_unlock_dbus_paths_finish, "secret_service_unlock_dbus_paths_finish", libs);
  gidLink(cast(void**)&secret_service_unlock_dbus_paths_sync, "secret_service_unlock_dbus_paths_sync", libs);
  gidLink(cast(void**)&secret_service_unlock_finish, "secret_service_unlock_finish", libs);
  gidLink(cast(void**)&secret_service_unlock_sync, "secret_service_unlock_sync", libs);

  // Value
  gidLink(cast(void**)&secret_value_get_type, "secret_value_get_type", libs);
  gidLink(cast(void**)&secret_value_new, "secret_value_new", libs);
  gidLink(cast(void**)&secret_value_new_full, "secret_value_new_full", libs);
  gidLink(cast(void**)&secret_value_get, "secret_value_get", libs);
  gidLink(cast(void**)&secret_value_get_content_type, "secret_value_get_content_type", libs);
  gidLink(cast(void**)&secret_value_get_text, "secret_value_get_text", libs);
  gidLink(cast(void**)&secret_value_ref, "secret_value_ref", libs);
  gidLink(cast(void**)&secret_value_unref, "secret_value_unref", libs);
  gidLink(cast(void**)&secret_value_unref_to_password, "secret_value_unref_to_password", libs);

  // global
  gidLink(cast(void**)&secret_attributes_build, "secret_attributes_build", libs);
  gidLink(cast(void**)&secret_attributes_buildv, "secret_attributes_buildv", libs);
  gidLink(cast(void**)&secret_attributes_validate, "secret_attributes_validate", libs);
  gidLink(cast(void**)&secret_get_schema, "secret_get_schema", libs);
  gidLink(cast(void**)&secret_password_clear, "secret_password_clear", libs);
  gidLink(cast(void**)&secret_password_clear_finish, "secret_password_clear_finish", libs);
  gidLink(cast(void**)&secret_password_clear_sync, "secret_password_clear_sync", libs);
  gidLink(cast(void**)&secret_password_clearv, "secret_password_clearv", libs);
  gidLink(cast(void**)&secret_password_clearv_sync, "secret_password_clearv_sync", libs);
  gidLink(cast(void**)&secret_password_free, "secret_password_free", libs);
  gidLink(cast(void**)&secret_password_lookup, "secret_password_lookup", libs);
  gidLink(cast(void**)&secret_password_lookup_binary_finish, "secret_password_lookup_binary_finish", libs);
  gidLink(cast(void**)&secret_password_lookup_binary_sync, "secret_password_lookup_binary_sync", libs);
  gidLink(cast(void**)&secret_password_lookup_finish, "secret_password_lookup_finish", libs);
  gidLink(cast(void**)&secret_password_lookup_nonpageable_finish, "secret_password_lookup_nonpageable_finish", libs);
  gidLink(cast(void**)&secret_password_lookup_nonpageable_sync, "secret_password_lookup_nonpageable_sync", libs);
  gidLink(cast(void**)&secret_password_lookup_sync, "secret_password_lookup_sync", libs);
  gidLink(cast(void**)&secret_password_lookupv, "secret_password_lookupv", libs);
  gidLink(cast(void**)&secret_password_lookupv_binary_sync, "secret_password_lookupv_binary_sync", libs);
  gidLink(cast(void**)&secret_password_lookupv_nonpageable_sync, "secret_password_lookupv_nonpageable_sync", libs);
  gidLink(cast(void**)&secret_password_lookupv_sync, "secret_password_lookupv_sync", libs);
  gidLink(cast(void**)&secret_password_search, "secret_password_search", libs);
  gidLink(cast(void**)&secret_password_search_finish, "secret_password_search_finish", libs);
  gidLink(cast(void**)&secret_password_search_sync, "secret_password_search_sync", libs);
  gidLink(cast(void**)&secret_password_searchv, "secret_password_searchv", libs);
  gidLink(cast(void**)&secret_password_searchv_sync, "secret_password_searchv_sync", libs);
  gidLink(cast(void**)&secret_password_store, "secret_password_store", libs);
  gidLink(cast(void**)&secret_password_store_binary, "secret_password_store_binary", libs);
  gidLink(cast(void**)&secret_password_store_binary_sync, "secret_password_store_binary_sync", libs);
  gidLink(cast(void**)&secret_password_store_finish, "secret_password_store_finish", libs);
  gidLink(cast(void**)&secret_password_store_sync, "secret_password_store_sync", libs);
  gidLink(cast(void**)&secret_password_storev, "secret_password_storev", libs);
  gidLink(cast(void**)&secret_password_storev_binary, "secret_password_storev_binary", libs);
  gidLink(cast(void**)&secret_password_storev_binary_sync, "secret_password_storev_binary_sync", libs);
  gidLink(cast(void**)&secret_password_storev_sync, "secret_password_storev_sync", libs);
  gidLink(cast(void**)&secret_password_wipe, "secret_password_wipe", libs);

  // Error
  gidLink(cast(void**)&secret_error_get_quark, "secret_error_get_quark", libs);
}
