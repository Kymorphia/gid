/// Global functions for arrow1 library
module arrow.global;

import arrow.c.functions;
import arrow.c.types;
import arrow.s3_global_options;
import arrow.types;
import gid.gid;
import glib.error;


/**
    Finalize the S3 APIs.
    Returns: true on success, false on error.
    Throws: [ErrorWrap]
*/
bool s3Finalize()
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)garrow_s3_finalize(&_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Normally, you don't need to call this function because the S3 APIs
    are initialized with the default options automatically. If you want
    to call this function, you must call this function before you use
    any #GArrowS3FileSystem related APIs.

    Params:
      options = Options to initialize the S3 APIs.
    Returns: true on success, false on error.
    Throws: [ErrorWrap]
*/
bool s3Initialize(arrow.s3_global_options.S3GlobalOptions options = null)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)garrow_s3_initialize(options ? cast(GArrowS3GlobalOptions*)options._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/** */
bool s3IsEnabled()
{
  bool _retval;
  _retval = cast(bool)garrow_s3_is_enabled();
  return _retval;
}
