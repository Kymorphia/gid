//!gir Gda-5.0
//!info description "D binding for the Gda5 library - GNU Data Access database library"
//!info homepage https://gitlab.gnome.org/GNOME/libgda
//!info docs https://www.kymorphia.com/gid/gid~gda5/
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

//# Pointer-to-pointer output parameters missing out annotations
//!set function[compute_dml_statements].parameters.parameter[insert_stmt][direction] out
//!set function[compute_dml_statements].parameters.parameter[update_stmt][direction] out
//!set function[compute_dml_statements].parameters.parameter[delete_stmt][direction] out
//!set function[rewrite_statement_for_null_parameters].parameters.parameter[out_stmt][direction] out
//!set class[RepetitiveStatement].method[get_template_set].parameters.parameter[set][direction] out
//!set class[RepetitiveStatement].method[get_template_set].parameters.parameter[set][transfer-ownership] full
//!set class[TransactionStatus].method[find].parameters.parameter[destev][direction] out
//!set class[TransactionStatus].method[find_current].parameters.parameter[destev][direction] out
