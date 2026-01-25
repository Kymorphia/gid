//!gir Json-1.0
//!info description "D binding for the json-glib library - JSON parsing and generating library"
//!info homepage https://gitlab.gnome.org/GNOME/json-glib
//!info docs https://www.kymorphia.com/gid/json.html
//!info capi https://gnome.pages.gitlab.gnome.org/json-glib

//!kind ObjectIter Wrap

//!subdtype Object ObjectWrap

//# Unused parameters
//!set function[construct_gobject].parameters.parameter[length][ignore] 1

//# string-length-param (Strings with array length parameters)
//!set function[gobject_from_data].parameters.parameter[data].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set function[gvariant_deserialize_data].parameters.parameter[json].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Parser].method[load_from_data].parameters.parameter[data].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
