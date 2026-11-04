/// Module for [MemChunk] class
module glib.mem_chunk;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class MemChunk : OpaqueWrap!(GMemChunk*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /** */
  void* alloc() nothrow
  {
    auto _retval = g_mem_chunk_alloc(cast(GMemChunk*)this._cPtr);
    return _retval;
  }

  /** */
  void* alloc0() nothrow
  {
    auto _retval = g_mem_chunk_alloc0(cast(GMemChunk*)this._cPtr);
    return _retval;
  }

  /** */
  void clean() nothrow
  {
    g_mem_chunk_clean(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void destroy() nothrow
  {
    g_mem_chunk_destroy(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void print() nothrow
  {
    g_mem_chunk_print(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void reset() nothrow
  {
    g_mem_chunk_reset(cast(GMemChunk*)this._cPtr);
  }

  /** */
  static void info() nothrow
  {
    g_mem_chunk_info();
  }
}
