/// Module for [FilterUnix2Dos] class
module gmime.filter_unix2_dos;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_unix2dos_get_type != &gidSymbolNotFound ? g_mime_filter_unix2dos_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterUnix2Dos self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.filter_unix2_dos.FilterUnix2Dos]
      Returns: New builder object
  */
  static FilterUnix2DosGidBuilder builder() nothrow
  {
    return new FilterUnix2DosGidBuilder;
  }

  /**
      Creates a new #GMimeFilterUnix2Dos filter.
  
      Params:
        ensureNewline = true if the filter should ensure that the stream ends in a new line
      Returns: a new #GMimeFilterUnix2Dos filter.
  */
  this(bool ensureNewline) nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_unix2dos_new(ensureNewline);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gmime.filter_unix2_dos.FilterUnix2Dos]
class FilterUnix2DosGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_unix2_dos.FilterUnix2Dos]
final class FilterUnix2DosGidBuilder : FilterUnix2DosGidBuilderImpl!FilterUnix2DosGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterUnix2Dos build() nothrow
  {
    return new FilterUnix2Dos(cast(void*)createGObject(FilterUnix2Dos._getGType), Yes.Take);
  }
}
