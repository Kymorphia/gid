/// Module for [ScaleAccessible] class
module gid.gtk3.scale_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.range_accessible;
import gid.gtk3.types;

/** */
class ScaleAccessible : gid.gtk3.range_accessible.RangeAccessible
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
    return cast(void function())gtk_scale_accessible_get_type != &gidSymbolNotFound ? gtk_scale_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScaleAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.scale_accessible.ScaleAccessible]
      Returns: New builder object
  */
  static ScaleAccessibleGidBuilder builder() nothrow
  {
    return new ScaleAccessibleGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gtk3.scale_accessible.ScaleAccessible]
class ScaleAccessibleGidBuilderImpl(T) : gid.gtk3.range_accessible.RangeAccessibleGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.scale_accessible.ScaleAccessible]
final class ScaleAccessibleGidBuilder : ScaleAccessibleGidBuilderImpl!ScaleAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScaleAccessible build() nothrow
  {
    return new ScaleAccessible(cast(void*)createGObject(ScaleAccessible._getGType), Yes.Take);
  }
}
