/// Module for [URIError] enum namespace
module gst.urierror;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [URIError] enum
struct URIError
{
  alias Enum = gst.types.URIError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_uri_error_quark();
    return _retval;
  }
}

class URIException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.urierror.URIError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.URIError;
}
