/// Module for [EntryIconAccessible] class
module gid.gtk3.entry_icon_accessible;

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

/** */
class EntryIconAccessible : gid.atk1.object.ObjectWrap, gid.atk1.action.Action, gid.atk1.component.Component
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
    return cast(void function())gtk_entry_icon_accessible_get_type != &gidSymbolNotFound ? gtk_entry_icon_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEntryIconAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryIconAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.entry_icon_accessible.EntryIconAccessible]
      Returns: New builder object
  */
  static EntryIconAccessibleGidBuilder builder() nothrow
  {
    return new EntryIconAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.entry_icon_accessible.EntryIconAccessible]
class EntryIconAccessibleGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.entry_icon_accessible.EntryIconAccessible]
final class EntryIconAccessibleGidBuilder : EntryIconAccessibleGidBuilderImpl!EntryIconAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EntryIconAccessible build() nothrow
  {
    return new EntryIconAccessible(cast(void*)createGObject(EntryIconAccessible._getGType), Yes.Take);
  }
}
