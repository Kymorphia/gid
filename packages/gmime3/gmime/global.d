/// Global functions for gmime3 library
module gmime.global;

import gid.gid;
import glib.date_time;
import gmime.c.functions;
import gmime.c.types;
import gmime.format_options;
import gmime.parser_options;
import gmime.types;


/**
    Checks that the GMime library version meets the requirements of the
    required version.

    Params:
      major = Minimum major version
      minor = Minimum minor version
      micro = Minimum micro version
    Returns: true if the requirement is met or false otherwise.
*/
bool checkVersion(uint major, uint minor, uint micro)
{
  bool _retval;
  _retval = cast(bool)g_mime_check_version(major, minor, micro);
  return _retval;
}

/**
    Gets the appropriate #GMimeContentEncoding enumeration value based
    on the input string.

    Params:
      str = a string representing a Content-Transfer-Encoding value
    Returns: the #GMimeContentEncoding specified by str or
      #GMIME_CONTENT_ENCODING_DEFAULT on error.
*/
gmime.types.ContentEncoding contentEncodingFromString(string str)
{
  GMimeContentEncoding _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_content_encoding_from_string(_str);
  gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
  return _retval;
}

/**
    Gets the string value of the content encoding.

    Params:
      encoding = a #GMimeContentEncoding
    Returns: the encoding type as a string or null on error. Available
      values for the encoding are: #GMIME_CONTENT_ENCODING_DEFAULT,
      #GMIME_CONTENT_ENCODING_7BIT, #GMIME_CONTENT_ENCODING_8BIT,
      #GMIME_CONTENT_ENCODING_BINARY, #GMIME_CONTENT_ENCODING_BASE64,
      #GMIME_CONTENT_ENCODING_QUOTEDPRINTABLE and
      #GMIME_CONTENT_ENCODING_UUENCODE.
*/
string contentEncodingToString(gmime.types.ContentEncoding encoding)
{
  const(char)* _cretval;
  _cretval = g_mime_content_encoding_to_string(encoding);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Allocates a new string buffer containing str in UTF-8.

    Params:
      str = string in locale charset
    Returns: a new string buffer containing str converted to UTF-8.
*/
string iconvLocaleToUtf8(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_iconv_locale_to_utf8(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Allocates a new string buffer containing the first `n` bytes of
    str converted to UTF-8.

    Params:
      str = string in locale charset
      n = number of bytes to convert
    Returns: a new string buffer containing the first `n` bytes of
      str converted to UTF-8.
*/
string iconvLocaleToUtf8Length(string str, size_t n)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_iconv_locale_to_utf8_length(_str, n);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Allocates a new string buffer containing str converted to the
    user's locale charset.

    Params:
      str = string in UTF-8 charset
    Returns: a new string buffer containing str converted to the
      user's locale charset.
*/
string iconvUtf8ToLocale(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_iconv_utf8_to_locale(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Allocates a new string buffer containing the first `n` bytes of
    str converted to the user's locale charset.

    Params:
      str = string in UTF-8 charset
      n = number of bytes to convert
    Returns: a new string buffer containing the first `n` bytes of
      str converted to the user's locale charset.
*/
string iconvUtf8ToLocaleLength(string str, size_t n)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_iconv_utf8_to_locale_length(_str, n);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Initializes GMime.
*/
void init_()
{
  g_mime_init();
}

/**
    Gets the user's locale charset (or iso-8859-1 by default).
    Returns: the user's locale charset (or iso-8859-1 by default).
*/
string localeCharset()
{
  const(char)* _cretval;
  _cretval = g_mime_locale_charset();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the user's locale language code (or null by default).
    Returns: the user's locale language code (or null by default).
*/
string localeLanguage()
{
  const(char)* _cretval;
  _cretval = g_mime_locale_language();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Frees internally allocated tables created in [gmime.global.init_].
*/
void shutdown()
{
  g_mime_shutdown();
}

/**
    Determines the best content encoding for the first len bytes of
    text.

    Params:
      text = text to encode
    Returns: a #GMimeContentEncoding that is determined to be the best
      encoding type for the specified block of text. ("best" in this
      particular case means smallest output size)
*/
gmime.types.ContentEncoding utilsBestEncoding(ubyte[] text)
{
  GMimeContentEncoding _cretval;
  size_t _len;
  if (text)
    _len = cast(size_t)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  _cretval = g_mime_utils_best_encoding(_text, _len);
  gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
  return _retval;
}

/**
    Attempts to convert text in an unknown 8bit/multibyte charset into
    UTF-8 by finding the charset which will convert the most bytes into
    valid UTF-8 characters as possible. If no exact match can be found,
    it will choose the best match and convert invalid byte sequences
    into question-marks (?) in the returned string buffer.

    Params:
      options = a #GMimeParserOptions or null
      text = input text in
          unknown 8bit/multibyte character set
    Returns: a UTF-8 string representation of text.
*/
string utilsDecode8bit(gmime.parser_options.ParserOptions options, ubyte[] text)
{
  char* _cretval;
  size_t _len;
  if (text)
    _len = cast(size_t)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  _cretval = g_mime_utils_decode_8bit(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _text, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Decodes a msg-id as defined by rfc822.

    Params:
      messageId = string containing a message-id
    Returns: the addr-spec portion of the msg-id.
*/
string utilsDecodeMessageId(string messageId)
{
  char* _cretval;
  const(char)* _messageId = messageId.toCString(No.Alloc);
  _cretval = g_mime_utils_decode_message_id(_messageId);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Generates a unique Message-Id.

    Params:
      fqdn = Fully qualified domain name
    Returns: a unique string in an addr-spec format suitable for use as
      a Message-Id.
*/
string utilsGenerateMessageId(string fqdn)
{
  char* _cretval;
  const(char)* _fqdn = fqdn.toCString(No.Alloc);
  _cretval = g_mime_utils_generate_message_id(_fqdn);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Parses the rfc822 date string.

    Params:
      str = input date string
    Returns: the #GDateTime representation of the date
      string specified by str or null on error.
*/
glib.date_time.DateTime utilsHeaderDecodeDate(string str)
{
  GDateTime* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_utils_header_decode_date(_str);
  auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Decodes an rfc2047 encoded 'phrase' header.

    Params:
      options = a #GMimeParserOptions or null
      phrase = header to decode
    Returns: a newly allocated UTF-8 string representing the the decoded
      header.
*/
string utilsHeaderDecodePhrase(gmime.parser_options.ParserOptions options, string phrase)
{
  char* _cretval;
  const(char)* _phrase = phrase.toCString(No.Alloc);
  _cretval = g_mime_utils_header_decode_phrase(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _phrase);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Decodes an rfc2047 encoded 'text' header.

    Params:
      options = a #GMimeParserOptions or null
      text = header text to decode
    Returns: a newly allocated UTF-8 string representing the the decoded
      header.
*/
string utilsHeaderDecodeText(gmime.parser_options.ParserOptions options, string text)
{
  char* _cretval;
  const(char)* _text = text.toCString(No.Alloc);
  _cretval = g_mime_utils_header_decode_text(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _text);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Encodes a 'phrase' header according to the rules in rfc2047.

    Params:
      options = a #GMimeFormatOptions or null
      phrase = phrase to encode
      charset = the charset to use or null to use the default
    Returns: the encoded 'phrase'. Useful for encoding internet
      addresses.
*/
string utilsHeaderEncodePhrase(gmime.format_options.FormatOptions options, string phrase, string charset = null)
{
  char* _cretval;
  const(char)* _phrase = phrase.toCString(No.Alloc);
  const(char)* _charset = charset.toCString(No.Alloc);
  _cretval = g_mime_utils_header_encode_phrase(options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _phrase, _charset);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Encodes a 'text' header according to the rules in rfc2047.

    Params:
      options = a #GMimeFormatOptions or null
      text = text to encode
      charset = the charset to use or null to use the default
    Returns: the encoded header. Useful for encoding
      headers like "Subject".
*/
string utilsHeaderEncodeText(gmime.format_options.FormatOptions options, string text, string charset = null)
{
  char* _cretval;
  const(char)* _text = text.toCString(No.Alloc);
  const(char)* _charset = charset.toCString(No.Alloc);
  _cretval = g_mime_utils_header_encode_text(options ? cast(GMimeFormatOptions*)options._cPtr(No.Dup) : null, _text, _charset);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Allocates a string buffer containing the rfc822 formatted date
    string represented by date.

    Params:
      date = a #GDateTime
    Returns: a valid string representation of the date.
*/
string utilsHeaderFormatDate(glib.date_time.DateTime date)
{
  char* _cretval;
  _cretval = g_mime_utils_header_format_date(date ? cast(GDateTime*)date._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Unfolds a raw header value according to the rules in rfc822.

    Params:
      value = raw header value
    Returns: an allocated string containing the unfolded header value.
*/
string utilsHeaderUnfold(string value)
{
  char* _cretval;
  const(char)* _value = value.toCString(No.Alloc);
  _cretval = g_mime_utils_header_unfold(_value);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Quotes string as needed according to the rules in rfc2822.

    Params:
      str = input string
    Returns: an allocated string containing the escaped and quoted (if
      needed to be) input string. The decision to quote the string is
      based on whether or not the input string contains any 'specials'
      as defined by rfc2822.
*/
string utilsQuoteString(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_mime_utils_quote_string(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Folds a structured header according to the rules in rfc822.

    Params:
      options = a #GMimeParserOptions or null
      format = a #GMimeFormatOptions or null
      header = header field and value string
    Returns: an allocated string containing the folded header.
*/
string utilsStructuredHeaderFold(gmime.parser_options.ParserOptions options, gmime.format_options.FormatOptions format, string header)
{
  char* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = g_mime_utils_structured_header_fold(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, format ? cast(GMimeFormatOptions*)format._cPtr(No.Dup) : null, _header);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Determines if text contains 8bit characters within the first len
    bytes.

    Params:
      text = text to check for 8bit chars
    Returns: true if the text contains 8bit characters or false
      otherwise.
*/
bool utilsTextIs8bit(ubyte[] text)
{
  bool _retval;
  size_t _len;
  if (text)
    _len = cast(size_t)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  _retval = cast(bool)g_mime_utils_text_is_8bit(_text, _len);
  return _retval;
}

/**
    Unquotes and unescapes a string.

    Params:
      str = input string
*/
void utilsUnquoteString(string str)
{
  char* _str = str.toCString(No.Alloc);
  g_mime_utils_unquote_string(_str);
}

/**
    Folds an unstructured header according to the rules in rfc822.

    Params:
      options = a #GMimeParserOptions or null
      format = a #GMimeFormatOptions or null
      header = header field and value string
    Returns: an allocated string containing the folded header.
*/
string utilsUnstructuredHeaderFold(gmime.parser_options.ParserOptions options, gmime.format_options.FormatOptions format, string header)
{
  char* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = g_mime_utils_unstructured_header_fold(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, format ? cast(GMimeFormatOptions*)format._cPtr(No.Dup) : null, _header);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Performs a 'decode step' on a chunk of yEncoded data of length
    inlen pointed to by inbuf and writes to outbuf. Assumes the =ybegin
    and =ypart lines have already been stripped off.
    
    To get the crc32 value of the part, use #GMIME_YENCODE_CRC_FINAL
    (pcrc). If there are more parts, you should reuse crc without
    re-initializing. Once all parts have been decoded, you may get the
    combined crc32 value of all the parts using #GMIME_YENCODE_CRC_FINAL
    (crc).

    Params:
      inbuf = input buffer
      outbuf = output buffer
      state = ydecode state
      pcrc = part crc state
      crc = crc state
    Returns: the number of bytes decoded.
*/
size_t ydecodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint pcrc, ref uint crc)
{
  size_t _retval;
  size_t _inlen;
  if (inbuf)
    _inlen = cast(size_t)inbuf.length;

  auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
  _retval = g_mime_ydecode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&pcrc, cast(uint*)&crc);
  return _retval;
}

/**
    Call this function when finished encoding data with
    [gmime.global.yencodeStep] to flush off the remaining state.
    
    #GMIME_YENCODE_CRC_FINAL (pcrc) will give you the crc32 of the
    encoded "part". If there are more "parts" to encode, you should
    re-use crc when encoding the next "parts" and then use
    #GMIME_YENCODE_CRC_FINAL (crc) to get the combined crc32 value of
    all the parts.

    Params:
      inbuf = input buffer
      outbuf = output buffer
      state = yencode state
      pcrc = part crc state
      crc = crc state
    Returns: the number of bytes encoded.
*/
size_t yencodeClose(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint pcrc, ref uint crc)
{
  size_t _retval;
  size_t _inlen;
  if (inbuf)
    _inlen = cast(size_t)inbuf.length;

  auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
  _retval = g_mime_yencode_close(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&pcrc, cast(uint*)&crc);
  return _retval;
}

/**
    Performs an yEncode 'encode step' on a chunk of raw data of length
    inlen pointed to by inbuf and writes to outbuf.
    
    state should be initialized to #GMIME_YENCODE_STATE_INIT before
    beginning making the first call to this function. Subsequent calls
    should reuse state.
    
    Along the same lines, pcrc and crc should be initialized to
    #GMIME_YENCODE_CRC_INIT before using.

    Params:
      inbuf = input buffer
      outbuf = output buffer
      state = yencode state
      pcrc = part crc state
      crc = crc state
    Returns: the number of bytes encoded.
*/
size_t yencodeStep(ubyte[] inbuf, ref ubyte[] outbuf, ref int state, ref uint pcrc, ref uint crc)
{
  size_t _retval;
  size_t _inlen;
  if (inbuf)
    _inlen = cast(size_t)inbuf.length;

  auto _inbuf = cast(const(ubyte)*)inbuf.ptr;
  _retval = g_mime_yencode_step(_inbuf, _inlen, outbuf.ptr, cast(int*)&state, cast(uint*)&pcrc, cast(uint*)&crc);
  return _retval;
}
