/// Module for [PathError] enum namespace
module json.path_error;

import gid.gid;
import glib.error;
import glib.types;
import json.c.functions;
import json.c.types;
import json.types;

/// Namespace for [PathError] enum
struct PathError
{
  alias Enum = json.types.PathError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = json_path_error_quark();
    return _retval;
  }
}

class PathException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(json.path_error.PathError.quark, cast(int)code, msg);
  }

  alias Code = json.types.PathError;
}
