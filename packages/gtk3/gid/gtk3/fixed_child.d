/// Module for [FixedChild] class
module gid.gtk3.fixed_child;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class FixedChild : StructWrap!(GtkFixedChild)
{
  /**
      Create a `fixed_child.FixedChild` wrap type.
      Params:
        widget = 
        x = 
        y = 
  */
  this(gid.gtk3.widget.Widget widget = gid.gtk3.widget.Widget.init, int x = int.init, int y = int.init) nothrow
  {
    this.widget = widget;
    this.x = x;
    this.y = y;
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

  private gid.gtk3.widget.Widget _widgetRef; // Keeps borrowed field value alive

  /** */
  @property gid.gtk3.widget.Widget widget() nothrow
  {
    return cToD!(gid.gtk3.widget.Widget)(cast(void*)(cast(GtkFixedChild*)this._cPtr).widget);
  }

  /** */
  @property void widget(gid.gtk3.widget.Widget propval) nothrow
  {
    if (_refuseBorrowedStore("widget"))
      return;

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
