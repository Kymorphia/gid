/// Module for [TestLogMsg] class
module glib.test_log_msg;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

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
