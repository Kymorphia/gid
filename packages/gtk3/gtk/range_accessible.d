/// Module for [RangeAccessible] class
module gtk.range_accessible;

import atk.component;
import atk.component_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class RangeAccessible : gtk.widget_accessible.WidgetAccessible, atk.value.Value
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
    return cast(void function())gtk_range_accessible_get_type != &gidSymbolNotFound ? gtk_range_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RangeAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.range_accessible.RangeAccessible]
      Returns: New builder object
  */
  static RangeAccessibleGidBuilder builder()
  {
    return new RangeAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gtk.range_accessible.RangeAccessible]
class RangeAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.range_accessible.RangeAccessible]
final class RangeAccessibleGidBuilder : RangeAccessibleGidBuilderImpl!RangeAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RangeAccessible build()
  {
    return new RangeAccessible(cast(void*)createGObject(RangeAccessible._getGType), No.Take);
  }
}
