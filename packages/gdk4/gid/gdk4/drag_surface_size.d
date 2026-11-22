/// Module for [DragSurfaceSize] class
module gid.gdk4.drag_surface_size;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.gobject2.boxed;

/**
    Contains information that is useful to compute the size of a drag surface.
*/
class DragSurfaceSize : gid.gobject2.boxed.BoxedWrap!(gdk_drag_surface_size_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override DragSurfaceSize self() nothrow
  {
    return this;
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
