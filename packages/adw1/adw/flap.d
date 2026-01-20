/// Module for [Flap] class
module adw.flap;

import adw.c.functions;
import adw.c.types;
import adw.spring_params;
import adw.swipeable;
import adw.swipeable_mixin;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    An adaptive container acting like a box or an overlay.
    
    <picture>
      <source srcset="flap-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="flap-wide.png" alt="flap-wide">
    </picture>
    <picture>
      <source srcset="flap-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="flap-narrow.png" alt="flap-narrow">
    </picture>
    
    The [adw.flap.Flap] widget can display its children like a [gtk.box.Box] does or
    like a [gtk.overlay.Overlay] does, according to the
    `property@Flap:fold-policy` value.
    
    [adw.flap.Flap] has at most three children: `property@Flap:content`,
    `property@Flap:flap` and `property@Flap:separator`. Content is the primary
    child, flap is displayed next to it when unfolded, or overlays it when
    folded. Flap can be shown or hidden by changing the
    `property@Flap:reveal-flap` value, as well as via swipe gestures if
    `property@Flap:swipe-to-open` and/or `property@Flap:swipe-to-close` are set
    to `TRUE`.
    
    Optionally, a separator can be provided, which would be displayed between
    the content and the flap when there's no shadow to separate them, depending
    on the transition type.
    
    `property@Flap:flap` is transparent by default; add the
    [`.background`](style-classes.html#background) style class to it if this is
    unwanted.
    
    If `property@Flap:modal` is set to `TRUE`, content becomes completely
    inaccessible when the flap is revealed while folded.
    
    The position of the flap and separator children relative to the content is
    determined by orientation, as well as the `property@Flap:flap-position`
    value.
    
    Folding the flap will automatically hide the flap widget, and unfolding it
    will automatically reveal it. If this behavior is not desired, the
    `property@Flap:locked` property can be used to override it.
    
    Common use cases include sidebars, header bars that need to be able to
    overlap the window content (for example, in fullscreen mode) and bottom
    sheets.
    
    ## AdwFlap as GtkBuildable
    
    The [adw.flap.Flap] implementation of the [gtk.buildable.Buildable] interface supports
    setting the flap child by specifying “flap” as the “type” attribute of a
    `<child>` element, and separator by specifying “separator”. Specifying
    “content” child type or omitting it results in setting the content child.
    
    ## CSS nodes
    
    [adw.flap.Flap] has a single CSS node with name `flap`. The node will get the style
    classes `.folded` when it is folded, and `.unfolded` when it's not.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
*/
class Flap : gtk.widget.Widget, adw.swipeable.Swipeable, gtk.orientable.Orientable
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
    return cast(void function())adw_flap_get_type != &gidSymbolNotFound ? adw_flap_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Flap self()
  {
    return this;
  }

  /**
      Get `content` property.
      Returns: The content widget.
        
        It's always displayed when unfolded, and partially visible when folded.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property gtk.widget.Widget content()
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
          
          It's always displayed when unfolded, and partially visible when folded.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void content(gtk.widget.Widget propval)
  {
    return setContent(propval);
  }

  /**
      Get `flap` property.
      Returns: The flap widget.
        
        It's only visible when `property@Flap:reveal-progress` is greater than 0.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property gtk.widget.Widget flap()
  {
    return getFlap();
  }

  /**
      Set `flap` property.
      Params:
        propval = The flap widget.
          
          It's only visible when `property@Flap:reveal-progress` is greater than 0.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void flap(gtk.widget.Widget propval)
  {
    return setFlap(propval);
  }

  /**
      Get `flapPosition` property.
      Returns: The flap position.
        
        If it's set to [gtk.types.PackType.Start], the flap is displayed before the content,
        if [gtk.types.PackType.End], it's displayed after the content.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property gtk.types.PackType flapPosition()
  {
    return getFlapPosition();
  }

  /**
      Set `flapPosition` property.
      Params:
        propval = The flap position.
          
          If it's set to [gtk.types.PackType.Start], the flap is displayed before the content,
          if [gtk.types.PackType.End], it's displayed after the content.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void flapPosition(gtk.types.PackType propval)
  {
    return setFlapPosition(propval);
  }

  /**
      Get `foldDuration` property.
      Returns: The fold transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property uint foldDuration()
  {
    return getFoldDuration();
  }

  /**
      Set `foldDuration` property.
      Params:
        propval = The fold transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void foldDuration(uint propval)
  {
    return setFoldDuration(propval);
  }

  /**
      Get `foldPolicy` property.
      Returns: The fold policy for the flap.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property adw.types.FlapFoldPolicy foldPolicy()
  {
    return getFoldPolicy();
  }

  /**
      Set `foldPolicy` property.
      Params:
        propval = The fold policy for the flap.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void foldPolicy(adw.types.FlapFoldPolicy propval)
  {
    return setFoldPolicy(propval);
  }

  /**
      Get `foldThresholdPolicy` property.
      Returns: Determines when the flap will fold.
        
        If set to [adw.types.FoldThresholdPolicy.Minimum], flap will only fold when
        the children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural],
        it will fold as soon as children don't get their natural size.
        
        This can be useful if you have a long ellipsizing label and want to let it
        ellipsize instead of immediately folding.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property adw.types.FoldThresholdPolicy foldThresholdPolicy()
  {
    return getFoldThresholdPolicy();
  }

  /**
      Set `foldThresholdPolicy` property.
      Params:
        propval = Determines when the flap will fold.
          
          If set to [adw.types.FoldThresholdPolicy.Minimum], flap will only fold when
          the children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural],
          it will fold as soon as children don't get their natural size.
          
          This can be useful if you have a long ellipsizing label and want to let it
          ellipsize instead of immediately folding.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void foldThresholdPolicy(adw.types.FoldThresholdPolicy propval)
  {
    return setFoldThresholdPolicy(propval);
  }

  /**
      Get `folded` property.
      Returns: Whether the flap is currently folded.
        
        See `property@Flap:fold-policy`.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool folded()
  {
    return getFolded();
  }

  /**
      Get `locked` property.
      Returns: Whether the flap is locked.
        
        If `FALSE`, folding when the flap is revealed automatically closes it, and
        unfolding it when the flap is not revealed opens it. If `TRUE`,
        `property@Flap:reveal-flap` value never changes on its own.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool locked()
  {
    return getLocked();
  }

  /**
      Set `locked` property.
      Params:
        propval = Whether the flap is locked.
          
          If `FALSE`, folding when the flap is revealed automatically closes it, and
          unfolding it when the flap is not revealed opens it. If `TRUE`,
          `property@Flap:reveal-flap` value never changes on its own.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void locked(bool propval)
  {
    return setLocked(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the flap is modal.
        
        If `TRUE`, clicking the content widget while flap is revealed, as well as
        pressing the <kbd>Esc</kbd> key, will close the flap. If `FALSE`, clicks
        are passed through to the content widget.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the flap is modal.
          
          If `TRUE`, clicking the content widget while flap is revealed, as well as
          pressing the <kbd>Esc</kbd> key, will close the flap. If `FALSE`, clicks
          are passed through to the content widget.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `revealFlap` property.
      Returns: Whether the flap widget is revealed.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool revealFlap()
  {
    return getRevealFlap();
  }

  /**
      Set `revealFlap` property.
      Params:
        propval = Whether the flap widget is revealed.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void revealFlap(bool propval)
  {
    return setRevealFlap(propval);
  }

  /**
      Get `revealParams` property.
      Returns: The reveal animation spring parameters.
        
        The default value is equivalent to:
        
        ```c
        adw_spring_params_new (1, 0.5, 500)
        ```
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property adw.spring_params.SpringParams revealParams()
  {
    return getRevealParams();
  }

  /**
      Set `revealParams` property.
      Params:
        propval = The reveal animation spring parameters.
          
          The default value is equivalent to:
          
          ```c
          adw_spring_params_new (1, 0.5, 500)
          ```
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void revealParams(adw.spring_params.SpringParams propval)
  {
    return setRevealParams(propval);
  }

  /**
      Get `revealProgress` property.
      Returns: The current reveal transition progress.
        
        0 means fully hidden, 1 means fully revealed.
        
        See `property@Flap:reveal-flap`.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property double revealProgress()
  {
    return getRevealProgress();
  }

  /**
      Get `separator` property.
      Returns: The separator widget.
        
        It's displayed between content and flap when there's no shadow to display.
        When exactly it's visible depends on the `property@Flap:transition-type`
        value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property gtk.widget.Widget separator()
  {
    return getSeparator();
  }

  /**
      Set `separator` property.
      Params:
        propval = The separator widget.
          
          It's displayed between content and flap when there's no shadow to display.
          When exactly it's visible depends on the `property@Flap:transition-type`
          value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void separator(gtk.widget.Widget propval)
  {
    return setSeparator(propval);
  }

  /**
      Get `swipeToClose` property.
      Returns: Whether the flap can be closed with a swipe gesture.
        
        The area that can be swiped depends on the `property@Flap:transition-type`
        value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool swipeToClose()
  {
    return getSwipeToClose();
  }

  /**
      Set `swipeToClose` property.
      Params:
        propval = Whether the flap can be closed with a swipe gesture.
          
          The area that can be swiped depends on the `property@Flap:transition-type`
          value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void swipeToClose(bool propval)
  {
    return setSwipeToClose(propval);
  }

  /**
      Get `swipeToOpen` property.
      Returns: Whether the flap can be opened with a swipe gesture.
        
        The area that can be swiped depends on the `property@Flap:transition-type`
        value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property bool swipeToOpen()
  {
    return getSwipeToOpen();
  }

  /**
      Set `swipeToOpen` property.
      Params:
        propval = Whether the flap can be opened with a swipe gesture.
          
          The area that can be swiped depends on the `property@Flap:transition-type`
          value.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void swipeToOpen(bool propval)
  {
    return setSwipeToOpen(propval);
  }

  /**
      Get `transitionType` property.
      Returns: the type of animation used for reveal and fold transitions.
        
        `property@Flap:flap` is transparent by default, which means the content
        will be seen through it with [adw.types.FlapTransitionType.Over] transitions;
        add the [`.background`](style-classes.html#background) style class to it if
        this is unwanted.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property adw.types.FlapTransitionType transitionType()
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = the type of animation used for reveal and fold transitions.
          
          `property@Flap:flap` is transparent by default, which means the content
          will be seen through it with [adw.types.FlapTransitionType.Over] transitions;
          add the [`.background`](style-classes.html#background) style class to it if
          this is unwanted.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  @property void transitionType(adw.types.FlapTransitionType propval)
  {
    return setTransitionType(propval);
  }

  mixin SwipeableT!();
  mixin OrientableT!();

  /**
      Creates a new [adw.flap.Flap].
      Returns: the newly created [adw.flap.Flap]
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_flap_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the content widget for self.
      Returns: the content widget for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  gtk.widget.Widget getContent()
  {
    GtkWidget* _cretval;
    _cretval = adw_flap_get_content(cast(AdwFlap*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the flap widget for self.
      Returns: the flap widget for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  gtk.widget.Widget getFlap()
  {
    GtkWidget* _cretval;
    _cretval = adw_flap_get_flap(cast(AdwFlap*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the flap position for self.
      Returns: the flap position for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  gtk.types.PackType getFlapPosition()
  {
    GtkPackType _cretval;
    _cretval = adw_flap_get_flap_position(cast(AdwFlap*)this._cPtr);
    gtk.types.PackType _retval = cast(gtk.types.PackType)_cretval;
    return _retval;
  }

  /**
      Gets the fold transition animation duration for self, in milliseconds.
      Returns: the fold transition duration
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  uint getFoldDuration()
  {
    uint _retval;
    _retval = adw_flap_get_fold_duration(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets the fold policy for self.
      Returns: the fold policy for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  adw.types.FlapFoldPolicy getFoldPolicy()
  {
    AdwFlapFoldPolicy _cretval;
    _cretval = adw_flap_get_fold_policy(cast(AdwFlap*)this._cPtr);
    adw.types.FlapFoldPolicy _retval = cast(adw.types.FlapFoldPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the fold threshold policy for self.
      Returns: the fold threshold policy
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  adw.types.FoldThresholdPolicy getFoldThresholdPolicy()
  {
    AdwFoldThresholdPolicy _cretval;
    _cretval = adw_flap_get_fold_threshold_policy(cast(AdwFlap*)this._cPtr);
    adw.types.FoldThresholdPolicy _retval = cast(adw.types.FoldThresholdPolicy)_cretval;
    return _retval;
  }

  /**
      Gets whether self is currently folded.
      
      See `propertyFlap:fold-policy`.
      Returns: `TRUE` if self is currently folded
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getFolded()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_folded(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is locked.
      Returns: `TRUE` if self is locked
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getLocked()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_locked(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is modal.
      Returns: `TRUE` if self is modal
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_modal(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the flap widget is revealed for self.
      Returns: `TRUE` if the flap widget is revealed
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getRevealFlap()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_reveal_flap(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets the reveal animation spring parameters for self.
      Returns: the reveal animation parameters
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  adw.spring_params.SpringParams getRevealParams()
  {
    AdwSpringParams* _cretval;
    _cretval = adw_flap_get_reveal_params(cast(AdwFlap*)this._cPtr);
    auto _retval = _cretval ? new adw.spring_params.SpringParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the current reveal progress for self.
      
      0 means fully hidden, 1 means fully revealed.
      
      See `propertyFlap:reveal-flap`.
      Returns: the current reveal progress for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  double getRevealProgress()
  {
    double _retval;
    _retval = adw_flap_get_reveal_progress(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets the separator widget for self.
      Returns: the separator widget for self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  gtk.widget.Widget getSeparator()
  {
    GtkWidget* _cretval;
    _cretval = adw_flap_get_separator(cast(AdwFlap*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self can be closed with a swipe gesture.
      Returns: `TRUE` if self can be closed with a swipe gesture
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getSwipeToClose()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_swipe_to_close(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can be opened with a swipe gesture.
      Returns: `TRUE` if self can be opened with a swipe gesture
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  bool getSwipeToOpen()
  {
    bool _retval;
    _retval = cast(bool)adw_flap_get_swipe_to_open(cast(AdwFlap*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of animation used for reveal and fold transitions in self.
      Returns: the current transition type of self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  adw.types.FlapTransitionType getTransitionType()
  {
    AdwFlapTransitionType _cretval;
    _cretval = adw_flap_get_transition_type(cast(AdwFlap*)this._cPtr);
    adw.types.FlapTransitionType _retval = cast(adw.types.FlapTransitionType)_cretval;
    return _retval;
  }

  /**
      Sets the content widget for self.
      
      It's always displayed when unfolded, and partially visible when folded.
  
      Params:
        content = the content widget
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setContent(gtk.widget.Widget content = null)
  {
    adw_flap_set_content(cast(AdwFlap*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets the flap widget for self.
      
      It's only visible when `propertyFlap:reveal-progress` is greater than 0.
  
      Params:
        flap = the flap widget
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setFlap(gtk.widget.Widget flap = null)
  {
    adw_flap_set_flap(cast(AdwFlap*)this._cPtr, flap ? cast(GtkWidget*)flap._cPtr(No.Dup) : null);
  }

  /**
      Sets the flap position for self.
      
      If it's set to [gtk.types.PackType.Start], the flap is displayed before the content,
      if [gtk.types.PackType.End], it's displayed after the content.
  
      Params:
        position = the new value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setFlapPosition(gtk.types.PackType position)
  {
    adw_flap_set_flap_position(cast(AdwFlap*)this._cPtr, position);
  }

  /**
      Sets the fold transition animation duration for self, in milliseconds.
  
      Params:
        duration = the new duration, in milliseconds
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setFoldDuration(uint duration)
  {
    adw_flap_set_fold_duration(cast(AdwFlap*)this._cPtr, duration);
  }

  /**
      Sets the fold policy for self.
  
      Params:
        policy = the fold policy
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setFoldPolicy(adw.types.FlapFoldPolicy policy)
  {
    adw_flap_set_fold_policy(cast(AdwFlap*)this._cPtr, policy);
  }

  /**
      Sets the fold threshold policy for self.
      
      If set to [adw.types.FoldThresholdPolicy.Minimum], flap will only fold when the
      children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural], it
      will fold as soon as children don't get their natural size.
      
      This can be useful if you have a long ellipsizing label and want to let it
      ellipsize instead of immediately folding.
  
      Params:
        policy = the policy to use
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setFoldThresholdPolicy(adw.types.FoldThresholdPolicy policy)
  {
    adw_flap_set_fold_threshold_policy(cast(AdwFlap*)this._cPtr, policy);
  }

  /**
      Sets whether self is locked.
      
      If `FALSE`, folding when the flap is revealed automatically closes it, and
      unfolding it when the flap is not revealed opens it. If `TRUE`,
      `propertyFlap:reveal-flap` value never changes on its own.
  
      Params:
        locked = the new value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setLocked(bool locked)
  {
    adw_flap_set_locked(cast(AdwFlap*)this._cPtr, locked);
  }

  /**
      Sets whether self is modal.
      
      If `TRUE`, clicking the content widget while flap is revealed, as well as
      pressing the <kbd>Esc</kbd> key, will close the flap. If `FALSE`, clicks are
      passed through to the content widget.
  
      Params:
        modal = whether self is modal
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setModal(bool modal)
  {
    adw_flap_set_modal(cast(AdwFlap*)this._cPtr, modal);
  }

  /**
      Sets whether the flap widget is revealed for self.
  
      Params:
        revealFlap = whether to reveal the flap widget
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setRevealFlap(bool revealFlap)
  {
    adw_flap_set_reveal_flap(cast(AdwFlap*)this._cPtr, revealFlap);
  }

  /**
      Sets the reveal animation spring parameters for self.
      
      The default value is equivalent to:
      
      ```c
      adw_spring_params_new (1, 0.5, 500)
      ```
  
      Params:
        params = the new parameters
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setRevealParams(adw.spring_params.SpringParams params)
  {
    adw_flap_set_reveal_params(cast(AdwFlap*)this._cPtr, params ? cast(AdwSpringParams*)params._cPtr(No.Dup) : null);
  }

  /**
      Sets the separator widget for self.
      
      It's displayed between content and flap when there's no shadow to display.
      When exactly it's visible depends on the `propertyFlap:transition-type`
      value.
  
      Params:
        separator = the separator widget
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setSeparator(gtk.widget.Widget separator = null)
  {
    adw_flap_set_separator(cast(AdwFlap*)this._cPtr, separator ? cast(GtkWidget*)separator._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self can be closed with a swipe gesture.
      
      The area that can be swiped depends on the `propertyFlap:transition-type`
      value.
  
      Params:
        swipeToClose = whether self can be closed with a swipe gesture
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setSwipeToClose(bool swipeToClose)
  {
    adw_flap_set_swipe_to_close(cast(AdwFlap*)this._cPtr, swipeToClose);
  }

  /**
      Sets whether self can be opened with a swipe gesture.
      
      The area that can be swiped depends on the `propertyFlap:transition-type`
      value.
  
      Params:
        swipeToOpen = whether self can be opened with a swipe gesture
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setSwipeToOpen(bool swipeToOpen)
  {
    adw_flap_set_swipe_to_open(cast(AdwFlap*)this._cPtr, swipeToOpen);
  }

  /**
      Sets the type of animation used for reveal and fold transitions in self.
      
      `propertyFlap:flap` is transparent by default, which means the content will
      be seen through it with [adw.types.FlapTransitionType.Over] transitions; add the
      [`.background`](style-classes.html#background) style class to it if this is
      unwanted.
  
      Params:
        transitionType = the new transition type
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwflap)
  */
  void setTransitionType(adw.types.FlapTransitionType transitionType)
  {
    adw_flap_set_transition_type(cast(AdwFlap*)this._cPtr, transitionType);
  }
}
