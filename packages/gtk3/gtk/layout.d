/// Module for [Layout] class
module gtk.layout;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.types;
import gtk.widget;

/**
    #GtkLayout is similar to #GtkDrawingArea in that it’s a “blank slate” and
    doesn’t do anything except paint a blank background by default. It’s
    different in that it supports scrolling natively due to implementing
    #GtkScrollable, and can contain child widgets since it’s a #GtkContainer.
    
    If you just want to draw, a #GtkDrawingArea is a better choice since it has
    lower overhead. If you just need to position child widgets at specific
    points, then #GtkFixed provides that functionality on its own.
    
    When handling expose events on a #GtkLayout, you must draw to the #GdkWindow
    returned by [gtk.layout.Layout.getBinWindow], rather than to the one returned by
    [gtk.widget.Widget.getWindow] as you would for a #GtkDrawingArea.
*/
class Layout : gtk.container.Container, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_layout_get_type != &gidSymbolNotFound ? gtk_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Layout self()
  {
    return this;
  }

  /**
  Get builder for [gtk.layout.Layout]
  Returns: New builder object
  */
  static LayoutGidBuilder builder()
  {
    return new LayoutGidBuilder;
  }

  /** */
  @property uint height()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("height");
  }

  /** */
  @property void height(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("height", propval);
  }

  /** */
  @property uint width()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("width");
  }

  /** */
  @property void width(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("width", propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new #GtkLayout. Unless you have a specific adjustment
      you’d like the layout to use for scrolling, pass null for
      hadjustment and vadjustment.
  
      Params:
        hadjustment = horizontal scroll adjustment, or null
        vadjustment = vertical scroll adjustment, or null
      Returns: a new #GtkLayout
  */
  this(gtk.adjustment.Adjustment hadjustment = null, gtk.adjustment.Adjustment vadjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Retrieve the bin window of the layout used for drawing operations.
      Returns: a #GdkWindow
  */
  gdk.window.Window getBinWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_layout_get_bin_window(cast(GtkLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function should only be called after the layout has been
      placed in a #GtkScrolledWindow or otherwise configured for
      scrolling. It returns the #GtkAdjustment used for communication
      between the horizontal scrollbar and layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
      Returns: horizontal scroll adjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.getHadjustment]
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_layout_get_hadjustment(cast(GtkLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the size that has been set on the layout, and that determines
      the total extents of the layout’s scrollbar area. See
      gtk_layout_set_size ().
  
      Params:
        width = location to store the width set on
              layout, or null
        height = location to store the height set on
              layout, or null
  */
  void getSize(out uint width, out uint height)
  {
    gtk_layout_get_size(cast(GtkLayout*)this._cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /**
      This function should only be called after the layout has been
      placed in a #GtkScrolledWindow or otherwise configured for
      scrolling. It returns the #GtkAdjustment used for communication
      between the vertical scrollbar and layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
      Returns: vertical scroll adjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.getVadjustment]
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_layout_get_vadjustment(cast(GtkLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves a current child of layout to a new position.
  
      Params:
        childWidget = a current child of layout
        x = X position to move to
        y = Y position to move to
  */
  void move(gtk.widget.Widget childWidget, int x, int y)
  {
    gtk_layout_move(cast(GtkLayout*)this._cPtr, childWidget ? cast(GtkWidget*)childWidget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Adds child_widget to layout, at position (`x`,`y`).
      layout becomes the new parent container of child_widget.
  
      Params:
        childWidget = child widget
        x = X position of child widget
        y = Y position of child widget
  */
  void put(gtk.widget.Widget childWidget, int x, int y)
  {
    gtk_layout_put(cast(GtkLayout*)this._cPtr, childWidget ? cast(GtkWidget*)childWidget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Sets the horizontal scroll adjustment for the layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
  
      Params:
        adjustment = new scroll adjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.setHadjustment]
  */
  void setHadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_layout_set_hadjustment(cast(GtkLayout*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the size of the scrollable area of the layout.
  
      Params:
        width = width of entire scrollable area
        height = height of entire scrollable area
  */
  void setSize(uint width, uint height)
  {
    gtk_layout_set_size(cast(GtkLayout*)this._cPtr, width, height);
  }

  /**
      Sets the vertical scroll adjustment for the layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
  
      Params:
        adjustment = new scroll adjustment
  
      Deprecated: Use [gtk.scrollable.Scrollable.setVadjustment]
  */
  void setVadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_layout_set_vadjustment(cast(GtkLayout*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }
}

class LayoutGidBuilderImpl(T) : gtk.container.ContainerGidBuilderImpl!T, gtk.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /** */
  T height(uint propval)
  {
    return setProperty("height", propval);
  }

  /** */
  T width(uint propval)
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [gtk.layout.Layout]
final class LayoutGidBuilder : LayoutGidBuilderImpl!LayoutGidBuilder
{
  Layout build()
  {
    return new Layout(cast(void*)createGObject(Layout._getGType), No.Take);
  }
}
