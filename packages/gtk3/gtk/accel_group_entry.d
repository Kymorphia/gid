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
class AccelGroupEntry : StructWrap!(GtkAccelGroupEntry)
{
  /**
      Create a `accel_group_entry.AccelGroupEntry` wrap type.
      Params:
        key = 
        closure = 
        accelPathQuark = 
  */
  this(gtk.types.AccelKey key = gtk.types.AccelKey.init, gobject.closure.Closure closure = gobject.closure.Closure.init, glib.types.Quark accelPathQuark = glib.types.Quark.init) nothrow
  {
    this.key = key;
    this.closure = closure;
    this.accelPathQuark = accelPathQuark;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
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

  private gobject.closure.Closure _closureRef; // Keeps borrowed field value alive

  /** */
  @property gobject.closure.Closure closure() nothrow
  {
    return cToD!(gobject.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)this._cPtr).closure);
  }

  /** */
  @property void closure(gobject.closure.Closure propval) nothrow
  {
    if (_refuseBorrowedStore("closure"))
      return;

    _closureRef = propval;
    (cast(GtkAccelGroupEntry*)this._cPtr).closure = propval ? cast(GClosure*)propval._cPtr(No.Dup) : null;
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
