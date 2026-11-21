/// Module for [TocEntryType] enum namespace
module gid.gst1.toc_entry_type;

import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [TocEntryType] enum
struct TocEntryType
{
  alias Enum = gid.gst1.types.TocEntryType; ///

  /**
      Converts type to a string representation.
  
      Params:
        type = a #GstTocEntryType.
      Returns: Returns a human-readable string for type. This string is
           only for debugging purpose and should not be displayed in a user
           interface.
  */
  static string getNick(gid.gst1.types.TocEntryType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_toc_entry_type_get_nick(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
