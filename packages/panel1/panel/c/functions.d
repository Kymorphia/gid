/// C functions for panel1 library
module panel.c.functions;

public import gid.basictypes;
import gid.loader;
import panel.c.types;
public import adw.c.types;
public import gtk.c.types;

version(Windows)
  private immutable LIBS = ["libpanel-1-1.dll;panel-1-1.dll;panel-1.dll"];
else version(OSX)
  private immutable LIBS = ["libpanel-1.1.dylib"];
else
  private immutable LIBS = ["libpanel-1.so.1"];

__gshared extern(C)
{
  // ActionMuxer
  GType function() c_panel_action_muxer_get_type; ///
  PanelActionMuxer* function() c_panel_action_muxer_new; ///
  GActionGroup* function(PanelActionMuxer* self, const(char)* prefix) c_panel_action_muxer_get_action_group; ///
  void function(PanelActionMuxer* self, const(char)* prefix, GActionGroup* actionGroup) c_panel_action_muxer_insert_action_group; ///
  char** function(PanelActionMuxer* self) c_panel_action_muxer_list_groups; ///
  void function(PanelActionMuxer* self, const(char)* prefix) c_panel_action_muxer_remove_action_group; ///
  void function(PanelActionMuxer* self) c_panel_action_muxer_remove_all; ///

  // Application
  GType function() c_panel_application_get_type; ///
  PanelApplication* function(const(char)* applicationId, GApplicationFlags flags) c_panel_application_new; ///

  // ChangesDialog
  GType function() c_panel_changes_dialog_get_type; ///
  GtkWidget* function() c_panel_changes_dialog_new; ///
  void function(PanelChangesDialog* self, PanelSaveDelegate* delegate_) c_panel_changes_dialog_add_delegate; ///
  gboolean function(PanelChangesDialog* self) c_panel_changes_dialog_get_close_after_save; ///
  void function(PanelChangesDialog* self, GtkWidget* parent, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_panel_changes_dialog_run_async; ///
  gboolean function(PanelChangesDialog* self, GAsyncResult* result, GError** _err) c_panel_changes_dialog_run_finish; ///
  void function(PanelChangesDialog* self, gboolean closeAfterSave) c_panel_changes_dialog_set_close_after_save; ///

  // Dock
  GType function() c_panel_dock_get_type; ///
  GtkWidget* function() c_panel_dock_new; ///
  void function(PanelDock* self, PanelFrameCallback callback, void* userData) c_panel_dock_foreach_frame; ///
  gboolean function(PanelDock* self, PanelArea area) c_panel_dock_get_can_reveal_area; ///
  gboolean function(PanelDock* self) c_panel_dock_get_can_reveal_bottom; ///
  gboolean function(PanelDock* self) c_panel_dock_get_can_reveal_end; ///
  gboolean function(PanelDock* self) c_panel_dock_get_can_reveal_start; ///
  gboolean function(PanelDock* self) c_panel_dock_get_can_reveal_top; ///
  gboolean function(PanelDock* self, PanelArea area) c_panel_dock_get_reveal_area; ///
  gboolean function(PanelDock* self) c_panel_dock_get_reveal_bottom; ///
  gboolean function(PanelDock* self) c_panel_dock_get_reveal_end; ///
  gboolean function(PanelDock* self) c_panel_dock_get_reveal_start; ///
  gboolean function(PanelDock* self) c_panel_dock_get_reveal_top; ///
  void function(PanelDock* self, GtkWidget* widget) c_panel_dock_remove; ///
  void function(PanelDock* self, int height) c_panel_dock_set_bottom_height; ///
  void function(PanelDock* self, int width) c_panel_dock_set_end_width; ///
  void function(PanelDock* self, PanelArea area, gboolean reveal) c_panel_dock_set_reveal_area; ///
  void function(PanelDock* self, gboolean revealBottom) c_panel_dock_set_reveal_bottom; ///
  void function(PanelDock* self, gboolean revealEnd) c_panel_dock_set_reveal_end; ///
  void function(PanelDock* self, gboolean revealStart) c_panel_dock_set_reveal_start; ///
  void function(PanelDock* self, gboolean revealTop) c_panel_dock_set_reveal_top; ///
  void function(PanelDock* self, int width) c_panel_dock_set_start_width; ///
  void function(PanelDock* self, int height) c_panel_dock_set_top_height; ///

  // DocumentWorkspace
  GType function() c_panel_document_workspace_get_type; ///
  GtkWidget* function() c_panel_document_workspace_new; ///
  gboolean function(PanelDocumentWorkspace* self, PanelWidget* widget, PanelPosition* position) c_panel_document_workspace_add_widget; ///
  PanelDock* function(PanelDocumentWorkspace* self) c_panel_document_workspace_get_dock; ///
  PanelGrid* function(PanelDocumentWorkspace* self) c_panel_document_workspace_get_grid; ///
  PanelStatusbar* function(PanelDocumentWorkspace* self) c_panel_document_workspace_get_statusbar; ///
  GtkWidget* function(PanelDocumentWorkspace* self) c_panel_document_workspace_get_titlebar; ///
  void function(PanelDocumentWorkspace* self, GtkWidget* titlebar) c_panel_document_workspace_set_titlebar; ///

  // Frame
  GType function() c_panel_frame_get_type; ///
  GtkWidget* function() c_panel_frame_new; ///
  void function(PanelFrame* self, PanelWidget* panel) c_panel_frame_add; ///
  void function(PanelFrame* self, PanelWidget* panel, PanelWidget* sibling) c_panel_frame_add_before; ///
  gboolean function(PanelFrame* self) c_panel_frame_get_closeable; ///
  gboolean function(PanelFrame* self) c_panel_frame_get_empty; ///
  PanelFrameHeader* function(PanelFrame* self) c_panel_frame_get_header; ///
  uint function(PanelFrame* self) c_panel_frame_get_n_pages; ///
  PanelWidget* function(PanelFrame* self, uint n) c_panel_frame_get_page; ///
  GtkSelectionModel* function(PanelFrame* self) c_panel_frame_get_pages; ///
  GtkWidget* function(PanelFrame* self) c_panel_frame_get_placeholder; ///
  PanelPosition* function(PanelFrame* self) c_panel_frame_get_position; ///
  int function(PanelFrame* self) c_panel_frame_get_requested_size; ///
  PanelWidget* function(PanelFrame* self) c_panel_frame_get_visible_child; ///
  void function(PanelFrame* self, PanelWidget* panel) c_panel_frame_remove; ///
  void function(PanelFrame* self, PanelWidget* child, gboolean pinned) c_panel_frame_set_child_pinned; ///
  void function(PanelFrame* self, PanelFrameHeader* header) c_panel_frame_set_header; ///
  void function(PanelFrame* self, GtkWidget* placeholder) c_panel_frame_set_placeholder; ///
  void function(PanelFrame* self, int requestedSize) c_panel_frame_set_requested_size; ///
  void function(PanelFrame* self, PanelWidget* widget) c_panel_frame_set_visible_child; ///

  // FrameHeader
  GType function() c_panel_frame_header_get_type; ///
  void function(PanelFrameHeader* self, int priority, GtkWidget* child) c_panel_frame_header_add_prefix; ///
  void function(PanelFrameHeader* self, int priority, GtkWidget* child) c_panel_frame_header_add_suffix; ///
  gboolean function(PanelFrameHeader* self, PanelWidget* widget) c_panel_frame_header_can_drop; ///
  PanelFrame* function(PanelFrameHeader* self) c_panel_frame_header_get_frame; ///
  void function(PanelFrameHeader* self, PanelWidget* widget) c_panel_frame_header_page_changed; ///
  void function(PanelFrameHeader* self, PanelFrame* frame) c_panel_frame_header_set_frame; ///

  // FrameHeaderBar
  GType function() c_panel_frame_header_bar_get_type; ///
  GtkWidget* function() c_panel_frame_header_bar_new; ///
  GtkPopoverMenu* function(PanelFrameHeaderBar* self) c_panel_frame_header_bar_get_menu_popover; ///
  gboolean function(PanelFrameHeaderBar* self) c_panel_frame_header_bar_get_show_icon; ///
  void function(PanelFrameHeaderBar* self, gboolean showIcon) c_panel_frame_header_bar_set_show_icon; ///

  // FrameSwitcher
  GType function() c_panel_frame_switcher_get_type; ///
  GtkWidget* function() c_panel_frame_switcher_new; ///

  // FrameTabBar
  GType function() c_panel_frame_tab_bar_get_type; ///
  GtkWidget* function() c_panel_frame_tab_bar_new; ///
  gboolean function(PanelFrameTabBar* self) c_panel_frame_tab_bar_get_autohide; ///
  gboolean function(PanelFrameTabBar* self) c_panel_frame_tab_bar_get_expand_tabs; ///
  gboolean function(PanelFrameTabBar* self) c_panel_frame_tab_bar_get_inverted; ///
  void function(PanelFrameTabBar* self, gboolean autohide) c_panel_frame_tab_bar_set_autohide; ///
  void function(PanelFrameTabBar* self, gboolean expandTabs) c_panel_frame_tab_bar_set_expand_tabs; ///
  void function(PanelFrameTabBar* self, gboolean inverted) c_panel_frame_tab_bar_set_inverted; ///

  // GSettingsActionGroup
  GType function() c_panel_gsettings_action_group_get_type; ///
  GActionGroup* function(GSettings* settings) c_panel_gsettings_action_group_new; ///

  // Grid
  GType function() c_panel_grid_get_type; ///
  GtkWidget* function() c_panel_grid_new; ///
  void function(PanelGrid* self, PanelWidget* widget) c_panel_grid_add; ///
  void function(PanelGrid* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_panel_grid_agree_to_close_async; ///
  gboolean function(PanelGrid* self, GAsyncResult* result, GError** _err) c_panel_grid_agree_to_close_finish; ///
  void function(PanelGrid* self, PanelFrameCallback callback, void* userData) c_panel_grid_foreach_frame; ///
  PanelGridColumn* function(PanelGrid* self, uint column) c_panel_grid_get_column; ///
  PanelGridColumn* function(PanelGrid* self) c_panel_grid_get_most_recent_column; ///
  PanelFrame* function(PanelGrid* self) c_panel_grid_get_most_recent_frame; ///
  uint function(PanelGrid* self) c_panel_grid_get_n_columns; ///
  void function(PanelGrid* self, uint position) c_panel_grid_insert_column; ///

  // GridColumn
  GType function() c_panel_grid_column_get_type; ///
  GtkWidget* function() c_panel_grid_column_new; ///
  void function(PanelGridColumn* self, PanelFrameCallback callback, void* userData) c_panel_grid_column_foreach_frame; ///
  gboolean function(PanelGridColumn* self) c_panel_grid_column_get_empty; ///
  PanelFrame* function(PanelGridColumn* self) c_panel_grid_column_get_most_recent_frame; ///
  uint function(PanelGridColumn* self) c_panel_grid_column_get_n_rows; ///
  PanelFrame* function(PanelGridColumn* self, uint row) c_panel_grid_column_get_row; ///

  // Inhibitor
  GType function() c_panel_inhibitor_get_type; ///
  void function(PanelInhibitor* self) c_panel_inhibitor_uninhibit; ///

  // LayeredSettings
  GType function() c_panel_layered_settings_get_type; ///
  PanelLayeredSettings* function(const(char)* schemaId, const(char)* path) c_panel_layered_settings_new; ///
  void function(PanelLayeredSettings* self, GSettings* settings) c_panel_layered_settings_append; ///
  void function(PanelLayeredSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags) c_panel_layered_settings_bind; ///
  void function(PanelLayeredSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) c_panel_layered_settings_bind_with_mapping; ///
  gboolean function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_boolean; ///
  GVariant* function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_default_value; ///
  double function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_double; ///
  int function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_int; ///
  GSettingsSchemaKey* function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_key; ///
  char* function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_string; ///
  uint function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_uint; ///
  GVariant* function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_user_value; ///
  GVariant* function(PanelLayeredSettings* self, const(char)* key) c_panel_layered_settings_get_value; ///
  char** function(PanelLayeredSettings* self) c_panel_layered_settings_list_keys; ///
  void function(PanelLayeredSettings* self, const(char)* key, gboolean val) c_panel_layered_settings_set_boolean; ///
  void function(PanelLayeredSettings* self, const(char)* key, double val) c_panel_layered_settings_set_double; ///
  void function(PanelLayeredSettings* self, const(char)* key, int val) c_panel_layered_settings_set_int; ///
  void function(PanelLayeredSettings* self, const(char)* key, const(char)* val) c_panel_layered_settings_set_string; ///
  void function(PanelLayeredSettings* self, const(char)* key, uint val) c_panel_layered_settings_set_uint; ///
  void function(PanelLayeredSettings* self, const(char)* key, GVariant* value) c_panel_layered_settings_set_value; ///
  void function(PanelLayeredSettings* self, const(char)* property) c_panel_layered_settings_unbind; ///

  // MenuManager
  GType function() c_panel_menu_manager_get_type; ///
  PanelMenuManager* function() c_panel_menu_manager_new; ///
  uint function(PanelMenuManager* self, const(char)* filename, GError** _err) c_panel_menu_manager_add_filename; ///
  uint function(PanelMenuManager* self, const(char)* resource, GError** _err) c_panel_menu_manager_add_resource; ///
  GMenu* function(PanelMenuManager* self, const(char)* id, uint* position) c_panel_menu_manager_find_item_by_id; ///
  GMenu* function(PanelMenuManager* self, const(char)* menuId) c_panel_menu_manager_get_menu_by_id; ///
  const(char*)* function(PanelMenuManager* self) c_panel_menu_manager_get_menu_ids; ///
  uint function(PanelMenuManager* self, const(char)* menuId, GMenuModel* menuModel) c_panel_menu_manager_merge; ///
  void function(PanelMenuManager* self, uint mergeId) c_panel_menu_manager_remove; ///
  void function(PanelMenuManager* self, GMenu* menu, uint position, const(char)* attribute, const(char)* value) c_panel_menu_manager_set_attribute_string; ///

  // OmniBar
  GType function() c_panel_omni_bar_get_type; ///
  GtkWidget* function() c_panel_omni_bar_new; ///
  void function(PanelOmniBar* self, int priority, GtkWidget* widget) c_panel_omni_bar_add_prefix; ///
  void function(PanelOmniBar* self, int priority, GtkWidget* widget) c_panel_omni_bar_add_suffix; ///
  GtkPopover* function(PanelOmniBar* self) c_panel_omni_bar_get_popover; ///
  double function(PanelOmniBar* self) c_panel_omni_bar_get_progress; ///
  void function(PanelOmniBar* self, GtkWidget* widget) c_panel_omni_bar_remove; ///
  void function(PanelOmniBar* self, GtkPopover* popover) c_panel_omni_bar_set_popover; ///
  void function(PanelOmniBar* self, double progress) c_panel_omni_bar_set_progress; ///
  void function(PanelOmniBar* self) c_panel_omni_bar_start_pulsing; ///
  void function(PanelOmniBar* self) c_panel_omni_bar_stop_pulsing; ///

  // Paned
  GType function() c_panel_paned_get_type; ///
  GtkWidget* function() c_panel_paned_new; ///
  void function(PanelPaned* self, GtkWidget* child) c_panel_paned_append; ///
  uint function(PanelPaned* self) c_panel_paned_get_n_children; ///
  GtkWidget* function(PanelPaned* self, uint nth) c_panel_paned_get_nth_child; ///
  void function(PanelPaned* self, int position, GtkWidget* child) c_panel_paned_insert; ///
  void function(PanelPaned* self, GtkWidget* child, GtkWidget* sibling) c_panel_paned_insert_after; ///
  void function(PanelPaned* self, GtkWidget* child) c_panel_paned_prepend; ///
  void function(PanelPaned* self, GtkWidget* child) c_panel_paned_remove; ///

  // Position
  GType function() c_panel_position_get_type; ///
  PanelPosition* function() c_panel_position_new; ///
  PanelPosition* function(GVariant* variant) c_panel_position_new_from_variant; ///
  gboolean function(PanelPosition* a, PanelPosition* b) c_panel_position_equal; ///
  PanelArea function(PanelPosition* self) c_panel_position_get_area; ///
  gboolean function(PanelPosition* self) c_panel_position_get_area_set; ///
  uint function(PanelPosition* self) c_panel_position_get_column; ///
  gboolean function(PanelPosition* self) c_panel_position_get_column_set; ///
  uint function(PanelPosition* self) c_panel_position_get_depth; ///
  gboolean function(PanelPosition* self) c_panel_position_get_depth_set; ///
  uint function(PanelPosition* self) c_panel_position_get_row; ///
  gboolean function(PanelPosition* self) c_panel_position_get_row_set; ///
  gboolean function(PanelPosition* self) c_panel_position_is_indeterminate; ///
  void function(PanelPosition* self, PanelArea area) c_panel_position_set_area; ///
  void function(PanelPosition* self, gboolean areaSet) c_panel_position_set_area_set; ///
  void function(PanelPosition* self, uint column) c_panel_position_set_column; ///
  void function(PanelPosition* self, gboolean columnSet) c_panel_position_set_column_set; ///
  void function(PanelPosition* self, uint depth) c_panel_position_set_depth; ///
  void function(PanelPosition* self, gboolean depthSet) c_panel_position_set_depth_set; ///
  void function(PanelPosition* self, uint row) c_panel_position_set_row; ///
  void function(PanelPosition* self, gboolean rowSet) c_panel_position_set_row_set; ///
  GVariant* function(PanelPosition* self) c_panel_position_to_variant; ///

  // SaveDelegate
  GType function() c_panel_save_delegate_get_type; ///
  PanelSaveDelegate* function() c_panel_save_delegate_new; ///
  void function(PanelSaveDelegate* self) c_panel_save_delegate_close; ///
  void function(PanelSaveDelegate* self) c_panel_save_delegate_discard; ///
  GIcon* function(PanelSaveDelegate* self) c_panel_save_delegate_get_icon; ///
  const(char)* function(PanelSaveDelegate* self) c_panel_save_delegate_get_icon_name; ///
  gboolean function(PanelSaveDelegate* self) c_panel_save_delegate_get_is_draft; ///
  double function(PanelSaveDelegate* self) c_panel_save_delegate_get_progress; ///
  const(char)* function(PanelSaveDelegate* self) c_panel_save_delegate_get_subtitle; ///
  const(char)* function(PanelSaveDelegate* self) c_panel_save_delegate_get_title; ///
  void function(PanelSaveDelegate* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_panel_save_delegate_save_async; ///
  gboolean function(PanelSaveDelegate* self, GAsyncResult* result, GError** _err) c_panel_save_delegate_save_finish; ///
  void function(PanelSaveDelegate* self, GIcon* icon) c_panel_save_delegate_set_icon; ///
  void function(PanelSaveDelegate* self, const(char)* icon) c_panel_save_delegate_set_icon_name; ///
  void function(PanelSaveDelegate* self, gboolean isDraft) c_panel_save_delegate_set_is_draft; ///
  void function(PanelSaveDelegate* self, double progress) c_panel_save_delegate_set_progress; ///
  void function(PanelSaveDelegate* self, const(char)* subtitle) c_panel_save_delegate_set_subtitle; ///
  void function(PanelSaveDelegate* self, const(char)* title) c_panel_save_delegate_set_title; ///

  // SaveDialog
  GType function() c_panel_save_dialog_get_type; ///
  GtkWidget* function() c_panel_save_dialog_new; ///
  void function(PanelSaveDialog* self, PanelSaveDelegate* delegate_) c_panel_save_dialog_add_delegate; ///
  gboolean function(PanelSaveDialog* self) c_panel_save_dialog_get_close_after_save; ///
  void function(PanelSaveDialog* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_panel_save_dialog_run_async; ///
  gboolean function(PanelSaveDialog* self, GAsyncResult* result, GError** _err) c_panel_save_dialog_run_finish; ///
  void function(PanelSaveDialog* self, gboolean closeAfterSave) c_panel_save_dialog_set_close_after_save; ///

  // Session
  GType function() c_panel_session_get_type; ///
  PanelSession* function() c_panel_session_new; ///
  PanelSession* function(GVariant* variant, GError** _err) c_panel_session_new_from_variant; ///
  void function(PanelSession* self, PanelSessionItem* item) c_panel_session_append; ///
  PanelSessionItem* function(PanelSession* self, uint position) c_panel_session_get_item; ///
  uint function(PanelSession* self) c_panel_session_get_n_items; ///
  void function(PanelSession* self, uint position, PanelSessionItem* item) c_panel_session_insert; ///
  PanelSessionItem* function(PanelSession* self, const(char)* id) c_panel_session_lookup_by_id; ///
  void function(PanelSession* self, PanelSessionItem* item) c_panel_session_prepend; ///
  void function(PanelSession* self, PanelSessionItem* item) c_panel_session_remove; ///
  void function(PanelSession* self, uint position) c_panel_session_remove_at; ///
  GVariant* function(PanelSession* self) c_panel_session_to_variant; ///

  // SessionItem
  GType function() c_panel_session_item_get_type; ///
  PanelSessionItem* function() c_panel_session_item_new; ///
  const(char)* function(PanelSessionItem* self) c_panel_session_item_get_id; ///
  gboolean function(PanelSessionItem* self, const(char)* key, const(char)* format,  ...) c_panel_session_item_get_metadata; ///
  GVariant* function(PanelSessionItem* self, const(char)* key, const(GVariantType)* expectedType) c_panel_session_item_get_metadata_value; ///
  const(char)* function(PanelSessionItem* self) c_panel_session_item_get_module_name; ///
  PanelPosition* function(PanelSessionItem* self) c_panel_session_item_get_position; ///
  const(char)* function(PanelSessionItem* self) c_panel_session_item_get_type_hint; ///
  const(char)* function(PanelSessionItem* self) c_panel_session_item_get_workspace; ///
  gboolean function(PanelSessionItem* self, const(char)* key, const(GVariantType*)* valueType) c_panel_session_item_has_metadata; ///
  gboolean function(PanelSessionItem* self, const(char)* key, const(GVariantType)* expectedType) c_panel_session_item_has_metadata_with_type; ///
  void function(PanelSessionItem* self, const(char)* id) c_panel_session_item_set_id; ///
  void function(PanelSessionItem* self, const(char)* key, const(char)* format,  ...) c_panel_session_item_set_metadata; ///
  void function(PanelSessionItem* self, const(char)* key, GVariant* value) c_panel_session_item_set_metadata_value; ///
  void function(PanelSessionItem* self, const(char)* moduleName) c_panel_session_item_set_module_name; ///
  void function(PanelSessionItem* self, PanelPosition* position) c_panel_session_item_set_position; ///
  void function(PanelSessionItem* self, const(char)* typeHint) c_panel_session_item_set_type_hint; ///
  void function(PanelSessionItem* self, const(char)* workspace) c_panel_session_item_set_workspace; ///

  // Settings
  GType function() c_panel_settings_get_type; ///
  PanelSettings* function(const(char)* identifier, const(char)* schemaId) c_panel_settings_new; ///
  PanelSettings* function(const(char)* identifier, const(char)* schemaId, const(char)* schemaIdPrefix, const(char)* pathPrefix, const(char)* pathSuffix) c_panel_settings_new_relocatable; ///
  PanelSettings* function(const(char)* identifier, const(char)* schemaId, const(char)* path) c_panel_settings_new_with_path; ///
  char* function(const(char)* schemaIdPrefix, const(char)* schemaId, const(char)* identifier, const(char)* pathPrefix, const(char)* pathSuffix) c_panel_settings_resolve_schema_path; ///
  void function(PanelSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags) c_panel_settings_bind; ///
  void function(PanelSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) c_panel_settings_bind_with_mapping; ///
  gboolean function(PanelSettings* self, const(char)* key) c_panel_settings_get_boolean; ///
  GVariant* function(PanelSettings* self, const(char)* key) c_panel_settings_get_default_value; ///
  double function(PanelSettings* self, const(char)* key) c_panel_settings_get_double; ///
  int function(PanelSettings* self, const(char)* key) c_panel_settings_get_int; ///
  const(char)* function(PanelSettings* self) c_panel_settings_get_schema_id; ///
  char* function(PanelSettings* self, const(char)* key) c_panel_settings_get_string; ///
  uint function(PanelSettings* self, const(char)* key) c_panel_settings_get_uint; ///
  GVariant* function(PanelSettings* self, const(char)* key) c_panel_settings_get_user_value; ///
  GVariant* function(PanelSettings* self, const(char)* key) c_panel_settings_get_value; ///
  void function(PanelSettings* self, const(char)* key, gboolean val) c_panel_settings_set_boolean; ///
  void function(PanelSettings* self, const(char)* key, double val) c_panel_settings_set_double; ///
  void function(PanelSettings* self, const(char)* key, int val) c_panel_settings_set_int; ///
  void function(PanelSettings* self, const(char)* key, const(char)* val) c_panel_settings_set_string; ///
  void function(PanelSettings* self, const(char)* key, uint val) c_panel_settings_set_uint; ///
  void function(PanelSettings* self, const(char)* key, GVariant* value) c_panel_settings_set_value; ///
  void function(PanelSettings* self, const(char)* property) c_panel_settings_unbind; ///

  // Statusbar
  GType function() c_panel_statusbar_get_type; ///
  GtkWidget* function() c_panel_statusbar_new; ///
  void function(PanelStatusbar* self, int priority, GtkWidget* widget) c_panel_statusbar_add_prefix; ///
  void function(PanelStatusbar* self, int priority, GtkWidget* widget) c_panel_statusbar_add_suffix; ///
  void function(PanelStatusbar* self, GtkWidget* widget) c_panel_statusbar_remove; ///

  // ThemeSelector
  GType function() c_panel_theme_selector_get_type; ///
  GtkWidget* function() c_panel_theme_selector_new; ///
  const(char)* function(PanelThemeSelector* self) c_panel_theme_selector_get_action_name; ///
  void function(PanelThemeSelector* self, const(char)* actionName) c_panel_theme_selector_set_action_name; ///

  // ToggleButton
  GType function() c_panel_toggle_button_get_type; ///
  GtkWidget* function(PanelDock* dock, PanelArea area) c_panel_toggle_button_new; ///

  // Widget
  GType function() c_panel_widget_get_type; ///
  GtkWidget* function() c_panel_widget_new; ///
  void function(PanelWidget* widget, const(char)* actionName, gboolean enabled) c_panel_widget_action_set_enabled; ///
  void function(PanelWidget* self) c_panel_widget_close; ///
  gboolean function(PanelWidget* self) c_panel_widget_focus_default; ///
  void function(PanelWidget* self) c_panel_widget_force_close; ///
  gboolean function(PanelWidget* self) c_panel_widget_get_busy; ///
  gboolean function(PanelWidget* self) c_panel_widget_get_can_maximize; ///
  GtkWidget* function(PanelWidget* self) c_panel_widget_get_child; ///
  GtkWidget* function(PanelWidget* self) c_panel_widget_get_default_focus; ///
  GIcon* function(PanelWidget* self) c_panel_widget_get_icon; ///
  const(char)* function(PanelWidget* self) c_panel_widget_get_icon_name; ///
  const(char)* function(PanelWidget* self) c_panel_widget_get_id; ///
  const(char)* function(PanelWidget* self) c_panel_widget_get_kind; ///
  GMenuModel* function(PanelWidget* self) c_panel_widget_get_menu_model; ///
  gboolean function(PanelWidget* self) c_panel_widget_get_modified; ///
  gboolean function(PanelWidget* self) c_panel_widget_get_needs_attention; ///
  PanelPosition* function(PanelWidget* self) c_panel_widget_get_position; ///
  gboolean function(PanelWidget* self) c_panel_widget_get_reorderable; ///
  PanelSaveDelegate* function(PanelWidget* self) c_panel_widget_get_save_delegate; ///
  const(char)* function(PanelWidget* self) c_panel_widget_get_title; ///
  const(char)* function(PanelWidget* self) c_panel_widget_get_tooltip; ///
  void function(PanelWidget* self, const(char)* prefix, GActionGroup* group) c_panel_widget_insert_action_group; ///
  void function(PanelWidget* self) c_panel_widget_mark_busy; ///
  void function(PanelWidget* self) c_panel_widget_maximize; ///
  void function(PanelWidget* self) c_panel_widget_raise; ///
  void function(PanelWidget* self, gboolean canMaximize) c_panel_widget_set_can_maximize; ///
  void function(PanelWidget* self, GtkWidget* child) c_panel_widget_set_child; ///
  void function(PanelWidget* self, GIcon* icon) c_panel_widget_set_icon; ///
  void function(PanelWidget* self, const(char)* iconName) c_panel_widget_set_icon_name; ///
  void function(PanelWidget* self, const(char)* id) c_panel_widget_set_id; ///
  void function(PanelWidget* self, const(char)* kind) c_panel_widget_set_kind; ///
  void function(PanelWidget* self, GMenuModel* menuModel) c_panel_widget_set_menu_model; ///
  void function(PanelWidget* self, gboolean modified) c_panel_widget_set_modified; ///
  void function(PanelWidget* self, gboolean needsAttention) c_panel_widget_set_needs_attention; ///
  void function(PanelWidget* self, gboolean reorderable) c_panel_widget_set_reorderable; ///
  void function(PanelWidget* self, PanelSaveDelegate* saveDelegate) c_panel_widget_set_save_delegate; ///
  void function(PanelWidget* self, const(char)* title) c_panel_widget_set_title; ///
  void function(PanelWidget* self, const(char)* tooltip) c_panel_widget_set_tooltip; ///
  void function(PanelWidget* self) c_panel_widget_unmark_busy; ///
  void function(PanelWidget* self) c_panel_widget_unmaximize; ///

  // WidgetClass
  void function(PanelWidgetClass* widgetClass, const(char)* actionName, const(char)* parameterType, GtkWidgetActionActivateFunc activate) c_panel_widget_class_install_action; ///
  void function(PanelWidgetClass* widgetClass, const(char)* actionName, const(char)* propertyName) c_panel_widget_class_install_property_action; ///

  // Workbench
  GType function() c_panel_workbench_get_type; ///
  PanelWorkbench* function() c_panel_workbench_new; ///
  PanelWorkbench* function(GtkWidget* widget) c_panel_workbench_find_from_widget; ///
  void function(PanelWorkbench* self, const(char)* actionName, gboolean enabled) c_panel_workbench_action_set_enabled; ///
  void function(PanelWorkbench* self) c_panel_workbench_activate; ///
  void function(PanelWorkbench* self, PanelWorkspace* workspace) c_panel_workbench_add_workspace; ///
  PanelWorkspace* function(PanelWorkbench* self, GType workspaceType) c_panel_workbench_find_workspace_typed; ///
  void function(PanelWorkbench* self, PanelWorkspace* workspace) c_panel_workbench_focus_workspace; ///
  void function(PanelWorkbench* self, PanelWorkspaceForeach foreachFunc, void* foreachFuncData) c_panel_workbench_foreach_workspace; ///
  const(char)* function(PanelWorkbench* self) c_panel_workbench_get_id; ///
  void function(PanelWorkbench* self, PanelWorkspace* workspace) c_panel_workbench_remove_workspace; ///
  void function(PanelWorkbench* self, const(char)* id) c_panel_workbench_set_id; ///

  // WorkbenchClass
  void function(PanelWorkbenchClass* workbenchClass, const(char)* actionName, const(char)* parameterType, PanelActionActivateFunc activate) c_panel_workbench_class_install_action; ///
  void function(PanelWorkbenchClass* workbenchClass, const(char)* actionName, const(char)* propertyName) c_panel_workbench_class_install_property_action; ///

  // Workspace
  GType function() c_panel_workspace_get_type; ///
  PanelWorkspace* function(GtkWidget* widget) c_panel_workspace_find_from_widget; ///
  void function(PanelWorkspace* self, const(char)* actionName, gboolean enabled) c_panel_workspace_action_set_enabled; ///
  const(char)* function(PanelWorkspace* self) c_panel_workspace_get_id; ///
  PanelWorkbench* function(PanelWorkspace* self) c_panel_workspace_get_workbench; ///
  PanelInhibitor* function(PanelWorkspace* self, GtkApplicationInhibitFlags flags, const(char)* reason) c_panel_workspace_inhibit; ///
  void function(PanelWorkspace* self, const(char)* id) c_panel_workspace_set_id; ///

  // WorkspaceClass
  void function(PanelWorkspaceClass* workspaceClass, const(char)* actionName, const(char)* parameterType, PanelActionActivateFunc activate) c_panel_workspace_class_install_action; ///
  void function(PanelWorkspaceClass* workspaceClass, const(char)* actionName, const(char)* propertyName) c_panel_workspace_class_install_property_action; ///

  // global
  gboolean function(uint major, uint minor, uint micro) c_panel_check_version; ///
  void function() c_panel_finalize; ///
  uint function() c_panel_get_major_version; ///
  uint function() c_panel_get_micro_version; ///
  uint function() c_panel_get_minor_version; ///
  GResource* function() c_panel_get_resource; ///
  void function() c_panel_init; ///
  void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) c_panel_marshal_BOOLEAN__OBJECT_OBJECT; ///
  void function(GClosure* closure, GValue* returnValue, void* instance, void* args, void* marshalData, int nParams, GType* paramTypes) c_panel_marshal_BOOLEAN__OBJECT_OBJECTv; ///
  void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) c_panel_marshal_OBJECT__OBJECT; ///
  void function(GClosure* closure, GValue* returnValue, void* instance, void* args, void* marshalData, int nParams, GType* paramTypes) c_panel_marshal_OBJECT__OBJECTv; ///
}

// ActionMuxer

/** */
alias panel_action_muxer_get_type = c_panel_action_muxer_get_type;

/** */
alias panel_action_muxer_new = c_panel_action_muxer_new;

/** */
alias panel_action_muxer_get_action_group = c_panel_action_muxer_get_action_group;

/** */
alias panel_action_muxer_insert_action_group = c_panel_action_muxer_insert_action_group;

/** */
alias panel_action_muxer_list_groups = c_panel_action_muxer_list_groups;

/** */
alias panel_action_muxer_remove_action_group = c_panel_action_muxer_remove_action_group;

/** */
alias panel_action_muxer_remove_all = c_panel_action_muxer_remove_all;

// Application

/** */
alias panel_application_get_type = c_panel_application_get_type;

/** */
alias panel_application_new = c_panel_application_new;

// ChangesDialog

/** */
alias panel_changes_dialog_get_type = c_panel_changes_dialog_get_type;

/** */
alias panel_changes_dialog_new = c_panel_changes_dialog_new;

/** */
alias panel_changes_dialog_add_delegate = c_panel_changes_dialog_add_delegate;

/** */
alias panel_changes_dialog_get_close_after_save = c_panel_changes_dialog_get_close_after_save;

/** */
alias panel_changes_dialog_run_async = c_panel_changes_dialog_run_async;

/** */
alias panel_changes_dialog_run_finish = c_panel_changes_dialog_run_finish;

/** */
alias panel_changes_dialog_set_close_after_save = c_panel_changes_dialog_set_close_after_save;

// Dock

/** */
alias panel_dock_get_type = c_panel_dock_get_type;

/** */
alias panel_dock_new = c_panel_dock_new;

/** */
alias panel_dock_foreach_frame = c_panel_dock_foreach_frame;

/** */
alias panel_dock_get_can_reveal_area = c_panel_dock_get_can_reveal_area;

/** */
alias panel_dock_get_can_reveal_bottom = c_panel_dock_get_can_reveal_bottom;

/** */
alias panel_dock_get_can_reveal_end = c_panel_dock_get_can_reveal_end;

/** */
alias panel_dock_get_can_reveal_start = c_panel_dock_get_can_reveal_start;

/** */
alias panel_dock_get_can_reveal_top = c_panel_dock_get_can_reveal_top;

/** */
alias panel_dock_get_reveal_area = c_panel_dock_get_reveal_area;

/** */
alias panel_dock_get_reveal_bottom = c_panel_dock_get_reveal_bottom;

/** */
alias panel_dock_get_reveal_end = c_panel_dock_get_reveal_end;

/** */
alias panel_dock_get_reveal_start = c_panel_dock_get_reveal_start;

/** */
alias panel_dock_get_reveal_top = c_panel_dock_get_reveal_top;

/** */
alias panel_dock_remove = c_panel_dock_remove;

/** */
alias panel_dock_set_bottom_height = c_panel_dock_set_bottom_height;

/** */
alias panel_dock_set_end_width = c_panel_dock_set_end_width;

/** */
alias panel_dock_set_reveal_area = c_panel_dock_set_reveal_area;

/** */
alias panel_dock_set_reveal_bottom = c_panel_dock_set_reveal_bottom;

/** */
alias panel_dock_set_reveal_end = c_panel_dock_set_reveal_end;

/** */
alias panel_dock_set_reveal_start = c_panel_dock_set_reveal_start;

/** */
alias panel_dock_set_reveal_top = c_panel_dock_set_reveal_top;

/** */
alias panel_dock_set_start_width = c_panel_dock_set_start_width;

/** */
alias panel_dock_set_top_height = c_panel_dock_set_top_height;

// DocumentWorkspace

/** */
alias panel_document_workspace_get_type = c_panel_document_workspace_get_type;

/** */
alias panel_document_workspace_new = c_panel_document_workspace_new;

/** */
alias panel_document_workspace_add_widget = c_panel_document_workspace_add_widget;

/** */
alias panel_document_workspace_get_dock = c_panel_document_workspace_get_dock;

/** */
alias panel_document_workspace_get_grid = c_panel_document_workspace_get_grid;

/** */
alias panel_document_workspace_get_statusbar = c_panel_document_workspace_get_statusbar;

/** */
alias panel_document_workspace_get_titlebar = c_panel_document_workspace_get_titlebar;

/** */
alias panel_document_workspace_set_titlebar = c_panel_document_workspace_set_titlebar;

// Frame

/** */
alias panel_frame_get_type = c_panel_frame_get_type;

/** */
alias panel_frame_new = c_panel_frame_new;

/** */
alias panel_frame_add = c_panel_frame_add;

/** */
alias panel_frame_add_before = c_panel_frame_add_before;

/** */
alias panel_frame_get_closeable = c_panel_frame_get_closeable;

/** */
alias panel_frame_get_empty = c_panel_frame_get_empty;

/** */
alias panel_frame_get_header = c_panel_frame_get_header;

/** */
alias panel_frame_get_n_pages = c_panel_frame_get_n_pages;

/** */
alias panel_frame_get_page = c_panel_frame_get_page;

/** */
alias panel_frame_get_pages = c_panel_frame_get_pages;

/** */
alias panel_frame_get_placeholder = c_panel_frame_get_placeholder;

/** */
alias panel_frame_get_position = c_panel_frame_get_position;

/** */
alias panel_frame_get_requested_size = c_panel_frame_get_requested_size;

/** */
alias panel_frame_get_visible_child = c_panel_frame_get_visible_child;

/** */
alias panel_frame_remove = c_panel_frame_remove;

/** */
alias panel_frame_set_child_pinned = c_panel_frame_set_child_pinned;

/** */
alias panel_frame_set_header = c_panel_frame_set_header;

/** */
alias panel_frame_set_placeholder = c_panel_frame_set_placeholder;

/** */
alias panel_frame_set_requested_size = c_panel_frame_set_requested_size;

/** */
alias panel_frame_set_visible_child = c_panel_frame_set_visible_child;

// FrameHeader

/** */
alias panel_frame_header_get_type = c_panel_frame_header_get_type;

/** */
alias panel_frame_header_add_prefix = c_panel_frame_header_add_prefix;

/** */
alias panel_frame_header_add_suffix = c_panel_frame_header_add_suffix;

/** */
alias panel_frame_header_can_drop = c_panel_frame_header_can_drop;

/** */
alias panel_frame_header_get_frame = c_panel_frame_header_get_frame;

/** */
alias panel_frame_header_page_changed = c_panel_frame_header_page_changed;

/** */
alias panel_frame_header_set_frame = c_panel_frame_header_set_frame;

// FrameHeaderBar

/** */
alias panel_frame_header_bar_get_type = c_panel_frame_header_bar_get_type;

/** */
alias panel_frame_header_bar_new = c_panel_frame_header_bar_new;

/** */
alias panel_frame_header_bar_get_menu_popover = c_panel_frame_header_bar_get_menu_popover;

/** */
alias panel_frame_header_bar_get_show_icon = c_panel_frame_header_bar_get_show_icon;

/** */
alias panel_frame_header_bar_set_show_icon = c_panel_frame_header_bar_set_show_icon;

// FrameSwitcher

/** */
alias panel_frame_switcher_get_type = c_panel_frame_switcher_get_type;

/** */
alias panel_frame_switcher_new = c_panel_frame_switcher_new;

// FrameTabBar

/** */
alias panel_frame_tab_bar_get_type = c_panel_frame_tab_bar_get_type;

/** */
alias panel_frame_tab_bar_new = c_panel_frame_tab_bar_new;

/** */
alias panel_frame_tab_bar_get_autohide = c_panel_frame_tab_bar_get_autohide;

/** */
alias panel_frame_tab_bar_get_expand_tabs = c_panel_frame_tab_bar_get_expand_tabs;

/** */
alias panel_frame_tab_bar_get_inverted = c_panel_frame_tab_bar_get_inverted;

/** */
alias panel_frame_tab_bar_set_autohide = c_panel_frame_tab_bar_set_autohide;

/** */
alias panel_frame_tab_bar_set_expand_tabs = c_panel_frame_tab_bar_set_expand_tabs;

/** */
alias panel_frame_tab_bar_set_inverted = c_panel_frame_tab_bar_set_inverted;

// GSettingsActionGroup

/** */
alias panel_gsettings_action_group_get_type = c_panel_gsettings_action_group_get_type;

/** */
alias panel_gsettings_action_group_new = c_panel_gsettings_action_group_new;

// Grid

/** */
alias panel_grid_get_type = c_panel_grid_get_type;

/** */
alias panel_grid_new = c_panel_grid_new;

/** */
alias panel_grid_add = c_panel_grid_add;

/** */
alias panel_grid_agree_to_close_async = c_panel_grid_agree_to_close_async;

/** */
alias panel_grid_agree_to_close_finish = c_panel_grid_agree_to_close_finish;

/** */
alias panel_grid_foreach_frame = c_panel_grid_foreach_frame;

/** */
alias panel_grid_get_column = c_panel_grid_get_column;

/** */
alias panel_grid_get_most_recent_column = c_panel_grid_get_most_recent_column;

/** */
alias panel_grid_get_most_recent_frame = c_panel_grid_get_most_recent_frame;

/** */
alias panel_grid_get_n_columns = c_panel_grid_get_n_columns;

/** */
alias panel_grid_insert_column = c_panel_grid_insert_column;

// GridColumn

/** */
alias panel_grid_column_get_type = c_panel_grid_column_get_type;

/** */
alias panel_grid_column_new = c_panel_grid_column_new;

/** */
alias panel_grid_column_foreach_frame = c_panel_grid_column_foreach_frame;

/** */
alias panel_grid_column_get_empty = c_panel_grid_column_get_empty;

/** */
alias panel_grid_column_get_most_recent_frame = c_panel_grid_column_get_most_recent_frame;

/** */
alias panel_grid_column_get_n_rows = c_panel_grid_column_get_n_rows;

/** */
alias panel_grid_column_get_row = c_panel_grid_column_get_row;

// Inhibitor

/** */
alias panel_inhibitor_get_type = c_panel_inhibitor_get_type;

/** */
alias panel_inhibitor_uninhibit = c_panel_inhibitor_uninhibit;

// LayeredSettings

/** */
alias panel_layered_settings_get_type = c_panel_layered_settings_get_type;

/** */
alias panel_layered_settings_new = c_panel_layered_settings_new;

/** */
alias panel_layered_settings_append = c_panel_layered_settings_append;

/** */
alias panel_layered_settings_bind = c_panel_layered_settings_bind;

/** */
alias panel_layered_settings_bind_with_mapping = c_panel_layered_settings_bind_with_mapping;

/** */
alias panel_layered_settings_get_boolean = c_panel_layered_settings_get_boolean;

/** */
alias panel_layered_settings_get_default_value = c_panel_layered_settings_get_default_value;

/** */
alias panel_layered_settings_get_double = c_panel_layered_settings_get_double;

/** */
alias panel_layered_settings_get_int = c_panel_layered_settings_get_int;

/** */
alias panel_layered_settings_get_key = c_panel_layered_settings_get_key;

/** */
alias panel_layered_settings_get_string = c_panel_layered_settings_get_string;

/** */
alias panel_layered_settings_get_uint = c_panel_layered_settings_get_uint;

/** */
alias panel_layered_settings_get_user_value = c_panel_layered_settings_get_user_value;

/** */
alias panel_layered_settings_get_value = c_panel_layered_settings_get_value;

/** */
alias panel_layered_settings_list_keys = c_panel_layered_settings_list_keys;

/** */
alias panel_layered_settings_set_boolean = c_panel_layered_settings_set_boolean;

/** */
alias panel_layered_settings_set_double = c_panel_layered_settings_set_double;

/** */
alias panel_layered_settings_set_int = c_panel_layered_settings_set_int;

/** */
alias panel_layered_settings_set_string = c_panel_layered_settings_set_string;

/** */
alias panel_layered_settings_set_uint = c_panel_layered_settings_set_uint;

/** */
alias panel_layered_settings_set_value = c_panel_layered_settings_set_value;

/** */
alias panel_layered_settings_unbind = c_panel_layered_settings_unbind;

// MenuManager

/** */
alias panel_menu_manager_get_type = c_panel_menu_manager_get_type;

/** */
alias panel_menu_manager_new = c_panel_menu_manager_new;

/** */
alias panel_menu_manager_add_filename = c_panel_menu_manager_add_filename;

/** */
alias panel_menu_manager_add_resource = c_panel_menu_manager_add_resource;

/** */
alias panel_menu_manager_find_item_by_id = c_panel_menu_manager_find_item_by_id;

/** */
alias panel_menu_manager_get_menu_by_id = c_panel_menu_manager_get_menu_by_id;

/** */
alias panel_menu_manager_get_menu_ids = c_panel_menu_manager_get_menu_ids;

/** */
alias panel_menu_manager_merge = c_panel_menu_manager_merge;

/** */
alias panel_menu_manager_remove = c_panel_menu_manager_remove;

/** */
alias panel_menu_manager_set_attribute_string = c_panel_menu_manager_set_attribute_string;

// OmniBar

/** */
alias panel_omni_bar_get_type = c_panel_omni_bar_get_type;

/** */
alias panel_omni_bar_new = c_panel_omni_bar_new;

/** */
alias panel_omni_bar_add_prefix = c_panel_omni_bar_add_prefix;

/** */
alias panel_omni_bar_add_suffix = c_panel_omni_bar_add_suffix;

/** */
alias panel_omni_bar_get_popover = c_panel_omni_bar_get_popover;

/** */
alias panel_omni_bar_get_progress = c_panel_omni_bar_get_progress;

/** */
alias panel_omni_bar_remove = c_panel_omni_bar_remove;

/** */
alias panel_omni_bar_set_popover = c_panel_omni_bar_set_popover;

/** */
alias panel_omni_bar_set_progress = c_panel_omni_bar_set_progress;

/** */
alias panel_omni_bar_start_pulsing = c_panel_omni_bar_start_pulsing;

/** */
alias panel_omni_bar_stop_pulsing = c_panel_omni_bar_stop_pulsing;

// Paned

/** */
alias panel_paned_get_type = c_panel_paned_get_type;

/** */
alias panel_paned_new = c_panel_paned_new;

/** */
alias panel_paned_append = c_panel_paned_append;

/** */
alias panel_paned_get_n_children = c_panel_paned_get_n_children;

/** */
alias panel_paned_get_nth_child = c_panel_paned_get_nth_child;

/** */
alias panel_paned_insert = c_panel_paned_insert;

/** */
alias panel_paned_insert_after = c_panel_paned_insert_after;

/** */
alias panel_paned_prepend = c_panel_paned_prepend;

/** */
alias panel_paned_remove = c_panel_paned_remove;

// Position

/** */
alias panel_position_get_type = c_panel_position_get_type;

/** */
alias panel_position_new = c_panel_position_new;

/** */
alias panel_position_new_from_variant = c_panel_position_new_from_variant;

/** */
alias panel_position_equal = c_panel_position_equal;

/** */
alias panel_position_get_area = c_panel_position_get_area;

/** */
alias panel_position_get_area_set = c_panel_position_get_area_set;

/** */
alias panel_position_get_column = c_panel_position_get_column;

/** */
alias panel_position_get_column_set = c_panel_position_get_column_set;

/** */
alias panel_position_get_depth = c_panel_position_get_depth;

/** */
alias panel_position_get_depth_set = c_panel_position_get_depth_set;

/** */
alias panel_position_get_row = c_panel_position_get_row;

/** */
alias panel_position_get_row_set = c_panel_position_get_row_set;

/** */
alias panel_position_is_indeterminate = c_panel_position_is_indeterminate;

/** */
alias panel_position_set_area = c_panel_position_set_area;

/** */
alias panel_position_set_area_set = c_panel_position_set_area_set;

/** */
alias panel_position_set_column = c_panel_position_set_column;

/** */
alias panel_position_set_column_set = c_panel_position_set_column_set;

/** */
alias panel_position_set_depth = c_panel_position_set_depth;

/** */
alias panel_position_set_depth_set = c_panel_position_set_depth_set;

/** */
alias panel_position_set_row = c_panel_position_set_row;

/** */
alias panel_position_set_row_set = c_panel_position_set_row_set;

/** */
alias panel_position_to_variant = c_panel_position_to_variant;

// SaveDelegate

/** */
alias panel_save_delegate_get_type = c_panel_save_delegate_get_type;

/** */
alias panel_save_delegate_new = c_panel_save_delegate_new;

/** */
alias panel_save_delegate_close = c_panel_save_delegate_close;

/** */
alias panel_save_delegate_discard = c_panel_save_delegate_discard;

/** */
alias panel_save_delegate_get_icon = c_panel_save_delegate_get_icon;

/** */
alias panel_save_delegate_get_icon_name = c_panel_save_delegate_get_icon_name;

/** */
alias panel_save_delegate_get_is_draft = c_panel_save_delegate_get_is_draft;

/** */
alias panel_save_delegate_get_progress = c_panel_save_delegate_get_progress;

/** */
alias panel_save_delegate_get_subtitle = c_panel_save_delegate_get_subtitle;

/** */
alias panel_save_delegate_get_title = c_panel_save_delegate_get_title;

/** */
alias panel_save_delegate_save_async = c_panel_save_delegate_save_async;

/** */
alias panel_save_delegate_save_finish = c_panel_save_delegate_save_finish;

/** */
alias panel_save_delegate_set_icon = c_panel_save_delegate_set_icon;

/** */
alias panel_save_delegate_set_icon_name = c_panel_save_delegate_set_icon_name;

/** */
alias panel_save_delegate_set_is_draft = c_panel_save_delegate_set_is_draft;

/** */
alias panel_save_delegate_set_progress = c_panel_save_delegate_set_progress;

/** */
alias panel_save_delegate_set_subtitle = c_panel_save_delegate_set_subtitle;

/** */
alias panel_save_delegate_set_title = c_panel_save_delegate_set_title;

// SaveDialog

/** */
alias panel_save_dialog_get_type = c_panel_save_dialog_get_type;

/** */
alias panel_save_dialog_new = c_panel_save_dialog_new;

/** */
alias panel_save_dialog_add_delegate = c_panel_save_dialog_add_delegate;

/** */
alias panel_save_dialog_get_close_after_save = c_panel_save_dialog_get_close_after_save;

/** */
alias panel_save_dialog_run_async = c_panel_save_dialog_run_async;

/** */
alias panel_save_dialog_run_finish = c_panel_save_dialog_run_finish;

/** */
alias panel_save_dialog_set_close_after_save = c_panel_save_dialog_set_close_after_save;

// Session

/** */
alias panel_session_get_type = c_panel_session_get_type;

/** */
alias panel_session_new = c_panel_session_new;

/** */
alias panel_session_new_from_variant = c_panel_session_new_from_variant;

/** */
alias panel_session_append = c_panel_session_append;

/** */
alias panel_session_get_item = c_panel_session_get_item;

/** */
alias panel_session_get_n_items = c_panel_session_get_n_items;

/** */
alias panel_session_insert = c_panel_session_insert;

/** */
alias panel_session_lookup_by_id = c_panel_session_lookup_by_id;

/** */
alias panel_session_prepend = c_panel_session_prepend;

/** */
alias panel_session_remove = c_panel_session_remove;

/** */
alias panel_session_remove_at = c_panel_session_remove_at;

/** */
alias panel_session_to_variant = c_panel_session_to_variant;

// SessionItem

/** */
alias panel_session_item_get_type = c_panel_session_item_get_type;

/** */
alias panel_session_item_new = c_panel_session_item_new;

/** */
alias panel_session_item_get_id = c_panel_session_item_get_id;

/** */
alias panel_session_item_get_metadata = c_panel_session_item_get_metadata;

/** */
alias panel_session_item_get_metadata_value = c_panel_session_item_get_metadata_value;

/** */
alias panel_session_item_get_module_name = c_panel_session_item_get_module_name;

/** */
alias panel_session_item_get_position = c_panel_session_item_get_position;

/** */
alias panel_session_item_get_type_hint = c_panel_session_item_get_type_hint;

/** */
alias panel_session_item_get_workspace = c_panel_session_item_get_workspace;

/** */
alias panel_session_item_has_metadata = c_panel_session_item_has_metadata;

/** */
alias panel_session_item_has_metadata_with_type = c_panel_session_item_has_metadata_with_type;

/** */
alias panel_session_item_set_id = c_panel_session_item_set_id;

/** */
alias panel_session_item_set_metadata = c_panel_session_item_set_metadata;

/** */
alias panel_session_item_set_metadata_value = c_panel_session_item_set_metadata_value;

/** */
alias panel_session_item_set_module_name = c_panel_session_item_set_module_name;

/** */
alias panel_session_item_set_position = c_panel_session_item_set_position;

/** */
alias panel_session_item_set_type_hint = c_panel_session_item_set_type_hint;

/** */
alias panel_session_item_set_workspace = c_panel_session_item_set_workspace;

// Settings

/** */
alias panel_settings_get_type = c_panel_settings_get_type;

/** */
alias panel_settings_new = c_panel_settings_new;

/** */
alias panel_settings_new_relocatable = c_panel_settings_new_relocatable;

/** */
alias panel_settings_new_with_path = c_panel_settings_new_with_path;

/** */
alias panel_settings_resolve_schema_path = c_panel_settings_resolve_schema_path;

/** */
alias panel_settings_bind = c_panel_settings_bind;

/** */
alias panel_settings_bind_with_mapping = c_panel_settings_bind_with_mapping;

/** */
alias panel_settings_get_boolean = c_panel_settings_get_boolean;

/** */
alias panel_settings_get_default_value = c_panel_settings_get_default_value;

/** */
alias panel_settings_get_double = c_panel_settings_get_double;

/** */
alias panel_settings_get_int = c_panel_settings_get_int;

/** */
alias panel_settings_get_schema_id = c_panel_settings_get_schema_id;

/** */
alias panel_settings_get_string = c_panel_settings_get_string;

/** */
alias panel_settings_get_uint = c_panel_settings_get_uint;

/** */
alias panel_settings_get_user_value = c_panel_settings_get_user_value;

/** */
alias panel_settings_get_value = c_panel_settings_get_value;

/** */
alias panel_settings_set_boolean = c_panel_settings_set_boolean;

/** */
alias panel_settings_set_double = c_panel_settings_set_double;

/** */
alias panel_settings_set_int = c_panel_settings_set_int;

/** */
alias panel_settings_set_string = c_panel_settings_set_string;

/** */
alias panel_settings_set_uint = c_panel_settings_set_uint;

/** */
alias panel_settings_set_value = c_panel_settings_set_value;

/** */
alias panel_settings_unbind = c_panel_settings_unbind;

// Statusbar

/** */
alias panel_statusbar_get_type = c_panel_statusbar_get_type;

/** */
alias panel_statusbar_new = c_panel_statusbar_new;

/** */
alias panel_statusbar_add_prefix = c_panel_statusbar_add_prefix;

/** */
alias panel_statusbar_add_suffix = c_panel_statusbar_add_suffix;

/** */
alias panel_statusbar_remove = c_panel_statusbar_remove;

// ThemeSelector

/** */
alias panel_theme_selector_get_type = c_panel_theme_selector_get_type;

/** */
alias panel_theme_selector_new = c_panel_theme_selector_new;

/** */
alias panel_theme_selector_get_action_name = c_panel_theme_selector_get_action_name;

/** */
alias panel_theme_selector_set_action_name = c_panel_theme_selector_set_action_name;

// ToggleButton

/** */
alias panel_toggle_button_get_type = c_panel_toggle_button_get_type;

/** */
alias panel_toggle_button_new = c_panel_toggle_button_new;

// Widget

/** */
alias panel_widget_get_type = c_panel_widget_get_type;

/** */
alias panel_widget_new = c_panel_widget_new;

/** */
alias panel_widget_action_set_enabled = c_panel_widget_action_set_enabled;

/** */
alias panel_widget_close = c_panel_widget_close;

/** */
alias panel_widget_focus_default = c_panel_widget_focus_default;

/** */
alias panel_widget_force_close = c_panel_widget_force_close;

/** */
alias panel_widget_get_busy = c_panel_widget_get_busy;

/** */
alias panel_widget_get_can_maximize = c_panel_widget_get_can_maximize;

/** */
alias panel_widget_get_child = c_panel_widget_get_child;

/** */
alias panel_widget_get_default_focus = c_panel_widget_get_default_focus;

/** */
alias panel_widget_get_icon = c_panel_widget_get_icon;

/** */
alias panel_widget_get_icon_name = c_panel_widget_get_icon_name;

/** */
alias panel_widget_get_id = c_panel_widget_get_id;

/** */
alias panel_widget_get_kind = c_panel_widget_get_kind;

/** */
alias panel_widget_get_menu_model = c_panel_widget_get_menu_model;

/** */
alias panel_widget_get_modified = c_panel_widget_get_modified;

/** */
alias panel_widget_get_needs_attention = c_panel_widget_get_needs_attention;

/** */
alias panel_widget_get_position = c_panel_widget_get_position;

/** */
alias panel_widget_get_reorderable = c_panel_widget_get_reorderable;

/** */
alias panel_widget_get_save_delegate = c_panel_widget_get_save_delegate;

/** */
alias panel_widget_get_title = c_panel_widget_get_title;

/** */
alias panel_widget_get_tooltip = c_panel_widget_get_tooltip;

/** */
alias panel_widget_insert_action_group = c_panel_widget_insert_action_group;

/** */
alias panel_widget_mark_busy = c_panel_widget_mark_busy;

/** */
alias panel_widget_maximize = c_panel_widget_maximize;

/** */
alias panel_widget_raise = c_panel_widget_raise;

/** */
alias panel_widget_set_can_maximize = c_panel_widget_set_can_maximize;

/** */
alias panel_widget_set_child = c_panel_widget_set_child;

/** */
alias panel_widget_set_icon = c_panel_widget_set_icon;

/** */
alias panel_widget_set_icon_name = c_panel_widget_set_icon_name;

/** */
alias panel_widget_set_id = c_panel_widget_set_id;

/** */
alias panel_widget_set_kind = c_panel_widget_set_kind;

/** */
alias panel_widget_set_menu_model = c_panel_widget_set_menu_model;

/** */
alias panel_widget_set_modified = c_panel_widget_set_modified;

/** */
alias panel_widget_set_needs_attention = c_panel_widget_set_needs_attention;

/** */
alias panel_widget_set_reorderable = c_panel_widget_set_reorderable;

/** */
alias panel_widget_set_save_delegate = c_panel_widget_set_save_delegate;

/** */
alias panel_widget_set_title = c_panel_widget_set_title;

/** */
alias panel_widget_set_tooltip = c_panel_widget_set_tooltip;

/** */
alias panel_widget_unmark_busy = c_panel_widget_unmark_busy;

/** */
alias panel_widget_unmaximize = c_panel_widget_unmaximize;

// WidgetClass

/** */
alias panel_widget_class_install_action = c_panel_widget_class_install_action;

/** */
alias panel_widget_class_install_property_action = c_panel_widget_class_install_property_action;

// Workbench

/** */
alias panel_workbench_get_type = c_panel_workbench_get_type;

/** */
alias panel_workbench_new = c_panel_workbench_new;

/** */
alias panel_workbench_find_from_widget = c_panel_workbench_find_from_widget;

/** */
alias panel_workbench_action_set_enabled = c_panel_workbench_action_set_enabled;

/** */
alias panel_workbench_activate = c_panel_workbench_activate;

/** */
alias panel_workbench_add_workspace = c_panel_workbench_add_workspace;

/** */
alias panel_workbench_find_workspace_typed = c_panel_workbench_find_workspace_typed;

/** */
alias panel_workbench_focus_workspace = c_panel_workbench_focus_workspace;

/** */
alias panel_workbench_foreach_workspace = c_panel_workbench_foreach_workspace;

/** */
alias panel_workbench_get_id = c_panel_workbench_get_id;

/** */
alias panel_workbench_remove_workspace = c_panel_workbench_remove_workspace;

/** */
alias panel_workbench_set_id = c_panel_workbench_set_id;

// WorkbenchClass

/** */
alias panel_workbench_class_install_action = c_panel_workbench_class_install_action;

/** */
alias panel_workbench_class_install_property_action = c_panel_workbench_class_install_property_action;

// Workspace

/** */
alias panel_workspace_get_type = c_panel_workspace_get_type;

/** */
alias panel_workspace_find_from_widget = c_panel_workspace_find_from_widget;

/** */
alias panel_workspace_action_set_enabled = c_panel_workspace_action_set_enabled;

/** */
alias panel_workspace_get_id = c_panel_workspace_get_id;

/** */
alias panel_workspace_get_workbench = c_panel_workspace_get_workbench;

/** */
alias panel_workspace_inhibit = c_panel_workspace_inhibit;

/** */
alias panel_workspace_set_id = c_panel_workspace_set_id;

// WorkspaceClass

/** */
alias panel_workspace_class_install_action = c_panel_workspace_class_install_action;

/** */
alias panel_workspace_class_install_property_action = c_panel_workspace_class_install_property_action;

// global

/** */
alias panel_check_version = c_panel_check_version;

/** */
alias panel_finalize = c_panel_finalize;

/** */
alias panel_get_major_version = c_panel_get_major_version;

/** */
alias panel_get_micro_version = c_panel_get_micro_version;

/** */
alias panel_get_minor_version = c_panel_get_minor_version;

/** */
alias panel_get_resource = c_panel_get_resource;

/** */
alias panel_init = c_panel_init;

/** */
alias panel_marshal_BOOLEAN__OBJECT_OBJECT = c_panel_marshal_BOOLEAN__OBJECT_OBJECT;

/** */
alias panel_marshal_BOOLEAN__OBJECT_OBJECTv = c_panel_marshal_BOOLEAN__OBJECT_OBJECTv;

/** */
alias panel_marshal_OBJECT__OBJECT = c_panel_marshal_OBJECT__OBJECT;

/** */
alias panel_marshal_OBJECT__OBJECTv = c_panel_marshal_OBJECT__OBJECTv;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // ActionMuxer
  gidLink(cast(void**)&panel_action_muxer_get_type, "panel_action_muxer_get_type", libs);
  gidLink(cast(void**)&panel_action_muxer_new, "panel_action_muxer_new", libs);
  gidLink(cast(void**)&panel_action_muxer_get_action_group, "panel_action_muxer_get_action_group", libs);
  gidLink(cast(void**)&panel_action_muxer_insert_action_group, "panel_action_muxer_insert_action_group", libs);
  gidLink(cast(void**)&panel_action_muxer_list_groups, "panel_action_muxer_list_groups", libs);
  gidLink(cast(void**)&panel_action_muxer_remove_action_group, "panel_action_muxer_remove_action_group", libs);
  gidLink(cast(void**)&panel_action_muxer_remove_all, "panel_action_muxer_remove_all", libs);

  // Application
  gidLink(cast(void**)&panel_application_get_type, "panel_application_get_type", libs);
  gidLink(cast(void**)&panel_application_new, "panel_application_new", libs);

  // ChangesDialog
  gidLink(cast(void**)&panel_changes_dialog_get_type, "panel_changes_dialog_get_type", libs);
  gidLink(cast(void**)&panel_changes_dialog_new, "panel_changes_dialog_new", libs);
  gidLink(cast(void**)&panel_changes_dialog_add_delegate, "panel_changes_dialog_add_delegate", libs);
  gidLink(cast(void**)&panel_changes_dialog_get_close_after_save, "panel_changes_dialog_get_close_after_save", libs);
  gidLink(cast(void**)&panel_changes_dialog_run_async, "panel_changes_dialog_run_async", libs);
  gidLink(cast(void**)&panel_changes_dialog_run_finish, "panel_changes_dialog_run_finish", libs);
  gidLink(cast(void**)&panel_changes_dialog_set_close_after_save, "panel_changes_dialog_set_close_after_save", libs);

  // Dock
  gidLink(cast(void**)&panel_dock_get_type, "panel_dock_get_type", libs);
  gidLink(cast(void**)&panel_dock_new, "panel_dock_new", libs);
  gidLink(cast(void**)&panel_dock_foreach_frame, "panel_dock_foreach_frame", libs);
  gidLink(cast(void**)&panel_dock_get_can_reveal_area, "panel_dock_get_can_reveal_area", libs);
  gidLink(cast(void**)&panel_dock_get_can_reveal_bottom, "panel_dock_get_can_reveal_bottom", libs);
  gidLink(cast(void**)&panel_dock_get_can_reveal_end, "panel_dock_get_can_reveal_end", libs);
  gidLink(cast(void**)&panel_dock_get_can_reveal_start, "panel_dock_get_can_reveal_start", libs);
  gidLink(cast(void**)&panel_dock_get_can_reveal_top, "panel_dock_get_can_reveal_top", libs);
  gidLink(cast(void**)&panel_dock_get_reveal_area, "panel_dock_get_reveal_area", libs);
  gidLink(cast(void**)&panel_dock_get_reveal_bottom, "panel_dock_get_reveal_bottom", libs);
  gidLink(cast(void**)&panel_dock_get_reveal_end, "panel_dock_get_reveal_end", libs);
  gidLink(cast(void**)&panel_dock_get_reveal_start, "panel_dock_get_reveal_start", libs);
  gidLink(cast(void**)&panel_dock_get_reveal_top, "panel_dock_get_reveal_top", libs);
  gidLink(cast(void**)&panel_dock_remove, "panel_dock_remove", libs);
  gidLink(cast(void**)&panel_dock_set_bottom_height, "panel_dock_set_bottom_height", libs);
  gidLink(cast(void**)&panel_dock_set_end_width, "panel_dock_set_end_width", libs);
  gidLink(cast(void**)&panel_dock_set_reveal_area, "panel_dock_set_reveal_area", libs);
  gidLink(cast(void**)&panel_dock_set_reveal_bottom, "panel_dock_set_reveal_bottom", libs);
  gidLink(cast(void**)&panel_dock_set_reveal_end, "panel_dock_set_reveal_end", libs);
  gidLink(cast(void**)&panel_dock_set_reveal_start, "panel_dock_set_reveal_start", libs);
  gidLink(cast(void**)&panel_dock_set_reveal_top, "panel_dock_set_reveal_top", libs);
  gidLink(cast(void**)&panel_dock_set_start_width, "panel_dock_set_start_width", libs);
  gidLink(cast(void**)&panel_dock_set_top_height, "panel_dock_set_top_height", libs);

  // DocumentWorkspace
  gidLink(cast(void**)&panel_document_workspace_get_type, "panel_document_workspace_get_type", libs);
  gidLink(cast(void**)&panel_document_workspace_new, "panel_document_workspace_new", libs);
  gidLink(cast(void**)&panel_document_workspace_add_widget, "panel_document_workspace_add_widget", libs);
  gidLink(cast(void**)&panel_document_workspace_get_dock, "panel_document_workspace_get_dock", libs);
  gidLink(cast(void**)&panel_document_workspace_get_grid, "panel_document_workspace_get_grid", libs);
  gidLink(cast(void**)&panel_document_workspace_get_statusbar, "panel_document_workspace_get_statusbar", libs);
  gidLink(cast(void**)&panel_document_workspace_get_titlebar, "panel_document_workspace_get_titlebar", libs);
  gidLink(cast(void**)&panel_document_workspace_set_titlebar, "panel_document_workspace_set_titlebar", libs);

  // Frame
  gidLink(cast(void**)&panel_frame_get_type, "panel_frame_get_type", libs);
  gidLink(cast(void**)&panel_frame_new, "panel_frame_new", libs);
  gidLink(cast(void**)&panel_frame_add, "panel_frame_add", libs);
  gidLink(cast(void**)&panel_frame_add_before, "panel_frame_add_before", libs);
  gidLink(cast(void**)&panel_frame_get_closeable, "panel_frame_get_closeable", libs);
  gidLink(cast(void**)&panel_frame_get_empty, "panel_frame_get_empty", libs);
  gidLink(cast(void**)&panel_frame_get_header, "panel_frame_get_header", libs);
  gidLink(cast(void**)&panel_frame_get_n_pages, "panel_frame_get_n_pages", libs);
  gidLink(cast(void**)&panel_frame_get_page, "panel_frame_get_page", libs);
  gidLink(cast(void**)&panel_frame_get_pages, "panel_frame_get_pages", libs);
  gidLink(cast(void**)&panel_frame_get_placeholder, "panel_frame_get_placeholder", libs);
  gidLink(cast(void**)&panel_frame_get_position, "panel_frame_get_position", libs);
  gidLink(cast(void**)&panel_frame_get_requested_size, "panel_frame_get_requested_size", libs);
  gidLink(cast(void**)&panel_frame_get_visible_child, "panel_frame_get_visible_child", libs);
  gidLink(cast(void**)&panel_frame_remove, "panel_frame_remove", libs);
  gidLink(cast(void**)&panel_frame_set_child_pinned, "panel_frame_set_child_pinned", libs);
  gidLink(cast(void**)&panel_frame_set_header, "panel_frame_set_header", libs);
  gidLink(cast(void**)&panel_frame_set_placeholder, "panel_frame_set_placeholder", libs);
  gidLink(cast(void**)&panel_frame_set_requested_size, "panel_frame_set_requested_size", libs);
  gidLink(cast(void**)&panel_frame_set_visible_child, "panel_frame_set_visible_child", libs);

  // FrameHeader
  gidLink(cast(void**)&panel_frame_header_get_type, "panel_frame_header_get_type", libs);
  gidLink(cast(void**)&panel_frame_header_add_prefix, "panel_frame_header_add_prefix", libs);
  gidLink(cast(void**)&panel_frame_header_add_suffix, "panel_frame_header_add_suffix", libs);
  gidLink(cast(void**)&panel_frame_header_can_drop, "panel_frame_header_can_drop", libs);
  gidLink(cast(void**)&panel_frame_header_get_frame, "panel_frame_header_get_frame", libs);
  gidLink(cast(void**)&panel_frame_header_page_changed, "panel_frame_header_page_changed", libs);
  gidLink(cast(void**)&panel_frame_header_set_frame, "panel_frame_header_set_frame", libs);

  // FrameHeaderBar
  gidLink(cast(void**)&panel_frame_header_bar_get_type, "panel_frame_header_bar_get_type", libs);
  gidLink(cast(void**)&panel_frame_header_bar_new, "panel_frame_header_bar_new", libs);
  gidLink(cast(void**)&panel_frame_header_bar_get_menu_popover, "panel_frame_header_bar_get_menu_popover", libs);
  gidLink(cast(void**)&panel_frame_header_bar_get_show_icon, "panel_frame_header_bar_get_show_icon", libs);
  gidLink(cast(void**)&panel_frame_header_bar_set_show_icon, "panel_frame_header_bar_set_show_icon", libs);

  // FrameSwitcher
  gidLink(cast(void**)&panel_frame_switcher_get_type, "panel_frame_switcher_get_type", libs);
  gidLink(cast(void**)&panel_frame_switcher_new, "panel_frame_switcher_new", libs);

  // FrameTabBar
  gidLink(cast(void**)&panel_frame_tab_bar_get_type, "panel_frame_tab_bar_get_type", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_new, "panel_frame_tab_bar_new", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_get_autohide, "panel_frame_tab_bar_get_autohide", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_get_expand_tabs, "panel_frame_tab_bar_get_expand_tabs", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_get_inverted, "panel_frame_tab_bar_get_inverted", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_set_autohide, "panel_frame_tab_bar_set_autohide", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_set_expand_tabs, "panel_frame_tab_bar_set_expand_tabs", libs);
  gidLink(cast(void**)&panel_frame_tab_bar_set_inverted, "panel_frame_tab_bar_set_inverted", libs);

  // GSettingsActionGroup
  gidLink(cast(void**)&panel_gsettings_action_group_get_type, "panel_gsettings_action_group_get_type", libs);
  gidLink(cast(void**)&panel_gsettings_action_group_new, "panel_gsettings_action_group_new", libs);

  // Grid
  gidLink(cast(void**)&panel_grid_get_type, "panel_grid_get_type", libs);
  gidLink(cast(void**)&panel_grid_new, "panel_grid_new", libs);
  gidLink(cast(void**)&panel_grid_add, "panel_grid_add", libs);
  gidLink(cast(void**)&panel_grid_agree_to_close_async, "panel_grid_agree_to_close_async", libs);
  gidLink(cast(void**)&panel_grid_agree_to_close_finish, "panel_grid_agree_to_close_finish", libs);
  gidLink(cast(void**)&panel_grid_foreach_frame, "panel_grid_foreach_frame", libs);
  gidLink(cast(void**)&panel_grid_get_column, "panel_grid_get_column", libs);
  gidLink(cast(void**)&panel_grid_get_most_recent_column, "panel_grid_get_most_recent_column", libs);
  gidLink(cast(void**)&panel_grid_get_most_recent_frame, "panel_grid_get_most_recent_frame", libs);
  gidLink(cast(void**)&panel_grid_get_n_columns, "panel_grid_get_n_columns", libs);
  gidLink(cast(void**)&panel_grid_insert_column, "panel_grid_insert_column", libs);

  // GridColumn
  gidLink(cast(void**)&panel_grid_column_get_type, "panel_grid_column_get_type", libs);
  gidLink(cast(void**)&panel_grid_column_new, "panel_grid_column_new", libs);
  gidLink(cast(void**)&panel_grid_column_foreach_frame, "panel_grid_column_foreach_frame", libs);
  gidLink(cast(void**)&panel_grid_column_get_empty, "panel_grid_column_get_empty", libs);
  gidLink(cast(void**)&panel_grid_column_get_most_recent_frame, "panel_grid_column_get_most_recent_frame", libs);
  gidLink(cast(void**)&panel_grid_column_get_n_rows, "panel_grid_column_get_n_rows", libs);
  gidLink(cast(void**)&panel_grid_column_get_row, "panel_grid_column_get_row", libs);

  // Inhibitor
  gidLink(cast(void**)&panel_inhibitor_get_type, "panel_inhibitor_get_type", libs);
  gidLink(cast(void**)&panel_inhibitor_uninhibit, "panel_inhibitor_uninhibit", libs);

  // LayeredSettings
  gidLink(cast(void**)&panel_layered_settings_get_type, "panel_layered_settings_get_type", libs);
  gidLink(cast(void**)&panel_layered_settings_new, "panel_layered_settings_new", libs);
  gidLink(cast(void**)&panel_layered_settings_append, "panel_layered_settings_append", libs);
  gidLink(cast(void**)&panel_layered_settings_bind, "panel_layered_settings_bind", libs);
  gidLink(cast(void**)&panel_layered_settings_bind_with_mapping, "panel_layered_settings_bind_with_mapping", libs);
  gidLink(cast(void**)&panel_layered_settings_get_boolean, "panel_layered_settings_get_boolean", libs);
  gidLink(cast(void**)&panel_layered_settings_get_default_value, "panel_layered_settings_get_default_value", libs);
  gidLink(cast(void**)&panel_layered_settings_get_double, "panel_layered_settings_get_double", libs);
  gidLink(cast(void**)&panel_layered_settings_get_int, "panel_layered_settings_get_int", libs);
  gidLink(cast(void**)&panel_layered_settings_get_key, "panel_layered_settings_get_key", libs);
  gidLink(cast(void**)&panel_layered_settings_get_string, "panel_layered_settings_get_string", libs);
  gidLink(cast(void**)&panel_layered_settings_get_uint, "panel_layered_settings_get_uint", libs);
  gidLink(cast(void**)&panel_layered_settings_get_user_value, "panel_layered_settings_get_user_value", libs);
  gidLink(cast(void**)&panel_layered_settings_get_value, "panel_layered_settings_get_value", libs);
  gidLink(cast(void**)&panel_layered_settings_list_keys, "panel_layered_settings_list_keys", libs);
  gidLink(cast(void**)&panel_layered_settings_set_boolean, "panel_layered_settings_set_boolean", libs);
  gidLink(cast(void**)&panel_layered_settings_set_double, "panel_layered_settings_set_double", libs);
  gidLink(cast(void**)&panel_layered_settings_set_int, "panel_layered_settings_set_int", libs);
  gidLink(cast(void**)&panel_layered_settings_set_string, "panel_layered_settings_set_string", libs);
  gidLink(cast(void**)&panel_layered_settings_set_uint, "panel_layered_settings_set_uint", libs);
  gidLink(cast(void**)&panel_layered_settings_set_value, "panel_layered_settings_set_value", libs);
  gidLink(cast(void**)&panel_layered_settings_unbind, "panel_layered_settings_unbind", libs);

  // MenuManager
  gidLink(cast(void**)&panel_menu_manager_get_type, "panel_menu_manager_get_type", libs);
  gidLink(cast(void**)&panel_menu_manager_new, "panel_menu_manager_new", libs);
  gidLink(cast(void**)&panel_menu_manager_add_filename, "panel_menu_manager_add_filename", libs);
  gidLink(cast(void**)&panel_menu_manager_add_resource, "panel_menu_manager_add_resource", libs);
  gidLink(cast(void**)&panel_menu_manager_find_item_by_id, "panel_menu_manager_find_item_by_id", libs);
  gidLink(cast(void**)&panel_menu_manager_get_menu_by_id, "panel_menu_manager_get_menu_by_id", libs);
  gidLink(cast(void**)&panel_menu_manager_get_menu_ids, "panel_menu_manager_get_menu_ids", libs);
  gidLink(cast(void**)&panel_menu_manager_merge, "panel_menu_manager_merge", libs);
  gidLink(cast(void**)&panel_menu_manager_remove, "panel_menu_manager_remove", libs);
  gidLink(cast(void**)&panel_menu_manager_set_attribute_string, "panel_menu_manager_set_attribute_string", libs);

  // OmniBar
  gidLink(cast(void**)&panel_omni_bar_get_type, "panel_omni_bar_get_type", libs);
  gidLink(cast(void**)&panel_omni_bar_new, "panel_omni_bar_new", libs);
  gidLink(cast(void**)&panel_omni_bar_add_prefix, "panel_omni_bar_add_prefix", libs);
  gidLink(cast(void**)&panel_omni_bar_add_suffix, "panel_omni_bar_add_suffix", libs);
  gidLink(cast(void**)&panel_omni_bar_get_popover, "panel_omni_bar_get_popover", libs);
  gidLink(cast(void**)&panel_omni_bar_get_progress, "panel_omni_bar_get_progress", libs);
  gidLink(cast(void**)&panel_omni_bar_remove, "panel_omni_bar_remove", libs);
  gidLink(cast(void**)&panel_omni_bar_set_popover, "panel_omni_bar_set_popover", libs);
  gidLink(cast(void**)&panel_omni_bar_set_progress, "panel_omni_bar_set_progress", libs);
  gidLink(cast(void**)&panel_omni_bar_start_pulsing, "panel_omni_bar_start_pulsing", libs);
  gidLink(cast(void**)&panel_omni_bar_stop_pulsing, "panel_omni_bar_stop_pulsing", libs);

  // Paned
  gidLink(cast(void**)&panel_paned_get_type, "panel_paned_get_type", libs);
  gidLink(cast(void**)&panel_paned_new, "panel_paned_new", libs);
  gidLink(cast(void**)&panel_paned_append, "panel_paned_append", libs);
  gidLink(cast(void**)&panel_paned_get_n_children, "panel_paned_get_n_children", libs);
  gidLink(cast(void**)&panel_paned_get_nth_child, "panel_paned_get_nth_child", libs);
  gidLink(cast(void**)&panel_paned_insert, "panel_paned_insert", libs);
  gidLink(cast(void**)&panel_paned_insert_after, "panel_paned_insert_after", libs);
  gidLink(cast(void**)&panel_paned_prepend, "panel_paned_prepend", libs);
  gidLink(cast(void**)&panel_paned_remove, "panel_paned_remove", libs);

  // Position
  gidLink(cast(void**)&panel_position_get_type, "panel_position_get_type", libs);
  gidLink(cast(void**)&panel_position_new, "panel_position_new", libs);
  gidLink(cast(void**)&panel_position_new_from_variant, "panel_position_new_from_variant", libs);
  gidLink(cast(void**)&panel_position_equal, "panel_position_equal", libs);
  gidLink(cast(void**)&panel_position_get_area, "panel_position_get_area", libs);
  gidLink(cast(void**)&panel_position_get_area_set, "panel_position_get_area_set", libs);
  gidLink(cast(void**)&panel_position_get_column, "panel_position_get_column", libs);
  gidLink(cast(void**)&panel_position_get_column_set, "panel_position_get_column_set", libs);
  gidLink(cast(void**)&panel_position_get_depth, "panel_position_get_depth", libs);
  gidLink(cast(void**)&panel_position_get_depth_set, "panel_position_get_depth_set", libs);
  gidLink(cast(void**)&panel_position_get_row, "panel_position_get_row", libs);
  gidLink(cast(void**)&panel_position_get_row_set, "panel_position_get_row_set", libs);
  gidLink(cast(void**)&panel_position_is_indeterminate, "panel_position_is_indeterminate", libs);
  gidLink(cast(void**)&panel_position_set_area, "panel_position_set_area", libs);
  gidLink(cast(void**)&panel_position_set_area_set, "panel_position_set_area_set", libs);
  gidLink(cast(void**)&panel_position_set_column, "panel_position_set_column", libs);
  gidLink(cast(void**)&panel_position_set_column_set, "panel_position_set_column_set", libs);
  gidLink(cast(void**)&panel_position_set_depth, "panel_position_set_depth", libs);
  gidLink(cast(void**)&panel_position_set_depth_set, "panel_position_set_depth_set", libs);
  gidLink(cast(void**)&panel_position_set_row, "panel_position_set_row", libs);
  gidLink(cast(void**)&panel_position_set_row_set, "panel_position_set_row_set", libs);
  gidLink(cast(void**)&panel_position_to_variant, "panel_position_to_variant", libs);

  // SaveDelegate
  gidLink(cast(void**)&panel_save_delegate_get_type, "panel_save_delegate_get_type", libs);
  gidLink(cast(void**)&panel_save_delegate_new, "panel_save_delegate_new", libs);
  gidLink(cast(void**)&panel_save_delegate_close, "panel_save_delegate_close", libs);
  gidLink(cast(void**)&panel_save_delegate_discard, "panel_save_delegate_discard", libs);
  gidLink(cast(void**)&panel_save_delegate_get_icon, "panel_save_delegate_get_icon", libs);
  gidLink(cast(void**)&panel_save_delegate_get_icon_name, "panel_save_delegate_get_icon_name", libs);
  gidLink(cast(void**)&panel_save_delegate_get_is_draft, "panel_save_delegate_get_is_draft", libs);
  gidLink(cast(void**)&panel_save_delegate_get_progress, "panel_save_delegate_get_progress", libs);
  gidLink(cast(void**)&panel_save_delegate_get_subtitle, "panel_save_delegate_get_subtitle", libs);
  gidLink(cast(void**)&panel_save_delegate_get_title, "panel_save_delegate_get_title", libs);
  gidLink(cast(void**)&panel_save_delegate_save_async, "panel_save_delegate_save_async", libs);
  gidLink(cast(void**)&panel_save_delegate_save_finish, "panel_save_delegate_save_finish", libs);
  gidLink(cast(void**)&panel_save_delegate_set_icon, "panel_save_delegate_set_icon", libs);
  gidLink(cast(void**)&panel_save_delegate_set_icon_name, "panel_save_delegate_set_icon_name", libs);
  gidLink(cast(void**)&panel_save_delegate_set_is_draft, "panel_save_delegate_set_is_draft", libs);
  gidLink(cast(void**)&panel_save_delegate_set_progress, "panel_save_delegate_set_progress", libs);
  gidLink(cast(void**)&panel_save_delegate_set_subtitle, "panel_save_delegate_set_subtitle", libs);
  gidLink(cast(void**)&panel_save_delegate_set_title, "panel_save_delegate_set_title", libs);

  // SaveDialog
  gidLink(cast(void**)&panel_save_dialog_get_type, "panel_save_dialog_get_type", libs);
  gidLink(cast(void**)&panel_save_dialog_new, "panel_save_dialog_new", libs);
  gidLink(cast(void**)&panel_save_dialog_add_delegate, "panel_save_dialog_add_delegate", libs);
  gidLink(cast(void**)&panel_save_dialog_get_close_after_save, "panel_save_dialog_get_close_after_save", libs);
  gidLink(cast(void**)&panel_save_dialog_run_async, "panel_save_dialog_run_async", libs);
  gidLink(cast(void**)&panel_save_dialog_run_finish, "panel_save_dialog_run_finish", libs);
  gidLink(cast(void**)&panel_save_dialog_set_close_after_save, "panel_save_dialog_set_close_after_save", libs);

  // Session
  gidLink(cast(void**)&panel_session_get_type, "panel_session_get_type", libs);
  gidLink(cast(void**)&panel_session_new, "panel_session_new", libs);
  gidLink(cast(void**)&panel_session_new_from_variant, "panel_session_new_from_variant", libs);
  gidLink(cast(void**)&panel_session_append, "panel_session_append", libs);
  gidLink(cast(void**)&panel_session_get_item, "panel_session_get_item", libs);
  gidLink(cast(void**)&panel_session_get_n_items, "panel_session_get_n_items", libs);
  gidLink(cast(void**)&panel_session_insert, "panel_session_insert", libs);
  gidLink(cast(void**)&panel_session_lookup_by_id, "panel_session_lookup_by_id", libs);
  gidLink(cast(void**)&panel_session_prepend, "panel_session_prepend", libs);
  gidLink(cast(void**)&panel_session_remove, "panel_session_remove", libs);
  gidLink(cast(void**)&panel_session_remove_at, "panel_session_remove_at", libs);
  gidLink(cast(void**)&panel_session_to_variant, "panel_session_to_variant", libs);

  // SessionItem
  gidLink(cast(void**)&panel_session_item_get_type, "panel_session_item_get_type", libs);
  gidLink(cast(void**)&panel_session_item_new, "panel_session_item_new", libs);
  gidLink(cast(void**)&panel_session_item_get_id, "panel_session_item_get_id", libs);
  gidLink(cast(void**)&panel_session_item_get_metadata, "panel_session_item_get_metadata", libs);
  gidLink(cast(void**)&panel_session_item_get_metadata_value, "panel_session_item_get_metadata_value", libs);
  gidLink(cast(void**)&panel_session_item_get_module_name, "panel_session_item_get_module_name", libs);
  gidLink(cast(void**)&panel_session_item_get_position, "panel_session_item_get_position", libs);
  gidLink(cast(void**)&panel_session_item_get_type_hint, "panel_session_item_get_type_hint", libs);
  gidLink(cast(void**)&panel_session_item_get_workspace, "panel_session_item_get_workspace", libs);
  gidLink(cast(void**)&panel_session_item_has_metadata, "panel_session_item_has_metadata", libs);
  gidLink(cast(void**)&panel_session_item_has_metadata_with_type, "panel_session_item_has_metadata_with_type", libs);
  gidLink(cast(void**)&panel_session_item_set_id, "panel_session_item_set_id", libs);
  gidLink(cast(void**)&panel_session_item_set_metadata, "panel_session_item_set_metadata", libs);
  gidLink(cast(void**)&panel_session_item_set_metadata_value, "panel_session_item_set_metadata_value", libs);
  gidLink(cast(void**)&panel_session_item_set_module_name, "panel_session_item_set_module_name", libs);
  gidLink(cast(void**)&panel_session_item_set_position, "panel_session_item_set_position", libs);
  gidLink(cast(void**)&panel_session_item_set_type_hint, "panel_session_item_set_type_hint", libs);
  gidLink(cast(void**)&panel_session_item_set_workspace, "panel_session_item_set_workspace", libs);

  // Settings
  gidLink(cast(void**)&panel_settings_get_type, "panel_settings_get_type", libs);
  gidLink(cast(void**)&panel_settings_new, "panel_settings_new", libs);
  gidLink(cast(void**)&panel_settings_new_relocatable, "panel_settings_new_relocatable", libs);
  gidLink(cast(void**)&panel_settings_new_with_path, "panel_settings_new_with_path", libs);
  gidLink(cast(void**)&panel_settings_resolve_schema_path, "panel_settings_resolve_schema_path", libs);
  gidLink(cast(void**)&panel_settings_bind, "panel_settings_bind", libs);
  gidLink(cast(void**)&panel_settings_bind_with_mapping, "panel_settings_bind_with_mapping", libs);
  gidLink(cast(void**)&panel_settings_get_boolean, "panel_settings_get_boolean", libs);
  gidLink(cast(void**)&panel_settings_get_default_value, "panel_settings_get_default_value", libs);
  gidLink(cast(void**)&panel_settings_get_double, "panel_settings_get_double", libs);
  gidLink(cast(void**)&panel_settings_get_int, "panel_settings_get_int", libs);
  gidLink(cast(void**)&panel_settings_get_schema_id, "panel_settings_get_schema_id", libs);
  gidLink(cast(void**)&panel_settings_get_string, "panel_settings_get_string", libs);
  gidLink(cast(void**)&panel_settings_get_uint, "panel_settings_get_uint", libs);
  gidLink(cast(void**)&panel_settings_get_user_value, "panel_settings_get_user_value", libs);
  gidLink(cast(void**)&panel_settings_get_value, "panel_settings_get_value", libs);
  gidLink(cast(void**)&panel_settings_set_boolean, "panel_settings_set_boolean", libs);
  gidLink(cast(void**)&panel_settings_set_double, "panel_settings_set_double", libs);
  gidLink(cast(void**)&panel_settings_set_int, "panel_settings_set_int", libs);
  gidLink(cast(void**)&panel_settings_set_string, "panel_settings_set_string", libs);
  gidLink(cast(void**)&panel_settings_set_uint, "panel_settings_set_uint", libs);
  gidLink(cast(void**)&panel_settings_set_value, "panel_settings_set_value", libs);
  gidLink(cast(void**)&panel_settings_unbind, "panel_settings_unbind", libs);

  // Statusbar
  gidLink(cast(void**)&panel_statusbar_get_type, "panel_statusbar_get_type", libs);
  gidLink(cast(void**)&panel_statusbar_new, "panel_statusbar_new", libs);
  gidLink(cast(void**)&panel_statusbar_add_prefix, "panel_statusbar_add_prefix", libs);
  gidLink(cast(void**)&panel_statusbar_add_suffix, "panel_statusbar_add_suffix", libs);
  gidLink(cast(void**)&panel_statusbar_remove, "panel_statusbar_remove", libs);

  // ThemeSelector
  gidLink(cast(void**)&panel_theme_selector_get_type, "panel_theme_selector_get_type", libs);
  gidLink(cast(void**)&panel_theme_selector_new, "panel_theme_selector_new", libs);
  gidLink(cast(void**)&panel_theme_selector_get_action_name, "panel_theme_selector_get_action_name", libs);
  gidLink(cast(void**)&panel_theme_selector_set_action_name, "panel_theme_selector_set_action_name", libs);

  // ToggleButton
  gidLink(cast(void**)&panel_toggle_button_get_type, "panel_toggle_button_get_type", libs);
  gidLink(cast(void**)&panel_toggle_button_new, "panel_toggle_button_new", libs);

  // Widget
  gidLink(cast(void**)&panel_widget_get_type, "panel_widget_get_type", libs);
  gidLink(cast(void**)&panel_widget_new, "panel_widget_new", libs);
  gidLink(cast(void**)&panel_widget_action_set_enabled, "panel_widget_action_set_enabled", libs);
  gidLink(cast(void**)&panel_widget_close, "panel_widget_close", libs);
  gidLink(cast(void**)&panel_widget_focus_default, "panel_widget_focus_default", libs);
  gidLink(cast(void**)&panel_widget_force_close, "panel_widget_force_close", libs);
  gidLink(cast(void**)&panel_widget_get_busy, "panel_widget_get_busy", libs);
  gidLink(cast(void**)&panel_widget_get_can_maximize, "panel_widget_get_can_maximize", libs);
  gidLink(cast(void**)&panel_widget_get_child, "panel_widget_get_child", libs);
  gidLink(cast(void**)&panel_widget_get_default_focus, "panel_widget_get_default_focus", libs);
  gidLink(cast(void**)&panel_widget_get_icon, "panel_widget_get_icon", libs);
  gidLink(cast(void**)&panel_widget_get_icon_name, "panel_widget_get_icon_name", libs);
  gidLink(cast(void**)&panel_widget_get_id, "panel_widget_get_id", libs);
  gidLink(cast(void**)&panel_widget_get_kind, "panel_widget_get_kind", libs);
  gidLink(cast(void**)&panel_widget_get_menu_model, "panel_widget_get_menu_model", libs);
  gidLink(cast(void**)&panel_widget_get_modified, "panel_widget_get_modified", libs);
  gidLink(cast(void**)&panel_widget_get_needs_attention, "panel_widget_get_needs_attention", libs);
  gidLink(cast(void**)&panel_widget_get_position, "panel_widget_get_position", libs);
  gidLink(cast(void**)&panel_widget_get_reorderable, "panel_widget_get_reorderable", libs);
  gidLink(cast(void**)&panel_widget_get_save_delegate, "panel_widget_get_save_delegate", libs);
  gidLink(cast(void**)&panel_widget_get_title, "panel_widget_get_title", libs);
  gidLink(cast(void**)&panel_widget_get_tooltip, "panel_widget_get_tooltip", libs);
  gidLink(cast(void**)&panel_widget_insert_action_group, "panel_widget_insert_action_group", libs);
  gidLink(cast(void**)&panel_widget_mark_busy, "panel_widget_mark_busy", libs);
  gidLink(cast(void**)&panel_widget_maximize, "panel_widget_maximize", libs);
  gidLink(cast(void**)&panel_widget_raise, "panel_widget_raise", libs);
  gidLink(cast(void**)&panel_widget_set_can_maximize, "panel_widget_set_can_maximize", libs);
  gidLink(cast(void**)&panel_widget_set_child, "panel_widget_set_child", libs);
  gidLink(cast(void**)&panel_widget_set_icon, "panel_widget_set_icon", libs);
  gidLink(cast(void**)&panel_widget_set_icon_name, "panel_widget_set_icon_name", libs);
  gidLink(cast(void**)&panel_widget_set_id, "panel_widget_set_id", libs);
  gidLink(cast(void**)&panel_widget_set_kind, "panel_widget_set_kind", libs);
  gidLink(cast(void**)&panel_widget_set_menu_model, "panel_widget_set_menu_model", libs);
  gidLink(cast(void**)&panel_widget_set_modified, "panel_widget_set_modified", libs);
  gidLink(cast(void**)&panel_widget_set_needs_attention, "panel_widget_set_needs_attention", libs);
  gidLink(cast(void**)&panel_widget_set_reorderable, "panel_widget_set_reorderable", libs);
  gidLink(cast(void**)&panel_widget_set_save_delegate, "panel_widget_set_save_delegate", libs);
  gidLink(cast(void**)&panel_widget_set_title, "panel_widget_set_title", libs);
  gidLink(cast(void**)&panel_widget_set_tooltip, "panel_widget_set_tooltip", libs);
  gidLink(cast(void**)&panel_widget_unmark_busy, "panel_widget_unmark_busy", libs);
  gidLink(cast(void**)&panel_widget_unmaximize, "panel_widget_unmaximize", libs);

  // WidgetClass
  gidLink(cast(void**)&panel_widget_class_install_action, "panel_widget_class_install_action", libs);
  gidLink(cast(void**)&panel_widget_class_install_property_action, "panel_widget_class_install_property_action", libs);

  // Workbench
  gidLink(cast(void**)&panel_workbench_get_type, "panel_workbench_get_type", libs);
  gidLink(cast(void**)&panel_workbench_new, "panel_workbench_new", libs);
  gidLink(cast(void**)&panel_workbench_find_from_widget, "panel_workbench_find_from_widget", libs);
  gidLink(cast(void**)&panel_workbench_action_set_enabled, "panel_workbench_action_set_enabled", libs);
  gidLink(cast(void**)&panel_workbench_activate, "panel_workbench_activate", libs);
  gidLink(cast(void**)&panel_workbench_add_workspace, "panel_workbench_add_workspace", libs);
  gidLink(cast(void**)&panel_workbench_find_workspace_typed, "panel_workbench_find_workspace_typed", libs);
  gidLink(cast(void**)&panel_workbench_focus_workspace, "panel_workbench_focus_workspace", libs);
  gidLink(cast(void**)&panel_workbench_foreach_workspace, "panel_workbench_foreach_workspace", libs);
  gidLink(cast(void**)&panel_workbench_get_id, "panel_workbench_get_id", libs);
  gidLink(cast(void**)&panel_workbench_remove_workspace, "panel_workbench_remove_workspace", libs);
  gidLink(cast(void**)&panel_workbench_set_id, "panel_workbench_set_id", libs);

  // WorkbenchClass
  gidLink(cast(void**)&panel_workbench_class_install_action, "panel_workbench_class_install_action", libs);
  gidLink(cast(void**)&panel_workbench_class_install_property_action, "panel_workbench_class_install_property_action", libs);

  // Workspace
  gidLink(cast(void**)&panel_workspace_get_type, "panel_workspace_get_type", libs);
  gidLink(cast(void**)&panel_workspace_find_from_widget, "panel_workspace_find_from_widget", libs);
  gidLink(cast(void**)&panel_workspace_action_set_enabled, "panel_workspace_action_set_enabled", libs);
  gidLink(cast(void**)&panel_workspace_get_id, "panel_workspace_get_id", libs);
  gidLink(cast(void**)&panel_workspace_get_workbench, "panel_workspace_get_workbench", libs);
  gidLink(cast(void**)&panel_workspace_inhibit, "panel_workspace_inhibit", libs);
  gidLink(cast(void**)&panel_workspace_set_id, "panel_workspace_set_id", libs);

  // WorkspaceClass
  gidLink(cast(void**)&panel_workspace_class_install_action, "panel_workspace_class_install_action", libs);
  gidLink(cast(void**)&panel_workspace_class_install_property_action, "panel_workspace_class_install_property_action", libs);

  // global
  gidLink(cast(void**)&panel_check_version, "panel_check_version", libs);
  gidLink(cast(void**)&panel_finalize, "panel_finalize", libs);
  gidLink(cast(void**)&panel_get_major_version, "panel_get_major_version", libs);
  gidLink(cast(void**)&panel_get_micro_version, "panel_get_micro_version", libs);
  gidLink(cast(void**)&panel_get_minor_version, "panel_get_minor_version", libs);
  gidLink(cast(void**)&panel_get_resource, "panel_get_resource", libs);
  gidLink(cast(void**)&panel_init, "panel_init", libs);
  gidLink(cast(void**)&panel_marshal_BOOLEAN__OBJECT_OBJECT, "panel_marshal_BOOLEAN__OBJECT_OBJECT", libs);
  gidLink(cast(void**)&panel_marshal_BOOLEAN__OBJECT_OBJECTv, "panel_marshal_BOOLEAN__OBJECT_OBJECTv", libs);
  gidLink(cast(void**)&panel_marshal_OBJECT__OBJECT, "panel_marshal_OBJECT__OBJECT", libs);
  gidLink(cast(void**)&panel_marshal_OBJECT__OBJECTv, "panel_marshal_OBJECT__OBJECTv", libs);
}
