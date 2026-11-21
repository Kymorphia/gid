/// Module for [ReaderError] enum namespace
module gid.json1.reader_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.types;

/// Namespace for [ReaderError] enum
struct ReaderError
{
  alias Enum = gid.json1.types.ReaderError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = json_reader_error_quark();
    return _retval;
  }
}

class ReadeException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.json1.reader_error.ReaderError.quark, cast(int)code, msg);
  }

  alias Code = gid.json1.types.ReaderError;
}
