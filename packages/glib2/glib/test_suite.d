/// Module for [TestSuite] class
module glib.test_suite;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

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

  /**
      Adds test_case to suite.
  
      Params:
        testCase = a test case
  */
  void add(glib.types.TestCase testCase) nothrow
  {
    g_test_suite_add(cast(GTestSuite*)this._cPtr, testCase);
  }

  /**
      Adds nestedsuite to suite.
  
      Params:
        nestedsuite = another test suite
  */
  void addSuite(glib.test_suite.TestSuite nestedsuite) nothrow
  {
    g_test_suite_add_suite(cast(GTestSuite*)this._cPtr, nestedsuite ? cast(GTestSuite*)nestedsuite._cPtr : null);
  }
}
