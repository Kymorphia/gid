/// Module for [WritableFile] interface
module arrow.writable_file;

public import arrow.writable_file_iface_proxy;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
interface WritableFile
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_writable_file_get_type != &gidSymbolNotFound ? garrow_writable_file_get_type() : cast(GType)0;
  }

  /** */
  bool writeAt(long position, ubyte[] data);
}

interface WritableFileGidBuilderImpl(T)
{
}
