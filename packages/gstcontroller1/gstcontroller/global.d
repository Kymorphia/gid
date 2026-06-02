/// Global functions for gstcontroller1 library
module gstcontroller.global;

import gid.gid;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.timed_value_control_source;
import gstcontroller.types;


/**
    Reset the controlled value cache.

    Params:
      self = the #GstTimedValueControlSource
*/
void timedValueControlInvalidateCache(gstcontroller.timed_value_control_source.TimedValueControlSource self) nothrow
{
  gst_timed_value_control_invalidate_cache(self ? cast(GstTimedValueControlSource*)self._cPtr(No.Dup) : null);
}
