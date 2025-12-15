/// C functions for atk1 library
module atk.c.functions;

public import gid.basictypes;
import gid.loader;
import atk.c.types;
public import gobject.c.types;

version(Windows)
  private immutable LIBS = ["libatk-1.0-0.dll;atk-1.0-0.dll;atk-1.dll"];
else version(OSX)
  private immutable LIBS = ["libatk-1.0.0.dylib"];
else
  private immutable LIBS = ["libatk-1.0.so.0"];

__gshared extern(C)
{
  // Action
  GType function() c_atk_action_get_type; ///
  gboolean function(AtkAction* action, int i) c_atk_action_do_action; ///
  const(char)* function(AtkAction* action, int i) c_atk_action_get_description; ///
  const(char)* function(AtkAction* action, int i) c_atk_action_get_keybinding; ///
  const(char)* function(AtkAction* action, int i) c_atk_action_get_localized_name; ///
  int function(AtkAction* action) c_atk_action_get_n_actions; ///
  const(char)* function(AtkAction* action, int i) c_atk_action_get_name; ///
  gboolean function(AtkAction* action, int i, const(char)* desc) c_atk_action_set_description; ///

  // Attribute
  void function(AtkAttributeSet* attribSet) c_atk_attribute_set_free; ///

  // Component
  GType function() c_atk_component_get_type; ///
  uint function(AtkComponent* component, AtkFocusHandler handler) c_atk_component_add_focus_handler; ///
  gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) c_atk_component_contains; ///
  double function(AtkComponent* component) c_atk_component_get_alpha; ///
  void function(AtkComponent* component, int* x, int* y, int* width, int* height, AtkCoordType coordType) c_atk_component_get_extents; ///
  AtkLayer function(AtkComponent* component) c_atk_component_get_layer; ///
  int function(AtkComponent* component) c_atk_component_get_mdi_zorder; ///
  void function(AtkComponent* component, int* x, int* y, AtkCoordType coordType) c_atk_component_get_position; ///
  void function(AtkComponent* component, int* width, int* height) c_atk_component_get_size; ///
  gboolean function(AtkComponent* component) c_atk_component_grab_focus; ///
  AtkObject* function(AtkComponent* component, int x, int y, AtkCoordType coordType) c_atk_component_ref_accessible_at_point; ///
  void function(AtkComponent* component, uint handlerId) c_atk_component_remove_focus_handler; ///
  gboolean function(AtkComponent* component, AtkScrollType type) c_atk_component_scroll_to; ///
  gboolean function(AtkComponent* component, AtkCoordType coords, int x, int y) c_atk_component_scroll_to_point; ///
  gboolean function(AtkComponent* component, int x, int y, int width, int height, AtkCoordType coordType) c_atk_component_set_extents; ///
  gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) c_atk_component_set_position; ///
  gboolean function(AtkComponent* component, int width, int height) c_atk_component_set_size; ///

  // Document
  GType function() c_atk_document_get_type; ///
  const(char)* function(AtkDocument* document, const(char)* attributeName) c_atk_document_get_attribute_value; ///
  AtkAttributeSet* function(AtkDocument* document) c_atk_document_get_attributes; ///
  int function(AtkDocument* document) c_atk_document_get_current_page_number; ///
  void* function(AtkDocument* document) c_atk_document_get_document; ///
  const(char)* function(AtkDocument* document) c_atk_document_get_document_type; ///
  const(char)* function(AtkDocument* document) c_atk_document_get_locale; ///
  int function(AtkDocument* document) c_atk_document_get_page_count; ///
  GArray* function(AtkDocument* document) c_atk_document_get_text_selections; ///
  gboolean function(AtkDocument* document, const(char)* attributeName, const(char)* attributeValue) c_atk_document_set_attribute_value; ///
  gboolean function(AtkDocument* document, GArray* selections) c_atk_document_set_text_selections; ///

  // EditableText
  GType function() c_atk_editable_text_get_type; ///
  void function(AtkEditableText* text, int startPos, int endPos) c_atk_editable_text_copy_text; ///
  void function(AtkEditableText* text, int startPos, int endPos) c_atk_editable_text_cut_text; ///
  void function(AtkEditableText* text, int startPos, int endPos) c_atk_editable_text_delete_text; ///
  void function(AtkEditableText* text, const(char)* string_, int length, int* position) c_atk_editable_text_insert_text; ///
  void function(AtkEditableText* text, int position) c_atk_editable_text_paste_text; ///
  gboolean function(AtkEditableText* text, AtkAttributeSet* attribSet, int startOffset, int endOffset) c_atk_editable_text_set_run_attributes; ///
  void function(AtkEditableText* text, const(char)* string_) c_atk_editable_text_set_text_contents; ///

  // GObjectAccessible
  GType function() c_atk_gobject_accessible_get_type; ///
  AtkObject* function(GObject* obj) c_atk_gobject_accessible_for_object; ///
  GObject* function(AtkGObjectAccessible* obj) c_atk_gobject_accessible_get_object; ///

  // Hyperlink
  GType function() c_atk_hyperlink_get_type; ///
  int function(AtkHyperlink* link) c_atk_hyperlink_get_end_index; ///
  int function(AtkHyperlink* link) c_atk_hyperlink_get_n_anchors; ///
  AtkObject* function(AtkHyperlink* link, int i) c_atk_hyperlink_get_object; ///
  int function(AtkHyperlink* link) c_atk_hyperlink_get_start_index; ///
  char* function(AtkHyperlink* link, int i) c_atk_hyperlink_get_uri; ///
  gboolean function(AtkHyperlink* link) c_atk_hyperlink_is_inline; ///
  gboolean function(AtkHyperlink* link) c_atk_hyperlink_is_selected_link; ///
  gboolean function(AtkHyperlink* link) c_atk_hyperlink_is_valid; ///

  // HyperlinkImpl
  GType function() c_atk_hyperlink_impl_get_type; ///
  AtkHyperlink* function(AtkHyperlinkImpl* impl) c_atk_hyperlink_impl_get_hyperlink; ///

  // Hypertext
  GType function() c_atk_hypertext_get_type; ///
  AtkHyperlink* function(AtkHypertext* hypertext, int linkIndex) c_atk_hypertext_get_link; ///
  int function(AtkHypertext* hypertext, int charIndex) c_atk_hypertext_get_link_index; ///
  int function(AtkHypertext* hypertext) c_atk_hypertext_get_n_links; ///

  // Image
  GType function() c_atk_image_get_type; ///
  const(char)* function(AtkImage* image) c_atk_image_get_image_description; ///
  const(char)* function(AtkImage* image) c_atk_image_get_image_locale; ///
  void function(AtkImage* image, int* x, int* y, AtkCoordType coordType) c_atk_image_get_image_position; ///
  void function(AtkImage* image, int* width, int* height) c_atk_image_get_image_size; ///
  gboolean function(AtkImage* image, const(char)* description) c_atk_image_set_image_description; ///

  // Implementor
  AtkObject* function(AtkImplementor* implementor) c_atk_implementor_ref_accessible; ///

  // ImplementorIface
  GType function() c_atk_implementor_get_type; ///

  // Misc
  GType function() c_atk_misc_get_type; ///
  const(AtkMisc)* function() c_atk_misc_get_instance; ///
  void function(AtkMisc* misc) c_atk_misc_threads_enter; ///
  void function(AtkMisc* misc) c_atk_misc_threads_leave; ///

  // NoOpObject
  GType function() c_atk_no_op_object_get_type; ///
  AtkObject* function(GObject* obj) c_atk_no_op_object_new; ///

  // NoOpObjectFactory
  GType function() c_atk_no_op_object_factory_get_type; ///
  AtkObjectFactory* function() c_atk_no_op_object_factory_new; ///

  // ObjectFactory
  GType function() c_atk_object_factory_get_type; ///
  AtkObject* function(AtkObjectFactory* factory, GObject* obj) c_atk_object_factory_create_accessible; ///
  GType function(AtkObjectFactory* factory) c_atk_object_factory_get_accessible_type; ///
  void function(AtkObjectFactory* factory) c_atk_object_factory_invalidate; ///

  // ObjectWrap
  GType function() c_atk_object_get_type; ///
  gboolean function(AtkObject* object, AtkRelationType relationship, AtkObject* target) c_atk_object_add_relationship; ///
  uint function(AtkObject* accessible, AtkPropertyChangeHandler* handler) c_atk_object_connect_property_change_handler; ///
  const(char)* function(AtkObject* accessible) c_atk_object_get_accessible_id; ///
  AtkAttributeSet* function(AtkObject* accessible) c_atk_object_get_attributes; ///
  const(char)* function(AtkObject* accessible) c_atk_object_get_description; ///
  const(char)* function(AtkObject* accessible) c_atk_object_get_help_text; ///
  int function(AtkObject* accessible) c_atk_object_get_index_in_parent; ///
  AtkLayer function(AtkObject* accessible) c_atk_object_get_layer; ///
  int function(AtkObject* accessible) c_atk_object_get_mdi_zorder; ///
  int function(AtkObject* accessible) c_atk_object_get_n_accessible_children; ///
  const(char)* function(AtkObject* accessible) c_atk_object_get_name; ///
  const(char)* function(AtkObject* accessible) c_atk_object_get_object_locale; ///
  AtkObject* function(AtkObject* accessible) c_atk_object_get_parent; ///
  AtkRole function(AtkObject* accessible) c_atk_object_get_role; ///
  void function(AtkObject* accessible, void* data) c_atk_object_initialize; ///
  void function(AtkObject* accessible, AtkState state, gboolean value) c_atk_object_notify_state_change; ///
  AtkObject* function(AtkObject* accessible) c_atk_object_peek_parent; ///
  AtkObject* function(AtkObject* accessible, int i) c_atk_object_ref_accessible_child; ///
  AtkRelationSet* function(AtkObject* accessible) c_atk_object_ref_relation_set; ///
  AtkStateSet* function(AtkObject* accessible) c_atk_object_ref_state_set; ///
  void function(AtkObject* accessible, uint handlerId) c_atk_object_remove_property_change_handler; ///
  gboolean function(AtkObject* object, AtkRelationType relationship, AtkObject* target) c_atk_object_remove_relationship; ///
  void function(AtkObject* accessible, const(char)* id) c_atk_object_set_accessible_id; ///
  void function(AtkObject* accessible, const(char)* description) c_atk_object_set_description; ///
  void function(AtkObject* accessible, const(char)* helpText) c_atk_object_set_help_text; ///
  void function(AtkObject* accessible, const(char)* name) c_atk_object_set_name; ///
  void function(AtkObject* accessible, AtkObject* parent) c_atk_object_set_parent; ///
  void function(AtkObject* accessible, AtkRole role) c_atk_object_set_role; ///

  // Plug
  GType function() c_atk_plug_get_type; ///
  AtkObject* function() c_atk_plug_new; ///
  char* function(AtkPlug* plug) c_atk_plug_get_id; ///
  void function(AtkPlug* plug, AtkObject* child) c_atk_plug_set_child; ///

  // Range
  GType function() c_atk_range_get_type; ///
  AtkRange* function(double lowerLimit, double upperLimit, const(char)* description) c_atk_range_new; ///
  AtkRange* function(AtkRange* src) c_atk_range_copy; ///
  void function(AtkRange* range) c_atk_range_free; ///
  const(char)* function(AtkRange* range) c_atk_range_get_description; ///
  double function(AtkRange* range) c_atk_range_get_lower_limit; ///
  double function(AtkRange* range) c_atk_range_get_upper_limit; ///

  // Rectangle
  GType function() c_atk_rectangle_get_type; ///

  // Registry
  GType function() c_atk_registry_get_type; ///
  AtkObjectFactory* function(AtkRegistry* registry, GType type) c_atk_registry_get_factory; ///
  GType function(AtkRegistry* registry, GType type) c_atk_registry_get_factory_type; ///
  void function(AtkRegistry* registry, GType type, GType factoryType) c_atk_registry_set_factory_type; ///

  // Relation
  GType function() c_atk_relation_get_type; ///
  AtkRelation* function(AtkObject** targets, int nTargets, AtkRelationType relationship) c_atk_relation_new; ///
  void function(AtkRelation* relation, AtkObject* target) c_atk_relation_add_target; ///
  AtkRelationType function(AtkRelation* relation) c_atk_relation_get_relation_type; ///
  GPtrArray* function(AtkRelation* relation) c_atk_relation_get_target; ///
  gboolean function(AtkRelation* relation, AtkObject* target) c_atk_relation_remove_target; ///

  // RelationSet
  GType function() c_atk_relation_set_get_type; ///
  AtkRelationSet* function() c_atk_relation_set_new; ///
  void function(AtkRelationSet* set, AtkRelation* relation) c_atk_relation_set_add; ///
  void function(AtkRelationSet* set, AtkRelationType relationship, AtkObject* target) c_atk_relation_set_add_relation_by_type; ///
  gboolean function(AtkRelationSet* set, AtkRelationType relationship) c_atk_relation_set_contains; ///
  gboolean function(AtkRelationSet* set, AtkRelationType relationship, AtkObject* target) c_atk_relation_set_contains_target; ///
  int function(AtkRelationSet* set) c_atk_relation_set_get_n_relations; ///
  AtkRelation* function(AtkRelationSet* set, int i) c_atk_relation_set_get_relation; ///
  AtkRelation* function(AtkRelationSet* set, AtkRelationType relationship) c_atk_relation_set_get_relation_by_type; ///
  void function(AtkRelationSet* set, AtkRelation* relation) c_atk_relation_set_remove; ///

  // Selection
  GType function() c_atk_selection_get_type; ///
  gboolean function(AtkSelection* selection, int i) c_atk_selection_add_selection; ///
  gboolean function(AtkSelection* selection) c_atk_selection_clear_selection; ///
  int function(AtkSelection* selection) c_atk_selection_get_selection_count; ///
  gboolean function(AtkSelection* selection, int i) c_atk_selection_is_child_selected; ///
  AtkObject* function(AtkSelection* selection, int i) c_atk_selection_ref_selection; ///
  gboolean function(AtkSelection* selection, int i) c_atk_selection_remove_selection; ///
  gboolean function(AtkSelection* selection) c_atk_selection_select_all_selection; ///

  // Socket
  GType function() c_atk_socket_get_type; ///
  AtkObject* function() c_atk_socket_new; ///
  void function(AtkSocket* obj, const(char)* plugId) c_atk_socket_embed; ///
  gboolean function(AtkSocket* obj) c_atk_socket_is_occupied; ///

  // StateSet
  GType function() c_atk_state_set_get_type; ///
  AtkStateSet* function() c_atk_state_set_new; ///
  gboolean function(AtkStateSet* set, AtkStateType type) c_atk_state_set_add_state; ///
  void function(AtkStateSet* set, AtkStateType* types, int nTypes) c_atk_state_set_add_states; ///
  AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) c_atk_state_set_and_sets; ///
  void function(AtkStateSet* set) c_atk_state_set_clear_states; ///
  gboolean function(AtkStateSet* set, AtkStateType type) c_atk_state_set_contains_state; ///
  gboolean function(AtkStateSet* set, AtkStateType* types, int nTypes) c_atk_state_set_contains_states; ///
  gboolean function(AtkStateSet* set) c_atk_state_set_is_empty; ///
  AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) c_atk_state_set_or_sets; ///
  gboolean function(AtkStateSet* set, AtkStateType type) c_atk_state_set_remove_state; ///
  AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) c_atk_state_set_xor_sets; ///

  // StreamableContent
  GType function() c_atk_streamable_content_get_type; ///
  const(char)* function(AtkStreamableContent* streamable, int i) c_atk_streamable_content_get_mime_type; ///
  int function(AtkStreamableContent* streamable) c_atk_streamable_content_get_n_mime_types; ///
  GIOChannel* function(AtkStreamableContent* streamable, const(char)* mimeType) c_atk_streamable_content_get_stream; ///
  const(char)* function(AtkStreamableContent* streamable, const(char)* mimeType) c_atk_streamable_content_get_uri; ///

  // Table
  GType function() c_atk_table_get_type; ///
  gboolean function(AtkTable* table, int column) c_atk_table_add_column_selection; ///
  gboolean function(AtkTable* table, int row) c_atk_table_add_row_selection; ///
  AtkObject* function(AtkTable* table) c_atk_table_get_caption; ///
  int function(AtkTable* table, int index) c_atk_table_get_column_at_index; ///
  const(char)* function(AtkTable* table, int column) c_atk_table_get_column_description; ///
  int function(AtkTable* table, int row, int column) c_atk_table_get_column_extent_at; ///
  AtkObject* function(AtkTable* table, int column) c_atk_table_get_column_header; ///
  int function(AtkTable* table, int row, int column) c_atk_table_get_index_at; ///
  int function(AtkTable* table) c_atk_table_get_n_columns; ///
  int function(AtkTable* table) c_atk_table_get_n_rows; ///
  int function(AtkTable* table, int index) c_atk_table_get_row_at_index; ///
  const(char)* function(AtkTable* table, int row) c_atk_table_get_row_description; ///
  int function(AtkTable* table, int row, int column) c_atk_table_get_row_extent_at; ///
  AtkObject* function(AtkTable* table, int row) c_atk_table_get_row_header; ///
  int function(AtkTable* table, int** selected) c_atk_table_get_selected_columns; ///
  int function(AtkTable* table, int** selected) c_atk_table_get_selected_rows; ///
  AtkObject* function(AtkTable* table) c_atk_table_get_summary; ///
  gboolean function(AtkTable* table, int column) c_atk_table_is_column_selected; ///
  gboolean function(AtkTable* table, int row) c_atk_table_is_row_selected; ///
  gboolean function(AtkTable* table, int row, int column) c_atk_table_is_selected; ///
  AtkObject* function(AtkTable* table, int row, int column) c_atk_table_ref_at; ///
  gboolean function(AtkTable* table, int column) c_atk_table_remove_column_selection; ///
  gboolean function(AtkTable* table, int row) c_atk_table_remove_row_selection; ///
  void function(AtkTable* table, AtkObject* caption) c_atk_table_set_caption; ///
  void function(AtkTable* table, int column, const(char)* description) c_atk_table_set_column_description; ///
  void function(AtkTable* table, int column, AtkObject* header) c_atk_table_set_column_header; ///
  void function(AtkTable* table, int row, const(char)* description) c_atk_table_set_row_description; ///
  void function(AtkTable* table, int row, AtkObject* header) c_atk_table_set_row_header; ///
  void function(AtkTable* table, AtkObject* accessible) c_atk_table_set_summary; ///

  // TableCell
  GType function() c_atk_table_cell_get_type; ///
  GPtrArray* function(AtkTableCell* cell) c_atk_table_cell_get_column_header_cells; ///
  int function(AtkTableCell* cell) c_atk_table_cell_get_column_span; ///
  gboolean function(AtkTableCell* cell, int* row, int* column) c_atk_table_cell_get_position; ///
  gboolean function(AtkTableCell* cell, int* row, int* column, int* rowSpan, int* columnSpan) c_atk_table_cell_get_row_column_span; ///
  GPtrArray* function(AtkTableCell* cell) c_atk_table_cell_get_row_header_cells; ///
  int function(AtkTableCell* cell) c_atk_table_cell_get_row_span; ///
  AtkObject* function(AtkTableCell* cell) c_atk_table_cell_get_table; ///

  // Text
  GType function() c_atk_text_get_type; ///
  void function(AtkTextRange** ranges) c_atk_text_free_ranges; ///
  gboolean function(AtkText* text, int startOffset, int endOffset) c_atk_text_add_selection; ///
  AtkTextRange** function(AtkText* text, AtkTextRectangle* rect, AtkCoordType coordType, AtkTextClipType xClipType, AtkTextClipType yClipType) c_atk_text_get_bounded_ranges; ///
  int function(AtkText* text) c_atk_text_get_caret_offset; ///
  dchar function(AtkText* text, int offset) c_atk_text_get_character_at_offset; ///
  int function(AtkText* text) c_atk_text_get_character_count; ///
  void function(AtkText* text, int offset, int* x, int* y, int* width, int* height, AtkCoordType coords) c_atk_text_get_character_extents; ///
  AtkAttributeSet* function(AtkText* text) c_atk_text_get_default_attributes; ///
  int function(AtkText* text) c_atk_text_get_n_selections; ///
  int function(AtkText* text, int x, int y, AtkCoordType coords) c_atk_text_get_offset_at_point; ///
  void function(AtkText* text, int startOffset, int endOffset, AtkCoordType coordType, AtkTextRectangle* rect) c_atk_text_get_range_extents; ///
  AtkAttributeSet* function(AtkText* text, int offset, int* startOffset, int* endOffset) c_atk_text_get_run_attributes; ///
  char* function(AtkText* text, int selectionNum, int* startOffset, int* endOffset) c_atk_text_get_selection; ///
  char* function(AtkText* text, int offset, AtkTextGranularity granularity, int* startOffset, int* endOffset) c_atk_text_get_string_at_offset; ///
  char* function(AtkText* text, int startOffset, int endOffset) c_atk_text_get_text; ///
  char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) c_atk_text_get_text_after_offset; ///
  char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) c_atk_text_get_text_at_offset; ///
  char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) c_atk_text_get_text_before_offset; ///
  gboolean function(AtkText* text, int selectionNum) c_atk_text_remove_selection; ///
  gboolean function(AtkText* text, int startOffset, int endOffset, AtkScrollType type) c_atk_text_scroll_substring_to; ///
  gboolean function(AtkText* text, int startOffset, int endOffset, AtkCoordType coords, int x, int y) c_atk_text_scroll_substring_to_point; ///
  gboolean function(AtkText* text, int offset) c_atk_text_set_caret_offset; ///
  gboolean function(AtkText* text, int selectionNum, int startOffset, int endOffset) c_atk_text_set_selection; ///

  // TextRange
  GType function() c_atk_text_range_get_type; ///

  // Util
  GType function() c_atk_util_get_type; ///

  // Value
  GType function() c_atk_value_get_type; ///
  void function(AtkValue* obj, GValue* value) c_atk_value_get_current_value; ///
  double function(AtkValue* obj) c_atk_value_get_increment; ///
  void function(AtkValue* obj, GValue* value) c_atk_value_get_maximum_value; ///
  void function(AtkValue* obj, GValue* value) c_atk_value_get_minimum_increment; ///
  void function(AtkValue* obj, GValue* value) c_atk_value_get_minimum_value; ///
  AtkRange* function(AtkValue* obj) c_atk_value_get_range; ///
  GSList* function(AtkValue* obj) c_atk_value_get_sub_ranges; ///
  void function(AtkValue* obj, double* value, char** text) c_atk_value_get_value_and_text; ///
  gboolean function(AtkValue* obj, const(GValue)* value) c_atk_value_set_current_value; ///
  void function(AtkValue* obj, double newValue) c_atk_value_set_value; ///

  // Window
  GType function() c_atk_window_get_type; ///

  // global
  uint function(AtkEventListener focusTracker) c_atk_add_focus_tracker; ///
  uint function(GSignalEmissionHook listener, const(char)* eventType) c_atk_add_global_event_listener; ///
  uint function(AtkKeySnoopFunc listener, void* data) c_atk_add_key_event_listener; ///
  void function(AtkEventListenerInit init_) c_atk_focus_tracker_init; ///
  void function(AtkObject* object) c_atk_focus_tracker_notify; ///
  uint function() c_atk_get_binary_age; ///
  AtkRegistry* function() c_atk_get_default_registry; ///
  AtkObject* function() c_atk_get_focus_object; ///
  uint function() c_atk_get_interface_age; ///
  uint function() c_atk_get_major_version; ///
  uint function() c_atk_get_micro_version; ///
  uint function() c_atk_get_minor_version; ///
  AtkObject* function() c_atk_get_root; ///
  const(char)* function() c_atk_get_toolkit_name; ///
  const(char)* function() c_atk_get_toolkit_version; ///
  const(char)* function() c_atk_get_version; ///
  void function(uint trackerId) c_atk_remove_focus_tracker; ///
  void function(uint listenerId) c_atk_remove_global_event_listener; ///
  void function(uint listenerId) c_atk_remove_key_event_listener; ///

  // RelationType
  AtkRelationType function(const(char)* name) c_atk_relation_type_for_name; ///
  const(char)* function(AtkRelationType type) c_atk_relation_type_get_name; ///
  AtkRelationType function(const(char)* name) c_atk_relation_type_register; ///

  // Role
  AtkRole function(const(char)* name) c_atk_role_for_name; ///
  const(char)* function(AtkRole role) c_atk_role_get_localized_name; ///
  const(char)* function(AtkRole role) c_atk_role_get_name; ///
  AtkRole function(const(char)* name) c_atk_role_register; ///

  // StateType
  AtkStateType function(const(char)* name) c_atk_state_type_for_name; ///
  const(char)* function(AtkStateType type) c_atk_state_type_get_name; ///
  AtkStateType function(const(char)* name) c_atk_state_type_register; ///

  // TextAttribute
  AtkTextAttribute function(const(char)* name) c_atk_text_attribute_for_name; ///
  const(char)* function(AtkTextAttribute attr) c_atk_text_attribute_get_name; ///
  const(char)* function(AtkTextAttribute attr, int index) c_atk_text_attribute_get_value; ///
  AtkTextAttribute function(const(char)* name) c_atk_text_attribute_register; ///

  // ValueType
  const(char)* function(AtkValueType valueType) c_atk_value_type_get_localized_name; ///
  const(char)* function(AtkValueType valueType) c_atk_value_type_get_name; ///
}

