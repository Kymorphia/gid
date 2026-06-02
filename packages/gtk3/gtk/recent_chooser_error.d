/// Module for [RecentChooserError] enum namespace
module gtk.recent_chooser_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [RecentChooserError] enum
struct RecentChooserError
{
  alias Enum = gtk.types.RecentChooserError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_recent_chooser_error_quark();
    return _retval;
  }
}

class RecentChooseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.recent_chooser_error.RecentChooserError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.RecentChooserError;
}
