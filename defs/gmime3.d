//!gir GMime-3.0
//!info GMime "Provides a core library and set of utilities which may be used for the creation and parsing of messages using the Multipurpose Internet Mail Extension (MIME)."
//!info homepage https://github.com/jstedfast/gmime/
//!info docs https://www.kymorphia.com/gid/gmime.html
//!info capi https://lazka.github.io/pgi-docs/GMime-3.0/index.html

//!subtype ssize_t ptrdiff_t

//!subdtype Object ObjectWrap
//!subctype iconv_t void*

//!subctype InternetAddress GMimeInternetAddress
//!subctype InternetAddressGroup GMimeInternetAddressGroup
//!subctype InternetAddressList GMimeInternetAddressList
//!subctype InternetAddressMailbox GMimeInternetAddressMailbox

//!set class[Filter].field[priv].type[][c:type] void*
//!set class[FilterGZip].field[priv].type[][c:type] void*
//!set class[FilterHTML].field[scanner].type[][c:type] void*
//!set class[Parser].field[priv].type[][c:type] void*
//!set class[StreamFilter].field[priv].type[][c:type] void*
//!set class[StreamCat].field[sources].type[][c:type] void*
//!set class[StreamCat].field[current].type[][c:type] void*

//# Change function parameter to a null-terminated string array
//!set record[ParserOptions].method[set_fallback_charsets].parameters.parameter[charsets].type '<array zero-terminated="1" c:type="const char **"><type name="utf8" c:type="const char *"/></array>'
