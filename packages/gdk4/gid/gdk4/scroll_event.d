/// Module for [ScrollEvent] class
module gid.gdk4.scroll_event;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.types;

/**
    An event related to a scrolling motion.
*/
class ScrollEvent : gid.gdk4.event.Event
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
    return cast(void function())gdk_scroll_event_get_type != &gidSymbolNotFound ? gdk_scroll_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts the scroll deltas of a scroll event.
      
      The deltas will be zero unless the scroll direction
      is [gid.gdk4.types.ScrollDirection.Smooth].
      
      For the representation unit of these deltas, see
      [gid.gdk4.scroll_event.ScrollEvent.getUnit].
  
      Params:
        deltaX = return location for x scroll delta
        deltaY = return location for y scroll delta
  */
  void getDeltas(out double deltaX, out double deltaY) nothrow
  {
    gdk_scroll_event_get_deltas(cast(GdkEvent*)this._cPtr, cast(double*)&deltaX, cast(double*)&deltaY);
  }

  /**
      Extracts the direction of a scroll event.
      Returns: the scroll direction of event
  */
  gid.gdk4.types.ScrollDirection getDirection() nothrow
  {
    GdkScrollDirection _cretval;
    _cretval = gdk_scroll_event_get_direction(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.ScrollDirection _retval = cast(gid.gdk4.types.ScrollDirection)_cretval;
    return _retval;
  }

  /**
      Extracts the scroll direction relative to the physical motion.
      Returns: the relative scroll direction.
  */
  gid.gdk4.types.ScrollRelativeDirection getRelativeDirection() nothrow
  {
    GdkScrollRelativeDirection _cretval;
    _cretval = gdk_scroll_event_get_relative_direction(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.ScrollRelativeDirection _retval = cast(gid.gdk4.types.ScrollRelativeDirection)_cretval;
    return _retval;
  }

  /**
      Extracts the scroll delta unit of a scroll event.
      
      The unit will always be [gid.gdk4.types.ScrollUnit.Wheel] if the scroll direction is not
      [gid.gdk4.types.ScrollDirection.Smooth].
      Returns: the scroll unit.
  */
  gid.gdk4.types.ScrollUnit getUnit() nothrow
  {
    GdkScrollUnit _cretval;
    _cretval = gdk_scroll_event_get_unit(cast(GdkEvent*)this._cPtr);
    gid.gdk4.types.ScrollUnit _retval = cast(gid.gdk4.types.ScrollUnit)_cretval;
    return _retval;
  }

  /**
      Check whether a scroll event is a stop scroll event.
      
      Scroll sequences with smooth scroll information may provide
      a stop scroll event once the interaction with the device finishes,
      e.g. by lifting a finger. This stop scroll event is the signal
      that a widget may trigger kinetic scrolling based on the current
      velocity.
      
      Stop scroll events always have a delta of 0/0.
      Returns: true if the event is a scroll stop event
  */
  bool isStop() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_scroll_event_is_stop(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
