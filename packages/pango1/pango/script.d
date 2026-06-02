/// Module for [Script] enum namespace
module pango.script;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.language;
import pango.types;

/// Namespace for [Script] enum
struct Script
{
  alias Enum = pango.types.Script; ///

  /**
      Looks up the script for a particular character.
      
      The script of a character is defined by
      [Unicode Standard Annex 24: Script names](http://www.unicode.org/reports/tr24/).
      
      No check is made for ch being a valid Unicode character; if you pass
      in invalid character, the result is undefined.
      
      Note that while the return type of this function is declared
      as [pango.types.Script], as of Pango 1.18, this function simply returns
      the return value of `funcGLib.unichar_get_script`. Callers must be
      prepared to handle unknown values.
  
      Params:
        ch = a Unicode character
      Returns: the [pango.types.Script] for the character.
  
      Deprecated: Use [glib.global.unicharGetScript]
  */
  static pango.types.Script forUnichar(dchar ch) nothrow
  {
    PangoScript _cretval;
    _cretval = pango_script_for_unichar(ch);
    pango.types.Script _retval = cast(pango.types.Script)_cretval;
    return _retval;
  }

  /**
      Finds a language tag that is reasonably representative of script.
      
      The language will usually be the most widely spoken or used language
      written in that script: for instance, the sample language for
      [pango.types.Script.Cyrillic] is ru (Russian), the sample language for
      [pango.types.Script.Arabic] is ar.
      
      For some scripts, no sample language will be returned because
      there is no language that is sufficiently representative. The
      best example of this is [pango.types.Script.Han], where various different
      variants of written Chinese, Japanese, and Korean all use
      significantly different sets of Han characters and forms
      of shared characters. No sample language can be provided
      for many historical scripts as well.
      
      As of 1.18, this function checks the environment variables
      `PANGO_LANGUAGE` and `LANGUAGE` (checked in that order) first.
      If one of them is set, it is parsed as a list of language tags
      separated by colons or other separators. This function
      will return the first language in the parsed list that Pango
      believes may use script for writing. This last predicate
      is tested using [pango.language.Language.includesScript]. This can
      be used to control Pango's font selection for non-primary
      languages. For example, a `PANGO_LANGUAGE` enviroment variable
      set to "en:fa" makes Pango choose fonts suitable for Persian (fa)
      instead of Arabic (ar) when a segment of Arabic text is found
      in an otherwise non-Arabic text. The same trick can be used to
      choose a default language for [pango.types.Script.Han] when setting
      context language is not feasible.
  
      Params:
        script = a [pango.types.Script]
      Returns: a [pango.language.Language] that is representative
          of the script
  */
  static pango.language.Language getSampleLanguage(pango.types.Script script) nothrow
  {
    PangoLanguage* _cretval;
    _cretval = pango_script_get_sample_language(script);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
