/// Module for [Layout] class
module gid.gtk3.layout;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.window;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkLayout is similar to #GtkDrawingArea in that it’s a “blank slate” and
    doesn’t do anything except paint a blank background by default. It’s
    different in that it supports scrolling natively due to implementing
    #GtkScrollable, and can contain child widgets since it’s a #GtkContainer.
    
    If you just want to draw, a #GtkDrawingArea is a better choice since it has
    lower overhead. If you just need to position child widgets at specific
    points, then #GtkFixed provides that functionality on its own.
    
    When handling expose events on a #GtkLayout, you must draw to the #GdkWindow
    returned by [gid.gtk3.layout.Layout.getBinWindow], rather than to the one returned by
    [gid.gtk3.widget.Widget.getWindow] as you would for a #GtkDrawingArea.
*/
class Layout : gid.gtk3.container.Container, gid.gtk3.scrollable.Scrollable
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
    return cast(void function())gtk_layout_get_type != &gidSymbolNotFound ? gtk_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override Layout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.layout.Layout]
      Returns: New builder object
  */
  static LayoutGidBuilder builder() nothrow
  {
    return new LayoutGidBuilder;
  }

  /** */
  @property uint height() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("height");
  }

  /** */
  @property void height(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("height", propval);
  }

  /** */
  @property uint width() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("width");
  }

  /** */
  @property void width(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("width", propval);
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
  this(gid.gtk3.adjustment.Adjustment hadjustment = null, gid.gtk3.adjustment.Adjustment vadjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, hadjustment !is null || vadjustment !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_layout_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieve the bin window of the layout used for drawing operations.
      Returns: a #GdkWindow
  */
  gid.gdk3.window.Window getBinWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_layout_get_bin_window(cast(GtkLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      This function should only be called after the layout has been
      placed in a #GtkScrolledWindow or otherwise configured for
      scrolling. It returns the #GtkAdjustment used for communication
      between the horizontal scrollbar and layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
      Returns: horizontal scroll adjustment
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getHadjustment]
  */
  gid.gtk3.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_layout_get_hadjustment(cast(GtkLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
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
  void getSize(out uint width, out uint height) nothrow
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
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.getVadjustment]
  */
  gid.gtk3.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_layout_get_vadjustment(cast(GtkLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves a current child of layout to a new position.
  
      Params:
        childWidget = a current child of layout
        x = X position to move to
        y = Y position to move to
  */
  void move(gid.gtk3.widget.Widget childWidget, int x, int y) nothrow
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
  void put(gid.gtk3.widget.Widget childWidget, int x, int y) nothrow
  {
    gtk_layout_put(cast(GtkLayout*)this._cPtr, childWidget ? cast(GtkWidget*)childWidget._cPtr(No.Dup) : null, x, y);
  }

  /**
      Sets the horizontal scroll adjustment for the layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
  
      Params:
        adjustment = new scroll adjustment
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.setHadjustment]
  */
  void setHadjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_layout_set_hadjustment(cast(GtkLayout*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the size of the scrollable area of the layout.
  
      Params:
        width = width of entire scrollable area
        height = height of entire scrollable area
  */
  void setSize(uint width, uint height) nothrow
  {
    gtk_layout_set_size(cast(GtkLayout*)this._cPtr, width, height);
  }

  /**
      Sets the vertical scroll adjustment for the layout.
      
      See #GtkScrolledWindow, #GtkScrollbar, #GtkAdjustment for details.
  
      Params:
        adjustment = new scroll adjustment
  
      Deprecated: Use [gid.gtk4.scrollable.Scrollable.setVadjustment]
  */
  void setVadjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_layout_set_vadjustment(cast(GtkLayout*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.layout.Layout]
class LayoutGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /** */
  T height(uint propval) nothrow
  {
    return setProperty("height", propval);
  }

  /** */
  T width(uint propval) nothrow
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [gid.gtk3.layout.Layout]
final class LayoutGidBuilder : LayoutGidBuilderImpl!LayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Layout build() nothrow
  {
    return new Layout(cast(void*)createGObject(Layout._getGType), Yes.Take);
  }
}
