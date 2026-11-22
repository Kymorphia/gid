/// Module for [SnapshotError] enum namespace
module gid.webkit6.snapshot_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [SnapshotError] enum
struct SnapshotError
{
  alias Enum = gid.webkit6.types.SnapshotError; ///

  /**
      Gets the quark for the domain of page snapshot errors.
      Returns: snapshot error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_snapshot_error_quark();
    return _retval;
  }
}

class SnapshotException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.snapshot_error.SnapshotError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.SnapshotError;
}
