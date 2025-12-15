/// C functions for webkitwebprocessextension6 library
module webkitwebprocessextension.c.functions;

public import gid.basictypes;
import gid.loader;
import webkitwebprocessextension.c.types;
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
  // ConsoleMessage
  GType function() c_webkit_console_message_get_type; ///
  WebKitConsoleMessage* function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_copy; ///
  void function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_free; ///
  WebKitConsoleMessageLevel function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_get_level; ///
  uint function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_get_line; ///
  WebKitConsoleMessageSource function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_get_source; ///
  const(char)* function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_get_source_id; ///
  const(char)* function(WebKitConsoleMessage* consoleMessage) c_webkit_console_message_get_text; ///

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

  // Frame
  GType function() c_webkit_frame_get_type; ///
  ulong function(WebKitFrame* frame) c_webkit_frame_get_id; ///
  JSCContext* function(WebKitFrame* frame) c_webkit_frame_get_js_context; ///
  JSCContext* function(WebKitFrame* frame, WebKitScriptWorld* world) c_webkit_frame_get_js_context_for_script_world; ///
  const(char)* function(WebKitFrame* frame) c_webkit_frame_get_uri; ///
  gboolean function(WebKitFrame* frame) c_webkit_frame_is_main_frame; ///

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

  // ScriptWorld
  GType function() c_webkit_script_world_get_type; ///
  WebKitScriptWorld* function() c_webkit_script_world_new; ///
  WebKitScriptWorld* function(const(char)* name) c_webkit_script_world_new_with_name; ///
  WebKitScriptWorld* function() c_webkit_script_world_get_default; ///
  const(char)* function(WebKitScriptWorld* world) c_webkit_script_world_get_name; ///

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

  // UserMessage
  GType function() c_webkit_user_message_get_type; ///
  WebKitUserMessage* function(const(char)* name, GVariant* parameters) c_webkit_user_message_new; ///
  WebKitUserMessage* function(const(char)* name, GVariant* parameters, GUnixFDList* fdList) c_webkit_user_message_new_with_fd_list; ///
  GUnixFDList* function(WebKitUserMessage* message) c_webkit_user_message_get_fd_list; ///
  const(char)* function(WebKitUserMessage* message) c_webkit_user_message_get_name; ///
  GVariant* function(WebKitUserMessage* message) c_webkit_user_message_get_parameters; ///
  void function(WebKitUserMessage* message, WebKitUserMessage* reply) c_webkit_user_message_send_reply; ///

  // WebEditor
  GType function() c_webkit_web_editor_get_type; ///
  WebKitWebPage* function(WebKitWebEditor* editor) c_webkit_web_editor_get_page; ///

  // WebFormManager
  GType function() c_webkit_web_form_manager_get_type; ///
  void function(JSCValue* element, const(char)* value) c_webkit_web_form_manager_input_element_auto_fill; ///
  gboolean function(JSCValue* element) c_webkit_web_form_manager_input_element_is_auto_filled; ///
  gboolean function(JSCValue* element) c_webkit_web_form_manager_input_element_is_user_edited; ///

  // WebHitTestResult
  GType function() c_webkit_web_hit_test_result_get_type; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_editable; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_image; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_link; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_media; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_scrollbar; ///
  gboolean function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_context_is_selection; ///
  uint function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_context; ///
  const(char)* function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_image_uri; ///
  JSCValue* function(WebKitWebHitTestResult* webHitTestResult, WebKitScriptWorld* world) c_webkit_web_hit_test_result_get_js_node; ///
  const(char)* function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_link_label; ///
  const(char)* function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_link_title; ///
  const(char)* function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_link_uri; ///
  const(char)* function(WebKitWebHitTestResult* webHitTestResult) c_webkit_web_hit_test_result_get_media_uri; ///

  // WebPage
  GType function() c_webkit_web_page_get_type; ///
  WebKitWebEditor* function(WebKitWebPage* webPage) c_webkit_web_page_get_editor; ///
  WebKitWebFormManager* function(WebKitWebPage* webPage, WebKitScriptWorld* world) c_webkit_web_page_get_form_manager; ///
  ulong function(WebKitWebPage* webPage) c_webkit_web_page_get_id; ///
  WebKitFrame* function(WebKitWebPage* webPage) c_webkit_web_page_get_main_frame; ///
  const(char)* function(WebKitWebPage* webPage) c_webkit_web_page_get_uri; ///
  void function(WebKitWebPage* webPage, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_page_send_message_to_view; ///
  WebKitUserMessage* function(WebKitWebPage* webPage, GAsyncResult* result, GError** _err) c_webkit_web_page_send_message_to_view_finish; ///

  // WebProcessExtension
  GType function() c_webkit_web_process_extension_get_type; ///
  WebKitWebPage* function(WebKitWebProcessExtension* extension, ulong pageId) c_webkit_web_process_extension_get_page; ///
  void function(WebKitWebProcessExtension* extension, WebKitUserMessage* message, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_webkit_web_process_extension_send_message_to_context; ///
  WebKitUserMessage* function(WebKitWebProcessExtension* extension, GAsyncResult* result, GError** _err) c_webkit_web_process_extension_send_message_to_context_finish; ///
}

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
  auto libs = gidResolveLibs(LIBS);

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
