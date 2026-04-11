/// Module for [NtpClock] class
module gstnet.ntp_clock;

import gid.gid;
import gobject.gid_builder;
import gst.types;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.net_client_clock;
import gstnet.types;

/** */
class NtpClock : gstnet.net_client_clock.NetClientClock
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
    return cast(void function())gst_ntp_clock_get_type != &gidSymbolNotFound ? gst_ntp_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NtpClock self()
  {
    return this;
  }

  /**
      Get builder for [gstnet.ntp_clock.NtpClock]
      Returns: New builder object
  */
  static NtpClockGidBuilder builder()
  {
    return new NtpClockGidBuilder;
  }

  /**
      Create a new #GstNtpClock that will report the time provided by
      the NTPv4 server on remote_address and remote_port.
  
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
    _cretval = gst_ntp_clock_new(_name, _remoteAddress, remotePort, baseTime);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstnet.ntp_clock.NtpClock]
class NtpClockGidBuilderImpl(T) : gstnet.net_client_clock.NetClientClockGidBuilderImpl!T
{
}

/// Fluent builder for [gstnet.ntp_clock.NtpClock]
final class NtpClockGidBuilder : NtpClockGidBuilderImpl!NtpClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NtpClock build()
  {
    return new NtpClock(cast(void*)createGObject(NtpClock._getGType), Yes.Take);
  }
}
