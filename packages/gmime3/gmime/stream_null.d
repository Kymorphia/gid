/// Module for [StreamNull] class
module gmime.stream_null;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.gid_builder;

/**
    A #GMimeStream which has no backing store.
*/
class StreamNull : gmime.stream.Stream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_stream_null_get_type != &gidSymbolNotFound ? g_mime_stream_null_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamNull self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.stream_null.StreamNull]
      Returns: New builder object
  */
  static StreamNullGidBuilder builder() nothrow
  {
    return new StreamNullGidBuilder;
  }

  /**
      Creates a new #GMimeStreamNull object.
      Returns: a new null stream (similar to /dev/null on Unix).
  */
  this() nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_null_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether or not the stream should keep track of the number of newlines
      encountered.
      Returns: true if the stream should count the number of newlines or false otherwise.
  */
  bool getCountNewlines() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_null_get_count_newlines(cast(GMimeStreamNull*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not the stream should keep track of the number of newlines
      encountered.
  
      Params:
        count = true if newlines should be counted or false otherwise
  */
  void setCountNewlines(bool count) nothrow
  {
    g_mime_stream_null_set_count_newlines(cast(GMimeStreamNull*)this._cPtr, count);
  }
}

/// Fluent builder implementation template for [gmime.stream_null.StreamNull]
class StreamNullGidBuilderImpl(T) : gmime.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.stream_null.StreamNull]
final class StreamNullGidBuilder : StreamNullGidBuilderImpl!StreamNullGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamNull build() nothrow
  {
    return new StreamNull(cast(void*)createGObject(StreamNull._getGType), Yes.Take);
  }
}
