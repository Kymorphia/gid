/// Module for [ViewSwitcherSidebar] class
module gid.adw1.view_switcher_sidebar;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.adw1.view_stack;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.filter;
import gid.gtk4.widget;

/**
    An adaptive sidebar that controls an [gid.adw1.view_stack.ViewStack].
    
    <picture>
      <source srcset="view-switcher-sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar.png" alt="view-switcher-sidebar">
    </picture>
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] is a view switcher implemented using a
    [gid.adw1.sidebar.Sidebar], in a similar fashion to [gid.gtk4.stack_sidebar.StackSidebar].
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] items have an icon, a label, as well as an unread
    dot or a badge.
    
    Unlike other switchers, [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] supports grouping pages into
    sections, using the [gid.adw1.view_stack_page.ViewStackPage.startsSection] and
    [gid.adw1.view_stack_page.ViewStackPage.sectionTitle] properties.
    
    Like [gid.adw1.sidebar.Sidebar], [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] is adaptive and can behave as
    a sidebar or a page, via the [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.mode] property.
    
    <picture>
      <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
    </picture>
    
    Connect to the [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.activated] signal to run code when
    an item has been activated. This can be used to toggle the visible pane when
    used in a split view.
    
    Like [gid.adw1.sidebar.Sidebar], [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] supports filtering items via the
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter] property.
    
    Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state
    widget. It will be shown when all items have been filtered out, or the
    sidebar has no items otherwise.
    
    ## CSS nodes
    
    [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar] has a single CSS node with name
    `view-switcher-sidebar`.
    
    See also: [gid.adw1.view_switcher.ViewSwitcher], [gid.adw1.view_switcher_bar.ViewSwitcherBar],
    [gid.adw1.inline_view_switcher.InlineViewSwitcher].
*/
class ViewSwitcherSidebar : gid.gtk4.widget.Widget
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
    return cast(void function())adw_view_switcher_sidebar_get_type != &gidSymbolNotFound ? adw_view_switcher_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwViewSwitcherSidebar";
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcherSidebar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar]
      Returns: New builder object
  */
  static ViewSwitcherSidebarGidBuilder builder() nothrow
  {
    return new ViewSwitcherSidebarGidBuilder;
  }

  /**
      Get `filter` property.
      Returns: The item filter.
        
        Can be used to implement search within the sidebar.
        
        Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
        
        See [gid.adw1.sidebar.Sidebar.filter].
  */
  @property gid.gtk4.filter.Filter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
          
          See [gid.adw1.sidebar.Sidebar.filter].
  */
  @property void filter(gid.gtk4.filter.Filter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `mode` property.
      Returns: Determines the sidebar's look and behavior.
        
        <picture>
          <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
          <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
        </picture>
        
        If set to [gid.adw1.types.SidebarMode.Sidebar], behaves like a sidebar: with a
        sidebar style and a persistent selection.
        
        If set to [gid.adw1.types.SidebarMode.Page], behaves like a page of boxed lists.
        
        The page mode is intended to be used with [gid.adw1.navigation_split_view.NavigationSplitView] when
        collapsed, as the sidebar pane becomes a page there.
        
        When used with [gid.adw1.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
        mode, as the sidebar pane is still a sidebar when collapsed.
        
        See [gid.adw1.sidebar.Sidebar.mode].
  */
  @property gid.adw1.types.SidebarMode mode() nothrow
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the sidebar's look and behavior.
          
          <picture>
            <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
          </picture>
          
          If set to [gid.adw1.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [gid.adw1.types.SidebarMode.Page], behaves like a page of boxed lists.
          
          The page mode is intended to be used with [gid.adw1.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [gid.adw1.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
          
          See [gid.adw1.sidebar.Sidebar.mode].
  */
  @property void mode(gid.adw1.types.SidebarMode propval) nothrow
  {
    setMode(propval);
  }

  /**
      Get `placeholder` property.
      Returns: The placeholder widget.
        
        This widget will be shown if the sidebar has no items, or all of its items
        have been filtered out by [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter].
        
        See [gid.adw1.sidebar.Sidebar.placeholder].
  */
  @property gid.gtk4.widget.Widget placeholder() nothrow
  {
    return getPlaceholder();
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter].
          
          See [gid.adw1.sidebar.Sidebar.placeholder].
  */
  @property void placeholder(gid.gtk4.widget.Widget propval) nothrow
  {
    setPlaceholder(propval);
  }

  /**
      Get `stack` property.
      Returns: The stack the sidebar controls.
  */
  @property gid.adw1.view_stack.ViewStack stack() nothrow
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the sidebar controls.
  */
  @property void stack(gid.adw1.view_stack.ViewStack propval) nothrow
  {
    setStack(propval);
  }

  /**
      Creates a new [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar].
      Returns: the newly created [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the item filter for self.
      Returns: the item filter
  */
  gid.gtk4.filter.Filter getFilter() nothrow
  {
    GtkFilter* _cretval;
    _cretval = adw_view_switcher_sidebar_get_filter(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets self's look and behavior.
      
      See [gid.adw1.sidebar.Sidebar.getMode].
      Returns: the current mode
  */
  gid.adw1.types.SidebarMode getMode() nothrow
  {
    AdwSidebarMode _cretval;
    _cretval = adw_view_switcher_sidebar_get_mode(cast(AdwViewSwitcherSidebar*)this._cPtr);
    gid.adw1.types.SidebarMode _retval = cast(gid.adw1.types.SidebarMode)_cretval;
    return _retval;
  }

  /**
      Gets the placeholder widget for self.
      Returns: the placeholder widget
  */
  gid.gtk4.widget.Widget getPlaceholder() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_sidebar_get_placeholder(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the stack self controls.
      Returns: The stack of self
  */
  gid.adw1.view_stack.ViewStack getStack() nothrow
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_sidebar_get_stack(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the item filter for self.
      
      Can be used to implement search within the sidebar.
      
      Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
      
      See [gid.adw1.sidebar.Sidebar.setFilter].
  
      Params:
        filter = the item filter
  */
  void setFilter(gid.gtk4.filter.Filter filter = null) nothrow
  {
    adw_view_switcher_sidebar_set_filter(cast(AdwViewSwitcherSidebar*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets self's look and behavior.
      
      <picture>
        <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
        <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
      </picture>
      
      If set to [gid.adw1.types.SidebarMode.Sidebar], behaves like a sidebar: with a
      sidebar style and a persistent selection.
      
      If set to [gid.adw1.types.SidebarMode.Page], behaves like a page of boxed lists.
      In this mode, the selection is invisible and only tracked to determine the
      initially selected item once switched back to sidebar mode.
      
      The page mode is intended to be used with [gid.adw1.navigation_split_view.NavigationSplitView] when
      collapsed, as the sidebar pane becomes a page there.
      
      When used with [gid.adw1.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
      mode, as the sidebar pane is still a sidebar when collapsed.
      
      See [gid.adw1.sidebar.Sidebar.setMode].
  
      Params:
        mode = the new mode
  */
  void setMode(gid.adw1.types.SidebarMode mode) nothrow
  {
    adw_view_switcher_sidebar_set_mode(cast(AdwViewSwitcherSidebar*)this._cPtr, mode);
  }

  /**
      Sets the placeholder widget for self.
      
      This widget will be shown if self has no items, or all of its items have
      been filtered out by [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter].
      
      See [gid.adw1.sidebar.Sidebar.setPlaceholder].
  
      Params:
        placeholder = the placeholder widget
  */
  void setPlaceholder(gid.gtk4.widget.Widget placeholder = null) nothrow
  {
    adw_view_switcher_sidebar_set_placeholder(cast(AdwViewSwitcherSidebar*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a stack
  */
  void setStack(gid.adw1.view_stack.ViewStack stack = null) nothrow
  {
    adw_view_switcher_sidebar_set_stack(cast(AdwViewSwitcherSidebar*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activated` signal.
  
      Emitted when an item has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar viewSwitcherSidebar)`
  
          `viewSwitcherSidebar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.activated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }
}

/// Fluent builder implementation template for [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar]
class ViewSwitcherSidebarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
          
          See [gid.adw1.sidebar.Sidebar.filter].
      Returns: Builder instance for fluent chaining
  */
  T filter(gid.gtk4.filter.Filter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the sidebar's look and behavior.
          
          <picture>
            <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
          </picture>
          
          If set to [gid.adw1.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [gid.adw1.types.SidebarMode.Page], behaves like a page of boxed lists.
          
          The page mode is intended to be used with [gid.adw1.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [gid.adw1.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
          
          See [gid.adw1.sidebar.Sidebar.mode].
      Returns: Builder instance for fluent chaining
  */
  T mode(gid.adw1.types.SidebarMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar.filter].
          
          See [gid.adw1.sidebar.Sidebar.placeholder].
      Returns: Builder instance for fluent chaining
  */
  T placeholder(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("placeholder", propval);
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the sidebar controls.
      Returns: Builder instance for fluent chaining
  */
  T stack(gid.adw1.view_stack.ViewStack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [gid.adw1.view_switcher_sidebar.ViewSwitcherSidebar]
final class ViewSwitcherSidebarGidBuilder : ViewSwitcherSidebarGidBuilderImpl!ViewSwitcherSidebarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewSwitcherSidebar build() nothrow
  {
    return new ViewSwitcherSidebar(cast(void*)createGObject(ViewSwitcherSidebar._getGType), Yes.Take);
  }
}
