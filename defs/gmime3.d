//!gir GMime-3.0
//!info GMime "Provides a core library and set of utilities which may be used for the creation and parsing of messages using the Multipurpose Internet Mail Extension (MIME)."
//!info homepage https://github.com/jstedfast/gmime/
//!info docs https://www.kymorphia.com/gid/gmime.html
//!info capi https://lazka.github.io/pgi-docs/GMime-3.0/index.html

//!kind StreamIOVector StructAlias

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

//# string-length-param (Strings with array length parameters)
//!set record[Charset].method[can_encode].parameters.parameter[text].type '<array length="2" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Charset].method[step].parameters.parameter[inbuf].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Charset].function[best].parameters.parameter[inbuf].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'

//!set function[ydecode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[yencode_close].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[yencode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//!set function[ydecode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[yencode_close].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set function[yencode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'

//!set function[ydecode_step].parameters.parameter[outbuf][direction] inout
//!set function[yencode_close].parameters.parameter[outbuf][direction] inout
//!set function[yencode_step].parameters.parameter[outbuf][direction] inout

//!set function[ydecode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set function[yencode_close].parameters.parameter[outbuf][caller-allocates] 1
//!set function[yencode_step].parameters.parameter[outbuf][caller-allocates] 1

//!set function[ydecode_step].parameters.parameter[state][direction] inout
//!set function[yencode_close].parameters.parameter[state][direction] inout
//!set function[yencode_step].parameters.parameter[state][direction] inout

//!set function[ydecode_step].parameters.parameter[pcrc][direction] inout
//!set function[yencode_close].parameters.parameter[pcrc][direction] inout
//!set function[yencode_step].parameters.parameter[pcrc][direction] inout

//!set function[ydecode_step].parameters.parameter[crc][direction] inout
//!set function[yencode_close].parameters.parameter[crc][direction] inout
//!set function[yencode_step].parameters.parameter[crc][direction] inout

//!set record[Encoding].method[flush].parameters.parameter[inbuf].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Encoding].method[step].parameters.parameter[inbuf].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set record[Encoding].function[base64_decode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[base64_encode_close].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[base64_encode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uudecode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uuencode_close].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uuencode_step].parameters.parameter[inbuf].type '<array length="1" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//!set record[Encoding].method[flush].parameters.parameter[outbuf].type '<array caller-length="1" c:type="char*"><type name="char" c:type="char"/></array>'
//!set record[Encoding].method[step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="char*"><type name="char" c:type="char"/></array>'
//!set record[Encoding].function[base64_decode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[base64_encode_close].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[base64_encode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uudecode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uuencode_close].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uuencode_step].parameters.parameter[outbuf].type '<array caller-length="1" c:type="guint8*"><type name="guint8" c:type="guint8"/></array>'

//!set record[Encoding].method[flush].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].method[step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[base64_decode_step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[base64_encode_close].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[base64_encode_step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[uudecode_step].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[uuencode_close].parameters.parameter[outbuf][direction] inout
//!set record[Encoding].function[uuencode_step].parameters.parameter[outbuf][direction] inout

//!set record[Encoding].method[flush].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].method[step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[base64_decode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[base64_encode_close].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[base64_encode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[uudecode_step].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[uuencode_close].parameters.parameter[outbuf][caller-allocates] 1
//!set record[Encoding].function[uuencode_step].parameters.parameter[outbuf][caller-allocates] 1

//!set record[Encoding].function[base64_decode_step].parameters.parameter[state][direction] inout
//!set record[Encoding].function[base64_encode_close].parameters.parameter[state][direction] inout
//!set record[Encoding].function[base64_encode_step].parameters.parameter[state][direction] inout
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[state][direction] inout
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[state][direction] inout
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[state][direction] inout
//!set record[Encoding].function[uudecode_step].parameters.parameter[state][direction] inout
//!set record[Encoding].function[uuencode_close].parameters.parameter[state][direction] inout
//!set record[Encoding].function[uuencode_step].parameters.parameter[state][direction] inout

//!set record[Encoding].function[base64_decode_step].parameters.parameter[save][direction] inout
//!set record[Encoding].function[base64_encode_close].parameters.parameter[save][direction] inout
//!set record[Encoding].function[base64_encode_step].parameters.parameter[save][direction] inout
//!set record[Encoding].function[quoted_decode_step].parameters.parameter[save][direction] inout
//!set record[Encoding].function[quoted_encode_close].parameters.parameter[save][direction] inout
//!set record[Encoding].function[quoted_encode_step].parameters.parameter[save][direction] inout
//!set record[Encoding].function[uudecode_step].parameters.parameter[save][direction] inout
//!set record[Encoding].function[uuencode_close].parameters.parameter[save][direction] inout
//!set record[Encoding].function[uuencode_step].parameters.parameter[save][direction] inout

//!set record[Encoding].function[uuencode_close].parameters.parameter[uubuf].type '<array c:type="guint8*" fixed-size="60"><type name="guint8" c:type="guint8"/></array>'
//!set record[Encoding].function[uuencode_step].parameters.parameter[uubuf].type '<array c:type="guint8*" fixed-size="60"><type name="guint8" c:type="guint8"/></array>'

//!set record[Encoding].function[uuencode_close].parameters.parameter[uubuf][caller-allocates] 1
//!set record[Encoding].function[uuencode_step].parameters.parameter[uubuf][caller-allocates] 1

//!set record[Encoding].function[uuencode_close].parameters.parameter[uubuf][direction] inout
//!set record[Encoding].function[uuencode_step].parameters.parameter[uubuf][direction] inout
