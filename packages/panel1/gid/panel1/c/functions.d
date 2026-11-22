/// C functions for panel1 library
module gid.panel1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.panel1.c.types;
static import gid.panel1.c._gidlib_Panel;
public import gid.adw1.c.types;
public import gid.gtk4.c.types;

private immutable LIBS = ["panel-1_1"];

private __gshared immutable(bool)* _gidLibMarker = &gid.panel1.c._gidlib_Panel.gidLibLinked;

// ActionMuxer
private alias c_panel_action_muxer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_action_muxer_get_typeFn c_panel_action_muxer_get_type; ///
private alias c_panel_action_muxer_newFn = extern(C) PanelActionMuxer* function() nothrow;
__gshared c_panel_action_muxer_newFn c_panel_action_muxer_new; ///
private alias c_panel_action_muxer_get_action_groupFn = extern(C) GActionGroup* function(PanelActionMuxer* self, const(char)* prefix) nothrow;
__gshared c_panel_action_muxer_get_action_groupFn c_panel_action_muxer_get_action_group; ///
private alias c_panel_action_muxer_insert_action_groupFn = extern(C) void function(PanelActionMuxer* self, const(char)* prefix, GActionGroup* actionGroup) nothrow;
__gshared c_panel_action_muxer_insert_action_groupFn c_panel_action_muxer_insert_action_group; ///
private alias c_panel_action_muxer_list_groupsFn = extern(C) char** function(PanelActionMuxer* self) nothrow;
__gshared c_panel_action_muxer_list_groupsFn c_panel_action_muxer_list_groups; ///
private alias c_panel_action_muxer_remove_action_groupFn = extern(C) void function(PanelActionMuxer* self, const(char)* prefix) nothrow;
__gshared c_panel_action_muxer_remove_action_groupFn c_panel_action_muxer_remove_action_group; ///
private alias c_panel_action_muxer_remove_allFn = extern(C) void function(PanelActionMuxer* self) nothrow;
__gshared c_panel_action_muxer_remove_allFn c_panel_action_muxer_remove_all; ///

// Application
private alias c_panel_application_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_application_get_typeFn c_panel_application_get_type; ///
private alias c_panel_application_newFn = extern(C) PanelApplication* function(const(char)* applicationId, GApplicationFlags flags) nothrow;
__gshared c_panel_application_newFn c_panel_application_new; ///

