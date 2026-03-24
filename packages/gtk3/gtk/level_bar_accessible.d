/// Module for [LevelBarAccessible] class
module gtk.level_bar_accessible;

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
class LevelBarAccessible : gtk.widget_accessible.WidgetAccessible, atk.value.Value
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
    return cast(void function())gtk_level_bar_accessible_get_type != &gidSymbolNotFound ? gtk_level_bar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LevelBarAccessible self()
  {
    return this;
  }

  /**
  Get builder for [gtk.level_bar_accessible.LevelBarAccessible]
  Returns: New builder object
  */
  static LevelBarAccessibleGidBuilder builder()
  {
    return new LevelBarAccessibleGidBuilder;
  }

  mixin ValueT!();
}

class LevelBarAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.level_bar_accessible.LevelBarAccessible]
final class LevelBarAccessibleGidBuilder : LevelBarAccessibleGidBuilderImpl!LevelBarAccessibleGidBuilder
{
  LevelBarAccessible build()
  {
    return new LevelBarAccessible(cast(void*)createGObject(LevelBarAccessible._getGType), No.Take);
  }
}
