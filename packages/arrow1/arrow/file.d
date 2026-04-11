/// Module for [File] interface
module arrow.file;

public import arrow.file_iface_proxy;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
interface File
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_get_type != &gidSymbolNotFound ? garrow_file_get_type() : cast(GType)0;
  }

  /** */
  bool close();

  /** */
  arrow.types.FileMode getMode();

  /** */
  bool isClosed();

  /** */
  long tell();
}

/// Fluent builder implementation template for [arrow.file.File]
interface FileGidBuilderImpl(T)
{
}
