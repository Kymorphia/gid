/// Module for [Memory] class
module gid.gst1.memory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.boxed;
import gid.gst1.allocator;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.map_info;
import gid.gst1.mini_object;
import gid.gst1.types;

/**
    GstMemory is a lightweight refcounted object that wraps a region of memory.
    They are typically used to manage the data of a #GstBuffer.
    
    A GstMemory object has an allocated region of memory of maxsize. The maximum
    size does not change during the lifetime of the memory object. The memory
    also has an offset and size property that specifies the valid range of memory
    in the allocated region.
    
    Memory is usually created by allocators with a [gid.gst1.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gid.gst1.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gid.gst1.allocator.Allocator.find]. [gid.gst1.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gid.gst1.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
    
    Refcounting of the memory block is performed with [gid.gst1.memory.Memory.ref_] and
    [gid.gst1.memory.Memory.unref].
    
    The size of the memory can be retrieved and changed with
    [gid.gst1.memory.Memory.getSizes] and [gid.gst1.memory.Memory.resize] respectively.
    
    Getting access to the data of the memory is performed with [gid.gst1.memory.Memory.map].
    The call will return a pointer to offset bytes into the region of memory.
    After the memory access is completed, [gid.gst1.memory.Memory.unmap] should be called.
    
    Memory can be copied with [gid.gst1.memory.Memory.copy], which will return a writable
    copy. [gid.gst1.memory.Memory.share] will create a new memory block that shares the
    memory with an existing memory block at a custom offset and with a custom
    size.
    
    Memory can be efficiently merged when [gid.gst1.memory.Memory.isSpan] returns true.
*/
@gidGir("Memory")
class Memory : gid.gobject2.boxed.BoxedWrap!(gst_memory_get_type)
{
  /**
      Create a `memory.Memory` boxed type.
      Params:
        maxsize = the maximum size allocated
        align_ = the alignment of the memory
        offset = the offset where valid data starts
        size = the size of valid data
  */
  this(size_t maxsize = size_t.init, size_t align_ = size_t.init, size_t offset = size_t.init, size_t size = size_t.init) nothrow
  {
    super(boxedNew!GstMemory(_getGType), Yes.Take);
    this.maxsize = maxsize;
    this.align_ = align_;
    this.offset = offset;
    this.size = size;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Scope of a structure mapped by [gid.gst1.memory.Memory.map] (see [gid.core.wrap.MapScope]) */
  alias MapScope = gid.core.wrap.MapScope!(gid.gst1.map_info.MapInfo, gst_memory_unmap, gid.gst1.memory.Memory);

  /** Returns `this`, for use in `with` statements. */
  override Memory self() nothrow
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: parent structure
  */
  @property gid.gst1.mini_object.MiniObject miniObject() nothrow
  {
    return cToD!(gid.gst1.mini_object.MiniObject)(cast(void*)&(cast(GstMemory*)this._cPtr).miniObject);
  }

  /**
      Get `allocator` field.
      Returns: pointer to the #GstAllocator
  */
  @property gid.gst1.allocator.Allocator allocator() nothrow
  {
    return cToD!(gid.gst1.allocator.Allocator)(cast(void*)(cast(GstMemory*)this._cPtr).allocator);
  }

  /**
      Get `parent` field.
      Returns: parent memory block
  */
  @property gid.gst1.memory.Memory parent() nothrow
  {
    return cToD!(gid.gst1.memory.Memory)(cast(void*)(cast(GstMemory*)this._cPtr).parent);
  }

  /**
      Get `maxsize` field.
      Returns: the maximum size allocated
  */
  @property size_t maxsize() nothrow
  {
    return (cast(GstMemory*)this._cPtr).maxsize;
  }

  /**
      Set `maxsize` field.
      Params:
        propval = the maximum size allocated
  */
  @property void maxsize(size_t propval) nothrow
  {
    (cast(GstMemory*)this._cPtr).maxsize = propval;
  }

  /**
      Get `align_` field.
      Returns: the alignment of the memory
  */
  @property size_t align_() nothrow
  {
    return (cast(GstMemory*)this._cPtr).align_;
  }

  /**
      Set `align_` field.
      Params:
        propval = the alignment of the memory
  */
  @property void align_(size_t propval) nothrow
  {
    (cast(GstMemory*)this._cPtr).align_ = propval;
  }

  /**
      Get `offset` field.
      Returns: the offset where valid data starts
  */
  @property size_t offset() nothrow
  {
    return (cast(GstMemory*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset where valid data starts
  */
  @property void offset(size_t propval) nothrow
  {
    (cast(GstMemory*)this._cPtr).offset = propval;
  }

  /**
      Get `size` field.
      Returns: the size of valid data
  */
  @property size_t size() nothrow
  {
    return (cast(GstMemory*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the size of valid data
  */
  @property void size(size_t propval) nothrow
  {
    (cast(GstMemory*)this._cPtr).size = propval;
  }

  /**
      Allocate a new memory block that wraps the given data.
      
      The prefix/padding must be filled with 0 if flags contains
      #GST_MEMORY_FLAG_ZERO_PREFIXED and #GST_MEMORY_FLAG_ZERO_PADDED respectively.
  
      Params:
        flags = #GstMemoryFlags
        data = data to
            wrap
        maxsize = allocated size of data
        offset = offset in data
        notify = called with user_data when the memory is freed
      Returns: a new #GstMemory.
  */
  static gid.gst1.memory.Memory newWrapped(gid.gst1.types.MemoryFlags flags, ubyte[] data, size_t maxsize, size_t offset, gid.glib2.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstMemory* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_memory_new_wrapped(flags, _data, maxsize, offset, _size, _notify, _notifyCB);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a copy of size bytes from mem starting from offset. This copy is
      guaranteed to be writable. size can be set to -1 to return a copy
      from offset to the end of the memory region.
  
      Params:
        offset = offset to copy from
        size = size to copy, or -1 to copy to the end of the memory region
      Returns: a new copy of mem if the copy succeeded, null otherwise.
  */
  gid.gst1.memory.Memory copy(ptrdiff_t offset, ptrdiff_t size) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_memory_copy(cast(GstMemory*)this._cPtr, offset, size);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the current size, offset and maxsize of mem.
  
      Params:
        offset = pointer to offset
        maxsize = pointer to maxsize
      Returns: the current size of mem
  */
  size_t getSizes(out size_t offset, out size_t maxsize) nothrow
  {
    size_t _retval;
    _retval = gst_memory_get_sizes(cast(GstMemory*)this._cPtr, cast(size_t*)&offset, cast(size_t*)&maxsize);
    return _retval;
  }

  /**
      Check if mem1 and mem2 share the memory with a common parent memory object
      and that the memory is contiguous.
      
      If this is the case, the memory of mem1 and mem2 can be merged
      efficiently by performing [gid.gst1.memory.Memory.share] on the parent object from
      the returned offset.
  
      Params:
        mem2 = a #GstMemory
        offset = a pointer to a result offset
      Returns: true if the memory is contiguous and of a common parent.
  */
  bool isSpan(gid.gst1.memory.Memory mem2, out size_t offset) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_memory_is_span(cast(GstMemory*)this._cPtr, mem2 ? cast(GstMemory*)mem2._cPtr(No.Dup) : null, cast(size_t*)&offset);
    return _retval;
  }

  /**
      Check if mem if allocated with an allocator for mem_type.
  
      Params:
        memType = a memory type
      Returns: true if mem was allocated from an allocator for mem_type.
  */
  bool isType(string memType) nothrow
  {
    bool _retval;
    const(char)* _memType = memType.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_memory_is_type(cast(GstMemory*)this._cPtr, _memType);
    return _retval;
  }

  /**
      Tests if you can safely modify memory. It is only safe to modify memory when
      there is only one owner of the memory - ie, the object is writable.
      Returns: 
  */
  bool isWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_memory_is_writable(cast(const(GstMemory)*)this._cPtr);
    return _retval;
  }

  /**
      Returns a writable copy of memory.
      
      If there is only one reference count on memory, the caller must be the owner,
      and so this function will return the memory object unchanged. If on the other
      hand there is more than one reference on the object, a new memory object will
      be returned. The caller's reference on memory will be removed, and instead the
      caller will own a reference to the returned object.
      
      In short, this function unrefs the memory in the argument and refs the memory
      that it returns. Don't access the argument after calling this function. See
      also: [gid.gst1.memory.Memory.ref_].
      Returns: a writable memory which may or may not be the
            same as memory
  */
  gid.gst1.memory.Memory makeWritable() nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_memory_make_writable(cast(GstMemory*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Fill info with the pointer and sizes of the memory in mem that can be
      accessed according to flags.
      
      This function can return false for various reasons:
      - the memory backed by mem is not accessible with the given flags.
      - the memory was already mapped with a different mapping.
      
      info and its contents remain valid for as long as mem is valid and
      until [gid.gst1.memory.Memory.unmap] is called.
      
      For each [gid.gst1.memory.Memory.map] call, a corresponding [gid.gst1.memory.Memory.unmap] call
      should be done.
  
      Params:
        info = pointer for info (mapped structure scope, unmapped by its `unmap()` or when it goes out of scope, use a local variable: `Memory.MapScope info;`)
        flags = mapping flags
      Returns: true if the map operation was successful.
  */
  bool map(out gid.gst1.memory.Memory.MapScope info, gid.gst1.types.MapFlags flags) nothrow
  {
    bool _retval;
    auto _info = cast(GstMapInfo*)info._begin(this);
    _retval = cast(bool)gst_memory_map(cast(GstMemory*)this._cPtr, _info, flags);
    info._mapped = _retval;
    return _retval;
  }

  /**
      Resize the memory region. mem should be writable and offset + size should be
      less than the maxsize of mem.
      
      #GST_MEMORY_FLAG_ZERO_PREFIXED and #GST_MEMORY_FLAG_ZERO_PADDED will be
      cleared when offset or padding is increased respectively.
  
      Params:
        offset = a new offset
        size = a new size
  */
  void resize(ptrdiff_t offset, size_t size) nothrow
  {
    gst_memory_resize(cast(GstMemory*)this._cPtr, offset, size);
  }

  /**
      Return a shared copy of size bytes from mem starting from offset. No
      memory copy is performed and the memory region is simply shared. The result
      is guaranteed to be non-writable. size can be set to -1 to return a shared
      copy from offset to the end of the memory region.
  
      Params:
        offset = offset to share from
        size = size to share, or -1 to share to the end of the memory region
      Returns: a new #GstMemory.
  */
  gid.gst1.memory.Memory share(ptrdiff_t offset, ptrdiff_t size) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_memory_share(cast(GstMemory*)this._cPtr, offset, size);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
