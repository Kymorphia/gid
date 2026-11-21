/// C functions for webkit6 library
module gid.webkit6.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.webkit6.c.types;
public import gid.gtk4.c.types;
public import gid.javascriptcore6.c.types;
public import gid.soup3.c.types;

private immutable LIBS = ["webkitgtk-6.0_4", "javascriptcoregtk-6.0_1"];

// ApplicationInfo
private alias c_webkit_application_info_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_application_info_get_typeFn c_webkit_application_info_get_type; ///
private alias c_webkit_application_info_newFn = extern(C) WebKitApplicationInfo* function() nothrow;
__gshared c_webkit_application_info_newFn c_webkit_application_info_new; ///
private alias c_webkit_application_info_get_nameFn = extern(C) const(char)* function(WebKitApplicationInfo* info) nothrow;
__gshared c_webkit_application_info_get_nameFn c_webkit_application_info_get_name; ///
private alias c_webkit_application_info_get_versionFn = extern(C) void function(WebKitApplicationInfo* info, ulong* major, ulong* minor, ulong* micro) nothrow;
__gshared c_webkit_application_info_get_versionFn c_webkit_application_info_get_version; ///
private alias c_webkit_application_info_refFn = extern(C) WebKitApplicationInfo* function(WebKitApplicationInfo* info) nothrow;
__gshared c_webkit_application_info_refFn c_webkit_application_info_ref; ///
private alias c_webkit_application_info_set_nameFn = extern(C) void function(WebKitApplicationInfo* info, const(char)* name) nothrow;
__gshared c_webkit_application_info_set_nameFn c_webkit_application_info_set_name; ///
private alias c_webkit_application_info_set_versionFn = extern(C) void function(WebKitApplicationInfo* info, ulong major, ulong minor, ulong micro) nothrow;
__gshared c_webkit_application_info_set_versionFn c_webkit_application_info_set_version; ///
private alias c_webkit_application_info_unrefFn = extern(C) void function(WebKitApplicationInfo* info) nothrow;
__gshared c_webkit_application_info_unrefFn c_webkit_application_info_unref; ///

// AuthenticationRequest
private alias c_webkit_authentication_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_authentication_request_get_typeFn c_webkit_authentication_request_get_type; ///
private alias c_webkit_authentication_request_authenticateFn = extern(C) void function(WebKitAuthenticationRequest* request, WebKitCredential* credential) nothrow;
__gshared c_webkit_authentication_request_authenticateFn c_webkit_authentication_request_authenticate; ///
private alias c_webkit_authentication_request_can_save_credentialsFn = extern(C) gboolean function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_can_save_credentialsFn c_webkit_authentication_request_can_save_credentials; ///
private alias c_webkit_authentication_request_cancelFn = extern(C) void function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_cancelFn c_webkit_authentication_request_cancel; ///
private alias c_webkit_authentication_request_get_certificate_pin_flagsFn = extern(C) GTlsPasswordFlags function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_certificate_pin_flagsFn c_webkit_authentication_request_get_certificate_pin_flags; ///
private alias c_webkit_authentication_request_get_hostFn = extern(C) const(char)* function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_hostFn c_webkit_authentication_request_get_host; ///
private alias c_webkit_authentication_request_get_portFn = extern(C) uint function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_portFn c_webkit_authentication_request_get_port; ///
private alias c_webkit_authentication_request_get_proposed_credentialFn = extern(C) WebKitCredential* function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_proposed_credentialFn c_webkit_authentication_request_get_proposed_credential; ///
private alias c_webkit_authentication_request_get_realmFn = extern(C) const(char)* function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_realmFn c_webkit_authentication_request_get_realm; ///
private alias c_webkit_authentication_request_get_schemeFn = extern(C) WebKitAuthenticationScheme function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_schemeFn c_webkit_authentication_request_get_scheme; ///
private alias c_webkit_authentication_request_get_security_originFn = extern(C) WebKitSecurityOrigin* function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_get_security_originFn c_webkit_authentication_request_get_security_origin; ///
private alias c_webkit_authentication_request_is_for_proxyFn = extern(C) gboolean function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_is_for_proxyFn c_webkit_authentication_request_is_for_proxy; ///
private alias c_webkit_authentication_request_is_retryFn = extern(C) gboolean function(WebKitAuthenticationRequest* request) nothrow;
__gshared c_webkit_authentication_request_is_retryFn c_webkit_authentication_request_is_retry; ///
private alias c_webkit_authentication_request_set_can_save_credentialsFn = extern(C) void function(WebKitAuthenticationRequest* request, gboolean enabled) nothrow;
__gshared c_webkit_authentication_request_set_can_save_credentialsFn c_webkit_authentication_request_set_can_save_credentials; ///
private alias c_webkit_authentication_request_set_proposed_credentialFn = extern(C) void function(WebKitAuthenticationRequest* request, WebKitCredential* credential) nothrow;
__gshared c_webkit_authentication_request_set_proposed_credentialFn c_webkit_authentication_request_set_proposed_credential; ///

// AutomationSession
private alias c_webkit_automation_session_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_automation_session_get_typeFn c_webkit_automation_session_get_type; ///
private alias c_webkit_automation_session_get_application_infoFn = extern(C) WebKitApplicationInfo* function(WebKitAutomationSession* session) nothrow;
__gshared c_webkit_automation_session_get_application_infoFn c_webkit_automation_session_get_application_info; ///
private alias c_webkit_automation_session_get_idFn = extern(C) const(char)* function(WebKitAutomationSession* session) nothrow;
__gshared c_webkit_automation_session_get_idFn c_webkit_automation_session_get_id; ///
private alias c_webkit_automation_session_set_application_infoFn = extern(C) void function(WebKitAutomationSession* session, WebKitApplicationInfo* info) nothrow;
__gshared c_webkit_automation_session_set_application_infoFn c_webkit_automation_session_set_application_info; ///

// BackForwardList
private alias c_webkit_back_forward_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_back_forward_list_get_typeFn c_webkit_back_forward_list_get_type; ///
private alias c_webkit_back_forward_list_get_back_itemFn = extern(C) WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_back_itemFn c_webkit_back_forward_list_get_back_item; ///
private alias c_webkit_back_forward_list_get_back_listFn = extern(C) GList* function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_back_listFn c_webkit_back_forward_list_get_back_list; ///
private alias c_webkit_back_forward_list_get_back_list_with_limitFn = extern(C) GList* function(WebKitBackForwardList* backForwardList, uint limit) nothrow;
__gshared c_webkit_back_forward_list_get_back_list_with_limitFn c_webkit_back_forward_list_get_back_list_with_limit; ///
private alias c_webkit_back_forward_list_get_current_itemFn = extern(C) WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_current_itemFn c_webkit_back_forward_list_get_current_item; ///
private alias c_webkit_back_forward_list_get_forward_itemFn = extern(C) WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_forward_itemFn c_webkit_back_forward_list_get_forward_item; ///
private alias c_webkit_back_forward_list_get_forward_listFn = extern(C) GList* function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_forward_listFn c_webkit_back_forward_list_get_forward_list; ///
private alias c_webkit_back_forward_list_get_forward_list_with_limitFn = extern(C) GList* function(WebKitBackForwardList* backForwardList, uint limit) nothrow;
__gshared c_webkit_back_forward_list_get_forward_list_with_limitFn c_webkit_back_forward_list_get_forward_list_with_limit; ///
private alias c_webkit_back_forward_list_get_lengthFn = extern(C) uint function(WebKitBackForwardList* backForwardList) nothrow;
__gshared c_webkit_back_forward_list_get_lengthFn c_webkit_back_forward_list_get_length; ///
private alias c_webkit_back_forward_list_get_nth_itemFn = extern(C) WebKitBackForwardListItem* function(WebKitBackForwardList* backForwardList, int index) nothrow;
__gshared c_webkit_back_forward_list_get_nth_itemFn c_webkit_back_forward_list_get_nth_item; ///

// BackForwardListItem
private alias c_webkit_back_forward_list_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_back_forward_list_item_get_typeFn c_webkit_back_forward_list_item_get_type; ///
private alias c_webkit_back_forward_list_item_get_original_uriFn = extern(C) const(char)* function(WebKitBackForwardListItem* listItem) nothrow;
__gshared c_webkit_back_forward_list_item_get_original_uriFn c_webkit_back_forward_list_item_get_original_uri; ///
private alias c_webkit_back_forward_list_item_get_titleFn = extern(C) const(char)* function(WebKitBackForwardListItem* listItem) nothrow;
__gshared c_webkit_back_forward_list_item_get_titleFn c_webkit_back_forward_list_item_get_title; ///
private alias c_webkit_back_forward_list_item_get_uriFn = extern(C) const(char)* function(WebKitBackForwardListItem* listItem) nothrow;
__gshared c_webkit_back_forward_list_item_get_uriFn c_webkit_back_forward_list_item_get_uri; ///

// ClipboardPermissionRequest
private alias c_webkit_clipboard_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_clipboard_permission_request_get_typeFn c_webkit_clipboard_permission_request_get_type; ///

// ColorChooserRequest
private alias c_webkit_color_chooser_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_color_chooser_request_get_typeFn c_webkit_color_chooser_request_get_type; ///
private alias c_webkit_color_chooser_request_cancelFn = extern(C) void function(WebKitColorChooserRequest* request) nothrow;
__gshared c_webkit_color_chooser_request_cancelFn c_webkit_color_chooser_request_cancel; ///
private alias c_webkit_color_chooser_request_finishFn = extern(C) void function(WebKitColorChooserRequest* request) nothrow;
__gshared c_webkit_color_chooser_request_finishFn c_webkit_color_chooser_request_finish; ///
private alias c_webkit_color_chooser_request_get_element_rectangleFn = extern(C) void function(WebKitColorChooserRequest* request, GdkRectangle* rect) nothrow;
__gshared c_webkit_color_chooser_request_get_element_rectangleFn c_webkit_color_chooser_request_get_element_rectangle; ///
private alias c_webkit_color_chooser_request_get_rgbaFn = extern(C) void function(WebKitColorChooserRequest* request, GdkRGBA* rgba) nothrow;
__gshared c_webkit_color_chooser_request_get_rgbaFn c_webkit_color_chooser_request_get_rgba; ///
private alias c_webkit_color_chooser_request_set_rgbaFn = extern(C) void function(WebKitColorChooserRequest* request, const(GdkRGBA)* rgba) nothrow;
__gshared c_webkit_color_chooser_request_set_rgbaFn c_webkit_color_chooser_request_set_rgba; ///

