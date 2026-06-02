/// Module for [DownloadError] enum namespace
module webkit.download_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [DownloadError] enum
struct DownloadError
{
  alias Enum = webkit.types.DownloadError; ///

  /**
      Gets the quark for the domain of download errors.
      Returns: download error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_download_error_quark();
    return _retval;
  }
}

class DownloadException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.download_error.DownloadError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.DownloadError;
}
