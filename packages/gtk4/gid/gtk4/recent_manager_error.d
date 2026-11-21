/// Module for [RecentManagerError] enum namespace
module gid.gtk4.recent_manager_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [RecentManagerError] enum
struct RecentManagerError
{
  alias Enum = gid.gtk4.types.RecentManagerError; ///

  /**
      Registers an error quark for [gid.gtk4.recent_manager.RecentManager] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_recent_manager_error_quark();
    return _retval;
  }
}

class RecentManageException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.recent_manager_error.RecentManagerError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.RecentManagerError;
}
