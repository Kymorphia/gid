/// Module for [FilterBest] class
module gmime.filter_best;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for calculating the best encoding and/or charset to encode
    the data passed through it.
*/
class FilterBest : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_best_get_type != &gidSymbolNotFound ? g_mime_filter_best_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterBest self()
  {
    return this;
  }

  /**
      Creates a new GMimeFilterBest filter. flags are used to determine
      which information to keep statistics of. If the
      #GMIME_FILTER_BEST_CHARSET bit is set, the filter will be able to
      compute the best charset for encoding the stream of data
      filtered. If the #GMIME_FILTER_BEST_ENCODING bit is set, the filter
      will be able to compute the best Content-Transfer-Encoding for use
      with the stream being filtered.
      
      Note: In order for the [gmime.filter_best.FilterBest.charset] function to
      work, the stream being filtered MUST already be encoded in UTF-8.
  
      Params:
        flags = filter flags
      Returns: a new best filter with flags flags.
  */
  this(gmime.types.FilterBestFlags flags)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_best_new(flags);
    this(_cretval, Yes.Take);
  }

  /**
      Calculates the best charset for encoding the content filtered
      through the best filter.
      Returns: the name of the charset most suitable for encoding
        the content that has been passed through the filter or null
        if the filter was not configured to detect this.
  */
  string charset()
  {
    const(char)* _cretval;
    _cretval = g_mime_filter_best_charset(cast(GMimeFilterBest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Calculates the most efficient Content-Transfer-Encoding for the
      content filtered through best that fits within the encoding
      constraint.
  
      Params:
        constraint = a #GMimeEncodingConstraint
      Returns: the best encoding for the content filtered by best.
  */
  gmime.types.ContentEncoding encoding(gmime.types.EncodingConstraint constraint)
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_filter_best_encoding(cast(GMimeFilterBest*)this._cPtr, constraint);
    gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
    return _retval;
  }
}
