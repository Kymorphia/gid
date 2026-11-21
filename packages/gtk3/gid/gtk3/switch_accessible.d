/// Module for [SwitchAccessible] class
module gid.gtk3.switch_accessible;

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
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
class SwitchAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.action.Action
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
    return cast(void function())gtk_switch_accessible_get_type != &gidSymbolNotFound ? gtk_switch_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSwitchAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override SwitchAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.switch_accessible.SwitchAccessible]
      Returns: New builder object
  */
  static SwitchAccessibleGidBuilder builder() nothrow
  {
    return new SwitchAccessibleGidBuilder;
  }

  mixin ActionT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.switch_accessible.SwitchAccessible]
class SwitchAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.switch_accessible.SwitchAccessible]
final class SwitchAccessibleGidBuilder : SwitchAccessibleGidBuilderImpl!SwitchAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SwitchAccessible build() nothrow
  {
    return new SwitchAccessible(cast(void*)createGObject(SwitchAccessible._getGType), Yes.Take);
  }
}
