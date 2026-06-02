/// Module for [TableChild] class
module gtk.table_child;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkTableChild*)ptr;

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
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gtk.widget.Widget propval) nothrow
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)this._cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkTableChild*)this._cPtr).widget);
  }

  /** */
  @property ushort leftAttach() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).leftAttach;
  }

  /** */
  @property void leftAttach(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).leftAttach = propval;
  }

  /** */
  @property ushort rightAttach() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).rightAttach;
  }

  /** */
  @property void rightAttach(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).rightAttach = propval;
  }

  /** */
  @property ushort topAttach() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).topAttach;
  }

  /** */
  @property void topAttach(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).topAttach = propval;
  }

  /** */
  @property ushort bottomAttach() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).bottomAttach;
  }

  /** */
  @property void bottomAttach(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).bottomAttach = propval;
  }

  /** */
  @property ushort xpadding() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).xpadding;
  }

  /** */
  @property void xpadding(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).xpadding = propval;
  }

  /** */
  @property ushort ypadding() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).ypadding;
  }

  /** */
  @property void ypadding(ushort propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).ypadding = propval;
  }

  /** */
  @property uint xexpand() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).xexpand;
  }

  /** */
  @property void xexpand(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).xexpand = propval;
  }

  /** */
  @property uint yexpand() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).yexpand;
  }

  /** */
  @property void yexpand(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).yexpand = propval;
  }

  /** */
  @property uint xshrink() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).xshrink;
  }

  /** */
  @property void xshrink(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).xshrink = propval;
  }

  /** */
  @property uint yshrink() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).yshrink;
  }

  /** */
  @property void yshrink(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).yshrink = propval;
  }

  /** */
  @property uint xfill() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).xfill;
  }

  /** */
  @property void xfill(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).xfill = propval;
  }

  /** */
  @property uint yfill() nothrow
  {
    return (cast(GtkTableChild*)this._cPtr).yfill;
  }

  /** */
  @property void yfill(uint propval) nothrow
  {
    (cast(GtkTableChild*)this._cPtr).yfill = propval;
  }
}
