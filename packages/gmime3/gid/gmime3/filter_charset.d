/// Module for [FilterCharset] class
module gid.gmime3.filter_charset;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter to convert between charsets.
*/
class FilterCharset : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_charset_get_type != &gidSymbolNotFound ? g_mime_filter_charset_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterCharset";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterCharset self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_charset.FilterCharset]
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
    const(char)* _fromCharset = fromCharset.toCString!(No.Malloc, No.Nullable);
    const(char)* _toCharset = toCharset.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_filter_charset_new(_fromCharset, _toCharset);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_charset.FilterCharset]
class FilterCharsetGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_charset.FilterCharset]
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
