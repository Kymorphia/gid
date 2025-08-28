/// Module for [FilterChecksum] class
module gmime.filter_checksum;

import gid.gid;
import glib.types;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for calculating the checksum of a stream.
*/
class FilterChecksum : gmime.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_checksum_get_type != &gidSymbolNotFound ? g_mime_filter_checksum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterChecksum self()
  {
    return this;
  }

  /**
      Creates a new checksum filter.
  
      Params:
        type = the type of checksum
      Returns: a new #GMimeFilterChecksum filter.
  */
  this(glib.types.ChecksumType type)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_checksum_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Outputs the checksum digest into digest.
  
      Params:
        digest = the digest buffer
      Returns: the number of bytes used of the digest buffer.
  */
  size_t getDigest(ubyte[] digest)
  {
    size_t _retval;
    size_t _len;
    if (digest)
      _len = cast(size_t)digest.length;

    auto _digest = cast(ubyte*)digest.ptr;
    _retval = g_mime_filter_checksum_get_digest(cast(GMimeFilterChecksum*)this._cPtr, _digest, _len);
    return _retval;
  }

  /**
      Outputs the checksum digest as a newly allocated hexadecimal string.
      Returns: the hexadecimal representation of the checksum. The returned string should be freed with [glib.global.gfree] when no longer needed.
  */
  string getString()
  {
    char* _cretval;
    _cretval = g_mime_filter_checksum_get_string(cast(GMimeFilterChecksum*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
