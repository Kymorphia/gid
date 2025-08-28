/// Module for [FilterEnriched] class
module gmime.filter_enriched;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for converting text/enriched or text/richtext textual
    streams into text/html.
*/
class FilterEnriched : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_enriched_get_type != &gidSymbolNotFound ? g_mime_filter_enriched_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterEnriched self()
  {
    return this;
  }

  /**
      Creates a new GMimeFilterEnriched object.
  
      Params:
        flags = flags
      Returns: a new GMimeFilter object.
  */
  this(uint flags)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_enriched_new(flags);
    this(_cretval, Yes.Take);
  }
}
