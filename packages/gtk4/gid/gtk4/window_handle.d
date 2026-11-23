/// Module for [WindowHandle] class
module gid.gtk4.window_handle;

public import gid.core.basictypes;
import gid.core.utils;
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
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Implements titlebar functionality for a window.
    
    When added into a window, it can be dragged to move the window,
    and it implements the right click, double click and middle click
    behaviors that are expected of a titlebar.
    
    # CSS nodes
    
    [gid.gtk4.window_handle.WindowHandle] has a single CSS node with the name `windowhandle`.
    
    # Accessibility
    
    Until GTK 4.10, [gid.gtk4.window_handle.WindowHandle] used the [gid.gtk4.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gid.gtk4.window_handle.WindowHandle] uses the [gid.gtk4.types.AccessibleRole.Generic]
    role.
*/
class WindowHandle : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_window_handle_get_type != &gidSymbolNotFound ? gtk_window_handle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindowHandle";
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowHandle self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.window_handle.WindowHandle]
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
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gid.gtk4.window_handle.WindowHandle].
      Returns: a new [gid.gtk4.window_handle.WindowHandle].
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
      _cretval = gtk_window_handle_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_handle_get_child(cast(GtkWindowHandle*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_window_handle_set_child(cast(GtkWindowHandle*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.window_handle.WindowHandle]
class WindowHandleGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.gtk4.window_handle.WindowHandle]
final class WindowHandleGidBuilder : WindowHandleGidBuilderImpl!WindowHandleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowHandle build() nothrow
  {
    return new WindowHandle(cast(void*)createGObject(WindowHandle._getGType), Yes.Take);
  }
}
