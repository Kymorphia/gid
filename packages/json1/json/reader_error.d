/// Module for [ReaderError] enum namespace
module json.reader_error;

import gid.gid;
import glib.error;
import glib.types;
import json.c.functions;
import json.c.types;
import json.types;

/// Namespace for [ReaderError] enum
struct ReaderError
{
  alias Enum = json.types.ReaderError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = json_reader_error_quark();
    return _retval;
  }
}

class ReadeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(json.reader_error.ReaderError.quark, cast(int)code, msg);
  }

  alias Code = json.types.ReaderError;
}
