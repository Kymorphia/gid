/// C functions for webkitwebprocessextension6 library
module gid.webkitwebprocessextension6.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.webkitwebprocessextension6.c.types;
static import gid.webkitwebprocessextension6.c._gidlib_WebKitWebProcessExtension;
public import gid.gtk4.c.types;
public import gid.javascriptcore6.c.types;
public import gid.soup3.c.types;

private immutable LIBS = ["webkitgtk-6.0_4", "javascriptcoregtk-6.0_1"];

private __gshared immutable(bool)* _gidLibMarker = &gid.webkitwebprocessextension6.c._gidlib_WebKitWebProcessExtension.gidLibLinked;

// ConsoleMessage
private alias c_webkit_console_message_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_console_message_get_typeFn c_webkit_console_message_get_type; ///
private alias c_webkit_console_message_copyFn = extern(C) WebKitConsoleMessage* function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_copyFn c_webkit_console_message_copy; ///
private alias c_webkit_console_message_freeFn = extern(C) void function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_freeFn c_webkit_console_message_free; ///
private alias c_webkit_console_message_get_levelFn = extern(C) WebKitConsoleMessageLevel function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_get_levelFn c_webkit_console_message_get_level; ///
private alias c_webkit_console_message_get_lineFn = extern(C) uint function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_get_lineFn c_webkit_console_message_get_line; ///
private alias c_webkit_console_message_get_sourceFn = extern(C) WebKitConsoleMessageSource function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_get_sourceFn c_webkit_console_message_get_source; ///
private alias c_webkit_console_message_get_source_idFn = extern(C) const(char)* function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_get_source_idFn c_webkit_console_message_get_source_id; ///
private alias c_webkit_console_message_get_textFn = extern(C) const(char)* function(WebKitConsoleMessage* consoleMessage) nothrow;
__gshared c_webkit_console_message_get_textFn c_webkit_console_message_get_text; ///

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

// Frame
private alias c_webkit_frame_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_frame_get_typeFn c_webkit_frame_get_type; ///
private alias c_webkit_frame_get_idFn = extern(C) ulong function(WebKitFrame* frame) nothrow;
__gshared c_webkit_frame_get_idFn c_webkit_frame_get_id; ///
private alias c_webkit_frame_get_js_contextFn = extern(C) JSCContext* function(WebKitFrame* frame) nothrow;
__gshared c_webkit_frame_get_js_contextFn c_webkit_frame_get_js_context; ///
private alias c_webkit_frame_get_js_context_for_script_worldFn = extern(C) JSCContext* function(WebKitFrame* frame, WebKitScriptWorld* world) nothrow;
__gshared c_webkit_frame_get_js_context_for_script_worldFn c_webkit_frame_get_js_context_for_script_world; ///
private alias c_webkit_frame_get_uriFn = extern(C) const(char)* function(WebKitFrame* frame) nothrow;
__gshared c_webkit_frame_get_uriFn c_webkit_frame_get_uri; ///
private alias c_webkit_frame_is_main_frameFn = extern(C) gboolean function(WebKitFrame* frame) nothrow;
__gshared c_webkit_frame_is_main_frameFn c_webkit_frame_is_main_frame; ///

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

// ScriptWorld
private alias c_webkit_script_world_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_script_world_get_typeFn c_webkit_script_world_get_type; ///
private alias c_webkit_script_world_newFn = extern(C) WebKitScriptWorld* function() nothrow;
__gshared c_webkit_script_world_newFn c_webkit_script_world_new; ///
private alias c_webkit_script_world_new_with_nameFn = extern(C) WebKitScriptWorld* function(const(char)* name) nothrow;
__gshared c_webkit_script_world_new_with_nameFn c_webkit_script_world_new_with_name; ///
private alias c_webkit_script_world_get_defaultFn = extern(C) WebKitScriptWorld* function() nothrow;
__gshared c_webkit_script_world_get_defaultFn c_webkit_script_world_get_default; ///
private alias c_webkit_script_world_get_nameFn = extern(C) const(char)* function(WebKitScriptWorld* world) nothrow;
__gshared c_webkit_script_world_get_nameFn c_webkit_script_world_get_name; ///

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

// WebEditor
private alias c_webkit_web_editor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_editor_get_typeFn c_webkit_web_editor_get_type; ///
private alias c_webkit_web_editor_get_pageFn = extern(C) WebKitWebPage* function(WebKitWebEditor* editor) nothrow;
__gshared c_webkit_web_editor_get_pageFn c_webkit_web_editor_get_page; ///

