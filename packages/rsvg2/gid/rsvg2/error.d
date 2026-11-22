/// Module for [Error] enum namespace
module gid.rsvg2.error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.rsvg2.c.functions;
import gid.rsvg2.c.types;
import gid.rsvg2.types;

/// Namespace for [Error] enum
struct Error
{
  alias Enum = gid.rsvg2.types.Error; ///

  /**
      The error domain for RSVG
      Returns: The error domain
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = rsvg_error_quark();
    return _retval;
  }
}

class RsvgException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.rsvg2.error.Error.quark, cast(int)code, msg);
  }

  alias Code = gid.rsvg2.types.Error;
}
