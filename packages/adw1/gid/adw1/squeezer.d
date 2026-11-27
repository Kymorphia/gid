/// Module for [Squeezer] class
module gid.adw1.squeezer;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.squeezer_page;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.widget;

/**
    A best fit container.
    
    <picture>
      <source srcset="squeezer-wide-dark.png" media="(prefers-color-scheme: dark)">
      <img src="squeezer-wide.png" alt="squeezer-wide">
    </picture>
    <picture>
      <source srcset="squeezer-narrow-dark.png" media="(prefers-color-scheme: dark)">
      <img src="squeezer-narrow.png" alt="squeezer-narrow">
    </picture>
    
    The [gid.adw1.squeezer.Squeezer] widget is a container which only shows the first of its
    children that fits in the available size. It is convenient to offer different
    widgets to represent the same data with different levels of detail, making
    the widget seem to squeeze itself to fit in the available space.
    
    Transitions between children can be animated as fades. This can be controlled
    with [gid.adw1.squeezer.Squeezer.transitionType].
    
    ## CSS nodes
    
    [gid.adw1.squeezer.Squeezer] has a single CSS node with name `squeezer`.

    Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
*/
@gidGir("Squeezer", "SqueezerClass")
class Squeezer : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_squeezer_get_type != &gidSymbolNotFound ? adw_squeezer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwSqueezer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Squeezer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.squeezer.Squeezer]
      Returns: New builder object
  */
  static SqueezerGidBuilder builder() nothrow
  {
    return new SqueezerGidBuilder;
  }

  /**
      Get `allowNone` property.
      Returns: Whether to allow squeezing beyond the last child's minimum size.
        
        If set to `TRUE`, the squeezer can shrink to the point where no child can
        be shown. This is functionally equivalent to appending a widget with 0×0
        minimum size.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property bool allowNone() nothrow
  {
    return getAllowNone();
  }

  /**
      Set `allowNone` property.
      Params:
        propval = Whether to allow squeezing beyond the last child's minimum size.
          
          If set to `TRUE`, the squeezer can shrink to the point where no child can
          be shown. This is functionally equivalent to appending a widget with 0×0
          minimum size.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void allowNone(bool propval) nothrow
  {
    setAllowNone(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether all children have the same size for the opposite orientation.
        
        For example, if a squeezer is horizontal and is homogeneous, it will
        request the same height for all its children. If it isn't, the squeezer may
        change size when a different child becomes visible.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property bool homogeneous() nothrow
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all children have the same size for the opposite orientation.
          
          For example, if a squeezer is horizontal and is homogeneous, it will
          request the same height for all its children. If it isn't, the squeezer may
          change size when a different child becomes visible.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void homogeneous(bool propval) nothrow
  {
    setHomogeneous(propval);
  }

  /**
      Get `interpolateSize` property.
      Returns: Whether the squeezer interpolates its size when changing the visible child.
        
        If `TRUE`, the squeezer will interpolate its size between the one of the
        previous visible child and the one of the new visible child, according to
        the set transition duration and the orientation, e.g. if the squeezer is
        horizontal, it will interpolate the its height.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property bool interpolateSize() nothrow
  {
    return getInterpolateSize();
  }

  /**
      Set `interpolateSize` property.
      Params:
        propval = Whether the squeezer interpolates its size when changing the visible child.
          
          If `TRUE`, the squeezer will interpolate its size between the one of the
          previous visible child and the one of the new visible child, according to
          the set transition duration and the orientation, e.g. if the squeezer is
          horizontal, it will interpolate the its height.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void interpolateSize(bool propval) nothrow
  {
    setInterpolateSize(propval);
  }

  /**
      Get `pages` property.
      Returns: A selection model with the squeezer's pages.
        
        This can be used to keep an up-to-date view. The model also implements
        [gid.gtk4.selection_model.SelectionModel] and can be used to track the visible page.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property gid.gtk4.selection_model.SelectionModel pages() nothrow
  {
    return getPages();
  }

  /**
      Get `switchThresholdPolicy` property.
      Returns: The switch threshold policy.
        
        Determines when the squeezer will switch children.
        
        If set to [gid.adw1.types.FoldThresholdPolicy.Minimum], it will only switch when
        the visible child cannot fit anymore. With [gid.adw1.types.FoldThresholdPolicy.Natural],
        it will switch as soon as the visible child doesn't get their natural size.
        
        This can be useful if you have a long ellipsizing label and want to let it
        ellipsize instead of immediately switching.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property gid.adw1.types.FoldThresholdPolicy switchThresholdPolicy() nothrow
  {
    return getSwitchThresholdPolicy();
  }

  /**
      Set `switchThresholdPolicy` property.
      Params:
        propval = The switch threshold policy.
          
          Determines when the squeezer will switch children.
          
          If set to [gid.adw1.types.FoldThresholdPolicy.Minimum], it will only switch when
          the visible child cannot fit anymore. With [gid.adw1.types.FoldThresholdPolicy.Natural],
          it will switch as soon as the visible child doesn't get their natural size.
          
          This can be useful if you have a long ellipsizing label and want to let it
          ellipsize instead of immediately switching.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void switchThresholdPolicy(gid.adw1.types.FoldThresholdPolicy propval) nothrow
  {
    setSwitchThresholdPolicy(propval);
  }

  /**
      Get `transitionDuration` property.
      Returns: The transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property uint transitionDuration() nothrow
  {
    return getTransitionDuration();
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The transition animation duration, in milliseconds.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void transitionDuration(uint propval) nothrow
  {
    setTransitionDuration(propval);
  }

  /**
      Get `transitionRunning` property.
      Returns: Whether a transition is currently running.
        
        If a transition is impossible, the property value will be set to `TRUE` and
        then immediately to `FALSE`, so it's possible to rely on its notifications
        to know that a transition has happened.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property bool transitionRunning() nothrow
  {
    return getTransitionRunning();
  }

  /**
      Get `transitionType` property.
      Returns: The type of animation used for transitions between children.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property gid.adw1.types.SqueezerTransitionType transitionType() nothrow
  {
    return getTransitionType();
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used for transitions between children.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void transitionType(gid.adw1.types.SqueezerTransitionType propval) nothrow
  {
    setTransitionType(propval);
  }

  /**
      Get `visibleChild` property.
      Returns: The currently visible child.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property gid.gtk4.widget.Widget visibleChild() nothrow
  {
    return getVisibleChild();
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment, from 0 (start) to 1 (end).
        
        This affects the children allocation during transitions, when they exceed
        the size of the squeezer.
        
        For example, 0.5 means the child will be centered, 0 means it will keep the
        start side aligned and overflow the end side, and 1 means the opposite.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property float xalign() nothrow
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (start) to 1 (end).
          
          This affects the children allocation during transitions, when they exceed
          the size of the squeezer.
          
          For example, 0.5 means the child will be centered, 0 means it will keep the
          start side aligned and overflow the end side, and 1 means the opposite.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void xalign(float propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment, from 0 (top) to 1 (bottom).
        
        This affects the children allocation during transitions, when they exceed
        the size of the squeezer.
        
        For example, 0.5 means the child will be centered, 0 means it will keep the
        top side aligned and overflow the bottom side, and 1 means the opposite.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property float yalign() nothrow
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment, from 0 (top) to 1 (bottom).
          
          This affects the children allocation during transitions, when they exceed
          the size of the squeezer.
          
          For example, 0.5 means the child will be centered, 0 means it will keep the
          top side aligned and overflow the bottom side, and 1 means the opposite.
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  @property void yalign(float propval) nothrow
  {
    setYalign(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.adw1.squeezer.Squeezer].
      Returns: the newly created [gid.adw1.squeezer.Squeezer]
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_squeezer_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a child to self.
  
      Params:
        child = the widget to add
      Returns: the [gid.adw1.squeezer_page.SqueezerPage] for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.adw1.squeezer_page.SqueezerPage add(gid.gtk4.widget.Widget child) nothrow
  {
    AdwSqueezerPage* _cretval;
    _cretval = adw_squeezer_add(cast(AdwSqueezer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.squeezer_page.SqueezerPage)(cast(AdwSqueezerPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to allow squeezing beyond the last child's minimum size.
      Returns: whether self allows squeezing beyond the last child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getAllowNone() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_squeezer_get_allow_none(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether all children have the same size for the opposite orientation.
      Returns: whether self is homogeneous
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_squeezer_get_homogeneous(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self interpolates its size when changing the visible child.
      Returns: whether the size is interpolated
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getInterpolateSize() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_squeezer_get_interpolate_size(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Returns the [gid.adw1.squeezer_page.SqueezerPage] object for child.
  
      Params:
        child = a child of self
      Returns: the page object for child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.adw1.squeezer_page.SqueezerPage getPage(gid.gtk4.widget.Widget child) nothrow
  {
    AdwSqueezerPage* _cretval;
    _cretval = adw_squeezer_get_page(cast(AdwSqueezer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.squeezer_page.SqueezerPage)(cast(AdwSqueezerPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gid.gio2.list_model.ListModel] that contains the pages of self.
      
      This can be used to keep an up-to-date view. The model also implements
      [gid.gtk4.selection_model.SelectionModel] and can be used to track the visible page.
      Returns: a [gid.gtk4.selection_model.SelectionModel] for the squeezer's children
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.gtk4.selection_model.SelectionModel getPages() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_squeezer_get_pages(cast(AdwSqueezer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the switch threshold policy for self.
      Returns: the fold threshold policy
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.adw1.types.FoldThresholdPolicy getSwitchThresholdPolicy() nothrow
  {
    AdwFoldThresholdPolicy _cretval;
    _cretval = adw_squeezer_get_switch_threshold_policy(cast(AdwSqueezer*)this._cPtr);
    gid.adw1.types.FoldThresholdPolicy _retval = cast(gid.adw1.types.FoldThresholdPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the transition animation duration for self.
      Returns: the transition duration, in milliseconds
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  uint getTransitionDuration() nothrow
  {
    uint _retval;
    _retval = adw_squeezer_get_transition_duration(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a transition is currently running for self.
      
      If a transition is impossible, the property value will be set to `TRUE` and
      then immediately to `FALSE`, so it's possible to rely on its notifications
      to know that a transition has happened.
      Returns: whether a transition is currently running
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  bool getTransitionRunning() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_squeezer_get_transition_running(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the type of animation used for transitions between children in self.
      Returns: the current transition type of self
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.adw1.types.SqueezerTransitionType getTransitionType() nothrow
  {
    AdwSqueezerTransitionType _cretval;
    _cretval = adw_squeezer_get_transition_type(cast(AdwSqueezer*)this._cPtr);
    gid.adw1.types.SqueezerTransitionType _retval = cast(gid.adw1.types.SqueezerTransitionType)_cretval;
    return _retval;
  }

  /**
      Gets the currently visible child of self.
      Returns: the visible child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  gid.gtk4.widget.Widget getVisibleChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_squeezer_get_visible_child(cast(AdwSqueezer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal alignment, from 0 (start) to 1 (end).
      Returns: the alignment value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  float getXalign() nothrow
  {
    float _retval;
    _retval = adw_squeezer_get_xalign(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Gets the vertical alignment, from 0 (top) to 1 (bottom).
      Returns: the alignment value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  float getYalign() nothrow
  {
    float _retval;
    _retval = adw_squeezer_get_yalign(cast(AdwSqueezer*)this._cPtr);
    return _retval;
  }

  /**
      Removes a child widget from self.
  
      Params:
        child = the child to remove
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    adw_squeezer_remove(cast(AdwSqueezer*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to allow squeezing beyond the last child's minimum size.
      
      If set to `TRUE`, the squeezer can shrink to the point where no child can be
      shown. This is functionally equivalent to appending a widget with 0×0 minimum
      size.
  
      Params:
        allowNone = whether self allows squeezing beyond the last child
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setAllowNone(bool allowNone) nothrow
  {
    adw_squeezer_set_allow_none(cast(AdwSqueezer*)this._cPtr, allowNone);
  }

  /**
      Sets whether all children have the same size for the opposite orientation.
      
      For example, if a squeezer is horizontal and is homogeneous, it will request
      the same height for all its children. If it isn't, the squeezer may change
      size when a different child becomes visible.
  
      Params:
        homogeneous = whether self is homogeneous
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setHomogeneous(bool homogeneous) nothrow
  {
    adw_squeezer_set_homogeneous(cast(AdwSqueezer*)this._cPtr, homogeneous);
  }

  /**
      Sets whether self interpolates its size when changing the visible child.
      
      If `TRUE`, the squeezer will interpolate its size between the one of the
      previous visible child and the one of the new visible child, according to the
      set transition duration and the orientation, e.g. if the squeezer is
      horizontal, it will interpolate the its height.
  
      Params:
        interpolateSize = whether to interpolate the size
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setInterpolateSize(bool interpolateSize) nothrow
  {
    adw_squeezer_set_interpolate_size(cast(AdwSqueezer*)this._cPtr, interpolateSize);
  }

  /**
      Sets the switch threshold policy for self.
      
      Determines when the squeezer will switch children.
      
      If set to [gid.adw1.types.FoldThresholdPolicy.Minimum], it will only switch when
      the visible child cannot fit anymore. With [gid.adw1.types.FoldThresholdPolicy.Natural],
      it will switch as soon as the visible child doesn't get their natural size.
      
      This can be useful if you have a long ellipsizing label and want to let it
      ellipsize instead of immediately switching.
  
      Params:
        policy = the policy to use
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setSwitchThresholdPolicy(gid.adw1.types.FoldThresholdPolicy policy) nothrow
  {
    adw_squeezer_set_switch_threshold_policy(cast(AdwSqueezer*)this._cPtr, policy);
  }

  /**
      Sets the transition animation duration for self.
  
      Params:
        duration = the new duration, in milliseconds
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setTransitionDuration(uint duration) nothrow
  {
    adw_squeezer_set_transition_duration(cast(AdwSqueezer*)this._cPtr, duration);
  }

  /**
      Sets the type of animation used for transitions between children in self.
  
      Params:
        transition = the new transition type
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setTransitionType(gid.adw1.types.SqueezerTransitionType transition) nothrow
  {
    adw_squeezer_set_transition_type(cast(AdwSqueezer*)this._cPtr, transition);
  }

  /**
      Sets the horizontal alignment, from 0 (start) to 1 (end).
      
      This affects the children allocation during transitions, when they exceed the
      size of the squeezer.
      
      For example, 0.5 means the child will be centered, 0 means it will keep the
      start side aligned and overflow the end side, and 1 means the opposite.
  
      Params:
        xalign = the new alignment value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setXalign(float xalign) nothrow
  {
    adw_squeezer_set_xalign(cast(AdwSqueezer*)this._cPtr, xalign);
  }

  /**
      Sets the vertical alignment, from 0 (top) to 1 (bottom).
      
      This affects the children allocation during transitions, when they exceed the
      size of the squeezer.
      
      For example, 0.5 means the child will be centered, 0 means it will keep the
      top side aligned and overflow the bottom side, and 1 means the opposite.
  
      Params:
        yalign = the new alignment value
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  void setYalign(float yalign) nothrow
  {
    adw_squeezer_set_yalign(cast(AdwSqueezer*)this._cPtr, yalign);
  }
}

/// Fluent builder implementation template for [gid.adw1.squeezer.Squeezer]
class SqueezerGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `allowNone` property.
      Params:
        propval = Whether to allow squeezing beyond the last child's minimum size.
          
          If set to `TRUE`, the squeezer can shrink to the point where no child can
          be shown. This is functionally equivalent to appending a widget with 0×0
          minimum size.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T allowNone(bool propval) nothrow
  {
    return setProperty("allow-none", propval);
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all children have the same size for the opposite orientation.
          
          For example, if a squeezer is horizontal and is homogeneous, it will
          request the same height for all its children. If it isn't, the squeezer may
          change size when a different child becomes visible.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T homogeneous(bool propval) nothrow
  {
    return setProperty("homogeneous", propval);
  }

  /**
      Set `interpolateSize` property.
      Params:
        propval = Whether the squeezer interpolates its size when changing the visible child.
          
          If `TRUE`, the squeezer will interpolate its size between the one of the
          previous visible child and the one of the new visible child, according to
          the set transition duration and the orientation, e.g. if the squeezer is
          horizontal, it will interpolate the its height.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T interpolateSize(bool propval) nothrow
  {
    return setProperty("interpolate-size", propval);
  }

  /**
      Set `switchThresholdPolicy` property.
      Params:
        propval = The switch threshold policy.
          
          Determines when the squeezer will switch children.
          
          If set to [gid.adw1.types.FoldThresholdPolicy.Minimum], it will only switch when
          the visible child cannot fit anymore. With [gid.adw1.types.FoldThresholdPolicy.Natural],
          it will switch as soon as the visible child doesn't get their natural size.
          
          This can be useful if you have a long ellipsizing label and want to let it
          ellipsize instead of immediately switching.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T switchThresholdPolicy(gid.adw1.types.FoldThresholdPolicy propval) nothrow
  {
    return setProperty("switch-threshold-policy", propval);
  }

  /**
      Set `transitionDuration` property.
      Params:
        propval = The transition animation duration, in milliseconds.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T transitionDuration(uint propval) nothrow
  {
    return setProperty("transition-duration", propval);
  }

  /**
      Set `transitionType` property.
      Params:
        propval = The type of animation used for transitions between children.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T transitionType(gid.adw1.types.SqueezerTransitionType propval) nothrow
  {
    return setProperty("transition-type", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (start) to 1 (end).
          
          This affects the children allocation during transitions, when they exceed
          the size of the squeezer.
          
          For example, 0.5 means the child will be centered, 0 means it will keep the
          start side aligned and overflow the end side, and 1 means the opposite.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T xalign(float propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment, from 0 (top) to 1 (bottom).
          
          This affects the children allocation during transitions, when they exceed
          the size of the squeezer.
          
          For example, 0.5 means the child will be centered, 0 means it will keep the
          top side aligned and overflow the bottom side, and 1 means the opposite.
      Returns: Builder instance for fluent chaining
  
      Deprecated: See [the migration guide](migrating-to-breakpoints.html#replace-adwsqueezer)
  */
  T yalign(float propval) nothrow
  {
    return setProperty("yalign", propval);
  }
}

/// Fluent builder for [gid.adw1.squeezer.Squeezer]
final class SqueezerGidBuilder : SqueezerGidBuilderImpl!SqueezerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Squeezer build() nothrow
  {
    return new Squeezer(cast(void*)createGObject(Squeezer._getGType), Yes.Take);
  }
}