// Action

/** */
alias atk_action_get_type = c_atk_action_get_type;

/** */
alias atk_action_do_action = c_atk_action_do_action;

/** */
alias atk_action_get_description = c_atk_action_get_description;

/** */
alias atk_action_get_keybinding = c_atk_action_get_keybinding;

/** */
alias atk_action_get_localized_name = c_atk_action_get_localized_name;

/** */
alias atk_action_get_n_actions = c_atk_action_get_n_actions;

/** */
alias atk_action_get_name = c_atk_action_get_name;

/** */
alias atk_action_set_description = c_atk_action_set_description;

// Attribute

/** */
alias atk_attribute_set_free = c_atk_attribute_set_free;

// Component

/** */
alias atk_component_get_type = c_atk_component_get_type;

/** */
alias atk_component_add_focus_handler = c_atk_component_add_focus_handler;

/** */
alias atk_component_contains = c_atk_component_contains;

/** */
alias atk_component_get_alpha = c_atk_component_get_alpha;

/** */
alias atk_component_get_extents = c_atk_component_get_extents;

/** */
alias atk_component_get_layer = c_atk_component_get_layer;

/** */
alias atk_component_get_mdi_zorder = c_atk_component_get_mdi_zorder;

/** */
alias atk_component_get_position = c_atk_component_get_position;

