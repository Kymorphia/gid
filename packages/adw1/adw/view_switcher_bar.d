/// Module for [ViewSwitcherBar] class
module adw.view_switcher_bar;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A view switcher action bar.
    
    <picture>
      <source srcset="view-switcher-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-bar.png" alt="view-switcher-bar">
    </picture>
    
    An action bar letting you switch between multiple views contained in a
    `class@ViewStack`, via an `class@ViewSwitcher`. It is designed to be put at
    the bottom of a window and to be revealed only on really narrow windows, e.g.
    on mobile phones. It can't be revealed if there are less than two pages.
    
    [adw.view_switcher_bar.ViewSwitcherBar] is intended to be used together with
    [adw.view_switcher.ViewSwitcher] in a header bar, and a `class@Breakpoint` showing the view
    switcher bar on narrow sizes, while removing the view switcher from the
    header bar, as follows:
    
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
    
    [adw.view_switcher_bar.ViewSwitcherBar] has a single CSS node with name` viewswitcherbar`.
*/
class ViewSwitcherBar : gtk.widget.Widget
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
    return cast(void function())adw_view_switcher_bar_get_type != &gidSymbolNotFound ? adw_view_switcher_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcherBar self()
  {
    return this;
  }

  /**
      Get `reveal` property.
      Returns: Whether the bar should be revealed or hidden.
  */
  @property bool reveal()
  {
    return getReveal();
  }

  /**
      Set `reveal` property.
      Params:
        propval = Whether the bar should be revealed or hidden.
  */
  @property void reveal(bool propval)
  {
    return setReveal(propval);
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
    return setStack(propval);
  }

  /**
      Creates a new [adw.view_switcher_bar.ViewSwitcherBar].
      Returns: the newly created [adw.view_switcher_bar.ViewSwitcherBar]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self should be revealed or hidden.
      Returns: whether self is revealed
  */
  bool getReveal()
  {
    bool _retval;
    _retval = cast(bool)adw_view_switcher_bar_get_reveal(cast(AdwViewSwitcherBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stack controlled by self.
      Returns: the stack
  */
  adw.view_stack.ViewStack getStack()
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_bar_get_stack(cast(AdwViewSwitcherBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether self should be revealed or hidden.
  
      Params:
        reveal = whether to reveal self
  */
  void setReveal(bool reveal)
  {
    adw_view_switcher_bar_set_reveal(cast(AdwViewSwitcherBar*)this._cPtr, reveal);
  }

  /**
      Sets the stack controlled by self.
  
      Params:
        stack = a stack
  */
  void setStack(adw.view_stack.ViewStack stack = null)
  {
    adw_view_switcher_bar_set_stack(cast(AdwViewSwitcherBar*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }
}
