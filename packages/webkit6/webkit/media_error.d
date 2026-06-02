/// Module for [MediaError] enum namespace
module webkit.media_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [MediaError] enum
struct MediaError
{
  alias Enum = webkit.types.MediaError; ///

  /**
      Gets the quark for the domain of media errors.
      Returns: media error domin.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_media_error_quark();
    return _retval;
  }
}

class MediaException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.media_error.MediaError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.MediaError;
}
