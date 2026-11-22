/// Module for [Scrollable] interface mixin
module gid.gtk3.scrollable_mixin;

public import gid.core.basictypes;
public import gid.gtk3.scrollable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.adjustment;
public import gid.gtk3.border;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;

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
template ScrollableT()
{

  /**
      Get `hadjustment` property.
      Returns: Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
        shared between the scrollable widget and its parent.
  */
  @property gid.gtk3.adjustment.Adjustment hadjustment() nothrow
  {
    return getHadjustment();
  }

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    setHadjustment(propval);
  }

  /**
      Get `hscrollPolicy` property.
      Returns: Determines whether horizontal scrolling should start once the scrollable
        widget is allocated less than its minimum width or less than its natural width.
  */
  @property gid.gtk3.types.ScrollablePolicy hscrollPolicy() nothrow
  {
    return getHscrollPolicy();
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
  */
  @property void hscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow
  {
    setHscrollPolicy(propval);
  }

  /**
      Get `vadjustment` property.
      Returns: Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
        between the scrollable widget and its parent.
  */
  @property gid.gtk3.adjustment.Adjustment vadjustment() nothrow
  {
    return getVadjustment();
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
  */
  @property void vadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    setVadjustment(propval);
  }

  /**
      Get `vscrollPolicy` property.
      Returns: Determines whether vertical scrolling should start once the scrollable
        widget is allocated less than its minimum height or less than its natural height.
  */
  @property gid.gtk3.types.ScrollablePolicy vscrollPolicy() nothrow
  {
    return getVscrollPolicy();
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
  */
  @property void vscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow
  {
    setVscrollPolicy(propval);
  }

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
  override bool getBorder(out gid.gtk3.border.Border border) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scrollable_get_border(cast(GtkScrollable*)this._cPtr, cast(GtkBorder*)&border);
    return _retval;
  }

  /**
      Retrieves the #GtkAdjustment used for horizontal scrolling.
      Returns: horizontal #GtkAdjustment.
  */
  override gid.gtk3.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_hadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal #GtkScrollablePolicy.
      Returns: The horizontal #GtkScrollablePolicy.
  */
  override gid.gtk3.types.ScrollablePolicy getHscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_hscroll_policy(cast(GtkScrollable*)this._cPtr);
    gid.gtk3.types.ScrollablePolicy _retval = cast(gid.gtk3.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the #GtkAdjustment used for vertical scrolling.
      Returns: vertical #GtkAdjustment.
  */
  override gid.gtk3.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_vadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the vertical #GtkScrollablePolicy.
      Returns: The vertical #GtkScrollablePolicy.
  */
  override gid.gtk3.types.ScrollablePolicy getVscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_vscroll_policy(cast(GtkScrollable*)this._cPtr);
    gid.gtk3.types.ScrollablePolicy _retval = cast(gid.gtk3.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the #GtkScrollable.
  
      Params:
        hadjustment = a #GtkAdjustment
  */
  override void setHadjustment(gid.gtk3.adjustment.Adjustment hadjustment = null) nothrow
  {
    gtk_scrollable_set_hadjustment(cast(GtkScrollable*)this._cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkScrollablePolicy to determine whether
      horizontal scrolling should start below the minimum width or
      below the natural width.
  
      Params:
        policy = the horizontal #GtkScrollablePolicy
  */
  override void setHscrollPolicy(gid.gtk3.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_hscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }

  /**
      Sets the vertical adjustment of the #GtkScrollable.
  
      Params:
        vadjustment = a #GtkAdjustment
  */
  override void setVadjustment(gid.gtk3.adjustment.Adjustment vadjustment = null) nothrow
  {
    gtk_scrollable_set_vadjustment(cast(GtkScrollable*)this._cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkScrollablePolicy to determine whether
      vertical scrolling should start below the minimum height or
      below the natural height.
  
      Params:
        policy = the vertical #GtkScrollablePolicy
  */
  override void setVscrollPolicy(gid.gtk3.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_vscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }
}

/// Fluent builder implementation template for [gid.gtk3.scrollable.Scrollable]
template ScrollableGidBuilderT()
{

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T hadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    return setProperty("hadjustment", propval);
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
      Returns: Builder instance for fluent chaining
  */
  T hscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("hscroll-policy", propval);
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T vadjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    return setProperty("vadjustment", propval);
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
      Returns: Builder instance for fluent chaining
  */
  T vscrollPolicy(gid.gtk3.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("vscroll-policy", propval);
  }
}
