/// Module for [Allocator] class
module gid.gst1.allocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.memory;
import gid.gst1.object;
import gid.gst1.types;

/**
    Memory is usually created by allocators with a [gid.gst1.allocator.Allocator.alloc]
    method call. When null is used as the allocator, the default allocator will
    be used.
    
    New allocators can be registered with [gid.gst1.allocator.Allocator.register].
    Allocators are identified by name and can be retrieved with
    [gid.gst1.allocator.Allocator.find]. [gid.gst1.allocator.Allocator.setDefault] can be used to change the
    default allocator.
    
    New memory can be created with [gid.gst1.memory.Memory.newWrapped] that wraps the memory
    allocated elsewhere.
*/
class Allocator : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_allocator_get_type != &gidSymbolNotFound ? gst_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override Allocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.allocator.Allocator]
      Returns: New builder object
  */
  static AllocatorGidBuilder builder() nothrow
  {
    return new AllocatorGidBuilder;
  }

  /**
      Find a previously registered allocator with name. When name is null, the
      default allocator will be returned.
  
      Params:
        name = the name of the allocator
      Returns: a #GstAllocator or null when
        the allocator with name was not registered.
  */
  static gid.gst1.allocator.Allocator find(string name = null) nothrow
  {
    GstAllocator* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_allocator_find(_name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Registers the memory allocator with name.
  
      Params:
        name = the name of the allocator
        allocator = #GstAllocator
  */
  static void register(string name, gid.gst1.allocator.Allocator allocator) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
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
  gid.gst1.memory.Memory alloc(size_t size, gid.gst1.allocation_params.AllocationParams* params = null) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_allocator_alloc(cast(GstAllocator*)this._cPtr, size, cast(GstAllocationParams*)params);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Set the default allocator.
  */
  void setDefault() nothrow
  {
    gst_allocator_set_default(cast(GstAllocator*)this._cPtr(Yes.Dup));
  }
}

/// Fluent builder implementation template for [gid.gst1.allocator.Allocator]
class AllocatorGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.allocator.Allocator]
final class AllocatorGidBuilder : AllocatorGidBuilderImpl!AllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Allocator build() nothrow
  {
    return new Allocator(cast(void*)createGObject(Allocator._getGType), Yes.Take);
  }
}
