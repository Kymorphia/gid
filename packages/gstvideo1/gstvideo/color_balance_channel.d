/// Module for [ColorBalanceChannel] class
module gstvideo.color_balance_channel;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    The #GstColorBalanceChannel object represents a parameter
    for modifying the color balance implemented by an element providing the
    #GstColorBalance interface. For example, Hue or Saturation.
*/
class ColorBalanceChannel : gobject.object.ObjectWrap
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
    return cast(void function())gst_color_balance_channel_get_type != &gidSymbolNotFound ? gst_color_balance_channel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorBalanceChannel self()
  {
    return this;
  }

  /**
      Connect to `ValueChanged` signal.
  
      Fired when the value of the indicated channel has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int value, gstvideo.color_balance_channel.ColorBalanceChannel colorBalanceChannel))
  
          `value` The new value (optional)
  
          `colorBalanceChannel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstvideo.color_balance_channel.ColorBalanceChannel)))
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
}
