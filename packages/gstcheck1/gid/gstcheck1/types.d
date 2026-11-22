/// D types for gstcheck1 library
module gid.gstcheck1.types;

import gid.core.utils;
import gid.glib2.types;
import gid.gst1.buffer;
import gid.gst1.event;
import gid.gstcheck1.c.functions;
import gid.gstcheck1.c.types;
import gid.gstcheck1.harness;


// Structs

/** */
alias CheckLogFilter = GstCheckLogFilter*;

/** */
alias HarnessThread = GstHarnessThread*;

/** */
alias StreamConsistency = GstStreamConsistency*;

// Callbacks

/**
    A function that is called for messages matching the filter added by
    gst_check_add_log_filter.

    Params:
      logDomain = the log domain of the message
      logLevel = the log level of the message
      message = the message that has occurred
    Returns: true if message should be discarded by GstCheck.
*/
alias CheckLogFilterFunc = bool delegate(string logDomain, gid.glib2.types.LogLevelFlags logLevel, string message);

/** */
alias HarnessPrepareBufferFunc = gid.gst1.buffer.Buffer delegate(gid.gstcheck1.harness.Harness h);

/** */
alias HarnessPrepareEventFunc = gid.gst1.event.Event delegate(gid.gstcheck1.harness.Harness h);
