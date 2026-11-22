/// Module for [CompletionError] enum namespace
module gid.gtksource4.completion_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/// Namespace for [CompletionError] enum
struct CompletionError
{
  alias Enum = gid.gtksource4.types.CompletionError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_source_completion_error_quark();
    return _retval;
  }
}

class CompletionException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtksource4.completion_error.CompletionError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtksource4.types.CompletionError;
}
