//!gir Soup-3.0
//!info description "D binding for the libsoup library - HTTP client/server library"
//!info homepage https://gitlab.gnome.org/GNOME/libsoup
//!info docs https://www.kymorphia.com/gid/soup.html
//!info capi https://libsoup.gnome.org/libsoup-3.0/index.html

//!kind MessageHeadersIter Wrap

//!set function[form_encode_datalist][ignore] 1

//# string-length-param (Strings with array length parameters)
//!set function[headers_parse].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set function[headers_parse_request].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set function[headers_parse_response].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
