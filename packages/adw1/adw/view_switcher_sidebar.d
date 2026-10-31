/// Module for [ViewSwitcherSidebar] class
module adw.view_switcher_sidebar;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.filter;
import gtk.widget;

/**
    An adaptive sidebar that controls an [adw.view_stack.ViewStack].
    
    <picture>
      <source srcset="view-switcher-sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar.png" alt="view-switcher-sidebar">
    </picture>
    
    [adw.view_switcher_sidebar.ViewSwitcherSidebar] is a view switcher implemented using a
    [adw.sidebar.Sidebar], in a similar fashion to [gtk.stack_sidebar.StackSidebar].
    
    [adw.view_switcher_sidebar.ViewSwitcherSidebar] items have an icon, a label, as well as an unread
    dot or a badge.
    
    Unlike other switchers, [adw.view_switcher_sidebar.ViewSwitcherSidebar] supports grouping pages into
    sections, using the [adw.view_stack_page.ViewStackPage.startsSection] and
    [adw.view_stack_page.ViewStackPage.sectionTitle] properties.
    
    Like [adw.sidebar.Sidebar], [adw.view_switcher_sidebar.ViewSwitcherSidebar] is adaptive and can behave as
    a sidebar or a page, via the [adw.view_switcher_sidebar.ViewSwitcherSidebar.mode] property.
    
    <picture>
      <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
    </picture>
    
    Connect to the [adw.view_switcher_sidebar.ViewSwitcherSidebar.activated] signal to run code when
    an item has been activated. This can be used to toggle the visible pane when
    used in a split view.
    
    Like [adw.sidebar.Sidebar], [adw.view_switcher_sidebar.ViewSwitcherSidebar] supports filtering items via the
    [adw.view_switcher_sidebar.ViewSwitcherSidebar.filter] property.
    
    Use [adw.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state
    widget. It will be shown when all items have been filtered out, or the
    sidebar has no items otherwise.
    
    ## CSS nodes
    
    [adw.view_switcher_sidebar.ViewSwitcherSidebar] has a single CSS node with name
    `view-switcher-sidebar`.
    
    See also: [adw.view_switcher.ViewSwitcher], [adw.view_switcher_bar.ViewSwitcherBar],
    [adw.inline_view_switcher.InlineViewSwitcher].
*/
class ViewSwitcherSidebar : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_view_switcher_sidebar_get_type != &gidSymbolNotFound ? adw_view_switcher_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewSwitcherSidebar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.view_switcher_sidebar.ViewSwitcherSidebar]
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
        
        Use [adw.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
        
        See [adw.sidebar.Sidebar.filter].
  */
  @property gtk.filter.Filter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [adw.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
          
          See [adw.sidebar.Sidebar.filter].
  */
  @property void filter(gtk.filter.Filter propval) nothrow
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
        
        If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
        sidebar style and a persistent selection.
        
        If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
        
        The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
        collapsed, as the sidebar pane becomes a page there.
        
        When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
        mode, as the sidebar pane is still a sidebar when collapsed.
        
        See [adw.sidebar.Sidebar.mode].
  */
  @property adw.types.SidebarMode mode() nothrow
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
          
          If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
          
          The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
          
          See [adw.sidebar.Sidebar.mode].
  */
  @property void mode(adw.types.SidebarMode propval) nothrow
  {
    setMode(propval);
  }

  /**
      Get `placeholder` property.
      Returns: The placeholder widget.
        
        This widget will be shown if the sidebar has no items, or all of its items
        have been filtered out by [adw.view_switcher_sidebar.ViewSwitcherSidebar.filter].
        
        See [adw.sidebar.Sidebar.placeholder].
  */
  @property gtk.widget.Widget placeholder() nothrow
  {
    return getPlaceholder();
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [adw.view_switcher_sidebar.ViewSwitcherSidebar.filter].
          
          See [adw.sidebar.Sidebar.placeholder].
  */
  @property void placeholder(gtk.widget.Widget propval) nothrow
  {
    setPlaceholder(propval);
  }

  /**
      Get `stack` property.
      Returns: The stack the sidebar controls.
  */
  @property adw.view_stack.ViewStack stack() nothrow
  {
    return getStack();
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the sidebar controls.
  */
  @property void stack(adw.view_stack.ViewStack propval) nothrow
  {
    setStack(propval);
  }

  /**
      Creates a new [adw.view_switcher_sidebar.ViewSwitcherSidebar].
      Returns: the newly created [adw.view_switcher_sidebar.ViewSwitcherSidebar]
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
  gtk.filter.Filter getFilter() nothrow
  {
    GtkFilter* _cretval;
    _cretval = adw_view_switcher_sidebar_get_filter(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets self's look and behavior.
      
      See [adw.sidebar.Sidebar.getMode].
      Returns: the current mode
  */
  adw.types.SidebarMode getMode() nothrow
  {
    AdwSidebarMode _cretval;
    _cretval = adw_view_switcher_sidebar_get_mode(cast(AdwViewSwitcherSidebar*)this._cPtr);
    adw.types.SidebarMode _retval = cast(adw.types.SidebarMode)_cretval;
    return _retval;
  }

  /**
      Gets the placeholder widget for self.
      Returns: the placeholder widget
  */
  gtk.widget.Widget getPlaceholder() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_sidebar_get_placeholder(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the stack self controls.
      Returns: The stack of self
  */
  adw.view_stack.ViewStack getStack() nothrow
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_sidebar_get_stack(cast(AdwViewSwitcherSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the item filter for self.
      
      Can be used to implement search within the sidebar.
      
      Use [adw.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
      
      See [adw.sidebar.Sidebar.setFilter].
  
      Params:
        filter = the item filter
  */
  void setFilter(gtk.filter.Filter filter = null) nothrow
  {
    adw_view_switcher_sidebar_set_filter(cast(AdwViewSwitcherSidebar*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets self's look and behavior.
      
      <picture>
        <source srcset="view-switcher-sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
        <img src="view-switcher-sidebar-modes.png" alt="view-switcher-sidebar-modes">
      </picture>
      
      If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
      sidebar style and a persistent selection.
      
      If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
      In this mode, the selection is invisible and only tracked to determine the
      initially selected item once switched back to sidebar mode.
      
      The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
      collapsed, as the sidebar pane becomes a page there.
      
      When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
      mode, as the sidebar pane is still a sidebar when collapsed.
      
      See [adw.sidebar.Sidebar.setMode].
  
      Params:
        mode = the new mode
  */
  void setMode(adw.types.SidebarMode mode) nothrow
  {
    adw_view_switcher_sidebar_set_mode(cast(AdwViewSwitcherSidebar*)this._cPtr, mode);
  }

  /**
      Sets the placeholder widget for self.
      
      This widget will be shown if self has no items, or all of its items have
      been filtered out by [adw.view_switcher_sidebar.ViewSwitcherSidebar.filter].
      
      See [adw.sidebar.Sidebar.setPlaceholder].
  
      Params:
        placeholder = the placeholder widget
  */
  void setPlaceholder(gtk.widget.Widget placeholder = null) nothrow
  {
    adw_view_switcher_sidebar_set_placeholder(cast(AdwViewSwitcherSidebar*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets the stack to control.
  
      Params:
        stack = a stack
  */
  void setStack(adw.view_stack.ViewStack stack = null) nothrow
  {
    adw_view_switcher_sidebar_set_stack(cast(AdwViewSwitcherSidebar*)this._cPtr, stack ? cast(AdwViewStack*)stack._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activated` signal.
  
      Emitted when an item has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.view_switcher_sidebar.ViewSwitcherSidebar viewSwitcherSidebar)`
  
          `viewSwitcherSidebar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.view_switcher_sidebar.ViewSwitcherSidebar)))
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
        gidInvokeCallbackExceptionHandler(e, "adw.view_switcher_sidebar.ViewSwitcherSidebar.activated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }
}

/// Fluent builder implementation template for [adw.view_switcher_sidebar.ViewSwitcherSidebar]
class ViewSwitcherSidebarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [adw.view_switcher_sidebar.ViewSwitcherSidebar.placeholder] to provide an empty state.
          
          See [adw.sidebar.Sidebar.filter].
      Returns: Builder instance for fluent chaining
  */
  T filter(gtk.filter.Filter propval) nothrow
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
          
          If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
          
          The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
          
          See [adw.sidebar.Sidebar.mode].
      Returns: Builder instance for fluent chaining
  */
  T mode(adw.types.SidebarMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [adw.view_switcher_sidebar.ViewSwitcherSidebar.filter].
          
          See [adw.sidebar.Sidebar.placeholder].
      Returns: Builder instance for fluent chaining
  */
  T placeholder(gtk.widget.Widget propval) nothrow
  {
    return setProperty("placeholder", propval);
  }

  /**
      Set `stack` property.
      Params:
        propval = The stack the sidebar controls.
      Returns: Builder instance for fluent chaining
  */
  T stack(adw.view_stack.ViewStack propval) nothrow
  {
    return setProperty("stack", propval);
  }
}

/// Fluent builder for [adw.view_switcher_sidebar.ViewSwitcherSidebar]
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
