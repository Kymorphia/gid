/// Module for [FilterCharset] class
module gmime.filter_charset;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter to convert between charsets.
*/
class FilterCharset : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_charset_get_type != &gidSymbolNotFound ? g_mime_filter_charset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterCharset self()
  {
    return this;
  }

  /**
      Creates a new #GMimeFilterCharset filter.
  
      Params:
        fromCharset = charset to convert from
        toCharset = charset to convert to
      Returns: a new charset filter or null if the charset conversion is
        not possible.
  */
  this(string fromCharset, string toCharset)
  {
    GMimeFilter* _cretval;
    const(char)* _fromCharset = fromCharset.toCString(No.Alloc);
    const(char)* _toCharset = toCharset.toCString(No.Alloc);
    _cretval = g_mime_filter_charset_new(_fromCharset, _toCharset);
    this(_cretval, Yes.Take);
  }
}
