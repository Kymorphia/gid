/// Module for [PtpClock] class
module gid.gstnet1.ptp_clock;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.clock;
import gid.gst1.system_clock;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    GstPtpClock implements a PTP (IEEE1588:2008) ordinary clock in slave-only
    mode, that allows a GStreamer pipeline to synchronize to a PTP network
    clock in some specific domain.
    
    The PTP subsystem can be initialized with [gid.gstnet1.global.ptpInit], which then starts
    a helper process to do the actual communication via the PTP ports. This is
    required as PTP listens on ports < 1024 and thus requires special
    privileges. Once this helper process is started, the main process will
    synchronize to all PTP domains that are detected on the selected
    interfaces.
    
    [gid.gstnet1.ptp_clock.PtpClock.new_] then allows to create a GstClock that provides the PTP
    time from a master clock inside a specific PTP domain. This clock will only
    return valid timestamps once the timestamps in the PTP domain are known. To
    check this, you can use [gid.gst1.clock.Clock.waitForSync], the GstClock::synced
    signal and [gid.gst1.clock.Clock.isSynced].
    
    To gather statistics about the PTP clock synchronization,
    [gid.gstnet1.global.ptpStatisticsCallbackAdd] can be used. This gives the application
    the possibility to collect all kinds of statistics from the clock
    synchronization.
*/
class PtpClock : gid.gst1.system_clock.SystemClock
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
    return cast(void function())gst_ptp_clock_get_type != &gidSymbolNotFound ? gst_ptp_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstPtpClock";
  }

  /** Returns `this`, for use in `with` statements. */
  override PtpClock self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstnet1.ptp_clock.PtpClock]
      Returns: New builder object
  */
  static PtpClockGidBuilder builder() nothrow
  {
    return new PtpClockGidBuilder;
  }

  /** */
  @property uint domain() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("domain");
  }

  /** */
  @property ulong grandmasterClockId() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("grandmaster-clock-id");
  }

  /** */
  @property gid.gst1.clock.Clock internalClock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.clock.Clock)("internal-clock");
  }

  /** */
  @property ulong masterClockId() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("master-clock-id");
  }

  /**
      Creates a new PTP clock instance that exports the PTP time of the master
      clock in domain. This clock can be slaved to other clocks as needed.
      
      If [gid.gstnet1.global.ptpInit] was not called before, this will call [gid.gstnet1.global.ptpInit] with
      default parameters.
      
      This clock only returns valid timestamps after it received the first
      times from the PTP master clock on the network. Once this happens the
      GstPtpClock::internal-clock property will become non-NULL. You can
      check this with [gid.gst1.clock.Clock.waitForSync], the GstClock::synced signal and
      [gid.gst1.clock.Clock.isSynced].
  
      Params:
        name = Name of the clock
        domain = PTP domain
      Returns: A new #GstClock
  */
  this(string name, uint domain) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstClock* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gst_ptp_clock_new(_name, domain);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstnet1.ptp_clock.PtpClock]
class PtpClockGidBuilderImpl(T) : gid.gst1.system_clock.SystemClockGidBuilderImpl!T
{

  /** */
  T domain(uint propval) nothrow
  {
    return setProperty("domain", propval);
  }
}

/// Fluent builder for [gid.gstnet1.ptp_clock.PtpClock]
final class PtpClockGidBuilder : PtpClockGidBuilderImpl!PtpClockGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PtpClock build() nothrow
  {
    return new PtpClock(cast(void*)createGObject(PtpClock._getGType), Yes.Take);
  }
}
