/// Module for [HoverDisplay] class
module gtksource.hover_display;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Display for interactive tooltips.
    
    [gtksource.hover_display.HoverDisplay] is a [gtk.widget.Widget] that may be populated with widgets
    to be displayed to the user in interactive tooltips. The children widgets
    are packed vertically using a [gtk.box.Box].
    
    Implement the `iface@HoverProvider` interface to be notified of when
    to populate a [gtksource.hover_display.HoverDisplay] on behalf of the user.
*/
class HoverDisplay : gtk.widget.Widget
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
    return cast(void function())gtk_source_hover_display_get_type != &gidSymbolNotFound ? gtk_source_hover_display_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HoverDisplay self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.hover_display.HoverDisplay]
  Returns: New builder object
  */
  static HoverDisplayGidBuilder builder()
  {
    return new HoverDisplayGidBuilder;
  }

  /** */
  void append(gtk.widget.Widget child)
  {
    gtk_source_hover_display_append(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /** */
  override void insertAfter(gtk.widget.Widget child, gtk.widget.Widget sibling)
  {
    gtk_source_hover_display_insert_after(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /** */
  void prepend(gtk.widget.Widget child)
  {
    gtk_source_hover_display_prepend(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /** */
  void remove(gtk.widget.Widget child)
  {
    gtk_source_hover_display_remove(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

class HoverDisplayGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gtksource.hover_display.HoverDisplay]
final class HoverDisplayGidBuilder : HoverDisplayGidBuilderImpl!HoverDisplayGidBuilder
{
  HoverDisplay build()
  {
    return new HoverDisplay(cast(void*)createGObject(HoverDisplay._getGType), No.Take);
  }
}
