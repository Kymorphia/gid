/// Module for [TableChild] class
module gtk.table_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/** */
class TableChild
{
  GtkTableChild _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.table_child.TableChild");

    _cInstance = *cast(GtkTableChild*)ptr;

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
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gtk.widget.Widget propval)
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)this._cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkTableChild*)this._cPtr).widget);
  }

  /** */
  @property ushort leftAttach()
  {
    return (cast(GtkTableChild*)this._cPtr).leftAttach;
  }

  /** */
  @property void leftAttach(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).leftAttach = propval;
  }

  /** */
  @property ushort rightAttach()
  {
    return (cast(GtkTableChild*)this._cPtr).rightAttach;
  }

  /** */
  @property void rightAttach(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).rightAttach = propval;
  }

  /** */
  @property ushort topAttach()
  {
    return (cast(GtkTableChild*)this._cPtr).topAttach;
  }

  /** */
  @property void topAttach(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).topAttach = propval;
  }

  /** */
  @property ushort bottomAttach()
  {
    return (cast(GtkTableChild*)this._cPtr).bottomAttach;
  }

  /** */
  @property void bottomAttach(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).bottomAttach = propval;
  }

  /** */
  @property ushort xpadding()
  {
    return (cast(GtkTableChild*)this._cPtr).xpadding;
  }

  /** */
  @property void xpadding(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).xpadding = propval;
  }

  /** */
  @property ushort ypadding()
  {
    return (cast(GtkTableChild*)this._cPtr).ypadding;
  }

  /** */
  @property void ypadding(ushort propval)
  {
    (cast(GtkTableChild*)this._cPtr).ypadding = propval;
  }

  /** */
  @property uint xexpand()
  {
    return (cast(GtkTableChild*)this._cPtr).xexpand;
  }

  /** */
  @property void xexpand(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).xexpand = propval;
  }

  /** */
  @property uint yexpand()
  {
    return (cast(GtkTableChild*)this._cPtr).yexpand;
  }

  /** */
  @property void yexpand(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).yexpand = propval;
  }

  /** */
  @property uint xshrink()
  {
    return (cast(GtkTableChild*)this._cPtr).xshrink;
  }

  /** */
  @property void xshrink(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).xshrink = propval;
  }

  /** */
  @property uint yshrink()
  {
    return (cast(GtkTableChild*)this._cPtr).yshrink;
  }

  /** */
  @property void yshrink(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).yshrink = propval;
  }

  /** */
  @property uint xfill()
  {
    return (cast(GtkTableChild*)this._cPtr).xfill;
  }

  /** */
  @property void xfill(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).xfill = propval;
  }

  /** */
  @property uint yfill()
  {
    return (cast(GtkTableChild*)this._cPtr).yfill;
  }

  /** */
  @property void yfill(uint propval)
  {
    (cast(GtkTableChild*)this._cPtr).yfill = propval;
  }
}
