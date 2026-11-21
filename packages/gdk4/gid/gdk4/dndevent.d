/// Module for [DNDEvent] class
module gid.gdk4.dndevent;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.drop;
import gid.gdk4.event;
import gid.gdk4.types;
import gid.gobject2.object;

/**
    An event related to drag and drop operations.
*/
class DNDEvent : gid.gdk4.event.Event
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
    return cast(void function())gdk_dnd_event_get_type != &gidSymbolNotFound ? gdk_dnd_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Gets the [gid.gdk4.drop.Drop] object from a DND event.
      Returns: the drop
  */
  gid.gdk4.drop.Drop getDrop() nothrow
  {
    GdkDrop* _cretval;
    _cretval = gdk_dnd_event_get_drop(cast(GdkEvent*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }
}
