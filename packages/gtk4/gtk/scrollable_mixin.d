/// Module for [Scrollable] interface mixin
module gtk.scrollable_mixin;

public import gid.basictypes;
public import gtk.scrollable_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import gtk.adjustment;
public import gtk.border;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.scrollable.Scrollable] is an interface for widgets with native scrolling ability.
    
    To implement this interface you should override the
    [gtk.scrollable.Scrollable.hadjustment] and
    [gtk.scrollable.Scrollable.vadjustment] properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    - When a parent widget sets the scrollable child widget’s adjustments,
      the widget should connect to the [gtk.adjustment.Adjustment.valueChanged]
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
      to date, for example using [gtk.adjustment.Adjustment.configure].
    
    - When any of the adjustments emits the [gtk.adjustment.Adjustment.valueChanged]
      signal, the scrollable widget should scroll its contents.
*/
template ScrollableT()
{

  /**
      Get `hadjustment` property.
      Returns: Horizontal [gtk.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment hadjustment() nothrow
  {
    return getHadjustment();
  }

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gtk.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gtk.adjustment.Adjustment propval) nothrow
  {
    setHadjustment(propval);
  }

  /**
      Get `hscrollPolicy` property.
      Returns: Determines when horizontal scrolling should start.
  */
  @property gtk.types.ScrollablePolicy hscrollPolicy() nothrow
  {
    return getHscrollPolicy();
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
  */
  @property void hscrollPolicy(gtk.types.ScrollablePolicy propval) nothrow
  {
    setHscrollPolicy(propval);
  }

  /**
      Get `vadjustment` property.
      Returns: Vertical [gtk.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment vadjustment() nothrow
  {
    return getVadjustment();
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gtk.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void vadjustment(gtk.adjustment.Adjustment propval) nothrow
  {
    setVadjustment(propval);
  }

  /**
      Get `vscrollPolicy` property.
      Returns: Determines when vertical scrolling should start.
  */
  @property gtk.types.ScrollablePolicy vscrollPolicy() nothrow
  {
    return getVscrollPolicy();
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
  */
  @property void vscrollPolicy(gtk.types.ScrollablePolicy propval) nothrow
  {
    setVscrollPolicy(propval);
  }

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
  override bool getBorder(out gtk.border.Border border) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scrollable_get_border(cast(GtkScrollable*)this._cPtr, cast(GtkBorder*)&border);
    return _retval;
  }

  /**
      Retrieves the [gtk.adjustment.Adjustment] used for horizontal scrolling.
      Returns: horizontal [gtk.adjustment.Adjustment].
  */
  override gtk.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_hadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal [gtk.types.ScrollablePolicy].
      Returns: The horizontal [gtk.types.ScrollablePolicy].
  */
  override gtk.types.ScrollablePolicy getHscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_hscroll_policy(cast(GtkScrollable*)this._cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gtk.adjustment.Adjustment] used for vertical scrolling.
      Returns: vertical [gtk.adjustment.Adjustment].
  */
  override gtk.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_vadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the vertical [gtk.types.ScrollablePolicy].
      Returns: The vertical [gtk.types.ScrollablePolicy].
  */
  override gtk.types.ScrollablePolicy getVscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_vscroll_policy(cast(GtkScrollable*)this._cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the [gtk.scrollable.Scrollable].
  
      Params:
        hadjustment = a [gtk.adjustment.Adjustment]
  */
  override void setHadjustment(gtk.adjustment.Adjustment hadjustment = null) nothrow
  {
    gtk_scrollable_set_hadjustment(cast(GtkScrollable*)this._cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.types.ScrollablePolicy].
      
      The policy determines whether horizontal scrolling should start
      below the minimum width or below the natural width.
  
      Params:
        policy = the horizontal [gtk.types.ScrollablePolicy]
  */
  override void setHscrollPolicy(gtk.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_hscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }

  /**
      Sets the vertical adjustment of the [gtk.scrollable.Scrollable].
  
      Params:
        vadjustment = a [gtk.adjustment.Adjustment]
  */
  override void setVadjustment(gtk.adjustment.Adjustment vadjustment = null) nothrow
  {
    gtk_scrollable_set_vadjustment(cast(GtkScrollable*)this._cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gtk.types.ScrollablePolicy].
      
      The policy determines whether vertical scrolling should start
      below the minimum height or below the natural height.
  
      Params:
        policy = the vertical [gtk.types.ScrollablePolicy]
  */
  override void setVscrollPolicy(gtk.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_vscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }
}

/// Fluent builder implementation template for [gtk.scrollable.Scrollable]
template ScrollableGidBuilderT()
{

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gtk.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T hadjustment(gtk.adjustment.Adjustment propval) nothrow
  {
    return setProperty("hadjustment", propval);
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T hscrollPolicy(gtk.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("hscroll-policy", propval);
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gtk.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T vadjustment(gtk.adjustment.Adjustment propval) nothrow
  {
    return setProperty("vadjustment", propval);
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T vscrollPolicy(gtk.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("vscroll-policy", propval);
  }
}
