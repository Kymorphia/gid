/// Module for [FilterFrom] class
module gmime.filter_from;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter for armoring or escaping lines beginning with "From ".
*/
class FilterFrom : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_from_get_type != &gidSymbolNotFound ? g_mime_filter_from_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterFrom self()
  {
    return this;
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
  this(gmime.types.FilterFromMode mode)
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_from_new(mode);
    this(_cretval, Yes.Take);
  }
}
