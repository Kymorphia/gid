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
class MountOperationHandlerProxy : StructWrap!(_GtkMountOperationHandlerProxy)
{
  /**
      Create a `__mount_operation_handler_proxy.MountOperationHandlerProxy` wrap type.
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
