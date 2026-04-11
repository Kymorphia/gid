/// Module for [Root] interface mixin
module gtk.root_mixin;

public import gtk.root_iface_proxy;
public import gdk.display;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;
public import gtk.widget;

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
template RootT()
{

  /**
      Returns the display that this [gtk.root.Root] is on.
      Returns: the display of root
  */
  override gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_root_get_display(cast(GtkRoot*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the current focused widget within the root.
      
      Note that this is the widget that would have the focus
      if the root is active; if the root is not focused then
      `gtk_widget_has_focus (widget)` will be false for the
      widget.
      Returns: the currently focused widget
  */
  override gtk.widget.Widget getFocus()
  {
    GtkWidget* _cretval;
    _cretval = gtk_root_get_focus(cast(GtkRoot*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

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
  override void setFocus(gtk.widget.Widget focus = null)
  {
    gtk_root_set_focus(cast(GtkRoot*)this._cPtr, focus ? cast(GtkWidget*)focus._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.root.Root]
template RootGidBuilderT()
{
}
