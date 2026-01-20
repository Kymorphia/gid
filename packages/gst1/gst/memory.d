/// Module for [Memory] class
module gst.memory;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocator;
import gst.c.functions;
import gst.c.types;
import gst.map_info;
import gst.mini_object;
import gst.types;

/**
    GstMemory is a lightweight refcounted object that wraps a region of memory.
    They are typically used to manage the data of a #GstBuffer.
    
    A GstMemory object has an allocated region of memory of maxsize. The maximum
    size does not change during the lifetime of the memory object. The memory
    also has an offset and size property that specifies the valid range of memory
    in the allocated region.
    
    Memory is usually created by allocators with a [gst.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gst.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gst.allocator.Allocator.find]. [gst.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gst.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
    
    Refcounting of the memory block is performed with gst_memory_ref() and
    gst_memory_unref().
    
    The size of the memory can be retrieved and changed with
    [gst.memory.Memory.getSizes] and [gst.memory.Memory.resize] respectively.
    
    Getting access to the data of the memory is performed with [gst.memory.Memory.map].
    The call will return a pointer to offset bytes into the region of memory.
    After the memory access is completed, [gst.memory.Memory.unmap] should be called.
    
    Memory can be copied with [gst.memory.Memory.copy], which will return a writable
    copy. [gst.memory.Memory.share] will create a new memory block that shares the
    memory with an existing memory block at a custom offset and with a custom
    size.
    
    Memory can be efficiently merged when [gst.memory.Memory.isSpan] returns true.
*/
class Memory : gobject.boxed.Boxed
{

