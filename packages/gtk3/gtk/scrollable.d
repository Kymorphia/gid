/// Module for [Scrollable] interface
module gtk.scrollable;

public import gtk.scrollable_iface_proxy;
import gid.gid;
import gobject.object;
import gtk.adjustment;
import gtk.border;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    #GtkScrollable is an interface that is implemented by widgets with native
    scrolling ability.
    
    To implement this interface you should override the
    #GtkScrollable:hadjustment and #GtkScrollable:vadjustment properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    $(LIST
      * When a parent widget sets the scrollable child widget’s adjustments,
        the widget should populate the adjustments’
        #GtkAdjustment:lower, #GtkAdjustment:upper,
        #GtkAdjustment:step-increment, #GtkAdjustment:page-increment and
        #GtkAdjustment:page-size properties and connect to the
        #GtkAdjustment::value-changed signal.
      
      * Because its preferred size is the size for a fully expanded widget,
        the scrollable widget must be able to cope with underallocations.
        This means that it must accept any value passed to its
        #GtkWidgetClass.size_allocate() function.
      
      * When the parent allocates space to the scrollable child widget,
        the widget should update the adjustments’ properties with new values.
      
      * When any of the adjustments emits the #GtkAdjustment::value-changed signal,
        the scrollable widget should scroll its contents.
    )
*/
interface Scrollable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scrollable_get_type != &gidSymbolNotFound ? gtk_scrollable_get_type() : cast(GType)0;
  }

  /**
      Get `hadjustment` property.
      Returns: Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
        shared between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment hadjustment();

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gtk.adjustment.Adjustment propval);

  /**
      Get `hscrollPolicy` property.
      Returns: Determines whether horizontal scrolling should start once the scrollable
        widget is allocated less than its minimum width or less than its natural width.
  */
  @property gtk.types.ScrollablePolicy hscrollPolicy();

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
  */
  @property void hscrollPolicy(gtk.types.ScrollablePolicy propval);

  /**
      Get `vadjustment` property.
      Returns: Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
        between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment vadjustment();

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
  */
  @property void vadjustment(gtk.adjustment.Adjustment propval);

  /**
      Get `vscrollPolicy` property.
      Returns: Determines whether vertical scrolling should start once the scrollable
        widget is allocated less than its minimum height or less than its natural height.
  */
  @property gtk.types.ScrollablePolicy vscrollPolicy();

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
  */
  @property void vscrollPolicy(gtk.types.ScrollablePolicy propval);

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
  bool getBorder(out gtk.border.Border border);

  /**
      Retrieves the #GtkAdjustment used for horizontal scrolling.
      Returns: horizontal #GtkAdjustment.
  */
  gtk.adjustment.Adjustment getHadjustment();

  /**
      Gets the horizontal #GtkScrollablePolicy.
      Returns: The horizontal #GtkScrollablePolicy.
  */
  gtk.types.ScrollablePolicy getHscrollPolicy();

  /**
      Retrieves the #GtkAdjustment used for vertical scrolling.
      Returns: vertical #GtkAdjustment.
  */
  gtk.adjustment.Adjustment getVadjustment();

  /**
      Gets the vertical #GtkScrollablePolicy.
      Returns: The vertical #GtkScrollablePolicy.
  */
  gtk.types.ScrollablePolicy getVscrollPolicy();

  /**
      Sets the horizontal adjustment of the #GtkScrollable.
  
      Params:
        hadjustment = a #GtkAdjustment
  */
  void setHadjustment(gtk.adjustment.Adjustment hadjustment = null);

  /**
      Sets the #GtkScrollablePolicy to determine whether
      horizontal scrolling should start below the minimum width or
      below the natural width.
  
      Params:
        policy = the horizontal #GtkScrollablePolicy
  */
  void setHscrollPolicy(gtk.types.ScrollablePolicy policy);

  /**
      Sets the vertical adjustment of the #GtkScrollable.
  
      Params:
        vadjustment = a #GtkAdjustment
  */
  void setVadjustment(gtk.adjustment.Adjustment vadjustment = null);

  /**
      Sets the #GtkScrollablePolicy to determine whether
      vertical scrolling should start below the minimum height or
      below the natural height.
  
      Params:
        policy = the vertical #GtkScrollablePolicy
  */
  void setVscrollPolicy(gtk.types.ScrollablePolicy policy);
}
