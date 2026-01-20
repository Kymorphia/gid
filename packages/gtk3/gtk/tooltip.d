/// Module for [Tooltip] class
module gtk.tooltip;

import gdk.display;
import gdk.rectangle;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    Basic tooltips can be realized simply by using [gtk.widget.Widget.setTooltipText]
    or [gtk.widget.Widget.setTooltipMarkup] without any explicit tooltip object.
    
    When you need a tooltip with a little more fancy contents, like adding an
    image, or you want the tooltip to have different contents per #GtkTreeView
    row or cell, you will have to do a little more work:
    
    $(LIST
      * Set the #GtkWidget:has-tooltip property to true, this will make GTK+
        monitor the widget for motion and related events which are needed to
        determine when and where to show a tooltip.
      
      * Connect to the #GtkWidget::query-tooltip signal.  This signal will be
        emitted when a tooltip is supposed to be shown. One of the arguments passed
        to the signal handler is a GtkTooltip object. This is the object that we
        are about to display as a tooltip, and can be manipulated in your callback
        using functions like [gtk.tooltip.Tooltip.setIcon]. There are functions for setting
        the tooltip’s markup, setting an image from a named icon, or even putting in
        a custom widget.
      
        Return true from your query-tooltip handler. This causes the tooltip to be
        show. If you return false, it will not be shown.
    )
      
    In the probably rare case where you want to have even more control over the
    tooltip that is about to be shown, you can set your own #GtkWindow which
    will be used as tooltip window.  This works as follows:
    
    $(LIST
      * Set #GtkWidget:has-tooltip and connect to #GtkWidget::query-tooltip as before.
        Use [gtk.widget.Widget.setTooltipWindow] to set a #GtkWindow created by you as
        tooltip window.
      
      * In the #GtkWidget::query-tooltip callback you can access your window using
        [gtk.widget.Widget.getTooltipWindow] and manipulate as you wish. The semantics of
        the return value are exactly as before, return true to show the window,
        false to not show it.
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
      Triggers a new tooltip query on display, in order to update the current
      visible tooltip, or to show/hide the current tooltip.  This function is
      useful to call when, for example, the state of the widget changed by a
      key press.
  
      Params:
        display = a #GdkDisplay
  */
  static void triggerTooltipQuery(gdk.display.Display display)
  {
    gtk_tooltip_trigger_tooltip_query(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Replaces the widget packed into the tooltip with
      custom_widget. custom_widget does not get destroyed when the tooltip goes
      away.
      By default a box with a #GtkImage and #GtkLabel is embedded in
      the tooltip, which can be configured using [gtk.tooltip.Tooltip.setMarkup]
      and [gtk.tooltip.Tooltip.setIcon].
  
      Params:
        customWidget = a #GtkWidget, or null to unset the old custom widget.
  */
  void setCustom(gtk.widget.Widget customWidget = null)
  {
    gtk_tooltip_set_custom(cast(GtkTooltip*)this._cPtr, customWidget ? cast(GtkWidget*)customWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      pixbuf.  If pixbuf is null, the image will be hidden.
  
      Params:
        pixbuf = a #GdkPixbuf, or null
  */
  void setIcon(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_tooltip_set_icon(cast(GtkTooltip*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text)
      to be the icon indicated by gicon with the size indicated
      by size. If gicon is null, the image will be hidden.
  
      Params:
        gicon = a #GIcon representing the icon, or null
        size = a stock icon size (#GtkIconSize)
  */
  void setIconFromGicon(gio.icon.Icon gicon, gtk.types.IconSize size)
  {
    gtk_tooltip_set_icon_from_gicon(cast(GtkTooltip*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null, size);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      the icon indicated by icon_name with the size indicated
      by size.  If icon_name is null, the image will be hidden.
  
      Params:
        iconName = an icon name, or null
        size = a stock icon size (#GtkIconSize)
  */
  void setIconFromIconName(string iconName, gtk.types.IconSize size)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_tooltip_set_icon_from_icon_name(cast(GtkTooltip*)this._cPtr, _iconName, size);
  }

  /**
      Sets the icon of the tooltip (which is in front of the text) to be
      the stock item indicated by stock_id with the size indicated
      by size.  If stock_id is null, the image will be hidden.
  
      Params:
        stockId = a stock id, or null
        size = a stock icon size (#GtkIconSize)
  
      Deprecated: Use [gtk.tooltip.Tooltip.setIconFromIconName] instead.
  */
  void setIconFromStock(string stockId, gtk.types.IconSize size)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_tooltip_set_icon_from_stock(cast(GtkTooltip*)this._cPtr, _stockId, size);
  }

  /**
      Sets the text of the tooltip to be markup, which is marked up
      with the [Pango text markup language][PangoMarkupFormat].
      If markup is null, the label will be hidden.
  
      Params:
        markup = a markup string (see [Pango markup format][PangoMarkupFormat]) or null
  */
  void setMarkup(string markup = null)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_tooltip_set_markup(cast(GtkTooltip*)this._cPtr, _markup);
  }

  /**
      Sets the text of the tooltip to be text. If text is null, the label
      will be hidden. See also [gtk.tooltip.Tooltip.setMarkup].
  
      Params:
        text = a text string or null
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_tooltip_set_text(cast(GtkTooltip*)this._cPtr, _text);
  }

  /**
      Sets the area of the widget, where the contents of this tooltip apply,
      to be rect (in widget coordinates).  This is especially useful for
      properly setting tooltips on #GtkTreeView rows and cells, #GtkIconViews,
      etc.
      
      For setting tooltips on #GtkTreeView, please refer to the convenience
      functions for this: [gtk.tree_view.TreeView.setTooltipRow] and
      [gtk.tree_view.TreeView.setTooltipCell].
  
      Params:
        rect = a #GdkRectangle
  */
  void setTipArea(gdk.rectangle.Rectangle rect)
  {
    gtk_tooltip_set_tip_area(cast(GtkTooltip*)this._cPtr, cast(const(GdkRectangle)*)&rect);
  }
}
