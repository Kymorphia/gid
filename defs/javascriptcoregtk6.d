//!gir JavaScriptCore-6.0
//!info description "D binding for the JavaScriptCore6 library - Javascript support library used with Webkit"
//!info homepage https://webkit.org
//!info docs https://www.kymorphia.com/gid/javascriptcore.html
//!info capi https://webkitgtk.org/reference/jsc-glib/stable/index.html

//!subdtype Exception ExceptionWrap

//# string-length-param (Strings with array length parameters)
//!set class[Context].method[check_syntax].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate_in_object].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate_with_source_uri].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
