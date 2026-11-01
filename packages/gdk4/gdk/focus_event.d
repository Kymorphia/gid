/// Module for [FocusEvent] class
module gdk.focus_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a keyboard focus change.
*/
class FocusEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_focus_event_get_type != &gidSymbolNotFound ? gdk_focus_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts whether this event is about focus entering or
      leaving the surface.
      Returns: true of the focus is entering
  */
  bool getIn() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_focus_event_get_in(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
