//!gir WebKit-6.0
//!info description "D binding for the WebKit 6 library - fast open-source web browser engine"
//!info homepage https://webkit.org
//!info docs https://www.kymorphia.com/gid/webkit.html
//!info capi https://webkitgtk.org/reference/webkitgtk/stable

//# string-length-param (Strings with array length parameters)
//!set class[InputMethodContext].method[notify_surrounding].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[WebView].method[call_async_javascript_function].parameters.parameter[body].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[WebView].method[evaluate_javascript].parameters.parameter[script].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
