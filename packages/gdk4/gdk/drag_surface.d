/// Module for [DragSurface] interface
module gdk.drag_surface;

public import gid.basictypes;
public import gdk.drag_surface_iface_proxy;
import gdk.c.functions;
import gdk.c.types;
import gdk.drag_surface_size;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;

/**
    A surface that is used during DND.
*/
interface DragSurface : GidWrap
{

  /** */
  static GType _getGType() nothrow
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
  
          `void callback(gdk.drag_surface_size.DragSurfaceSize size, gdk.drag_surface.DragSurface dragSurface)`
  
          `size` the size of the drag surface (optional)
  
          `dragSurface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectComputeSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.drag_surface_size.DragSurfaceSize)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gdk.drag_surface.DragSurface)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gdk.drag_surface.DragSurface.computeSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("compute-size", closure, after);
  }
}

/// Fluent builder implementation template for [gdk.drag_surface.DragSurface]
interface DragSurfaceGidBuilderImpl(T)
{
}
