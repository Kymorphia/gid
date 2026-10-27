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

  /**
      Create a `fixed_child.FixedChild` wrap type.
      Params:
        widget = 
        x = 
        y = 
  */
  this(gtk.widget.Widget widget = gtk.widget.Widget.init, int x = int.init, int y = int.init) nothrow
  {
    this.widget = widget;
    this.x = x;
    this.y = y;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkFixedChild*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gtk.widget.Widget _widgetRef; // Keeps borrowed field value alive

  /** */
  @property gtk.widget.Widget widget() nothrow
  {
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gtk.widget.Widget propval) nothrow
  {
    _widgetRef = propval;
    (cast(GtkFixedChild*)this._cPtr).widget = propval ? cast(GtkWidget*)propval._cPtr(No.Dup) : null;
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
