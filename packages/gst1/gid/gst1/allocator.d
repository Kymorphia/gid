/// Module for [Allocator] class
module gid.gst1.allocator;

public import gid.core.basictypes;
import gid.core.utils;
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
@gidGir("Allocator", "AllocatorClass")
class Allocator : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAlloc` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.memory.Memory vfuncAlloc(size_t size, gid.gst1.allocation_params.AllocationParams* params = null)
  {
    auto _klass = cast(GstAllocatorClass*)_vfuncClass;
    if (!_klass.alloc)
      return typeof(return).init;

    GstMemory* _cretval;
    _cretval = _klass.alloc(cast(GstAllocator*)this._cPtr, size, cast(GstAllocationParams*)params);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Free memory that was previously allocated with [gid.gst1.allocator.Allocator.alloc].
  
      Params:
        memory = the memory to free
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFree` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFree(gid.gst1.memory.Memory memory)
  {
    auto _klass = cast(GstAllocatorClass*)_vfuncClass;
    if (!_klass.free)
      return;

    _klass.free(cast(GstAllocator*)this._cPtr, memory ? cast(GstMemory*)memory._cPtr(Yes.Dup) : null);
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Allocator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.allocator.Allocator), T.stringof ~ " is not derived from gid.gst1.allocator.Allocator");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAlloc", true)[0]) == gid.gst1.allocator.Allocator))
      _installVfunc(klass, "alloc");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFree", true)[0]) == gid.gst1.allocator.Allocator))
      _installVfunc(klass, "free");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAllocatorClass*)klass;

    switch (vfunc)
    {
      case "alloc":
      {
        static extern(C) GstMemory* _vfuncAllocTramp(GstAllocator* allocator, size_t size, GstAllocationParams* params) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gst1.allocator.Allocator)(cast(void*)allocator);
          if (!_obj)
          {
            auto _klass = cast(GstAllocatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)allocator);
            if (_klass.alloc)
              return (cast(typeof(&_vfuncAllocTramp))_klass.alloc)(allocator, size, params);
            return typeof(return).init;
          }

          gid.gst1.memory.Memory _dretval;

          try
          {
            _dretval = _obj.vfuncAlloc(size, cast(gid.gst1.allocation_params.AllocationParams*)params);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.allocator.Allocator.vfuncAlloc");
          }
          auto _retval = _dretval ? cast(GstMemory*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.alloc = cast(typeof(_klass.alloc))&_vfuncAllocTramp;
        break;
      }
      case "free":
      {
        static extern(C) void _vfuncFreeTramp(GstAllocator* allocator, GstMemory* memory) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gst1.allocator.Allocator)(cast(void*)allocator);
          if (!_obj)
          {
            auto _klass = cast(GstAllocatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)allocator);
            if (_klass.free)
              return (cast(typeof(&_vfuncFreeTramp))_klass.free)(allocator, memory);
            return;
          }

          try
          {
            _obj.vfuncFree(memory ? new gid.gst1.memory.Memory(cast(void*)memory, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.allocator.Allocator.vfuncFree");
          }
        }

        _klass.free = cast(typeof(_klass.free))&_vfuncFreeTramp;
        break;
      }
      default:
      break;
    }
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
