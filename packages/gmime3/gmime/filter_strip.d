/// Module for [FilterStrip] class
module gmime.filter_strip;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.gid_builder;

/**
    A filter for stripping whitespace from the end of lines.
*/
class FilterStrip : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_strip_get_type != &gidSymbolNotFound ? g_mime_filter_strip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterStrip self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.filter_strip.FilterStrip]
      Returns: New builder object
  */
  static FilterStripGidBuilder builder() nothrow
  {
    return new FilterStripGidBuilder;
  }

  /**
      Creates a new #GMimeFilterStrip filter which will strip trailing
      whitespace from every line of input passed through the filter.
      Returns: a new strip filter.
  */
  this() nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_strip_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gmime.filter_strip.FilterStrip]
class FilterStripGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_strip.FilterStrip]
final class FilterStripGidBuilder : FilterStripGidBuilderImpl!FilterStripGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterStrip build() nothrow
  {
    return new FilterStrip(cast(void*)createGObject(FilterStrip._getGType), Yes.Take);
  }
}
