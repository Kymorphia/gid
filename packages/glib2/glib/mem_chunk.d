/// Module for [MemChunk] class
module glib.mem_chunk;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class MemChunk
{
  GMemChunk* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.mem_chunk.MemChunk");

    _cInstancePtr = cast(GMemChunk*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /** */
  void* alloc()
  {
    auto _retval = g_mem_chunk_alloc(cast(GMemChunk*)this._cPtr);
    return _retval;
  }

  /** */
  void* alloc0()
  {
    auto _retval = g_mem_chunk_alloc0(cast(GMemChunk*)this._cPtr);
    return _retval;
  }

  /** */
  void clean()
  {
    g_mem_chunk_clean(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void destroy()
  {
    g_mem_chunk_destroy(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void print()
  {
    g_mem_chunk_print(cast(GMemChunk*)this._cPtr);
  }

  /** */
  void reset()
  {
    g_mem_chunk_reset(cast(GMemChunk*)this._cPtr);
  }

  /** */
  static void info()
  {
    g_mem_chunk_info();
  }
}
