/// Module for [TouchEvent] class
module gdk.touch_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a touch-based device.
*/
class TouchEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.touch_event.TouchEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts whether a touch event is emulating a pointer event.
      Returns: true if event is emulating
  */
  bool getEmulatingPointer()
  {
    bool _retval;
    _retval = cast(bool)gdk_touch_event_get_emulating_pointer(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
