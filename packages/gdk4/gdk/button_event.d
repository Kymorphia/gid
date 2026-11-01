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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
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
