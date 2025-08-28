/// Module for [StreamNull] class
module gmime.stream_null;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;

/**
    A #GMimeStream which has no backing store.
*/
class StreamNull : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_null_get_type != &gidSymbolNotFound ? g_mime_stream_null_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamNull self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamNull object.
      Returns: a new null stream (similar to /dev/null on Unix).
  */
  this()
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
  bool getCountNewlines()
  {
    bool _retval;
    _retval = g_mime_stream_null_get_count_newlines(cast(GMimeStreamNull*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not the stream should keep track of the number of newlines
      encountered.
  
      Params:
        count = true if newlines should be counted or false otherwise
  */
  void setCountNewlines(bool count)
  {
    g_mime_stream_null_set_count_newlines(cast(GMimeStreamNull*)this._cPtr, count);
  }
}
