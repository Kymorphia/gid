/// Module for [FilterOpenPGP] class
module gmime.filter_open_pgp;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.types;

/**
    A filter to detect OpenPGP markers.
*/
class FilterOpenPGP : gmime.filter.Filter
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
    return cast(void function())g_mime_filter_openpgp_get_type != &gidSymbolNotFound ? g_mime_filter_openpgp_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOpenPGP self()
  {
    return this;
  }

  /**
      Creates a new #GMimeFilterOpenPGP filter.
      Returns: a new #GMimeFilterOpenPGP filter.
  */
  this()
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_openpgp_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the stream offset of the beginning of the OpenPGP data block, if any have been found.
      Returns: The stream offset or %-1 if no OpenPGP block was found.
  */
  long getBeginOffset()
  {
    long _retval;
    _retval = g_mime_filter_openpgp_get_begin_offset(cast(GMimeFilterOpenPGP*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of OpenPGP data that has been detected.
      Returns: a #GMimeOpenPGPData value.
  */
  gmime.types.OpenPGPData getDataType()
  {
    GMimeOpenPGPData _cretval;
    _cretval = g_mime_filter_openpgp_get_data_type(cast(GMimeFilterOpenPGP*)this._cPtr);
    gmime.types.OpenPGPData _retval = cast(gmime.types.OpenPGPData)_cretval;
    return _retval;
  }

  /**
      Gets the stream offset of the end of the OpenPGP data block, if any have been found.
      Returns: The stream offset or %-1 if no OpenPGP block was found.
  */
  long getEndOffset()
  {
    long _retval;
    _retval = g_mime_filter_openpgp_get_end_offset(cast(GMimeFilterOpenPGP*)this._cPtr);
    return _retval;
  }
}
