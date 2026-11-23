/// Module for [PhysMemoryAllocator] interface mixin
module gid.gstallocators1.phys_memory_allocator_mixin;

public import gid.core.basictypes;
public import gid.gstallocators1.phys_memory_allocator_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gst1.memory;
public import gid.gstallocators1.c.functions;
public import gid.gstallocators1.c.types;
public import gid.gstallocators1.types;

/** */
template PhysMemoryAllocatorT()
{

  /**
      Implementations shall return the physicall memory address
         that is backing the provided memory, or 0 if none.
  
      Params:
        mem =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetPhysAddr`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected size_t vfuncGetPhysAddr(gid.gst1.memory.Memory mem)
  {
    auto _klass = cast(GstPhysMemoryAllocatorInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator._getGType);
    if (!_klass || !_klass.getPhysAddr)
      return typeof(return).init;

    size_t _retval;
    _retval = _klass.getPhysAddr(cast(GstPhysMemoryAllocator*)this._cPtr, mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gstallocators1_phys_memory_allocator_PhysMemoryAllocator(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPhysAddr", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gstallocators1_phys_memory_allocator_PhysMemoryAllocator(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetPhysAddr", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstallocators1_phys_memory_allocator_PhysMemoryAllocator(iface, "get_phys_addr");
  }

  private static void _installIfaceVfunc_gid_gstallocators1_phys_memory_allocator_PhysMemoryAllocator(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstPhysMemoryAllocatorInterface*)iface;

    switch (vfunc)
    {
      case "get_phys_addr":
      {
        static extern(C) size_t _vfuncGetPhysAddrTramp(GstPhysMemoryAllocator* allocator, GstMemory* mem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)allocator);
          if (!_obj)
          {
            auto _klass = cast(GstPhysMemoryAllocatorInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)allocator), gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator._getGType);
            if (_klass && _klass.getPhysAddr)
              return (cast(typeof(&_vfuncGetPhysAddrTramp))_klass.getPhysAddr)(allocator, mem);
            return typeof(return).init;
          }

          size_t _retval;
          auto _mem = mem ? new gid.gst1.memory.Memory(cast(void*)mem, Yes.Take)._cBorrow : null;

          try
          {
            _retval = _obj.vfuncGetPhysAddr(_mem);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator.vfuncGetPhysAddr");
          }
          if (_mem)
            _mem._cUnborrow;

          return _retval;
        }

        _klass.getPhysAddr = cast(typeof(_klass.getPhysAddr))&_vfuncGetPhysAddrTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator]
template PhysMemoryAllocatorGidBuilderT()
{
}
