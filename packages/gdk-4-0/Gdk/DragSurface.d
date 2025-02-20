module Gdk.DragSurface;

public import Gdk.DragSurfaceIfaceProxy;
import GObject.DClosure;
import Gdk.DragSurfaceSize;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * A `GdkDragSurface` is an interface for surfaces used during DND.
 */
interface DragSurface
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_drag_surface_get_type != &gidSymbolNotFound ? gdk_drag_surface_get_type() : cast(GType)0;
  }

  /**
   * Present drag_surface.
   * Params:
   *   width = the unconstrained drag_surface width to layout
   *   height = the unconstrained drag_surface height to layout
   * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
   */
  bool present(int width, int height);

  /**
   * Emitted when the size for the surface needs to be computed, when it is
   * present.
   * This signal will normally be emitted during the native surface layout
   * cycle when the surface size needs to be recomputed.
   * It is the responsibility of the drag surface user to handle this signal
   * and compute the desired size of the surface, storing the computed size
   * in the [Gdk.DragSurfaceSize] object that is passed to the signal
   * handler, using [Gdk.DragSurfaceSize.setSize].
   * Failing to set a size so will result in an arbitrary size being used as
   * a result.
   * Params
   *   size = the size of the drag surface
   *   dragSurface = the instance the signal is connected to
   */
  alias ComputeSizeCallbackDlg = void delegate(DragSurfaceSize size, DragSurface dragSurface);
  alias ComputeSizeCallbackFunc = void function(DragSurfaceSize size, DragSurface dragSurface);

  /**
   * Connect to ComputeSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ComputeSizeCallbackDlg) || is(T : ComputeSizeCallbackFunc));
  }
