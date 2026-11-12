/// Module for [ColorBalance] interface
module gstvideo.color_balance;

public import gid.basictypes;
public import gstvideo.color_balance_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.color_balance_channel;
import gstvideo.types;

/**
    This interface is implemented by elements which can perform some color
    balance operation on video frames they process. For example, modifying
    the brightness, contrast, hue or saturation.
    
    Example elements are 'xvimagesink' and 'colorbalance'
*/
interface ColorBalance : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_color_balance_get_type != &gidSymbolNotFound ? gst_color_balance_get_type() : cast(GType)0;
  }

  /**
      Get the #GstColorBalanceType of this implementation.
      Returns: A the #GstColorBalanceType.
  */
  gstvideo.types.ColorBalanceType getBalanceType();

  /**
      Retrieve the current value of the indicated channel, between min_value
      and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
      Returns: The current value of the channel.
  */
  int getValue(gstvideo.color_balance_channel.ColorBalanceChannel channel);

  /**
      Retrieve a list of the available channels.
      Returns: A
                 GList containing pointers to #GstColorBalanceChannel
                 objects. The list is owned by the #GstColorBalance
                 instance and must not be freed.
  */
  gstvideo.color_balance_channel.ColorBalanceChannel[] listChannels();

  /**
      Sets the current value of the channel to the passed value, which must
      be between min_value and max_value.
      
      See Also: The #GstColorBalanceChannel.min_value and
              #GstColorBalanceChannel.max_value members of the
              #GstColorBalanceChannel object.
  
      Params:
        channel = A #GstColorBalanceChannel instance
        value = The new value for the channel.
  */
  void setValue(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value);

  /**
      A helper function called by implementations of the GstColorBalance
      interface. It fires the #GstColorBalance::value-changed signal on the
      instance, and the #GstColorBalanceChannel::value-changed signal on the
      channel object.
  
      Params:
        channel = A #GstColorBalanceChannel whose value has changed
        value = The new value of the channel
  */
  void valueChanged(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value);

  /**
      Connect to `ValueChanged` signal.
  
      Fired when the value of the indicated channel has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value, gstvideo.color_balance.ColorBalance colorBalance)`
  
          `channel` The #GstColorBalanceChannel (optional)
  
          `value` The new value (optional)
  
          `colorBalance` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstvideo.color_balance_channel.ColorBalanceChannel)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstvideo.color_balance.ColorBalance)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gstvideo.color_balance.ColorBalance.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("value-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gstvideo.color_balance.ColorBalance]
interface ColorBalanceGidBuilderImpl(T)
{
}