/** */
alias atk_component_get_size = c_atk_component_get_size;

/** */
alias atk_component_grab_focus = c_atk_component_grab_focus;

/** */
alias atk_component_ref_accessible_at_point = c_atk_component_ref_accessible_at_point;

/** */
alias atk_component_remove_focus_handler = c_atk_component_remove_focus_handler;

/** */
alias atk_component_scroll_to = c_atk_component_scroll_to;

/** */
alias atk_component_scroll_to_point = c_atk_component_scroll_to_point;

/** */
alias atk_component_set_extents = c_atk_component_set_extents;

/** */
alias atk_component_set_position = c_atk_component_set_position;

/** */
alias atk_component_set_size = c_atk_component_set_size;

// Document

/** */
alias atk_document_get_type = c_atk_document_get_type;

/** */
alias atk_document_get_attribute_value = c_atk_document_get_attribute_value;

/** */
alias atk_document_get_attributes = c_atk_document_get_attributes;

/** */
alias atk_document_get_current_page_number = c_atk_document_get_current_page_number;

/** */
alias atk_document_get_document = c_atk_document_get_document;

/** */
alias atk_document_get_document_type = c_atk_document_get_document_type;

/** */
alias atk_document_get_locale = c_atk_document_get_locale;

/** */
alias atk_document_get_page_count = c_atk_document_get_page_count;

/** */
alias atk_document_get_text_selections = c_atk_document_get_text_selections;

/** */
alias atk_document_set_attribute_value = c_atk_document_set_attribute_value;

/** */
alias atk_document_set_text_selections = c_atk_document_set_text_selections;

// EditableText

/** */
alias atk_editable_text_get_type = c_atk_editable_text_get_type;

/** */
alias atk_editable_text_copy_text = c_atk_editable_text_copy_text;

/** */
alias atk_editable_text_cut_text = c_atk_editable_text_cut_text;

/** */
alias atk_editable_text_delete_text = c_atk_editable_text_delete_text;

/** */
alias atk_editable_text_insert_text = c_atk_editable_text_insert_text;

/** */
alias atk_editable_text_paste_text = c_atk_editable_text_paste_text;

/** */
alias atk_editable_text_set_run_attributes = c_atk_editable_text_set_run_attributes;

/** */
alias atk_editable_text_set_text_contents = c_atk_editable_text_set_text_contents;

// GObjectAccessible

/** */
alias atk_gobject_accessible_get_type = c_atk_gobject_accessible_get_type;

/** */
alias atk_gobject_accessible_for_object = c_atk_gobject_accessible_for_object;

/** */
alias atk_gobject_accessible_get_object = c_atk_gobject_accessible_get_object;

