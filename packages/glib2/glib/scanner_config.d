/// Module for [ScannerConfig] class
module glib.scanner_config;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Specifies the #GScanner parser configuration. Most settings can
    be changed during the parsing phase and will affect the lexical
    parsing of the next unpeeked token.
*/
class ScannerConfig
{
  GScannerConfig _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.scanner_config.ScannerConfig");

    _cInstance = *cast(GScannerConfig*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `csetSkipCharacters` field.
      Returns: specifies which characters should be skipped
            by the scanner (the default is the whitespace characters: space,
            tab, carriage-return and line-feed).
  */
  @property string csetSkipCharacters()
  {
    return cToD!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetSkipCharacters);
  }

  /**
      Set `csetSkipCharacters` field.
      Params:
        propval = specifies which characters should be skipped
              by the scanner (the default is the whitespace characters: space,
              tab, carriage-return and line-feed).
  */
  @property void csetSkipCharacters(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetSkipCharacters);
    dToC(propval, cast(void*)&(cast(GScannerConfig*)this._cPtr).csetSkipCharacters);
  }

  /**
      Get `csetIdentifierFirst` field.
      Returns: specifies the characters which can start
            identifiers (the default is [glib.types.CSET_a_2_z], "_", and [glib.types.CSET_A_2_Z]).
  */
  @property string csetIdentifierFirst()
  {
    return cToD!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetIdentifierFirst);
  }

  /**
      Set `csetIdentifierFirst` field.
      Params:
        propval = specifies the characters which can start
              identifiers (the default is [glib.types.CSET_a_2_z], "_", and [glib.types.CSET_A_2_Z]).
  */
  @property void csetIdentifierFirst(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetIdentifierFirst);
    dToC(propval, cast(void*)&(cast(GScannerConfig*)this._cPtr).csetIdentifierFirst);
  }

  /**
      Get `csetIdentifierNth` field.
      Returns: specifies the characters which can be used
            in identifiers, after the first character (the default is
            [glib.types.CSET_a_2_z], "_0123456789", [glib.types.CSET_A_2_Z], `G_CSET_LATINS`,
            `G_CSET_LATINC`).
  */
  @property string csetIdentifierNth()
  {
    return cToD!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetIdentifierNth);
  }

  /**
      Set `csetIdentifierNth` field.
      Params:
        propval = specifies the characters which can be used
              in identifiers, after the first character (the default is
              [glib.types.CSET_a_2_z], "_0123456789", [glib.types.CSET_A_2_Z], `G_CSET_LATINS`,
              `G_CSET_LATINC`).
  */
  @property void csetIdentifierNth(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).csetIdentifierNth);
    dToC(propval, cast(void*)&(cast(GScannerConfig*)this._cPtr).csetIdentifierNth);
  }

  /**
      Get `cpairCommentSingle` field.
      Returns: specifies the characters at the start and
            end of single-line comments. The default is "#\n" which means
            that single-line comments start with a '#' and continue until
            a '\n' (end of line).
  */
  @property string cpairCommentSingle()
  {
    return cToD!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).cpairCommentSingle);
  }

  /**
      Set `cpairCommentSingle` field.
      Params:
        propval = specifies the characters at the start and
              end of single-line comments. The default is "#\n" which means
              that single-line comments start with a '#' and continue until
              a '\n' (end of line).
  */
  @property void cpairCommentSingle(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GScannerConfig*)this._cPtr).cpairCommentSingle);
    dToC(propval, cast(void*)&(cast(GScannerConfig*)this._cPtr).cpairCommentSingle);
  }

  /**
      Get `caseSensitive` field.
      Returns: specifies if symbols are case sensitive (the
            default is false).
  */
  @property uint caseSensitive()
  {
    return (cast(GScannerConfig*)this._cPtr).caseSensitive;
  }

  /**
      Set `caseSensitive` field.
      Params:
        propval = specifies if symbols are case sensitive (the
              default is false).
  */
  @property void caseSensitive(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).caseSensitive = propval;
  }

  /**
      Get `skipCommentMulti` field.
      Returns: specifies if multi-line comments are skipped
            and not returned as tokens (the default is true).
  */
  @property uint skipCommentMulti()
  {
    return (cast(GScannerConfig*)this._cPtr).skipCommentMulti;
  }

  /**
      Set `skipCommentMulti` field.
      Params:
        propval = specifies if multi-line comments are skipped
              and not returned as tokens (the default is true).
  */
  @property void skipCommentMulti(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).skipCommentMulti = propval;
  }

  /**
      Get `skipCommentSingle` field.
      Returns: specifies if single-line comments are skipped
            and not returned as tokens (the default is true).
  */
  @property uint skipCommentSingle()
  {
    return (cast(GScannerConfig*)this._cPtr).skipCommentSingle;
  }

  /**
      Set `skipCommentSingle` field.
      Params:
        propval = specifies if single-line comments are skipped
              and not returned as tokens (the default is true).
  */
  @property void skipCommentSingle(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).skipCommentSingle = propval;
  }

  /**
      Get `scanCommentMulti` field.
      Returns: specifies if multi-line comments are recognized
            (the default is true).
  */
  @property uint scanCommentMulti()
  {
    return (cast(GScannerConfig*)this._cPtr).scanCommentMulti;
  }

  /**
      Set `scanCommentMulti` field.
      Params:
        propval = specifies if multi-line comments are recognized
              (the default is true).
  */
  @property void scanCommentMulti(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanCommentMulti = propval;
  }

  /**
      Get `scanIdentifier` field.
      Returns: specifies if identifiers are recognized (the
            default is true).
  */
  @property uint scanIdentifier()
  {
    return (cast(GScannerConfig*)this._cPtr).scanIdentifier;
  }

  /**
      Set `scanIdentifier` field.
      Params:
        propval = specifies if identifiers are recognized (the
              default is true).
  */
  @property void scanIdentifier(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanIdentifier = propval;
  }

  /**
      Get `scanIdentifier1char` field.
      Returns: specifies if single-character
            identifiers are recognized (the default is false).
  */
  @property uint scanIdentifier1char()
  {
    return (cast(GScannerConfig*)this._cPtr).scanIdentifier1char;
  }

  /**
      Set `scanIdentifier1char` field.
      Params:
        propval = specifies if single-character
              identifiers are recognized (the default is false).
  */
  @property void scanIdentifier1char(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanIdentifier1char = propval;
  }

  /**
      Get `scanIdentifierNULL` field.
      Returns: specifies if null is reported as
            `G_TOKEN_IDENTIFIER_NULL` (the default is false).
  */
  @property uint scanIdentifierNULL()
  {
    return (cast(GScannerConfig*)this._cPtr).scanIdentifierNULL;
  }

  /**
      Set `scanIdentifierNULL` field.
      Params:
        propval = specifies if null is reported as
              `G_TOKEN_IDENTIFIER_NULL` (the default is false).
  */
  @property void scanIdentifierNULL(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanIdentifierNULL = propval;
  }

  /**
      Get `scanSymbols` field.
      Returns: specifies if symbols are recognized (the default
            is true).
  */
  @property uint scanSymbols()
  {
    return (cast(GScannerConfig*)this._cPtr).scanSymbols;
  }

  /**
      Set `scanSymbols` field.
      Params:
        propval = specifies if symbols are recognized (the default
              is true).
  */
  @property void scanSymbols(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanSymbols = propval;
  }

  /**
      Get `scanBinary` field.
      Returns: specifies if binary numbers are recognized (the
            default is false).
  */
  @property uint scanBinary()
  {
    return (cast(GScannerConfig*)this._cPtr).scanBinary;
  }

  /**
      Set `scanBinary` field.
      Params:
        propval = specifies if binary numbers are recognized (the
              default is false).
  */
  @property void scanBinary(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanBinary = propval;
  }

  /**
      Get `scanOctal` field.
      Returns: specifies if octal numbers are recognized (the
            default is true).
  */
  @property uint scanOctal()
  {
    return (cast(GScannerConfig*)this._cPtr).scanOctal;
  }

  /**
      Set `scanOctal` field.
      Params:
        propval = specifies if octal numbers are recognized (the
              default is true).
  */
  @property void scanOctal(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanOctal = propval;
  }

  /**
      Get `scanFloat` field.
      Returns: specifies if floating point numbers are recognized
            (the default is true).
  */
  @property uint scanFloat()
  {
    return (cast(GScannerConfig*)this._cPtr).scanFloat;
  }

  /**
      Set `scanFloat` field.
      Params:
        propval = specifies if floating point numbers are recognized
              (the default is true).
  */
  @property void scanFloat(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanFloat = propval;
  }

  /**
      Get `scanHex` field.
      Returns: specifies if hexadecimal numbers are recognized (the
            default is true).
  */
  @property uint scanHex()
  {
    return (cast(GScannerConfig*)this._cPtr).scanHex;
  }

  /**
      Set `scanHex` field.
      Params:
        propval = specifies if hexadecimal numbers are recognized (the
              default is true).
  */
  @property void scanHex(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanHex = propval;
  }

  /**
      Get `scanHexDollar` field.
      Returns: specifies if '$' is recognized as a prefix for
            hexadecimal numbers (the default is false).
  */
  @property uint scanHexDollar()
  {
    return (cast(GScannerConfig*)this._cPtr).scanHexDollar;
  }

  /**
      Set `scanHexDollar` field.
      Params:
        propval = specifies if '$' is recognized as a prefix for
              hexadecimal numbers (the default is false).
  */
  @property void scanHexDollar(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanHexDollar = propval;
  }

  /**
      Get `scanStringSq` field.
      Returns: specifies if strings can be enclosed in single
            quotes (the default is true).
  */
  @property uint scanStringSq()
  {
    return (cast(GScannerConfig*)this._cPtr).scanStringSq;
  }

  /**
      Set `scanStringSq` field.
      Params:
        propval = specifies if strings can be enclosed in single
              quotes (the default is true).
  */
  @property void scanStringSq(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanStringSq = propval;
  }

  /**
      Get `scanStringDq` field.
      Returns: specifies if strings can be enclosed in double
            quotes (the default is true).
  */
  @property uint scanStringDq()
  {
    return (cast(GScannerConfig*)this._cPtr).scanStringDq;
  }

  /**
      Set `scanStringDq` field.
      Params:
        propval = specifies if strings can be enclosed in double
              quotes (the default is true).
  */
  @property void scanStringDq(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scanStringDq = propval;
  }

  /**
      Get `numbers2Int` field.
      Returns: specifies if binary, octal and hexadecimal numbers
            are reported as `G_TOKEN_INT` (the default is true).
  */
  @property uint numbers2Int()
  {
    return (cast(GScannerConfig*)this._cPtr).numbers2Int;
  }

  /**
      Set `numbers2Int` field.
      Params:
        propval = specifies if binary, octal and hexadecimal numbers
              are reported as `G_TOKEN_INT` (the default is true).
  */
  @property void numbers2Int(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).numbers2Int = propval;
  }

  /**
      Get `int2Float` field.
      Returns: specifies if all numbers are reported as `G_TOKEN_FLOAT`
            (the default is false).
  */
  @property uint int2Float()
  {
    return (cast(GScannerConfig*)this._cPtr).int2Float;
  }

  /**
      Set `int2Float` field.
      Params:
        propval = specifies if all numbers are reported as `G_TOKEN_FLOAT`
              (the default is false).
  */
  @property void int2Float(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).int2Float = propval;
  }

  /**
      Get `identifier2String` field.
      Returns: specifies if identifiers are reported as strings
            (the default is false).
  */
  @property uint identifier2String()
  {
    return (cast(GScannerConfig*)this._cPtr).identifier2String;
  }

  /**
      Set `identifier2String` field.
      Params:
        propval = specifies if identifiers are reported as strings
              (the default is false).
  */
  @property void identifier2String(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).identifier2String = propval;
  }

  /**
      Get `char2Token` field.
      Returns: specifies if characters are reported by setting
            `token = ch` or as `G_TOKEN_CHAR` (the default is true).
  */
  @property uint char2Token()
  {
    return (cast(GScannerConfig*)this._cPtr).char2Token;
  }

  /**
      Set `char2Token` field.
      Params:
        propval = specifies if characters are reported by setting
              `token = ch` or as `G_TOKEN_CHAR` (the default is true).
  */
  @property void char2Token(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).char2Token = propval;
  }

  /**
      Get `symbol2Token` field.
      Returns: specifies if symbols are reported by setting
            `token = v_symbol` or as `G_TOKEN_SYMBOL` (the default is false).
  */
  @property uint symbol2Token()
  {
    return (cast(GScannerConfig*)this._cPtr).symbol2Token;
  }

  /**
      Set `symbol2Token` field.
      Params:
        propval = specifies if symbols are reported by setting
              `token = v_symbol` or as `G_TOKEN_SYMBOL` (the default is false).
  */
  @property void symbol2Token(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).symbol2Token = propval;
  }

  /**
      Get `scope0Fallback` field.
      Returns: specifies if a symbol is searched for in the
            default scope in addition to the current scope (the default is false).
  */
  @property uint scope0Fallback()
  {
    return (cast(GScannerConfig*)this._cPtr).scope0Fallback;
  }

  /**
      Set `scope0Fallback` field.
      Params:
        propval = specifies if a symbol is searched for in the
              default scope in addition to the current scope (the default is false).
  */
  @property void scope0Fallback(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).scope0Fallback = propval;
  }

  /**
      Get `storeInt64` field.
      Returns: use value.v_int64 rather than v_int
  */
  @property uint storeInt64()
  {
    return (cast(GScannerConfig*)this._cPtr).storeInt64;
  }

  /**
      Set `storeInt64` field.
      Params:
        propval = use value.v_int64 rather than v_int
  */
  @property void storeInt64(uint propval)
  {
    (cast(GScannerConfig*)this._cPtr).storeInt64 = propval;
  }
}
