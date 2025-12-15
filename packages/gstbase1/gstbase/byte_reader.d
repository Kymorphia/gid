/// Module for [ByteReader] class
module gstbase.byte_reader;

import gid.gid;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstByteReader provides a byte reader that can read different integer and
    floating point types from a memory buffer. It provides functions for reading
    signed/unsigned, little/big endian integers of 8, 16, 24, 32 and 64 bits
    and functions for reading little/big endian floating points numbers of
    32 and 64 bits. It also provides functions to read NUL-terminated strings
    in various character encodings.
*/
class ByteReader
{
  GstByteReader cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstbase.byte_reader.ByteReader");

    cInstance = *cast(GstByteReader*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `size` field.
      Returns: Size of @data in bytes
  */
  @property uint size()
  {
    return (cast(GstByteReader*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = Size of @data in bytes
  */
  @property void size(uint propval)
  {
    (cast(GstByteReader*)this._cPtr).size = propval;
  }

  /**
      Get `byte_` field.
      Returns: Current byte position
  */
  @property uint byte_()
  {
    return (cast(GstByteReader*)this._cPtr).byte_;
  }

  /**
      Set `byte_` field.
      Params:
        propval = Current byte position
  */
  @property void byte_(uint propval)
  {
    (cast(GstByteReader*)this._cPtr).byte_ = propval;
  }

  /**
      Free-function: g_free
      
      Returns a newly-allocated copy of the current data position if there is
      a NUL-terminated UTF-16 string in the data (this could be an empty string
      as well), and advances the current position.
      
      No input checking for valid UTF-16 is done. This function is endianness
      agnostic - you should not assume the UTF-16 characters are in host
      endianness.
      
      This function will fail if no NUL-terminator was found in in the data.
      
      Note: there is no peek or get variant of this function to ensure correct
      byte alignment of the UTF-16 string.
  
      Params:
        str = address of a
              #guint16 pointer variable in which to store the result
      Returns: true if a string could be read, false otherwise. The
            string put into str must be freed with [glib.global.gfree] when no longer needed.
  */
  bool dupStringUtf16(out ushort[] str)
  {
    bool _retval;
    ushort* _str;
    _retval = cast(bool)gst_byte_reader_dup_string_utf16(cast(GstByteReader*)this._cPtr, &_str);
    uint _lenstr;
    if (_str)
    {
      for (; _str[_lenstr] != 0; _lenstr++)
      {
      }
    }
    str.length = _lenstr;
    str[0 .. $] = (cast(ushort*)_str)[0 .. _lenstr];
    gFree(cast(void*)_str);
    return _retval;
  }

  /**
      Free-function: g_free
      
      Returns a newly-allocated copy of the current data position if there is
      a NUL-terminated UTF-32 string in the data (this could be an empty string
      as well), and advances the current position.
      
      No input checking for valid UTF-32 is done. This function is endianness
      agnostic - you should not assume the UTF-32 characters are in host
      endianness.
      
      This function will fail if no NUL-terminator was found in in the data.
      
      Note: there is no peek or get variant of this function to ensure correct
      byte alignment of the UTF-32 string.
  
      Params:
        str = address of a
              #guint32 pointer variable in which to store the result
      Returns: true if a string could be read, false otherwise. The
            string put into str must be freed with [glib.global.gfree] when no longer needed.
  */
  bool dupStringUtf32(out uint[] str)
  {
    bool _retval;
    uint* _str;
    _retval = cast(bool)gst_byte_reader_dup_string_utf32(cast(GstByteReader*)this._cPtr, &_str);
    uint _lenstr;
    if (_str)
    {
      for (; _str[_lenstr] != 0; _lenstr++)
      {
      }
    }
    str.length = _lenstr;
    str[0 .. $] = (cast(uint*)_str)[0 .. _lenstr];
    gFree(cast(void*)_str);
    return _retval;
  }

  /**
      Free-function: g_free
      
      FIXME:Reads (copies) a NUL-terminated string in the #GstByteReader instance,
      advancing the current position to the byte after the string. This will work
      for any NUL-terminated string with a character width of 8 bits, so ASCII,
      UTF-8, ISO-8859-N etc. No input checking for valid UTF-8 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
  
      Params:
        str = address of a
              #gchar pointer variable in which to store the result
      Returns: true if a string could be read into str, false otherwise. The
            string put into str must be freed with [glib.global.gfree] when no longer needed.
  */
  bool dupStringUtf8(out string str)
  {
    bool _retval;
    char* _str;
    _retval = cast(bool)gst_byte_reader_dup_string_utf8(cast(GstByteReader*)this._cPtr, &_str);
    str = _str.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Read a 32 bit big endian floating point value into val
      and update the current position.
  
      Params:
        val = Pointer to a #gfloat to store the result
      Returns: true if successful, false otherwise.
  */
  bool getFloat32Be(out float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_float32_be(cast(GstByteReader*)this._cPtr, cast(float*)&val);
    return _retval;
  }

  /**
      Read a 32 bit little endian floating point value into val
      and update the current position.
  
      Params:
        val = Pointer to a #gfloat to store the result
      Returns: true if successful, false otherwise.
  */
  bool getFloat32Le(out float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_float32_le(cast(GstByteReader*)this._cPtr, cast(float*)&val);
    return _retval;
  }

  /**
      Read a 64 bit big endian floating point value into val
      and update the current position.
  
      Params:
        val = Pointer to a #gdouble to store the result
      Returns: true if successful, false otherwise.
  */
  bool getFloat64Be(out double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_float64_be(cast(GstByteReader*)this._cPtr, cast(double*)&val);
    return _retval;
  }

  /**
      Read a 64 bit little endian floating point value into val
      and update the current position.
  
      Params:
        val = Pointer to a #gdouble to store the result
      Returns: true if successful, false otherwise.
  */
  bool getFloat64Le(out double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_float64_le(cast(GstByteReader*)this._cPtr, cast(double*)&val);
    return _retval;
  }

  /**
      Read a signed 16 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt16Be(out short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int16_be(cast(GstByteReader*)this._cPtr, cast(short*)&val);
    return _retval;
  }

  /**
      Read a signed 16 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt16Le(out short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int16_le(cast(GstByteReader*)this._cPtr, cast(short*)&val);
    return _retval;
  }

  /**
      Read a signed 24 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt24Be(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int24_be(cast(GstByteReader*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 24 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt24Le(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int24_le(cast(GstByteReader*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 32 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt32Be(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int32_be(cast(GstByteReader*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 32 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt32Le(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int32_le(cast(GstByteReader*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 64 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt64Be(out long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int64_be(cast(GstByteReader*)this._cPtr, cast(long*)&val);
    return _retval;
  }

  /**
      Read a signed 64 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #gint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt64Le(out long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int64_le(cast(GstByteReader*)this._cPtr, cast(long*)&val);
    return _retval;
  }

  /**
      Read a signed 8 bit integer into val and update the current position.
  
      Params:
        val = Pointer to a #gint8 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getInt8(out byte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_int8(cast(GstByteReader*)this._cPtr, cast(byte*)&val);
    return _retval;
  }

  /**
      Returns the current position of a #GstByteReader instance in bytes.
      Returns: The current position of reader in bytes.
  */
  uint getPos()
  {
    uint _retval;
    _retval = gst_byte_reader_get_pos(cast(const(GstByteReader)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the remaining number of bytes of a #GstByteReader instance.
      Returns: The remaining number of bytes of reader instance.
  */
  uint getRemaining()
  {
    uint _retval;
    _retval = gst_byte_reader_get_remaining(cast(const(GstByteReader)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the total number of bytes of a #GstByteReader instance.
      Returns: The total number of bytes of reader instance.
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_byte_reader_get_size(cast(const(GstByteReader)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a constant pointer to the current data position if there is
      a NUL-terminated string in the data (this could be just a NUL terminator),
      advancing the current position to the byte after the string. This will work
      for any NUL-terminated string with a character width of 8 bits, so ASCII,
      UTF-8, ISO-8859-N etc.
      
      No input checking for valid UTF-8 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
  
      Params:
        str = address of a
              #gchar pointer variable in which to store the result
      Returns: true if a string could be found, false otherwise.
  */
  bool getStringUtf8(out string str)
  {
    bool _retval;
    char* _str;
    _retval = cast(bool)gst_byte_reader_get_string_utf8(cast(GstByteReader*)this._cPtr, &_str);
    str = _str.fromCString(No.Free);
    return _retval;
  }

  /**
      Read an unsigned 16 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint16Be(out ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint16_be(cast(GstByteReader*)this._cPtr, cast(ushort*)&val);
    return _retval;
  }

  /**
      Read an unsigned 16 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint16Le(out ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint16_le(cast(GstByteReader*)this._cPtr, cast(ushort*)&val);
    return _retval;
  }

  /**
      Read an unsigned 24 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint24Be(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint24_be(cast(GstByteReader*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 24 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint24Le(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint24_le(cast(GstByteReader*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 32 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint32Be(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint32_be(cast(GstByteReader*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 32 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint32Le(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint32_le(cast(GstByteReader*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 64 bit big endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint64Be(out ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint64_be(cast(GstByteReader*)this._cPtr, cast(ulong*)&val);
    return _retval;
  }

  /**
      Read an unsigned 64 bit little endian integer into val
      and update the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint64Le(out ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint64_le(cast(GstByteReader*)this._cPtr, cast(ulong*)&val);
    return _retval;
  }

  /**
      Read an unsigned 8 bit integer into val and update the current position.
  
      Params:
        val = Pointer to a #guint8 to store the result
      Returns: true if successful, false otherwise.
  */
  bool getUint8(out ubyte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_get_uint8(cast(GstByteReader*)this._cPtr, cast(ubyte*)&val);
    return _retval;
  }

  /**
      Initializes a #GstByteReader instance to read from data. This function
      can be called on already initialized instances.
  
      Params:
        data = data from which
              the #GstByteReader should read
  */
  void init_(ubyte[] data)
  {
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    gst_byte_reader_init(cast(GstByteReader*)this._cPtr, _data, _size);
  }

  /**
      Scan for pattern pattern with applied mask mask in the byte reader data,
      starting from offset offset relative to the current position.
      
      The bytes in pattern and mask are interpreted left-to-right, regardless
      of endianness.  All four bytes of the pattern must be present in the
      byte reader data for it to match, even if the first or last bytes are masked
      out.
      
      It is an error to call this function without making sure that there is
      enough data (offset+size bytes) in the byte reader.
  
      Params:
        mask = mask to apply to data before matching against pattern
        pattern = pattern to match (after mask is applied)
        offset = offset from which to start scanning, relative to the current
              position
        size = number of bytes to scan from offset
      Returns: offset of the first match, or -1 if no match was found.
        
        Example:
        ```
        // Assume the reader contains 0x00 0x01 0x02 ... 0xfe 0xff
        
        gst_byte_reader_masked_scan_uint32 (reader, 0xffffffff, 0x00010203, 0, 256);
        // -> returns 0
        gst_byte_reader_masked_scan_uint32 (reader, 0xffffffff, 0x00010203, 1, 255);
        // -> returns -1
        gst_byte_reader_masked_scan_uint32 (reader, 0xffffffff, 0x01020304, 1, 255);
        // -> returns 1
        gst_byte_reader_masked_scan_uint32 (reader, 0xffff, 0x0001, 0, 256);
        // -> returns -1
        gst_byte_reader_masked_scan_uint32 (reader, 0xffff, 0x0203, 0, 256);
        // -> returns 0
        gst_byte_reader_masked_scan_uint32 (reader, 0xffff0000, 0x02030000, 0, 256);
        // -> returns 2
        gst_byte_reader_masked_scan_uint32 (reader, 0xffff0000, 0x02030000, 0, 4);
        // -> returns -1
        ```
  */
  uint maskedScanUint32(uint mask, uint pattern, uint offset, uint size)
  {
    uint _retval;
    _retval = gst_byte_reader_masked_scan_uint32(cast(const(GstByteReader)*)this._cPtr, mask, pattern, offset, size);
    return _retval;
  }

  /**
      Scan for pattern pattern with applied mask mask in the byte reader data,
      starting from offset offset relative to the current position.
      
      The bytes in pattern and mask are interpreted left-to-right, regardless
      of endianness.  All four bytes of the pattern must be present in the
      byte reader data for it to match, even if the first or last bytes are masked
      out.
      
      It is an error to call this function without making sure that there is
      enough data (offset+size bytes) in the byte reader.
  
      Params:
        mask = mask to apply to data before matching against pattern
        pattern = pattern to match (after mask is applied)
        offset = offset from which to start scanning, relative to the current
              position
        size = number of bytes to scan from offset
        value = pointer to uint32 to return matching data
      Returns: offset of the first match, or -1 if no match was found.
  */
  uint maskedScanUint32Peek(uint mask, uint pattern, uint offset, uint size, out uint value)
  {
    uint _retval;
    _retval = gst_byte_reader_masked_scan_uint32_peek(cast(const(GstByteReader)*)this._cPtr, mask, pattern, offset, size, cast(uint*)&value);
    return _retval;
  }

  /**
      Read a 32 bit big endian floating point value into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gfloat to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekFloat32Be(out float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_float32_be(cast(const(GstByteReader)*)this._cPtr, cast(float*)&val);
    return _retval;
  }

  /**
      Read a 32 bit little endian floating point value into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gfloat to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekFloat32Le(out float val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_float32_le(cast(const(GstByteReader)*)this._cPtr, cast(float*)&val);
    return _retval;
  }

  /**
      Read a 64 bit big endian floating point value into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gdouble to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekFloat64Be(out double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_float64_be(cast(const(GstByteReader)*)this._cPtr, cast(double*)&val);
    return _retval;
  }

  /**
      Read a 64 bit little endian floating point value into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gdouble to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekFloat64Le(out double val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_float64_le(cast(const(GstByteReader)*)this._cPtr, cast(double*)&val);
    return _retval;
  }

  /**
      Read a signed 16 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt16Be(out short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int16_be(cast(const(GstByteReader)*)this._cPtr, cast(short*)&val);
    return _retval;
  }

  /**
      Read a signed 16 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt16Le(out short val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int16_le(cast(const(GstByteReader)*)this._cPtr, cast(short*)&val);
    return _retval;
  }

  /**
      Read a signed 24 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt24Be(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int24_be(cast(const(GstByteReader)*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 24 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt24Le(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int24_le(cast(const(GstByteReader)*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 32 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt32Be(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int32_be(cast(const(GstByteReader)*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 32 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt32Le(out int val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int32_le(cast(const(GstByteReader)*)this._cPtr, cast(int*)&val);
    return _retval;
  }

  /**
      Read a signed 64 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt64Be(out long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int64_be(cast(const(GstByteReader)*)this._cPtr, cast(long*)&val);
    return _retval;
  }

  /**
      Read a signed 64 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #gint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt64Le(out long val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int64_le(cast(const(GstByteReader)*)this._cPtr, cast(long*)&val);
    return _retval;
  }

  /**
      Read a signed 8 bit integer into val but keep the current position.
  
      Params:
        val = Pointer to a #gint8 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekInt8(out byte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_int8(cast(const(GstByteReader)*)this._cPtr, cast(byte*)&val);
    return _retval;
  }

  /**
      Returns a constant pointer to the current data position if there is
      a NUL-terminated string in the data (this could be just a NUL terminator).
      The current position will be maintained. This will work for any
      NUL-terminated string with a character width of 8 bits, so ASCII,
      UTF-8, ISO-8859-N etc.
      
      No input checking for valid UTF-8 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
  
      Params:
        str = address of a
              #gchar pointer variable in which to store the result
      Returns: true if a string could be skipped, false otherwise.
  */
  bool peekStringUtf8(out string str)
  {
    bool _retval;
    char* _str;
    _retval = cast(bool)gst_byte_reader_peek_string_utf8(cast(const(GstByteReader)*)this._cPtr, &_str);
    str = _str.fromCString(No.Free);
    return _retval;
  }

  /**
      Read an unsigned 16 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint16Be(out ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint16_be(cast(const(GstByteReader)*)this._cPtr, cast(ushort*)&val);
    return _retval;
  }

  /**
      Read an unsigned 16 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint16Le(out ushort val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint16_le(cast(const(GstByteReader)*)this._cPtr, cast(ushort*)&val);
    return _retval;
  }

  /**
      Read an unsigned 24 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint24Be(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint24_be(cast(const(GstByteReader)*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 24 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint24Le(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint24_le(cast(const(GstByteReader)*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 32 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint32Be(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint32_be(cast(const(GstByteReader)*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 32 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint32Le(out uint val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint32_le(cast(const(GstByteReader)*)this._cPtr, cast(uint*)&val);
    return _retval;
  }

  /**
      Read an unsigned 64 bit big endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint64Be(out ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint64_be(cast(const(GstByteReader)*)this._cPtr, cast(ulong*)&val);
    return _retval;
  }

  /**
      Read an unsigned 64 bit little endian integer into val
      but keep the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint64Le(out ulong val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint64_le(cast(const(GstByteReader)*)this._cPtr, cast(ulong*)&val);
    return _retval;
  }

  /**
      Read an unsigned 8 bit integer into val but keep the current position.
  
      Params:
        val = Pointer to a #guint8 to store the result
      Returns: true if successful, false otherwise.
  */
  bool peekUint8(out ubyte val)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_peek_uint8(cast(const(GstByteReader)*)this._cPtr, cast(ubyte*)&val);
    return _retval;
  }

  /**
      Sets the new position of a #GstByteReader instance to pos in bytes.
  
      Params:
        pos = The new position in bytes
      Returns: true if the position could be set successfully, false
        otherwise.
  */
  bool setPos(uint pos)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_set_pos(cast(GstByteReader*)this._cPtr, pos);
    return _retval;
  }

  /**
      Skips nbytes bytes of the #GstByteReader instance.
  
      Params:
        nbytes = the number of bytes to skip
      Returns: true if nbytes bytes could be skipped, false otherwise.
  */
  bool skip(uint nbytes)
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_skip(cast(GstByteReader*)this._cPtr, nbytes);
    return _retval;
  }

  /**
      Skips a NUL-terminated UTF-16 string in the #GstByteReader instance,
      advancing the current position to the byte after the string.
      
      No input checking for valid UTF-16 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
      Returns: true if a string could be skipped, false otherwise.
  */
  bool skipStringUtf16()
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_skip_string_utf16(cast(GstByteReader*)this._cPtr);
    return _retval;
  }

  /**
      Skips a NUL-terminated UTF-32 string in the #GstByteReader instance,
      advancing the current position to the byte after the string.
      
      No input checking for valid UTF-32 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
      Returns: true if a string could be skipped, false otherwise.
  */
  bool skipStringUtf32()
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_skip_string_utf32(cast(GstByteReader*)this._cPtr);
    return _retval;
  }

  /**
      Skips a NUL-terminated string in the #GstByteReader instance, advancing
      the current position to the byte after the string. This will work for
      any NUL-terminated string with a character width of 8 bits, so ASCII,
      UTF-8, ISO-8859-N etc. No input checking for valid UTF-8 is done.
      
      This function will fail if no NUL-terminator was found in in the data.
      Returns: true if a string could be skipped, false otherwise.
  */
  bool skipStringUtf8()
  {
    bool _retval;
    _retval = cast(bool)gst_byte_reader_skip_string_utf8(cast(GstByteReader*)this._cPtr);
    return _retval;
  }
}
