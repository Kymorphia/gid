/// Module for [BitReader] struct
module gstbase.bit_reader;

import gid.gid;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstBitReader provides a bit reader that can read any number of bits
    from a memory buffer. It provides functions for reading any number of bits
    into 8, 16, 32 and 64 bit variables.
*/
struct BitReader
{
  /**
      Data from which the bit reader will
        read
  */
  const(ubyte)* data;

  /**
      Size of @data in bytes
  */
  uint size;

  /**
      Current byte position
  */
  uint byte_;

  /**
      Bit position in the current byte
  */
  uint bit;

  /** */
  void*[4] GstReserved;

  /**
      Read nbits bits into val and update the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool getBitsUint16(out ushort val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_get_bits_uint16(cast(GstBitReader*)&this, cast(ushort*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val and update the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool getBitsUint32(out uint val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_get_bits_uint32(cast(GstBitReader*)&this, cast(uint*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val and update the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool getBitsUint64(out ulong val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_get_bits_uint64(cast(GstBitReader*)&this, cast(ulong*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val and update the current position.
  
      Params:
        val = Pointer to a #guint8 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool getBitsUint8(out ubyte val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_get_bits_uint8(cast(GstBitReader*)&this, cast(ubyte*)&val, nbits);
    return _retval;
  }

  /**
      Returns the current position of a #GstBitReader instance in bits.
      Returns: The current position of reader in bits.
  */
  uint getPos()
  {
    uint _retval;
    _retval = gst_bit_reader_get_pos(cast(const(GstBitReader)*)&this);
    return _retval;
  }

  /**
      Returns the remaining number of bits of a #GstBitReader instance.
      Returns: The remaining number of bits of reader instance.
  */
  uint getRemaining()
  {
    uint _retval;
    _retval = gst_bit_reader_get_remaining(cast(const(GstBitReader)*)&this);
    return _retval;
  }

  /**
      Returns the total number of bits of a #GstBitReader instance.
      Returns: The total number of bits of reader instance.
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_bit_reader_get_size(cast(const(GstBitReader)*)&this);
    return _retval;
  }

  /**
      Initializes a #GstBitReader instance to read from data. This function
      can be called on already initialized instances.
  
      Params:
        data = data from which the bit reader should read
  */
  void init_(ubyte[] data)
  {
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    gst_bit_reader_init(cast(GstBitReader*)&this, _data, _size);
  }

  /**
      Read nbits bits into val but keep the current position.
  
      Params:
        val = Pointer to a #guint16 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool peekBitsUint16(out ushort val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_peek_bits_uint16(cast(const(GstBitReader)*)&this, cast(ushort*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val but keep the current position.
  
      Params:
        val = Pointer to a #guint32 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool peekBitsUint32(out uint val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_peek_bits_uint32(cast(const(GstBitReader)*)&this, cast(uint*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val but keep the current position.
  
      Params:
        val = Pointer to a #guint64 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool peekBitsUint64(out ulong val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_peek_bits_uint64(cast(const(GstBitReader)*)&this, cast(ulong*)&val, nbits);
    return _retval;
  }

  /**
      Read nbits bits into val but keep the current position.
  
      Params:
        val = Pointer to a #guint8 to store the result
        nbits = number of bits to read
      Returns: true if successful, false otherwise.
  */
  bool peekBitsUint8(out ubyte val, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_peek_bits_uint8(cast(const(GstBitReader)*)&this, cast(ubyte*)&val, nbits);
    return _retval;
  }

  /**
      Sets the new position of a #GstBitReader instance to pos in bits.
  
      Params:
        pos = The new position in bits
      Returns: true if the position could be set successfully, false
        otherwise.
  */
  bool setPos(uint pos)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_set_pos(cast(GstBitReader*)&this, pos);
    return _retval;
  }

  /**
      Skips nbits bits of the #GstBitReader instance.
  
      Params:
        nbits = the number of bits to skip
      Returns: true if nbits bits could be skipped, false otherwise.
  */
  bool skip(uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_skip(cast(GstBitReader*)&this, nbits);
    return _retval;
  }

  /**
      Skips until the next byte.
      Returns: true if successful, false otherwise.
  */
  bool skipToByte()
  {
    bool _retval;
    _retval = cast(bool)gst_bit_reader_skip_to_byte(cast(GstBitReader*)&this);
    return _retval;
  }
}
