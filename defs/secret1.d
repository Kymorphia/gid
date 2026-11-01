//!gir Secret-1
//!info description "D binding for the libsecret library - GObject-based library for storing and receiving secrets"
//!info homepage https://gitlab.gnome.org/GNOME/libsecret
//!info docs https://www.kymorphia.com/gid/gid~secret1/
//!info capi https://gnome.pages.gitlab.gnome.org/libsecret

//# Rename secret parameter since it conflicts with "secret" module path
//!set record[Value].constructor[new_full].parameters.parameter[secret][name] secretData

//# string-length-param (Strings with array length parameters)
//!set record[Value].constructor[new].parameters.parameter[secret].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[Value].constructor[new_full].parameters.parameter[secretData].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[Schema].field[attributes][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[Schema].field[name][writable] 0
//!set record[SchemaAttribute].field[name][writable] 0

//# Disable: Redundant with another API (e.g. GBytes variant, simpler setter or accessor methods)
//!set interface[Retrievable].property[attributes][ignore] 1
//!set record[Value].constructor[new_full][ignore] 1

//# Attributes hash table is string to string, not gpointer to gpointer
//!set function[attributes_validate].parameters.parameter[attributes].type '<type name="GLib.HashTable" c:type="GHashTable*"><type name="utf8" c:type="gchar*"/><type name="utf8" c:type="gchar*"/></type>'
