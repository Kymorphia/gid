/// Module for [LayoutDeserializeError] enum namespace
module gid.pango1.layout_deserialize_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/// Namespace for [LayoutDeserializeError] enum
struct LayoutDeserializeError
{
  alias Enum = gid.pango1.types.LayoutDeserializeError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = pango_layout_deserialize_error_quark();
    return _retval;
  }
}

class LayoutDeserializeException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.pango1.layout_deserialize_error.LayoutDeserializeError.quark, cast(int)code, msg);
  }

  alias Code = gid.pango1.types.LayoutDeserializeError;
}
