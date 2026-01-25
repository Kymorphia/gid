//!gir Gda-5.0
//!info description "D binding for the Gda5 library - GNU Data Access database library"
//!info homepage https://gitlab.gnome.org/GNOME/libgda
//!info docs https://www.kymorphia.com/gid/gda.html
//!info capi https://gnome.pages.gitlab.gnome.org/libgda/C/libgda

//!set function[value_is_null][introspectable] 1

//!set class[Connection].function[string_split].parameters.parameter[out_cnc_params][direction] out
//!set class[Connection].function[string_split].parameters.parameter[out_provider][direction] out
//!set class[Connection].function[string_split].parameters.parameter[out_username][direction] out
//!set class[Connection].function[string_split].parameters.parameter[out_password][direction] out

//# This parameter is a single character output parameter, not a string
//!set class[Connection].method[get_date_format].parameters.parameter[out_sep].type[][name] char

//!set function[dsn_split].parameters.parameter[out_dsn][direction] out
//!set function[dsn_split].parameters.parameter[out_username][direction] out
//!set function[dsn_split].parameters.parameter[out_password][direction] out

//!set class[ServerProvider].method[string_to_value].parameters.parameter[dbms_type][direction] out

//!set record[Binary].field[data].array[][length] 1
