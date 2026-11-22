/// Module for [URIError] enum namespace
module gid.gst1.urierror;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [URIError] enum
struct URIError
{
  alias Enum = gid.gst1.types.URIError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_uri_error_quark();
    return _retval;
  }
}

class URIException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.urierror.URIError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.URIError;
}
