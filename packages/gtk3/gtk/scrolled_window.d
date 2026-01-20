/// Module for [ScrolledWindow] class
module gtk.scrolled_window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    GtkScrolledWindow is a container that accepts a single child widget and makes
    that child scrollable using either internally added scrollbars or externally
    associated adjustments.
    
    Widgets with native scrolling support, i.e. those whose classes implement the
    #GtkScrollable interface, are added directly. For other types of widget, the
    class #GtkViewport acts as an adaptor, giving scrollability to other widgets.
    GtkScrolledWindow’s implementation of [gtk.container.Container.add] intelligently
    accounts for whether or not the added child is a #GtkScrollable. If it isn’t,
    #GtkScrolledWindow wraps the child in a #GtkViewport and adds that for you.
    Therefore, you can just add any child widget and not worry about the details.
    
    If [gtk.container.Container.add] has added a #GtkViewport for you, you can remove
    both your added child widget from the #GtkViewport, and the #GtkViewport
    from the GtkScrolledWindow, like this:
    
    ```c
    GtkWidget *scrolled_window = gtk_scrolled_window_new (NULL, NULL);
    GtkWidget *child_widget = gtk_button_new ();
    
    // GtkButton is not a GtkScrollable, so GtkScrolledWindow will automatically
    // add a GtkViewport.
    gtk_container_add (GTK_CONTAINER (scrolled_window),
                       child_widget);
    
    // Either of these will result in child_widget being unparented:
    gtk_container_remove (GTK_CONTAINER (scrolled_window),
                          child_widget);
    // or
    gtk_container_remove (GTK_CONTAINER (scrolled_window),
                          gtk_bin_get_child (GTK_BIN (scrolled_window)));
    ```
    
    Unless #GtkScrolledWindow:policy is GTK_POLICY_NEVER or GTK_POLICY_EXTERNAL,
    GtkScrolledWindow adds internal #GtkScrollbar widgets around its child. The
    scroll position of the child, and if applicable the scrollbars, is controlled
    by the #GtkScrolledWindow:hadjustment and #GtkScrolledWindow:vadjustment
    that are associated with the GtkScrolledWindow. See the docs on #GtkScrollbar
    for the details, but note that the “step_increment” and “page_increment”
    fields are only effective if the policy causes scrollbars to be present.
    
    If a GtkScrolledWindow doesn’t behave quite as you would like, or
    doesn’t have exactly the right layout, it’s very possible to set up
    your own scrolling with #GtkScrollbar and for example a #GtkGrid.
    
    # Touch support
    
    GtkScrolledWindow has built-in support for touch devices. When a
    touchscreen is used, swiping will move the scrolled window, and will
    expose 'kinetic' behavior. This can be turned off with the
    #GtkScrolledWindow:kinetic-scrolling property if it is undesired.
    
    GtkScrolledWindow also displays visual 'overshoot' indication when
    the content is pulled beyond the end, and this situation can be
    captured with the #GtkScrolledWindow::edge-overshot signal.
    
    If no mouse device is present, the scrollbars will overlayed as
    narrow, auto-hiding indicators over the content. If traditional
    scrollbars are desired although no mouse is present, this behaviour
    can be turned off with the #GtkScrolledWindow:overlay-scrolling
    property.
    
    # CSS nodes
    
    GtkScrolledWindow has a main CSS node with name scrolledwindow.
    
    It uses subnodes with names overshoot and undershoot to
    draw the overflow and underflow indications. These nodes get
    the .left, .right, .top or .bottom style class added depending
    on where the indication is drawn.
    
    GtkScrolledWindow also sets the positional style classes (.left,
    .right, .top, .bottom) and style classes related to overlay
    scrolling (.overlay-indicator, .dragging, .hovering) on its scrollbars.
    
    If both scrollbars are visible, the area where they meet is drawn
    with a subnode named junction.