// ContextMenu
private alias c_webkit_context_menu_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_context_menu_get_typeFn c_webkit_context_menu_get_type; ///
private alias c_webkit_context_menu_newFn = extern(C) WebKitContextMenu* function() nothrow;
__gshared c_webkit_context_menu_newFn c_webkit_context_menu_new; ///
private alias c_webkit_context_menu_new_with_itemsFn = extern(C) WebKitContextMenu* function(GList* items) nothrow;
__gshared c_webkit_context_menu_new_with_itemsFn c_webkit_context_menu_new_with_items; ///
private alias c_webkit_context_menu_appendFn = extern(C) void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_appendFn c_webkit_context_menu_append; ///
private alias c_webkit_context_menu_firstFn = extern(C) WebKitContextMenuItem* function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_firstFn c_webkit_context_menu_first; ///
private alias c_webkit_context_menu_get_eventFn = extern(C) GdkEvent* function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_get_eventFn c_webkit_context_menu_get_event; ///
private alias c_webkit_context_menu_get_item_at_positionFn = extern(C) WebKitContextMenuItem* function(WebKitContextMenu* menu, uint position) nothrow;
__gshared c_webkit_context_menu_get_item_at_positionFn c_webkit_context_menu_get_item_at_position; ///
private alias c_webkit_context_menu_get_itemsFn = extern(C) GList* function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_get_itemsFn c_webkit_context_menu_get_items; ///
private alias c_webkit_context_menu_get_n_itemsFn = extern(C) uint function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_get_n_itemsFn c_webkit_context_menu_get_n_items; ///
private alias c_webkit_context_menu_get_positionFn = extern(C) gboolean function(WebKitContextMenu* menu, int* x, int* y) nothrow;
__gshared c_webkit_context_menu_get_positionFn c_webkit_context_menu_get_position; ///
private alias c_webkit_context_menu_get_user_dataFn = extern(C) GVariant* function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_get_user_dataFn c_webkit_context_menu_get_user_data; ///
private alias c_webkit_context_menu_insertFn = extern(C) void function(WebKitContextMenu* menu, WebKitContextMenuItem* item, int position) nothrow;
__gshared c_webkit_context_menu_insertFn c_webkit_context_menu_insert; ///
private alias c_webkit_context_menu_lastFn = extern(C) WebKitContextMenuItem* function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_lastFn c_webkit_context_menu_last; ///
private alias c_webkit_context_menu_move_itemFn = extern(C) void function(WebKitContextMenu* menu, WebKitContextMenuItem* item, int position) nothrow;
__gshared c_webkit_context_menu_move_itemFn c_webkit_context_menu_move_item; ///
private alias c_webkit_context_menu_prependFn = extern(C) void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_prependFn c_webkit_context_menu_prepend; ///
private alias c_webkit_context_menu_removeFn = extern(C) void function(WebKitContextMenu* menu, WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_removeFn c_webkit_context_menu_remove; ///
private alias c_webkit_context_menu_remove_allFn = extern(C) void function(WebKitContextMenu* menu) nothrow;
__gshared c_webkit_context_menu_remove_allFn c_webkit_context_menu_remove_all; ///
private alias c_webkit_context_menu_set_user_dataFn = extern(C) void function(WebKitContextMenu* menu, GVariant* userData) nothrow;
__gshared c_webkit_context_menu_set_user_dataFn c_webkit_context_menu_set_user_data; ///

// ContextMenuItem
private alias c_webkit_context_menu_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_context_menu_item_get_typeFn c_webkit_context_menu_item_get_type; ///
private alias c_webkit_context_menu_item_new_from_gactionFn = extern(C) WebKitContextMenuItem* function(GAction* action, const(char)* label, GVariant* target) nothrow;
__gshared c_webkit_context_menu_item_new_from_gactionFn c_webkit_context_menu_item_new_from_gaction; ///
private alias c_webkit_context_menu_item_new_from_stock_actionFn = extern(C) WebKitContextMenuItem* function(WebKitContextMenuAction action) nothrow;
__gshared c_webkit_context_menu_item_new_from_stock_actionFn c_webkit_context_menu_item_new_from_stock_action; ///
private alias c_webkit_context_menu_item_new_from_stock_action_with_labelFn = extern(C) WebKitContextMenuItem* function(WebKitContextMenuAction action, const(char)* label) nothrow;
__gshared c_webkit_context_menu_item_new_from_stock_action_with_labelFn c_webkit_context_menu_item_new_from_stock_action_with_label; ///
private alias c_webkit_context_menu_item_new_separatorFn = extern(C) WebKitContextMenuItem* function() nothrow;
__gshared c_webkit_context_menu_item_new_separatorFn c_webkit_context_menu_item_new_separator; ///
private alias c_webkit_context_menu_item_new_with_submenuFn = extern(C) WebKitContextMenuItem* function(const(char)* label, WebKitContextMenu* submenu) nothrow;
__gshared c_webkit_context_menu_item_new_with_submenuFn c_webkit_context_menu_item_new_with_submenu; ///
private alias c_webkit_context_menu_item_get_gactionFn = extern(C) GAction* function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_get_gactionFn c_webkit_context_menu_item_get_gaction; ///
private alias c_webkit_context_menu_item_get_gaction_targetFn = extern(C) GVariant* function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_get_gaction_targetFn c_webkit_context_menu_item_get_gaction_target; ///
private alias c_webkit_context_menu_item_get_stock_actionFn = extern(C) WebKitContextMenuAction function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_get_stock_actionFn c_webkit_context_menu_item_get_stock_action; ///
private alias c_webkit_context_menu_item_get_submenuFn = extern(C) WebKitContextMenu* function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_get_submenuFn c_webkit_context_menu_item_get_submenu; ///
private alias c_webkit_context_menu_item_get_titleFn = extern(C) const(char)* function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_get_titleFn c_webkit_context_menu_item_get_title; ///
private alias c_webkit_context_menu_item_is_separatorFn = extern(C) gboolean function(WebKitContextMenuItem* item) nothrow;
__gshared c_webkit_context_menu_item_is_separatorFn c_webkit_context_menu_item_is_separator; ///
private alias c_webkit_context_menu_item_set_submenuFn = extern(C) void function(WebKitContextMenuItem* item, WebKitContextMenu* submenu) nothrow;
__gshared c_webkit_context_menu_item_set_submenuFn c_webkit_context_menu_item_set_submenu; ///

// CookieManager
private alias c_webkit_cookie_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_cookie_manager_get_typeFn c_webkit_cookie_manager_get_type; ///
private alias c_webkit_cookie_manager_add_cookieFn = extern(C) void function(WebKitCookieManager* cookieManager, SoupCookie* cookie, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_add_cookieFn c_webkit_cookie_manager_add_cookie; ///
private alias c_webkit_cookie_manager_add_cookie_finishFn = extern(C) gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_add_cookie_finishFn c_webkit_cookie_manager_add_cookie_finish; ///
private alias c_webkit_cookie_manager_delete_cookieFn = extern(C) void function(WebKitCookieManager* cookieManager, SoupCookie* cookie, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_delete_cookieFn c_webkit_cookie_manager_delete_cookie; ///
private alias c_webkit_cookie_manager_delete_cookie_finishFn = extern(C) gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_delete_cookie_finishFn c_webkit_cookie_manager_delete_cookie_finish; ///
private alias c_webkit_cookie_manager_get_accept_policyFn = extern(C) void function(WebKitCookieManager* cookieManager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_get_accept_policyFn c_webkit_cookie_manager_get_accept_policy; ///
private alias c_webkit_cookie_manager_get_accept_policy_finishFn = extern(C) WebKitCookieAcceptPolicy function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_get_accept_policy_finishFn c_webkit_cookie_manager_get_accept_policy_finish; ///
private alias c_webkit_cookie_manager_get_all_cookiesFn = extern(C) void function(WebKitCookieManager* cookieManager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_get_all_cookiesFn c_webkit_cookie_manager_get_all_cookies; ///
private alias c_webkit_cookie_manager_get_all_cookies_finishFn = extern(C) GList* function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_get_all_cookies_finishFn c_webkit_cookie_manager_get_all_cookies_finish; ///
private alias c_webkit_cookie_manager_get_cookiesFn = extern(C) void function(WebKitCookieManager* cookieManager, const(char)* uri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_get_cookiesFn c_webkit_cookie_manager_get_cookies; ///
private alias c_webkit_cookie_manager_get_cookies_finishFn = extern(C) GList* function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_get_cookies_finishFn c_webkit_cookie_manager_get_cookies_finish; ///
private alias c_webkit_cookie_manager_replace_cookiesFn = extern(C) void function(WebKitCookieManager* cookieManager, GList* cookies, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_cookie_manager_replace_cookiesFn c_webkit_cookie_manager_replace_cookies; ///
private alias c_webkit_cookie_manager_replace_cookies_finishFn = extern(C) gboolean function(WebKitCookieManager* cookieManager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_cookie_manager_replace_cookies_finishFn c_webkit_cookie_manager_replace_cookies_finish; ///
private alias c_webkit_cookie_manager_set_accept_policyFn = extern(C) void function(WebKitCookieManager* cookieManager, WebKitCookieAcceptPolicy policy) nothrow;
__gshared c_webkit_cookie_manager_set_accept_policyFn c_webkit_cookie_manager_set_accept_policy; ///
private alias c_webkit_cookie_manager_set_persistent_storageFn = extern(C) void function(WebKitCookieManager* cookieManager, const(char)* filename, WebKitCookiePersistentStorage storage) nothrow;
__gshared c_webkit_cookie_manager_set_persistent_storageFn c_webkit_cookie_manager_set_persistent_storage; ///

// Credential
private alias c_webkit_credential_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_credential_get_typeFn c_webkit_credential_get_type; ///
private alias c_webkit_credential_newFn = extern(C) WebKitCredential* function(const(char)* username, const(char)* password, WebKitCredentialPersistence persistence) nothrow;
__gshared c_webkit_credential_newFn c_webkit_credential_new; ///
private alias c_webkit_credential_new_for_certificateFn = extern(C) WebKitCredential* function(GTlsCertificate* certificate, WebKitCredentialPersistence persistence) nothrow;
__gshared c_webkit_credential_new_for_certificateFn c_webkit_credential_new_for_certificate; ///
private alias c_webkit_credential_new_for_certificate_pinFn = extern(C) WebKitCredential* function(const(char)* pin, WebKitCredentialPersistence persistence) nothrow;
__gshared c_webkit_credential_new_for_certificate_pinFn c_webkit_credential_new_for_certificate_pin; ///
private alias c_webkit_credential_copyFn = extern(C) WebKitCredential* function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_copyFn c_webkit_credential_copy; ///
private alias c_webkit_credential_freeFn = extern(C) void function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_freeFn c_webkit_credential_free; ///
private alias c_webkit_credential_get_certificateFn = extern(C) GTlsCertificate* function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_get_certificateFn c_webkit_credential_get_certificate; ///
private alias c_webkit_credential_get_passwordFn = extern(C) const(char)* function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_get_passwordFn c_webkit_credential_get_password; ///
private alias c_webkit_credential_get_persistenceFn = extern(C) WebKitCredentialPersistence function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_get_persistenceFn c_webkit_credential_get_persistence; ///
private alias c_webkit_credential_get_usernameFn = extern(C) const(char)* function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_get_usernameFn c_webkit_credential_get_username; ///
private alias c_webkit_credential_has_passwordFn = extern(C) gboolean function(WebKitCredential* credential) nothrow;
__gshared c_webkit_credential_has_passwordFn c_webkit_credential_has_password; ///

// DeviceInfoPermissionRequest
private alias c_webkit_device_info_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_device_info_permission_request_get_typeFn c_webkit_device_info_permission_request_get_type; ///

// Download
private alias c_webkit_download_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_download_get_typeFn c_webkit_download_get_type; ///
private alias c_webkit_download_cancelFn = extern(C) void function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_cancelFn c_webkit_download_cancel; ///
private alias c_webkit_download_get_allow_overwriteFn = extern(C) gboolean function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_allow_overwriteFn c_webkit_download_get_allow_overwrite; ///
private alias c_webkit_download_get_destinationFn = extern(C) const(char)* function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_destinationFn c_webkit_download_get_destination; ///
private alias c_webkit_download_get_elapsed_timeFn = extern(C) double function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_elapsed_timeFn c_webkit_download_get_elapsed_time; ///
private alias c_webkit_download_get_estimated_progressFn = extern(C) double function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_estimated_progressFn c_webkit_download_get_estimated_progress; ///
private alias c_webkit_download_get_received_data_lengthFn = extern(C) ulong function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_received_data_lengthFn c_webkit_download_get_received_data_length; ///
private alias c_webkit_download_get_requestFn = extern(C) WebKitURIRequest* function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_requestFn c_webkit_download_get_request; ///
private alias c_webkit_download_get_responseFn = extern(C) WebKitURIResponse* function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_responseFn c_webkit_download_get_response; ///
private alias c_webkit_download_get_web_viewFn = extern(C) WebKitWebView* function(WebKitDownload* download) nothrow;
__gshared c_webkit_download_get_web_viewFn c_webkit_download_get_web_view; ///
private alias c_webkit_download_set_allow_overwriteFn = extern(C) void function(WebKitDownload* download, gboolean allowed) nothrow;
__gshared c_webkit_download_set_allow_overwriteFn c_webkit_download_set_allow_overwrite; ///
private alias c_webkit_download_set_destinationFn = extern(C) void function(WebKitDownload* download, const(char)* destination) nothrow;
__gshared c_webkit_download_set_destinationFn c_webkit_download_set_destination; ///

// EditorState
private alias c_webkit_editor_state_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_editor_state_get_typeFn c_webkit_editor_state_get_type; ///
private alias c_webkit_editor_state_get_typing_attributesFn = extern(C) uint function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_get_typing_attributesFn c_webkit_editor_state_get_typing_attributes; ///
private alias c_webkit_editor_state_is_copy_availableFn = extern(C) gboolean function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_is_copy_availableFn c_webkit_editor_state_is_copy_available; ///
private alias c_webkit_editor_state_is_cut_availableFn = extern(C) gboolean function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_is_cut_availableFn c_webkit_editor_state_is_cut_available; ///
private alias c_webkit_editor_state_is_paste_availableFn = extern(C) gboolean function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_is_paste_availableFn c_webkit_editor_state_is_paste_available; ///
private alias c_webkit_editor_state_is_redo_availableFn = extern(C) gboolean function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_is_redo_availableFn c_webkit_editor_state_is_redo_available; ///
private alias c_webkit_editor_state_is_undo_availableFn = extern(C) gboolean function(WebKitEditorState* editorState) nothrow;
__gshared c_webkit_editor_state_is_undo_availableFn c_webkit_editor_state_is_undo_available; ///

// FaviconDatabase
private alias c_webkit_favicon_database_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_favicon_database_get_typeFn c_webkit_favicon_database_get_type; ///
private alias c_webkit_favicon_database_clearFn = extern(C) void function(WebKitFaviconDatabase* database) nothrow;
__gshared c_webkit_favicon_database_clearFn c_webkit_favicon_database_clear; ///
private alias c_webkit_favicon_database_get_faviconFn = extern(C) void function(WebKitFaviconDatabase* database, const(char)* pageUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_favicon_database_get_faviconFn c_webkit_favicon_database_get_favicon; ///
private alias c_webkit_favicon_database_get_favicon_finishFn = extern(C) GdkTexture* function(WebKitFaviconDatabase* database, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_favicon_database_get_favicon_finishFn c_webkit_favicon_database_get_favicon_finish; ///
private alias c_webkit_favicon_database_get_favicon_uriFn = extern(C) char* function(WebKitFaviconDatabase* database, const(char)* pageUri) nothrow;
__gshared c_webkit_favicon_database_get_favicon_uriFn c_webkit_favicon_database_get_favicon_uri; ///

// Feature
private alias c_webkit_feature_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_feature_get_typeFn c_webkit_feature_get_type; ///
private alias c_webkit_feature_get_categoryFn = extern(C) const(char)* function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_categoryFn c_webkit_feature_get_category; ///
private alias c_webkit_feature_get_default_valueFn = extern(C) gboolean function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_default_valueFn c_webkit_feature_get_default_value; ///
private alias c_webkit_feature_get_detailsFn = extern(C) const(char)* function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_detailsFn c_webkit_feature_get_details; ///
private alias c_webkit_feature_get_identifierFn = extern(C) const(char)* function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_identifierFn c_webkit_feature_get_identifier; ///
private alias c_webkit_feature_get_nameFn = extern(C) const(char)* function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_nameFn c_webkit_feature_get_name; ///
private alias c_webkit_feature_get_statusFn = extern(C) WebKitFeatureStatus function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_get_statusFn c_webkit_feature_get_status; ///
private alias c_webkit_feature_refFn = extern(C) WebKitFeature* function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_refFn c_webkit_feature_ref; ///
private alias c_webkit_feature_unrefFn = extern(C) void function(WebKitFeature* feature) nothrow;
__gshared c_webkit_feature_unrefFn c_webkit_feature_unref; ///

// FeatureList
private alias c_webkit_feature_list_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_feature_list_get_typeFn c_webkit_feature_list_get_type; ///
private alias c_webkit_feature_list_getFn = extern(C) WebKitFeature* function(WebKitFeatureList* featureList, size_t index) nothrow;
__gshared c_webkit_feature_list_getFn c_webkit_feature_list_get; ///
private alias c_webkit_feature_list_get_lengthFn = extern(C) size_t function(WebKitFeatureList* featureList) nothrow;
__gshared c_webkit_feature_list_get_lengthFn c_webkit_feature_list_get_length; ///
private alias c_webkit_feature_list_refFn = extern(C) WebKitFeatureList* function(WebKitFeatureList* featureList) nothrow;
__gshared c_webkit_feature_list_refFn c_webkit_feature_list_ref; ///
private alias c_webkit_feature_list_unrefFn = extern(C) void function(WebKitFeatureList* featureList) nothrow;
__gshared c_webkit_feature_list_unrefFn c_webkit_feature_list_unref; ///

// FileChooserRequest
private alias c_webkit_file_chooser_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_file_chooser_request_get_typeFn c_webkit_file_chooser_request_get_type; ///
private alias c_webkit_file_chooser_request_cancelFn = extern(C) void function(WebKitFileChooserRequest* request) nothrow;
__gshared c_webkit_file_chooser_request_cancelFn c_webkit_file_chooser_request_cancel; ///
private alias c_webkit_file_chooser_request_get_mime_typesFn = extern(C) const(char*)* function(WebKitFileChooserRequest* request) nothrow;
__gshared c_webkit_file_chooser_request_get_mime_typesFn c_webkit_file_chooser_request_get_mime_types; ///
private alias c_webkit_file_chooser_request_get_mime_types_filterFn = extern(C) GtkFileFilter* function(WebKitFileChooserRequest* request) nothrow;
__gshared c_webkit_file_chooser_request_get_mime_types_filterFn c_webkit_file_chooser_request_get_mime_types_filter; ///
private alias c_webkit_file_chooser_request_get_select_multipleFn = extern(C) gboolean function(WebKitFileChooserRequest* request) nothrow;
__gshared c_webkit_file_chooser_request_get_select_multipleFn c_webkit_file_chooser_request_get_select_multiple; ///
private alias c_webkit_file_chooser_request_get_selected_filesFn = extern(C) const(char*)* function(WebKitFileChooserRequest* request) nothrow;
__gshared c_webkit_file_chooser_request_get_selected_filesFn c_webkit_file_chooser_request_get_selected_files; ///
private alias c_webkit_file_chooser_request_select_filesFn = extern(C) void function(WebKitFileChooserRequest* request, const(char*)* files) nothrow;
__gshared c_webkit_file_chooser_request_select_filesFn c_webkit_file_chooser_request_select_files; ///

// FindController
private alias c_webkit_find_controller_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_find_controller_get_typeFn c_webkit_find_controller_get_type; ///
private alias c_webkit_find_controller_count_matchesFn = extern(C) void function(WebKitFindController* findController, const(char)* searchText, uint findOptions, uint maxMatchCount) nothrow;
__gshared c_webkit_find_controller_count_matchesFn c_webkit_find_controller_count_matches; ///
private alias c_webkit_find_controller_get_max_match_countFn = extern(C) uint function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_get_max_match_countFn c_webkit_find_controller_get_max_match_count; ///
private alias c_webkit_find_controller_get_optionsFn = extern(C) uint function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_get_optionsFn c_webkit_find_controller_get_options; ///
private alias c_webkit_find_controller_get_search_textFn = extern(C) const(char)* function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_get_search_textFn c_webkit_find_controller_get_search_text; ///
private alias c_webkit_find_controller_get_web_viewFn = extern(C) WebKitWebView* function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_get_web_viewFn c_webkit_find_controller_get_web_view; ///
private alias c_webkit_find_controller_searchFn = extern(C) void function(WebKitFindController* findController, const(char)* searchText, uint findOptions, uint maxMatchCount) nothrow;
__gshared c_webkit_find_controller_searchFn c_webkit_find_controller_search; ///
private alias c_webkit_find_controller_search_finishFn = extern(C) void function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_search_finishFn c_webkit_find_controller_search_finish; ///
private alias c_webkit_find_controller_search_nextFn = extern(C) void function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_search_nextFn c_webkit_find_controller_search_next; ///
private alias c_webkit_find_controller_search_previousFn = extern(C) void function(WebKitFindController* findController) nothrow;
__gshared c_webkit_find_controller_search_previousFn c_webkit_find_controller_search_previous; ///

// FormSubmissionRequest
private alias c_webkit_form_submission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_form_submission_request_get_typeFn c_webkit_form_submission_request_get_type; ///
private alias c_webkit_form_submission_request_list_text_fieldsFn = extern(C) gboolean function(WebKitFormSubmissionRequest* request, GPtrArray** fieldNames, GPtrArray** fieldValues) nothrow;
__gshared c_webkit_form_submission_request_list_text_fieldsFn c_webkit_form_submission_request_list_text_fields; ///
private alias c_webkit_form_submission_request_submitFn = extern(C) void function(WebKitFormSubmissionRequest* request) nothrow;
__gshared c_webkit_form_submission_request_submitFn c_webkit_form_submission_request_submit; ///

// GeolocationManager
private alias c_webkit_geolocation_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_geolocation_manager_get_typeFn c_webkit_geolocation_manager_get_type; ///
private alias c_webkit_geolocation_manager_failedFn = extern(C) void function(WebKitGeolocationManager* manager, const(char)* errorMessage) nothrow;
__gshared c_webkit_geolocation_manager_failedFn c_webkit_geolocation_manager_failed; ///
private alias c_webkit_geolocation_manager_get_enable_high_accuracyFn = extern(C) gboolean function(WebKitGeolocationManager* manager) nothrow;
__gshared c_webkit_geolocation_manager_get_enable_high_accuracyFn c_webkit_geolocation_manager_get_enable_high_accuracy; ///
private alias c_webkit_geolocation_manager_update_positionFn = extern(C) void function(WebKitGeolocationManager* manager, WebKitGeolocationPosition* position) nothrow;
__gshared c_webkit_geolocation_manager_update_positionFn c_webkit_geolocation_manager_update_position; ///

// GeolocationPermissionRequest
private alias c_webkit_geolocation_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_geolocation_permission_request_get_typeFn c_webkit_geolocation_permission_request_get_type; ///

// GeolocationPosition
private alias c_webkit_geolocation_position_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_geolocation_position_get_typeFn c_webkit_geolocation_position_get_type; ///
private alias c_webkit_geolocation_position_newFn = extern(C) WebKitGeolocationPosition* function(double latitude, double longitude, double accuracy) nothrow;
__gshared c_webkit_geolocation_position_newFn c_webkit_geolocation_position_new; ///
private alias c_webkit_geolocation_position_copyFn = extern(C) WebKitGeolocationPosition* function(WebKitGeolocationPosition* position) nothrow;
__gshared c_webkit_geolocation_position_copyFn c_webkit_geolocation_position_copy; ///
private alias c_webkit_geolocation_position_freeFn = extern(C) void function(WebKitGeolocationPosition* position) nothrow;
__gshared c_webkit_geolocation_position_freeFn c_webkit_geolocation_position_free; ///
private alias c_webkit_geolocation_position_set_altitudeFn = extern(C) void function(WebKitGeolocationPosition* position, double altitude) nothrow;
__gshared c_webkit_geolocation_position_set_altitudeFn c_webkit_geolocation_position_set_altitude; ///
private alias c_webkit_geolocation_position_set_altitude_accuracyFn = extern(C) void function(WebKitGeolocationPosition* position, double altitudeAccuracy) nothrow;
__gshared c_webkit_geolocation_position_set_altitude_accuracyFn c_webkit_geolocation_position_set_altitude_accuracy; ///
private alias c_webkit_geolocation_position_set_headingFn = extern(C) void function(WebKitGeolocationPosition* position, double heading) nothrow;
__gshared c_webkit_geolocation_position_set_headingFn c_webkit_geolocation_position_set_heading; ///
private alias c_webkit_geolocation_position_set_speedFn = extern(C) void function(WebKitGeolocationPosition* position, double speed) nothrow;
__gshared c_webkit_geolocation_position_set_speedFn c_webkit_geolocation_position_set_speed; ///
private alias c_webkit_geolocation_position_set_timestampFn = extern(C) void function(WebKitGeolocationPosition* position, ulong timestamp) nothrow;
__gshared c_webkit_geolocation_position_set_timestampFn c_webkit_geolocation_position_set_timestamp; ///

// HitTestResult
private alias c_webkit_hit_test_result_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_hit_test_result_get_typeFn c_webkit_hit_test_result_get_type; ///
private alias c_webkit_hit_test_result_context_is_editableFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_editableFn c_webkit_hit_test_result_context_is_editable; ///
private alias c_webkit_hit_test_result_context_is_imageFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_imageFn c_webkit_hit_test_result_context_is_image; ///
private alias c_webkit_hit_test_result_context_is_linkFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_linkFn c_webkit_hit_test_result_context_is_link; ///
private alias c_webkit_hit_test_result_context_is_mediaFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_mediaFn c_webkit_hit_test_result_context_is_media; ///
private alias c_webkit_hit_test_result_context_is_scrollbarFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_scrollbarFn c_webkit_hit_test_result_context_is_scrollbar; ///
private alias c_webkit_hit_test_result_context_is_selectionFn = extern(C) gboolean function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_context_is_selectionFn c_webkit_hit_test_result_context_is_selection; ///
private alias c_webkit_hit_test_result_get_contextFn = extern(C) uint function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_contextFn c_webkit_hit_test_result_get_context; ///
private alias c_webkit_hit_test_result_get_image_uriFn = extern(C) const(char)* function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_image_uriFn c_webkit_hit_test_result_get_image_uri; ///
private alias c_webkit_hit_test_result_get_link_labelFn = extern(C) const(char)* function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_link_labelFn c_webkit_hit_test_result_get_link_label; ///
private alias c_webkit_hit_test_result_get_link_titleFn = extern(C) const(char)* function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_link_titleFn c_webkit_hit_test_result_get_link_title; ///
private alias c_webkit_hit_test_result_get_link_uriFn = extern(C) const(char)* function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_link_uriFn c_webkit_hit_test_result_get_link_uri; ///
private alias c_webkit_hit_test_result_get_media_uriFn = extern(C) const(char)* function(WebKitHitTestResult* hitTestResult) nothrow;
__gshared c_webkit_hit_test_result_get_media_uriFn c_webkit_hit_test_result_get_media_uri; ///

// ITPFirstParty
private alias c_webkit_itp_first_party_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_itp_first_party_get_typeFn c_webkit_itp_first_party_get_type; ///
private alias c_webkit_itp_first_party_get_domainFn = extern(C) const(char)* function(WebKitITPFirstParty* itpFirstParty) nothrow;
__gshared c_webkit_itp_first_party_get_domainFn c_webkit_itp_first_party_get_domain; ///
private alias c_webkit_itp_first_party_get_last_update_timeFn = extern(C) GDateTime* function(WebKitITPFirstParty* itpFirstParty) nothrow;
__gshared c_webkit_itp_first_party_get_last_update_timeFn c_webkit_itp_first_party_get_last_update_time; ///
private alias c_webkit_itp_first_party_get_website_data_access_allowedFn = extern(C) gboolean function(WebKitITPFirstParty* itpFirstParty) nothrow;
__gshared c_webkit_itp_first_party_get_website_data_access_allowedFn c_webkit_itp_first_party_get_website_data_access_allowed; ///
private alias c_webkit_itp_first_party_refFn = extern(C) WebKitITPFirstParty* function(WebKitITPFirstParty* itpFirstParty) nothrow;
__gshared c_webkit_itp_first_party_refFn c_webkit_itp_first_party_ref; ///
private alias c_webkit_itp_first_party_unrefFn = extern(C) void function(WebKitITPFirstParty* itpFirstParty) nothrow;
__gshared c_webkit_itp_first_party_unrefFn c_webkit_itp_first_party_unref; ///

// ITPThirdParty
private alias c_webkit_itp_third_party_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_itp_third_party_get_typeFn c_webkit_itp_third_party_get_type; ///
private alias c_webkit_itp_third_party_get_domainFn = extern(C) const(char)* function(WebKitITPThirdParty* itpThirdParty) nothrow;
__gshared c_webkit_itp_third_party_get_domainFn c_webkit_itp_third_party_get_domain; ///
private alias c_webkit_itp_third_party_get_first_partiesFn = extern(C) GList* function(WebKitITPThirdParty* itpThirdParty) nothrow;
__gshared c_webkit_itp_third_party_get_first_partiesFn c_webkit_itp_third_party_get_first_parties; ///
private alias c_webkit_itp_third_party_refFn = extern(C) WebKitITPThirdParty* function(WebKitITPThirdParty* itpThirdParty) nothrow;
__gshared c_webkit_itp_third_party_refFn c_webkit_itp_third_party_ref; ///
private alias c_webkit_itp_third_party_unrefFn = extern(C) void function(WebKitITPThirdParty* itpThirdParty) nothrow;
__gshared c_webkit_itp_third_party_unrefFn c_webkit_itp_third_party_unref; ///

// InputMethodContext
private alias c_webkit_input_method_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_input_method_context_get_typeFn c_webkit_input_method_context_get_type; ///
private alias c_webkit_input_method_context_filter_key_eventFn = extern(C) gboolean function(WebKitInputMethodContext* context, GdkEvent* keyEvent) nothrow;
__gshared c_webkit_input_method_context_filter_key_eventFn c_webkit_input_method_context_filter_key_event; ///
private alias c_webkit_input_method_context_get_input_hintsFn = extern(C) WebKitInputHints function(WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_input_method_context_get_input_hintsFn c_webkit_input_method_context_get_input_hints; ///
private alias c_webkit_input_method_context_get_input_purposeFn = extern(C) WebKitInputPurpose function(WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_input_method_context_get_input_purposeFn c_webkit_input_method_context_get_input_purpose; ///
private alias c_webkit_input_method_context_get_preeditFn = extern(C) void function(WebKitInputMethodContext* context, char** text, GList** underlines, uint* cursorOffset) nothrow;
__gshared c_webkit_input_method_context_get_preeditFn c_webkit_input_method_context_get_preedit; ///
private alias c_webkit_input_method_context_notify_cursor_areaFn = extern(C) void function(WebKitInputMethodContext* context, int x, int y, int width, int height) nothrow;
__gshared c_webkit_input_method_context_notify_cursor_areaFn c_webkit_input_method_context_notify_cursor_area; ///
private alias c_webkit_input_method_context_notify_focus_inFn = extern(C) void function(WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_input_method_context_notify_focus_inFn c_webkit_input_method_context_notify_focus_in; ///
private alias c_webkit_input_method_context_notify_focus_outFn = extern(C) void function(WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_input_method_context_notify_focus_outFn c_webkit_input_method_context_notify_focus_out; ///
private alias c_webkit_input_method_context_notify_surroundingFn = extern(C) void function(WebKitInputMethodContext* context, const(char)* text, int length, uint cursorIndex, uint selectionIndex) nothrow;
__gshared c_webkit_input_method_context_notify_surroundingFn c_webkit_input_method_context_notify_surrounding; ///
private alias c_webkit_input_method_context_resetFn = extern(C) void function(WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_input_method_context_resetFn c_webkit_input_method_context_reset; ///
private alias c_webkit_input_method_context_set_enable_preeditFn = extern(C) void function(WebKitInputMethodContext* context, gboolean enabled) nothrow;
__gshared c_webkit_input_method_context_set_enable_preeditFn c_webkit_input_method_context_set_enable_preedit; ///
private alias c_webkit_input_method_context_set_input_hintsFn = extern(C) void function(WebKitInputMethodContext* context, WebKitInputHints hints) nothrow;
__gshared c_webkit_input_method_context_set_input_hintsFn c_webkit_input_method_context_set_input_hints; ///
private alias c_webkit_input_method_context_set_input_purposeFn = extern(C) void function(WebKitInputMethodContext* context, WebKitInputPurpose purpose) nothrow;
__gshared c_webkit_input_method_context_set_input_purposeFn c_webkit_input_method_context_set_input_purpose; ///

// InputMethodUnderline
private alias c_webkit_input_method_underline_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_input_method_underline_get_typeFn c_webkit_input_method_underline_get_type; ///
private alias c_webkit_input_method_underline_newFn = extern(C) WebKitInputMethodUnderline* function(uint startOffset, uint endOffset) nothrow;
__gshared c_webkit_input_method_underline_newFn c_webkit_input_method_underline_new; ///
private alias c_webkit_input_method_underline_copyFn = extern(C) WebKitInputMethodUnderline* function(WebKitInputMethodUnderline* underline) nothrow;
__gshared c_webkit_input_method_underline_copyFn c_webkit_input_method_underline_copy; ///
private alias c_webkit_input_method_underline_freeFn = extern(C) void function(WebKitInputMethodUnderline* underline) nothrow;
__gshared c_webkit_input_method_underline_freeFn c_webkit_input_method_underline_free; ///
private alias c_webkit_input_method_underline_set_colorFn = extern(C) void function(WebKitInputMethodUnderline* underline, const(GdkRGBA)* rgba) nothrow;
__gshared c_webkit_input_method_underline_set_colorFn c_webkit_input_method_underline_set_color; ///

// MediaKeySystemPermissionRequest
private alias c_webkit_media_key_system_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_media_key_system_permission_request_get_typeFn c_webkit_media_key_system_permission_request_get_type; ///

// MemoryPressureSettings
private alias c_webkit_memory_pressure_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_memory_pressure_settings_get_typeFn c_webkit_memory_pressure_settings_get_type; ///
private alias c_webkit_memory_pressure_settings_newFn = extern(C) WebKitMemoryPressureSettings* function() nothrow;
__gshared c_webkit_memory_pressure_settings_newFn c_webkit_memory_pressure_settings_new; ///
private alias c_webkit_memory_pressure_settings_copyFn = extern(C) WebKitMemoryPressureSettings* function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_copyFn c_webkit_memory_pressure_settings_copy; ///
private alias c_webkit_memory_pressure_settings_freeFn = extern(C) void function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_freeFn c_webkit_memory_pressure_settings_free; ///
private alias c_webkit_memory_pressure_settings_get_conservative_thresholdFn = extern(C) double function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_get_conservative_thresholdFn c_webkit_memory_pressure_settings_get_conservative_threshold; ///
private alias c_webkit_memory_pressure_settings_get_kill_thresholdFn = extern(C) double function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_get_kill_thresholdFn c_webkit_memory_pressure_settings_get_kill_threshold; ///
private alias c_webkit_memory_pressure_settings_get_memory_limitFn = extern(C) uint function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_get_memory_limitFn c_webkit_memory_pressure_settings_get_memory_limit; ///
private alias c_webkit_memory_pressure_settings_get_poll_intervalFn = extern(C) double function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_get_poll_intervalFn c_webkit_memory_pressure_settings_get_poll_interval; ///
private alias c_webkit_memory_pressure_settings_get_strict_thresholdFn = extern(C) double function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_memory_pressure_settings_get_strict_thresholdFn c_webkit_memory_pressure_settings_get_strict_threshold; ///
private alias c_webkit_memory_pressure_settings_set_conservative_thresholdFn = extern(C) void function(WebKitMemoryPressureSettings* settings, double value) nothrow;
__gshared c_webkit_memory_pressure_settings_set_conservative_thresholdFn c_webkit_memory_pressure_settings_set_conservative_threshold; ///
private alias c_webkit_memory_pressure_settings_set_kill_thresholdFn = extern(C) void function(WebKitMemoryPressureSettings* settings, double value) nothrow;
__gshared c_webkit_memory_pressure_settings_set_kill_thresholdFn c_webkit_memory_pressure_settings_set_kill_threshold; ///
private alias c_webkit_memory_pressure_settings_set_memory_limitFn = extern(C) void function(WebKitMemoryPressureSettings* settings, uint memoryLimit) nothrow;
__gshared c_webkit_memory_pressure_settings_set_memory_limitFn c_webkit_memory_pressure_settings_set_memory_limit; ///
private alias c_webkit_memory_pressure_settings_set_poll_intervalFn = extern(C) void function(WebKitMemoryPressureSettings* settings, double value) nothrow;
__gshared c_webkit_memory_pressure_settings_set_poll_intervalFn c_webkit_memory_pressure_settings_set_poll_interval; ///
private alias c_webkit_memory_pressure_settings_set_strict_thresholdFn = extern(C) void function(WebKitMemoryPressureSettings* settings, double value) nothrow;
__gshared c_webkit_memory_pressure_settings_set_strict_thresholdFn c_webkit_memory_pressure_settings_set_strict_threshold; ///

// NavigationAction
private alias c_webkit_navigation_action_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_navigation_action_get_typeFn c_webkit_navigation_action_get_type; ///
private alias c_webkit_navigation_action_copyFn = extern(C) WebKitNavigationAction* function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_copyFn c_webkit_navigation_action_copy; ///
private alias c_webkit_navigation_action_freeFn = extern(C) void function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_freeFn c_webkit_navigation_action_free; ///
private alias c_webkit_navigation_action_get_frame_nameFn = extern(C) const(char)* function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_get_frame_nameFn c_webkit_navigation_action_get_frame_name; ///
private alias c_webkit_navigation_action_get_modifiersFn = extern(C) uint function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_get_modifiersFn c_webkit_navigation_action_get_modifiers; ///
private alias c_webkit_navigation_action_get_mouse_buttonFn = extern(C) uint function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_get_mouse_buttonFn c_webkit_navigation_action_get_mouse_button; ///
private alias c_webkit_navigation_action_get_navigation_typeFn = extern(C) WebKitNavigationType function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_get_navigation_typeFn c_webkit_navigation_action_get_navigation_type; ///
private alias c_webkit_navigation_action_get_requestFn = extern(C) WebKitURIRequest* function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_get_requestFn c_webkit_navigation_action_get_request; ///
private alias c_webkit_navigation_action_is_redirectFn = extern(C) gboolean function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_is_redirectFn c_webkit_navigation_action_is_redirect; ///
private alias c_webkit_navigation_action_is_user_gestureFn = extern(C) gboolean function(WebKitNavigationAction* navigation) nothrow;
__gshared c_webkit_navigation_action_is_user_gestureFn c_webkit_navigation_action_is_user_gesture; ///

// NavigationPolicyDecision
private alias c_webkit_navigation_policy_decision_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_navigation_policy_decision_get_typeFn c_webkit_navigation_policy_decision_get_type; ///
private alias c_webkit_navigation_policy_decision_get_navigation_actionFn = extern(C) WebKitNavigationAction* function(WebKitNavigationPolicyDecision* decision) nothrow;
__gshared c_webkit_navigation_policy_decision_get_navigation_actionFn c_webkit_navigation_policy_decision_get_navigation_action; ///

// NetworkProxySettings
private alias c_webkit_network_proxy_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_network_proxy_settings_get_typeFn c_webkit_network_proxy_settings_get_type; ///
private alias c_webkit_network_proxy_settings_newFn = extern(C) WebKitNetworkProxySettings* function(const(char)* defaultProxyUri, const(char*)* ignoreHosts) nothrow;
__gshared c_webkit_network_proxy_settings_newFn c_webkit_network_proxy_settings_new; ///
private alias c_webkit_network_proxy_settings_add_proxy_for_schemeFn = extern(C) void function(WebKitNetworkProxySettings* proxySettings, const(char)* scheme, const(char)* proxyUri) nothrow;
__gshared c_webkit_network_proxy_settings_add_proxy_for_schemeFn c_webkit_network_proxy_settings_add_proxy_for_scheme; ///
private alias c_webkit_network_proxy_settings_copyFn = extern(C) WebKitNetworkProxySettings* function(WebKitNetworkProxySettings* proxySettings) nothrow;
__gshared c_webkit_network_proxy_settings_copyFn c_webkit_network_proxy_settings_copy; ///
private alias c_webkit_network_proxy_settings_freeFn = extern(C) void function(WebKitNetworkProxySettings* proxySettings) nothrow;
__gshared c_webkit_network_proxy_settings_freeFn c_webkit_network_proxy_settings_free; ///

// NetworkSession
private alias c_webkit_network_session_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_network_session_get_typeFn c_webkit_network_session_get_type; ///
private alias c_webkit_network_session_newFn = extern(C) WebKitNetworkSession* function(const(char)* dataDirectory, const(char)* cacheDirectory) nothrow;
__gshared c_webkit_network_session_newFn c_webkit_network_session_new; ///
private alias c_webkit_network_session_new_ephemeralFn = extern(C) WebKitNetworkSession* function() nothrow;
__gshared c_webkit_network_session_new_ephemeralFn c_webkit_network_session_new_ephemeral; ///
private alias c_webkit_network_session_get_defaultFn = extern(C) WebKitNetworkSession* function() nothrow;
__gshared c_webkit_network_session_get_defaultFn c_webkit_network_session_get_default; ///
private alias c_webkit_network_session_set_memory_pressure_settingsFn = extern(C) void function(WebKitMemoryPressureSettings* settings) nothrow;
__gshared c_webkit_network_session_set_memory_pressure_settingsFn c_webkit_network_session_set_memory_pressure_settings; ///
private alias c_webkit_network_session_allow_tls_certificate_for_hostFn = extern(C) void function(WebKitNetworkSession* session, GTlsCertificate* certificate, const(char)* host) nothrow;
__gshared c_webkit_network_session_allow_tls_certificate_for_hostFn c_webkit_network_session_allow_tls_certificate_for_host; ///
private alias c_webkit_network_session_download_uriFn = extern(C) WebKitDownload* function(WebKitNetworkSession* session, const(char)* uri) nothrow;
__gshared c_webkit_network_session_download_uriFn c_webkit_network_session_download_uri; ///
private alias c_webkit_network_session_get_cookie_managerFn = extern(C) WebKitCookieManager* function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_get_cookie_managerFn c_webkit_network_session_get_cookie_manager; ///
private alias c_webkit_network_session_get_itp_enabledFn = extern(C) gboolean function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_get_itp_enabledFn c_webkit_network_session_get_itp_enabled; ///
private alias c_webkit_network_session_get_itp_summaryFn = extern(C) void function(WebKitNetworkSession* session, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_network_session_get_itp_summaryFn c_webkit_network_session_get_itp_summary; ///
private alias c_webkit_network_session_get_itp_summary_finishFn = extern(C) GList* function(WebKitNetworkSession* session, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_network_session_get_itp_summary_finishFn c_webkit_network_session_get_itp_summary_finish; ///
private alias c_webkit_network_session_get_persistent_credential_storage_enabledFn = extern(C) gboolean function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_get_persistent_credential_storage_enabledFn c_webkit_network_session_get_persistent_credential_storage_enabled; ///
private alias c_webkit_network_session_get_tls_errors_policyFn = extern(C) WebKitTLSErrorsPolicy function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_get_tls_errors_policyFn c_webkit_network_session_get_tls_errors_policy; ///
private alias c_webkit_network_session_get_website_data_managerFn = extern(C) WebKitWebsiteDataManager* function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_get_website_data_managerFn c_webkit_network_session_get_website_data_manager; ///
private alias c_webkit_network_session_is_ephemeralFn = extern(C) gboolean function(WebKitNetworkSession* session) nothrow;
__gshared c_webkit_network_session_is_ephemeralFn c_webkit_network_session_is_ephemeral; ///
private alias c_webkit_network_session_prefetch_dnsFn = extern(C) void function(WebKitNetworkSession* session, const(char)* hostname) nothrow;
__gshared c_webkit_network_session_prefetch_dnsFn c_webkit_network_session_prefetch_dns; ///
private alias c_webkit_network_session_set_itp_enabledFn = extern(C) void function(WebKitNetworkSession* session, gboolean enabled) nothrow;
__gshared c_webkit_network_session_set_itp_enabledFn c_webkit_network_session_set_itp_enabled; ///
private alias c_webkit_network_session_set_persistent_credential_storage_enabledFn = extern(C) void function(WebKitNetworkSession* session, gboolean enabled) nothrow;
__gshared c_webkit_network_session_set_persistent_credential_storage_enabledFn c_webkit_network_session_set_persistent_credential_storage_enabled; ///
private alias c_webkit_network_session_set_proxy_settingsFn = extern(C) void function(WebKitNetworkSession* session, WebKitNetworkProxyMode proxyMode, WebKitNetworkProxySettings* proxySettings) nothrow;
__gshared c_webkit_network_session_set_proxy_settingsFn c_webkit_network_session_set_proxy_settings; ///
private alias c_webkit_network_session_set_tls_errors_policyFn = extern(C) void function(WebKitNetworkSession* session, WebKitTLSErrorsPolicy policy) nothrow;
__gshared c_webkit_network_session_set_tls_errors_policyFn c_webkit_network_session_set_tls_errors_policy; ///

// Notification
private alias c_webkit_notification_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_notification_get_typeFn c_webkit_notification_get_type; ///
private alias c_webkit_notification_clickedFn = extern(C) void function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_clickedFn c_webkit_notification_clicked; ///
private alias c_webkit_notification_closeFn = extern(C) void function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_closeFn c_webkit_notification_close; ///
private alias c_webkit_notification_get_bodyFn = extern(C) const(char)* function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_get_bodyFn c_webkit_notification_get_body; ///
private alias c_webkit_notification_get_idFn = extern(C) ulong function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_get_idFn c_webkit_notification_get_id; ///
private alias c_webkit_notification_get_tagFn = extern(C) const(char)* function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_get_tagFn c_webkit_notification_get_tag; ///
private alias c_webkit_notification_get_titleFn = extern(C) const(char)* function(WebKitNotification* notification) nothrow;
__gshared c_webkit_notification_get_titleFn c_webkit_notification_get_title; ///

// NotificationPermissionRequest
private alias c_webkit_notification_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_notification_permission_request_get_typeFn c_webkit_notification_permission_request_get_type; ///

// OptionMenu
private alias c_webkit_option_menu_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_option_menu_get_typeFn c_webkit_option_menu_get_type; ///
private alias c_webkit_option_menu_activate_itemFn = extern(C) void function(WebKitOptionMenu* menu, uint index) nothrow;
__gshared c_webkit_option_menu_activate_itemFn c_webkit_option_menu_activate_item; ///
private alias c_webkit_option_menu_closeFn = extern(C) void function(WebKitOptionMenu* menu) nothrow;
__gshared c_webkit_option_menu_closeFn c_webkit_option_menu_close; ///
private alias c_webkit_option_menu_get_eventFn = extern(C) GdkEvent* function(WebKitOptionMenu* menu) nothrow;
__gshared c_webkit_option_menu_get_eventFn c_webkit_option_menu_get_event; ///
private alias c_webkit_option_menu_get_itemFn = extern(C) WebKitOptionMenuItem* function(WebKitOptionMenu* menu, uint index) nothrow;
__gshared c_webkit_option_menu_get_itemFn c_webkit_option_menu_get_item; ///
private alias c_webkit_option_menu_get_n_itemsFn = extern(C) uint function(WebKitOptionMenu* menu) nothrow;
__gshared c_webkit_option_menu_get_n_itemsFn c_webkit_option_menu_get_n_items; ///
private alias c_webkit_option_menu_select_itemFn = extern(C) void function(WebKitOptionMenu* menu, uint index) nothrow;
__gshared c_webkit_option_menu_select_itemFn c_webkit_option_menu_select_item; ///

// OptionMenuItem
private alias c_webkit_option_menu_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_option_menu_item_get_typeFn c_webkit_option_menu_item_get_type; ///
private alias c_webkit_option_menu_item_copyFn = extern(C) WebKitOptionMenuItem* function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_copyFn c_webkit_option_menu_item_copy; ///
private alias c_webkit_option_menu_item_freeFn = extern(C) void function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_freeFn c_webkit_option_menu_item_free; ///
private alias c_webkit_option_menu_item_get_labelFn = extern(C) const(char)* function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_get_labelFn c_webkit_option_menu_item_get_label; ///
private alias c_webkit_option_menu_item_get_tooltipFn = extern(C) const(char)* function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_get_tooltipFn c_webkit_option_menu_item_get_tooltip; ///
private alias c_webkit_option_menu_item_is_enabledFn = extern(C) gboolean function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_is_enabledFn c_webkit_option_menu_item_is_enabled; ///
private alias c_webkit_option_menu_item_is_group_childFn = extern(C) gboolean function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_is_group_childFn c_webkit_option_menu_item_is_group_child; ///
private alias c_webkit_option_menu_item_is_group_labelFn = extern(C) gboolean function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_is_group_labelFn c_webkit_option_menu_item_is_group_label; ///
private alias c_webkit_option_menu_item_is_selectedFn = extern(C) gboolean function(WebKitOptionMenuItem* item) nothrow;
__gshared c_webkit_option_menu_item_is_selectedFn c_webkit_option_menu_item_is_selected; ///

// PermissionRequest
private alias c_webkit_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_permission_request_get_typeFn c_webkit_permission_request_get_type; ///
private alias c_webkit_permission_request_allowFn = extern(C) void function(WebKitPermissionRequest* request) nothrow;
__gshared c_webkit_permission_request_allowFn c_webkit_permission_request_allow; ///
private alias c_webkit_permission_request_denyFn = extern(C) void function(WebKitPermissionRequest* request) nothrow;
__gshared c_webkit_permission_request_denyFn c_webkit_permission_request_deny; ///

// PermissionStateQuery
private alias c_webkit_permission_state_query_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_permission_state_query_get_typeFn c_webkit_permission_state_query_get_type; ///
private alias c_webkit_permission_state_query_finishFn = extern(C) void function(WebKitPermissionStateQuery* query, WebKitPermissionState state) nothrow;
__gshared c_webkit_permission_state_query_finishFn c_webkit_permission_state_query_finish; ///
private alias c_webkit_permission_state_query_get_nameFn = extern(C) const(char)* function(WebKitPermissionStateQuery* query) nothrow;
__gshared c_webkit_permission_state_query_get_nameFn c_webkit_permission_state_query_get_name; ///
private alias c_webkit_permission_state_query_get_security_originFn = extern(C) WebKitSecurityOrigin* function(WebKitPermissionStateQuery* query) nothrow;
__gshared c_webkit_permission_state_query_get_security_originFn c_webkit_permission_state_query_get_security_origin; ///
private alias c_webkit_permission_state_query_refFn = extern(C) WebKitPermissionStateQuery* function(WebKitPermissionStateQuery* query) nothrow;
__gshared c_webkit_permission_state_query_refFn c_webkit_permission_state_query_ref; ///
private alias c_webkit_permission_state_query_unrefFn = extern(C) void function(WebKitPermissionStateQuery* query) nothrow;
__gshared c_webkit_permission_state_query_unrefFn c_webkit_permission_state_query_unref; ///

// PointerLockPermissionRequest
private alias c_webkit_pointer_lock_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_pointer_lock_permission_request_get_typeFn c_webkit_pointer_lock_permission_request_get_type; ///

// PolicyDecision
private alias c_webkit_policy_decision_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_policy_decision_get_typeFn c_webkit_policy_decision_get_type; ///
private alias c_webkit_policy_decision_downloadFn = extern(C) void function(WebKitPolicyDecision* decision) nothrow;
__gshared c_webkit_policy_decision_downloadFn c_webkit_policy_decision_download; ///
private alias c_webkit_policy_decision_ignoreFn = extern(C) void function(WebKitPolicyDecision* decision) nothrow;
__gshared c_webkit_policy_decision_ignoreFn c_webkit_policy_decision_ignore; ///
private alias c_webkit_policy_decision_useFn = extern(C) void function(WebKitPolicyDecision* decision) nothrow;
__gshared c_webkit_policy_decision_useFn c_webkit_policy_decision_use; ///
private alias c_webkit_policy_decision_use_with_policiesFn = extern(C) void function(WebKitPolicyDecision* decision, WebKitWebsitePolicies* policies) nothrow;
__gshared c_webkit_policy_decision_use_with_policiesFn c_webkit_policy_decision_use_with_policies; ///

// PrintOperation
private alias c_webkit_print_operation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_print_operation_get_typeFn c_webkit_print_operation_get_type; ///
private alias c_webkit_print_operation_newFn = extern(C) WebKitPrintOperation* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_print_operation_newFn c_webkit_print_operation_new; ///
private alias c_webkit_print_operation_get_page_setupFn = extern(C) GtkPageSetup* function(WebKitPrintOperation* printOperation) nothrow;
__gshared c_webkit_print_operation_get_page_setupFn c_webkit_print_operation_get_page_setup; ///
private alias c_webkit_print_operation_get_print_settingsFn = extern(C) GtkPrintSettings* function(WebKitPrintOperation* printOperation) nothrow;
__gshared c_webkit_print_operation_get_print_settingsFn c_webkit_print_operation_get_print_settings; ///
private alias c_webkit_print_operation_printFn = extern(C) void function(WebKitPrintOperation* printOperation) nothrow;
__gshared c_webkit_print_operation_printFn c_webkit_print_operation_print; ///
private alias c_webkit_print_operation_run_dialogFn = extern(C) WebKitPrintOperationResponse function(WebKitPrintOperation* printOperation, GtkWindow* parent) nothrow;
__gshared c_webkit_print_operation_run_dialogFn c_webkit_print_operation_run_dialog; ///
private alias c_webkit_print_operation_set_page_setupFn = extern(C) void function(WebKitPrintOperation* printOperation, GtkPageSetup* pageSetup) nothrow;
__gshared c_webkit_print_operation_set_page_setupFn c_webkit_print_operation_set_page_setup; ///
private alias c_webkit_print_operation_set_print_settingsFn = extern(C) void function(WebKitPrintOperation* printOperation, GtkPrintSettings* printSettings) nothrow;
__gshared c_webkit_print_operation_set_print_settingsFn c_webkit_print_operation_set_print_settings; ///

// ResponsePolicyDecision
private alias c_webkit_response_policy_decision_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_response_policy_decision_get_typeFn c_webkit_response_policy_decision_get_type; ///
private alias c_webkit_response_policy_decision_get_requestFn = extern(C) WebKitURIRequest* function(WebKitResponsePolicyDecision* decision) nothrow;
__gshared c_webkit_response_policy_decision_get_requestFn c_webkit_response_policy_decision_get_request; ///
private alias c_webkit_response_policy_decision_get_responseFn = extern(C) WebKitURIResponse* function(WebKitResponsePolicyDecision* decision) nothrow;
__gshared c_webkit_response_policy_decision_get_responseFn c_webkit_response_policy_decision_get_response; ///
private alias c_webkit_response_policy_decision_is_main_frame_main_resourceFn = extern(C) gboolean function(WebKitResponsePolicyDecision* decision) nothrow;
__gshared c_webkit_response_policy_decision_is_main_frame_main_resourceFn c_webkit_response_policy_decision_is_main_frame_main_resource; ///
private alias c_webkit_response_policy_decision_is_mime_type_supportedFn = extern(C) gboolean function(WebKitResponsePolicyDecision* decision) nothrow;
__gshared c_webkit_response_policy_decision_is_mime_type_supportedFn c_webkit_response_policy_decision_is_mime_type_supported; ///

// ScriptDialog
private alias c_webkit_script_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_script_dialog_get_typeFn c_webkit_script_dialog_get_type; ///
private alias c_webkit_script_dialog_closeFn = extern(C) void function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_closeFn c_webkit_script_dialog_close; ///
private alias c_webkit_script_dialog_confirm_set_confirmedFn = extern(C) void function(WebKitScriptDialog* dialog, gboolean confirmed) nothrow;
__gshared c_webkit_script_dialog_confirm_set_confirmedFn c_webkit_script_dialog_confirm_set_confirmed; ///
private alias c_webkit_script_dialog_get_dialog_typeFn = extern(C) WebKitScriptDialogType function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_get_dialog_typeFn c_webkit_script_dialog_get_dialog_type; ///
private alias c_webkit_script_dialog_get_messageFn = extern(C) const(char)* function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_get_messageFn c_webkit_script_dialog_get_message; ///
private alias c_webkit_script_dialog_prompt_get_default_textFn = extern(C) const(char)* function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_prompt_get_default_textFn c_webkit_script_dialog_prompt_get_default_text; ///
private alias c_webkit_script_dialog_prompt_set_textFn = extern(C) void function(WebKitScriptDialog* dialog, const(char)* text) nothrow;
__gshared c_webkit_script_dialog_prompt_set_textFn c_webkit_script_dialog_prompt_set_text; ///
private alias c_webkit_script_dialog_refFn = extern(C) WebKitScriptDialog* function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_refFn c_webkit_script_dialog_ref; ///
private alias c_webkit_script_dialog_unrefFn = extern(C) void function(WebKitScriptDialog* dialog) nothrow;
__gshared c_webkit_script_dialog_unrefFn c_webkit_script_dialog_unref; ///

// ScriptMessageReply
private alias c_webkit_script_message_reply_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_script_message_reply_get_typeFn c_webkit_script_message_reply_get_type; ///
private alias c_webkit_script_message_reply_refFn = extern(C) WebKitScriptMessageReply* function(WebKitScriptMessageReply* scriptMessageReply) nothrow;
__gshared c_webkit_script_message_reply_refFn c_webkit_script_message_reply_ref; ///
private alias c_webkit_script_message_reply_return_error_messageFn = extern(C) void function(WebKitScriptMessageReply* scriptMessageReply, const(char)* errorMessage) nothrow;
__gshared c_webkit_script_message_reply_return_error_messageFn c_webkit_script_message_reply_return_error_message; ///
private alias c_webkit_script_message_reply_return_valueFn = extern(C) void function(WebKitScriptMessageReply* scriptMessageReply, JSCValue* replyValue) nothrow;
__gshared c_webkit_script_message_reply_return_valueFn c_webkit_script_message_reply_return_value; ///
private alias c_webkit_script_message_reply_unrefFn = extern(C) void function(WebKitScriptMessageReply* scriptMessageReply) nothrow;
__gshared c_webkit_script_message_reply_unrefFn c_webkit_script_message_reply_unref; ///

// SecurityManager
private alias c_webkit_security_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_security_manager_get_typeFn c_webkit_security_manager_get_type; ///
private alias c_webkit_security_manager_register_uri_scheme_as_cors_enabledFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_cors_enabledFn c_webkit_security_manager_register_uri_scheme_as_cors_enabled; ///
private alias c_webkit_security_manager_register_uri_scheme_as_display_isolatedFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_display_isolatedFn c_webkit_security_manager_register_uri_scheme_as_display_isolated; ///
private alias c_webkit_security_manager_register_uri_scheme_as_empty_documentFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_empty_documentFn c_webkit_security_manager_register_uri_scheme_as_empty_document; ///
private alias c_webkit_security_manager_register_uri_scheme_as_localFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_localFn c_webkit_security_manager_register_uri_scheme_as_local; ///
private alias c_webkit_security_manager_register_uri_scheme_as_no_accessFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_no_accessFn c_webkit_security_manager_register_uri_scheme_as_no_access; ///
private alias c_webkit_security_manager_register_uri_scheme_as_secureFn = extern(C) void function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_register_uri_scheme_as_secureFn c_webkit_security_manager_register_uri_scheme_as_secure; ///
private alias c_webkit_security_manager_uri_scheme_is_cors_enabledFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_cors_enabledFn c_webkit_security_manager_uri_scheme_is_cors_enabled; ///
private alias c_webkit_security_manager_uri_scheme_is_display_isolatedFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_display_isolatedFn c_webkit_security_manager_uri_scheme_is_display_isolated; ///
private alias c_webkit_security_manager_uri_scheme_is_empty_documentFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_empty_documentFn c_webkit_security_manager_uri_scheme_is_empty_document; ///
private alias c_webkit_security_manager_uri_scheme_is_localFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_localFn c_webkit_security_manager_uri_scheme_is_local; ///
private alias c_webkit_security_manager_uri_scheme_is_no_accessFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_no_accessFn c_webkit_security_manager_uri_scheme_is_no_access; ///
private alias c_webkit_security_manager_uri_scheme_is_secureFn = extern(C) gboolean function(WebKitSecurityManager* securityManager, const(char)* scheme) nothrow;
__gshared c_webkit_security_manager_uri_scheme_is_secureFn c_webkit_security_manager_uri_scheme_is_secure; ///

// SecurityOrigin
private alias c_webkit_security_origin_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_security_origin_get_typeFn c_webkit_security_origin_get_type; ///
private alias c_webkit_security_origin_newFn = extern(C) WebKitSecurityOrigin* function(const(char)* protocol, const(char)* host, ushort port) nothrow;
__gshared c_webkit_security_origin_newFn c_webkit_security_origin_new; ///
private alias c_webkit_security_origin_new_for_uriFn = extern(C) WebKitSecurityOrigin* function(const(char)* uri) nothrow;
__gshared c_webkit_security_origin_new_for_uriFn c_webkit_security_origin_new_for_uri; ///
private alias c_webkit_security_origin_get_hostFn = extern(C) const(char)* function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_get_hostFn c_webkit_security_origin_get_host; ///
private alias c_webkit_security_origin_get_portFn = extern(C) ushort function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_get_portFn c_webkit_security_origin_get_port; ///
private alias c_webkit_security_origin_get_protocolFn = extern(C) const(char)* function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_get_protocolFn c_webkit_security_origin_get_protocol; ///
private alias c_webkit_security_origin_refFn = extern(C) WebKitSecurityOrigin* function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_refFn c_webkit_security_origin_ref; ///
private alias c_webkit_security_origin_to_stringFn = extern(C) char* function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_to_stringFn c_webkit_security_origin_to_string; ///
private alias c_webkit_security_origin_unrefFn = extern(C) void function(WebKitSecurityOrigin* origin) nothrow;
__gshared c_webkit_security_origin_unrefFn c_webkit_security_origin_unref; ///

// Settings
private alias c_webkit_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_settings_get_typeFn c_webkit_settings_get_type; ///
private alias c_webkit_settings_newFn = extern(C) WebKitSettings* function() nothrow;
__gshared c_webkit_settings_newFn c_webkit_settings_new; ///
private alias c_webkit_settings_new_with_settingsFn = extern(C) WebKitSettings* function(const(char)* firstSettingName,  ...) nothrow;
__gshared c_webkit_settings_new_with_settingsFn c_webkit_settings_new_with_settings; ///
private alias c_webkit_settings_font_size_to_pixelsFn = extern(C) uint function(uint points) nothrow;
__gshared c_webkit_settings_font_size_to_pixelsFn c_webkit_settings_font_size_to_pixels; ///
private alias c_webkit_settings_font_size_to_pointsFn = extern(C) uint function(uint pixels) nothrow;
__gshared c_webkit_settings_font_size_to_pointsFn c_webkit_settings_font_size_to_points; ///
private alias c_webkit_settings_get_all_featuresFn = extern(C) WebKitFeatureList* function() nothrow;
__gshared c_webkit_settings_get_all_featuresFn c_webkit_settings_get_all_features; ///
private alias c_webkit_settings_get_development_featuresFn = extern(C) WebKitFeatureList* function() nothrow;
__gshared c_webkit_settings_get_development_featuresFn c_webkit_settings_get_development_features; ///
private alias c_webkit_settings_get_experimental_featuresFn = extern(C) WebKitFeatureList* function() nothrow;
__gshared c_webkit_settings_get_experimental_featuresFn c_webkit_settings_get_experimental_features; ///
private alias c_webkit_settings_apply_from_key_fileFn = extern(C) gboolean function(WebKitSettings* settings, GKeyFile* keyFile, const(char)* groupName, GError** _err) nothrow;
__gshared c_webkit_settings_apply_from_key_fileFn c_webkit_settings_apply_from_key_file; ///
private alias c_webkit_settings_get_allow_file_access_from_file_urlsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_allow_file_access_from_file_urlsFn c_webkit_settings_get_allow_file_access_from_file_urls; ///
private alias c_webkit_settings_get_allow_modal_dialogsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_allow_modal_dialogsFn c_webkit_settings_get_allow_modal_dialogs; ///
private alias c_webkit_settings_get_allow_top_navigation_to_data_urlsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_allow_top_navigation_to_data_urlsFn c_webkit_settings_get_allow_top_navigation_to_data_urls; ///
private alias c_webkit_settings_get_allow_universal_access_from_file_urlsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_allow_universal_access_from_file_urlsFn c_webkit_settings_get_allow_universal_access_from_file_urls; ///
private alias c_webkit_settings_get_auto_load_imagesFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_auto_load_imagesFn c_webkit_settings_get_auto_load_images; ///
private alias c_webkit_settings_get_cursive_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_cursive_font_familyFn c_webkit_settings_get_cursive_font_family; ///
private alias c_webkit_settings_get_default_charsetFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_default_charsetFn c_webkit_settings_get_default_charset; ///
private alias c_webkit_settings_get_default_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_default_font_familyFn c_webkit_settings_get_default_font_family; ///
private alias c_webkit_settings_get_default_font_sizeFn = extern(C) uint function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_default_font_sizeFn c_webkit_settings_get_default_font_size; ///
private alias c_webkit_settings_get_default_monospace_font_sizeFn = extern(C) uint function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_default_monospace_font_sizeFn c_webkit_settings_get_default_monospace_font_size; ///
private alias c_webkit_settings_get_disable_web_securityFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_disable_web_securityFn c_webkit_settings_get_disable_web_security; ///
private alias c_webkit_settings_get_draw_compositing_indicatorsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_draw_compositing_indicatorsFn c_webkit_settings_get_draw_compositing_indicators; ///
private alias c_webkit_settings_get_enable_2d_canvas_accelerationFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_2d_canvas_accelerationFn c_webkit_settings_get_enable_2d_canvas_acceleration; ///
private alias c_webkit_settings_get_enable_back_forward_navigation_gesturesFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_back_forward_navigation_gesturesFn c_webkit_settings_get_enable_back_forward_navigation_gestures; ///
private alias c_webkit_settings_get_enable_caret_browsingFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_caret_browsingFn c_webkit_settings_get_enable_caret_browsing; ///
private alias c_webkit_settings_get_enable_developer_extrasFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_developer_extrasFn c_webkit_settings_get_enable_developer_extras; ///
private alias c_webkit_settings_get_enable_dns_prefetchingFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_dns_prefetchingFn c_webkit_settings_get_enable_dns_prefetching; ///
private alias c_webkit_settings_get_enable_encrypted_mediaFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_encrypted_mediaFn c_webkit_settings_get_enable_encrypted_media; ///
private alias c_webkit_settings_get_enable_fullscreenFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_fullscreenFn c_webkit_settings_get_enable_fullscreen; ///
private alias c_webkit_settings_get_enable_html5_databaseFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_html5_databaseFn c_webkit_settings_get_enable_html5_database; ///
private alias c_webkit_settings_get_enable_html5_local_storageFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_html5_local_storageFn c_webkit_settings_get_enable_html5_local_storage; ///
private alias c_webkit_settings_get_enable_hyperlink_auditingFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_hyperlink_auditingFn c_webkit_settings_get_enable_hyperlink_auditing; ///
private alias c_webkit_settings_get_enable_javascriptFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_javascriptFn c_webkit_settings_get_enable_javascript; ///
private alias c_webkit_settings_get_enable_javascript_markupFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_javascript_markupFn c_webkit_settings_get_enable_javascript_markup; ///
private alias c_webkit_settings_get_enable_mediaFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_mediaFn c_webkit_settings_get_enable_media; ///
private alias c_webkit_settings_get_enable_media_capabilitiesFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_media_capabilitiesFn c_webkit_settings_get_enable_media_capabilities; ///
private alias c_webkit_settings_get_enable_media_streamFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_media_streamFn c_webkit_settings_get_enable_media_stream; ///
private alias c_webkit_settings_get_enable_mediasourceFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_mediasourceFn c_webkit_settings_get_enable_mediasource; ///
private alias c_webkit_settings_get_enable_mock_capture_devicesFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_mock_capture_devicesFn c_webkit_settings_get_enable_mock_capture_devices; ///
private alias c_webkit_settings_get_enable_offline_web_application_cacheFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_offline_web_application_cacheFn c_webkit_settings_get_enable_offline_web_application_cache; ///
private alias c_webkit_settings_get_enable_page_cacheFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_page_cacheFn c_webkit_settings_get_enable_page_cache; ///
private alias c_webkit_settings_get_enable_resizable_text_areasFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_resizable_text_areasFn c_webkit_settings_get_enable_resizable_text_areas; ///
private alias c_webkit_settings_get_enable_site_specific_quirksFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_site_specific_quirksFn c_webkit_settings_get_enable_site_specific_quirks; ///
private alias c_webkit_settings_get_enable_smooth_scrollingFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_smooth_scrollingFn c_webkit_settings_get_enable_smooth_scrolling; ///
private alias c_webkit_settings_get_enable_spatial_navigationFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_spatial_navigationFn c_webkit_settings_get_enable_spatial_navigation; ///
private alias c_webkit_settings_get_enable_tabs_to_linksFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_tabs_to_linksFn c_webkit_settings_get_enable_tabs_to_links; ///
private alias c_webkit_settings_get_enable_webaudioFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_webaudioFn c_webkit_settings_get_enable_webaudio; ///
private alias c_webkit_settings_get_enable_webglFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_webglFn c_webkit_settings_get_enable_webgl; ///
private alias c_webkit_settings_get_enable_webrtcFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_webrtcFn c_webkit_settings_get_enable_webrtc; ///
private alias c_webkit_settings_get_enable_write_console_messages_to_stdoutFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_enable_write_console_messages_to_stdoutFn c_webkit_settings_get_enable_write_console_messages_to_stdout; ///
private alias c_webkit_settings_get_fantasy_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_fantasy_font_familyFn c_webkit_settings_get_fantasy_font_family; ///
private alias c_webkit_settings_get_feature_enabledFn = extern(C) gboolean function(WebKitSettings* settings, WebKitFeature* feature) nothrow;
__gshared c_webkit_settings_get_feature_enabledFn c_webkit_settings_get_feature_enabled; ///
private alias c_webkit_settings_get_hardware_acceleration_policyFn = extern(C) WebKitHardwareAccelerationPolicy function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_hardware_acceleration_policyFn c_webkit_settings_get_hardware_acceleration_policy; ///
private alias c_webkit_settings_get_javascript_can_access_clipboardFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_javascript_can_access_clipboardFn c_webkit_settings_get_javascript_can_access_clipboard; ///
private alias c_webkit_settings_get_javascript_can_open_windows_automaticallyFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_javascript_can_open_windows_automaticallyFn c_webkit_settings_get_javascript_can_open_windows_automatically; ///
private alias c_webkit_settings_get_load_icons_ignoring_image_load_settingFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_load_icons_ignoring_image_load_settingFn c_webkit_settings_get_load_icons_ignoring_image_load_setting; ///
private alias c_webkit_settings_get_math_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_math_font_familyFn c_webkit_settings_get_math_font_family; ///
private alias c_webkit_settings_get_media_content_types_requiring_hardware_supportFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_media_content_types_requiring_hardware_supportFn c_webkit_settings_get_media_content_types_requiring_hardware_support; ///
private alias c_webkit_settings_get_media_playback_allows_inlineFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_media_playback_allows_inlineFn c_webkit_settings_get_media_playback_allows_inline; ///
private alias c_webkit_settings_get_media_playback_requires_user_gestureFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_media_playback_requires_user_gestureFn c_webkit_settings_get_media_playback_requires_user_gesture; ///
private alias c_webkit_settings_get_minimum_font_sizeFn = extern(C) uint function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_minimum_font_sizeFn c_webkit_settings_get_minimum_font_size; ///
private alias c_webkit_settings_get_monospace_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_monospace_font_familyFn c_webkit_settings_get_monospace_font_family; ///
private alias c_webkit_settings_get_pictograph_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_pictograph_font_familyFn c_webkit_settings_get_pictograph_font_family; ///
private alias c_webkit_settings_get_print_backgroundsFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_print_backgroundsFn c_webkit_settings_get_print_backgrounds; ///
private alias c_webkit_settings_get_sans_serif_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_sans_serif_font_familyFn c_webkit_settings_get_sans_serif_font_family; ///
private alias c_webkit_settings_get_serif_font_familyFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_serif_font_familyFn c_webkit_settings_get_serif_font_family; ///
private alias c_webkit_settings_get_user_agentFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_user_agentFn c_webkit_settings_get_user_agent; ///
private alias c_webkit_settings_get_webrtc_udp_ports_rangeFn = extern(C) const(char)* function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_webrtc_udp_ports_rangeFn c_webkit_settings_get_webrtc_udp_ports_range; ///
private alias c_webkit_settings_get_zoom_text_onlyFn = extern(C) gboolean function(WebKitSettings* settings) nothrow;
__gshared c_webkit_settings_get_zoom_text_onlyFn c_webkit_settings_get_zoom_text_only; ///
private alias c_webkit_settings_set_allow_file_access_from_file_urlsFn = extern(C) void function(WebKitSettings* settings, gboolean allowed) nothrow;
__gshared c_webkit_settings_set_allow_file_access_from_file_urlsFn c_webkit_settings_set_allow_file_access_from_file_urls; ///
private alias c_webkit_settings_set_allow_modal_dialogsFn = extern(C) void function(WebKitSettings* settings, gboolean allowed) nothrow;
__gshared c_webkit_settings_set_allow_modal_dialogsFn c_webkit_settings_set_allow_modal_dialogs; ///
private alias c_webkit_settings_set_allow_top_navigation_to_data_urlsFn = extern(C) void function(WebKitSettings* settings, gboolean allowed) nothrow;
__gshared c_webkit_settings_set_allow_top_navigation_to_data_urlsFn c_webkit_settings_set_allow_top_navigation_to_data_urls; ///
private alias c_webkit_settings_set_allow_universal_access_from_file_urlsFn = extern(C) void function(WebKitSettings* settings, gboolean allowed) nothrow;
__gshared c_webkit_settings_set_allow_universal_access_from_file_urlsFn c_webkit_settings_set_allow_universal_access_from_file_urls; ///
private alias c_webkit_settings_set_auto_load_imagesFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_auto_load_imagesFn c_webkit_settings_set_auto_load_images; ///
private alias c_webkit_settings_set_cursive_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* cursiveFontFamily) nothrow;
__gshared c_webkit_settings_set_cursive_font_familyFn c_webkit_settings_set_cursive_font_family; ///
private alias c_webkit_settings_set_default_charsetFn = extern(C) void function(WebKitSettings* settings, const(char)* defaultCharset) nothrow;
__gshared c_webkit_settings_set_default_charsetFn c_webkit_settings_set_default_charset; ///
private alias c_webkit_settings_set_default_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* defaultFontFamily) nothrow;
__gshared c_webkit_settings_set_default_font_familyFn c_webkit_settings_set_default_font_family; ///
private alias c_webkit_settings_set_default_font_sizeFn = extern(C) void function(WebKitSettings* settings, uint fontSize) nothrow;
__gshared c_webkit_settings_set_default_font_sizeFn c_webkit_settings_set_default_font_size; ///
private alias c_webkit_settings_set_default_monospace_font_sizeFn = extern(C) void function(WebKitSettings* settings, uint fontSize) nothrow;
__gshared c_webkit_settings_set_default_monospace_font_sizeFn c_webkit_settings_set_default_monospace_font_size; ///
private alias c_webkit_settings_set_disable_web_securityFn = extern(C) void function(WebKitSettings* settings, gboolean disabled) nothrow;
__gshared c_webkit_settings_set_disable_web_securityFn c_webkit_settings_set_disable_web_security; ///
private alias c_webkit_settings_set_draw_compositing_indicatorsFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_draw_compositing_indicatorsFn c_webkit_settings_set_draw_compositing_indicators; ///
private alias c_webkit_settings_set_enable_2d_canvas_accelerationFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_2d_canvas_accelerationFn c_webkit_settings_set_enable_2d_canvas_acceleration; ///
private alias c_webkit_settings_set_enable_back_forward_navigation_gesturesFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_back_forward_navigation_gesturesFn c_webkit_settings_set_enable_back_forward_navigation_gestures; ///
private alias c_webkit_settings_set_enable_caret_browsingFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_caret_browsingFn c_webkit_settings_set_enable_caret_browsing; ///
private alias c_webkit_settings_set_enable_developer_extrasFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_developer_extrasFn c_webkit_settings_set_enable_developer_extras; ///
private alias c_webkit_settings_set_enable_dns_prefetchingFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_dns_prefetchingFn c_webkit_settings_set_enable_dns_prefetching; ///
private alias c_webkit_settings_set_enable_encrypted_mediaFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_encrypted_mediaFn c_webkit_settings_set_enable_encrypted_media; ///
private alias c_webkit_settings_set_enable_fullscreenFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_fullscreenFn c_webkit_settings_set_enable_fullscreen; ///
private alias c_webkit_settings_set_enable_html5_databaseFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_html5_databaseFn c_webkit_settings_set_enable_html5_database; ///
private alias c_webkit_settings_set_enable_html5_local_storageFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_html5_local_storageFn c_webkit_settings_set_enable_html5_local_storage; ///
private alias c_webkit_settings_set_enable_hyperlink_auditingFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_hyperlink_auditingFn c_webkit_settings_set_enable_hyperlink_auditing; ///
private alias c_webkit_settings_set_enable_javascriptFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_javascriptFn c_webkit_settings_set_enable_javascript; ///
private alias c_webkit_settings_set_enable_javascript_markupFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_javascript_markupFn c_webkit_settings_set_enable_javascript_markup; ///
private alias c_webkit_settings_set_enable_mediaFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_mediaFn c_webkit_settings_set_enable_media; ///
private alias c_webkit_settings_set_enable_media_capabilitiesFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_media_capabilitiesFn c_webkit_settings_set_enable_media_capabilities; ///
private alias c_webkit_settings_set_enable_media_streamFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_media_streamFn c_webkit_settings_set_enable_media_stream; ///
private alias c_webkit_settings_set_enable_mediasourceFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_mediasourceFn c_webkit_settings_set_enable_mediasource; ///
private alias c_webkit_settings_set_enable_mock_capture_devicesFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_mock_capture_devicesFn c_webkit_settings_set_enable_mock_capture_devices; ///
private alias c_webkit_settings_set_enable_offline_web_application_cacheFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_offline_web_application_cacheFn c_webkit_settings_set_enable_offline_web_application_cache; ///
private alias c_webkit_settings_set_enable_page_cacheFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_page_cacheFn c_webkit_settings_set_enable_page_cache; ///
private alias c_webkit_settings_set_enable_resizable_text_areasFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_resizable_text_areasFn c_webkit_settings_set_enable_resizable_text_areas; ///
private alias c_webkit_settings_set_enable_site_specific_quirksFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_site_specific_quirksFn c_webkit_settings_set_enable_site_specific_quirks; ///
private alias c_webkit_settings_set_enable_smooth_scrollingFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_smooth_scrollingFn c_webkit_settings_set_enable_smooth_scrolling; ///
private alias c_webkit_settings_set_enable_spatial_navigationFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_spatial_navigationFn c_webkit_settings_set_enable_spatial_navigation; ///
private alias c_webkit_settings_set_enable_tabs_to_linksFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_tabs_to_linksFn c_webkit_settings_set_enable_tabs_to_links; ///
private alias c_webkit_settings_set_enable_webaudioFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_webaudioFn c_webkit_settings_set_enable_webaudio; ///
private alias c_webkit_settings_set_enable_webglFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_webglFn c_webkit_settings_set_enable_webgl; ///
private alias c_webkit_settings_set_enable_webrtcFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_webrtcFn c_webkit_settings_set_enable_webrtc; ///
private alias c_webkit_settings_set_enable_write_console_messages_to_stdoutFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_enable_write_console_messages_to_stdoutFn c_webkit_settings_set_enable_write_console_messages_to_stdout; ///
private alias c_webkit_settings_set_fantasy_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* fantasyFontFamily) nothrow;
__gshared c_webkit_settings_set_fantasy_font_familyFn c_webkit_settings_set_fantasy_font_family; ///
private alias c_webkit_settings_set_feature_enabledFn = extern(C) void function(WebKitSettings* settings, WebKitFeature* feature, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_feature_enabledFn c_webkit_settings_set_feature_enabled; ///
private alias c_webkit_settings_set_hardware_acceleration_policyFn = extern(C) void function(WebKitSettings* settings, WebKitHardwareAccelerationPolicy policy) nothrow;
__gshared c_webkit_settings_set_hardware_acceleration_policyFn c_webkit_settings_set_hardware_acceleration_policy; ///
private alias c_webkit_settings_set_javascript_can_access_clipboardFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_javascript_can_access_clipboardFn c_webkit_settings_set_javascript_can_access_clipboard; ///
private alias c_webkit_settings_set_javascript_can_open_windows_automaticallyFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_javascript_can_open_windows_automaticallyFn c_webkit_settings_set_javascript_can_open_windows_automatically; ///
private alias c_webkit_settings_set_load_icons_ignoring_image_load_settingFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_load_icons_ignoring_image_load_settingFn c_webkit_settings_set_load_icons_ignoring_image_load_setting; ///
private alias c_webkit_settings_set_math_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* mathFontFamily) nothrow;
__gshared c_webkit_settings_set_math_font_familyFn c_webkit_settings_set_math_font_family; ///
private alias c_webkit_settings_set_media_content_types_requiring_hardware_supportFn = extern(C) void function(WebKitSettings* settings, const(char)* contentTypes) nothrow;
__gshared c_webkit_settings_set_media_content_types_requiring_hardware_supportFn c_webkit_settings_set_media_content_types_requiring_hardware_support; ///
private alias c_webkit_settings_set_media_playback_allows_inlineFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_media_playback_allows_inlineFn c_webkit_settings_set_media_playback_allows_inline; ///
private alias c_webkit_settings_set_media_playback_requires_user_gestureFn = extern(C) void function(WebKitSettings* settings, gboolean enabled) nothrow;
__gshared c_webkit_settings_set_media_playback_requires_user_gestureFn c_webkit_settings_set_media_playback_requires_user_gesture; ///
private alias c_webkit_settings_set_minimum_font_sizeFn = extern(C) void function(WebKitSettings* settings, uint fontSize) nothrow;
__gshared c_webkit_settings_set_minimum_font_sizeFn c_webkit_settings_set_minimum_font_size; ///
private alias c_webkit_settings_set_monospace_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* monospaceFontFamily) nothrow;
__gshared c_webkit_settings_set_monospace_font_familyFn c_webkit_settings_set_monospace_font_family; ///
private alias c_webkit_settings_set_pictograph_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* pictographFontFamily) nothrow;
__gshared c_webkit_settings_set_pictograph_font_familyFn c_webkit_settings_set_pictograph_font_family; ///
private alias c_webkit_settings_set_print_backgroundsFn = extern(C) void function(WebKitSettings* settings, gboolean printBackgrounds) nothrow;
__gshared c_webkit_settings_set_print_backgroundsFn c_webkit_settings_set_print_backgrounds; ///
private alias c_webkit_settings_set_sans_serif_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* sansSerifFontFamily) nothrow;
__gshared c_webkit_settings_set_sans_serif_font_familyFn c_webkit_settings_set_sans_serif_font_family; ///
private alias c_webkit_settings_set_serif_font_familyFn = extern(C) void function(WebKitSettings* settings, const(char)* serifFontFamily) nothrow;
__gshared c_webkit_settings_set_serif_font_familyFn c_webkit_settings_set_serif_font_family; ///
private alias c_webkit_settings_set_user_agentFn = extern(C) void function(WebKitSettings* settings, const(char)* userAgent) nothrow;
__gshared c_webkit_settings_set_user_agentFn c_webkit_settings_set_user_agent; ///
private alias c_webkit_settings_set_user_agent_with_application_detailsFn = extern(C) void function(WebKitSettings* settings, const(char)* applicationName, const(char)* applicationVersion) nothrow;
__gshared c_webkit_settings_set_user_agent_with_application_detailsFn c_webkit_settings_set_user_agent_with_application_details; ///
private alias c_webkit_settings_set_webrtc_udp_ports_rangeFn = extern(C) void function(WebKitSettings* settings, const(char)* udpPortRange) nothrow;
__gshared c_webkit_settings_set_webrtc_udp_ports_rangeFn c_webkit_settings_set_webrtc_udp_ports_range; ///
private alias c_webkit_settings_set_zoom_text_onlyFn = extern(C) void function(WebKitSettings* settings, gboolean zoomTextOnly) nothrow;
__gshared c_webkit_settings_set_zoom_text_onlyFn c_webkit_settings_set_zoom_text_only; ///

// URIRequest
private alias c_webkit_uri_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_uri_request_get_typeFn c_webkit_uri_request_get_type; ///
private alias c_webkit_uri_request_newFn = extern(C) WebKitURIRequest* function(const(char)* uri) nothrow;
__gshared c_webkit_uri_request_newFn c_webkit_uri_request_new; ///
private alias c_webkit_uri_request_get_http_headersFn = extern(C) SoupMessageHeaders* function(WebKitURIRequest* request) nothrow;
__gshared c_webkit_uri_request_get_http_headersFn c_webkit_uri_request_get_http_headers; ///
private alias c_webkit_uri_request_get_http_methodFn = extern(C) const(char)* function(WebKitURIRequest* request) nothrow;
__gshared c_webkit_uri_request_get_http_methodFn c_webkit_uri_request_get_http_method; ///
private alias c_webkit_uri_request_get_uriFn = extern(C) const(char)* function(WebKitURIRequest* request) nothrow;
__gshared c_webkit_uri_request_get_uriFn c_webkit_uri_request_get_uri; ///
private alias c_webkit_uri_request_set_uriFn = extern(C) void function(WebKitURIRequest* request, const(char)* uri) nothrow;
__gshared c_webkit_uri_request_set_uriFn c_webkit_uri_request_set_uri; ///

// URIResponse
private alias c_webkit_uri_response_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_uri_response_get_typeFn c_webkit_uri_response_get_type; ///
private alias c_webkit_uri_response_get_content_lengthFn = extern(C) ulong function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_content_lengthFn c_webkit_uri_response_get_content_length; ///
private alias c_webkit_uri_response_get_http_headersFn = extern(C) SoupMessageHeaders* function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_http_headersFn c_webkit_uri_response_get_http_headers; ///
private alias c_webkit_uri_response_get_mime_typeFn = extern(C) const(char)* function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_mime_typeFn c_webkit_uri_response_get_mime_type; ///
private alias c_webkit_uri_response_get_status_codeFn = extern(C) uint function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_status_codeFn c_webkit_uri_response_get_status_code; ///
private alias c_webkit_uri_response_get_suggested_filenameFn = extern(C) const(char)* function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_suggested_filenameFn c_webkit_uri_response_get_suggested_filename; ///
private alias c_webkit_uri_response_get_uriFn = extern(C) const(char)* function(WebKitURIResponse* response) nothrow;
__gshared c_webkit_uri_response_get_uriFn c_webkit_uri_response_get_uri; ///

// URISchemeRequest
private alias c_webkit_uri_scheme_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_uri_scheme_request_get_typeFn c_webkit_uri_scheme_request_get_type; ///
private alias c_webkit_uri_scheme_request_finishFn = extern(C) void function(WebKitURISchemeRequest* request, GInputStream* stream, long streamLength, const(char)* contentType) nothrow;
__gshared c_webkit_uri_scheme_request_finishFn c_webkit_uri_scheme_request_finish; ///
private alias c_webkit_uri_scheme_request_finish_errorFn = extern(C) void function(WebKitURISchemeRequest* request, GError* error) nothrow;
__gshared c_webkit_uri_scheme_request_finish_errorFn c_webkit_uri_scheme_request_finish_error; ///
private alias c_webkit_uri_scheme_request_finish_with_responseFn = extern(C) void function(WebKitURISchemeRequest* request, WebKitURISchemeResponse* response) nothrow;
__gshared c_webkit_uri_scheme_request_finish_with_responseFn c_webkit_uri_scheme_request_finish_with_response; ///
private alias c_webkit_uri_scheme_request_get_http_bodyFn = extern(C) GInputStream* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_http_bodyFn c_webkit_uri_scheme_request_get_http_body; ///
private alias c_webkit_uri_scheme_request_get_http_headersFn = extern(C) SoupMessageHeaders* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_http_headersFn c_webkit_uri_scheme_request_get_http_headers; ///
private alias c_webkit_uri_scheme_request_get_http_methodFn = extern(C) const(char)* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_http_methodFn c_webkit_uri_scheme_request_get_http_method; ///
private alias c_webkit_uri_scheme_request_get_pathFn = extern(C) const(char)* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_pathFn c_webkit_uri_scheme_request_get_path; ///
private alias c_webkit_uri_scheme_request_get_schemeFn = extern(C) const(char)* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_schemeFn c_webkit_uri_scheme_request_get_scheme; ///
private alias c_webkit_uri_scheme_request_get_uriFn = extern(C) const(char)* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_uriFn c_webkit_uri_scheme_request_get_uri; ///
private alias c_webkit_uri_scheme_request_get_web_viewFn = extern(C) WebKitWebView* function(WebKitURISchemeRequest* request) nothrow;
__gshared c_webkit_uri_scheme_request_get_web_viewFn c_webkit_uri_scheme_request_get_web_view; ///

// URISchemeResponse
private alias c_webkit_uri_scheme_response_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_uri_scheme_response_get_typeFn c_webkit_uri_scheme_response_get_type; ///
private alias c_webkit_uri_scheme_response_newFn = extern(C) WebKitURISchemeResponse* function(GInputStream* inputStream, long streamLength) nothrow;
__gshared c_webkit_uri_scheme_response_newFn c_webkit_uri_scheme_response_new; ///
private alias c_webkit_uri_scheme_response_set_content_typeFn = extern(C) void function(WebKitURISchemeResponse* response, const(char)* contentType) nothrow;
__gshared c_webkit_uri_scheme_response_set_content_typeFn c_webkit_uri_scheme_response_set_content_type; ///
private alias c_webkit_uri_scheme_response_set_http_headersFn = extern(C) void function(WebKitURISchemeResponse* response, SoupMessageHeaders* headers) nothrow;
__gshared c_webkit_uri_scheme_response_set_http_headersFn c_webkit_uri_scheme_response_set_http_headers; ///
private alias c_webkit_uri_scheme_response_set_statusFn = extern(C) void function(WebKitURISchemeResponse* response, uint statusCode, const(char)* reasonPhrase) nothrow;
__gshared c_webkit_uri_scheme_response_set_statusFn c_webkit_uri_scheme_response_set_status; ///

// UserContentFilter
private alias c_webkit_user_content_filter_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_content_filter_get_typeFn c_webkit_user_content_filter_get_type; ///
private alias c_webkit_user_content_filter_get_identifierFn = extern(C) const(char)* function(WebKitUserContentFilter* userContentFilter) nothrow;
__gshared c_webkit_user_content_filter_get_identifierFn c_webkit_user_content_filter_get_identifier; ///
private alias c_webkit_user_content_filter_refFn = extern(C) WebKitUserContentFilter* function(WebKitUserContentFilter* userContentFilter) nothrow;
__gshared c_webkit_user_content_filter_refFn c_webkit_user_content_filter_ref; ///
private alias c_webkit_user_content_filter_unrefFn = extern(C) void function(WebKitUserContentFilter* userContentFilter) nothrow;
__gshared c_webkit_user_content_filter_unrefFn c_webkit_user_content_filter_unref; ///

// UserContentFilterStore
private alias c_webkit_user_content_filter_store_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_content_filter_store_get_typeFn c_webkit_user_content_filter_store_get_type; ///
private alias c_webkit_user_content_filter_store_newFn = extern(C) WebKitUserContentFilterStore* function(const(char)* storagePath) nothrow;
__gshared c_webkit_user_content_filter_store_newFn c_webkit_user_content_filter_store_new; ///
private alias c_webkit_user_content_filter_store_fetch_identifiersFn = extern(C) void function(WebKitUserContentFilterStore* store, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_user_content_filter_store_fetch_identifiersFn c_webkit_user_content_filter_store_fetch_identifiers; ///
private alias c_webkit_user_content_filter_store_fetch_identifiers_finishFn = extern(C) char** function(WebKitUserContentFilterStore* store, GAsyncResult* result) nothrow;
__gshared c_webkit_user_content_filter_store_fetch_identifiers_finishFn c_webkit_user_content_filter_store_fetch_identifiers_finish; ///
private alias c_webkit_user_content_filter_store_get_pathFn = extern(C) const(char)* function(WebKitUserContentFilterStore* store) nothrow;
__gshared c_webkit_user_content_filter_store_get_pathFn c_webkit_user_content_filter_store_get_path; ///
private alias c_webkit_user_content_filter_store_loadFn = extern(C) void function(WebKitUserContentFilterStore* store, const(char)* identifier, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_user_content_filter_store_loadFn c_webkit_user_content_filter_store_load; ///
private alias c_webkit_user_content_filter_store_load_finishFn = extern(C) WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_user_content_filter_store_load_finishFn c_webkit_user_content_filter_store_load_finish; ///
private alias c_webkit_user_content_filter_store_removeFn = extern(C) void function(WebKitUserContentFilterStore* store, const(char)* identifier, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_user_content_filter_store_removeFn c_webkit_user_content_filter_store_remove; ///
private alias c_webkit_user_content_filter_store_remove_finishFn = extern(C) gboolean function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_user_content_filter_store_remove_finishFn c_webkit_user_content_filter_store_remove_finish; ///
private alias c_webkit_user_content_filter_store_saveFn = extern(C) void function(WebKitUserContentFilterStore* store, const(char)* identifier, GBytes* source, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_user_content_filter_store_saveFn c_webkit_user_content_filter_store_save; ///
private alias c_webkit_user_content_filter_store_save_finishFn = extern(C) WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_user_content_filter_store_save_finishFn c_webkit_user_content_filter_store_save_finish; ///
private alias c_webkit_user_content_filter_store_save_from_fileFn = extern(C) void function(WebKitUserContentFilterStore* store, const(char)* identifier, GFile* file, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_user_content_filter_store_save_from_fileFn c_webkit_user_content_filter_store_save_from_file; ///
private alias c_webkit_user_content_filter_store_save_from_file_finishFn = extern(C) WebKitUserContentFilter* function(WebKitUserContentFilterStore* store, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_user_content_filter_store_save_from_file_finishFn c_webkit_user_content_filter_store_save_from_file_finish; ///

// UserContentManager
private alias c_webkit_user_content_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_content_manager_get_typeFn c_webkit_user_content_manager_get_type; ///
private alias c_webkit_user_content_manager_newFn = extern(C) WebKitUserContentManager* function() nothrow;
__gshared c_webkit_user_content_manager_newFn c_webkit_user_content_manager_new; ///
private alias c_webkit_user_content_manager_add_filterFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserContentFilter* filter) nothrow;
__gshared c_webkit_user_content_manager_add_filterFn c_webkit_user_content_manager_add_filter; ///
private alias c_webkit_user_content_manager_add_scriptFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserScript* script) nothrow;
__gshared c_webkit_user_content_manager_add_scriptFn c_webkit_user_content_manager_add_script; ///
private alias c_webkit_user_content_manager_add_style_sheetFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserStyleSheet* stylesheet) nothrow;
__gshared c_webkit_user_content_manager_add_style_sheetFn c_webkit_user_content_manager_add_style_sheet; ///
private alias c_webkit_user_content_manager_register_script_message_handlerFn = extern(C) gboolean function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) nothrow;
__gshared c_webkit_user_content_manager_register_script_message_handlerFn c_webkit_user_content_manager_register_script_message_handler; ///
private alias c_webkit_user_content_manager_register_script_message_handler_with_replyFn = extern(C) gboolean function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) nothrow;
__gshared c_webkit_user_content_manager_register_script_message_handler_with_replyFn c_webkit_user_content_manager_register_script_message_handler_with_reply; ///
private alias c_webkit_user_content_manager_remove_all_filtersFn = extern(C) void function(WebKitUserContentManager* manager) nothrow;
__gshared c_webkit_user_content_manager_remove_all_filtersFn c_webkit_user_content_manager_remove_all_filters; ///
private alias c_webkit_user_content_manager_remove_all_scriptsFn = extern(C) void function(WebKitUserContentManager* manager) nothrow;
__gshared c_webkit_user_content_manager_remove_all_scriptsFn c_webkit_user_content_manager_remove_all_scripts; ///
private alias c_webkit_user_content_manager_remove_all_style_sheetsFn = extern(C) void function(WebKitUserContentManager* manager) nothrow;
__gshared c_webkit_user_content_manager_remove_all_style_sheetsFn c_webkit_user_content_manager_remove_all_style_sheets; ///
private alias c_webkit_user_content_manager_remove_filterFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserContentFilter* filter) nothrow;
__gshared c_webkit_user_content_manager_remove_filterFn c_webkit_user_content_manager_remove_filter; ///
private alias c_webkit_user_content_manager_remove_filter_by_idFn = extern(C) void function(WebKitUserContentManager* manager, const(char)* filterId) nothrow;
__gshared c_webkit_user_content_manager_remove_filter_by_idFn c_webkit_user_content_manager_remove_filter_by_id; ///
private alias c_webkit_user_content_manager_remove_scriptFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserScript* script) nothrow;
__gshared c_webkit_user_content_manager_remove_scriptFn c_webkit_user_content_manager_remove_script; ///
private alias c_webkit_user_content_manager_remove_style_sheetFn = extern(C) void function(WebKitUserContentManager* manager, WebKitUserStyleSheet* stylesheet) nothrow;
__gshared c_webkit_user_content_manager_remove_style_sheetFn c_webkit_user_content_manager_remove_style_sheet; ///
private alias c_webkit_user_content_manager_unregister_script_message_handlerFn = extern(C) void function(WebKitUserContentManager* manager, const(char)* name, const(char)* worldName) nothrow;
__gshared c_webkit_user_content_manager_unregister_script_message_handlerFn c_webkit_user_content_manager_unregister_script_message_handler; ///

// UserMediaPermissionRequest
private alias c_webkit_user_media_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_media_permission_request_get_typeFn c_webkit_user_media_permission_request_get_type; ///

// UserMessage
private alias c_webkit_user_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_message_get_typeFn c_webkit_user_message_get_type; ///
private alias c_webkit_user_message_newFn = extern(C) WebKitUserMessage* function(const(char)* name, GVariant* parameters) nothrow;
__gshared c_webkit_user_message_newFn c_webkit_user_message_new; ///
private alias c_webkit_user_message_new_with_fd_listFn = extern(C) WebKitUserMessage* function(const(char)* name, GVariant* parameters, GUnixFDList* fdList) nothrow;
__gshared c_webkit_user_message_new_with_fd_listFn c_webkit_user_message_new_with_fd_list; ///
private alias c_webkit_user_message_get_fd_listFn = extern(C) GUnixFDList* function(WebKitUserMessage* message) nothrow;
__gshared c_webkit_user_message_get_fd_listFn c_webkit_user_message_get_fd_list; ///
private alias c_webkit_user_message_get_nameFn = extern(C) const(char)* function(WebKitUserMessage* message) nothrow;
__gshared c_webkit_user_message_get_nameFn c_webkit_user_message_get_name; ///
private alias c_webkit_user_message_get_parametersFn = extern(C) GVariant* function(WebKitUserMessage* message) nothrow;
__gshared c_webkit_user_message_get_parametersFn c_webkit_user_message_get_parameters; ///
private alias c_webkit_user_message_send_replyFn = extern(C) void function(WebKitUserMessage* message, WebKitUserMessage* reply) nothrow;
__gshared c_webkit_user_message_send_replyFn c_webkit_user_message_send_reply; ///

// UserScript
private alias c_webkit_user_script_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_script_get_typeFn c_webkit_user_script_get_type; ///
private alias c_webkit_user_script_newFn = extern(C) WebKitUserScript* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserScriptInjectionTime injectionTime, const(char*)* allowList, const(char*)* blockList) nothrow;
__gshared c_webkit_user_script_newFn c_webkit_user_script_new; ///
private alias c_webkit_user_script_new_for_worldFn = extern(C) WebKitUserScript* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserScriptInjectionTime injectionTime, const(char)* worldName, const(char*)* allowList, const(char*)* blockList) nothrow;
__gshared c_webkit_user_script_new_for_worldFn c_webkit_user_script_new_for_world; ///
private alias c_webkit_user_script_refFn = extern(C) WebKitUserScript* function(WebKitUserScript* userScript) nothrow;
__gshared c_webkit_user_script_refFn c_webkit_user_script_ref; ///
private alias c_webkit_user_script_unrefFn = extern(C) void function(WebKitUserScript* userScript) nothrow;
__gshared c_webkit_user_script_unrefFn c_webkit_user_script_unref; ///

// UserStyleSheet
private alias c_webkit_user_style_sheet_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_user_style_sheet_get_typeFn c_webkit_user_style_sheet_get_type; ///
private alias c_webkit_user_style_sheet_newFn = extern(C) WebKitUserStyleSheet* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserStyleLevel level, const(char*)* allowList, const(char*)* blockList) nothrow;
__gshared c_webkit_user_style_sheet_newFn c_webkit_user_style_sheet_new; ///
private alias c_webkit_user_style_sheet_new_for_worldFn = extern(C) WebKitUserStyleSheet* function(const(char)* source, WebKitUserContentInjectedFrames injectedFrames, WebKitUserStyleLevel level, const(char)* worldName, const(char*)* allowList, const(char*)* blockList) nothrow;
__gshared c_webkit_user_style_sheet_new_for_worldFn c_webkit_user_style_sheet_new_for_world; ///
private alias c_webkit_user_style_sheet_refFn = extern(C) WebKitUserStyleSheet* function(WebKitUserStyleSheet* userStyleSheet) nothrow;
__gshared c_webkit_user_style_sheet_refFn c_webkit_user_style_sheet_ref; ///
private alias c_webkit_user_style_sheet_unrefFn = extern(C) void function(WebKitUserStyleSheet* userStyleSheet) nothrow;
__gshared c_webkit_user_style_sheet_unrefFn c_webkit_user_style_sheet_unref; ///

// WebContext
private alias c_webkit_web_context_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_context_get_typeFn c_webkit_web_context_get_type; ///
private alias c_webkit_web_context_newFn = extern(C) WebKitWebContext* function() nothrow;
__gshared c_webkit_web_context_newFn c_webkit_web_context_new; ///
private alias c_webkit_web_context_get_defaultFn = extern(C) WebKitWebContext* function() nothrow;
__gshared c_webkit_web_context_get_defaultFn c_webkit_web_context_get_default; ///
private alias c_webkit_web_context_add_path_to_sandboxFn = extern(C) void function(WebKitWebContext* context, const(char)* path, gboolean readOnly) nothrow;
__gshared c_webkit_web_context_add_path_to_sandboxFn c_webkit_web_context_add_path_to_sandbox; ///
private alias c_webkit_web_context_get_cache_modelFn = extern(C) WebKitCacheModel function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_cache_modelFn c_webkit_web_context_get_cache_model; ///
private alias c_webkit_web_context_get_geolocation_managerFn = extern(C) WebKitGeolocationManager* function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_geolocation_managerFn c_webkit_web_context_get_geolocation_manager; ///
private alias c_webkit_web_context_get_network_session_for_automationFn = extern(C) WebKitNetworkSession* function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_network_session_for_automationFn c_webkit_web_context_get_network_session_for_automation; ///
private alias c_webkit_web_context_get_security_managerFn = extern(C) WebKitSecurityManager* function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_security_managerFn c_webkit_web_context_get_security_manager; ///
private alias c_webkit_web_context_get_spell_checking_enabledFn = extern(C) gboolean function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_spell_checking_enabledFn c_webkit_web_context_get_spell_checking_enabled; ///
private alias c_webkit_web_context_get_spell_checking_languagesFn = extern(C) const(char*)* function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_spell_checking_languagesFn c_webkit_web_context_get_spell_checking_languages; ///
private alias c_webkit_web_context_get_time_zone_overrideFn = extern(C) const(char)* function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_get_time_zone_overrideFn c_webkit_web_context_get_time_zone_override; ///
private alias c_webkit_web_context_initialize_notification_permissionsFn = extern(C) void function(WebKitWebContext* context, GList* allowedOrigins, GList* disallowedOrigins) nothrow;
__gshared c_webkit_web_context_initialize_notification_permissionsFn c_webkit_web_context_initialize_notification_permissions; ///
private alias c_webkit_web_context_is_automation_allowedFn = extern(C) gboolean function(WebKitWebContext* context) nothrow;
__gshared c_webkit_web_context_is_automation_allowedFn c_webkit_web_context_is_automation_allowed; ///
private alias c_webkit_web_context_register_uri_schemeFn = extern(C) void function(WebKitWebContext* context, const(char)* scheme, WebKitURISchemeRequestCallback callback, void* userData, GDestroyNotify userDataDestroyFunc) nothrow;
__gshared c_webkit_web_context_register_uri_schemeFn c_webkit_web_context_register_uri_scheme; ///
private alias c_webkit_web_context_send_message_to_all_extensionsFn = extern(C) void function(WebKitWebContext* context, WebKitUserMessage* message) nothrow;
__gshared c_webkit_web_context_send_message_to_all_extensionsFn c_webkit_web_context_send_message_to_all_extensions; ///
private alias c_webkit_web_context_set_automation_allowedFn = extern(C) void function(WebKitWebContext* context, gboolean allowed) nothrow;
__gshared c_webkit_web_context_set_automation_allowedFn c_webkit_web_context_set_automation_allowed; ///
private alias c_webkit_web_context_set_cache_modelFn = extern(C) void function(WebKitWebContext* context, WebKitCacheModel cacheModel) nothrow;
__gshared c_webkit_web_context_set_cache_modelFn c_webkit_web_context_set_cache_model; ///
private alias c_webkit_web_context_set_preferred_languagesFn = extern(C) void function(WebKitWebContext* context, const(char*)* languages) nothrow;
__gshared c_webkit_web_context_set_preferred_languagesFn c_webkit_web_context_set_preferred_languages; ///
private alias c_webkit_web_context_set_spell_checking_enabledFn = extern(C) void function(WebKitWebContext* context, gboolean enabled) nothrow;
__gshared c_webkit_web_context_set_spell_checking_enabledFn c_webkit_web_context_set_spell_checking_enabled; ///
private alias c_webkit_web_context_set_spell_checking_languagesFn = extern(C) void function(WebKitWebContext* context, const(char*)* languages) nothrow;
__gshared c_webkit_web_context_set_spell_checking_languagesFn c_webkit_web_context_set_spell_checking_languages; ///
private alias c_webkit_web_context_set_web_process_extensions_directoryFn = extern(C) void function(WebKitWebContext* context, const(char)* directory) nothrow;
__gshared c_webkit_web_context_set_web_process_extensions_directoryFn c_webkit_web_context_set_web_process_extensions_directory; ///
private alias c_webkit_web_context_set_web_process_extensions_initialization_user_dataFn = extern(C) void function(WebKitWebContext* context, GVariant* userData) nothrow;
__gshared c_webkit_web_context_set_web_process_extensions_initialization_user_dataFn c_webkit_web_context_set_web_process_extensions_initialization_user_data; ///

// WebExtension
private alias c_webkit_web_extension_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_extension_get_typeFn c_webkit_web_extension_get_type; ///
private alias c_webkit_web_extension_newFn = extern(C) WebKitWebExtension* function(const(char)* extensionPath, GError** _err) nothrow;
__gshared c_webkit_web_extension_newFn c_webkit_web_extension_new; ///
private alias c_webkit_web_extension_get_action_iconFn = extern(C) GIcon* function(WebKitWebExtension* extension, double width, double height) nothrow;
__gshared c_webkit_web_extension_get_action_iconFn c_webkit_web_extension_get_action_icon; ///
private alias c_webkit_web_extension_get_all_requested_match_patternsFn = extern(C) WebKitWebExtensionMatchPattern** function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_all_requested_match_patternsFn c_webkit_web_extension_get_all_requested_match_patterns; ///
private alias c_webkit_web_extension_get_default_localeFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_default_localeFn c_webkit_web_extension_get_default_locale; ///
private alias c_webkit_web_extension_get_display_action_labelFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_display_action_labelFn c_webkit_web_extension_get_display_action_label; ///
private alias c_webkit_web_extension_get_display_descriptionFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_display_descriptionFn c_webkit_web_extension_get_display_description; ///
private alias c_webkit_web_extension_get_display_nameFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_display_nameFn c_webkit_web_extension_get_display_name; ///
private alias c_webkit_web_extension_get_display_short_nameFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_display_short_nameFn c_webkit_web_extension_get_display_short_name; ///
private alias c_webkit_web_extension_get_display_versionFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_display_versionFn c_webkit_web_extension_get_display_version; ///
private alias c_webkit_web_extension_get_has_background_contentFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_background_contentFn c_webkit_web_extension_get_has_background_content; ///
private alias c_webkit_web_extension_get_has_commandsFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_commandsFn c_webkit_web_extension_get_has_commands; ///
private alias c_webkit_web_extension_get_has_content_modification_rulesFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_content_modification_rulesFn c_webkit_web_extension_get_has_content_modification_rules; ///
private alias c_webkit_web_extension_get_has_injected_contentFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_injected_contentFn c_webkit_web_extension_get_has_injected_content; ///
private alias c_webkit_web_extension_get_has_options_pageFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_options_pageFn c_webkit_web_extension_get_has_options_page; ///
private alias c_webkit_web_extension_get_has_override_new_tab_pageFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_override_new_tab_pageFn c_webkit_web_extension_get_has_override_new_tab_page; ///
private alias c_webkit_web_extension_get_has_persistent_background_contentFn = extern(C) gboolean function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_has_persistent_background_contentFn c_webkit_web_extension_get_has_persistent_background_content; ///
private alias c_webkit_web_extension_get_iconFn = extern(C) GIcon* function(WebKitWebExtension* extension, double width, double height) nothrow;
__gshared c_webkit_web_extension_get_iconFn c_webkit_web_extension_get_icon; ///
private alias c_webkit_web_extension_get_manifest_versionFn = extern(C) double function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_manifest_versionFn c_webkit_web_extension_get_manifest_version; ///
private alias c_webkit_web_extension_get_optional_permission_match_patternsFn = extern(C) WebKitWebExtensionMatchPattern** function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_optional_permission_match_patternsFn c_webkit_web_extension_get_optional_permission_match_patterns; ///
private alias c_webkit_web_extension_get_optional_permissionsFn = extern(C) const(char*)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_optional_permissionsFn c_webkit_web_extension_get_optional_permissions; ///
private alias c_webkit_web_extension_get_pathFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_pathFn c_webkit_web_extension_get_path; ///
private alias c_webkit_web_extension_get_requested_permission_match_patternsFn = extern(C) WebKitWebExtensionMatchPattern** function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_requested_permission_match_patternsFn c_webkit_web_extension_get_requested_permission_match_patterns; ///
private alias c_webkit_web_extension_get_requested_permissionsFn = extern(C) const(char*)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_requested_permissionsFn c_webkit_web_extension_get_requested_permissions; ///
private alias c_webkit_web_extension_get_versionFn = extern(C) const(char)* function(WebKitWebExtension* extension) nothrow;
__gshared c_webkit_web_extension_get_versionFn c_webkit_web_extension_get_version; ///
private alias c_webkit_web_extension_supports_manifest_versionFn = extern(C) gboolean function(WebKitWebExtension* extension, double manifestVersion) nothrow;
__gshared c_webkit_web_extension_supports_manifest_versionFn c_webkit_web_extension_supports_manifest_version; ///

// WebExtensionMatchPattern
private alias c_webkit_web_extension_match_pattern_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_extension_match_pattern_get_typeFn c_webkit_web_extension_match_pattern_get_type; ///
private alias c_webkit_web_extension_match_pattern_new_all_hosts_and_schemesFn = extern(C) WebKitWebExtensionMatchPattern* function() nothrow;
__gshared c_webkit_web_extension_match_pattern_new_all_hosts_and_schemesFn c_webkit_web_extension_match_pattern_new_all_hosts_and_schemes; ///
private alias c_webkit_web_extension_match_pattern_new_all_urlsFn = extern(C) WebKitWebExtensionMatchPattern* function() nothrow;
__gshared c_webkit_web_extension_match_pattern_new_all_urlsFn c_webkit_web_extension_match_pattern_new_all_urls; ///
private alias c_webkit_web_extension_match_pattern_new_with_schemeFn = extern(C) WebKitWebExtensionMatchPattern* function(const(char)* scheme, const(char)* host, const(char)* path, GError** _err) nothrow;
__gshared c_webkit_web_extension_match_pattern_new_with_schemeFn c_webkit_web_extension_match_pattern_new_with_scheme; ///
private alias c_webkit_web_extension_match_pattern_new_with_stringFn = extern(C) WebKitWebExtensionMatchPattern* function(const(char)* string_, GError** _err) nothrow;
__gshared c_webkit_web_extension_match_pattern_new_with_stringFn c_webkit_web_extension_match_pattern_new_with_string; ///
private alias c_webkit_web_extension_match_pattern_get_hostFn = extern(C) const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_hostFn c_webkit_web_extension_match_pattern_get_host; ///
private alias c_webkit_web_extension_match_pattern_get_matches_all_hostsFn = extern(C) gboolean function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_matches_all_hostsFn c_webkit_web_extension_match_pattern_get_matches_all_hosts; ///
private alias c_webkit_web_extension_match_pattern_get_matches_all_urlsFn = extern(C) gboolean function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_matches_all_urlsFn c_webkit_web_extension_match_pattern_get_matches_all_urls; ///
private alias c_webkit_web_extension_match_pattern_get_pathFn = extern(C) const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_pathFn c_webkit_web_extension_match_pattern_get_path; ///
private alias c_webkit_web_extension_match_pattern_get_schemeFn = extern(C) const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_schemeFn c_webkit_web_extension_match_pattern_get_scheme; ///
private alias c_webkit_web_extension_match_pattern_get_stringFn = extern(C) const(char)* function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_get_stringFn c_webkit_web_extension_match_pattern_get_string; ///
private alias c_webkit_web_extension_match_pattern_matches_patternFn = extern(C) gboolean function(WebKitWebExtensionMatchPattern* matchPattern, WebKitWebExtensionMatchPattern* pattern, WebKitWebExtensionMatchPatternOptions options) nothrow;
__gshared c_webkit_web_extension_match_pattern_matches_patternFn c_webkit_web_extension_match_pattern_matches_pattern; ///
private alias c_webkit_web_extension_match_pattern_matches_urlFn = extern(C) gboolean function(WebKitWebExtensionMatchPattern* matchPattern, const(char)* url, WebKitWebExtensionMatchPatternOptions options) nothrow;
__gshared c_webkit_web_extension_match_pattern_matches_urlFn c_webkit_web_extension_match_pattern_matches_url; ///
private alias c_webkit_web_extension_match_pattern_refFn = extern(C) WebKitWebExtensionMatchPattern* function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_refFn c_webkit_web_extension_match_pattern_ref; ///
private alias c_webkit_web_extension_match_pattern_unrefFn = extern(C) void function(WebKitWebExtensionMatchPattern* matchPattern) nothrow;
__gshared c_webkit_web_extension_match_pattern_unrefFn c_webkit_web_extension_match_pattern_unref; ///
private alias c_webkit_web_extension_match_pattern_register_custom_URL_schemeFn = extern(C) void function(const(char)* urlScheme) nothrow;
__gshared c_webkit_web_extension_match_pattern_register_custom_URL_schemeFn c_webkit_web_extension_match_pattern_register_custom_URL_scheme; ///
private alias c_webkit_web_extension_match_pattern_register_custom_url_schemeFn = extern(C) void function(const(char)* urlScheme) nothrow;
__gshared c_webkit_web_extension_match_pattern_register_custom_url_schemeFn c_webkit_web_extension_match_pattern_register_custom_url_scheme; ///

// WebInspector
private alias c_webkit_web_inspector_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_inspector_get_typeFn c_webkit_web_inspector_get_type; ///
private alias c_webkit_web_inspector_attachFn = extern(C) void function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_attachFn c_webkit_web_inspector_attach; ///
private alias c_webkit_web_inspector_closeFn = extern(C) void function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_closeFn c_webkit_web_inspector_close; ///
private alias c_webkit_web_inspector_detachFn = extern(C) void function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_detachFn c_webkit_web_inspector_detach; ///
private alias c_webkit_web_inspector_get_attached_heightFn = extern(C) uint function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_get_attached_heightFn c_webkit_web_inspector_get_attached_height; ///
private alias c_webkit_web_inspector_get_can_attachFn = extern(C) gboolean function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_get_can_attachFn c_webkit_web_inspector_get_can_attach; ///
private alias c_webkit_web_inspector_get_inspected_uriFn = extern(C) const(char)* function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_get_inspected_uriFn c_webkit_web_inspector_get_inspected_uri; ///
private alias c_webkit_web_inspector_get_web_viewFn = extern(C) WebKitWebViewBase* function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_get_web_viewFn c_webkit_web_inspector_get_web_view; ///
private alias c_webkit_web_inspector_is_attachedFn = extern(C) gboolean function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_is_attachedFn c_webkit_web_inspector_is_attached; ///
private alias c_webkit_web_inspector_showFn = extern(C) void function(WebKitWebInspector* inspector) nothrow;
__gshared c_webkit_web_inspector_showFn c_webkit_web_inspector_show; ///

// WebResource
private alias c_webkit_web_resource_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_resource_get_typeFn c_webkit_web_resource_get_type; ///
private alias c_webkit_web_resource_get_dataFn = extern(C) void function(WebKitWebResource* resource, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_resource_get_dataFn c_webkit_web_resource_get_data; ///
private alias c_webkit_web_resource_get_data_finishFn = extern(C) ubyte* function(WebKitWebResource* resource, GAsyncResult* result, size_t* length, GError** _err) nothrow;
__gshared c_webkit_web_resource_get_data_finishFn c_webkit_web_resource_get_data_finish; ///
private alias c_webkit_web_resource_get_responseFn = extern(C) WebKitURIResponse* function(WebKitWebResource* resource) nothrow;
__gshared c_webkit_web_resource_get_responseFn c_webkit_web_resource_get_response; ///
private alias c_webkit_web_resource_get_uriFn = extern(C) const(char)* function(WebKitWebResource* resource) nothrow;
__gshared c_webkit_web_resource_get_uriFn c_webkit_web_resource_get_uri; ///

// WebView
private alias c_webkit_web_view_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_view_get_typeFn c_webkit_web_view_get_type; ///
private alias c_webkit_web_view_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_webkit_web_view_newFn c_webkit_web_view_new; ///
private alias c_webkit_web_view_call_async_javascript_functionFn = extern(C) void function(WebKitWebView* webView, const(char)* body_, ptrdiff_t length, GVariant* arguments, const(char)* worldName, const(char)* sourceUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_call_async_javascript_functionFn c_webkit_web_view_call_async_javascript_function; ///
private alias c_webkit_web_view_call_async_javascript_function_finishFn = extern(C) JSCValue* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_call_async_javascript_function_finishFn c_webkit_web_view_call_async_javascript_function_finish; ///
private alias c_webkit_web_view_can_execute_editing_commandFn = extern(C) void function(WebKitWebView* webView, const(char)* command, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_can_execute_editing_commandFn c_webkit_web_view_can_execute_editing_command; ///
private alias c_webkit_web_view_can_execute_editing_command_finishFn = extern(C) gboolean function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_can_execute_editing_command_finishFn c_webkit_web_view_can_execute_editing_command_finish; ///
private alias c_webkit_web_view_can_go_backFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_can_go_backFn c_webkit_web_view_can_go_back; ///
private alias c_webkit_web_view_can_go_forwardFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_can_go_forwardFn c_webkit_web_view_can_go_forward; ///
private alias c_webkit_web_view_can_show_mime_typeFn = extern(C) gboolean function(WebKitWebView* webView, const(char)* mimeType) nothrow;
__gshared c_webkit_web_view_can_show_mime_typeFn c_webkit_web_view_can_show_mime_type; ///
private alias c_webkit_web_view_download_uriFn = extern(C) WebKitDownload* function(WebKitWebView* webView, const(char)* uri) nothrow;
__gshared c_webkit_web_view_download_uriFn c_webkit_web_view_download_uri; ///
private alias c_webkit_web_view_evaluate_javascriptFn = extern(C) void function(WebKitWebView* webView, const(char)* script, ptrdiff_t length, const(char)* worldName, const(char)* sourceUri, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_evaluate_javascriptFn c_webkit_web_view_evaluate_javascript; ///
private alias c_webkit_web_view_evaluate_javascript_finishFn = extern(C) JSCValue* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_evaluate_javascript_finishFn c_webkit_web_view_evaluate_javascript_finish; ///
private alias c_webkit_web_view_execute_editing_commandFn = extern(C) void function(WebKitWebView* webView, const(char)* command) nothrow;
__gshared c_webkit_web_view_execute_editing_commandFn c_webkit_web_view_execute_editing_command; ///
private alias c_webkit_web_view_execute_editing_command_with_argumentFn = extern(C) void function(WebKitWebView* webView, const(char)* command, const(char)* argument) nothrow;
__gshared c_webkit_web_view_execute_editing_command_with_argumentFn c_webkit_web_view_execute_editing_command_with_argument; ///
private alias c_webkit_web_view_get_automation_presentation_typeFn = extern(C) WebKitAutomationBrowsingContextPresentation function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_automation_presentation_typeFn c_webkit_web_view_get_automation_presentation_type; ///
private alias c_webkit_web_view_get_back_forward_listFn = extern(C) WebKitBackForwardList* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_back_forward_listFn c_webkit_web_view_get_back_forward_list; ///
private alias c_webkit_web_view_get_background_colorFn = extern(C) void function(WebKitWebView* webView, GdkRGBA* rgba) nothrow;
__gshared c_webkit_web_view_get_background_colorFn c_webkit_web_view_get_background_color; ///
private alias c_webkit_web_view_get_camera_capture_stateFn = extern(C) WebKitMediaCaptureState function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_camera_capture_stateFn c_webkit_web_view_get_camera_capture_state; ///
private alias c_webkit_web_view_get_contextFn = extern(C) WebKitWebContext* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_contextFn c_webkit_web_view_get_context; ///
private alias c_webkit_web_view_get_custom_charsetFn = extern(C) const(char)* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_custom_charsetFn c_webkit_web_view_get_custom_charset; ///
private alias c_webkit_web_view_get_default_content_security_policyFn = extern(C) const(char)* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_default_content_security_policyFn c_webkit_web_view_get_default_content_security_policy; ///
private alias c_webkit_web_view_get_display_capture_stateFn = extern(C) WebKitMediaCaptureState function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_display_capture_stateFn c_webkit_web_view_get_display_capture_state; ///
private alias c_webkit_web_view_get_editor_stateFn = extern(C) WebKitEditorState* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_editor_stateFn c_webkit_web_view_get_editor_state; ///
private alias c_webkit_web_view_get_estimated_load_progressFn = extern(C) double function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_estimated_load_progressFn c_webkit_web_view_get_estimated_load_progress; ///
private alias c_webkit_web_view_get_faviconFn = extern(C) GdkTexture* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_faviconFn c_webkit_web_view_get_favicon; ///
private alias c_webkit_web_view_get_find_controllerFn = extern(C) WebKitFindController* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_find_controllerFn c_webkit_web_view_get_find_controller; ///
private alias c_webkit_web_view_get_input_method_contextFn = extern(C) WebKitInputMethodContext* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_input_method_contextFn c_webkit_web_view_get_input_method_context; ///
private alias c_webkit_web_view_get_inspectorFn = extern(C) WebKitWebInspector* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_inspectorFn c_webkit_web_view_get_inspector; ///
private alias c_webkit_web_view_get_is_mutedFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_is_mutedFn c_webkit_web_view_get_is_muted; ///
private alias c_webkit_web_view_get_is_web_process_responsiveFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_is_web_process_responsiveFn c_webkit_web_view_get_is_web_process_responsive; ///
private alias c_webkit_web_view_get_main_resourceFn = extern(C) WebKitWebResource* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_main_resourceFn c_webkit_web_view_get_main_resource; ///
private alias c_webkit_web_view_get_microphone_capture_stateFn = extern(C) WebKitMediaCaptureState function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_microphone_capture_stateFn c_webkit_web_view_get_microphone_capture_state; ///
private alias c_webkit_web_view_get_network_sessionFn = extern(C) WebKitNetworkSession* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_network_sessionFn c_webkit_web_view_get_network_session; ///
private alias c_webkit_web_view_get_page_idFn = extern(C) ulong function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_page_idFn c_webkit_web_view_get_page_id; ///
private alias c_webkit_web_view_get_session_stateFn = extern(C) WebKitWebViewSessionState* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_session_stateFn c_webkit_web_view_get_session_state; ///
private alias c_webkit_web_view_get_settingsFn = extern(C) WebKitSettings* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_settingsFn c_webkit_web_view_get_settings; ///
private alias c_webkit_web_view_get_snapshotFn = extern(C) void function(WebKitWebView* webView, WebKitSnapshotRegion region, WebKitSnapshotOptions options, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_get_snapshotFn c_webkit_web_view_get_snapshot; ///
private alias c_webkit_web_view_get_snapshot_finishFn = extern(C) GdkTexture* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_get_snapshot_finishFn c_webkit_web_view_get_snapshot_finish; ///
private alias c_webkit_web_view_get_theme_colorFn = extern(C) gboolean function(WebKitWebView* webView, GdkRGBA* rgba) nothrow;
__gshared c_webkit_web_view_get_theme_colorFn c_webkit_web_view_get_theme_color; ///
private alias c_webkit_web_view_get_titleFn = extern(C) const(char)* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_titleFn c_webkit_web_view_get_title; ///
private alias c_webkit_web_view_get_tls_infoFn = extern(C) gboolean function(WebKitWebView* webView, GTlsCertificate** certificate, GTlsCertificateFlags* errors) nothrow;
__gshared c_webkit_web_view_get_tls_infoFn c_webkit_web_view_get_tls_info; ///
private alias c_webkit_web_view_get_uriFn = extern(C) const(char)* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_uriFn c_webkit_web_view_get_uri; ///
private alias c_webkit_web_view_get_user_content_managerFn = extern(C) WebKitUserContentManager* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_user_content_managerFn c_webkit_web_view_get_user_content_manager; ///
private alias c_webkit_web_view_get_web_extension_modeFn = extern(C) WebKitWebExtensionMode function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_web_extension_modeFn c_webkit_web_view_get_web_extension_mode; ///
private alias c_webkit_web_view_get_website_policiesFn = extern(C) WebKitWebsitePolicies* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_website_policiesFn c_webkit_web_view_get_website_policies; ///
private alias c_webkit_web_view_get_window_propertiesFn = extern(C) WebKitWindowProperties* function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_window_propertiesFn c_webkit_web_view_get_window_properties; ///
private alias c_webkit_web_view_get_zoom_levelFn = extern(C) double function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_get_zoom_levelFn c_webkit_web_view_get_zoom_level; ///
private alias c_webkit_web_view_go_backFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_go_backFn c_webkit_web_view_go_back; ///
private alias c_webkit_web_view_go_forwardFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_go_forwardFn c_webkit_web_view_go_forward; ///
private alias c_webkit_web_view_go_to_back_forward_list_itemFn = extern(C) void function(WebKitWebView* webView, WebKitBackForwardListItem* listItem) nothrow;
__gshared c_webkit_web_view_go_to_back_forward_list_itemFn c_webkit_web_view_go_to_back_forward_list_item; ///
private alias c_webkit_web_view_is_controlled_by_automationFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_is_controlled_by_automationFn c_webkit_web_view_is_controlled_by_automation; ///
private alias c_webkit_web_view_is_editableFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_is_editableFn c_webkit_web_view_is_editable; ///
private alias c_webkit_web_view_is_immersive_mode_enabledFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_is_immersive_mode_enabledFn c_webkit_web_view_is_immersive_mode_enabled; ///
private alias c_webkit_web_view_is_loadingFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_is_loadingFn c_webkit_web_view_is_loading; ///
private alias c_webkit_web_view_is_playing_audioFn = extern(C) gboolean function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_is_playing_audioFn c_webkit_web_view_is_playing_audio; ///
private alias c_webkit_web_view_leave_immersive_modeFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_leave_immersive_modeFn c_webkit_web_view_leave_immersive_mode; ///
private alias c_webkit_web_view_load_alternate_htmlFn = extern(C) void function(WebKitWebView* webView, const(char)* content, const(char)* contentUri, const(char)* baseUri) nothrow;
__gshared c_webkit_web_view_load_alternate_htmlFn c_webkit_web_view_load_alternate_html; ///
private alias c_webkit_web_view_load_bytesFn = extern(C) void function(WebKitWebView* webView, GBytes* bytes, const(char)* mimeType, const(char)* encoding, const(char)* baseUri) nothrow;
__gshared c_webkit_web_view_load_bytesFn c_webkit_web_view_load_bytes; ///
private alias c_webkit_web_view_load_htmlFn = extern(C) void function(WebKitWebView* webView, const(char)* content, const(char)* baseUri) nothrow;
__gshared c_webkit_web_view_load_htmlFn c_webkit_web_view_load_html; ///
private alias c_webkit_web_view_load_plain_textFn = extern(C) void function(WebKitWebView* webView, const(char)* plainText) nothrow;
__gshared c_webkit_web_view_load_plain_textFn c_webkit_web_view_load_plain_text; ///
private alias c_webkit_web_view_load_requestFn = extern(C) void function(WebKitWebView* webView, WebKitURIRequest* request) nothrow;
__gshared c_webkit_web_view_load_requestFn c_webkit_web_view_load_request; ///
private alias c_webkit_web_view_load_uriFn = extern(C) void function(WebKitWebView* webView, const(char)* uri) nothrow;
__gshared c_webkit_web_view_load_uriFn c_webkit_web_view_load_uri; ///
private alias c_webkit_web_view_reloadFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_reloadFn c_webkit_web_view_reload; ///
private alias c_webkit_web_view_reload_bypass_cacheFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_reload_bypass_cacheFn c_webkit_web_view_reload_bypass_cache; ///
private alias c_webkit_web_view_restore_session_stateFn = extern(C) void function(WebKitWebView* webView, WebKitWebViewSessionState* state) nothrow;
__gshared c_webkit_web_view_restore_session_stateFn c_webkit_web_view_restore_session_state; ///
private alias c_webkit_web_view_saveFn = extern(C) void function(WebKitWebView* webView, WebKitSaveMode saveMode, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_saveFn c_webkit_web_view_save; ///
private alias c_webkit_web_view_save_finishFn = extern(C) GInputStream* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_save_finishFn c_webkit_web_view_save_finish; ///
private alias c_webkit_web_view_save_to_fileFn = extern(C) void function(WebKitWebView* webView, GFile* file, WebKitSaveMode saveMode, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_save_to_fileFn c_webkit_web_view_save_to_file; ///
private alias c_webkit_web_view_save_to_file_finishFn = extern(C) gboolean function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_save_to_file_finishFn c_webkit_web_view_save_to_file_finish; ///
private alias c_webkit_web_view_send_message_to_pageFn = extern(C) void function(WebKitWebView* webView, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_view_send_message_to_pageFn c_webkit_web_view_send_message_to_page; ///
private alias c_webkit_web_view_send_message_to_page_finishFn = extern(C) WebKitUserMessage* function(WebKitWebView* webView, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_view_send_message_to_page_finishFn c_webkit_web_view_send_message_to_page_finish; ///
private alias c_webkit_web_view_set_background_colorFn = extern(C) void function(WebKitWebView* webView, const(GdkRGBA)* rgba) nothrow;
__gshared c_webkit_web_view_set_background_colorFn c_webkit_web_view_set_background_color; ///
private alias c_webkit_web_view_set_camera_capture_stateFn = extern(C) void function(WebKitWebView* webView, WebKitMediaCaptureState state) nothrow;
__gshared c_webkit_web_view_set_camera_capture_stateFn c_webkit_web_view_set_camera_capture_state; ///
private alias c_webkit_web_view_set_cors_allowlistFn = extern(C) void function(WebKitWebView* webView, const(char*)* allowlist) nothrow;
__gshared c_webkit_web_view_set_cors_allowlistFn c_webkit_web_view_set_cors_allowlist; ///
private alias c_webkit_web_view_set_custom_charsetFn = extern(C) void function(WebKitWebView* webView, const(char)* charset) nothrow;
__gshared c_webkit_web_view_set_custom_charsetFn c_webkit_web_view_set_custom_charset; ///
private alias c_webkit_web_view_set_display_capture_stateFn = extern(C) void function(WebKitWebView* webView, WebKitMediaCaptureState state) nothrow;
__gshared c_webkit_web_view_set_display_capture_stateFn c_webkit_web_view_set_display_capture_state; ///
private alias c_webkit_web_view_set_editableFn = extern(C) void function(WebKitWebView* webView, gboolean editable) nothrow;
__gshared c_webkit_web_view_set_editableFn c_webkit_web_view_set_editable; ///
private alias c_webkit_web_view_set_input_method_contextFn = extern(C) void function(WebKitWebView* webView, WebKitInputMethodContext* context) nothrow;
__gshared c_webkit_web_view_set_input_method_contextFn c_webkit_web_view_set_input_method_context; ///
private alias c_webkit_web_view_set_is_mutedFn = extern(C) void function(WebKitWebView* webView, gboolean muted) nothrow;
__gshared c_webkit_web_view_set_is_mutedFn c_webkit_web_view_set_is_muted; ///
private alias c_webkit_web_view_set_microphone_capture_stateFn = extern(C) void function(WebKitWebView* webView, WebKitMediaCaptureState state) nothrow;
__gshared c_webkit_web_view_set_microphone_capture_stateFn c_webkit_web_view_set_microphone_capture_state; ///
private alias c_webkit_web_view_set_settingsFn = extern(C) void function(WebKitWebView* webView, WebKitSettings* settings) nothrow;
__gshared c_webkit_web_view_set_settingsFn c_webkit_web_view_set_settings; ///
private alias c_webkit_web_view_set_zoom_levelFn = extern(C) void function(WebKitWebView* webView, double zoomLevel) nothrow;
__gshared c_webkit_web_view_set_zoom_levelFn c_webkit_web_view_set_zoom_level; ///
private alias c_webkit_web_view_stop_loadingFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_stop_loadingFn c_webkit_web_view_stop_loading; ///
private alias c_webkit_web_view_terminate_web_processFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_terminate_web_processFn c_webkit_web_view_terminate_web_process; ///
private alias c_webkit_web_view_try_closeFn = extern(C) void function(WebKitWebView* webView) nothrow;
__gshared c_webkit_web_view_try_closeFn c_webkit_web_view_try_close; ///

// WebViewBase
private alias c_webkit_web_view_base_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_view_base_get_typeFn c_webkit_web_view_base_get_type; ///

// WebViewSessionState
private alias c_webkit_web_view_session_state_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_view_session_state_get_typeFn c_webkit_web_view_session_state_get_type; ///
private alias c_webkit_web_view_session_state_newFn = extern(C) WebKitWebViewSessionState* function(GBytes* data) nothrow;
__gshared c_webkit_web_view_session_state_newFn c_webkit_web_view_session_state_new; ///
private alias c_webkit_web_view_session_state_refFn = extern(C) WebKitWebViewSessionState* function(WebKitWebViewSessionState* state) nothrow;
__gshared c_webkit_web_view_session_state_refFn c_webkit_web_view_session_state_ref; ///
private alias c_webkit_web_view_session_state_serializeFn = extern(C) GBytes* function(WebKitWebViewSessionState* state) nothrow;
__gshared c_webkit_web_view_session_state_serializeFn c_webkit_web_view_session_state_serialize; ///
private alias c_webkit_web_view_session_state_unrefFn = extern(C) void function(WebKitWebViewSessionState* state) nothrow;
__gshared c_webkit_web_view_session_state_unrefFn c_webkit_web_view_session_state_unref; ///

// WebsiteData
private alias c_webkit_website_data_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_website_data_get_typeFn c_webkit_website_data_get_type; ///
private alias c_webkit_website_data_get_nameFn = extern(C) const(char)* function(WebKitWebsiteData* websiteData) nothrow;
__gshared c_webkit_website_data_get_nameFn c_webkit_website_data_get_name; ///
private alias c_webkit_website_data_get_sizeFn = extern(C) ulong function(WebKitWebsiteData* websiteData, WebKitWebsiteDataTypes types) nothrow;
__gshared c_webkit_website_data_get_sizeFn c_webkit_website_data_get_size; ///
private alias c_webkit_website_data_get_typesFn = extern(C) WebKitWebsiteDataTypes function(WebKitWebsiteData* websiteData) nothrow;
__gshared c_webkit_website_data_get_typesFn c_webkit_website_data_get_types; ///
private alias c_webkit_website_data_refFn = extern(C) WebKitWebsiteData* function(WebKitWebsiteData* websiteData) nothrow;
__gshared c_webkit_website_data_refFn c_webkit_website_data_ref; ///
private alias c_webkit_website_data_unrefFn = extern(C) void function(WebKitWebsiteData* websiteData) nothrow;
__gshared c_webkit_website_data_unrefFn c_webkit_website_data_unref; ///

// WebsiteDataAccessPermissionRequest
private alias c_webkit_website_data_access_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_website_data_access_permission_request_get_typeFn c_webkit_website_data_access_permission_request_get_type; ///
private alias c_webkit_website_data_access_permission_request_get_current_domainFn = extern(C) const(char)* function(WebKitWebsiteDataAccessPermissionRequest* request) nothrow;
__gshared c_webkit_website_data_access_permission_request_get_current_domainFn c_webkit_website_data_access_permission_request_get_current_domain; ///
private alias c_webkit_website_data_access_permission_request_get_requesting_domainFn = extern(C) const(char)* function(WebKitWebsiteDataAccessPermissionRequest* request) nothrow;
__gshared c_webkit_website_data_access_permission_request_get_requesting_domainFn c_webkit_website_data_access_permission_request_get_requesting_domain; ///

// WebsiteDataManager
private alias c_webkit_website_data_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_website_data_manager_get_typeFn c_webkit_website_data_manager_get_type; ///
private alias c_webkit_website_data_manager_clearFn = extern(C) void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GTimeSpan timespan, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_website_data_manager_clearFn c_webkit_website_data_manager_clear; ///
private alias c_webkit_website_data_manager_clear_finishFn = extern(C) gboolean function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_website_data_manager_clear_finishFn c_webkit_website_data_manager_clear_finish; ///
private alias c_webkit_website_data_manager_fetchFn = extern(C) void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_website_data_manager_fetchFn c_webkit_website_data_manager_fetch; ///
private alias c_webkit_website_data_manager_fetch_finishFn = extern(C) GList* function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_website_data_manager_fetch_finishFn c_webkit_website_data_manager_fetch_finish; ///
private alias c_webkit_website_data_manager_get_base_cache_directoryFn = extern(C) const(char)* function(WebKitWebsiteDataManager* manager) nothrow;
__gshared c_webkit_website_data_manager_get_base_cache_directoryFn c_webkit_website_data_manager_get_base_cache_directory; ///
private alias c_webkit_website_data_manager_get_base_data_directoryFn = extern(C) const(char)* function(WebKitWebsiteDataManager* manager) nothrow;
__gshared c_webkit_website_data_manager_get_base_data_directoryFn c_webkit_website_data_manager_get_base_data_directory; ///
private alias c_webkit_website_data_manager_get_favicon_databaseFn = extern(C) WebKitFaviconDatabase* function(WebKitWebsiteDataManager* manager) nothrow;
__gshared c_webkit_website_data_manager_get_favicon_databaseFn c_webkit_website_data_manager_get_favicon_database; ///
private alias c_webkit_website_data_manager_get_favicons_enabledFn = extern(C) gboolean function(WebKitWebsiteDataManager* manager) nothrow;
__gshared c_webkit_website_data_manager_get_favicons_enabledFn c_webkit_website_data_manager_get_favicons_enabled; ///
private alias c_webkit_website_data_manager_get_itp_summaryFn = extern(C) void function(WebKitWebsiteDataManager* manager, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_website_data_manager_get_itp_summaryFn c_webkit_website_data_manager_get_itp_summary; ///
private alias c_webkit_website_data_manager_get_itp_summary_finishFn = extern(C) GList* function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_website_data_manager_get_itp_summary_finishFn c_webkit_website_data_manager_get_itp_summary_finish; ///
private alias c_webkit_website_data_manager_is_ephemeralFn = extern(C) gboolean function(WebKitWebsiteDataManager* manager) nothrow;
__gshared c_webkit_website_data_manager_is_ephemeralFn c_webkit_website_data_manager_is_ephemeral; ///
private alias c_webkit_website_data_manager_removeFn = extern(C) void function(WebKitWebsiteDataManager* manager, WebKitWebsiteDataTypes types, GList* websiteData, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_website_data_manager_removeFn c_webkit_website_data_manager_remove; ///
private alias c_webkit_website_data_manager_remove_finishFn = extern(C) gboolean function(WebKitWebsiteDataManager* manager, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_website_data_manager_remove_finishFn c_webkit_website_data_manager_remove_finish; ///
private alias c_webkit_website_data_manager_set_favicons_enabledFn = extern(C) void function(WebKitWebsiteDataManager* manager, gboolean enabled) nothrow;
__gshared c_webkit_website_data_manager_set_favicons_enabledFn c_webkit_website_data_manager_set_favicons_enabled; ///

// WebsitePolicies
private alias c_webkit_website_policies_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_website_policies_get_typeFn c_webkit_website_policies_get_type; ///
private alias c_webkit_website_policies_newFn = extern(C) WebKitWebsitePolicies* function() nothrow;
__gshared c_webkit_website_policies_newFn c_webkit_website_policies_new; ///
private alias c_webkit_website_policies_new_with_policiesFn = extern(C) WebKitWebsitePolicies* function(const(char)* firstPolicyName,  ...) nothrow;
__gshared c_webkit_website_policies_new_with_policiesFn c_webkit_website_policies_new_with_policies; ///
private alias c_webkit_website_policies_get_autoplay_policyFn = extern(C) WebKitAutoplayPolicy function(WebKitWebsitePolicies* policies) nothrow;
__gshared c_webkit_website_policies_get_autoplay_policyFn c_webkit_website_policies_get_autoplay_policy; ///

// WindowProperties
private alias c_webkit_window_properties_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_window_properties_get_typeFn c_webkit_window_properties_get_type; ///
private alias c_webkit_window_properties_get_fullscreenFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_fullscreenFn c_webkit_window_properties_get_fullscreen; ///
private alias c_webkit_window_properties_get_geometryFn = extern(C) void function(WebKitWindowProperties* windowProperties, GdkRectangle* geometry) nothrow;
__gshared c_webkit_window_properties_get_geometryFn c_webkit_window_properties_get_geometry; ///
private alias c_webkit_window_properties_get_locationbar_visibleFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_locationbar_visibleFn c_webkit_window_properties_get_locationbar_visible; ///
private alias c_webkit_window_properties_get_menubar_visibleFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_menubar_visibleFn c_webkit_window_properties_get_menubar_visible; ///
private alias c_webkit_window_properties_get_resizableFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_resizableFn c_webkit_window_properties_get_resizable; ///
private alias c_webkit_window_properties_get_scrollbars_visibleFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_scrollbars_visibleFn c_webkit_window_properties_get_scrollbars_visible; ///
private alias c_webkit_window_properties_get_statusbar_visibleFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_statusbar_visibleFn c_webkit_window_properties_get_statusbar_visible; ///
private alias c_webkit_window_properties_get_toolbar_visibleFn = extern(C) gboolean function(WebKitWindowProperties* windowProperties) nothrow;
__gshared c_webkit_window_properties_get_toolbar_visibleFn c_webkit_window_properties_get_toolbar_visible; ///

// XRPermissionRequest
private alias c_webkit_xr_permission_request_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_xr_permission_request_get_typeFn c_webkit_xr_permission_request_get_type; ///
private alias c_webkit_xr_permission_request_get_consent_optional_featuresFn = extern(C) WebKitXRSessionFeatures function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_consent_optional_featuresFn c_webkit_xr_permission_request_get_consent_optional_features; ///
private alias c_webkit_xr_permission_request_get_consent_required_featuresFn = extern(C) WebKitXRSessionFeatures function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_consent_required_featuresFn c_webkit_xr_permission_request_get_consent_required_features; ///
private alias c_webkit_xr_permission_request_get_granted_featuresFn = extern(C) WebKitXRSessionFeatures function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_granted_featuresFn c_webkit_xr_permission_request_get_granted_features; ///
private alias c_webkit_xr_permission_request_get_optional_features_requestedFn = extern(C) WebKitXRSessionFeatures function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_optional_features_requestedFn c_webkit_xr_permission_request_get_optional_features_requested; ///
private alias c_webkit_xr_permission_request_get_required_features_requestedFn = extern(C) WebKitXRSessionFeatures function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_required_features_requestedFn c_webkit_xr_permission_request_get_required_features_requested; ///
private alias c_webkit_xr_permission_request_get_security_originFn = extern(C) WebKitSecurityOrigin* function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_security_originFn c_webkit_xr_permission_request_get_security_origin; ///
private alias c_webkit_xr_permission_request_get_session_modeFn = extern(C) WebKitXRSessionMode function(WebKitXRPermissionRequest* request) nothrow;
__gshared c_webkit_xr_permission_request_get_session_modeFn c_webkit_xr_permission_request_get_session_mode; ///
private alias c_webkit_xr_permission_request_set_granted_optional_featuresFn = extern(C) void function(WebKitXRPermissionRequest* request, WebKitXRSessionFeatures granted) nothrow;
__gshared c_webkit_xr_permission_request_set_granted_optional_featuresFn c_webkit_xr_permission_request_set_granted_optional_features; ///

// global
private alias c_webkit_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_webkit_get_major_versionFn c_webkit_get_major_version; ///
private alias c_webkit_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_webkit_get_micro_versionFn c_webkit_get_micro_version; ///
private alias c_webkit_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_webkit_get_minor_versionFn c_webkit_get_minor_version; ///
private alias c_webkit_media_key_system_permission_get_nameFn = extern(C) const(char)* function(WebKitMediaKeySystemPermissionRequest* request) nothrow;
__gshared c_webkit_media_key_system_permission_get_nameFn c_webkit_media_key_system_permission_get_name; ///
private alias c_webkit_uri_for_displayFn = extern(C) char* function(const(char)* uri) nothrow;
__gshared c_webkit_uri_for_displayFn c_webkit_uri_for_display; ///
private alias c_webkit_user_media_permission_is_for_audio_deviceFn = extern(C) gboolean function(WebKitUserMediaPermissionRequest* request) nothrow;
__gshared c_webkit_user_media_permission_is_for_audio_deviceFn c_webkit_user_media_permission_is_for_audio_device; ///
private alias c_webkit_user_media_permission_is_for_display_deviceFn = extern(C) gboolean function(WebKitUserMediaPermissionRequest* request) nothrow;
__gshared c_webkit_user_media_permission_is_for_display_deviceFn c_webkit_user_media_permission_is_for_display_device; ///
private alias c_webkit_user_media_permission_is_for_video_deviceFn = extern(C) gboolean function(WebKitUserMediaPermissionRequest* request) nothrow;
__gshared c_webkit_user_media_permission_is_for_video_deviceFn c_webkit_user_media_permission_is_for_video_device; ///

// DownloadError
private alias c_webkit_download_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_download_error_quarkFn c_webkit_download_error_quark; ///

// FaviconDatabaseError
private alias c_webkit_favicon_database_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_favicon_database_error_quarkFn c_webkit_favicon_database_error_quark; ///

// JavascriptError
private alias c_webkit_javascript_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_javascript_error_quarkFn c_webkit_javascript_error_quark; ///

// MediaError
private alias c_webkit_media_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_media_error_quarkFn c_webkit_media_error_quark; ///

// NetworkError
private alias c_webkit_network_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_network_error_quarkFn c_webkit_network_error_quark; ///

// PolicyError
private alias c_webkit_policy_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_policy_error_quarkFn c_webkit_policy_error_quark; ///

// PrintError
private alias c_webkit_print_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_print_error_quarkFn c_webkit_print_error_quark; ///

// SnapshotError
private alias c_webkit_snapshot_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_snapshot_error_quarkFn c_webkit_snapshot_error_quark; ///

// UserContentFilterError
private alias c_webkit_user_content_filter_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_user_content_filter_error_quarkFn c_webkit_user_content_filter_error_quark; ///

// UserMessageError
private alias c_webkit_user_message_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_user_message_error_quarkFn c_webkit_user_message_error_quark; ///

// WebExtensionError
private alias c_webkit_web_extension_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_web_extension_error_quarkFn c_webkit_web_extension_error_quark; ///

// WebExtensionMatchPatternError
private alias c_webkit_web_extension_match_pattern_error_quarkFn = extern(C) GQuark function() nothrow;
__gshared c_webkit_web_extension_match_pattern_error_quarkFn c_webkit_web_extension_match_pattern_error_quark; ///

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
alias webkit_context_menu_get_position = c_webkit_context_menu_get_position;

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
alias webkit_context_menu_item_get_gaction_target = c_webkit_context_menu_item_get_gaction_target;

/** */
alias webkit_context_menu_item_get_stock_action = c_webkit_context_menu_item_get_stock_action;

/** */
alias webkit_context_menu_item_get_submenu = c_webkit_context_menu_item_get_submenu;

/** */
alias webkit_context_menu_item_get_title = c_webkit_context_menu_item_get_title;

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
alias webkit_settings_get_math_font_family = c_webkit_settings_get_math_font_family;

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
alias webkit_settings_set_math_font_family = c_webkit_settings_set_math_font_family;

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

// WebExtension

/** */
alias webkit_web_extension_get_type = c_webkit_web_extension_get_type;

/** */
alias webkit_web_extension_new = c_webkit_web_extension_new;

/** */
alias webkit_web_extension_get_action_icon = c_webkit_web_extension_get_action_icon;

/** */
alias webkit_web_extension_get_all_requested_match_patterns = c_webkit_web_extension_get_all_requested_match_patterns;

/** */
alias webkit_web_extension_get_default_locale = c_webkit_web_extension_get_default_locale;

/** */
alias webkit_web_extension_get_display_action_label = c_webkit_web_extension_get_display_action_label;

/** */
alias webkit_web_extension_get_display_description = c_webkit_web_extension_get_display_description;

/** */
alias webkit_web_extension_get_display_name = c_webkit_web_extension_get_display_name;

/** */
alias webkit_web_extension_get_display_short_name = c_webkit_web_extension_get_display_short_name;

/** */
alias webkit_web_extension_get_display_version = c_webkit_web_extension_get_display_version;

/** */
alias webkit_web_extension_get_has_background_content = c_webkit_web_extension_get_has_background_content;

/** */
alias webkit_web_extension_get_has_commands = c_webkit_web_extension_get_has_commands;

/** */
alias webkit_web_extension_get_has_content_modification_rules = c_webkit_web_extension_get_has_content_modification_rules;

/** */
alias webkit_web_extension_get_has_injected_content = c_webkit_web_extension_get_has_injected_content;

/** */
alias webkit_web_extension_get_has_options_page = c_webkit_web_extension_get_has_options_page;

/** */
alias webkit_web_extension_get_has_override_new_tab_page = c_webkit_web_extension_get_has_override_new_tab_page;

/** */
alias webkit_web_extension_get_has_persistent_background_content = c_webkit_web_extension_get_has_persistent_background_content;

/** */
alias webkit_web_extension_get_icon = c_webkit_web_extension_get_icon;

/** */
alias webkit_web_extension_get_manifest_version = c_webkit_web_extension_get_manifest_version;

/** */
alias webkit_web_extension_get_optional_permission_match_patterns = c_webkit_web_extension_get_optional_permission_match_patterns;

/** */
alias webkit_web_extension_get_optional_permissions = c_webkit_web_extension_get_optional_permissions;

/** */
alias webkit_web_extension_get_path = c_webkit_web_extension_get_path;

/** */
alias webkit_web_extension_get_requested_permission_match_patterns = c_webkit_web_extension_get_requested_permission_match_patterns;

/** */
alias webkit_web_extension_get_requested_permissions = c_webkit_web_extension_get_requested_permissions;

/** */
alias webkit_web_extension_get_version = c_webkit_web_extension_get_version;

/** */
alias webkit_web_extension_supports_manifest_version = c_webkit_web_extension_supports_manifest_version;

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

/** */
alias webkit_web_extension_match_pattern_register_custom_url_scheme = c_webkit_web_extension_match_pattern_register_custom_url_scheme;

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
alias webkit_web_view_get_theme_color = c_webkit_web_view_get_theme_color;

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
alias webkit_web_view_is_immersive_mode_enabled = c_webkit_web_view_is_immersive_mode_enabled;

/** */
alias webkit_web_view_is_loading = c_webkit_web_view_is_loading;

/** */
alias webkit_web_view_is_playing_audio = c_webkit_web_view_is_playing_audio;

/** */
alias webkit_web_view_leave_immersive_mode = c_webkit_web_view_leave_immersive_mode;

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

// XRPermissionRequest

/** */
alias webkit_xr_permission_request_get_type = c_webkit_xr_permission_request_get_type;

/** */
alias webkit_xr_permission_request_get_consent_optional_features = c_webkit_xr_permission_request_get_consent_optional_features;

/** */
alias webkit_xr_permission_request_get_consent_required_features = c_webkit_xr_permission_request_get_consent_required_features;

/** */
alias webkit_xr_permission_request_get_granted_features = c_webkit_xr_permission_request_get_granted_features;

/** */
alias webkit_xr_permission_request_get_optional_features_requested = c_webkit_xr_permission_request_get_optional_features_requested;

/** */
alias webkit_xr_permission_request_get_required_features_requested = c_webkit_xr_permission_request_get_required_features_requested;

/** */
alias webkit_xr_permission_request_get_security_origin = c_webkit_xr_permission_request_get_security_origin;

/** */
alias webkit_xr_permission_request_get_session_mode = c_webkit_xr_permission_request_get_session_mode;

/** */
alias webkit_xr_permission_request_set_granted_optional_features = c_webkit_xr_permission_request_set_granted_optional_features;

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

// WebExtensionError

/** */
alias webkit_web_extension_error_quark = c_webkit_web_extension_error_quark;

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
  gidLink(cast(void**)&webkit_context_menu_get_position, "webkit_context_menu_get_position", libs);
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
  gidLink(cast(void**)&webkit_context_menu_item_get_gaction_target, "webkit_context_menu_item_get_gaction_target", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_stock_action, "webkit_context_menu_item_get_stock_action", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_submenu, "webkit_context_menu_item_get_submenu", libs);
  gidLink(cast(void**)&webkit_context_menu_item_get_title, "webkit_context_menu_item_get_title", libs);
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
  gidLink(cast(void**)&webkit_settings_get_math_font_family, "webkit_settings_get_math_font_family", libs);
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
  gidLink(cast(void**)&webkit_settings_set_math_font_family, "webkit_settings_set_math_font_family", libs);
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

  // WebExtension
  gidLink(cast(void**)&webkit_web_extension_get_type, "webkit_web_extension_get_type", libs);
  gidLink(cast(void**)&webkit_web_extension_new, "webkit_web_extension_new", libs);
  gidLink(cast(void**)&webkit_web_extension_get_action_icon, "webkit_web_extension_get_action_icon", libs);
  gidLink(cast(void**)&webkit_web_extension_get_all_requested_match_patterns, "webkit_web_extension_get_all_requested_match_patterns", libs);
  gidLink(cast(void**)&webkit_web_extension_get_default_locale, "webkit_web_extension_get_default_locale", libs);
  gidLink(cast(void**)&webkit_web_extension_get_display_action_label, "webkit_web_extension_get_display_action_label", libs);
  gidLink(cast(void**)&webkit_web_extension_get_display_description, "webkit_web_extension_get_display_description", libs);
  gidLink(cast(void**)&webkit_web_extension_get_display_name, "webkit_web_extension_get_display_name", libs);
  gidLink(cast(void**)&webkit_web_extension_get_display_short_name, "webkit_web_extension_get_display_short_name", libs);
  gidLink(cast(void**)&webkit_web_extension_get_display_version, "webkit_web_extension_get_display_version", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_background_content, "webkit_web_extension_get_has_background_content", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_commands, "webkit_web_extension_get_has_commands", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_content_modification_rules, "webkit_web_extension_get_has_content_modification_rules", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_injected_content, "webkit_web_extension_get_has_injected_content", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_options_page, "webkit_web_extension_get_has_options_page", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_override_new_tab_page, "webkit_web_extension_get_has_override_new_tab_page", libs);
  gidLink(cast(void**)&webkit_web_extension_get_has_persistent_background_content, "webkit_web_extension_get_has_persistent_background_content", libs);
  gidLink(cast(void**)&webkit_web_extension_get_icon, "webkit_web_extension_get_icon", libs);
  gidLink(cast(void**)&webkit_web_extension_get_manifest_version, "webkit_web_extension_get_manifest_version", libs);
  gidLink(cast(void**)&webkit_web_extension_get_optional_permission_match_patterns, "webkit_web_extension_get_optional_permission_match_patterns", libs);
  gidLink(cast(void**)&webkit_web_extension_get_optional_permissions, "webkit_web_extension_get_optional_permissions", libs);
  gidLink(cast(void**)&webkit_web_extension_get_path, "webkit_web_extension_get_path", libs);
  gidLink(cast(void**)&webkit_web_extension_get_requested_permission_match_patterns, "webkit_web_extension_get_requested_permission_match_patterns", libs);
  gidLink(cast(void**)&webkit_web_extension_get_requested_permissions, "webkit_web_extension_get_requested_permissions", libs);
  gidLink(cast(void**)&webkit_web_extension_get_version, "webkit_web_extension_get_version", libs);
  gidLink(cast(void**)&webkit_web_extension_supports_manifest_version, "webkit_web_extension_supports_manifest_version", libs);

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
  gidLink(cast(void**)&webkit_web_extension_match_pattern_register_custom_url_scheme, "webkit_web_extension_match_pattern_register_custom_url_scheme", libs);

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
  gidLink(cast(void**)&webkit_web_view_get_theme_color, "webkit_web_view_get_theme_color", libs);
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
  gidLink(cast(void**)&webkit_web_view_is_immersive_mode_enabled, "webkit_web_view_is_immersive_mode_enabled", libs);
  gidLink(cast(void**)&webkit_web_view_is_loading, "webkit_web_view_is_loading", libs);
  gidLink(cast(void**)&webkit_web_view_is_playing_audio, "webkit_web_view_is_playing_audio", libs);
  gidLink(cast(void**)&webkit_web_view_leave_immersive_mode, "webkit_web_view_leave_immersive_mode", libs);
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

  // XRPermissionRequest
  gidLink(cast(void**)&webkit_xr_permission_request_get_type, "webkit_xr_permission_request_get_type", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_consent_optional_features, "webkit_xr_permission_request_get_consent_optional_features", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_consent_required_features, "webkit_xr_permission_request_get_consent_required_features", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_granted_features, "webkit_xr_permission_request_get_granted_features", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_optional_features_requested, "webkit_xr_permission_request_get_optional_features_requested", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_required_features_requested, "webkit_xr_permission_request_get_required_features_requested", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_security_origin, "webkit_xr_permission_request_get_security_origin", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_get_session_mode, "webkit_xr_permission_request_get_session_mode", libs);
  gidLink(cast(void**)&webkit_xr_permission_request_set_granted_optional_features, "webkit_xr_permission_request_set_granted_optional_features", libs);

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

  // WebExtensionError
  gidLink(cast(void**)&webkit_web_extension_error_quark, "webkit_web_extension_error_quark", libs);

  // WebExtensionMatchPatternError
  gidLink(cast(void**)&webkit_web_extension_match_pattern_error_quark, "webkit_web_extension_match_pattern_error_quark", libs);
}
