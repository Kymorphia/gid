/// Module for [Allocator] class
module gst.allocator;

import gid.gid;
import gobject.object;
import gst.allocation_params;
import gst.c.functions;
import gst.c.types;
import gst.memory;
import gst.object;
import gst.types;

/**
    Memory is usually created by allocators with a [gst.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gst.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gst.allocator.Allocator.find]. [gst.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gst.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
*/
class Allocator : gst.object.ObjectWrap
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
    return cast(void function())gst_allocator_get_type != &gidSymbolNotFound ? gst_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Allocator self()
  {
    return this;
  }

  /**
      Find a previously registered allocator with name. When name is null, the
      default allocator will be returned.
  
      Params:
        name = the name of the allocator
      Returns: a #GstAllocator or null when
        the allocator with name was not registered.
  */
  static gst.allocator.Allocator find(string name = null)
  {
    GstAllocator* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_allocator_find(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers the memory allocator with name.
  
      Params:
        name = the name of the allocator
        allocator = #GstAllocator
  */
  static void register(string name, gst.allocator.Allocator allocator)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_allocator_register(_name, allocator ? cast(GstAllocator*)allocator._cPtr(Yes.Dup) : null);
  }

  /**
      Use allocator to allocate a new memory block with memory that is at least
      size big.
      
      The optional params can specify the prefix and padding for the memory. If
      null is passed, no flags, no extra prefix/padding and a default alignment is
      used.
      
      The prefix/padding will be filled with 0 if flags contains
      #GST_MEMORY_FLAG_ZERO_PREFIXED and #GST_MEMORY_FLAG_ZERO_PADDED respectively.
      
      When allocator is null, the default allocator will be used.
      
      The alignment in params is given as a bitmask so that align + 1 equals
      the amount of bytes to align to. For example, to align to 8 bytes,
      use an alignment of 7.
  
      Params:
        size = size of the visible memory area
        params = optional parameters
      Returns: a new #GstMemory.
  */
  gst.memory.Memory alloc(size_t size, gst.allocation_params.AllocationParams params)
  {
    GstMemory* _cretval;
    _cretval = gst_allocator_alloc(cast(GstAllocator*)this._cPtr, size, cast(GstAllocationParams*)&params);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the default allocator.
  */
  void setDefault()
  {
    gst_allocator_set_default(cast(GstAllocator*)this._cPtr);
  }
}
