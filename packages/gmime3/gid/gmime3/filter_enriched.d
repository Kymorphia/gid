/// Module for [FilterEnriched] class
module gid.gmime3.filter_enriched;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for converting text/enriched or text/richtext textual
    streams into text/html.
*/
class FilterEnriched : gid.gmime3.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_enriched_get_type != &gidSymbolNotFound ? g_mime_filter_enriched_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterEnriched";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterEnriched self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_enriched.FilterEnriched]
      Returns: New builder object
  */
  static FilterEnrichedGidBuilder builder() nothrow
  {
    return new FilterEnrichedGidBuilder;
  }

  /**
      Creates a new GMimeFilterEnriched object.
  
      Params:
        flags = flags
      Returns: a new GMimeFilter object.
  */
  this(uint flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeFilter* _cretval;
      _cretval = g_mime_filter_enriched_new(flags);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_enriched.FilterEnriched]
class FilterEnrichedGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_enriched.FilterEnriched]
final class FilterEnrichedGidBuilder : FilterEnrichedGidBuilderImpl!FilterEnrichedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterEnriched build() nothrow
  {
    return new FilterEnriched(cast(void*)createGObject(FilterEnriched._getGType), Yes.Take);
  }
}
