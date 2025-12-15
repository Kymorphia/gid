/// Module for [WritableFile] interface mixin
module arrow.writable_file_mixin;

public import arrow.writable_file_iface_proxy;
public import arrow.c.functions;
public import arrow.c.types;
public import arrow.types;
public import gid.gid;
public import glib.error;

/** */
template WritableFileT()
{

  /** */
  override bool writeAt(long position, ubyte[] data)
  {
    bool _retval;
    long _nBytes;
    if (data)
      _nBytes = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = cast(bool)garrow_writable_file_write_at(cast(GArrowWritableFile*)this._cPtr, position, _data, _nBytes, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
