//!gir GstBase-1.0
//!info description "D binding for the GstBase library - Base and Utility classes for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gstbase1/
//!info capi https://gstreamer.freedesktop.org/documentation/base/index.html

//# Hand-written below: Data arrays with a size from the writer (bit size or written size)
//!set record[BitWriter].method[get_data][ignore] 1
//!set record[BitWriter].method[reset_and_get_data][ignore] 1
//!set record[ByteWriter].method[reset_and_get_data][ignore] 1

//# Set length of array parameters
//!set record[BitWriter].method[put_bytes].parameters.parameter[data].array[][length] 1

//# Set arrays to be zero-terminated=1
//!set record[ByteReader].method[dup_string_utf16].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteReader].method[dup_string_utf32].parameters.parameter[str].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf16].parameters.parameter[data].array[][zero-terminated] 1
//!set record[ByteWriter].method[put_string_utf32].parameters.parameter[data].array[][zero-terminated] 1

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[BaseParseFrame].field[buffer][owned] 1
//!set record[BaseParseFrame].field[out_buffer][owned] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[BitReader].field[data][writable] 0
//!set record[ByteReader].field[data][writable] 0
//!set record[ByteWriter].field[parent][writable] 0

//# Ignore: CollectPads is deprecated in favor of Aggregator and add_pad requires a raw structure size and destroy notify
//!set class[CollectPads].method[add_pad][ignore] 1

//# Ignore: Free the stack/inline writer and return its data, redundant with the non-freeing accessors in D
//!set record[BitWriter].method[free_and_get_buffer][ignore] 1
//!set record[ByteWriter].method[free_and_get_buffer][ignore] 1
//!set record[ByteWriter].method[free_and_get_data][ignore] 1
//!set record[BitWriter].method[free_and_get_data][ignore] 1

//# Ignore: Data array field with a length in bits (bit_size), use BitWriter.getData
//!set record[BitWriter].field[data][ignore] 1
//!class BitWriter

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

//!class ByteWriter

  /**
      Resets the byte writer and returns the data which was written.
      Returns: the written data
  */
  ubyte[] resetAndGetData() nothrow
  {
    import glib.c.functions : g_free;

    auto writer = cast(GstByteWriter*)this._cPtr;
    auto size = writer.parent.size;
    auto _cretval = gst_byte_writer_reset_and_get_data(writer);
    auto _retval = _cretval ? _cretval[0 .. size].dup : null;
    g_free(_cretval);
    return _retval;
  }
