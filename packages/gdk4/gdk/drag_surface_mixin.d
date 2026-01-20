/// Module for [DragSurface] interface mixin
module gdk.drag_surface_mixin;

public import gdk.drag_surface_iface_proxy;
public import gdk.c.functions;
public import gdk.c.types;
public import gdk.drag_surface_size;
public import gdk.types;
public import gid.gid;
public import gobject.dclosure;

/**
    A [gdk.drag_surface.DragSurface] is an interface for surfaces used during DND.
*/
template DragSurfaceT()
{

  /**
      Present drag_surface.
  
      Params:
        width = the unconstrained drag_surface width to layout
        height = the unconstrained drag_surface height to layout
      Returns: false if it failed to be presented, otherwise true.
  */
  override bool present(int width, int height)
  {
    bool _retval;
    _retval = cast(bool)gdk_drag_surface_present(cast(GdkDragSurface*)this._cPtr, width, height);
    return _retval;
  }

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
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.drag_surface_size.DragSurfaceSize)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag_surface.DragSurface)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("compute-size", closure, after);
  }
}
