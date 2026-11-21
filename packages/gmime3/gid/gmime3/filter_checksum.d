/// Module for [FilterChecksum] class
module gid.gmime3.filter_checksum;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.types;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for calculating the checksum of a stream.
*/
class FilterChecksum : gid.gmime3.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_checksum_get_type != &gidSymbolNotFound ? g_mime_filter_checksum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterChecksum";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterChecksum self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_checksum.FilterChecksum]
      Returns: New builder object
  */
  static FilterChecksumGidBuilder builder() nothrow
  {
    return new FilterChecksumGidBuilder;
  }

  /**
      Creates a new checksum filter.
  
      Params:
        type = the type of checksum
      Returns: a new #GMimeFilterChecksum filter.
  */
  this(gid.glib2.types.ChecksumType type) nothrow
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
  size_t getDigest(ubyte[] digest) nothrow
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
      Returns: the hexadecimal representation of the checksum. The returned string should be freed with [gid.glib2.global.gfree] when no longer needed.
  */
  string getString() nothrow
  {
    char* _cretval;
    _cretval = g_mime_filter_checksum_get_string(cast(GMimeFilterChecksum*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_checksum.FilterChecksum]
class FilterChecksumGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_checksum.FilterChecksum]
final class FilterChecksumGidBuilder : FilterChecksumGidBuilderImpl!FilterChecksumGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterChecksum build() nothrow
  {
    return new FilterChecksum(cast(void*)createGObject(FilterChecksum._getGType), Yes.Take);
  }
}
