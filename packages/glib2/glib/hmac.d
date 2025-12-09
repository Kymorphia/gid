/// Module for [Hmac] class
module glib.hmac;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    HMACs should be used when producing a cookie or hash based on data
    and a key. Simple mechanisms for using SHA1 and other algorithms to
    digest a key and data together are vulnerable to various security
    issues.
    [HMAC](http://en.wikipedia.org/wiki/HMAC)
    uses algorithms like SHA1 in a secure way to produce a digest of a
    key and data.
    
    Both the key and data are arbitrary byte arrays of bytes or characters.
    
    Support for HMAC Digests has been added in GLib 2.30, and support for SHA-512
    in GLib 2.42. Support for SHA-384 was added in GLib 2.52.
    
    To create a new [glib.hmac.Hmac], use [glib.hmac.Hmac.new_]. To free a [glib.hmac.Hmac], use
    [glib.hmac.Hmac.unref].
*/
class Hmac : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_hmac_get_type != &gidSymbolNotFound ? g_hmac_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Hmac self()
  {
    return this;
  }

  /**
      Creates a new #GHmac, using the digest algorithm digest_type.
      If the digest_type is not known, null is returned.
      A #GHmac can be used to compute the HMAC of a key and an
      arbitrary binary blob, using different hashing algorithms.
      
      A #GHmac works by feeding a binary blob through [glib.hmac.Hmac.update]
      until the data is complete; the digest can then be extracted
      using [glib.hmac.Hmac.getString], which will return the checksum as a
      hexadecimal string; or [glib.hmac.Hmac.getDigest], which will return a
      array of raw bytes. Once either [glib.hmac.Hmac.getString] or
      [glib.hmac.Hmac.getDigest] have been called on a #GHmac, the HMAC
      will be closed and it won't be possible to call [glib.hmac.Hmac.update]
      on it anymore.
      
      Support for digests of type `G_CHECKSUM_SHA512` has been added in GLib 2.42.
      Support for `G_CHECKSUM_SHA384` was added in GLib 2.52.
  
      Params:
        digestType = the desired type of digest
        key = the key for the HMAC
      Returns: the newly created #GHmac, or null.
          Use [glib.hmac.Hmac.unref] to free the memory allocated by it.
  */
  this(glib.types.ChecksumType digestType, ubyte[] key)
  {
    GHmac* _cretval;
    size_t _keyLen;
    if (key)
      _keyLen = cast(size_t)key.length;

    auto _key = cast(const(ubyte)*)key.ptr;
    _cretval = g_hmac_new(digestType, _key, _keyLen);
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GHmac. If hmac has been closed, by calling
      [glib.hmac.Hmac.getString] or [glib.hmac.Hmac.getDigest], the copied
      HMAC will be closed as well.
      Returns: the copy of the passed #GHmac. Use [glib.hmac.Hmac.unref]
          when finished using it.
  */
  glib.hmac.Hmac copy()
  {
    GHmac* _cretval;
    _cretval = g_hmac_copy(cast(const(GHmac)*)this._cPtr);
    auto _retval = _cretval ? new glib.hmac.Hmac(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the digest from checksum as a raw binary array and places it
      into buffer. The size of the digest depends on the type of checksum.
      
      Once this function has been called, the #GHmac is closed and can
      no longer be updated with [glib.checksum.Checksum.update].
  
      Params:
        buffer = output buffer
  */
  void getDigest(ref ubyte[] buffer)
  {
    size_t _digestLen;
    _digestLen = cast(size_t)buffer.length;
    g_hmac_get_digest(cast(GHmac*)this._cPtr, buffer.ptr, &_digestLen);
  }

  /**
      Gets the HMAC as a hexadecimal string.
      
      Once this function has been called the #GHmac can no longer be
      updated with [glib.hmac.Hmac.update].
      
      The hexadecimal characters will be lower case.
      Returns: the hexadecimal representation of the HMAC. The
          returned string is owned by the HMAC and should not be modified
          or freed.
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = g_hmac_get_string(cast(GHmac*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Feeds data into an existing #GHmac.
      
      The HMAC must still be open, that is [glib.hmac.Hmac.getString] or
      [glib.hmac.Hmac.getDigest] must not have been called on hmac.
  
      Params:
        data = buffer used to compute the checksum
  */
  void update(ubyte[] data)
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    g_hmac_update(cast(GHmac*)this._cPtr, _data, _length);
  }
}
