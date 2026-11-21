/// Module for [DragSurface] interface
module gid.gdk4.drag_surface;

public import gid.core.basictypes;
public import gid.gdk4.drag_surface_iface_proxy;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.drag_surface_size;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A surface that is used during DND.
*/
interface DragSurface : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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
        in the [gid.gdk4.drag_surface_size.DragSurfaceSize] object that is passed to the signal
        handler, using [gid.gdk4.drag_surface_size.DragSurfaceSize.setSize].
        
        Failing to set a size so will result in an arbitrary size being used as
        a result.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.drag_surface_size.DragSurfaceSize size, gid.gdk4.drag_surface.DragSurface dragSurface)`
  
          `size` the size of the drag surface (optional)
  
          `dragSurface` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectComputeSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gdk4.drag_surface_size.DragSurfaceSize)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.drag_surface.DragSurface)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.drag_surface.DragSurface.computeSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("compute-size", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.drag_surface.DragSurface]
interface DragSurfaceGidBuilderImpl(T)
{
}
