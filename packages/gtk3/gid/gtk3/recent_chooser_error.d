/// Module for [RecentChooserError] enum namespace
module gid.gtk3.recent_chooser_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/// Namespace for [RecentChooserError] enum
struct RecentChooserError
{
  alias Enum = gid.gtk3.types.RecentChooserError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_recent_chooser_error_quark();
    return _retval;
  }
}

class RecentChooseException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk3.recent_chooser_error.RecentChooserError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk3.types.RecentChooserError;
}
