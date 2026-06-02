/// Module for [TocEntryType] enum namespace
module gst.toc_entry_type;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [TocEntryType] enum
struct TocEntryType
{
  alias Enum = gst.types.TocEntryType; ///

  /**
      Converts type to a string representation.
  
      Params:
        type = a #GstTocEntryType.
      Returns: Returns a human-readable string for type. This string is
           only for debugging purpose and should not be displayed in a user
           interface.
  */
  static string getNick(gst.types.TocEntryType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_toc_entry_type_get_nick(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
