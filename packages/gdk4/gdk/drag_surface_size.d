/// Module for [DragSurfaceSize] class
module gdk.drag_surface_size;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(GdkDragSurfaceSize*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Sets the size the drag surface prefers to be resized to.
  
      Params:
        width = the width
        height = the height
  */
  void setSize(int width, int height) nothrow
  {
    gdk_drag_surface_size_set_size(cast(GdkDragSurfaceSize*)this._cPtr, width, height);
  }
}
