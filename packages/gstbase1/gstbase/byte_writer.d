/// Module for [ByteWriter] class
module gstbase.byte_writer;

import gid.gid;
import gst.buffer;
import gstbase.byte_reader;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstByteWriter provides a byte writer and reader that can write/read different
    integer and floating point types to/from a memory buffer. It provides functions
    for writing/reading signed/unsigned, little/big endian integers of 8, 16, 24,
    32 and 64 bits and functions for reading little/big endian floating points numbers of
    32 and 64 bits. It also provides functions to write/read NUL-terminated strings
    in various character encodings.
*/
class ByteWriter
{
  GstByteWriter cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstbase.byte_writer.ByteWriter");

    cInstance = *cast(GstByteWriter*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `parent` field.
      Returns: #GstByteReader parent
  */
  @property gstbase.byte_reader.ByteReader parent()
  {
    return new gstbase.byte_reader.ByteReader(cast(GstByteReader*)&(cast(GstByteWriter*)this._cPtr).parent, No.Take);
  }

  /**
      Get `allocSize` field.
      Returns: Allocation size of the data
  */
  @property uint allocSize()
  {
    return (cast(GstByteWriter*)this._cPtr).allocSize;
  }

  /**
      Set `allocSize` field.
      Params:
        propval = Allocation size of the data
  */
  @property void allocSize(uint propval)
  {
    (cast(GstByteWriter*)this._cPtr).allocSize = propval;
  }

  /**
      Get `fixed` field.
      Returns: If true no reallocations are allowed
  */
  @property bool fixed()
  {
    return cast(bool)(cast(GstByteWriter*)this._cPtr).fixed;
  }

  /**
      Set `fixed` field.
      Params:
        propval = If true no reallocations are allowed
  */
  @property void fixed(bool propval)
  {
    (cast(GstByteWriter*)this._cPtr).fixed = propval;
  }

  /**
      Get `owned` field.
      Returns: If false no reallocations are allowed and copies of data are returned
  */
  @property bool owned()
  {
    return cast(bool)(cast(GstByteWriter*)this._cPtr).owned;
  }

  /**
      Set `owned` field.
      Params:
        propval = If false no reallocations are allowed and copies of data are returned
  */
  @property void owned(bool propval)
  {
    (cast(GstByteWriter*)this._cPtr).owned = propval;
  }

  /**
      Checks if enough free space from the current write cursor is
      available and reallocates if necessary.
  
      Params:
        size = Number of bytes that should be available
      Returns: true if at least size bytes are still available
  */
  bool ensureFreeSpace(uint size)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_ensure_free_space(cast(GstByteWriter*)this._cPtr, size);
    return _retval;
  }

