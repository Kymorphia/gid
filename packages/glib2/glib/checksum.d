/// Module for [Checksum] class
module glib.checksum;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    GLib provides a generic API for computing checksums (or ‘digests’)
    for a sequence of arbitrary bytes, using various hashing algorithms
    like MD5, SHA-1 and SHA-256. Checksums are commonly used in various
    environments and specifications.
    
    To create a new [glib.checksum.Checksum], use [glib.checksum.Checksum.new_]. To free
    a [glib.checksum.Checksum], use [glib.checksum.Checksum.free].
    
    GLib supports incremental checksums using the [glib.checksum.Checksum] data
    structure, by calling [glib.checksum.Checksum.update] as long as there’s data
    available and then using [glib.checksum.Checksum.getString] or
    [glib.checksum.Checksum.getDigest] to compute the checksum and return it
    either as a string in hexadecimal form, or as a raw sequence of bytes. To
    compute the checksum for binary blobs and nul-terminated strings in
    one go, use the convenience functions `func@GLib.compute_checksum_for_data`
    and `func@GLib.compute_checksum_for_string`, respectively.
*/
class Checksum : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_checksum_get_type != &gidSymbolNotFound ? g_checksum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Checksum self()
  {
    return this;
  }

  /**
      Creates a new #GChecksum, using the checksum algorithm checksum_type.
      If the checksum_type is not known, null is returned.
      A #GChecksum can be used to compute the checksum, or digest, of an
      arbitrary binary blob, using different hashing algorithms.
      
      A #GChecksum works by feeding a binary blob through [glib.checksum.Checksum.update]
      until there is data to be checked; the digest can then be extracted
      using [glib.checksum.Checksum.getString], which will return the checksum as a
      hexadecimal string; or [glib.checksum.Checksum.getDigest], which will return a
      vector of raw bytes. Once either [glib.checksum.Checksum.getString] or
      [glib.checksum.Checksum.getDigest] have been called on a #GChecksum, the checksum
      will be closed and it won't be possible to call [glib.checksum.Checksum.update]
      on it anymore.
  
      Params:
        checksumType = the desired type of checksum
      Returns: the newly created #GChecksum, or null.
          Use [glib.checksum.Checksum.free] to free the memory allocated by it.
  */
  this(glib.types.ChecksumType checksumType)
  {
    GChecksum* _cretval;
    _cretval = g_checksum_new(checksumType);
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GChecksum. If checksum has been closed, by calling
      [glib.checksum.Checksum.getString] or [glib.checksum.Checksum.getDigest], the copied
      checksum will be closed as well.
      Returns: the copy of the passed #GChecksum. Use
          [glib.checksum.Checksum.free] when finished using it.
  */
  glib.checksum.Checksum copy()
  {
    GChecksum* _cretval;
    _cretval = g_checksum_copy(cast(const(GChecksum)*)this._cPtr);
    auto _retval = _cretval ? new glib.checksum.Checksum(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the digest as a hexadecimal string.
      
      Once this function has been called the #GChecksum can no longer be
      updated with [glib.checksum.Checksum.update].
      
      The hexadecimal characters will be lower case.
      Returns: the hexadecimal representation of the checksum. The
          returned string is owned by the checksum and should not be modified
          or freed.
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = g_checksum_get_string(cast(GChecksum*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Resets the state of the checksum back to its initial state.
  */
  void reset()
  {
    g_checksum_reset(cast(GChecksum*)this._cPtr);
  }

  /**
      Feeds data into an existing #GChecksum. The checksum must still be
      open, that is [glib.checksum.Checksum.getString] or [glib.checksum.Checksum.getDigest] must
      not have been called on checksum.
  
      Params:
        data = buffer used to compute the checksum
  */
  void update(ubyte[] data)
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    g_checksum_update(cast(GChecksum*)this._cPtr, _data, _length);
  }

  /**
      Gets the length in bytes of digests of type checksum_type
  
      Params:
        checksumType = a #GChecksumType
      Returns: the checksum length, or -1 if checksum_type is
        not supported.
  */
  static ptrdiff_t typeGetLength(glib.types.ChecksumType checksumType)
  {
    ptrdiff_t _retval;
    _retval = g_checksum_type_get_length(checksumType);
    return _retval;
  }
}
