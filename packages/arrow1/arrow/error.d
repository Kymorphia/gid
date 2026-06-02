/// Module for [Error] enum namespace
module arrow.error;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [Error] enum
struct Error
{
  alias Enum = arrow.types.Error; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = garrow_error_quark();
    return _retval;
  }
}

class ArrowException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(arrow.error.Error.quark, cast(int)code, msg);
  }

  alias Code = arrow.types.Error;
}