  /**
      Create a `memory.Memory` boxed type.
      Params:
        miniObject = parent structure
        allocator = pointer to the #GstAllocator
        parent = parent memory block
        maxsize = the maximum size allocated
        align_ = the alignment of the memory
        offset = the offset where valid data starts
        size = the size of valid data
  */
  this(gst.mini_object.MiniObject miniObject = gst.mini_object.MiniObject.init, gst.allocator.Allocator allocator = gst.allocator.Allocator.init, gst.memory.Memory parent = gst.memory.Memory.init, size_t maxsize = size_t.init, size_t align_ = size_t.init, size_t offset = size_t.init, size_t size = size_t.init)
  {
    super(gMalloc(GstMemory.sizeof), Yes.Take);
    this.miniObject = miniObject;
    this.allocator = allocator;
    this.parent = parent;
    this.maxsize = maxsize;
    this.align_ = align_;
    this.offset = offset;
    this.size = size;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_memory_get_type != &gidSymbolNotFound ? gst_memory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Memory self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: parent structure
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstMemory*)this._cPtr).miniObject);
  }

  /**
      Set `miniObject` field.
      Params:
        propval = parent structure
  */
  @property void miniObject(gst.mini_object.MiniObject propval)
  {
    (cast(GstMemory*)this._cPtr).miniObject = cast(GstMiniObject)propval;
  }

  /**
      Get `allocator` field.
      Returns: pointer to the #GstAllocator
  */
  @property gst.allocator.Allocator allocator()
  {
    return cToD!(gst.allocator.Allocator)(cast(void*)(cast(GstMemory*)this._cPtr).allocator);
  }

  /**
      Set `allocator` field.
      Params:
        propval = pointer to the #GstAllocator
  */
  @property void allocator(gst.allocator.Allocator propval)
  {
    cValueFree!(gst.allocator.Allocator)(cast(void*)(cast(GstMemory*)this._cPtr).allocator);
    dToC(propval, cast(void*)&(cast(GstMemory*)this._cPtr).allocator);
  }

  /**
      Get `parent` field.
      Returns: parent memory block
  */
  @property gst.memory.Memory parent()
  {
    return cToD!(gst.memory.Memory)(cast(void*)(cast(GstMemory*)this._cPtr).parent);
  }

  /**
      Set `parent` field.
      Params:
        propval = parent memory block
  */
  @property void parent(gst.memory.Memory propval)
  {
    cValueFree!(gst.memory.Memory)(cast(void*)(cast(GstMemory*)this._cPtr).parent);
    dToC(propval, cast(void*)&(cast(GstMemory*)this._cPtr).parent);
  }

  /**
      Get `maxsize` field.
      Returns: the maximum size allocated
  */
  @property size_t maxsize()
  {
    return (cast(GstMemory*)this._cPtr).maxsize;
  }

  /**
      Set `maxsize` field.
      Params:
        propval = the maximum size allocated
  */
  @property void maxsize(size_t propval)
  {
    (cast(GstMemory*)this._cPtr).maxsize = propval;
  }

  /**
      Get `align_` field.
      Returns: the alignment of the memory
  */
  @property size_t align_()
  {
    return (cast(GstMemory*)this._cPtr).align_;
  }

  /**
      Set `align_` field.
      Params:
        propval = the alignment of the memory
  */
  @property void align_(size_t propval)
  {
    (cast(GstMemory*)this._cPtr).align_ = propval;
  }

  /**
      Get `offset` field.
      Returns: the offset where valid data starts
  */
  @property size_t offset()
  {
    return (cast(GstMemory*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = the offset where valid data starts
  */
  @property void offset(size_t propval)
  {
    (cast(GstMemory*)this._cPtr).offset = propval;
  }

  /**
      Get `size` field.
      Returns: the size of valid data
  */
  @property size_t size()
  {
    return (cast(GstMemory*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the size of valid data
  */
  @property void size(size_t propval)
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
  static gst.memory.Memory newWrapped(gst.types.MemoryFlags flags, ubyte[] data, size_t maxsize, size_t offset, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    GstMemory* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(void*)data.ptr;
    auto _notify = notify ? freezeDelegate(cast(void*)&notify) : null;
    _cretval = gst_memory_new_wrapped(flags, _data, maxsize, offset, _size, _notify, _notifyCB);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
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
  gst.memory.Memory copy(ptrdiff_t offset, ptrdiff_t size)
  {
    GstMemory* _cretval;
    _cretval = gst_memory_copy(cast(GstMemory*)this._cPtr, offset, size);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the current size, offset and maxsize of mem.
  
      Params:
        offset = pointer to offset
        maxsize = pointer to maxsize
      Returns: the current size of mem
  */
  size_t getSizes(out size_t offset, out size_t maxsize)
  {
    size_t _retval;
    _retval = gst_memory_get_sizes(cast(GstMemory*)this._cPtr, cast(size_t*)&offset, cast(size_t*)&maxsize);
    return _retval;
  }

  /**
      Check if mem1 and mem2 share the memory with a common parent memory object
      and that the memory is contiguous.
      
      If this is the case, the memory of mem1 and mem2 can be merged
      efficiently by performing [gst.memory.Memory.share] on the parent object from
      the returned offset.
  
      Params:
        mem2 = a #GstMemory
        offset = a pointer to a result offset
      Returns: true if the memory is contiguous and of a common parent.
  */
  bool isSpan(gst.memory.Memory mem2, out size_t offset)
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
  bool isType(string memType)
  {
    bool _retval;
    const(char)* _memType = memType.toCString(No.Alloc);
    _retval = cast(bool)gst_memory_is_type(cast(GstMemory*)this._cPtr, _memType);
    return _retval;
  }

  /**
      Create a #GstMemory object that is mapped with flags. If mem is mappable
      with flags, this function returns the mapped mem directly. Otherwise a
      mapped copy of mem is returned.
      
      This function takes ownership of old mem and returns a reference to a new
      #GstMemory.
  
      Params:
        info = pointer for info
        flags = mapping flags
      Returns: a #GstMemory object mapped
        with flags or null when a mapping is not possible.
  */
  gst.memory.Memory makeMapped(out gst.map_info.MapInfo info, gst.types.MapFlags flags)
  {
    GstMemory* _cretval;
    GstMapInfo _info;
    _cretval = gst_memory_make_mapped(cast(GstMemory*)this._cPtr, &_info, flags);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    info = new gst.map_info.MapInfo(cast(void*)&_info, No.Take);
    return _retval;
  }

  /**
      Fill info with the pointer and sizes of the memory in mem that can be
      accessed according to flags.
      
      This function can return false for various reasons:
      $(LIST
        * the memory backed by mem is not accessible with the given flags.
        * the memory was already mapped with a different mapping.
      )
        
      info and its contents remain valid for as long as mem is valid and
      until [gst.memory.Memory.unmap] is called.
      
      For each [gst.memory.Memory.map] call, a corresponding [gst.memory.Memory.unmap] call
      should be done.
  
      Params:
        info = pointer for info
        flags = mapping flags
      Returns: true if the map operation was successful.
  */
  bool map(out gst.map_info.MapInfo info, gst.types.MapFlags flags)
  {
    bool _retval;
    GstMapInfo _info;
    _retval = cast(bool)gst_memory_map(cast(GstMemory*)this._cPtr, &_info, flags);
    info = new gst.map_info.MapInfo(cast(void*)&_info, No.Take);
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
  void resize(ptrdiff_t offset, size_t size)
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
  gst.memory.Memory share(ptrdiff_t offset, ptrdiff_t size)
  {
    GstMemory* _cretval;
    _cretval = gst_memory_share(cast(GstMemory*)this._cPtr, offset, size);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Release the memory obtained with [gst.memory.Memory.map]
  
      Params:
        info = a #GstMapInfo
  */
  void unmap(gst.map_info.MapInfo info)
  {
    gst_memory_unmap(cast(GstMemory*)this._cPtr, info ? cast(GstMapInfo*)info._cPtr : null);
  }
}