// Hyperlink

/** */
alias atk_hyperlink_get_type = c_atk_hyperlink_get_type;

/** */
alias atk_hyperlink_get_end_index = c_atk_hyperlink_get_end_index;

/** */
alias atk_hyperlink_get_n_anchors = c_atk_hyperlink_get_n_anchors;

/** */
alias atk_hyperlink_get_object = c_atk_hyperlink_get_object;

/** */
alias atk_hyperlink_get_start_index = c_atk_hyperlink_get_start_index;

/** */
alias atk_hyperlink_get_uri = c_atk_hyperlink_get_uri;

/** */
alias atk_hyperlink_is_inline = c_atk_hyperlink_is_inline;

/** */
alias atk_hyperlink_is_selected_link = c_atk_hyperlink_is_selected_link;

/** */
alias atk_hyperlink_is_valid = c_atk_hyperlink_is_valid;

// HyperlinkImpl

/** */
alias atk_hyperlink_impl_get_type = c_atk_hyperlink_impl_get_type;

/** */
alias atk_hyperlink_impl_get_hyperlink = c_atk_hyperlink_impl_get_hyperlink;

// Hypertext

/** */
alias atk_hypertext_get_type = c_atk_hypertext_get_type;

/** */
alias atk_hypertext_get_link = c_atk_hypertext_get_link;

/** */
alias atk_hypertext_get_link_index = c_atk_hypertext_get_link_index;

/** */
alias atk_hypertext_get_n_links = c_atk_hypertext_get_n_links;

// Image

/** */
alias atk_image_get_type = c_atk_image_get_type;

/** */
alias atk_image_get_image_description = c_atk_image_get_image_description;

/** */
alias atk_image_get_image_locale = c_atk_image_get_image_locale;

/** */
alias atk_image_get_image_position = c_atk_image_get_image_position;

/** */
alias atk_image_get_image_size = c_atk_image_get_image_size;

/** */
alias atk_image_set_image_description = c_atk_image_set_image_description;

// Implementor

/** */
alias atk_implementor_ref_accessible = c_atk_implementor_ref_accessible;

// ImplementorIface

/** */
alias atk_implementor_get_type = c_atk_implementor_get_type;

// Misc

/** */
alias atk_misc_get_type = c_atk_misc_get_type;

/** */
alias atk_misc_get_instance = c_atk_misc_get_instance;

/** */
alias atk_misc_threads_enter = c_atk_misc_threads_enter;

/** */
alias atk_misc_threads_leave = c_atk_misc_threads_leave;

// NoOpObject

/** */
alias atk_no_op_object_get_type = c_atk_no_op_object_get_type;

/** */
alias atk_no_op_object_new = c_atk_no_op_object_new;

// NoOpObjectFactory

/** */
alias atk_no_op_object_factory_get_type = c_atk_no_op_object_factory_get_type;

/** */
alias atk_no_op_object_factory_new = c_atk_no_op_object_factory_new;

// ObjectFactory

/** */
alias atk_object_factory_get_type = c_atk_object_factory_get_type;

/** */
alias atk_object_factory_create_accessible = c_atk_object_factory_create_accessible;

/** */
alias atk_object_factory_get_accessible_type = c_atk_object_factory_get_accessible_type;

/** */
alias atk_object_factory_invalidate = c_atk_object_factory_invalidate;

// ObjectWrap

/** */
alias atk_object_get_type = c_atk_object_get_type;

/** */
alias atk_object_add_relationship = c_atk_object_add_relationship;

/** */
alias atk_object_connect_property_change_handler = c_atk_object_connect_property_change_handler;

/** */
alias atk_object_get_accessible_id = c_atk_object_get_accessible_id;

/** */
alias atk_object_get_attributes = c_atk_object_get_attributes;

/** */
alias atk_object_get_description = c_atk_object_get_description;

/** */
alias atk_object_get_help_text = c_atk_object_get_help_text;

/** */
alias atk_object_get_index_in_parent = c_atk_object_get_index_in_parent;

/** */
alias atk_object_get_layer = c_atk_object_get_layer;

/** */
alias atk_object_get_mdi_zorder = c_atk_object_get_mdi_zorder;

/** */
alias atk_object_get_n_accessible_children = c_atk_object_get_n_accessible_children;

/** */
alias atk_object_get_name = c_atk_object_get_name;

/** */
alias atk_object_get_object_locale = c_atk_object_get_object_locale;

/** */
alias atk_object_get_parent = c_atk_object_get_parent;

/** */
alias atk_object_get_role = c_atk_object_get_role;

/** */
alias atk_object_initialize = c_atk_object_initialize;

/** */
alias atk_object_notify_state_change = c_atk_object_notify_state_change;

/** */
alias atk_object_peek_parent = c_atk_object_peek_parent;

/** */
alias atk_object_ref_accessible_child = c_atk_object_ref_accessible_child;

/** */
alias atk_object_ref_relation_set = c_atk_object_ref_relation_set;

/** */
alias atk_object_ref_state_set = c_atk_object_ref_state_set;

/** */
alias atk_object_remove_property_change_handler = c_atk_object_remove_property_change_handler;

/** */
alias atk_object_remove_relationship = c_atk_object_remove_relationship;

/** */
alias atk_object_set_accessible_id = c_atk_object_set_accessible_id;

/** */
alias atk_object_set_description = c_atk_object_set_description;

/** */
alias atk_object_set_help_text = c_atk_object_set_help_text;

/** */
alias atk_object_set_name = c_atk_object_set_name;

/** */
alias atk_object_set_parent = c_atk_object_set_parent;

/** */
alias atk_object_set_role = c_atk_object_set_role;

// Plug

/** */
alias atk_plug_get_type = c_atk_plug_get_type;

/** */
alias atk_plug_new = c_atk_plug_new;

/** */
alias atk_plug_get_id = c_atk_plug_get_id;

/** */
alias atk_plug_set_child = c_atk_plug_set_child;

// Range

/** */
alias atk_range_get_type = c_atk_range_get_type;

/** */
alias atk_range_new = c_atk_range_new;

/** */
alias atk_range_copy = c_atk_range_copy;

/** */
alias atk_range_free = c_atk_range_free;

/** */
alias atk_range_get_description = c_atk_range_get_description;

/** */
alias atk_range_get_lower_limit = c_atk_range_get_lower_limit;

/** */
alias atk_range_get_upper_limit = c_atk_range_get_upper_limit;

// Rectangle

/** */
alias atk_rectangle_get_type = c_atk_rectangle_get_type;

// Registry

/** */
alias atk_registry_get_type = c_atk_registry_get_type;

/** */
alias atk_registry_get_factory = c_atk_registry_get_factory;

/** */
alias atk_registry_get_factory_type = c_atk_registry_get_factory_type;

/** */
alias atk_registry_set_factory_type = c_atk_registry_set_factory_type;

// Relation

/** */
alias atk_relation_get_type = c_atk_relation_get_type;

/** */
alias atk_relation_new = c_atk_relation_new;

/** */
alias atk_relation_add_target = c_atk_relation_add_target;

/** */
alias atk_relation_get_relation_type = c_atk_relation_get_relation_type;

/** */
alias atk_relation_get_target = c_atk_relation_get_target;

/** */
alias atk_relation_remove_target = c_atk_relation_remove_target;

// RelationSet

/** */
alias atk_relation_set_get_type = c_atk_relation_set_get_type;

/** */
alias atk_relation_set_new = c_atk_relation_set_new;

/** */
alias atk_relation_set_add = c_atk_relation_set_add;

/** */
alias atk_relation_set_add_relation_by_type = c_atk_relation_set_add_relation_by_type;

/** */
alias atk_relation_set_contains = c_atk_relation_set_contains;

/** */
alias atk_relation_set_contains_target = c_atk_relation_set_contains_target;

/** */
alias atk_relation_set_get_n_relations = c_atk_relation_set_get_n_relations;

/** */
alias atk_relation_set_get_relation = c_atk_relation_set_get_relation;

/** */
alias atk_relation_set_get_relation_by_type = c_atk_relation_set_get_relation_by_type;

/** */
alias atk_relation_set_remove = c_atk_relation_set_remove;

// Selection

/** */
alias atk_selection_get_type = c_atk_selection_get_type;

/** */
alias atk_selection_add_selection = c_atk_selection_add_selection;

/** */
alias atk_selection_clear_selection = c_atk_selection_clear_selection;

/** */
alias atk_selection_get_selection_count = c_atk_selection_get_selection_count;

/** */
alias atk_selection_is_child_selected = c_atk_selection_is_child_selected;

/** */
alias atk_selection_ref_selection = c_atk_selection_ref_selection;

/** */
alias atk_selection_remove_selection = c_atk_selection_remove_selection;

/** */
alias atk_selection_select_all_selection = c_atk_selection_select_all_selection;

// Socket

/** */
alias atk_socket_get_type = c_atk_socket_get_type;

/** */
alias atk_socket_new = c_atk_socket_new;

/** */
alias atk_socket_embed = c_atk_socket_embed;

/** */
alias atk_socket_is_occupied = c_atk_socket_is_occupied;

// StateSet

/** */
alias atk_state_set_get_type = c_atk_state_set_get_type;

/** */
alias atk_state_set_new = c_atk_state_set_new;

/** */
alias atk_state_set_add_state = c_atk_state_set_add_state;

/** */
alias atk_state_set_add_states = c_atk_state_set_add_states;

/** */
alias atk_state_set_and_sets = c_atk_state_set_and_sets;

/** */
alias atk_state_set_clear_states = c_atk_state_set_clear_states;

/** */
alias atk_state_set_contains_state = c_atk_state_set_contains_state;

/** */
alias atk_state_set_contains_states = c_atk_state_set_contains_states;

/** */
alias atk_state_set_is_empty = c_atk_state_set_is_empty;

/** */
alias atk_state_set_or_sets = c_atk_state_set_or_sets;

