/// Module for [StreamError] enum namespace
module gst.stream_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [StreamError] enum
struct StreamError
{
  alias Enum = gst.types.StreamError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_stream_error_quark();
    return _retval;
  }
}

class StreamException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.stream_error.StreamError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.StreamError;
}
