/// Module for [DragSurfaceSize] class
module gdk.drag_surface_size;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    Contains information that is useful to compute the size of a drag surface.
*/
class DragSurfaceSize : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_drag_surface_size_get_type != &gidSymbolNotFound ? gdk_drag_surface_size_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
