/// Module for [FilterDos2Unix] class
module gmime.filter_dos2_unix;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.gid_builder;

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
  Get builder for [gmime.filter_dos2_unix.FilterDos2Unix]
  Returns: New builder object
  */
  static FilterDos2UnixGidBuilder builder()
  {
    return new FilterDos2UnixGidBuilder;
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

class FilterDos2UnixGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_dos2_unix.FilterDos2Unix]
final class FilterDos2UnixGidBuilder : FilterDos2UnixGidBuilderImpl!FilterDos2UnixGidBuilder
{
  FilterDos2Unix build()
  {
    return new FilterDos2Unix(cast(void*)createGObject(FilterDos2Unix._getGType), Yes.Take);
  }
}
