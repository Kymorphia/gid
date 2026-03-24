/// Module for [FilterUnix2Dos] class
module gmime.filter_unix2_dos;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.gid_builder;

/**
    A filter to convert a stream from Windows/DOS line endings to Unix line endings.
*/
class FilterUnix2Dos : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_unix2dos_get_type != &gidSymbolNotFound ? g_mime_filter_unix2dos_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterUnix2Dos self()
  {
    return this;
  }

  /**
  Get builder for [gmime.filter_unix2_dos.FilterUnix2Dos]
  Returns: New builder object
  */
  static FilterUnix2DosGidBuilder builder()
  {
    return new FilterUnix2DosGidBuilder;
  }

  /**
      Creates a new #GMimeFilterUnix2Dos filter.
  
      Params:
        ensureNewline = true if the filter should ensure that the stream ends in a new line
      Returns: a new #GMimeFilterUnix2Dos filter.
  */
  this(bool ensureNewline)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_unix2dos_new(ensureNewline);
    this(_cretval, Yes.Take);
  }
}

class FilterUnix2DosGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_unix2_dos.FilterUnix2Dos]
final class FilterUnix2DosGidBuilder : FilterUnix2DosGidBuilderImpl!FilterUnix2DosGidBuilder
{
  FilterUnix2Dos build()
  {
    return new FilterUnix2Dos(cast(void*)createGObject(FilterUnix2Dos._getGType), Yes.Take);
  }
}
