/// Module for [RTSPTimeRange] class
module gstrtsp.rtsptime_range;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/**
    A time range.
*/
class RTSPTimeRange
{
  GstRTSPTimeRange cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtsp.rtsptime_range.RTSPTimeRange");

    cInstance = *cast(GstRTSPTimeRange*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `unit` field.
      Returns: the time units used
  */
  @property gstrtsp.types.RTSPRangeUnit unit()
  {
    return cast(gstrtsp.types.RTSPRangeUnit)(cast(GstRTSPTimeRange*)cPtr).unit;
  }

  /**
      Set `unit` field.
      Params:
        propval = the time units used
  */
  @property void unit(gstrtsp.types.RTSPRangeUnit propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).unit = cast(GstRTSPRangeUnit)propval;
  }

  /**
      Get `min` field.
      Returns: the minimum interval
  */
  @property gstrtsp.types.RTSPTime min()
  {
    return cToD!(gstrtsp.types.RTSPTime)(cast(void*)&(cast(GstRTSPTimeRange*)cPtr).min);
  }

  /**
      Set `min` field.
      Params:
        propval = the minimum interval
  */
  @property void min(gstrtsp.types.RTSPTime propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).min = propval;
  }

  /**
      Get `max` field.
      Returns: the maximum interval
  */
  @property gstrtsp.types.RTSPTime max()
  {
    return cToD!(gstrtsp.types.RTSPTime)(cast(void*)&(cast(GstRTSPTimeRange*)cPtr).max);
  }

  /**
      Set `max` field.
      Params:
        propval = the maximum interval
  */
  @property void max(gstrtsp.types.RTSPTime propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).max = propval;
  }

  /**
      Get `min2` field.
      Returns: extra fields in the minimum interval (Since: 1.2)
  */
  @property gstrtsp.types.RTSPTime2 min2()
  {
    return cToD!(gstrtsp.types.RTSPTime2)(cast(void*)&(cast(GstRTSPTimeRange*)cPtr).min2);
  }

  /**
      Set `min2` field.
      Params:
        propval = extra fields in the minimum interval (Since: 1.2)
  */
  @property void min2(gstrtsp.types.RTSPTime2 propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).min2 = propval;
  }

  /**
      Get `max2` field.
      Returns: extra fields in the maximum interval (Since: 1.2)
  */
  @property gstrtsp.types.RTSPTime2 max2()
  {
    return cToD!(gstrtsp.types.RTSPTime2)(cast(void*)&(cast(GstRTSPTimeRange*)cPtr).max2);
  }

  /**
      Set `max2` field.
      Params:
        propval = extra fields in the maximum interval (Since: 1.2)
  */
  @property void max2(gstrtsp.types.RTSPTime2 propval)
  {
    (cast(GstRTSPTimeRange*)cPtr).max2 = propval;
  }
}
