/// Module for [SpinButtonAccessible] class
module gtk.spin_button_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.editable_text;
import atk.editable_text_mixin;
import atk.text;
import atk.text_mixin;
import atk.value;
import atk.value_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.entry_accessible;
import gtk.types;

/** */
class SpinButtonAccessible : gtk.entry_accessible.EntryAccessible, atk.value.Value
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
    return cast(void function())gtk_spin_button_accessible_get_type != &gidSymbolNotFound ? gtk_spin_button_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinButtonAccessible self()
  {
    return this;
  }

  /**
      Get builder for [gtk.spin_button_accessible.SpinButtonAccessible]
      Returns: New builder object
  */
  static SpinButtonAccessibleGidBuilder builder()
  {
    return new SpinButtonAccessibleGidBuilder;
  }

  mixin ValueT!();
}

/// Fluent builder implementation template for [gtk.spin_button_accessible.SpinButtonAccessible]
class SpinButtonAccessibleGidBuilderImpl(T) : gtk.entry_accessible.EntryAccessibleGidBuilderImpl!T, atk.value.ValueGidBuilderImpl!T
{

  mixin ValueGidBuilderT!();
}

/// Fluent builder for [gtk.spin_button_accessible.SpinButtonAccessible]
final class SpinButtonAccessibleGidBuilder : SpinButtonAccessibleGidBuilderImpl!SpinButtonAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SpinButtonAccessible build()
  {
    return new SpinButtonAccessible(cast(void*)createGObject(SpinButtonAccessible._getGType), No.Take);
  }
}
