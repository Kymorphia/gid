/// Module for [StreamFilter] class
module gid.gmime3.stream_filter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.filter;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A #GMimeStream which passes data through any #GMimeFilter objects.
*/
class StreamFilter : gid.gmime3.stream.Stream
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
    return cast(void function())g_mime_stream_filter_get_type != &gidSymbolNotFound ? g_mime_stream_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_filter.StreamFilter]
      Returns: New builder object
  */
  static StreamFilterGidBuilder builder() nothrow
  {
    return new StreamFilterGidBuilder;
  }

  /**
      Creates a new #GMimeStreamFilter object using stream as the source
      stream.
  
      Params:
        stream = source stream
      Returns: a new filter stream with stream as its source.
  */
  this(gid.gmime3.stream.Stream stream) nothrow
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
  int add(gid.gmime3.filter.Filter filter) nothrow
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
  bool getOwner() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_filter_get_owner(cast(GMimeStreamFilter*)this._cPtr);
    return _retval;
  }

  /**
      Removed a filter from the stream based on the id (as returned from
      filter_add).
  
      Params:
        id = filter id
  */
  void remove(int id) nothrow
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
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_filter_set_owner(cast(GMimeStreamFilter*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_filter.StreamFilter]
class StreamFilterGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_filter.StreamFilter]
final class StreamFilterGidBuilder : StreamFilterGidBuilderImpl!StreamFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamFilter build() nothrow
  {
    return new StreamFilter(cast(void*)createGObject(StreamFilter._getGType), Yes.Take);
  }
}
