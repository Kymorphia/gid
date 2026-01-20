/// Module for [Tooltip] class
module gtk.tooltip;

import gdk.paintable;
import gdk.rectangle;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.tooltip.Tooltip] is an object representing a widget tooltip.
    
    Basic tooltips can be realized simply by using
    [gtk.widget.Widget.setTooltipText] or
    [gtk.widget.Widget.setTooltipMarkup] without
    any explicit tooltip object.
    
    When you need a tooltip with a little more fancy contents,
    like adding an image, or you want the tooltip to have different
    contents per [gtk.tree_view.TreeView] row or cell, you will have to do a
    little more work:
    
    $(LIST
      * Set the `property@Gtk.Widget:has-tooltip` property to true.
        This will make GTK monitor the widget for motion and related events
        which are needed to determine when and where to show a tooltip.
      
      * Connect to the `signal@Gtk.Widget::query-tooltip` signal.
        This signal will be emitted when a tooltip is supposed to be shown.
        One of the arguments passed to the signal handler is a [gtk.tooltip.Tooltip]
        object. This is the object that we are about to display as a tooltip,
        and can be manipulated in your callback using functions like
        [gtk.tooltip.Tooltip.setIcon]. There are functions for setting
        the tooltip’s markup, setting an image from a named icon, or even
        putting in a custom widget.
      
      * Return true from your ::query-tooltip handler. This causes the tooltip
        to be show. If you return false, it will not be shown.
    )
*/
class Tooltip : gobject.object.ObjectWrap
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
    return cast(void function())gtk_tooltip_get_type != &gidSymbolNotFound ? gtk_tooltip_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tooltip self()
  {
    return this;
  }

  /**
      Replaces the widget packed into the tooltip with
      custom_widget. custom_widget does not get destroyed when the tooltip goes
      away.
      By default a box with a [gtk.image.Image] and [gtk.label.Label] is embedded in
      the tooltip, which can be configured using [gtk.tooltip.Tooltip.setMarkup]
      and [gtk.tooltip.Tooltip.setIcon].
  
      Params:
        customWidget = a [gtk.widget.Widget], or null to unset the old custom widget.
  */
  void setCustom(gtk.widget.Widget customWidget = null)
  {
    gtk_tooltip_set_custom(cast(GtkTooltip*)this._cPtr, customWidget ? cast(GtkWidget*)customWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      paintable.  If paintable is null, the image will be hidden.
  
      Params:
        paintable = a [gdk.paintable.Paintable]
  */
  void setIcon(gdk.paintable.Paintable paintable = null)
  {
    gtk_tooltip_set_icon(cast(GtkTooltip*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text)
      to be the icon indicated by gicon with the size indicated
      by size. If gicon is null, the image will be hidden.
  
      Params:
        gicon = a [gio.icon.Icon] representing the icon
  */
  void setIconFromGicon(gio.icon.Icon gicon = null)
  {
    gtk_tooltip_set_icon_from_gicon(cast(GtkTooltip*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      the icon indicated by icon_name with the size indicated
      by size.  If icon_name is null, the image will be hidden.
  
      Params:
        iconName = an icon name
  */
  void setIconFromIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_tooltip_set_icon_from_icon_name(cast(GtkTooltip*)this._cPtr, _iconName);
  }

  /**
      Sets the text of the tooltip to be markup.
      
      The string must be marked up with Pango markup.
      If markup is null, the label will be hidden.
  
      Params:
        markup = a string with Pango markup or `NLL`
  */
  void setMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_tooltip_set_markup(cast(GtkTooltip*)this._cPtr, _markup);
  }

  /**
      Sets the text of the tooltip to be text.
      
      If text is null, the label will be hidden.
      See also [gtk.tooltip.Tooltip.setMarkup].
  
      Params:
        text = a text string
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_tooltip_set_text(cast(GtkTooltip*)this._cPtr, _text);
  }

  /**
      Sets the area of the widget, where the contents of this tooltip apply,
      to be rect (in widget coordinates).  This is especially useful for
      properly setting tooltips on [gtk.tree_view.TreeView] rows and cells, `GtkIconViews`,
      etc.
      
      For setting tooltips on [gtk.tree_view.TreeView], please refer to the convenience
      functions for this: [gtk.tree_view.TreeView.setTooltipRow] and
      [gtk.tree_view.TreeView.setTooltipCell].
  
      Params:
        rect = a [gtk.types.Rectangle]
  */
  void setTipArea(gdk.rectangle.Rectangle rect)
  {
    gtk_tooltip_set_tip_area(cast(GtkTooltip*)this._cPtr, cast(const(GdkRectangle)*)&rect);
  }
}
