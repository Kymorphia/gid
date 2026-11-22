/// Module for [TestSuite] class
module gid.glib2.test_suite;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    An opaque structure representing a test suite.
*/
class TestSuite : OpaqueWrap!(GTestSuite*, g_test_suite_free, void)
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

  /**
      Adds test_case to suite.
  
      Params:
        testCase = a test case
  */
  void add(gid.glib2.types.TestCase testCase) nothrow
  {
    g_test_suite_add(cast(GTestSuite*)this._cPtr, testCase);
  }

  /**
      Adds nestedsuite to suite.
  
      Params:
        nestedsuite = another test suite
  */
  void addSuite(gid.glib2.test_suite.TestSuite nestedsuite) nothrow
  {
    g_test_suite_add_suite(cast(GTestSuite*)this._cPtr, nestedsuite ? cast(GTestSuite*)nestedsuite._cPtr : null);
  }
}
