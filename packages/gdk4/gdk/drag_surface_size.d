/// Module for [DragSurfaceSize] class
module gdk.drag_surface_size;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
    The [gdk.drag_surface_size.DragSurfaceSize] struct contains information that is useful
    to compute the size of a drag surface.
*/
class DragSurfaceSize
{
  GdkDragSurfaceSize* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.drag_surface_size.DragSurfaceSize");

    _cInstancePtr = cast(GdkDragSurfaceSize*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Sets the size the drag surface prefers to be resized to.
  
      Params:
        width = the width
        height = the height
  */
  void setSize(int width, int height)
  {
    gdk_drag_surface_size_set_size(cast(GdkDragSurfaceSize*)this._cPtr, width, height);
  }
}
