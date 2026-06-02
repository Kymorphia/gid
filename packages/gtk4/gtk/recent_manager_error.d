/// Module for [RecentManagerError] enum namespace
module gtk.recent_manager_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [RecentManagerError] enum
struct RecentManagerError
{
  alias Enum = gtk.types.RecentManagerError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_recent_manager_error_quark();
    return _retval;
  }
}

class RecentManageException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.recent_manager_error.RecentManagerError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.RecentManagerError;
}
