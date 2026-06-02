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
class MountOperationHandlerSkeleton
{
  _GtkMountOperationHandlerSkeleton _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(_GtkMountOperationHandlerSkeleton*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }
}
