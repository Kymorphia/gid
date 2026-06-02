/// Module for [SerializationError] enum namespace
module gsk.serialization_error;

import gid.gid;
import glib.error;
import glib.types;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/// Namespace for [SerializationError] enum
struct SerializationError
{
  alias Enum = gsk.types.SerializationError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gsk_serialization_error_quark();
    return _retval;
  }
}

class SerializationException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gsk.serialization_error.SerializationError.quark, cast(int)code, msg);
  }

  alias Code = gsk.types.SerializationError;
}
