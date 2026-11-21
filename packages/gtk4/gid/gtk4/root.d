/// Module for [Root] interface
module gid.gtk4.root;

public import gid.core.basictypes;
public import gid.gtk4.root_iface_proxy;
import gid.core.gid;
import gid.gdk4.display;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.native;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    An interface for widgets that can act as the root of a widget hierarchy.
    
    The root widget takes care of providing the connection to the windowing
    system and manages layout, drawing and event delivery for its widget
    hierarchy.
    
    The obvious example of a [gid.gtk4.root.Root] is [gid.gtk4.window.Window].
    
    To get the display to which a [gid.gtk4.root.Root] belongs, use
    [gid.gtk4.root.Root.getDisplay].
    
    [gid.gtk4.root.Root] also maintains the location of keyboard focus inside its widget
    hierarchy, with [gid.gtk4.root.Root.setFocus] and [gid.gtk4.root.Root.getFocus].
*/
interface Root : gid.gtk4.native.Native
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_root_get_type != &gidSymbolNotFound ? gtk_root_get_type() : cast(GType)0;
  }

  /**
      Returns the display that this [gid.gtk4.root.Root] is on.
      Returns: the display of root
  */
  gid.gdk4.display.Display getDisplay();

  /**
      Retrieves the current focused widget within the root.
      
      Note that this is the widget that would have the focus
      if the root is active; if the root is not focused then
      `gtk_widget_has_focus (widget)` will be false for the
      widget.
      Returns: the currently focused widget
  */
  gid.gtk4.widget.Widget getFocus();

  /**
      If focus is not the current focus widget, and is focusable, sets
      it as the focus widget for the root.
      
      If focus is null, unsets the focus widget for the root.
      
      To set the focus to a particular widget in the root, it is usually
      more convenient to use [gid.gtk4.widget.Widget.grabFocus] instead of
      this function.
  
      Params:
        focus = widget to be the new focus widget, or null
             to unset the focus widget
  */
  void setFocus(gid.gtk4.widget.Widget focus = null);
}

/// Fluent builder implementation template for [gid.gtk4.root.Root]
interface RootGidBuilderImpl(T) : gid.gtk4.native.NativeGidBuilderImpl!T
{
}
