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
class TestSuite
{
  GTestSuite* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(GTestSuite*)ptr;

    owned = take;
  }

  ~this() nothrow
  {
    if (owned && _cInstancePtr)
      g_test_suite_free(_cInstancePtr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Adds test_case to suite.
  
      Params:
        testCase = a #GTestCase
  */
  void add(glib.types.TestCase testCase) nothrow
  {
    g_test_suite_add(cast(GTestSuite*)this._cPtr, testCase);
  }

  /**
      Adds nestedsuite to suite.
  
      Params:
        nestedsuite = another #GTestSuite
  */
  void addSuite(glib.test_suite.TestSuite nestedsuite) nothrow
  {
    g_test_suite_add_suite(cast(GTestSuite*)this._cPtr, nestedsuite ? cast(GTestSuite*)nestedsuite._cPtr : null);
  }
}
