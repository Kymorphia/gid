/// Module for [TestClock] class
module gstcheck.test_clock;

import gid.gid;
import gobject.object;
import gst.clock;
import gst.types;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.types;

/**
    GstTestClock is an implementation of #GstClock which has different
    behaviour compared to #GstSystemClock. Time for #GstSystemClock advances
    according to the system time, while time for #GstTestClock changes only
    when [gstcheck.test_clock.TestClock.setTime] or [gstcheck.test_clock.TestClock.advanceTime] are
    called. #GstTestClock provides unit tests with the possibility to
    precisely advance the time in a deterministic manner, independent of the
    system time or any other external factors.
    
    ## Advancing the time of a #GstTestClock
    
    ```c
      #include <gst/gst.h>
      #include <gst/check/gsttestclock.h>
    
      GstClock *clock;
      GstTestClock *test_clock;
    
      clock = gst_test_clock_new ();
      test_clock = GST_TEST_CLOCK (clock);
      GST_INFO ("Time: %" GST_TIME_FORMAT, GST_TIME_ARGS (gst_clock_get_time (clock)));
      gst_test_clock_advance_time ( test_clock, 1 * GST_SECOND);
      GST_INFO ("Time: %" GST_TIME_FORMAT, GST_TIME_ARGS (gst_clock_get_time (clock)));
      g_usleep (10 * G_USEC_PER_SEC);
      GST_INFO ("Time: %" GST_TIME_FORMAT, GST_TIME_ARGS (gst_clock_get_time (clock)));
      gst_test_clock_set_time (test_clock, 42 * GST_SECOND);
      GST_INFO ("Time: %" GST_TIME_FORMAT, GST_TIME_ARGS (gst_clock_get_time (clock)));
      ...
    ```
    
    #GstClock allows for setting up single shot or periodic clock notifications
    as well as waiting for these notifications synchronously (using
    [gst.clock.Clock.idWait]) or asynchronously (using [gst.clock.Clock.idWaitAsync] or
    [gst.clock.Clock.idWaitAsync]). This is used by many GStreamer elements,
    among them #GstBaseSrc and #GstBaseSink.
    
    #GstTestClock keeps track of these clock notifications. By calling
    [gstcheck.test_clock.TestClock.waitForNextPendingId] or
    [gstcheck.test_clock.TestClock.waitForMultiplePendingIds] a unit tests may wait for the
    next one or several clock notifications to be requested. Additionally unit
    tests may release blocked waits in a controlled fashion by calling
    [gstcheck.test_clock.TestClock.processNextClockId]. This way a unit test can control the
    inaccuracy (jitter) of clock notifications, since the test can decide to
    release blocked waits when the clock time has advanced exactly to, or past,
    the requested clock notification time.
    
    There are also interfaces for determining if a notification belongs to a
    #GstTestClock or not, as well as getting the number of requested clock
    notifications so far.
    
    N.B.: When a unit test waits for a certain amount of clock notifications to
    be requested in [gstcheck.test_clock.TestClock.waitForNextPendingId] or
    [gstcheck.test_clock.TestClock.waitForMultiplePendingIds] then these functions may block
    for a long time. If they block forever then the expected clock notifications
    were never requested from #GstTestClock, and so the assumptions in the code
    of the unit test are wrong. The unit test case runner in gstcheck is
    expected to catch these cases either by the default test case timeout or the
    one set for the unit test by calling tcase_set_timeout\(\).
    
    The sample code below assumes that the element under test will delay a
    buffer pushed on the source pad by some latency until it arrives on the sink
    pad. Moreover it is assumed that the element will at some point call
    [gst.clock.Clock.idWait] to synchronously wait for a specific time. The first
    buffer sent will arrive exactly on time only delayed by the latency. The
    second buffer will arrive a little late (7ms) due to simulated jitter in the
    clock notification.
    
    ## Demonstration of how to work with clock notifications and #GstTestClock
    
    ```c
      #include <gst/gst.h>
      #include <gst/check/gstcheck.h>
      #include <gst/check/gsttestclock.h>
    
      GstClockTime latency;
      GstElement *element;
      GstPad *srcpad;
      GstClock *clock;
      GstTestClock *test_clock;
      GstBuffer buf;
      GstClockID pending_id;
      GstClockID processed_id;
    
      latency = 42 * GST_MSECOND;
      element = create_element (latency, ...);
      srcpad = get_source_pad (element);
    
      clock = gst_test_clock_new ();
      test_clock = GST_TEST_CLOCK (clock);
      gst_element_set_clock (element, clock);
    
      GST_INFO ("Set time, create and push the first buffer\n");
      gst_test_clock_set_time (test_clock, 0);
      buf = create_test_buffer (gst_clock_get_time (clock), ...);
      gst_assert_cmpint (gst_pad_push (srcpad, buf), ==, GST_FLOW_OK);
    
      GST_INFO ("Block until element is waiting for a clock notification\n");
      gst_test_clock_wait_for_next_pending_id (test_clock, &pending_id);
      GST_INFO ("Advance to the requested time of the clock notification\n");
      gst_test_clock_advance_time (test_clock, latency);
      GST_INFO ("Release the next blocking wait and make sure it is the one from element\n");
      processed_id = gst_test_clock_process_next_clock_id (test_clock);
      g_assert (processed_id == pending_id);
      g_assert_cmpint (GST_CLOCK_ENTRY_STATUS (processed_id), ==, GST_CLOCK_OK);
      gst_clock_id_unref (pending_id);
      gst_clock_id_unref (processed_id);
    
      GST_INFO ("Validate that element produced an output buffer and check its timestamp\n");
      g_assert_cmpint (get_number_of_output_buffer (...), ==, 1);
      buf = get_buffer_pushed_by_element (element, ...);
      g_assert_cmpint (GST_BUFFER_TIMESTAMP (buf), ==, latency);
      gst_buffer_unref (buf);
      GST_INFO ("Check that element does not wait for any clock notification\n");
      g_assert (!gst_test_clock_peek_next_pending_id (test_clock, NULL));
    
      GST_INFO ("Set time, create and push the second buffer\n");
      gst_test_clock_advance_time (test_clock, 10 * GST_SECOND);
      buf = create_test_buffer (gst_clock_get_time (clock), ...);
      gst_assert_cmpint (gst_pad_push (srcpad, buf), ==, GST_FLOW_OK);
    
      GST_INFO ("Block until element is waiting for a new clock notification\n");
      (gst_test_clock_wait_for_next_pending_id (test_clock, &pending_id);
      GST_INFO ("Advance past 7ms beyond the requested time of the clock notification\n");
      gst_test_clock_advance_time (test_clock, latency + 7 * GST_MSECOND);
      GST_INFO ("Release the next blocking wait and make sure it is the one from element\n");
      processed_id = gst_test_clock_process_next_clock_id (test_clock);
      g_assert (processed_id == pending_id);
      g_assert_cmpint (GST_CLOCK_ENTRY_STATUS (processed_id), ==, GST_CLOCK_OK);
      gst_clock_id_unref (pending_id);
      gst_clock_id_unref (processed_id);
    
      GST_INFO ("Validate that element produced an output buffer and check its timestamp\n");
      g_assert_cmpint (get_number_of_output_buffer (...), ==, 1);
      buf = get_buffer_pushed_by_element (element, ...);
      g_assert_cmpint (GST_BUFFER_TIMESTAMP (buf), ==,
          10 * GST_SECOND + latency + 7 * GST_MSECOND);
      gst_buffer_unref (buf);
      GST_INFO ("Check that element does not wait for any clock notification\n");
      g_assert (!gst_test_clock_peek_next_pending_id (test_clock, NULL));
      ...
    ```
    
    Since #GstTestClock is only supposed to be used in unit tests it calls
    g_assert(), g_assert_cmpint() or g_assert_cmpuint() to validate all function
    arguments. This will highlight any issues with the unit test code itself.
*/
class TestClock : gst.clock.Clock
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_test_clock_get_type != &gidSymbolNotFound ? gst_test_clock_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TestClock self()
  {
    return this;
  }

  /** */
  @property gst.types.ClockType clockType()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.types.ClockType)("clock-type");
  }

  /** */
  @property void clockType(gst.types.ClockType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.types.ClockType)("clock-type", propval);
  }

  /**
      Creates a new test clock with its time set to zero.
      
      MT safe.
      Returns: a #GstTestClock cast to #GstClock.
  */
  this()
  {
    GstClock* _cretval;
    _cretval = gst_test_clock_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new test clock with its time set to the specified time.
      
      MT safe.
  
      Params:
        startTime = a #GstClockTime set to the desired start time of the clock.
      Returns: a #GstTestClock cast to #GstClock.
  */
  static gstcheck.test_clock.TestClock newWithStartTime(gst.types.ClockTime startTime)
  {
    GstClock* _cretval;
    _cretval = gst_test_clock_new_with_start_time(startTime);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstcheck.test_clock.TestClock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds the latest time inside the list.
      
      MT safe.
  
      Params:
        pendingList = List
              of of pending #GstClockIDs
      Returns: 
  */
  static gst.types.ClockTime idListGetLatestTime(gst.types.ClockID[] pendingList = null)
  {
    gst.types.ClockTime _retval;
    auto _pendingList = gListFromD!(gst.types.ClockID)(pendingList);
    scope(exit) containerFree!(const(GList)*, gst.types.ClockID, GidOwnership.None)(_pendingList);
    _retval = gst_test_clock_id_list_get_latest_time(_pendingList);
    return _retval;
  }

  /**
      Advances the time of the test_clock by the amount given by delta. The
      time of test_clock is monotonically increasing, therefore providing a
      delta which is negative or zero is a programming error.
      
      MT safe.
  
      Params:
        delta = a positive #GstClockTimeDiff to be added to the time of the clock
  */
  void advanceTime(gst.types.ClockTimeDiff delta)
  {
    gst_test_clock_advance_time(cast(GstTestClock*)this._cPtr, delta);
  }

  /**
      A "crank" consists of three steps:
      1: Wait for a #GstClockID to be registered with the #GstTestClock.
      2: Advance the #GstTestClock to the time the #GstClockID is waiting, unless
         the clock time is already passed the clock id (Since: 1.18).
      3: Release the #GstClockID wait.
      A "crank" can be though of as the notion of
      manually driving the clock forward to its next logical step.
      Returns: true if the crank was successful, false otherwise.
        
        MT safe.
  */
  bool crank()
  {
    bool _retval;
    _retval = cast(bool)gst_test_clock_crank(cast(GstTestClock*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the requested time for the next pending clock notification.
      
      MT safe.
      Returns: a #GstClockTime set to the time of the next pending clock
        notification. If no clock notifications have been requested
        [gst.types.CLOCK_TIME_NONE] will be returned.
  */
  gst.types.ClockTime getNextEntryTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_test_clock_get_next_entry_time(cast(GstTestClock*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether test_clock was requested to provide the clock notification
      given by id.
      
      MT safe.
  
      Params:
        id = a #GstClockID clock notification
      Returns: true if the clock has been asked to provide the given clock
        notification, false otherwise.
  */
  bool hasId(gst.types.ClockID id)
  {
    bool _retval;
    _retval = cast(bool)gst_test_clock_has_id(cast(GstTestClock*)this._cPtr, id);
    return _retval;
  }

  /**
      Determine the number of pending clock notifications that have been
      requested from the test_clock.
      
      MT safe.
      Returns: the number of pending clock notifications.
  */
  uint peekIdCount()
  {
    uint _retval;
    _retval = gst_test_clock_peek_id_count(cast(GstTestClock*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the pending_id is the next clock notification scheduled to
      be triggered given the current time of the test_clock.
      
      MT safe.
  
      Params:
        pendingId = a #GstClockID clock
          notification to look for
      Returns: true if pending_id is the next clock notification to be
        triggered, false otherwise.
  */
  bool peekNextPendingId(out gst.types.ClockID pendingId)
  {
    bool _retval;
    _retval = cast(bool)gst_test_clock_peek_next_pending_id(cast(GstTestClock*)this._cPtr, cast(GstClockID*)&pendingId);
    return _retval;
  }

  /**
      Processes and releases the pending ID.
      
      MT safe.
  
      Params:
        pendingId = #GstClockID
      Returns: 
  */
  bool processId(gst.types.ClockID pendingId)
  {
    bool _retval;
    _retval = cast(bool)gst_test_clock_process_id(cast(GstTestClock*)this._cPtr, pendingId);
    return _retval;
  }

  /**
      Processes and releases the pending IDs in the list.
      
      MT safe.
  
      Params:
        pendingList = List
              of pending #GstClockIDs
      Returns: 
  */
  uint processIdList(gst.types.ClockID[] pendingList = null)
  {
    uint _retval;
    auto _pendingList = gListFromD!(gst.types.ClockID)(pendingList);
    scope(exit) containerFree!(const(GList)*, gst.types.ClockID, GidOwnership.None)(_pendingList);
    _retval = gst_test_clock_process_id_list(cast(GstTestClock*)this._cPtr, _pendingList);
    return _retval;
  }

  /**
      MT safe.
      Returns: a #GstClockID containing the next pending clock
        notification.
  */
  gst.types.ClockID processNextClockId()
  {
    gst.types.ClockID _retval;
    _retval = gst_test_clock_process_next_clock_id(cast(GstTestClock*)this._cPtr);
    return _retval;
  }

  /**
      Sets the time of test_clock to the time given by new_time. The time of
      test_clock is monotonically increasing, therefore providing a new_time
      which is earlier or equal to the time of the clock as given by
      [gst.clock.Clock.getTime] is a programming error.
      
      MT safe.
  
      Params:
        newTime = a #GstClockTime later than that returned by [gst.clock.Clock.getTime]
  */
  void setTime(gst.types.ClockTime newTime)
  {
    gst_test_clock_set_time(cast(GstTestClock*)this._cPtr, newTime);
  }

  /**
      Blocks until at least count clock notifications have been requested from
      test_clock, or the timeout expires.
      
      MT safe.
  
      Params:
        count = the number of pending clock notifications to wait for
        timeoutMs = the timeout in milliseconds
        pendingList = Address
              of a #GList pointer variable to store the list of pending #GstClockIDs
              that expired, or null
      Returns: a gboolean true if the waits have been registered, false if not.
        (Could be that it timed out waiting or that more waits than waits was found)
  */
  bool timedWaitForMultiplePendingIds(uint count, uint timeoutMs, out gst.types.ClockID[] pendingList)
  {
    bool _retval;
    GList* _pendingList;
    _retval = cast(bool)gst_test_clock_timed_wait_for_multiple_pending_ids(cast(GstTestClock*)this._cPtr, count, timeoutMs, &_pendingList);
    pendingList = gListToD!(gst.types.ClockID, GidOwnership.Full)(_pendingList);
    return _retval;
  }

  /**
      Blocks until at least count clock notifications have been requested from
      test_clock. There is no timeout for this wait, see the main description of
      #GstTestClock.
      
      MT safe.
  
      Params:
        count = the number of pending clock notifications to wait for
        pendingList = Address
              of a #GList pointer variable to store the list of pending #GstClockIDs
              that expired, or null
  */
  void waitForMultiplePendingIds(uint count, out gst.types.ClockID[] pendingList)
  {
    GList* _pendingList;
    gst_test_clock_wait_for_multiple_pending_ids(cast(GstTestClock*)this._cPtr, count, &_pendingList);
    pendingList = gListToD!(gst.types.ClockID, GidOwnership.Full)(_pendingList);
  }

  /**
      Waits until a clock notification is requested from test_clock. There is no
      timeout for this wait, see the main description of #GstTestClock. A reference
      to the pending clock notification is stored in pending_id.
      
      MT safe.
  
      Params:
        pendingId = #GstClockID
          with information about the pending clock notification
  */
  void waitForNextPendingId(out gst.types.ClockID pendingId)
  {
    gst_test_clock_wait_for_next_pending_id(cast(GstTestClock*)this._cPtr, cast(GstClockID*)&pendingId);
  }

  /**
      Blocks until at least count clock notifications have been requested from
      test_clock. There is no timeout for this wait, see the main description of
      #GstTestClock.
  
      Params:
        count = the number of pending clock notifications to wait for
  
      Deprecated: use [gstcheck.test_clock.TestClock.waitForMultiplePendingIds] instead.
  */
  void waitForPendingIdCount(uint count)
  {
    gst_test_clock_wait_for_pending_id_count(cast(GstTestClock*)this._cPtr, count);
  }
}
