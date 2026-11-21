/// Module for [TestLogBuffer] class
module gid.glib2.test_log_buffer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/** */
class TestLogBuffer : StructWrap!(GTestLogBuffer)
{
  /**
      Create a `test_log_buffer.TestLogBuffer` wrap type.
  */
  this() nothrow
  {
  }

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

    auto _bytes = cast(ubyte*)bytes.ptr;
    g_test_log_buffer_push(cast(GTestLogBuffer*)this._cPtr, _nBytes, _bytes);
  }
}
