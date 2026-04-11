/// Module for [NetClientClock] class
module gstnet.net_client_clock;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.bus;
import gst.clock;
import gst.system_clock;
import gst.types;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetClientClock implements a custom #GstClock that synchronizes its time
    to a remote time provider such as #GstNetTimeProvider. #GstNtpClock
    implements a #GstClock that synchronizes its time to a remote NTPv4 server.
    
    A new clock is created with [gstnet.net_client_clock.NetClientClock.new_] or
    [gstnet.ntp_clock.NtpClock.new_], which takes the address and port of the remote time
    provider along with a name and an initial time.
    
    This clock will poll the time provider and will update its calibration
    parameters based on the local and remote observations.
    
    The "round-trip" property limits the maximum round trip packets can take.
    
    Various parameters of the clock can be configured with the parent #GstClock
    "timeout", "window-size" and "window-threshold" object properties.
    
    A #GstNetClientClock and #GstNtpClock is typically set on a #GstPipeline with
    [gst.pipeline.Pipeline.useClock].
    
    If you set a #GstBus on the clock via the "bus" object property, it will
    send @GST_MESSAGE_ELEMENT messages with an attached #GstStructure containing
    statistics about clock accuracy and network traffic.
*/
class NetClientClock : gst.system_clock.SystemClock
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
    return cast(void function())gst_net_client_clock_get_type != &gidSymbolNotFound ? gst_net_client_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetClientClock self()
  {
    return this;
  }

  /**
      Get builder for [gstnet.net_client_clock.NetClientClock]
      Returns: New builder object
  */
  static NetClientClockGidBuilder builder()
  {
    return new NetClientClockGidBuilder;
  }

  /** */
  @property string address()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("address");
  }

  /** */
  @property void address(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("address", propval);
  }

  /** */
  @property ulong baseTime()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("base-time");
  }

  /** */
  @property gst.bus.Bus bus()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.bus.Bus)("bus");
  }

  /** */
  @property void bus(gst.bus.Bus propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.bus.Bus)("bus", propval);
  }

  /** */
  @property gst.clock.Clock internalClock()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.clock.Clock)("internal-clock");
  }

  /** */
  @property ulong minimumUpdateInterval()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("minimum-update-interval");
  }

  /** */
  @property void minimumUpdateInterval(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("minimum-update-interval", propval);
  }

  /** */
  @property int port()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("port");
  }

  /** */
  @property void port(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("port", propval);
  }

  /** */
  @property int qosDscp()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("qos-dscp");
  }

  /** */
  @property void qosDscp(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("qos-dscp", propval);
  }

  /** */
  @property ulong roundTripLimit()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("round-trip-limit");
  }

  /** */
  @property void roundTripLimit(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("round-trip-limit", propval);
  }

  /**
      Create a new #GstNetClientClock that will report the time
      provided by the #GstNetTimeProvider on remote_address and
      remote_port.
  
      Params:
        name = a name for the clock
        remoteAddress = the address or hostname of the remote clock provider
        remotePort = the port of the remote clock provider
        baseTime = initial time of the clock
      Returns: a new #GstClock that receives a time from the remote
        clock.
  */
  this(string name, string remoteAddress, int remotePort, gst.types.ClockTime baseTime)
  {
    GstClock* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _remoteAddress = remoteAddress.toCString(No.Alloc);
    _cretval = gst_net_client_clock_new(_name, _remoteAddress, remotePort, baseTime);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstnet.net_client_clock.NetClientClock]
class NetClientClockGidBuilderImpl(T) : gst.system_clock.SystemClockGidBuilderImpl!T
{

  /** */
  T address(string propval)
  {
    return setProperty("address", propval);
  }

  /** */
  T baseTime(ulong propval)
  {
    return setProperty("base-time", propval);
  }

  /** */
  T bus(gst.bus.Bus propval)
  {
    return setProperty("bus", propval);
  }

  /** */
  T minimumUpdateInterval(ulong propval)
  {
    return setProperty("minimum-update-interval", propval);
  }

  /** */
  T port(int propval)
  {
    return setProperty("port", propval);
  }

  /** */
  T qosDscp(int propval)
  {
    return setProperty("qos-dscp", propval);
  }

  /** */
  T roundTripLimit(ulong propval)
  {
    return setProperty("round-trip-limit", propval);
  }
}

/// Fluent builder for [gstnet.net_client_clock.NetClientClock]
final class NetClientClockGidBuilder : NetClientClockGidBuilderImpl!NetClientClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NetClientClock build()
  {
    return new NetClientClock(cast(void*)createGObject(NetClientClock._getGType), Yes.Take);
  }
}
