/// Module for [LayoutChild] class
module gid.gtk4.layout_child;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    The base class for objects that are meant to hold layout properties.
    
    If a [gid.gtk4.layout_manager.LayoutManager] has per-child properties, like their packing type,
    or the horizontal and vertical span, or the icon name, then the layout
    manager should use a [gid.gtk4.layout_child.LayoutChild] implementation to store those properties.
    
    A [gid.gtk4.layout_child.LayoutChild] instance is only ever valid while a widget is part
    of a layout.
*/
class LayoutChild : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_layout_child_get_type != &gidSymbolNotFound ? gtk_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLayoutChild";
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutChild self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.layout_child.LayoutChild]
      Returns: New builder object
  */
  static LayoutChildGidBuilder builder() nothrow
  {
    return new LayoutChildGidBuilder;
  }

  /**
      Get `childWidget` property.
      Returns: The widget that is associated to the [gid.gtk4.layout_child.LayoutChild] instance.
  */
  @property gid.gtk4.widget.Widget childWidget() nothrow
  {
    return getChildWidget();
  }

  /**
      Get `layoutManager` property.
      Returns: The layout manager that created the [gid.gtk4.layout_child.LayoutChild] instance.
  */
  @property gid.gtk4.layout_manager.LayoutManager layoutManager() nothrow
  {
    return getLayoutManager();
  }

  /**
      Retrieves the [gid.gtk4.widget.Widget] associated to the given layout_child.
      Returns: a [gid.gtk4.widget.Widget]
  */
  gid.gtk4.widget.Widget getChildWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_child_get_child_widget(cast(GtkLayoutChild*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.layout_manager.LayoutManager] instance that created the
      given layout_child.
      Returns: a [gid.gtk4.layout_manager.LayoutManager]
  */
  gid.gtk4.layout_manager.LayoutManager getLayoutManager() nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_layout_child_get_layout_manager(cast(GtkLayoutChild*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.layout_manager.LayoutManager)(cast(GtkLayoutManager*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.layout_child.LayoutChild]
class LayoutChildGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `childWidget` property.
      Params:
        propval = The widget that is associated to the [gid.gtk4.layout_child.LayoutChild] instance.
      Returns: Builder instance for fluent chaining
  */
  T childWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child-widget", propval);
  }

  /**
      Set `layoutManager` property.
      Params:
        propval = The layout manager that created the [gid.gtk4.layout_child.LayoutChild] instance.
      Returns: Builder instance for fluent chaining
  */
  T layoutManager(gid.gtk4.layout_manager.LayoutManager propval) nothrow
  {
    return setProperty("layout-manager", propval);
  }
}

/// Fluent builder for [gid.gtk4.layout_child.LayoutChild]
final class LayoutChildGidBuilder : LayoutChildGidBuilderImpl!LayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutChild build() nothrow
  {
    return new LayoutChild(cast(void*)createGObject(LayoutChild._getGType), Yes.Take);
  }
}
