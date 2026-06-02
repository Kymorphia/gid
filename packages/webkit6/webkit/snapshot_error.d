/// Module for [SnapshotError] enum namespace
module webkit.snapshot_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [SnapshotError] enum
struct SnapshotError
{
  alias Enum = webkit.types.SnapshotError; ///

  /**
      Gets the quark for the domain of page snapshot errors.
      Returns: snapshot error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_snapshot_error_quark();
    return _retval;
  }
}

class SnapshotException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.snapshot_error.SnapshotError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.SnapshotError;
}
