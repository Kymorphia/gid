/// Module for [LevelBarAccessible] class
module gid.gtk3.level_bar_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
@gidGir("LevelBarAccessible", "LevelBarAccessibleClass")
class LevelBarAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.value.Value
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_level_bar_accessible_get_type != &gidSymbolNotFound ? gtk_level_bar_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLevelBarAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override LevelBarAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.level_bar_accessible.LevelBarAccessible]
      Returns: New builder object
  */
  static LevelBarAccessibleGidBuilder builder() nothrow
  {
    return new LevelBarAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gid.gtk3.level_bar_accessible.LevelBarAccessible]
class LevelBarAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.level_bar_accessible.LevelBarAccessible]
final class LevelBarAccessibleGidBuilder : LevelBarAccessibleGidBuilderImpl!LevelBarAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LevelBarAccessible build() nothrow
  {
    return new LevelBarAccessible(cast(void*)createGObject(LevelBarAccessible._getGType), Yes.Take);
  }
}
