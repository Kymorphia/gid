/// Module for [ViewSwitcher] class
module adw.view_switcher;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    An adaptive view switcher.
    
    <picture>
      <source srcset="view-switcher-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher.png" alt="view-switcher">
    </picture>
    
    An adaptive view switcher designed to switch between multiple views
    contained in a `class@ViewStack` in a similar fashion to
    [gtk.stack_switcher.StackSwitcher].
    
    [adw.view_switcher.ViewSwitcher] buttons always have an icon and a label. They can be
    displayed side by side, or icon on top of the label. This can be controlled
    via the `property@ViewSwitcher:policy` property.
    
    [adw.view_switcher.ViewSwitcher] is intended to be used in a header bar together with
    `class@ViewSwitcherBar` at the bottom of the window, and a `class@Breakpoint`
    showing the view switcher bar on narrow sizes, while removing the view
    switcher from the header bar, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
      <property name="height-request">200</property>
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
    
    It's recommended to set `property@ViewSwitcher:policy` to
    [adw.types.ViewSwitcherPolicy.Wide] in this case.
    
    You may have to adjust the breakpoint condition for your specific pages.
    
    ## CSS nodes
    
    [adw.view_switcher.ViewSwitcher] has a single CSS node with name `viewswitcher`. It can have
    the style classes `.wide` and `.narrow`, matching its policy.
    
    ## Accessibility
    
    [adw.view_switcher.ViewSwitcher] uses the [gtk.types.AccessibleRole.TabList] role and uses the
    [gtk.types.AccessibleRole.Tab] for its buttons.
*/
class ViewSwitcher : gtk.widget.Widget
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
    return cast(void function())adw_view_switcher_get_type != &gidSymbolNotFound ? adw_view_switcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcher self()
  {
    return this;
  }

  /**
      Get builder for [adw.view_switcher.ViewSwitcher]
      Returns: New builder object
  */
  static ViewSwitcherGidBuilder builder()
  {
    return new ViewSwitcherGidBuilder;
  }

  /**
      Get `policy` property.
      Returns: The policy to determine which mode to use.
  */
  @property adw.types.ViewSwitcherPolicy policy()
  {
    return getPolicy();
  }

  /**
      Set `policy` property.
      Params:
        propval = The policy to determine which mode to use.
  */
  @property void policy(adw.types.ViewSwitcherPolicy propval)
  {
    setPolicy(propval);
  }

  /**
      Get `stack` property.
      Returns: The stack the view switcher controls.
  */
  @property adw.view_stack.ViewStack stack()
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the view switcher controls.
  */
  @property void stack(adw.view_stack.ViewStack propval)
  {
    setStack(propval);
  }

  /**
      Creates a new [adw.view_switcher.ViewSwitcher].
      Returns: the newly created [adw.view_switcher.ViewSwitcher]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the policy of self.
      Returns: the policy of self
  */
  adw.types.ViewSwitcherPolicy getPolicy()
  {
    AdwViewSwitcherPolicy _cretval;
    _cretval = adw_view_switcher_get_policy(cast(AdwViewSwitcher*)this._cPtr);
    adw.types.ViewSwitcherPolicy _retval = cast(adw.types.ViewSwitcherPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the stack controlled by self.
      Returns: the stack
  */
  adw.view_stack.ViewStack getStack()
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_get_stack(cast(AdwViewSwitcher*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the policy of self.
  
      Params:
        policy = the new policy
  */
  void setPolicy(adw.types.ViewSwitcherPolicy policy)
  {
    adw_view_switcher_set_policy(cast(AdwViewSwitcher*)this._cPtr, policy);
  }

  /**
      Sets the stack controlled by self.
  
      Params:
        stack = a stack
  */
  void setStack(adw.view_stack.ViewStack stack = null)
  {
    adw_view_switcher_set_stack(cast(AdwViewSwitcher*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [adw.view_switcher.ViewSwitcher]
class ViewSwitcherGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `policy` property.
      Params:
        propval = The policy to determine which mode to use.
      Returns: Builder instance for fluent chaining
  */
  T policy(adw.types.ViewSwitcherPolicy propval)
  {
    return setProperty("policy", propval);
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the view switcher controls.
      Returns: Builder instance for fluent chaining
  */
  T stack(adw.view_stack.ViewStack propval)
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [adw.view_switcher.ViewSwitcher]
final class ViewSwitcherGidBuilder : ViewSwitcherGidBuilderImpl!ViewSwitcherGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewSwitcher build()
  {
    return new ViewSwitcher(cast(void*)createGObject(ViewSwitcher._getGType), No.Take);
  }
}
