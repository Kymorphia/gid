/// Module for [AccelGroupEntry] class
module gtk.accel_group_entry;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gobject.closure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class AccelGroupEntry
{
  GtkAccelGroupEntry _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkAccelGroupEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gtk.types.AccelKey key() nothrow
  {
    return cToD!(gtk.types.AccelKey)(cast(void*)&(cast(GtkAccelGroupEntry*)this._cPtr).key);
  }

  /** */
  @property void key(gtk.types.AccelKey propval) nothrow
  {
    (cast(GtkAccelGroupEntry*)this._cPtr).key = cast(GtkAccelKey)propval;
  }

  /** */
  @property gobject.closure.Closure closure() nothrow
  {
    return cToD!(gobject.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)this._cPtr).closure);
  }

  /** */
  @property void closure(gobject.closure.Closure propval) nothrow
  {
    cValueFree!(gobject.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)this._cPtr).closure);
    dToC(propval, cast(void*)&(cast(GtkAccelGroupEntry*)this._cPtr).closure);
  }

  /** */
  @property glib.types.Quark accelPathQuark() nothrow
  {
    return (cast(GtkAccelGroupEntry*)this._cPtr).accelPathQuark;
  }

  /** */
  @property void accelPathQuark(glib.types.Quark propval) nothrow
  {
    (cast(GtkAccelGroupEntry*)this._cPtr).accelPathQuark = propval;
  }
}
