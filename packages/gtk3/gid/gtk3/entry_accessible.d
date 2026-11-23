/// Module for [EntryAccessible] class
module gid.gtk3.entry_accessible;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.editable_text;
import gid.atk1.editable_text_mixin;
import gid.atk1.object;
import gid.atk1.text;
import gid.atk1.text_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_accessible;

/** */
class EntryAccessible : gid.gtk3.widget_accessible.WidgetAccessible, gid.atk1.action.Action, gid.atk1.editable_text.EditableText, gid.atk1.text.Text
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
    return cast(void function())gtk_entry_accessible_get_type != &gidSymbolNotFound ? gtk_entry_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEntryAccessible";
  }

  /** Returns `this`, for use in `with` statements. */
  override EntryAccessible self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.entry_accessible.EntryAccessible]
      Returns: New builder object
  */
  static EntryAccessibleGidBuilder builder() nothrow
  {
    return new EntryAccessibleGidBuilder;
  }

  mixin ActionT!();
  mixin EditableTextT!();
  mixin TextT!();
  alias getDescription = gid.atk1.object.ObjectWrap.getDescription;
  alias getName = gid.atk1.object.ObjectWrap.getName;
  alias setDescription = gid.atk1.object.ObjectWrap.setDescription;
}

/// Fluent builder implementation template for [gid.gtk3.entry_accessible.EntryAccessible]
class EntryAccessibleGidBuilderImpl(T) : gid.gtk3.widget_accessible.WidgetAccessibleGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T, gid.atk1.editable_text.EditableTextGidBuilderImpl!T, gid.atk1.text.TextGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
  mixin EditableTextGidBuilderT!();
  mixin TextGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.entry_accessible.EntryAccessible]
final class EntryAccessibleGidBuilder : EntryAccessibleGidBuilderImpl!EntryAccessibleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EntryAccessible build() nothrow
  {
    return new EntryAccessible(cast(void*)createGObject(EntryAccessible._getGType), Yes.Take);
  }
}
