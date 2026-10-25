/// Module for [MountOperationHandlerProxy] class
module gtk.__mount_operation_handler_proxy;

public import gid.basictypes;
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

  /**
      Create a `__mount_operation_handler_proxy.MountOperationHandlerProxy` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(_GtkMountOperationHandlerProxy*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }
}
