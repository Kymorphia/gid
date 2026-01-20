/// Module for [SignalGroup] class
module gobject.signal_group;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.dclosure;
import gobject.object;
import gobject.types;

/**
    [gobject.signal_group.SignalGroup] manages a collection of signals on a [gobject.object.ObjectWrap].
    
    [gobject.signal_group.SignalGroup] simplifies the process of connecting  many signals to a [gobject.object.ObjectWrap]
    as a group. As such there is no API to disconnect a signal from the group.
    
    In particular, this allows you to:
    
     $(LIST
        * Change the target instance, which automatically causes disconnection
          of the signals from the old instance and connecting to the new instance.
        * Block and unblock signals as a group
        * Ensuring that blocked state transfers across target instances.
     )
       
    One place you might want to use such a structure is with [gtk.text_view.TextView] and
    [gtk.text_buffer.TextBuffer]. Often times, you'll need to connect to many signals on
    [gtk.text_buffer.TextBuffer] from a [gtk.text_view.TextView] subclass. This allows you to create a
    signal group during instance construction, simply bind the
    `GtkTextView:buffer` property to `GSignalGroup:target` and connect
    all the signals you need. When the `GtkTextView:buffer` property changes
    all of the signals will be transitioned correctly.
*/
class SignalGroup : gobject.object.ObjectWrap
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
    return cast(void function())g_signal_group_get_type != &gidSymbolNotFound ? g_signal_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SignalGroup self()
  {
    return this;
  }

  /**
      Get `target` property.
      Returns: The target instance used when connecting signals.
  */
  @property gobject.object.ObjectWrap target()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.object.ObjectWrap)("target");
  }

  /**
      Set `target` property.
      Params:
        propval = The target instance used when connecting signals.
  */
  @property void target(gobject.object.ObjectWrap propval)
  {
    return setTarget(propval);
  }

  /**
      Creates a new #GSignalGroup for target instances of target_type.
  
      Params:
        targetType = the #GType of the target instance.
      Returns: a new #GSignalGroup
  */
  this(gobject.types.GType targetType)
  {
    GSignalGroup* _cretval;
    _cretval = g_signal_group_new(targetType);
    this(_cretval, Yes.Take);
  }

  /**
      Blocks all signal handlers managed by self so they will not
      be called during any signal emissions. Must be unblocked exactly
      the same number of times it has been blocked to become active again.
      
      This blocked state will be kept across changes of the target instance.
  */
  void block()
  {
    g_signal_group_block(cast(GSignalGroup*)this._cPtr);
  }

  /**
      Connects closure to the signal detailed_signal on #GSignalGroup:target.
      
      You cannot connect a signal handler after #GSignalGroup:target has been set.
  
      Params:
        detailedSignal = a string of the form `signal-name` with optional `::signal-detail`
        closure = the closure to connect.
        after = whether the handler should be called before or after the
           default handler of the signal.
  */
  void connectClosure(string detailedSignal, gobject.closure.Closure closure, bool after)
  {
    const(char)* _detailedSignal = detailedSignal.toCString(No.Alloc);
    g_signal_group_connect_closure(cast(GSignalGroup*)this._cPtr, _detailedSignal, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, after);
  }

  /**
      Gets the target instance used when connecting signals.
      Returns: The target instance
  */
  gobject.object.ObjectWrap dupTarget()
  {
    GObject* _cretval;
    _cretval = g_signal_group_dup_target(cast(GSignalGroup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the target instance used when connecting signals. Any signal
      that has been registered with [gobject.signal_group.SignalGroup.connectObject] or
      similar functions will be connected to this object.
      
      If the target instance was previously set, signals will be
      disconnected from that object prior to connecting to target.
  
      Params:
        target = The target instance used
              when connecting signals.
  */
  void setTarget(gobject.object.ObjectWrap target = null)
  {
    g_signal_group_set_target(cast(GSignalGroup*)this._cPtr, target ? cast(GObject*)target._cPtr(No.Dup) : null);
  }

  /**
      Unblocks all signal handlers managed by self so they will be
      called again during any signal emissions unless it is blocked
      again. Must be unblocked exactly the same number of times it
      has been blocked to become active again.
  */
  void unblock()
  {
    g_signal_group_unblock(cast(GSignalGroup*)this._cPtr);
  }

  /**
      Connect to `Bind` signal.
  
      This signal is emitted when #GSignalGroup:target is set to a new value
        other than null. It is similar to #GObject::notify on `target` except it
        will not emit when #GSignalGroup:target is null and also allows for
        receiving the #GObject without a data-race.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap instance, gobject.signal_group.SignalGroup signalGroup))
  
          `instance` a #GObject containing the new value for #GSignalGroup:target (optional)
  
          `signalGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBind(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gobject.signal_group.SignalGroup)))
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
    return connectSignalClosure("bind", closure, after);
  }

  /**
      Connect to `Unbind` signal.
  
      This signal is emitted when the target instance of self is set to a
        new #GObject.
        
        This signal will only be emitted if the previous target of self is
        non-null.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.signal_group.SignalGroup signalGroup))
  
          `signalGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnbind(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.signal_group.SignalGroup)))
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
    return connectSignalClosure("unbind", closure, after);
  }
}
