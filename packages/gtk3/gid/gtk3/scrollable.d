/// Module for [Scrollable] interface
module gid.gtk3.scrollable;

public import gid.core.basictypes;
public import gid.gtk3.scrollable_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.border;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    #GtkScrollable is an interface that is implemented by widgets with native
    scrolling ability.
    
    To implement this interface you should override the
    #GtkScrollable:hadjustment and #GtkScrollable:vadjustment properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    - When a parent widget sets the scrollable child widget’s adjustments,
      the widget should populate the adjustments’
      #GtkAdjustment:lower, #GtkAdjustment:upper,
      #GtkAdjustment:step-increment, #GtkAdjustment:page-increment and
      #GtkAdjustment:page-size properties and connect to the
      #GtkAdjustment::value-changed signal.
    
    - Because its preferred size is the size for a fully expanded widget,
      the scrollable widget must be able to cope with underallocations.
      This means that it must accept any value passed to its
      #GtkWidgetClass.size_allocate() function.
    
    - When the parent allocates space to the scrollable child widget,
      the widget should update the adjustments’ properties with new values.
    
    - When any of the adjustments emits the #GtkAdjustment::value-changed signal,
      the scrollable widget should scroll its contents.
*/
interface Scrollable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrollable_get_type != &gidSymbolNotFound ? gtk_scrollable_get_type() : cast(GType)0;
  }

  /**
      Get `hadjustment` property.
      Returns: Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
        shared between the scrollable widget and its parent.
  */
  @property gid.gtk3.adjustment.Adjustment hadjustment() nothrow;

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow;

  /**
      Get `hscrollPolicy` property.
      Returns: Determines whether horizontal scrolling should start once the scrollable
        widget is allocated less than its minimum width or less than its natural width.
  */
  @property gid.gtk3.types.ScrollablePolicy hscrollPolicy() nothrow;

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
  */
  @property void hscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow;

  /**
      Get `vadjustment` property.
      Returns: Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
        between the scrollable widget and its parent.
  */
  @property gid.gtk3.adjustment.Adjustment vadjustment() nothrow;

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
  */
  @property void vadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow;

  /**
      Get `vscrollPolicy` property.
      Returns: Determines whether vertical scrolling should start once the scrollable
        widget is allocated less than its minimum height or less than its natural height.
  */
  @property gid.gtk3.types.ScrollablePolicy vscrollPolicy() nothrow;

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
  */
  @property void vscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow;


  /**
      Returns the size of a non-scrolling border around the
      outside of the scrollable. An example for this would
      be treeview headers. GTK+ can use this information to
      display overlayed graphics, like the overshoot indication,
      at the right position.
  
      Params:
        border = return location for the results
      Returns: true if border has been set
  */
  bool getBorder(out gid.gtk3.border.Border border);

  /**
      Retrieves the #GtkAdjustment used for horizontal scrolling.
      Returns: horizontal #GtkAdjustment.
  */
  gid.gtk3.adjustment.Adjustment getHadjustment();

  /**
      Gets the horizontal #GtkScrollablePolicy.
      Returns: The horizontal #GtkScrollablePolicy.
  */
  gid.gtk3.types.ScrollablePolicy getHscrollPolicy();

  /**
      Retrieves the #GtkAdjustment used for vertical scrolling.
      Returns: vertical #GtkAdjustment.
  */
  gid.gtk3.adjustment.Adjustment getVadjustment();

  /**
      Gets the vertical #GtkScrollablePolicy.
      Returns: The vertical #GtkScrollablePolicy.
  */
  gid.gtk3.types.ScrollablePolicy getVscrollPolicy();

  /**
      Sets the horizontal adjustment of the #GtkScrollable.
  
      Params:
        hadjustment = a #GtkAdjustment
  */
  void setHadjustment(gid.gtk3.adjustment.Adjustment hadjustment = null);

  /**
      Sets the #GtkScrollablePolicy to determine whether
      horizontal scrolling should start below the minimum width or
      below the natural width.
  
      Params:
        policy = the horizontal #GtkScrollablePolicy
  */
  void setHscrollPolicy(gid.gtk3.types.ScrollablePolicy policy);

  /**
      Sets the vertical adjustment of the #GtkScrollable.
  
      Params:
        vadjustment = a #GtkAdjustment
  */
  void setVadjustment(gid.gtk3.adjustment.Adjustment vadjustment = null);

  /**
      Sets the #GtkScrollablePolicy to determine whether
      vertical scrolling should start below the minimum height or
      below the natural height.
  
      Params:
        policy = the vertical #GtkScrollablePolicy
  */
  void setVscrollPolicy(gid.gtk3.types.ScrollablePolicy policy);
}

/// Fluent builder implementation template for [gid.gtk3.scrollable.Scrollable]
interface ScrollableGidBuilderImpl(T)
{

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T hadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow;

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
      Returns: Builder instance for fluent chaining
  */
  T hscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow;

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T vadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow;

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
      Returns: Builder instance for fluent chaining
  */
  T vscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow;
}
