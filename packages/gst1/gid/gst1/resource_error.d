/// Module for [ResourceError] enum namespace
module gid.gst1.resource_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [ResourceError] enum
struct ResourceError
{
  alias Enum = gid.gst1.types.ResourceError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_resource_error_quark();
    return _retval;
  }
}

class ResourceException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.resource_error.ResourceError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.ResourceError;
}
