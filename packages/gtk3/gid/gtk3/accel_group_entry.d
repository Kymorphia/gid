/// Module for [AccelGroupEntry] class
module gid.gtk3.accel_group_entry;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gobject2.closure;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

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
  this(gid.gtk3.types.AccelKey key = gid.gtk3.types.AccelKey.init, gid.gobject2.closure.Closure closure = gid.gobject2.closure.Closure.init, gid.glib2.types.Quark accelPathQuark = gid.glib2.types.Quark.init) nothrow
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
  @property gid.gtk3.types.AccelKey key() nothrow
  {
    return cToD!(gid.gtk3.types.AccelKey)(cast(void*)&(cast(GtkAccelGroupEntry*)this._cPtr).key);
  }

  /** */
  @property void key(gid.gtk3.types.AccelKey propval) nothrow
  {
    (cast(GtkAccelGroupEntry*)this._cPtr).key = cast(GtkAccelKey)propval;
  }

  private gid.gobject2.closure.Closure _closureRef; // Keeps borrowed field value alive

  /** */
  @property gid.gobject2.closure.Closure closure() nothrow
  {
    return cToD!(gid.gobject2.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)this._cPtr).closure);
  }

  /** */
  @property void closure(gid.gobject2.closure.Closure propval) nothrow
  {
    if (_refuseBorrowedStore("closure"))
      return;

    _closureRef = propval;
    (cast(GtkAccelGroupEntry*)this._cPtr).closure = propval ? cast(GClosure*)propval._cPtr(No.Dup) : null;
  }

  /** */
  @property gid.glib2.types.Quark accelPathQuark() nothrow
  {
    return (cast(GtkAccelGroupEntry*)this._cPtr).accelPathQuark;
  }

  /** */
  @property void accelPathQuark(gid.glib2.types.Quark propval) nothrow
  {
    (cast(GtkAccelGroupEntry*)this._cPtr).accelPathQuark = propval;
  }
}
