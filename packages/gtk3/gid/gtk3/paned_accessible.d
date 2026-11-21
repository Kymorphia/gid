/// Module for [PanedAccessible] class
module gid.gtk3.paned_accessible;

public import gid.core.basictypes;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class PanedAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.value.Value
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
    return cast(void function())gtk_paned_accessible_get_type != &gidSymbolNotFound ? gtk_paned_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPanedAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override PanedAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.paned_accessible.PanedAccessible]
      Returns: New builder object
  */
  static PanedAccessibleGidBuilder builder() nothrow
  {
    return new PanedAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gid.gtk3.paned_accessible.PanedAccessible]
class PanedAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.paned_accessible.PanedAccessible]
final class PanedAccessibleGidBuilder : PanedAccessibleGidBuilderImpl!PanedAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PanedAccessible build() nothrow
  {
    return new PanedAccessible(cast(void*)createGObject(PanedAccessible._getGType), Yes.Take);
  }
}
