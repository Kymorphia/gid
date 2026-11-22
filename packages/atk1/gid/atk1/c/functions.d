/// C functions for atk1 library
module gid.atk1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.atk1.c.types;
static import gid.atk1.c._gidlib_Atk;
public import gid.gobject2.c.types;

private immutable LIBS = ["atk-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.atk1.c._gidlib_Atk.gidLibLinked;

// Action
private alias c_atk_action_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_action_get_typeFn c_atk_action_get_type; ///
private alias c_atk_action_do_actionFn = extern(C) gboolean function(AtkAction* action, int i) nothrow;
__gshared c_atk_action_do_actionFn c_atk_action_do_action; ///
private alias c_atk_action_get_descriptionFn = extern(C) const(char)* function(AtkAction* action, int i) nothrow;
__gshared c_atk_action_get_descriptionFn c_atk_action_get_description; ///
private alias c_atk_action_get_keybindingFn = extern(C) const(char)* function(AtkAction* action, int i) nothrow;
__gshared c_atk_action_get_keybindingFn c_atk_action_get_keybinding; ///
private alias c_atk_action_get_localized_nameFn = extern(C) const(char)* function(AtkAction* action, int i) nothrow;
__gshared c_atk_action_get_localized_nameFn c_atk_action_get_localized_name; ///
private alias c_atk_action_get_n_actionsFn = extern(C) int function(AtkAction* action) nothrow;
__gshared c_atk_action_get_n_actionsFn c_atk_action_get_n_actions; ///
private alias c_atk_action_get_nameFn = extern(C) const(char)* function(AtkAction* action, int i) nothrow;
__gshared c_atk_action_get_nameFn c_atk_action_get_name; ///
private alias c_atk_action_set_descriptionFn = extern(C) gboolean function(AtkAction* action, int i, const(char)* desc) nothrow;
__gshared c_atk_action_set_descriptionFn c_atk_action_set_description; ///

// Attribute
private alias c_atk_attribute_set_freeFn = extern(C) void function(AtkAttributeSet* attribSet) nothrow;
__gshared c_atk_attribute_set_freeFn c_atk_attribute_set_free; ///

// Component
private alias c_atk_component_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_component_get_typeFn c_atk_component_get_type; ///
private alias c_atk_component_add_focus_handlerFn = extern(C) uint function(AtkComponent* component, AtkFocusHandler handler) nothrow;
__gshared c_atk_component_add_focus_handlerFn c_atk_component_add_focus_handler; ///
private alias c_atk_component_containsFn = extern(C) gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow;
__gshared c_atk_component_containsFn c_atk_component_contains; ///
private alias c_atk_component_get_alphaFn = extern(C) double function(AtkComponent* component) nothrow;
__gshared c_atk_component_get_alphaFn c_atk_component_get_alpha; ///
private alias c_atk_component_get_extentsFn = extern(C) void function(AtkComponent* component, int* x, int* y, int* width, int* height, AtkCoordType coordType) nothrow;
__gshared c_atk_component_get_extentsFn c_atk_component_get_extents; ///
private alias c_atk_component_get_layerFn = extern(C) AtkLayer function(AtkComponent* component) nothrow;
__gshared c_atk_component_get_layerFn c_atk_component_get_layer; ///
private alias c_atk_component_get_mdi_zorderFn = extern(C) int function(AtkComponent* component) nothrow;
__gshared c_atk_component_get_mdi_zorderFn c_atk_component_get_mdi_zorder; ///
private alias c_atk_component_get_positionFn = extern(C) void function(AtkComponent* component, int* x, int* y, AtkCoordType coordType) nothrow;
__gshared c_atk_component_get_positionFn c_atk_component_get_position; ///
private alias c_atk_component_get_sizeFn = extern(C) void function(AtkComponent* component, int* width, int* height) nothrow;
__gshared c_atk_component_get_sizeFn c_atk_component_get_size; ///
private alias c_atk_component_grab_focusFn = extern(C) gboolean function(AtkComponent* component) nothrow;
__gshared c_atk_component_grab_focusFn c_atk_component_grab_focus; ///
private alias c_atk_component_ref_accessible_at_pointFn = extern(C) AtkObject* function(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow;
__gshared c_atk_component_ref_accessible_at_pointFn c_atk_component_ref_accessible_at_point; ///
private alias c_atk_component_remove_focus_handlerFn = extern(C) void function(AtkComponent* component, uint handlerId) nothrow;
__gshared c_atk_component_remove_focus_handlerFn c_atk_component_remove_focus_handler; ///
private alias c_atk_component_scroll_toFn = extern(C) gboolean function(AtkComponent* component, AtkScrollType type) nothrow;
__gshared c_atk_component_scroll_toFn c_atk_component_scroll_to; ///
private alias c_atk_component_scroll_to_pointFn = extern(C) gboolean function(AtkComponent* component, AtkCoordType coords, int x, int y) nothrow;
__gshared c_atk_component_scroll_to_pointFn c_atk_component_scroll_to_point; ///
private alias c_atk_component_set_extentsFn = extern(C) gboolean function(AtkComponent* component, int x, int y, int width, int height, AtkCoordType coordType) nothrow;
__gshared c_atk_component_set_extentsFn c_atk_component_set_extents; ///
private alias c_atk_component_set_positionFn = extern(C) gboolean function(AtkComponent* component, int x, int y, AtkCoordType coordType) nothrow;
__gshared c_atk_component_set_positionFn c_atk_component_set_position; ///
private alias c_atk_component_set_sizeFn = extern(C) gboolean function(AtkComponent* component, int width, int height) nothrow;
__gshared c_atk_component_set_sizeFn c_atk_component_set_size; ///

// Document
private alias c_atk_document_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_document_get_typeFn c_atk_document_get_type; ///
private alias c_atk_document_get_attribute_valueFn = extern(C) const(char)* function(AtkDocument* document, const(char)* attributeName) nothrow;
__gshared c_atk_document_get_attribute_valueFn c_atk_document_get_attribute_value; ///
private alias c_atk_document_get_attributesFn = extern(C) AtkAttributeSet* function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_attributesFn c_atk_document_get_attributes; ///
private alias c_atk_document_get_current_page_numberFn = extern(C) int function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_current_page_numberFn c_atk_document_get_current_page_number; ///
private alias c_atk_document_get_documentFn = extern(C) void* function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_documentFn c_atk_document_get_document; ///
private alias c_atk_document_get_document_typeFn = extern(C) const(char)* function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_document_typeFn c_atk_document_get_document_type; ///
private alias c_atk_document_get_localeFn = extern(C) const(char)* function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_localeFn c_atk_document_get_locale; ///
private alias c_atk_document_get_page_countFn = extern(C) int function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_page_countFn c_atk_document_get_page_count; ///
private alias c_atk_document_get_text_selectionsFn = extern(C) GArray* function(AtkDocument* document) nothrow;
__gshared c_atk_document_get_text_selectionsFn c_atk_document_get_text_selections; ///
private alias c_atk_document_set_attribute_valueFn = extern(C) gboolean function(AtkDocument* document, const(char)* attributeName, const(char)* attributeValue) nothrow;
__gshared c_atk_document_set_attribute_valueFn c_atk_document_set_attribute_value; ///
private alias c_atk_document_set_text_selectionsFn = extern(C) gboolean function(AtkDocument* document, GArray* selections) nothrow;
__gshared c_atk_document_set_text_selectionsFn c_atk_document_set_text_selections; ///

// EditableText
private alias c_atk_editable_text_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_editable_text_get_typeFn c_atk_editable_text_get_type; ///
private alias c_atk_editable_text_copy_textFn = extern(C) void function(AtkEditableText* text, int startPos, int endPos) nothrow;
__gshared c_atk_editable_text_copy_textFn c_atk_editable_text_copy_text; ///
private alias c_atk_editable_text_cut_textFn = extern(C) void function(AtkEditableText* text, int startPos, int endPos) nothrow;
__gshared c_atk_editable_text_cut_textFn c_atk_editable_text_cut_text; ///
private alias c_atk_editable_text_delete_textFn = extern(C) void function(AtkEditableText* text, int startPos, int endPos) nothrow;
__gshared c_atk_editable_text_delete_textFn c_atk_editable_text_delete_text; ///
private alias c_atk_editable_text_insert_textFn = extern(C) void function(AtkEditableText* text, const(char)* string_, int length, int* position) nothrow;
__gshared c_atk_editable_text_insert_textFn c_atk_editable_text_insert_text; ///
private alias c_atk_editable_text_paste_textFn = extern(C) void function(AtkEditableText* text, int position) nothrow;
__gshared c_atk_editable_text_paste_textFn c_atk_editable_text_paste_text; ///
private alias c_atk_editable_text_set_run_attributesFn = extern(C) gboolean function(AtkEditableText* text, AtkAttributeSet* attribSet, int startOffset, int endOffset) nothrow;
__gshared c_atk_editable_text_set_run_attributesFn c_atk_editable_text_set_run_attributes; ///
private alias c_atk_editable_text_set_text_contentsFn = extern(C) void function(AtkEditableText* text, const(char)* string_) nothrow;
__gshared c_atk_editable_text_set_text_contentsFn c_atk_editable_text_set_text_contents; ///

// GObjectAccessible
private alias c_atk_gobject_accessible_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_gobject_accessible_get_typeFn c_atk_gobject_accessible_get_type; ///
private alias c_atk_gobject_accessible_for_objectFn = extern(C) AtkObject* function(GObject* obj) nothrow;
__gshared c_atk_gobject_accessible_for_objectFn c_atk_gobject_accessible_for_object; ///
private alias c_atk_gobject_accessible_get_objectFn = extern(C) GObject* function(AtkGObjectAccessible* obj) nothrow;
__gshared c_atk_gobject_accessible_get_objectFn c_atk_gobject_accessible_get_object; ///

// Hyperlink
private alias c_atk_hyperlink_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_hyperlink_get_typeFn c_atk_hyperlink_get_type; ///
private alias c_atk_hyperlink_get_end_indexFn = extern(C) int function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_get_end_indexFn c_atk_hyperlink_get_end_index; ///
private alias c_atk_hyperlink_get_n_anchorsFn = extern(C) int function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_get_n_anchorsFn c_atk_hyperlink_get_n_anchors; ///
private alias c_atk_hyperlink_get_objectFn = extern(C) AtkObject* function(AtkHyperlink* link, int i) nothrow;
__gshared c_atk_hyperlink_get_objectFn c_atk_hyperlink_get_object; ///
private alias c_atk_hyperlink_get_start_indexFn = extern(C) int function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_get_start_indexFn c_atk_hyperlink_get_start_index; ///
private alias c_atk_hyperlink_get_uriFn = extern(C) char* function(AtkHyperlink* link, int i) nothrow;
__gshared c_atk_hyperlink_get_uriFn c_atk_hyperlink_get_uri; ///
private alias c_atk_hyperlink_is_inlineFn = extern(C) gboolean function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_is_inlineFn c_atk_hyperlink_is_inline; ///
private alias c_atk_hyperlink_is_selected_linkFn = extern(C) gboolean function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_is_selected_linkFn c_atk_hyperlink_is_selected_link; ///
private alias c_atk_hyperlink_is_validFn = extern(C) gboolean function(AtkHyperlink* link) nothrow;
__gshared c_atk_hyperlink_is_validFn c_atk_hyperlink_is_valid; ///

// HyperlinkImpl
private alias c_atk_hyperlink_impl_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_hyperlink_impl_get_typeFn c_atk_hyperlink_impl_get_type; ///
private alias c_atk_hyperlink_impl_get_hyperlinkFn = extern(C) AtkHyperlink* function(AtkHyperlinkImpl* impl) nothrow;
__gshared c_atk_hyperlink_impl_get_hyperlinkFn c_atk_hyperlink_impl_get_hyperlink; ///

// Hypertext
private alias c_atk_hypertext_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_hypertext_get_typeFn c_atk_hypertext_get_type; ///
private alias c_atk_hypertext_get_linkFn = extern(C) AtkHyperlink* function(AtkHypertext* hypertext, int linkIndex) nothrow;
__gshared c_atk_hypertext_get_linkFn c_atk_hypertext_get_link; ///
private alias c_atk_hypertext_get_link_indexFn = extern(C) int function(AtkHypertext* hypertext, int charIndex) nothrow;
__gshared c_atk_hypertext_get_link_indexFn c_atk_hypertext_get_link_index; ///
private alias c_atk_hypertext_get_n_linksFn = extern(C) int function(AtkHypertext* hypertext) nothrow;
__gshared c_atk_hypertext_get_n_linksFn c_atk_hypertext_get_n_links; ///

// Image
private alias c_atk_image_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_image_get_typeFn c_atk_image_get_type; ///
private alias c_atk_image_get_image_descriptionFn = extern(C) const(char)* function(AtkImage* image) nothrow;
__gshared c_atk_image_get_image_descriptionFn c_atk_image_get_image_description; ///
private alias c_atk_image_get_image_localeFn = extern(C) const(char)* function(AtkImage* image) nothrow;
__gshared c_atk_image_get_image_localeFn c_atk_image_get_image_locale; ///
private alias c_atk_image_get_image_positionFn = extern(C) void function(AtkImage* image, int* x, int* y, AtkCoordType coordType) nothrow;
__gshared c_atk_image_get_image_positionFn c_atk_image_get_image_position; ///
private alias c_atk_image_get_image_sizeFn = extern(C) void function(AtkImage* image, int* width, int* height) nothrow;
__gshared c_atk_image_get_image_sizeFn c_atk_image_get_image_size; ///
private alias c_atk_image_set_image_descriptionFn = extern(C) gboolean function(AtkImage* image, const(char)* description) nothrow;
__gshared c_atk_image_set_image_descriptionFn c_atk_image_set_image_description; ///

// Implementor
private alias c_atk_implementor_ref_accessibleFn = extern(C) AtkObject* function(AtkImplementor* implementor) nothrow;
__gshared c_atk_implementor_ref_accessibleFn c_atk_implementor_ref_accessible; ///

// ImplementorIface
private alias c_atk_implementor_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_implementor_get_typeFn c_atk_implementor_get_type; ///

// Misc
private alias c_atk_misc_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_misc_get_typeFn c_atk_misc_get_type; ///
private alias c_atk_misc_get_instanceFn = extern(C) const(AtkMisc)* function() nothrow;
__gshared c_atk_misc_get_instanceFn c_atk_misc_get_instance; ///
private alias c_atk_misc_threads_enterFn = extern(C) void function(AtkMisc* misc) nothrow;
__gshared c_atk_misc_threads_enterFn c_atk_misc_threads_enter; ///
private alias c_atk_misc_threads_leaveFn = extern(C) void function(AtkMisc* misc) nothrow;
__gshared c_atk_misc_threads_leaveFn c_atk_misc_threads_leave; ///

// NoOpObject
private alias c_atk_no_op_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_no_op_object_get_typeFn c_atk_no_op_object_get_type; ///
private alias c_atk_no_op_object_newFn = extern(C) AtkObject* function(GObject* obj) nothrow;
__gshared c_atk_no_op_object_newFn c_atk_no_op_object_new; ///

// NoOpObjectFactory
private alias c_atk_no_op_object_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_no_op_object_factory_get_typeFn c_atk_no_op_object_factory_get_type; ///
private alias c_atk_no_op_object_factory_newFn = extern(C) AtkObjectFactory* function() nothrow;
__gshared c_atk_no_op_object_factory_newFn c_atk_no_op_object_factory_new; ///

// ObjectFactory
private alias c_atk_object_factory_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_object_factory_get_typeFn c_atk_object_factory_get_type; ///
private alias c_atk_object_factory_create_accessibleFn = extern(C) AtkObject* function(AtkObjectFactory* factory, GObject* obj) nothrow;
__gshared c_atk_object_factory_create_accessibleFn c_atk_object_factory_create_accessible; ///
private alias c_atk_object_factory_get_accessible_typeFn = extern(C) GType function(AtkObjectFactory* factory) nothrow;
__gshared c_atk_object_factory_get_accessible_typeFn c_atk_object_factory_get_accessible_type; ///
private alias c_atk_object_factory_invalidateFn = extern(C) void function(AtkObjectFactory* factory) nothrow;
__gshared c_atk_object_factory_invalidateFn c_atk_object_factory_invalidate; ///

// ObjectWrap
private alias c_atk_object_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_object_get_typeFn c_atk_object_get_type; ///
private alias c_atk_object_add_relationshipFn = extern(C) gboolean function(AtkObject* object, AtkRelationType relationship, AtkObject* target) nothrow;
__gshared c_atk_object_add_relationshipFn c_atk_object_add_relationship; ///
private alias c_atk_object_connect_property_change_handlerFn = extern(C) uint function(AtkObject* accessible, AtkPropertyChangeHandler* handler) nothrow;
__gshared c_atk_object_connect_property_change_handlerFn c_atk_object_connect_property_change_handler; ///
private alias c_atk_object_get_accessible_idFn = extern(C) const(char)* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_accessible_idFn c_atk_object_get_accessible_id; ///
private alias c_atk_object_get_attributesFn = extern(C) AtkAttributeSet* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_attributesFn c_atk_object_get_attributes; ///
private alias c_atk_object_get_descriptionFn = extern(C) const(char)* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_descriptionFn c_atk_object_get_description; ///
private alias c_atk_object_get_help_textFn = extern(C) const(char)* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_help_textFn c_atk_object_get_help_text; ///
private alias c_atk_object_get_index_in_parentFn = extern(C) int function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_index_in_parentFn c_atk_object_get_index_in_parent; ///
private alias c_atk_object_get_layerFn = extern(C) AtkLayer function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_layerFn c_atk_object_get_layer; ///
private alias c_atk_object_get_mdi_zorderFn = extern(C) int function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_mdi_zorderFn c_atk_object_get_mdi_zorder; ///
private alias c_atk_object_get_n_accessible_childrenFn = extern(C) int function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_n_accessible_childrenFn c_atk_object_get_n_accessible_children; ///
private alias c_atk_object_get_nameFn = extern(C) const(char)* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_nameFn c_atk_object_get_name; ///
private alias c_atk_object_get_object_localeFn = extern(C) const(char)* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_object_localeFn c_atk_object_get_object_locale; ///
private alias c_atk_object_get_parentFn = extern(C) AtkObject* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_parentFn c_atk_object_get_parent; ///
private alias c_atk_object_get_roleFn = extern(C) AtkRole function(AtkObject* accessible) nothrow;
__gshared c_atk_object_get_roleFn c_atk_object_get_role; ///
private alias c_atk_object_initializeFn = extern(C) void function(AtkObject* accessible, void* data) nothrow;
__gshared c_atk_object_initializeFn c_atk_object_initialize; ///
private alias c_atk_object_notify_state_changeFn = extern(C) void function(AtkObject* accessible, AtkState state, gboolean value) nothrow;
__gshared c_atk_object_notify_state_changeFn c_atk_object_notify_state_change; ///
private alias c_atk_object_peek_parentFn = extern(C) AtkObject* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_peek_parentFn c_atk_object_peek_parent; ///
private alias c_atk_object_ref_accessible_childFn = extern(C) AtkObject* function(AtkObject* accessible, int i) nothrow;
__gshared c_atk_object_ref_accessible_childFn c_atk_object_ref_accessible_child; ///
private alias c_atk_object_ref_relation_setFn = extern(C) AtkRelationSet* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_ref_relation_setFn c_atk_object_ref_relation_set; ///
private alias c_atk_object_ref_state_setFn = extern(C) AtkStateSet* function(AtkObject* accessible) nothrow;
__gshared c_atk_object_ref_state_setFn c_atk_object_ref_state_set; ///
private alias c_atk_object_remove_property_change_handlerFn = extern(C) void function(AtkObject* accessible, uint handlerId) nothrow;
__gshared c_atk_object_remove_property_change_handlerFn c_atk_object_remove_property_change_handler; ///
private alias c_atk_object_remove_relationshipFn = extern(C) gboolean function(AtkObject* object, AtkRelationType relationship, AtkObject* target) nothrow;
__gshared c_atk_object_remove_relationshipFn c_atk_object_remove_relationship; ///
private alias c_atk_object_set_accessible_idFn = extern(C) void function(AtkObject* accessible, const(char)* id) nothrow;
__gshared c_atk_object_set_accessible_idFn c_atk_object_set_accessible_id; ///
private alias c_atk_object_set_descriptionFn = extern(C) void function(AtkObject* accessible, const(char)* description) nothrow;
__gshared c_atk_object_set_descriptionFn c_atk_object_set_description; ///
private alias c_atk_object_set_help_textFn = extern(C) void function(AtkObject* accessible, const(char)* helpText) nothrow;
__gshared c_atk_object_set_help_textFn c_atk_object_set_help_text; ///
private alias c_atk_object_set_nameFn = extern(C) void function(AtkObject* accessible, const(char)* name) nothrow;
__gshared c_atk_object_set_nameFn c_atk_object_set_name; ///
private alias c_atk_object_set_parentFn = extern(C) void function(AtkObject* accessible, AtkObject* parent) nothrow;
__gshared c_atk_object_set_parentFn c_atk_object_set_parent; ///
private alias c_atk_object_set_roleFn = extern(C) void function(AtkObject* accessible, AtkRole role) nothrow;
__gshared c_atk_object_set_roleFn c_atk_object_set_role; ///

// Plug
private alias c_atk_plug_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_plug_get_typeFn c_atk_plug_get_type; ///
private alias c_atk_plug_newFn = extern(C) AtkObject* function() nothrow;
__gshared c_atk_plug_newFn c_atk_plug_new; ///
private alias c_atk_plug_get_idFn = extern(C) char* function(AtkPlug* plug) nothrow;
__gshared c_atk_plug_get_idFn c_atk_plug_get_id; ///
private alias c_atk_plug_set_childFn = extern(C) void function(AtkPlug* plug, AtkObject* child) nothrow;
__gshared c_atk_plug_set_childFn c_atk_plug_set_child; ///

// Range
private alias c_atk_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_range_get_typeFn c_atk_range_get_type; ///
private alias c_atk_range_newFn = extern(C) AtkRange* function(double lowerLimit, double upperLimit, const(char)* description) nothrow;
__gshared c_atk_range_newFn c_atk_range_new; ///
private alias c_atk_range_copyFn = extern(C) AtkRange* function(AtkRange* src) nothrow;
__gshared c_atk_range_copyFn c_atk_range_copy; ///
private alias c_atk_range_freeFn = extern(C) void function(AtkRange* range) nothrow;
__gshared c_atk_range_freeFn c_atk_range_free; ///
private alias c_atk_range_get_descriptionFn = extern(C) const(char)* function(AtkRange* range) nothrow;
__gshared c_atk_range_get_descriptionFn c_atk_range_get_description; ///
private alias c_atk_range_get_lower_limitFn = extern(C) double function(AtkRange* range) nothrow;
__gshared c_atk_range_get_lower_limitFn c_atk_range_get_lower_limit; ///
private alias c_atk_range_get_upper_limitFn = extern(C) double function(AtkRange* range) nothrow;
__gshared c_atk_range_get_upper_limitFn c_atk_range_get_upper_limit; ///

// Rectangle
private alias c_atk_rectangle_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_rectangle_get_typeFn c_atk_rectangle_get_type; ///

// Registry
private alias c_atk_registry_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_registry_get_typeFn c_atk_registry_get_type; ///
private alias c_atk_registry_get_factoryFn = extern(C) AtkObjectFactory* function(AtkRegistry* registry, GType type) nothrow;
__gshared c_atk_registry_get_factoryFn c_atk_registry_get_factory; ///
private alias c_atk_registry_get_factory_typeFn = extern(C) GType function(AtkRegistry* registry, GType type) nothrow;
__gshared c_atk_registry_get_factory_typeFn c_atk_registry_get_factory_type; ///
private alias c_atk_registry_set_factory_typeFn = extern(C) void function(AtkRegistry* registry, GType type, GType factoryType) nothrow;
__gshared c_atk_registry_set_factory_typeFn c_atk_registry_set_factory_type; ///

// Relation
private alias c_atk_relation_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_relation_get_typeFn c_atk_relation_get_type; ///
private alias c_atk_relation_newFn = extern(C) AtkRelation* function(AtkObject** targets, int nTargets, AtkRelationType relationship) nothrow;
__gshared c_atk_relation_newFn c_atk_relation_new; ///
private alias c_atk_relation_add_targetFn = extern(C) void function(AtkRelation* relation, AtkObject* target) nothrow;
__gshared c_atk_relation_add_targetFn c_atk_relation_add_target; ///
private alias c_atk_relation_get_relation_typeFn = extern(C) AtkRelationType function(AtkRelation* relation) nothrow;
__gshared c_atk_relation_get_relation_typeFn c_atk_relation_get_relation_type; ///
private alias c_atk_relation_get_targetFn = extern(C) GPtrArray* function(AtkRelation* relation) nothrow;
__gshared c_atk_relation_get_targetFn c_atk_relation_get_target; ///
private alias c_atk_relation_remove_targetFn = extern(C) gboolean function(AtkRelation* relation, AtkObject* target) nothrow;
__gshared c_atk_relation_remove_targetFn c_atk_relation_remove_target; ///

// RelationSet
private alias c_atk_relation_set_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_relation_set_get_typeFn c_atk_relation_set_get_type; ///
private alias c_atk_relation_set_newFn = extern(C) AtkRelationSet* function() nothrow;
__gshared c_atk_relation_set_newFn c_atk_relation_set_new; ///
private alias c_atk_relation_set_addFn = extern(C) void function(AtkRelationSet* set, AtkRelation* relation) nothrow;
__gshared c_atk_relation_set_addFn c_atk_relation_set_add; ///
private alias c_atk_relation_set_add_relation_by_typeFn = extern(C) void function(AtkRelationSet* set, AtkRelationType relationship, AtkObject* target) nothrow;
__gshared c_atk_relation_set_add_relation_by_typeFn c_atk_relation_set_add_relation_by_type; ///
private alias c_atk_relation_set_containsFn = extern(C) gboolean function(AtkRelationSet* set, AtkRelationType relationship) nothrow;
__gshared c_atk_relation_set_containsFn c_atk_relation_set_contains; ///
private alias c_atk_relation_set_contains_targetFn = extern(C) gboolean function(AtkRelationSet* set, AtkRelationType relationship, AtkObject* target) nothrow;
__gshared c_atk_relation_set_contains_targetFn c_atk_relation_set_contains_target; ///
private alias c_atk_relation_set_get_n_relationsFn = extern(C) int function(AtkRelationSet* set) nothrow;
__gshared c_atk_relation_set_get_n_relationsFn c_atk_relation_set_get_n_relations; ///
private alias c_atk_relation_set_get_relationFn = extern(C) AtkRelation* function(AtkRelationSet* set, int i) nothrow;
__gshared c_atk_relation_set_get_relationFn c_atk_relation_set_get_relation; ///
private alias c_atk_relation_set_get_relation_by_typeFn = extern(C) AtkRelation* function(AtkRelationSet* set, AtkRelationType relationship) nothrow;
__gshared c_atk_relation_set_get_relation_by_typeFn c_atk_relation_set_get_relation_by_type; ///
private alias c_atk_relation_set_removeFn = extern(C) void function(AtkRelationSet* set, AtkRelation* relation) nothrow;
__gshared c_atk_relation_set_removeFn c_atk_relation_set_remove; ///

// Selection
private alias c_atk_selection_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_selection_get_typeFn c_atk_selection_get_type; ///
private alias c_atk_selection_add_selectionFn = extern(C) gboolean function(AtkSelection* selection, int i) nothrow;
__gshared c_atk_selection_add_selectionFn c_atk_selection_add_selection; ///
private alias c_atk_selection_clear_selectionFn = extern(C) gboolean function(AtkSelection* selection) nothrow;
__gshared c_atk_selection_clear_selectionFn c_atk_selection_clear_selection; ///
private alias c_atk_selection_get_selection_countFn = extern(C) int function(AtkSelection* selection) nothrow;
__gshared c_atk_selection_get_selection_countFn c_atk_selection_get_selection_count; ///
private alias c_atk_selection_is_child_selectedFn = extern(C) gboolean function(AtkSelection* selection, int i) nothrow;
__gshared c_atk_selection_is_child_selectedFn c_atk_selection_is_child_selected; ///
private alias c_atk_selection_ref_selectionFn = extern(C) AtkObject* function(AtkSelection* selection, int i) nothrow;
__gshared c_atk_selection_ref_selectionFn c_atk_selection_ref_selection; ///
private alias c_atk_selection_remove_selectionFn = extern(C) gboolean function(AtkSelection* selection, int i) nothrow;
__gshared c_atk_selection_remove_selectionFn c_atk_selection_remove_selection; ///
private alias c_atk_selection_select_all_selectionFn = extern(C) gboolean function(AtkSelection* selection) nothrow;
__gshared c_atk_selection_select_all_selectionFn c_atk_selection_select_all_selection; ///

// Socket
private alias c_atk_socket_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_socket_get_typeFn c_atk_socket_get_type; ///
private alias c_atk_socket_newFn = extern(C) AtkObject* function() nothrow;
__gshared c_atk_socket_newFn c_atk_socket_new; ///
private alias c_atk_socket_embedFn = extern(C) void function(AtkSocket* obj, const(char)* plugId) nothrow;
__gshared c_atk_socket_embedFn c_atk_socket_embed; ///
private alias c_atk_socket_is_occupiedFn = extern(C) gboolean function(AtkSocket* obj) nothrow;
__gshared c_atk_socket_is_occupiedFn c_atk_socket_is_occupied; ///

// StateSet
private alias c_atk_state_set_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_state_set_get_typeFn c_atk_state_set_get_type; ///
private alias c_atk_state_set_newFn = extern(C) AtkStateSet* function() nothrow;
__gshared c_atk_state_set_newFn c_atk_state_set_new; ///
private alias c_atk_state_set_add_stateFn = extern(C) gboolean function(AtkStateSet* set, AtkStateType type) nothrow;
__gshared c_atk_state_set_add_stateFn c_atk_state_set_add_state; ///
private alias c_atk_state_set_add_statesFn = extern(C) void function(AtkStateSet* set, AtkStateType* types, int nTypes) nothrow;
__gshared c_atk_state_set_add_statesFn c_atk_state_set_add_states; ///
private alias c_atk_state_set_and_setsFn = extern(C) AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) nothrow;
__gshared c_atk_state_set_and_setsFn c_atk_state_set_and_sets; ///
private alias c_atk_state_set_clear_statesFn = extern(C) void function(AtkStateSet* set) nothrow;
__gshared c_atk_state_set_clear_statesFn c_atk_state_set_clear_states; ///
private alias c_atk_state_set_contains_stateFn = extern(C) gboolean function(AtkStateSet* set, AtkStateType type) nothrow;
__gshared c_atk_state_set_contains_stateFn c_atk_state_set_contains_state; ///
private alias c_atk_state_set_contains_statesFn = extern(C) gboolean function(AtkStateSet* set, AtkStateType* types, int nTypes) nothrow;
__gshared c_atk_state_set_contains_statesFn c_atk_state_set_contains_states; ///
private alias c_atk_state_set_is_emptyFn = extern(C) gboolean function(AtkStateSet* set) nothrow;
__gshared c_atk_state_set_is_emptyFn c_atk_state_set_is_empty; ///
private alias c_atk_state_set_or_setsFn = extern(C) AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) nothrow;
__gshared c_atk_state_set_or_setsFn c_atk_state_set_or_sets; ///
private alias c_atk_state_set_remove_stateFn = extern(C) gboolean function(AtkStateSet* set, AtkStateType type) nothrow;
__gshared c_atk_state_set_remove_stateFn c_atk_state_set_remove_state; ///
private alias c_atk_state_set_xor_setsFn = extern(C) AtkStateSet* function(AtkStateSet* set, AtkStateSet* compareSet) nothrow;
__gshared c_atk_state_set_xor_setsFn c_atk_state_set_xor_sets; ///

