/// Module for [FixedChild] class
module gtk.fixed_child;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.fixed_child.FixedChild");

    _cInstance = *cast(GtkFixedChild*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gtk.widget.Widget widget()
  {
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gtk.widget.Widget propval)
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property int x()
  {
    return (cast(GtkFixedChild*)this._cPtr).x;
  }

  /** */
  @property void x(int propval)
  {
    (cast(GtkFixedChild*)this._cPtr).x = propval;
  }

  /** */
  @property int y()
  {
    return (cast(GtkFixedChild*)this._cPtr).y;
  }

  /** */
  @property void y(int propval)
  {
    (cast(GtkFixedChild*)this._cPtr).y = propval;
  }
}
