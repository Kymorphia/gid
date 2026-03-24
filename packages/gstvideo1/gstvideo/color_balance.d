/// Module for [ColorBalance] interface
module gstvideo.color_balance;

public import gstvideo.color_balance_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
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
interface ColorBalance
{

  /** */
  static GType _getGType()
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
  
          $(D void callback(gstvideo.color_balance_channel.ColorBalanceChannel channel, int value, gstvideo.color_balance.ColorBalance colorBalance))
  
          `channel` The #GstColorBalanceChannel (optional)
  
          `value` The new value (optional)
  
          `colorBalance` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After);
}

interface ColorBalanceGidBuilderImpl(T)
{
}
