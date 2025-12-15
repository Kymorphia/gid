/// C types for gstcheck1 library
module gstcheck.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

/** */
struct GstCheckABIStruct
{
  /**
      The name of the structure
  */
  const(char)* name;

  /**
      The current size of a structure
  */
  int size;

  /**
      The reference size of the structure
  */
  int abiSize;
}

/**
    Opaque structure containing data about a log filter
    function.
*/
struct GstCheckLogFilter;

/**
    #GstHarness is meant to make writing unit test for GStreamer much easier.
    It can be thought of as a way of treating a #GstElement as a black box,
    deterministically feeding it data, and controlling what data it outputs.
    
    The basic structure of #GstHarness is two "floating" #GstPads that connect
    to the harnessed #GstElement src and sink #GstPads like so:
    
    ```
              __________________________
     _____   |  _____            _____  |   _____
    |     |  | |     |          |     | |  |     |
    | src |--+-| sink|  Element | src |-+--| sink|
    |_____|  | |_____|          |_____| |  |_____|
             |__________________________|
    
    ```
    
    With this, you can now simulate any environment the #GstElement might find
    itself in. By specifying the #GstCaps of the harness #GstPads, using
    functions like [gstcheck.harness.Harness.setSrcCaps] or [gstcheck.harness.Harness.setSinkCapsStr],
    you can test how the #GstElement interacts with different caps sets.
    
    Your harnessed #GstElement can of course also be a bin, and using
    [gstcheck.harness.Harness.newParse] supporting standard gst-launch syntax, you can
    easily test a whole pipeline instead of just one element.
    
    You can then go on to push #GstBuffers and #GstEvents on to the srcpad,
    using functions like [gstcheck.harness.Harness.push] and [gstcheck.harness.Harness.pushEvent], and
    then pull them out to examine them with [gstcheck.harness.Harness.pull] and
    [gstcheck.harness.Harness.pullEvent].
    
    ## A simple buffer-in buffer-out example
    
    ```c
      #include <gst/gst.h>
      #include <gst/check/gstharness.h>
      GstHarness *h;
      GstBuffer *in_buf;
      GstBuffer *out_buf;
    
      // attach the harness to the src and sink pad of GstQueue
      h = gst_harness_new ("queue");
    
      // we must specify a caps before pushing buffers
      gst_harness_set_src_caps_str (h, "mycaps");
    
      // create a buffer of size 42
      in_buf = gst_harness_create_buffer (h, 42);
    
      // push the buffer into the queue
      gst_harness_push (h, in_buf);
    
      // pull the buffer from the queue
      out_buf = gst_harness_pull (h);
    
      // validate the buffer in is the same as buffer out
      fail_unless (in_buf == out_buf);
    
      // cleanup
      gst_buffer_unref (out_buf);
      gst_harness_teardown (h);
    
      ```
    
    Another main feature of the #GstHarness is its integration with the
    #GstTestClock. Operating the #GstTestClock can be very challenging, but
    #GstHarness simplifies some of the most desired actions a lot, like wanting
    to manually advance the clock while at the same time releasing a #GstClockID
    that is waiting, with functions like [gstcheck.harness.Harness.crankSingleClockWait].
    
    #GstHarness also supports sub-harnesses, as a way of generating and
    validating data. A sub-harness is another #GstHarness that is managed by
    the "parent" harness, and can either be created by using the standard
    gst_harness_new type functions directly on the (GstHarness *)->src_harness,
    or using the much more convenient [gstcheck.harness.Harness.addSrc] or
    [gstcheck.harness.Harness.addSinkParse]. If you have a decoder-element you want to test,
    (like vp8dec) it can be very useful to add a src-harness with both a
    src-element (videotestsrc) and an encoder (vp8enc) to feed the decoder data
    with different configurations, by simply doing:
    
    ```c
      GstHarness * h = gst_harness_new ("vp8dec");
      gst_harness_add_src_parse (h, "videotestsrc is-live=1 ! vp8enc", TRUE);
    ```
    
    and then feeding it data with:
    
    ```c
    gst_harness_push_from_src (h);
    ```
*/
struct GstHarness
{
  /**
      the element inside the harness
  */
  GstElement* element;

  /**
      the internal harness source pad
  */
  GstPad* srcpad;

  /**
      the internal harness sink pad
  */
  GstPad* sinkpad;

  /**
      the source (input) harness (if any)
  */
  GstHarness* srcHarness;

  /**
      the sink (output) harness (if any)
  */
  GstHarness* sinkHarness;

  /** */
  GstHarnessPrivate* priv;
}

/** */
struct GstHarnessPrivate;

/**
    Opaque handle representing a GstHarness stress testing thread.
*/
struct GstHarnessThread;

/**
    Opaque consistency checker handle.
*/
struct GstStreamConsistency;

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
struct GstTestClock
{
  /** */
  GstClock parent;

  /** */
  GstTestClockPrivate* priv;
}

/**
    The class of a #GstTestClock, which has no virtual methods to override.
*/
struct GstTestClockClass
{
  /**
      the parent class structure
  */
  GstClockClass parentClass;
}

/** */
struct GstTestClockPrivate;

alias extern(C) gboolean function(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* userData) GstCheckLogFilterFunc;

alias extern(C) GstBuffer* function(GstHarness* h, void* data) GstHarnessPrepareBufferFunc;

alias extern(C) GstEvent* function(GstHarness* h, void* data) GstHarnessPrepareEventFunc;

