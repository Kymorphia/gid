/// Module for [Language] class
module pango.language;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.language.Language] structure is used to
    represent a language.
    
    [pango.language.Language] pointers can be efficiently
    copied and compared with each other.
*/
class Language : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_language_get_type != &gidSymbolNotFound ? pango_language_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Language self()
  {
    return this;
  }

  /**
      Get a string that is representative of the characters needed to
      render a particular language.
      
      The sample text may be a pangram, but is not necessarily. It is chosen
      to be demonstrative of normal text in the language, as well as exposing
      font feature requirements unique to the language. It is suitable for use
      as sample text in a font selection dialog.
      
      If language is null, the default language as found by
      [pango.language.Language.getDefault] is used.
      
      If Pango does not have a sample string for language, the classic
      "The quick brown fox..." is returned.  This can be detected by
      comparing the returned pointer value to that returned for (non-existent)
      language code "xx".  That is, compare to:
      
      ```
      pango_language_get_sample_string (pango_language_from_string ("xx"))
      ```
      Returns: the sample string
  */
  string getSampleString()
  {
    const(char)* _cretval;
    _cretval = pango_language_get_sample_string(cast(PangoLanguage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Determines the scripts used to to write language.
      
      If nothing is known about the language tag language,
      or if language is null, then null is returned.
      The list of scripts returned starts with the script that the
      language uses most and continues to the one it uses least.
      
      The value num_script points at will be set to the number
      of scripts in the returned array (or zero if null is returned).
      
      Most languages use only one script for writing, but there are
      some that use two (Latin and Cyrillic for example), and a few
      use three (Japanese for example). Applications should not make
      any assumptions on the maximum number of scripts returned
      though, except that it is positive if the return value is not
      null, and it is a small number.
      
      The [pango.language.Language.includesScript] function uses this
      function internally.
      
      Note: while the return value is declared as [pango.types.Script], the
      returned values are from the [glib.types.UnicodeScript] enumeration, which
      may have more values. Callers need to handle unknown values.
      Returns: An array of [pango.types.Script] values, with the number of entries in
          the array stored in num_scripts, or null if Pango does not have
          any information about this particular language tag (also the case
          if language is null).
  */
  pango.types.Script[] getScripts()
  {
    const(PangoScript)* _cretval;
    int _cretlength;
    _cretval = pango_language_get_scripts(cast(PangoLanguage*)this._cPtr, &_cretlength);
    pango.types.Script[] _retval;

    if (_cretval)
    {
      _retval = new pango.types.Script[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = cast(pango.types.Script)(_cretval[i]);
    }
    return _retval;
  }

  /**
      Determines if script is one of the scripts used to
      write language.
      
      The returned value is conservative; if nothing is known about
      the language tag language, true will be returned, since, as
      far as Pango knows, script might be used to write language.
      
      This routine is used in Pango's itemization process when
      determining if a supplied language tag is relevant to
      a particular section of text. It probably is not useful
      for applications in most circumstances.
      
      This function uses [pango.language.Language.getScripts] internally.
  
      Params:
        script = a [pango.types.Script]
      Returns: true if script is one of the scripts used
          to write language or if nothing is known about language
          (including the case that language is null), false otherwise.
  */
  bool includesScript(pango.types.Script script)
  {
    bool _retval;
    _retval = cast(bool)pango_language_includes_script(cast(PangoLanguage*)this._cPtr, script);
    return _retval;
  }

  /**
      Checks if a language tag matches one of the elements in a list of
      language ranges.
      
      A language tag is considered to match a range in the list if the
      range is '*', the range is exactly the tag, or the range is a prefix
      of the tag, and the character after it in the tag is '-'.
  
      Params:
        rangeList = a list of language ranges, separated by ';', ':',
            ',', or space characters.
            Each element must either be '*', or a RFC 3066 language range
            canonicalized as by [pango.language.Language.fromString]
      Returns: true if a match was found
  */
  bool matches(string rangeList)
  {
    bool _retval;
    const(char)* _rangeList = rangeList.toCString(No.Alloc);
    _retval = cast(bool)pango_language_matches(cast(PangoLanguage*)this._cPtr, _rangeList);
    return _retval;
  }

  /**
      Gets the RFC-3066 format string representing the given language tag.
      
      Returns (transfer none): a string representing the language tag
      Returns: 
  */
  string toString_()
  {
    const(char)* _cretval;
    _cretval = pango_language_to_string(cast(PangoLanguage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Convert a language tag to a [pango.language.Language].
      
      The language tag must be in a RFC-3066 format. [pango.language.Language] pointers
      can be efficiently copied (copy the pointer) and compared with other
      language tags (compare the pointer.)
      
      This function first canonicalizes the string by converting it to
      lowercase, mapping '_' to '-', and stripping all characters other
      than letters and '-'.
      
      Use [pango.language.Language.getDefault] if you want to get the
      [pango.language.Language] for the current locale of the process.
  
      Params:
        language = a string representing a language tag
      Returns: a [pango.language.Language]
  */
  static pango.language.Language fromString(string language = null)
  {
    PangoLanguage* _cretval;
    const(char)* _language = language.toCString(No.Alloc);
    _cretval = pango_language_from_string(_language);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the [pango.language.Language] for the current locale of the process.
      
      On Unix systems, this is the return value is derived from
      `setlocale (LC_CTYPE, NULL)`, and the user can
      affect this through the environment variables LC_ALL, LC_CTYPE or
      LANG (checked in that order). The locale string typically is in
      the form lang_COUNTRY, where lang is an ISO-639 language code, and
      COUNTRY is an ISO-3166 country code. For instance, sv_FI for
      Swedish as written in Finland or pt_BR for Portuguese as written in
      Brazil.
      
      On Windows, the C library does not use any such environment
      variables, and setting them won't affect the behavior of functions
      like ctime(). The user sets the locale through the Regional Options
      in the Control Panel. The C library (in the setlocale() function)
      does not use country and language codes, but country and language
      names spelled out in English.
      However, this function does check the above environment
      variables, and does return a Unix-style locale string based on
      either said environment variables or the thread's current locale.
      
      Your application should call `setlocale(LC_ALL, "")` for the user
      settings to take effect. GTK does this in its initialization
      functions automatically (by calling gtk_set_locale()).
      See the setlocale() manpage for more details.
      
      Note that the default language can change over the life of an application.
      
      Also note that this function will not do the right thing if you
      use per-thread locales with uselocale(). In that case, you should
      just call [pango.language.Language.fromString] yourself.
      Returns: the default language as a [pango.language.Language]
  */
  static pango.language.Language getDefault()
  {
    PangoLanguage* _cretval;
    _cretval = pango_language_get_default();
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the list of languages that the user prefers.
      
      The list is specified by the `PANGO_LANGUAGE` or `LANGUAGE`
      environment variables, in order of preference. Note that this
      list does not necessarily include the language returned by
      [pango.language.Language.getDefault].
      
      When choosing language-specific resources, such as the sample
      text returned by [pango.language.Language.getSampleString],
      you should first try the default language, followed by the
      languages returned by this function.
      Returns: a null-terminated array
          of [pango.language.Language]*
  */
  static pango.language.Language[] getPreferred()
  {
    PangoLanguage** _cretval;
    _cretval = pango_language_get_preferred();
    pango.language.Language[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new pango.language.Language[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new pango.language.Language(cast(void*)_cretval[i], No.Take);
    }
    return _retval;
  }
}
