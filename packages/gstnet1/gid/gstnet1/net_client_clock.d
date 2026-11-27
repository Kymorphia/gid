/// Module for [NetClientClock] class
module gid.gstnet1.net_client_clock;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.bus;
import gid.gst1.clock;
import gid.gst1.system_clock;
import gid.gst1.types;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    #GstNetClientClock implements a custom #GstClock that synchronizes its time
    to a remote time provider such as #GstNetTimeProvider. #GstNtpClock
    implements a #GstClock that synchronizes its time to a remote NTPv4 server.
    
    A new clock is created with [gid.gstnet1.net_client_clock.NetClientClock.new_] or
    [gid.gstnet1.ntp_clock.NtpClock.new_], which takes the address and port of the remote time
    provider along with a name and an initial time.
    
    This clock will poll the time provider and will update its calibration
    parameters based on the local and remote observations.
    
    The "round-trip" property limits the maximum round trip packets can take.
    
    Various parameters of the clock can be configured with the parent #GstClock
    "timeout", "window-size" and "window-threshold" object properties.
    
    A #GstNetClientClock and #GstNtpClock is typically set on a #GstPipeline with
    [gid.gst1.pipeline.Pipeline.useClock].
    
    If you set a #GstBus on the clock via the "bus" object property, it will
    send @GST_MESSAGE_ELEMENT messages with an attached #GstStructure containing
    statistics about clock accuracy and network traffic.
*/
@gidGir("NetClientClock", "NetClientClockClass")
class NetClientClock : gid.gst1.system_clock.SystemClock
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_net_client_clock_get_type != &gidSymbolNotFound ? gst_net_client_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstNetClientClock";
  }

  /** Returns `this`, for use in `with` statements. */
  override NetClientClock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstnet1.net_client_clock.NetClientClock]
      Returns: New builder object
  */
  static NetClientClockGidBuilder builder() nothrow
  {
    return new NetClientClockGidBuilder;
  }

  /** */
  @property string address() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("address");
  }

  /** */
  @property void address(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("address", propval);
  }

  /** */
  @property ulong baseTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("base-time");
  }

  /** */
  @property gid.gst1.bus.Bus bus() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.bus.Bus)("bus");
  }

  /** */
  @property void bus(gid.gst1.bus.Bus propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.bus.Bus)("bus", propval);
  }

  /** */
  @property gid.gst1.clock.Clock internalClock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.clock.Clock)("internal-clock");
  }

  /** */
  @property ulong minimumUpdateInterval() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("minimum-update-interval");
  }

  /** */
  @property void minimumUpdateInterval(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("minimum-update-interval", propval);
  }

  /** */
  @property int port() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("port");
  }

  /** */
  @property void port(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("port", propval);
  }

  /** */
  @property int qosDscp() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("qos-dscp");
  }

  /** */
  @property void qosDscp(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("qos-dscp", propval);
  }

  /** */
  @property ulong roundTripLimit() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("round-trip-limit");
  }

  /** */
  @property void roundTripLimit(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("round-trip-limit", propval);
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
  this(string name, string remoteAddress, int remotePort, gid.gst1.types.ClockTime baseTime) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstClock* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _remoteAddress = remoteAddress.toCString!(No.Malloc, No.Nullable);
      _cretval = gst_net_client_clock_new(_name, _remoteAddress, remotePort, baseTime);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Clears any cached #GstNetClientClock clocks.
      All references should be released beforehand.
      Mainly used for testing.
  */
  static void deinit() nothrow
  {
    gst_net_client_clock_deinit();
  }
}

/// Fluent builder implementation template for [gid.gstnet1.net_client_clock.NetClientClock]
class NetClientClockGidBuilderImpl(T) : gid.gst1.system_clock.SystemClockGidBuilderImpl!T
{

  /** */
  T address(string propval) nothrow
  {
    return setProperty("address", propval);
  }

  /** */
  T baseTime(ulong propval) nothrow
  {
    return setProperty("base-time", propval);
  }

  /** */
  T bus(gid.gst1.bus.Bus propval) nothrow
  {
    return setProperty("bus", propval);
  }

  /** */
  T minimumUpdateInterval(ulong propval) nothrow
  {
    return setProperty("minimum-update-interval", propval);
  }

  /** */
  T port(int propval) nothrow
  {
    return setProperty("port", propval);
  }

  /** */
  T qosDscp(int propval) nothrow
  {
    return setProperty("qos-dscp", propval);
  }

  /** */
  T roundTripLimit(ulong propval) nothrow
  {
    return setProperty("round-trip-limit", propval);
  }
}

/// Fluent builder for [gid.gstnet1.net_client_clock.NetClientClock]
final class NetClientClockGidBuilder : NetClientClockGidBuilderImpl!NetClientClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NetClientClock build() nothrow
  {
    return new NetClientClock(cast(void*)createGObject(NetClientClock._getGType), Yes.Take);
  }
}
