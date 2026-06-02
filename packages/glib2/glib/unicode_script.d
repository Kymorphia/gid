/// Module for [UnicodeScript] enum namespace
module glib.unicode_script;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/// Namespace for [UnicodeScript] enum
struct UnicodeScript
{
  alias Enum = glib.types.UnicodeScript; ///

  /**
      Looks up the Unicode script for iso15924.  ISO 15924 assigns four-letter
      codes to scripts.  For example, the code for Arabic is 'Arab'.
      This function accepts four letter codes encoded as a guint32 in a
      big-endian fashion.  That is, the code expected for Arabic is
      0x41726162 (0x41 is ASCII code for 'A', 0x72 is ASCII code for 'r', etc).
      
      See
      [Codes for the representation of names of scripts](http://unicode.org/iso15924/codelists.html)
      for details.
  
      Params:
        iso15924 = a Unicode script
      Returns: the Unicode script for iso15924, or
          of [glib.types.UnicodeScript.InvalidCode] if iso15924 is zero and
          [glib.types.UnicodeScript.Unknown] if iso15924 is unknown.
  */
  static glib.types.UnicodeScript fromIso15924(uint iso15924) nothrow
  {
    GUnicodeScript _cretval;
    _cretval = g_unicode_script_from_iso15924(iso15924);
    glib.types.UnicodeScript _retval = cast(glib.types.UnicodeScript)_cretval;
    return _retval;
  }

  /**
      Looks up the ISO 15924 code for script.  ISO 15924 assigns four-letter
      codes to scripts.  For example, the code for Arabic is 'Arab'.  The
      four letter codes are encoded as a guint32 by this function in a
      big-endian fashion.  That is, the code returned for Arabic is
      0x41726162 (0x41 is ASCII code for 'A', 0x72 is ASCII code for 'r', etc).
      
      See
      [Codes for the representation of names of scripts](http://unicode.org/iso15924/codelists.html)
      for details.
  
      Params:
        script = a Unicode script
      Returns: the ISO 15924 code for script, encoded as an integer,
          of zero if script is [glib.types.UnicodeScript.InvalidCode] or
          ISO 15924 code 'Zzzz' (script code for UNKNOWN) if script is not understood.
  */
  static uint toIso15924(glib.types.UnicodeScript script) nothrow
  {
    uint _retval;
    _retval = g_unicode_script_to_iso15924(script);
    return _retval;
  }
}
