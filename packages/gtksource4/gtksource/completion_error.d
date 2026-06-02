/// Module for [CompletionError] enum namespace
module gtksource.completion_error;

import gid.gid;
import glib.error;
import glib.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/// Namespace for [CompletionError] enum
struct CompletionError
{
  alias Enum = gtksource.types.CompletionError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_source_completion_error_quark();
    return _retval;
  }
}

class CompletionException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtksource.completion_error.CompletionError.quark, cast(int)code, msg);
  }

  alias Code = gtksource.types.CompletionError;
}
