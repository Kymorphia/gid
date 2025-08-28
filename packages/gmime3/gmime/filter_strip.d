/// Module for [FilterStrip] class
module gmime.filter_strip;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for stripping whitespace from the end of lines.
*/
class FilterStrip : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_strip_get_type != &gidSymbolNotFound ? g_mime_filter_strip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterStrip self()
  {
    return this;
  }

  /**
      Creates a new #GMimeFilterStrip filter which will strip trailing
      whitespace from every line of input passed through the filter.
      Returns: a new strip filter.
  */
  this()
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_strip_new();
    this(_cretval, Yes.Take);
  }
}
