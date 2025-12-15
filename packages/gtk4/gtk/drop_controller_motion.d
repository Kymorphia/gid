/// Module for [DropControllerMotion] class
module gtk.drop_controller_motion;

import gdk.drop;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.drop_controller_motion.DropControllerMotion] is an event controller tracking
    the pointer during Drag-and-Drop operations.
    
    It is modeled after [gtk.event_controller_motion.EventControllerMotion] so if you
    have used that, this should feel really familiar.
    
    This controller is not able to accept drops, use [gtk.drop_target.DropTarget]
    for that purpose.
*/
class DropControllerMotion : gtk.event_controller.EventController
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_controller_motion_get_type != &gidSymbolNotFound ? gtk_drop_controller_motion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DropControllerMotion self()
  {
    return this;
  }

  /**
      Get `drop` property.
      Returns: The ongoing drop operation over the controller's widget or
      its descendant.
      
      If no drop operation is going on, this property returns null.
      
      The event controller should not modify the @drop, but it might
      want to query its properties.
      
      When handling crossing events, this property is updated
      before [gtk.drop_controller_motion.DropControllerMotion.enter], but after
      [gtk.drop_controller_motion.DropControllerMotion.leave] is emitted.
  */
  @property gdk.drop.Drop drop()
  {
    return getDrop();
  }

  /**
      Creates a new event controller that will handle pointer motion
      events during drag and drop.
      Returns: a new [gtk.drop_controller_motion.DropControllerMotion]
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_drop_controller_motion_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns if a Drag-and-Drop operation is within the widget
      self or one of its children.
      Returns: true if a dragging pointer is within self or one of its children.
  */
  bool containsPointer()
  {
    bool _retval;
    _retval = cast(bool)gtk_drop_controller_motion_contains_pointer(cast(GtkDropControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gdk.drop.Drop] of a current Drag-and-Drop operation
      over the widget of self.
      Returns: The [gdk.drop.Drop] currently
          happening within self
  */
  gdk.drop.Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_controller_motion_get_drop(cast(GtkDropControllerMotion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns if a Drag-and-Drop operation is within the widget
      self, not one of its children.
      Returns: true if a dragging pointer is within self but
          not one of its children
  */
  bool isPointer()
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
  
          $(D void callback(double x, double y, gtk.drop_controller_motion.DropControllerMotion dropControllerMotion))
  
          `x` coordinates of pointer location (optional)
  
          `y` coordinates of pointer location (optional)
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Signals that the pointer has left the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.drop_controller_motion.DropControllerMotion dropControllerMotion))
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      Emitted when the pointer moves inside the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.drop_controller_motion.DropControllerMotion dropControllerMotion))
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `dropControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.drop_controller_motion.DropControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}
