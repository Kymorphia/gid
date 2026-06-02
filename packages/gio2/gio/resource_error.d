/// Module for [ResourceError] enum namespace
module gio.resource_error;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.types;

/// Namespace for [ResourceError] enum
struct ResourceError
{
  alias Enum = gio.types.ResourceError; ///

  /**
      Gets the #GResource Error Quark.
      Returns: a #GQuark
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = g_resource_error_quark();
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
    super(gio.resource_error.ResourceError.quark, cast(int)code, msg);
  }

  alias Code = gio.types.ResourceError;
}
