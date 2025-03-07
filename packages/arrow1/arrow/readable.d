module arrow.readable;

public import arrow.readable_iface_proxy;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
interface Readable
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_readable_get_type != &gidSymbolNotFound ? garrow_readable_get_type() : cast(GType)0;
  }

  /** */
  arrow.buffer.Buffer read(long nBytes);

  /** */
  glib.bytes.Bytes readBytes(long nBytes);
}
