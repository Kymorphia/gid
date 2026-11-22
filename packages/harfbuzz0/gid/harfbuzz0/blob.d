/// Module for [Blob] class
module gid.harfbuzz0.blob;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for blobs. A blob wraps a chunk of binary
    data and facilitates its lifecycle management between
    a client program and HarfBuzz.
*/
class Blob : gid.gobject2.boxed.BoxedWrap!(hb_gobject_blob_get_type)
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
