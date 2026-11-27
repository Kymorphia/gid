/// Module for [CrossingEvent] class
module gid.gdk4.crossing_event;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.types;

/**
    An event caused by a pointing device moving between surfaces.
*/
@gidGir("CrossingEvent")
class CrossingEvent : gid.gdk4.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_crossing_event_get_type != &gidSymbolNotFound ? gdk_crossing_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts the notify detail from a crossing event.
      Returns: the notify detail of event
  */
  gid.gdk4.types.NotifyType getDetail() nothrow
  {
    GdkNotifyType _cretval;
    _cretval = gdk_crossing_event_get_detail(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.NotifyType _retval = cast(gid.gdk4.types.NotifyType)_cretval;
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
  gid.gdk4.types.CrossingMode getMode() nothrow
  {
    GdkCrossingMode _cretval;
    _cretval = gdk_crossing_event_get_mode(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.CrossingMode _retval = cast(gid.gdk4.types.CrossingMode)_cretval;
    return _retval;
  }
}
