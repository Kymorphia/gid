/// Module for [Tooltip] class
module gid.gtk4.tooltip;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdk4.rectangle;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Represents a widget tooltip.
    
    Basic tooltips can be realized simply by using
    [gid.gtk4.widget.Widget.setTooltipText] or
    [gid.gtk4.widget.Widget.setTooltipMarkup] without
    any explicit tooltip object.
    
    When you need a tooltip with a little more fancy contents,
    like adding an image, or you want the tooltip to have different
    contents per [gid.gtk4.tree_view.TreeView] row or cell, you will have to do a
    little more work:
    
    - Set the [gid.gtk4.widget.Widget.hasTooltip] property to true.
      This will make GTK monitor the widget for motion and related events
      which are needed to determine when and where to show a tooltip.
    
    - Connect to the [gid.gtk4.widget.Widget.queryTooltip] signal.
      This signal will be emitted when a tooltip is supposed to be shown.
      One of the arguments passed to the signal handler is a [gid.gtk4.tooltip.Tooltip]
      object. This is the object that we are about to display as a tooltip,
      and can be manipulated in your callback using functions like
      [gid.gtk4.tooltip.Tooltip.setIcon]. There are functions for setting
      the tooltip’s markup, setting an image from a named icon, or even
      putting in a custom widget.
    
    - Return true from your ::query-tooltip handler. This causes the tooltip
      to be show. If you return false, it will not be shown.
*/
@gidGir("Tooltip")
class Tooltip : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tooltip_get_type != &gidSymbolNotFound ? gtk_tooltip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTooltip";
  }

  /** Returns `this`, for use in `with` statements. */
  override Tooltip self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.tooltip.Tooltip]
      Returns: New builder object
  */
  static TooltipGidBuilder builder() nothrow
  {
    return new TooltipGidBuilder;
  }

  /**
      Replaces the widget packed into the tooltip with
      custom_widget. custom_widget does not get destroyed when the tooltip goes
      away.
      By default a box with a [gid.gtk4.image.Image] and [gid.gtk4.label.Label] is embedded in
      the tooltip, which can be configured using [gid.gtk4.tooltip.Tooltip.setMarkup]
      and [gid.gtk4.tooltip.Tooltip.setIcon].
  
      Params:
        customWidget = a [gid.gtk4.widget.Widget], or null to unset the old custom widget.
  */
  void setCustom(gid.gtk4.widget.Widget customWidget = null) nothrow
  {
    gtk_tooltip_set_custom(cast(GtkTooltip*)this._cPtr, customWidget ? cast(GtkWidget*)customWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      paintable.  If paintable is null, the image will be hidden.
  
      Params:
        paintable = a [gid.gdk4.paintable.Paintable]
  */
  void setIcon(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    gtk_tooltip_set_icon(cast(GtkTooltip*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text)
      to be the icon indicated by gicon with the size indicated
      by size. If gicon is null, the image will be hidden.
  
      Params:
        gicon = a [gid.gio2.icon.Icon] representing the icon
  */
  void setIconFromGicon(gid.gio2.icon.Icon gicon = null) nothrow
  {
    gtk_tooltip_set_icon_from_gicon(cast(GtkTooltip*)this._cPtr, gicon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      the icon indicated by icon_name with the size indicated
      by size.  If icon_name is null, the image will be hidden.
  
      Params:
        iconName = an icon name
  */
  void setIconFromIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_tooltip_set_icon_from_icon_name(cast(GtkTooltip*)this._cPtr, _iconName);
  }

  /**
      Sets the text of the tooltip to be markup.
      
      The string must be marked up with Pango markup.
      If markup is null, the label will be hidden.
  
      Params:
        markup = a string with Pango markup or `NLL`
  */
  void setMarkup(string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_tooltip_set_markup(cast(GtkTooltip*)this._cPtr, _markup);
  }

  /**
      Sets the text of the tooltip to be text.
      
      If text is null, the label will be hidden.
      See also [gid.gtk4.tooltip.Tooltip.setMarkup].
  
      Params:
        text = a text string
  */
  void setText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_tooltip_set_text(cast(GtkTooltip*)this._cPtr, _text);
  }

  /**
      Sets the area of the widget, where the contents of this tooltip apply,
      to be rect (in widget coordinates).  This is especially useful for
      properly setting tooltips on [gid.gtk4.tree_view.TreeView] rows and cells, `GtkIconViews`,
      etc.
      
      For setting tooltips on [gid.gtk4.tree_view.TreeView], please refer to the convenience
      functions for this: [gid.gtk4.tree_view.TreeView.setTooltipRow] and
      [gid.gtk4.tree_view.TreeView.setTooltipCell].
  
      Params:
        rect = a [gid.gtk4.types.Rectangle]
  */
  void setTipArea(gid.gdk4.rectangle.Rectangle rect) nothrow
  {
    gtk_tooltip_set_tip_area(cast(GtkTooltip*)this._cPtr, cast(const(GdkRectangle)*)&rect);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tooltip.Tooltip]
class TooltipGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.tooltip.Tooltip]
final class TooltipGidBuilder : TooltipGidBuilderImpl!TooltipGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Tooltip build() nothrow
  {
    return new Tooltip(cast(void*)createGObject(Tooltip._getGType), Yes.Take);
  }
}
