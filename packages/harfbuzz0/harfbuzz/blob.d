/// Module for [Blob] class
module harfbuzz.blob;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for blobs. A blob wraps a chunk of binary
    data and facilitates its lifecycle management between
    a client program and HarfBuzz.
*/
class Blob : gobject.boxed.BoxedWrap!(hb_gobject_blob_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Blob self() nothrow
  {
    return this;
  }
}
