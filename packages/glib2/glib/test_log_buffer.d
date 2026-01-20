/// Module for [TestLogBuffer] class
module glib.test_log_buffer;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class TestLogBuffer
{
  GTestLogBuffer _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.test_log_buffer.TestLogBuffer");

    _cInstance = *cast(GTestLogBuffer*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Internal function for gtester to decode test log messages, no ABI guarantees provided.
  
      Params:
        bytes = 
  */
  void push(ubyte[] bytes)
  {
    uint _nBytes;
    if (bytes)
      _nBytes = cast(uint)bytes.length;

    auto _bytes = cast(const(ubyte)*)bytes.ptr;
    g_test_log_buffer_push(cast(GTestLogBuffer*)this._cPtr, _nBytes, _bytes);
  }
}
