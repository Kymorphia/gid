//!gir Soup-3.0
//!info description "D binding for the libsoup library - HTTP client/server library"
//!info homepage https://gitlab.gnome.org/GNOME/libsoup
//!info docs https://www.kymorphia.com/gid/gid~soup3/
//!info capi https://libsoup.gnome.org/libsoup-3.0/index.html

//!kind MessageHeadersIter Wrap

//!set function[form_encode_datalist][ignore] 1

//# string-length-param (Strings with array length parameters)
//!set function[headers_parse].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set function[headers_parse_request].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set function[headers_parse_response].parameters.parameter[str].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[MessageBody].field[data][writable] 0

//# Disable: Properties which conflict with identically named methods (use the methods)
//!set class[Auth].property[is-for-proxy][ignore] 1

//# Disable: Redundant with another API (e.g. GBytes variant, simpler setter or accessor methods)
//!set class[AuthDomain].property[filter][ignore] 1
//!set class[AuthDomain].property[generic-auth-callback][ignore] 1
//!set class[AuthDomainBasic].property[auth-callback][ignore] 1
//!set class[AuthDomainDigest].property[auth-callback][ignore] 1
