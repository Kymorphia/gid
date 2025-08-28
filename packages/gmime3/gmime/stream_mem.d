/// Module for [StreamMem] class
module gmime.stream_mem;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A memory-backed #GMimeStream.
*/
class StreamMem : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_mem_get_type != &gidSymbolNotFound ? g_mime_stream_mem_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamMem self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamMem object.
      Returns: a new memory stream.
  */
  this()
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_mem_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeStreamMem object and initializes the stream
      contents with the first len bytes of buffer.
  
      Params:
        buffer = stream data
      Returns: a new memory stream initialized with buffer.
  */
  static gmime.stream_mem.StreamMem newWithBuffer(ubyte[] buffer)
  {
    GMimeStream* _cretval;
    size_t _len;
    if (buffer)
      _len = cast(size_t)buffer.length;

    auto _buffer = cast(const(ubyte)*)buffer.ptr;
    _cretval = g_mime_stream_mem_new_with_buffer(_buffer, _len);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_mem.StreamMem)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeStreamMem with data array.
  
      Params:
        array = source data
      Returns: a new memory stream using array.
  */
  static gmime.stream_mem.StreamMem newWithByteArray(ubyte[] array)
  {
    GMimeStream* _cretval;
    auto _array = gByteArrayFromD(array);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_array);
    _cretval = g_mime_stream_mem_new_with_byte_array(_array);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_mem.StreamMem)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the byte array from the memory stream.
      Returns: the byte array from the memory stream.
  */
  ubyte[] getByteArray()
  {
    GByteArray* _cretval;
    _cretval = g_mime_stream_mem_get_byte_array(cast(GMimeStreamMem*)this._cPtr);
    auto _retval = gByteArrayToD(cast(GByteArray*)_cretval);
    return _retval;
  }

  /**
      Gets whether or not mem owns the backend memory buffer.
      Returns: true if mem owns the backend memory buffer or false
        otherwise.
  */
  bool getOwner()
  {
    bool _retval;
    _retval = g_mime_stream_mem_get_owner(cast(GMimeStreamMem*)this._cPtr);
    return _retval;
  }

  /**
      Sets the byte array on the memory stream.
      
      Note: The memory stream is not responsible for freeing the byte
      array. Use [gmime.stream_mem.StreamMem.setOwner] to change this behavior.
  
      Params:
        array = stream data
  */
  void setByteArray(ubyte[] array)
  {
    auto _array = gByteArrayFromD(array);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_array);
    g_mime_stream_mem_set_byte_array(cast(GMimeStreamMem*)this._cPtr, _array);
  }

  /**
      Sets whether or not mem owns the backend memory buffer.
      
      Note: owner should be true if the stream should free the backend
      memory buffer when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the #GByteArray or false otherwise
  */
  void setOwner(bool owner)
  {
    g_mime_stream_mem_set_owner(cast(GMimeStreamMem*)this._cPtr, owner);
  }
}
