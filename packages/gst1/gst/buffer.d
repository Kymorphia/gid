/// Module for [Buffer] class
module gst.buffer;

import gid.gid;
import glib.bytes;
import glib.types;
import gobject.boxed;
import gobject.types;
import gst.allocation_params;
import gst.allocator;
import gst.buffer_pool;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.custom_meta;
import gst.map_info;
import gst.memory;
import gst.meta;
import gst.meta_info;
import gst.mini_object;
import gst.parent_buffer_meta;
import gst.protection_meta;
import gst.reference_timestamp_meta;
import gst.structure;
import gst.types;

/**
    Buffers are the basic unit of data transfer in GStreamer. They contain the
    timing and offset along with other arbitrary metadata that is associated
    with the #GstMemory blocks that the buffer contains.
    
    Buffers are usually created with [gst.buffer.Buffer.new_]. After a buffer has been
    created one will typically allocate memory for it and add it to the buffer.
    The following example creates a buffer that can hold a given video frame
    with a given width, height and bits per plane.
    
    ``` C
      GstBuffer *buffer;
      GstMemory *memory;
      gint size, width, height, bpp;
      ...
      size = width * height * bpp;
      buffer = gst_buffer_new ();
      memory = gst_allocator_alloc (NULL, size, NULL);
      gst_buffer_insert_memory (buffer, -1, memory);
      ...
    ```
    
    Alternatively, use [gst.buffer.Buffer.newAllocate] to create a buffer with
    preallocated data of a given size.
    
    Buffers can contain a list of #GstMemory objects. You can retrieve how many
    memory objects with [gst.buffer.Buffer.nMemory] and you can get a pointer
    to memory with [gst.buffer.Buffer.peekMemory]
    
    A buffer will usually have timestamps, and a duration, but neither of these
    are guaranteed (they may be set to #GST_CLOCK_TIME_NONE). Whenever a
    meaningful value can be given for these, they should be set. The timestamps
    and duration are measured in nanoseconds (they are #GstClockTime values).
    
    The buffer DTS refers to the timestamp when the buffer should be decoded and
    is usually monotonically increasing. The buffer PTS refers to the timestamp when
    the buffer content should be presented to the user and is not always
    monotonically increasing.
    
    A buffer can also have one or both of a start and an end offset. These are
    media-type specific. For video buffers, the start offset will generally be
    the frame number. For audio buffers, it will be the number of samples
    produced so far. For compressed data, it could be the byte offset in a
    source or destination file. Likewise, the end offset will be the offset of
    the end of the buffer. These can only be meaningfully interpreted if you
    know the media type of the buffer (the preceding CAPS event). Either or both
    can be set to #GST_BUFFER_OFFSET_NONE.
    
    gst_buffer_ref() is used to increase the refcount of a buffer. This must be
    done when you want to keep a handle to the buffer after pushing it to the
    next element. The buffer refcount determines the writability of the buffer, a
    buffer is only writable when the refcount is exactly 1, i.e. when the caller
    has the only reference to the buffer.
    
    To efficiently create a smaller buffer out of an existing one, you can
    use [gst.buffer.Buffer.copyRegion]. This method tries to share the memory objects
    between the two buffers.
    
    If a plug-in wants to modify the buffer data or metadata in-place, it should
    first obtain a buffer that is safe to modify by using
    gst_buffer_make_writable(). This function is optimized so that a copy will
    only be made when it is necessary.
    
    Several flags of the buffer can be set and unset with the
    GST_BUFFER_FLAG_SET() and GST_BUFFER_FLAG_UNSET() macros. Use
    GST_BUFFER_FLAG_IS_SET() to test if a certain #GstBufferFlags flag is set.
    
    Buffers can be efficiently merged into a larger buffer with
    [gst.buffer.Buffer.append]. Copying of memory will only be done when absolutely
    needed.
    
    Arbitrary extra metadata can be set on a buffer with [gst.buffer.Buffer.addMeta].
    Metadata can be retrieved with [gst.buffer.Buffer.getMeta]. See also #GstMeta.
    
    An element should either unref the buffer or push it out on a src pad
    using [gst.pad.Pad.push] (see #GstPad).
    
    Buffers are usually freed by unreffing them with gst_buffer_unref(). When
    the refcount drops to 0, any memory and metadata pointed to by the buffer is
    unreffed as well. Buffers allocated from a #GstBufferPool will be returned to
    the pool when the refcount drops to 0.
    
    The #GstParentBufferMeta is a meta which can be attached to a #GstBuffer
    to hold a reference to another buffer that is only released when the child
    #GstBuffer is released.
    
    Typically, #GstParentBufferMeta is used when the child buffer is directly
    using the #GstMemory of the parent buffer, and wants to prevent the parent
    buffer from being returned to a buffer pool until the #GstMemory is available
    for re-use. (Since: 1.6)
*/
class Buffer : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_buffer_get_type != &gidSymbolNotFound ? gst_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: the parent structure
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstBuffer*)this._cPtr).miniObject);
  }

  /**
      Get `pool` field.
      Returns: pointer to the pool owner of the buffer
  */
  @property gst.buffer_pool.BufferPool pool()
  {
    return cToD!(gst.buffer_pool.BufferPool)(cast(void*)(cast(GstBuffer*)this._cPtr).pool);
  }

  /**
      Set `pool` field.
      Params:
        propval = pointer to the pool owner of the buffer
  */
  @property void pool(gst.buffer_pool.BufferPool propval)
  {
    cValueFree!(gst.buffer_pool.BufferPool)(cast(void*)(cast(GstBuffer*)this._cPtr).pool);
    dToC(propval, cast(void*)&(cast(GstBuffer*)this._cPtr).pool);
  }

  /**
      Get `pts` field.
      Returns: presentation timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
            pts is not known or relevant. The pts contains the timestamp when the
            media should be presented to the user.
  */
  @property gst.types.ClockTime pts()
  {
    return (cast(GstBuffer*)this._cPtr).pts;
  }

  /**
      Set `pts` field.
      Params:
        propval = presentation timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
              pts is not known or relevant. The pts contains the timestamp when the
              media should be presented to the user.
  */
  @property void pts(gst.types.ClockTime propval)
  {
    (cast(GstBuffer*)this._cPtr).pts = propval;
  }

  /**
      Get `dts` field.
      Returns: decoding timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
            dts is not known or relevant. The dts contains the timestamp when the
            media should be processed.
  */
  @property gst.types.ClockTime dts()
  {
    return (cast(GstBuffer*)this._cPtr).dts;
  }

  /**
      Set `dts` field.
      Params:
        propval = decoding timestamp of the buffer, can be #GST_CLOCK_TIME_NONE when the
              dts is not known or relevant. The dts contains the timestamp when the
              media should be processed.
  */
  @property void dts(gst.types.ClockTime propval)
  {
    (cast(GstBuffer*)this._cPtr).dts = propval;
  }

  /**
      Get `duration` field.
      Returns: duration in time of the buffer data, can be #GST_CLOCK_TIME_NONE
            when the duration is not known or relevant.
  */
  @property gst.types.ClockTime duration()
  {
    return (cast(GstBuffer*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = duration in time of the buffer data, can be #GST_CLOCK_TIME_NONE
              when the duration is not known or relevant.
  */
  @property void duration(gst.types.ClockTime propval)
  {
    (cast(GstBuffer*)this._cPtr).duration = propval;
  }

  /**
      Get `offset` field.
      Returns: a media specific offset for the buffer data.
            For video frames, this is the frame number of this buffer.
            For audio samples, this is the offset of the first sample in this buffer.
            For file data or compressed data this is the byte offset of the first
              byte in this buffer.
  */
  @property ulong offset()
  {
    return (cast(GstBuffer*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = a media specific offset for the buffer data.
              For video frames, this is the frame number of this buffer.
              For audio samples, this is the offset of the first sample in this buffer.
              For file data or compressed data this is the byte offset of the first
                byte in this buffer.
  */
  @property void offset(ulong propval)
  {
    (cast(GstBuffer*)this._cPtr).offset = propval;
  }

  /**
      Get `offsetEnd` field.
      Returns: the last offset contained in this buffer. It has the same
            format as @offset.
  */
  @property ulong offsetEnd()
  {
    return (cast(GstBuffer*)this._cPtr).offsetEnd;
  }

  /**
      Set `offsetEnd` field.
      Params:
        propval = the last offset contained in this buffer. It has the same
              format as @offset.
  */
  @property void offsetEnd(ulong propval)
  {
    (cast(GstBuffer*)this._cPtr).offsetEnd = propval;
  }

  /**
      Creates a newly allocated buffer without any data.
      Returns: the new #GstBuffer.
  */
  this()
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Tries to create a newly allocated buffer with data of the given size and
      extra parameters from allocator. If the requested amount of memory can't be
      allocated, null will be returned. The allocated buffer memory is not cleared.
      
      When allocator is null, the default memory allocator will be used.
      
      Note that when size == 0, the buffer will not have memory associated with it.
  
      Params:
        allocator = the #GstAllocator to use, or null to use the
              default allocator
        size = the size in bytes of the new buffer's data.
        params = optional parameters
      Returns: a new #GstBuffer
  */
  static gst.buffer.Buffer newAllocate(gst.allocator.Allocator allocator, size_t size, gst.allocation_params.AllocationParams params)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_new_allocate(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, size, cast(GstAllocationParams*)&params);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new buffer of size size and fills it with a copy of data.
  
      Params:
        data = data to copy into new buffer
      Returns: a new #GstBuffer
  */
  static gst.buffer.Buffer newMemdup(ubyte[] data)
  {
    GstBuffer* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _cretval = gst_buffer_new_memdup(_data, _size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new #GstBuffer that wraps the given bytes. The data inside
      bytes cannot be null and the resulting buffer will be marked as read only.
  
      Params:
        bytes = a #GBytes to wrap
      Returns: a new #GstBuffer wrapping bytes
  */
  static gst.buffer.Buffer newWrappedBytes(glib.bytes.Bytes bytes)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_new_wrapped_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocates a new buffer that wraps the given memory. data must point to
      maxsize of memory, the wrapped buffer will have the region from offset and
      size visible.
      
      When the buffer is destroyed, notify will be called with user_data.
      
      The prefix/padding must be filled with 0 if flags contains
      #GST_MEMORY_FLAG_ZERO_PREFIXED and #GST_MEMORY_FLAG_ZERO_PADDED respectively.
  
      Params:
        flags = #GstMemoryFlags
        data = data to wrap
        maxsize = allocated size of data
        offset = offset in data
        notify = called with user_data when the memory is freed
      Returns: a new #GstBuffer
  */
  static gst.buffer.Buffer newWrappedFull(gst.types.MemoryFlags flags, ubyte[] data, size_t maxsize, size_t offset, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstBuffer* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(void*)data.ptr;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_buffer_new_wrapped_full(flags, _data, maxsize, offset, _size, _notify, _notifyCB);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates and adds a #GstCustomMeta for the desired name. name must have
      been successfully registered with [gst.meta.Meta.registerCustom].
  
      Params:
        name = the registered name of the desired custom meta
      Returns: The #GstCustomMeta that was added to the buffer
  */
  gst.custom_meta.CustomMeta addCustomMeta(string name)
  {
    GstCustomMeta* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_buffer_add_custom_meta(cast(GstBuffer*)this._cPtr, _name);
    auto _retval = _cretval ? new gst.custom_meta.CustomMeta(cast(GstCustomMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds metadata for info to buffer using the parameters in params.
  
      Params:
        info = a #GstMetaInfo
        params = params for info
      Returns: the metadata for the api in info on buffer.
  */
  gst.meta.Meta addMeta(gst.meta_info.MetaInfo info, void* params = null)
  {
    GstMeta* _cretval;
    _cretval = gst_buffer_add_meta(cast(GstBuffer*)this._cPtr, cast(const(GstMetaInfo)*)&info, params);
    auto _retval = _cretval ? new gst.meta.Meta(cast(GstMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a #GstParentBufferMeta to buffer that holds a reference on
      ref until the buffer is freed.
  
      Params:
        ref_ = a #GstBuffer to ref
      Returns: The #GstParentBufferMeta that was added to the buffer
  */
  gst.parent_buffer_meta.ParentBufferMeta addParentBufferMeta(gst.buffer.Buffer ref_)
  {
    GstParentBufferMeta* _cretval;
    _cretval = gst_buffer_add_parent_buffer_meta(cast(GstBuffer*)this._cPtr, ref_ ? cast(GstBuffer*)ref_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.parent_buffer_meta.ParentBufferMeta(cast(GstParentBufferMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Attaches protection metadata to a #GstBuffer.
  
      Params:
        info = a #GstStructure holding cryptographic
              information relating to the sample contained in buffer. This
              function takes ownership of info.
      Returns: a pointer to the added #GstProtectionMeta if successful
  */
  gst.protection_meta.ProtectionMeta addProtectionMeta(gst.structure.Structure info)
  {
    GstProtectionMeta* _cretval;
    _cretval = gst_buffer_add_protection_meta(cast(GstBuffer*)this._cPtr, info ? cast(GstStructure*)info._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.protection_meta.ProtectionMeta(cast(GstProtectionMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Adds a #GstReferenceTimestampMeta to buffer that holds a timestamp and
      optionally duration based on a specific timestamp reference. See the
      documentation of #GstReferenceTimestampMeta for details.
  
      Params:
        reference = identifier for the timestamp reference.
        timestamp = timestamp
        duration = duration, or [gst.types.CLOCK_TIME_NONE]
      Returns: The #GstReferenceTimestampMeta that was added to the buffer
  */
  gst.reference_timestamp_meta.ReferenceTimestampMeta addReferenceTimestampMeta(gst.caps.Caps reference, gst.types.ClockTime timestamp, gst.types.ClockTime duration)
  {
    GstReferenceTimestampMeta* _cretval;
    _cretval = gst_buffer_add_reference_timestamp_meta(cast(GstBuffer*)this._cPtr, reference ? cast(GstCaps*)reference._cPtr(No.Dup) : null, timestamp, duration);
    auto _retval = _cretval ? new gst.reference_timestamp_meta.ReferenceTimestampMeta(cast(GstReferenceTimestampMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Appends all the memory from buf2 to buf1. The result buffer will contain a
      concatenation of the memory of buf1 and buf2.
  
      Params:
        buf2 = the second source #GstBuffer to append.
      Returns: the new #GstBuffer that contains the memory
            of the two source buffers.
  */
  gst.buffer.Buffer append(gst.buffer.Buffer buf2)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_append(cast(GstBuffer*)this._cPtr, buf2 ? cast(GstBuffer*)buf2._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends the memory block mem to buffer. This function takes
      ownership of mem and thus doesn't increase its refcount.
      
      This function is identical to [gst.buffer.Buffer.insertMemory] with an index of -1.
      See [gst.buffer.Buffer.insertMemory] for more details.
  
      Params:
        mem = a #GstMemory.
  */
  void appendMemory(gst.memory.Memory mem)
  {
    gst_buffer_append_memory(cast(GstBuffer*)this._cPtr, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Appends size bytes at offset from buf2 to buf1. The result buffer will
      contain a concatenation of the memory of buf1 and the requested region of
      buf2.
  
      Params:
        buf2 = the second source #GstBuffer to append.
        offset = the offset in buf2
        size = the size or -1 of buf2
      Returns: the new #GstBuffer that contains the memory
            of the two source buffers.
  */
  gst.buffer.Buffer appendRegion(gst.buffer.Buffer buf2, ptrdiff_t offset, ptrdiff_t size)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_append_region(cast(GstBuffer*)this._cPtr, buf2 ? cast(GstBuffer*)buf2._cPtr(Yes.Dup) : null, offset, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a copy of the given buffer. This will make a newly allocated
      copy of the data the source buffer contains.
      Returns: a new copy of buf if the copy succeeded, null otherwise.
  */
  gst.buffer.Buffer copyDeep()
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_copy_deep(cast(const(GstBuffer)*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the information from src into dest.
      
      If dest already contains memory and flags contains GST_BUFFER_COPY_MEMORY,
      the memory from src will be appended to dest.
      
      flags indicate which fields will be copied.
  
      Params:
        src = a source #GstBuffer
        flags = flags indicating what metadata fields should be copied.
        offset = offset to copy from
        size = total size to copy. If -1, all data is copied.
      Returns: true if the copying succeeded, false otherwise.
  */
  bool copyInto(gst.buffer.Buffer src, gst.types.BufferCopyFlags flags, size_t offset, size_t size)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_copy_into(cast(GstBuffer*)this._cPtr, src ? cast(GstBuffer*)src._cPtr(No.Dup) : null, flags, offset, size);
    return _retval;
  }

  /**
      Creates a sub-buffer from parent at offset and size.
      This sub-buffer uses the actual memory space of the parent buffer.
      This function will copy the offset and timestamp fields when the
      offset is 0. If not, they will be set to #GST_CLOCK_TIME_NONE and
      #GST_BUFFER_OFFSET_NONE.
      If offset equals 0 and size equals the total size of buffer, the
      duration and offset end fields are also copied. If not they will be set
      to #GST_CLOCK_TIME_NONE and #GST_BUFFER_OFFSET_NONE.
  
      Params:
        flags = the #GstBufferCopyFlags
        offset = the offset into parent #GstBuffer at which the new sub-buffer
                   begins.
        size = the size of the new #GstBuffer sub-buffer, in bytes. If -1, all
                 data is copied.
      Returns: the new #GstBuffer or null if copying
            failed.
  */
  gst.buffer.Buffer copyRegion(gst.types.BufferCopyFlags flags, size_t offset, size_t size)
  {
    GstBuffer* _cretval;
    _cretval = gst_buffer_copy_region(cast(GstBuffer*)this._cPtr, flags, offset, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Extracts a copy of at most size bytes the data at offset into
      newly-allocated memory. dest must be freed using [glib.global.gfree] when done.
  
      Params:
        offset = the offset to extract
        size = the size to extract
        dest = A pointer where
           the destination array will be written. Might be null if the size is 0.
  */
  void extractDup(size_t offset, size_t size, out ubyte[] dest)
  {
    size_t _destSize;
    void* _dest;
    gst_buffer_extract_dup(cast(GstBuffer*)this._cPtr, offset, size, &_dest, &_destSize);
    dest.length = _destSize;
    dest[0 .. $] = (cast(ubyte*)_dest)[0 .. _destSize];
    gFree(cast(void*)_dest);
  }

  /**
      Copies size bytes from src to buffer at offset.
  
      Params:
        offset = the offset to fill
        src = the source address
      Returns: The amount of bytes copied. This value can be lower than size
           when buffer did not contain enough data.
  */
  size_t fill(size_t offset, ubyte[] src)
  {
    size_t _retval;
    size_t _size;
    if (src)
      _size = cast(size_t)src.length;

    auto _src = cast(const(void)*)src.ptr;
    _retval = gst_buffer_fill(cast(GstBuffer*)this._cPtr, offset, _src, _size);
    return _retval;
  }

  /**
      Finds the memory blocks that span size bytes starting from offset
      in buffer.
      
      When this function returns true, idx will contain the index of the first
      memory block where the byte for offset can be found and length contains the
      number of memory blocks containing the size remaining bytes. skip contains
      the number of bytes to skip in the memory block at idx to get to the byte
      for offset.
      
      size can be -1 to get all the memory blocks after idx.
  
      Params:
        offset = an offset
        size = a size
        idx = pointer to index
        length = pointer to length
        skip = pointer to skip
      Returns: true when size bytes starting from offset could be found in
        buffer and idx, length and skip will be filled.
  */
  bool findMemory(size_t offset, size_t size, out uint idx, out uint length, out size_t skip)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_find_memory(cast(GstBuffer*)this._cPtr, offset, size, cast(uint*)&idx, cast(uint*)&length, cast(size_t*)&skip);
    return _retval;
  }

  /**
      Calls func with user_data for each meta in buffer.
      
      func can modify the passed meta pointer or its contents. The return value
      of func defines if this function returns or if the remaining metadata items
      in the buffer should be skipped.
  
      Params:
        func = a #GstBufferForeachMetaFunc to call
      Returns: false when func returned false for one of the metadata.
  */
  bool foreachMeta(gst.types.BufferForeachMetaFunc func)
  {
    extern(C) gboolean _funcCallback(GstBuffer* buffer, GstMeta** meta, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.BufferForeachMetaFunc*)userData;
      auto _meta = new gst.meta.Meta(meta, No.Take);

      _dretval = (*_dlg)(buffer ? new gst.buffer.Buffer(cast(void*)buffer, No.Take) : null, _meta);
      auto _retval = cast(gboolean)_dretval;
      *meta = *cast(GstMeta**)_meta._cPtr;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_buffer_foreach_meta(cast(GstBuffer*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Gets all the memory blocks in buffer. The memory blocks will be merged
      into one large #GstMemory.
      Returns: a #GstMemory that contains the merged memory.
  */
  gst.memory.Memory getAllMemory()
  {
    GstMemory* _cretval;
    _cretval = gst_buffer_get_all_memory(cast(GstBuffer*)this._cPtr);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Finds the first #GstCustomMeta on buffer for the desired name.
  
      Params:
        name = the registered name of the custom meta to retrieve.
      Returns: the #GstCustomMeta
  */
  gst.custom_meta.CustomMeta getCustomMeta(string name)
  {
    GstCustomMeta* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_buffer_get_custom_meta(cast(GstBuffer*)this._cPtr, _name);
    auto _retval = _cretval ? new gst.custom_meta.CustomMeta(cast(GstCustomMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the #GstBufferFlags flags set on this buffer.
      Returns: the flags set on this buffer.
  */
  gst.types.BufferFlags getFlags()
  {
    GstBufferFlags _cretval;
    _cretval = gst_buffer_get_flags(cast(GstBuffer*)this._cPtr);
    gst.types.BufferFlags _retval = cast(gst.types.BufferFlags)_cretval;
    return _retval;
  }

  /**
      Gets the memory block at index idx in buffer.
  
      Params:
        idx = an index
      Returns: a #GstMemory that contains the data of the
        memory block at idx.
  */
  gst.memory.Memory getMemory(uint idx)
  {
    GstMemory* _cretval;
    _cretval = gst_buffer_get_memory(cast(GstBuffer*)this._cPtr, idx);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets length memory blocks in buffer starting at idx. The memory blocks will
      be merged into one large #GstMemory.
      
      If length is -1, all memory starting from idx is merged.
  
      Params:
        idx = an index
        length = a length
      Returns: a #GstMemory that contains the merged data of length
           blocks starting at idx.
  */
  gst.memory.Memory getMemoryRange(uint idx, int length)
  {
    GstMemory* _cretval;
    _cretval = gst_buffer_get_memory_range(cast(GstBuffer*)this._cPtr, idx, length);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the metadata for api on buffer. When there is no such metadata, null is
      returned. If multiple metadata with the given api are attached to this
      buffer only the first one is returned.  To handle multiple metadata with a
      given API use [gst.buffer.Buffer.iterateMeta] or [gst.buffer.Buffer.foreachMeta] instead
      and check the `meta->info.api` member for the API type.
  
      Params:
        api = the #GType of an API
      Returns: the metadata for api on buffer.
  */
  gst.meta.Meta getMeta(gobject.types.GType api)
  {
    GstMeta* _cretval;
    _cretval = gst_buffer_get_meta(cast(GstBuffer*)this._cPtr, api);
    auto _retval = _cretval ? new gst.meta.Meta(cast(GstMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  uint getNMeta(gobject.types.GType apiType)
  {
    uint _retval;
    _retval = gst_buffer_get_n_meta(cast(GstBuffer*)this._cPtr, apiType);
    return _retval;
  }

  /**
      Finds the first #GstReferenceTimestampMeta on buffer that conforms to
      reference. Conformance is tested by checking if the meta's reference is a
      subset of reference.
      
      Buffers can contain multiple #GstReferenceTimestampMeta metadata items.
  
      Params:
        reference = a reference #GstCaps
      Returns: the #GstReferenceTimestampMeta or null when there
        is no such metadata on buffer.
  */
  gst.reference_timestamp_meta.ReferenceTimestampMeta getReferenceTimestampMeta(gst.caps.Caps reference = null)
  {
    GstReferenceTimestampMeta* _cretval;
    _cretval = gst_buffer_get_reference_timestamp_meta(cast(GstBuffer*)this._cPtr, reference ? cast(GstCaps*)reference._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.reference_timestamp_meta.ReferenceTimestampMeta(cast(GstReferenceTimestampMeta*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the total size of the memory blocks in buffer.
      Returns: total size of the memory blocks in buffer.
  */
  size_t getSize()
  {
    size_t _retval;
    _retval = gst_buffer_get_size(cast(GstBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the total size of the memory blocks in buffer.
      
      When not null, offset will contain the offset of the data in the
      first memory block in buffer and maxsize will contain the sum of
      the size and offset and the amount of extra padding on the last
      memory block.  offset and maxsize can be used to resize the
      buffer memory blocks with [gst.buffer.Buffer.resize].
  
      Params:
        offset = a pointer to the offset
        maxsize = a pointer to the maxsize
      Returns: total size of the memory blocks in buffer.
  */
  size_t getSizes(out size_t offset, out size_t maxsize)
  {
    size_t _retval;
    _retval = gst_buffer_get_sizes(cast(GstBuffer*)this._cPtr, cast(size_t*)&offset, cast(size_t*)&maxsize);
    return _retval;
  }

  /**
      Gets the total size of length memory blocks stating from idx in buffer.
      
      When not null, offset will contain the offset of the data in the
      memory block in buffer at idx and maxsize will contain the sum of the size
      and offset and the amount of extra padding on the memory block at idx +
      length -1.
      offset and maxsize can be used to resize the buffer memory blocks with
      [gst.buffer.Buffer.resizeRange].
  
      Params:
        idx = an index
        length = a length
        offset = a pointer to the offset
        maxsize = a pointer to the maxsize
      Returns: total size of length memory blocks starting at idx in buffer.
  */
  size_t getSizesRange(uint idx, int length, out size_t offset, out size_t maxsize)
  {
    size_t _retval;
    _retval = gst_buffer_get_sizes_range(cast(GstBuffer*)this._cPtr, idx, length, cast(size_t*)&offset, cast(size_t*)&maxsize);
    return _retval;
  }

  /**
      Gives the status of a specific flag on a buffer.
  
      Params:
        flags = the #GstBufferFlags flag to check.
      Returns: true if all flags in flags are found on buffer.
  */
  bool hasFlags(gst.types.BufferFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_has_flags(cast(GstBuffer*)this._cPtr, flags);
    return _retval;
  }

  /**
      Inserts the memory block mem into buffer at idx. This function takes ownership
      of mem and thus doesn't increase its refcount.
      
      Only [gst.buffer.Buffer.getMaxMemory] can be added to a buffer. If more memory is
      added, existing memory blocks will automatically be merged to make room for
      the new memory.
  
      Params:
        idx = the index to add the memory at, or -1 to append it to the end
        mem = a #GstMemory.
  */
  void insertMemory(int idx, gst.memory.Memory mem)
  {
    gst_buffer_insert_memory(cast(GstBuffer*)this._cPtr, idx, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Checks if all memory blocks in buffer are writable.
      
      Note that this function does not check if buffer is writable, use
      gst_buffer_is_writable() to check that if needed.
      Returns: true if all memory blocks in buffer are writable
  */
  bool isAllMemoryWritable()
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_is_all_memory_writable(cast(GstBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Checks if length memory blocks in buffer starting from idx are writable.
      
      length can be -1 to check all the memory blocks after idx.
      
      Note that this function does not check if buffer is writable, use
      gst_buffer_is_writable() to check that if needed.
  
      Params:
        idx = an index
        length = a length, should not be 0
      Returns: true if the memory range is writable
  */
  bool isMemoryRangeWritable(uint idx, int length)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_is_memory_range_writable(cast(GstBuffer*)this._cPtr, idx, length);
    return _retval;
  }

  /**
      Fills info with the #GstMapInfo of all merged memory blocks in buffer.
      
      flags describe the desired access of the memory. When flags is
      #GST_MAP_WRITE, buffer should be writable (as returned from
      gst_buffer_is_writable()).
      
      When buffer is writable but the memory isn't, a writable copy will
      automatically be created and returned. The readonly copy of the
      buffer memory will then also be replaced with this writable copy.
      
      The memory in info should be unmapped with [gst.buffer.Buffer.unmap] after
      usage.
  
      Params:
        info = info about the mapping
        flags = flags for the mapping
      Returns: true if the map succeeded and info contains valid data.
  */
  bool map(out gst.map_info.MapInfo info, gst.types.MapFlags flags)
  {
    bool _retval;
    GstMapInfo _info;
    _retval = cast(bool)gst_buffer_map(cast(GstBuffer*)this._cPtr, &_info, flags);
    info = new gst.map_info.MapInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Fills info with the #GstMapInfo of length merged memory blocks
      starting at idx in buffer. When length is -1, all memory blocks starting
      from idx are merged and mapped.
      
      flags describe the desired access of the memory. When flags is
      #GST_MAP_WRITE, buffer should be writable (as returned from
      gst_buffer_is_writable()).
      
      When buffer is writable but the memory isn't, a writable copy will
      automatically be created and returned. The readonly copy of the buffer memory
      will then also be replaced with this writable copy.
      
      The memory in info should be unmapped with [gst.buffer.Buffer.unmap] after usage.
  
      Params:
        idx = an index
        length = a length
        info = info about the mapping
        flags = flags for the mapping
      Returns: true if the map succeeded and info contains valid
        data.
  */
  bool mapRange(uint idx, int length, out gst.map_info.MapInfo info, gst.types.MapFlags flags)
  {
    bool _retval;
    GstMapInfo _info;
    _retval = cast(bool)gst_buffer_map_range(cast(GstBuffer*)this._cPtr, idx, length, &_info, flags);
    info = new gst.map_info.MapInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Compares size bytes starting from offset in buffer with the memory in mem.
  
      Params:
        offset = the offset in buffer
        mem = the memory to compare
      Returns: 0 if the memory is equal.
  */
  int memcmp(size_t offset, ubyte[] mem)
  {
    int _retval;
    size_t _size;
    if (mem)
      _size = cast(size_t)mem.length;

    auto _mem = cast(const(void)*)mem.ptr;
    _retval = gst_buffer_memcmp(cast(GstBuffer*)this._cPtr, offset, _mem, _size);
    return _retval;
  }

  /**
      Fills buf with size bytes with val starting from offset.
  
      Params:
        offset = the offset in buffer
        val = the value to set
        size = the size to set
      Returns: The amount of bytes filled. This value can be lower than size
           when buffer did not contain enough data.
  */
  size_t memset(size_t offset, ubyte val, size_t size)
  {
    size_t _retval;
    _retval = gst_buffer_memset(cast(GstBuffer*)this._cPtr, offset, val, size);
    return _retval;
  }

  /**
      Gets the amount of memory blocks that this buffer has. This amount is never
      larger than what [gst.buffer.Buffer.getMaxMemory] returns.
      Returns: the number of memory blocks this buffer is made of.
  */
  uint nMemory()
  {
    uint _retval;
    _retval = gst_buffer_n_memory(cast(GstBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the memory block at idx in buffer. The memory block stays valid until
      the memory block in buffer is removed, replaced or merged, typically with
      any call that modifies the memory in buffer.
  
      Params:
        idx = an index
      Returns: the #GstMemory at idx.
  */
  gst.memory.Memory peekMemory(uint idx)
  {
    GstMemory* _cretval;
    _cretval = gst_buffer_peek_memory(cast(GstBuffer*)this._cPtr, idx);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Prepends the memory block mem to buffer. This function takes
      ownership of mem and thus doesn't increase its refcount.
      
      This function is identical to [gst.buffer.Buffer.insertMemory] with an index of 0.
      See [gst.buffer.Buffer.insertMemory] for more details.
  
      Params:
        mem = a #GstMemory.
  */
  void prependMemory(gst.memory.Memory mem)
  {
    gst_buffer_prepend_memory(cast(GstBuffer*)this._cPtr, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Removes all the memory blocks in buffer.
  */
  void removeAllMemory()
  {
    gst_buffer_remove_all_memory(cast(GstBuffer*)this._cPtr);
  }

  /**
      Removes the memory block in b at index i.
  
      Params:
        idx = an index
  */
  void removeMemory(uint idx)
  {
    gst_buffer_remove_memory(cast(GstBuffer*)this._cPtr, idx);
  }

  /**
      Removes length memory blocks in buffer starting from idx.
      
      length can be -1, in which case all memory starting from idx is removed.
  
      Params:
        idx = an index
        length = a length
  */
  void removeMemoryRange(uint idx, int length)
  {
    gst_buffer_remove_memory_range(cast(GstBuffer*)this._cPtr, idx, length);
  }

  /**
      Removes the metadata for meta on buffer.
  
      Params:
        meta = a #GstMeta
      Returns: true if the metadata existed and was removed, false if no such
        metadata was on buffer.
  */
  bool removeMeta(gst.meta.Meta meta)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_remove_meta(cast(GstBuffer*)this._cPtr, meta ? cast(GstMeta*)meta._cPtr : null);
    return _retval;
  }

  /**
      Replaces all memory in buffer with mem.
  
      Params:
        mem = a #GstMemory
  */
  void replaceAllMemory(gst.memory.Memory mem)
  {
    gst_buffer_replace_all_memory(cast(GstBuffer*)this._cPtr, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Replaces the memory block at index idx in buffer with mem.
  
      Params:
        idx = an index
        mem = a #GstMemory
  */
  void replaceMemory(uint idx, gst.memory.Memory mem)
  {
    gst_buffer_replace_memory(cast(GstBuffer*)this._cPtr, idx, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Replaces length memory blocks in buffer starting at idx with mem.
      
      If length is -1, all memory starting from idx will be removed and
      replaced with mem.
      
      buffer should be writable.
  
      Params:
        idx = an index
        length = a length, should not be 0
        mem = a #GstMemory
  */
  void replaceMemoryRange(uint idx, int length, gst.memory.Memory mem)
  {
    gst_buffer_replace_memory_range(cast(GstBuffer*)this._cPtr, idx, length, mem ? cast(GstMemory*)mem._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the offset and total size of the memory blocks in buffer.
  
      Params:
        offset = the offset adjustment
        size = the new size or -1 to just adjust the offset
  */
  void resize(ptrdiff_t offset, ptrdiff_t size)
  {
    gst_buffer_resize(cast(GstBuffer*)this._cPtr, offset, size);
  }

  /**
      Sets the total size of the length memory blocks starting at idx in
      buffer
  
      Params:
        idx = an index
        length = a length
        offset = the offset adjustment
        size = the new size or -1 to just adjust the offset
      Returns: true if resizing succeeded, false otherwise.
  */
  bool resizeRange(uint idx, int length, ptrdiff_t offset, ptrdiff_t size)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_resize_range(cast(GstBuffer*)this._cPtr, idx, length, offset, size);
    return _retval;
  }

  /**
      Sets one or more buffer flags on a buffer.
  
      Params:
        flags = the #GstBufferFlags to set.
      Returns: true if flags were successfully set on buffer.
  */
  bool setFlags(gst.types.BufferFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_set_flags(cast(GstBuffer*)this._cPtr, flags);
    return _retval;
  }

  /**
      Sets the total size of the memory blocks in buffer.
  
      Params:
        size = the new size
  */
  void setSize(ptrdiff_t size)
  {
    gst_buffer_set_size(cast(GstBuffer*)this._cPtr, size);
  }

  /**
      Releases the memory previously mapped with [gst.buffer.Buffer.map].
  
      Params:
        info = a #GstMapInfo
  */
  void unmap(gst.map_info.MapInfo info)
  {
    gst_buffer_unmap(cast(GstBuffer*)this._cPtr, info ? cast(GstMapInfo*)info._cPtr : null);
  }

  /**
      Clears one or more buffer flags.
  
      Params:
        flags = the #GstBufferFlags to clear
      Returns: true if flags is successfully cleared from buffer.
  */
  bool unsetFlags(gst.types.BufferFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_unset_flags(cast(GstBuffer*)this._cPtr, flags);
    return _retval;
  }

  /**
      Gets the maximum amount of memory blocks that a buffer can hold. This is a
      compile time constant that can be queried with the function.
      
      When more memory blocks are added, existing memory blocks will be merged
      together to make room for the new block.
      Returns: the maximum amount of memory blocks that a buffer can hold.
  */
  static uint getMaxMemory()
  {
    uint _retval;
    _retval = gst_buffer_get_max_memory();
    return _retval;
  }
}
