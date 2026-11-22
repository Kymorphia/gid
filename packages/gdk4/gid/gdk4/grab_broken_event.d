/// Module for [GrabBrokenEvent] class
module gid.gdk4.grab_broken_event;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.event;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.object;

/**
    An event related to a broken windowing system grab.
*/
class GrabBrokenEvent : gid.gdk4.event.Event
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
    return cast(void function())gdk_grab_broken_event_get_type != &gidSymbolNotFound ? gdk_grab_broken_event_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Extracts the grab surface from a grab broken event.
      Returns: the grab surface of event
  */
  gid.gdk4.surface.Surface getGrabSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_grab_broken_event_get_grab_surface(cast(GdkEvent*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the grab broken event is for an implicit grab.
      Returns: true if the an implicit grab was broken
  */
  bool getImplicit() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_grab_broken_event_get_implicit(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
