/// Module for [LayoutDeserializeError] enum namespace
module pango.layout_deserialize_error;

import gid.gid;
import glib.error;
import glib.types;
import pango.c.functions;
import pango.c.types;
import pango.types;

/// Namespace for [LayoutDeserializeError] enum
struct LayoutDeserializeError
{
  alias Enum = pango.types.LayoutDeserializeError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = pango_layout_deserialize_error_quark();
    return _retval;
  }
}

class LayoutDeserializeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(pango.layout_deserialize_error.LayoutDeserializeError.quark, cast(int)code, msg);
  }

  alias Code = pango.types.LayoutDeserializeError;
}
