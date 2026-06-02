/// Module for [EntryIconAccessible] class
module gtk.entry_icon_accessible;

public import gid.basictypes;
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

/** */
class EntryIconAccessible : atk.object.ObjectWrap, atk.action.Action, atk.component.Component
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_entry_icon_accessible_get_type != &gidSymbolNotFound ? gtk_entry_icon_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryIconAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.entry_icon_accessible.EntryIconAccessible]
      Returns: New builder object
  */
  static EntryIconAccessibleGidBuilder builder() nothrow
  {
    return new EntryIconAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin ComponentT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gtk.entry_icon_accessible.EntryIconAccessible]
class EntryIconAccessibleGidBuilderImpl(T) : atk.object.ObjectWrapGidBuilderImpl!T, atk.action.ActionGidBuilderImpl!T, atk.component.ComponentGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gtk.entry_icon_accessible.EntryIconAccessible]
final class EntryIconAccessibleGidBuilder : EntryIconAccessibleGidBuilderImpl!EntryIconAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EntryIconAccessible build() nothrow
  {
    return new EntryIconAccessible(cast(void*)createGObject(EntryIconAccessible._getGType), No.Take);
  }
}
