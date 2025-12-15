/// C types for gstnet1 library
module gstnet.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gio.c.types;
public import gst.c.types;

/**
    #GstNetAddressMeta can be used to store a network address (a #GSocketAddress)
    in a #GstBuffer so that it network elements can track the to and from address
    of the buffer.
*/
struct GstNetAddressMeta
{
  /**
      the parent type
  */
  GstMeta meta;

  /**
      a #GSocketAddress stored as metadata
  */
  GSocketAddress* addr;
}

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
struct GstNetClientClock
{
  /** */
  GstSystemClock clock;

  /** */
  GstNetClientClockPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstNetClientClockClass
{
  /** */
  GstSystemClockClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstNetClientClockPrivate;

/**
    #GstNetControlMessageMeta can be used to store control messages (ancillary
    data) which was received with or is to be sent alongside the buffer data.
    When used with socket sinks and sources which understand this meta it allows
    sending and receiving ancillary data such as unix credentials (See
    #GUnixCredentialsMessage) and Unix file descriptions (See #GUnixFDMessage).
*/
struct GstNetControlMessageMeta
{
  /**
      the parent type
  */
  GstMeta meta;

  /**
      a #GSocketControlMessage stored as metadata
  */
  GSocketControlMessage* message;
}

/**
    Various functions for receiving, sending an serializing #GstNetTimePacket
    structures.
*/
struct GstNetTimePacket
{
  /**
      the local time when this packet was sent
  */
  GstClockTime localTime;

  /**
      the remote time observation
  */
  GstClockTime remoteTime;
}

/**
    This object exposes the time of a #GstClock on the network.
    
    A #GstNetTimeProvider is created with [gstnet.net_time_provider.NetTimeProvider.new_] which
    takes a #GstClock, an address and a port number as arguments.
    
    After creating the object, a client clock such as #GstNetClientClock can
    query the exposed clock over the network for its values.
    
    The #GstNetTimeProvider typically wraps the clock used by a #GstPipeline.
*/
struct GstNetTimeProvider
{
  /** */
  GstObject parent;

  /** */
  GstNetTimeProviderPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstNetTimeProviderClass
{
  /** */
  GstObjectClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstNetTimeProviderPrivate;

/** */
struct GstNtpClock
{
  /** */
  GstSystemClock clock;

  /** */
  GstNetClientClockPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstNtpClockClass
{
  /** */
  GstSystemClockClass parentClass;

  /** */
  void*[4] GstReserved;
}

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
struct GstPtpClock
{
  /** */
  GstSystemClock clock;

  /** */
  GstPtpClockPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Opaque #GstPtpClockClass structure.
*/
struct GstPtpClockClass
{
  /**
      parented to #GstSystemClockClass
  */
  GstSystemClockClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstPtpClockPrivate;

alias extern(C) gboolean function(ubyte domain, const(GstStructure)* stats, void* userData) GstPtpStatisticsCallback;

