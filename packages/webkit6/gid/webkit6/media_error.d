/// Module for [MediaError] enum namespace
module gid.webkit6.media_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [MediaError] enum
struct MediaError
{
  alias Enum = gid.webkit6.types.MediaError; ///

  /**
      Gets the quark for the domain of media errors.
      Returns: media error domin.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_media_error_quark();
    return _retval;
  }
}

class MediaException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.media_error.MediaError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.MediaError;
}
