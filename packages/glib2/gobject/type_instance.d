/// Module for [TypeInstance] class
module gobject.type_instance;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    An opaque structure used as the base of all type instances.
*/
class TypeInstance
{
  GTypeInstance _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GTypeInstance*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  void* getPrivate(gobject.types.GType privateType) nothrow
  {
    auto _retval = g_type_instance_get_private(cast(GTypeInstance*)this._cPtr, privateType);
    return _retval;
  }
}
