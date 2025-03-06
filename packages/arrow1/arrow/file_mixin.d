module arrow.file_mixin;

public import arrow.file_iface_proxy;
public import arrow.c.functions;
public import arrow.c.types;
public import arrow.types;
public import gid.gid;
public import glib.error;

/** */
template FileT()
{

  /** */
  override bool close()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_file_close(cast(GArrowFile*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  override arrow.types.FileMode getMode()
  {
    GArrowFileMode _cretval;
    _cretval = garrow_file_get_mode(cast(GArrowFile*)cPtr);
    arrow.types.FileMode _retval = cast(arrow.types.FileMode)_cretval;
    return _retval;
  }

  /** */
  override bool isClosed()
  {
    bool _retval;
    _retval = garrow_file_is_closed(cast(GArrowFile*)cPtr);
    return _retval;
  }

  /** */
  override long tell()
  {
    long _retval;
    GError *_err;
    _retval = garrow_file_tell(cast(GArrowFile*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
