/// Module for [RangeAccessible] class
module gid.gtk3.range_accessible;

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
class RangeAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.value.Value
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_range_accessible_get_type != &gidSymbolNotFound ? gtk_range_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRangeAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override RangeAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.range_accessible.RangeAccessible]
      Returns: New builder object
  */
  static RangeAccessibleGidBuilder builder() nothrow
  {
    return new RangeAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gid.gtk3.range_accessible.RangeAccessible]
class RangeAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.range_accessible.RangeAccessible]
final class RangeAccessibleGidBuilder : RangeAccessibleGidBuilderImpl!RangeAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RangeAccessible build() nothrow
  {
    return new RangeAccessible(cast(void*)createGObject(RangeAccessible._getGType), Yes.Take);
  }
}
