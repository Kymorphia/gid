/// Module for [Scrollable] interface mixin
module gtk.scrollable_mixin;

public import gtk.scrollable_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gtk.adjustment;
public import gtk.border;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

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
template ScrollableT()
{

  /**
      Get `hadjustment` property.
      Returns: Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
        shared between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment hadjustment()
  {
    return getHadjustment();
  }

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal #GtkAdjustment of the scrollable widget. This adjustment is
          shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gtk.adjustment.Adjustment propval)
  {
    return setHadjustment(propval);
  }

  /**
      Get `hscrollPolicy` property.
      Returns: Determines whether horizontal scrolling should start once the scrollable
        widget is allocated less than its minimum width or less than its natural width.
  */
  @property gtk.types.ScrollablePolicy hscrollPolicy()
  {
    return getHscrollPolicy();
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines whether horizontal scrolling should start once the scrollable
          widget is allocated less than its minimum width or less than its natural width.
  */
  @property void hscrollPolicy(gtk.types.ScrollablePolicy propval)
  {
    return setHscrollPolicy(propval);
  }

  /**
      Get `vadjustment` property.
      Returns: Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
        between the scrollable widget and its parent.
  */
  @property gtk.adjustment.Adjustment vadjustment()
  {
    return getVadjustment();
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Verical #GtkAdjustment of the scrollable widget. This adjustment is shared
          between the scrollable widget and its parent.
  */
  @property void vadjustment(gtk.adjustment.Adjustment propval)
  {
    return setVadjustment(propval);
  }

  /**
      Get `vscrollPolicy` property.
      Returns: Determines whether vertical scrolling should start once the scrollable
        widget is allocated less than its minimum height or less than its natural height.
  */
  @property gtk.types.ScrollablePolicy vscrollPolicy()
  {
    return getVscrollPolicy();
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines whether vertical scrolling should start once the scrollable
          widget is allocated less than its minimum height or less than its natural height.
  */
  @property void vscrollPolicy(gtk.types.ScrollablePolicy propval)
  {
    return setVscrollPolicy(propval);
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
  override bool getBorder(out gtk.border.Border border)
  {
    bool _retval;
    _retval = cast(bool)gtk_scrollable_get_border(cast(GtkScrollable*)this._cPtr, cast(GtkBorder*)&border);
    return _retval;
  }

  /**
      Retrieves the #GtkAdjustment used for horizontal scrolling.
      Returns: horizontal #GtkAdjustment.
  */
  override gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_hadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal #GtkScrollablePolicy.
      Returns: The horizontal #GtkScrollablePolicy.
  */
  override gtk.types.ScrollablePolicy getHscrollPolicy()
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_hscroll_policy(cast(GtkScrollable*)this._cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the #GtkAdjustment used for vertical scrolling.
      Returns: vertical #GtkAdjustment.
  */
  override gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_vadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the vertical #GtkScrollablePolicy.
      Returns: The vertical #GtkScrollablePolicy.
  */
  override gtk.types.ScrollablePolicy getVscrollPolicy()
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_vscroll_policy(cast(GtkScrollable*)this._cPtr);
    gtk.types.ScrollablePolicy _retval = cast(gtk.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the #GtkScrollable.
  
      Params:
        hadjustment = a #GtkAdjustment
  */
  override void setHadjustment(gtk.adjustment.Adjustment hadjustment = null)
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
  override void setHscrollPolicy(gtk.types.ScrollablePolicy policy)
  {
    gtk_scrollable_set_hscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }

  /**
      Sets the vertical adjustment of the #GtkScrollable.
  
      Params:
        vadjustment = a #GtkAdjustment
  */
  override void setVadjustment(gtk.adjustment.Adjustment vadjustment = null)
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
  override void setVscrollPolicy(gtk.types.ScrollablePolicy policy)
  {
    gtk_scrollable_set_vscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }
}
