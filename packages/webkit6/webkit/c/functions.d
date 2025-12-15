/// C functions for webkit6 library
module webkit.c.functions;

public import gid.basictypes;
import gid.loader;
import webkit.c.types;
public import gtk.c.types;
public import javascriptcore.c.types;
public import soup.c.types;

version(Windows)
  private immutable LIBS = ["libwebkitgtk-6.0-4.dll;webkitgtk-6.0-4.dll;webkitgtk-6.dll", "libjavascriptcoregtk-6.0-1.dll;javascriptcoregtk-6.0-1.dll;javascriptcoregtk-6.dll"];
else version(OSX)
  private immutable LIBS = ["libwebkitgtk-6.0.4.dylib", "libjavascriptcoregtk-6.0.1.dylib"];
else
  private immutable LIBS = ["libwebkitgtk-6.0.so.4", "libjavascriptcoregtk-6.0.so.1"];

__gshared extern(C)
{
  // ApplicationInfo
  GType function() c_webkit_application_info_get_type; ///
  WebKitApplicationInfo* function() c_webkit_application_info_new; ///
  const(char)* function(WebKitApplicationInfo* info) c_webkit_application_info_get_name; ///
  void function(WebKitApplicationInfo* info, ulong* major, ulong* minor, ulong* micro) c_webkit_application_info_get_version; ///
  WebKitApplicationInfo* function(WebKitApplicationInfo* info) c_webkit_application_info_ref; ///
  void function(WebKitApplicationInfo* info, const(char)* name) c_webkit_application_info_set_name; ///
  void function(WebKitApplicationInfo* info, ulong major, ulong minor, ulong micro) c_webkit_application_info_set_version; ///
  void function(WebKitApplicationInfo* info) c_webkit_application_info_unref; ///

  // AuthenticationRequest
  GType function() c_webkit_authentication_request_get_type; ///
  void function(WebKitAuthenticationRequest* request, WebKitCredential* credential) c_webkit_authentication_request_authenticate; ///
  gboolean function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_can_save_credentials; ///
  void function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_cancel; ///
  GTlsPasswordFlags function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_certificate_pin_flags; ///
  const(char)* function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_host; ///
  uint function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_port; ///
  WebKitCredential* function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_proposed_credential; ///
  const(char)* function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_realm; ///
  WebKitAuthenticationScheme function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_scheme; ///
  WebKitSecurityOrigin* function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_get_security_origin; ///
  gboolean function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_is_for_proxy; ///
  gboolean function(WebKitAuthenticationRequest* request) c_webkit_authentication_request_is_retry; ///
  void function(WebKitAuthenticationRequest* request, gboolean enabled) c_webkit_authentication_request_set_can_save_credentials; ///
  void function(WebKitAuthenticationRequest* request, WebKitCredential* credential) c_webkit_authentication_request_set_proposed_credential; ///

  // AutomationSession
  GType function() c_webkit_automation_session_get_type; ///
  WebKitApplicationInfo* function(WebKitAutomationSession* session) c_webkit_automation_session_get_application_info; ///
  const(char)* function(WebKitAutomationSession* session) c_webkit_automation_session_get_id; ///
  void function(WebKitAutomationSession* session, WebKitApplicationInfo* info) c_webkit_automation_session_set_application_info; ///

  // BackForwardList
  GType function() c_webkit_back_forward_list_get_type; ///
  WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_back_item; ///
  GList* function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_back_list; ///
  GList* function(WebKitBackForwardList* backForwardList, uint limit) c_webkit_back_forward_list_get_back_list_with_limit; ///
  WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_current_item; ///
  WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_forward_item; ///
  GList* function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_forward_list; ///
  GList* function(WebKitBackForwardList* backForwardList, uint limit) c_webkit_back_forward_list_get_forward_list_with_limit; ///
  uint function(WebKitBackForwardList* backForwardList) c_webkit_back_forward_list_get_length; ///
  WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList, int index) c_webkit_back_forward_list_get_nth_item; ///

  // BackForwardListItem
  GType function() c_webkit_back_forward_list_item_get_type; ///
  const(char)* function(WebKitBackForwardListItem* listItem) c_webkit_back_forward_list_item_get_original_uri; ///
  const(char)* function(WebKitBackForwardListItem* listItem) c_webkit_back_forward_list_item_get_title; ///
  const(char)* function(WebKitBackForwardListItem* listItem) c_webkit_back_forward_list_item_get_uri; ///

  // ClipboardPermissionRequest
  GType function() c_webkit_clipboard_permission_request_get_type; ///

  // ColorChooserRequest
  GType function() c_webkit_color_chooser_request_get_type; ///
  void function(WebKitColorChooserRequest* request) c_webkit_color_chooser_request_cancel; ///
  void function(WebKitColorChooserRequest* request) c_webkit_color_chooser_request_finish; ///
  void function(WebKitColorChooserRequest* request, GdkRectangle* rect) c_webkit_color_chooser_request_get_element_rectangle; ///
  void function(WebKitColorChooserRequest* request, GdkRGBA* rgba) c_webkit_color_chooser_request_get_rgba; ///
  void function(WebKitColorChooserRequest* request, const(GdkRGBA)* rgba) c_webkit_color_chooser_request_set_rgba; ///

  // ContextMenu
  GType function() c_webkit_context_menu_get_type; ///
  WebKitContextMenu* function() c_webkit_context_menu_new; ///
  WebKitContextMenu* function(GList* items) c_webkit_context_menu_new_with_items; ///
  void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) c_webkit_context_menu_append; ///
  WebKitContextMenuItem* function(WebKitContextMenu* menu) c_webkit_context_menu_first; ///
  GdkEvent* function(WebKitContextMenu* menu) c_webkit_context_menu_get_event; ///
  WebKitContextMenuItem* function(WebKitContextMenu* menu, uint position) c_webkit_context_menu_get_item_at_position; ///
  GList* function(WebKitContextMenu* menu) c_webkit_context_menu_get_items; ///
  uint function(WebKitContextMenu* menu) c_webkit_context_menu_get_n_items; ///
  GVariant* function(WebKitContextMenu* menu) c_webkit_context_menu_get_user_data; ///
  void function(WebKitContextMenu* menu, WebKitContextMenuItem* item, int position) c_webkit_context_menu_insert; ///
  WebKitContextMenuItem* function(WebKitContextMenu* menu) c_webkit_context_menu_last; ///
  void function(WebKitContextMenu* menu, WebKitContextMenuItem* item, int position) c_webkit_context_menu_move_item; ///
  void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) c_webkit_context_menu_prepend; ///
  void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) c_webkit_context_menu_remove; ///
  void function(WebKitContextMenu* menu) c_webkit_context_menu_remove_all; ///
  void function(WebKitContextMenu* menu, GVariant* userData) c_webkit_context_menu_set_user_data; ///

  // ContextMenuItem
  GType function() c_webkit_context_menu_item_get_type; ///
  WebKitContextMenuItem* function(GAction* action, const(char)* label, GVariant* target) c_webkit_context_menu_item_new_from_gaction; ///
  WebKitContextMenuItem* function(WebKitContextMenuAction action) c_webkit_context_menu_item_new_from_stock_action; ///
  WebKitContextMenuItem* function(WebKitContextMenuAction action, const(char)* label) c_webkit_context_menu_item_new_from_stock_action_with_label; ///
  WebKitContextMenuItem* function() c_webkit_context_menu_item_new_separator; ///
  WebKitContextMenuItem* function(const(char)* label, WebKitContextMenu* submenu) c_webkit_context_menu_item_new_with_submenu; ///
  GAction* function(WebKitContextMenuItem* item) c_webkit_context_menu_item_get_gaction; ///
  WebKitContextMenuAction function(WebKitContextMenuItem* item) c_webkit_context_menu_item_get_stock_action; ///
  WebKitContextMenu* function(WebKitContextMenuItem* item) c_webkit_context_menu_item_get_submenu; ///
  gboolean function(WebKitContextMenuItem* item) c_webkit_context_menu_item_is_separator; ///
  void function(WebKitContextMenuItem* item, WebKitContextMenu* submenu) c_webkit_context_menu_item_set_submenu; ///

  // CookieManager
  GType function() c_webkit_cookie_manager_get_type; ///
  void function(WebKitCookieManager* cookieManager, SoupCookie* cookie, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_add_cookie; ///
  gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_add_cookie_finish; ///
  void function(WebKitCookieManager* cookieManager, SoupCookie* cookie, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_delete_cookie; ///
  gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_delete_cookie_finish; ///
  void function(WebKitCookieManager* cookieManager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_get_accept_policy; ///
  WebKitCookieAcceptPolicy function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_get_accept_policy_finish; ///
  void function(WebKitCookieManager* cookieManager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_get_all_cookies; ///
  GList* function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_get_all_cookies_finish; ///
  void function(WebKitCookieManager* cookieManager, const(char)* uri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_get_cookies; ///
  GList* function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_get_cookies_finish; ///
  void function(WebKitCookieManager* cookieManager, GList* cookies, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_cookie_manager_replace_cookies; ///
  gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) c_webkit_cookie_manager_replace_cookies_finish; ///
  void function(WebKitCookieManager* cookieManager, WebKitCookieAcceptPolicy policy) c_webkit_cookie_manager_set_accept_policy; ///
  void function(WebKitCookieManager* cookieManager, const(char)* filename, WebKitCookiePersistentStorage storage) c_webkit_cookie_manager_set_persistent_storage; ///

  // Credential
  GType function() c_webkit_credential_get_type; ///
  WebKitCredential* function(const(char)* username, const(char)* password, WebKitCredentialPersistence persistence) c_webkit_credential_new; ///
  WebKitCredential* function(GTlsCertificate* certificate, WebKitCredentialPersistence persistence) c_webkit_credential_new_for_certificate; ///
  WebKitCredential* function(const(char)* pin, WebKitCredentialPersistence persistence) c_webkit_credential_new_for_certificate_pin; ///
  WebKitCredential* function(WebKitCredential* credential) c_webkit_credential_copy; ///
  void function(WebKitCredential* credential) c_webkit_credential_free; ///
  GTlsCertificate* function(WebKitCredential* credential) c_webkit_credential_get_certificate; ///
  const(char)* function(WebKitCredential* credential) c_webkit_credential_get_password; ///
  WebKitCredentialPersistence function(WebKitCredential* credential) c_webkit_credential_get_persistence; ///
  const(char)* function(WebKitCredential* credential) c_webkit_credential_get_username; ///
  gboolean function(WebKitCredential* credential) c_webkit_credential_has_password; ///

  // DeviceInfoPermissionRequest
  GType function() c_webkit_device_info_permission_request_get_type; ///

  // Download
  GType function() c_webkit_download_get_type; ///
  void function(WebKitDownload* download) c_webkit_download_cancel; ///
  gboolean function(WebKitDownload* download) c_webkit_download_get_allow_overwrite; ///
  const(char)* function(WebKitDownload* download) c_webkit_download_get_destination; ///
  double function(WebKitDownload* download) c_webkit_download_get_elapsed_time; ///
  double function(WebKitDownload* download) c_webkit_download_get_estimated_progress; ///
  ulong function(WebKitDownload* download) c_webkit_download_get_received_data_length; ///
  WebKitURIRequest* function(WebKitDownload* download) c_webkit_download_get_request; ///
  WebKitURIResponse* function(WebKitDownload* download) c_webkit_download_get_response; ///
  WebKitWebView* function(WebKitDownload* download) c_webkit_download_get_web_view; ///
  void function(WebKitDownload* download, gboolean allowed) c_webkit_download_set_allow_overwrite; ///
  void function(WebKitDownload* download, const(char)* destination) c_webkit_download_set_destination; ///

  // EditorState
  GType function() c_webkit_editor_state_get_type; ///
  uint function(WebKitEditorState* editorState) c_webkit_editor_state_get_typing_attributes; ///
  gboolean function(WebKitEditorState* editorState) c_webkit_editor_state_is_copy_available; ///
  gboolean function(WebKitEditorState* editorState) c_webkit_editor_state_is_cut_available; ///
  gboolean function(WebKitEditorState* editorState) c_webkit_editor_state_is_paste_available; ///
  gboolean function(WebKitEditorState* editorState) c_webkit_editor_state_is_redo_available; ///
  gboolean function(WebKitEditorState* editorState) c_webkit_editor_state_is_undo_available; ///

  // FaviconDatabase
  GType function() c_webkit_favicon_database_get_type; ///
  void function(WebKitFaviconDatabase* database) c_webkit_favicon_database_clear; ///
  void function(WebKitFaviconDatabase* database, const(char)* pageUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_favicon_database_get_favicon; ///
  GdkTexture* function(WebKitFaviconDatabase* database, GAsyncResult* result, GError** _err) c_webkit_favicon_database_get_favicon_finish; ///
  char* function(WebKitFaviconDatabase* database, const(char)* pageUri) c_webkit_favicon_database_get_favicon_uri; ///

  // Feature
  GType function() c_webkit_feature_get_type; ///
  const(char)* function(WebKitFeature* feature) c_webkit_feature_get_category; ///
  gboolean function(WebKitFeature* feature) c_webkit_feature_get_default_value; ///
  const(char)* function(WebKitFeature* feature) c_webkit_feature_get_details; ///
  const(char)* function(WebKitFeature* feature) c_webkit_feature_get_identifier; ///
  const(char)* function(WebKitFeature* feature) c_webkit_feature_get_name; ///
  WebKitFeatureStatus function(WebKitFeature* feature) c_webkit_feature_get_status; ///
  WebKitFeature* function(WebKitFeature* feature) c_webkit_feature_ref; ///
  void function(WebKitFeature* feature) c_webkit_feature_unref; ///

  // FeatureList
  GType function() c_webkit_feature_list_get_type; ///
  WebKitFeature* function(WebKitFeatureList* featureList, size_t index) c_webkit_feature_list_get; ///
  size_t function(WebKitFeatureList* featureList) c_webkit_feature_list_get_length; ///
  WebKitFeatureList* function(WebKitFeatureList* featureList) c_webkit_feature_list_ref; ///
  void function(WebKitFeatureList* featureList) c_webkit_feature_list_unref; ///

  // FileChooserRequest
  GType function() c_webkit_file_chooser_request_get_type; ///
  void function(WebKitFileChooserRequest* request) c_webkit_file_chooser_request_cancel; ///
  const(char*)* function(WebKitFileChooserRequest* request) c_webkit_file_chooser_request_get_mime_types; ///
  GtkFileFilter* function(WebKitFileChooserRequest* request) c_webkit_file_chooser_request_get_mime_types_filter; ///
  gboolean function(WebKitFileChooserRequest* request) c_webkit_file_chooser_request_get_select_multiple; ///
  const(char*)* function(WebKitFileChooserRequest* request) c_webkit_file_chooser_request_get_selected_files; ///
  void function(WebKitFileChooserRequest* request, const(char*)* files) c_webkit_file_chooser_request_select_files; ///

  // FindController
  GType function() c_webkit_find_controller_get_type; ///
  void function(WebKitFindController* findController, const(char)* searchText, uint findOptions, uint maxMatchCount) c_webkit_find_controller_count_matches; ///
  uint function(WebKitFindController* findController) c_webkit_find_controller_get_max_match_count; ///
  uint function(WebKitFindController* findController) c_webkit_find_controller_get_options; ///
  const(char)* function(WebKitFindController* findController) c_webkit_find_controller_get_search_text; ///
  WebKitWebView* function(WebKitFindController* findController) c_webkit_find_controller_get_web_view; ///
  void function(WebKitFindController* findController, const(char)* searchText, uint findOptions, uint maxMatchCount) c_webkit_find_controller_search; ///
  void function(WebKitFindController* findController) c_webkit_find_controller_search_finish; ///
  void function(WebKitFindController* findController) c_webkit_find_controller_search_next; ///
  void function(WebKitFindController* findController) c_webkit_find_controller_search_previous; ///

  // FormSubmissionRequest
  GType function() c_webkit_form_submission_request_get_type; ///
  gboolean function(WebKitFormSubmissionRequest* request, GPtrArray** fieldNames, GPtrArray** fieldValues) c_webkit_form_submission_request_list_text_fields; ///
  void function(WebKitFormSubmissionRequest* request) c_webkit_form_submission_request_submit; ///

  // GeolocationManager
  GType function() c_webkit_geolocation_manager_get_type; ///
  void function(WebKitGeolocationManager* manager, const(char)* errorMessage) c_webkit_geolocation_manager_failed; ///
  gboolean function(WebKitGeolocationManager* manager) c_webkit_geolocation_manager_get_enable_high_accuracy; ///
  void function(WebKitGeolocationManager* manager, WebKitGeolocationPosition* position) c_webkit_geolocation_manager_update_position; ///

  // GeolocationPermissionRequest
  GType function() c_webkit_geolocation_permission_request_get_type; ///

  // GeolocationPosition
  GType function() c_webkit_geolocation_position_get_type; ///
  WebKitGeolocationPosition* function(double latitude, double longitude, double accuracy) c_webkit_geolocation_position_new; ///
  WebKitGeolocationPosition* function(WebKitGeolocationPosition* position) c_webkit_geolocation_position_copy; ///
  void function(WebKitGeolocationPosition* position) c_webkit_geolocation_position_free; ///
  void function(WebKitGeolocationPosition* position, double altitude) c_webkit_geolocation_position_set_altitude; ///
  void function(WebKitGeolocationPosition* position, double altitudeAccuracy) c_webkit_geolocation_position_set_altitude_accuracy; ///
  void function(WebKitGeolocationPosition* position, double heading) c_webkit_geolocation_position_set_heading; ///
  void function(WebKitGeolocationPosition* position, double speed) c_webkit_geolocation_position_set_speed; ///
  void function(WebKitGeolocationPosition* position, ulong timestamp) c_webkit_geolocation_position_set_timestamp; ///

  // HitTestResult
  GType function() c_webkit_hit_test_result_get_type; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_editable; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_image; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_link; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_media; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_scrollbar; ///
  gboolean function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_context_is_selection; ///
  uint function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_context; ///
  const(char)* function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_image_uri; ///
  const(char)* function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_link_label; ///
  const(char)* function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_link_title; ///
  const(char)* function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_link_uri; ///
  const(char)* function(WebKitHitTestResult* hitTestResult) c_webkit_hit_test_result_get_media_uri; ///

  // ITPFirstParty
  GType function() c_webkit_itp_first_party_get_type; ///
  const(char)* function(WebKitITPFirstParty* itpFirstParty) c_webkit_itp_first_party_get_domain; ///
  GDateTime* function(WebKitITPFirstParty* itpFirstParty) c_webkit_itp_first_party_get_last_update_time; ///
  gboolean function(WebKitITPFirstParty* itpFirstParty) c_webkit_itp_first_party_get_website_data_access_allowed; ///
  WebKitITPFirstParty* function(WebKitITPFirstParty* itpFirstParty) c_webkit_itp_first_party_ref; ///
  void function(WebKitITPFirstParty* itpFirstParty) c_webkit_itp_first_party_unref; ///

  // ITPThirdParty
  GType function() c_webkit_itp_third_party_get_type; ///
  const(char)* function(WebKitITPThirdParty* itpThirdParty) c_webkit_itp_third_party_get_domain; ///
  GList* function(WebKitITPThirdParty* itpThirdParty) c_webkit_itp_third_party_get_first_parties; ///
  WebKitITPThirdParty* function(WebKitITPThirdParty* itpThirdParty) c_webkit_itp_third_party_ref; ///
  void function(WebKitITPThirdParty* itpThirdParty) c_webkit_itp_third_party_unref; ///

  // InputMethodContext
  GType function() c_webkit_input_method_context_get_type; ///
  gboolean function(WebKitInputMethodContext* context, GdkEvent* keyEvent) c_webkit_input_method_context_filter_key_event; ///
  WebKitInputHints function(WebKitInputMethodContext* context) c_webkit_input_method_context_get_input_hints; ///
  WebKitInputPurpose function(WebKitInputMethodContext* context) c_webkit_input_method_context_get_input_purpose; ///
  void function(WebKitInputMethodContext* context, char** text, GList** underlines, uint* cursorOffset) c_webkit_input_method_context_get_preedit; ///
  void function(WebKitInputMethodContext* context, int x, int y, int width, int height) c_webkit_input_method_context_notify_cursor_area; ///
  void function(WebKitInputMethodContext* context) c_webkit_input_method_context_notify_focus_in; ///
  void function(WebKitInputMethodContext* context) c_webkit_input_method_context_notify_focus_out; ///
  void function(WebKitInputMethodContext* context, const(char)* text, int length, uint cursorIndex, uint selectionIndex) c_webkit_input_method_context_notify_surrounding; ///
  void function(WebKitInputMethodContext* context) c_webkit_input_method_context_reset; ///
  void function(WebKitInputMethodContext* context, gboolean enabled) c_webkit_input_method_context_set_enable_preedit; ///
  void function(WebKitInputMethodContext* context, WebKitInputHints hints) c_webkit_input_method_context_set_input_hints; ///
  void function(WebKitInputMethodContext* context, WebKitInputPurpose purpose) c_webkit_input_method_context_set_input_purpose; ///

  // InputMethodUnderline
  GType function() c_webkit_input_method_underline_get_type; ///
  WebKitInputMethodUnderline* function(uint startOffset, uint endOffset) c_webkit_input_method_underline_new; ///
  WebKitInputMethodUnderline* function(WebKitInputMethodUnderline* underline) c_webkit_input_method_underline_copy; ///
  void function(WebKitInputMethodUnderline* underline) c_webkit_input_method_underline_free; ///
  void function(WebKitInputMethodUnderline* underline, const(GdkRGBA)* rgba) c_webkit_input_method_underline_set_color; ///

  // MediaKeySystemPermissionRequest
  GType function() c_webkit_media_key_system_permission_request_get_type; ///

  // MemoryPressureSettings
  GType function() c_webkit_memory_pressure_settings_get_type; ///
  WebKitMemoryPressureSettings* function() c_webkit_memory_pressure_settings_new; ///
  WebKitMemoryPressureSettings* function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_copy; ///
  void function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_free; ///
  double function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_get_conservative_threshold; ///
  double function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_get_kill_threshold; ///
  uint function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_get_memory_limit; ///
  double function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_get_poll_interval; ///
  double function(WebKitMemoryPressureSettings* settings) c_webkit_memory_pressure_settings_get_strict_threshold; ///
  void function(WebKitMemoryPressureSettings* settings, double value) c_webkit_memory_pressure_settings_set_conservative_threshold; ///
  void function(WebKitMemoryPressureSettings* settings, double value) c_webkit_memory_pressure_settings_set_kill_threshold; ///
  void function(WebKitMemoryPressureSettings* settings, uint memoryLimit) c_webkit_memory_pressure_settings_set_memory_limit; ///
  void function(WebKitMemoryPressureSettings* settings, double value) c_webkit_memory_pressure_settings_set_poll_interval; ///
  void function(WebKitMemoryPressureSettings* settings, double value) c_webkit_memory_pressure_settings_set_strict_threshold; ///

  // NavigationAction
  GType function() c_webkit_navigation_action_get_type; ///
  WebKitNavigationAction* function(WebKitNavigationAction* navigation) c_webkit_navigation_action_copy; ///
  void function(WebKitNavigationAction* navigation) c_webkit_navigation_action_free; ///
  const(char)* function(WebKitNavigationAction* navigation) c_webkit_navigation_action_get_frame_name; ///
  uint function(WebKitNavigationAction* navigation) c_webkit_navigation_action_get_modifiers; ///
  uint function(WebKitNavigationAction* navigation) c_webkit_navigation_action_get_mouse_button; ///
  WebKitNavigationType function(WebKitNavigationAction* navigation) c_webkit_navigation_action_get_navigation_type; ///
  WebKitURIRequest* function(WebKitNavigationAction* navigation) c_webkit_navigation_action_get_request; ///
  gboolean function(WebKitNavigationAction* navigation) c_webkit_navigation_action_is_redirect; ///
  gboolean function(WebKitNavigationAction* navigation) c_webkit_navigation_action_is_user_gesture; ///

  // NavigationPolicyDecision
  GType function() c_webkit_navigation_policy_decision_get_type; ///
  WebKitNavigationAction* function(WebKitNavigationPolicyDecision* decision) c_webkit_navigation_policy_decision_get_navigation_action; ///

  // NetworkProxySettings
  GType function() c_webkit_network_proxy_settings_get_type; ///
  WebKitNetworkProxySettings* function(const(char)* defaultProxyUri, const(char*)* ignoreHosts) c_webkit_network_proxy_settings_new; ///
  void function(WebKitNetworkProxySettings* proxySettings, const(char)* scheme, const(char)* proxyUri) c_webkit_network_proxy_settings_add_proxy_for_scheme; ///
  WebKitNetworkProxySettings* function(WebKitNetworkProxySettings* proxySettings) c_webkit_network_proxy_settings_copy; ///
  void function(WebKitNetworkProxySettings* proxySettings) c_webkit_network_proxy_settings_free; ///

  // NetworkSession
  GType function() c_webkit_network_session_get_type; ///
  WebKitNetworkSession* function(const(char)* dataDirectory, const(char)* cacheDirectory) c_webkit_network_session_new; ///
  WebKitNetworkSession* function() c_webkit_network_session_new_ephemeral; ///
  WebKitNetworkSession* function() c_webkit_network_session_get_default; ///
  void function(WebKitMemoryPressureSettings* settings) c_webkit_network_session_set_memory_pressure_settings; ///
  void function(WebKitNetworkSession* session, GTlsCertificate* certificate, const(char)* host) c_webkit_network_session_allow_tls_certificate_for_host; ///
  WebKitDownload* function(WebKitNetworkSession* session, const(char)* uri) c_webkit_network_session_download_uri; ///
  WebKitCookieManager* function(WebKitNetworkSession* session) c_webkit_network_session_get_cookie_manager; ///
  gboolean function(WebKitNetworkSession* session) c_webkit_network_session_get_itp_enabled; ///
  void function(WebKitNetworkSession* session, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_network_session_get_itp_summary; ///
  GList* function(WebKitNetworkSession* session, GAsyncResult* result, GError** _err) c_webkit_network_session_get_itp_summary_finish; ///
  gboolean function(WebKitNetworkSession* session) c_webkit_network_session_get_persistent_credential_storage_enabled; ///
  WebKitTLSErrorsPolicy function(WebKitNetworkSession* session) c_webkit_network_session_get_tls_errors_policy; ///
  WebKitWebsiteDataManager* function(WebKitNetworkSession* session) c_webkit_network_session_get_website_data_manager; ///
  gboolean function(WebKitNetworkSession* session) c_webkit_network_session_is_ephemeral; ///
  void function(WebKitNetworkSession* session, const(char)* hostname) c_webkit_network_session_prefetch_dns; ///
  void function(WebKitNetworkSession* session, gboolean enabled) c_webkit_network_session_set_itp_enabled; ///
  void function(WebKitNetworkSession* session, gboolean enabled) c_webkit_network_session_set_persistent_credential_storage_enabled; ///
  void function(WebKitNetworkSession* session, WebKitNetworkProxyMode proxyMode, WebKitNetworkProxySettings* proxySettings) c_webkit_network_session_set_proxy_settings; ///
  void function(WebKitNetworkSession* session, WebKitTLSErrorsPolicy policy) c_webkit_network_session_set_tls_errors_policy; ///

  // Notification
  GType function() c_webkit_notification_get_type; ///
  void function(WebKitNotification* notification) c_webkit_notification_clicked; ///
  void function(WebKitNotification* notification) c_webkit_notification_close; ///
  const(char)* function(WebKitNotification* notification) c_webkit_notification_get_body; ///
  ulong function(WebKitNotification* notification) c_webkit_notification_get_id; ///
  const(char)* function(WebKitNotification* notification) c_webkit_notification_get_tag; ///
  const(char)* function(WebKitNotification* notification) c_webkit_notification_get_title; ///

  // NotificationPermissionRequest
  GType function() c_webkit_notification_permission_request_get_type; ///

  // OptionMenu
  GType function() c_webkit_option_menu_get_type; ///
  void function(WebKitOptionMenu* menu, uint index) c_webkit_option_menu_activate_item; ///
  void function(WebKitOptionMenu* menu) c_webkit_option_menu_close; ///
  GdkEvent* function(WebKitOptionMenu* menu) c_webkit_option_menu_get_event; ///
  WebKitOptionMenuItem* function(WebKitOptionMenu* menu, uint index) c_webkit_option_menu_get_item; ///
  uint function(WebKitOptionMenu* menu) c_webkit_option_menu_get_n_items; ///
  void function(WebKitOptionMenu* menu, uint index) c_webkit_option_menu_select_item; ///

  // OptionMenuItem
  GType function() c_webkit_option_menu_item_get_type; ///
  WebKitOptionMenuItem* function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_copy; ///
  void function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_free; ///
  const(char)* function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_get_label; ///
  const(char)* function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_get_tooltip; ///
  gboolean function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_is_enabled; ///
  gboolean function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_is_group_child; ///
  gboolean function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_is_group_label; ///
  gboolean function(WebKitOptionMenuItem* item) c_webkit_option_menu_item_is_selected; ///

  // PermissionRequest
  GType function() c_webkit_permission_request_get_type; ///
  void function(WebKitPermissionRequest* request) c_webkit_permission_request_allow; ///
  void function(WebKitPermissionRequest* request) c_webkit_permission_request_deny; ///

  // PermissionStateQuery
  GType function() c_webkit_permission_state_query_get_type; ///
  void function(WebKitPermissionStateQuery* query, WebKitPermissionState state) c_webkit_permission_state_query_finish; ///
  const(char)* function(WebKitPermissionStateQuery* query) c_webkit_permission_state_query_get_name; ///
  WebKitSecurityOrigin* function(WebKitPermissionStateQuery* query) c_webkit_permission_state_query_get_security_origin; ///
  WebKitPermissionStateQuery* function(WebKitPermissionStateQuery* query) c_webkit_permission_state_query_ref; ///
  void function(WebKitPermissionStateQuery* query) c_webkit_permission_state_query_unref; ///

  // PointerLockPermissionRequest
  GType function() c_webkit_pointer_lock_permission_request_get_type; ///

  // PolicyDecision
  GType function() c_webkit_policy_decision_get_type; ///
  void function(WebKitPolicyDecision* decision) c_webkit_policy_decision_download; ///
  void function(WebKitPolicyDecision* decision) c_webkit_policy_decision_ignore; ///
  void function(WebKitPolicyDecision* decision) c_webkit_policy_decision_use; ///
  void function(WebKitPolicyDecision* decision, WebKitWebsitePolicies* policies) c_webkit_policy_decision_use_with_policies; ///

  // PrintOperation
  GType function() c_webkit_print_operation_get_type; ///
  WebKitPrintOperation* function(WebKitWebView* webView) c_webkit_print_operation_new; ///
  GtkPageSetup* function(WebKitPrintOperation* printOperation) c_webkit_print_operation_get_page_setup; ///
  GtkPrintSettings* function(WebKitPrintOperation* printOperation) c_webkit_print_operation_get_print_settings; ///
  void function(WebKitPrintOperation* printOperation) c_webkit_print_operation_print; ///
  WebKitPrintOperationResponse function(WebKitPrintOperation* printOperation, GtkWindow* parent) c_webkit_print_operation_run_dialog; ///
  void function(WebKitPrintOperation* printOperation, GtkPageSetup* pageSetup) c_webkit_print_operation_set_page_setup; ///
  void function(WebKitPrintOperation* printOperation, GtkPrintSettings* printSettings) c_webkit_print_operation_set_print_settings; ///

  // ResponsePolicyDecision
  GType function() c_webkit_response_policy_decision_get_type; ///
  WebKitURIRequest* function(WebKitResponsePolicyDecision* decision) c_webkit_response_policy_decision_get_request; ///
  WebKitURIResponse* function(WebKitResponsePolicyDecision* decision) c_webkit_response_policy_decision_get_response; ///
  gboolean function(WebKitResponsePolicyDecision* decision) c_webkit_response_policy_decision_is_main_frame_main_resource; ///
  gboolean function(WebKitResponsePolicyDecision* decision) c_webkit_response_policy_decision_is_mime_type_supported; ///

  // ScriptDialog
  GType function() c_webkit_script_dialog_get_type; ///
  void function(WebKitScriptDialog* dialog) c_webkit_script_dialog_close; ///
  void function(WebKitScriptDialog* dialog, gboolean confirmed) c_webkit_script_dialog_confirm_set_confirmed; ///
  WebKitScriptDialogType function(WebKitScriptDialog* dialog) c_webkit_script_dialog_get_dialog_type; ///
  const(char)* function(WebKitScriptDialog* dialog) c_webkit_script_dialog_get_message; ///
  const(char)* function(WebKitScriptDialog* dialog) c_webkit_script_dialog_prompt_get_default_text; ///
  void function(WebKitScriptDialog* dialog, const(char)* text) c_webkit_script_dialog_prompt_set_text; ///
  WebKitScriptDialog* function(WebKitScriptDialog* dialog) c_webkit_script_dialog_ref; ///
  void function(WebKitScriptDialog* dialog) c_webkit_script_dialog_unref; ///

  // ScriptMessageReply
  GType function() c_webkit_script_message_reply_get_type; ///
  WebKitScriptMessageReply* function(WebKitScriptMessageReply* scriptMessageReply) c_webkit_script_message_reply_ref; ///
  void function(WebKitScriptMessageReply* scriptMessageReply, const(char)* errorMessage) c_webkit_script_message_reply_return_error_message; ///
  void function(WebKitScriptMessageReply* scriptMessageReply, JSCValue* replyValue) c_webkit_script_message_reply_return_value; ///
  void function(WebKitScriptMessageReply* scriptMessageReply) c_webkit_script_message_reply_unref; ///

  // SecurityManager
  GType function() c_webkit_security_manager_get_type; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_cors_enabled; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_display_isolated; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_empty_document; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_local; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_no_access; ///
  void function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_register_uri_scheme_as_secure; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_cors_enabled; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_display_isolated; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_empty_document; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_local; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_no_access; ///
  gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) c_webkit_security_manager_uri_scheme_is_secure; ///

  // SecurityOrigin
  GType function() c_webkit_security_origin_get_type; ///
  WebKitSecurityOrigin* function(const(char)* protocol, const(char)* host, ushort port) c_webkit_security_origin_new; ///
  WebKitSecurityOrigin* function(const(char)* uri) c_webkit_security_origin_new_for_uri; ///
  const(char)* function(WebKitSecurityOrigin* origin) c_webkit_security_origin_get_host; ///
  ushort function(WebKitSecurityOrigin* origin) c_webkit_security_origin_get_port; ///
  const(char)* function(WebKitSecurityOrigin* origin) c_webkit_security_origin_get_protocol; ///
  WebKitSecurityOrigin* function(WebKitSecurityOrigin* origin) c_webkit_security_origin_ref; ///
  char* function(WebKitSecurityOrigin* origin) c_webkit_security_origin_to_string; ///
  void function(WebKitSecurityOrigin* origin) c_webkit_security_origin_unref; ///

  // Settings
  GType function() c_webkit_settings_get_type; ///
  WebKitSettings* function() c_webkit_settings_new; ///
  WebKitSettings* function(const(char)* firstSettingName,  ...) c_webkit_settings_new_with_settings; ///
  uint function(uint points) c_webkit_settings_font_size_to_pixels; ///
  uint function(uint pixels) c_webkit_settings_font_size_to_points; ///
  WebKitFeatureList* function() c_webkit_settings_get_all_features; ///
  WebKitFeatureList* function() c_webkit_settings_get_development_features; ///
  WebKitFeatureList* function() c_webkit_settings_get_experimental_features; ///
  gboolean function(WebKitSettings* settings, GKeyFile* keyFile, const(char)* groupName, GError** _err) c_webkit_settings_apply_from_key_file; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_allow_file_access_from_file_urls; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_allow_modal_dialogs; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_allow_top_navigation_to_data_urls; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_allow_universal_access_from_file_urls; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_auto_load_images; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_cursive_font_family; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_default_charset; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_default_font_family; ///
  uint function(WebKitSettings* settings) c_webkit_settings_get_default_font_size; ///
  uint function(WebKitSettings* settings) c_webkit_settings_get_default_monospace_font_size; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_disable_web_security; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_draw_compositing_indicators; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_2d_canvas_acceleration; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_back_forward_navigation_gestures; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_caret_browsing; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_developer_extras; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_dns_prefetching; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_encrypted_media; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_fullscreen; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_html5_database; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_html5_local_storage; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_hyperlink_auditing; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_javascript; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_javascript_markup; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_media; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_media_capabilities; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_media_stream; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_mediasource; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_mock_capture_devices; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_offline_web_application_cache; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_page_cache; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_resizable_text_areas; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_site_specific_quirks; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_smooth_scrolling; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_spatial_navigation; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_tabs_to_links; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_webaudio; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_webgl; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_webrtc; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_enable_write_console_messages_to_stdout; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_fantasy_font_family; ///
  gboolean function(WebKitSettings* settings, WebKitFeature* feature) c_webkit_settings_get_feature_enabled; ///
  WebKitHardwareAccelerationPolicy function(WebKitSettings* settings) c_webkit_settings_get_hardware_acceleration_policy; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_javascript_can_access_clipboard; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_javascript_can_open_windows_automatically; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_load_icons_ignoring_image_load_setting; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_media_content_types_requiring_hardware_support; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_media_playback_allows_inline; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_media_playback_requires_user_gesture; ///
  uint function(WebKitSettings* settings) c_webkit_settings_get_minimum_font_size; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_monospace_font_family; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_pictograph_font_family; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_print_backgrounds; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_sans_serif_font_family; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_serif_font_family; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_user_agent; ///
  const(char)* function(WebKitSettings* settings) c_webkit_settings_get_webrtc_udp_ports_range; ///
  gboolean function(WebKitSettings* settings) c_webkit_settings_get_zoom_text_only; ///
  void function(WebKitSettings* settings, gboolean allowed) c_webkit_settings_set_allow_file_access_from_file_urls; ///
  void function(WebKitSettings* settings, gboolean allowed) c_webkit_settings_set_allow_modal_dialogs; ///
  void function(WebKitSettings* settings, gboolean allowed) c_webkit_settings_set_allow_top_navigation_to_data_urls; ///
  void function(WebKitSettings* settings, gboolean allowed) c_webkit_settings_set_allow_universal_access_from_file_urls; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_auto_load_images; ///
  void function(WebKitSettings* settings, const(char)* cursiveFontFamily) c_webkit_settings_set_cursive_font_family; ///
  void function(WebKitSettings* settings, const(char)* defaultCharset) c_webkit_settings_set_default_charset; ///
  void function(WebKitSettings* settings, const(char)* defaultFontFamily) c_webkit_settings_set_default_font_family; ///
  void function(WebKitSettings* settings, uint fontSize) c_webkit_settings_set_default_font_size; ///
  void function(WebKitSettings* settings, uint fontSize) c_webkit_settings_set_default_monospace_font_size; ///
  void function(WebKitSettings* settings, gboolean disabled) c_webkit_settings_set_disable_web_security; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_draw_compositing_indicators; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_2d_canvas_acceleration; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_back_forward_navigation_gestures; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_caret_browsing; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_developer_extras; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_dns_prefetching; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_encrypted_media; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_fullscreen; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_html5_database; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_html5_local_storage; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_hyperlink_auditing; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_javascript; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_javascript_markup; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_media; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_media_capabilities; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_media_stream; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_mediasource; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_mock_capture_devices; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_offline_web_application_cache; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_page_cache; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_resizable_text_areas; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_site_specific_quirks; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_smooth_scrolling; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_spatial_navigation; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_tabs_to_links; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_webaudio; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_webgl; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_webrtc; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_enable_write_console_messages_to_stdout; ///
  void function(WebKitSettings* settings, const(char)* fantasyFontFamily) c_webkit_settings_set_fantasy_font_family; ///
  void function(WebKitSettings* settings, WebKitFeature* feature, gboolean enabled) c_webkit_settings_set_feature_enabled; ///
  void function(WebKitSettings* settings, WebKitHardwareAccelerationPolicy policy) c_webkit_settings_set_hardware_acceleration_policy; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_javascript_can_access_clipboard; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_javascript_can_open_windows_automatically; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_load_icons_ignoring_image_load_setting; ///
  void function(WebKitSettings* settings, const(char)* contentTypes) c_webkit_settings_set_media_content_types_requiring_hardware_support; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_media_playback_allows_inline; ///
  void function(WebKitSettings* settings, gboolean enabled) c_webkit_settings_set_media_playback_requires_user_gesture; ///
  void function(WebKitSettings* settings, uint fontSize) c_webkit_settings_set_minimum_font_size; ///
  void function(WebKitSettings* settings, const(char)* monospaceFontFamily) c_webkit_settings_set_monospace_font_family; ///
  void function(WebKitSettings* settings, const(char)* pictographFontFamily) c_webkit_settings_set_pictograph_font_family; ///
  void function(WebKitSettings* settings, gboolean printBackgrounds) c_webkit_settings_set_print_backgrounds; ///
  void function(WebKitSettings* settings, const(char)* sansSerifFontFamily) c_webkit_settings_set_sans_serif_font_family; ///
  void function(WebKitSettings* settings, const(char)* serifFontFamily) c_webkit_settings_set_serif_font_family; ///
  void function(WebKitSettings* settings, const(char)* userAgent) c_webkit_settings_set_user_agent; ///
  void function(WebKitSettings* settings, const(char)* applicationName, const(char)* applicationVersion) c_webkit_settings_set_user_agent_with_application_details; ///
  void function(WebKitSettings* settings, const(char)* udpPortRange) c_webkit_settings_set_webrtc_udp_ports_range; ///
  void function(WebKitSettings* settings, gboolean zoomTextOnly) c_webkit_settings_set_zoom_text_only; ///

  // URIRequest
  GType function() c_webkit_uri_request_get_type; ///
  WebKitURIRequest* function(const(char)* uri) c_webkit_uri_request_new; ///
  SoupMessageHeaders* function(WebKitURIRequest* request) c_webkit_uri_request_get_http_headers; ///
  const(char)* function(WebKitURIRequest* request) c_webkit_uri_request_get_http_method; ///
  const(char)* function(WebKitURIRequest* request) c_webkit_uri_request_get_uri; ///
  void function(WebKitURIRequest* request, const(char)* uri) c_webkit_uri_request_set_uri; ///

  // URIResponse
  GType function() c_webkit_uri_response_get_type; ///
  ulong function(WebKitURIResponse* response) c_webkit_uri_response_get_content_length; ///
  SoupMessageHeaders* function(WebKitURIResponse* response) c_webkit_uri_response_get_http_headers; ///
  const(char)* function(WebKitURIResponse* response) c_webkit_uri_response_get_mime_type; ///
  uint function(WebKitURIResponse* response) c_webkit_uri_response_get_status_code; ///
  const(char)* function(WebKitURIResponse* response) c_webkit_uri_response_get_suggested_filename; ///
  const(char)* function(WebKitURIResponse* response) c_webkit_uri_response_get_uri; ///

  // URISchemeRequest
  GType function() c_webkit_uri_scheme_request_get_type; ///
  void function(WebKitURISchemeRequest* request, GInputStream* stream, long streamLength, const(char)* contentType) c_webkit_uri_scheme_request_finish; ///
  void function(WebKitURISchemeRequest* request, GError* error) c_webkit_uri_scheme_request_finish_error; ///
  void function(WebKitURISchemeRequest* request, WebKitURISchemeResponse* response) c_webkit_uri_scheme_request_finish_with_response; ///
  GInputStream* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_http_body; ///
  SoupMessageHeaders* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_http_headers; ///
  const(char)* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_http_method; ///
  const(char)* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_path; ///
  const(char)* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_scheme; ///
  const(char)* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_uri; ///
  WebKitWebView* function(WebKitURISchemeRequest* request) c_webkit_uri_scheme_request_get_web_view; ///

  // URISchemeResponse
  GType function() c_webkit_uri_scheme_response_get_type; ///
  WebKitURISchemeResponse* function(GInputStream* inputStream, long streamLength) c_webkit_uri_scheme_response_new; ///
  void function(WebKitURISchemeResponse* response, const(char)* contentType) c_webkit_uri_scheme_response_set_content_type; ///
  void function(WebKitURISchemeResponse* response, SoupMessageHeaders* headers) c_webkit_uri_scheme_response_set_http_headers; ///
  void function(WebKitURISchemeResponse* response, uint statusCode, const(char)* reasonPhrase) c_webkit_uri_scheme_response_set_status; ///

  // UserContentFilter
  GType function() c_webkit_user_content_filter_get_type; ///
  const(char)* function(WebKitUserContentFilter* userContentFilter) c_webkit_user_content_filter_get_identifier; ///
  WebKitUserContentFilter* function(WebKitUserContentFilter* userContentFilter) c_webkit_user_content_filter_ref; ///
  void function(WebKitUserContentFilter* userContentFilter) c_webkit_user_content_filter_unref; ///

  // UserContentFilterStore
  GType function() c_webkit_user_content_filter_store_get_type; ///
  WebKitUserContentFilterStore* function(const(char)* storagePath) c_webkit_user_content_filter_store_new; ///
  void function(WebKitUserContentFilterStore* store, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_user_content_filter_store_fetch_identifiers; ///
  char** function(WebKitUserContentFilterStore* store, GAsyncResult* result) c_webkit_user_content_filter_store_fetch_identifiers_finish; ///
  const(char)* function(WebKitUserContentFilterStore* store) c_webkit_user_content_filter_store_get_path; ///
  void function(WebKitUserContentFilterStore* store, const(char)* identifier, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_user_content_filter_store_load; ///
  WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) c_webkit_user_content_filter_store_load_finish; ///
  void function(WebKitUserContentFilterStore* store, const(char)* identifier, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_user_content_filter_store_remove; ///
  gboolean function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) c_webkit_user_content_filter_store_remove_finish; ///
  void function(WebKitUserContentFilterStore* store, const(char)* identifier, GBytes* source, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_user_content_filter_store_save; ///
  WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) c_webkit_user_content_filter_store_save_finish; ///
  void function(WebKitUserContentFilterStore* store, const(char)* identifier, GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_user_content_filter_store_save_from_file; ///
  WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) c_webkit_user_content_filter_store_save_from_file_finish; ///

  // UserContentManager
  GType function() c_webkit_user_content_manager_get_type; ///
  WebKitUserContentManager* function() c_webkit_user_content_manager_new; ///
  void function(WebKitUserContentManager* manager, WebKitUserContentFilter* filter) c_webkit_user_content_manager_add_filter; ///
  void function(WebKitUserContentManager* manager, WebKitUserScript* script) c_webkit_user_content_manager_add_script; ///
  void function(WebKitUserContentManager* manager, WebKitUserStyleSheet* stylesheet) c_webkit_user_content_manager_add_style_sheet; ///
  gboolean function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) c_webkit_user_content_manager_register_script_message_handler; ///
  gboolean function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) c_webkit_user_content_manager_register_script_message_handler_with_reply; ///
  void function(WebKitUserContentManager* manager) c_webkit_user_content_manager_remove_all_filters; ///
  void function(WebKitUserContentManager* manager) c_webkit_user_content_manager_remove_all_scripts; ///
  void function(WebKitUserContentManager* manager) c_webkit_user_content_manager_remove_all_style_sheets; ///
  void function(WebKitUserContentManager* manager, WebKitUserContentFilter* filter) c_webkit_user_content_manager_remove_filter; ///
  void function(WebKitUserContentManager* manager, const(char)* filterId) c_webkit_user_content_manager_remove_filter_by_id; ///
  void function(WebKitUserContentManager* manager, WebKitUserScript* script) c_webkit_user_content_manager_remove_script; ///
  void function(WebKitUserContentManager* manager, WebKitUserStyleSheet* stylesheet) c_webkit_user_content_manager_remove_style_sheet; ///
  void function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) c_webkit_user_content_manager_unregister_script_message_handler; ///

  // UserMediaPermissionRequest
  GType function() c_webkit_user_media_permission_request_get_type; ///

  // UserMessage
  GType function() c_webkit_user_message_get_type; ///
  WebKitUserMessage* function(const(char)* name, GVariant* parameters) c_webkit_user_message_new; ///
  WebKitUserMessage* function(const(char)* name, GVariant* parameters, GUnixFDList* fdList) c_webkit_user_message_new_with_fd_list; ///
  GUnixFDList* function(WebKitUserMessage* message) c_webkit_user_message_get_fd_list; ///
  const(char)* function(WebKitUserMessage* message) c_webkit_user_message_get_name; ///
  GVariant* function(WebKitUserMessage* message) c_webkit_user_message_get_parameters; ///
  void function(WebKitUserMessage* message, WebKitUserMessage* reply) c_webkit_user_message_send_reply; ///

  // UserScript
  GType function() c_webkit_user_script_get_type; ///
  WebKitUserScript* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserScriptInjectionTime injectionTime, const(char*)* allowList, const(char*)* blockList) c_webkit_user_script_new; ///
  WebKitUserScript* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserScriptInjectionTime injectionTime, const(char)* worldName, const(char*)* allowList, const(char*)* blockList) c_webkit_user_script_new_for_world; ///
  WebKitUserScript* function(WebKitUserScript* userScript) c_webkit_user_script_ref; ///
  void function(WebKitUserScript* userScript) c_webkit_user_script_unref; ///

  // UserStyleSheet
  GType function() c_webkit_user_style_sheet_get_type; ///
  WebKitUserStyleSheet* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserStyleLevel level, const(char*)* allowList, const(char*)* blockList) c_webkit_user_style_sheet_new; ///
  WebKitUserStyleSheet* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserStyleLevel level, const(char)* worldName, const(char*)* allowList, const(char*)* blockList) c_webkit_user_style_sheet_new_for_world; ///
  WebKitUserStyleSheet* function(WebKitUserStyleSheet* userStyleSheet) c_webkit_user_style_sheet_ref; ///
  void function(WebKitUserStyleSheet* userStyleSheet) c_webkit_user_style_sheet_unref; ///

  // WebContext
  GType function() c_webkit_web_context_get_type; ///
  WebKitWebContext* function() c_webkit_web_context_new; ///
  WebKitWebContext* function() c_webkit_web_context_get_default; ///
  void function(WebKitWebContext* context, const(char)* path, gboolean readOnly) c_webkit_web_context_add_path_to_sandbox; ///
  WebKitCacheModel function(WebKitWebContext* context) c_webkit_web_context_get_cache_model; ///
  WebKitGeolocationManager* function(WebKitWebContext* context) c_webkit_web_context_get_geolocation_manager; ///
  WebKitNetworkSession* function(WebKitWebContext* context) c_webkit_web_context_get_network_session_for_automation; ///
  WebKitSecurityManager* function(WebKitWebContext* context) c_webkit_web_context_get_security_manager; ///
  gboolean function(WebKitWebContext* context) c_webkit_web_context_get_spell_checking_enabled; ///
  const(char*)* function(WebKitWebContext* context) c_webkit_web_context_get_spell_checking_languages; ///
  const(char)* function(WebKitWebContext* context) c_webkit_web_context_get_time_zone_override; ///
  void function(WebKitWebContext* context, GList* allowedOrigins, GList* disallowedOrigins) c_webkit_web_context_initialize_notification_permissions; ///
  gboolean function(WebKitWebContext* context) c_webkit_web_context_is_automation_allowed; ///
  void function(WebKitWebContext* context, const(char)* scheme, WebKitURISchemeRequestCallback callback, void* userData, GDestroyNotify userDataDestroyFunc) c_webkit_web_context_register_uri_scheme; ///
  void function(WebKitWebContext* context, WebKitUserMessage* message) c_webkit_web_context_send_message_to_all_extensions; ///
  void function(WebKitWebContext* context, gboolean allowed) c_webkit_web_context_set_automation_allowed; ///
  void function(WebKitWebContext* context, WebKitCacheModel cacheModel) c_webkit_web_context_set_cache_model; ///
  void function(WebKitWebContext* context, const(char*)* languages) c_webkit_web_context_set_preferred_languages; ///
  void function(WebKitWebContext* context, gboolean enabled) c_webkit_web_context_set_spell_checking_enabled; ///
  void function(WebKitWebContext* context, const(char*)* languages) c_webkit_web_context_set_spell_checking_languages; ///
  void function(WebKitWebContext* context, const(char)* directory) c_webkit_web_context_set_web_process_extensions_directory; ///
  void function(WebKitWebContext* context, GVariant* userData) c_webkit_web_context_set_web_process_extensions_initialization_user_data; ///

  // WebExtensionMatchPattern
  GType function() c_webkit_web_extension_match_pattern_get_type; ///
  WebKitWebExtensionMatchPattern* function() c_webkit_web_extension_match_pattern_new_all_hosts_and_schemes; ///
  WebKitWebExtensionMatchPattern* function() c_webkit_web_extension_match_pattern_new_all_urls; ///
  WebKitWebExtensionMatchPattern* function(const(char)* scheme, const(char)* host, const(char)* path, GError** _err) c_webkit_web_extension_match_pattern_new_with_scheme; ///
  WebKitWebExtensionMatchPattern* function(const(char)* string_, GError** _err) c_webkit_web_extension_match_pattern_new_with_string; ///
  const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_host; ///
  gboolean function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_matches_all_hosts; ///
  gboolean function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_matches_all_urls; ///
  const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_path; ///
  const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_scheme; ///
  const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_get_string; ///
  gboolean function(WebKitWebExtensionMatchPattern* matchPattern, WebKitWebExtensionMatchPattern* pattern, WebKitWebExtensionMatchPatternOptions options) c_webkit_web_extension_match_pattern_matches_pattern; ///
  gboolean function(WebKitWebExtensionMatchPattern* matchPattern, const(char)* url, WebKitWebExtensionMatchPatternOptions options) c_webkit_web_extension_match_pattern_matches_url; ///
  WebKitWebExtensionMatchPattern* function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_ref; ///
  void function(WebKitWebExtensionMatchPattern* matchPattern) c_webkit_web_extension_match_pattern_unref; ///
  void function(const(char)* urlScheme) c_webkit_web_extension_match_pattern_register_custom_URL_scheme; ///

  // WebInspector
  GType function() c_webkit_web_inspector_get_type; ///
  void function(WebKitWebInspector* inspector) c_webkit_web_inspector_attach; ///
  void function(WebKitWebInspector* inspector) c_webkit_web_inspector_close; ///
  void function(WebKitWebInspector* inspector) c_webkit_web_inspector_detach; ///
  uint function(WebKitWebInspector* inspector) c_webkit_web_inspector_get_attached_height; ///
  gboolean function(WebKitWebInspector* inspector) c_webkit_web_inspector_get_can_attach; ///
  const(char)* function(WebKitWebInspector* inspector) c_webkit_web_inspector_get_inspected_uri; ///
  WebKitWebViewBase* function(WebKitWebInspector* inspector) c_webkit_web_inspector_get_web_view; ///
  gboolean function(WebKitWebInspector* inspector) c_webkit_web_inspector_is_attached; ///
  void function(WebKitWebInspector* inspector) c_webkit_web_inspector_show; ///

  // WebResource
  GType function() c_webkit_web_resource_get_type; ///
  void function(WebKitWebResource* resource, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_resource_get_data; ///
  ubyte* function(WebKitWebResource* resource, GAsyncResult* result, size_t* length, GError** _err) c_webkit_web_resource_get_data_finish; ///
  WebKitURIResponse* function(WebKitWebResource* resource) c_webkit_web_resource_get_response; ///
  const(char)* function(WebKitWebResource* resource) c_webkit_web_resource_get_uri; ///

  // WebView
  GType function() c_webkit_web_view_get_type; ///
  GtkWidget* function() c_webkit_web_view_new; ///
  void function(WebKitWebView* webView, const(char)* body_, ptrdiff_t length, GVariant* arguments, const(char)* worldName, const(char)* sourceUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_call_async_javascript_function; ///
  JSCValue* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_call_async_javascript_function_finish; ///
  void function(WebKitWebView* webView, const(char)* command, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_can_execute_editing_command; ///
  gboolean function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_can_execute_editing_command_finish; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_can_go_back; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_can_go_forward; ///
  gboolean function(WebKitWebView* webView, const(char)* mimeType) c_webkit_web_view_can_show_mime_type; ///
  WebKitDownload* function(WebKitWebView* webView, const(char)* uri) c_webkit_web_view_download_uri; ///
  void function(WebKitWebView* webView, const(char)* script, ptrdiff_t length, const(char)* worldName, const(char)* sourceUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_evaluate_javascript; ///
  JSCValue* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_evaluate_javascript_finish; ///
  void function(WebKitWebView* webView, const(char)* command) c_webkit_web_view_execute_editing_command; ///
  void function(WebKitWebView* webView, const(char)* command, const(char)* argument) c_webkit_web_view_execute_editing_command_with_argument; ///
  WebKitAutomationBrowsingContextPresentation function(WebKitWebView* webView) c_webkit_web_view_get_automation_presentation_type; ///
  WebKitBackForwardList* function(WebKitWebView* webView) c_webkit_web_view_get_back_forward_list; ///
  void function(WebKitWebView* webView, GdkRGBA* rgba) c_webkit_web_view_get_background_color; ///
  WebKitMediaCaptureState function(WebKitWebView* webView) c_webkit_web_view_get_camera_capture_state; ///
  WebKitWebContext* function(WebKitWebView* webView) c_webkit_web_view_get_context; ///
  const(char)* function(WebKitWebView* webView) c_webkit_web_view_get_custom_charset; ///
  const(char)* function(WebKitWebView* webView) c_webkit_web_view_get_default_content_security_policy; ///
  WebKitMediaCaptureState function(WebKitWebView* webView) c_webkit_web_view_get_display_capture_state; ///
  WebKitEditorState* function(WebKitWebView* webView) c_webkit_web_view_get_editor_state; ///
  double function(WebKitWebView* webView) c_webkit_web_view_get_estimated_load_progress; ///
  GdkTexture* function(WebKitWebView* webView) c_webkit_web_view_get_favicon; ///
  WebKitFindController* function(WebKitWebView* webView) c_webkit_web_view_get_find_controller; ///
  WebKitInputMethodContext* function(WebKitWebView* webView) c_webkit_web_view_get_input_method_context; ///
  WebKitWebInspector* function(WebKitWebView* webView) c_webkit_web_view_get_inspector; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_get_is_muted; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_get_is_web_process_responsive; ///
  WebKitWebResource* function(WebKitWebView* webView) c_webkit_web_view_get_main_resource; ///
  WebKitMediaCaptureState function(WebKitWebView* webView) c_webkit_web_view_get_microphone_capture_state; ///
  WebKitNetworkSession* function(WebKitWebView* webView) c_webkit_web_view_get_network_session; ///
  ulong function(WebKitWebView* webView) c_webkit_web_view_get_page_id; ///
  WebKitWebViewSessionState* function(WebKitWebView* webView) c_webkit_web_view_get_session_state; ///
  WebKitSettings* function(WebKitWebView* webView) c_webkit_web_view_get_settings; ///
  void function(WebKitWebView* webView, WebKitSnapshotRegion region, WebKitSnapshotOptions options, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_get_snapshot; ///
  GdkTexture* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_get_snapshot_finish; ///
  const(char)* function(WebKitWebView* webView) c_webkit_web_view_get_title; ///
  gboolean function(WebKitWebView* webView, GTlsCertificate** certificate, GTlsCertificateFlags* errors) c_webkit_web_view_get_tls_info; ///
  const(char)* function(WebKitWebView* webView) c_webkit_web_view_get_uri; ///
  WebKitUserContentManager* function(WebKitWebView* webView) c_webkit_web_view_get_user_content_manager; ///
  WebKitWebExtensionMode function(WebKitWebView* webView) c_webkit_web_view_get_web_extension_mode; ///
  WebKitWebsitePolicies* function(WebKitWebView* webView) c_webkit_web_view_get_website_policies; ///
  WebKitWindowProperties* function(WebKitWebView* webView) c_webkit_web_view_get_window_properties; ///
  double function(WebKitWebView* webView) c_webkit_web_view_get_zoom_level; ///
  void function(WebKitWebView* webView) c_webkit_web_view_go_back; ///
  void function(WebKitWebView* webView) c_webkit_web_view_go_forward; ///
  void function(WebKitWebView* webView, WebKitBackForwardListItem* listItem) c_webkit_web_view_go_to_back_forward_list_item; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_is_controlled_by_automation; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_is_editable; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_is_loading; ///
  gboolean function(WebKitWebView* webView) c_webkit_web_view_is_playing_audio; ///
  void function(WebKitWebView* webView, const(char)* content, const(char)* contentUri, const(char)* baseUri) c_webkit_web_view_load_alternate_html; ///
  void function(WebKitWebView* webView, GBytes* bytes, const(char)* mimeType, const(char)* encoding, const(char)* baseUri) c_webkit_web_view_load_bytes; ///
  void function(WebKitWebView* webView, const(char)* content, const(char)* baseUri) c_webkit_web_view_load_html; ///
  void function(WebKitWebView* webView, const(char)* plainText) c_webkit_web_view_load_plain_text; ///
  void function(WebKitWebView* webView, WebKitURIRequest* request) c_webkit_web_view_load_request; ///
  void function(WebKitWebView* webView, const(char)* uri) c_webkit_web_view_load_uri; ///
  void function(WebKitWebView* webView) c_webkit_web_view_reload; ///
  void function(WebKitWebView* webView) c_webkit_web_view_reload_bypass_cache; ///
  void function(WebKitWebView* webView, WebKitWebViewSessionState* state) c_webkit_web_view_restore_session_state; ///
  void function(WebKitWebView* webView, WebKitSaveMode saveMode, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_save; ///
  GInputStream* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_save_finish; ///
  void function(WebKitWebView* webView, GFile* file, WebKitSaveMode saveMode, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_save_to_file; ///
  gboolean function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_save_to_file_finish; ///
  void function(WebKitWebView* webView, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_view_send_message_to_page; ///
  WebKitUserMessage* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) c_webkit_web_view_send_message_to_page_finish; ///
  void function(WebKitWebView* webView, const(GdkRGBA)* rgba) c_webkit_web_view_set_background_color; ///
  void function(WebKitWebView* webView, WebKitMediaCaptureState state) c_webkit_web_view_set_camera_capture_state; ///
  void function(WebKitWebView* webView, const(char*)* allowlist) c_webkit_web_view_set_cors_allowlist; ///
  void function(WebKitWebView* webView, const(char)* charset) c_webkit_web_view_set_custom_charset; ///
  void function(WebKitWebView* webView, WebKitMediaCaptureState state) c_webkit_web_view_set_display_capture_state; ///
  void function(WebKitWebView* webView, gboolean editable) c_webkit_web_view_set_editable; ///
  void function(WebKitWebView* webView, WebKitInputMethodContext* context) c_webkit_web_view_set_input_method_context; ///
  void function(WebKitWebView* webView, gboolean muted) c_webkit_web_view_set_is_muted; ///
  void function(WebKitWebView* webView, WebKitMediaCaptureState state) c_webkit_web_view_set_microphone_capture_state; ///
  void function(WebKitWebView* webView, WebKitSettings* settings) c_webkit_web_view_set_settings; ///
  void function(WebKitWebView* webView, double zoomLevel) c_webkit_web_view_set_zoom_level; ///
  void function(WebKitWebView* webView) c_webkit_web_view_stop_loading; ///
  void function(WebKitWebView* webView) c_webkit_web_view_terminate_web_process; ///
  void function(WebKitWebView* webView) c_webkit_web_view_try_close; ///

  // WebViewBase
  GType function() c_webkit_web_view_base_get_type; ///

  // WebViewSessionState
  GType function() c_webkit_web_view_session_state_get_type; ///
  WebKitWebViewSessionState* function(GBytes* data) c_webkit_web_view_session_state_new; ///
  WebKitWebViewSessionState* function(WebKitWebViewSessionState* state) c_webkit_web_view_session_state_ref; ///
  GBytes* function(WebKitWebViewSessionState* state) c_webkit_web_view_session_state_serialize; ///
  void function(WebKitWebViewSessionState* state) c_webkit_web_view_session_state_unref; ///

  // WebsiteData
  GType function() c_webkit_website_data_get_type; ///
  const(char)* function(WebKitWebsiteData* websiteData) c_webkit_website_data_get_name; ///
  ulong function(WebKitWebsiteData* websiteData, WebKitWebsiteDataTypes types) c_webkit_website_data_get_size; ///
  WebKitWebsiteDataTypes function(WebKitWebsiteData* websiteData) c_webkit_website_data_get_types; ///
  WebKitWebsiteData* function(WebKitWebsiteData* websiteData) c_webkit_website_data_ref; ///
  void function(WebKitWebsiteData* websiteData) c_webkit_website_data_unref; ///

  // WebsiteDataAccessPermissionRequest
  GType function() c_webkit_website_data_access_permission_request_get_type; ///
  const(char)* function(WebKitWebsiteDataAccessPermissionRequest* request) c_webkit_website_data_access_permission_request_get_current_domain; ///
  const(char)* function(WebKitWebsiteDataAccessPermissionRequest* request) c_webkit_website_data_access_permission_request_get_requesting_domain; ///

  // WebsiteDataManager
  GType function() c_webkit_website_data_manager_get_type; ///
  void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GTimeSpan timespan, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_website_data_manager_clear; ///
  gboolean function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) c_webkit_website_data_manager_clear_finish; ///
  void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_website_data_manager_fetch; ///
  GList* function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) c_webkit_website_data_manager_fetch_finish; ///
  const(char)* function(WebKitWebsiteDataManager* manager) c_webkit_website_data_manager_get_base_cache_directory; ///
  const(char)* function(WebKitWebsiteDataManager* manager) c_webkit_website_data_manager_get_base_data_directory; ///
  WebKitFaviconDatabase* function(WebKitWebsiteDataManager* manager) c_webkit_website_data_manager_get_favicon_database; ///
  gboolean function(WebKitWebsiteDataManager* manager) c_webkit_website_data_manager_get_favicons_enabled; ///
  void function(WebKitWebsiteDataManager* manager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_website_data_manager_get_itp_summary; ///
  GList* function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) c_webkit_website_data_manager_get_itp_summary_finish; ///
  gboolean function(WebKitWebsiteDataManager* manager) c_webkit_website_data_manager_is_ephemeral; ///
  void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GList* websiteData, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_website_data_manager_remove; ///
  gboolean function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) c_webkit_website_data_manager_remove_finish; ///
  void function(WebKitWebsiteDataManager* manager, gboolean enabled) c_webkit_website_data_manager_set_favicons_enabled; ///

  // WebsitePolicies
  GType function() c_webkit_website_policies_get_type; ///
  WebKitWebsitePolicies* function() c_webkit_website_policies_new; ///
  WebKitWebsitePolicies* function(const(char)* firstPolicyName,  ...) c_webkit_website_policies_new_with_policies; ///
  WebKitAutoplayPolicy function(WebKitWebsitePolicies* policies) c_webkit_website_policies_get_autoplay_policy; ///

  // WindowProperties
  GType function() c_webkit_window_properties_get_type; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_fullscreen; ///
  void function(WebKitWindowProperties* windowProperties, GdkRectangle* geometry) c_webkit_window_properties_get_geometry; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_locationbar_visible; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_menubar_visible; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_resizable; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_scrollbars_visible; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_statusbar_visible; ///
  gboolean function(WebKitWindowProperties* windowProperties) c_webkit_window_properties_get_toolbar_visible; ///

  // global
  uint function() c_webkit_get_major_version; ///
  uint function() c_webkit_get_micro_version; ///
  uint function() c_webkit_get_minor_version; ///
  const(char)* function(WebKitMediaKeySystemPermissionRequest* request) c_webkit_media_key_system_permission_get_name; ///
  char* function(const(char)* uri) c_webkit_uri_for_display; ///
  gboolean function(WebKitUserMediaPermissionRequest* request) c_webkit_user_media_permission_is_for_audio_device; ///
  gboolean function(WebKitUserMediaPermissionRequest* request) c_webkit_user_media_permission_is_for_display_device; ///
  gboolean function(WebKitUserMediaPermissionRequest* request) c_webkit_user_media_permission_is_for_video_device; ///

  // DownloadError
  GQuark function() c_webkit_download_error_quark; ///

  // FaviconDatabaseError
  GQuark function() c_webkit_favicon_database_error_quark; ///

  // JavascriptError
  GQuark function() c_webkit_javascript_error_quark; ///

  // MediaError
  GQuark function() c_webkit_media_error_quark; ///

  // NetworkError
  GQuark function() c_webkit_network_error_quark; ///

  // PolicyError
  GQuark function() c_webkit_policy_error_quark; ///

  // PrintError
  GQuark function() c_webkit_print_error_quark; ///

  // SnapshotError
  GQuark function() c_webkit_snapshot_error_quark; ///

  // UserContentFilterError
  GQuark function() c_webkit_user_content_filter_error_quark; ///

  // UserMessageError
  GQuark function() c_webkit_user_message_error_quark; ///

  // WebExtensionMatchPatternError
  GQuark function() c_webkit_web_extension_match_pattern_error_quark; ///
}

// ApplicationInfo

/** */
alias webkit_application_info_get_type = c_webkit_application_info_get_type;

/** */
alias webkit_application_info_new = c_webkit_application_info_new;

/** */
alias webkit_application_info_get_name = c_webkit_application_info_get_name;

/** */
alias webkit_application_info_get_version = c_webkit_application_info_get_version;

/** */
alias webkit_application_info_ref = c_webkit_application_info_ref;

/** */
alias webkit_application_info_set_name = c_webkit_application_info_set_name;

/** */
alias webkit_application_info_set_version = c_webkit_application_info_set_version;

/** */
alias webkit_application_info_unref = c_webkit_application_info_unref;

// AuthenticationRequest

/** */
alias webkit_authentication_request_get_type = c_webkit_authentication_request_get_type;

/** */
alias webkit_authentication_request_authenticate = c_webkit_authentication_request_authenticate;

/** */
alias webkit_authentication_request_can_save_credentials = c_webkit_authentication_request_can_save_credentials;

/** */
alias webkit_authentication_request_cancel = c_webkit_authentication_request_cancel;

/** */
alias webkit_authentication_request_get_certificate_pin_flags = c_webkit_authentication_request_get_certificate_pin_flags;

/** */
alias webkit_authentication_request_get_host = c_webkit_authentication_request_get_host;

/** */
alias webkit_authentication_request_get_port = c_webkit_authentication_request_get_port;

/** */
alias webkit_authentication_request_get_proposed_credential = c_webkit_authentication_request_get_proposed_credential;

/** */
alias webkit_authentication_request_get_realm = c_webkit_authentication_request_get_realm;

/** */
alias webkit_authentication_request_get_scheme = c_webkit_authentication_request_get_scheme;

/** */
alias webkit_authentication_request_get_security_origin = c_webkit_authentication_request_get_security_origin;

/** */
alias webkit_authentication_request_is_for_proxy = c_webkit_authentication_request_is_for_proxy;

/** */
alias webkit_authentication_request_is_retry = c_webkit_authentication_request_is_retry;

/** */
alias webkit_authentication_request_set_can_save_credentials = c_webkit_authentication_request_set_can_save_credentials;

/** */
alias webkit_authentication_request_set_proposed_credential = c_webkit_authentication_request_set_proposed_credential;

// AutomationSession

/** */
alias webkit_automation_session_get_type = c_webkit_automation_session_get_type;

/** */
alias webkit_automation_session_get_application_info = c_webkit_automation_session_get_application_info;

/** */
alias webkit_automation_session_get_id = c_webkit_automation_session_get_id;

/** */
alias webkit_automation_session_set_application_info = c_webkit_automation_session_set_application_info;

// BackForwardList

/** */
alias webkit_back_forward_list_get_type = c_webkit_back_forward_list_get_type;

/** */
alias webkit_back_forward_list_get_back_item = c_webkit_back_forward_list_get_back_item;

/** */
alias webkit_back_forward_list_get_back_list = c_webkit_back_forward_list_get_back_list;

/** */
alias webkit_back_forward_list_get_back_list_with_limit = c_webkit_back_forward_list_get_back_list_with_limit;

/** */
alias webkit_back_forward_list_get_current_item = c_webkit_back_forward_list_get_current_item;

/** */
alias webkit_back_forward_list_get_forward_item = c_webkit_back_forward_list_get_forward_item;

/** */
alias webkit_back_forward_list_get_forward_list = c_webkit_back_forward_list_get_forward_list;

/** */
alias webkit_back_forward_list_get_forward_list_with_limit = c_webkit_back_forward_list_get_forward_list_with_limit;

/** */
alias webkit_back_forward_list_get_length = c_webkit_back_forward_list_get_length;

/** */
alias webkit_back_forward_list_get_nth_item = c_webkit_back_forward_list_get_nth_item;

// BackForwardListItem

/** */
alias webkit_back_forward_list_item_get_type = c_webkit_back_forward_list_item_get_type;

/** */
alias webkit_back_forward_list_item_get_original_uri = c_webkit_back_forward_list_item_get_original_uri;

/** */
alias webkit_back_forward_list_item_get_title = c_webkit_back_forward_list_item_get_title;

/** */
alias webkit_back_forward_list_item_get_uri = c_webkit_back_forward_list_item_get_uri;

// ClipboardPermissionRequest

/** */
alias webkit_clipboard_permission_request_get_type = c_webkit_clipboard_permission_request_get_type;

// ColorChooserRequest

/** */
alias webkit_color_chooser_request_get_type = c_webkit_color_chooser_request_get_type;

/** */
alias webkit_color_chooser_request_cancel = c_webkit_color_chooser_request_cancel;

/** */
alias webkit_color_chooser_request_finish = c_webkit_color_chooser_request_finish;

/** */
alias webkit_color_chooser_request_get_element_rectangle = c_webkit_color_chooser_request_get_element_rectangle;

/** */
alias webkit_color_chooser_request_get_rgba = c_webkit_color_chooser_request_get_rgba;

/** */
alias webkit_color_chooser_request_set_rgba = c_webkit_color_chooser_request_set_rgba;

// ContextMenu

/** */
alias webkit_context_menu_get_type = c_webkit_context_menu_get_type;

/** */
alias webkit_context_menu_new = c_webkit_context_menu_new;

/** */
alias webkit_context_menu_new_with_items = c_webkit_context_menu_new_with_items;

/** */
alias webkit_context_menu_append = c_webkit_context_menu_append;

/** */
alias webkit_context_menu_first = c_webkit_context_menu_first;

/** */
alias webkit_context_menu_get_event = c_webkit_context_menu_get_event;

/** */
alias webkit_context_menu_get_item_at_position = c_webkit_context_menu_get_item_at_position;

/** */
alias webkit_context_menu_get_items = c_webkit_context_menu_get_items;

/** */
alias webkit_context_menu_get_n_items = c_webkit_context_menu_get_n_items;

/** */
alias webkit_context_menu_get_user_data = c_webkit_context_menu_get_user_data;

/** */
alias webkit_context_menu_insert = c_webkit_context_menu_insert;

/** */
alias webkit_context_menu_last = c_webkit_context_menu_last;

/** */
alias webkit_context_menu_move_item = c_webkit_context_menu_move_item;

/** */
alias webkit_context_menu_prepend = c_webkit_context_menu_prepend;

/** */
alias webkit_context_menu_remove = c_webkit_context_menu_remove;

/** */
alias webkit_context_menu_remove_all = c_webkit_context_menu_remove_all;

/** */
alias webkit_context_menu_set_user_data = c_webkit_context_menu_set_user_data;

// ContextMenuItem

/** */
alias webkit_context_menu_item_get_type = c_webkit_context_menu_item_get_type;

/** */
alias webkit_context_menu_item_new_from_gaction = c_webkit_context_menu_item_new_from_gaction;

/** */
alias webkit_context_menu_item_new_from_stock_action = c_webkit_context_menu_item_new_from_stock_action;

/** */
alias webkit_context_menu_item_new_from_stock_action_with_label = c_webkit_context_menu_item_new_from_stock_action_with_label;

/** */
alias webkit_context_menu_item_new_separator = c_webkit_context_menu_item_new_separator;

/** */
alias webkit_context_menu_item_new_with_submenu = c_webkit_context_menu_item_new_with_submenu;

/** */
alias webkit_context_menu_item_get_gaction = c_webkit_context_menu_item_get_gaction;

/** */
alias webkit_context_menu_item_get_stock_action = c_webkit_context_menu_item_get_stock_action;

/** */
alias webkit_context_menu_item_get_submenu = c_webkit_context_menu_item_get_submenu;

/** */
alias webkit_context_menu_item_is_separator = c_webkit_context_menu_item_is_separator;

/** */
alias webkit_context_menu_item_set_submenu = c_webkit_context_menu_item_set_submenu;

// CookieManager

/** */
alias webkit_cookie_manager_get_type = c_webkit_cookie_manager_get_type;

/** */
alias webkit_cookie_manager_add_cookie = c_webkit_cookie_manager_add_cookie;

/** */
alias webkit_cookie_manager_add_cookie_finish = c_webkit_cookie_manager_add_cookie_finish;

/** */
alias webkit_cookie_manager_delete_cookie = c_webkit_cookie_manager_delete_cookie;

/** */
alias webkit_cookie_manager_delete_cookie_finish = c_webkit_cookie_manager_delete_cookie_finish;

/** */
alias webkit_cookie_manager_get_accept_policy = c_webkit_cookie_manager_get_accept_policy;

/** */
alias webkit_cookie_manager_get_accept_policy_finish = c_webkit_cookie_manager_get_accept_policy_finish;

/** */
alias webkit_cookie_manager_get_all_cookies = c_webkit_cookie_manager_get_all_cookies;

/** */
alias webkit_cookie_manager_get_all_cookies_finish = c_webkit_cookie_manager_get_all_cookies_finish;

/** */
alias webkit_cookie_manager_get_cookies = c_webkit_cookie_manager_get_cookies;

/** */
alias webkit_cookie_manager_get_cookies_finish = c_webkit_cookie_manager_get_cookies_finish;

/** */
alias webkit_cookie_manager_replace_cookies = c_webkit_cookie_manager_replace_cookies;

/** */
alias webkit_cookie_manager_replace_cookies_finish = c_webkit_cookie_manager_replace_cookies_finish;

/** */
alias webkit_cookie_manager_set_accept_policy = c_webkit_cookie_manager_set_accept_policy;

/** */
alias webkit_cookie_manager_set_persistent_storage = c_webkit_cookie_manager_set_persistent_storage;

// Credential

/** */
alias webkit_credential_get_type = c_webkit_credential_get_type;

/** */
alias webkit_credential_new = c_webkit_credential_new;

/** */
alias webkit_credential_new_for_certificate = c_webkit_credential_new_for_certificate;

/** */
alias webkit_credential_new_for_certificate_pin = c_webkit_credential_new_for_certificate_pin;

/** */
alias webkit_credential_copy = c_webkit_credential_copy;

/** */
alias webkit_credential_free = c_webkit_credential_free;

/** */
alias webkit_credential_get_certificate = c_webkit_credential_get_certificate;

/** */
alias webkit_credential_get_password = c_webkit_credential_get_password;

/** */
alias webkit_credential_get_persistence = c_webkit_credential_get_persistence;

/** */
alias webkit_credential_get_username = c_webkit_credential_get_username;

/** */
alias webkit_credential_has_password = c_webkit_credential_has_password;

// DeviceInfoPermissionRequest

/** */
alias webkit_device_info_permission_request_get_type = c_webkit_device_info_permission_request_get_type;

// Download

/** */
alias webkit_download_get_type = c_webkit_download_get_type;

/** */
alias webkit_download_cancel = c_webkit_download_cancel;

/** */
alias webkit_download_get_allow_overwrite = c_webkit_download_get_allow_overwrite;

/** */
alias webkit_download_get_destination = c_webkit_download_get_destination;

/** */
alias webkit_download_get_elapsed_time = c_webkit_download_get_elapsed_time;

/** */
alias webkit_download_get_estimated_progress = c_webkit_download_get_estimated_progress;

/** */
alias webkit_download_get_received_data_length = c_webkit_download_get_received_data_length;

/** */
alias webkit_download_get_request = c_webkit_download_get_request;

/** */
alias webkit_download_get_response = c_webkit_download_get_response;

/** */
alias webkit_download_get_web_view = c_webkit_download_get_web_view;

/** */
alias webkit_download_set_allow_overwrite = c_webkit_download_set_allow_overwrite;

/** */
alias webkit_download_set_destination = c_webkit_download_set_destination;

// EditorState

/** */
alias webkit_editor_state_get_type = c_webkit_editor_state_get_type;

/** */
alias webkit_editor_state_get_typing_attributes = c_webkit_editor_state_get_typing_attributes;

/** */
alias webkit_editor_state_is_copy_available = c_webkit_editor_state_is_copy_available;

/** */
alias webkit_editor_state_is_cut_available = c_webkit_editor_state_is_cut_available;

/** */
alias webkit_editor_state_is_paste_available = c_webkit_editor_state_is_paste_available;

/** */
alias webkit_editor_state_is_redo_available = c_webkit_editor_state_is_redo_available;

/** */
alias webkit_editor_state_is_undo_available = c_webkit_editor_state_is_undo_available;

// FaviconDatabase

/** */
alias webkit_favicon_database_get_type = c_webkit_favicon_database_get_type;

/** */
alias webkit_favicon_database_clear = c_webkit_favicon_database_clear;

/** */
alias webkit_favicon_database_get_favicon = c_webkit_favicon_database_get_favicon;

/** */
alias webkit_favicon_database_get_favicon_finish = c_webkit_favicon_database_get_favicon_finish;

/** */
alias webkit_favicon_database_get_favicon_uri = c_webkit_favicon_database_get_favicon_uri;

// Feature

/** */
alias webkit_feature_get_type = c_webkit_feature_get_type;

/** */
alias webkit_feature_get_category = c_webkit_feature_get_category;

/** */
alias webkit_feature_get_default_value = c_webkit_feature_get_default_value;

/** */
alias webkit_feature_get_details = c_webkit_feature_get_details;

/** */
alias webkit_feature_get_identifier = c_webkit_feature_get_identifier;

/** */
alias webkit_feature_get_name = c_webkit_feature_get_name;

/** */
alias webkit_feature_get_status = c_webkit_feature_get_status;

/** */
alias webkit_feature_ref = c_webkit_feature_ref;

/** */
alias webkit_feature_unref = c_webkit_feature_unref;

// FeatureList

/** */
alias webkit_feature_list_get_type = c_webkit_feature_list_get_type;

/** */
alias webkit_feature_list_get = c_webkit_feature_list_get;

/** */
alias webkit_feature_list_get_length = c_webkit_feature_list_get_length;

/** */
alias webkit_feature_list_ref = c_webkit_feature_list_ref;

/** */
alias webkit_feature_list_unref = c_webkit_feature_list_unref;

// FileChooserRequest

/** */
alias webkit_file_chooser_request_get_type = c_webkit_file_chooser_request_get_type;

/** */
alias webkit_file_chooser_request_cancel = c_webkit_file_chooser_request_cancel;

/** */
alias webkit_file_chooser_request_get_mime_types = c_webkit_file_chooser_request_get_mime_types;

/** */
alias webkit_file_chooser_request_get_mime_types_filter = c_webkit_file_chooser_request_get_mime_types_filter;

/** */
alias webkit_file_chooser_request_get_select_multiple = c_webkit_file_chooser_request_get_select_multiple;

/** */
alias webkit_file_chooser_request_get_selected_files = c_webkit_file_chooser_request_get_selected_files;

/** */
alias webkit_file_chooser_request_select_files = c_webkit_file_chooser_request_select_files;

// FindController

/** */
alias webkit_find_controller_get_type = c_webkit_find_controller_get_type;

/** */
alias webkit_find_controller_count_matches = c_webkit_find_controller_count_matches;

/** */
alias webkit_find_controller_get_max_match_count = c_webkit_find_controller_get_max_match_count;

/** */
alias webkit_find_controller_get_options = c_webkit_find_controller_get_options;

/** */
alias webkit_find_controller_get_search_text = c_webkit_find_controller_get_search_text;

/** */
alias webkit_find_controller_get_web_view = c_webkit_find_controller_get_web_view;

/** */
alias webkit_find_controller_search = c_webkit_find_controller_search;

/** */
alias webkit_find_controller_search_finish = c_webkit_find_controller_search_finish;

/** */
alias webkit_find_controller_search_next = c_webkit_find_controller_search_next;

/** */
alias webkit_find_controller_search_previous = c_webkit_find_controller_search_previous;

// FormSubmissionRequest

/** */
alias webkit_form_submission_request_get_type = c_webkit_form_submission_request_get_type;

/** */
alias webkit_form_submission_request_list_text_fields = c_webkit_form_submission_request_list_text_fields;

/** */
alias webkit_form_submission_request_submit = c_webkit_form_submission_request_submit;

// GeolocationManager

/** */
alias webkit_geolocation_manager_get_type = c_webkit_geolocation_manager_get_type;

/** */
alias webkit_geolocation_manager_failed = c_webkit_geolocation_manager_failed;

/** */
alias webkit_geolocation_manager_get_enable_high_accuracy = c_webkit_geolocation_manager_get_enable_high_accuracy;

/** */
alias webkit_geolocation_manager_update_position = c_webkit_geolocation_manager_update_position;

// GeolocationPermissionRequest

/** */
alias webkit_geolocation_permission_request_get_type = c_webkit_geolocation_permission_request_get_type;

// GeolocationPosition

/** */
alias webkit_geolocation_position_get_type = c_webkit_geolocation_position_get_type;

/** */
alias webkit_geolocation_position_new = c_webkit_geolocation_position_new;

/** */
alias webkit_geolocation_position_copy = c_webkit_geolocation_position_copy;

/** */
alias webkit_geolocation_position_free = c_webkit_geolocation_position_free;

/** */
alias webkit_geolocation_position_set_altitude = c_webkit_geolocation_position_set_altitude;

/** */
alias webkit_geolocation_position_set_altitude_accuracy = c_webkit_geolocation_position_set_altitude_accuracy;

/** */
alias webkit_geolocation_position_set_heading = c_webkit_geolocation_position_set_heading;

/** */
alias webkit_geolocation_position_set_speed = c_webkit_geolocation_position_set_speed;

/** */
alias webkit_geolocation_position_set_timestamp = c_webkit_geolocation_position_set_timestamp;

// HitTestResult

/** */
alias webkit_hit_test_result_get_type = c_webkit_hit_test_result_get_type;

/** */
alias webkit_hit_test_result_context_is_editable = c_webkit_hit_test_result_context_is_editable;

/** */
alias webkit_hit_test_result_context_is_image = c_webkit_hit_test_result_context_is_image;

/** */
alias webkit_hit_test_result_context_is_link = c_webkit_hit_test_result_context_is_link;

/** */
alias webkit_hit_test_result_context_is_media = c_webkit_hit_test_result_context_is_media;

/** */
alias webkit_hit_test_result_context_is_scrollbar = c_webkit_hit_test_result_context_is_scrollbar;

/** */
alias webkit_hit_test_result_context_is_selection = c_webkit_hit_test_result_context_is_selection;

/** */
alias webkit_hit_test_result_get_context = c_webkit_hit_test_result_get_context;

/** */
alias webkit_hit_test_result_get_image_uri = c_webkit_hit_test_result_get_image_uri;

/** */
alias webkit_hit_test_result_get_link_label = c_webkit_hit_test_result_get_link_label;

/** */
alias webkit_hit_test_result_get_link_title = c_webkit_hit_test_result_get_link_title;

/** */
alias webkit_hit_test_result_get_link_uri = c_webkit_hit_test_result_get_link_uri;

/** */
alias webkit_hit_test_result_get_media_uri = c_webkit_hit_test_result_get_media_uri;

// ITPFirstParty

/** */
alias webkit_itp_first_party_get_type = c_webkit_itp_first_party_get_type;

/** */
alias webkit_itp_first_party_get_domain = c_webkit_itp_first_party_get_domain;

/** */
alias webkit_itp_first_party_get_last_update_time = c_webkit_itp_first_party_get_last_update_time;

/** */
alias webkit_itp_first_party_get_website_data_access_allowed = c_webkit_itp_first_party_get_website_data_access_allowed;

/** */
alias webkit_itp_first_party_ref = c_webkit_itp_first_party_ref;

/** */
alias webkit_itp_first_party_unref = c_webkit_itp_first_party_unref;

// ITPThirdParty

/** */
alias webkit_itp_third_party_get_type = c_webkit_itp_third_party_get_type;

/** */
alias webkit_itp_third_party_get_domain = c_webkit_itp_third_party_get_domain;

/** */
alias webkit_itp_third_party_get_first_parties = c_webkit_itp_third_party_get_first_parties;

/** */
alias webkit_itp_third_party_ref = c_webkit_itp_third_party_ref;

/** */
alias webkit_itp_third_party_unref = c_webkit_itp_third_party_unref;

// InputMethodContext

/** */
alias webkit_input_method_context_get_type = c_webkit_input_method_context_get_type;

/** */
alias webkit_input_method_context_filter_key_event = c_webkit_input_method_context_filter_key_event;

/** */
alias webkit_input_method_context_get_input_hints = c_webkit_input_method_context_get_input_hints;

/** */
alias webkit_input_method_context_get_input_purpose = c_webkit_input_method_context_get_input_purpose;

/** */
alias webkit_input_method_context_get_preedit = c_webkit_input_method_context_get_preedit;

/** */
alias webkit_input_method_context_notify_cursor_area = c_webkit_input_method_context_notify_cursor_area;

/** */
alias webkit_input_method_context_notify_focus_in = c_webkit_input_method_context_notify_focus_in;

/** */
alias webkit_input_method_context_notify_focus_out = c_webkit_input_method_context_notify_focus_out;

/** */
alias webkit_input_method_context_notify_surrounding = c_webkit_input_method_context_notify_surrounding;

/** */
alias webkit_input_method_context_reset = c_webkit_input_method_context_reset;

/** */
alias webkit_input_method_context_set_enable_preedit = c_webkit_input_method_context_set_enable_preedit;

/** */
alias webkit_input_method_context_set_input_hints = c_webkit_input_method_context_set_input_hints;

/** */
alias webkit_input_method_context_set_input_purpose = c_webkit_input_method_context_set_input_purpose;

// InputMethodUnderline

/** */
alias webkit_input_method_underline_get_type = c_webkit_input_method_underline_get_type;

/** */
alias webkit_input_method_underline_new = c_webkit_input_method_underline_new;

/** */
alias webkit_input_method_underline_copy = c_webkit_input_method_underline_copy;

/** */
alias webkit_input_method_underline_free = c_webkit_input_method_underline_free;

/** */
alias webkit_input_method_underline_set_color = c_webkit_input_method_underline_set_color;

// MediaKeySystemPermissionRequest

/** */
alias webkit_media_key_system_permission_request_get_type = c_webkit_media_key_system_permission_request_get_type;

// MemoryPressureSettings

/** */
alias webkit_memory_pressure_settings_get_type = c_webkit_memory_pressure_settings_get_type;

/** */
alias webkit_memory_pressure_settings_new = c_webkit_memory_pressure_settings_new;

/** */
alias webkit_memory_pressure_settings_copy = c_webkit_memory_pressure_settings_copy;

/** */
alias webkit_memory_pressure_settings_free = c_webkit_memory_pressure_settings_free;

/** */
alias webkit_memory_pressure_settings_get_conservative_threshold = c_webkit_memory_pressure_settings_get_conservative_threshold;

/** */
alias webkit_memory_pressure_settings_get_kill_threshold = c_webkit_memory_pressure_settings_get_kill_threshold;

/** */
alias webkit_memory_pressure_settings_get_memory_limit = c_webkit_memory_pressure_settings_get_memory_limit;

/** */
alias webkit_memory_pressure_settings_get_poll_interval = c_webkit_memory_pressure_settings_get_poll_interval;

/** */
alias webkit_memory_pressure_settings_get_strict_threshold = c_webkit_memory_pressure_settings_get_strict_threshold;

/** */
alias webkit_memory_pressure_settings_set_conservative_threshold = c_webkit_memory_pressure_settings_set_conservative_threshold;

/** */
alias webkit_memory_pressure_settings_set_kill_threshold = c_webkit_memory_pressure_settings_set_kill_threshold;

/** */
alias webkit_memory_pressure_settings_set_memory_limit = c_webkit_memory_pressure_settings_set_memory_limit;

/** */
alias webkit_memory_pressure_settings_set_poll_interval = c_webkit_memory_pressure_settings_set_poll_interval;

/** */
alias webkit_memory_pressure_settings_set_strict_threshold = c_webkit_memory_pressure_settings_set_strict_threshold;

// NavigationAction

/** */
alias webkit_navigation_action_get_type = c_webkit_navigation_action_get_type;

/** */
alias webkit_navigation_action_copy = c_webkit_navigation_action_copy;

/** */
alias webkit_navigation_action_free = c_webkit_navigation_action_free;

/** */
alias webkit_navigation_action_get_frame_name = c_webkit_navigation_action_get_frame_name;

/** */
alias webkit_navigation_action_get_modifiers = c_webkit_navigation_action_get_modifiers;

/** */
alias webkit_navigation_action_get_mouse_button = c_webkit_navigation_action_get_mouse_button;

/** */
alias webkit_navigation_action_get_navigation_type = c_webkit_navigation_action_get_navigation_type;

/** */
alias webkit_navigation_action_get_request = c_webkit_navigation_action_get_request;

/** */
alias webkit_navigation_action_is_redirect = c_webkit_navigation_action_is_redirect;

/** */
alias webkit_navigation_action_is_user_gesture = c_webkit_navigation_action_is_user_gesture;

// NavigationPolicyDecision

/** */
alias webkit_navigation_policy_decision_get_type = c_webkit_navigation_policy_decision_get_type;

/** */
alias webkit_navigation_policy_decision_get_navigation_action = c_webkit_navigation_policy_decision_get_navigation_action;

// NetworkProxySettings

/** */
alias webkit_network_proxy_settings_get_type = c_webkit_network_proxy_settings_get_type;

/** */
alias webkit_network_proxy_settings_new = c_webkit_network_proxy_settings_new;

/** */
alias webkit_network_proxy_settings_add_proxy_for_scheme = c_webkit_network_proxy_settings_add_proxy_for_scheme;

/** */
alias webkit_network_proxy_settings_copy = c_webkit_network_proxy_settings_copy;

/** */
alias webkit_network_proxy_settings_free = c_webkit_network_proxy_settings_free;

// NetworkSession

/** */
alias webkit_network_session_get_type = c_webkit_network_session_get_type;

/** */
alias webkit_network_session_new = c_webkit_network_session_new;

/** */
alias webkit_network_session_new_ephemeral = c_webkit_network_session_new_ephemeral;

/** */
alias webkit_network_session_get_default = c_webkit_network_session_get_default;

/** */
alias webkit_network_session_set_memory_pressure_settings = c_webkit_network_session_set_memory_pressure_settings;

/** */
alias webkit_network_session_allow_tls_certificate_for_host = c_webkit_network_session_allow_tls_certificate_for_host;

/** */
alias webkit_network_session_download_uri = c_webkit_network_session_download_uri;

/** */
alias webkit_network_session_get_cookie_manager = c_webkit_network_session_get_cookie_manager;

/** */
alias webkit_network_session_get_itp_enabled = c_webkit_network_session_get_itp_enabled;

/** */
alias webkit_network_session_get_itp_summary = c_webkit_network_session_get_itp_summary;

/** */
alias webkit_network_session_get_itp_summary_finish = c_webkit_network_session_get_itp_summary_finish;

/** */
alias webkit_network_session_get_persistent_credential_storage_enabled = c_webkit_network_session_get_persistent_credential_storage_enabled;

/** */
alias webkit_network_session_get_tls_errors_policy = c_webkit_network_session_get_tls_errors_policy;

/** */
alias webkit_network_session_get_website_data_manager = c_webkit_network_session_get_website_data_manager;

/** */
alias webkit_network_session_is_ephemeral = c_webkit_network_session_is_ephemeral;

/** */
alias webkit_network_session_prefetch_dns = c_webkit_network_session_prefetch_dns;

/** */
alias webkit_network_session_set_itp_enabled = c_webkit_network_session_set_itp_enabled;

/** */
alias webkit_network_session_set_persistent_credential_storage_enabled = c_webkit_network_session_set_persistent_credential_storage_enabled;

/** */
alias webkit_network_session_set_proxy_settings = c_webkit_network_session_set_proxy_settings;

/** */
alias webkit_network_session_set_tls_errors_policy = c_webkit_network_session_set_tls_errors_policy;

// Notification

/** */
alias webkit_notification_get_type = c_webkit_notification_get_type;

/** */
alias webkit_notification_clicked = c_webkit_notification_clicked;

/** */
alias webkit_notification_close = c_webkit_notification_close;

/** */
alias webkit_notification_get_body = c_webkit_notification_get_body;

/** */
alias webkit_notification_get_id = c_webkit_notification_get_id;

/** */
alias webkit_notification_get_tag = c_webkit_notification_get_tag;

/** */
alias webkit_notification_get_title = c_webkit_notification_get_title;

// NotificationPermissionRequest

/** */
alias webkit_notification_permission_request_get_type = c_webkit_notification_permission_request_get_type;

// OptionMenu

/** */
alias webkit_option_menu_get_type = c_webkit_option_menu_get_type;

/** */
alias webkit_option_menu_activate_item = c_webkit_option_menu_activate_item;

/** */
alias webkit_option_menu_close = c_webkit_option_menu_close;

/** */
alias webkit_option_menu_get_event = c_webkit_option_menu_get_event;

/** */
alias webkit_option_menu_get_item = c_webkit_option_menu_get_item;

/** */
alias webkit_option_menu_get_n_items = c_webkit_option_menu_get_n_items;

/** */
alias webkit_option_menu_select_item = c_webkit_option_menu_select_item;

// OptionMenuItem

/** */
alias webkit_option_menu_item_get_type = c_webkit_option_menu_item_get_type;

/** */
alias webkit_option_menu_item_copy = c_webkit_option_menu_item_copy;

/** */
alias webkit_option_menu_item_free = c_webkit_option_menu_item_free;

/** */
alias webkit_option_menu_item_get_label = c_webkit_option_menu_item_get_label;

/** */
alias webkit_option_menu_item_get_tooltip = c_webkit_option_menu_item_get_tooltip;

/** */
alias webkit_option_menu_item_is_enabled = c_webkit_option_menu_item_is_enabled;

/** */
alias webkit_option_menu_item_is_group_child = c_webkit_option_menu_item_is_group_child;

/** */
alias webkit_option_menu_item_is_group_label = c_webkit_option_menu_item_is_group_label;

/** */
alias webkit_option_menu_item_is_selected = c_webkit_option_menu_item_is_selected;

// PermissionRequest

/** */
alias webkit_permission_request_get_type = c_webkit_permission_request_get_type;

/** */
alias webkit_permission_request_allow = c_webkit_permission_request_allow;

/** */
alias webkit_permission_request_deny = c_webkit_permission_request_deny;

// PermissionStateQuery

/** */
alias webkit_permission_state_query_get_type = c_webkit_permission_state_query_get_type;

/** */
alias webkit_permission_state_query_finish = c_webkit_permission_state_query_finish;

/** */
alias webkit_permission_state_query_get_name = c_webkit_permission_state_query_get_name;

/** */
alias webkit_permission_state_query_get_security_origin = c_webkit_permission_state_query_get_security_origin;

/** */
alias webkit_permission_state_query_ref = c_webkit_permission_state_query_ref;

/** */
alias webkit_permission_state_query_unref = c_webkit_permission_state_query_unref;

// PointerLockPermissionRequest

/** */
alias webkit_pointer_lock_permission_request_get_type = c_webkit_pointer_lock_permission_request_get_type;

// PolicyDecision

/** */
alias webkit_policy_decision_get_type = c_webkit_policy_decision_get_type;

/** */
alias webkit_policy_decision_download = c_webkit_policy_decision_download;

/** */
alias webkit_policy_decision_ignore = c_webkit_policy_decision_ignore;

/** */
alias webkit_policy_decision_use = c_webkit_policy_decision_use;

/** */
alias webkit_policy_decision_use_with_policies = c_webkit_policy_decision_use_with_policies;

// PrintOperation

/** */
alias webkit_print_operation_get_type = c_webkit_print_operation_get_type;

/** */
alias webkit_print_operation_new = c_webkit_print_operation_new;

/** */
alias webkit_print_operation_get_page_setup = c_webkit_print_operation_get_page_setup;

/** */
alias webkit_print_operation_get_print_settings = c_webkit_print_operation_get_print_settings;

/** */
alias webkit_print_operation_print = c_webkit_print_operation_print;

/** */
alias webkit_print_operation_run_dialog = c_webkit_print_operation_run_dialog;

/** */
alias webkit_print_operation_set_page_setup = c_webkit_print_operation_set_page_setup;

/** */
alias webkit_print_operation_set_print_settings = c_webkit_print_operation_set_print_settings;

// ResponsePolicyDecision

/** */
alias webkit_response_policy_decision_get_type = c_webkit_response_policy_decision_get_type;

/** */
alias webkit_response_policy_decision_get_request = c_webkit_response_policy_decision_get_request;

/** */
alias webkit_response_policy_decision_get_response = c_webkit_response_policy_decision_get_response;

/** */
alias webkit_response_policy_decision_is_main_frame_main_resource = c_webkit_response_policy_decision_is_main_frame_main_resource;

/** */
alias webkit_response_policy_decision_is_mime_type_supported = c_webkit_response_policy_decision_is_mime_type_supported;

// ScriptDialog

/** */
alias webkit_script_dialog_get_type = c_webkit_script_dialog_get_type;

/** */
alias webkit_script_dialog_close = c_webkit_script_dialog_close;

/** */
alias webkit_script_dialog_confirm_set_confirmed = c_webkit_script_dialog_confirm_set_confirmed;

/** */
alias webkit_script_dialog_get_dialog_type = c_webkit_script_dialog_get_dialog_type;

/** */
alias webkit_script_dialog_get_message = c_webkit_script_dialog_get_message;

/** */
alias webkit_script_dialog_prompt_get_default_text = c_webkit_script_dialog_prompt_get_default_text;

/** */
alias webkit_script_dialog_prompt_set_text = c_webkit_script_dialog_prompt_set_text;

/** */
alias webkit_script_dialog_ref = c_webkit_script_dialog_ref;

/** */
alias webkit_script_dialog_unref = c_webkit_script_dialog_unref;

// ScriptMessageReply

/** */
alias webkit_script_message_reply_get_type = c_webkit_script_message_reply_get_type;

/** */
alias webkit_script_message_reply_ref = c_webkit_script_message_reply_ref;

/** */
alias webkit_script_message_reply_return_error_message = c_webkit_script_message_reply_return_error_message;

/** */
alias webkit_script_message_reply_return_value = c_webkit_script_message_reply_return_value;

/** */
alias webkit_script_message_reply_unref = c_webkit_script_message_reply_unref;

// SecurityManager

/** */
alias webkit_security_manager_get_type = c_webkit_security_manager_get_type;

/** */
alias webkit_security_manager_register_uri_scheme_as_cors_enabled = c_webkit_security_manager_register_uri_scheme_as_cors_enabled;

/** */
alias webkit_security_manager_register_uri_scheme_as_display_isolated = c_webkit_security_manager_register_uri_scheme_as_display_isolated;

/** */
alias webkit_security_manager_register_uri_scheme_as_empty_document = c_webkit_security_manager_register_uri_scheme_as_empty_document;

/** */
alias webkit_security_manager_register_uri_scheme_as_local = c_webkit_security_manager_register_uri_scheme_as_local;

/** */
alias webkit_security_manager_register_uri_scheme_as_no_access = c_webkit_security_manager_register_uri_scheme_as_no_access;

/** */
alias webkit_security_manager_register_uri_scheme_as_secure = c_webkit_security_manager_register_uri_scheme_as_secure;

/** */
alias webkit_security_manager_uri_scheme_is_cors_enabled = c_webkit_security_manager_uri_scheme_is_cors_enabled;

/** */
alias webkit_security_manager_uri_scheme_is_display_isolated = c_webkit_security_manager_uri_scheme_is_display_isolated;

/** */
alias webkit_security_manager_uri_scheme_is_empty_document = c_webkit_security_manager_uri_scheme_is_empty_document;

/** */
alias webkit_security_manager_uri_scheme_is_local = c_webkit_security_manager_uri_scheme_is_local;

/** */
alias webkit_security_manager_uri_scheme_is_no_access = c_webkit_security_manager_uri_scheme_is_no_access;

/** */
alias webkit_security_manager_uri_scheme_is_secure = c_webkit_security_manager_uri_scheme_is_secure;

// SecurityOrigin

/** */
alias webkit_security_origin_get_type = c_webkit_security_origin_get_type;

/** */
alias webkit_security_origin_new = c_webkit_security_origin_new;

/** */
alias webkit_security_origin_new_for_uri = c_webkit_security_origin_new_for_uri;

/** */
alias webkit_security_origin_get_host = c_webkit_security_origin_get_host;

/** */
alias webkit_security_origin_get_port = c_webkit_security_origin_get_port;

/** */
alias webkit_security_origin_get_protocol = c_webkit_security_origin_get_protocol;

/** */
alias webkit_security_origin_ref = c_webkit_security_origin_ref;

/** */
alias webkit_security_origin_to_string = c_webkit_security_origin_to_string;

/** */
alias webkit_security_origin_unref = c_webkit_security_origin_unref;

// Settings

/** */
alias webkit_settings_get_type = c_webkit_settings_get_type;

/** */
alias webkit_settings_new = c_webkit_settings_new;

/** */
alias webkit_settings_new_with_settings = c_webkit_settings_new_with_settings;

/** */
alias webkit_settings_font_size_to_pixels = c_webkit_settings_font_size_to_pixels;

/** */
alias webkit_settings_font_size_to_points = c_webkit_settings_font_size_to_points;

/** */
alias webkit_settings_get_all_features = c_webkit_settings_get_all_features;

/** */
alias webkit_settings_get_development_features = c_webkit_settings_get_development_features;

/** */
alias webkit_settings_get_experimental_features = c_webkit_settings_get_experimental_features;

/** */
alias webkit_settings_apply_from_key_file = c_webkit_settings_apply_from_key_file;

/** */
alias webkit_settings_get_allow_file_access_from_file_urls = c_webkit_settings_get_allow_file_access_from_file_urls;

/** */
alias webkit_settings_get_allow_modal_dialogs = c_webkit_settings_get_allow_modal_dialogs;

/** */
alias webkit_settings_get_allow_top_navigation_to_data_urls = c_webkit_settings_get_allow_top_navigation_to_data_urls;

/** */
alias webkit_settings_get_allow_universal_access_from_file_urls = c_webkit_settings_get_allow_universal_access_from_file_urls;

/** */
alias webkit_settings_get_auto_load_images = c_webkit_settings_get_auto_load_images;

/** */
alias webkit_settings_get_cursive_font_family = c_webkit_settings_get_cursive_font_family;

/** */
alias webkit_settings_get_default_charset = c_webkit_settings_get_default_charset;

/** */
alias webkit_settings_get_default_font_family = c_webkit_settings_get_default_font_family;

/** */
alias webkit_settings_get_default_font_size = c_webkit_settings_get_default_font_size;

/** */
alias webkit_settings_get_default_monospace_font_size = c_webkit_settings_get_default_monospace_font_size;

/** */
alias webkit_settings_get_disable_web_security = c_webkit_settings_get_disable_web_security;

/** */
alias webkit_settings_get_draw_compositing_indicators = c_webkit_settings_get_draw_compositing_indicators;

/** */
alias webkit_settings_get_enable_2d_canvas_acceleration = c_webkit_settings_get_enable_2d_canvas_acceleration;

/** */
alias webkit_settings_get_enable_back_forward_navigation_gestures = c_webkit_settings_get_enable_back_forward_navigation_gestures;

/** */
alias webkit_settings_get_enable_caret_browsing = c_webkit_settings_get_enable_caret_browsing;

/** */
alias webkit_settings_get_enable_developer_extras = c_webkit_settings_get_enable_developer_extras;

/** */
alias webkit_settings_get_enable_dns_prefetching = c_webkit_settings_get_enable_dns_prefetching;

/** */
alias webkit_settings_get_enable_encrypted_media = c_webkit_settings_get_enable_encrypted_media;

/** */
alias webkit_settings_get_enable_fullscreen = c_webkit_settings_get_enable_fullscreen;

/** */
alias webkit_settings_get_enable_html5_database = c_webkit_settings_get_enable_html5_database;

/** */
alias webkit_settings_get_enable_html5_local_storage = c_webkit_settings_get_enable_html5_local_storage;

/** */
alias webkit_settings_get_enable_hyperlink_auditing = c_webkit_settings_get_enable_hyperlink_auditing;

/** */
alias webkit_settings_get_enable_javascript = c_webkit_settings_get_enable_javascript;

/** */
alias webkit_settings_get_enable_javascript_markup = c_webkit_settings_get_enable_javascript_markup;

/** */
alias webkit_settings_get_enable_media = c_webkit_settings_get_enable_media;

/** */
alias webkit_settings_get_enable_media_capabilities = c_webkit_settings_get_enable_media_capabilities;

/** */
alias webkit_settings_get_enable_media_stream = c_webkit_settings_get_enable_media_stream;

/** */
alias webkit_settings_get_enable_mediasource = c_webkit_settings_get_enable_mediasource;

/** */
alias webkit_settings_get_enable_mock_capture_devices = c_webkit_settings_get_enable_mock_capture_devices;

/** */
alias webkit_settings_get_enable_offline_web_application_cache = c_webkit_settings_get_enable_offline_web_application_cache;

/** */
alias webkit_settings_get_enable_page_cache = c_webkit_settings_get_enable_page_cache;

/** */
alias webkit_settings_get_enable_resizable_text_areas = c_webkit_settings_get_enable_resizable_text_areas;

/** */
alias webkit_settings_get_enable_site_specific_quirks = c_webkit_settings_get_enable_site_specific_quirks;

/** */
alias webkit_settings_get_enable_smooth_scrolling = c_webkit_settings_get_enable_smooth_scrolling;

/** */
alias webkit_settings_get_enable_spatial_navigation = c_webkit_settings_get_enable_spatial_navigation;

/** */
alias webkit_settings_get_enable_tabs_to_links = c_webkit_settings_get_enable_tabs_to_links;

/** */
alias webkit_settings_get_enable_webaudio = c_webkit_settings_get_enable_webaudio;

/** */
alias webkit_settings_get_enable_webgl = c_webkit_settings_get_enable_webgl;

/** */
alias webkit_settings_get_enable_webrtc = c_webkit_settings_get_enable_webrtc;

/** */
alias webkit_settings_get_enable_write_console_messages_to_stdout = c_webkit_settings_get_enable_write_console_messages_to_stdout;

/** */
alias webkit_settings_get_fantasy_font_family = c_webkit_settings_get_fantasy_font_family;

/** */
alias webkit_settings_get_feature_enabled = c_webkit_settings_get_feature_enabled;

/** */
alias webkit_settings_get_hardware_acceleration_policy = c_webkit_settings_get_hardware_acceleration_policy;

/** */
alias webkit_settings_get_javascript_can_access_clipboard = c_webkit_settings_get_javascript_can_access_clipboard;

/** */
alias webkit_settings_get_javascript_can_open_windows_automatically = c_webkit_settings_get_javascript_can_open_windows_automatically;

/** */
alias webkit_settings_get_load_icons_ignoring_image_load_setting = c_webkit_settings_get_load_icons_ignoring_image_load_setting;

/** */
alias webkit_settings_get_media_content_types_requiring_hardware_support = c_webkit_settings_get_media_content_types_requiring_hardware_support;

/** */
alias webkit_settings_get_media_playback_allows_inline = c_webkit_settings_get_media_playback_allows_inline;

/** */
alias webkit_settings_get_media_playback_requires_user_gesture = c_webkit_settings_get_media_playback_requires_user_gesture;

/** */
alias webkit_settings_get_minimum_font_size = c_webkit_settings_get_minimum_font_size;

/** */
alias webkit_settings_get_monospace_font_family = c_webkit_settings_get_monospace_font_family;

/** */
alias webkit_settings_get_pictograph_font_family = c_webkit_settings_get_pictograph_font_family;

/** */
alias webkit_settings_get_print_backgrounds = c_webkit_settings_get_print_backgrounds;

/** */
alias webkit_settings_get_sans_serif_font_family = c_webkit_settings_get_sans_serif_font_family;

/** */
alias webkit_settings_get_serif_font_family = c_webkit_settings_get_serif_font_family;

/** */
alias webkit_settings_get_user_agent = c_webkit_settings_get_user_agent;

/** */
alias webkit_settings_get_webrtc_udp_ports_range = c_webkit_settings_get_webrtc_udp_ports_range;

/** */
alias webkit_settings_get_zoom_text_only = c_webkit_settings_get_zoom_text_only;

/** */
alias webkit_settings_set_allow_file_access_from_file_urls = c_webkit_settings_set_allow_file_access_from_file_urls;

/** */
alias webkit_settings_set_allow_modal_dialogs = c_webkit_settings_set_allow_modal_dialogs;

/** */
alias webkit_settings_set_allow_top_navigation_to_data_urls = c_webkit_settings_set_allow_top_navigation_to_data_urls;

/** */
alias webkit_settings_set_allow_universal_access_from_file_urls = c_webkit_settings_set_allow_universal_access_from_file_urls;

/** */
alias webkit_settings_set_auto_load_images = c_webkit_settings_set_auto_load_images;

/** */
alias webkit_settings_set_cursive_font_family = c_webkit_settings_set_cursive_font_family;

/** */
alias webkit_settings_set_default_charset = c_webkit_settings_set_default_charset;

/** */
alias webkit_settings_set_default_font_family = c_webkit_settings_set_default_font_family;

/** */
alias webkit_settings_set_default_font_size = c_webkit_settings_set_default_font_size;

/** */
alias webkit_settings_set_default_monospace_font_size = c_webkit_settings_set_default_monospace_font_size;

/** */
alias webkit_settings_set_disable_web_security = c_webkit_settings_set_disable_web_security;

/** */
alias webkit_settings_set_draw_compositing_indicators = c_webkit_settings_set_draw_compositing_indicators;

/** */
alias webkit_settings_set_enable_2d_canvas_acceleration = c_webkit_settings_set_enable_2d_canvas_acceleration;

/** */
alias webkit_settings_set_enable_back_forward_navigation_gestures = c_webkit_settings_set_enable_back_forward_navigation_gestures;

/** */
alias webkit_settings_set_enable_caret_browsing = c_webkit_settings_set_enable_caret_browsing;

/** */
alias webkit_settings_set_enable_developer_extras = c_webkit_settings_set_enable_developer_extras;

/** */
alias webkit_settings_set_enable_dns_prefetching = c_webkit_settings_set_enable_dns_prefetching;

/** */
alias webkit_settings_set_enable_encrypted_media = c_webkit_settings_set_enable_encrypted_media;

/** */
alias webkit_settings_set_enable_fullscreen = c_webkit_settings_set_enable_fullscreen;

/** */
alias webkit_settings_set_enable_html5_database = c_webkit_settings_set_enable_html5_database;

/** */
alias webkit_settings_set_enable_html5_local_storage = c_webkit_settings_set_enable_html5_local_storage;

/** */
alias webkit_settings_set_enable_hyperlink_auditing = c_webkit_settings_set_enable_hyperlink_auditing;

/** */
alias webkit_settings_set_enable_javascript = c_webkit_settings_set_enable_javascript;

/** */
alias webkit_settings_set_enable_javascript_markup = c_webkit_settings_set_enable_javascript_markup;

/** */
alias webkit_settings_set_enable_media = c_webkit_settings_set_enable_media;

/** */
alias webkit_settings_set_enable_media_capabilities = c_webkit_settings_set_enable_media_capabilities;

/** */
alias webkit_settings_set_enable_media_stream = c_webkit_settings_set_enable_media_stream;

/** */
alias webkit_settings_set_enable_mediasource = c_webkit_settings_set_enable_mediasource;

/** */
alias webkit_settings_set_enable_mock_capture_devices = c_webkit_settings_set_enable_mock_capture_devices;

/** */
alias webkit_settings_set_enable_offline_web_application_cache = c_webkit_settings_set_enable_offline_web_application_cache;

/** */
alias webkit_settings_set_enable_page_cache = c_webkit_settings_set_enable_page_cache;

/** */
alias webkit_settings_set_enable_resizable_text_areas = c_webkit_settings_set_enable_resizable_text_areas;

/** */
alias webkit_settings_set_enable_site_specific_quirks = c_webkit_settings_set_enable_site_specific_quirks;

/** */
alias webkit_settings_set_enable_smooth_scrolling = c_webkit_settings_set_enable_smooth_scrolling;

/** */
alias webkit_settings_set_enable_spatial_navigation = c_webkit_settings_set_enable_spatial_navigation;

/** */
alias webkit_settings_set_enable_tabs_to_links = c_webkit_settings_set_enable_tabs_to_links;

/** */
alias webkit_settings_set_enable_webaudio = c_webkit_settings_set_enable_webaudio;

/** */
alias webkit_settings_set_enable_webgl = c_webkit_settings_set_enable_webgl;

/** */
alias webkit_settings_set_enable_webrtc = c_webkit_settings_set_enable_webrtc;

/** */
alias webkit_settings_set_enable_write_console_messages_to_stdout = c_webkit_settings_set_enable_write_console_messages_to_stdout;

/** */
alias webkit_settings_set_fantasy_font_family = c_webkit_settings_set_fantasy_font_family;

/** */
alias webkit_settings_set_feature_enabled = c_webkit_settings_set_feature_enabled;

/** */
alias webkit_settings_set_hardware_acceleration_policy = c_webkit_settings_set_hardware_acceleration_policy;

/** */
alias webkit_settings_set_javascript_can_access_clipboard = c_webkit_settings_set_javascript_can_access_clipboard;

/** */
alias webkit_settings_set_javascript_can_open_windows_automatically = c_webkit_settings_set_javascript_can_open_windows_automatically;

/** */
alias webkit_settings_set_load_icons_ignoring_image_load_setting = c_webkit_settings_set_load_icons_ignoring_image_load_setting;

/** */
alias webkit_settings_set_media_content_types_requiring_hardware_support = c_webkit_settings_set_media_content_types_requiring_hardware_support;

/** */
alias webkit_settings_set_media_playback_allows_inline = c_webkit_settings_set_media_playback_allows_inline;

/** */
alias webkit_settings_set_media_playback_requires_user_gesture = c_webkit_settings_set_media_playback_requires_user_gesture;

/** */
alias webkit_settings_set_minimum_font_size = c_webkit_settings_set_minimum_font_size;

/** */
alias webkit_settings_set_monospace_font_family = c_webkit_settings_set_monospace_font_family;

/** */
alias webkit_settings_set_pictograph_font_family = c_webkit_settings_set_pictograph_font_family;

/** */
alias webkit_settings_set_print_backgrounds = c_webkit_settings_set_print_backgrounds;

/** */
alias webkit_settings_set_sans_serif_font_family = c_webkit_settings_set_sans_serif_font_family;

/** */
alias webkit_settings_set_serif_font_family = c_webkit_settings_set_serif_font_family;

/** */
alias webkit_settings_set_user_agent = c_webkit_settings_set_user_agent;

/** */
alias webkit_settings_set_user_agent_with_application_details = c_webkit_settings_set_user_agent_with_application_details;

/** */
alias webkit_settings_set_webrtc_udp_ports_range = c_webkit_settings_set_webrtc_udp_ports_range;

/** */
alias webkit_settings_set_zoom_text_only = c_webkit_settings_set_zoom_text_only;

// URIRequest

/** */
alias webkit_uri_request_get_type = c_webkit_uri_request_get_type;

/** */
alias webkit_uri_request_new = c_webkit_uri_request_new;

/** */
alias webkit_uri_request_get_http_headers = c_webkit_uri_request_get_http_headers;

/** */
alias webkit_uri_request_get_http_method = c_webkit_uri_request_get_http_method;

/** */
alias webkit_uri_request_get_uri = c_webkit_uri_request_get_uri;

/** */
alias webkit_uri_request_set_uri = c_webkit_uri_request_set_uri;

// URIResponse

/** */
alias webkit_uri_response_get_type = c_webkit_uri_response_get_type;

/** */
alias webkit_uri_response_get_content_length = c_webkit_uri_response_get_content_length;

/** */
alias webkit_uri_response_get_http_headers = c_webkit_uri_response_get_http_headers;

/** */
alias webkit_uri_response_get_mime_type = c_webkit_uri_response_get_mime_type;

/** */
alias webkit_uri_response_get_status_code = c_webkit_uri_response_get_status_code;

/** */
alias webkit_uri_response_get_suggested_filename = c_webkit_uri_response_get_suggested_filename;

/** */
alias webkit_uri_response_get_uri = c_webkit_uri_response_get_uri;

// URISchemeRequest

/** */
alias webkit_uri_scheme_request_get_type = c_webkit_uri_scheme_request_get_type;

/** */
alias webkit_uri_scheme_request_finish = c_webkit_uri_scheme_request_finish;

/** */
alias webkit_uri_scheme_request_finish_error = c_webkit_uri_scheme_request_finish_error;

/** */
alias webkit_uri_scheme_request_finish_with_response = c_webkit_uri_scheme_request_finish_with_response;

/** */
alias webkit_uri_scheme_request_get_http_body = c_webkit_uri_scheme_request_get_http_body;

/** */
alias webkit_uri_scheme_request_get_http_headers = c_webkit_uri_scheme_request_get_http_headers;

/** */
alias webkit_uri_scheme_request_get_http_method = c_webkit_uri_scheme_request_get_http_method;

/** */
alias webkit_uri_scheme_request_get_path = c_webkit_uri_scheme_request_get_path;

/** */
alias webkit_uri_scheme_request_get_scheme = c_webkit_uri_scheme_request_get_scheme;

/** */
alias webkit_uri_scheme_request_get_uri = c_webkit_uri_scheme_request_get_uri;

/** */
alias webkit_uri_scheme_request_get_web_view = c_webkit_uri_scheme_request_get_web_view;

// URISchemeResponse

/** */
alias webkit_uri_scheme_response_get_type = c_webkit_uri_scheme_response_get_type;

/** */
alias webkit_uri_scheme_response_new = c_webkit_uri_scheme_response_new;

/** */
alias webkit_uri_scheme_response_set_content_type = c_webkit_uri_scheme_response_set_content_type;

/** */
alias webkit_uri_scheme_response_set_http_headers = c_webkit_uri_scheme_response_set_http_headers;

/** */
alias webkit_uri_scheme_response_set_status = c_webkit_uri_scheme_response_set_status;

// UserContentFilter

/** */
alias webkit_user_content_filter_get_type = c_webkit_user_content_filter_get_type;

/** */
alias webkit_user_content_filter_get_identifier = c_webkit_user_content_filter_get_identifier;

/** */
alias webkit_user_content_filter_ref = c_webkit_user_content_filter_ref;

/** */
alias webkit_user_content_filter_unref = c_webkit_user_content_filter_unref;

// UserContentFilterStore

/** */
alias webkit_user_content_filter_store_get_type = c_webkit_user_content_filter_store_get_type;

/** */
alias webkit_user_content_filter_store_new = c_webkit_user_content_filter_store_new;

/** */
alias webkit_user_content_filter_store_fetch_identifiers = c_webkit_user_content_filter_store_fetch_identifiers;

/** */
alias webkit_user_content_filter_store_fetch_identifiers_finish = c_webkit_user_content_filter_store_fetch_identifiers_finish;

/** */
alias webkit_user_content_filter_store_get_path = c_webkit_user_content_filter_store_get_path;

/** */
alias webkit_user_content_filter_store_load = c_webkit_user_content_filter_store_load;

/** */
alias webkit_user_content_filter_store_load_finish = c_webkit_user_content_filter_store_load_finish;

/** */
alias webkit_user_content_filter_store_remove = c_webkit_user_content_filter_store_remove;

/** */
alias webkit_user_content_filter_store_remove_finish = c_webkit_user_content_filter_store_remove_finish;

/** */
alias webkit_user_content_filter_store_save = c_webkit_user_content_filter_store_save;

/** */
alias webkit_user_content_filter_store_save_finish = c_webkit_user_content_filter_store_save_finish;

/** */
alias webkit_user_content_filter_store_save_from_file = c_webkit_user_content_filter_store_save_from_file;

/** */
alias webkit_user_content_filter_store_save_from_file_finish = c_webkit_user_content_filter_store_save_from_file_finish;

// UserContentManager

/** */
alias webkit_user_content_manager_get_type = c_webkit_user_content_manager_get_type;

/** */
alias webkit_user_content_manager_new = c_webkit_user_content_manager_new;

/** */
alias webkit_user_content_manager_add_filter = c_webkit_user_content_manager_add_filter;

/** */
alias webkit_user_content_manager_add_script = c_webkit_user_content_manager_add_script;

/** */
alias webkit_user_content_manager_add_style_sheet = c_webkit_user_content_manager_add_style_sheet;

/** */
alias webkit_user_content_manager_register_script_message_handler = c_webkit_user_content_manager_register_script_message_handler;

/** */
alias webkit_user_content_manager_register_script_message_handler_with_reply = c_webkit_user_content_manager_register_script_message_handler_with_reply;

/** */
alias webkit_user_content_manager_remove_all_filters = c_webkit_user_content_manager_remove_all_filters;

/** */
alias webkit_user_content_manager_remove_all_scripts = c_webkit_user_content_manager_remove_all_scripts;

/** */
alias webkit_user_content_manager_remove_all_style_sheets = c_webkit_user_content_manager_remove_all_style_sheets;

/** */
alias webkit_user_content_manager_remove_filter = c_webkit_user_content_manager_remove_filter;

/** */
alias webkit_user_content_manager_remove_filter_by_id = c_webkit_user_content_manager_remove_filter_by_id;

/** */
alias webkit_user_content_manager_remove_script = c_webkit_user_content_manager_remove_script;

/** */
alias webkit_user_content_manager_remove_style_sheet = c_webkit_user_content_manager_remove_style_sheet;

/** */
alias webkit_user_content_manager_unregister_script_message_handler = c_webkit_user_content_manager_unregister_script_message_handler;

// UserMediaPermissionRequest

/** */
alias webkit_user_media_permission_request_get_type = c_webkit_user_media_permission_request_get_type;

// UserMessage

/** */
alias webkit_user_message_get_type = c_webkit_user_message_get_type;

/** */
alias webkit_user_message_new = c_webkit_user_message_new;

/** */
alias webkit_user_message_new_with_fd_list = c_webkit_user_message_new_with_fd_list;

/** */
alias webkit_user_message_get_fd_list = c_webkit_user_message_get_fd_list;

/** */
alias webkit_user_message_get_name = c_webkit_user_message_get_name;

/** */
alias webkit_user_message_get_parameters = c_webkit_user_message_get_parameters;

/** */
alias webkit_user_message_send_reply = c_webkit_user_message_send_reply;

// UserScript

/** */
alias webkit_user_script_get_type = c_webkit_user_script_get_type;

/** */
alias webkit_user_script_new = c_webkit_user_script_new;

/** */
alias webkit_user_script_new_for_world = c_webkit_user_script_new_for_world;

/** */
alias webkit_user_script_ref = c_webkit_user_script_ref;

/** */
alias webkit_user_script_unref = c_webkit_user_script_unref;

// UserStyleSheet

/** */
alias webkit_user_style_sheet_get_type = c_webkit_user_style_sheet_get_type;

/** */
alias webkit_user_style_sheet_new = c_webkit_user_style_sheet_new;

/** */
alias webkit_user_style_sheet_new_for_world = c_webkit_user_style_sheet_new_for_world;

/** */
alias webkit_user_style_sheet_ref = c_webkit_user_style_sheet_ref;

/** */
alias webkit_user_style_sheet_unref = c_webkit_user_style_sheet_unref;

// WebContext

/** */
alias webkit_web_context_get_type = c_webkit_web_context_get_type;

/** */
alias webkit_web_context_new = c_webkit_web_context_new;

/** */
alias webkit_web_context_get_default = c_webkit_web_context_get_default;

/** */
alias webkit_web_context_add_path_to_sandbox = c_webkit_web_context_add_path_to_sandbox;

/** */
alias webkit_web_context_get_cache_model = c_webkit_web_context_get_cache_model;

/** */
alias webkit_web_context_get_geolocation_manager = c_webkit_web_context_get_geolocation_manager;

/** */
alias webkit_web_context_get_network_session_for_automation = c_webkit_web_context_get_network_session_for_automation;

/** */
alias webkit_web_context_get_security_manager = c_webkit_web_context_get_security_manager;

/** */
alias webkit_web_context_get_spell_checking_enabled = c_webkit_web_context_get_spell_checking_enabled;

/** */
alias webkit_web_context_get_spell_checking_languages = c_webkit_web_context_get_spell_checking_languages;

/** */
alias webkit_web_context_get_time_zone_override = c_webkit_web_context_get_time_zone_override;

/** */
alias webkit_web_context_initialize_notification_permissions = c_webkit_web_context_initialize_notification_permissions;

/** */
alias webkit_web_context_is_automation_allowed = c_webkit_web_context_is_automation_allowed;

/** */
alias webkit_web_context_register_uri_scheme = c_webkit_web_context_register_uri_scheme;

/** */
alias webkit_web_context_send_message_to_all_extensions = c_webkit_web_context_send_message_to_all_extensions;

/** */
alias webkit_web_context_set_automation_allowed = c_webkit_web_context_set_automation_allowed;

/** */
alias webkit_web_context_set_cache_model = c_webkit_web_context_set_cache_model;

/** */
alias webkit_web_context_set_preferred_languages = c_webkit_web_context_set_preferred_languages;

/** */
alias webkit_web_context_set_spell_checking_enabled = c_webkit_web_context_set_spell_checking_enabled;

/** */
alias webkit_web_context_set_spell_checking_languages = c_webkit_web_context_set_spell_checking_languages;

/** */
alias webkit_web_context_set_web_process_extensions_directory = c_webkit_web_context_set_web_process_extensions_directory;

/** */
alias webkit_web_context_set_web_process_extensions_initialization_user_data = c_webkit_web_context_set_web_process_extensions_initialization_user_data;

// WebExtensionMatchPattern

/** */
alias webkit_web_extension_match_pattern_get_type = c_webkit_web_extension_match_pattern_get_type;

/** */
alias webkit_web_extension_match_pattern_new_all_hosts_and_schemes = c_webkit_web_extension_match_pattern_new_all_hosts_and_schemes;

/** */
alias webkit_web_extension_match_pattern_new_all_urls = c_webkit_web_extension_match_pattern_new_all_urls;

/** */
alias webkit_web_extension_match_pattern_new_with_scheme = c_webkit_web_extension_match_pattern_new_with_scheme;

/** */
alias webkit_web_extension_match_pattern_new_with_string = c_webkit_web_extension_match_pattern_new_with_string;

/** */
alias webkit_web_extension_match_pattern_get_host = c_webkit_web_extension_match_pattern_get_host;

/** */
alias webkit_web_extension_match_pattern_get_matches_all_hosts = c_webkit_web_extension_match_pattern_get_matches_all_hosts;

/** */
alias webkit_web_extension_match_pattern_get_matches_all_urls = c_webkit_web_extension_match_pattern_get_matches_all_urls;

/** */
alias webkit_web_extension_match_pattern_get_path = c_webkit_web_extension_match_pattern_get_path;

/** */
alias webkit_web_extension_match_pattern_get_scheme = c_webkit_web_extension_match_pattern_get_scheme;

/** */
alias webkit_web_extension_match_pattern_get_string = c_webkit_web_extension_match_pattern_get_string;

/** */
alias webkit_web_extension_match_pattern_matches_pattern = c_webkit_web_extension_match_pattern_matches_pattern;

/** */
alias webkit_web_extension_match_pattern_matches_url = c_webkit_web_extension_match_pattern_matches_url;

/** */
alias webkit_web_extension_match_pattern_ref = c_webkit_web_extension_match_pattern_ref;

/** */
alias webkit_web_extension_match_pattern_unref = c_webkit_web_extension_match_pattern_unref;

/** */
alias webkit_web_extension_match_pattern_register_custom_URL_scheme = c_webkit_web_extension_match_pattern_register_custom_URL_scheme;

// WebInspector

/** */
alias webkit_web_inspector_get_type = c_webkit_web_inspector_get_type;

/** */
alias webkit_web_inspector_attach = c_webkit_web_inspector_attach;

/** */
alias webkit_web_inspector_close = c_webkit_web_inspector_close;

/** */
alias webkit_web_inspector_detach = c_webkit_web_inspector_detach;

/** */
alias webkit_web_inspector_get_attached_height = c_webkit_web_inspector_get_attached_height;

/** */
alias webkit_web_inspector_get_can_attach = c_webkit_web_inspector_get_can_attach;

/** */
alias webkit_web_inspector_get_inspected_uri = c_webkit_web_inspector_get_inspected_uri;

/** */
alias webkit_web_inspector_get_web_view = c_webkit_web_inspector_get_web_view;

/** */
alias webkit_web_inspector_is_attached = c_webkit_web_inspector_is_attached;

/** */
alias webkit_web_inspector_show = c_webkit_web_inspector_show;

// WebResource

/** */
alias webkit_web_resource_get_type = c_webkit_web_resource_get_type;

/** */
alias webkit_web_resource_get_data = c_webkit_web_resource_get_data;

/** */
alias webkit_web_resource_get_data_finish = c_webkit_web_resource_get_data_finish;

/** */
alias webkit_web_resource_get_response = c_webkit_web_resource_get_response;

/** */
alias webkit_web_resource_get_uri = c_webkit_web_resource_get_uri;

// WebView

/** */
alias webkit_web_view_get_type = c_webkit_web_view_get_type;

/** */
alias webkit_web_view_new = c_webkit_web_view_new;

/** */
alias webkit_web_view_call_async_javascript_function = c_webkit_web_view_call_async_javascript_function;

/** */
alias webkit_web_view_call_async_javascript_function_finish = c_webkit_web_view_call_async_javascript_function_finish;

/** */
alias webkit_web_view_can_execute_editing_command = c_webkit_web_view_can_execute_editing_command;

/** */
alias webkit_web_view_can_execute_editing_command_finish = c_webkit_web_view_can_execute_editing_command_finish;

/** */
alias webkit_web_view_can_go_back = c_webkit_web_view_can_go_back;

/** */
alias webkit_web_view_can_go_forward = c_webkit_web_view_can_go_forward;

/** */
alias webkit_web_view_can_show_mime_type = c_webkit_web_view_can_show_mime_type;

/** */
alias webkit_web_view_download_uri = c_webkit_web_view_download_uri;

/** */
alias webkit_web_view_evaluate_javascript = c_webkit_web_view_evaluate_javascript;

/** */
alias webkit_web_view_evaluate_javascript_finish = c_webkit_web_view_evaluate_javascript_finish;

/** */
alias webkit_web_view_execute_editing_command = c_webkit_web_view_execute_editing_command;

/** */
alias webkit_web_view_execute_editing_command_with_argument = c_webkit_web_view_execute_editing_command_with_argument;

/** */
alias webkit_web_view_get_automation_presentation_type = c_webkit_web_view_get_automation_presentation_type;

/** */
alias webkit_web_view_get_back_forward_list = c_webkit_web_view_get_back_forward_list;

/** */
alias webkit_web_view_get_background_color = c_webkit_web_view_get_background_color;

/** */
alias webkit_web_view_get_camera_capture_state = c_webkit_web_view_get_camera_capture_state;

/** */
alias webkit_web_view_get_context = c_webkit_web_view_get_context;

/** */
alias webkit_web_view_get_custom_charset = c_webkit_web_view_get_custom_charset;

/** */
alias webkit_web_view_get_default_content_security_policy = c_webkit_web_view_get_default_content_security_policy;

/** */
alias webkit_web_view_get_display_capture_state = c_webkit_web_view_get_display_capture_state;

/** */
alias webkit_web_view_get_editor_state = c_webkit_web_view_get_editor_state;

/** */
alias webkit_web_view_get_estimated_load_progress = c_webkit_web_view_get_estimated_load_progress;

/** */
alias webkit_web_view_get_favicon = c_webkit_web_view_get_favicon;

/** */
alias webkit_web_view_get_find_controller = c_webkit_web_view_get_find_controller;

/** */
alias webkit_web_view_get_input_method_context = c_webkit_web_view_get_input_method_context;

/** */
alias webkit_web_view_get_inspector = c_webkit_web_view_get_inspector;

/** */
alias webkit_web_view_get_is_muted = c_webkit_web_view_get_is_muted;

/** */
alias webkit_web_view_get_is_web_process_responsive = c_webkit_web_view_get_is_web_process_responsive;

/** */
alias webkit_web_view_get_main_resource = c_webkit_web_view_get_main_resource;

/** */
alias webkit_web_view_get_microphone_capture_state = c_webkit_web_view_get_microphone_capture_state;

/** */
alias webkit_web_view_get_network_session = c_webkit_web_view_get_network_session;

/** */
alias webkit_web_view_get_page_id = c_webkit_web_view_get_page_id;

/** */
alias webkit_web_view_get_session_state = c_webkit_web_view_get_session_state;

/** */
alias webkit_web_view_get_settings = c_webkit_web_view_get_settings;

/** */
alias webkit_web_view_get_snapshot = c_webkit_web_view_get_snapshot;

/** */
alias webkit_web_view_get_snapshot_finish = c_webkit_web_view_get_snapshot_finish;

/** */
alias webkit_web_view_get_title = c_webkit_web_view_get_title;

/** */
alias webkit_web_view_get_tls_info = c_webkit_web_view_get_tls_info;

/** */
alias webkit_web_view_get_uri = c_webkit_web_view_get_uri;

/** */
alias webkit_web_view_get_user_content_manager = c_webkit_web_view_get_user_content_manager;

/** */
alias webkit_web_view_get_web_extension_mode = c_webkit_web_view_get_web_extension_mode;

/** */
alias webkit_web_view_get_website_policies = c_webkit_web_view_get_website_policies;

/** */
alias webkit_web_view_get_window_properties = c_webkit_web_view_get_window_properties;

/** */
alias webkit_web_view_get_zoom_level = c_webkit_web_view_get_zoom_level;

/** */
alias webkit_web_view_go_back = c_webkit_web_view_go_back;

/** */
alias webkit_web_view_go_forward = c_webkit_web_view_go_forward;

/** */
alias webkit_web_view_go_to_back_forward_list_item = c_webkit_web_view_go_to_back_forward_list_item;

/** */
alias webkit_web_view_is_controlled_by_automation = c_webkit_web_view_is_controlled_by_automation;

/** */
alias webkit_web_view_is_editable = c_webkit_web_view_is_editable;

/** */
alias webkit_web_view_is_loading = c_webkit_web_view_is_loading;

/** */
alias webkit_web_view_is_playing_audio = c_webkit_web_view_is_playing_audio;

/** */
alias webkit_web_view_load_alternate_html = c_webkit_web_view_load_alternate_html;

/** */
alias webkit_web_view_load_bytes = c_webkit_web_view_load_bytes;

/** */
alias webkit_web_view_load_html = c_webkit_web_view_load_html;

/** */
alias webkit_web_view_load_plain_text = c_webkit_web_view_load_plain_text;

/** */
alias webkit_web_view_load_request = c_webkit_web_view_load_request;

/** */
alias webkit_web_view_load_uri = c_webkit_web_view_load_uri;

/** */
alias webkit_web_view_reload = c_webkit_web_view_reload;

/** */
alias webkit_web_view_reload_bypass_cache = c_webkit_web_view_reload_bypass_cache;

/** */
alias webkit_web_view_restore_session_state = c_webkit_web_view_restore_session_state;

/** */
alias webkit_web_view_save = c_webkit_web_view_save;

/** */
alias webkit_web_view_save_finish = c_webkit_web_view_save_finish;

/** */
alias webkit_web_view_save_to_file = c_webkit_web_view_save_to_file;

/** */
alias webkit_web_view_save_to_file_finish = c_webkit_web_view_save_to_file_finish;

/** */
alias webkit_web_view_send_message_to_page = c_webkit_web_view_send_message_to_page;

/** */
alias webkit_web_view_send_message_to_page_finish = c_webkit_web_view_send_message_to_page_finish;

/** */
alias webkit_web_view_set_background_color = c_webkit_web_view_set_background_color;

/** */
alias webkit_web_view_set_camera_capture_state = c_webkit_web_view_set_camera_capture_state;

/** */
alias webkit_web_view_set_cors_allowlist = c_webkit_web_view_set_cors_allowlist;

/** */
alias webkit_web_view_set_custom_charset = c_webkit_web_view_set_custom_charset;

/** */
alias webkit_web_view_set_display_capture_state = c_webkit_web_view_set_display_capture_state;

/** */
alias webkit_web_view_set_editable = c_webkit_web_view_set_editable;

/** */
alias webkit_web_view_set_input_method_context = c_webkit_web_view_set_input_method_context;

/** */
alias webkit_web_view_set_is_muted = c_webkit_web_view_set_is_muted;

/** */
alias webkit_web_view_set_microphone_capture_state = c_webkit_web_view_set_microphone_capture_state;

/** */
alias webkit_web_view_set_settings = c_webkit_web_view_set_settings;

/** */
alias webkit_web_view_set_zoom_level = c_webkit_web_view_set_zoom_level;

/** */
alias webkit_web_view_stop_loading = c_webkit_web_view_stop_loading;

/** */
alias webkit_web_view_terminate_web_process = c_webkit_web_view_terminate_web_process;

/** */
alias webkit_web_view_try_close = c_webkit_web_view_try_close;

// WebViewBase

/** */
alias webkit_web_view_base_get_type = c_webkit_web_view_base_get_type;

// WebViewSessionState

/** */
alias webkit_web_view_session_state_get_type = c_webkit_web_view_session_state_get_type;

/** */
alias webkit_web_view_session_state_new = c_webkit_web_view_session_state_new;

/** */
alias webkit_web_view_session_state_ref = c_webkit_web_view_session_state_ref;

/** */
alias webkit_web_view_session_state_serialize = c_webkit_web_view_session_state_serialize;

/** */
alias webkit_web_view_session_state_unref = c_webkit_web_view_session_state_unref;

// WebsiteData

/** */
alias webkit_website_data_get_type = c_webkit_website_data_get_type;

/** */
alias webkit_website_data_get_name = c_webkit_website_data_get_name;

/** */
alias webkit_website_data_get_size = c_webkit_website_data_get_size;

/** */
alias webkit_website_data_get_types = c_webkit_website_data_get_types;

/** */
alias webkit_website_data_ref = c_webkit_website_data_ref;

/** */
alias webkit_website_data_unref = c_webkit_website_data_unref;

// WebsiteDataAccessPermissionRequest

/** */
alias webkit_website_data_access_permission_request_get_type = c_webkit_website_data_access_permission_request_get_type;

/** */
alias webkit_website_data_access_permission_request_get_current_domain = c_webkit_website_data_access_permission_request_get_current_domain;

/** */
alias webkit_website_data_access_permission_request_get_requesting_domain = c_webkit_website_data_access_permission_request_get_requesting_domain;

// WebsiteDataManager

/** */
alias webkit_website_data_manager_get_type = c_webkit_website_data_manager_get_type;

/** */
alias webkit_website_data_manager_clear = c_webkit_website_data_manager_clear;

/** */
alias webkit_website_data_manager_clear_finish = c_webkit_website_data_manager_clear_finish;

/** */
alias webkit_website_data_manager_fetch = c_webkit_website_data_manager_fetch;

/** */
alias webkit_website_data_manager_fetch_finish = c_webkit_website_data_manager_fetch_finish;

/** */
alias webkit_website_data_manager_get_base_cache_directory = c_webkit_website_data_manager_get_base_cache_directory;

/** */
alias webkit_website_data_manager_get_base_data_directory = c_webkit_website_data_manager_get_base_data_directory;

/** */
alias webkit_website_data_manager_get_favicon_database = c_webkit_website_data_manager_get_favicon_database;

/** */
alias webkit_website_data_manager_get_favicons_enabled = c_webkit_website_data_manager_get_favicons_enabled;

/** */
alias webkit_website_data_manager_get_itp_summary = c_webkit_website_data_manager_get_itp_summary;

/** */
alias webkit_website_data_manager_get_itp_summary_finish = c_webkit_website_data_manager_get_itp_summary_finish;

/** */
alias webkit_website_data_manager_is_ephemeral = c_webkit_website_data_manager_is_ephemeral;

/** */
alias webkit_website_data_manager_remove = c_webkit_website_data_manager_remove;

/** */
alias webkit_website_data_manager_remove_finish = c_webkit_website_data_manager_remove_finish;

/** */
alias webkit_website_data_manager_set_favicons_enabled = c_webkit_website_data_manager_set_favicons_enabled;

// WebsitePolicies

/** */
alias webkit_website_policies_get_type = c_webkit_website_policies_get_type;

/** */
alias webkit_website_policies_new = c_webkit_website_policies_new;

/** */
alias webkit_website_policies_new_with_policies = c_webkit_website_policies_new_with_policies;

/** */
alias webkit_website_policies_get_autoplay_policy = c_webkit_website_policies_get_autoplay_policy;

// WindowProperties

/** */
alias webkit_window_properties_get_type = c_webkit_window_properties_get_type;

/** */
alias webkit_window_properties_get_fullscreen = c_webkit_window_properties_get_fullscreen;

/** */
alias webkit_window_properties_get_geometry = c_webkit_window_properties_get_geometry;

/** */
alias webkit_window_properties_get_locationbar_visible = c_webkit_window_properties_get_locationbar_visible;

/** */
alias webkit_window_properties_get_menubar_visible = c_webkit_window_properties_get_menubar_visible;

/** */
alias webkit_window_properties_get_resizable = c_webkit_window_properties_get_resizable;

/** */
alias webkit_window_properties_get_scrollbars_visible = c_webkit_window_properties_get_scrollbars_visible;

/** */
alias webkit_window_properties_get_statusbar_visible = c_webkit_window_properties_get_statusbar_visible;

/** */
alias webkit_window_properties_get_toolbar_visible = c_webkit_window_properties_get_toolbar_visible;

// global

/** */
alias webkit_get_major_version = c_webkit_get_major_version;

/** */
alias webkit_get_micro_version = c_webkit_get_micro_version;

/** */
alias webkit_get_minor_version = c_webkit_get_minor_version;

/** */
alias webkit_media_key_system_permission_get_name = c_webkit_media_key_system_permission_get_name;

/** */
alias webkit_uri_for_display = c_webkit_uri_for_display;

/** */
alias webkit_user_media_permission_is_for_audio_device = c_webkit_user_media_permission_is_for_audio_device;

/** */
alias webkit_user_media_permission_is_for_display_device = c_webkit_user_media_permission_is_for_display_device;

/** */
alias webkit_user_media_permission_is_for_video_device = c_webkit_user_media_permission_is_for_video_device;

// DownloadError

/** */
alias webkit_download_error_quark = c_webkit_download_error_quark;

// FaviconDatabaseError

/** */
alias webkit_favicon_database_error_quark = c_webkit_favicon_database_error_quark;

// JavascriptError

/** */
alias webkit_javascript_error_quark = c_webkit_javascript_error_quark;

// MediaError

/** */
alias webkit_media_error_quark = c_webkit_media_error_quark;

// NetworkError

/** */
alias webkit_network_error_quark = c_webkit_network_error_quark;

// PolicyError

/** */
alias webkit_policy_error_quark = c_webkit_policy_error_quark;

// PrintError

/** */
alias webkit_print_error_quark = c_webkit_print_error_quark;

// SnapshotError

/** */
alias webkit_snapshot_error_quark = c_webkit_snapshot_error_quark;

// UserContentFilterError

/** */
alias webkit_user_content_filter_error_quark = c_webkit_user_content_filter_error_quark;

// UserMessageError

/** */
alias webkit_user_message_error_quark = c_webkit_user_message_error_quark;

// WebExtensionMatchPatternError

/** */
alias webkit_web_extension_match_pattern_error_quark = c_webkit_web_extension_match_pattern_error_quark;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // ApplicationInfo
  gidLink(cast(void**)&webkit_application_info_get_type, "webkit_application_info_get_type", libs);
  gidLink(cast(void**)&webkit_application_info_new, "webkit_application_info_new", libs);
  gidLink(cast(void**)&webkit_application_info_get_name, "webkit_application_info_get_name", libs);
  gidLink(cast(void**)&webkit_application_info_get_version, "webkit_application_info_get_version", libs);
  gidLink(cast(void**)&webkit_application_info_ref, "webkit_application_info_ref", libs);
  gidLink(cast(void**)&webkit_application_info_set_name, "webkit_application_info_set_name", libs);
  gidLink(cast(void**)&webkit_application_info_set_version, "webkit_application_info_set_version", libs);
  gidLink(cast(void**)&webkit_application_info_unref, "webkit_application_info_unref", libs);

  // AuthenticationRequest
  gidLink(cast(void**)&webkit_authentication_request_get_type, "webkit_authentication_request_get_type", libs);
  gidLink(cast(void**)&webkit_authentication_request_authenticate, "webkit_authentication_request_authenticate", libs);
  gidLink(cast(void**)&webkit_authentication_request_can_save_credentials, "webkit_authentication_request_can_save_credentials", libs);
  gidLink(cast(void**)&webkit_authentication_request_cancel, "webkit_authentication_request_cancel", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_certificate_pin_flags, "webkit_authentication_request_get_certificate_pin_flags", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_host, "webkit_authentication_request_get_host", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_port, "webkit_authentication_request_get_port", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_proposed_credential, "webkit_authentication_request_get_proposed_credential", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_realm, "webkit_authentication_request_get_realm", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_scheme, "webkit_authentication_request_get_scheme", libs);
  gidLink(cast(void**)&webkit_authentication_request_get_security_origin, "webkit_authentication_request_get_security_origin", libs);
  gidLink(cast(void**)&webkit_authentication_request_is_for_proxy, "webkit_authentication_request_is_for_proxy", libs);
  gidLink(cast(void**)&webkit_authentication_request_is_retry, "webkit_authentication_request_is_retry", libs);
  gidLink(cast(void**)&webkit_authentication_request_set_can_save_credentials, "webkit_authentication_request_set_can_save_credentials", libs);
  gidLink(cast(void**)&webkit_authentication_request_set_proposed_credential, "webkit_authentication_request_set_proposed_credential", libs);

  // AutomationSession
  gidLink(cast(void**)&webkit_automation_session_get_type, "webkit_automation_session_get_type", libs);
  gidLink(cast(void**)&webkit_automation_session_get_application_info, "webkit_automation_session_get_application_info", libs);
  gidLink(cast(void**)&webkit_automation_session_get_id, "webkit_automation_session_get_id", libs);
  gidLink(cast(void**)&webkit_automation_session_set_application_info, "webkit_automation_session_set_application_info", libs);

  // BackForwardList
  gidLink(cast(void**)&webkit_back_forward_list_get_type, "webkit_back_forward_list_get_type", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_back_item, "webkit_back_forward_list_get_back_item", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_back_list, "webkit_back_forward_list_get_back_list", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_back_list_with_limit, "webkit_back_forward_list_get_back_list_with_limit", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_current_item, "webkit_back_forward_list_get_current_item", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_forward_item, "webkit_back_forward_list_get_forward_item", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_forward_list, "webkit_back_forward_list_get_forward_list", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_forward_list_with_limit, "webkit_back_forward_list_get_forward_list_with_limit", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_length, "webkit_back_forward_list_get_length", libs);
  gidLink(cast(void**)&webkit_back_forward_list_get_nth_item, "webkit_back_forward_list_get_nth_item", libs);

  // BackForwardListItem
  gidLink(cast(void**)&webkit_back_forward_list_item_get_type, "webkit_back_forward_list_item_get_type", libs);
  gidLink(cast(void**)&webkit_back_forward_list_item_get_original_uri, "webkit_back_forward_list_item_get_original_uri", libs);
  gidLink(cast(void**)&webkit_back_forward_list_item_get_title, "webkit_back_forward_list_item_get_title", libs);
  gidLink(cast(void**)&webkit_back_forward_list_item_get_uri, "webkit_back_forward_list_item_get_uri", libs);

  // ClipboardPermissionRequest
  gidLink(cast(void**)&webkit_clipboard_permission_request_get_type, "webkit_clipboard_permission_request_get_type", libs);

  // ColorChooserRequest
  gidLink(cast(void**)&webkit_color_chooser_request_get_type, "webkit_color_chooser_request_get_type", libs);
  gidLink(cast(void**)&webkit_color_chooser_request_cancel, "webkit_color_chooser_request_cancel", libs);
  gidLink(cast(void**)&webkit_color_chooser_request_finish, "webkit_color_chooser_request_finish", libs);
  gidLink(cast(void**)&webkit_color_chooser_request_get_element_rectangle, "webkit_color_chooser_request_get_element_rectangle", libs);
  gidLink(cast(void**)&webkit_color_chooser_request_get_rgba, "webkit_color_chooser_request_get_rgba", libs);
  gidLink(cast(void**)&webkit_color_chooser_request_set_rgba, "webkit_color_chooser_request_set_rgba", libs);

  // ContextMenu
  gidLink(cast(void**)&webkit_context_menu_get_type, "webkit_context_menu_get_type", libs);
  gidLink(cast(void**)&webkit_context_menu_new, "webkit_context_menu_new", libs);
  gidLink(cast(void**)&webkit_context_menu_new_with_items, "webkit_context_menu_new_with_items", libs);
  gidLink(cast(void**)&webkit_context_menu_append, "webkit_context_menu_append", libs);
  gidLink(cast(void**)&webkit_context_menu_first, "webkit_context_menu_first", libs);
  gidLink(cast(void**)&webkit_context_menu_get_event, "webkit_context_menu_get_event", libs);
  gidLink(cast(void**)&webkit_context_menu_get_item_at_position, "webkit_context_menu_get_item_at_position", libs);
  gidLink(cast(void**)&webkit_context_menu_get_items, "webkit_context_menu_get_items", libs);
  gidLink(cast(void**)&webkit_context_menu_get_n_items, "webkit_context_menu_get_n_items", libs);
  gidLink(cast(void**)&webkit_context_menu_get_user_data, "webkit_context_menu_get_user_data", libs);
  gidLink(cast(void**)&webkit_context_menu_insert, "webkit_context_menu_insert", libs);
  gidLink(cast(void**)&webkit_context_menu_last, "webkit_context_menu_last", libs);
  gidLink(cast(void**)&webkit_context_menu_move_item, "webkit_context_menu_move_item", libs);
  gidLink(cast(void**)&webkit_context_menu_prepend, "webkit_context_menu_prepend", libs);
  gidLink(cast(void**)&webkit_context_menu_remove, "webkit_context_menu_remove", libs);
  gidLink(cast(void**)&webkit_context_menu_remove_all, "webkit_context_menu_remove_all", libs);
  gidLink(cast(void**)&webkit_context_menu_set_user_data, "webkit_context_menu_set_user_data", libs);

  // ContextMenuItem
  gidLink(cast(void**)&webkit_context_menu_item_get_type, "webkit_context_menu_item_get_type", libs);
  gidLink(cast(void**)&webkit_context_menu_item_new_from_gaction, "webkit_context_menu_item_new_from_gaction", libs);
  gidLink(cast(void**)&webkit_context_menu_item_new_from_stock_action, "webkit_context_menu_item_new_from_stock_action", libs);
  gidLink(cast(void**)&webkit_context_menu_item_new_from_stock_action_with_label, "webkit_context_menu_item_new_from_stock_action_with_label", libs);
  gidLink(cast(void**)&webkit_context_menu_item_new_separator, "webkit_context_menu_item_new_separator", libs);
  gidLink(cast(void**)&webkit_context_menu_item_new_with_submenu, "webkit_context_menu_item_new_with_submenu", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_gaction, "webkit_context_menu_item_get_gaction", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_stock_action, "webkit_context_menu_item_get_stock_action", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_submenu, "webkit_context_menu_item_get_submenu", libs);
  gidLink(cast(void**)&webkit_context_menu_item_is_separator, "webkit_context_menu_item_is_separator", libs);
  gidLink(cast(void**)&webkit_context_menu_item_set_submenu, "webkit_context_menu_item_set_submenu", libs);

  // CookieManager
  gidLink(cast(void**)&webkit_cookie_manager_get_type, "webkit_cookie_manager_get_type", libs);
  gidLink(cast(void**)&webkit_cookie_manager_add_cookie, "webkit_cookie_manager_add_cookie", libs);
  gidLink(cast(void**)&webkit_cookie_manager_add_cookie_finish, "webkit_cookie_manager_add_cookie_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_delete_cookie, "webkit_cookie_manager_delete_cookie", libs);
  gidLink(cast(void**)&webkit_cookie_manager_delete_cookie_finish, "webkit_cookie_manager_delete_cookie_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_accept_policy, "webkit_cookie_manager_get_accept_policy", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_accept_policy_finish, "webkit_cookie_manager_get_accept_policy_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_all_cookies, "webkit_cookie_manager_get_all_cookies", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_all_cookies_finish, "webkit_cookie_manager_get_all_cookies_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_cookies, "webkit_cookie_manager_get_cookies", libs);
  gidLink(cast(void**)&webkit_cookie_manager_get_cookies_finish, "webkit_cookie_manager_get_cookies_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_replace_cookies, "webkit_cookie_manager_replace_cookies", libs);
  gidLink(cast(void**)&webkit_cookie_manager_replace_cookies_finish, "webkit_cookie_manager_replace_cookies_finish", libs);
  gidLink(cast(void**)&webkit_cookie_manager_set_accept_policy, "webkit_cookie_manager_set_accept_policy", libs);
  gidLink(cast(void**)&webkit_cookie_manager_set_persistent_storage, "webkit_cookie_manager_set_persistent_storage", libs);

  // Credential
  gidLink(cast(void**)&webkit_credential_get_type, "webkit_credential_get_type", libs);
  gidLink(cast(void**)&webkit_credential_new, "webkit_credential_new", libs);
  gidLink(cast(void**)&webkit_credential_new_for_certificate, "webkit_credential_new_for_certificate", libs);
  gidLink(cast(void**)&webkit_credential_new_for_certificate_pin, "webkit_credential_new_for_certificate_pin", libs);
  gidLink(cast(void**)&webkit_credential_copy, "webkit_credential_copy", libs);
  gidLink(cast(void**)&webkit_credential_free, "webkit_credential_free", libs);
  gidLink(cast(void**)&webkit_credential_get_certificate, "webkit_credential_get_certificate", libs);
  gidLink(cast(void**)&webkit_credential_get_password, "webkit_credential_get_password", libs);
  gidLink(cast(void**)&webkit_credential_get_persistence, "webkit_credential_get_persistence", libs);
  gidLink(cast(void**)&webkit_credential_get_username, "webkit_credential_get_username", libs);
  gidLink(cast(void**)&webkit_credential_has_password, "webkit_credential_has_password", libs);

  // DeviceInfoPermissionRequest
  gidLink(cast(void**)&webkit_device_info_permission_request_get_type, "webkit_device_info_permission_request_get_type", libs);

  // Download
  gidLink(cast(void**)&webkit_download_get_type, "webkit_download_get_type", libs);
  gidLink(cast(void**)&webkit_download_cancel, "webkit_download_cancel", libs);
  gidLink(cast(void**)&webkit_download_get_allow_overwrite, "webkit_download_get_allow_overwrite", libs);
  gidLink(cast(void**)&webkit_download_get_destination, "webkit_download_get_destination", libs);
  gidLink(cast(void**)&webkit_download_get_elapsed_time, "webkit_download_get_elapsed_time", libs);
  gidLink(cast(void**)&webkit_download_get_estimated_progress, "webkit_download_get_estimated_progress", libs);
  gidLink(cast(void**)&webkit_download_get_received_data_length, "webkit_download_get_received_data_length", libs);
  gidLink(cast(void**)&webkit_download_get_request, "webkit_download_get_request", libs);
  gidLink(cast(void**)&webkit_download_get_response, "webkit_download_get_response", libs);
  gidLink(cast(void**)&webkit_download_get_web_view, "webkit_download_get_web_view", libs);
  gidLink(cast(void**)&webkit_download_set_allow_overwrite, "webkit_download_set_allow_overwrite", libs);
  gidLink(cast(void**)&webkit_download_set_destination, "webkit_download_set_destination", libs);

  // EditorState
  gidLink(cast(void**)&webkit_editor_state_get_type, "webkit_editor_state_get_type", libs);
  gidLink(cast(void**)&webkit_editor_state_get_typing_attributes, "webkit_editor_state_get_typing_attributes", libs);
  gidLink(cast(void**)&webkit_editor_state_is_copy_available, "webkit_editor_state_is_copy_available", libs);
  gidLink(cast(void**)&webkit_editor_state_is_cut_available, "webkit_editor_state_is_cut_available", libs);
  gidLink(cast(void**)&webkit_editor_state_is_paste_available, "webkit_editor_state_is_paste_available", libs);
  gidLink(cast(void**)&webkit_editor_state_is_redo_available, "webkit_editor_state_is_redo_available", libs);
  gidLink(cast(void**)&webkit_editor_state_is_undo_available, "webkit_editor_state_is_undo_available", libs);

  // FaviconDatabase
  gidLink(cast(void**)&webkit_favicon_database_get_type, "webkit_favicon_database_get_type", libs);
  gidLink(cast(void**)&webkit_favicon_database_clear, "webkit_favicon_database_clear", libs);
  gidLink(cast(void**)&webkit_favicon_database_get_favicon, "webkit_favicon_database_get_favicon", libs);
  gidLink(cast(void**)&webkit_favicon_database_get_favicon_finish, "webkit_favicon_database_get_favicon_finish", libs);
  gidLink(cast(void**)&webkit_favicon_database_get_favicon_uri, "webkit_favicon_database_get_favicon_uri", libs);

  // Feature
  gidLink(cast(void**)&webkit_feature_get_type, "webkit_feature_get_type", libs);
  gidLink(cast(void**)&webkit_feature_get_category, "webkit_feature_get_category", libs);
  gidLink(cast(void**)&webkit_feature_get_default_value, "webkit_feature_get_default_value", libs);
  gidLink(cast(void**)&webkit_feature_get_details, "webkit_feature_get_details", libs);
  gidLink(cast(void**)&webkit_feature_get_identifier, "webkit_feature_get_identifier", libs);
  gidLink(cast(void**)&webkit_feature_get_name, "webkit_feature_get_name", libs);
  gidLink(cast(void**)&webkit_feature_get_status, "webkit_feature_get_status", libs);
  gidLink(cast(void**)&webkit_feature_ref, "webkit_feature_ref", libs);
  gidLink(cast(void**)&webkit_feature_unref, "webkit_feature_unref", libs);

  // FeatureList
  gidLink(cast(void**)&webkit_feature_list_get_type, "webkit_feature_list_get_type", libs);
  gidLink(cast(void**)&webkit_feature_list_get, "webkit_feature_list_get", libs);
  gidLink(cast(void**)&webkit_feature_list_get_length, "webkit_feature_list_get_length", libs);
  gidLink(cast(void**)&webkit_feature_list_ref, "webkit_feature_list_ref", libs);
  gidLink(cast(void**)&webkit_feature_list_unref, "webkit_feature_list_unref", libs);

  // FileChooserRequest
  gidLink(cast(void**)&webkit_file_chooser_request_get_type, "webkit_file_chooser_request_get_type", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_cancel, "webkit_file_chooser_request_cancel", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_get_mime_types, "webkit_file_chooser_request_get_mime_types", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_get_mime_types_filter, "webkit_file_chooser_request_get_mime_types_filter", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_get_select_multiple, "webkit_file_chooser_request_get_select_multiple", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_get_selected_files, "webkit_file_chooser_request_get_selected_files", libs);
  gidLink(cast(void**)&webkit_file_chooser_request_select_files, "webkit_file_chooser_request_select_files", libs);

  // FindController
  gidLink(cast(void**)&webkit_find_controller_get_type, "webkit_find_controller_get_type", libs);
  gidLink(cast(void**)&webkit_find_controller_count_matches, "webkit_find_controller_count_matches", libs);
  gidLink(cast(void**)&webkit_find_controller_get_max_match_count, "webkit_find_controller_get_max_match_count", libs);
  gidLink(cast(void**)&webkit_find_controller_get_options, "webkit_find_controller_get_options", libs);
  gidLink(cast(void**)&webkit_find_controller_get_search_text, "webkit_find_controller_get_search_text", libs);
  gidLink(cast(void**)&webkit_find_controller_get_web_view, "webkit_find_controller_get_web_view", libs);
  gidLink(cast(void**)&webkit_find_controller_search, "webkit_find_controller_search", libs);
  gidLink(cast(void**)&webkit_find_controller_search_finish, "webkit_find_controller_search_finish", libs);
  gidLink(cast(void**)&webkit_find_controller_search_next, "webkit_find_controller_search_next", libs);
  gidLink(cast(void**)&webkit_find_controller_search_previous, "webkit_find_controller_search_previous", libs);

  // FormSubmissionRequest
  gidLink(cast(void**)&webkit_form_submission_request_get_type, "webkit_form_submission_request_get_type", libs);
  gidLink(cast(void**)&webkit_form_submission_request_list_text_fields, "webkit_form_submission_request_list_text_fields", libs);
  gidLink(cast(void**)&webkit_form_submission_request_submit, "webkit_form_submission_request_submit", libs);

  // GeolocationManager
  gidLink(cast(void**)&webkit_geolocation_manager_get_type, "webkit_geolocation_manager_get_type", libs);
  gidLink(cast(void**)&webkit_geolocation_manager_failed, "webkit_geolocation_manager_failed", libs);
  gidLink(cast(void**)&webkit_geolocation_manager_get_enable_high_accuracy, "webkit_geolocation_manager_get_enable_high_accuracy", libs);
  gidLink(cast(void**)&webkit_geolocation_manager_update_position, "webkit_geolocation_manager_update_position", libs);

  // GeolocationPermissionRequest
  gidLink(cast(void**)&webkit_geolocation_permission_request_get_type, "webkit_geolocation_permission_request_get_type", libs);

  // GeolocationPosition
  gidLink(cast(void**)&webkit_geolocation_position_get_type, "webkit_geolocation_position_get_type", libs);
  gidLink(cast(void**)&webkit_geolocation_position_new, "webkit_geolocation_position_new", libs);
  gidLink(cast(void**)&webkit_geolocation_position_copy, "webkit_geolocation_position_copy", libs);
  gidLink(cast(void**)&webkit_geolocation_position_free, "webkit_geolocation_position_free", libs);
  gidLink(cast(void**)&webkit_geolocation_position_set_altitude, "webkit_geolocation_position_set_altitude", libs);
  gidLink(cast(void**)&webkit_geolocation_position_set_altitude_accuracy, "webkit_geolocation_position_set_altitude_accuracy", libs);
  gidLink(cast(void**)&webkit_geolocation_position_set_heading, "webkit_geolocation_position_set_heading", libs);
  gidLink(cast(void**)&webkit_geolocation_position_set_speed, "webkit_geolocation_position_set_speed", libs);
  gidLink(cast(void**)&webkit_geolocation_position_set_timestamp, "webkit_geolocation_position_set_timestamp", libs);

  // HitTestResult
  gidLink(cast(void**)&webkit_hit_test_result_get_type, "webkit_hit_test_result_get_type", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_editable, "webkit_hit_test_result_context_is_editable", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_image, "webkit_hit_test_result_context_is_image", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_link, "webkit_hit_test_result_context_is_link", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_media, "webkit_hit_test_result_context_is_media", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_scrollbar, "webkit_hit_test_result_context_is_scrollbar", libs);
  gidLink(cast(void**)&webkit_hit_test_result_context_is_selection, "webkit_hit_test_result_context_is_selection", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_context, "webkit_hit_test_result_get_context", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_image_uri, "webkit_hit_test_result_get_image_uri", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_link_label, "webkit_hit_test_result_get_link_label", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_link_title, "webkit_hit_test_result_get_link_title", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_link_uri, "webkit_hit_test_result_get_link_uri", libs);
  gidLink(cast(void**)&webkit_hit_test_result_get_media_uri, "webkit_hit_test_result_get_media_uri", libs);

  // ITPFirstParty
  gidLink(cast(void**)&webkit_itp_first_party_get_type, "webkit_itp_first_party_get_type", libs);
  gidLink(cast(void**)&webkit_itp_first_party_get_domain, "webkit_itp_first_party_get_domain", libs);
  gidLink(cast(void**)&webkit_itp_first_party_get_last_update_time, "webkit_itp_first_party_get_last_update_time", libs);
  gidLink(cast(void**)&webkit_itp_first_party_get_website_data_access_allowed, "webkit_itp_first_party_get_website_data_access_allowed", libs);
  gidLink(cast(void**)&webkit_itp_first_party_ref, "webkit_itp_first_party_ref", libs);
  gidLink(cast(void**)&webkit_itp_first_party_unref, "webkit_itp_first_party_unref", libs);

  // ITPThirdParty
  gidLink(cast(void**)&webkit_itp_third_party_get_type, "webkit_itp_third_party_get_type", libs);
  gidLink(cast(void**)&webkit_itp_third_party_get_domain, "webkit_itp_third_party_get_domain", libs);
  gidLink(cast(void**)&webkit_itp_third_party_get_first_parties, "webkit_itp_third_party_get_first_parties", libs);
  gidLink(cast(void**)&webkit_itp_third_party_ref, "webkit_itp_third_party_ref", libs);
  gidLink(cast(void**)&webkit_itp_third_party_unref, "webkit_itp_third_party_unref", libs);

  // InputMethodContext
  gidLink(cast(void**)&webkit_input_method_context_get_type, "webkit_input_method_context_get_type", libs);
  gidLink(cast(void**)&webkit_input_method_context_filter_key_event, "webkit_input_method_context_filter_key_event", libs);
  gidLink(cast(void**)&webkit_input_method_context_get_input_hints, "webkit_input_method_context_get_input_hints", libs);
  gidLink(cast(void**)&webkit_input_method_context_get_input_purpose, "webkit_input_method_context_get_input_purpose", libs);
  gidLink(cast(void**)&webkit_input_method_context_get_preedit, "webkit_input_method_context_get_preedit", libs);
  gidLink(cast(void**)&webkit_input_method_context_notify_cursor_area, "webkit_input_method_context_notify_cursor_area", libs);
  gidLink(cast(void**)&webkit_input_method_context_notify_focus_in, "webkit_input_method_context_notify_focus_in", libs);
  gidLink(cast(void**)&webkit_input_method_context_notify_focus_out, "webkit_input_method_context_notify_focus_out", libs);
  gidLink(cast(void**)&webkit_input_method_context_notify_surrounding, "webkit_input_method_context_notify_surrounding", libs);
  gidLink(cast(void**)&webkit_input_method_context_reset, "webkit_input_method_context_reset", libs);
  gidLink(cast(void**)&webkit_input_method_context_set_enable_preedit, "webkit_input_method_context_set_enable_preedit", libs);
  gidLink(cast(void**)&webkit_input_method_context_set_input_hints, "webkit_input_method_context_set_input_hints", libs);
  gidLink(cast(void**)&webkit_input_method_context_set_input_purpose, "webkit_input_method_context_set_input_purpose", libs);

  // InputMethodUnderline
  gidLink(cast(void**)&webkit_input_method_underline_get_type, "webkit_input_method_underline_get_type", libs);
  gidLink(cast(void**)&webkit_input_method_underline_new, "webkit_input_method_underline_new", libs);
  gidLink(cast(void**)&webkit_input_method_underline_copy, "webkit_input_method_underline_copy", libs);
  gidLink(cast(void**)&webkit_input_method_underline_free, "webkit_input_method_underline_free", libs);
  gidLink(cast(void**)&webkit_input_method_underline_set_color, "webkit_input_method_underline_set_color", libs);

  // MediaKeySystemPermissionRequest
  gidLink(cast(void**)&webkit_media_key_system_permission_request_get_type, "webkit_media_key_system_permission_request_get_type", libs);

  // MemoryPressureSettings
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_type, "webkit_memory_pressure_settings_get_type", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_new, "webkit_memory_pressure_settings_new", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_copy, "webkit_memory_pressure_settings_copy", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_free, "webkit_memory_pressure_settings_free", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_conservative_threshold, "webkit_memory_pressure_settings_get_conservative_threshold", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_kill_threshold, "webkit_memory_pressure_settings_get_kill_threshold", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_memory_limit, "webkit_memory_pressure_settings_get_memory_limit", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_poll_interval, "webkit_memory_pressure_settings_get_poll_interval", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_get_strict_threshold, "webkit_memory_pressure_settings_get_strict_threshold", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_set_conservative_threshold, "webkit_memory_pressure_settings_set_conservative_threshold", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_set_kill_threshold, "webkit_memory_pressure_settings_set_kill_threshold", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_set_memory_limit, "webkit_memory_pressure_settings_set_memory_limit", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_set_poll_interval, "webkit_memory_pressure_settings_set_poll_interval", libs);
  gidLink(cast(void**)&webkit_memory_pressure_settings_set_strict_threshold, "webkit_memory_pressure_settings_set_strict_threshold", libs);

  // NavigationAction
  gidLink(cast(void**)&webkit_navigation_action_get_type, "webkit_navigation_action_get_type", libs);
  gidLink(cast(void**)&webkit_navigation_action_copy, "webkit_navigation_action_copy", libs);
  gidLink(cast(void**)&webkit_navigation_action_free, "webkit_navigation_action_free", libs);
  gidLink(cast(void**)&webkit_navigation_action_get_frame_name, "webkit_navigation_action_get_frame_name", libs);
  gidLink(cast(void**)&webkit_navigation_action_get_modifiers, "webkit_navigation_action_get_modifiers", libs);
  gidLink(cast(void**)&webkit_navigation_action_get_mouse_button, "webkit_navigation_action_get_mouse_button", libs);
  gidLink(cast(void**)&webkit_navigation_action_get_navigation_type, "webkit_navigation_action_get_navigation_type", libs);
  gidLink(cast(void**)&webkit_navigation_action_get_request, "webkit_navigation_action_get_request", libs);
  gidLink(cast(void**)&webkit_navigation_action_is_redirect, "webkit_navigation_action_is_redirect", libs);
  gidLink(cast(void**)&webkit_navigation_action_is_user_gesture, "webkit_navigation_action_is_user_gesture", libs);

  // NavigationPolicyDecision
  gidLink(cast(void**)&webkit_navigation_policy_decision_get_type, "webkit_navigation_policy_decision_get_type", libs);
  gidLink(cast(void**)&webkit_navigation_policy_decision_get_navigation_action, "webkit_navigation_policy_decision_get_navigation_action", libs);

  // NetworkProxySettings
  gidLink(cast(void**)&webkit_network_proxy_settings_get_type, "webkit_network_proxy_settings_get_type", libs);
  gidLink(cast(void**)&webkit_network_proxy_settings_new, "webkit_network_proxy_settings_new", libs);
  gidLink(cast(void**)&webkit_network_proxy_settings_add_proxy_for_scheme, "webkit_network_proxy_settings_add_proxy_for_scheme", libs);
  gidLink(cast(void**)&webkit_network_proxy_settings_copy, "webkit_network_proxy_settings_copy", libs);
  gidLink(cast(void**)&webkit_network_proxy_settings_free, "webkit_network_proxy_settings_free", libs);

  // NetworkSession
  gidLink(cast(void**)&webkit_network_session_get_type, "webkit_network_session_get_type", libs);
  gidLink(cast(void**)&webkit_network_session_new, "webkit_network_session_new", libs);
  gidLink(cast(void**)&webkit_network_session_new_ephemeral, "webkit_network_session_new_ephemeral", libs);
  gidLink(cast(void**)&webkit_network_session_get_default, "webkit_network_session_get_default", libs);
  gidLink(cast(void**)&webkit_network_session_set_memory_pressure_settings, "webkit_network_session_set_memory_pressure_settings", libs);
  gidLink(cast(void**)&webkit_network_session_allow_tls_certificate_for_host, "webkit_network_session_allow_tls_certificate_for_host", libs);
  gidLink(cast(void**)&webkit_network_session_download_uri, "webkit_network_session_download_uri", libs);
  gidLink(cast(void**)&webkit_network_session_get_cookie_manager, "webkit_network_session_get_cookie_manager", libs);
  gidLink(cast(void**)&webkit_network_session_get_itp_enabled, "webkit_network_session_get_itp_enabled", libs);
  gidLink(cast(void**)&webkit_network_session_get_itp_summary, "webkit_network_session_get_itp_summary", libs);
  gidLink(cast(void**)&webkit_network_session_get_itp_summary_finish, "webkit_network_session_get_itp_summary_finish", libs);
  gidLink(cast(void**)&webkit_network_session_get_persistent_credential_storage_enabled, "webkit_network_session_get_persistent_credential_storage_enabled", libs);
  gidLink(cast(void**)&webkit_network_session_get_tls_errors_policy, "webkit_network_session_get_tls_errors_policy", libs);
  gidLink(cast(void**)&webkit_network_session_get_website_data_manager, "webkit_network_session_get_website_data_manager", libs);
  gidLink(cast(void**)&webkit_network_session_is_ephemeral, "webkit_network_session_is_ephemeral", libs);
  gidLink(cast(void**)&webkit_network_session_prefetch_dns, "webkit_network_session_prefetch_dns", libs);
  gidLink(cast(void**)&webkit_network_session_set_itp_enabled, "webkit_network_session_set_itp_enabled", libs);
  gidLink(cast(void**)&webkit_network_session_set_persistent_credential_storage_enabled, "webkit_network_session_set_persistent_credential_storage_enabled", libs);
  gidLink(cast(void**)&webkit_network_session_set_proxy_settings, "webkit_network_session_set_proxy_settings", libs);
  gidLink(cast(void**)&webkit_network_session_set_tls_errors_policy, "webkit_network_session_set_tls_errors_policy", libs);

  // Notification
  gidLink(cast(void**)&webkit_notification_get_type, "webkit_notification_get_type", libs);
  gidLink(cast(void**)&webkit_notification_clicked, "webkit_notification_clicked", libs);
  gidLink(cast(void**)&webkit_notification_close, "webkit_notification_close", libs);
  gidLink(cast(void**)&webkit_notification_get_body, "webkit_notification_get_body", libs);
  gidLink(cast(void**)&webkit_notification_get_id, "webkit_notification_get_id", libs);
  gidLink(cast(void**)&webkit_notification_get_tag, "webkit_notification_get_tag", libs);
  gidLink(cast(void**)&webkit_notification_get_title, "webkit_notification_get_title", libs);

  // NotificationPermissionRequest
  gidLink(cast(void**)&webkit_notification_permission_request_get_type, "webkit_notification_permission_request_get_type", libs);

  // OptionMenu
  gidLink(cast(void**)&webkit_option_menu_get_type, "webkit_option_menu_get_type", libs);
  gidLink(cast(void**)&webkit_option_menu_activate_item, "webkit_option_menu_activate_item", libs);
  gidLink(cast(void**)&webkit_option_menu_close, "webkit_option_menu_close", libs);
  gidLink(cast(void**)&webkit_option_menu_get_event, "webkit_option_menu_get_event", libs);
  gidLink(cast(void**)&webkit_option_menu_get_item, "webkit_option_menu_get_item", libs);
  gidLink(cast(void**)&webkit_option_menu_get_n_items, "webkit_option_menu_get_n_items", libs);
  gidLink(cast(void**)&webkit_option_menu_select_item, "webkit_option_menu_select_item", libs);

  // OptionMenuItem
  gidLink(cast(void**)&webkit_option_menu_item_get_type, "webkit_option_menu_item_get_type", libs);
  gidLink(cast(void**)&webkit_option_menu_item_copy, "webkit_option_menu_item_copy", libs);
  gidLink(cast(void**)&webkit_option_menu_item_free, "webkit_option_menu_item_free", libs);
  gidLink(cast(void**)&webkit_option_menu_item_get_label, "webkit_option_menu_item_get_label", libs);
  gidLink(cast(void**)&webkit_option_menu_item_get_tooltip, "webkit_option_menu_item_get_tooltip", libs);
  gidLink(cast(void**)&webkit_option_menu_item_is_enabled, "webkit_option_menu_item_is_enabled", libs);
  gidLink(cast(void**)&webkit_option_menu_item_is_group_child, "webkit_option_menu_item_is_group_child", libs);
  gidLink(cast(void**)&webkit_option_menu_item_is_group_label, "webkit_option_menu_item_is_group_label", libs);
  gidLink(cast(void**)&webkit_option_menu_item_is_selected, "webkit_option_menu_item_is_selected", libs);

  // PermissionRequest
  gidLink(cast(void**)&webkit_permission_request_get_type, "webkit_permission_request_get_type", libs);
  gidLink(cast(void**)&webkit_permission_request_allow, "webkit_permission_request_allow", libs);
  gidLink(cast(void**)&webkit_permission_request_deny, "webkit_permission_request_deny", libs);

  // PermissionStateQuery
  gidLink(cast(void**)&webkit_permission_state_query_get_type, "webkit_permission_state_query_get_type", libs);
  gidLink(cast(void**)&webkit_permission_state_query_finish, "webkit_permission_state_query_finish", libs);
  gidLink(cast(void**)&webkit_permission_state_query_get_name, "webkit_permission_state_query_get_name", libs);
  gidLink(cast(void**)&webkit_permission_state_query_get_security_origin, "webkit_permission_state_query_get_security_origin", libs);
  gidLink(cast(void**)&webkit_permission_state_query_ref, "webkit_permission_state_query_ref", libs);
  gidLink(cast(void**)&webkit_permission_state_query_unref, "webkit_permission_state_query_unref", libs);

  // PointerLockPermissionRequest
  gidLink(cast(void**)&webkit_pointer_lock_permission_request_get_type, "webkit_pointer_lock_permission_request_get_type", libs);

  // PolicyDecision
  gidLink(cast(void**)&webkit_policy_decision_get_type, "webkit_policy_decision_get_type", libs);
  gidLink(cast(void**)&webkit_policy_decision_download, "webkit_policy_decision_download", libs);
  gidLink(cast(void**)&webkit_policy_decision_ignore, "webkit_policy_decision_ignore", libs);
  gidLink(cast(void**)&webkit_policy_decision_use, "webkit_policy_decision_use", libs);
  gidLink(cast(void**)&webkit_policy_decision_use_with_policies, "webkit_policy_decision_use_with_policies", libs);

  // PrintOperation
  gidLink(cast(void**)&webkit_print_operation_get_type, "webkit_print_operation_get_type", libs);
  gidLink(cast(void**)&webkit_print_operation_new, "webkit_print_operation_new", libs);
  gidLink(cast(void**)&webkit_print_operation_get_page_setup, "webkit_print_operation_get_page_setup", libs);
  gidLink(cast(void**)&webkit_print_operation_get_print_settings, "webkit_print_operation_get_print_settings", libs);
  gidLink(cast(void**)&webkit_print_operation_print, "webkit_print_operation_print", libs);
  gidLink(cast(void**)&webkit_print_operation_run_dialog, "webkit_print_operation_run_dialog", libs);
  gidLink(cast(void**)&webkit_print_operation_set_page_setup, "webkit_print_operation_set_page_setup", libs);
  gidLink(cast(void**)&webkit_print_operation_set_print_settings, "webkit_print_operation_set_print_settings", libs);

  // ResponsePolicyDecision
  gidLink(cast(void**)&webkit_response_policy_decision_get_type, "webkit_response_policy_decision_get_type", libs);
  gidLink(cast(void**)&webkit_response_policy_decision_get_request, "webkit_response_policy_decision_get_request", libs);
  gidLink(cast(void**)&webkit_response_policy_decision_get_response, "webkit_response_policy_decision_get_response", libs);
  gidLink(cast(void**)&webkit_response_policy_decision_is_main_frame_main_resource, "webkit_response_policy_decision_is_main_frame_main_resource", libs);
  gidLink(cast(void**)&webkit_response_policy_decision_is_mime_type_supported, "webkit_response_policy_decision_is_mime_type_supported", libs);

  // ScriptDialog
  gidLink(cast(void**)&webkit_script_dialog_get_type, "webkit_script_dialog_get_type", libs);
  gidLink(cast(void**)&webkit_script_dialog_close, "webkit_script_dialog_close", libs);
  gidLink(cast(void**)&webkit_script_dialog_confirm_set_confirmed, "webkit_script_dialog_confirm_set_confirmed", libs);
  gidLink(cast(void**)&webkit_script_dialog_get_dialog_type, "webkit_script_dialog_get_dialog_type", libs);
  gidLink(cast(void**)&webkit_script_dialog_get_message, "webkit_script_dialog_get_message", libs);
  gidLink(cast(void**)&webkit_script_dialog_prompt_get_default_text, "webkit_script_dialog_prompt_get_default_text", libs);
  gidLink(cast(void**)&webkit_script_dialog_prompt_set_text, "webkit_script_dialog_prompt_set_text", libs);
  gidLink(cast(void**)&webkit_script_dialog_ref, "webkit_script_dialog_ref", libs);
  gidLink(cast(void**)&webkit_script_dialog_unref, "webkit_script_dialog_unref", libs);

  // ScriptMessageReply
  gidLink(cast(void**)&webkit_script_message_reply_get_type, "webkit_script_message_reply_get_type", libs);
  gidLink(cast(void**)&webkit_script_message_reply_ref, "webkit_script_message_reply_ref", libs);
  gidLink(cast(void**)&webkit_script_message_reply_return_error_message, "webkit_script_message_reply_return_error_message", libs);
  gidLink(cast(void**)&webkit_script_message_reply_return_value, "webkit_script_message_reply_return_value", libs);
  gidLink(cast(void**)&webkit_script_message_reply_unref, "webkit_script_message_reply_unref", libs);

  // SecurityManager
  gidLink(cast(void**)&webkit_security_manager_get_type, "webkit_security_manager_get_type", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_cors_enabled, "webkit_security_manager_register_uri_scheme_as_cors_enabled", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_display_isolated, "webkit_security_manager_register_uri_scheme_as_display_isolated", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_empty_document, "webkit_security_manager_register_uri_scheme_as_empty_document", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_local, "webkit_security_manager_register_uri_scheme_as_local", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_no_access, "webkit_security_manager_register_uri_scheme_as_no_access", libs);
  gidLink(cast(void**)&webkit_security_manager_register_uri_scheme_as_secure, "webkit_security_manager_register_uri_scheme_as_secure", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_cors_enabled, "webkit_security_manager_uri_scheme_is_cors_enabled", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_display_isolated, "webkit_security_manager_uri_scheme_is_display_isolated", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_empty_document, "webkit_security_manager_uri_scheme_is_empty_document", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_local, "webkit_security_manager_uri_scheme_is_local", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_no_access, "webkit_security_manager_uri_scheme_is_no_access", libs);
  gidLink(cast(void**)&webkit_security_manager_uri_scheme_is_secure, "webkit_security_manager_uri_scheme_is_secure", libs);

  // SecurityOrigin
  gidLink(cast(void**)&webkit_security_origin_get_type, "webkit_security_origin_get_type", libs);
  gidLink(cast(void**)&webkit_security_origin_new, "webkit_security_origin_new", libs);
  gidLink(cast(void**)&webkit_security_origin_new_for_uri, "webkit_security_origin_new_for_uri", libs);
  gidLink(cast(void**)&webkit_security_origin_get_host, "webkit_security_origin_get_host", libs);
  gidLink(cast(void**)&webkit_security_origin_get_port, "webkit_security_origin_get_port", libs);
  gidLink(cast(void**)&webkit_security_origin_get_protocol, "webkit_security_origin_get_protocol", libs);
  gidLink(cast(void**)&webkit_security_origin_ref, "webkit_security_origin_ref", libs);
  gidLink(cast(void**)&webkit_security_origin_to_string, "webkit_security_origin_to_string", libs);
  gidLink(cast(void**)&webkit_security_origin_unref, "webkit_security_origin_unref", libs);

  // Settings
  gidLink(cast(void**)&webkit_settings_get_type, "webkit_settings_get_type", libs);
  gidLink(cast(void**)&webkit_settings_new, "webkit_settings_new", libs);
  gidLink(cast(void**)&webkit_settings_new_with_settings, "webkit_settings_new_with_settings", libs);
  gidLink(cast(void**)&webkit_settings_font_size_to_pixels, "webkit_settings_font_size_to_pixels", libs);
  gidLink(cast(void**)&webkit_settings_font_size_to_points, "webkit_settings_font_size_to_points", libs);
  gidLink(cast(void**)&webkit_settings_get_all_features, "webkit_settings_get_all_features", libs);
  gidLink(cast(void**)&webkit_settings_get_development_features, "webkit_settings_get_development_features", libs);
  gidLink(cast(void**)&webkit_settings_get_experimental_features, "webkit_settings_get_experimental_features", libs);
  gidLink(cast(void**)&webkit_settings_apply_from_key_file, "webkit_settings_apply_from_key_file", libs);
  gidLink(cast(void**)&webkit_settings_get_allow_file_access_from_file_urls, "webkit_settings_get_allow_file_access_from_file_urls", libs);
  gidLink(cast(void**)&webkit_settings_get_allow_modal_dialogs, "webkit_settings_get_allow_modal_dialogs", libs);
  gidLink(cast(void**)&webkit_settings_get_allow_top_navigation_to_data_urls, "webkit_settings_get_allow_top_navigation_to_data_urls", libs);
  gidLink(cast(void**)&webkit_settings_get_allow_universal_access_from_file_urls, "webkit_settings_get_allow_universal_access_from_file_urls", libs);
  gidLink(cast(void**)&webkit_settings_get_auto_load_images, "webkit_settings_get_auto_load_images", libs);
  gidLink(cast(void**)&webkit_settings_get_cursive_font_family, "webkit_settings_get_cursive_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_default_charset, "webkit_settings_get_default_charset", libs);
  gidLink(cast(void**)&webkit_settings_get_default_font_family, "webkit_settings_get_default_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_default_font_size, "webkit_settings_get_default_font_size", libs);
  gidLink(cast(void**)&webkit_settings_get_default_monospace_font_size, "webkit_settings_get_default_monospace_font_size", libs);
  gidLink(cast(void**)&webkit_settings_get_disable_web_security, "webkit_settings_get_disable_web_security", libs);
  gidLink(cast(void**)&webkit_settings_get_draw_compositing_indicators, "webkit_settings_get_draw_compositing_indicators", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_2d_canvas_acceleration, "webkit_settings_get_enable_2d_canvas_acceleration", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_back_forward_navigation_gestures, "webkit_settings_get_enable_back_forward_navigation_gestures", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_caret_browsing, "webkit_settings_get_enable_caret_browsing", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_developer_extras, "webkit_settings_get_enable_developer_extras", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_dns_prefetching, "webkit_settings_get_enable_dns_prefetching", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_encrypted_media, "webkit_settings_get_enable_encrypted_media", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_fullscreen, "webkit_settings_get_enable_fullscreen", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_html5_database, "webkit_settings_get_enable_html5_database", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_html5_local_storage, "webkit_settings_get_enable_html5_local_storage", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_hyperlink_auditing, "webkit_settings_get_enable_hyperlink_auditing", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_javascript, "webkit_settings_get_enable_javascript", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_javascript_markup, "webkit_settings_get_enable_javascript_markup", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_media, "webkit_settings_get_enable_media", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_media_capabilities, "webkit_settings_get_enable_media_capabilities", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_media_stream, "webkit_settings_get_enable_media_stream", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_mediasource, "webkit_settings_get_enable_mediasource", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_mock_capture_devices, "webkit_settings_get_enable_mock_capture_devices", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_offline_web_application_cache, "webkit_settings_get_enable_offline_web_application_cache", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_page_cache, "webkit_settings_get_enable_page_cache", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_resizable_text_areas, "webkit_settings_get_enable_resizable_text_areas", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_site_specific_quirks, "webkit_settings_get_enable_site_specific_quirks", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_smooth_scrolling, "webkit_settings_get_enable_smooth_scrolling", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_spatial_navigation, "webkit_settings_get_enable_spatial_navigation", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_tabs_to_links, "webkit_settings_get_enable_tabs_to_links", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_webaudio, "webkit_settings_get_enable_webaudio", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_webgl, "webkit_settings_get_enable_webgl", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_webrtc, "webkit_settings_get_enable_webrtc", libs);
  gidLink(cast(void**)&webkit_settings_get_enable_write_console_messages_to_stdout, "webkit_settings_get_enable_write_console_messages_to_stdout", libs);
  gidLink(cast(void**)&webkit_settings_get_fantasy_font_family, "webkit_settings_get_fantasy_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_feature_enabled, "webkit_settings_get_feature_enabled", libs);
  gidLink(cast(void**)&webkit_settings_get_hardware_acceleration_policy, "webkit_settings_get_hardware_acceleration_policy", libs);
  gidLink(cast(void**)&webkit_settings_get_javascript_can_access_clipboard, "webkit_settings_get_javascript_can_access_clipboard", libs);
  gidLink(cast(void**)&webkit_settings_get_javascript_can_open_windows_automatically, "webkit_settings_get_javascript_can_open_windows_automatically", libs);
  gidLink(cast(void**)&webkit_settings_get_load_icons_ignoring_image_load_setting, "webkit_settings_get_load_icons_ignoring_image_load_setting", libs);
  gidLink(cast(void**)&webkit_settings_get_media_content_types_requiring_hardware_support, "webkit_settings_get_media_content_types_requiring_hardware_support", libs);
  gidLink(cast(void**)&webkit_settings_get_media_playback_allows_inline, "webkit_settings_get_media_playback_allows_inline", libs);
  gidLink(cast(void**)&webkit_settings_get_media_playback_requires_user_gesture, "webkit_settings_get_media_playback_requires_user_gesture", libs);
  gidLink(cast(void**)&webkit_settings_get_minimum_font_size, "webkit_settings_get_minimum_font_size", libs);
  gidLink(cast(void**)&webkit_settings_get_monospace_font_family, "webkit_settings_get_monospace_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_pictograph_font_family, "webkit_settings_get_pictograph_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_print_backgrounds, "webkit_settings_get_print_backgrounds", libs);
  gidLink(cast(void**)&webkit_settings_get_sans_serif_font_family, "webkit_settings_get_sans_serif_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_serif_font_family, "webkit_settings_get_serif_font_family", libs);
  gidLink(cast(void**)&webkit_settings_get_user_agent, "webkit_settings_get_user_agent", libs);
  gidLink(cast(void**)&webkit_settings_get_webrtc_udp_ports_range, "webkit_settings_get_webrtc_udp_ports_range", libs);
  gidLink(cast(void**)&webkit_settings_get_zoom_text_only, "webkit_settings_get_zoom_text_only", libs);
  gidLink(cast(void**)&webkit_settings_set_allow_file_access_from_file_urls, "webkit_settings_set_allow_file_access_from_file_urls", libs);
  gidLink(cast(void**)&webkit_settings_set_allow_modal_dialogs, "webkit_settings_set_allow_modal_dialogs", libs);
  gidLink(cast(void**)&webkit_settings_set_allow_top_navigation_to_data_urls, "webkit_settings_set_allow_top_navigation_to_data_urls", libs);
  gidLink(cast(void**)&webkit_settings_set_allow_universal_access_from_file_urls, "webkit_settings_set_allow_universal_access_from_file_urls", libs);
  gidLink(cast(void**)&webkit_settings_set_auto_load_images, "webkit_settings_set_auto_load_images", libs);
  gidLink(cast(void**)&webkit_settings_set_cursive_font_family, "webkit_settings_set_cursive_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_default_charset, "webkit_settings_set_default_charset", libs);
  gidLink(cast(void**)&webkit_settings_set_default_font_family, "webkit_settings_set_default_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_default_font_size, "webkit_settings_set_default_font_size", libs);
  gidLink(cast(void**)&webkit_settings_set_default_monospace_font_size, "webkit_settings_set_default_monospace_font_size", libs);
  gidLink(cast(void**)&webkit_settings_set_disable_web_security, "webkit_settings_set_disable_web_security", libs);
  gidLink(cast(void**)&webkit_settings_set_draw_compositing_indicators, "webkit_settings_set_draw_compositing_indicators", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_2d_canvas_acceleration, "webkit_settings_set_enable_2d_canvas_acceleration", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_back_forward_navigation_gestures, "webkit_settings_set_enable_back_forward_navigation_gestures", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_caret_browsing, "webkit_settings_set_enable_caret_browsing", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_developer_extras, "webkit_settings_set_enable_developer_extras", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_dns_prefetching, "webkit_settings_set_enable_dns_prefetching", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_encrypted_media, "webkit_settings_set_enable_encrypted_media", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_fullscreen, "webkit_settings_set_enable_fullscreen", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_html5_database, "webkit_settings_set_enable_html5_database", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_html5_local_storage, "webkit_settings_set_enable_html5_local_storage", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_hyperlink_auditing, "webkit_settings_set_enable_hyperlink_auditing", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_javascript, "webkit_settings_set_enable_javascript", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_javascript_markup, "webkit_settings_set_enable_javascript_markup", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_media, "webkit_settings_set_enable_media", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_media_capabilities, "webkit_settings_set_enable_media_capabilities", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_media_stream, "webkit_settings_set_enable_media_stream", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_mediasource, "webkit_settings_set_enable_mediasource", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_mock_capture_devices, "webkit_settings_set_enable_mock_capture_devices", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_offline_web_application_cache, "webkit_settings_set_enable_offline_web_application_cache", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_page_cache, "webkit_settings_set_enable_page_cache", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_resizable_text_areas, "webkit_settings_set_enable_resizable_text_areas", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_site_specific_quirks, "webkit_settings_set_enable_site_specific_quirks", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_smooth_scrolling, "webkit_settings_set_enable_smooth_scrolling", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_spatial_navigation, "webkit_settings_set_enable_spatial_navigation", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_tabs_to_links, "webkit_settings_set_enable_tabs_to_links", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_webaudio, "webkit_settings_set_enable_webaudio", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_webgl, "webkit_settings_set_enable_webgl", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_webrtc, "webkit_settings_set_enable_webrtc", libs);
  gidLink(cast(void**)&webkit_settings_set_enable_write_console_messages_to_stdout, "webkit_settings_set_enable_write_console_messages_to_stdout", libs);
  gidLink(cast(void**)&webkit_settings_set_fantasy_font_family, "webkit_settings_set_fantasy_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_feature_enabled, "webkit_settings_set_feature_enabled", libs);
  gidLink(cast(void**)&webkit_settings_set_hardware_acceleration_policy, "webkit_settings_set_hardware_acceleration_policy", libs);
  gidLink(cast(void**)&webkit_settings_set_javascript_can_access_clipboard, "webkit_settings_set_javascript_can_access_clipboard", libs);
  gidLink(cast(void**)&webkit_settings_set_javascript_can_open_windows_automatically, "webkit_settings_set_javascript_can_open_windows_automatically", libs);
  gidLink(cast(void**)&webkit_settings_set_load_icons_ignoring_image_load_setting, "webkit_settings_set_load_icons_ignoring_image_load_setting", libs);
  gidLink(cast(void**)&webkit_settings_set_media_content_types_requiring_hardware_support, "webkit_settings_set_media_content_types_requiring_hardware_support", libs);
  gidLink(cast(void**)&webkit_settings_set_media_playback_allows_inline, "webkit_settings_set_media_playback_allows_inline", libs);
  gidLink(cast(void**)&webkit_settings_set_media_playback_requires_user_gesture, "webkit_settings_set_media_playback_requires_user_gesture", libs);
  gidLink(cast(void**)&webkit_settings_set_minimum_font_size, "webkit_settings_set_minimum_font_size", libs);
  gidLink(cast(void**)&webkit_settings_set_monospace_font_family, "webkit_settings_set_monospace_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_pictograph_font_family, "webkit_settings_set_pictograph_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_print_backgrounds, "webkit_settings_set_print_backgrounds", libs);
  gidLink(cast(void**)&webkit_settings_set_sans_serif_font_family, "webkit_settings_set_sans_serif_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_serif_font_family, "webkit_settings_set_serif_font_family", libs);
  gidLink(cast(void**)&webkit_settings_set_user_agent, "webkit_settings_set_user_agent", libs);
  gidLink(cast(void**)&webkit_settings_set_user_agent_with_application_details, "webkit_settings_set_user_agent_with_application_details", libs);
  gidLink(cast(void**)&webkit_settings_set_webrtc_udp_ports_range, "webkit_settings_set_webrtc_udp_ports_range", libs);
  gidLink(cast(void**)&webkit_settings_set_zoom_text_only, "webkit_settings_set_zoom_text_only", libs);

  // URIRequest
  gidLink(cast(void**)&webkit_uri_request_get_type, "webkit_uri_request_get_type", libs);
  gidLink(cast(void**)&webkit_uri_request_new, "webkit_uri_request_new", libs);
  gidLink(cast(void**)&webkit_uri_request_get_http_headers, "webkit_uri_request_get_http_headers", libs);
  gidLink(cast(void**)&webkit_uri_request_get_http_method, "webkit_uri_request_get_http_method", libs);
  gidLink(cast(void**)&webkit_uri_request_get_uri, "webkit_uri_request_get_uri", libs);
  gidLink(cast(void**)&webkit_uri_request_set_uri, "webkit_uri_request_set_uri", libs);

  // URIResponse
  gidLink(cast(void**)&webkit_uri_response_get_type, "webkit_uri_response_get_type", libs);
  gidLink(cast(void**)&webkit_uri_response_get_content_length, "webkit_uri_response_get_content_length", libs);
  gidLink(cast(void**)&webkit_uri_response_get_http_headers, "webkit_uri_response_get_http_headers", libs);
  gidLink(cast(void**)&webkit_uri_response_get_mime_type, "webkit_uri_response_get_mime_type", libs);
  gidLink(cast(void**)&webkit_uri_response_get_status_code, "webkit_uri_response_get_status_code", libs);
  gidLink(cast(void**)&webkit_uri_response_get_suggested_filename, "webkit_uri_response_get_suggested_filename", libs);
  gidLink(cast(void**)&webkit_uri_response_get_uri, "webkit_uri_response_get_uri", libs);

  // URISchemeRequest
  gidLink(cast(void**)&webkit_uri_scheme_request_get_type, "webkit_uri_scheme_request_get_type", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_finish, "webkit_uri_scheme_request_finish", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_finish_error, "webkit_uri_scheme_request_finish_error", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_finish_with_response, "webkit_uri_scheme_request_finish_with_response", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_http_body, "webkit_uri_scheme_request_get_http_body", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_http_headers, "webkit_uri_scheme_request_get_http_headers", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_http_method, "webkit_uri_scheme_request_get_http_method", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_path, "webkit_uri_scheme_request_get_path", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_scheme, "webkit_uri_scheme_request_get_scheme", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_uri, "webkit_uri_scheme_request_get_uri", libs);
  gidLink(cast(void**)&webkit_uri_scheme_request_get_web_view, "webkit_uri_scheme_request_get_web_view", libs);

  // URISchemeResponse
  gidLink(cast(void**)&webkit_uri_scheme_response_get_type, "webkit_uri_scheme_response_get_type", libs);
  gidLink(cast(void**)&webkit_uri_scheme_response_new, "webkit_uri_scheme_response_new", libs);
  gidLink(cast(void**)&webkit_uri_scheme_response_set_content_type, "webkit_uri_scheme_response_set_content_type", libs);
  gidLink(cast(void**)&webkit_uri_scheme_response_set_http_headers, "webkit_uri_scheme_response_set_http_headers", libs);
  gidLink(cast(void**)&webkit_uri_scheme_response_set_status, "webkit_uri_scheme_response_set_status", libs);

  // UserContentFilter
  gidLink(cast(void**)&webkit_user_content_filter_get_type, "webkit_user_content_filter_get_type", libs);
  gidLink(cast(void**)&webkit_user_content_filter_get_identifier, "webkit_user_content_filter_get_identifier", libs);
  gidLink(cast(void**)&webkit_user_content_filter_ref, "webkit_user_content_filter_ref", libs);
  gidLink(cast(void**)&webkit_user_content_filter_unref, "webkit_user_content_filter_unref", libs);

  // UserContentFilterStore
  gidLink(cast(void**)&webkit_user_content_filter_store_get_type, "webkit_user_content_filter_store_get_type", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_new, "webkit_user_content_filter_store_new", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_fetch_identifiers, "webkit_user_content_filter_store_fetch_identifiers", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_fetch_identifiers_finish, "webkit_user_content_filter_store_fetch_identifiers_finish", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_get_path, "webkit_user_content_filter_store_get_path", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_load, "webkit_user_content_filter_store_load", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_load_finish, "webkit_user_content_filter_store_load_finish", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_remove, "webkit_user_content_filter_store_remove", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_remove_finish, "webkit_user_content_filter_store_remove_finish", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_save, "webkit_user_content_filter_store_save", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_save_finish, "webkit_user_content_filter_store_save_finish", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_save_from_file, "webkit_user_content_filter_store_save_from_file", libs);
  gidLink(cast(void**)&webkit_user_content_filter_store_save_from_file_finish, "webkit_user_content_filter_store_save_from_file_finish", libs);

  // UserContentManager
  gidLink(cast(void**)&webkit_user_content_manager_get_type, "webkit_user_content_manager_get_type", libs);
  gidLink(cast(void**)&webkit_user_content_manager_new, "webkit_user_content_manager_new", libs);
  gidLink(cast(void**)&webkit_user_content_manager_add_filter, "webkit_user_content_manager_add_filter", libs);
  gidLink(cast(void**)&webkit_user_content_manager_add_script, "webkit_user_content_manager_add_script", libs);
  gidLink(cast(void**)&webkit_user_content_manager_add_style_sheet, "webkit_user_content_manager_add_style_sheet", libs);
  gidLink(cast(void**)&webkit_user_content_manager_register_script_message_handler, "webkit_user_content_manager_register_script_message_handler", libs);
  gidLink(cast(void**)&webkit_user_content_manager_register_script_message_handler_with_reply, "webkit_user_content_manager_register_script_message_handler_with_reply", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_all_filters, "webkit_user_content_manager_remove_all_filters", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_all_scripts, "webkit_user_content_manager_remove_all_scripts", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_all_style_sheets, "webkit_user_content_manager_remove_all_style_sheets", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_filter, "webkit_user_content_manager_remove_filter", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_filter_by_id, "webkit_user_content_manager_remove_filter_by_id", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_script, "webkit_user_content_manager_remove_script", libs);
  gidLink(cast(void**)&webkit_user_content_manager_remove_style_sheet, "webkit_user_content_manager_remove_style_sheet", libs);
  gidLink(cast(void**)&webkit_user_content_manager_unregister_script_message_handler, "webkit_user_content_manager_unregister_script_message_handler", libs);

  // UserMediaPermissionRequest
  gidLink(cast(void**)&webkit_user_media_permission_request_get_type, "webkit_user_media_permission_request_get_type", libs);

  // UserMessage
  gidLink(cast(void**)&webkit_user_message_get_type, "webkit_user_message_get_type", libs);
  gidLink(cast(void**)&webkit_user_message_new, "webkit_user_message_new", libs);
  gidLink(cast(void**)&webkit_user_message_new_with_fd_list, "webkit_user_message_new_with_fd_list", libs);
  gidLink(cast(void**)&webkit_user_message_get_fd_list, "webkit_user_message_get_fd_list", libs);
  gidLink(cast(void**)&webkit_user_message_get_name, "webkit_user_message_get_name", libs);
  gidLink(cast(void**)&webkit_user_message_get_parameters, "webkit_user_message_get_parameters", libs);
  gidLink(cast(void**)&webkit_user_message_send_reply, "webkit_user_message_send_reply", libs);

  // UserScript
  gidLink(cast(void**)&webkit_user_script_get_type, "webkit_user_script_get_type", libs);
  gidLink(cast(void**)&webkit_user_script_new, "webkit_user_script_new", libs);
  gidLink(cast(void**)&webkit_user_script_new_for_world, "webkit_user_script_new_for_world", libs);
  gidLink(cast(void**)&webkit_user_script_ref, "webkit_user_script_ref", libs);
  gidLink(cast(void**)&webkit_user_script_unref, "webkit_user_script_unref", libs);

  // UserStyleSheet
  gidLink(cast(void**)&webkit_user_style_sheet_get_type, "webkit_user_style_sheet_get_type", libs);
  gidLink(cast(void**)&webkit_user_style_sheet_new, "webkit_user_style_sheet_new", libs);
  gidLink(cast(void**)&webkit_user_style_sheet_new_for_world, "webkit_user_style_sheet_new_for_world", libs);
  gidLink(cast(void**)&webkit_user_style_sheet_ref, "webkit_user_style_sheet_ref", libs);
  gidLink(cast(void**)&webkit_user_style_sheet_unref, "webkit_user_style_sheet_unref", libs);

  // WebContext
  gidLink(cast(void**)&webkit_web_context_get_type, "webkit_web_context_get_type", libs);
  gidLink(cast(void**)&webkit_web_context_new, "webkit_web_context_new", libs);
  gidLink(cast(void**)&webkit_web_context_get_default, "webkit_web_context_get_default", libs);
  gidLink(cast(void**)&webkit_web_context_add_path_to_sandbox, "webkit_web_context_add_path_to_sandbox", libs);
  gidLink(cast(void**)&webkit_web_context_get_cache_model, "webkit_web_context_get_cache_model", libs);
  gidLink(cast(void**)&webkit_web_context_get_geolocation_manager, "webkit_web_context_get_geolocation_manager", libs);
  gidLink(cast(void**)&webkit_web_context_get_network_session_for_automation, "webkit_web_context_get_network_session_for_automation", libs);
  gidLink(cast(void**)&webkit_web_context_get_security_manager, "webkit_web_context_get_security_manager", libs);
  gidLink(cast(void**)&webkit_web_context_get_spell_checking_enabled, "webkit_web_context_get_spell_checking_enabled", libs);
  gidLink(cast(void**)&webkit_web_context_get_spell_checking_languages, "webkit_web_context_get_spell_checking_languages", libs);
  gidLink(cast(void**)&webkit_web_context_get_time_zone_override, "webkit_web_context_get_time_zone_override", libs);
  gidLink(cast(void**)&webkit_web_context_initialize_notification_permissions, "webkit_web_context_initialize_notification_permissions", libs);
  gidLink(cast(void**)&webkit_web_context_is_automation_allowed, "webkit_web_context_is_automation_allowed", libs);
  gidLink(cast(void**)&webkit_web_context_register_uri_scheme, "webkit_web_context_register_uri_scheme", libs);
  gidLink(cast(void**)&webkit_web_context_send_message_to_all_extensions, "webkit_web_context_send_message_to_all_extensions", libs);
  gidLink(cast(void**)&webkit_web_context_set_automation_allowed, "webkit_web_context_set_automation_allowed", libs);
  gidLink(cast(void**)&webkit_web_context_set_cache_model, "webkit_web_context_set_cache_model", libs);
  gidLink(cast(void**)&webkit_web_context_set_preferred_languages, "webkit_web_context_set_preferred_languages", libs);
  gidLink(cast(void**)&webkit_web_context_set_spell_checking_enabled, "webkit_web_context_set_spell_checking_enabled", libs);
  gidLink(cast(void**)&webkit_web_context_set_spell_checking_languages, "webkit_web_context_set_spell_checking_languages", libs);
  gidLink(cast(void**)&webkit_web_context_set_web_process_extensions_directory, "webkit_web_context_set_web_process_extensions_directory", libs);
  gidLink(cast(void**)&webkit_web_context_set_web_process_extensions_initialization_user_data, "webkit_web_context_set_web_process_extensions_initialization_user_data", libs);

  // WebExtensionMatchPattern
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_type, "webkit_web_extension_match_pattern_get_type", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_new_all_hosts_and_schemes, "webkit_web_extension_match_pattern_new_all_hosts_and_schemes", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_new_all_urls, "webkit_web_extension_match_pattern_new_all_urls", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_new_with_scheme, "webkit_web_extension_match_pattern_new_with_scheme", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_new_with_string, "webkit_web_extension_match_pattern_new_with_string", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_host, "webkit_web_extension_match_pattern_get_host", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_matches_all_hosts, "webkit_web_extension_match_pattern_get_matches_all_hosts", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_matches_all_urls, "webkit_web_extension_match_pattern_get_matches_all_urls", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_path, "webkit_web_extension_match_pattern_get_path", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_scheme, "webkit_web_extension_match_pattern_get_scheme", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_get_string, "webkit_web_extension_match_pattern_get_string", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_matches_pattern, "webkit_web_extension_match_pattern_matches_pattern", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_matches_url, "webkit_web_extension_match_pattern_matches_url", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_ref, "webkit_web_extension_match_pattern_ref", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_unref, "webkit_web_extension_match_pattern_unref", libs);
  gidLink(cast(void**)&webkit_web_extension_match_pattern_register_custom_URL_scheme, "webkit_web_extension_match_pattern_register_custom_URL_scheme", libs);

  // WebInspector
  gidLink(cast(void**)&webkit_web_inspector_get_type, "webkit_web_inspector_get_type", libs);
  gidLink(cast(void**)&webkit_web_inspector_attach, "webkit_web_inspector_attach", libs);
  gidLink(cast(void**)&webkit_web_inspector_close, "webkit_web_inspector_close", libs);
  gidLink(cast(void**)&webkit_web_inspector_detach, "webkit_web_inspector_detach", libs);
  gidLink(cast(void**)&webkit_web_inspector_get_attached_height, "webkit_web_inspector_get_attached_height", libs);
  gidLink(cast(void**)&webkit_web_inspector_get_can_attach, "webkit_web_inspector_get_can_attach", libs);
  gidLink(cast(void**)&webkit_web_inspector_get_inspected_uri, "webkit_web_inspector_get_inspected_uri", libs);
  gidLink(cast(void**)&webkit_web_inspector_get_web_view, "webkit_web_inspector_get_web_view", libs);
  gidLink(cast(void**)&webkit_web_inspector_is_attached, "webkit_web_inspector_is_attached", libs);
  gidLink(cast(void**)&webkit_web_inspector_show, "webkit_web_inspector_show", libs);

  // WebResource
  gidLink(cast(void**)&webkit_web_resource_get_type, "webkit_web_resource_get_type", libs);
  gidLink(cast(void**)&webkit_web_resource_get_data, "webkit_web_resource_get_data", libs);
  gidLink(cast(void**)&webkit_web_resource_get_data_finish, "webkit_web_resource_get_data_finish", libs);
  gidLink(cast(void**)&webkit_web_resource_get_response, "webkit_web_resource_get_response", libs);
  gidLink(cast(void**)&webkit_web_resource_get_uri, "webkit_web_resource_get_uri", libs);

  // WebView
  gidLink(cast(void**)&webkit_web_view_get_type, "webkit_web_view_get_type", libs);
  gidLink(cast(void**)&webkit_web_view_new, "webkit_web_view_new", libs);
  gidLink(cast(void**)&webkit_web_view_call_async_javascript_function, "webkit_web_view_call_async_javascript_function", libs);
  gidLink(cast(void**)&webkit_web_view_call_async_javascript_function_finish, "webkit_web_view_call_async_javascript_function_finish", libs);
  gidLink(cast(void**)&webkit_web_view_can_execute_editing_command, "webkit_web_view_can_execute_editing_command", libs);
  gidLink(cast(void**)&webkit_web_view_can_execute_editing_command_finish, "webkit_web_view_can_execute_editing_command_finish", libs);
  gidLink(cast(void**)&webkit_web_view_can_go_back, "webkit_web_view_can_go_back", libs);
  gidLink(cast(void**)&webkit_web_view_can_go_forward, "webkit_web_view_can_go_forward", libs);
  gidLink(cast(void**)&webkit_web_view_can_show_mime_type, "webkit_web_view_can_show_mime_type", libs);
  gidLink(cast(void**)&webkit_web_view_download_uri, "webkit_web_view_download_uri", libs);
  gidLink(cast(void**)&webkit_web_view_evaluate_javascript, "webkit_web_view_evaluate_javascript", libs);
  gidLink(cast(void**)&webkit_web_view_evaluate_javascript_finish, "webkit_web_view_evaluate_javascript_finish", libs);
  gidLink(cast(void**)&webkit_web_view_execute_editing_command, "webkit_web_view_execute_editing_command", libs);
  gidLink(cast(void**)&webkit_web_view_execute_editing_command_with_argument, "webkit_web_view_execute_editing_command_with_argument", libs);
  gidLink(cast(void**)&webkit_web_view_get_automation_presentation_type, "webkit_web_view_get_automation_presentation_type", libs);
  gidLink(cast(void**)&webkit_web_view_get_back_forward_list, "webkit_web_view_get_back_forward_list", libs);
  gidLink(cast(void**)&webkit_web_view_get_background_color, "webkit_web_view_get_background_color", libs);
  gidLink(cast(void**)&webkit_web_view_get_camera_capture_state, "webkit_web_view_get_camera_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_get_context, "webkit_web_view_get_context", libs);
  gidLink(cast(void**)&webkit_web_view_get_custom_charset, "webkit_web_view_get_custom_charset", libs);
  gidLink(cast(void**)&webkit_web_view_get_default_content_security_policy, "webkit_web_view_get_default_content_security_policy", libs);
  gidLink(cast(void**)&webkit_web_view_get_display_capture_state, "webkit_web_view_get_display_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_get_editor_state, "webkit_web_view_get_editor_state", libs);
  gidLink(cast(void**)&webkit_web_view_get_estimated_load_progress, "webkit_web_view_get_estimated_load_progress", libs);
  gidLink(cast(void**)&webkit_web_view_get_favicon, "webkit_web_view_get_favicon", libs);
  gidLink(cast(void**)&webkit_web_view_get_find_controller, "webkit_web_view_get_find_controller", libs);
  gidLink(cast(void**)&webkit_web_view_get_input_method_context, "webkit_web_view_get_input_method_context", libs);
  gidLink(cast(void**)&webkit_web_view_get_inspector, "webkit_web_view_get_inspector", libs);
  gidLink(cast(void**)&webkit_web_view_get_is_muted, "webkit_web_view_get_is_muted", libs);
  gidLink(cast(void**)&webkit_web_view_get_is_web_process_responsive, "webkit_web_view_get_is_web_process_responsive", libs);
  gidLink(cast(void**)&webkit_web_view_get_main_resource, "webkit_web_view_get_main_resource", libs);
  gidLink(cast(void**)&webkit_web_view_get_microphone_capture_state, "webkit_web_view_get_microphone_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_get_network_session, "webkit_web_view_get_network_session", libs);
  gidLink(cast(void**)&webkit_web_view_get_page_id, "webkit_web_view_get_page_id", libs);
  gidLink(cast(void**)&webkit_web_view_get_session_state, "webkit_web_view_get_session_state", libs);
  gidLink(cast(void**)&webkit_web_view_get_settings, "webkit_web_view_get_settings", libs);
  gidLink(cast(void**)&webkit_web_view_get_snapshot, "webkit_web_view_get_snapshot", libs);
  gidLink(cast(void**)&webkit_web_view_get_snapshot_finish, "webkit_web_view_get_snapshot_finish", libs);
  gidLink(cast(void**)&webkit_web_view_get_title, "webkit_web_view_get_title", libs);
  gidLink(cast(void**)&webkit_web_view_get_tls_info, "webkit_web_view_get_tls_info", libs);
  gidLink(cast(void**)&webkit_web_view_get_uri, "webkit_web_view_get_uri", libs);
  gidLink(cast(void**)&webkit_web_view_get_user_content_manager, "webkit_web_view_get_user_content_manager", libs);
  gidLink(cast(void**)&webkit_web_view_get_web_extension_mode, "webkit_web_view_get_web_extension_mode", libs);
  gidLink(cast(void**)&webkit_web_view_get_website_policies, "webkit_web_view_get_website_policies", libs);
  gidLink(cast(void**)&webkit_web_view_get_window_properties, "webkit_web_view_get_window_properties", libs);
  gidLink(cast(void**)&webkit_web_view_get_zoom_level, "webkit_web_view_get_zoom_level", libs);
  gidLink(cast(void**)&webkit_web_view_go_back, "webkit_web_view_go_back", libs);
  gidLink(cast(void**)&webkit_web_view_go_forward, "webkit_web_view_go_forward", libs);
  gidLink(cast(void**)&webkit_web_view_go_to_back_forward_list_item, "webkit_web_view_go_to_back_forward_list_item", libs);
  gidLink(cast(void**)&webkit_web_view_is_controlled_by_automation, "webkit_web_view_is_controlled_by_automation", libs);
  gidLink(cast(void**)&webkit_web_view_is_editable, "webkit_web_view_is_editable", libs);
  gidLink(cast(void**)&webkit_web_view_is_loading, "webkit_web_view_is_loading", libs);
  gidLink(cast(void**)&webkit_web_view_is_playing_audio, "webkit_web_view_is_playing_audio", libs);
  gidLink(cast(void**)&webkit_web_view_load_alternate_html, "webkit_web_view_load_alternate_html", libs);
  gidLink(cast(void**)&webkit_web_view_load_bytes, "webkit_web_view_load_bytes", libs);
  gidLink(cast(void**)&webkit_web_view_load_html, "webkit_web_view_load_html", libs);
  gidLink(cast(void**)&webkit_web_view_load_plain_text, "webkit_web_view_load_plain_text", libs);
  gidLink(cast(void**)&webkit_web_view_load_request, "webkit_web_view_load_request", libs);
  gidLink(cast(void**)&webkit_web_view_load_uri, "webkit_web_view_load_uri", libs);
  gidLink(cast(void**)&webkit_web_view_reload, "webkit_web_view_reload", libs);
  gidLink(cast(void**)&webkit_web_view_reload_bypass_cache, "webkit_web_view_reload_bypass_cache", libs);
  gidLink(cast(void**)&webkit_web_view_restore_session_state, "webkit_web_view_restore_session_state", libs);
  gidLink(cast(void**)&webkit_web_view_save, "webkit_web_view_save", libs);
  gidLink(cast(void**)&webkit_web_view_save_finish, "webkit_web_view_save_finish", libs);
  gidLink(cast(void**)&webkit_web_view_save_to_file, "webkit_web_view_save_to_file", libs);
  gidLink(cast(void**)&webkit_web_view_save_to_file_finish, "webkit_web_view_save_to_file_finish", libs);
  gidLink(cast(void**)&webkit_web_view_send_message_to_page, "webkit_web_view_send_message_to_page", libs);
  gidLink(cast(void**)&webkit_web_view_send_message_to_page_finish, "webkit_web_view_send_message_to_page_finish", libs);
  gidLink(cast(void**)&webkit_web_view_set_background_color, "webkit_web_view_set_background_color", libs);
  gidLink(cast(void**)&webkit_web_view_set_camera_capture_state, "webkit_web_view_set_camera_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_set_cors_allowlist, "webkit_web_view_set_cors_allowlist", libs);
  gidLink(cast(void**)&webkit_web_view_set_custom_charset, "webkit_web_view_set_custom_charset", libs);
  gidLink(cast(void**)&webkit_web_view_set_display_capture_state, "webkit_web_view_set_display_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_set_editable, "webkit_web_view_set_editable", libs);
  gidLink(cast(void**)&webkit_web_view_set_input_method_context, "webkit_web_view_set_input_method_context", libs);
  gidLink(cast(void**)&webkit_web_view_set_is_muted, "webkit_web_view_set_is_muted", libs);
  gidLink(cast(void**)&webkit_web_view_set_microphone_capture_state, "webkit_web_view_set_microphone_capture_state", libs);
  gidLink(cast(void**)&webkit_web_view_set_settings, "webkit_web_view_set_settings", libs);
  gidLink(cast(void**)&webkit_web_view_set_zoom_level, "webkit_web_view_set_zoom_level", libs);
  gidLink(cast(void**)&webkit_web_view_stop_loading, "webkit_web_view_stop_loading", libs);
  gidLink(cast(void**)&webkit_web_view_terminate_web_process, "webkit_web_view_terminate_web_process", libs);
  gidLink(cast(void**)&webkit_web_view_try_close, "webkit_web_view_try_close", libs);

  // WebViewBase
  gidLink(cast(void**)&webkit_web_view_base_get_type, "webkit_web_view_base_get_type", libs);

  // WebViewSessionState
  gidLink(cast(void**)&webkit_web_view_session_state_get_type, "webkit_web_view_session_state_get_type", libs);
  gidLink(cast(void**)&webkit_web_view_session_state_new, "webkit_web_view_session_state_new", libs);
  gidLink(cast(void**)&webkit_web_view_session_state_ref, "webkit_web_view_session_state_ref", libs);
  gidLink(cast(void**)&webkit_web_view_session_state_serialize, "webkit_web_view_session_state_serialize", libs);
  gidLink(cast(void**)&webkit_web_view_session_state_unref, "webkit_web_view_session_state_unref", libs);

  // WebsiteData
  gidLink(cast(void**)&webkit_website_data_get_type, "webkit_website_data_get_type", libs);
  gidLink(cast(void**)&webkit_website_data_get_name, "webkit_website_data_get_name", libs);
  gidLink(cast(void**)&webkit_website_data_get_size, "webkit_website_data_get_size", libs);
  gidLink(cast(void**)&webkit_website_data_get_types, "webkit_website_data_get_types", libs);
  gidLink(cast(void**)&webkit_website_data_ref, "webkit_website_data_ref", libs);
  gidLink(cast(void**)&webkit_website_data_unref, "webkit_website_data_unref", libs);

  // WebsiteDataAccessPermissionRequest
  gidLink(cast(void**)&webkit_website_data_access_permission_request_get_type, "webkit_website_data_access_permission_request_get_type", libs);
  gidLink(cast(void**)&webkit_website_data_access_permission_request_get_current_domain, "webkit_website_data_access_permission_request_get_current_domain", libs);
  gidLink(cast(void**)&webkit_website_data_access_permission_request_get_requesting_domain, "webkit_website_data_access_permission_request_get_requesting_domain", libs);

  // WebsiteDataManager
  gidLink(cast(void**)&webkit_website_data_manager_get_type, "webkit_website_data_manager_get_type", libs);
  gidLink(cast(void**)&webkit_website_data_manager_clear, "webkit_website_data_manager_clear", libs);
  gidLink(cast(void**)&webkit_website_data_manager_clear_finish, "webkit_website_data_manager_clear_finish", libs);
  gidLink(cast(void**)&webkit_website_data_manager_fetch, "webkit_website_data_manager_fetch", libs);
  gidLink(cast(void**)&webkit_website_data_manager_fetch_finish, "webkit_website_data_manager_fetch_finish", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_base_cache_directory, "webkit_website_data_manager_get_base_cache_directory", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_base_data_directory, "webkit_website_data_manager_get_base_data_directory", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_favicon_database, "webkit_website_data_manager_get_favicon_database", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_favicons_enabled, "webkit_website_data_manager_get_favicons_enabled", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_itp_summary, "webkit_website_data_manager_get_itp_summary", libs);
  gidLink(cast(void**)&webkit_website_data_manager_get_itp_summary_finish, "webkit_website_data_manager_get_itp_summary_finish", libs);
  gidLink(cast(void**)&webkit_website_data_manager_is_ephemeral, "webkit_website_data_manager_is_ephemeral", libs);
  gidLink(cast(void**)&webkit_website_data_manager_remove, "webkit_website_data_manager_remove", libs);
  gidLink(cast(void**)&webkit_website_data_manager_remove_finish, "webkit_website_data_manager_remove_finish", libs);
  gidLink(cast(void**)&webkit_website_data_manager_set_favicons_enabled, "webkit_website_data_manager_set_favicons_enabled", libs);

  // WebsitePolicies
  gidLink(cast(void**)&webkit_website_policies_get_type, "webkit_website_policies_get_type", libs);
  gidLink(cast(void**)&webkit_website_policies_new, "webkit_website_policies_new", libs);
  gidLink(cast(void**)&webkit_website_policies_new_with_policies, "webkit_website_policies_new_with_policies", libs);
  gidLink(cast(void**)&webkit_website_policies_get_autoplay_policy, "webkit_website_policies_get_autoplay_policy", libs);

  // WindowProperties
  gidLink(cast(void**)&webkit_window_properties_get_type, "webkit_window_properties_get_type", libs);
  gidLink(cast(void**)&webkit_window_properties_get_fullscreen, "webkit_window_properties_get_fullscreen", libs);
  gidLink(cast(void**)&webkit_window_properties_get_geometry, "webkit_window_properties_get_geometry", libs);
  gidLink(cast(void**)&webkit_window_properties_get_locationbar_visible, "webkit_window_properties_get_locationbar_visible", libs);
  gidLink(cast(void**)&webkit_window_properties_get_menubar_visible, "webkit_window_properties_get_menubar_visible", libs);
  gidLink(cast(void**)&webkit_window_properties_get_resizable, "webkit_window_properties_get_resizable", libs);
  gidLink(cast(void**)&webkit_window_properties_get_scrollbars_visible, "webkit_window_properties_get_scrollbars_visible", libs);
  gidLink(cast(void**)&webkit_window_properties_get_statusbar_visible, "webkit_window_properties_get_statusbar_visible", libs);
  gidLink(cast(void**)&webkit_window_properties_get_toolbar_visible, "webkit_window_properties_get_toolbar_visible", libs);

  // global
  gidLink(cast(void**)&webkit_get_major_version, "webkit_get_major_version", libs);
  gidLink(cast(void**)&webkit_get_micro_version, "webkit_get_micro_version", libs);
  gidLink(cast(void**)&webkit_get_minor_version, "webkit_get_minor_version", libs);
  gidLink(cast(void**)&webkit_media_key_system_permission_get_name, "webkit_media_key_system_permission_get_name", libs);
  gidLink(cast(void**)&webkit_uri_for_display, "webkit_uri_for_display", libs);
  gidLink(cast(void**)&webkit_user_media_permission_is_for_audio_device, "webkit_user_media_permission_is_for_audio_device", libs);
  gidLink(cast(void**)&webkit_user_media_permission_is_for_display_device, "webkit_user_media_permission_is_for_display_device", libs);
  gidLink(cast(void**)&webkit_user_media_permission_is_for_video_device, "webkit_user_media_permission_is_for_video_device", libs);

  // DownloadError
  gidLink(cast(void**)&webkit_download_error_quark, "webkit_download_error_quark", libs);

  // FaviconDatabaseError
  gidLink(cast(void**)&webkit_favicon_database_error_quark, "webkit_favicon_database_error_quark", libs);

  // JavascriptError
  gidLink(cast(void**)&webkit_javascript_error_quark, "webkit_javascript_error_quark", libs);

  // MediaError
  gidLink(cast(void**)&webkit_media_error_quark, "webkit_media_error_quark", libs);

  // NetworkError
  gidLink(cast(void**)&webkit_network_error_quark, "webkit_network_error_quark", libs);

  // PolicyError
  gidLink(cast(void**)&webkit_policy_error_quark, "webkit_policy_error_quark", libs);

  // PrintError
  gidLink(cast(void**)&webkit_print_error_quark, "webkit_print_error_quark", libs);

  // SnapshotError
  gidLink(cast(void**)&webkit_snapshot_error_quark, "webkit_snapshot_error_quark", libs);

  // UserContentFilterError
  gidLink(cast(void**)&webkit_user_content_filter_error_quark, "webkit_user_content_filter_error_quark", libs);

  // UserMessageError
  gidLink(cast(void**)&webkit_user_message_error_quark, "webkit_user_message_error_quark", libs);

  // WebExtensionMatchPatternError
  gidLink(cast(void**)&webkit_web_extension_match_pattern_error_quark, "webkit_web_extension_match_pattern_error_quark", libs);
}
