/// Module for [TestLogMsg] class
module glib.test_log_msg;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/** */
class TestLogMsg
{
  GTestLogMsg _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.test_log_msg.TestLogMsg");

    _cInstance = *cast(GTestLogMsg*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
