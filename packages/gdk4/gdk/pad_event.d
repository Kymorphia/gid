module gdk.pad_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a pad-based device.
*/
class PadEvent : gdk.event.Event
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.PadEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts the information from a pad strip or ring event.
    Params:
      index =       Return location for the axis index
      value =       Return location for the axis value
  */
  void getAxisValue(out uint index, out double value)
  {
    gdk_pad_event_get_axis_value(cast(GdkEvent*)cPtr, cast(uint*)&index, cast(double*)&value);
  }

  /**
      Extracts information about the pressed button from
    a pad event.
    Returns:     the button of event
  */
  uint getButton()
  {
    uint _retval;
    _retval = gdk_pad_event_get_button(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
      Extracts group and mode information from a pad event.
    Params:
      group =       return location for the group
      mode =       return location for the mode
  */
  void getGroupMode(out uint group, out uint mode)
  {
    gdk_pad_event_get_group_mode(cast(GdkEvent*)cPtr, cast(uint*)&group, cast(uint*)&mode);
  }
}
