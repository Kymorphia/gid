/// Module for [DragSurface] interface
module gdk.drag_surface;

public import gdk.drag_surface_iface_proxy;
import gdk.c.functions;
import gdk.c.types;
import gdk.drag_surface_size;
import gdk.types;
import gid.gid;
import gobject.dclosure;

/**
    A [gdk.drag_surface.DragSurface] is an interface for surfaces used during DND.
*/
interface DragSurface
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_drag_surface_get_type != &gidSymbolNotFound ? gdk_drag_surface_get_type() : cast(GType)0;
  }

  /**
      Present drag_surface.
  
      Params:
        width = the unconstrained drag_surface width to layout
        height = the unconstrained drag_surface height to layout
      Returns: false if it failed to be presented, otherwise true.
  */
  bool present(int width, int height);

  /**
      Connect to `ComputeSize` signal.
  
      Emitted when the size for the surface needs to be computed, when it is
        present.
        
        This signal will normally be emitted during the native surface layout
        cycle when the surface size needs to be recomputed.
        
        It is the responsibility of the drag surface user to handle this signal
        and compute the desired size of the surface, storing the computed size
        in the [gdk.drag_surface_size.DragSurfaceSize] object that is passed to the signal
        handler, using [gdk.drag_surface_size.DragSurfaceSize.setSize].
        
        Failing to set a size so will result in an arbitrary size being used as
        a result.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.drag_surface_size.DragSurfaceSize size, gdk.drag_surface.DragSurface dragSurface))
  
          `size` the size of the drag surface (optional)
  
          `dragSurface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After);
}
