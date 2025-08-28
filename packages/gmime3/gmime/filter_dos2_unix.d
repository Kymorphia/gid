/// Module for [FilterDos2Unix] class
module gmime.filter_dos2_unix;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter to convert a stream from Windows/DOS line endings to Unix line endings.
*/
class FilterDos2Unix : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_dos2unix_get_type != &gidSymbolNotFound ? g_mime_filter_dos2unix_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterDos2Unix self()
  {
    return this;
  }

  /**
      Creates a new #GMimeFilterDos2Unix filter.
  
      Params:
        ensureNewline = true if the filter should ensure that the stream ends in a new line
      Returns: a new #GMimeFilterDos2Unix filter.
  */
  this(bool ensureNewline)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_dos2unix_new(ensureNewline);
    this(_cretval, Yes.Take);
  }
}
