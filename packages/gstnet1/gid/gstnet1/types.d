/// D types for gstnet1 library
module gid.gstnet1.types;

import gid.core.gid;
import gid.gst1.structure;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;


// Callbacks

/**
    The statistics can be the following structures:
    
    GST_PTP_STATISTICS_NEW_DOMAIN_FOUND:
    "domain"                G_TYPE_UINT          The domain identifier of the domain
    "clock"                 GST_TYPE_CLOCK       The internal clock that is slaved to the
                                                 PTP domain
    
    GST_PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED:
    "domain"                G_TYPE_UINT          The domain identifier of the domain
    "master-clock-id"       G_TYPE_UINT64        PTP clock identifier of the selected master
                                                 clock
    "master-clock-port"     G_TYPE_UINT          PTP port number of the selected master clock
    "grandmaster-clock-id"  G_TYPE_UINT64        PTP clock identifier of the grandmaster clock
    
    GST_PTP_STATISTICS_PATH_DELAY_MEASURED:
    "domain"                G_TYPE_UINT          The domain identifier of the domain
    "mean-path-delay-avg"   GST_TYPE_CLOCK_TIME  Average mean path delay
    "mean-path-delay"       GST_TYPE_CLOCK_TIME  Latest mean path delay
    "delay-request-delay"   GST_TYPE_CLOCK_TIME  Delay of DELAY_REQ / DELAY_RESP messages
    
    GST_PTP_STATISTICS_TIME_UPDATED:
    "domain"                G_TYPE_UINT          The domain identifier of the domain
    "mean-path-delay-avg"   GST_TYPE_CLOCK_TIME  Average mean path delay
    "local-time"            GST_TYPE_CLOCK_TIME  Local time that corresponds to ptp-time
    "ptp-time"              GST_TYPE_CLOCK_TIME  Newly measured PTP time at local-time
    "estimated-ptp-time"    GST_TYPE_CLOCK_TIME  Estimated PTP time based on previous measurements
    "discontinuity"         G_TYPE_INT64         Difference between estimated and measured PTP time
    "synced"                G_TYPE_BOOLEAN       Currently synced to the remote clock
    "r-squared"             G_TYPE_DOUBLE        R² of clock estimation regression
    "internal-time"         GST_TYPE_CLOCK_TIME  Internal time clock parameter
    "external-time"         GST_TYPE_CLOCK_TIME  External time clock parameter
    "rate-num"              G_TYPE_UINT64        Internal/external rate numerator
    "rate-den"              G_TYPE_UINT64        Internal/external rate denominator
    "rate"                  G_TYPE_DOUBLE        Internal/external rate
    
    If false is returned, the callback is removed and never called again.

    Params:
      domain = PTP domain identifier
      stats = New statistics
    Returns: 
*/
alias PtpStatisticsCallback = bool delegate(ubyte domain, gid.gst1.structure.Structure stats);

/**
    The size of the packets sent between network clocks.
*/
enum NET_TIME_PACKET_SIZE = 16;

/**
    PTP clock identification that can be passed to [gid.gstnet1.global.ptpInit] to
    automatically select one based on the MAC address of interfaces
*/
enum PTP_CLOCK_ID_NONE = 18446744073709551615;

/** */
enum PTP_STATISTICS_BEST_MASTER_CLOCK_SELECTED = "GstPtpStatisticsBestMasterClockSelected";

/** */
enum PTP_STATISTICS_NEW_DOMAIN_FOUND = "GstPtpStatisticsNewDomainFound";

/** */
enum PTP_STATISTICS_PATH_DELAY_MEASURED = "GstPtpStatisticsPathDelayMeasured";

/** */
enum PTP_STATISTICS_TIME_UPDATED = "GstPtpStatisticsTimeUpdated";
