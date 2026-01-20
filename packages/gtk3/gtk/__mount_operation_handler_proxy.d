/// Module for [MountOperationHandlerProxy] class
module gtk.__mount_operation_handler_proxy;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #_GtkMountOperationHandlerProxy structure contains only private data and should only be accessed using the provided API.
*/
class MountOperationHandlerProxy
{
  _GtkMountOperationHandlerProxy _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.__mount_operation_handler_proxy.MountOperationHandlerProxy");

    _cInstance = *cast(_GtkMountOperationHandlerProxy*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
