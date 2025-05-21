/// Module for [MemoryPool] class
module arrow.memory_pool;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MemoryPool : gobject.object.ObjectWrap
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
    return cast(void function())garrow_memory_pool_get_type != &gidSymbolNotFound ? garrow_memory_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryPool self()
  {
    return this;
  }

  /** */
  static arrow.memory_pool.MemoryPool default_()
  {
    GArrowMemoryPool* _cretval;
    _cretval = garrow_memory_pool_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.memory_pool.MemoryPool)(cast(GArrowMemoryPool*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getBackendName()
  {
    char* _cretval;
    _cretval = garrow_memory_pool_get_backend_name(cast(GArrowMemoryPool*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  long getBytesAllocated()
  {
    long _retval;
    _retval = garrow_memory_pool_get_bytes_allocated(cast(GArrowMemoryPool*)this._cPtr);
    return _retval;
  }

  /**
      Return peak memory allocation in this memory pool.
      Returns: Maximum bytes allocated. If not known (or not implemented),
          returns -1.
  */
  long getMaxMemory()
  {
    long _retval;
    _retval = garrow_memory_pool_get_max_memory(cast(GArrowMemoryPool*)this._cPtr);
    return _retval;
  }
}
