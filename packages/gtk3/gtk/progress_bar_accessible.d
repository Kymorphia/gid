/// Module for [ProgressBarAccessible] class
module gtk.progress_bar_accessible;

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
class ProgressBarAccessible : gtk.widget_accessible.WidgetAccessible, atk.value.Value
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
    return cast(void function())gtk_progress_bar_accessible_get_type != &gidSymbolNotFound ? gtk_progress_bar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ProgressBarAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.progress_bar_accessible.ProgressBarAccessible]
      Returns: New builder object
  */
  static ProgressBarAccessibleGidBuilder builder()
  {
    return new ProgressBarAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gtk.progress_bar_accessible.ProgressBarAccessible]
class ProgressBarAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.progress_bar_accessible.ProgressBarAccessible]
final class ProgressBarAccessibleGidBuilder : ProgressBarAccessibleGidBuilderImpl!ProgressBarAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProgressBarAccessible build()
  {
    return new ProgressBarAccessible(cast(void*)createGObject(ProgressBarAccessible._getGType), No.Take);
  }
}
