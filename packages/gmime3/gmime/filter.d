/// Module for [Filter] class
module gmime.filter;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;
import gobject.object;

/**
    Base class for filters used by #GMimeStreamFilter.
*/
class Filter : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_filter_get_type != &gidSymbolNotFound ? g_mime_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Filter self()
  {
    return this;
  }

  /**
      Sets number of bytes backed up on the input, new calls replace
      previous ones
  
      Params:
        data = data to backup
  */
  void backup(ubyte[] data)
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
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
  void complete(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace)
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
  gmime.filter.Filter copy()
  {
    GMimeFilter* _cretval;
    _cretval = g_mime_filter_copy(cast(GMimeFilter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.filter.Filter)(cast(GMimeFilter*)_cretval, Yes.Take);
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
  void filter(ubyte[] inbuf, size_t prespace, out ubyte[] outbuf, out size_t outprespace)
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
  void reset()
  {
    g_mime_filter_reset(cast(GMimeFilter*)this._cPtr);
  }

  /**
      Ensure this much size is available for filter output (if required)
  
      Params:
        size = requested size for the output buffer
        keep = true if existing data in the output buffer should be kept
  */
  void setSize(size_t size, bool keep)
  {
    g_mime_filter_set_size(cast(GMimeFilter*)this._cPtr, size, keep);
  }
}
