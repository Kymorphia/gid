/// Module for [ShortcutsWindow] class
module gtk.shortcuts_window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

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
class ShortcutsWindow : gtk.window.Window
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
    return cast(void function())gtk_shortcuts_window_get_type != &gidSymbolNotFound ? gtk_shortcuts_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsWindow self()
  {
    return this;
  }

  /**
      Get `sectionName` property.
      Returns: The name of the section to show.
        
        This should be the section-name of one of the #GtkShortcutsSection
        objects that are in this shortcuts window.
  */
  @property string sectionName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("section-name");
  }

  /**
      Set `sectionName` property.
      Params:
        propval = The name of the section to show.
          
          This should be the section-name of one of the #GtkShortcutsSection
          objects that are in this shortcuts window.
  */
  @property void sectionName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("section-name", propval);
  }

  /**
      Get `viewName` property.
      Returns: The view name by which to filter the contents.
        
        This should correspond to the #GtkShortcutsGroup:view property of some of
        the #GtkShortcutsGroup objects that are inside this shortcuts window.
        
        Set this to null to show all groups.
  */
  @property string viewName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("view-name");
  }

  /**
      Set `viewName` property.
      Params:
        propval = The view name by which to filter the contents.
          
          This should correspond to the #GtkShortcutsGroup:view property of some of
          the #GtkShortcutsGroup objects that are inside this shortcuts window.
          
          Set this to null to show all groups.
  */
  @property void viewName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("view-name", propval);
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
  
          $(D void callback(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow))
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.shortcuts_window.ShortcutsWindow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow))
  
          `shortcutsWindow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSearch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.shortcuts_window.ShortcutsWindow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search", closure, after);
  }
}
