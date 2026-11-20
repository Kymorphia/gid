/// Module for [Hmac] class
module glib.hmac;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/** */
class Hmac : gobject.boxed.BoxedWrap!(g_hmac_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Hmac self() nothrow
  {
    return this;
  }

  /** */
  this(glib.types.ChecksumType digestType, ubyte[] key) nothrow
  {
    GHmac* _cretval;
    size_t _keyLen;
    if (key)
      _keyLen = cast(size_t)key.length;

    auto _key = cast(ubyte*)key.ptr;
    _cretval = g_hmac_new(digestType, _key, _keyLen);
    this(_cretval, Yes.Take);
  }

  /** */
  glib.hmac.Hmac copy() nothrow
  {
    GHmac* _cretval;
    _cretval = g_hmac_copy(cast(const(GHmac)*)this._cPtr);
    auto _retval = _cretval ? new glib.hmac.Hmac(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void getDigest(ref ubyte[] buffer) nothrow
  {
    size_t _digestLen;
    _digestLen = cast(size_t)buffer.length;
    g_hmac_get_digest(cast(GHmac*)this._cPtr, buffer.ptr, &_digestLen);
  }

  /** */
  string getString() nothrow
  {
    const(char)* _cretval;
    _cretval = g_hmac_get_string(cast(GHmac*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  void update(ubyte[] data) nothrow
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    g_hmac_update(cast(GHmac*)this._cPtr, _data, _length);
  }
}
