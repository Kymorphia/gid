//!gir Gtk-3.0
//!info description "D binding for the Gtk3 library - Gtk3 graphics toolkit library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid-old/gtk.html
//!info capi https://docs.gtk.org/gtk3/

//!kind RequestedSize StructAlias

//# Rename ToolShell.getOrientation since it conflicts with Orientable.getOrientation in ToolBar
//!set interface[ToolShell].method[get_orientation][name] tool_shell_get_orientation

//# GtkIconSize enum uses gint for the D type, set it to IconSize enum (the * after GtkIconSize is a wildcard to match a literal '*' also)
//!set *.type[c:type=GtkIconSize*,name=gint][name] IconSize

//# Change string arguments to character array with length
//!set callback[ClipboardRichTextReceivedFunc].parameters.parameter[text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set class[ListStore].method[reorder][unsupported] 1

//# axes param takes a GDK_AXIS_IGNORE terminated array (0 value) and expects the out values[] array to be the same size (use length of axes array)
//!set class[GestureStylus].method[get_axes].parameters.parameter[axes].array[][zero-terminated] 1
//!set class[GestureStylus].method[get_axes].parameters.parameter[values].array[][length] 0

//# Set arrays to be zero-terminated=1
//!set class[IconTheme].method[get_icon_sizes].return-value.array[][zero-terminated] 1
//!set function[accelerator_parse_with_keycode].parameters.parameter[accelerator_codes].array[][zero-terminated] 1
//!set function[init_with_args].parameters.parameter[entries].array[][zero-terminated] 1

//# Ignore unimportant APIs
//!set callback[ModuleInitFunc][ignore] 1

//# Ignore user data parameter
//!set interface[Buildable].method[custom_tag_end][ignore] 1

//# Set basic parameters to out
//!set function[rc_parse_priority].parameters.parameter[priority][direction] out

//# Return callback array should be transfer-ownership full
//!set callback[TextBufferSerializeFunc].return-value[][transfer-ownership] full

//# string-length-param (Strings with array length parameters)
//!set class[Builder].constructor[new_from_string].parameters.parameter[string].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[add_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[add_objects_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[extend_with_template].parameters.parameter[buffer].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Clipboard].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].method[insert_text].parameters.parameter[new_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].constructor[new].parameters.parameter[initial_chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[emit_inserted_text].parameters.parameter[chars].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[insert_text].parameters.parameter[chars].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[set_text].parameters.parameter[chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].glib:signal[inserted-text].parameters.parameter[chars].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set class[IMContext].method[set_surrounding].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[SelectionData].method[set_text].parameters.parameter[str].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_markup].parameters.parameter[markup].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].glib:signal[insert-text].parameters.parameter[text].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set class[UIManager].method[add_ui_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].glib:signal[insert-text].parameters.parameter[new_text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'
