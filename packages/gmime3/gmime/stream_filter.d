/// Module for [StreamFilter] class
module gmime.stream_filter;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.filter;
import gmime.stream;
import gmime.types;

/**
    A #GMimeStream which passes data through any #GMimeFilter objects.
*/
class StreamFilter : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_filter_get_type != &gidSymbolNotFound ? g_mime_stream_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFilter self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamFilter object using stream as the source
      stream.
  
      Params:
        stream = source stream
      Returns: a new filter stream with stream as its source.
  */
  this(gmime.stream.Stream stream)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_filter_new(stream ? cast(GMimeStream*)stream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds filter to stream. Filters are applied in the same order in
      which they are added.
  
      Params:
        filter = a #GMimeFilter
      Returns: an id for the filter.
  */
  int add(gmime.filter.Filter filter)
  {
    int _retval;
    _retval = g_mime_stream_filter_add(cast(GMimeStreamFilter*)this._cPtr, filter ? cast(GMimeFilter*)filter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets whether or not stream owns the source stream.
      Returns: true if stream owns the source stream or false
        otherwise.
  */
  bool getOwner()
  {
    bool _retval;
    _retval = g_mime_stream_filter_get_owner(cast(GMimeStreamFilter*)this._cPtr);
    return _retval;
  }

  /**
      Removed a filter from the stream based on the id (as returned from
      filter_add).
  
      Params:
        id = filter id
  */
  void remove(int id)
  {
    g_mime_stream_filter_remove(cast(GMimeStreamFilter*)this._cPtr, id);
  }

  /**
      Sets whether or not stream owns the source stream..
      
      Note: owner should be true if the stream should close() the
      backend source stream when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the source stream or false otherwise
  */
  void setOwner(bool owner)
  {
    g_mime_stream_filter_set_owner(cast(GMimeStreamFilter*)this._cPtr, owner);
  }
}
