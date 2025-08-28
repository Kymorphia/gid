/// Module for [FilterHTML] class
module gmime.filter_html;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for converting text/plain into text/html.
*/
class FilterHTML : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_html_get_type != &gidSymbolNotFound ? g_mime_filter_html_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterHTML self()
  {
    return this;
  }

  /**
      Creates a new GMimeFilterHTML filter which can be used to convert a
      plain UTF-8 text stream into an html stream.
  
      Params:
        flags = html flags
        colour = citation colour
      Returns: a new html filter.
  */
  this(uint flags, uint colour)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_html_new(flags, colour);
    this(_cretval, Yes.Take);
  }
}
