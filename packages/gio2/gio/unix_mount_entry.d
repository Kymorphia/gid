/// Module for [UnixMountEntry] class
module gio.unix_mount_entry;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Defines a Unix mount entry (e.g. <filename>/media/cdrom</filename>).
    This corresponds roughly to a mtab entry.
*/
class UnixMountEntry : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_mount_entry_get_type != &gidSymbolNotFound ? g_unix_mount_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixMountEntry self()
  {
    return this;
  }
}
