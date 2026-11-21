/// Module for [InlineViewSwitcher] class
module gid.adw1.inline_view_switcher;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.adw1.view_stack;
import gid.core.gid;
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
import gid.gtk4.widget;

/**
    A view switcher that uses a toggle group.
    
    <picture>
      <source srcset="inline-view-switcher-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher.png" alt="inline-view-switcher">
    </picture>
    
    A view switcher showing pages of an [gid.adw1.view_stack.ViewStack] within an
    [gid.adw1.toggle_group.ToggleGroup], similar to [gid.adw1.view_switcher.ViewSwitcher].
    
    The toggles can display either an icon, a label or both. Use the
    [gid.adw1.inline_view_switcher.InlineViewSwitcher.displayMode] to control this.
    
    <picture>
      <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
    </picture>
    
    ## CSS nodes
    
    [gid.adw1.inline_view_switcher.InlineViewSwitcher] has a single CSS node with the name
    `inline-view-switcher`.
    
    ## Style classes
    
    Like [gid.adw1.toggle_group.ToggleGroup], it can accept the [`.flat`](style-classes.html#flat_1)
    and [`.round`](style-classes.html#round) style classes.
    
    <picture>
      <source srcset="inline-view-switcher-style-classes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="inline-view-switcher-style-classes.png" alt="inline-view-switcher-style-classes">
    </picture>
    
    ## Accessibility
    
    The internal toggle group uses the `enum@Gtk.AccessibleRole.tab-list` role.
    Its toggles use the [gid.gtk4.types.AccessibleRole.Tab] role.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.view_switcher_bar.ViewSwitcherBar],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
class InlineViewSwitcher : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())adw_inline_view_switcher_get_type != &gidSymbolNotFound ? adw_inline_view_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwInlineViewSwitcher";
  }

  /** Returns `this`, for use in `with` statements. */
  override InlineViewSwitcher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.inline_view_switcher.InlineViewSwitcher]
      Returns: New builder object
  */
  static InlineViewSwitcherGidBuilder builder() nothrow
  {
    return new InlineViewSwitcherGidBuilder;
  }

  /**
      Get `canShrink` property.
      Returns: Whether the toggles can be smaller than the natural size of their contents.
        
        If set to `TRUE`, the toggle labels will ellipsize.
        
        See [gid.adw1.toggle_group.ToggleGroup.canShrink].
  */
  @property bool canShrink() nothrow
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the toggles can be smaller than the natural size of their contents.
          
          If set to `TRUE`, the toggle labels will ellipsize.
          
          See [gid.adw1.toggle_group.ToggleGroup.canShrink].
  */
  @property void canShrink(bool propval) nothrow
  {
    setCanShrink(propval);
  }

  /**
      Get `displayMode` property.
      Returns: The display mode.
        
        Determines what the toggles display: a label, an icon or both.
        
        <picture>
          <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
          <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
        </picture>
  */
  @property gid.adw1.types.InlineViewSwitcherDisplayMode displayMode() nothrow
  {
    return getDisplayMode();
  }

  /**
      Set `displayMode` property.
      Params:
        propval = The display mode.
          
          Determines what the toggles display: a label, an icon or both.
          
          <picture>
            <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
          </picture>
  */
  @property void displayMode(gid.adw1.types.InlineViewSwitcherDisplayMode propval) nothrow
  {
    setDisplayMode(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether all toggles take the same size.
  */
  @property bool homogeneous() nothrow
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all toggles take the same size.
  */
  @property void homogeneous(bool propval) nothrow
  {
    setHomogeneous(propval);
  }

  /**
      Get `stack` property.
      Returns: The stack the view switcher controls.
  */
  @property gid.adw1.view_stack.ViewStack stack() nothrow
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the view switcher controls.
  */
  @property void stack(gid.adw1.view_stack.ViewStack propval) nothrow
  {
    setStack(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.adw1.inline_view_switcher.InlineViewSwitcher].
      Returns: the newly created [gid.adw1.inline_view_switcher.InlineViewSwitcher]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_inline_view_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the toggles can be smaller than the natural size of their
      contents.
      Returns: whether the toggles can shrink
  */
  bool getCanShrink() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_inline_view_switcher_get_can_shrink(cast(AdwInlineViewSwitcher*)this._cPtr);
    return _retval;
  }

  /**
      Gets the display mode of self.
      Returns: the display mode
  */
  gid.adw1.types.InlineViewSwitcherDisplayMode getDisplayMode() nothrow
  {
    AdwInlineViewSwitcherDisplayMode _cretval;
    _cretval = adw_inline_view_switcher_get_display_mode(cast(AdwInlineViewSwitcher*)this._cPtr);
    gid.adw1.types.InlineViewSwitcherDisplayMode _retval = cast(gid.adw1.types.InlineViewSwitcherDisplayMode)_cretval;
    return _retval;
  }

  /**
      Gets whether all toggles within self take the same size.
      Returns: whether all toggles take the same size
  */
  bool getHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_inline_view_switcher_get_homogeneous(cast(AdwInlineViewSwitcher*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stack self controls.
      Returns: The stack of self
  */
  gid.adw1.view_stack.ViewStack getStack() nothrow
  {
    AdwViewStack* _cretval;
    _cretval = adw_inline_view_switcher_get_stack(cast(AdwInlineViewSwitcher*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether the toggles can be smaller than the natural size of their
      contents.
      
      If can_shrink is `TRUE`, the toggle labels will ellipsize.
      
      See [gid.adw1.toggle_group.ToggleGroup.canShrink].
  
      Params:
        canShrink = whether the toggles can shrink
  */
  void setCanShrink(bool canShrink) nothrow
  {
    adw_inline_view_switcher_set_can_shrink(cast(AdwInlineViewSwitcher*)this._cPtr, canShrink);
  }

  /**
      Sets the display mode of self.
      
      Determines what the toggles display: a label, an icon or both.
      
      <picture>
        <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
        <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
      </picture>
  
      Params:
        mode = the display mode
  */
  void setDisplayMode(gid.adw1.types.InlineViewSwitcherDisplayMode mode) nothrow
  {
    adw_inline_view_switcher_set_display_mode(cast(AdwInlineViewSwitcher*)this._cPtr, mode);
  }

  /**
      Sets whether all toggles within self take the same size.
  
      Params:
        homogeneous = whether all toggles should take the same size
  */
  void setHomogeneous(bool homogeneous) nothrow
  {
    adw_inline_view_switcher_set_homogeneous(cast(AdwInlineViewSwitcher*)this._cPtr, homogeneous);
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a stack
  */
  void setStack(gid.adw1.view_stack.ViewStack stack = null) nothrow
  {
    adw_inline_view_switcher_set_stack(cast(AdwInlineViewSwitcher*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.inline_view_switcher.InlineViewSwitcher]
class InlineViewSwitcherGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the toggles can be smaller than the natural size of their contents.
          
          If set to `TRUE`, the toggle labels will ellipsize.
          
          See [gid.adw1.toggle_group.ToggleGroup.canShrink].
      Returns: Builder instance for fluent chaining
  */
  T canShrink(bool propval) nothrow
  {
    return setProperty("can-shrink", propval);
  }

  /**
      Set `displayMode` property.
      Params:
        propval = The display mode.
          
          Determines what the toggles display: a label, an icon or both.
          
          <picture>
            <source srcset="inline-view-switcher-display-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="inline-view-switcher-display-modes.png" alt="inline-view-switcher-display-modes">
          </picture>
      Returns: Builder instance for fluent chaining
  */
  T displayMode(gid.adw1.types.InlineViewSwitcherDisplayMode propval) nothrow
  {
    return setProperty("display-mode", propval);
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether all toggles take the same size.
      Returns: Builder instance for fluent chaining
  */
  T homogeneous(bool propval) nothrow
  {
    return setProperty("homogeneous", propval);
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the view switcher controls.
      Returns: Builder instance for fluent chaining
  */
  T stack(gid.adw1.view_stack.ViewStack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gid.adw1.inline_view_switcher.InlineViewSwitcher]
final class InlineViewSwitcherGidBuilder : InlineViewSwitcherGidBuilderImpl!InlineViewSwitcherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InlineViewSwitcher build() nothrow
  {
    return new InlineViewSwitcher(cast(void*)createGObject(InlineViewSwitcher._getGType), Yes.Take);
  }
}
