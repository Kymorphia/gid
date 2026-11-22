/// Module for [ButtonEvent] class
module gid.gdk4.button_event;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.types;

/**
    An event related to a button on a pointer device.
*/
class ButtonEvent : gid.gdk4.event.Event
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
    return cast(void function())gdk_button_event_get_type != &gidSymbolNotFound ? gdk_button_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extract the button number from a button event.
      Returns: the button of event
  */
  uint getButton() nothrow
  {
    uint _retval;
    _retval = gdk_button_event_get_button(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