// ChangesDialog
private alias c_panel_changes_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_changes_dialog_get_typeFn c_panel_changes_dialog_get_type; ///
private alias c_panel_changes_dialog_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_changes_dialog_newFn c_panel_changes_dialog_new; ///
private alias c_panel_changes_dialog_add_delegateFn = extern(C) void function(PanelChangesDialog* self, PanelSaveDelegate* delegate_) nothrow;
__gshared c_panel_changes_dialog_add_delegateFn c_panel_changes_dialog_add_delegate; ///
private alias c_panel_changes_dialog_get_close_after_saveFn = extern(C) gboolean function(PanelChangesDialog* self) nothrow;
__gshared c_panel_changes_dialog_get_close_after_saveFn c_panel_changes_dialog_get_close_after_save; ///
private alias c_panel_changes_dialog_run_asyncFn = extern(C) void function(PanelChangesDialog* self, GtkWidget* parent, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_panel_changes_dialog_run_asyncFn c_panel_changes_dialog_run_async; ///
private alias c_panel_changes_dialog_run_finishFn = extern(C) gboolean function(PanelChangesDialog* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_panel_changes_dialog_run_finishFn c_panel_changes_dialog_run_finish; ///
private alias c_panel_changes_dialog_set_close_after_saveFn = extern(C) void function(PanelChangesDialog* self, gboolean closeAfterSave) nothrow;
__gshared c_panel_changes_dialog_set_close_after_saveFn c_panel_changes_dialog_set_close_after_save; ///

// Dock
private alias c_panel_dock_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_dock_get_typeFn c_panel_dock_get_type; ///
private alias c_panel_dock_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_dock_newFn c_panel_dock_new; ///
private alias c_panel_dock_foreach_frameFn = extern(C) void function(PanelDock* self, PanelFrameCallback callback, void* userData) nothrow;
__gshared c_panel_dock_foreach_frameFn c_panel_dock_foreach_frame; ///
private alias c_panel_dock_get_can_reveal_areaFn = extern(C) gboolean function(PanelDock* self, PanelArea area) nothrow;
__gshared c_panel_dock_get_can_reveal_areaFn c_panel_dock_get_can_reveal_area; ///
private alias c_panel_dock_get_can_reveal_bottomFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_can_reveal_bottomFn c_panel_dock_get_can_reveal_bottom; ///
private alias c_panel_dock_get_can_reveal_endFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_can_reveal_endFn c_panel_dock_get_can_reveal_end; ///
private alias c_panel_dock_get_can_reveal_startFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_can_reveal_startFn c_panel_dock_get_can_reveal_start; ///
private alias c_panel_dock_get_can_reveal_topFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_can_reveal_topFn c_panel_dock_get_can_reveal_top; ///
private alias c_panel_dock_get_reveal_areaFn = extern(C) gboolean function(PanelDock* self, PanelArea area) nothrow;
__gshared c_panel_dock_get_reveal_areaFn c_panel_dock_get_reveal_area; ///
private alias c_panel_dock_get_reveal_bottomFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_reveal_bottomFn c_panel_dock_get_reveal_bottom; ///
private alias c_panel_dock_get_reveal_endFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_reveal_endFn c_panel_dock_get_reveal_end; ///
private alias c_panel_dock_get_reveal_startFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_reveal_startFn c_panel_dock_get_reveal_start; ///
private alias c_panel_dock_get_reveal_topFn = extern(C) gboolean function(PanelDock* self) nothrow;
__gshared c_panel_dock_get_reveal_topFn c_panel_dock_get_reveal_top; ///
private alias c_panel_dock_removeFn = extern(C) void function(PanelDock* self, GtkWidget* widget) nothrow;
__gshared c_panel_dock_removeFn c_panel_dock_remove; ///
private alias c_panel_dock_set_bottom_heightFn = extern(C) void function(PanelDock* self, int height) nothrow;
__gshared c_panel_dock_set_bottom_heightFn c_panel_dock_set_bottom_height; ///
private alias c_panel_dock_set_end_widthFn = extern(C) void function(PanelDock* self, int width) nothrow;
__gshared c_panel_dock_set_end_widthFn c_panel_dock_set_end_width; ///
private alias c_panel_dock_set_reveal_areaFn = extern(C) void function(PanelDock* self, PanelArea area, gboolean reveal) nothrow;
__gshared c_panel_dock_set_reveal_areaFn c_panel_dock_set_reveal_area; ///
private alias c_panel_dock_set_reveal_bottomFn = extern(C) void function(PanelDock* self, gboolean revealBottom) nothrow;
__gshared c_panel_dock_set_reveal_bottomFn c_panel_dock_set_reveal_bottom; ///
private alias c_panel_dock_set_reveal_endFn = extern(C) void function(PanelDock* self, gboolean revealEnd) nothrow;
__gshared c_panel_dock_set_reveal_endFn c_panel_dock_set_reveal_end; ///
private alias c_panel_dock_set_reveal_startFn = extern(C) void function(PanelDock* self, gboolean revealStart) nothrow;
__gshared c_panel_dock_set_reveal_startFn c_panel_dock_set_reveal_start; ///
private alias c_panel_dock_set_reveal_topFn = extern(C) void function(PanelDock* self, gboolean revealTop) nothrow;
__gshared c_panel_dock_set_reveal_topFn c_panel_dock_set_reveal_top; ///
private alias c_panel_dock_set_start_widthFn = extern(C) void function(PanelDock* self, int width) nothrow;
__gshared c_panel_dock_set_start_widthFn c_panel_dock_set_start_width; ///
private alias c_panel_dock_set_top_heightFn = extern(C) void function(PanelDock* self, int height) nothrow;
__gshared c_panel_dock_set_top_heightFn c_panel_dock_set_top_height; ///

// DocumentWorkspace
private alias c_panel_document_workspace_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_document_workspace_get_typeFn c_panel_document_workspace_get_type; ///
private alias c_panel_document_workspace_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_document_workspace_newFn c_panel_document_workspace_new; ///
private alias c_panel_document_workspace_add_widgetFn = extern(C) gboolean function(PanelDocumentWorkspace* self, PanelWidget* widget, PanelPosition* position) nothrow;
__gshared c_panel_document_workspace_add_widgetFn c_panel_document_workspace_add_widget; ///
private alias c_panel_document_workspace_get_dockFn = extern(C) PanelDock* function(PanelDocumentWorkspace* self) nothrow;
__gshared c_panel_document_workspace_get_dockFn c_panel_document_workspace_get_dock; ///
private alias c_panel_document_workspace_get_gridFn = extern(C) PanelGrid* function(PanelDocumentWorkspace* self) nothrow;
__gshared c_panel_document_workspace_get_gridFn c_panel_document_workspace_get_grid; ///
private alias c_panel_document_workspace_get_statusbarFn = extern(C) PanelStatusbar* function(PanelDocumentWorkspace* self) nothrow;
__gshared c_panel_document_workspace_get_statusbarFn c_panel_document_workspace_get_statusbar; ///
private alias c_panel_document_workspace_get_titlebarFn = extern(C) GtkWidget* function(PanelDocumentWorkspace* self) nothrow;
__gshared c_panel_document_workspace_get_titlebarFn c_panel_document_workspace_get_titlebar; ///
private alias c_panel_document_workspace_set_titlebarFn = extern(C) void function(PanelDocumentWorkspace* self, GtkWidget* titlebar) nothrow;
__gshared c_panel_document_workspace_set_titlebarFn c_panel_document_workspace_set_titlebar; ///

// Frame
private alias c_panel_frame_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_frame_get_typeFn c_panel_frame_get_type; ///
private alias c_panel_frame_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_frame_newFn c_panel_frame_new; ///
private alias c_panel_frame_addFn = extern(C) void function(PanelFrame* self, PanelWidget* panel) nothrow;
__gshared c_panel_frame_addFn c_panel_frame_add; ///
private alias c_panel_frame_add_beforeFn = extern(C) void function(PanelFrame* self, PanelWidget* panel, PanelWidget* sibling) nothrow;
__gshared c_panel_frame_add_beforeFn c_panel_frame_add_before; ///
private alias c_panel_frame_get_closeableFn = extern(C) gboolean function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_closeableFn c_panel_frame_get_closeable; ///
private alias c_panel_frame_get_emptyFn = extern(C) gboolean function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_emptyFn c_panel_frame_get_empty; ///
private alias c_panel_frame_get_headerFn = extern(C) PanelFrameHeader* function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_headerFn c_panel_frame_get_header; ///
private alias c_panel_frame_get_n_pagesFn = extern(C) uint function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_n_pagesFn c_panel_frame_get_n_pages; ///
private alias c_panel_frame_get_pageFn = extern(C) PanelWidget* function(PanelFrame* self, uint n) nothrow;
__gshared c_panel_frame_get_pageFn c_panel_frame_get_page; ///
private alias c_panel_frame_get_pagesFn = extern(C) GtkSelectionModel* function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_pagesFn c_panel_frame_get_pages; ///
private alias c_panel_frame_get_placeholderFn = extern(C) GtkWidget* function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_placeholderFn c_panel_frame_get_placeholder; ///
private alias c_panel_frame_get_positionFn = extern(C) PanelPosition* function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_positionFn c_panel_frame_get_position; ///
private alias c_panel_frame_get_requested_sizeFn = extern(C) int function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_requested_sizeFn c_panel_frame_get_requested_size; ///
private alias c_panel_frame_get_visible_childFn = extern(C) PanelWidget* function(PanelFrame* self) nothrow;
__gshared c_panel_frame_get_visible_childFn c_panel_frame_get_visible_child; ///
private alias c_panel_frame_removeFn = extern(C) void function(PanelFrame* self, PanelWidget* panel) nothrow;
__gshared c_panel_frame_removeFn c_panel_frame_remove; ///
private alias c_panel_frame_set_child_pinnedFn = extern(C) void function(PanelFrame* self, PanelWidget* child, gboolean pinned) nothrow;
__gshared c_panel_frame_set_child_pinnedFn c_panel_frame_set_child_pinned; ///
private alias c_panel_frame_set_headerFn = extern(C) void function(PanelFrame* self, PanelFrameHeader* header) nothrow;
__gshared c_panel_frame_set_headerFn c_panel_frame_set_header; ///
private alias c_panel_frame_set_placeholderFn = extern(C) void function(PanelFrame* self, GtkWidget* placeholder) nothrow;
__gshared c_panel_frame_set_placeholderFn c_panel_frame_set_placeholder; ///
private alias c_panel_frame_set_requested_sizeFn = extern(C) void function(PanelFrame* self, int requestedSize) nothrow;
__gshared c_panel_frame_set_requested_sizeFn c_panel_frame_set_requested_size; ///
private alias c_panel_frame_set_visible_childFn = extern(C) void function(PanelFrame* self, PanelWidget* widget) nothrow;
__gshared c_panel_frame_set_visible_childFn c_panel_frame_set_visible_child; ///

// FrameHeader
private alias c_panel_frame_header_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_frame_header_get_typeFn c_panel_frame_header_get_type; ///
private alias c_panel_frame_header_add_prefixFn = extern(C) void function(PanelFrameHeader* self, int priority, GtkWidget* child) nothrow;
__gshared c_panel_frame_header_add_prefixFn c_panel_frame_header_add_prefix; ///
private alias c_panel_frame_header_add_suffixFn = extern(C) void function(PanelFrameHeader* self, int priority, GtkWidget* child) nothrow;
__gshared c_panel_frame_header_add_suffixFn c_panel_frame_header_add_suffix; ///
private alias c_panel_frame_header_can_dropFn = extern(C) gboolean function(PanelFrameHeader* self, PanelWidget* widget) nothrow;
__gshared c_panel_frame_header_can_dropFn c_panel_frame_header_can_drop; ///
private alias c_panel_frame_header_get_frameFn = extern(C) PanelFrame* function(PanelFrameHeader* self) nothrow;
__gshared c_panel_frame_header_get_frameFn c_panel_frame_header_get_frame; ///
private alias c_panel_frame_header_page_changedFn = extern(C) void function(PanelFrameHeader* self, PanelWidget* widget) nothrow;
__gshared c_panel_frame_header_page_changedFn c_panel_frame_header_page_changed; ///
private alias c_panel_frame_header_set_frameFn = extern(C) void function(PanelFrameHeader* self, PanelFrame* frame) nothrow;
__gshared c_panel_frame_header_set_frameFn c_panel_frame_header_set_frame; ///

// FrameHeaderBar
private alias c_panel_frame_header_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_frame_header_bar_get_typeFn c_panel_frame_header_bar_get_type; ///
private alias c_panel_frame_header_bar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_frame_header_bar_newFn c_panel_frame_header_bar_new; ///
private alias c_panel_frame_header_bar_get_menu_popoverFn = extern(C) GtkPopoverMenu* function(PanelFrameHeaderBar* self) nothrow;
__gshared c_panel_frame_header_bar_get_menu_popoverFn c_panel_frame_header_bar_get_menu_popover; ///
private alias c_panel_frame_header_bar_get_show_iconFn = extern(C) gboolean function(PanelFrameHeaderBar* self) nothrow;
__gshared c_panel_frame_header_bar_get_show_iconFn c_panel_frame_header_bar_get_show_icon; ///
private alias c_panel_frame_header_bar_set_show_iconFn = extern(C) void function(PanelFrameHeaderBar* self, gboolean showIcon) nothrow;
__gshared c_panel_frame_header_bar_set_show_iconFn c_panel_frame_header_bar_set_show_icon; ///

// FrameSwitcher
private alias c_panel_frame_switcher_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_frame_switcher_get_typeFn c_panel_frame_switcher_get_type; ///
private alias c_panel_frame_switcher_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_frame_switcher_newFn c_panel_frame_switcher_new; ///

// FrameTabBar
private alias c_panel_frame_tab_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_frame_tab_bar_get_typeFn c_panel_frame_tab_bar_get_type; ///
private alias c_panel_frame_tab_bar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_frame_tab_bar_newFn c_panel_frame_tab_bar_new; ///
private alias c_panel_frame_tab_bar_get_autohideFn = extern(C) gboolean function(PanelFrameTabBar* self) nothrow;
__gshared c_panel_frame_tab_bar_get_autohideFn c_panel_frame_tab_bar_get_autohide; ///
private alias c_panel_frame_tab_bar_get_expand_tabsFn = extern(C) gboolean function(PanelFrameTabBar* self) nothrow;
__gshared c_panel_frame_tab_bar_get_expand_tabsFn c_panel_frame_tab_bar_get_expand_tabs; ///
private alias c_panel_frame_tab_bar_get_invertedFn = extern(C) gboolean function(PanelFrameTabBar* self) nothrow;
__gshared c_panel_frame_tab_bar_get_invertedFn c_panel_frame_tab_bar_get_inverted; ///
private alias c_panel_frame_tab_bar_set_autohideFn = extern(C) void function(PanelFrameTabBar* self, gboolean autohide) nothrow;
__gshared c_panel_frame_tab_bar_set_autohideFn c_panel_frame_tab_bar_set_autohide; ///
private alias c_panel_frame_tab_bar_set_expand_tabsFn = extern(C) void function(PanelFrameTabBar* self, gboolean expandTabs) nothrow;
__gshared c_panel_frame_tab_bar_set_expand_tabsFn c_panel_frame_tab_bar_set_expand_tabs; ///
private alias c_panel_frame_tab_bar_set_invertedFn = extern(C) void function(PanelFrameTabBar* self, gboolean inverted) nothrow;
__gshared c_panel_frame_tab_bar_set_invertedFn c_panel_frame_tab_bar_set_inverted; ///

// GSettingsActionGroup
private alias c_panel_gsettings_action_group_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_gsettings_action_group_get_typeFn c_panel_gsettings_action_group_get_type; ///
private alias c_panel_gsettings_action_group_newFn = extern(C) GActionGroup* function(GSettings* settings) nothrow;
__gshared c_panel_gsettings_action_group_newFn c_panel_gsettings_action_group_new; ///

// Grid
private alias c_panel_grid_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_grid_get_typeFn c_panel_grid_get_type; ///
private alias c_panel_grid_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_grid_newFn c_panel_grid_new; ///
private alias c_panel_grid_addFn = extern(C) void function(PanelGrid* self, PanelWidget* widget) nothrow;
__gshared c_panel_grid_addFn c_panel_grid_add; ///
private alias c_panel_grid_agree_to_close_asyncFn = extern(C) void function(PanelGrid* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_panel_grid_agree_to_close_asyncFn c_panel_grid_agree_to_close_async; ///
private alias c_panel_grid_agree_to_close_finishFn = extern(C) gboolean function(PanelGrid* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_panel_grid_agree_to_close_finishFn c_panel_grid_agree_to_close_finish; ///
private alias c_panel_grid_foreach_frameFn = extern(C) void function(PanelGrid* self, PanelFrameCallback callback, void* userData) nothrow;
__gshared c_panel_grid_foreach_frameFn c_panel_grid_foreach_frame; ///
private alias c_panel_grid_get_columnFn = extern(C) PanelGridColumn* function(PanelGrid* self, uint column) nothrow;
__gshared c_panel_grid_get_columnFn c_panel_grid_get_column; ///
private alias c_panel_grid_get_most_recent_columnFn = extern(C) PanelGridColumn* function(PanelGrid* self) nothrow;
__gshared c_panel_grid_get_most_recent_columnFn c_panel_grid_get_most_recent_column; ///
private alias c_panel_grid_get_most_recent_frameFn = extern(C) PanelFrame* function(PanelGrid* self) nothrow;
__gshared c_panel_grid_get_most_recent_frameFn c_panel_grid_get_most_recent_frame; ///
private alias c_panel_grid_get_n_columnsFn = extern(C) uint function(PanelGrid* self) nothrow;
__gshared c_panel_grid_get_n_columnsFn c_panel_grid_get_n_columns; ///
private alias c_panel_grid_insert_columnFn = extern(C) void function(PanelGrid* self, uint position) nothrow;
__gshared c_panel_grid_insert_columnFn c_panel_grid_insert_column; ///

// GridColumn
private alias c_panel_grid_column_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_grid_column_get_typeFn c_panel_grid_column_get_type; ///
private alias c_panel_grid_column_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_grid_column_newFn c_panel_grid_column_new; ///
private alias c_panel_grid_column_foreach_frameFn = extern(C) void function(PanelGridColumn* self, PanelFrameCallback callback, void* userData) nothrow;
__gshared c_panel_grid_column_foreach_frameFn c_panel_grid_column_foreach_frame; ///
private alias c_panel_grid_column_get_emptyFn = extern(C) gboolean function(PanelGridColumn* self) nothrow;
__gshared c_panel_grid_column_get_emptyFn c_panel_grid_column_get_empty; ///
private alias c_panel_grid_column_get_most_recent_frameFn = extern(C) PanelFrame* function(PanelGridColumn* self) nothrow;
__gshared c_panel_grid_column_get_most_recent_frameFn c_panel_grid_column_get_most_recent_frame; ///
private alias c_panel_grid_column_get_n_rowsFn = extern(C) uint function(PanelGridColumn* self) nothrow;
__gshared c_panel_grid_column_get_n_rowsFn c_panel_grid_column_get_n_rows; ///
private alias c_panel_grid_column_get_rowFn = extern(C) PanelFrame* function(PanelGridColumn* self, uint row) nothrow;
__gshared c_panel_grid_column_get_rowFn c_panel_grid_column_get_row; ///

// Inhibitor
private alias c_panel_inhibitor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_inhibitor_get_typeFn c_panel_inhibitor_get_type; ///
private alias c_panel_inhibitor_uninhibitFn = extern(C) void function(PanelInhibitor* self) nothrow;
__gshared c_panel_inhibitor_uninhibitFn c_panel_inhibitor_uninhibit; ///

// LayeredSettings
private alias c_panel_layered_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_layered_settings_get_typeFn c_panel_layered_settings_get_type; ///
private alias c_panel_layered_settings_newFn = extern(C) PanelLayeredSettings* function(const(char)* schemaId, const(char)* path) nothrow;
__gshared c_panel_layered_settings_newFn c_panel_layered_settings_new; ///
private alias c_panel_layered_settings_appendFn = extern(C) void function(PanelLayeredSettings* self, GSettings* settings) nothrow;
__gshared c_panel_layered_settings_appendFn c_panel_layered_settings_append; ///
private alias c_panel_layered_settings_bindFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, GObject* object, const(char)* property, GSettingsBindFlags flags) nothrow;
__gshared c_panel_layered_settings_bindFn c_panel_layered_settings_bind; ///
private alias c_panel_layered_settings_bind_with_mappingFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_panel_layered_settings_bind_with_mappingFn c_panel_layered_settings_bind_with_mapping; ///
private alias c_panel_layered_settings_get_booleanFn = extern(C) gboolean function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_booleanFn c_panel_layered_settings_get_boolean; ///
private alias c_panel_layered_settings_get_default_valueFn = extern(C) GVariant* function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_default_valueFn c_panel_layered_settings_get_default_value; ///
private alias c_panel_layered_settings_get_doubleFn = extern(C) double function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_doubleFn c_panel_layered_settings_get_double; ///
private alias c_panel_layered_settings_get_intFn = extern(C) int function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_intFn c_panel_layered_settings_get_int; ///
private alias c_panel_layered_settings_get_keyFn = extern(C) GSettingsSchemaKey* function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_keyFn c_panel_layered_settings_get_key; ///
private alias c_panel_layered_settings_get_stringFn = extern(C) char* function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_stringFn c_panel_layered_settings_get_string; ///
private alias c_panel_layered_settings_get_uintFn = extern(C) uint function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_uintFn c_panel_layered_settings_get_uint; ///
private alias c_panel_layered_settings_get_user_valueFn = extern(C) GVariant* function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_user_valueFn c_panel_layered_settings_get_user_value; ///
private alias c_panel_layered_settings_get_valueFn = extern(C) GVariant* function(PanelLayeredSettings* self, const(char)* key) nothrow;
__gshared c_panel_layered_settings_get_valueFn c_panel_layered_settings_get_value; ///
private alias c_panel_layered_settings_list_keysFn = extern(C) char** function(PanelLayeredSettings* self) nothrow;
__gshared c_panel_layered_settings_list_keysFn c_panel_layered_settings_list_keys; ///
private alias c_panel_layered_settings_set_booleanFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, gboolean val) nothrow;
__gshared c_panel_layered_settings_set_booleanFn c_panel_layered_settings_set_boolean; ///
private alias c_panel_layered_settings_set_doubleFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, double val) nothrow;
__gshared c_panel_layered_settings_set_doubleFn c_panel_layered_settings_set_double; ///
private alias c_panel_layered_settings_set_intFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, int val) nothrow;
__gshared c_panel_layered_settings_set_intFn c_panel_layered_settings_set_int; ///
private alias c_panel_layered_settings_set_stringFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, const(char)* val) nothrow;
__gshared c_panel_layered_settings_set_stringFn c_panel_layered_settings_set_string; ///
private alias c_panel_layered_settings_set_uintFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, uint val) nothrow;
__gshared c_panel_layered_settings_set_uintFn c_panel_layered_settings_set_uint; ///
private alias c_panel_layered_settings_set_valueFn = extern(C) void function(PanelLayeredSettings* self, const(char)* key, GVariant* value) nothrow;
__gshared c_panel_layered_settings_set_valueFn c_panel_layered_settings_set_value; ///
private alias c_panel_layered_settings_unbindFn = extern(C) void function(PanelLayeredSettings* self, const(char)* property) nothrow;
__gshared c_panel_layered_settings_unbindFn c_panel_layered_settings_unbind; ///

