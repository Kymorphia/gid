/// Module for [ResourceError] enum namespace
module gid.gio2.resource_error;

import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [ResourceError] enum
struct ResourceError
{
  alias Enum = gid.gio2.types.ResourceError; ///

  /**
      Gets the [gid.gio2.resource.Resource] Error Quark.
      Returns: a [gid.glib2.types.uint]
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_resource_error_quark();
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
    super(gid.gio2.resource_error.ResourceError.quark, cast(int)code, msg);
  }

  alias Code = gid.gio2.types.ResourceError;
}