// WebFormManager
private alias c_webkit_web_form_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_form_manager_get_typeFn c_webkit_web_form_manager_get_type; ///
private alias c_webkit_web_form_manager_input_element_auto_fillFn = extern(C) void function(JSCValue* element, const(char)* value) nothrow;
__gshared c_webkit_web_form_manager_input_element_auto_fillFn c_webkit_web_form_manager_input_element_auto_fill; ///
private alias c_webkit_web_form_manager_input_element_is_auto_filledFn = extern(C) gboolean function(JSCValue* element) nothrow;
__gshared c_webkit_web_form_manager_input_element_is_auto_filledFn c_webkit_web_form_manager_input_element_is_auto_filled; ///
private alias c_webkit_web_form_manager_input_element_is_user_editedFn = extern(C) gboolean function(JSCValue* element) nothrow;
__gshared c_webkit_web_form_manager_input_element_is_user_editedFn c_webkit_web_form_manager_input_element_is_user_edited; ///

// WebHitTestResult
private alias c_webkit_web_hit_test_result_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_hit_test_result_get_typeFn c_webkit_web_hit_test_result_get_type; ///
private alias c_webkit_web_hit_test_result_context_is_editableFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_editableFn c_webkit_web_hit_test_result_context_is_editable; ///
private alias c_webkit_web_hit_test_result_context_is_imageFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_imageFn c_webkit_web_hit_test_result_context_is_image; ///
private alias c_webkit_web_hit_test_result_context_is_linkFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_linkFn c_webkit_web_hit_test_result_context_is_link; ///
private alias c_webkit_web_hit_test_result_context_is_mediaFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_mediaFn c_webkit_web_hit_test_result_context_is_media; ///
private alias c_webkit_web_hit_test_result_context_is_scrollbarFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_scrollbarFn c_webkit_web_hit_test_result_context_is_scrollbar; ///
private alias c_webkit_web_hit_test_result_context_is_selectionFn = extern(C) gboolean function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_context_is_selectionFn c_webkit_web_hit_test_result_context_is_selection; ///
private alias c_webkit_web_hit_test_result_get_contextFn = extern(C) uint function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_contextFn c_webkit_web_hit_test_result_get_context; ///
private alias c_webkit_web_hit_test_result_get_image_uriFn = extern(C) const(char)* function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_image_uriFn c_webkit_web_hit_test_result_get_image_uri; ///
private alias c_webkit_web_hit_test_result_get_js_nodeFn = extern(C) JSCValue* function(WebKitWebHitTestResult* webHitTestResult, WebKitScriptWorld* world) nothrow;
__gshared c_webkit_web_hit_test_result_get_js_nodeFn c_webkit_web_hit_test_result_get_js_node; ///
private alias c_webkit_web_hit_test_result_get_link_labelFn = extern(C) const(char)* function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_link_labelFn c_webkit_web_hit_test_result_get_link_label; ///
private alias c_webkit_web_hit_test_result_get_link_titleFn = extern(C) const(char)* function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_link_titleFn c_webkit_web_hit_test_result_get_link_title; ///
private alias c_webkit_web_hit_test_result_get_link_uriFn = extern(C) const(char)* function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_link_uriFn c_webkit_web_hit_test_result_get_link_uri; ///
private alias c_webkit_web_hit_test_result_get_media_uriFn = extern(C) const(char)* function(WebKitWebHitTestResult* webHitTestResult) nothrow;
__gshared c_webkit_web_hit_test_result_get_media_uriFn c_webkit_web_hit_test_result_get_media_uri; ///

