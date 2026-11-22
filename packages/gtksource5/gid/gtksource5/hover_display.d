/// Module for [HoverDisplay] class
module gid.gtksource5.hover_display;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Display for interactive tooltips.
    
    [gid.gtksource5.hover_display.HoverDisplay] is a [gid.gtk4.widget.Widget] that may be populated with widgets
    to be displayed to the user in interactive tooltips. The children widgets
    are packed vertically using a [gid.gtk4.box.Box].
    
    Implement the [gid.gtksource5.hover_provider.HoverProvider] interface to be notified of when
    to populate a [gid.gtksource5.hover_display.HoverDisplay] on behalf of the user.
*/
class HoverDisplay : gid.gtk4.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_hover_display_get_type != &gidSymbolNotFound ? gtk_source_hover_display_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceHoverDisplay";
  }

  /** Returns `this`, for use in `with` statements. */
  override HoverDisplay self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.hover_display.HoverDisplay]
      Returns: New builder object
  */
  static HoverDisplayGidBuilder builder() nothrow
  {
    return new HoverDisplayGidBuilder;
  }

  /** */
  void append(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_source_hover_display_append(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /** */
  override void insertAfter(gid.gtk4.widget.Widget child, gid.gtk4.widget.Widget sibling) nothrow
  {
    gtk_source_hover_display_insert_after(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /** */
  void prepend(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_source_hover_display_prepend(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /** */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_source_hover_display_remove(cast(GtkSourceHoverDisplay*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.hover_display.HoverDisplay]
class HoverDisplayGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtksource5.hover_display.HoverDisplay]
final class HoverDisplayGidBuilder : HoverDisplayGidBuilderImpl!HoverDisplayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HoverDisplay build() nothrow
  {
    return new HoverDisplay(cast(void*)createGObject(HoverDisplay._getGType), Yes.Take);
  }
}