  /**
      Writes size bytes containing value to writer.
  
      Params:
        value = Value to be written
        size = Number of bytes to be written
      Returns: true if the value could be written
  */
  bool fill(ubyte value, uint size)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_fill(cast(GstByteWriter*)this._cPtr, value, size);
    return _retval;
  }

  /**
      Frees writer and all memory allocated by it except
      the current data, which is returned as #GstBuffer.
      
      Free-function: gst_buffer_unref
      Returns: the current data as buffer. gst_buffer_unref()
            after usage.
  */
  gst.buffer.Buffer freeAndGetBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_byte_writer_free_and_get_buffer(cast(GstByteWriter*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Frees writer and all memory allocated by it except
      the current data, which is returned.
      
      Free-function: g_free
      Returns: the current data. [glib.global.gfree] after usage.
  */
  ubyte* freeAndGetData()
  {
    auto _retval = gst_byte_writer_free_and_get_data(cast(GstByteWriter*)this._cPtr);
    return _retval;
  }

  /**
      Returns the remaining size of data that can still be written. If
      -1 is returned the remaining size is only limited by system resources.
      Returns: the remaining size of data that can still be written
  */
  uint getRemaining()
  {
    uint _retval;
    _retval = gst_byte_writer_get_remaining(cast(const(GstByteWriter)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes writer to an empty instance
  */
  void init_()
  {
    gst_byte_writer_init(cast(GstByteWriter*)this._cPtr);
  }

  /**
      Initializes writer with the given
      memory area. If initialized is true it is possible to
      read size bytes from the #GstByteWriter from the beginning.
  
      Params:
        data = Memory area for writing
        initialized = If true the complete data can be read from the beginning
  */
  void initWithData(ubyte[] data, bool initialized)
  {
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    gst_byte_writer_init_with_data(cast(GstByteWriter*)this._cPtr, _data, _size, initialized);
  }

  /**
      Initializes writer with the given initial data size.
  
      Params:
        size = Initial size of data
        fixed = If true the data can't be reallocated
  */
  void initWithSize(uint size, bool fixed)
  {
    gst_byte_writer_init_with_size(cast(GstByteWriter*)this._cPtr, size, fixed);
  }

  /**
      Writes size bytes of data to writer.
  
      Params:
        buffer = source #GstBuffer
        offset = offset to copy from
        size = total size to copy. If -1, all data is copied
      Returns: true if the data could be written
  */
  bool putBuffer(gst.buffer.Buffer buffer, size_t offset, ptrdiff_t size)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_buffer(cast(GstByteWriter*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, offset, size);
    return _retval;
  }

  /**
      Writes size bytes of data to writer.
  
      Params:
        data = Data to write
      Returns: true if the value could be written
  */
  bool putData(ubyte[] data)
  {
    bool _retval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_byte_writer_put_data(cast(GstByteWriter*)this._cPtr, _data, _size);
    return _retval;
  }

  /**
      Writes a big endian 32 bit float to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putFloat32Be(float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_float32_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a little endian 32 bit float to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putFloat32Le(float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_float32_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a big endian 64 bit float to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putFloat64Be(double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_float64_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a little endian 64 bit float to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putFloat64Le(double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_float64_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed big endian 16 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt16Be(short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int16_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed little endian 16 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt16Le(short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int16_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed big endian 24 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt24Be(int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int24_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed little endian 24 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt24Le(int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int24_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed big endian 32 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt32Be(int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int32_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed little endian 32 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt32Le(int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int32_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed big endian 64 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt64Be(long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int64_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed little endian 64 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt64Le(long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int64_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a signed 8 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putInt8(byte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_int8(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a NUL-terminated UTF16 string to writer (including the terminator).
  
      Params:
        data = UTF16 string to write
      Returns: true if the value could be written
  */
  bool putStringUtf16(ushort[] data)
  {
    bool _retval;
    auto _data = cast(const(ushort)*)(data ~ ushort.init).ptr;
    _retval = cast(bool)gst_byte_writer_put_string_utf16(cast(GstByteWriter*)this._cPtr, _data);
    return _retval;
  }

  /**
      Writes a NUL-terminated UTF32 string to writer (including the terminator).
  
      Params:
        data = UTF32 string to write
      Returns: true if the value could be written
  */
  bool putStringUtf32(uint[] data)
  {
    bool _retval;
    auto _data = cast(const(uint)*)(data ~ uint.init).ptr;
    _retval = cast(bool)gst_byte_writer_put_string_utf32(cast(GstByteWriter*)this._cPtr, _data);
    return _retval;
  }

  /**
      Writes a NUL-terminated UTF8 string to writer (including the terminator).
  
      Params:
        data = UTF8 string to write
      Returns: true if the value could be written
  */
  bool putStringUtf8(string data)
  {
    bool _retval;
    const(char)* _data = data.toCString(No.Alloc);
    _retval = cast(bool)gst_byte_writer_put_string_utf8(cast(GstByteWriter*)this._cPtr, _data);
    return _retval;
  }

  /**
      Writes a unsigned big endian 16 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint16Be(ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint16_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned little endian 16 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint16Le(ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint16_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned big endian 24 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint24Be(uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint24_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned little endian 24 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint24Le(uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint24_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned big endian 32 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint32Be(uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint32_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned little endian 32 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint32Le(uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint32_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned big endian 64 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint64Be(ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint64_be(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned little endian 64 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint64Le(ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint64_le(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Writes a unsigned 8 bit integer to writer.
  
      Params:
        val = Value to write
      Returns: true if the value could be written
  */
  bool putUint8(ubyte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_writer_put_uint8(cast(GstByteWriter*)this._cPtr, val);
    return _retval;
  }

  /**
      Resets writer and frees the data if it's
      owned by writer.
  */
  void reset()
  {
    gst_byte_writer_reset(cast(GstByteWriter*)this._cPtr);
  }

  /**
      Resets writer and returns the current data as buffer.
      
      Free-function: gst_buffer_unref
      Returns: the current data as buffer. gst_buffer_unref()
            after usage.
  */
  gst.buffer.Buffer resetAndGetBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_byte_writer_reset_and_get_buffer(cast(GstByteWriter*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
