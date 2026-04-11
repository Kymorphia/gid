/// Module for [SwitchAccessible] class
module gtk.switch_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_accessible;

/** */
class SwitchAccessible : gtk.widget_accessible.WidgetAccessible, atk.action.Action
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
    return cast(void function())gtk_switch_accessible_get_type != &gidSymbolNotFound ? gtk_switch_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SwitchAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.switch_accessible.SwitchAccessible]
      Returns: New builder object
  */
  static SwitchAccessibleGidBuilder builder()
  {
    return new SwitchAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.switch_accessible.SwitchAccessible]
class SwitchAccessibleGidBuilderImpl(T) : gtk.widget_accessible.WidgetAccessibleGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gtk.switch_accessible.SwitchAccessible]
final class SwitchAccessibleGidBuilder : SwitchAccessibleGidBuilderImpl!SwitchAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SwitchAccessible build()
  {
    return new SwitchAccessible(cast(void*)createGObject(SwitchAccessible._getGType), No.Take);
  }
}
