/// Module for [RTSPTimeRange] class
module gid.gstrtsp1.rtsptime_range;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.types;

/**
    A time range.
*/
class RTSPTimeRange : StructWrap!(GstRTSPTimeRange)
{
  /**
      Create a `rtsptime_range.RTSPTimeRange` wrap type.
      Params:
        unit = the time units used
        min = the minimum interval
        max = the maximum interval
        min2 = extra fields in the minimum interval (Since: 1.2)
        max2 = extra fields in the maximum interval (Since: 1.2)
  */
  this(gid.gstrtsp1.types.RTSPRangeUnit unit = gid.gstrtsp1.types.RTSPRangeUnit.init, gid.gstrtsp1.types.RTSPTime min = gid.gstrtsp1.types.RTSPTime.init, gid.gstrtsp1.types.RTSPTime max = gid.gstrtsp1.types.RTSPTime.init, gid.gstrtsp1.types.RTSPTime2 min2 = gid.gstrtsp1.types.RTSPTime2.init, gid.gstrtsp1.types.RTSPTime2 max2 = gid.gstrtsp1.types.RTSPTime2.init) nothrow
  {
    this.unit = unit;
    this.min = min;
    this.max = max;
    this.min2 = min2;
    this.max2 = max2;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `unit` field.
      Returns: the time units used
  */
  @property gid.gstrtsp1.types.RTSPRangeUnit unit() nothrow
  {
    return cast(gid.gstrtsp1.types.RTSPRangeUnit)(cast(GstRTSPTimeRange*)this._cPtr).unit;
  }

  /**
      Set `unit` field.
      Params:
        propval = the time units used
  */
  @property void unit(gid.gstrtsp1.types.RTSPRangeUnit propval) nothrow
  {
    (cast(GstRTSPTimeRange*)this._cPtr).unit = cast(GstRTSPRangeUnit)propval;
  }

  /**
      Get `min` field.
      Returns: the minimum interval
  */
  @property gid.gstrtsp1.types.RTSPTime min() nothrow
  {
    return cToD!(gid.gstrtsp1.types.RTSPTime)(cast(void*)&(cast(GstRTSPTimeRange*)this._cPtr).min);
  }

  /**
      Set `min` field.
      Params:
        propval = the minimum interval
  */
  @property void min(gid.gstrtsp1.types.RTSPTime propval) nothrow
  {
    (cast(GstRTSPTimeRange*)this._cPtr).min = cast(GstRTSPTime)propval;
  }

  /**
      Get `max` field.
      Returns: the maximum interval
  */
  @property gid.gstrtsp1.types.RTSPTime max() nothrow
  {
    return cToD!(gid.gstrtsp1.types.RTSPTime)(cast(void*)&(cast(GstRTSPTimeRange*)this._cPtr).max);
  }

  /**
      Set `max` field.
      Params:
        propval = the maximum interval
  */
  @property void max(gid.gstrtsp1.types.RTSPTime propval) nothrow
  {
    (cast(GstRTSPTimeRange*)this._cPtr).max = cast(GstRTSPTime)propval;
  }

  /**
      Get `min2` field.
      Returns: extra fields in the minimum interval (Since: 1.2)
  */
  @property gid.gstrtsp1.types.RTSPTime2 min2() nothrow
  {
    return cToD!(gid.gstrtsp1.types.RTSPTime2)(cast(void*)&(cast(GstRTSPTimeRange*)this._cPtr).min2);
  }

  /**
      Set `min2` field.
      Params:
        propval = extra fields in the minimum interval (Since: 1.2)
  */
  @property void min2(gid.gstrtsp1.types.RTSPTime2 propval) nothrow
  {
    (cast(GstRTSPTimeRange*)this._cPtr).min2 = cast(GstRTSPTime2)propval;
  }

  /**
      Get `max2` field.
      Returns: extra fields in the maximum interval (Since: 1.2)
  */
  @property gid.gstrtsp1.types.RTSPTime2 max2() nothrow
  {
    return cToD!(gid.gstrtsp1.types.RTSPTime2)(cast(void*)&(cast(GstRTSPTimeRange*)this._cPtr).max2);
  }

  /**
      Set `max2` field.
      Params:
        propval = extra fields in the maximum interval (Since: 1.2)
  */
  @property void max2(gid.gstrtsp1.types.RTSPTime2 propval) nothrow
  {
    (cast(GstRTSPTimeRange*)this._cPtr).max2 = cast(GstRTSPTime2)propval;
  }
}
