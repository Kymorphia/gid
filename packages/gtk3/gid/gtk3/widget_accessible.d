/// Module for [WidgetAccessible] class
module gid.gtk3.widget_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.accessible;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/** */
class WidgetAccessible : gid.gtk3.accessible.Accessible, gid.atk1.component.Component
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
    return cast(void function())gtk_widget_accessible_get_type != &gidSymbolNotFound ? gtk_widget_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWidgetAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override WidgetAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.widget_accessible.WidgetAccessible]
      Returns: New builder object
  */
  static WidgetAccessibleGidBuilder builder() nothrow
  {
    return new WidgetAccessibleGidBuilder;
  }

  mixin ComponentT!();
}

/// Fluent builder implementation template for [gid.gtk3.widget_accessible.WidgetAccessible]
class WidgetAccessibleGidBuilderImpl(T) : gid.gtk3.accessible.AccessibleGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.widget_accessible.WidgetAccessible]
final class WidgetAccessibleGidBuilder : WidgetAccessibleGidBuilderImpl!WidgetAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WidgetAccessible build() nothrow
  {
    return new WidgetAccessible(cast(void*)createGObject(WidgetAccessible._getGType), Yes.Take);
  }
}
