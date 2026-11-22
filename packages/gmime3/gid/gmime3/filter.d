/// Module for [Filter] class
module gid.gmime3.filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base class for filters used by #GMimeStreamFilter.
*/
class Filter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_filter_get_type != &gidSymbolNotFound ? g_mime_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override Filter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.filter.Filter]
      Returns: New builder object
  */
  static FilterGidBuilder builder() nothrow
  {
    return new FilterGidBuilder;
  }

  /**
      Sets number of bytes backed up on the input, new calls replace
      previous ones
  
      Params:
        data = data to backup
  */
  void backup(ubyte[] data) nothrow
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    g_mime_filter_backup(cast(GMimeFilter*)this._cPtr, _data, _length);
  }

  /**
      Completes the filtering.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  */
  void complete(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace) nothrow
  {
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    g_mime_filter_complete(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Copies filter into a new #GMimeFilter object.
      Returns: a duplicate of filter.
  */
  gid.gmime3.filter.Filter copy() nothrow
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_copy(cast(GMimeFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.filter.Filter)(cast(GMimeFilter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Filters the input data and writes it to out.
  
      Params:
        inbuf = input buffer
        prespace = prespace buffer length
        outbuf = pointer to output buffer
        outprespace = pointer to output prespace buffer length
  */
  void filter(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace) nothrow
  {
    size_t _inlen;
    if (inbuf)
      _inlen = cast(size_t)inbuf.length;

    auto _inbuf = cast(ubyte*)inbuf.ptr;
    size_t _outlen;
    ubyte* _outbuf;
    g_mime_filter_filter(cast(GMimeFilter*)this._cPtr, _inbuf, _inlen, prespace, &_outbuf, &_outlen, cast(size_t*)&outprespace);
    outbuf.length = _outlen;
    outbuf[0 .. $] = (cast(ubyte*)_outbuf)[0 .. _outlen];
  }

  /**
      Resets the filter.
  */
  void reset() nothrow
  {
    g_mime_filter_reset(cast(GMimeFilter*)this._cPtr);
  }

  /**
      Ensure this much size is available for filter output (if required)
  
      Params:
        size = requested size for the output buffer
        keep = true if existing data in the output buffer should be kept
  */
  void setSize(size_t size, bool keep) nothrow
  {
    g_mime_filter_set_size(cast(GMimeFilter*)this._cPtr, size, keep);
  }
}

/// Fluent builder implementation template for [gid.gmime3.filter.Filter]
class FilterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.filter.Filter]
final class FilterGidBuilder : FilterGidBuilderImpl!FilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Filter build() nothrow
  {
    return new Filter(cast(void*)createGObject(Filter._getGType), Yes.Take);
  }
}
