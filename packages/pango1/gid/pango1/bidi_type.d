/// Module for [BidiType] enum namespace
module gid.pango1.bidi_type;

import gid.core.utils;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/// Namespace for [BidiType] enum
struct BidiType
{
  alias Enum = gid.pango1.types.BidiType; ///

  /**
      Determines the bidirectional type of a character.
      
      The bidirectional type is specified in the Unicode Character Database.
      
      A simplified version of this function is available as `funcunichar_direction`.
  
      Params:
        ch = a Unicode character
      Returns: the bidirectional character type, as used in the
        Unicode bidirectional algorithm.
  */
  static gid.pango1.types.BidiType forUnichar(dchar ch) nothrow
  {
    PangoBidiType _cretval;
    _cretval = pango_bidi_type_for_unichar(ch);
    gid.pango1.types.BidiType _retval = cast(gid.pango1.types.BidiType)_cretval;
    return _retval;
  }
}
