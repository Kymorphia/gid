/// Module for [ShortcutsWindow] class
module gid.gtk3.shortcuts_window;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    A GtkShortcutsWindow shows brief information about the keyboard shortcuts
    and gestures of an application. The shortcuts can be grouped, and you can
    have multiple sections in this window, corresponding to the major modes of
    your application.
    
    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.
    
    The recommended way to construct a GtkShortcutsWindow is with GtkBuilder,
    by populating a #GtkShortcutsWindow with one or more #GtkShortcutsSection
    objects, which contain #GtkShortcutsGroups that in turn contain objects of
    class #GtkShortcutsShortcut.
    
    # A simple example:
    
    ![](gedit-shortcuts.png)
    
    This example has as single section. As you can see, the shortcut groups
    are arranged in columns, and spread across several pages if there are too
    many to find on a single page.
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-gedit.ui).
    
    # An example with multiple views:
    
    ![](clocks-shortcuts.png)
    
    This example shows a #GtkShortcutsWindow that has been configured to show only
    the shortcuts relevant to the "stopwatch" view.
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-clocks.ui).
    
    # An example with multiple sections:
    
    ![](builder-shortcuts.png)
    
    This example shows a #GtkShortcutsWindow with two sections, "Editor Shortcuts"
    and "Terminal Shortcuts".
    
    The .ui file for this example can be found [here](https://git.gnome.org/browse/gtk+/tree/demos/gtk-demo/shortcuts-builder.ui).
*/
class ShortcutsWindow : gid.gtk3.window.Window
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
    return cast(void function())gtk_shortcuts_window_get_type != &gidSymbolNotFound ? gtk_shortcuts_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutsWindow";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.shortcuts_window.ShortcutsWindow]
      Returns: New builder object
  */
  static ShortcutsWindowGidBuilder builder() nothrow
  {
    return new ShortcutsWindowGidBuilder;
  }

  /**
      Get `sectionName` property.
      Returns: The name of the section to show.
        
        This should be the section-name of one of the #GtkShortcutsSection
        objects that are in this shortcuts window.
  */
  @property string sectionName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("section-name");
  }

  /**
      Set `sectionName` property.
      Params:
        propval = The name of the section to show.
          
          This should be the section-name of one of the #GtkShortcutsSection
          objects that are in this shortcuts window.
  */
  @property void sectionName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("section-name", propval);
  }

  /**
      Get `viewName` property.
      Returns: The view name by which to filter the contents.
        
        This should correspond to the #GtkShortcutsGroup:view property of some of
        the #GtkShortcutsGroup objects that are inside this shortcuts window.
        
        Set this to null to show all groups.
  */
  @property string viewName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("view-name");
  }

  /**
      Set `viewName` property.
      Params:
        propval = The view name by which to filter the contents.
          
          This should correspond to the #GtkShortcutsGroup:view property of some of
          the #GtkShortcutsGroup objects that are inside this shortcuts window.
          
          Set this to null to show all groups.
  */
  @property void viewName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("view-name", propval);
  }

  /**
      Connect to `Close` signal.
  
      The ::close signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user uses a keybinding to close
        the window.
        
        The default binding for this signal is the Escape key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.shortcuts_window.ShortcutsWindow shortcutsWindow)`
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClose(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.shortcuts_window.ShortcutsWindow)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.shortcuts_window.ShortcutsWindow.close");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Search` signal.
  
      The ::search signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user uses a keybinding to start a search.
        
        The default binding for this signal is Control-F.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.shortcuts_window.ShortcutsWindow shortcutsWindow)`
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSearch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.shortcuts_window.ShortcutsWindow)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.shortcuts_window.ShortcutsWindow.search");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.shortcuts_window.ShortcutsWindow]
class ShortcutsWindowGidBuilderImpl(T) : gid.gtk3.window.WindowGidBuilderImpl!T
{


  /**
      Set `sectionName` property.
      Params:
        propval = The name of the section to show.
          
          This should be the section-name of one of the #GtkShortcutsSection
          objects that are in this shortcuts window.
      Returns: Builder instance for fluent chaining
  */
  T sectionName(string propval) nothrow
  {
    return setProperty("section-name", propval);
  }

  /**
      Set `viewName` property.
      Params:
        propval = The view name by which to filter the contents.
          
          This should correspond to the #GtkShortcutsGroup:view property of some of
          the #GtkShortcutsGroup objects that are inside this shortcuts window.
          
          Set this to null to show all groups.
      Returns: Builder instance for fluent chaining
  */
  T viewName(string propval) nothrow
  {
    return setProperty("view-name", propval);
  }
}

/// Fluent builder for [gid.gtk3.shortcuts_window.ShortcutsWindow]
final class ShortcutsWindowGidBuilder : ShortcutsWindowGidBuilderImpl!ShortcutsWindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsWindow build() nothrow
  {
    return new ShortcutsWindow(cast(void*)createGObject(ShortcutsWindow._getGType), Yes.Take);
  }
}
