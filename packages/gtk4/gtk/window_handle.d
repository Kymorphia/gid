module gtk.window_handle;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.window_handle.WindowHandle] is a titlebar area widget.
  
  When added into a window, it can be dragged to move the window, and handles
  right click, double click and middle click as expected of a titlebar.
  
  # CSS nodes
  
  [gtk.window_handle.WindowHandle] has a single CSS node with the name `windowhandle`.
  
  # Accessibility
  
  Until GTK 4.10, [gtk.window_handle.WindowHandle] used the [gtk.types.AccessibleRole.Group] role.
  
  Starting from GTK 4.12, [gtk.window_handle.WindowHandle] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class WindowHandle : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_handle_get_type != &gidSymbolNotFound ? gtk_window_handle_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new [gtk.window_handle.WindowHandle].
    Returns:     a new [gtk.window_handle.WindowHandle].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_get_child(cast(GtkWindowHandle*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_window_handle_set_child(cast(GtkWindowHandle*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }
}
