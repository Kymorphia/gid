/// Module for [FilterSmtpData] class
module gmime.filter_smtp_data;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter to byte-stuff SMTP DATA.
*/
class FilterSmtpData : gmime.filter.Filter
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_filter_smtp_data_get_type != &gidSymbolNotFound ? g_mime_filter_smtp_data_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterSmtpData self()
  {
    return this;
  }

  /**
      Creates a new #GMimeFilterSmtpData filter.
      Returns: a new #GMimeFilterSmtpData filter.
  */
  this()
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_smtp_data_new();
    this(_cretval, Yes.Take);
  }
}
