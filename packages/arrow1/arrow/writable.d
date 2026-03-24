/// Module for [Writable] interface
module arrow.writable;

public import arrow.writable_iface_proxy;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
interface Writable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_writable_get_type != &gidSymbolNotFound ? garrow_writable_get_type() : cast(GType)0;
  }

  /**
      It ensures writing all data on memory to storage.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool flush();

  /** */
  bool write(ubyte[] data);
}

interface WritableGidBuilderImpl(T)
{
}