// WebPage
private alias c_webkit_web_page_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_page_get_typeFn c_webkit_web_page_get_type; ///
private alias c_webkit_web_page_get_editorFn = extern(C) WebKitWebEditor* function(WebKitWebPage* webPage) nothrow;
__gshared c_webkit_web_page_get_editorFn c_webkit_web_page_get_editor; ///
private alias c_webkit_web_page_get_form_managerFn = extern(C) WebKitWebFormManager* function(WebKitWebPage* webPage, WebKitScriptWorld* world) nothrow;
__gshared c_webkit_web_page_get_form_managerFn c_webkit_web_page_get_form_manager; ///
private alias c_webkit_web_page_get_idFn = extern(C) ulong function(WebKitWebPage* webPage) nothrow;
__gshared c_webkit_web_page_get_idFn c_webkit_web_page_get_id; ///
private alias c_webkit_web_page_get_main_frameFn = extern(C) WebKitFrame* function(WebKitWebPage* webPage) nothrow;
__gshared c_webkit_web_page_get_main_frameFn c_webkit_web_page_get_main_frame; ///
private alias c_webkit_web_page_get_uriFn = extern(C) const(char)* function(WebKitWebPage* webPage) nothrow;
__gshared c_webkit_web_page_get_uriFn c_webkit_web_page_get_uri; ///
private alias c_webkit_web_page_send_message_to_viewFn = extern(C) void function(WebKitWebPage* webPage, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_page_send_message_to_viewFn c_webkit_web_page_send_message_to_view; ///
private alias c_webkit_web_page_send_message_to_view_finishFn = extern(C) WebKitUserMessage* function(WebKitWebPage* webPage, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_page_send_message_to_view_finishFn c_webkit_web_page_send_message_to_view_finish; ///

// WebProcessExtension
private alias c_webkit_web_process_extension_get_typeFn = extern(C) GType function() nothrow;
__gshared c_webkit_web_process_extension_get_typeFn c_webkit_web_process_extension_get_type; ///
private alias c_webkit_web_process_extension_get_pageFn = extern(C) WebKitWebPage* function(WebKitWebProcessExtension* extension, ulong pageId) nothrow;
__gshared c_webkit_web_process_extension_get_pageFn c_webkit_web_process_extension_get_page; ///
private alias c_webkit_web_process_extension_send_message_to_contextFn = extern(C) void function(WebKitWebProcessExtension* extension, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_webkit_web_process_extension_send_message_to_contextFn c_webkit_web_process_extension_send_message_to_context; ///
private alias c_webkit_web_process_extension_send_message_to_context_finishFn = extern(C) WebKitUserMessage* function(WebKitWebProcessExtension* extension, GAsyncResult* result, GError** _err) nothrow;
__gshared c_webkit_web_process_extension_send_message_to_context_finishFn c_webkit_web_process_extension_send_message_to_context_finish; ///

// ConsoleMessage

/** */
alias webkit_console_message_get_type = c_webkit_console_message_get_type;

/** */
alias webkit_console_message_copy = c_webkit_console_message_copy;

/** */
alias webkit_console_message_free = c_webkit_console_message_free;

/** */
alias webkit_console_message_get_level = c_webkit_console_message_get_level;

/** */
alias webkit_console_message_get_line = c_webkit_console_message_get_line;

/** */
alias webkit_console_message_get_source = c_webkit_console_message_get_source;

/** */
alias webkit_console_message_get_source_id = c_webkit_console_message_get_source_id;

/** */
alias webkit_console_message_get_text = c_webkit_console_message_get_text;

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

// Frame

/** */
alias webkit_frame_get_type = c_webkit_frame_get_type;

/** */
alias webkit_frame_get_id = c_webkit_frame_get_id;

/** */
alias webkit_frame_get_js_context = c_webkit_frame_get_js_context;

/** */
alias webkit_frame_get_js_context_for_script_world = c_webkit_frame_get_js_context_for_script_world;

/** */
alias webkit_frame_get_uri = c_webkit_frame_get_uri;

/** */
alias webkit_frame_is_main_frame = c_webkit_frame_is_main_frame;

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

// ScriptWorld

/** */
alias webkit_script_world_get_type = c_webkit_script_world_get_type;

/** */
alias webkit_script_world_new = c_webkit_script_world_new;

/** */
alias webkit_script_world_new_with_name = c_webkit_script_world_new_with_name;

/** */
alias webkit_script_world_get_default = c_webkit_script_world_get_default;

/** */
alias webkit_script_world_get_name = c_webkit_script_world_get_name;

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

// WebEditor

/** */
alias webkit_web_editor_get_type = c_webkit_web_editor_get_type;

/** */
alias webkit_web_editor_get_page = c_webkit_web_editor_get_page;

// WebFormManager

/** */
alias webkit_web_form_manager_get_type = c_webkit_web_form_manager_get_type;

/** */
alias webkit_web_form_manager_input_element_auto_fill = c_webkit_web_form_manager_input_element_auto_fill;

/** */
alias webkit_web_form_manager_input_element_is_auto_filled = c_webkit_web_form_manager_input_element_is_auto_filled;

/** */
alias webkit_web_form_manager_input_element_is_user_edited = c_webkit_web_form_manager_input_element_is_user_edited;

// WebHitTestResult

/** */
alias webkit_web_hit_test_result_get_type = c_webkit_web_hit_test_result_get_type;

/** */
alias webkit_web_hit_test_result_context_is_editable = c_webkit_web_hit_test_result_context_is_editable;

/** */
alias webkit_web_hit_test_result_context_is_image = c_webkit_web_hit_test_result_context_is_image;

/** */
alias webkit_web_hit_test_result_context_is_link = c_webkit_web_hit_test_result_context_is_link;

/** */
alias webkit_web_hit_test_result_context_is_media = c_webkit_web_hit_test_result_context_is_media;

/** */
alias webkit_web_hit_test_result_context_is_scrollbar = c_webkit_web_hit_test_result_context_is_scrollbar;

/** */
alias webkit_web_hit_test_result_context_is_selection = c_webkit_web_hit_test_result_context_is_selection;

/** */
alias webkit_web_hit_test_result_get_context = c_webkit_web_hit_test_result_get_context;

/** */
alias webkit_web_hit_test_result_get_image_uri = c_webkit_web_hit_test_result_get_image_uri;

/** */
alias webkit_web_hit_test_result_get_js_node = c_webkit_web_hit_test_result_get_js_node;

/** */
alias webkit_web_hit_test_result_get_link_label = c_webkit_web_hit_test_result_get_link_label;

/** */
alias webkit_web_hit_test_result_get_link_title = c_webkit_web_hit_test_result_get_link_title;

/** */
alias webkit_web_hit_test_result_get_link_uri = c_webkit_web_hit_test_result_get_link_uri;

/** */
alias webkit_web_hit_test_result_get_media_uri = c_webkit_web_hit_test_result_get_media_uri;

// WebPage

/** */
alias webkit_web_page_get_type = c_webkit_web_page_get_type;

/** */
alias webkit_web_page_get_editor = c_webkit_web_page_get_editor;

/** */
alias webkit_web_page_get_form_manager = c_webkit_web_page_get_form_manager;

/** */
alias webkit_web_page_get_id = c_webkit_web_page_get_id;

/** */
alias webkit_web_page_get_main_frame = c_webkit_web_page_get_main_frame;

/** */
alias webkit_web_page_get_uri = c_webkit_web_page_get_uri;

/** */
alias webkit_web_page_send_message_to_view = c_webkit_web_page_send_message_to_view;

/** */
alias webkit_web_page_send_message_to_view_finish = c_webkit_web_page_send_message_to_view_finish;

// WebProcessExtension

/** */
alias webkit_web_process_extension_get_type = c_webkit_web_process_extension_get_type;

/** */
alias webkit_web_process_extension_get_page = c_webkit_web_process_extension_get_page;

/** */
alias webkit_web_process_extension_send_message_to_context = c_webkit_web_process_extension_send_message_to_context;

/** */
alias webkit_web_process_extension_send_message_to_context_finish = c_webkit_web_process_extension_send_message_to_context_finish;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.webkitwebprocessextension6", "WebKitWebProcessExtension");

  // ConsoleMessage
  gidLink(cast(void**)&webkit_console_message_get_type, "webkit_console_message_get_type", libs);
  gidLink(cast(void**)&webkit_console_message_copy, "webkit_console_message_copy", libs);
  gidLink(cast(void**)&webkit_console_message_free, "webkit_console_message_free", libs);
  gidLink(cast(void**)&webkit_console_message_get_level, "webkit_console_message_get_level", libs);
  gidLink(cast(void**)&webkit_console_message_get_line, "webkit_console_message_get_line", libs);
  gidLink(cast(void**)&webkit_console_message_get_source, "webkit_console_message_get_source", libs);
  gidLink(cast(void**)&webkit_console_message_get_source_id, "webkit_console_message_get_source_id", libs);
  gidLink(cast(void**)&webkit_console_message_get_text, "webkit_console_message_get_text", libs);

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

  // Frame
  gidLink(cast(void**)&webkit_frame_get_type, "webkit_frame_get_type", libs);
  gidLink(cast(void**)&webkit_frame_get_id, "webkit_frame_get_id", libs);
  gidLink(cast(void**)&webkit_frame_get_js_context, "webkit_frame_get_js_context", libs);
  gidLink(cast(void**)&webkit_frame_get_js_context_for_script_world, "webkit_frame_get_js_context_for_script_world", libs);
  gidLink(cast(void**)&webkit_frame_get_uri, "webkit_frame_get_uri", libs);
  gidLink(cast(void**)&webkit_frame_is_main_frame, "webkit_frame_is_main_frame", libs);

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

  // ScriptWorld
  gidLink(cast(void**)&webkit_script_world_get_type, "webkit_script_world_get_type", libs);
  gidLink(cast(void**)&webkit_script_world_new, "webkit_script_world_new", libs);
  gidLink(cast(void**)&webkit_script_world_new_with_name, "webkit_script_world_new_with_name", libs);
  gidLink(cast(void**)&webkit_script_world_get_default, "webkit_script_world_get_default", libs);
  gidLink(cast(void**)&webkit_script_world_get_name, "webkit_script_world_get_name", libs);

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

  // UserMessage
  gidLink(cast(void**)&webkit_user_message_get_type, "webkit_user_message_get_type", libs);
  gidLink(cast(void**)&webkit_user_message_new, "webkit_user_message_new", libs);
  gidLink(cast(void**)&webkit_user_message_new_with_fd_list, "webkit_user_message_new_with_fd_list", libs);
  gidLink(cast(void**)&webkit_user_message_get_fd_list, "webkit_user_message_get_fd_list", libs);
  gidLink(cast(void**)&webkit_user_message_get_name, "webkit_user_message_get_name", libs);
  gidLink(cast(void**)&webkit_user_message_get_parameters, "webkit_user_message_get_parameters", libs);
  gidLink(cast(void**)&webkit_user_message_send_reply, "webkit_user_message_send_reply", libs);

  // WebEditor
  gidLink(cast(void**)&webkit_web_editor_get_type, "webkit_web_editor_get_type", libs);
  gidLink(cast(void**)&webkit_web_editor_get_page, "webkit_web_editor_get_page", libs);

  // WebFormManager
  gidLink(cast(void**)&webkit_web_form_manager_get_type, "webkit_web_form_manager_get_type", libs);
  gidLink(cast(void**)&webkit_web_form_manager_input_element_auto_fill, "webkit_web_form_manager_input_element_auto_fill", libs);
  gidLink(cast(void**)&webkit_web_form_manager_input_element_is_auto_filled, "webkit_web_form_manager_input_element_is_auto_filled", libs);
  gidLink(cast(void**)&webkit_web_form_manager_input_element_is_user_edited, "webkit_web_form_manager_input_element_is_user_edited", libs);

  // WebHitTestResult
  gidLink(cast(void**)&webkit_web_hit_test_result_get_type, "webkit_web_hit_test_result_get_type", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_editable, "webkit_web_hit_test_result_context_is_editable", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_image, "webkit_web_hit_test_result_context_is_image", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_link, "webkit_web_hit_test_result_context_is_link", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_media, "webkit_web_hit_test_result_context_is_media", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_scrollbar, "webkit_web_hit_test_result_context_is_scrollbar", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_context_is_selection, "webkit_web_hit_test_result_context_is_selection", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_context, "webkit_web_hit_test_result_get_context", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_image_uri, "webkit_web_hit_test_result_get_image_uri", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_js_node, "webkit_web_hit_test_result_get_js_node", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_link_label, "webkit_web_hit_test_result_get_link_label", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_link_title, "webkit_web_hit_test_result_get_link_title", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_link_uri, "webkit_web_hit_test_result_get_link_uri", libs);
  gidLink(cast(void**)&webkit_web_hit_test_result_get_media_uri, "webkit_web_hit_test_result_get_media_uri", libs);

  // WebPage
  gidLink(cast(void**)&webkit_web_page_get_type, "webkit_web_page_get_type", libs);
  gidLink(cast(void**)&webkit_web_page_get_editor, "webkit_web_page_get_editor", libs);
  gidLink(cast(void**)&webkit_web_page_get_form_manager, "webkit_web_page_get_form_manager", libs);
  gidLink(cast(void**)&webkit_web_page_get_id, "webkit_web_page_get_id", libs);
  gidLink(cast(void**)&webkit_web_page_get_main_frame, "webkit_web_page_get_main_frame", libs);
  gidLink(cast(void**)&webkit_web_page_get_uri, "webkit_web_page_get_uri", libs);
  gidLink(cast(void**)&webkit_web_page_send_message_to_view, "webkit_web_page_send_message_to_view", libs);
  gidLink(cast(void**)&webkit_web_page_send_message_to_view_finish, "webkit_web_page_send_message_to_view_finish", libs);

  // WebProcessExtension
  gidLink(cast(void**)&webkit_web_process_extension_get_type, "webkit_web_process_extension_get_type", libs);
  gidLink(cast(void**)&webkit_web_process_extension_get_page, "webkit_web_process_extension_get_page", libs);
  gidLink(cast(void**)&webkit_web_process_extension_send_message_to_context, "webkit_web_process_extension_send_message_to_context", libs);
  gidLink(cast(void**)&webkit_web_process_extension_send_message_to_context_finish, "webkit_web_process_extension_send_message_to_context_finish", libs);
}
