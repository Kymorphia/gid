/// Module for [NtpClock] class
module gid.gstnet1.ntp_clock;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.types;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.net_client_clock;
import gid.gstnet1.types;

/** */
class NtpClock : gid.gstnet1.net_client_clock.NetClientClock
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
    return cast(void function())gst_ntp_clock_get_type != &gidSymbolNotFound ? gst_ntp_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstNtpClock";
  }

  /** Returns `this`, for use in `with` statements. */
  override NtpClock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstnet1.ntp_clock.NtpClock]
      Returns: New builder object
  */
  static NtpClockGidBuilder builder() nothrow
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
      _cretval = gst_ntp_clock_new(_name, _remoteAddress, remotePort, baseTime);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstnet1.ntp_clock.NtpClock]
class NtpClockGidBuilderImpl(T) : gid.gstnet1.net_client_clock.NetClientClockGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstnet1.ntp_clock.NtpClock]
final class NtpClockGidBuilder : NtpClockGidBuilderImpl!NtpClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NtpClock build() nothrow
  {
    return new NtpClock(cast(void*)createGObject(NtpClock._getGType), Yes.Take);
  }
}
