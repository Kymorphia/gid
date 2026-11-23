/// Module for [TabButton] class
module gid.adw1.tab_button;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.tab_view;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A button that displays the number of [gid.adw1.tab_view.TabView] pages.
    
    <picture>
      <source srcset="tab-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-button.png" alt="tab-button">
    </picture>
    
    [gid.adw1.tab_button.TabButton] is a button that displays the number of pages in a given
    [gid.adw1.tab_view.TabView], as well as whether one of the inactive pages needs attention.
    
    It's intended to be used as a visible indicator when there's no visible tab
    bar, typically opening an [gid.adw1.tab_overview.TabOverview] on click, e.g. via the
    `overview.open` action name:
    
    ```xml
    <object class="AdwTabButton">
      <property name="view">view</property>
      <property name="action-name">overview.open</property>
    </object>
    ```
    
    ## CSS nodes
    
    [gid.adw1.tab_button.TabButton] has a main CSS node with name `tabbutton`.
    
    # Accessibility
    
    [gid.adw1.tab_button.TabButton] uses the [gid.gtk4.types.AccessibleRole.Button] role.
*/
class TabButton : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())adw_tab_button_get_type != &gidSymbolNotFound ? adw_tab_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwTabButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override TabButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.tab_button.TabButton]
      Returns: New builder object
  */
  static TabButtonGidBuilder builder() nothrow
  {
    return new TabButtonGidBuilder;
  }

  /**
      Get `view` property.
      Returns: The view the tab button displays.
  */
  @property gid.adw1.tab_view.TabView view() nothrow
  {
    return getView();
  }

  /**
      Set `view` property.
      Params:
        propval = The view the tab button displays.
  */
  @property void view(gid.adw1.tab_view.TabView propval) nothrow
  {
    setView(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gid.adw1.tab_button.TabButton].
      Returns: the newly created [gid.adw1.tab_button.TabButton]
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
      _cretval = adw_tab_button_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the tab view self displays.
      Returns: the tab view
  */
  gid.adw1.tab_view.TabView getView() nothrow
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_button_get_view(cast(AdwTabButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_view.TabView)(cast(AdwTabView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the tab view to display.
  
      Params:
        view = a tab view
  */
  void setView(gid.adw1.tab_view.TabView view = null) nothrow
  {
    adw_tab_button_set_view(cast(AdwTabButton*)this._cPtr, view ? cast(AdwTabView*)view._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate press then release.
        
        This is an action signal. Applications should never connect to this signal,
        but use the [gid.adw1.tab_button.TabButton.clicked] signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_button.TabButton tabButton)`
  
          `tabButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_button.TabButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_button.TabButton.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `Clicked` signal.
  
      Emitted when the button has been activated (pressed and released).
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_button.TabButton tabButton)`
  
          `tabButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_button.TabButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_button.TabButton.clicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clicked", closure, after);
  }
}

/// Fluent builder implementation template for [gid.adw1.tab_button.TabButton]
class TabButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `view` property.
      Params:
        propval = The view the tab button displays.
      Returns: Builder instance for fluent chaining
  */
  T view(gid.adw1.tab_view.TabView propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.adw1.tab_button.TabButton]
final class TabButtonGidBuilder : TabButtonGidBuilderImpl!TabButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TabButton build() nothrow
  {
    return new TabButton(cast(void*)createGObject(TabButton._getGType), Yes.Take);
  }
}
