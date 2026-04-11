/// Module for [PtpClock] class
module gstnet.ptp_clock;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.clock;
import gst.system_clock;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    GstPtpClock implements a PTP (IEEE1588:2008) ordinary clock in slave-only
    mode, that allows a GStreamer pipeline to synchronize to a PTP network
    clock in some specific domain.
    
    The PTP subsystem can be initialized with [gstnet.global.ptpInit], which then starts
    a helper process to do the actual communication via the PTP ports. This is
    required as PTP listens on ports < 1024 and thus requires special
    privileges. Once this helper process is started, the main process will
    synchronize to all PTP domains that are detected on the selected
    interfaces.
    
    [gstnet.ptp_clock.PtpClock.new_] then allows to create a GstClock that provides the PTP
    time from a master clock inside a specific PTP domain. This clock will only
    return valid timestamps once the timestamps in the PTP domain are known. To
    check this, you can use [gst.clock.Clock.waitForSync], the GstClock::synced
    signal and [gst.clock.Clock.isSynced].
    
    To gather statistics about the PTP clock synchronization,
    [gstnet.global.ptpStatisticsCallbackAdd] can be used. This gives the application
    the possibility to collect all kinds of statistics from the clock
    synchronization.
*/
class PtpClock : gst.system_clock.SystemClock
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
    return cast(void function())gst_ptp_clock_get_type != &gidSymbolNotFound ? gst_ptp_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PtpClock self()
  {
    return this;
  }

  /**
      Get builder for [gstnet.ptp_clock.PtpClock]
      Returns: New builder object
  */
  static PtpClockGidBuilder builder()
  {
    return new PtpClockGidBuilder;
  }

  /** */
  @property uint domain()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("domain");
  }

  /** */
  @property ulong grandmasterClockId()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("grandmaster-clock-id");
  }

  /** */
  @property gst.clock.Clock internalClock()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.clock.Clock)("internal-clock");
  }

  /** */
  @property ulong masterClockId()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("master-clock-id");
  }

  /**
      Creates a new PTP clock instance that exports the PTP time of the master
      clock in domain. This clock can be slaved to other clocks as needed.
      
      If [gstnet.global.ptpInit] was not called before, this will call [gstnet.global.ptpInit] with
      default parameters.
      
      This clock only returns valid timestamps after it received the first
      times from the PTP master clock on the network. Once this happens the
      GstPtpClock::internal-clock property will become non-NULL. You can
      check this with [gst.clock.Clock.waitForSync], the GstClock::synced signal and
      [gst.clock.Clock.isSynced].
  
      Params:
        name = Name of the clock
        domain = PTP domain
      Returns: A new #GstClock
  */
  this(string name, uint domain)
  {
    GstClock* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_ptp_clock_new(_name, domain);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstnet.ptp_clock.PtpClock]
class PtpClockGidBuilderImpl(T) : gst.system_clock.SystemClockGidBuilderImpl!T
{

  /** */
  T domain(uint propval)
  {
    return setProperty("domain", propval);
  }
}

/// Fluent builder for [gstnet.ptp_clock.PtpClock]
final class PtpClockGidBuilder : PtpClockGidBuilderImpl!PtpClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PtpClock build()
  {
    return new PtpClock(cast(void*)createGObject(PtpClock._getGType), Yes.Take);
  }
}
