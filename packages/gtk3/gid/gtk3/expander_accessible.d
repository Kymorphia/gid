/// Module for [ExpanderAccessible] class
module gid.gtk3.expander_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class ExpanderAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.action.Action
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
    return cast(void function())gtk_expander_accessible_get_type != &gidSymbolNotFound ? gtk_expander_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkExpanderAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ExpanderAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.expander_accessible.ExpanderAccessible]
      Returns: New builder object
  */
  static ExpanderAccessibleGidBuilder builder() nothrow
  {
    return new ExpanderAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.expander_accessible.ExpanderAccessible]
class ExpanderAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.expander_accessible.ExpanderAccessible]
final class ExpanderAccessibleGidBuilder : ExpanderAccessibleGidBuilderImpl!ExpanderAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExpanderAccessible build() nothrow
  {
    return new ExpanderAccessible(cast(void*)createGObject(ExpanderAccessible._getGType), Yes.Take);
  }
}
