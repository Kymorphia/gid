/// Module for [MountOperationHandlerSkeleton] class
module gtk.__mount_operation_handler_skeleton;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
}
