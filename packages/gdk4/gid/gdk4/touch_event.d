/// Module for [TouchEvent] class
module gid.gdk4.touch_event;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.types;

/**
    An event related to a touch-based device.
*/
class TouchEvent : gid.gdk4.event.Event
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
    return cast(void function())gdk_touch_event_get_type != &gidSymbolNotFound ? gdk_touch_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts whether a touch event is emulating a pointer event.
      Returns: true if event is emulating
  */
  bool getEmulatingPointer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_touch_event_get_emulating_pointer(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
