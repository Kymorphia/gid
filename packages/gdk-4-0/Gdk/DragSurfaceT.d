module Gdk.DragSurfaceT;

public import Gdk.DragSurfaceIfaceProxy;
public import GObject.DClosure;
public import Gdk.DragSurfaceSize;
public import Gdk.Types;
public import Gdk.c.functions;
public import Gdk.c.types;
public import Gid.gid;

/**
 * A `GdkDragSurface` is an interface for surfaces used during DND.
 */
template DragSurfaceT()
{

  /**
   * Present drag_surface.
   * Params:
   *   width = the unconstrained drag_surface width to layout
   *   height = the unconstrained drag_surface height to layout
   * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
   */
  override bool present(int width, int height)
  {
    bool _retval;
    _retval = gdk_drag_surface_present(cast(GdkDragSurface*)cPtr, width, height);
    return _retval;
  }

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
  if (is(T : ComputeSizeCallbackDlg) || is(T : ComputeSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragSurface = getVal!DragSurface(_paramVals);
      auto size = getVal!DragSurfaceSize(&_paramVals[1]);
      _dClosure.dlg(size, dragSurface);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("compute-size", closure, after);
  }
}
