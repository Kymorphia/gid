/// Global functions for gstcontroller1 library
module gid.gstcontroller1.global;

import gid.core.gid;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.timed_value_control_source;
import gid.gstcontroller1.types;


/**
    Reset the controlled value cache.

    Params:
      self = the #GstTimedValueControlSource
*/
void timedValueControlInvalidateCache(gid.gstcontroller1.timed_value_control_source.TimedValueControlSource self) nothrow
{
  gst_timed_value_control_invalidate_cache(self ? cast(GstTimedValueControlSource*)self._cPtr(No.Dup) : null);
}
