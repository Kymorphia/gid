/// Module for [MountOperationHandlerSkeleton] class
module gid.gtk3.__mount_operation_handler_skeleton;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    The #_GtkMountOperationHandlerSkeleton structure contains only private data and should only be accessed using the provided API.
*/
class MountOperationHandlerSkeleton : StructWrap!(_GtkMountOperationHandlerSkeleton)
{
  /**
      Create a `__mount_operation_handler_skeleton.MountOperationHandlerSkeleton` wrap type.
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
