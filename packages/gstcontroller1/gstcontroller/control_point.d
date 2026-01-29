/// Module for [ControlPoint] class
module gstcontroller.control_point;

import gid.gid;
import gobject.boxed;
import gst.types;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    An internal structure for value+time and various temporary
    values used for interpolation. This "inherits" from
    GstTimedValue.
*/
class ControlPoint : gobject.boxed.Boxed
{

  /**
      Create a `control_point.ControlPoint` boxed type.
      Params:
        timestamp = timestamp of the value change
        value = the new value
  */
  this(gst.types.ClockTime timestamp = gst.types.ClockTime.init, double value = 0.0)
  {
    super(gMalloc(GstControlPoint.sizeof), Yes.Take);
    this.timestamp = timestamp;
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_control_point_get_type != &gidSymbolNotFound ? gst_control_point_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ControlPoint self()
  {
    return this;
  }

  /**
      Get `timestamp` field.
      Returns: timestamp of the value change
  */
  @property gst.types.ClockTime timestamp()
  {
    return (cast(GstControlPoint*)this._cPtr).timestamp;
  }

  /**
      Set `timestamp` field.
      Params:
        propval = timestamp of the value change
  */
  @property void timestamp(gst.types.ClockTime propval)
  {
    (cast(GstControlPoint*)this._cPtr).timestamp = propval;
  }

  /**
      Get `value` field.
      Returns: the new value
  */
  @property double value()
  {
    return (cast(GstControlPoint*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the new value
  */
  @property void value(double propval)
  {
    (cast(GstControlPoint*)this._cPtr).value = propval;
  }

  /**
      Copies a #GstControlPoint
      Returns: A copy of cp
  */
  gstcontroller.control_point.ControlPoint copy()
  {
    GstControlPoint* _cretval;
    _cretval = gst_control_point_copy(cast(GstControlPoint*)this._cPtr);
    auto _retval = _cretval ? new gstcontroller.control_point.ControlPoint(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
