/// Module for [LayoutManager] class
module gtk.layout_manager;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;
import gtk.widget;

/**
    Layout managers are delegate classes that handle the preferred size
    and the allocation of a widget.
    
    You typically subclass [gtk.layout_manager.LayoutManager] if you want to implement a
    layout policy for the children of a widget, or if you want to determine
    the size of a widget depending on its contents.
    
    Each [gtk.widget.Widget] can only have a [gtk.layout_manager.LayoutManager] instance associated
    to it at any given time; it is possible, though, to replace the layout
    manager instance using [gtk.widget.Widget.setLayoutManager].
    
    ## Layout properties
    
    A layout manager can expose properties for controlling the layout of
    each child, by creating an object type derived from [gtk.layout_child.LayoutChild]
    and installing the properties on it as normal [gobject.object.ObjectWrap] properties.
    
    Each [gtk.layout_child.LayoutChild] instance storing the layout properties for a
    specific child is created through the [gtk.layout_manager.LayoutManager.getLayoutChild]
    method; a [gtk.layout_manager.LayoutManager] controls the creation of its [gtk.layout_child.LayoutChild]
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
    
    The `property@Gtk.LayoutChild:layout-manager` and
    `property@Gtk.LayoutChild:child-widget` properties
    on the newly created [gtk.layout_child.LayoutChild] instance are mandatory. The
    [gtk.layout_manager.LayoutManager] will cache the newly created [gtk.layout_child.LayoutChild] instance
    until the widget is removed from its parent, or the parent removes the
    layout manager.
    
    Each [gtk.layout_manager.LayoutManager] instance creating a [gtk.layout_child.LayoutChild] should use
    [gtk.layout_manager.LayoutManager.getLayoutChild] every time it needs to query
    the layout properties; each [gtk.layout_child.LayoutChild] instance should call
    [gtk.layout_manager.LayoutManager.layoutChanged] every time a property is
    updated, in order to queue a new size measuring and allocation.
*/
class LayoutManager : gobject.object.ObjectWrap
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
    return cast(void function())gtk_layout_manager_get_type != &gidSymbolNotFound ? gtk_layout_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutManager self()
  {
    return this;
  }

  /**
      Get builder for [gtk.layout_manager.LayoutManager]
      Returns: New builder object
  */
  static LayoutManagerGidBuilder builder()
  {
    return new LayoutManagerGidBuilder;
  }

  /**
      Assigns the given width, height, and baseline to
      a widget, and computes the position and sizes of the children of
      the widget using the layout management policy of manager.
  
      Params:
        widget = the [gtk.widget.Widget] using manager
        width = the new width of the widget
        height = the new height of the widget
        baseline = the baseline position of the widget, or -1
  */
  void allocate(gtk.widget.Widget widget, int width, int height, int baseline)
  {
    gtk_layout_manager_allocate(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, height, baseline);
  }

  /**
      Retrieves a [gtk.layout_child.LayoutChild] instance for the [gtk.layout_manager.LayoutManager],
      creating one if necessary.
      
      The child widget must be a child of the widget using manager.
      
      The [gtk.layout_child.LayoutChild] instance is owned by the [gtk.layout_manager.LayoutManager],
      and is guaranteed to exist as long as child is a child of the
      [gtk.widget.Widget] using the given [gtk.layout_manager.LayoutManager].
  
      Params:
        child = a [gtk.widget.Widget]
      Returns: a [gtk.layout_child.LayoutChild]
  */
  gtk.layout_child.LayoutChild getLayoutChild(gtk.widget.Widget child)
  {
    GtkLayoutChild* _cretval;
    _cretval = gtk_layout_manager_get_layout_child(cast(GtkLayoutManager*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.layout_child.LayoutChild)(cast(GtkLayoutChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the request mode of manager.
      Returns: a [gtk.types.SizeRequestMode]
  */
  gtk.types.SizeRequestMode getRequestMode()
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_layout_manager_get_request_mode(cast(GtkLayoutManager*)this._cPtr);
    gtk.types.SizeRequestMode _retval = cast(gtk.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gtk.widget.Widget] using the given [gtk.layout_manager.LayoutManager].
      Returns: a [gtk.widget.Widget]
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_manager_get_widget(cast(GtkLayoutManager*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queues a resize on the [gtk.widget.Widget] using manager, if any.
      
      This function should be called by subclasses of [gtk.layout_manager.LayoutManager]
      in response to changes to their layout management policies.
  */
  void layoutChanged()
  {
    gtk_layout_manager_layout_changed(cast(GtkLayoutManager*)this._cPtr);
  }

  /**
      Measures the size of the widget using manager, for the
      given orientation and size.
      
      See the [gtk.widget.Widget] documentation on layout management for
      more details.
  
      Params:
        widget = the [gtk.widget.Widget] using manager
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation; for instance, if
            the orientation is [gtk.types.Orientation.Horizontal], this is the height
            of the widget; if the orientation is [gtk.types.Orientation.Vertical], this
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
  void measure(gtk.widget.Widget widget, gtk.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    gtk_layout_manager_measure(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }
}

/// Fluent builder implementation template for [gtk.layout_manager.LayoutManager]
class LayoutManagerGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.layout_manager.LayoutManager]
final class LayoutManagerGidBuilder : LayoutManagerGidBuilderImpl!LayoutManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutManager build()
  {
    return new LayoutManager(cast(void*)createGObject(LayoutManager._getGType), No.Take);
  }
}
