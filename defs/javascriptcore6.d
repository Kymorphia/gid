//!gir JavaScriptCore-6.0
//!info description "D binding for the JavaScriptCore6 library - Javascript support library used with Webkit"
//!info homepage https://webkit.org
//!info docs https://www.kymorphia.com/gid/gid~javascriptcore6/
//!info capi https://webkitgtk.org/reference/jsc-glib/stable/index.html

//!subdtype Exception ExceptionWrap

//# string-length-param (Strings with array length parameters)
//!set class[Context].method[check_syntax].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate_in_object].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Context].method[evaluate_with_source_uri].parameters.parameter[code].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'


//# Disable: Internal/implementation-only API, not useful from D
//!set record[ClassClass].field[parent_class][ignore] 1

//# Ignore: Raw GCallback based APIs, covered by the D template methods (Class.addConstructor, addMethod, addProperty, Context.registerClass, Value.newFunction)
//!set class[Class].method[add_constructor_variadic][ignore] 1
//!set class[Class].method[add_constructorv][ignore] 1
//!set class[Class].method[add_method_variadic][ignore] 1
//!set class[Class].method[add_methodv][ignore] 1
//!set class[Class].method[add_property][ignore] 1
//!set class[Context].method[register_class][ignore] 1
//!set class[Value].constructor[new_function_variadic][ignore] 1
//!set class[Value].constructor[new_functionv][ignore] 1
//!set class[Value].method[object_define_property_accessor][ignore] 1
