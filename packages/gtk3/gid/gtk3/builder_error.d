/// Module for [BuilderError] enum namespace
module gid.gtk3.builder_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/// Namespace for [BuilderError] enum
struct BuilderError
{
  alias Enum = gid.gtk3.types.BuilderError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_builder_error_quark();
    return _retval;
  }
}

class BuildeException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk3.builder_error.BuilderError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk3.types.BuilderError;
}
