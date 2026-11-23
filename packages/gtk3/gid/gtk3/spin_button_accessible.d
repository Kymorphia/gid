/// Module for [SpinButtonAccessible] class
module gid.gtk3.spin_button_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.editable_text;
import gid.atk1.editable_text_mixin;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.atk1.value;
import gid.atk1.value_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.entry_accessible;
import gid.gtk3.types;

/** */
class SpinButtonAccessible : gid.gtk3.entry_accessible.EntryAccessible, gid.atk1.value.Value
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
    return cast(void function())gtk_spin_button_accessible_get_type != &gidSymbolNotFound ? gtk_spin_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSpinButtonAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinButtonAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.spin_button_accessible.SpinButtonAccessible]
      Returns: New builder object
  */
  static SpinButtonAccessibleGidBuilder builder() nothrow
  {
    return new SpinButtonAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gid.gtk3.spin_button_accessible.SpinButtonAccessible]
class SpinButtonAccessibleGidBuilderImpl(T) : gid.gtk3.entry_accessible.EntryAccessibleGidBuilderImpl!T, gid.atk1.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.spin_button_accessible.SpinButtonAccessible]
final class SpinButtonAccessibleGidBuilder : SpinButtonAccessibleGidBuilderImpl!SpinButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpinButtonAccessible build() nothrow
  {
    return new SpinButtonAccessible(cast(void*)createGObject(SpinButtonAccessible._getGType), Yes.Take);
  }
}
