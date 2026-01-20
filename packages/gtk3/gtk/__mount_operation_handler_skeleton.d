/// Module for [MountOperationHandlerSkeleton] class
module gtk.__mount_operation_handler_skeleton;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.__mount_operation_handler_skeleton.MountOperationHandlerSkeleton");

    _cInstance = *cast(_GtkMountOperationHandlerSkeleton*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
