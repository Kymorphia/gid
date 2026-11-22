/// Module for [TestLogMsg] class
module gid.glib2.test_log_msg;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/** */
class TestLogMsg : StructWrap!(GTestLogMsg)
{
  /**
      Create a `test_log_msg.TestLogMsg` wrap type.
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
}
