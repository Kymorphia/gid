/// Module for [ResourceError] enum namespace
module gst.resource_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [ResourceError] enum
struct ResourceError
{
  alias Enum = gst.types.ResourceError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_resource_error_quark();
    return _retval;
  }
}

class ResourceException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.resource_error.ResourceError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.ResourceError;
}