// StreamableContent
private alias c_atk_streamable_content_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_streamable_content_get_typeFn c_atk_streamable_content_get_type; ///
private alias c_atk_streamable_content_get_mime_typeFn = extern(C) const(char)* function(AtkStreamableContent* streamable, int i) nothrow;
__gshared c_atk_streamable_content_get_mime_typeFn c_atk_streamable_content_get_mime_type; ///
private alias c_atk_streamable_content_get_n_mime_typesFn = extern(C) int function(AtkStreamableContent* streamable) nothrow;
__gshared c_atk_streamable_content_get_n_mime_typesFn c_atk_streamable_content_get_n_mime_types; ///
private alias c_atk_streamable_content_get_streamFn = extern(C) GIOChannel* function(AtkStreamableContent* streamable, const(char)* mimeType) nothrow;
__gshared c_atk_streamable_content_get_streamFn c_atk_streamable_content_get_stream; ///
private alias c_atk_streamable_content_get_uriFn = extern(C) const(char)* function(AtkStreamableContent* streamable, const(char)* mimeType) nothrow;
__gshared c_atk_streamable_content_get_uriFn c_atk_streamable_content_get_uri; ///

// Table
private alias c_atk_table_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_table_get_typeFn c_atk_table_get_type; ///
private alias c_atk_table_add_column_selectionFn = extern(C) gboolean function(AtkTable* table, int column) nothrow;
__gshared c_atk_table_add_column_selectionFn c_atk_table_add_column_selection; ///
private alias c_atk_table_add_row_selectionFn = extern(C) gboolean function(AtkTable* table, int row) nothrow;
__gshared c_atk_table_add_row_selectionFn c_atk_table_add_row_selection; ///
private alias c_atk_table_get_captionFn = extern(C) AtkObject* function(AtkTable* table) nothrow;
__gshared c_atk_table_get_captionFn c_atk_table_get_caption; ///
private alias c_atk_table_get_column_at_indexFn = extern(C) int function(AtkTable* table, int index) nothrow;
__gshared c_atk_table_get_column_at_indexFn c_atk_table_get_column_at_index; ///
private alias c_atk_table_get_column_descriptionFn = extern(C) const(char)* function(AtkTable* table, int column) nothrow;
__gshared c_atk_table_get_column_descriptionFn c_atk_table_get_column_description; ///
private alias c_atk_table_get_column_extent_atFn = extern(C) int function(AtkTable* table, int row, int column) nothrow;
__gshared c_atk_table_get_column_extent_atFn c_atk_table_get_column_extent_at; ///
private alias c_atk_table_get_column_headerFn = extern(C) AtkObject* function(AtkTable* table, int column) nothrow;
__gshared c_atk_table_get_column_headerFn c_atk_table_get_column_header; ///
private alias c_atk_table_get_index_atFn = extern(C) int function(AtkTable* table, int row, int column) nothrow;
__gshared c_atk_table_get_index_atFn c_atk_table_get_index_at; ///
private alias c_atk_table_get_n_columnsFn = extern(C) int function(AtkTable* table) nothrow;
__gshared c_atk_table_get_n_columnsFn c_atk_table_get_n_columns; ///
private alias c_atk_table_get_n_rowsFn = extern(C) int function(AtkTable* table) nothrow;
__gshared c_atk_table_get_n_rowsFn c_atk_table_get_n_rows; ///
private alias c_atk_table_get_row_at_indexFn = extern(C) int function(AtkTable* table, int index) nothrow;
__gshared c_atk_table_get_row_at_indexFn c_atk_table_get_row_at_index; ///
private alias c_atk_table_get_row_descriptionFn = extern(C) const(char)* function(AtkTable* table, int row) nothrow;
__gshared c_atk_table_get_row_descriptionFn c_atk_table_get_row_description; ///
private alias c_atk_table_get_row_extent_atFn = extern(C) int function(AtkTable* table, int row, int column) nothrow;
__gshared c_atk_table_get_row_extent_atFn c_atk_table_get_row_extent_at; ///
private alias c_atk_table_get_row_headerFn = extern(C) AtkObject* function(AtkTable* table, int row) nothrow;
__gshared c_atk_table_get_row_headerFn c_atk_table_get_row_header; ///
private alias c_atk_table_get_selected_columnsFn = extern(C) int function(AtkTable* table, int** selected) nothrow;
__gshared c_atk_table_get_selected_columnsFn c_atk_table_get_selected_columns; ///
private alias c_atk_table_get_selected_rowsFn = extern(C) int function(AtkTable* table, int** selected) nothrow;
__gshared c_atk_table_get_selected_rowsFn c_atk_table_get_selected_rows; ///
private alias c_atk_table_get_summaryFn = extern(C) AtkObject* function(AtkTable* table) nothrow;
__gshared c_atk_table_get_summaryFn c_atk_table_get_summary; ///
private alias c_atk_table_is_column_selectedFn = extern(C) gboolean function(AtkTable* table, int column) nothrow;
__gshared c_atk_table_is_column_selectedFn c_atk_table_is_column_selected; ///
private alias c_atk_table_is_row_selectedFn = extern(C) gboolean function(AtkTable* table, int row) nothrow;
__gshared c_atk_table_is_row_selectedFn c_atk_table_is_row_selected; ///
private alias c_atk_table_is_selectedFn = extern(C) gboolean function(AtkTable* table, int row, int column) nothrow;
__gshared c_atk_table_is_selectedFn c_atk_table_is_selected; ///
private alias c_atk_table_ref_atFn = extern(C) AtkObject* function(AtkTable* table, int row, int column) nothrow;
__gshared c_atk_table_ref_atFn c_atk_table_ref_at; ///
private alias c_atk_table_remove_column_selectionFn = extern(C) gboolean function(AtkTable* table, int column) nothrow;
__gshared c_atk_table_remove_column_selectionFn c_atk_table_remove_column_selection; ///
private alias c_atk_table_remove_row_selectionFn = extern(C) gboolean function(AtkTable* table, int row) nothrow;
__gshared c_atk_table_remove_row_selectionFn c_atk_table_remove_row_selection; ///
private alias c_atk_table_set_captionFn = extern(C) void function(AtkTable* table, AtkObject* caption) nothrow;
__gshared c_atk_table_set_captionFn c_atk_table_set_caption; ///
private alias c_atk_table_set_column_descriptionFn = extern(C) void function(AtkTable* table, int column, const(char)* description) nothrow;
__gshared c_atk_table_set_column_descriptionFn c_atk_table_set_column_description; ///
private alias c_atk_table_set_column_headerFn = extern(C) void function(AtkTable* table, int column, AtkObject* header) nothrow;
__gshared c_atk_table_set_column_headerFn c_atk_table_set_column_header; ///
private alias c_atk_table_set_row_descriptionFn = extern(C) void function(AtkTable* table, int row, const(char)* description) nothrow;
__gshared c_atk_table_set_row_descriptionFn c_atk_table_set_row_description; ///
private alias c_atk_table_set_row_headerFn = extern(C) void function(AtkTable* table, int row, AtkObject* header) nothrow;
__gshared c_atk_table_set_row_headerFn c_atk_table_set_row_header; ///
private alias c_atk_table_set_summaryFn = extern(C) void function(AtkTable* table, AtkObject* accessible) nothrow;
__gshared c_atk_table_set_summaryFn c_atk_table_set_summary; ///

