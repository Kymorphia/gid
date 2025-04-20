/// Module for [DNDEvent] class
module gdk.dndevent;

import gdk.c.functions;
import gdk.c.types;
import gdk.drop;
import gdk.event;
import gdk.types;
import gid.gid;
import gobject.object;

/**
    An event related to drag and drop operations.
*/
class DNDEvent : gdk.event.Event
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.dndevent.DNDEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Gets the [gdk.drop.Drop] object from a DND event.
      Returns: the drop
  */
  gdk.drop.Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gdk_dnd_event_get_drop(cast(GdkEvent*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }
}
