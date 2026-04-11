/// Module for [ExpanderAccessible] class
module gtk.expander_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.container_accessible;
import gtk.types;

/** */
class ExpanderAccessible : gtk.container_accessible.ContainerAccessible, atk.action.Action
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
    return cast(void function())gtk_expander_accessible_get_type != &gidSymbolNotFound ? gtk_expander_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExpanderAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.expander_accessible.ExpanderAccessible]
      Returns: New builder object
  */
  static ExpanderAccessibleGidBuilder builder()
  {
    return new ExpanderAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.expander_accessible.ExpanderAccessible]
class ExpanderAccessibleGidBuilderImpl(T) : gtk.container_accessible.ContainerAccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gtk.expander_accessible.ExpanderAccessible]
final class ExpanderAccessibleGidBuilder : ExpanderAccessibleGidBuilderImpl!ExpanderAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExpanderAccessible build()
  {
    return new ExpanderAccessible(cast(void*)createGObject(ExpanderAccessible._getGType), No.Take);
  }
}
