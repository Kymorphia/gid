/// Module for [BitWriter] class
module gstbase.bit_writer;

import gid.gid;
import gst.buffer;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstBitWriter provides a bit writer that can write any number of
    bits into a memory buffer. It provides functions for writing any
    number of bits into 8, 16, 32 and 64 bit variables.
*/
class BitWriter
{
  GstBitWriter cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstbase.bit_writer.BitWriter");

    cInstance = *cast(GstBitWriter*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `bitSize` field.
      Returns: Size of written @data in bits
  */
  @property uint bitSize()
  {
    return (cast(GstBitWriter*)this._cPtr).bitSize;
  }

  /**
      Set `bitSize` field.
      Params:
        propval = Size of written @data in bits
  */
  @property void bitSize(uint propval)
  {
    (cast(GstBitWriter*)this._cPtr).bitSize = propval;
  }

  /**
      Write trailing bit to align last byte of data. trailing_bit can
      only be 1 or 0.
  
      Params:
        trailingBit = trailing bits of last byte, 0 or 1
      Returns: true if successful, false otherwise.
  */
  bool alignBytes(ubyte trailingBit)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_align_bytes(cast(GstBitWriter*)this._cPtr, trailingBit);
    return _retval;
  }

  /**
      Frees bitwriter without destroying the internal data, which is
      returned as #GstBuffer.
      
      Free-function: gst_buffer_unref
      Returns: a new allocated #GstBuffer wrapping the
            data inside. gst_buffer_unref() after usage.
  */
  gst.buffer.Buffer freeAndGetBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_bit_writer_free_and_get_buffer(cast(GstBitWriter*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  uint getRemaining()
  {
    uint _retval;
    _retval = gst_bit_writer_get_remaining(cast(const(GstBitWriter)*)this._cPtr);
    return _retval;
  }

  /**
      Get size of written data
      Returns: size of bits written in data
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_bit_writer_get_size(cast(const(GstBitWriter)*)this._cPtr);
    return _retval;
  }

  /**
      Write nbits bits of value to #GstBitWriter.
  
      Params:
        value = value of #guint16 to write
        nbits = number of bits to write
      Returns: true if successful, false otherwise.
  */
  bool putBitsUint16(ushort value, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_put_bits_uint16(cast(GstBitWriter*)this._cPtr, value, nbits);
    return _retval;
  }

  /**
      Write nbits bits of value to #GstBitWriter.
  
      Params:
        value = value of #guint32 to write
        nbits = number of bits to write
      Returns: true if successful, false otherwise.
  */
  bool putBitsUint32(uint value, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_put_bits_uint32(cast(GstBitWriter*)this._cPtr, value, nbits);
    return _retval;
  }

  /**
      Write nbits bits of value to #GstBitWriter.
  
      Params:
        value = value of #guint64 to write
        nbits = number of bits to write
      Returns: true if successful, false otherwise.
  */
  bool putBitsUint64(ulong value, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_put_bits_uint64(cast(GstBitWriter*)this._cPtr, value, nbits);
    return _retval;
  }

  /**
      Write nbits bits of value to #GstBitWriter.
  
      Params:
        value = value of #guint8 to write
        nbits = number of bits to write
      Returns: true if successful, false otherwise.
  */
  bool putBitsUint8(ubyte value, uint nbits)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_put_bits_uint8(cast(GstBitWriter*)this._cPtr, value, nbits);
    return _retval;
  }

  /**
      Write nbytes bytes of data to #GstBitWriter.
  
      Params:
        data = pointer of data to write
      Returns: true if successful, false otherwise.
  */
  bool putBytes(ubyte[] data)
  {
    bool _retval;
    uint _nbytes;
    if (data)
      _nbytes = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_bit_writer_put_bytes(cast(GstBitWriter*)this._cPtr, _data, _nbytes);
    return _retval;
  }

  /**
      Resets bitwriter and frees the data if it's owned by bitwriter.
  */
  void reset()
  {
    gst_bit_writer_reset(cast(GstBitWriter*)this._cPtr);
  }

  /**
      Resets bitwriter and returns the current data as #GstBuffer.
      
      Free-function: gst_buffer_unref
      Returns: a new allocated #GstBuffer wrapping the
            current data. gst_buffer_unref() after usage.
  */
  gst.buffer.Buffer resetAndGetBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_bit_writer_reset_and_get_buffer(cast(GstBitWriter*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  bool setPos(uint pos)
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_set_pos(cast(GstBitWriter*)this._cPtr, pos);
    return _retval;
  }
}
