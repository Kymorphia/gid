/// Module for [ListBase] class
module gtk.list_base;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.list_base.ListBase] is the abstract base class for GTK's list widgets.
*/
class ListBase : gtk.widget.Widget, gtk.orientable.Orientable, gtk.scrollable.Scrollable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_base_get_type != &gidSymbolNotFound ? gtk_list_base_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBase self()
  {
    return this;
  }

  /**
      Get `orientation` property.
      Returns: The orientation of the list. See GtkOrientable:orientation
        for details.
  */
  @property gtk.types.Orientation orientation()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Orientation)("orientation");
  }

  /**
      Set `orientation` property.
      Params:
        propval = The orientation of the list. See GtkOrientable:orientation
          for details.
  */
  @property void orientation(gtk.types.Orientation propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.Orientation)("orientation", propval);
  }

  mixin OrientableT!();
  mixin ScrollableT!();
}
