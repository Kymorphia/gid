/// Module for [FilterStrip] class
module gid.gmime3.filter_strip;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for stripping whitespace from the end of lines.
*/
@gidGir("FilterStrip", "FilterStripClass")
class FilterStrip : gid.gmime3.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_strip_get_type != &gidSymbolNotFound ? g_mime_filter_strip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterStrip";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterStrip self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_strip.FilterStrip]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeFilter* _cretval;
      _cretval = g_mime_filter_strip_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_strip.FilterStrip]
class FilterStripGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_strip.FilterStrip]
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
