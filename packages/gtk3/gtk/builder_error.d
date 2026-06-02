/// Module for [BuilderError] enum namespace
module gtk.builder_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [BuilderError] enum
struct BuilderError
{
  alias Enum = gtk.types.BuilderError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_builder_error_quark();
    return _retval;
  }
}

class BuildeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.builder_error.BuilderError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.BuilderError;
}
