/// Module for [WidgetAccessible] class
module gtk.widget_accessible;

import atk.component;
import atk.component_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class WidgetAccessible : gtk.accessible.Accessible, atk.component.Component
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
    return cast(void function())gtk_widget_accessible_get_type != &gidSymbolNotFound ? gtk_widget_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WidgetAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.widget_accessible.WidgetAccessible]
      Returns: New builder object
  */
  static WidgetAccessibleGidBuilder builder()
  {
    return new WidgetAccessibleGidBuilder;
  }

  mixin ComponentT!();
}

/// Fluent builder implementation template for [gtk.widget_accessible.WidgetAccessible]
class WidgetAccessibleGidBuilderImpl(T) : gtk.accessible.AccessibleGidBuilderImpl!T, atk.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gtk.widget_accessible.WidgetAccessible]
final class WidgetAccessibleGidBuilder : WidgetAccessibleGidBuilderImpl!WidgetAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WidgetAccessible build()
  {
    return new WidgetAccessible(cast(void*)createGObject(WidgetAccessible._getGType), No.Take);
  }
}