// TableCell
private alias c_atk_table_cell_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_table_cell_get_typeFn c_atk_table_cell_get_type; ///
private alias c_atk_table_cell_get_column_header_cellsFn = extern(C) GPtrArray* function(AtkTableCell* cell) nothrow;
__gshared c_atk_table_cell_get_column_header_cellsFn c_atk_table_cell_get_column_header_cells; ///
private alias c_atk_table_cell_get_column_spanFn = extern(C) int function(AtkTableCell* cell) nothrow;
__gshared c_atk_table_cell_get_column_spanFn c_atk_table_cell_get_column_span; ///
private alias c_atk_table_cell_get_positionFn = extern(C) gboolean function(AtkTableCell* cell, int* row, int* column) nothrow;
__gshared c_atk_table_cell_get_positionFn c_atk_table_cell_get_position; ///
private alias c_atk_table_cell_get_row_column_spanFn = extern(C) gboolean function(AtkTableCell* cell, int* row, int* column, int* rowSpan, int* columnSpan) nothrow;
__gshared c_atk_table_cell_get_row_column_spanFn c_atk_table_cell_get_row_column_span; ///
private alias c_atk_table_cell_get_row_header_cellsFn = extern(C) GPtrArray* function(AtkTableCell* cell) nothrow;
__gshared c_atk_table_cell_get_row_header_cellsFn c_atk_table_cell_get_row_header_cells; ///
private alias c_atk_table_cell_get_row_spanFn = extern(C) int function(AtkTableCell* cell) nothrow;
__gshared c_atk_table_cell_get_row_spanFn c_atk_table_cell_get_row_span; ///
private alias c_atk_table_cell_get_tableFn = extern(C) AtkObject* function(AtkTableCell* cell) nothrow;
__gshared c_atk_table_cell_get_tableFn c_atk_table_cell_get_table; ///

