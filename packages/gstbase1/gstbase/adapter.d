/// Module for [Adapter] class
module gstbase.adapter;

import gid.gid;
import glib.bytes;
import gobject.object;
import gst.buffer;
import gst.buffer_list;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    This class is for elements that receive buffers in an undesired size.
    While for example raw video contains one image per buffer, the same is not
    true for a lot of other formats, especially those that come directly from
    a file. So if you have undefined buffer sizes and require a specific size,
    this object is for you.
    
    An adapter is created with [gstbase.adapter.Adapter.new_]. It can be freed again with
    [gobject.object.ObjectWrap.unref].
    
    The theory of operation is like this: All buffers received are put
    into the adapter using [gstbase.adapter.Adapter.push] and the data is then read back
    in chunks of the desired size using [gstbase.adapter.Adapter.map]/[gstbase.adapter.Adapter.unmap]
    and/or [gstbase.adapter.Adapter.copy]. After the data has been processed, it is freed
    using [gstbase.adapter.Adapter.unmap].
    
    Other methods such as [gstbase.adapter.Adapter.take] and [gstbase.adapter.Adapter.takeBuffer]
    combine [gstbase.adapter.Adapter.map] and [gstbase.adapter.Adapter.unmap] in one method and are
    potentially more convenient for some use cases.
    
    For example, a sink pad's chain function that needs to pass data to a library
    in 512-byte chunks could be implemented like this:
    ```c
    static GstFlowReturn
    sink_pad_chain (GstPad *pad, GstObject *parent, GstBuffer *buffer)
    {
      MyElement *this;
      GstAdapter *adapter;
      GstFlowReturn ret = GST_FLOW_OK;
    
      this = MY_ELEMENT (parent);
    
      adapter = this->adapter;
    
      // put buffer into adapter
      gst_adapter_push (adapter, buffer);
    
      // while we can read out 512 bytes, process them
      while (gst_adapter_available (adapter) >= 512 && ret == GST_FLOW_OK) {
        const guint8 *data = gst_adapter_map (adapter, 512);
        // use flowreturn as an error value
        ret = my_library_foo (data);
        gst_adapter_unmap (adapter);
        gst_adapter_flush (adapter, 512);
      }
      return ret;
    }
    ```
    
    For another example, a simple element inside GStreamer that uses #GstAdapter
    is the libvisual element.
    
    An element using #GstAdapter in its sink pad chain function should ensure that
    when the FLUSH_STOP event is received, that any queued data is cleared using
    [gstbase.adapter.Adapter.clear]. Data should also be cleared or processed on EOS and
    when changing state from [gst.types.State.Paused] to [gst.types.State.Ready].
    
    Also check the GST_BUFFER_FLAG_DISCONT flag on the buffer. Some elements might
    need to clear the adapter after a discontinuity.
    
    The adapter will keep track of the timestamps of the buffers
    that were pushed. The last seen timestamp before the current position
    can be queried with [gstbase.adapter.Adapter.prevPts]. This function can
    optionally return the number of bytes between the start of the buffer that
    carried the timestamp and the current adapter position. The distance is
    useful when dealing with, for example, raw audio samples because it allows
    you to calculate the timestamp of the current adapter position by using the
    last seen timestamp and the amount of bytes since.  Additionally, the
    [gstbase.adapter.Adapter.prevPtsAtOffset] can be used to determine the last
    seen timestamp at a particular offset in the adapter.
    
    The adapter will also keep track of the offset of the buffers
    (#GST_BUFFER_OFFSET) that were pushed. The last seen offset before the
    current position can be queried with [gstbase.adapter.Adapter.prevOffset]. This function
    can optionally return the number of bytes between the start of the buffer
    that carried the offset and the current adapter position.
    
    Additionally the adapter also keeps track of the PTS, DTS and buffer offset
    at the last discontinuity, which can be retrieved with
    [gstbase.adapter.Adapter.ptsAtDiscont], [gstbase.adapter.Adapter.dtsAtDiscont] and
    [gstbase.adapter.Adapter.offsetAtDiscont]. The number of bytes that were consumed
    since then can be queried with [gstbase.adapter.Adapter.distanceFromDiscont].
    
    A last thing to note is that while #GstAdapter is pretty optimized,
    merging buffers still might be an operation that requires a `malloc()` and
    `memcpy()` operation, and these operations are not the fastest. Because of
    this, some functions like [gstbase.adapter.Adapter.availableFast] are provided to help
    speed up such cases should you want to. To avoid repeated memory allocations,
    [gstbase.adapter.Adapter.copy] can be used to copy data into a (statically allocated)
    user provided buffer.
    
    #GstAdapter is not MT safe. All operations on an adapter must be serialized by
    the caller. This is not normally a problem, however, as the normal use case
    of #GstAdapter is inside one pad's chain function, in which case access is
    serialized via the pad's STREAM_LOCK.
    
    Note that [gstbase.adapter.Adapter.push] takes ownership of the buffer passed. Use
    gst_buffer_ref() before pushing it into the adapter if you still want to
    access the buffer later. The adapter will never modify the data in the
    buffer pushed in it.
*/
class Adapter : gobject.object.ObjectWrap
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
    return cast(void function())gst_adapter_get_type != &gidSymbolNotFound ? gst_adapter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Adapter self()
  {
    return this;
  }

  /**
      Creates a new #GstAdapter. Free with [gobject.object.ObjectWrap.unref].
      Returns: a new #GstAdapter
  */
  this()
  {
    GstAdapter* _cretval;
    _cretval = gst_adapter_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the maximum amount of bytes available, that is it returns the maximum
      value that can be supplied to [gstbase.adapter.Adapter.map] without that function
      returning null.
      Returns: number of bytes available in adapter
  */
  size_t available()
  {
    size_t _retval;
    _retval = gst_adapter_available(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum number of bytes that are immediately available without
      requiring any expensive operations (like copying the data into a
      temporary buffer).
      Returns: number of bytes that are available in adapter without expensive
        operations
  */
  size_t availableFast()
  {
    size_t _retval;
    _retval = gst_adapter_available_fast(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Removes all buffers from adapter.
  */
  void clear()
  {
    gst_adapter_clear(cast(GstAdapter*)this._cPtr);
  }

  /**
      Similar to gst_adapter_copy, but more suitable for language bindings. size
      bytes of data starting at offset will be copied out of the buffers contained
      in adapter and into a new #GBytes structure which is returned. Depending on
      the value of the size argument an empty #GBytes structure may be returned.
  
      Params:
        offset = the bytes offset in the adapter to start from
        size = the number of bytes to copy
      Returns: A new #GBytes structure containing the copied data.
  */
  glib.bytes.Bytes copy(size_t offset, size_t size)
  {
    GBytes* _cretval;
    _cretval = gst_adapter_copy_bytes(cast(GstAdapter*)this._cPtr, offset, size);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the distance in bytes since the last buffer with the
      [gst.types.BufferFlags.Discont] flag.
      
      The distance will be reset to 0 for all buffers with
      [gst.types.BufferFlags.Discont] on them, and then calculated for all other
      following buffers based on their size.
      Returns: The offset. Can be [gst.types.BUFFER_OFFSET_NONE].
  */
  ulong distanceFromDiscont()
  {
    ulong _retval;
    _retval = gst_adapter_distance_from_discont(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Get the DTS that was on the last buffer with the GST_BUFFER_FLAG_DISCONT
      flag, or GST_CLOCK_TIME_NONE.
      Returns: The DTS at the last discont or GST_CLOCK_TIME_NONE.
  */
  gst.types.ClockTime dtsAtDiscont()
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_dts_at_discont(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Flushes the first flush bytes in the adapter. The caller must ensure that
      at least this many bytes are available.
      
      See also: [gstbase.adapter.Adapter.map], [gstbase.adapter.Adapter.unmap]
  
      Params:
        flush = the number of bytes to flush
  */
  void flush(size_t flush)
  {
    gst_adapter_flush(cast(GstAdapter*)this._cPtr, flush);
  }

  /**
      Returns a #GstBuffer containing the first nbytes of the adapter, but
      does not flush them from the adapter. See [gstbase.adapter.Adapter.takeBuffer]
      for details.
      
      Caller owns a reference to the returned buffer. gst_buffer_unref() after
      usage.
      
      Free-function: gst_buffer_unref
  
      Params:
        nbytes = the number of bytes to get
      Returns: a #GstBuffer containing the first
            nbytes of the adapter, or null if nbytes bytes are not available.
            gst_buffer_unref() when no longer needed.
  */
  gst.buffer.Buffer getBuffer(size_t nbytes)
  {
    GstBuffer* _cretval;
    _cretval = gst_adapter_get_buffer(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GstBuffer containing the first nbytes of the adapter, but
      does not flush them from the adapter. See [gstbase.adapter.Adapter.takeBufferFast]
      for details.
      
      Caller owns a reference to the returned buffer. gst_buffer_unref() after
      usage.
      
      Free-function: gst_buffer_unref
  
      Params:
        nbytes = the number of bytes to get
      Returns: a #GstBuffer containing the first
            nbytes of the adapter, or null if nbytes bytes are not available.
            gst_buffer_unref() when no longer needed.
  */
  gst.buffer.Buffer getBufferFast(size_t nbytes)
  {
    GstBuffer* _cretval;
    _cretval = gst_adapter_get_buffer_fast(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GstBufferList of buffers containing the first nbytes bytes of
      the adapter but does not flush them from the adapter. See
      [gstbase.adapter.Adapter.takeBufferList] for details.
      
      Caller owns the returned list. Call gst_buffer_list_unref() to free
      the list after usage.
  
      Params:
        nbytes = the number of bytes to get
      Returns: a #GstBufferList of buffers containing
            the first nbytes of the adapter, or null if nbytes bytes are not
            available
  */
  gst.buffer_list.BufferList getBufferList(size_t nbytes)
  {
    GstBufferList* _cretval;
    _cretval = gst_adapter_get_buffer_list(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GList of buffers containing the first nbytes bytes of the
      adapter, but does not flush them from the adapter. See
      [gstbase.adapter.Adapter.takeList] for details.
      
      Caller owns returned list and contained buffers. gst_buffer_unref() each
      buffer in the list before freeing the list after usage.
  
      Params:
        nbytes = the number of bytes to get
      Returns: a #GList of
            buffers containing the first nbytes of the adapter, or null if nbytes
            bytes are not available
  */
  gst.buffer.Buffer[] getList(size_t nbytes)
  {
    GList* _cretval;
    _cretval = gst_adapter_get_list(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = gListToD!(gst.buffer.Buffer, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Scan for pattern pattern with applied mask mask in the adapter data,
      starting from offset offset.
      
      The bytes in pattern and mask are interpreted left-to-right, regardless
      of endianness.  All four bytes of the pattern must be present in the
      adapter for it to match, even if the first or last bytes are masked out.
      
      It is an error to call this function without making sure that there is
      enough data (offset+size bytes) in the adapter.
      
      This function calls [gstbase.adapter.Adapter.maskedScanUint32Peek] passing null
      for value.
  
      Params:
        mask = mask to apply to data before matching against pattern
        pattern = pattern to match (after mask is applied)
        offset = offset into the adapter data from which to start scanning, returns
                   the last scanned position.
        size = number of bytes to scan from offset
      Returns: offset of the first match, or -1 if no match was found.
        
        Example:
        ```
        // Assume the adapter contains 0x00 0x01 0x02 ... 0xfe 0xff
        
        gst_adapter_masked_scan_uint32 (adapter, 0xffffffff, 0x00010203, 0, 256);
        // -> returns 0
        gst_adapter_masked_scan_uint32 (adapter, 0xffffffff, 0x00010203, 1, 255);
        // -> returns -1
        gst_adapter_masked_scan_uint32 (adapter, 0xffffffff, 0x01020304, 1, 255);
        // -> returns 1
        gst_adapter_masked_scan_uint32 (adapter, 0xffff, 0x0001, 0, 256);
        // -> returns -1
        gst_adapter_masked_scan_uint32 (adapter, 0xffff, 0x0203, 0, 256);
        // -> returns 0
        gst_adapter_masked_scan_uint32 (adapter, 0xffff0000, 0x02030000, 0, 256);
        // -> returns 2
        gst_adapter_masked_scan_uint32 (adapter, 0xffff0000, 0x02030000, 0, 4);
        // -> returns -1
        ```
  */
  ptrdiff_t maskedScanUint32(uint mask, uint pattern, size_t offset, size_t size)
  {
    ptrdiff_t _retval;
    _retval = gst_adapter_masked_scan_uint32(cast(GstAdapter*)this._cPtr, mask, pattern, offset, size);
    return _retval;
  }

  /**
      Scan for pattern pattern with applied mask mask in the adapter data,
      starting from offset offset.  If a match is found, the value that matched
      is returned through value, otherwise value is left untouched.
      
      The bytes in pattern and mask are interpreted left-to-right, regardless
      of endianness.  All four bytes of the pattern must be present in the
      adapter for it to match, even if the first or last bytes are masked out.
      
      It is an error to call this function without making sure that there is
      enough data (offset+size bytes) in the adapter.
  
      Params:
        mask = mask to apply to data before matching against pattern
        pattern = pattern to match (after mask is applied)
        offset = offset into the adapter data from which to start scanning, returns
                   the last scanned position.
        size = number of bytes to scan from offset
        value = pointer to uint32 to return matching data
      Returns: offset of the first match, or -1 if no match was found.
  */
  ptrdiff_t maskedScanUint32Peek(uint mask, uint pattern, size_t offset, size_t size, out uint value)
  {
    ptrdiff_t _retval;
    _retval = gst_adapter_masked_scan_uint32_peek(cast(GstAdapter*)this._cPtr, mask, pattern, offset, size, cast(uint*)&value);
    return _retval;
  }

  /**
      Get the offset that was on the last buffer with the GST_BUFFER_FLAG_DISCONT
      flag, or GST_BUFFER_OFFSET_NONE.
      Returns: The offset at the last discont or GST_BUFFER_OFFSET_NONE.
  */
  ulong offsetAtDiscont()
  {
    ulong _retval;
    _retval = gst_adapter_offset_at_discont(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Get the dts that was before the current byte in the adapter. When
      distance is given, the amount of bytes between the dts and the current
      position is returned.
      
      The dts is reset to GST_CLOCK_TIME_NONE and the distance is set to 0 when
      the adapter is first created or when it is cleared. This also means that before
      the first byte with a dts is removed from the adapter, the dts
      and distance returned are GST_CLOCK_TIME_NONE and 0 respectively.
  
      Params:
        distance = pointer to location for distance, or null
      Returns: The previously seen dts.
  */
  gst.types.ClockTime prevDts(out ulong distance)
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_prev_dts(cast(GstAdapter*)this._cPtr, cast(ulong*)&distance);
    return _retval;
  }

  /**
      Get the dts that was before the byte at offset offset in the adapter. When
      distance is given, the amount of bytes between the dts and the current
      position is returned.
      
      The dts is reset to GST_CLOCK_TIME_NONE and the distance is set to 0 when
      the adapter is first created or when it is cleared. This also means that before
      the first byte with a dts is removed from the adapter, the dts
      and distance returned are GST_CLOCK_TIME_NONE and 0 respectively.
  
      Params:
        offset = the offset in the adapter at which to get timestamp
        distance = pointer to location for distance, or null
      Returns: The previously seen dts at given offset.
  */
  gst.types.ClockTime prevDtsAtOffset(size_t offset, out ulong distance)
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_prev_dts_at_offset(cast(GstAdapter*)this._cPtr, offset, cast(ulong*)&distance);
    return _retval;
  }

  /**
      Get the offset that was before the current byte in the adapter. When
      distance is given, the amount of bytes between the offset and the current
      position is returned.
      
      The offset is reset to GST_BUFFER_OFFSET_NONE and the distance is set to 0
      when the adapter is first created or when it is cleared. This also means that
      before the first byte with an offset is removed from the adapter, the offset
      and distance returned are GST_BUFFER_OFFSET_NONE and 0 respectively.
  
      Params:
        distance = pointer to a location for distance, or null
      Returns: The previous seen offset.
  */
  ulong prevOffset(out ulong distance)
  {
    ulong _retval;
    _retval = gst_adapter_prev_offset(cast(GstAdapter*)this._cPtr, cast(ulong*)&distance);
    return _retval;
  }

  /**
      Get the pts that was before the current byte in the adapter. When
      distance is given, the amount of bytes between the pts and the current
      position is returned.
      
      The pts is reset to GST_CLOCK_TIME_NONE and the distance is set to 0 when
      the adapter is first created or when it is cleared. This also means that before
      the first byte with a pts is removed from the adapter, the pts
      and distance returned are GST_CLOCK_TIME_NONE and 0 respectively.
  
      Params:
        distance = pointer to location for distance, or null
      Returns: The previously seen pts.
  */
  gst.types.ClockTime prevPts(out ulong distance)
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_prev_pts(cast(GstAdapter*)this._cPtr, cast(ulong*)&distance);
    return _retval;
  }

  /**
      Get the pts that was before the byte at offset offset in the adapter. When
      distance is given, the amount of bytes between the pts and the current
      position is returned.
      
      The pts is reset to GST_CLOCK_TIME_NONE and the distance is set to 0 when
      the adapter is first created or when it is cleared. This also means that before
      the first byte with a pts is removed from the adapter, the pts
      and distance returned are GST_CLOCK_TIME_NONE and 0 respectively.
  
      Params:
        offset = the offset in the adapter at which to get timestamp
        distance = pointer to location for distance, or null
      Returns: The previously seen pts at given offset.
  */
  gst.types.ClockTime prevPtsAtOffset(size_t offset, out ulong distance)
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_prev_pts_at_offset(cast(GstAdapter*)this._cPtr, offset, cast(ulong*)&distance);
    return _retval;
  }

  /**
      Get the PTS that was on the last buffer with the GST_BUFFER_FLAG_DISCONT
      flag, or GST_CLOCK_TIME_NONE.
      Returns: The PTS at the last discont or GST_CLOCK_TIME_NONE.
  */
  gst.types.ClockTime ptsAtDiscont()
  {
    gst.types.ClockTime _retval;
    _retval = gst_adapter_pts_at_discont(cast(GstAdapter*)this._cPtr);
    return _retval;
  }

  /**
      Adds the data from buf to the data stored inside adapter and takes
      ownership of the buffer.
  
      Params:
        buf = a #GstBuffer to add to queue in the adapter
  */
  void push(gst.buffer.Buffer buf)
  {
    gst_adapter_push(cast(GstAdapter*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(Yes.Dup) : null);
  }

  /**
      Returns a #GstBuffer containing the first nbytes bytes of the
      adapter. The returned bytes will be flushed from the adapter.
      This function is potentially more performant than
      [gstbase.adapter.Adapter.take] since it can reuse the memory in pushed buffers
      by subbuffering or merging. This function will always return a
      buffer with a single memory region.
      
      Note that no assumptions should be made as to whether certain buffer
      flags such as the DISCONT flag are set on the returned buffer, or not.
      The caller needs to explicitly set or unset flags that should be set or
      unset.
      
      Since 1.6 this will also copy over all GstMeta of the input buffers except
      for meta with the [gst.types.MetaFlags.Pooled] flag or with the "memory" tag.
      
      Caller owns a reference to the returned buffer. gst_buffer_unref() after
      usage.
      
      Free-function: gst_buffer_unref
  
      Params:
        nbytes = the number of bytes to take
      Returns: a #GstBuffer containing the first
            nbytes of the adapter, or null if nbytes bytes are not available.
            gst_buffer_unref() when no longer needed.
  */
  gst.buffer.Buffer takeBuffer(size_t nbytes)
  {
    GstBuffer* _cretval;
    _cretval = gst_adapter_take_buffer(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GstBuffer containing the first nbytes of the adapter.
      The returned bytes will be flushed from the adapter.  This function
      is potentially more performant than [gstbase.adapter.Adapter.takeBuffer] since
      it can reuse the memory in pushed buffers by subbuffering or
      merging. Unlike [gstbase.adapter.Adapter.takeBuffer], the returned buffer may
      be composed of multiple non-contiguous #GstMemory objects, no
      copies are made.
      
      Note that no assumptions should be made as to whether certain buffer
      flags such as the DISCONT flag are set on the returned buffer, or not.
      The caller needs to explicitly set or unset flags that should be set or
      unset.
      
      This will also copy over all GstMeta of the input buffers except
      for meta with the [gst.types.MetaFlags.Pooled] flag or with the "memory" tag.
      
      This function can return buffer up to the return value of
      [gstbase.adapter.Adapter.available] without making copies if possible.
      
      Caller owns a reference to the returned buffer. gst_buffer_unref() after
      usage.
      
      Free-function: gst_buffer_unref
  
      Params:
        nbytes = the number of bytes to take
      Returns: a #GstBuffer containing the first
            nbytes of the adapter, or null if nbytes bytes are not available.
            gst_buffer_unref() when no longer needed.
  */
  gst.buffer.Buffer takeBufferFast(size_t nbytes)
  {
    GstBuffer* _cretval;
    _cretval = gst_adapter_take_buffer_fast(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GstBufferList of buffers containing the first nbytes bytes of
      the adapter. The returned bytes will be flushed from the adapter.
      When the caller can deal with individual buffers, this function is more
      performant because no memory should be copied.
      
      Caller owns the returned list. Call gst_buffer_list_unref() to free
      the list after usage.
  
      Params:
        nbytes = the number of bytes to take
      Returns: a #GstBufferList of buffers containing
            the first nbytes of the adapter, or null if nbytes bytes are not
            available
  */
  gst.buffer_list.BufferList takeBufferList(size_t nbytes)
  {
    GstBufferList* _cretval;
    _cretval = gst_adapter_take_buffer_list(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a #GList of buffers containing the first nbytes bytes of the
      adapter. The returned bytes will be flushed from the adapter.
      When the caller can deal with individual buffers, this function is more
      performant because no memory should be copied.
      
      Caller owns returned list and contained buffers. gst_buffer_unref() each
      buffer in the list before freeing the list after usage.
  
      Params:
        nbytes = the number of bytes to take
      Returns: a #GList of
            buffers containing the first nbytes of the adapter, or null if nbytes
            bytes are not available
  */
  gst.buffer.Buffer[] takeList(size_t nbytes)
  {
    GList* _cretval;
    _cretval = gst_adapter_take_list(cast(GstAdapter*)this._cPtr, nbytes);
    auto _retval = gListToD!(gst.buffer.Buffer, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Releases the memory obtained with the last [gstbase.adapter.Adapter.map].
  */
  void unmap()
  {
    gst_adapter_unmap(cast(GstAdapter*)this._cPtr);
  }
}
