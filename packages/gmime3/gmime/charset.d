/// Module for [Charset] struct
module gmime.charset;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;

/**
    State used by [gmime.charset.Charset.best] and [gmime.charset.Charset.bestName].
*/
struct Charset
{
  /**
      charset mask
  */
  uint mask;

  /**
      charset level
  */
  uint level;

  /**
      Gets the best charset name based on the charset mask charset.
      Returns: the charset name that best represents the charset
        mask charset or null for us-ascii.
  */
  string bestName()
  {
    const(char)* _cretval;
    _cretval = g_mime_charset_best_name(cast(GMimeCharset*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Check to see if the UTF-8 text will fit safely within charset.
  
      Params:
        charset = a charset
        text = utf-8 text to check
      Returns: true if it is safe to encode text into charset or false
        otherwise.
  */
  bool canEncode(string charset, string text)
  {
    bool _retval;
    const(char)* _charset = charset.toCString(No.Alloc);
    size_t _len;
    if (text)
      _len = cast(size_t)text.length;

    auto _text = cast(const(char)*)text.ptr;
    _retval = cast(bool)g_mime_charset_can_encode(cast(GMimeCharset*)&this, _charset, _text, _len);
    return _retval;
  }

  /**
      Initializes a charset mask structure.
  */
  void init_()
  {
    g_mime_charset_init(cast(GMimeCharset*)&this);
  }

  /**
      Steps through the input buffer 1 unicode character (glyph) at a
      time (ie, not necessarily 1 byte at a time). Bitwise 'and' our
      charset->mask with the mask for each glyph. This has the effect of
      limiting what charsets our charset->mask can match.
  
      Params:
        inbuf = input text buffer (must be in UTF-8)
  */
  void step(string inbuf)
  {
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(char)*)inbuf.ptr;
    g_mime_charset_step(cast(GMimeCharset*)&this, _inbuf, _inlen);
  }

  /**
      Computes the best charset to use to encode this text buffer.
  
      Params:
        inbuf = a UTF-8 text buffer
      Returns: the charset name best suited for the input text
        or null if it is ascii-safe.
  */
  static string best(string inbuf)
  {
    const(char)* _cretval;
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(const(char)*)inbuf.ptr;
    _cretval = g_mime_charset_best(_inbuf, _inlen);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Attempts to find a canonical charset name for charset.
      
      Note: Will normally return the same value as
      [gmime.charset.Charset.iconvName] unless the system iconv does not use
      the canonical ISO charset names (such as using ISO8859-1 rather
      than the canonical form ISO-8859-1).
  
      Params:
        charset = charset name
      Returns: a canonical charset name for charset.
  */
  static string canonName(string charset)
  {
    const(char)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_charset_canon_name(_charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Attempts to find an iconv-friendly charset name for charset.
  
      Params:
        charset = charset name
      Returns: an iconv-friendly charset name for charset.
  */
  static string iconvName(string charset)
  {
    const(char)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_charset_iconv_name(_charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Maps the ISO-8859-# charset to the equivalent Windows-CP125#
      charset.
  
      Params:
        isocharset = ISO-8859-# charset
      Returns: equivalent Windows charset.
  */
  static string isoToWindows(string isocharset)
  {
    const(char)* _cretval;
    const(char)* _isocharset = isocharset.toCString(No.Alloc);
    _cretval = g_mime_charset_iso_to_windows(_isocharset);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Attempts to find a specific language code that is specific to
      charset. Currently only handles CJK and Russian/Ukranian
      charset->lang mapping. Everything else will return null.
  
      Params:
        charset = charset name
      Returns: a language code that is specific to charset,
        or null on fail.
  */
  static string language(string charset)
  {
    const(char)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_charset_language(_charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the user's locale charset (or iso-8859-1 by default).
      
      Note: This function is deprecated. Use [gmime.global.localeCharset]
      instead.
      Returns: the user's locale charset (or iso-8859-1 by default).
  */
  static string localeName()
  {
    const(char)* _cretval;
    _cretval = g_mime_charset_locale_name();
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Initializes character set maps.
      
      Note: [gmime.global.init_] calls this routine for you.
  */
  static void mapInit()
  {
    g_mime_charset_map_init();
  }

  /**
      Frees internal lookup tables created in [gmime.charset.Charset.mapInit].
  */
  static void mapShutdown()
  {
    g_mime_charset_map_shutdown();
  }

  /**
      Attempts to find an iconv-friendly charset name for charset.
      
      Note: This function is deprecated. Use [gmime.charset.Charset.iconvName]
      instead.
  
      Params:
        charset = charset name
      Returns: an iconv-friendly charset name for charset.
  */
  static string name(string charset)
  {
    const(char)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = g_mime_charset_name(_charset);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
