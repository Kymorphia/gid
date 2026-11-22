/// Module for [PathError] enum namespace
module gid.json1.path_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.types;

/// Namespace for [PathError] enum
struct PathError
{
  alias Enum = gid.json1.types.PathError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = json_path_error_quark();
    return _retval;
  }
}

class PathException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.json1.path_error.PathError.quark, cast(int)code, msg);
  }

  alias Code = gid.json1.types.PathError;
}
