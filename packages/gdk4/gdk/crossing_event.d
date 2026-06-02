/// Module for [CrossingEvent] class
module gdk.crossing_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event caused by a pointing device moving between surfaces.
*/
class CrossingEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts the notify detail from a crossing event.
      Returns: the notify detail of event
  */
  gdk.types.NotifyType getDetail() nothrow
  {
    GdkNotifyType _cretval;
    _cretval = gdk_crossing_event_get_detail(cast(GdkEvent*)this._cPtr);
    gdk.types.NotifyType _retval = cast(gdk.types.NotifyType)_cretval;
    return _retval;
  }

  /**
      Checks if the event surface is the focus surface.
      Returns: true if the surface is the focus surface
  */
  bool getFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_crossing_event_get_focus(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extracts the crossing mode from a crossing event.
      Returns: the mode of event
  */
  gdk.types.CrossingMode getMode() nothrow
  {
    GdkCrossingMode _cretval;
    _cretval = gdk_crossing_event_get_mode(cast(GdkEvent*)this._cPtr);
    gdk.types.CrossingMode _retval = cast(gdk.types.CrossingMode)_cretval;
    return _retval;
  }
}
