/// Module for [WindowHandle] class
module gtk.window_handle;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
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

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_handle_get_type != &gidSymbolNotFound ? gtk_window_handle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowHandle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.window_handle.WindowHandle]
      Returns: New builder object
  */
  static WindowHandleGidBuilder builder() nothrow
  {
    return new WindowHandleGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gtk.window_handle.WindowHandle].
      Returns: a new [gtk.window_handle.WindowHandle].
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_get_child(cast(GtkWindowHandle*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    gtk_window_handle_set_child(cast(GtkWindowHandle*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.window_handle.WindowHandle]
class WindowHandleGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gtk.window_handle.WindowHandle]
final class WindowHandleGidBuilder : WindowHandleGidBuilderImpl!WindowHandleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowHandle build() nothrow
  {
    return new WindowHandle(cast(void*)createGObject(WindowHandle._getGType), No.Take);
  }
}
