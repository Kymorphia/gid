/// Module for [FilterGZip] class
module gid.gmime3.filter_gzip;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for compresing or decompressing a gzip stream.
*/
class FilterGZip : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_gzip_get_type != &gidSymbolNotFound ? g_mime_filter_gzip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterGZip";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterGZip self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_gzip.FilterGZip]
      Returns: New builder object
  */
  static FilterGZipGidBuilder builder() nothrow
  {
    return new FilterGZipGidBuilder;
  }

  /**
      Creates a new gzip (or gunzip) filter.
  
      Params:
        mode = zip or unzip
        level = compression level
      Returns: a new gzip (or gunzip) filter.
  */
  this(gid.gmime3.types.FilterGZipMode mode, int level) nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_gzip_new(mode, level);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the comment that was either previously set or retrieved when decoding a gzip stream.
      Returns: a string containing the comment.
  */
  string getComment() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_gzip_get_comment(cast(GMimeFilterGZip*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the filename that was either previously set or retrieved when decoding a gzip stream.
      Returns: a string containing th ename of the file.
  */
  string getFilename() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_gzip_get_filename(cast(GMimeFilterGZip*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the comment that should be used when generating the gzip header.
  
      Params:
        comment = The comment
  */
  void setComment(string comment) nothrow
  {
    const(char)* _comment = comment.toCString!(No.Malloc, No.Nullable);
    g_mime_filter_gzip_set_comment(cast(GMimeFilterGZip*)this._cPtr, _comment);
  }

  /**
      Sets the filename that should be used when generating the gzip header.
  
      Params:
        filename = The name of the file
  */
  void setFilename(string filename) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    g_mime_filter_gzip_set_filename(cast(GMimeFilterGZip*)this._cPtr, _filename);
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_gzip.FilterGZip]
class FilterGZipGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_gzip.FilterGZip]
final class FilterGZipGidBuilder : FilterGZipGidBuilderImpl!FilterGZipGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterGZip build() nothrow
  {
    return new FilterGZip(cast(void*)createGObject(FilterGZip._getGType), Yes.Take);
  }
}
