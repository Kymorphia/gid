/// Module for [Carousel] class
module adw.carousel;

import adw.c.functions;
import adw.c.types;
import adw.spring_params;
import adw.swipeable;
import adw.swipeable_mixin;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.widget;

/**
    A paginated scrolling widget.
    
    <picture>
      <source srcset="carousel-dark.png" media="(prefers-color-scheme: dark)">
      <img src="carousel.png" alt="carousel">
    </picture>
    
    The [adw.carousel.Carousel] widget can be used to display a set of pages with
    swipe-based navigation between them.
    
    `class@CarouselIndicatorDots` and `class@CarouselIndicatorLines` can be used
    to provide page indicators for [adw.carousel.Carousel].
    
    ## CSS nodes
    
    [adw.carousel.Carousel] has a single CSS node with name `carousel`.
*/
class Carousel : gtk.widget.Widget, adw.swipeable.Swipeable, gtk.orientable.Orientable
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
    return cast(void function())adw_carousel_get_type != &gidSymbolNotFound ? adw_carousel_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Carousel self()
  {
    return this;
  }

  /**
      Get `allowLongSwipes` property.
      Returns: Whether to allow swiping for more than one page at a time.
      
      If the value is `FALSE`, each swipe can only move to the adjacent pages.
  */
  @property bool allowLongSwipes()
  {
    return getAllowLongSwipes();
  }

  /**
      Set `allowLongSwipes` property.
      Params:
        propval = Whether to allow swiping for more than one page at a time.
        
        If the value is `FALSE`, each swipe can only move to the adjacent pages.
  */
  @property void allowLongSwipes(bool propval)
  {
    return setAllowLongSwipes(propval);
  }

  /**
      Get `allowMouseDrag` property.
      Returns: Sets whether the [adw.carousel.Carousel] can be dragged with mouse pointer.
      
      If the value is `FALSE`, dragging is only available on touch.
  */
  @property bool allowMouseDrag()
  {
    return getAllowMouseDrag();
  }

  /**
      Set `allowMouseDrag` property.
      Params:
        propval = Sets whether the [adw.carousel.Carousel] can be dragged with mouse pointer.
        
        If the value is `FALSE`, dragging is only available on touch.
  */
  @property void allowMouseDrag(bool propval)
  {
    return setAllowMouseDrag(propval);
  }

  /**
      Get `allowScrollWheel` property.
      Returns: Whether the widget will respond to scroll wheel events.
      
      If the value is `FALSE`, wheel events will be ignored.
  */
  @property bool allowScrollWheel()
  {
    return getAllowScrollWheel();
  }

  /**
      Set `allowScrollWheel` property.
      Params:
        propval = Whether the widget will respond to scroll wheel events.
        
        If the value is `FALSE`, wheel events will be ignored.
  */
  @property void allowScrollWheel(bool propval)
  {
    return setAllowScrollWheel(propval);
  }

  /**
      Get `interactive` property.
      Returns: Whether the carousel can be navigated.
      
      This can be used to temporarily disable the carousel to only allow
      navigating it in a certain state.
  */
  @property bool interactive()
  {
    return getInteractive();
  }

  /**
      Set `interactive` property.
      Params:
        propval = Whether the carousel can be navigated.
        
        This can be used to temporarily disable the carousel to only allow
        navigating it in a certain state.
  */
  @property void interactive(bool propval)
  {
    return setInteractive(propval);
  }

  /**
      Get `nPages` property.
      Returns: The number of pages in a [adw.carousel.Carousel].
  */
  @property uint nPages()
  {
    return getNPages();
  }

  /**
      Get `position` property.
      Returns: Current scrolling position, unitless.
      
      1 matches 1 page. Use [adw.carousel.Carousel.scrollTo] for changing it.
  */
  @property double position()
  {
    return getPosition();
  }

  /**
      Get `revealDuration` property.
      Returns: Page reveal duration, in milliseconds.
      
      Reveal duration is used when animating adding or removing pages.
  */
  @property uint revealDuration()
  {
    return getRevealDuration();
  }

  /**
      Set `revealDuration` property.
      Params:
        propval = Page reveal duration, in milliseconds.
        
        Reveal duration is used when animating adding or removing pages.
  */
  @property void revealDuration(uint propval)
  {
    return setRevealDuration(propval);
  }

  /**
      Get `scrollParams` property.
      Returns: Scroll animation spring parameters.
      
      The default value is equivalent to:
      
      ```c
      adw_spring_params_new (1, 0.5, 500)
      ```
  */
  @property adw.spring_params.SpringParams scrollParams()
  {
    return getScrollParams();
  }

  /**
      Set `scrollParams` property.
      Params:
        propval = Scroll animation spring parameters.
        
        The default value is equivalent to:
        
        ```c
        adw_spring_params_new (1, 0.5, 500)
        ```
  */
  @property void scrollParams(adw.spring_params.SpringParams propval)
  {
    return setScrollParams(propval);
  }

  /**
      Get `spacing` property.
      Returns: Spacing between pages in pixels.
  */
  @property uint spacing()
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = Spacing between pages in pixels.
  */
  @property void spacing(uint propval)
  {
    return setSpacing(propval);
  }

  mixin SwipeableT!();
  mixin OrientableT!();

  /**
      Creates a new [adw.carousel.Carousel].
      Returns: the newly created [adw.carousel.Carousel]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_new();
    this(_cretval, No.Take);
  }

  /**
      Appends child to self.
  
      Params:
        child = a widget to add
  */
  void append(gtk.widget.Widget child)
  {
    adw_carousel_append(cast(AdwCarousel*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets whether to allow swiping for more than one page at a time.
      Returns: `TRUE` if long swipes are allowed
  */
  bool getAllowLongSwipes()
  {
    bool _retval;
    _retval = cast(bool)adw_carousel_get_allow_long_swipes(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether self can be dragged with mouse pointer.
      Returns: whether self can be dragged with mouse pointer
  */
  bool getAllowMouseDrag()
  {
    bool _retval;
    _retval = cast(bool)adw_carousel_get_allow_mouse_drag(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self will respond to scroll wheel events.
      Returns: `TRUE` if self will respond to scroll wheel events
  */
  bool getAllowScrollWheel()
  {
    bool _retval;
    _retval = cast(bool)adw_carousel_get_allow_scroll_wheel(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can be navigated.
      Returns: whether self can be navigated
  */
  bool getInteractive()
  {
    bool _retval;
    _retval = cast(bool)adw_carousel_get_interactive(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of pages in self.
      Returns: the number of pages in self
  */
  uint getNPages()
  {
    uint _retval;
    _retval = adw_carousel_get_n_pages(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page at position `n`.
  
      Params:
        n = index of the page
      Returns: the page
  */
  gtk.widget.Widget getNthPage(uint n)
  {
    GtkWidget* _cretval;
    _cretval = adw_carousel_get_nth_page(cast(AdwCarousel*)this._cPtr, n);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets current scroll position in self, unitless.
      
      1 matches 1 page. Use [adw.carousel.Carousel.scrollTo] for changing it.
      Returns: the scroll position
  */
  double getPosition()
  {
    double _retval;
    _retval = adw_carousel_get_position(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page reveal duration, in milliseconds.
      Returns: the duration
  */
  uint getRevealDuration()
  {
    uint _retval;
    _retval = adw_carousel_get_reveal_duration(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Gets the scroll animation spring parameters for self.
      Returns: the animation parameters
  */
  adw.spring_params.SpringParams getScrollParams()
  {
    AdwSpringParams* _cretval;
    _cretval = adw_carousel_get_scroll_params(cast(AdwCarousel*)this._cPtr);
    auto _retval = _cretval ? new adw.spring_params.SpringParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets spacing between pages in pixels.
      Returns: spacing between pages
  */
  uint getSpacing()
  {
    uint _retval;
    _retval = adw_carousel_get_spacing(cast(AdwCarousel*)this._cPtr);
    return _retval;
  }

  /**
      Inserts child into self at position position.
      
      If position is -1, or larger than the number of pages,
      child will be appended to the end.
  
      Params:
        child = a widget to add
        position = the position to insert child at
  */
  void insert(gtk.widget.Widget child, int position)
  {
    adw_carousel_insert(cast(AdwCarousel*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Prepends child to self.
  
      Params:
        child = a widget to add
  */
  void prepend(gtk.widget.Widget child)
  {
    adw_carousel_prepend(cast(AdwCarousel*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes child from self.
  
      Params:
        child = a widget to remove
  */
  void remove(gtk.widget.Widget child)
  {
    adw_carousel_remove(cast(AdwCarousel*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Moves child into position position.
      
      If position is -1, or larger than the number of pages, child will be moved
      at the end.
  
      Params:
        child = a widget to add
        position = the position to move child to
  */
  void reorder(gtk.widget.Widget child, int position)
  {
    adw_carousel_reorder(cast(AdwCarousel*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Scrolls to widget.
      
      If animate is `TRUE`, the transition will be animated.
  
      Params:
        widget = a child of self
        animate = whether to animate the transition
  */
  void scrollTo(gtk.widget.Widget widget, bool animate)
  {
    adw_carousel_scroll_to(cast(AdwCarousel*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, animate);
  }

  /**
      Sets whether to allow swiping for more than one page at a time.
      
      If allow_long_swipes is `FALSE`, each swipe can only move to the adjacent
      pages.
  
      Params:
        allowLongSwipes = whether to allow long swipes
  */
  void setAllowLongSwipes(bool allowLongSwipes)
  {
    adw_carousel_set_allow_long_swipes(cast(AdwCarousel*)this._cPtr, allowLongSwipes);
  }

  /**
      Sets whether self can be dragged with mouse pointer.
      
      If allow_mouse_drag is `FALSE`, dragging is only available on touch.
  
      Params:
        allowMouseDrag = whether self can be dragged with mouse pointer
  */
  void setAllowMouseDrag(bool allowMouseDrag)
  {
    adw_carousel_set_allow_mouse_drag(cast(AdwCarousel*)this._cPtr, allowMouseDrag);
  }

  /**
      Sets whether self will respond to scroll wheel events.
      
      If allow_scroll_wheel is `FALSE`, wheel events will be ignored.
  
      Params:
        allowScrollWheel = whether self will respond to scroll wheel events
  */
  void setAllowScrollWheel(bool allowScrollWheel)
  {
    adw_carousel_set_allow_scroll_wheel(cast(AdwCarousel*)this._cPtr, allowScrollWheel);
  }

  /**
      Sets whether self can be navigated.
      
      This can be used to temporarily disable the carousel to only allow navigating
      it in a certain state.
  
      Params:
        interactive = whether self can be navigated
  */
  void setInteractive(bool interactive)
  {
    adw_carousel_set_interactive(cast(AdwCarousel*)this._cPtr, interactive);
  }

  /**
      Sets the page reveal duration, in milliseconds.
      
      Reveal duration is used when animating adding or removing pages.
  
      Params:
        revealDuration = the new reveal duration value
  */
  void setRevealDuration(uint revealDuration)
  {
    adw_carousel_set_reveal_duration(cast(AdwCarousel*)this._cPtr, revealDuration);
  }

  /**
      Sets the scroll animation spring parameters for self.
      
      The default value is equivalent to:
      
      ```c
      adw_spring_params_new (1, 0.5, 500)
      ```
  
      Params:
        params = the new parameters
  */
  void setScrollParams(adw.spring_params.SpringParams params)
  {
    adw_carousel_set_scroll_params(cast(AdwCarousel*)this._cPtr, params ? cast(AdwSpringParams*)params._cPtr(No.Dup) : null);
  }

  /**
      Sets spacing between pages in pixels.
  
      Params:
        spacing = the new spacing value
  */
  void setSpacing(uint spacing)
  {
    adw_carousel_set_spacing(cast(AdwCarousel*)this._cPtr, spacing);
  }

  /**
      Connect to `PageChanged` signal.
  
      This signal is emitted after a page has been changed.
      
      It can be used to implement "infinite scrolling" by amending the pages
      after every scroll.
      
      ::: note
          An empty carousel is indicated by `(int)index == -1`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint index, adw.carousel.Carousel carousel))
  
          `index` current page (optional)
  
          `carousel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPageChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.carousel.Carousel)))
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
    return connectSignalClosure("page-changed", closure, after);
  }
}
