/// Module for [TestLogBuffer] class
module glib.test_log_buffer;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class TestLogBuffer
{
  GTestLogBuffer _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GTestLogBuffer*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Internal function for gtester to decode test log messages, no ABI guarantees provided.
  
      Params:
        bytes = 
  */
  void push(ubyte[] bytes) nothrow
  {
    uint _nBytes;
    if (bytes)
      _nBytes = cast(uint)bytes.length;

    auto _bytes = bytes.ptr ? cast(const(ubyte)*)bytes.ptr : [ubyte.init].ptr;
    g_test_log_buffer_push(cast(GTestLogBuffer*)this._cPtr, _nBytes, _bytes);
  }
}
