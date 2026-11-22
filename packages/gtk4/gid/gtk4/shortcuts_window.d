/// Module for [ShortcutsWindow] class
module gid.gtk4.shortcuts_window;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.shortcuts_section;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    A [gid.gtk4.shortcuts_window.ShortcutsWindow] shows information about the keyboard shortcuts
    and gestures of an application.
    
    The shortcuts can be grouped, and you can have multiple sections in this
    window, corresponding to the major modes of your application.
    
    Additionally, the shortcuts can be filtered by the current view, to avoid
    showing information that is not relevant in the current application context.
    
    The recommended way to construct a [gid.gtk4.shortcuts_window.ShortcutsWindow] is with
    [gid.gtk4.builder.Builder], by using the `<child>` tag to populate a
    [gid.gtk4.shortcuts_window.ShortcutsWindow] with one or more [gid.gtk4.shortcuts_section.ShortcutsSection] objects,
    which contain one or more [gid.gtk4.shortcuts_group.ShortcutsGroup] instances, which, in turn,
    contain [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut] instances.
    
    If you need to add a section programmatically, use [gid.gtk4.shortcuts_window.ShortcutsWindow.addSection]
    instead of [gid.gtk4.window.Window.setChild], as the shortcuts window manages
    its children directly.
    
    # A simple example:
    
    <picture>
      <source srcset="gedit-shortcuts-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="A simple example" src="gedit-shortcuts.png">
    </picture>
    
    This example has as single section. As you can see, the shortcut groups
    are arranged in columns, and spread across several pages if there are too
    many to find on a single page.
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-gedit.ui).
    
    # An example with multiple views:
    
    <picture>
      <source srcset="clocks-shortcuts-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example with multiple views" src="clocks-shortcuts.png">
    </picture>
    
    This example shows a [gid.gtk4.shortcuts_window.ShortcutsWindow] that has been configured to show only
    the shortcuts relevant to the “Stopwatch” view.
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-clocks.ui).
    
    # An example with multiple sections:
    
    <picture>
      <source srcset="builder-shortcuts-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example with multiple sections" src="builder-shortcuts.png">
    </picture>
    
    This example shows a [gid.gtk4.shortcuts_window.ShortcutsWindow] with two sections, “Editor Shortcuts”
    and “Terminal Shortcuts”.
    
    The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-builder.ui).
    
    # Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.shortcuts_window.ShortcutsWindow.close]
    - [gid.gtk4.shortcuts_window.ShortcutsWindow.search]
    
    # CSS nodes
    
    [gid.gtk4.shortcuts_window.ShortcutsWindow] has a single CSS node with the name `window` and style
    class `.shortcuts`.

    Deprecated: This widget will be removed in GTK 5
*/
class ShortcutsWindow : gid.gtk4.window.Window
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
      Get builder for [gid.gtk4.shortcuts_window.ShortcutsWindow]
      Returns: New builder object
  */
  static ShortcutsWindowGidBuilder builder() nothrow
  {
    return new ShortcutsWindowGidBuilder;
  }

  /**
      Get `sectionName` property.
      Returns: The name of the section to show.
        
        This should be the section-name of one of the [gid.gtk4.shortcuts_section.ShortcutsSection]
        objects that are in this shortcuts window.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string sectionName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("section-name");
  }

  /**
      Set `sectionName` property.
      Params:
        propval = The name of the section to show.
          
          This should be the section-name of one of the [gid.gtk4.shortcuts_section.ShortcutsSection]
          objects that are in this shortcuts window.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void sectionName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("section-name", propval);
  }

  /**
      Get `viewName` property.
      Returns: The view name by which to filter the contents.
        
        This should correspond to the [gid.gtk4.shortcuts_group.ShortcutsGroup.view]
        property of some of the [gid.gtk4.shortcuts_group.ShortcutsGroup] objects that
        are inside this shortcuts window.
        
        Set this to null to show all groups.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string viewName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("view-name");
  }

  /**
      Set `viewName` property.
      Params:
        propval = The view name by which to filter the contents.
          
          This should correspond to the [gid.gtk4.shortcuts_group.ShortcutsGroup.view]
          property of some of the [gid.gtk4.shortcuts_group.ShortcutsGroup] objects that
          are inside this shortcuts window.
          
          Set this to null to show all groups.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void viewName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("view-name", propval);
  }

  /**
      Adds a section to the shortcuts window.
      
      This is the programmatic equivalent to using [gid.gtk4.builder.Builder] and a
      `<child>` tag to add the child.
      
      Using [gid.gtk4.window.Window.setChild] is not appropriate as the shortcuts
      window manages its children internally.
  
      Params:
        section = the [gid.gtk4.shortcuts_section.ShortcutsSection] to add
  
      Deprecated: This widget will be removed in GTK 5
  */
  void addSection(gid.gtk4.shortcuts_section.ShortcutsSection section) nothrow
  {
    gtk_shortcuts_window_add_section(cast(GtkShortcutsWindow*)this._cPtr, section ? cast(GtkShortcutsSection*)section._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Close` signal.
  
      Emitted when the user uses a keybinding to close the window.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is the <kbd>Escape</kbd> key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.shortcuts_window.ShortcutsWindow shortcutsWindow)`
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectClose(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.shortcuts_window.ShortcutsWindow)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.shortcuts_window.ShortcutsWindow.close");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Connect to `Search` signal.
  
      Emitted when the user uses a keybinding to start a search.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Control</kbd>+<kbd>F</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.shortcuts_window.ShortcutsWindow shortcutsWindow)`
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This widget will be removed in GTK 5
  */
  gulong connectSearch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.shortcuts_window.ShortcutsWindow)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.shortcuts_window.ShortcutsWindow.search");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcuts_window.ShortcutsWindow]
class ShortcutsWindowGidBuilderImpl(T) : gid.gtk4.window.WindowGidBuilderImpl!T
{


  /**
      Set `sectionName` property.
      Params:
        propval = The name of the section to show.
          
          This should be the section-name of one of the [gid.gtk4.shortcuts_section.ShortcutsSection]
          objects that are in this shortcuts window.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T sectionName(string propval) nothrow
  {
    return setProperty("section-name", propval);
  }

  /**
      Set `viewName` property.
      Params:
        propval = The view name by which to filter the contents.
          
          This should correspond to the [gid.gtk4.shortcuts_group.ShortcutsGroup.view]
          property of some of the [gid.gtk4.shortcuts_group.ShortcutsGroup] objects that
          are inside this shortcuts window.
          
          Set this to null to show all groups.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T viewName(string propval) nothrow
  {
    return setProperty("view-name", propval);
  }
}

/// Fluent builder for [gid.gtk4.shortcuts_window.ShortcutsWindow]
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
