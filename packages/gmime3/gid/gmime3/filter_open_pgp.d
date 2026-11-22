/// Module for [FilterOpenPGP] class
module gid.gmime3.filter_open_pgp;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A filter to detect OpenPGP markers.
*/
class FilterOpenPGP : gid.gmime3.filter.Filter
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
    return cast(void function())g_mime_filter_openpgp_get_type != &gidSymbolNotFound ? g_mime_filter_openpgp_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilterOpenPGP";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOpenPGP self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter_open_pgp.FilterOpenPGP]
      Returns: New builder object
  */
  static FilterOpenPGPGidBuilder builder() nothrow
  {
    return new FilterOpenPGPGidBuilder;
  }

  /**
      Creates a new #GMimeFilterOpenPGP filter.
      Returns: a new #GMimeFilterOpenPGP filter.
  */
  this() nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_openpgp_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the stream offset of the beginning of the OpenPGP data block, if any have been found.
      Returns: The stream offset or %-1 if no OpenPGP block was found.
  */
  long getBeginOffset() nothrow
  {
    long _retval;
    _retval = g_mime_filter_openpgp_get_begin_offset(cast(GMimeFilterOpenPGP*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of OpenPGP data that has been detected.
      Returns: a #GMimeOpenPGPData value.
  */
  gid.gmime3.types.OpenPGPData getDataType() nothrow
  {
    GMimeOpenPGPData _cretval;
    _cretval = g_mime_filter_openpgp_get_data_type(cast(GMimeFilterOpenPGP*)this._cPtr);
    gid.gmime3.types.OpenPGPData _retval = cast(gid.gmime3.types.OpenPGPData)_cretval;
    return _retval;
  }

  /**
      Gets the stream offset of the end of the OpenPGP data block, if any have been found.
      Returns: The stream offset or %-1 if no OpenPGP block was found.
  */
  long getEndOffset() nothrow
  {
    long _retval;
    _retval = g_mime_filter_openpgp_get_end_offset(cast(GMimeFilterOpenPGP*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter_open_pgp.FilterOpenPGP]
class FilterOpenPGPGidBuilderImpl(T) : gid.gmime3.filter.FilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter_open_pgp.FilterOpenPGP]
final class FilterOpenPGPGidBuilder : FilterOpenPGPGidBuilderImpl!FilterOpenPGPGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterOpenPGP build() nothrow
  {
    return new FilterOpenPGP(cast(void*)createGObject(FilterOpenPGP._getGType), Yes.Take);
  }
}
