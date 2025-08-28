/// Module for [FilterBasic] class
module gmime.filter_basic;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A basic encoder/decoder filter for the MIME encodings.
*/
class FilterBasic : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_basic_get_type != &gidSymbolNotFound ? g_mime_filter_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterBasic self()
  {
    return this;
  }

  /**
      Creates a new basic filter for encoding.
  
      Params:
        encoding = a #GMimeContentEncoding
        encode = true to encode or false to decode
      Returns: a new basic encoder filter.
  */
  this(gmime.types.ContentEncoding encoding, bool encode)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_basic_new(encoding, encode);
    this(_cretval, Yes.Take);
  }
}
