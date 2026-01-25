//!gir GtkSource-5
//!info description "D binding for the GtkSource5 library - Sourcecode viewer widget for Gtk4"
//!info homepage https://gitlab.gnome.org/GNOME/gtksourceview
//!info docs https://www.kymorphia.com/gid/gtksource.html
//!info capi https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5

//# Add missing direction out parameter direction
//!set class[View].method[get_mark_attributes].parameters.parameter[priority][direction] out

//# string-length-param (Strings with array length parameters)
//!set class[GutterRendererText].method[set_markup].parameters.parameter[markup].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[GutterRendererText].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[SearchContext].method[replace].parameters.parameter[replace].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[SearchContext].method[replace_all].parameters.parameter[replace].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
