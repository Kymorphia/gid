/// Module for [DropControllerMotion] class
module gid.gtk4.drop_controller_motion;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.drop;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.types;

/**
    An event controller tracking the pointer during Drag-and-Drop operations.
    
    It is modeled after [gid.gtk4.event_controller_motion.EventControllerMotion] so if you
    have used that, this should feel really familiar.
    
    This controller is not able to accept drops, use [gid.gtk4.drop_target.DropTarget]
    for that purpose.
*/
class DropControllerMotion : gid.gtk4.event_controller.EventController
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_controller_motion_get_type != &gidSymbolNotFound ? gtk_drop_controller_motion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkDropControllerMotion";
  }

  /** Returns `this`, for use in `with` statements. */
  override DropControllerMotion self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.drop_controller_motion.DropControllerMotion]
      Returns: New builder object
  */
  static DropControllerMotionGidBuilder builder() nothrow
  {
    return new DropControllerMotionGidBuilder;
  }

  /**
      Get `drop` property.
      Returns: The ongoing drop operation over the controller's widget or
        its descendant.
        
        If no drop operation is going on, this property returns null.
        
        The event controller should not modify the @drop, but it might
        want to query its properties.
        
        When handling crossing events, this property is updated
        before [gid.gtk4.drop_controller_motion.DropControllerMotion.enter], but after
        [gid.gtk4.drop_controller_motion.DropControllerMotion.leave] is emitted.
  */
  @property gid.gdk4.drop.Drop drop() nothrow
  {
    return getDrop();
  }

  /**
      Creates a new event controller that will handle pointer motion
      events during drag and drop.
      Returns: a new [gid.gtk4.drop_controller_motion.DropControllerMotion]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkEventController* _cretval;
      _cretval = gtk_drop_controller_motion_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns if a Drag-and-Drop operation is within the widget
      self or one of its children.
      Returns: true if a dragging pointer is within self or one of its children.
  */
  bool containsPointer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_drop_controller_motion_contains_pointer(cast(GtkDropControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gid.gdk4.drop.Drop] of a current Drag-and-Drop operation
      over the widget of self.
      Returns: The [gid.gdk4.drop.Drop] currently
          happening within self
  */
  gid.gdk4.drop.Drop getDrop() nothrow
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_controller_motion_get_drop(cast(GtkDropControllerMotion*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns if a Drag-and-Drop operation is within the widget
      self, not one of its children.
      Returns: true if a dragging pointer is within self but
          not one of its children
  */
  bool isPointer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_drop_controller_motion_is_pointer(cast(GtkDropControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Enter` signal.
  
      Signals that the pointer has entered the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, gid.gtk4.drop_controller_motion.DropControllerMotion dropControllerMotion)`
  
          `x` coordinates of pointer location (optional)
  
          `y` coordinates of pointer location (optional)
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drop_controller_motion.DropControllerMotion.enter");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Signals that the pointer has left the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.drop_controller_motion.DropControllerMotion dropControllerMotion)`
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLeave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drop_controller_motion.DropControllerMotion.leave");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      Emitted when the pointer moves inside the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, gid.gtk4.drop_controller_motion.DropControllerMotion dropControllerMotion)`
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMotion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.drop_controller_motion.DropControllerMotion.motion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.drop_controller_motion.DropControllerMotion]
class DropControllerMotionGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.drop_controller_motion.DropControllerMotion]
final class DropControllerMotionGidBuilder : DropControllerMotionGidBuilderImpl!DropControllerMotionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DropControllerMotion build() nothrow
  {
    return new DropControllerMotion(cast(void*)createGObject(DropControllerMotion._getGType), Yes.Take);
  }
}