/** */
alias atk_state_set_remove_state = c_atk_state_set_remove_state;

/** */
alias atk_state_set_xor_sets = c_atk_state_set_xor_sets;

// StreamableContent

/** */
alias atk_streamable_content_get_type = c_atk_streamable_content_get_type;

/** */
alias atk_streamable_content_get_mime_type = c_atk_streamable_content_get_mime_type;

/** */
alias atk_streamable_content_get_n_mime_types = c_atk_streamable_content_get_n_mime_types;

/** */
alias atk_streamable_content_get_stream = c_atk_streamable_content_get_stream;

/** */
alias atk_streamable_content_get_uri = c_atk_streamable_content_get_uri;

// Table

/** */
alias atk_table_get_type = c_atk_table_get_type;

/** */
alias atk_table_add_column_selection = c_atk_table_add_column_selection;

/** */
alias atk_table_add_row_selection = c_atk_table_add_row_selection;

/** */
alias atk_table_get_caption = c_atk_table_get_caption;

/** */
alias atk_table_get_column_at_index = c_atk_table_get_column_at_index;

/** */
alias atk_table_get_column_description = c_atk_table_get_column_description;

/** */
alias atk_table_get_column_extent_at = c_atk_table_get_column_extent_at;

/** */
alias atk_table_get_column_header = c_atk_table_get_column_header;

/** */
alias atk_table_get_index_at = c_atk_table_get_index_at;

/** */
alias atk_table_get_n_columns = c_atk_table_get_n_columns;

/** */
alias atk_table_get_n_rows = c_atk_table_get_n_rows;

/** */
alias atk_table_get_row_at_index = c_atk_table_get_row_at_index;

/** */
alias atk_table_get_row_description = c_atk_table_get_row_description;

/** */
alias atk_table_get_row_extent_at = c_atk_table_get_row_extent_at;

/** */
alias atk_table_get_row_header = c_atk_table_get_row_header;

/** */
alias atk_table_get_selected_columns = c_atk_table_get_selected_columns;

/** */
alias atk_table_get_selected_rows = c_atk_table_get_selected_rows;

/** */
alias atk_table_get_summary = c_atk_table_get_summary;

/** */
alias atk_table_is_column_selected = c_atk_table_is_column_selected;

/** */
alias atk_table_is_row_selected = c_atk_table_is_row_selected;

/** */
alias atk_table_is_selected = c_atk_table_is_selected;

/** */
alias atk_table_ref_at = c_atk_table_ref_at;

/** */
alias atk_table_remove_column_selection = c_atk_table_remove_column_selection;

/** */
alias atk_table_remove_row_selection = c_atk_table_remove_row_selection;

/** */
alias atk_table_set_caption = c_atk_table_set_caption;

/** */
alias atk_table_set_column_description = c_atk_table_set_column_description;

/** */
alias atk_table_set_column_header = c_atk_table_set_column_header;

/** */
alias atk_table_set_row_description = c_atk_table_set_row_description;

/** */
alias atk_table_set_row_header = c_atk_table_set_row_header;

/** */
alias atk_table_set_summary = c_atk_table_set_summary;

// TableCell

/** */
alias atk_table_cell_get_type = c_atk_table_cell_get_type;

/** */
alias atk_table_cell_get_column_header_cells = c_atk_table_cell_get_column_header_cells;

/** */
alias atk_table_cell_get_column_span = c_atk_table_cell_get_column_span;

/** */
alias atk_table_cell_get_position = c_atk_table_cell_get_position;

/** */
alias atk_table_cell_get_row_column_span = c_atk_table_cell_get_row_column_span;

/** */
alias atk_table_cell_get_row_header_cells = c_atk_table_cell_get_row_header_cells;

/** */
alias atk_table_cell_get_row_span = c_atk_table_cell_get_row_span;

/** */
alias atk_table_cell_get_table = c_atk_table_cell_get_table;

// Text

/** */
alias atk_text_get_type = c_atk_text_get_type;

/** */
alias atk_text_free_ranges = c_atk_text_free_ranges;

/** */
alias atk_text_add_selection = c_atk_text_add_selection;

/** */
alias atk_text_get_bounded_ranges = c_atk_text_get_bounded_ranges;

/** */
alias atk_text_get_caret_offset = c_atk_text_get_caret_offset;

/** */
alias atk_text_get_character_at_offset = c_atk_text_get_character_at_offset;

/** */
alias atk_text_get_character_count = c_atk_text_get_character_count;

/** */
alias atk_text_get_character_extents = c_atk_text_get_character_extents;

/** */
alias atk_text_get_default_attributes = c_atk_text_get_default_attributes;

/** */
alias atk_text_get_n_selections = c_atk_text_get_n_selections;

/** */
alias atk_text_get_offset_at_point = c_atk_text_get_offset_at_point;

/** */
alias atk_text_get_range_extents = c_atk_text_get_range_extents;

/** */
alias atk_text_get_run_attributes = c_atk_text_get_run_attributes;

/** */
alias atk_text_get_selection = c_atk_text_get_selection;

/** */
alias atk_text_get_string_at_offset = c_atk_text_get_string_at_offset;

/** */
alias atk_text_get_text = c_atk_text_get_text;

/** */
alias atk_text_get_text_after_offset = c_atk_text_get_text_after_offset;

/** */
alias atk_text_get_text_at_offset = c_atk_text_get_text_at_offset;

/** */
alias atk_text_get_text_before_offset = c_atk_text_get_text_before_offset;

/** */
alias atk_text_remove_selection = c_atk_text_remove_selection;

/** */
alias atk_text_scroll_substring_to = c_atk_text_scroll_substring_to;

/** */
alias atk_text_scroll_substring_to_point = c_atk_text_scroll_substring_to_point;

/** */
alias atk_text_set_caret_offset = c_atk_text_set_caret_offset;

/** */
alias atk_text_set_selection = c_atk_text_set_selection;

// TextRange

/** */
alias atk_text_range_get_type = c_atk_text_range_get_type;

// Util

/** */
alias atk_util_get_type = c_atk_util_get_type;

// Value

/** */
alias atk_value_get_type = c_atk_value_get_type;

/** */
alias atk_value_get_current_value = c_atk_value_get_current_value;

/** */
alias atk_value_get_increment = c_atk_value_get_increment;

/** */
alias atk_value_get_maximum_value = c_atk_value_get_maximum_value;

/** */
alias atk_value_get_minimum_increment = c_atk_value_get_minimum_increment;

/** */
alias atk_value_get_minimum_value = c_atk_value_get_minimum_value;

/** */
alias atk_value_get_range = c_atk_value_get_range;

/** */
alias atk_value_get_sub_ranges = c_atk_value_get_sub_ranges;

/** */
alias atk_value_get_value_and_text = c_atk_value_get_value_and_text;

/** */
alias atk_value_set_current_value = c_atk_value_set_current_value;

/** */
alias atk_value_set_value = c_atk_value_set_value;

// Window

/** */
alias atk_window_get_type = c_atk_window_get_type;

// global

/** */
alias atk_add_focus_tracker = c_atk_add_focus_tracker;

/** */
alias atk_add_global_event_listener = c_atk_add_global_event_listener;

/** */
alias atk_add_key_event_listener = c_atk_add_key_event_listener;

/** */
alias atk_focus_tracker_init = c_atk_focus_tracker_init;

/** */
alias atk_focus_tracker_notify = c_atk_focus_tracker_notify;

/** */
alias atk_get_binary_age = c_atk_get_binary_age;

/** */
alias atk_get_default_registry = c_atk_get_default_registry;

/** */
alias atk_get_focus_object = c_atk_get_focus_object;

/** */
alias atk_get_interface_age = c_atk_get_interface_age;

/** */
alias atk_get_major_version = c_atk_get_major_version;

/** */
alias atk_get_micro_version = c_atk_get_micro_version;

/** */
alias atk_get_minor_version = c_atk_get_minor_version;

/** */
alias atk_get_root = c_atk_get_root;

/** */
alias atk_get_toolkit_name = c_atk_get_toolkit_name;

/** */
alias atk_get_toolkit_version = c_atk_get_toolkit_version;

/** */
alias atk_get_version = c_atk_get_version;

/** */
alias atk_remove_focus_tracker = c_atk_remove_focus_tracker;

/** */
alias atk_remove_global_event_listener = c_atk_remove_global_event_listener;

/** */
alias atk_remove_key_event_listener = c_atk_remove_key_event_listener;

// RelationType

/** */
alias atk_relation_type_for_name = c_atk_relation_type_for_name;

/** */
alias atk_relation_type_get_name = c_atk_relation_type_get_name;

/** */
alias atk_relation_type_register = c_atk_relation_type_register;

// Role

/** */
alias atk_role_for_name = c_atk_role_for_name;

/** */
alias atk_role_get_localized_name = c_atk_role_get_localized_name;

/** */
alias atk_role_get_name = c_atk_role_get_name;

/** */
alias atk_role_register = c_atk_role_register;

// StateType

/** */
alias atk_state_type_for_name = c_atk_state_type_for_name;

/** */
alias atk_state_type_get_name = c_atk_state_type_get_name;

/** */
alias atk_state_type_register = c_atk_state_type_register;

// TextAttribute

/** */
alias atk_text_attribute_for_name = c_atk_text_attribute_for_name;

/** */
alias atk_text_attribute_get_name = c_atk_text_attribute_get_name;

/** */
alias atk_text_attribute_get_value = c_atk_text_attribute_get_value;

/** */
alias atk_text_attribute_register = c_atk_text_attribute_register;

// ValueType

/** */
alias atk_value_type_get_localized_name = c_atk_value_type_get_localized_name;

