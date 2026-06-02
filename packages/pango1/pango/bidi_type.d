/// Module for [BidiType] enum namespace
module pango.bidi_type;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.types;

/// Namespace for [BidiType] enum
struct BidiType
{
  alias Enum = pango.types.BidiType; ///

  /**
      Determines the bidirectional type of a character.
      
      The bidirectional type is specified in the Unicode Character Database.
      
      A simplified version of this function is available as `funcunichar_direction`.
  
      Params:
        ch = a Unicode character
      Returns: the bidirectional character type, as used in the
        Unicode bidirectional algorithm.
  */
  static pango.types.BidiType forUnichar(dchar ch) nothrow
  {
    PangoBidiType _cretval;
    _cretval = pango_bidi_type_for_unichar(ch);
    pango.types.BidiType _retval = cast(pango.types.BidiType)_cretval;
    return _retval;
  }
}
