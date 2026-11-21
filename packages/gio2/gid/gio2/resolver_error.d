/// Module for [ResolverError] enum namespace
module gid.gio2.resolver_error;

import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [ResolverError] enum
struct ResolverError
{
  alias Enum = gid.gio2.types.ResolverError; ///

  /**
      Gets the #GResolver Error Quark.
      Returns: a #GQuark.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_resolver_error_quark();
    return _retval;
  }
}

class ResolveException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gio2.resolver_error.ResolverError.quark, cast(int)code, msg);
  }

  alias Code = gid.gio2.types.ResolverError;
}
