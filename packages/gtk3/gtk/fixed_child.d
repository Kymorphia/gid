/// Module for [FixedChild] class
module gtk.fixed_child;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/** */
class FixedChild
{
  GtkFixedChild _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkFixedChild*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gtk.widget.Widget widget() nothrow
  {
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gtk.widget.Widget propval) nothrow
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property int x() nothrow
  {
    return (cast(GtkFixedChild*)this._cPtr).x;
  }

  /** */
  @property void x(int propval) nothrow
  {
    (cast(GtkFixedChild*)this._cPtr).x = propval;
  }

  /** */
  @property int y() nothrow
  {
    return (cast(GtkFixedChild*)this._cPtr).y;
  }

  /** */
  @property void y(int propval) nothrow
  {
    (cast(GtkFixedChild*)this._cPtr).y = propval;
  }
}
