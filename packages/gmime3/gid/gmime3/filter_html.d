/// Module for [FilterHTML] class
module gid.gmime3.filter_html;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter for converting text/plain into text/html.
*/
class FilterHTML : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_html_get_type != &gidSymbolNotFound ? g_mime_filter_html_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterHTML";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterHTML self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_html.FilterHTML]
      Returns: New builder object
  */
  static FilterHTMLGidBuilder builder() nothrow
  {
    return new FilterHTMLGidBuilder;
  }

  /**
      Creates a new GMimeFilterHTML filter which can be used to convert a
      plain UTF-8 text stream into an html stream.
  
      Params:
        flags = html flags
        colour = citation colour
      Returns: a new html filter.
  */
  this(uint flags, uint colour) nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_html_new(flags, colour);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_html.FilterHTML]
class FilterHTMLGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_html.FilterHTML]
final class FilterHTMLGidBuilder : FilterHTMLGidBuilderImpl!FilterHTMLGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterHTML build() nothrow
  {
    return new FilterHTML(cast(void*)createGObject(FilterHTML._getGType), Yes.Take);
  }
}
