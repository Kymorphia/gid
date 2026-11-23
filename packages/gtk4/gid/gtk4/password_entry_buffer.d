/// Module for [PasswordEntryBuffer] class
module gid.gtk4.password_entry_buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.entry_buffer;
import gid.gtk4.types;

/**
    A [gid.gtk4.entry_buffer.EntryBuffer] that locks the underlying memory to prevent it
    from being swapped to disk.
    
    [gid.gtk4.password_entry.PasswordEntry] uses a [gid.gtk4.password_entry_buffer.PasswordEntryBuffer].
*/
class PasswordEntryBuffer : gid.gtk4.entry_buffer.EntryBuffer
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
    return cast(void function())gtk_password_entry_buffer_get_type != &gidSymbolNotFound ? gtk_password_entry_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPasswordEntryBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override PasswordEntryBuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.password_entry_buffer.PasswordEntryBuffer]
      Returns: New builder object
  */
  static PasswordEntryBufferGidBuilder builder() nothrow
  {
    return new PasswordEntryBufferGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.entry_buffer.EntryBuffer] using secure memory allocations.
      Returns: the newly created instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkEntryBuffer* _cretval;
      _cretval = gtk_password_entry_buffer_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.password_entry_buffer.PasswordEntryBuffer]
class PasswordEntryBufferGidBuilderImpl(T) : gid.gtk4.entry_buffer.EntryBufferGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.password_entry_buffer.PasswordEntryBuffer]
final class PasswordEntryBufferGidBuilder : PasswordEntryBufferGidBuilderImpl!PasswordEntryBufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PasswordEntryBuffer build() nothrow
  {
    return new PasswordEntryBuffer(cast(void*)createGObject(PasswordEntryBuffer._getGType), Yes.Take);
  }
}
