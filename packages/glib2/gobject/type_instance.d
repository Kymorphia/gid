/// Module for [TypeInstance] class
module gobject.type_instance;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.type_instance.TypeInstance");

    _cInstance = *cast(GTypeInstance*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  void* getPrivate(gobject.types.GType privateType)
  {
    auto _retval = g_type_instance_get_private(cast(GTypeInstance*)this._cPtr, privateType);
    return _retval;
  }
}