// MenuManager
private alias c_panel_menu_manager_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_menu_manager_get_typeFn c_panel_menu_manager_get_type; ///
private alias c_panel_menu_manager_newFn = extern(C) PanelMenuManager* function() nothrow;
__gshared c_panel_menu_manager_newFn c_panel_menu_manager_new; ///
private alias c_panel_menu_manager_add_filenameFn = extern(C) uint function(PanelMenuManager* self, const(char)* filename, GError** _err) nothrow;
__gshared c_panel_menu_manager_add_filenameFn c_panel_menu_manager_add_filename; ///
private alias c_panel_menu_manager_add_resourceFn = extern(C) uint function(PanelMenuManager* self, const(char)* resource, GError** _err) nothrow;
__gshared c_panel_menu_manager_add_resourceFn c_panel_menu_manager_add_resource; ///
private alias c_panel_menu_manager_find_item_by_idFn = extern(C) GMenu* function(PanelMenuManager* self, const(char)* id, uint* position) nothrow;
__gshared c_panel_menu_manager_find_item_by_idFn c_panel_menu_manager_find_item_by_id; ///
private alias c_panel_menu_manager_get_menu_by_idFn = extern(C) GMenu* function(PanelMenuManager* self, const(char)* menuId) nothrow;
__gshared c_panel_menu_manager_get_menu_by_idFn c_panel_menu_manager_get_menu_by_id; ///
private alias c_panel_menu_manager_get_menu_idsFn = extern(C) const(char*)* function(PanelMenuManager* self) nothrow;
__gshared c_panel_menu_manager_get_menu_idsFn c_panel_menu_manager_get_menu_ids; ///
private alias c_panel_menu_manager_mergeFn = extern(C) uint function(PanelMenuManager* self, const(char)* menuId, GMenuModel* menuModel) nothrow;
__gshared c_panel_menu_manager_mergeFn c_panel_menu_manager_merge; ///
private alias c_panel_menu_manager_removeFn = extern(C) void function(PanelMenuManager* self, uint mergeId) nothrow;
__gshared c_panel_menu_manager_removeFn c_panel_menu_manager_remove; ///
private alias c_panel_menu_manager_set_attribute_stringFn = extern(C) void function(PanelMenuManager* self, GMenu* menu, uint position, const(char)* attribute, const(char)* value) nothrow;
__gshared c_panel_menu_manager_set_attribute_stringFn c_panel_menu_manager_set_attribute_string; ///