// Text
private alias c_atk_text_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_text_get_typeFn c_atk_text_get_type; ///
private alias c_atk_text_free_rangesFn = extern(C) void function(AtkTextRange** ranges) nothrow;
__gshared c_atk_text_free_rangesFn c_atk_text_free_ranges; ///
private alias c_atk_text_add_selectionFn = extern(C) gboolean function(AtkText* text, int startOffset, int endOffset) nothrow;
__gshared c_atk_text_add_selectionFn c_atk_text_add_selection; ///
private alias c_atk_text_get_bounded_rangesFn = extern(C) AtkTextRange** function(AtkText* text, AtkTextRectangle* rect, AtkCoordType coordType, AtkTextClipType xClipType, AtkTextClipType yClipType) nothrow;
__gshared c_atk_text_get_bounded_rangesFn c_atk_text_get_bounded_ranges; ///
private alias c_atk_text_get_caret_offsetFn = extern(C) int function(AtkText* text) nothrow;
__gshared c_atk_text_get_caret_offsetFn c_atk_text_get_caret_offset; ///
private alias c_atk_text_get_character_at_offsetFn = extern(C) dchar function(AtkText* text, int offset) nothrow;
__gshared c_atk_text_get_character_at_offsetFn c_atk_text_get_character_at_offset; ///
private alias c_atk_text_get_character_countFn = extern(C) int function(AtkText* text) nothrow;
__gshared c_atk_text_get_character_countFn c_atk_text_get_character_count; ///
private alias c_atk_text_get_character_extentsFn = extern(C) void function(AtkText* text, int offset, int* x, int* y, int* width, int* height, AtkCoordType coords) nothrow;
__gshared c_atk_text_get_character_extentsFn c_atk_text_get_character_extents; ///
private alias c_atk_text_get_default_attributesFn = extern(C) AtkAttributeSet* function(AtkText* text) nothrow;
__gshared c_atk_text_get_default_attributesFn c_atk_text_get_default_attributes; ///
private alias c_atk_text_get_n_selectionsFn = extern(C) int function(AtkText* text) nothrow;
__gshared c_atk_text_get_n_selectionsFn c_atk_text_get_n_selections; ///
private alias c_atk_text_get_offset_at_pointFn = extern(C) int function(AtkText* text, int x, int y, AtkCoordType coords) nothrow;
__gshared c_atk_text_get_offset_at_pointFn c_atk_text_get_offset_at_point; ///
private alias c_atk_text_get_range_extentsFn = extern(C) void function(AtkText* text, int startOffset, int endOffset, AtkCoordType coordType, AtkTextRectangle* rect) nothrow;
__gshared c_atk_text_get_range_extentsFn c_atk_text_get_range_extents; ///
private alias c_atk_text_get_run_attributesFn = extern(C) AtkAttributeSet* function(AtkText* text, int offset, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_run_attributesFn c_atk_text_get_run_attributes; ///
private alias c_atk_text_get_selectionFn = extern(C) char* function(AtkText* text, int selectionNum, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_selectionFn c_atk_text_get_selection; ///
private alias c_atk_text_get_string_at_offsetFn = extern(C) char* function(AtkText* text, int offset, AtkTextGranularity granularity, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_string_at_offsetFn c_atk_text_get_string_at_offset; ///
private alias c_atk_text_get_textFn = extern(C) char* function(AtkText* text, int startOffset, int endOffset) nothrow;
__gshared c_atk_text_get_textFn c_atk_text_get_text; ///
private alias c_atk_text_get_text_after_offsetFn = extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_text_after_offsetFn c_atk_text_get_text_after_offset; ///
private alias c_atk_text_get_text_at_offsetFn = extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_text_at_offsetFn c_atk_text_get_text_at_offset; ///
private alias c_atk_text_get_text_before_offsetFn = extern(C) char* function(AtkText* text, int offset, AtkTextBoundary boundaryType, int* startOffset, int* endOffset) nothrow;
__gshared c_atk_text_get_text_before_offsetFn c_atk_text_get_text_before_offset; ///
private alias c_atk_text_remove_selectionFn = extern(C) gboolean function(AtkText* text, int selectionNum) nothrow;
__gshared c_atk_text_remove_selectionFn c_atk_text_remove_selection; ///
private alias c_atk_text_scroll_substring_toFn = extern(C) gboolean function(AtkText* text, int startOffset, int endOffset, AtkScrollType type) nothrow;
__gshared c_atk_text_scroll_substring_toFn c_atk_text_scroll_substring_to; ///
private alias c_atk_text_scroll_substring_to_pointFn = extern(C) gboolean function(AtkText* text, int startOffset, int endOffset, AtkCoordType coords, int x, int y) nothrow;
__gshared c_atk_text_scroll_substring_to_pointFn c_atk_text_scroll_substring_to_point; ///
private alias c_atk_text_set_caret_offsetFn = extern(C) gboolean function(AtkText* text, int offset) nothrow;
__gshared c_atk_text_set_caret_offsetFn c_atk_text_set_caret_offset; ///
private alias c_atk_text_set_selectionFn = extern(C) gboolean function(AtkText* text, int selectionNum, int startOffset, int endOffset) nothrow;
__gshared c_atk_text_set_selectionFn c_atk_text_set_selection; ///

// TextRange
private alias c_atk_text_range_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_text_range_get_typeFn c_atk_text_range_get_type; ///

// Util
private alias c_atk_util_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_util_get_typeFn c_atk_util_get_type; ///

// Value
private alias c_atk_value_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_value_get_typeFn c_atk_value_get_type; ///
private alias c_atk_value_get_current_valueFn = extern(C) void function(AtkValue* obj, GValue* value) nothrow;
__gshared c_atk_value_get_current_valueFn c_atk_value_get_current_value; ///
private alias c_atk_value_get_incrementFn = extern(C) double function(AtkValue* obj) nothrow;
__gshared c_atk_value_get_incrementFn c_atk_value_get_increment; ///
private alias c_atk_value_get_maximum_valueFn = extern(C) void function(AtkValue* obj, GValue* value) nothrow;
__gshared c_atk_value_get_maximum_valueFn c_atk_value_get_maximum_value; ///
private alias c_atk_value_get_minimum_incrementFn = extern(C) void function(AtkValue* obj, GValue* value) nothrow;
__gshared c_atk_value_get_minimum_incrementFn c_atk_value_get_minimum_increment; ///
private alias c_atk_value_get_minimum_valueFn = extern(C) void function(AtkValue* obj, GValue* value) nothrow;
__gshared c_atk_value_get_minimum_valueFn c_atk_value_get_minimum_value; ///
private alias c_atk_value_get_rangeFn = extern(C) AtkRange* function(AtkValue* obj) nothrow;
__gshared c_atk_value_get_rangeFn c_atk_value_get_range; ///
private alias c_atk_value_get_sub_rangesFn = extern(C) GSList* function(AtkValue* obj) nothrow;
__gshared c_atk_value_get_sub_rangesFn c_atk_value_get_sub_ranges; ///
private alias c_atk_value_get_value_and_textFn = extern(C) void function(AtkValue* obj, double* value, char** text) nothrow;
__gshared c_atk_value_get_value_and_textFn c_atk_value_get_value_and_text; ///
private alias c_atk_value_set_current_valueFn = extern(C) gboolean function(AtkValue* obj, const(GValue)* value) nothrow;
__gshared c_atk_value_set_current_valueFn c_atk_value_set_current_value; ///
private alias c_atk_value_set_valueFn = extern(C) void function(AtkValue* obj, double newValue) nothrow;
__gshared c_atk_value_set_valueFn c_atk_value_set_value; ///

// Window
private alias c_atk_window_get_typeFn = extern(C) GType function() nothrow;
__gshared c_atk_window_get_typeFn c_atk_window_get_type; ///

// global
private alias c_atk_add_focus_trackerFn = extern(C) uint function(AtkEventListener focusTracker) nothrow;
__gshared c_atk_add_focus_trackerFn c_atk_add_focus_tracker; ///
private alias c_atk_add_global_event_listenerFn = extern(C) uint function(GSignalEmissionHook listener, const(char)* eventType) nothrow;
__gshared c_atk_add_global_event_listenerFn c_atk_add_global_event_listener; ///
private alias c_atk_add_key_event_listenerFn = extern(C) uint function(AtkKeySnoopFunc listener, void* data) nothrow;
__gshared c_atk_add_key_event_listenerFn c_atk_add_key_event_listener; ///
private alias c_atk_focus_tracker_initFn = extern(C) void function(AtkEventListenerInit init_) nothrow;
__gshared c_atk_focus_tracker_initFn c_atk_focus_tracker_init; ///
private alias c_atk_focus_tracker_notifyFn = extern(C) void function(AtkObject* object) nothrow;
__gshared c_atk_focus_tracker_notifyFn c_atk_focus_tracker_notify; ///
private alias c_atk_get_binary_ageFn = extern(C) uint function() nothrow;
__gshared c_atk_get_binary_ageFn c_atk_get_binary_age; ///
private alias c_atk_get_default_registryFn = extern(C) AtkRegistry* function() nothrow;
__gshared c_atk_get_default_registryFn c_atk_get_default_registry; ///
private alias c_atk_get_focus_objectFn = extern(C) AtkObject* function() nothrow;
__gshared c_atk_get_focus_objectFn c_atk_get_focus_object; ///
private alias c_atk_get_interface_ageFn = extern(C) uint function() nothrow;
__gshared c_atk_get_interface_ageFn c_atk_get_interface_age; ///
private alias c_atk_get_major_versionFn = extern(C) uint function() nothrow;
__gshared c_atk_get_major_versionFn c_atk_get_major_version; ///
private alias c_atk_get_micro_versionFn = extern(C) uint function() nothrow;
__gshared c_atk_get_micro_versionFn c_atk_get_micro_version; ///
private alias c_atk_get_minor_versionFn = extern(C) uint function() nothrow;
__gshared c_atk_get_minor_versionFn c_atk_get_minor_version; ///
private alias c_atk_get_rootFn = extern(C) AtkObject* function() nothrow;
__gshared c_atk_get_rootFn c_atk_get_root; ///
private alias c_atk_get_toolkit_nameFn = extern(C) const(char)* function() nothrow;
__gshared c_atk_get_toolkit_nameFn c_atk_get_toolkit_name; ///
private alias c_atk_get_toolkit_versionFn = extern(C) const(char)* function() nothrow;
__gshared c_atk_get_toolkit_versionFn c_atk_get_toolkit_version; ///
private alias c_atk_get_versionFn = extern(C) const(char)* function() nothrow;
__gshared c_atk_get_versionFn c_atk_get_version; ///
private alias c_atk_remove_focus_trackerFn = extern(C) void function(uint trackerId) nothrow;
__gshared c_atk_remove_focus_trackerFn c_atk_remove_focus_tracker; ///
private alias c_atk_remove_global_event_listenerFn = extern(C) void function(uint listenerId) nothrow;
__gshared c_atk_remove_global_event_listenerFn c_atk_remove_global_event_listener; ///
private alias c_atk_remove_key_event_listenerFn = extern(C) void function(uint listenerId) nothrow;
__gshared c_atk_remove_key_event_listenerFn c_atk_remove_key_event_listener; ///

// RelationType
private alias c_atk_relation_type_for_nameFn = extern(C) AtkRelationType function(const(char)* name) nothrow;
__gshared c_atk_relation_type_for_nameFn c_atk_relation_type_for_name; ///
private alias c_atk_relation_type_get_nameFn = extern(C) const(char)* function(AtkRelationType type) nothrow;
__gshared c_atk_relation_type_get_nameFn c_atk_relation_type_get_name; ///
private alias c_atk_relation_type_registerFn = extern(C) AtkRelationType function(const(char)* name) nothrow;
__gshared c_atk_relation_type_registerFn c_atk_relation_type_register; ///

// Role
private alias c_atk_role_for_nameFn = extern(C) AtkRole function(const(char)* name) nothrow;
__gshared c_atk_role_for_nameFn c_atk_role_for_name; ///
private alias c_atk_role_get_localized_nameFn = extern(C) const(char)* function(AtkRole role) nothrow;
__gshared c_atk_role_get_localized_nameFn c_atk_role_get_localized_name; ///
private alias c_atk_role_get_nameFn = extern(C) const(char)* function(AtkRole role) nothrow;
__gshared c_atk_role_get_nameFn c_atk_role_get_name; ///
private alias c_atk_role_registerFn = extern(C) AtkRole function(const(char)* name) nothrow;
__gshared c_atk_role_registerFn c_atk_role_register; ///

// StateType
private alias c_atk_state_type_for_nameFn = extern(C) AtkStateType function(const(char)* name) nothrow;
__gshared c_atk_state_type_for_nameFn c_atk_state_type_for_name; ///
private alias c_atk_state_type_get_nameFn = extern(C) const(char)* function(AtkStateType type) nothrow;
__gshared c_atk_state_type_get_nameFn c_atk_state_type_get_name; ///
private alias c_atk_state_type_registerFn = extern(C) AtkStateType function(const(char)* name) nothrow;
__gshared c_atk_state_type_registerFn c_atk_state_type_register; ///

// TextAttribute
private alias c_atk_text_attribute_for_nameFn = extern(C) AtkTextAttribute function(const(char)* name) nothrow;
__gshared c_atk_text_attribute_for_nameFn c_atk_text_attribute_for_name; ///
private alias c_atk_text_attribute_get_nameFn = extern(C) const(char)* function(AtkTextAttribute attr) nothrow;
__gshared c_atk_text_attribute_get_nameFn c_atk_text_attribute_get_name; ///
private alias c_atk_text_attribute_get_valueFn = extern(C) const(char)* function(AtkTextAttribute attr, int index) nothrow;
__gshared c_atk_text_attribute_get_valueFn c_atk_text_attribute_get_value; ///
private alias c_atk_text_attribute_registerFn = extern(C) AtkTextAttribute function(const(char)* name) nothrow;
__gshared c_atk_text_attribute_registerFn c_atk_text_attribute_register; ///

// ValueType
private alias c_atk_value_type_get_localized_nameFn = extern(C) const(char)* function(AtkValueType valueType) nothrow;
__gshared c_atk_value_type_get_localized_nameFn c_atk_value_type_get_localized_name; ///
private alias c_atk_value_type_get_nameFn = extern(C) const(char)* function(AtkValueType valueType) nothrow;
__gshared c_atk_value_type_get_nameFn c_atk_value_type_get_name; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.atk1", "Atk");

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
