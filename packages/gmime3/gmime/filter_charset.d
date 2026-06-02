/// Module for [FilterCharset] class
module gmime.filter_charset;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.gid_builder;

/**
    A filter to convert between charsets.
*/
class FilterCharset : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_charset_get_type != &gidSymbolNotFound ? g_mime_filter_charset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterCharset self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.filter_charset.FilterCharset]
      Returns: New builder object
  */
  static FilterCharsetGidBuilder builder() nothrow
  {
    return new FilterCharsetGidBuilder;
  }

  /**
      Creates a new #GMimeFilterCharset filter.
  
      Params:
        fromCharset = charset to convert from
        toCharset = charset to convert to
      Returns: a new charset filter or null if the charset conversion is
        not possible.
  */
  this(string fromCharset, string toCharset) nothrow
  {
    GMimeFilter* _cretval;
    const(char)* _fromCharset = fromCharset.toCString(No.Alloc);
    const(char)* _toCharset = toCharset.toCString(No.Alloc);
    _cretval = g_mime_filter_charset_new(_fromCharset, _toCharset);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gmime.filter_charset.FilterCharset]
class FilterCharsetGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_charset.FilterCharset]
final class FilterCharsetGidBuilder : FilterCharsetGidBuilderImpl!FilterCharsetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterCharset build() nothrow
  {
    return new FilterCharset(cast(void*)createGObject(FilterCharset._getGType), Yes.Take);
  }
}
