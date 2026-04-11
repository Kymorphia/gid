/// Module for [LayoutChild] class
module gtk.layout_child;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;
import gtk.widget;

/**
    [gtk.layout_child.LayoutChild] is the base class for objects that are meant to hold
    layout properties.
    
    If a [gtk.layout_manager.LayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [gtk.layout_child.LayoutChild] implementation to store those properties.
    
    A [gtk.layout_child.LayoutChild] instance is only ever valid while a widget is part
    of a layout.
*/
class LayoutChild : gobject.object.ObjectWrap
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
    return cast(void function())gtk_layout_child_get_type != &gidSymbolNotFound ? gtk_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutChild self()
  {
    return this;
  }

  /**
      Get builder for [gtk.layout_child.LayoutChild]
      Returns: New builder object
  */
  static LayoutChildGidBuilder builder()
  {
    return new LayoutChildGidBuilder;
  }

  /**
      Get `childWidget` property.
      Returns: The widget that is associated to the [gtk.layout_child.LayoutChild] instance.
  */
  @property gtk.widget.Widget childWidget()
  {
    return getChildWidget();
  }

  /**
      Get `layoutManager` property.
      Returns: The layout manager that created the [gtk.layout_child.LayoutChild] instance.
  */
  @property gtk.layout_manager.LayoutManager layoutManager()
  {
    return getLayoutManager();
  }

  /**
      Retrieves the [gtk.widget.Widget] associated to the given layout_child.
      Returns: a [gtk.widget.Widget]
  */
  gtk.widget.Widget getChildWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_child_get_child_widget(cast(GtkLayoutChild*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gtk.layout_manager.LayoutManager] instance that created the
      given layout_child.
      Returns: a [gtk.layout_manager.LayoutManager]
  */
  gtk.layout_manager.LayoutManager getLayoutManager()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_layout_child_get_layout_manager(cast(GtkLayoutChild*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.layout_manager.LayoutManager)(cast(GtkLayoutManager*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.layout_child.LayoutChild]
class LayoutChildGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `childWidget` property.
      Params:
        propval = The widget that is associated to the [gtk.layout_child.LayoutChild] instance.
      Returns: Builder instance for fluent chaining
  */
  T childWidget(gtk.widget.Widget propval)
  {
    return setProperty("child-widget", propval);
  }

  /**
      Set `layoutManager` property.
      Params:
        propval = The layout manager that created the [gtk.layout_child.LayoutChild] instance.
      Returns: Builder instance for fluent chaining
  */
  T layoutManager(gtk.layout_manager.LayoutManager propval)
  {
    return setProperty("layout-manager", propval);
  }
}

/// Fluent builder for [gtk.layout_child.LayoutChild]
final class LayoutChildGidBuilder : LayoutChildGidBuilderImpl!LayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutChild build()
  {
    return new LayoutChild(cast(void*)createGObject(LayoutChild._getGType), No.Take);
  }
}