/** */
alias atk_value_type_get_name = c_atk_value_type_get_name;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // Action
  gidLink(cast(void**)&atk_action_get_type, "atk_action_get_type", libs);
  gidLink(cast(void**)&atk_action_do_action, "atk_action_do_action", libs);
  gidLink(cast(void**)&atk_action_get_description, "atk_action_get_description", libs);
  gidLink(cast(void**)&atk_action_get_keybinding, "atk_action_get_keybinding", libs);
  gidLink(cast(void**)&atk_action_get_localized_name, "atk_action_get_localized_name", libs);
  gidLink(cast(void**)&atk_action_get_n_actions, "atk_action_get_n_actions", libs);
  gidLink(cast(void**)&atk_action_get_name, "atk_action_get_name", libs);
  gidLink(cast(void**)&atk_action_set_description, "atk_action_set_description", libs);

  // Attribute
  gidLink(cast(void**)&atk_attribute_set_free, "atk_attribute_set_free", libs);

  // Component
  gidLink(cast(void**)&atk_component_get_type, "atk_component_get_type", libs);
  gidLink(cast(void**)&atk_component_add_focus_handler, "atk_component_add_focus_handler", libs);
  gidLink(cast(void**)&atk_component_contains, "atk_component_contains", libs);
  gidLink(cast(void**)&atk_component_get_alpha, "atk_component_get_alpha", libs);
  gidLink(cast(void**)&atk_component_get_extents, "atk_component_get_extents", libs);
  gidLink(cast(void**)&atk_component_get_layer, "atk_component_get_layer", libs);
  gidLink(cast(void**)&atk_component_get_mdi_zorder, "atk_component_get_mdi_zorder", libs);
  gidLink(cast(void**)&atk_component_get_position, "atk_component_get_position", libs);
  gidLink(cast(void**)&atk_component_get_size, "atk_component_get_size", libs);
  gidLink(cast(void**)&atk_component_grab_focus, "atk_component_grab_focus", libs);
  gidLink(cast(void**)&atk_component_ref_accessible_at_point, "atk_component_ref_accessible_at_point", libs);
  gidLink(cast(void**)&atk_component_remove_focus_handler, "atk_component_remove_focus_handler", libs);
  gidLink(cast(void**)&atk_component_scroll_to, "atk_component_scroll_to", libs);
  gidLink(cast(void**)&atk_component_scroll_to_point, "atk_component_scroll_to_point", libs);
  gidLink(cast(void**)&atk_component_set_extents, "atk_component_set_extents", libs);
  gidLink(cast(void**)&atk_component_set_position, "atk_component_set_position", libs);
  gidLink(cast(void**)&atk_component_set_size, "atk_component_set_size", libs);

  // Document
  gidLink(cast(void**)&atk_document_get_type, "atk_document_get_type", libs);
  gidLink(cast(void**)&atk_document_get_attribute_value, "atk_document_get_attribute_value", libs);
  gidLink(cast(void**)&atk_document_get_attributes, "atk_document_get_attributes", libs);
  gidLink(cast(void**)&atk_document_get_current_page_number, "atk_document_get_current_page_number", libs);
  gidLink(cast(void**)&atk_document_get_document, "atk_document_get_document", libs);
  gidLink(cast(void**)&atk_document_get_document_type, "atk_document_get_document_type", libs);
  gidLink(cast(void**)&atk_document_get_locale, "atk_document_get_locale", libs);
  gidLink(cast(void**)&atk_document_get_page_count, "atk_document_get_page_count", libs);
  gidLink(cast(void**)&atk_document_get_text_selections, "atk_document_get_text_selections", libs);
  gidLink(cast(void**)&atk_document_set_attribute_value, "atk_document_set_attribute_value", libs);
  gidLink(cast(void**)&atk_document_set_text_selections, "atk_document_set_text_selections", libs);

  // EditableText
  gidLink(cast(void**)&atk_editable_text_get_type, "atk_editable_text_get_type", libs);
  gidLink(cast(void**)&atk_editable_text_copy_text, "atk_editable_text_copy_text", libs);
  gidLink(cast(void**)&atk_editable_text_cut_text, "atk_editable_text_cut_text", libs);
  gidLink(cast(void**)&atk_editable_text_delete_text, "atk_editable_text_delete_text", libs);
  gidLink(cast(void**)&atk_editable_text_insert_text, "atk_editable_text_insert_text", libs);
  gidLink(cast(void**)&atk_editable_text_paste_text, "atk_editable_text_paste_text", libs);
  gidLink(cast(void**)&atk_editable_text_set_run_attributes, "atk_editable_text_set_run_attributes", libs);
  gidLink(cast(void**)&atk_editable_text_set_text_contents, "atk_editable_text_set_text_contents", libs);

  // GObjectAccessible
  gidLink(cast(void**)&atk_gobject_accessible_get_type, "atk_gobject_accessible_get_type", libs);
  gidLink(cast(void**)&atk_gobject_accessible_for_object, "atk_gobject_accessible_for_object", libs);
  gidLink(cast(void**)&atk_gobject_accessible_get_object, "atk_gobject_accessible_get_object", libs);

  // Hyperlink
  gidLink(cast(void**)&atk_hyperlink_get_type, "atk_hyperlink_get_type", libs);
  gidLink(cast(void**)&atk_hyperlink_get_end_index, "atk_hyperlink_get_end_index", libs);
  gidLink(cast(void**)&atk_hyperlink_get_n_anchors, "atk_hyperlink_get_n_anchors", libs);
  gidLink(cast(void**)&atk_hyperlink_get_object, "atk_hyperlink_get_object", libs);
  gidLink(cast(void**)&atk_hyperlink_get_start_index, "atk_hyperlink_get_start_index", libs);
  gidLink(cast(void**)&atk_hyperlink_get_uri, "atk_hyperlink_get_uri", libs);
  gidLink(cast(void**)&atk_hyperlink_is_inline, "atk_hyperlink_is_inline", libs);
  gidLink(cast(void**)&atk_hyperlink_is_selected_link, "atk_hyperlink_is_selected_link", libs);
  gidLink(cast(void**)&atk_hyperlink_is_valid, "atk_hyperlink_is_valid", libs);

  // HyperlinkImpl
  gidLink(cast(void**)&atk_hyperlink_impl_get_type, "atk_hyperlink_impl_get_type", libs);
  gidLink(cast(void**)&atk_hyperlink_impl_get_hyperlink, "atk_hyperlink_impl_get_hyperlink", libs);

  // Hypertext
  gidLink(cast(void**)&atk_hypertext_get_type, "atk_hypertext_get_type", libs);
  gidLink(cast(void**)&atk_hypertext_get_link, "atk_hypertext_get_link", libs);
  gidLink(cast(void**)&atk_hypertext_get_link_index, "atk_hypertext_get_link_index", libs);
  gidLink(cast(void**)&atk_hypertext_get_n_links, "atk_hypertext_get_n_links", libs);

  // Image
  gidLink(cast(void**)&atk_image_get_type, "atk_image_get_type", libs);
  gidLink(cast(void**)&atk_image_get_image_description, "atk_image_get_image_description", libs);
  gidLink(cast(void**)&atk_image_get_image_locale, "atk_image_get_image_locale", libs);
  gidLink(cast(void**)&atk_image_get_image_position, "atk_image_get_image_position", libs);
  gidLink(cast(void**)&atk_image_get_image_size, "atk_image_get_image_size", libs);
  gidLink(cast(void**)&atk_image_set_image_description, "atk_image_set_image_description", libs);

  // Implementor
  gidLink(cast(void**)&atk_implementor_ref_accessible, "atk_implementor_ref_accessible", libs);

  // ImplementorIface
  gidLink(cast(void**)&atk_implementor_get_type, "atk_implementor_get_type", libs);

  // Misc
  gidLink(cast(void**)&atk_misc_get_type, "atk_misc_get_type", libs);
  gidLink(cast(void**)&atk_misc_get_instance, "atk_misc_get_instance", libs);
  gidLink(cast(void**)&atk_misc_threads_enter, "atk_misc_threads_enter", libs);
  gidLink(cast(void**)&atk_misc_threads_leave, "atk_misc_threads_leave", libs);

  // NoOpObject
  gidLink(cast(void**)&atk_no_op_object_get_type, "atk_no_op_object_get_type", libs);
  gidLink(cast(void**)&atk_no_op_object_new, "atk_no_op_object_new", libs);

  // NoOpObjectFactory
  gidLink(cast(void**)&atk_no_op_object_factory_get_type, "atk_no_op_object_factory_get_type", libs);
  gidLink(cast(void**)&atk_no_op_object_factory_new, "atk_no_op_object_factory_new", libs);

  // ObjectFactory
  gidLink(cast(void**)&atk_object_factory_get_type, "atk_object_factory_get_type", libs);
  gidLink(cast(void**)&atk_object_factory_create_accessible, "atk_object_factory_create_accessible", libs);
  gidLink(cast(void**)&atk_object_factory_get_accessible_type, "atk_object_factory_get_accessible_type", libs);
  gidLink(cast(void**)&atk_object_factory_invalidate, "atk_object_factory_invalidate", libs);

  // ObjectWrap
  gidLink(cast(void**)&atk_object_get_type, "atk_object_get_type", libs);
  gidLink(cast(void**)&atk_object_add_relationship, "atk_object_add_relationship", libs);
  gidLink(cast(void**)&atk_object_connect_property_change_handler, "atk_object_connect_property_change_handler", libs);
  gidLink(cast(void**)&atk_object_get_accessible_id, "atk_object_get_accessible_id", libs);
  gidLink(cast(void**)&atk_object_get_attributes, "atk_object_get_attributes", libs);
  gidLink(cast(void**)&atk_object_get_description, "atk_object_get_description", libs);
  gidLink(cast(void**)&atk_object_get_help_text, "atk_object_get_help_text", libs);
  gidLink(cast(void**)&atk_object_get_index_in_parent, "atk_object_get_index_in_parent", libs);
  gidLink(cast(void**)&atk_object_get_layer, "atk_object_get_layer", libs);
  gidLink(cast(void**)&atk_object_get_mdi_zorder, "atk_object_get_mdi_zorder", libs);
  gidLink(cast(void**)&atk_object_get_n_accessible_children, "atk_object_get_n_accessible_children", libs);
  gidLink(cast(void**)&atk_object_get_name, "atk_object_get_name", libs);
  gidLink(cast(void**)&atk_object_get_object_locale, "atk_object_get_object_locale", libs);
  gidLink(cast(void**)&atk_object_get_parent, "atk_object_get_parent", libs);
  gidLink(cast(void**)&atk_object_get_role, "atk_object_get_role", libs);
  gidLink(cast(void**)&atk_object_initialize, "atk_object_initialize", libs);
  gidLink(cast(void**)&atk_object_notify_state_change, "atk_object_notify_state_change", libs);
  gidLink(cast(void**)&atk_object_peek_parent, "atk_object_peek_parent", libs);
  gidLink(cast(void**)&atk_object_ref_accessible_child, "atk_object_ref_accessible_child", libs);
  gidLink(cast(void**)&atk_object_ref_relation_set, "atk_object_ref_relation_set", libs);
  gidLink(cast(void**)&atk_object_ref_state_set, "atk_object_ref_state_set", libs);
  gidLink(cast(void**)&atk_object_remove_property_change_handler, "atk_object_remove_property_change_handler", libs);
  gidLink(cast(void**)&atk_object_remove_relationship, "atk_object_remove_relationship", libs);
  gidLink(cast(void**)&atk_object_set_accessible_id, "atk_object_set_accessible_id", libs);
  gidLink(cast(void**)&atk_object_set_description, "atk_object_set_description", libs);
  gidLink(cast(void**)&atk_object_set_help_text, "atk_object_set_help_text", libs);
  gidLink(cast(void**)&atk_object_set_name, "atk_object_set_name", libs);
  gidLink(cast(void**)&atk_object_set_parent, "atk_object_set_parent", libs);
  gidLink(cast(void**)&atk_object_set_role, "atk_object_set_role", libs);

  // Plug
  gidLink(cast(void**)&atk_plug_get_type, "atk_plug_get_type", libs);
  gidLink(cast(void**)&atk_plug_new, "atk_plug_new", libs);
  gidLink(cast(void**)&atk_plug_get_id, "atk_plug_get_id", libs);
  gidLink(cast(void**)&atk_plug_set_child, "atk_plug_set_child", libs);

  // Range
  gidLink(cast(void**)&atk_range_get_type, "atk_range_get_type", libs);
  gidLink(cast(void**)&atk_range_new, "atk_range_new", libs);
  gidLink(cast(void**)&atk_range_copy, "atk_range_copy", libs);
  gidLink(cast(void**)&atk_range_free, "atk_range_free", libs);
  gidLink(cast(void**)&atk_range_get_description, "atk_range_get_description", libs);
  gidLink(cast(void**)&atk_range_get_lower_limit, "atk_range_get_lower_limit", libs);
  gidLink(cast(void**)&atk_range_get_upper_limit, "atk_range_get_upper_limit", libs);

  // Rectangle
  gidLink(cast(void**)&atk_rectangle_get_type, "atk_rectangle_get_type", libs);

  // Registry
  gidLink(cast(void**)&atk_registry_get_type, "atk_registry_get_type", libs);
  gidLink(cast(void**)&atk_registry_get_factory, "atk_registry_get_factory", libs);
  gidLink(cast(void**)&atk_registry_get_factory_type, "atk_registry_get_factory_type", libs);
  gidLink(cast(void**)&atk_registry_set_factory_type, "atk_registry_set_factory_type", libs);

  // Relation
  gidLink(cast(void**)&atk_relation_get_type, "atk_relation_get_type", libs);
  gidLink(cast(void**)&atk_relation_new, "atk_relation_new", libs);
  gidLink(cast(void**)&atk_relation_add_target, "atk_relation_add_target", libs);
  gidLink(cast(void**)&atk_relation_get_relation_type, "atk_relation_get_relation_type", libs);
  gidLink(cast(void**)&atk_relation_get_target, "atk_relation_get_target", libs);
  gidLink(cast(void**)&atk_relation_remove_target, "atk_relation_remove_target", libs);

  // RelationSet
  gidLink(cast(void**)&atk_relation_set_get_type, "atk_relation_set_get_type", libs);
  gidLink(cast(void**)&atk_relation_set_new, "atk_relation_set_new", libs);
  gidLink(cast(void**)&atk_relation_set_add, "atk_relation_set_add", libs);
  gidLink(cast(void**)&atk_relation_set_add_relation_by_type, "atk_relation_set_add_relation_by_type", libs);
  gidLink(cast(void**)&atk_relation_set_contains, "atk_relation_set_contains", libs);
  gidLink(cast(void**)&atk_relation_set_contains_target, "atk_relation_set_contains_target", libs);
  gidLink(cast(void**)&atk_relation_set_get_n_relations, "atk_relation_set_get_n_relations", libs);
  gidLink(cast(void**)&atk_relation_set_get_relation, "atk_relation_set_get_relation", libs);
  gidLink(cast(void**)&atk_relation_set_get_relation_by_type, "atk_relation_set_get_relation_by_type", libs);
  gidLink(cast(void**)&atk_relation_set_remove, "atk_relation_set_remove", libs);

  // Selection
  gidLink(cast(void**)&atk_selection_get_type, "atk_selection_get_type", libs);
  gidLink(cast(void**)&atk_selection_add_selection, "atk_selection_add_selection", libs);
  gidLink(cast(void**)&atk_selection_clear_selection, "atk_selection_clear_selection", libs);
  gidLink(cast(void**)&atk_selection_get_selection_count, "atk_selection_get_selection_count", libs);
  gidLink(cast(void**)&atk_selection_is_child_selected, "atk_selection_is_child_selected", libs);
  gidLink(cast(void**)&atk_selection_ref_selection, "atk_selection_ref_selection", libs);
  gidLink(cast(void**)&atk_selection_remove_selection, "atk_selection_remove_selection", libs);
  gidLink(cast(void**)&atk_selection_select_all_selection, "atk_selection_select_all_selection", libs);

  // Socket
  gidLink(cast(void**)&atk_socket_get_type, "atk_socket_get_type", libs);
  gidLink(cast(void**)&atk_socket_new, "atk_socket_new", libs);
  gidLink(cast(void**)&atk_socket_embed, "atk_socket_embed", libs);
  gidLink(cast(void**)&atk_socket_is_occupied, "atk_socket_is_occupied", libs);

  // StateSet
  gidLink(cast(void**)&atk_state_set_get_type, "atk_state_set_get_type", libs);
  gidLink(cast(void**)&atk_state_set_new, "atk_state_set_new", libs);
  gidLink(cast(void**)&atk_state_set_add_state, "atk_state_set_add_state", libs);
  gidLink(cast(void**)&atk_state_set_add_states, "atk_state_set_add_states", libs);
  gidLink(cast(void**)&atk_state_set_and_sets, "atk_state_set_and_sets", libs);
  gidLink(cast(void**)&atk_state_set_clear_states, "atk_state_set_clear_states", libs);
  gidLink(cast(void**)&atk_state_set_contains_state, "atk_state_set_contains_state", libs);
  gidLink(cast(void**)&atk_state_set_contains_states, "atk_state_set_contains_states", libs);
  gidLink(cast(void**)&atk_state_set_is_empty, "atk_state_set_is_empty", libs);
  gidLink(cast(void**)&atk_state_set_or_sets, "atk_state_set_or_sets", libs);
  gidLink(cast(void**)&atk_state_set_remove_state, "atk_state_set_remove_state", libs);
  gidLink(cast(void**)&atk_state_set_xor_sets, "atk_state_set_xor_sets", libs);

  // StreamableContent
  gidLink(cast(void**)&atk_streamable_content_get_type, "atk_streamable_content_get_type", libs);
  gidLink(cast(void**)&atk_streamable_content_get_mime_type, "atk_streamable_content_get_mime_type", libs);
  gidLink(cast(void**)&atk_streamable_content_get_n_mime_types, "atk_streamable_content_get_n_mime_types", libs);
  gidLink(cast(void**)&atk_streamable_content_get_stream, "atk_streamable_content_get_stream", libs);
  gidLink(cast(void**)&atk_streamable_content_get_uri, "atk_streamable_content_get_uri", libs);

  // Table
  gidLink(cast(void**)&atk_table_get_type, "atk_table_get_type", libs);
  gidLink(cast(void**)&atk_table_add_column_selection, "atk_table_add_column_selection", libs);
  gidLink(cast(void**)&atk_table_add_row_selection, "atk_table_add_row_selection", libs);
  gidLink(cast(void**)&atk_table_get_caption, "atk_table_get_caption", libs);
  gidLink(cast(void**)&atk_table_get_column_at_index, "atk_table_get_column_at_index", libs);
  gidLink(cast(void**)&atk_table_get_column_description, "atk_table_get_column_description", libs);
  gidLink(cast(void**)&atk_table_get_column_extent_at, "atk_table_get_column_extent_at", libs);
  gidLink(cast(void**)&atk_table_get_column_header, "atk_table_get_column_header", libs);
  gidLink(cast(void**)&atk_table_get_index_at, "atk_table_get_index_at", libs);
  gidLink(cast(void**)&atk_table_get_n_columns, "atk_table_get_n_columns", libs);
  gidLink(cast(void**)&atk_table_get_n_rows, "atk_table_get_n_rows", libs);
  gidLink(cast(void**)&atk_table_get_row_at_index, "atk_table_get_row_at_index", libs);
  gidLink(cast(void**)&atk_table_get_row_description, "atk_table_get_row_description", libs);
  gidLink(cast(void**)&atk_table_get_row_extent_at, "atk_table_get_row_extent_at", libs);
  gidLink(cast(void**)&atk_table_get_row_header, "atk_table_get_row_header", libs);
  gidLink(cast(void**)&atk_table_get_selected_columns, "atk_table_get_selected_columns", libs);
  gidLink(cast(void**)&atk_table_get_selected_rows, "atk_table_get_selected_rows", libs);
  gidLink(cast(void**)&atk_table_get_summary, "atk_table_get_summary", libs);
  gidLink(cast(void**)&atk_table_is_column_selected, "atk_table_is_column_selected", libs);
  gidLink(cast(void**)&atk_table_is_row_selected, "atk_table_is_row_selected", libs);
  gidLink(cast(void**)&atk_table_is_selected, "atk_table_is_selected", libs);
  gidLink(cast(void**)&atk_table_ref_at, "atk_table_ref_at", libs);
  gidLink(cast(void**)&atk_table_remove_column_selection, "atk_table_remove_column_selection", libs);
  gidLink(cast(void**)&atk_table_remove_row_selection, "atk_table_remove_row_selection", libs);
  gidLink(cast(void**)&atk_table_set_caption, "atk_table_set_caption", libs);
  gidLink(cast(void**)&atk_table_set_column_description, "atk_table_set_column_description", libs);
  gidLink(cast(void**)&atk_table_set_column_header, "atk_table_set_column_header", libs);
  gidLink(cast(void**)&atk_table_set_row_description, "atk_table_set_row_description", libs);
  gidLink(cast(void**)&atk_table_set_row_header, "atk_table_set_row_header", libs);
  gidLink(cast(void**)&atk_table_set_summary, "atk_table_set_summary", libs);

  // TableCell
  gidLink(cast(void**)&atk_table_cell_get_type, "atk_table_cell_get_type", libs);
  gidLink(cast(void**)&atk_table_cell_get_column_header_cells, "atk_table_cell_get_column_header_cells", libs);
  gidLink(cast(void**)&atk_table_cell_get_column_span, "atk_table_cell_get_column_span", libs);
  gidLink(cast(void**)&atk_table_cell_get_position, "atk_table_cell_get_position", libs);
  gidLink(cast(void**)&atk_table_cell_get_row_column_span, "atk_table_cell_get_row_column_span", libs);
  gidLink(cast(void**)&atk_table_cell_get_row_header_cells, "atk_table_cell_get_row_header_cells", libs);
  gidLink(cast(void**)&atk_table_cell_get_row_span, "atk_table_cell_get_row_span", libs);
  gidLink(cast(void**)&atk_table_cell_get_table, "atk_table_cell_get_table", libs);

  // Text
  gidLink(cast(void**)&atk_text_get_type, "atk_text_get_type", libs);
  gidLink(cast(void**)&atk_text_free_ranges, "atk_text_free_ranges", libs);
  gidLink(cast(void**)&atk_text_add_selection, "atk_text_add_selection", libs);
  gidLink(cast(void**)&atk_text_get_bounded_ranges, "atk_text_get_bounded_ranges", libs);
  gidLink(cast(void**)&atk_text_get_caret_offset, "atk_text_get_caret_offset", libs);
  gidLink(cast(void**)&atk_text_get_character_at_offset, "atk_text_get_character_at_offset", libs);
  gidLink(cast(void**)&atk_text_get_character_count, "atk_text_get_character_count", libs);
  gidLink(cast(void**)&atk_text_get_character_extents, "atk_text_get_character_extents", libs);
  gidLink(cast(void**)&atk_text_get_default_attributes, "atk_text_get_default_attributes", libs);
  gidLink(cast(void**)&atk_text_get_n_selections, "atk_text_get_n_selections", libs);
  gidLink(cast(void**)&atk_text_get_offset_at_point, "atk_text_get_offset_at_point", libs);
  gidLink(cast(void**)&atk_text_get_range_extents, "atk_text_get_range_extents", libs);
  gidLink(cast(void**)&atk_text_get_run_attributes, "atk_text_get_run_attributes", libs);
  gidLink(cast(void**)&atk_text_get_selection, "atk_text_get_selection", libs);
  gidLink(cast(void**)&atk_text_get_string_at_offset, "atk_text_get_string_at_offset", libs);
  gidLink(cast(void**)&atk_text_get_text, "atk_text_get_text", libs);
  gidLink(cast(void**)&atk_text_get_text_after_offset, "atk_text_get_text_after_offset", libs);
  gidLink(cast(void**)&atk_text_get_text_at_offset, "atk_text_get_text_at_offset", libs);
  gidLink(cast(void**)&atk_text_get_text_before_offset, "atk_text_get_text_before_offset", libs);
  gidLink(cast(void**)&atk_text_remove_selection, "atk_text_remove_selection", libs);
  gidLink(cast(void**)&atk_text_scroll_substring_to, "atk_text_scroll_substring_to", libs);
  gidLink(cast(void**)&atk_text_scroll_substring_to_point, "atk_text_scroll_substring_to_point", libs);
  gidLink(cast(void**)&atk_text_set_caret_offset, "atk_text_set_caret_offset", libs);
  gidLink(cast(void**)&atk_text_set_selection, "atk_text_set_selection", libs);

  // TextRange
  gidLink(cast(void**)&atk_text_range_get_type, "atk_text_range_get_type", libs);

  // Util
  gidLink(cast(void**)&atk_util_get_type, "atk_util_get_type", libs);

  // Value
  gidLink(cast(void**)&atk_value_get_type, "atk_value_get_type", libs);
  gidLink(cast(void**)&atk_value_get_current_value, "atk_value_get_current_value", libs);
  gidLink(cast(void**)&atk_value_get_increment, "atk_value_get_increment", libs);
  gidLink(cast(void**)&atk_value_get_maximum_value, "atk_value_get_maximum_value", libs);
  gidLink(cast(void**)&atk_value_get_minimum_increment, "atk_value_get_minimum_increment", libs);
  gidLink(cast(void**)&atk_value_get_minimum_value, "atk_value_get_minimum_value", libs);
  gidLink(cast(void**)&atk_value_get_range, "atk_value_get_range", libs);
  gidLink(cast(void**)&atk_value_get_sub_ranges, "atk_value_get_sub_ranges", libs);
  gidLink(cast(void**)&atk_value_get_value_and_text, "atk_value_get_value_and_text", libs);
  gidLink(cast(void**)&atk_value_set_current_value, "atk_value_set_current_value", libs);
  gidLink(cast(void**)&atk_value_set_value, "atk_value_set_value", libs);

  // Window
  gidLink(cast(void**)&atk_window_get_type, "atk_window_get_type", libs);

  // global
  gidLink(cast(void**)&atk_add_focus_tracker, "atk_add_focus_tracker", libs);
  gidLink(cast(void**)&atk_add_global_event_listener, "atk_add_global_event_listener", libs);
  gidLink(cast(void**)&atk_add_key_event_listener, "atk_add_key_event_listener", libs);
  gidLink(cast(void**)&atk_focus_tracker_init, "atk_focus_tracker_init", libs);
  gidLink(cast(void**)&atk_focus_tracker_notify, "atk_focus_tracker_notify", libs);
  gidLink(cast(void**)&atk_get_binary_age, "atk_get_binary_age", libs);
  gidLink(cast(void**)&atk_get_default_registry, "atk_get_default_registry", libs);
  gidLink(cast(void**)&atk_get_focus_object, "atk_get_focus_object", libs);
  gidLink(cast(void**)&atk_get_interface_age, "atk_get_interface_age", libs);
  gidLink(cast(void**)&atk_get_major_version, "atk_get_major_version", libs);
  gidLink(cast(void**)&atk_get_micro_version, "atk_get_micro_version", libs);
  gidLink(cast(void**)&atk_get_minor_version, "atk_get_minor_version", libs);
  gidLink(cast(void**)&atk_get_root, "atk_get_root", libs);
  gidLink(cast(void**)&atk_get_toolkit_name, "atk_get_toolkit_name", libs);
  gidLink(cast(void**)&atk_get_toolkit_version, "atk_get_toolkit_version", libs);
  gidLink(cast(void**)&atk_get_version, "atk_get_version", libs);
  gidLink(cast(void**)&atk_remove_focus_tracker, "atk_remove_focus_tracker", libs);
  gidLink(cast(void**)&atk_remove_global_event_listener, "atk_remove_global_event_listener", libs);
  gidLink(cast(void**)&atk_remove_key_event_listener, "atk_remove_key_event_listener", libs);

  // RelationType
  gidLink(cast(void**)&atk_relation_type_for_name, "atk_relation_type_for_name", libs);
  gidLink(cast(void**)&atk_relation_type_get_name, "atk_relation_type_get_name", libs);
  gidLink(cast(void**)&atk_relation_type_register, "atk_relation_type_register", libs);

  // Role
  gidLink(cast(void**)&atk_role_for_name, "atk_role_for_name", libs);
  gidLink(cast(void**)&atk_role_get_localized_name, "atk_role_get_localized_name", libs);
  gidLink(cast(void**)&atk_role_get_name, "atk_role_get_name", libs);
  gidLink(cast(void**)&atk_role_register, "atk_role_register", libs);

  // StateType
  gidLink(cast(void**)&atk_state_type_for_name, "atk_state_type_for_name", libs);
  gidLink(cast(void**)&atk_state_type_get_name, "atk_state_type_get_name", libs);
  gidLink(cast(void**)&atk_state_type_register, "atk_state_type_register", libs);

  // TextAttribute
  gidLink(cast(void**)&atk_text_attribute_for_name, "atk_text_attribute_for_name", libs);
  gidLink(cast(void**)&atk_text_attribute_get_name, "atk_text_attribute_get_name", libs);
  gidLink(cast(void**)&atk_text_attribute_get_value, "atk_text_attribute_get_value", libs);
  gidLink(cast(void**)&atk_text_attribute_register, "atk_text_attribute_register", libs);

  // ValueType
  gidLink(cast(void**)&atk_value_type_get_localized_name, "atk_value_type_get_localized_name", libs);
  gidLink(cast(void**)&atk_value_type_get_name, "atk_value_type_get_name", libs);
}
