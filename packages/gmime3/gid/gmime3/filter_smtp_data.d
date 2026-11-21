/// Module for [FilterSmtpData] class
module gid.gmime3.filter_smtp_data;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter to byte-stuff SMTP DATA.
*/
class FilterSmtpData : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_smtp_data_get_type != &gidSymbolNotFound ? g_mime_filter_smtp_data_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterSmtpData";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterSmtpData self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_smtp_data.FilterSmtpData]
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

/// Fluent builder implementation template for [gid.gmime3.filter_smtp_data.FilterSmtpData]
class FilterSmtpDataGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_smtp_data.FilterSmtpData]
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
