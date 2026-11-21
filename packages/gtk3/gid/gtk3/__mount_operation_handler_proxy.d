/// Module for [MountOperationHandlerProxy] class
module gid.gtk3.__mount_operation_handler_proxy;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

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
