/// Module for [WeakRef] class
module gobject.weak_ref;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure containing a weak reference to a #GObject.
    
    A [gobject.weak_ref.WeakRef] can either be empty (i.e. point to null), or point to an
    object for as long as at least one "strong" reference to that object
    exists. Before the object's #GObjectClass.dispose method is called,
    every #GWeakRef associated with becomes empty (i.e. points to null).
    
    Like #GValue, #GWeakRef can be statically allocated, stack- or
    heap-allocated, or embedded in larger structures.
    
    Unlike [gobject.object.ObjectWrap.weakRef] and [gobject.object.ObjectWrap.addWeakPointer], this weak
    reference is thread-safe: converting a weak pointer to a reference is
    atomic with respect to invalidation of weak pointers to destroyed
    objects.
    
    If the object's #GObjectClass.dispose method results in additional
    references to the object being held (‘re-referencing’), any #GWeakRefs taken
    before it was disposed will continue to point to null.  Any #GWeakRefs taken
    during disposal and after re-referencing, or after disposal has returned due
    to the re-referencing, will continue to point to the object until its refcount
    goes back to zero, at which point they too will be invalidated.
    
    It is invalid to take a #GWeakRef on an object during #GObjectClass.dispose
    without first having or creating a strong reference to the object.
*/
class WeakRef
{
  GWeakRef _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.weak_ref.WeakRef");

    _cInstance = *cast(GWeakRef*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
