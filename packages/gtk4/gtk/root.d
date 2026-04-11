/// Module for [Root] interface
module gtk.root;

public import gtk.root_iface_proxy;
import gdk.display;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.root.Root] is the interface implemented by all widgets that can act as a toplevel
    widget.
    
    The root widget takes care of providing the connection to the windowing system
    and manages layout, drawing and event delivery for its widget hierarchy.
    
    The obvious example of a [gtk.root.Root] is [gtk.window.Window].
    
    To get the display to which a [gtk.root.Root] belongs, use
    [gtk.root.Root.getDisplay].
    
    [gtk.root.Root] also maintains the location of keyboard focus inside its widget
    hierarchy, with [gtk.root.Root.setFocus] and [gtk.root.Root.getFocus].
*/
interface Root
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_root_get_type != &gidSymbolNotFound ? gtk_root_get_type() : cast(GType)0;
  }

  /**
      Returns the display that this [gtk.root.Root] is on.
      Returns: the display of root
  */
  gdk.display.Display getDisplay();

  /**
      Retrieves the current focused widget within the root.
      
      Note that this is the widget that would have the focus
      if the root is active; if the root is not focused then
      `gtk_widget_has_focus (widget)` will be false for the
      widget.
      Returns: the currently focused widget
  */
  gtk.widget.Widget getFocus();

  /**
      If focus is not the current focus widget, and is focusable, sets
      it as the focus widget for the root.
      
      If focus is null, unsets the focus widget for the root.
      
      To set the focus to a particular widget in the root, it is usually
      more convenient to use [gtk.widget.Widget.grabFocus] instead of
      this function.
  
      Params:
        focus = widget to be the new focus widget, or null
             to unset the focus widget
  */
  void setFocus(gtk.widget.Widget focus = null);
}

/// Fluent builder implementation template for [gtk.root.Root]
interface RootGidBuilderImpl(T)
{
}