*/
class ScrolledWindow : gtk.bin.Bin
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
    return cast(void function())gtk_scrolled_window_get_type != &gidSymbolNotFound ? gtk_scrolled_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScrolledWindow self()
  {
    return this;
  }

  /** */
  @property gtk.adjustment.Adjustment hadjustment()
  {
    return getHadjustment();
  }

  /** */
  @property void hadjustment(gtk.adjustment.Adjustment propval)
  {
    return setHadjustment(propval);
  }

  /** */
  @property gtk.types.PolicyType hscrollbarPolicy()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.PolicyType)("hscrollbar-policy");
  }

  /** */
  @property void hscrollbarPolicy(gtk.types.PolicyType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.PolicyType)("hscrollbar-policy", propval);
  }

  /**
      Get `kineticScrolling` property.
      Returns: Whether kinetic scrolling is enabled or not. Kinetic scrolling
        only applies to devices with source [gdk.types.InputSource.Touchscreen].
  */
  @property bool kineticScrolling()
  {
    return getKineticScrolling();
  }

  /**
      Set `kineticScrolling` property.
      Params:
        propval = Whether kinetic scrolling is enabled or not. Kinetic scrolling
          only applies to devices with source [gdk.types.InputSource.Touchscreen].
  */
  @property void kineticScrolling(bool propval)
  {
    return setKineticScrolling(propval);
  }

  /**
      Get `maxContentHeight` property.
      Returns: The maximum content height of @scrolled_window, or -1 if not set.
  */
  @property int maxContentHeight()
  {
    return getMaxContentHeight();
  }

  /**
      Set `maxContentHeight` property.
      Params:
        propval = The maximum content height of @scrolled_window, or -1 if not set.
  */
  @property void maxContentHeight(int propval)
  {
    return setMaxContentHeight(propval);
  }

  /**
      Get `maxContentWidth` property.
      Returns: The maximum content width of @scrolled_window, or -1 if not set.
  */
  @property int maxContentWidth()
  {
    return getMaxContentWidth();
  }

  /**
      Set `maxContentWidth` property.
      Params:
        propval = The maximum content width of @scrolled_window, or -1 if not set.
  */
  @property void maxContentWidth(int propval)
  {
    return setMaxContentWidth(propval);
  }

  /**
      Get `minContentHeight` property.
      Returns: The minimum content height of @scrolled_window, or -1 if not set.
  */
  @property int minContentHeight()
  {
    return getMinContentHeight();
  }

  /**
      Set `minContentHeight` property.
      Params:
        propval = The minimum content height of @scrolled_window, or -1 if not set.
  */
  @property void minContentHeight(int propval)
  {
    return setMinContentHeight(propval);
  }

  /**
      Get `minContentWidth` property.
      Returns: The minimum content width of @scrolled_window, or -1 if not set.
  */
  @property int minContentWidth()
  {
    return getMinContentWidth();
  }

  /**
      Set `minContentWidth` property.
      Params:
        propval = The minimum content width of @scrolled_window, or -1 if not set.
  */
  @property void minContentWidth(int propval)
  {
    return setMinContentWidth(propval);
  }

  /**
      Get `overlayScrolling` property.
      Returns: Whether overlay scrolling is enabled or not. If it is, the
        scrollbars are only added as traditional widgets when a mouse
        is present. Otherwise, they are overlayed on top of the content,
        as narrow indicators.
        
        Note that overlay scrolling can also be globally disabled, with
        the #GtkSettings::gtk-overlay-scrolling setting.
  */
  @property bool overlayScrolling()
  {
    return getOverlayScrolling();
  }

  /**
      Set `overlayScrolling` property.
      Params:
        propval = Whether overlay scrolling is enabled or not. If it is, the
          scrollbars are only added as traditional widgets when a mouse
          is present. Otherwise, they are overlayed on top of the content,
          as narrow indicators.
          
          Note that overlay scrolling can also be globally disabled, with
          the #GtkSettings::gtk-overlay-scrolling setting.
  */
  @property void overlayScrolling(bool propval)
  {
    return setOverlayScrolling(propval);
  }

  /**
      Get `propagateNaturalHeight` property.
      Returns: Whether the natural height of the child should be calculated and propagated
        through the scrolled window’s requested natural height.
        
        This is useful in cases where an attempt should be made to allocate exactly
        enough space for the natural size of the child.
  */
  @property bool propagateNaturalHeight()
  {
    return getPropagateNaturalHeight();
  }

  /**
      Set `propagateNaturalHeight` property.
      Params:
        propval = Whether the natural height of the child should be calculated and propagated
          through the scrolled window’s requested natural height.
          
          This is useful in cases where an attempt should be made to allocate exactly
          enough space for the natural size of the child.
  */
  @property void propagateNaturalHeight(bool propval)
  {
    return setPropagateNaturalHeight(propval);
  }

  /**
      Get `propagateNaturalWidth` property.
      Returns: Whether the natural width of the child should be calculated and propagated
        through the scrolled window’s requested natural width.
        
        This is useful in cases where an attempt should be made to allocate exactly
        enough space for the natural size of the child.
  */
  @property bool propagateNaturalWidth()
  {
    return getPropagateNaturalWidth();
  }

  /**
      Set `propagateNaturalWidth` property.
      Params:
        propval = Whether the natural width of the child should be calculated and propagated
          through the scrolled window’s requested natural width.
          
          This is useful in cases where an attempt should be made to allocate exactly
          enough space for the natural size of the child.
  */
  @property void propagateNaturalWidth(bool propval)
  {
    return setPropagateNaturalWidth(propval);
  }

  /** */
  @property gtk.types.ShadowType shadowType()
  {
    return getShadowType();
  }

  /** */
  @property void shadowType(gtk.types.ShadowType propval)
  {
    return setShadowType(propval);
  }

  /** */
  @property gtk.adjustment.Adjustment vadjustment()
  {
    return getVadjustment();
  }

  /** */
  @property void vadjustment(gtk.adjustment.Adjustment propval)
  {
    return setVadjustment(propval);
  }

  /** */
  @property gtk.types.PolicyType vscrollbarPolicy()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.PolicyType)("vscrollbar-policy");
  }

  /** */
  @property void vscrollbarPolicy(gtk.types.PolicyType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.PolicyType)("vscrollbar-policy", propval);
  }

  /** */
  @property gtk.types.CornerType windowPlacement()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.CornerType)("window-placement");
  }

  /** */
  @property void windowPlacement(gtk.types.CornerType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.CornerType)("window-placement", propval);
  }

  /**
      Get `windowPlacementSet` property.
      Returns: Whether "window-placement" should be used to determine the location
        of the contents with respect to the scrollbars.
  
      Deprecated: This value is ignored and
        #GtkScrolledWindow:window-placement value is always honored.
  */
  @property bool windowPlacementSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("window-placement-set");
  }

  /**
      Set `windowPlacementSet` property.
      Params:
        propval = Whether "window-placement" should be used to determine the location
          of the contents with respect to the scrollbars.
  
      Deprecated: This value is ignored and
        #GtkScrolledWindow:window-placement value is always honored.
  */
  @property void windowPlacementSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("window-placement-set", propval);
  }

  /**
      Creates a new scrolled window.
      
      The two arguments are the scrolled window’s adjustments; these will be
      shared with the scrollbars and the child widget to keep the bars in sync
      with the child. Usually you want to pass null for the adjustments, which
      will cause the scrolled window to create them for you.
  
      Params:
        hadjustment = horizontal adjustment
        vadjustment = vertical adjustment
      Returns: a new scrolled window
  */
  this(gtk.adjustment.Adjustment hadjustment = null, gtk.adjustment.Adjustment vadjustment = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_new(hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Used to add children without native scrolling capabilities. This
      is simply a convenience function; it is equivalent to adding the
      unscrollable child to a viewport, then adding the viewport to the
      scrolled window. If a child has native scrolling, use
      [gtk.container.Container.add] instead of this function.
      
      The viewport scrolls the child by moving its #GdkWindow, and takes
      the size of the child to be the size of its toplevel #GdkWindow.
      This will be very wrong for most widgets that support native scrolling;
      for example, if you add a widget such as #GtkTreeView with a viewport,
      the whole widget will scroll, including the column headings. Thus,
      widgets with native scrolling support should not be used with the
      #GtkViewport proxy.
      
      A widget supports scrolling natively if it implements the
      #GtkScrollable interface.
  
      Params:
        child = the widget you want to scroll
  
      Deprecated: [gtk.container.Container.add] will automatically add
        a #GtkViewport if the child doesn’t implement #GtkScrollable.
  */
  void addWithViewport(gtk.widget.Widget child)
  {
    gtk_scrolled_window_add_with_viewport(cast(GtkScrolledWindow*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Return whether button presses are captured during kinetic
      scrolling. See [gtk.scrolled_window.ScrolledWindow.setCaptureButtonPress].
      Returns: true if button presses are captured during kinetic scrolling
  */
  bool getCaptureButtonPress()
  {
    bool _retval;
    _retval = cast(bool)gtk_scrolled_window_get_capture_button_press(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the horizontal scrollbar’s adjustment, used to connect the
      horizontal scrollbar to the child widget’s horizontal scroll
      functionality.
      Returns: the horizontal #GtkAdjustment
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrolled_window_get_hadjustment(cast(GtkScrolledWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the horizontal scrollbar of scrolled_window.
      Returns: the horizontal scrollbar of the scrolled window.
  */
  gtk.widget.Widget getHscrollbar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_get_hscrollbar(cast(GtkScrolledWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the specified kinetic scrolling behavior.
      Returns: the scrolling behavior flags.
  */
  bool getKineticScrolling()
  {
    bool _retval;
    _retval = cast(bool)gtk_scrolled_window_get_kinetic_scrolling(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the maximum content height set.
      Returns: the maximum content height, or -1
  */
  int getMaxContentHeight()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_max_content_height(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the maximum content width set.
      Returns: the maximum content width, or -1
  */
  int getMaxContentWidth()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_max_content_width(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimal content height of scrolled_window, or -1 if not set.
      Returns: the minimal content height
  */
  int getMinContentHeight()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_min_content_height(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum content width of scrolled_window, or -1 if not set.
      Returns: the minimum content width
  */
  int getMinContentWidth()
  {
    int _retval;
    _retval = gtk_scrolled_window_get_min_content_width(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether overlay scrolling is enabled for this scrolled window.
      Returns: true if overlay scrolling is enabled
  */
  bool getOverlayScrolling()
  {
    bool _retval;
    _retval = cast(bool)gtk_scrolled_window_get_overlay_scrolling(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the placement of the contents with respect to the scrollbars
      for the scrolled window. See [gtk.scrolled_window.ScrolledWindow.setPlacement].
      Returns: the current placement value.
        
        See also [gtk.scrolled_window.ScrolledWindow.setPlacement] and
        [gtk.scrolled_window.ScrolledWindow.unsetPlacement].
  */
  gtk.types.CornerType getPlacement()
  {
    GtkCornerType _cretval;
    _cretval = gtk_scrolled_window_get_placement(cast(GtkScrolledWindow*)this._cPtr);
    gtk.types.CornerType _retval = cast(gtk.types.CornerType)_cretval;
    return _retval;
  }

  /**
      Retrieves the current policy values for the horizontal and vertical
      scrollbars. See [gtk.scrolled_window.ScrolledWindow.setPolicy].
  
      Params:
        hscrollbarPolicy = location to store the policy
              for the horizontal scrollbar, or null
        vscrollbarPolicy = location to store the policy
              for the vertical scrollbar, or null
  */
  void getPolicy(out gtk.types.PolicyType hscrollbarPolicy, out gtk.types.PolicyType vscrollbarPolicy)
  {
    gtk_scrolled_window_get_policy(cast(GtkScrolledWindow*)this._cPtr, &hscrollbarPolicy, &vscrollbarPolicy);
  }

  /**
      Reports whether the natural height of the child will be calculated and propagated
      through the scrolled window’s requested natural height.
      Returns: whether natural height propagation is enabled.
  */
  bool getPropagateNaturalHeight()
  {
    bool _retval;
    _retval = cast(bool)gtk_scrolled_window_get_propagate_natural_height(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Reports whether the natural width of the child will be calculated and propagated
      through the scrolled window’s requested natural width.
      Returns: whether natural width propagation is enabled.
  */
  bool getPropagateNaturalWidth()
  {
    bool _retval;
    _retval = cast(bool)gtk_scrolled_window_get_propagate_natural_width(cast(GtkScrolledWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the shadow type of the scrolled window. See
      [gtk.scrolled_window.ScrolledWindow.setShadowType].
      Returns: the current shadow type
  */
  gtk.types.ShadowType getShadowType()
  {
    GtkShadowType _cretval;
    _cretval = gtk_scrolled_window_get_shadow_type(cast(GtkScrolledWindow*)this._cPtr);
    gtk.types.ShadowType _retval = cast(gtk.types.ShadowType)_cretval;
    return _retval;
  }

  /**
      Returns the vertical scrollbar’s adjustment, used to connect the
      vertical scrollbar to the child widget’s vertical scroll functionality.
      Returns: the vertical #GtkAdjustment
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrolled_window_get_vadjustment(cast(GtkScrolledWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the vertical scrollbar of scrolled_window.
      Returns: the vertical scrollbar of the scrolled window.
  */
  gtk.widget.Widget getVscrollbar()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scrolled_window_get_vscrollbar(cast(GtkScrolledWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Changes the behaviour of scrolled_window with regard to the initial
      event that possibly starts kinetic scrolling. When capture_button_press
      is set to true, the event is captured by the scrolled window, and
      then later replayed if it is meant to go to the child widget.
      
      This should be enabled if any child widgets perform non-reversible
      actions on #GtkWidget::button-press-event. If they don't, and handle
      additionally handle #GtkWidget::grab-broken-event, it might be better
      to set capture_button_press to false.
      
      This setting only has an effect if kinetic scrolling is enabled.
  
      Params:
        captureButtonPress = true to capture button presses
  */
  void setCaptureButtonPress(bool captureButtonPress)
  {
    gtk_scrolled_window_set_capture_button_press(cast(GtkScrolledWindow*)this._cPtr, captureButtonPress);
  }

  /**
      Sets the #GtkAdjustment for the horizontal scrollbar.
  
      Params:
        hadjustment = the #GtkAdjustment to use, or null to create a new one
  */
  void setHadjustment(gtk.adjustment.Adjustment hadjustment = null)
  {
    gtk_scrolled_window_set_hadjustment(cast(GtkScrolledWindow*)this._cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null);
  }

  /**
      Turns kinetic scrolling on or off.
      Kinetic scrolling only applies to devices with source
      [gdk.types.InputSource.Touchscreen].
  
      Params:
        kineticScrolling = true to enable kinetic scrolling
  */
  void setKineticScrolling(bool kineticScrolling)
  {
    gtk_scrolled_window_set_kinetic_scrolling(cast(GtkScrolledWindow*)this._cPtr, kineticScrolling);
  }

  /**
      Sets the maximum height that scrolled_window should keep visible. The
      scrolled_window will grow up to this height before it starts scrolling
      the content.
      
      It is a programming error to set the maximum content height to a value
      smaller than #GtkScrolledWindow:min-content-height.
  
      Params:
        height = the maximum content height
  */
  void setMaxContentHeight(int height)
  {
    gtk_scrolled_window_set_max_content_height(cast(GtkScrolledWindow*)this._cPtr, height);
  }

  /**
      Sets the maximum width that scrolled_window should keep visible. The
      scrolled_window will grow up to this width before it starts scrolling
      the content.
      
      It is a programming error to set the maximum content width to a value
      smaller than #GtkScrolledWindow:min-content-width.
  
      Params:
        width = the maximum content width
  */
  void setMaxContentWidth(int width)
  {
    gtk_scrolled_window_set_max_content_width(cast(GtkScrolledWindow*)this._cPtr, width);
  }

  /**
      Sets the minimum height that scrolled_window should keep visible.
      Note that this can and (usually will) be smaller than the minimum
      size of the content.
      
      It is a programming error to set the minimum content height to a
      value greater than #GtkScrolledWindow:max-content-height.
  
      Params:
        height = the minimal content height
  */
  void setMinContentHeight(int height)
  {
    gtk_scrolled_window_set_min_content_height(cast(GtkScrolledWindow*)this._cPtr, height);
  }

  /**
      Sets the minimum width that scrolled_window should keep visible.
      Note that this can and (usually will) be smaller than the minimum
      size of the content.
      
      It is a programming error to set the minimum content width to a
      value greater than #GtkScrolledWindow:max-content-width.
  
      Params:
        width = the minimal content width
  */
  void setMinContentWidth(int width)
  {
    gtk_scrolled_window_set_min_content_width(cast(GtkScrolledWindow*)this._cPtr, width);
  }

  /**
      Enables or disables overlay scrolling for this scrolled window.
  
      Params:
        overlayScrolling = whether to enable overlay scrolling
  */
  void setOverlayScrolling(bool overlayScrolling)
  {
    gtk_scrolled_window_set_overlay_scrolling(cast(GtkScrolledWindow*)this._cPtr, overlayScrolling);
  }

  /**
      Sets the placement of the contents with respect to the scrollbars
      for the scrolled window.
      
      The default is [gtk.types.CornerType.TopLeft], meaning the child is
      in the top left, with the scrollbars underneath and to the right.
      Other values in #GtkCornerType are [gtk.types.CornerType.TopRight],
      [gtk.types.CornerType.BottomLeft], and [gtk.types.CornerType.BottomRight].
      
      See also [gtk.scrolled_window.ScrolledWindow.getPlacement] and
      [gtk.scrolled_window.ScrolledWindow.unsetPlacement].
  
      Params:
        windowPlacement = position of the child window
  */
  void setPlacement(gtk.types.CornerType windowPlacement)
  {
    gtk_scrolled_window_set_placement(cast(GtkScrolledWindow*)this._cPtr, windowPlacement);
  }

  /**
      Sets the scrollbar policy for the horizontal and vertical scrollbars.
      
      The policy determines when the scrollbar should appear; it is a value
      from the #GtkPolicyType enumeration. If [gtk.types.PolicyType.Always], the
      scrollbar is always present; if [gtk.types.PolicyType.Never], the scrollbar is
      never present; if [gtk.types.PolicyType.Automatic], the scrollbar is present only
      if needed (that is, if the slider part of the bar would be smaller
      than the trough — the display is larger than the page size).
  
      Params:
        hscrollbarPolicy = policy for horizontal bar
        vscrollbarPolicy = policy for vertical bar
  */
  void setPolicy(gtk.types.PolicyType hscrollbarPolicy, gtk.types.PolicyType vscrollbarPolicy)
  {
    gtk_scrolled_window_set_policy(cast(GtkScrolledWindow*)this._cPtr, hscrollbarPolicy, vscrollbarPolicy);
  }

  /**
      Sets whether the natural height of the child should be calculated and propagated
      through the scrolled window’s requested natural height.
  
      Params:
        propagate = whether to propagate natural height
  */
  void setPropagateNaturalHeight(bool propagate)
  {
    gtk_scrolled_window_set_propagate_natural_height(cast(GtkScrolledWindow*)this._cPtr, propagate);
  }

  /**
      Sets whether the natural width of the child should be calculated and propagated
      through the scrolled window’s requested natural width.
  
      Params:
        propagate = whether to propagate natural width
  */
  void setPropagateNaturalWidth(bool propagate)
  {
    gtk_scrolled_window_set_propagate_natural_width(cast(GtkScrolledWindow*)this._cPtr, propagate);
  }

  /**
      Changes the type of shadow drawn around the contents of
      scrolled_window.
  
      Params:
        type = kind of shadow to draw around scrolled window contents
  */
  void setShadowType(gtk.types.ShadowType type)
  {
    gtk_scrolled_window_set_shadow_type(cast(GtkScrolledWindow*)this._cPtr, type);
  }

  /**
      Sets the #GtkAdjustment for the vertical scrollbar.
  
      Params:
        vadjustment = the #GtkAdjustment to use, or null to create a new one
  */
  void setVadjustment(gtk.adjustment.Adjustment vadjustment = null)
  {
    gtk_scrolled_window_set_vadjustment(cast(GtkScrolledWindow*)this._cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
  }

  /**
      Unsets the placement of the contents with respect to the scrollbars
      for the scrolled window. If no window placement is set for a scrolled
      window, it defaults to [gtk.types.CornerType.TopLeft].
      
      See also [gtk.scrolled_window.ScrolledWindow.setPlacement] and
      [gtk.scrolled_window.ScrolledWindow.getPlacement].
  */
  void unsetPlacement()
  {
    gtk_scrolled_window_unset_placement(cast(GtkScrolledWindow*)this._cPtr);
  }

  /**
      Connect to `EdgeOvershot` signal.
  
      The ::edge-overshot signal is emitted whenever user initiated scrolling
        makes the scrolled window firmly surpass (i.e. with some edge resistance)
        the lower or upper limits defined by the adjustment in that orientation.
        
        A similar behavior without edge resistance is provided by the
        #GtkScrolledWindow::edge-reached signal.
        
        Note: The pos argument is LTR/RTL aware, so callers should be aware too
        if intending to provide behavior on horizontal edges.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow))
  
          `pos` edge side that was hit (optional)
  
          `scrolledWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEdgeOvershot(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.PositionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.scrolled_window.ScrolledWindow)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edge-overshot", closure, after);
  }

  /**
      Connect to `EdgeReached` signal.
  
      The ::edge-reached signal is emitted whenever user-initiated scrolling
        makes the scrolled window exactly reach the lower or upper limits
        defined by the adjustment in that orientation.
        
        A similar behavior with edge resistance is provided by the
        #GtkScrolledWindow::edge-overshot signal.
        
        Note: The pos argument is LTR/RTL aware, so callers should be aware too
        if intending to provide behavior on horizontal edges.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.PositionType pos, gtk.scrolled_window.ScrolledWindow scrolledWindow))
  
          `pos` edge side that was reached (optional)
  
          `scrolledWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEdgeReached(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.PositionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.scrolled_window.ScrolledWindow)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edge-reached", closure, after);
  }

  /**
      Connect to `MoveFocusOut` signal.
  
      The ::move-focus-out signal is a
        [keybinding signal][GtkBindingSignal] which gets
        emitted when focus is moved away from the scrolled window by a
        keybinding. The #GtkWidget::move-focus signal is emitted with
        direction_type on this scrolled window’s toplevel parent in the
        container hierarchy. The default bindings for this signal are
        `Ctrl + Tab` to move forward and `Ctrl + Shift + Tab` to move backward.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DirectionType directionType, gtk.scrolled_window.ScrolledWindow scrolledWindow))
  
          `directionType` either [gtk.types.DirectionType.TabForward] or
              [gtk.types.DirectionType.TabBackward] (optional)
  
          `scrolledWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveFocusOut(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.scrolled_window.ScrolledWindow)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-focus-out", closure, after);
  }

  /**
      Connect to `ScrollChild` signal.
  
      The ::scroll-child signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when a keybinding that scrolls is pressed.
        The horizontal or vertical adjustment is updated which triggers a
        signal that the scrolled window’s child may listen to and scroll itself.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.ScrollType scroll, bool horizontal, gtk.scrolled_window.ScrolledWindow scrolledWindow))
  
          `scroll` a #GtkScrollType describing how much to scroll (optional)
  
          `horizontal` whether the keybinding scrolls the child
              horizontally or not (optional)
  
          `scrolledWindow` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollChild(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.scrolled_window.ScrolledWindow)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-child", closure, after);
  }
}
