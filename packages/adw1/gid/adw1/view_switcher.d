/// Module for [ViewSwitcher] class
module gid.adw1.view_switcher;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.adw1.view_stack;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    An adaptive view switcher.
    
    <picture>
      <source srcset="view-switcher-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher.png" alt="view-switcher">
    </picture>
    
    An adaptive view switcher designed to switch between multiple views
    contained in a [gid.adw1.view_stack.ViewStack] in a similar fashion to
    [gid.gtk4.stack_switcher.StackSwitcher].
    
    [gid.adw1.view_switcher.ViewSwitcher] buttons always have an icon and a label. They can be
    displayed side by side, or icon on top of the label. This can be controlled
    via the [gid.adw1.view_switcher.ViewSwitcher.policy] property.
    
    [gid.adw1.view_switcher.ViewSwitcher] is intended to be used in a header bar together with
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] at the bottom of the window, and a [gid.adw1.breakpoint.Breakpoint]
    showing the view switcher bar on narrow sizes, while removing the view
    switcher from the header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 550sp</condition>
          <setter object="switcher_bar" property="reveal">True</setter>
          <setter object="header_bar" property="title-widget"/>
        </object>
      </child>
      <property name="content">
        <object class="AdwToolbarView">
          <child type="top">
            <object class="AdwHeaderBar" id="header_bar">
              <property name="title-widget">
                <object class="AdwViewSwitcher">
                  <property name="stack">stack</property>
                  <property name="policy">wide</property>
                </object>
              </property>
            </object>
          </child>
          <property name="content">
            <object class="AdwViewStack" id="stack"/>
          </property>
          <child type="bottom">
            <object class="AdwViewSwitcherBar" id="switcher_bar">
              <property name="stack">stack</property>
            </object>
          </child>
        </object>
      </property>
    </object>
    ```
    
    It's recommended to set [gid.adw1.view_switcher.ViewSwitcher.policy] to
    [gid.adw1.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [gid.adw1.view_switcher.ViewSwitcher] has a single CSS node with name `viewswitcher`. It can have
    the style classes `.wide` and `.narrow`, matching its policy.
    
    ## Accessibility
    
    [gid.adw1.view_switcher.ViewSwitcher] uses the `enum@Gtk.AccessibleRole.tab-list` role and the
    [gid.gtk4.types.AccessibleRole.Tab] role for its buttons.
    
    See also: [gid.adw1.view_switcher_bar.ViewSwitcherBar], [gid.adw1.inline_view_switcher.InlineViewSwitcher],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
class ViewSwitcher : gid.gtk4.widget.Widget
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
    return cast(void function())adw_view_switcher_get_type != &gidSymbolNotFound ? adw_view_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwViewSwitcher";
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcher self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.view_switcher.ViewSwitcher]
      Returns: New builder object
  */
  static ViewSwitcherGidBuilder builder() nothrow
  {
    return new ViewSwitcherGidBuilder;
  }

  /**
      Get `policy` property.
      Returns: The policy to determine which mode to use.
  */
  @property gid.adw1.types.ViewSwitcherPolicy policy() nothrow
  {
    return getPolicy();
  }

  /**
      Set `policy` property.
      Params:
        propval = The policy to determine which mode to use.
  */
  @property void policy(gid.adw1.types.ViewSwitcherPolicy propval) nothrow
  {
    setPolicy(propval);
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

  /**
      Creates a new [gid.adw1.view_switcher.ViewSwitcher].
      Returns: the newly created [gid.adw1.view_switcher.ViewSwitcher]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the policy of self.
      Returns: the policy of self
  */
  gid.adw1.types.ViewSwitcherPolicy getPolicy() nothrow
  {
    AdwViewSwitcherPolicy _cretval;
    _cretval = adw_view_switcher_get_policy(cast(AdwViewSwitcher*)this._cPtr);
    gid.adw1.types.ViewSwitcherPolicy _retval = cast(gid.adw1.types.ViewSwitcherPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the stack controlled by self.
      Returns: the stack
  */
  gid.adw1.view_stack.ViewStack getStack() nothrow
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_get_stack(cast(AdwViewSwitcher*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the policy of self.
  
      Params:
        policy = the new policy
  */
  void setPolicy(gid.adw1.types.ViewSwitcherPolicy policy) nothrow
  {
    adw_view_switcher_set_policy(cast(AdwViewSwitcher*)this._cPtr, policy);
  }

  /**
      Sets the stack controlled by self.
  
      Params:
        stack = a stack
  */
  void setStack(gid.adw1.view_stack.ViewStack stack = null) nothrow
  {
    adw_view_switcher_set_stack(cast(AdwViewSwitcher*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.view_switcher.ViewSwitcher]
class ViewSwitcherGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `policy` property.
      Params:
        propval = The policy to determine which mode to use.
      Returns: Builder instance for fluent chaining
  */
  T policy(gid.adw1.types.ViewSwitcherPolicy propval) nothrow
  {
    return setProperty("policy", propval);
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

/// Fluent builder for [gid.adw1.view_switcher.ViewSwitcher]
final class ViewSwitcherGidBuilder : ViewSwitcherGidBuilderImpl!ViewSwitcherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewSwitcher build() nothrow
  {
    return new ViewSwitcher(cast(void*)createGObject(ViewSwitcher._getGType), Yes.Take);
  }
}
