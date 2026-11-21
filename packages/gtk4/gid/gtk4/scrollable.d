/// Module for [Scrollable] interface
module gid.gtk4.scrollable;

public import gid.core.basictypes;
public import gid.gtk4.scrollable_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.adjustment;
import gid.gtk4.border;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for widgets with native scrolling ability.
    
    To implement this interface you should override the
    [gid.gtk4.scrollable.Scrollable.hadjustment] and
    [gid.gtk4.scrollable.Scrollable.vadjustment] properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    - When a parent widget sets the scrollable child widget’s adjustments,
      the widget should connect to the [gid.gtk4.adjustment.Adjustment.valueChanged]
      signal. The child widget should then populate the adjustments’ properties
      as soon as possible, which usually means queueing an allocation right away
      and populating the properties in the `vfunc@Gtk.Widget.size_allocate`
      implementation.
    
    - Because its preferred size is the size for a fully expanded widget,
      the scrollable widget must be able to cope with underallocations.
      This means that it must accept any value passed to its
      `vfunc@Gtk.Widget.size_allocate` implementation.
    
    - When the parent allocates space to the scrollable child widget,
      the widget must ensure the adjustments’ property values are correct and up
      to date, for example using [gid.gtk4.adjustment.Adjustment.configure].
    
    - When any of the adjustments emits the [gid.gtk4.adjustment.Adjustment.valueChanged]
      signal, the scrollable widget should scroll its contents.
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
      Returns: Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gid.gtk4.adjustment.Adjustment hadjustment() nothrow;

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow;

  /**
      Get `hscrollPolicy` property.
      Returns: Determines when horizontal scrolling should start.
  */
  @property gid.gtk4.types.ScrollablePolicy hscrollPolicy() nothrow;

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
  */
  @property void hscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow;

  /**
      Get `vadjustment` property.
      Returns: Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gid.gtk4.adjustment.Adjustment vadjustment() nothrow;

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void vadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow;

  /**
      Get `vscrollPolicy` property.
      Returns: Determines when vertical scrolling should start.
  */
  @property gid.gtk4.types.ScrollablePolicy vscrollPolicy() nothrow;

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
  */
  @property void vscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow;

  /**
      Returns the size of a non-scrolling border around the
      outside of the scrollable.
      
      An example for this would be treeview headers. GTK can use
      this information to display overlaid graphics, like the
      overshoot indication, at the right position.
  
      Params:
        border = return location for the results
      Returns: true if border has been set
  */
  bool getBorder(out gid.gtk4.border.Border border);

  /**
      Retrieves the [gid.gtk4.adjustment.Adjustment] used for horizontal scrolling.
      Returns: horizontal [gid.gtk4.adjustment.Adjustment].
  */
  gid.gtk4.adjustment.Adjustment getHadjustment();

  /**
      Gets the horizontal [gid.gtk4.types.ScrollablePolicy].
      Returns: The horizontal [gid.gtk4.types.ScrollablePolicy].
  */
  gid.gtk4.types.ScrollablePolicy getHscrollPolicy();

  /**
      Retrieves the [gid.gtk4.adjustment.Adjustment] used for vertical scrolling.
      Returns: vertical [gid.gtk4.adjustment.Adjustment].
  */
  gid.gtk4.adjustment.Adjustment getVadjustment();

  /**
      Gets the vertical [gid.gtk4.types.ScrollablePolicy].
      Returns: The vertical [gid.gtk4.types.ScrollablePolicy].
  */
  gid.gtk4.types.ScrollablePolicy getVscrollPolicy();

  /**
      Sets the horizontal adjustment of the [gid.gtk4.scrollable.Scrollable].
  
      Params:
        hadjustment = a [gid.gtk4.adjustment.Adjustment]
  */
  void setHadjustment(gid.gtk4.adjustment.Adjustment hadjustment = null);

  /**
      Sets the [gid.gtk4.types.ScrollablePolicy].
      
      The policy determines whether horizontal scrolling should start
      below the minimum width or below the natural width.
  
      Params:
        policy = the horizontal [gid.gtk4.types.ScrollablePolicy]
  */
  void setHscrollPolicy(gid.gtk4.types.ScrollablePolicy policy);

  /**
      Sets the vertical adjustment of the [gid.gtk4.scrollable.Scrollable].
  
      Params:
        vadjustment = a [gid.gtk4.adjustment.Adjustment]
  */
  void setVadjustment(gid.gtk4.adjustment.Adjustment vadjustment = null);

  /**
      Sets the [gid.gtk4.types.ScrollablePolicy].
      
      The policy determines whether vertical scrolling should start
      below the minimum height or below the natural height.
  
      Params:
        policy = the vertical [gid.gtk4.types.ScrollablePolicy]
  */
  void setVscrollPolicy(gid.gtk4.types.ScrollablePolicy policy);
}

/// Fluent builder implementation template for [gid.gtk4.scrollable.Scrollable]
interface ScrollableGidBuilderImpl(T)
{

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T hadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow;

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T hscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow;

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T vadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow;

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T vscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow;
}
