/// Module for [NavigationPage] class
module gid.adw1.navigation_page;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.dclosure;
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
    A page within [gid.adw1.navigation_view.NavigationView] or [gid.adw1.navigation_split_view.NavigationSplitView].
    
    Each page has a child widget, a title and optionally a tag.
    
    The [gid.adw1.navigation_page.NavigationPage.showing], [gid.adw1.navigation_page.NavigationPage.shown],
    [gid.adw1.navigation_page.NavigationPage.hiding] and [gid.adw1.navigation_page.NavigationPage.hidden] signals
    can be used to track the page's visibility within its [gid.adw1.navigation_view.NavigationView].
    
    ## Header Bar Integration
    
    When placed inside [gid.adw1.navigation_page.NavigationPage], [gid.adw1.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with [gid.adw1.navigation_view.NavigationView], it will also display a back
    button that can be used to go back to the previous page. Set
    [gid.adw1.header_bar.HeaderBar.showBackButton] to `FALSE` to disable that behavior if
    it's unwanted.
    
    ## CSS Nodes
    
    [gid.adw1.navigation_page.NavigationPage] has a single CSS node with name
    `navigation-view-page`.
    
    ## Accessibility
    
    [gid.adw1.navigation_page.NavigationPage] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class NavigationPage : gid.gtk4.widget.Widget
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
    return cast(void function())adw_navigation_page_get_type != &gidSymbolNotFound ? adw_navigation_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwNavigationPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.navigation_page.NavigationPage]
      Returns: New builder object
  */
  static NavigationPageGidBuilder builder() nothrow
  {
    return new NavigationPageGidBuilder;
  }

  /**
      Get `canPop` property.
      Returns: Whether the page can be popped from navigation stack.
        
        Set it to `FALSE` to disable shortcuts and gestures, as well as remove the
        back button from [gid.adw1.header_bar.HeaderBar].
        
        Manually calling [gid.adw1.navigation_view.NavigationView.pop] or using the `navigation.pop`
        action will still work.
        
        See [gid.adw1.header_bar.HeaderBar.showBackButton] for removing only the back
        button, but not shortcuts.
  */
  @property bool canPop() nothrow
  {
    return getCanPop();
  }

  /**
      Set `canPop` property.
      Params:
        propval = Whether the page can be popped from navigation stack.
          
          Set it to `FALSE` to disable shortcuts and gestures, as well as remove the
          back button from [gid.adw1.header_bar.HeaderBar].
          
          Manually calling [gid.adw1.navigation_view.NavigationView.pop] or using the `navigation.pop`
          action will still work.
          
          See [gid.adw1.header_bar.HeaderBar.showBackButton] for removing only the back
          button, but not shortcuts.
  */
  @property void canPop(bool propval) nothrow
  {
    setCanPop(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `tag` property.
      Returns: The page tag.
        
        The tag can be used to retrieve the page with
        [gid.adw1.navigation_view.NavigationView.findPage], as well as with
        [gid.adw1.navigation_view.NavigationView.pushByTag], [gid.adw1.navigation_view.NavigationView.popToTag] or
        [gid.adw1.navigation_view.NavigationView.replaceWithTags].
        
        Tags must be unique within each [gid.adw1.navigation_view.NavigationView].
        
        The tag also must be set to use the `navigation.push` action.
  */
  @property string tag() nothrow
  {
    return getTag();
  }

  /**
      Set `tag` property.
      Params:
        propval = The page tag.
          
          The tag can be used to retrieve the page with
          [gid.adw1.navigation_view.NavigationView.findPage], as well as with
          [gid.adw1.navigation_view.NavigationView.pushByTag], [gid.adw1.navigation_view.NavigationView.popToTag] or
          [gid.adw1.navigation_view.NavigationView.replaceWithTags].
          
          Tags must be unique within each [gid.adw1.navigation_view.NavigationView].
          
          The tag also must be set to use the `navigation.push` action.
  */
  @property void tag(string propval) nothrow
  {
    setTag(propval);
  }

  /**
      Get `title` property.
      Returns: The page title.
        
        It's displayed in [gid.adw1.header_bar.HeaderBar] instead of the window title, and used
        as the tooltip on the next page's back button, as well as by screen reader.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The page title.
          
          It's displayed in [gid.adw1.header_bar.HeaderBar] instead of the window title, and used
          as the tooltip on the next page's back button, as well as by screen reader.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [gid.adw1.navigation_page.NavigationPage].
  
      Params:
        child = the child widget
        title = the page title
      Returns: the new created [gid.adw1.navigation_page.NavigationPage]
  */
  this(gid.gtk4.widget.Widget child, string title) nothrow
  {
    AdwNavigationPage* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_navigation_page_new(child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _title);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gid.adw1.navigation_page.NavigationPage] with provided tag.
  
      Params:
        child = the child widget
        title = the page title
        tag = the page tag
      Returns: the new created [gid.adw1.navigation_page.NavigationPage]
  */
  static gid.adw1.navigation_page.NavigationPage newWithTag(gid.gtk4.widget.Widget child, string title, string tag) nothrow
  {
    AdwNavigationPage* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    const(char)* _tag = tag.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_navigation_page_new_with_tag(child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _title, _tag);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self can be popped from navigation stack.
      Returns: whether the page can be popped from navigation stack
  */
  bool getCanPop() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_page_get_can_pop(cast(AdwNavigationPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_navigation_page_get_child(cast(AdwNavigationPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the tag of self.
      Returns: the page tag
  */
  string getTag() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_navigation_page_get_tag(cast(AdwNavigationPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title of self
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_navigation_page_get_title(cast(AdwNavigationPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets whether self can be popped from navigation stack.
      
      Set it to `FALSE` to disable shortcuts and gestures, as well as remove the
      back button from [gid.adw1.header_bar.HeaderBar].
      
      Manually calling [gid.adw1.navigation_view.NavigationView.pop] or using the `navigation.pop`
      action will still work.
      
      See [gid.adw1.header_bar.HeaderBar.showBackButton] for removing only the back button,
      but not shortcuts.
  
      Params:
        canPop = whether the page can be popped from navigation stack
  */
  void setCanPop(bool canPop) nothrow
  {
    adw_navigation_page_set_can_pop(cast(AdwNavigationPage*)this._cPtr, canPop);
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    adw_navigation_page_set_child(cast(AdwNavigationPage*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the tag for self.
      
      The tag can be used to retrieve the page with
      [gid.adw1.navigation_view.NavigationView.findPage], as well as with
      [gid.adw1.navigation_view.NavigationView.pushByTag], [gid.adw1.navigation_view.NavigationView.popToTag] or
      [gid.adw1.navigation_view.NavigationView.replaceWithTags].
      
      Tags must be unique within each [gid.adw1.navigation_view.NavigationView].
      
      The tag also must be set to use the `navigation.push` action.
  
      Params:
        tag = the page tag
  */
  void setTag(string tag = null) nothrow
  {
    const(char)* _tag = tag.toCString!(No.Malloc, Yes.Nullable);
    adw_navigation_page_set_tag(cast(AdwNavigationPage*)this._cPtr, _tag);
  }

  /**
      Sets the title of self.
      
      It's displayed in [gid.adw1.header_bar.HeaderBar] instead of the window title, and used as
      the tooltip on the next page's back button, as well as by screen reader.
  
      Params:
        title = the title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_navigation_page_set_title(cast(AdwNavigationPage*)this._cPtr, _title);
  }

  /**
      Connect to `Hidden` signal.
  
      Emitted when the navigation view transition has been completed and the page
        is fully hidden.
        
        It will always be preceded by [gid.adw1.navigation_page.NavigationPage.hiding] or
        [gid.adw1.navigation_page.NavigationPage.showing].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.navigation_page.NavigationPage navigationPage)`
  
          `navigationPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHidden(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.navigation_page.NavigationPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.navigation_page.NavigationPage.hidden");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hidden", closure, after);
  }

  /**
      Connect to `Hiding` signal.
  
      Emitted when the page starts hiding at the beginning of the navigation view
        transition.
        
        It will always be followed by [gid.adw1.navigation_page.NavigationPage.hidden] or
        [gid.adw1.navigation_page.NavigationPage.shown].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.navigation_page.NavigationPage navigationPage)`
  
          `navigationPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHiding(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.navigation_page.NavigationPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.navigation_page.NavigationPage.hiding");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hiding", closure, after);
  }

  /**
      Connect to `Showing` signal.
  
      Emitted when the page shows at the beginning of the navigation view
        transition.
        
        It will always be followed by [gid.adw1.navigation_page.NavigationPage.shown] or
        [gid.adw1.navigation_page.NavigationPage.hidden].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.navigation_page.NavigationPage navigationPage)`
  
          `navigationPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShowing(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.navigation_page.NavigationPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.navigation_page.NavigationPage.showing");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("showing", closure, after);
  }

  /**
      Connect to `Shown` signal.
  
      Emitted when the navigation view transition has been completed and the page
        is fully shown.
        
        It will always be preceded by [gid.adw1.navigation_page.NavigationPage.showing] or
        [gid.adw1.navigation_page.NavigationPage.hiding].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.navigation_page.NavigationPage navigationPage)`
  
          `navigationPage` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShown(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.navigation_page.NavigationPage)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.navigation_page.NavigationPage.shown");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("shown", closure, after);
  }
}

/// Fluent builder implementation template for [gid.adw1.navigation_page.NavigationPage]
class NavigationPageGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `canPop` property.
      Params:
        propval = Whether the page can be popped from navigation stack.
          
          Set it to `FALSE` to disable shortcuts and gestures, as well as remove the
          back button from [gid.adw1.header_bar.HeaderBar].
          
          Manually calling [gid.adw1.navigation_view.NavigationView.pop] or using the `navigation.pop`
          action will still work.
          
          See [gid.adw1.header_bar.HeaderBar.showBackButton] for removing only the back
          button, but not shortcuts.
      Returns: Builder instance for fluent chaining
  */
  T canPop(bool propval) nothrow
  {
    return setProperty("can-pop", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `tag` property.
      Params:
        propval = The page tag.
          
          The tag can be used to retrieve the page with
          [gid.adw1.navigation_view.NavigationView.findPage], as well as with
          [gid.adw1.navigation_view.NavigationView.pushByTag], [gid.adw1.navigation_view.NavigationView.popToTag] or
          [gid.adw1.navigation_view.NavigationView.replaceWithTags].
          
          Tags must be unique within each [gid.adw1.navigation_view.NavigationView].
          
          The tag also must be set to use the `navigation.push` action.
      Returns: Builder instance for fluent chaining
  */
  T tag(string propval) nothrow
  {
    return setProperty("tag", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The page title.
          
          It's displayed in [gid.adw1.header_bar.HeaderBar] instead of the window title, and used
          as the tooltip on the next page's back button, as well as by screen reader.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.adw1.navigation_page.NavigationPage]
final class NavigationPageGidBuilder : NavigationPageGidBuilderImpl!NavigationPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NavigationPage build() nothrow
  {
    return new NavigationPage(cast(void*)createGObject(NavigationPage._getGType), Yes.Take);
  }
}
