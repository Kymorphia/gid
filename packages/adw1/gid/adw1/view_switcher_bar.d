/// Module for [ViewSwitcherBar] class
module gid.adw1.view_switcher_bar;

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
    A view switcher action bar.
    
    <picture>
      <source srcset="view-switcher-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-bar.png" alt="view-switcher-bar">
    </picture>
    
    An action bar letting you switch between multiple views contained in a
    [gid.adw1.view_stack.ViewStack], via an [gid.adw1.view_switcher.ViewSwitcher]. It is designed to be put at
    the bottom of a window and to be revealed only on really narrow windows, e.g.
    on mobile phones. It can't be revealed if there are less than two pages.
    
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] is intended to be used together with
    [gid.adw1.view_switcher.ViewSwitcher] in a header bar, and a [gid.adw1.breakpoint.Breakpoint] showing the view
    switcher bar on narrow sizes, while removing the view switcher from the
    header bar, as follows:
    
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
    
    [gid.adw1.view_switcher_bar.ViewSwitcherBar] has a single CSS node with name` viewswitcherbar`.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.inline_view_switcher.InlineViewSwitcher],
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
*/
class ViewSwitcherBar : gid.gtk4.widget.Widget
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
    return cast(void function())adw_view_switcher_bar_get_type != &gidSymbolNotFound ? adw_view_switcher_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwViewSwitcherBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcherBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.view_switcher_bar.ViewSwitcherBar]
      Returns: New builder object
  */
  static ViewSwitcherBarGidBuilder builder() nothrow
  {
    return new ViewSwitcherBarGidBuilder;
  }

  /**
      Get `reveal` property.
      Returns: Whether the bar should be revealed or hidden.
  */
  @property bool reveal() nothrow
  {
    return getReveal();
  }

  /**
      Set `reveal` property.
      Params:
        propval = Whether the bar should be revealed or hidden.
  */
  @property void reveal(bool propval) nothrow
  {
    setReveal(propval);
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
      Creates a new [gid.adw1.view_switcher_bar.ViewSwitcherBar].
      Returns: the newly created [gid.adw1.view_switcher_bar.ViewSwitcherBar]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_view_switcher_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets whether self should be revealed or hidden.
      Returns: whether self is revealed
  */
  bool getReveal() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_switcher_bar_get_reveal(cast(AdwViewSwitcherBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stack controlled by self.
      Returns: the stack
  */
  gid.adw1.view_stack.ViewStack getStack() nothrow
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_bar_get_stack(cast(AdwViewSwitcherBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether self should be revealed or hidden.
  
      Params:
        reveal = whether to reveal self
  */
  void setReveal(bool reveal) nothrow
  {
    adw_view_switcher_bar_set_reveal(cast(AdwViewSwitcherBar*)this._cPtr, reveal);
  }

  /**
      Sets the stack controlled by self.
  
      Params:
        stack = a stack
  */
  void setStack(gid.adw1.view_stack.ViewStack stack = null) nothrow
  {
    adw_view_switcher_bar_set_stack(cast(AdwViewSwitcherBar*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.view_switcher_bar.ViewSwitcherBar]
class ViewSwitcherBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `reveal` property.
      Params:
        propval = Whether the bar should be revealed or hidden.
      Returns: Builder instance for fluent chaining
  */
  T reveal(bool propval) nothrow
  {
    return setProperty("reveal", propval);
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

/// Fluent builder for [gid.adw1.view_switcher_bar.ViewSwitcherBar]
final class ViewSwitcherBarGidBuilder : ViewSwitcherBarGidBuilderImpl!ViewSwitcherBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewSwitcherBar build() nothrow
  {
    return new ViewSwitcherBar(cast(void*)createGObject(ViewSwitcherBar._getGType), Yes.Take);
  }
}
