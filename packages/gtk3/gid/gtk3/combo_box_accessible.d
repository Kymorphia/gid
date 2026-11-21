/// Module for [ComboBoxAccessible] class
module gid.gtk3.combo_box_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.selection;
import gid.atk1.selection_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container_accessible;
import gid.gtk3.types;

/** */
class ComboBoxAccessible : gid.gtk3.container_accessible.ContainerAccessible, gid.atk1.action.Action, gid.atk1.selection.Selection
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
    return cast(void function())gtk_combo_box_accessible_get_type != &gidSymbolNotFound ? gtk_combo_box_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkComboBoxAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override ComboBoxAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.combo_box_accessible.ComboBoxAccessible]
      Returns: New builder object
  */
  static ComboBoxAccessibleGidBuilder builder() nothrow
  {
    return new ComboBoxAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin SelectionT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.combo_box_accessible.ComboBoxAccessible]
class ComboBoxAccessibleGidBuilderImpl(T) : gid.gtk3.container_accessible.ContainerAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.selection.SelectionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin SelectionGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.combo_box_accessible.ComboBoxAccessible]
final class ComboBoxAccessibleGidBuilder : ComboBoxAccessibleGidBuilderImpl!ComboBoxAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ComboBoxAccessible build() nothrow
  {
    return new ComboBoxAccessible(cast(void*)createGObject(ComboBoxAccessible._getGType), Yes.Take);
  }
}
