/// Module for [FilterFrom] class
module gid.gmime3.filter_from;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for armoring or escaping lines beginning with "From ".
*/
class FilterFrom : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_from_get_type != &gidSymbolNotFound ? g_mime_filter_from_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterFrom";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterFrom self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_from.FilterFrom]
      Returns: New builder object
  */
  static FilterFromGidBuilder builder() nothrow
  {
    return new FilterFromGidBuilder;
  }

  /**
      Creates a new GMimeFilterFrom filter. If mode is
      #GMIME_FILTER_FROM_MODE_ARMOR, the from-filter will encode from
      lines using the quoted-printable encoding resulting in "=46rom ".
      Using the #GMIME_FILTER_FROM_MODE_DEFAULT or
      #GMIME_FILTER_FROM_MODE_ESCAPE mode (they are the same), from lines
      will be escaped to ">From ".
      
      Note: If you plan on using a from-filter in mode ARMOR, you should
      remember to also use a #GMimeFilterBasic filter with an encoding of
      #GMIME_CONTENT_ENCODING_QUOTEDPRINTABLE.
  
      Params:
        mode = filter mode
      Returns: a new from filter with mode mode.
  */
  this(gid.gmime3.types.FilterFromMode mode) nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_from_new(mode);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_from.FilterFrom]
class FilterFromGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_from.FilterFrom]
final class FilterFromGidBuilder : FilterFromGidBuilderImpl!FilterFromGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterFrom build() nothrow
  {
    return new FilterFrom(cast(void*)createGObject(FilterFrom._getGType), Yes.Take);
  }
}
