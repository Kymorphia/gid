/// Module for [PasswordEntryRow] class
module adw.password_entry_row;

import adw.c.functions;
import adw.c.types;
import adw.entry_row;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;

/**
    A `class@EntryRow` tailored for entering secrets.
    
    <picture>
      <source srcset="password-entry-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="password-entry-row.png" alt="password-entry-row">
    </picture>
    
    It does not show its contents in clear text, does not allow to copy it to the
    clipboard, and shows a warning when Caps Lock is engaged. If the underlying
    platform allows it, [adw.password_entry_row.PasswordEntryRow] will also place the text in a
    non-pageable memory area, to avoid it being written out to disk by the
    operating system.
    
    It offer a way to reveal the contents in clear text.
    
    ## CSS Nodes
    
    [adw.password_entry_row.PasswordEntryRow] has a single CSS node with name `row` that carries
    `.entry` and `.password` style classes.
*/
class PasswordEntryRow : adw.entry_row.EntryRow
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
    return cast(void function())adw_password_entry_row_get_type != &gidSymbolNotFound ? adw_password_entry_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PasswordEntryRow self()
  {
    return this;
  }

  /**
      Get builder for [adw.password_entry_row.PasswordEntryRow]
      Returns: New builder object
  */
  static PasswordEntryRowGidBuilder builder()
  {
    return new PasswordEntryRowGidBuilder;
  }

  /**
      Creates a new [adw.password_entry_row.PasswordEntryRow].
      Returns: the newly created [adw.password_entry_row.PasswordEntryRow]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_password_entry_row_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [adw.password_entry_row.PasswordEntryRow]
class PasswordEntryRowGidBuilderImpl(T) : adw.entry_row.EntryRowGidBuilderImpl!T
{

}

/// Fluent builder for [adw.password_entry_row.PasswordEntryRow]
final class PasswordEntryRowGidBuilder : PasswordEntryRowGidBuilderImpl!PasswordEntryRowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PasswordEntryRow build()
  {
    return new PasswordEntryRow(cast(void*)createGObject(PasswordEntryRow._getGType), No.Take);
  }
}
