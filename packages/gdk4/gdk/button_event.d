/// Module for [ButtonEvent] class
module gdk.button_event;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a button on a pointer device.
*/
class ButtonEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.button_event.ButtonEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extract the button number from a button event.
      Returns: the button of event
  */
  uint getButton()
  {
    uint _retval;
    _retval = gdk_button_event_get_button(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
