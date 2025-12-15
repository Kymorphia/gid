/// Module for [TimedValueControlSource] class
module gstcontroller.timed_value_control_source;

import gid.gid;
import glib.sequence_iter;
import gobject.dclosure;
import gst.control_source;
import gst.types;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.control_point;
import gstcontroller.types;

/**
    Base class for #GstControlSource that use time-stamped values.
    
    When overriding bind, chain up first to give this bind implementation a
    chance to setup things.
    
    All functions are MT-safe.
*/
class TimedValueControlSource : gst.control_source.ControlSource
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
    return cast(void function())gst_timed_value_control_source_get_type != &gidSymbolNotFound ? gst_timed_value_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimedValueControlSource self()
  {
    return this;
  }

  /**
      Find last value before given timestamp in control point list.
      If all values in the control point list come after the given
      timestamp or no values exist, null is returned.
      
      For use in control source implementations.
  
      Params:
        timestamp = the search key
      Returns: the found #GSequenceIter or null
  */
  glib.sequence_iter.SequenceIter findControlPointIter(gst.types.ClockTime timestamp)
  {
    GSequenceIter* _cretval;
    _cretval = gst_timed_value_control_source_find_control_point_iter(cast(GstTimedValueControlSource*)this._cPtr, timestamp);
    auto _retval = _cretval ? new glib.sequence_iter.SequenceIter(cast(GSequenceIter*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns a read-only copy of the list of #GstTimedValue for the given property.
      Free the list after done with it.
      Returns: a copy
        of the list, or null if the property isn't handled by the controller
  */
  gst.types.TimedValue[] getAll()
  {
    GList* _cretval;
    _cretval = gst_timed_value_control_source_get_all(cast(GstTimedValueControlSource*)this._cPtr);
    auto _retval = gListToD!(gst.types.TimedValue, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the number of control points that are set.
      Returns: the number of control points that are set.
  */
  int getCount()
  {
    int _retval;
    _retval = gst_timed_value_control_source_get_count(cast(GstTimedValueControlSource*)this._cPtr);
    return _retval;
  }

  /**
      Set the value of given controller-handled property at a certain time.
  
      Params:
        timestamp = the time the control-change is scheduled for
        value = the control-value
      Returns: FALSE if the values couldn't be set, TRUE otherwise.
  */
  bool set(gst.types.ClockTime timestamp, double value)
  {
    bool _retval;
    _retval = cast(bool)gst_timed_value_control_source_set(cast(GstTimedValueControlSource*)this._cPtr, timestamp, value);
    return _retval;
  }

  /**
      Sets multiple timed values at once.
  
      Params:
        timedvalues = a list
          with #GstTimedValue items
      Returns: FALSE if the values couldn't be set, TRUE otherwise.
  */
  bool setFromList(gst.types.TimedValue[] timedvalues)
  {
    bool _retval;
    auto _timedvalues = gSListFromD!(gst.types.TimedValue)(timedvalues);
    scope(exit) containerFree!(const(GSList)*, gst.types.TimedValue, GidOwnership.None)(_timedvalues);
    _retval = cast(bool)gst_timed_value_control_source_set_from_list(cast(GstTimedValueControlSource*)this._cPtr, _timedvalues);
    return _retval;
  }

  /**
      Used to remove the value of given controller-handled property at a certain
      time.
  
      Params:
        timestamp = the time the control-change should be removed from
      Returns: FALSE if the value couldn't be unset (i.e. not found, TRUE otherwise.
  */
  bool unset(gst.types.ClockTime timestamp)
  {
    bool _retval;
    _retval = cast(bool)gst_timed_value_control_source_unset(cast(GstTimedValueControlSource*)this._cPtr, timestamp);
    return _retval;
  }

  /**
      Used to remove all time-stamped values of given controller-handled property
  */
  void unsetAll()
  {
    gst_timed_value_control_source_unset_all(cast(GstTimedValueControlSource*)this._cPtr);
  }

  /**
      Connect to `ValueAdded` signal.
  
      Emitted right after the new value has been added to self
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstcontroller.control_point.ControlPoint timedValue, gstcontroller.timed_value_control_source.TimedValueControlSource timedValueControlSource))
  
          `timedValue` The newly added #GstTimedValue (optional)
  
          `timedValueControlSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gstcontroller.control_point.ControlPoint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstcontroller.timed_value_control_source.TimedValueControlSource)))
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
    return connectSignalClosure("value-added", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Emitted right after the new value has been set on timed_signals
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstcontroller.control_point.ControlPoint timedValue, gstcontroller.timed_value_control_source.TimedValueControlSource timedValueControlSource))
  
          `timedValue` The #GstTimedValue where the value changed (optional)
  
          `timedValueControlSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gstcontroller.control_point.ControlPoint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstcontroller.timed_value_control_source.TimedValueControlSource)))
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
    return connectSignalClosure("value-changed", closure, after);
  }

  /**
      Connect to `ValueRemoved` signal.
  
      Emitted when timed_value is removed from self
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstcontroller.control_point.ControlPoint timedValue, gstcontroller.timed_value_control_source.TimedValueControlSource timedValueControlSource))
  
          `timedValue` The removed #GstTimedValue (optional)
  
          `timedValueControlSource` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gstcontroller.control_point.ControlPoint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstcontroller.timed_value_control_source.TimedValueControlSource)))
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
    return connectSignalClosure("value-removed", closure, after);
  }
}
