/// Module for [FilterGZip] class
module gmime.filter_gzip;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for compresing or decompressing a gzip stream.
*/
class FilterGZip : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_gzip_get_type != &gidSymbolNotFound ? g_mime_filter_gzip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterGZip self()
  {
    return this;
  }

  /**
      Creates a new gzip (or gunzip) filter.
  
      Params:
        mode = zip or unzip
        level = compression level
      Returns: a new gzip (or gunzip) filter.
  */
  this(gmime.types.FilterGZipMode mode, int level)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_gzip_new(mode, level);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the comment that was either previously set or retrieved when decoding a gzip stream.
      Returns: a string containing the comment.
  */
  string getComment()
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_gzip_get_comment(cast(GMimeFilterGZip*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the filename that was either previously set or retrieved when decoding a gzip stream.
      Returns: a string containing th ename of the file.
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_gzip_get_filename(cast(GMimeFilterGZip*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the comment that should be used when generating the gzip header.
  
      Params:
        comment = The comment
  */
  void setComment(string comment)
  {
    const(char)* _comment = comment.toCString(No.Alloc);
    g_mime_filter_gzip_set_comment(cast(GMimeFilterGZip*)this._cPtr, _comment);
  }

  /**
      Sets the filename that should be used when generating the gzip header.
  
      Params:
        filename = The name of the file
  */
  void setFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    g_mime_filter_gzip_set_filename(cast(GMimeFilterGZip*)this._cPtr, _filename);
  }
}
