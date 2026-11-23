/// Module for [PasswordEntryRow] class
module gid.adw1.password_entry_row;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.entry_row;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.editable;
import gid.gtk4.editable_mixin;

/**
    A [gid.adw1.entry_row.EntryRow] tailored for entering secrets.
    
    <picture>
      <source srcset="password-entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="password-entry-row.png" alt="password-entry-row">
    </picture>
    
    It does not show its contents in clear text, does not allow to copy it to the
    clipboard, and shows a warning when Caps Lock is engaged. If the underlying
    platform allows it, [gid.adw1.password_entry_row.PasswordEntryRow] will also place the text in a
    non-pageable memory area, to avoid it being written out to disk by the
    operating system.
    
    It offer a way to reveal the contents in clear text.
    
    ## CSS Nodes
    
    [gid.adw1.password_entry_row.PasswordEntryRow] has a single CSS node with name `row` that carries
    `.entry` and `.password` style classes.
*/
class PasswordEntryRow : gid.adw1.entry_row.EntryRow
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
    return cast(void function())adw_password_entry_row_get_type != &gidSymbolNotFound ? adw_password_entry_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwPasswordEntryRow";
  }

  /** Returns `this`, for use in `with` statements. */
  override PasswordEntryRow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.password_entry_row.PasswordEntryRow]
      Returns: New builder object
  */
  static PasswordEntryRowGidBuilder builder() nothrow
  {
    return new PasswordEntryRowGidBuilder;
  }

  /**
      Creates a new [gid.adw1.password_entry_row.PasswordEntryRow].
      Returns: the newly created [gid.adw1.password_entry_row.PasswordEntryRow]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_password_entry_row_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.adw1.password_entry_row.PasswordEntryRow]
class PasswordEntryRowGidBuilderImpl(T) : gid.adw1.entry_row.EntryRowGidBuilderImpl!T
{

}

/// Fluent builder for [gid.adw1.password_entry_row.PasswordEntryRow]
final class PasswordEntryRowGidBuilder : PasswordEntryRowGidBuilderImpl!PasswordEntryRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PasswordEntryRow build() nothrow
  {
    return new PasswordEntryRow(cast(void*)createGObject(PasswordEntryRow._getGType), Yes.Take);
  }
}
