/// Module for [Leaflet] class
module adw.leaflet;

import adw.c.functions;
import adw.c.types;
import adw.leaflet_page;
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
import gtk.selection_model;
import gtk.widget;

/**
    An adaptive container acting like a box or a stack.
    
    <picture>
      <source srcset="leaflet-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="leaflet-wide.png" alt="leaflet-wide">
    </picture>
    <picture>
      <source srcset="leaflet-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="leaflet-narrow.png" alt="leaflet-narrow">
    </picture>
    
    The [adw.leaflet.Leaflet] widget can display its children like a [gtk.box.Box] does
    or like a [gtk.stack.Stack] does, adapting to size changes by switching
    between the two modes.
    
    When there is enough space the children are displayed side by side, otherwise
    only one is displayed and the leaflet is said to be “folded”.
    The threshold is dictated by the preferred minimum sizes of the children.
    When a leaflet is folded, the children can be navigated using swipe gestures.
    
    The “over” and “under” transition types stack the children one on top of the
    other, while the “slide” transition puts the children side by side. While
    navigating to a child on the side or below can be performed by swiping the
    current child away, navigating to an upper child requires dragging it from
    the edge where it resides. This doesn't affect non-dragging swipes.
    
    ## CSS nodes
    
    [adw.leaflet.Leaflet] has a single CSS node with name `leaflet`. The node will get the
    style classes `.folded` when it is folded, `.unfolded` when it's not, or none
    if it hasn't computed its fold yet.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
*/
class Leaflet : gtk.widget.Widget, adw.swipeable.Swipeable, gtk.orientable.Orientable
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
    return cast(void function())adw_leaflet_get_type != &gidSymbolNotFound ? adw_leaflet_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Leaflet self()
  {
    return this;
  }

  /**
      Get `canNavigateBack` property.
      Returns: Whether gestures and shortcuts for navigating backward are enabled.
        
        The supported gestures are:
        
        $(LIST
          * One-finger swipe on touchscreens
          * Horizontal scrolling on touchpads (usually two-finger swipe)
          * Back/forward mouse buttons
        )
          
        The keyboard back/forward keys are also supported, as well as the
        <kbd>Alt</kbd>+<kbd>←</kbd> shortcut for horizontal orientation, or
        <kbd>Alt</kbd>+<kbd>↑</kbd> for vertical orientation.
        
        If the orientation is horizontal, for right-to-left locales, gestures and
        shortcuts are reversed.
        
        Only children that have `property@LeafletPage:navigatable` set to `TRUE`
        can be navigated to.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool canNavigateBack()
  {
    return getCanNavigateBack();
  }

  /**
      Set `canNavigateBack` property.
      Params:
        propval = Whether gestures and shortcuts for navigating backward are enabled.
          
          The supported gestures are:
          
          $(LIST
            * One-finger swipe on touchscreens
            * Horizontal scrolling on touchpads (usually two-finger swipe)
            * Back/forward mouse buttons
          )
            
          The keyboard back/forward keys are also supported, as well as the
          <kbd>Alt</kbd>+<kbd>←</kbd> shortcut for horizontal orientation, or
          <kbd>Alt</kbd>+<kbd>↑</kbd> for vertical orientation.
          
          If the orientation is horizontal, for right-to-left locales, gestures and
          shortcuts are reversed.
          
          Only children that have `property@LeafletPage:navigatable` set to `TRUE`
          can be navigated to.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void canNavigateBack(bool propval)
  {
    return setCanNavigateBack(propval);
  }

  /**
      Get `canNavigateForward` property.
      Returns: Whether gestures and shortcuts for navigating forward are enabled.
        
        The supported gestures are:
        
        $(LIST
          * One-finger swipe on touchscreens
          * Horizontal scrolling on touchpads (usually two-finger swipe)
          * Back/forward mouse buttons
        )
          
        The keyboard back/forward keys are also supported, as well as the
        <kbd>Alt</kbd>+<kbd>→</kbd> shortcut for horizontal orientation, or
        <kbd>Alt</kbd>+<kbd>↓</kbd> for vertical orientation.
        
        If the orientation is horizontal, for right-to-left locales, gestures and
        shortcuts are reversed.
        
        Only children that have `property@LeafletPage:navigatable` set to `TRUE`
        can be navigated to.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool canNavigateForward()
  {
    return getCanNavigateForward();
  }

  /**
      Set `canNavigateForward` property.
      Params:
        propval = Whether gestures and shortcuts for navigating forward are enabled.
          
          The supported gestures are:
          
          $(LIST
            * One-finger swipe on touchscreens
            * Horizontal scrolling on touchpads (usually two-finger swipe)
            * Back/forward mouse buttons
          )
            
          The keyboard back/forward keys are also supported, as well as the
          <kbd>Alt</kbd>+<kbd>→</kbd> shortcut for horizontal orientation, or
          <kbd>Alt</kbd>+<kbd>↓</kbd> for vertical orientation.
          
          If the orientation is horizontal, for right-to-left locales, gestures and
          shortcuts are reversed.
          
          Only children that have `property@LeafletPage:navigatable` set to `TRUE`
          can be navigated to.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void canNavigateForward(bool propval)
  {
    return setCanNavigateForward(propval);
  }

  /**
      Get `canUnfold` property.
      Returns: Whether or not the leaflet can unfold.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool canUnfold()
  {
    return getCanUnfold();
  }

  /**
      Set `canUnfold` property.
      Params:
        propval = Whether or not the leaflet can unfold.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void canUnfold(bool propval)
  {
    return setCanUnfold(propval);
  }

  /**
      Get `childTransitionParams` property.
      Returns: The child transition spring parameters.
        
        The default value is equivalent to:
        
        ```c
        adw_spring_params_new (1, 0.5, 500)
        ```
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property adw.spring_params.SpringParams childTransitionParams()
  {
    return getChildTransitionParams();
  }

  /**
      Set `childTransitionParams` property.
      Params:
        propval = The child transition spring parameters.
          
          The default value is equivalent to:
          
          ```c
          adw_spring_params_new (1, 0.5, 500)
          ```
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void childTransitionParams(adw.spring_params.SpringParams propval)
  {
    return setChildTransitionParams(propval);
  }

  /**
      Get `childTransitionRunning` property.
      Returns: Whether a child transition is currently running.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool childTransitionRunning()
  {
    return getChildTransitionRunning();
  }

  /**
      Get `foldThresholdPolicy` property.
      Returns: Determines when the leaflet will fold.
        
        If set to [adw.types.FoldThresholdPolicy.Minimum], it will only fold when the
        children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural], it
        will fold as soon as children don't get their natural size.
        
        This can be useful if you have a long ellipsizing label and want to let it
        ellipsize instead of immediately folding.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property adw.types.FoldThresholdPolicy foldThresholdPolicy()
  {
    return getFoldThresholdPolicy();
  }

  /**
      Set `foldThresholdPolicy` property.
      Params:
        propval = Determines when the leaflet will fold.
          
          If set to [adw.types.FoldThresholdPolicy.Minimum], it will only fold when the
          children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural], it
          will fold as soon as children don't get their natural size.
          
          This can be useful if you have a long ellipsizing label and want to let it
          ellipsize instead of immediately folding.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void foldThresholdPolicy(adw.types.FoldThresholdPolicy propval)
  {
    return setFoldThresholdPolicy(propval);
  }

  /**
      Get `folded` property.
      Returns: Whether the leaflet is folded.
        
        The leaflet will be folded if the size allocated to it is smaller than the
        sum of the minimum or natural sizes of the children (see
        `property@Leaflet:fold-threshold-policy`), it will be unfolded otherwise.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool folded()
  {
    return getFolded();
  }

  /**
      Get `homogeneous` property.
      Returns: Whether the leaflet allocates the same size for all children when folded.
        
        If set to `FALSE`, different children can have different size along the
        opposite orientation.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the leaflet allocates the same size for all children when folded.
          
          If set to `FALSE`, different children can have different size along the
          opposite orientation.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /**
      Get `modeTransitionDuration` property.
      Returns: The mode transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property uint modeTransitionDuration()
  {
    return getModeTransitionDuration();
  }

  /**
      Set `modeTransitionDuration` property.
      Params:
        propval = The mode transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void modeTransitionDuration(uint propval)
  {
    return setModeTransitionDuration(propval);
  }

  /**
      Get `pages` property.
      Returns: A selection model with the leaflet's pages.
        
        This can be used to keep an up-to-date view. The model also implements
        [gtk.selection_model.SelectionModel] and can be used to track and change the visible
        page.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property gtk.selection_model.SelectionModel pages()
  {
    return getPages();
  }

  /**
      Get `transitionType` property.
      Returns: The type of animation used for transitions between modes and children.
        
        The transition type can be changed without problems at runtime, so it is
        possible to change the animation based on the mode or child that is about
        to become current.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property adw.types.LeafletTransitionType transitionType()
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used for transitions between modes and children.
          
          The transition type can be changed without problems at runtime, so it is
          possible to change the animation based on the mode or child that is about
          to become current.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void transitionType(adw.types.LeafletTransitionType propval)
  {
    return setTransitionType(propval);
  }

  /**
      Get `visibleChild` property.
      Returns: The widget currently visible when the leaflet is folded.
        
        The transition is determined by `property@Leaflet:transition-type` and
        `property@Leaflet:child-transition-params`. The transition can be cancelled
        by the user, in which case visible child will change back to the previously
        visible child.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property gtk.widget.Widget visibleChild()
  {
    return getVisibleChild();
  }

  /**
      Set `visibleChild` property.
      Params:
        propval = The widget currently visible when the leaflet is folded.
          
          The transition is determined by `property@Leaflet:transition-type` and
          `property@Leaflet:child-transition-params`. The transition can be cancelled
          by the user, in which case visible child will change back to the previously
          visible child.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void visibleChild(gtk.widget.Widget propval)
  {
    return setVisibleChild(propval);
  }

  /**
      Get `visibleChildName` property.
      Returns: The name of the widget currently visible when the leaflet is folded.
        
        See `property@Leaflet:visible-child`.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property string visibleChildName()
  {
    return getVisibleChildName();
  }

  /**
      Set `visibleChildName` property.
      Params:
        propval = The name of the widget currently visible when the leaflet is folded.
          
          See `property@Leaflet:visible-child`.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  @property void visibleChildName(string propval)
  {
    return setVisibleChildName(propval);
  }

  mixin SwipeableT!();
  mixin OrientableT!();

  /**
      Creates a new [adw.leaflet.Leaflet].
      Returns: the new created [adw.leaflet.Leaflet]
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_leaflet_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
      Returns: the `classLeafletPage` for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.leaflet_page.LeafletPage append(gtk.widget.Widget child)
  {
    AdwLeafletPage* _cretval;
    _cretval = adw_leaflet_append(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.leaflet_page.LeafletPage)(cast(AdwLeafletPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the previous or next navigatable child.
      
      This will be the same child [adw.leaflet.Leaflet.navigate] or swipe gestures will
      navigate to.
      
      If there's no child to navigate to, `NULL` will be returned instead.
      
      See `propertyLeafletPage:navigatable`.
  
      Params:
        direction = the direction
      Returns: the previous or next child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  gtk.widget.Widget getAdjacentChild(adw.types.NavigationDirection direction)
  {
    GtkWidget* _cretval;
    _cretval = adw_leaflet_get_adjacent_child(cast(AdwLeaflet*)this._cPtr, direction);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether gestures and shortcuts for navigating backward are enabled.
      Returns: Whether gestures and shortcuts are enabled.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getCanNavigateBack()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_can_navigate_back(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether gestures and shortcuts for navigating forward are enabled.
      Returns: Whether gestures and shortcuts are enabled.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getCanNavigateForward()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_can_navigate_forward(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can unfold.
      Returns: whether self can unfold
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getCanUnfold()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_can_unfold(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Finds the child of self with name.
      
      Returns `NULL` if there is no child with this name.
      
      See `propertyLeafletPage:name`.
  
      Params:
        name = the name of the child to find
      Returns: the requested child of self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  gtk.widget.Widget getChildByName(string name)
  {
    GtkWidget* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = adw_leaflet_get_child_by_name(cast(AdwLeaflet*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child transition spring parameters for self.
      Returns: the child transition parameters
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.spring_params.SpringParams getChildTransitionParams()
  {
    AdwSpringParams* _cretval;
    _cretval = adw_leaflet_get_child_transition_params(cast(AdwLeaflet*)this._cPtr);
    auto _retval = _cretval ? new adw.spring_params.SpringParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether a child transition is currently running for self.
      Returns: whether a transition is currently running
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getChildTransitionRunning()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_child_transition_running(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the fold threshold policy for self.
      Returns: the fold threshold policy
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.types.FoldThresholdPolicy getFoldThresholdPolicy()
  {
    AdwFoldThresholdPolicy _cretval;
    _cretval = adw_leaflet_get_fold_threshold_policy(cast(AdwLeaflet*)this._cPtr);
    adw.types.FoldThresholdPolicy _retval = cast(adw.types.FoldThresholdPolicy)_cretval;
    return _retval;
  }

  /**
      Gets whether self is folded.
      
      The leaflet will be folded if the size allocated to it is smaller than the
      sum of the minimum or natural sizes of the children (see
      `propertyLeaflet:fold-threshold-policy`), it will be unfolded otherwise.
      Returns: whether self is folded.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getFolded()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_folded(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is homogeneous.
      Returns: whether self is homogeneous
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_get_homogeneous(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the mode transition animation duration for self.
      Returns: the mode transition duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  uint getModeTransitionDuration()
  {
    uint _retval;
    _retval = adw_leaflet_get_mode_transition_duration(cast(AdwLeaflet*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `classLeafletPage` object for child.
  
      Params:
        child = a child of self
      Returns: the page object for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.leaflet_page.LeafletPage getPage(gtk.widget.Widget child)
  {
    AdwLeafletPage* _cretval;
    _cretval = adw_leaflet_get_page(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.leaflet_page.LeafletPage)(cast(AdwLeafletPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages of the leaflet.
      
      This can be used to keep an up-to-date view. The model also implements
      [gtk.selection_model.SelectionModel] and can be used to track and change the visible
      page.
      Returns: a [gtk.selection_model.SelectionModel] for the leaflet's children
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_leaflet_get_pages(cast(AdwLeaflet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the type of animation used for transitions between modes and children.
      Returns: the current transition type of self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.types.LeafletTransitionType getTransitionType()
  {
    AdwLeafletTransitionType _cretval;
    _cretval = adw_leaflet_get_transition_type(cast(AdwLeaflet*)this._cPtr);
    adw.types.LeafletTransitionType _retval = cast(adw.types.LeafletTransitionType)_cretval;
    return _retval;
  }

  /**
      Gets the widget currently visible when the leaflet is folded.
      Returns: the visible child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  gtk.widget.Widget getVisibleChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_leaflet_get_visible_child(cast(AdwLeaflet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the currently visible child widget.
      Returns: the name of the visible child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  string getVisibleChildName()
  {
    const(char)* _cretval;
    _cretval = adw_leaflet_get_visible_child_name(cast(AdwLeaflet*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Inserts child in the position after sibling in the list of children.
      
      If sibling is `NULL`, inserts child at the first position.
  
      Params:
        child = the widget to insert
        sibling = the sibling after which to insert child
      Returns: the `classLeafletPage` for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.leaflet_page.LeafletPage insertChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null)
  {
    AdwLeafletPage* _cretval;
    _cretval = adw_leaflet_insert_child_after(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.leaflet_page.LeafletPage)(cast(AdwLeafletPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Navigates to the previous or next child.
      
      The child must have the `propertyLeafletPage:navigatable` property set to
      `TRUE`, otherwise it will be skipped.
      
      This will be the same child as returned by
      [adw.leaflet.Leaflet.getAdjacentChild] or navigated to via swipe gestures.
  
      Params:
        direction = the direction
      Returns: whether the visible child was changed
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  bool navigate(adw.types.NavigationDirection direction)
  {
    bool _retval;
    _retval = cast(bool)adw_leaflet_navigate(cast(AdwLeaflet*)this._cPtr, direction);
    return _retval;
  }

  /**
      Inserts child at the first position in self.
  
      Params:
        child = the widget to prepend
      Returns: the `classLeafletPage` for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  adw.leaflet_page.LeafletPage prepend(gtk.widget.Widget child)
  {
    AdwLeafletPage* _cretval;
    _cretval = adw_leaflet_prepend(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.leaflet_page.LeafletPage)(cast(AdwLeafletPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a child widget from self.
  
      Params:
        child = the child to remove
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void remove(gtk.widget.Widget child)
  {
    adw_leaflet_remove(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Moves child to the position after sibling in the list of children.
      
      If sibling is `NULL`, moves child to the first position.
  
      Params:
        child = the widget to move, must be a child of self
        sibling = the sibling to move child after
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void reorderChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null)
  {
    adw_leaflet_reorder_child_after(cast(AdwLeaflet*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Sets whether gestures and shortcuts for navigating backward are enabled.
      
      The supported gestures are:
      
      $(LIST
        * One-finger swipe on touchscreens
        * Horizontal scrolling on touchpads (usually two-finger swipe)
        * Back/forward mouse buttons
      )
        
      The keyboard back/forward keys are also supported, as well as the
      <kbd>Alt</kbd>+<kbd>←</kbd> shortcut for horizontal orientation, or
      <kbd>Alt</kbd>+<kbd>↑</kbd> for vertical orientation.
      
      If the orientation is horizontal, for right-to-left locales, gestures and
      shortcuts are reversed.
      
      Only children that have `propertyLeafletPage:navigatable` set to `TRUE` can
      be navigated to.
  
      Params:
        canNavigateBack = the new value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setCanNavigateBack(bool canNavigateBack)
  {
    adw_leaflet_set_can_navigate_back(cast(AdwLeaflet*)this._cPtr, canNavigateBack);
  }

  /**
      Sets whether gestures and shortcuts for navigating forward are enabled.
      
      The supported gestures are:
      
      $(LIST
        * One-finger swipe on touchscreens
        * Horizontal scrolling on touchpads (usually two-finger swipe)
        * Back/forward mouse buttons
      )
        
      The keyboard back/forward keys are also supported, as well as the
      <kbd>Alt</kbd>+<kbd>→</kbd> shortcut for horizontal orientation, or
      <kbd>Alt</kbd>+<kbd>↓</kbd> for vertical orientation.
      
      If the orientation is horizontal, for right-to-left locales, gestures and
      shortcuts are reversed.
      
      Only children that have `propertyLeafletPage:navigatable` set to `TRUE` can
      be navigated to.
  
      Params:
        canNavigateForward = the new value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setCanNavigateForward(bool canNavigateForward)
  {
    adw_leaflet_set_can_navigate_forward(cast(AdwLeaflet*)this._cPtr, canNavigateForward);
  }

  /**
      Sets whether self can unfold.
  
      Params:
        canUnfold = whether self can unfold
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setCanUnfold(bool canUnfold)
  {
    adw_leaflet_set_can_unfold(cast(AdwLeaflet*)this._cPtr, canUnfold);
  }

  /**
      Sets the child transition spring parameters for self.
      
      The default value is equivalent to:
      
      ```c
      adw_spring_params_new (1, 0.5, 500)
      ```
  
      Params:
        params = the new parameters
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setChildTransitionParams(adw.spring_params.SpringParams params)
  {
    adw_leaflet_set_child_transition_params(cast(AdwLeaflet*)this._cPtr, params ? cast(AdwSpringParams*)params._cPtr(No.Dup) : null);
  }

  /**
      Sets the fold threshold policy for self.
      
      If set to [adw.types.FoldThresholdPolicy.Minimum], it will only fold when the
      children cannot fit anymore. With [adw.types.FoldThresholdPolicy.Natural], it
      will fold as soon as children don't get their natural size.
      
      This can be useful if you have a long ellipsizing label and want to let it
      ellipsize instead of immediately folding.
  
      Params:
        policy = the policy to use
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setFoldThresholdPolicy(adw.types.FoldThresholdPolicy policy)
  {
    adw_leaflet_set_fold_threshold_policy(cast(AdwLeaflet*)this._cPtr, policy);
  }

  /**
      Sets self to be homogeneous or not.
      
      If set to `FALSE`, different children can have different size along the
      opposite orientation.
  
      Params:
        homogeneous = whether to make self homogeneous
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setHomogeneous(bool homogeneous)
  {
    adw_leaflet_set_homogeneous(cast(AdwLeaflet*)this._cPtr, homogeneous);
  }

  /**
      Sets the mode transition animation duration for self.
  
      Params:
        duration = the new duration, in milliseconds
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setModeTransitionDuration(uint duration)
  {
    adw_leaflet_set_mode_transition_duration(cast(AdwLeaflet*)this._cPtr, duration);
  }

  /**
      Sets the type of animation used for transitions between modes and children.
      
      The transition type can be changed without problems at runtime, so it is
      possible to change the animation based on the mode or child that is about to
      become current.
  
      Params:
        transition = the new transition type
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setTransitionType(adw.types.LeafletTransitionType transition)
  {
    adw_leaflet_set_transition_type(cast(AdwLeaflet*)this._cPtr, transition);
  }

  /**
      Sets the widget currently visible when the leaflet is folded.
      
      The transition is determined by `propertyLeaflet:transition-type` and
      `propertyLeaflet:child-transition-params`. The transition can be cancelled
      by the user, in which case visible child will change back to the previously
      visible child.
  
      Params:
        visibleChild = the new child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setVisibleChild(gtk.widget.Widget visibleChild)
  {
    adw_leaflet_set_visible_child(cast(AdwLeaflet*)this._cPtr, visibleChild ? cast(GtkWidget*)visibleChild._cPtr(No.Dup) : null);
  }

  /**
      Makes the child with the name name visible.
      
      See `propertyLeaflet:visible-child`.
  
      Params:
        name = the name of a child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwleaflet)
  */
  void setVisibleChildName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_leaflet_set_visible_child_name(cast(AdwLeaflet*)this._cPtr, _name);
  }
}
