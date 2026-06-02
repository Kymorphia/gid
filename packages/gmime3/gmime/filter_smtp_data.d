/// Module for [FilterSmtpData] class
module gmime.filter_smtp_data;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;
import gobject.gid_builder;

/**
    A filter to byte-stuff SMTP DATA.
*/
class FilterSmtpData : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_smtp_data_get_type != &gidSymbolNotFound ? g_mime_filter_smtp_data_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterSmtpData self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.filter_smtp_data.FilterSmtpData]
      Returns: New builder object
  */
  static FilterSmtpDataGidBuilder builder() nothrow
  {
    return new FilterSmtpDataGidBuilder;
  }

  /**
      Creates a new #GMimeFilterSmtpData filter.
      Returns: a new #GMimeFilterSmtpData filter.
  */
  this() nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_smtp_data_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gmime.filter_smtp_data.FilterSmtpData]
class FilterSmtpDataGidBuilderImpl(T) : gmime.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.filter_smtp_data.FilterSmtpData]
final class FilterSmtpDataGidBuilder : FilterSmtpDataGidBuilderImpl!FilterSmtpDataGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterSmtpData build() nothrow
  {
    return new FilterSmtpData(cast(void*)createGObject(FilterSmtpData._getGType), Yes.Take);
  }
}
