/// Module for [BitWriter] class
module gstbase.bit_writer;

public import gid.basictypes;
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
class BitWriter : StructWrap!(GstBitWriter)
{
  /**
      Create a `bit_writer.BitWriter` wrap type.
      Params:
        bitSize = Size of written @data in bits
  */
  this(uint bitSize = uint.init) nothrow
  {
    this.bitSize = bitSize;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `bitSize` field.
      Returns: Size of written @data in bits
  */
  @property uint bitSize() nothrow
  {
    return (cast(GstBitWriter*)this._cPtr).bitSize;
  }

  /**
      Set `bitSize` field.
      Params:
        propval = Size of written @data in bits
  */
  @property void bitSize(uint propval) nothrow
  {
    (cast(GstBitWriter*)this._cPtr).bitSize = propval;
  }

  /**
  Get a copy of the written data, the size is the bit size rounded up to whole bytes.
  Returns: a copy of the written data
  */
  ubyte[] getData() nothrow
  {
    auto writer = cast(GstBitWriter*)this._cPtr;

    if (!writer.data)
      return null;

    return writer.data[0 .. (writer.bitSize + 7) / 8].dup;
  }

  /**
  Resets the bit writer and returns the data which was written.
  Returns: the written data, the size is the bit size rounded up to whole bytes
  */
  ubyte[] resetAndGetData() nothrow
  {
    import glib.c.functions : g_free;

    auto writer = cast(GstBitWriter*)this._cPtr;
    auto size = (writer.bitSize + 7) / 8;
    auto owned = writer.owned; // Owned data is duplicated (and the original freed), otherwise external data is returned
    auto _cretval = gst_bit_writer_reset_and_get_data(writer);
    auto _retval = _cretval ? _cretval[0 .. size].dup : null;

    if (owned)
      g_free(_cretval);

    return _retval;
  }


  /**
      Write trailing bit to align last byte of data. trailing_bit can
      only be 1 or 0.
  
      Params:
        trailingBit = trailing bits of last byte, 0 or 1
      Returns: true if successful, false otherwise.
  */
  bool alignBytes(ubyte trailingBit) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_align_bytes(cast(GstBitWriter*)this._cPtr, trailingBit);
    return _retval;
  }

  /** */
  uint getRemaining() nothrow
  {
    uint _retval;
    _retval = gst_bit_writer_get_remaining(cast(const(GstBitWriter)*)this._cPtr);
    return _retval;
  }

  /**
      Get size of written data
      Returns: size of bits written in data
  */
  uint getSize() nothrow
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
  bool putBitsUint16(ushort value, uint nbits) nothrow
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
  bool putBitsUint32(uint value, uint nbits) nothrow
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
  bool putBitsUint64(ulong value, uint nbits) nothrow
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
  bool putBitsUint8(ubyte value, uint nbits) nothrow
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
  bool putBytes(ubyte[] data) nothrow
  {
    bool _retval;
    uint _nbytes;
    if (data)
      _nbytes = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)gst_bit_writer_put_bytes(cast(GstBitWriter*)this._cPtr, _data, _nbytes);
    return _retval;
  }

  /**
      Resets bitwriter and frees the data if it's owned by bitwriter.
  */
  void reset() nothrow
  {
    gst_bit_writer_reset(cast(GstBitWriter*)this._cPtr);
  }

  /**
      Resets bitwriter and returns the current data as #GstBuffer.
      
      Free-function: gst_buffer_unref
      Returns: a new allocated #GstBuffer wrapping the
            current data. [gst.buffer.Buffer.unref] after usage.
  */
  gst.buffer.Buffer resetAndGetBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_bit_writer_reset_and_get_buffer(cast(GstBitWriter*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  bool setPos(uint pos) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bit_writer_set_pos(cast(GstBitWriter*)this._cPtr, pos);
    return _retval;
  }
}
