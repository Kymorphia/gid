/// Module for [ControlPoint] class
module gid.gstcontroller1.control_point;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.types;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.types;

/**
    An internal structure for value+time and various temporary
    values used for interpolation. This "inherits" from
    GstTimedValue.
*/
class ControlPoint : gid.gobject2.boxed.BoxedWrap!(gst_control_point_get_type)
{
  /**
      Create a `control_point.ControlPoint` boxed type.
      Params:
        timestamp = timestamp of the value change
        value = the new value
  */
  this(gid.gst1.types.ClockTime timestamp = gid.gst1.types.ClockTime.init, double value = 0.0) nothrow
  {
    super(boxedNew!GstControlPoint(_getGType), Yes.Take);
    this.timestamp = timestamp;
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlPoint self() nothrow
  {
    return this;
  }

  /**
      Get `timestamp` field.
      Returns: timestamp of the value change
  */
  @property gid.gst1.types.ClockTime timestamp() nothrow
  {
    return (cast(GstControlPoint*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = timestamp of the value change
  */
  @property void timestamp(gid.gst1.types.ClockTime propval) nothrow
  {
    (cast(GstControlPoint*)this._cPtr).timestamp = propval;
  }

  /**
      Get `value` field.
      Returns: the new value
  */
  @property double value() nothrow
  {
    return (cast(GstControlPoint*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the new value
  */
  @property void value(double propval) nothrow
  {
    (cast(GstControlPoint*)this._cPtr).value = propval;
  }

  /**
      Copies a #GstControlPoint
      Returns: A copy of cp
  */
  gid.gstcontroller1.control_point.ControlPoint copy() nothrow
  {
    GstControlPoint* _cretval;
    _cretval = gst_control_point_copy(cast(GstControlPoint*)this._cPtr);
    auto _retval = _cretval ? new gid.gstcontroller1.control_point.ControlPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
