/// Module for [Hmac] class
module gid.glib2.hmac;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;
import gid.gobject2.boxed;

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
    
    To create a new [gid.glib2.hmac.Hmac], use [gid.glib2.hmac.Hmac.new_]. To free a [gid.glib2.hmac.Hmac], use
    [gid.glib2.hmac.Hmac.unref].
*/
class Hmac : gid.gobject2.boxed.BoxedWrap!(g_hmac_get_type)
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

  /**
      Creates a new #GHmac, using the digest algorithm digest_type.
      If the digest_type is not known, null is returned.
      A #GHmac can be used to compute the HMAC of a key and an
      arbitrary binary blob, using different hashing algorithms.
      
      A #GHmac works by feeding a binary blob through [gid.glib2.hmac.Hmac.update]
      until the data is complete; the digest can then be extracted
      using [gid.glib2.hmac.Hmac.getString], which will return the checksum as a
      hexadecimal string; or [gid.glib2.hmac.Hmac.getDigest], which will return a
      array of raw bytes. Once either [gid.glib2.hmac.Hmac.getString] or
      [gid.glib2.hmac.Hmac.getDigest] have been called on a #GHmac, the HMAC
      will be closed and it won't be possible to call [gid.glib2.hmac.Hmac.update]
      on it anymore.
      
      Support for digests of type [gid.glib2.types.ChecksumType.Sha512] has been added in GLib 2.42.
      Support for [gid.glib2.types.ChecksumType.Sha384] was added in GLib 2.52.
  
      Params:
        digestType = the desired type of digest
        key = the key for the HMAC
      Returns: the newly created #GHmac, or null.
          Use [gid.glib2.hmac.Hmac.unref] to free the memory allocated by it.
  */
  this(gid.glib2.types.ChecksumType digestType, ubyte[] key) nothrow
  {
    GHmac* _cretval;
    size_t _keyLen;
    if (key)
      _keyLen = cast(size_t)key.length;

    auto _key = cast(ubyte*)key.ptr;
    _cretval = g_hmac_new(digestType, _key, _keyLen);
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GHmac. If hmac has been closed, by calling
      [gid.glib2.hmac.Hmac.getString] or [gid.glib2.hmac.Hmac.getDigest], the copied
      HMAC will be closed as well.
      Returns: the copy of the passed #GHmac. Use [gid.glib2.hmac.Hmac.unref]
          when finished using it.
  */
  gid.glib2.hmac.Hmac copy() nothrow
  {
    GHmac* _cretval;
    _cretval = g_hmac_copy(cast(const(GHmac)*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.hmac.Hmac(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the digest from checksum as a raw binary array and places it
      into buffer. The size of the digest depends on the type of checksum.
      
      Once this function has been called, the #GHmac is closed and can
      no longer be updated with [gid.glib2.checksum.Checksum.update].
  
      Params:
        buffer = output buffer
  */
  void getDigest(ref ubyte[] buffer) nothrow
  {
    size_t _digestLen;
    _digestLen = cast(size_t)buffer.length;
    g_hmac_get_digest(cast(GHmac*)this._cPtr, buffer.ptr, &_digestLen);
  }

  /**
      Gets the HMAC as a hexadecimal string.
      
      Once this function has been called the #GHmac can no longer be
      updated with [gid.glib2.hmac.Hmac.update].
      
      The hexadecimal characters will be lower case.
      Returns: the hexadecimal representation of the HMAC. The
          returned string is owned by the HMAC and should not be modified
          or freed.
  */
  string getString() nothrow
  {
    const(char)* _cretval;
    _cretval = g_hmac_get_string(cast(GHmac*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Feeds data into an existing #GHmac.
      
      The HMAC must still be open, that is [gid.glib2.hmac.Hmac.getString] or
      [gid.glib2.hmac.Hmac.getDigest] must not have been called on hmac.
  
      Params:
        data = buffer used to compute the checksum
  */
  void update(ubyte[] data) nothrow
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    g_hmac_update(cast(GHmac*)this._cPtr, _data, _length);
  }
}