// OmniBar
private alias c_panel_omni_bar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_omni_bar_get_typeFn c_panel_omni_bar_get_type; ///
private alias c_panel_omni_bar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_omni_bar_newFn c_panel_omni_bar_new; ///
private alias c_panel_omni_bar_add_prefixFn = extern(C) void function(PanelOmniBar* self, int priority, GtkWidget* widget) nothrow;
__gshared c_panel_omni_bar_add_prefixFn c_panel_omni_bar_add_prefix; ///
private alias c_panel_omni_bar_add_suffixFn = extern(C) void function(PanelOmniBar* self, int priority, GtkWidget* widget) nothrow;
__gshared c_panel_omni_bar_add_suffixFn c_panel_omni_bar_add_suffix; ///
private alias c_panel_omni_bar_get_popoverFn = extern(C) GtkPopover* function(PanelOmniBar* self) nothrow;
__gshared c_panel_omni_bar_get_popoverFn c_panel_omni_bar_get_popover; ///
private alias c_panel_omni_bar_get_progressFn = extern(C) double function(PanelOmniBar* self) nothrow;
__gshared c_panel_omni_bar_get_progressFn c_panel_omni_bar_get_progress; ///
private alias c_panel_omni_bar_removeFn = extern(C) void function(PanelOmniBar* self, GtkWidget* widget) nothrow;
__gshared c_panel_omni_bar_removeFn c_panel_omni_bar_remove; ///
private alias c_panel_omni_bar_set_popoverFn = extern(C) void function(PanelOmniBar* self, GtkPopover* popover) nothrow;
__gshared c_panel_omni_bar_set_popoverFn c_panel_omni_bar_set_popover; ///
private alias c_panel_omni_bar_set_progressFn = extern(C) void function(PanelOmniBar* self, double progress) nothrow;
__gshared c_panel_omni_bar_set_progressFn c_panel_omni_bar_set_progress; ///
private alias c_panel_omni_bar_start_pulsingFn = extern(C) void function(PanelOmniBar* self) nothrow;
__gshared c_panel_omni_bar_start_pulsingFn c_panel_omni_bar_start_pulsing; ///
private alias c_panel_omni_bar_stop_pulsingFn = extern(C) void function(PanelOmniBar* self) nothrow;
__gshared c_panel_omni_bar_stop_pulsingFn c_panel_omni_bar_stop_pulsing; ///

// Paned
private alias c_panel_paned_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_paned_get_typeFn c_panel_paned_get_type; ///
private alias c_panel_paned_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_paned_newFn c_panel_paned_new; ///
private alias c_panel_paned_appendFn = extern(C) void function(PanelPaned* self, GtkWidget* child) nothrow;
__gshared c_panel_paned_appendFn c_panel_paned_append; ///
private alias c_panel_paned_get_n_childrenFn = extern(C) uint function(PanelPaned* self) nothrow;
__gshared c_panel_paned_get_n_childrenFn c_panel_paned_get_n_children; ///
private alias c_panel_paned_get_nth_childFn = extern(C) GtkWidget* function(PanelPaned* self, uint nth) nothrow;
__gshared c_panel_paned_get_nth_childFn c_panel_paned_get_nth_child; ///
private alias c_panel_paned_insertFn = extern(C) void function(PanelPaned* self, int position, GtkWidget* child) nothrow;
__gshared c_panel_paned_insertFn c_panel_paned_insert; ///
private alias c_panel_paned_insert_afterFn = extern(C) void function(PanelPaned* self, GtkWidget* child, GtkWidget* sibling) nothrow;
__gshared c_panel_paned_insert_afterFn c_panel_paned_insert_after; ///
private alias c_panel_paned_prependFn = extern(C) void function(PanelPaned* self, GtkWidget* child) nothrow;
__gshared c_panel_paned_prependFn c_panel_paned_prepend; ///
private alias c_panel_paned_removeFn = extern(C) void function(PanelPaned* self, GtkWidget* child) nothrow;
__gshared c_panel_paned_removeFn c_panel_paned_remove; ///

// Position
private alias c_panel_position_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_position_get_typeFn c_panel_position_get_type; ///
private alias c_panel_position_newFn = extern(C) PanelPosition* function() nothrow;
__gshared c_panel_position_newFn c_panel_position_new; ///
private alias c_panel_position_new_from_variantFn = extern(C) PanelPosition* function(GVariant* variant) nothrow;
__gshared c_panel_position_new_from_variantFn c_panel_position_new_from_variant; ///
private alias c_panel_position_equalFn = extern(C) gboolean function(PanelPosition* a, PanelPosition* b) nothrow;
__gshared c_panel_position_equalFn c_panel_position_equal; ///
private alias c_panel_position_get_areaFn = extern(C) PanelArea function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_areaFn c_panel_position_get_area; ///
private alias c_panel_position_get_area_setFn = extern(C) gboolean function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_area_setFn c_panel_position_get_area_set; ///
private alias c_panel_position_get_columnFn = extern(C) uint function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_columnFn c_panel_position_get_column; ///
private alias c_panel_position_get_column_setFn = extern(C) gboolean function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_column_setFn c_panel_position_get_column_set; ///
private alias c_panel_position_get_depthFn = extern(C) uint function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_depthFn c_panel_position_get_depth; ///
private alias c_panel_position_get_depth_setFn = extern(C) gboolean function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_depth_setFn c_panel_position_get_depth_set; ///
private alias c_panel_position_get_rowFn = extern(C) uint function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_rowFn c_panel_position_get_row; ///
private alias c_panel_position_get_row_setFn = extern(C) gboolean function(PanelPosition* self) nothrow;
__gshared c_panel_position_get_row_setFn c_panel_position_get_row_set; ///
private alias c_panel_position_is_indeterminateFn = extern(C) gboolean function(PanelPosition* self) nothrow;
__gshared c_panel_position_is_indeterminateFn c_panel_position_is_indeterminate; ///
private alias c_panel_position_set_areaFn = extern(C) void function(PanelPosition* self, PanelArea area) nothrow;
__gshared c_panel_position_set_areaFn c_panel_position_set_area; ///
private alias c_panel_position_set_area_setFn = extern(C) void function(PanelPosition* self, gboolean areaSet) nothrow;
__gshared c_panel_position_set_area_setFn c_panel_position_set_area_set; ///
private alias c_panel_position_set_columnFn = extern(C) void function(PanelPosition* self, uint column) nothrow;
__gshared c_panel_position_set_columnFn c_panel_position_set_column; ///
private alias c_panel_position_set_column_setFn = extern(C) void function(PanelPosition* self, gboolean columnSet) nothrow;
__gshared c_panel_position_set_column_setFn c_panel_position_set_column_set; ///
private alias c_panel_position_set_depthFn = extern(C) void function(PanelPosition* self, uint depth) nothrow;
__gshared c_panel_position_set_depthFn c_panel_position_set_depth; ///
private alias c_panel_position_set_depth_setFn = extern(C) void function(PanelPosition* self, gboolean depthSet) nothrow;
__gshared c_panel_position_set_depth_setFn c_panel_position_set_depth_set; ///
private alias c_panel_position_set_rowFn = extern(C) void function(PanelPosition* self, uint row) nothrow;
__gshared c_panel_position_set_rowFn c_panel_position_set_row; ///
private alias c_panel_position_set_row_setFn = extern(C) void function(PanelPosition* self, gboolean rowSet) nothrow;
__gshared c_panel_position_set_row_setFn c_panel_position_set_row_set; ///
private alias c_panel_position_to_variantFn = extern(C) GVariant* function(PanelPosition* self) nothrow;
__gshared c_panel_position_to_variantFn c_panel_position_to_variant; ///

