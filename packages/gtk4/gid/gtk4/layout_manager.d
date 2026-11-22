/// Module for [LayoutManager] class
module gid.gtk4.layout_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_child;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Handles the preferred size and allocation for children of a widget.
    
    You typically subclass [gid.gtk4.layout_manager.LayoutManager] if you want to implement a
    layout policy for the children of a widget, or if you want to determine
    the size of a widget depending on its contents.
    
    Each [gid.gtk4.widget.Widget] can only have a [gid.gtk4.layout_manager.LayoutManager] instance associated
    to it at any given time; it is possible, though, to replace the layout
    manager instance using [gid.gtk4.widget.Widget.setLayoutManager].
    
    ## Layout properties
    
    A layout manager can expose properties for controlling the layout of
    each child, by creating an object type derived from [gid.gtk4.layout_child.LayoutChild]
    and installing the properties on it as normal [gid.gobject2.object.ObjectWrap] properties.
    
    Each [gid.gtk4.layout_child.LayoutChild] instance storing the layout properties for a
    specific child is created through the [gid.gtk4.layout_manager.LayoutManager.getLayoutChild]
    method; a [gid.gtk4.layout_manager.LayoutManager] controls the creation of its [gid.gtk4.layout_child.LayoutChild]
    instances by overriding the GtkLayoutManagerClass.create_layout_child()
    virtual function. The typical implementation should look like:
    
    ```c
    static GtkLayoutChild *
    create_layout_child (GtkLayoutManager *manager,
                         GtkWidget        *container,
                         GtkWidget        *child)
    {
      return g_object_new (your_layout_child_get_type (),
                           "layout-manager", manager,
                           "child-widget", child,
                           NULL);
    }
    ```
    
    The [gid.gtk4.layout_child.LayoutChild.layoutManager] and
    [gid.gtk4.layout_child.LayoutChild.childWidget] properties
    on the newly created [gid.gtk4.layout_child.LayoutChild] instance are mandatory. The
    [gid.gtk4.layout_manager.LayoutManager] will cache the newly created [gid.gtk4.layout_child.LayoutChild] instance
    until the widget is removed from its parent, or the parent removes the
    layout manager.
    
    Each [gid.gtk4.layout_manager.LayoutManager] instance creating a [gid.gtk4.layout_child.LayoutChild] should use
    [gid.gtk4.layout_manager.LayoutManager.getLayoutChild] every time it needs to query
    the layout properties; each [gid.gtk4.layout_child.LayoutChild] instance should call
    [gid.gtk4.layout_manager.LayoutManager.layoutChanged] every time a property is
    updated, in order to queue a new size measuring and allocation.
*/
class LayoutManager : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_layout_manager_get_type != &gidSymbolNotFound ? gtk_layout_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLayoutManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.layout_manager.LayoutManager]
      Returns: New builder object
  */
  static LayoutManagerGidBuilder builder() nothrow
  {
    return new LayoutManagerGidBuilder;
  }

  /**
      Assigns the given width, height, and baseline to
      a widget, and computes the position and sizes of the children of
      the widget using the layout management policy of manager.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        width = the new width of the widget
        height = the new height of the widget
        baseline = the baseline position of the widget, or -1
  */
  void allocate(gid.gtk4.widget.Widget widget, int width, int height, int baseline) nothrow
  {
    gtk_layout_manager_allocate(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, height, baseline);
  }

  /**
      Retrieves a [gid.gtk4.layout_child.LayoutChild] instance for the [gid.gtk4.layout_manager.LayoutManager],
      creating one if necessary.
      
      The child widget must be a child of the widget using manager.
      
      The [gid.gtk4.layout_child.LayoutChild] instance is owned by the [gid.gtk4.layout_manager.LayoutManager],
      and is guaranteed to exist as long as child is a child of the
      [gid.gtk4.widget.Widget] using the given [gid.gtk4.layout_manager.LayoutManager].
  
      Params:
        child = a [gid.gtk4.widget.Widget]
      Returns: a [gid.gtk4.layout_child.LayoutChild]
  */
  gid.gtk4.layout_child.LayoutChild getLayoutChild(gid.gtk4.widget.Widget child) nothrow
  {
    GtkLayoutChild* _cretval;
    _cretval = gtk_layout_manager_get_layout_child(cast(GtkLayoutManager*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.layout_child.LayoutChild)(cast(GtkLayoutChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the request mode of manager.
      Returns: a [gid.gtk4.types.SizeRequestMode]
  */
  gid.gtk4.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_layout_manager_get_request_mode(cast(GtkLayoutManager*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.widget.Widget] using the given [gid.gtk4.layout_manager.LayoutManager].
      Returns: a [gid.gtk4.widget.Widget]
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_manager_get_widget(cast(GtkLayoutManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queues a resize on the [gid.gtk4.widget.Widget] using manager, if any.
      
      This function should be called by subclasses of [gid.gtk4.layout_manager.LayoutManager]
      in response to changes to their layout management policies.
  */
  void layoutChanged() nothrow
  {
    gtk_layout_manager_layout_changed(cast(GtkLayoutManager*)this._cPtr);
  }

  /**
      Measures the size of the widget using manager, for the
      given orientation and size.
      
      See the [gid.gtk4.widget.Widget] documentation on layout management for
      more details.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation; for instance, if
            the orientation is [gid.gtk4.types.Orientation.Horizontal], this is the height
            of the widget; if the orientation is [gid.gtk4.types.Orientation.Vertical], this
            is the width of the widget. This allows to measure the height for the
            given width, and the width for the given height. Use -1 if the size
            is not known
        minimum = the minimum size for the given size and
            orientation
        natural = the natural, or preferred size for the
            given size and orientation
        minimumBaseline = the baseline position for the
            minimum size
        naturalBaseline = the baseline position for the
            natural size
  */
  void measure(gid.gtk4.widget.Widget widget, gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline) nothrow
  {
    gtk_layout_manager_measure(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }
}

/// Fluent builder implementation template for [gid.gtk4.layout_manager.LayoutManager]
class LayoutManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.layout_manager.LayoutManager]
final class LayoutManagerGidBuilder : LayoutManagerGidBuilderImpl!LayoutManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutManager build() nothrow
  {
    return new LayoutManager(cast(void*)createGObject(LayoutManager._getGType), Yes.Take);
  }
}
