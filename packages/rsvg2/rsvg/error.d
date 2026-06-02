/// Module for [Error] enum namespace
module rsvg.error;

import gid.gid;
import glib.error;
import glib.types;
import rsvg.c.functions;
import rsvg.c.types;
import rsvg.types;

/// Namespace for [Error] enum
struct Error
{
  alias Enum = rsvg.types.Error; ///

  /**
      The error domain for RSVG
      Returns: The error domain
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = rsvg_error_quark();
    return _retval;
  }
}

class RsvgException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(rsvg.error.Error.quark, cast(int)code, msg);
  }

  alias Code = rsvg.types.Error;
}
