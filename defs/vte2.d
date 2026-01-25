//!gir Vte-2.91
//!info description "D binding for the Vte 2.91 library - Virtual TErminal widget for Gtk3"
//!info homepage https://wiki.gnome.org/Apps/Terminal
//!info docs https://www.kymorphia.com/gid-old/vte.html
//!info capi https://gnome.pages.gitlab.gnome.org/vte/gtk3/index.html

//# Change package name to just vte2 rather than vte2-91
//!info name vte2

//# string-length-param (Strings with array length parameters)
//!set record[Regex].constructor[new_for_match].parameters.parameter[pattern].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Regex].constructor[new_for_match_full].parameters.parameter[pattern].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Regex].constructor[new_for_search].parameters.parameter[pattern].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Regex].constructor[new_for_search_full].parameters.parameter[pattern].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Terminal].glib:signal[commit].parameters.parameter[text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'
