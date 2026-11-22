/// Module for [WeakRef] class
module gid.gobject2.weak_ref;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;

/**
    A structure containing a weak reference to a #GObject.
    
    A [gid.gobject2.weak_ref.WeakRef] can either be empty (i.e. point to null), or point to an
    object for as long as at least one "strong" reference to that object
    exists. Before the object's #GObjectClass.dispose method is called,
    every #GWeakRef associated with becomes empty (i.e. points to null).
    
    Like #GValue, #GWeakRef can be statically allocated, stack- or
    heap-allocated, or embedded in larger structures.
    
    Unlike [gid.gobject2.object.ObjectWrap.weakRef] and [gid.gobject2.object.ObjectWrap.addWeakPointer], this weak
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
class WeakRef : StructWrap!(GWeakRef)
{
  /**
      Create a `weak_ref.WeakRef` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }
}
