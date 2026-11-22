/// Module for [Root] interface mixin
module gid.gtk4.root_mixin;

public import gid.core.basictypes;
public import gid.gtk4.root_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.display;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;
public import gid.gtk4.widget;

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
template RootT()
{

  /**
      Returns the display that this [gid.gtk4.root.Root] is on.
      Returns: the display of root
  */
  override gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gtk_root_get_display(cast(GtkRoot*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
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
  override gid.gtk4.widget.Widget getFocus() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_root_get_focus(cast(GtkRoot*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

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
  override void setFocus(gid.gtk4.widget.Widget focus = null) nothrow
  {
    gtk_root_set_focus(cast(GtkRoot*)this._cPtr, focus ? cast(GtkWidget*)focus._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.root.Root]
template RootGidBuilderT()
{
}
