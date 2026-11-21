/// Module for [SerializationError] enum namespace
module gid.gsk4.serialization_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.types;

/// Namespace for [SerializationError] enum
struct SerializationError
{
  alias Enum = gid.gsk4.types.SerializationError; ///

  /**
      Registers an error quark for [gid.gsk4.render_node.RenderNode] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gsk_serialization_error_quark();
    return _retval;
  }
}

class SerializationException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gsk4.serialization_error.SerializationError.quark, cast(int)code, msg);
  }

  alias Code = gid.gsk4.types.SerializationError;
}