// SaveDelegate
private alias c_panel_save_delegate_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_save_delegate_get_typeFn c_panel_save_delegate_get_type; ///
private alias c_panel_save_delegate_newFn = extern(C) PanelSaveDelegate* function() nothrow;
__gshared c_panel_save_delegate_newFn c_panel_save_delegate_new; ///
private alias c_panel_save_delegate_closeFn = extern(C) void function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_closeFn c_panel_save_delegate_close; ///
private alias c_panel_save_delegate_discardFn = extern(C) void function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_discardFn c_panel_save_delegate_discard; ///
private alias c_panel_save_delegate_get_iconFn = extern(C) GIcon* function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_iconFn c_panel_save_delegate_get_icon; ///
private alias c_panel_save_delegate_get_icon_nameFn = extern(C) const(char)* function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_icon_nameFn c_panel_save_delegate_get_icon_name; ///
private alias c_panel_save_delegate_get_is_draftFn = extern(C) gboolean function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_is_draftFn c_panel_save_delegate_get_is_draft; ///
private alias c_panel_save_delegate_get_progressFn = extern(C) double function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_progressFn c_panel_save_delegate_get_progress; ///
private alias c_panel_save_delegate_get_subtitleFn = extern(C) const(char)* function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_subtitleFn c_panel_save_delegate_get_subtitle; ///
private alias c_panel_save_delegate_get_titleFn = extern(C) const(char)* function(PanelSaveDelegate* self) nothrow;
__gshared c_panel_save_delegate_get_titleFn c_panel_save_delegate_get_title; ///
private alias c_panel_save_delegate_save_asyncFn = extern(C) void function(PanelSaveDelegate* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_panel_save_delegate_save_asyncFn c_panel_save_delegate_save_async; ///
private alias c_panel_save_delegate_save_finishFn = extern(C) gboolean function(PanelSaveDelegate* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_panel_save_delegate_save_finishFn c_panel_save_delegate_save_finish; ///
private alias c_panel_save_delegate_set_iconFn = extern(C) void function(PanelSaveDelegate* self, GIcon* icon) nothrow;
__gshared c_panel_save_delegate_set_iconFn c_panel_save_delegate_set_icon; ///
private alias c_panel_save_delegate_set_icon_nameFn = extern(C) void function(PanelSaveDelegate* self, const(char)* icon) nothrow;
__gshared c_panel_save_delegate_set_icon_nameFn c_panel_save_delegate_set_icon_name; ///
private alias c_panel_save_delegate_set_is_draftFn = extern(C) void function(PanelSaveDelegate* self, gboolean isDraft) nothrow;
__gshared c_panel_save_delegate_set_is_draftFn c_panel_save_delegate_set_is_draft; ///
private alias c_panel_save_delegate_set_progressFn = extern(C) void function(PanelSaveDelegate* self, double progress) nothrow;
__gshared c_panel_save_delegate_set_progressFn c_panel_save_delegate_set_progress; ///
private alias c_panel_save_delegate_set_subtitleFn = extern(C) void function(PanelSaveDelegate* self, const(char)* subtitle) nothrow;
__gshared c_panel_save_delegate_set_subtitleFn c_panel_save_delegate_set_subtitle; ///
private alias c_panel_save_delegate_set_titleFn = extern(C) void function(PanelSaveDelegate* self, const(char)* title) nothrow;
__gshared c_panel_save_delegate_set_titleFn c_panel_save_delegate_set_title; ///

// SaveDialog
private alias c_panel_save_dialog_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_save_dialog_get_typeFn c_panel_save_dialog_get_type; ///
private alias c_panel_save_dialog_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_save_dialog_newFn c_panel_save_dialog_new; ///
private alias c_panel_save_dialog_add_delegateFn = extern(C) void function(PanelSaveDialog* self, PanelSaveDelegate* delegate_) nothrow;
__gshared c_panel_save_dialog_add_delegateFn c_panel_save_dialog_add_delegate; ///
private alias c_panel_save_dialog_get_close_after_saveFn = extern(C) gboolean function(PanelSaveDialog* self) nothrow;
__gshared c_panel_save_dialog_get_close_after_saveFn c_panel_save_dialog_get_close_after_save; ///
private alias c_panel_save_dialog_run_asyncFn = extern(C) void function(PanelSaveDialog* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) nothrow;
__gshared c_panel_save_dialog_run_asyncFn c_panel_save_dialog_run_async; ///
private alias c_panel_save_dialog_run_finishFn = extern(C) gboolean function(PanelSaveDialog* self, GAsyncResult* result, GError** _err) nothrow;
__gshared c_panel_save_dialog_run_finishFn c_panel_save_dialog_run_finish; ///
private alias c_panel_save_dialog_set_close_after_saveFn = extern(C) void function(PanelSaveDialog* self, gboolean closeAfterSave) nothrow;
__gshared c_panel_save_dialog_set_close_after_saveFn c_panel_save_dialog_set_close_after_save; ///

// Session
private alias c_panel_session_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_session_get_typeFn c_panel_session_get_type; ///
private alias c_panel_session_newFn = extern(C) PanelSession* function() nothrow;
__gshared c_panel_session_newFn c_panel_session_new; ///
private alias c_panel_session_new_from_variantFn = extern(C) PanelSession* function(GVariant* variant, GError** _err) nothrow;
__gshared c_panel_session_new_from_variantFn c_panel_session_new_from_variant; ///
private alias c_panel_session_appendFn = extern(C) void function(PanelSession* self, PanelSessionItem* item) nothrow;
__gshared c_panel_session_appendFn c_panel_session_append; ///
private alias c_panel_session_get_itemFn = extern(C) PanelSessionItem* function(PanelSession* self, uint position) nothrow;
__gshared c_panel_session_get_itemFn c_panel_session_get_item; ///
private alias c_panel_session_get_n_itemsFn = extern(C) uint function(PanelSession* self) nothrow;
__gshared c_panel_session_get_n_itemsFn c_panel_session_get_n_items; ///
private alias c_panel_session_insertFn = extern(C) void function(PanelSession* self, uint position, PanelSessionItem* item) nothrow;
__gshared c_panel_session_insertFn c_panel_session_insert; ///
private alias c_panel_session_lookup_by_idFn = extern(C) PanelSessionItem* function(PanelSession* self, const(char)* id) nothrow;
__gshared c_panel_session_lookup_by_idFn c_panel_session_lookup_by_id; ///
private alias c_panel_session_prependFn = extern(C) void function(PanelSession* self, PanelSessionItem* item) nothrow;
__gshared c_panel_session_prependFn c_panel_session_prepend; ///
private alias c_panel_session_removeFn = extern(C) void function(PanelSession* self, PanelSessionItem* item) nothrow;
__gshared c_panel_session_removeFn c_panel_session_remove; ///
private alias c_panel_session_remove_atFn = extern(C) void function(PanelSession* self, uint position) nothrow;
__gshared c_panel_session_remove_atFn c_panel_session_remove_at; ///
private alias c_panel_session_to_variantFn = extern(C) GVariant* function(PanelSession* self) nothrow;
__gshared c_panel_session_to_variantFn c_panel_session_to_variant; ///

// SessionItem
private alias c_panel_session_item_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_session_item_get_typeFn c_panel_session_item_get_type; ///
private alias c_panel_session_item_newFn = extern(C) PanelSessionItem* function() nothrow;
__gshared c_panel_session_item_newFn c_panel_session_item_new; ///
private alias c_panel_session_item_get_idFn = extern(C) const(char)* function(PanelSessionItem* self) nothrow;
__gshared c_panel_session_item_get_idFn c_panel_session_item_get_id; ///
private alias c_panel_session_item_get_metadataFn = extern(C) gboolean function(PanelSessionItem* self, const(char)* key, const(char)* format,  ...) nothrow;
__gshared c_panel_session_item_get_metadataFn c_panel_session_item_get_metadata; ///
private alias c_panel_session_item_get_metadata_valueFn = extern(C) GVariant* function(PanelSessionItem* self, const(char)* key, const(GVariantType)* expectedType) nothrow;
__gshared c_panel_session_item_get_metadata_valueFn c_panel_session_item_get_metadata_value; ///
private alias c_panel_session_item_get_module_nameFn = extern(C) const(char)* function(PanelSessionItem* self) nothrow;
__gshared c_panel_session_item_get_module_nameFn c_panel_session_item_get_module_name; ///
private alias c_panel_session_item_get_positionFn = extern(C) PanelPosition* function(PanelSessionItem* self) nothrow;
__gshared c_panel_session_item_get_positionFn c_panel_session_item_get_position; ///
private alias c_panel_session_item_get_type_hintFn = extern(C) const(char)* function(PanelSessionItem* self) nothrow;
__gshared c_panel_session_item_get_type_hintFn c_panel_session_item_get_type_hint; ///
private alias c_panel_session_item_get_workspaceFn = extern(C) const(char)* function(PanelSessionItem* self) nothrow;
__gshared c_panel_session_item_get_workspaceFn c_panel_session_item_get_workspace; ///
private alias c_panel_session_item_has_metadataFn = extern(C) gboolean function(PanelSessionItem* self, const(char)* key, const(GVariantType*)* valueType) nothrow;
__gshared c_panel_session_item_has_metadataFn c_panel_session_item_has_metadata; ///
private alias c_panel_session_item_has_metadata_with_typeFn = extern(C) gboolean function(PanelSessionItem* self, const(char)* key, const(GVariantType)* expectedType) nothrow;
__gshared c_panel_session_item_has_metadata_with_typeFn c_panel_session_item_has_metadata_with_type; ///
private alias c_panel_session_item_set_idFn = extern(C) void function(PanelSessionItem* self, const(char)* id) nothrow;
__gshared c_panel_session_item_set_idFn c_panel_session_item_set_id; ///
private alias c_panel_session_item_set_metadataFn = extern(C) void function(PanelSessionItem* self, const(char)* key, const(char)* format,  ...) nothrow;
__gshared c_panel_session_item_set_metadataFn c_panel_session_item_set_metadata; ///
private alias c_panel_session_item_set_metadata_valueFn = extern(C) void function(PanelSessionItem* self, const(char)* key, GVariant* value) nothrow;
__gshared c_panel_session_item_set_metadata_valueFn c_panel_session_item_set_metadata_value; ///
private alias c_panel_session_item_set_module_nameFn = extern(C) void function(PanelSessionItem* self, const(char)* moduleName) nothrow;
__gshared c_panel_session_item_set_module_nameFn c_panel_session_item_set_module_name; ///
private alias c_panel_session_item_set_positionFn = extern(C) void function(PanelSessionItem* self, PanelPosition* position) nothrow;
__gshared c_panel_session_item_set_positionFn c_panel_session_item_set_position; ///
private alias c_panel_session_item_set_type_hintFn = extern(C) void function(PanelSessionItem* self, const(char)* typeHint) nothrow;
__gshared c_panel_session_item_set_type_hintFn c_panel_session_item_set_type_hint; ///
private alias c_panel_session_item_set_workspaceFn = extern(C) void function(PanelSessionItem* self, const(char)* workspace) nothrow;
__gshared c_panel_session_item_set_workspaceFn c_panel_session_item_set_workspace; ///

// Settings
private alias c_panel_settings_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_settings_get_typeFn c_panel_settings_get_type; ///
private alias c_panel_settings_newFn = extern(C) PanelSettings* function(const(char)* identifier, const(char)* schemaId) nothrow;
__gshared c_panel_settings_newFn c_panel_settings_new; ///
private alias c_panel_settings_new_relocatableFn = extern(C) PanelSettings* function(const(char)* identifier, const(char)* schemaId, const(char)* schemaIdPrefix, const(char)* pathPrefix, const(char)* pathSuffix) nothrow;
__gshared c_panel_settings_new_relocatableFn c_panel_settings_new_relocatable; ///
private alias c_panel_settings_new_with_pathFn = extern(C) PanelSettings* function(const(char)* identifier, const(char)* schemaId, const(char)* path) nothrow;
__gshared c_panel_settings_new_with_pathFn c_panel_settings_new_with_path; ///
private alias c_panel_settings_resolve_schema_pathFn = extern(C) char* function(const(char)* schemaIdPrefix, const(char)* schemaId, const(char)* identifier, const(char)* pathPrefix, const(char)* pathSuffix) nothrow;
__gshared c_panel_settings_resolve_schema_pathFn c_panel_settings_resolve_schema_path; ///
private alias c_panel_settings_bindFn = extern(C) void function(PanelSettings* self, const(char)* key, GObject* object, const(char)* property, GSettingsBindFlags flags) nothrow;
__gshared c_panel_settings_bindFn c_panel_settings_bind; ///
private alias c_panel_settings_bind_with_mappingFn = extern(C) void function(PanelSettings* self, const(char)* key, void* object, const(char)* property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy) nothrow;
__gshared c_panel_settings_bind_with_mappingFn c_panel_settings_bind_with_mapping; ///
private alias c_panel_settings_get_booleanFn = extern(C) gboolean function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_booleanFn c_panel_settings_get_boolean; ///
private alias c_panel_settings_get_default_valueFn = extern(C) GVariant* function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_default_valueFn c_panel_settings_get_default_value; ///
private alias c_panel_settings_get_doubleFn = extern(C) double function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_doubleFn c_panel_settings_get_double; ///
private alias c_panel_settings_get_intFn = extern(C) int function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_intFn c_panel_settings_get_int; ///
private alias c_panel_settings_get_schema_idFn = extern(C) const(char)* function(PanelSettings* self) nothrow;
__gshared c_panel_settings_get_schema_idFn c_panel_settings_get_schema_id; ///
private alias c_panel_settings_get_stringFn = extern(C) char* function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_stringFn c_panel_settings_get_string; ///
private alias c_panel_settings_get_uintFn = extern(C) uint function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_uintFn c_panel_settings_get_uint; ///
private alias c_panel_settings_get_user_valueFn = extern(C) GVariant* function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_user_valueFn c_panel_settings_get_user_value; ///
private alias c_panel_settings_get_valueFn = extern(C) GVariant* function(PanelSettings* self, const(char)* key) nothrow;
__gshared c_panel_settings_get_valueFn c_panel_settings_get_value; ///
private alias c_panel_settings_set_booleanFn = extern(C) void function(PanelSettings* self, const(char)* key, gboolean val) nothrow;
__gshared c_panel_settings_set_booleanFn c_panel_settings_set_boolean; ///
private alias c_panel_settings_set_doubleFn = extern(C) void function(PanelSettings* self, const(char)* key, double val) nothrow;
__gshared c_panel_settings_set_doubleFn c_panel_settings_set_double; ///
private alias c_panel_settings_set_intFn = extern(C) void function(PanelSettings* self, const(char)* key, int val) nothrow;
__gshared c_panel_settings_set_intFn c_panel_settings_set_int; ///
private alias c_panel_settings_set_stringFn = extern(C) void function(PanelSettings* self, const(char)* key, const(char)* val) nothrow;
__gshared c_panel_settings_set_stringFn c_panel_settings_set_string; ///
private alias c_panel_settings_set_uintFn = extern(C) void function(PanelSettings* self, const(char)* key, uint val) nothrow;
__gshared c_panel_settings_set_uintFn c_panel_settings_set_uint; ///
private alias c_panel_settings_set_valueFn = extern(C) void function(PanelSettings* self, const(char)* key, GVariant* value) nothrow;
__gshared c_panel_settings_set_valueFn c_panel_settings_set_value; ///
private alias c_panel_settings_unbindFn = extern(C) void function(PanelSettings* self, const(char)* property) nothrow;
__gshared c_panel_settings_unbindFn c_panel_settings_unbind; ///

// Statusbar
private alias c_panel_statusbar_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_statusbar_get_typeFn c_panel_statusbar_get_type; ///
private alias c_panel_statusbar_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_statusbar_newFn c_panel_statusbar_new; ///
private alias c_panel_statusbar_add_prefixFn = extern(C) void function(PanelStatusbar* self, int priority, GtkWidget* widget) nothrow;
__gshared c_panel_statusbar_add_prefixFn c_panel_statusbar_add_prefix; ///
private alias c_panel_statusbar_add_suffixFn = extern(C) void function(PanelStatusbar* self, int priority, GtkWidget* widget) nothrow;
__gshared c_panel_statusbar_add_suffixFn c_panel_statusbar_add_suffix; ///
private alias c_panel_statusbar_removeFn = extern(C) void function(PanelStatusbar* self, GtkWidget* widget) nothrow;
__gshared c_panel_statusbar_removeFn c_panel_statusbar_remove; ///

// ThemeSelector
private alias c_panel_theme_selector_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_theme_selector_get_typeFn c_panel_theme_selector_get_type; ///
private alias c_panel_theme_selector_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_theme_selector_newFn c_panel_theme_selector_new; ///
private alias c_panel_theme_selector_get_action_nameFn = extern(C) const(char)* function(PanelThemeSelector* self) nothrow;
__gshared c_panel_theme_selector_get_action_nameFn c_panel_theme_selector_get_action_name; ///
private alias c_panel_theme_selector_set_action_nameFn = extern(C) void function(PanelThemeSelector* self, const(char)* actionName) nothrow;
__gshared c_panel_theme_selector_set_action_nameFn c_panel_theme_selector_set_action_name; ///

// ToggleButton
private alias c_panel_toggle_button_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_toggle_button_get_typeFn c_panel_toggle_button_get_type; ///
private alias c_panel_toggle_button_newFn = extern(C) GtkWidget* function(PanelDock* dock, PanelArea area) nothrow;
__gshared c_panel_toggle_button_newFn c_panel_toggle_button_new; ///

// Widget
private alias c_panel_widget_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_widget_get_typeFn c_panel_widget_get_type; ///
private alias c_panel_widget_newFn = extern(C) GtkWidget* function() nothrow;
__gshared c_panel_widget_newFn c_panel_widget_new; ///
private alias c_panel_widget_action_set_enabledFn = extern(C) void function(PanelWidget* widget, const(char)* actionName, gboolean enabled) nothrow;
__gshared c_panel_widget_action_set_enabledFn c_panel_widget_action_set_enabled; ///
private alias c_panel_widget_closeFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_closeFn c_panel_widget_close; ///
private alias c_panel_widget_focus_defaultFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_focus_defaultFn c_panel_widget_focus_default; ///
private alias c_panel_widget_force_closeFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_force_closeFn c_panel_widget_force_close; ///
private alias c_panel_widget_get_busyFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_busyFn c_panel_widget_get_busy; ///
private alias c_panel_widget_get_can_maximizeFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_can_maximizeFn c_panel_widget_get_can_maximize; ///
private alias c_panel_widget_get_childFn = extern(C) GtkWidget* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_childFn c_panel_widget_get_child; ///
private alias c_panel_widget_get_default_focusFn = extern(C) GtkWidget* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_default_focusFn c_panel_widget_get_default_focus; ///
private alias c_panel_widget_get_iconFn = extern(C) GIcon* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_iconFn c_panel_widget_get_icon; ///
private alias c_panel_widget_get_icon_nameFn = extern(C) const(char)* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_icon_nameFn c_panel_widget_get_icon_name; ///
private alias c_panel_widget_get_idFn = extern(C) const(char)* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_idFn c_panel_widget_get_id; ///
private alias c_panel_widget_get_kindFn = extern(C) const(char)* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_kindFn c_panel_widget_get_kind; ///
private alias c_panel_widget_get_menu_modelFn = extern(C) GMenuModel* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_menu_modelFn c_panel_widget_get_menu_model; ///
private alias c_panel_widget_get_modifiedFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_modifiedFn c_panel_widget_get_modified; ///
private alias c_panel_widget_get_needs_attentionFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_needs_attentionFn c_panel_widget_get_needs_attention; ///
private alias c_panel_widget_get_positionFn = extern(C) PanelPosition* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_positionFn c_panel_widget_get_position; ///
private alias c_panel_widget_get_reorderableFn = extern(C) gboolean function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_reorderableFn c_panel_widget_get_reorderable; ///
private alias c_panel_widget_get_save_delegateFn = extern(C) PanelSaveDelegate* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_save_delegateFn c_panel_widget_get_save_delegate; ///
private alias c_panel_widget_get_titleFn = extern(C) const(char)* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_titleFn c_panel_widget_get_title; ///
private alias c_panel_widget_get_tooltipFn = extern(C) const(char)* function(PanelWidget* self) nothrow;
__gshared c_panel_widget_get_tooltipFn c_panel_widget_get_tooltip; ///
private alias c_panel_widget_insert_action_groupFn = extern(C) void function(PanelWidget* self, const(char)* prefix, GActionGroup* group) nothrow;
__gshared c_panel_widget_insert_action_groupFn c_panel_widget_insert_action_group; ///
private alias c_panel_widget_mark_busyFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_mark_busyFn c_panel_widget_mark_busy; ///
private alias c_panel_widget_maximizeFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_maximizeFn c_panel_widget_maximize; ///
private alias c_panel_widget_raiseFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_raiseFn c_panel_widget_raise; ///
private alias c_panel_widget_set_can_maximizeFn = extern(C) void function(PanelWidget* self, gboolean canMaximize) nothrow;
__gshared c_panel_widget_set_can_maximizeFn c_panel_widget_set_can_maximize; ///
private alias c_panel_widget_set_childFn = extern(C) void function(PanelWidget* self, GtkWidget* child) nothrow;
__gshared c_panel_widget_set_childFn c_panel_widget_set_child; ///
private alias c_panel_widget_set_iconFn = extern(C) void function(PanelWidget* self, GIcon* icon) nothrow;
__gshared c_panel_widget_set_iconFn c_panel_widget_set_icon; ///
private alias c_panel_widget_set_icon_nameFn = extern(C) void function(PanelWidget* self, const(char)* iconName) nothrow;
__gshared c_panel_widget_set_icon_nameFn c_panel_widget_set_icon_name; ///
private alias c_panel_widget_set_idFn = extern(C) void function(PanelWidget* self, const(char)* id) nothrow;
__gshared c_panel_widget_set_idFn c_panel_widget_set_id; ///
private alias c_panel_widget_set_kindFn = extern(C) void function(PanelWidget* self, const(char)* kind) nothrow;
__gshared c_panel_widget_set_kindFn c_panel_widget_set_kind; ///
private alias c_panel_widget_set_menu_modelFn = extern(C) void function(PanelWidget* self, GMenuModel* menuModel) nothrow;
__gshared c_panel_widget_set_menu_modelFn c_panel_widget_set_menu_model; ///
private alias c_panel_widget_set_modifiedFn = extern(C) void function(PanelWidget* self, gboolean modified) nothrow;
__gshared c_panel_widget_set_modifiedFn c_panel_widget_set_modified; ///
private alias c_panel_widget_set_needs_attentionFn = extern(C) void function(PanelWidget* self, gboolean needsAttention) nothrow;
__gshared c_panel_widget_set_needs_attentionFn c_panel_widget_set_needs_attention; ///
private alias c_panel_widget_set_reorderableFn = extern(C) void function(PanelWidget* self, gboolean reorderable) nothrow;
__gshared c_panel_widget_set_reorderableFn c_panel_widget_set_reorderable; ///
private alias c_panel_widget_set_save_delegateFn = extern(C) void function(PanelWidget* self, PanelSaveDelegate* saveDelegate) nothrow;
__gshared c_panel_widget_set_save_delegateFn c_panel_widget_set_save_delegate; ///
private alias c_panel_widget_set_titleFn = extern(C) void function(PanelWidget* self, const(char)* title) nothrow;
__gshared c_panel_widget_set_titleFn c_panel_widget_set_title; ///
private alias c_panel_widget_set_tooltipFn = extern(C) void function(PanelWidget* self, const(char)* tooltip) nothrow;
__gshared c_panel_widget_set_tooltipFn c_panel_widget_set_tooltip; ///
private alias c_panel_widget_unmark_busyFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_unmark_busyFn c_panel_widget_unmark_busy; ///
private alias c_panel_widget_unmaximizeFn = extern(C) void function(PanelWidget* self) nothrow;
__gshared c_panel_widget_unmaximizeFn c_panel_widget_unmaximize; ///

// WidgetClass
private alias c_panel_widget_class_install_actionFn = extern(C) void function(PanelWidgetClass* widgetClass, const(char)* actionName, const(char)* parameterType, GtkWidgetActionActivateFunc activate) nothrow;
__gshared c_panel_widget_class_install_actionFn c_panel_widget_class_install_action; ///
private alias c_panel_widget_class_install_property_actionFn = extern(C) void function(PanelWidgetClass* widgetClass, const(char)* actionName, const(char)* propertyName) nothrow;
__gshared c_panel_widget_class_install_property_actionFn c_panel_widget_class_install_property_action; ///

// Workbench
private alias c_panel_workbench_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_workbench_get_typeFn c_panel_workbench_get_type; ///
private alias c_panel_workbench_newFn = extern(C) PanelWorkbench* function() nothrow;
__gshared c_panel_workbench_newFn c_panel_workbench_new; ///
private alias c_panel_workbench_find_from_widgetFn = extern(C) PanelWorkbench* function(GtkWidget* widget) nothrow;
__gshared c_panel_workbench_find_from_widgetFn c_panel_workbench_find_from_widget; ///
private alias c_panel_workbench_action_set_enabledFn = extern(C) void function(PanelWorkbench* self, const(char)* actionName, gboolean enabled) nothrow;
__gshared c_panel_workbench_action_set_enabledFn c_panel_workbench_action_set_enabled; ///
private alias c_panel_workbench_activateFn = extern(C) void function(PanelWorkbench* self) nothrow;
__gshared c_panel_workbench_activateFn c_panel_workbench_activate; ///
private alias c_panel_workbench_add_workspaceFn = extern(C) void function(PanelWorkbench* self, PanelWorkspace* workspace) nothrow;
__gshared c_panel_workbench_add_workspaceFn c_panel_workbench_add_workspace; ///
private alias c_panel_workbench_find_workspace_typedFn = extern(C) PanelWorkspace* function(PanelWorkbench* self, GType workspaceType) nothrow;
__gshared c_panel_workbench_find_workspace_typedFn c_panel_workbench_find_workspace_typed; ///
private alias c_panel_workbench_focus_workspaceFn = extern(C) void function(PanelWorkbench* self, PanelWorkspace* workspace) nothrow;
__gshared c_panel_workbench_focus_workspaceFn c_panel_workbench_focus_workspace; ///
private alias c_panel_workbench_foreach_workspaceFn = extern(C) void function(PanelWorkbench* self, PanelWorkspaceForeach foreachFunc, void* foreachFuncData) nothrow;
__gshared c_panel_workbench_foreach_workspaceFn c_panel_workbench_foreach_workspace; ///
private alias c_panel_workbench_get_idFn = extern(C) const(char)* function(PanelWorkbench* self) nothrow;
__gshared c_panel_workbench_get_idFn c_panel_workbench_get_id; ///
private alias c_panel_workbench_remove_workspaceFn = extern(C) void function(PanelWorkbench* self, PanelWorkspace* workspace) nothrow;
__gshared c_panel_workbench_remove_workspaceFn c_panel_workbench_remove_workspace; ///
private alias c_panel_workbench_set_idFn = extern(C) void function(PanelWorkbench* self, const(char)* id) nothrow;
__gshared c_panel_workbench_set_idFn c_panel_workbench_set_id; ///

// WorkbenchClass
private alias c_panel_workbench_class_install_actionFn = extern(C) void function(PanelWorkbenchClass* workbenchClass, const(char)* actionName, const(char)* parameterType, PanelActionActivateFunc activate) nothrow;
__gshared c_panel_workbench_class_install_actionFn c_panel_workbench_class_install_action; ///
private alias c_panel_workbench_class_install_property_actionFn = extern(C) void function(PanelWorkbenchClass* workbenchClass, const(char)* actionName, const(char)* propertyName) nothrow;
__gshared c_panel_workbench_class_install_property_actionFn c_panel_workbench_class_install_property_action; ///

// Workspace
private alias c_panel_workspace_get_typeFn = extern(C) GType function() nothrow;
__gshared c_panel_workspace_get_typeFn c_panel_workspace_get_type; ///
private alias c_panel_workspace_find_from_widgetFn = extern(C) PanelWorkspace* function(GtkWidget* widget) nothrow;
__gshared c_panel_workspace_find_from_widgetFn c_panel_workspace_find_from_widget; ///
private alias c_panel_workspace_action_set_enabledFn = extern(C) void function(PanelWorkspace* self, const(char)* actionName, gboolean enabled) nothrow;
__gshared c_panel_workspace_action_set_enabledFn c_panel_workspace_action_set_enabled; ///
private alias c_panel_workspace_get_idFn = extern(C) const(char)* function(PanelWorkspace* self) nothrow;
__gshared c_panel_workspace_get_idFn c_panel_workspace_get_id; ///
private alias c_panel_workspace_get_workbenchFn = extern(C) PanelWorkbench* function(PanelWorkspace* self) nothrow;
__gshared c_panel_workspace_get_workbenchFn c_panel_workspace_get_workbench; ///
private alias c_panel_workspace_inhibitFn = extern(C) PanelInhibitor* function(PanelWorkspace* self, GtkApplicationInhibitFlags flags, const(char)* reason) nothrow;
__gshared c_panel_workspace_inhibitFn c_panel_workspace_inhibit; ///
private alias c_panel_workspace_set_idFn = extern(C) void function(PanelWorkspace* self, const(char)* id) nothrow;
__gshared c_panel_workspace_set_idFn c_panel_workspace_set_id; ///

// WorkspaceClass
private alias c_panel_workspace_class_install_actionFn = extern(C) void function(PanelWorkspaceClass* workspaceClass, const(char)* actionName, const(char)* parameterType, PanelActionActivateFunc activate) nothrow;
__gshared c_panel_workspace_class_install_actionFn c_panel_workspace_class_install_action; ///
private alias c_panel_workspace_class_install_property_actionFn = extern(C) void function(PanelWorkspaceClass* workspaceClass, const(char)* actionName, const(char)* propertyName) nothrow;
__gshared c_panel_workspace_class_install_property_actionFn c_panel_workspace_class_install_property_action; ///

// global
private alias c_panel_check_versionFn = extern(C) gboolean function(uint major, uint minor, uint micro) nothrow;
__gshared c_panel_check_versionFn c_panel_check_version; ///
private alias c_panel_finalizeFn = extern(C) void function() nothrow;
__gshared c_panel_finalizeFn c_panel_finalize; ///
private alias c_panel_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_panel_get_major_versionFn c_panel_get_major_version; ///
private alias c_panel_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_panel_get_micro_versionFn c_panel_get_micro_version; ///
private alias c_panel_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_panel_get_minor_versionFn c_panel_get_minor_version; ///
private alias c_panel_get_resourceFn = extern(C) GResource* function() nothrow;
__gshared c_panel_get_resourceFn c_panel_get_resource; ///
private alias c_panel_initFn = extern(C) void function() nothrow;
__gshared c_panel_initFn c_panel_init; ///
private alias c_panel_marshal_BOOLEAN__OBJECT_OBJECTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_panel_marshal_BOOLEAN__OBJECT_OBJECTFn c_panel_marshal_BOOLEAN__OBJECT_OBJECT; ///
private alias c_panel_marshal_BOOLEAN__OBJECT_OBJECTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, void* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_panel_marshal_BOOLEAN__OBJECT_OBJECTvFn c_panel_marshal_BOOLEAN__OBJECT_OBJECTv; ///
private alias c_panel_marshal_OBJECT__OBJECTFn = extern(C) void function(GClosure* closure, GValue* returnValue, uint nParamValues, const(GValue)* paramValues, void* invocationHint, void* marshalData) nothrow;
__gshared c_panel_marshal_OBJECT__OBJECTFn c_panel_marshal_OBJECT__OBJECT; ///
private alias c_panel_marshal_OBJECT__OBJECTvFn = extern(C) void function(GClosure* closure, GValue* returnValue, void* instance, void* args, void* marshalData, int nParams, GType* paramTypes) nothrow;
__gshared c_panel_marshal_OBJECT__OBJECTvFn c_panel_marshal_OBJECT__OBJECTv; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.panel1", "Panel");

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
