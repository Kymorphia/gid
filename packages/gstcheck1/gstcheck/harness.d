/// Module for [Harness] class
module gstcheck.harness;

import gid.gid;
import glib.bytes;
import gobject.object;
import gobject.types;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.caps;
import gst.element;
import gst.event;
import gst.pad;
import gst.pad_probe_info;
import gst.structure;
import gst.types;
import gstcheck.c.functions;
import gstcheck.c.types;
import gstcheck.test_clock;
import gstcheck.types;

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
class Harness
{
  GstHarness _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstcheck.harness.Harness");

    _cInstance = *cast(GstHarness*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `element` field.
      Returns: the element inside the harness
  */
  @property gst.element.Element element()
  {
    return cToD!(gst.element.Element)(cast(void*)(cast(GstHarness*)this._cPtr).element);
  }

  /**
      Set `element` field.
      Params:
        propval = the element inside the harness
  */
  @property void element(gst.element.Element propval)
  {
    cValueFree!(gst.element.Element)(cast(void*)(cast(GstHarness*)this._cPtr).element);
    dToC(propval, cast(void*)&(cast(GstHarness*)this._cPtr).element);
  }

  /**
      Get `srcpad` field.
      Returns: the internal harness source pad
  */
  @property gst.pad.Pad srcpad()
  {
    return cToD!(gst.pad.Pad)(cast(void*)(cast(GstHarness*)this._cPtr).srcpad);
  }

  /**
      Set `srcpad` field.
      Params:
        propval = the internal harness source pad
  */
  @property void srcpad(gst.pad.Pad propval)
  {
    cValueFree!(gst.pad.Pad)(cast(void*)(cast(GstHarness*)this._cPtr).srcpad);
    dToC(propval, cast(void*)&(cast(GstHarness*)this._cPtr).srcpad);
  }

  /**
      Get `sinkpad` field.
      Returns: the internal harness sink pad
  */
  @property gst.pad.Pad sinkpad()
  {
    return cToD!(gst.pad.Pad)(cast(void*)(cast(GstHarness*)this._cPtr).sinkpad);
  }

  /**
      Set `sinkpad` field.
      Params:
        propval = the internal harness sink pad
  */
  @property void sinkpad(gst.pad.Pad propval)
  {
    cValueFree!(gst.pad.Pad)(cast(void*)(cast(GstHarness*)this._cPtr).sinkpad);
    dToC(propval, cast(void*)&(cast(GstHarness*)this._cPtr).sinkpad);
  }

  /**
      Get `srcHarness` field.
      Returns: the source (input) harness (if any)
  */
  @property gstcheck.harness.Harness srcHarness()
  {
    return new gstcheck.harness.Harness(cast(GstHarness*)(cast(GstHarness*)this._cPtr).srcHarness, No.Take);
  }

  /**
      Get `sinkHarness` field.
      Returns: the sink (output) harness (if any)
  */
  @property gstcheck.harness.Harness sinkHarness()
  {
    return new gstcheck.harness.Harness(cast(GstHarness*)(cast(GstHarness*)this._cPtr).sinkHarness, No.Take);
  }

  /**
      Links the specified #GstPad the GstHarness srcpad.
      
      MT safe.
  
      Params:
        sinkpad = a #GstPad to link to the harness srcpad
  */
  void addElementSinkPad(gst.pad.Pad sinkpad)
  {
    gst_harness_add_element_sink_pad(cast(GstHarness*)this._cPtr, sinkpad ? cast(GstPad*)sinkpad._cPtr(No.Dup) : null);
  }

  /**
      Links the specified #GstPad the GstHarness sinkpad. This can be useful if
      perhaps the srcpad did not exist at the time of creating the harness,
      like a demuxer that provides a sometimes-pad after receiving data.
      
      MT safe.
  
      Params:
        srcpad = a #GstPad to link to the harness sinkpad
  */
  void addElementSrcPad(gst.pad.Pad srcpad)
  {
    gst_harness_add_element_src_pad(cast(GstHarness*)this._cPtr, srcpad ? cast(GstPad*)srcpad._cPtr(No.Dup) : null);
  }

  /**
      A convenience function to allows you to call gst_pad_add_probe on a
      #GstPad of a #GstElement that are residing inside the #GstHarness,
      by using normal gst_pad_add_probe syntax
      
      MT safe.
  
      Params:
        elementName = a #gchar with a #GstElementFactory name
        padName = a #gchar with the name of the pad to attach the probe to
        mask = a #GstPadProbeType (see gst_pad_add_probe)
        callback = a #GstPadProbeCallback (see gst_pad_add_probe)
  */
  void addProbe(string elementName, string padName, gst.types.PadProbeType mask, gst.types.PadProbeCallback callback)
  {
    extern(C) GstPadProbeReturn _callbackCallback(GstPad* pad, GstPadProbeInfo* info, void* userData)
    {
      gst.types.PadProbeReturn _dretval;
      auto _dlg = cast(gst.types.PadProbeCallback*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take), info ? new gst.pad_probe_info.PadProbeInfo(cast(void*)info, No.Take) : null);
      auto _retval = cast(GstPadProbeReturn)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _elementName = elementName.toCString(No.Alloc);
    const(char)* _padName = padName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_harness_add_probe(cast(GstHarness*)this._cPtr, _elementName, _padName, mask, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Add api with params as one of the supported metadata API to propose when
      receiving an allocation query.
      
      MT safe.
  
      Params:
        api = a metadata API
        params = API specific parameters
  */
  void addProposeAllocationMeta(gobject.types.GType api, gst.structure.Structure params = null)
  {
    gst_harness_add_propose_allocation_meta(cast(GstHarness*)this._cPtr, api, params ? cast(const(GstStructure)*)params._cPtr(No.Dup) : null);
  }

  /**
      Similar to gst_harness_add_sink_harness, this is a convenience to
      directly create a sink-harness using the sink_element_name name specified.
      
      MT safe.
  
      Params:
        sinkElementName = a #gchar with the name of a #GstElement
  */
  void addSink(string sinkElementName)
  {
    const(char)* _sinkElementName = sinkElementName.toCString(No.Alloc);
    gst_harness_add_sink(cast(GstHarness*)this._cPtr, _sinkElementName);
  }

  /**
      Similar to gst_harness_add_src, this allows you to send the data coming out
      of your harnessed #GstElement to a sink-element, allowing to test different
      responses the element output might create in sink elements. An example might
      be an existing sink providing some analytical data on the input it receives that
      can be useful to your testing. If the goal is to test a sink-element itself,
      this is better achieved using gst_harness_new directly on the sink.
      
      If a sink-harness already exists it will be replaced.
      
      MT safe.
  
      Params:
        sinkHarness = a #GstHarness to be added as a sink-harness.
  */
  void addSinkHarness(gstcheck.harness.Harness sinkHarness)
  {
    gst_harness_add_sink_harness(cast(GstHarness*)this._cPtr, sinkHarness ? cast(GstHarness*)sinkHarness._cPtr : null);
  }

  /**
      Similar to gst_harness_add_sink, this allows you to specify a launch-line
      instead of just an element name. See gst_harness_add_src_parse for details.
      
      MT safe.
  
      Params:
        launchline = a #gchar with the name of a #GstElement
  */
  void addSinkParse(string launchline)
  {
    const(char)* _launchline = launchline.toCString(No.Alloc);
    gst_harness_add_sink_parse(cast(GstHarness*)this._cPtr, _launchline);
  }

  /**
      Similar to gst_harness_add_src_harness, this is a convenience to
      directly create a src-harness using the src_element_name name specified.
      
      MT safe.
  
      Params:
        srcElementName = a #gchar with the name of a #GstElement
        hasClockWait = a #gboolean specifying if the #GstElement uses
          gst_clock_wait_id internally.
  */
  void addSrc(string srcElementName, bool hasClockWait)
  {
    const(char)* _srcElementName = srcElementName.toCString(No.Alloc);
    gst_harness_add_src(cast(GstHarness*)this._cPtr, _srcElementName, hasClockWait);
  }

  /**
      A src-harness is a great way of providing the #GstHarness with data.
      By adding a src-type #GstElement, it is then easy to use functions like
      gst_harness_push_from_src or gst_harness_src_crank_and_push_many
      to provide your harnessed element with input. The `h`as_clock_wait variable
      is a great way to control you src-element with, in that you can have it
      produce a buffer for you by simply cranking the clock, and not have it
      spin out of control producing buffers as fast as possible.
      
      If a src-harness already exists it will be replaced.
      
      MT safe.
  
      Params:
        srcHarness = a #GstHarness to be added as a src-harness.
        hasClockWait = a #gboolean specifying if the #GstElement uses
          gst_clock_wait_id internally.
  */
  void addSrcHarness(gstcheck.harness.Harness srcHarness, bool hasClockWait)
  {
    gst_harness_add_src_harness(cast(GstHarness*)this._cPtr, srcHarness ? cast(GstHarness*)srcHarness._cPtr : null, hasClockWait);
  }

  /**
      Similar to gst_harness_add_src, this allows you to specify a launch-line,
      which can be useful for both having more then one #GstElement acting as your
      src (Like a src producing raw buffers, and then an encoder, providing encoded
      data), but also by allowing you to set properties like "is-live" directly on
      the elements.
      
      MT safe.
  
      Params:
        launchline = a #gchar describing a gst-launch type line
        hasClockWait = a #gboolean specifying if the #GstElement uses
          gst_clock_wait_id internally.
  */
  void addSrcParse(string launchline, bool hasClockWait)
  {
    const(char)* _launchline = launchline.toCString(No.Alloc);
    gst_harness_add_src_parse(cast(GstHarness*)this._cPtr, _launchline, hasClockWait);
  }

  /**
      The number of #GstBuffers currently in the #GstHarness sinkpad #GAsyncQueue
      
      MT safe.
      Returns: a #guint number of buffers in the queue
  */
  uint buffersInQueue()
  {
    uint _retval;
    _retval = gst_harness_buffers_in_queue(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      The total number of #GstBuffers that has arrived on the #GstHarness sinkpad.
      This number includes buffers that have been dropped as well as buffers
      that have already been pulled out.
      
      MT safe.
      Returns: a #guint number of buffers received
  */
  uint buffersReceived()
  {
    uint _retval;
    _retval = gst_harness_buffers_received(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Similar to [gstcheck.harness.Harness.crankSingleClockWait], this is the function to use
      if your harnessed element(s) are using more then one gst_clock_id_wait.
      Failing to do so can (and will) make it racy which #GstClockID you actually
      are releasing, where as this function will process all the waits at the
      same time, ensuring that one thread can't register another wait before
      both are released.
      
      MT safe.
  
      Params:
        waits = a #guint describing the number of #GstClockIDs to crank
      Returns: a gboolean true if the "crank" was successful, false if not.
  */
  bool crankMultipleClockWaits(uint waits)
  {
    bool _retval;
    _retval = cast(bool)gst_harness_crank_multiple_clock_waits(cast(GstHarness*)this._cPtr, waits);
    return _retval;
  }

  /**
      A "crank" consists of three steps:
      1: Wait for a #GstClockID to be registered with the #GstTestClock.
      2: Advance the #GstTestClock to the time the #GstClockID is waiting for.
      3: Release the #GstClockID wait.
      Together, this provides an easy way to not have to think about the details
      around clocks and time, but still being able to write deterministic tests
      that are dependent on this. A "crank" can be though of as the notion of
      manually driving the clock forward to its next logical step.
      
      MT safe.
      Returns: a gboolean true if the "crank" was successful, false if not.
  */
  bool crankSingleClockWait()
  {
    bool _retval;
    _retval = cast(bool)gst_harness_crank_single_clock_wait(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Allocates a buffer using a #GstBufferPool if present, or else using the
      configured #GstAllocator and #GstAllocationParams
      
      MT safe.
  
      Params:
        size = a #gsize specifying the size of the buffer
      Returns: a #GstBuffer of size size
  */
  gst.buffer.Buffer createBuffer(size_t size)
  {
    GstBuffer* _cretval;
    _cretval = gst_harness_create_buffer(cast(GstHarness*)this._cPtr, size);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allows you to dump the #GstBuffers the #GstHarness sinkpad #GAsyncQueue
      to a file.
      
      MT safe.
  
      Params:
        filename = a #gchar with a the name of a file
  */
  void dumpToFile(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gst_harness_dump_to_file(cast(GstHarness*)this._cPtr, _filename);
  }

  /**
      The number of #GstEvents currently in the #GstHarness sinkpad #GAsyncQueue
      
      MT safe.
      Returns: a #guint number of events in the queue
  */
  uint eventsInQueue()
  {
    uint _retval;
    _retval = gst_harness_events_in_queue(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      The total number of #GstEvents that has arrived on the #GstHarness sinkpad
      This number includes events handled by the harness as well as events
      that have already been pulled out.
      
      MT safe.
      Returns: a #guint number of events received
  */
  uint eventsReceived()
  {
    uint _retval;
    _retval = gst_harness_events_received(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Most useful in conjunction with gst_harness_new_parse, this will scan the
      #GstElements inside the #GstHarness, and check if any of them matches
      element_name. Typical usecase being that you need to access one of the
      harnessed elements for properties and/or signals.
      
      MT safe.
  
      Params:
        elementName = a #gchar with a #GstElementFactory name
      Returns: a #GstElement or null if not found
  */
  gst.element.Element findElement(string elementName)
  {
    GstElement* _cretval;
    const(char)* _elementName = elementName.toCString(No.Alloc);
    _cretval = gst_harness_find_element(cast(GstHarness*)this._cPtr, _elementName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the allocator and its params that has been decided to use after an
      allocation query.
      
      MT safe.
  
      Params:
        allocator = the #GstAllocator used
        params = the #GstAllocationParams of
            allocator
  */
  void getAllocator(out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_harness_get_allocator(cast(GstHarness*)this._cPtr, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, No.Take);
  }

  /**
      Get the timestamp of the last #GstBuffer pushed on the #GstHarness srcpad,
      typically with gst_harness_push or gst_harness_push_from_src.
      
      MT safe.
      Returns: a #GstClockTime with the timestamp or `GST_CLOCK_TIME_NONE` if no
        #GstBuffer has been pushed on the #GstHarness srcpad
  */
  gst.types.ClockTime getLastPushedTimestamp()
  {
    gst.types.ClockTime _retval;
    _retval = gst_harness_get_last_pushed_timestamp(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GstTestClock. Useful if specific operations on the testclock is
      needed.
      
      MT safe.
      Returns: a #GstTestClock, or null if the testclock is not
        present.
  */
  gstcheck.test_clock.TestClock getTestclock()
  {
    GstTestClock* _cretval;
    _cretval = gst_harness_get_testclock(cast(GstHarness*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstcheck.test_clock.TestClock)(cast(GstTestClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This will set the harnessed #GstElement to [gst.types.State.Playing].
      #GstElements without a sink-#GstPad and with the [gst.types.ElementFlags.Source]
      flag set is considered a src #GstElement
      Non-src #GstElements (like sinks and filters) are automatically set to
      playing by the #GstHarness, but src #GstElements are not to avoid them
      starting to produce buffers.
      Hence, for src #GstElement you must call [gstcheck.harness.Harness.play] explicitly.
      
      MT safe.
  */
  void play()
  {
    gst_harness_play(cast(GstHarness*)this._cPtr);
  }

  /**
      Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. The pull
      will timeout in 60 seconds. This is the standard way of getting a buffer
      from a harnessed #GstElement.
      
      MT safe.
      Returns: a #GstBuffer or null if timed out.
  */
  gst.buffer.Buffer pull()
  {
    GstBuffer* _cretval;
    _cretval = gst_harness_pull(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness sinkpad.
      Timeouts after 60 seconds similar to gst_harness_pull.
      
      MT safe.
      Returns: a #GstEvent or null if timed out.
  */
  gst.event.Event pullEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_harness_pull_event(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. The pull
      will block until an EOS event is received, or timeout in 60 seconds.
      MT safe.
  
      Params:
        buf = A #GstBuffer, or null if EOS or timeout occures
            first.
      Returns: true on success, false on timeout.
  */
  bool pullUntilEos(out gst.buffer.Buffer buf)
  {
    bool _retval;
    GstBuffer* _buf;
    _retval = cast(bool)gst_harness_pull_until_eos(cast(GstHarness*)this._cPtr, &_buf);
    buf = new gst.buffer.Buffer(cast(void*)_buf, Yes.Take);
    return _retval;
  }

  /**
      Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness srcpad.
      Timeouts after 60 seconds similar to gst_harness_pull.
      
      MT safe.
      Returns: a #GstEvent or null if timed out.
  */
  gst.event.Event pullUpstreamEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_harness_pull_upstream_event(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pushes a #GstBuffer on the #GstHarness srcpad. The standard way of
      interacting with an harnessed element.
      
      MT safe.
  
      Params:
        buffer = a #GstBuffer to push
      Returns: a #GstFlowReturn with the result from the push
  */
  gst.types.FlowReturn push(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_harness_push(cast(GstHarness*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Basically a gst_harness_push and a gst_harness_pull in one line. Reflects
      the fact that you often want to do exactly this in your test: Push one buffer
      in, and inspect the outcome.
      
      MT safe.
  
      Params:
        buffer = a #GstBuffer to push
      Returns: a #GstBuffer or null if timed out.
  */
  gst.buffer.Buffer pushAndPull(gst.buffer.Buffer buffer)
  {
    GstBuffer* _cretval;
    _cretval = gst_harness_push_and_pull(cast(GstHarness*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pushes an #GstEvent on the #GstHarness srcpad.
      
      MT safe.
  
      Params:
        event = a #GstEvent to push
      Returns: a #gboolean with the result from the push
  */
  bool pushEvent(gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_harness_push_event(cast(GstHarness*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Transfer data from the src-#GstHarness to the main-#GstHarness. It consists
      of 4 steps:
      1: Make sure the src is started. (see: gst_harness_play)
      2: Crank the clock (see: gst_harness_crank_single_clock_wait)
      3: Pull a #GstBuffer from the src-#GstHarness (see: gst_harness_pull)
      4: Push the same #GstBuffer into the main-#GstHarness (see: gst_harness_push)
      
      MT safe.
      Returns: a #GstFlowReturn with the result of the push
  */
  gst.types.FlowReturn pushFromSrc()
  {
    GstFlowReturn _cretval;
    _cretval = gst_harness_push_from_src(cast(GstHarness*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Transfer one #GstBuffer from the main-#GstHarness to the sink-#GstHarness.
      See gst_harness_push_from_src for details.
      
      MT safe.
      Returns: a #GstFlowReturn with the result of the push
  */
  gst.types.FlowReturn pushToSink()
  {
    GstFlowReturn _cretval;
    _cretval = gst_harness_push_to_sink(cast(GstHarness*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Pushes an #GstEvent on the #GstHarness sinkpad.
      
      MT safe.
  
      Params:
        event = a #GstEvent to push
      Returns: a #gboolean with the result from the push
  */
  bool pushUpstreamEvent(gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_harness_push_upstream_event(cast(GstHarness*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the min latency reported by any harnessed #GstElement.
      
      MT safe.
      Returns: a #GstClockTime with min latency
  */
  gst.types.ClockTime queryLatency()
  {
    gst.types.ClockTime _retval;
    _retval = gst_harness_query_latency(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Setting this will make the harness block in the chain-function, and
      then release when [gstcheck.harness.Harness.pull] or [gstcheck.harness.Harness.tryPull] is called.
      Can be useful when wanting to control a src-element that is not implementing
      [gst.clock.Clock.idWait] so it can't be controlled by the #GstTestClock, since
      it otherwise would produce buffers as fast as possible.
      
      MT safe.
  */
  void setBlockingPushMode()
  {
    gst_harness_set_blocking_push_mode(cast(GstHarness*)this._cPtr);
  }

  /**
      Sets the GstHarness srcpad and sinkpad caps.
      
      MT safe.
  
      Params:
        in_ = a #GstCaps to set on the harness srcpad
        out_ = a #GstCaps to set on the harness sinkpad
  */
  void setCaps(gst.caps.Caps in_, gst.caps.Caps out_)
  {
    gst_harness_set_caps(cast(GstHarness*)this._cPtr, in_ ? cast(GstCaps*)in_._cPtr(Yes.Dup) : null, out_ ? cast(GstCaps*)out_._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the GstHarness srcpad and sinkpad caps using strings.
      
      MT safe.
  
      Params:
        in_ = a gchar describing a #GstCaps to set on the harness srcpad
        out_ = a gchar describing a #GstCaps to set on the harness sinkpad
  */
  void setCapsStr(string in_, string out_)
  {
    const(char)* _in_ = in_.toCString(No.Alloc);
    const(char)* _out_ = out_.toCString(No.Alloc);
    gst_harness_set_caps_str(cast(GstHarness*)this._cPtr, _in_, _out_);
  }

  /**
      When set to true, instead of placing the buffers arriving from the harnessed
      #GstElement inside the sinkpads #GAsyncQueue, they are instead unreffed.
      
      MT safe.
  
      Params:
        dropBuffers = a #gboolean specifying to drop outgoing buffers or not
  */
  void setDropBuffers(bool dropBuffers)
  {
    gst_harness_set_drop_buffers(cast(GstHarness*)this._cPtr, dropBuffers);
  }

  /**
      As a convenience, a src-harness will forward [gst.types.EventType.StreamStart],
      [gst.types.EventType.Caps] and [gst.types.EventType.Segment] to the main-harness if forwarding
      is enabled, and forward any sticky-events from the main-harness to
      the sink-harness. It will also forward the [gst.types.QueryType.Allocation].
      
      If forwarding is disabled, the user will have to either manually push
      these events from the src-harness using [gstcheck.harness.Harness.srcPushEvent], or
      create and push them manually. While this will allow full control and
      inspection of these events, for the most cases having forwarding enabled
      will be sufficient when writing a test where the src-harness' main function
      is providing data for the main-harness.
      
      Forwarding is enabled by default.
      
      MT safe.
  
      Params:
        forwarding = a #gboolean to enable/disable forwarding
  */
  void setForwarding(bool forwarding)
  {
    gst_harness_set_forwarding(cast(GstHarness*)this._cPtr, forwarding);
  }

  /**
      Sets the liveness reported by #GstHarness when receiving a latency-query.
      The default is true.
  
      Params:
        isLive = true for live, false for non-live
  */
  void setLive(bool isLive)
  {
    gst_harness_set_live(cast(GstHarness*)this._cPtr, isLive);
  }

  /**
      Sets the allocator and params to propose when receiving an allocation
      query.
      
      MT safe.
  
      Params:
        allocator = a #GstAllocator
        params = a #GstAllocationParams
  */
  void setProposeAllocator(gst.allocator.Allocator allocator, gst.allocation_params.AllocationParams params)
  {
    gst_harness_set_propose_allocator(cast(GstHarness*)this._cPtr, allocator ? cast(GstAllocator*)allocator._cPtr(Yes.Dup) : null, cast(const(GstAllocationParams)*)&params);
  }

  /**
      Sets the GstHarness sinkpad caps.
      
      MT safe.
  
      Params:
        caps = a #GstCaps to set on the harness sinkpad
  */
  void setSinkCaps(gst.caps.Caps caps)
  {
    gst_harness_set_sink_caps(cast(GstHarness*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the GstHarness sinkpad caps using a string.
      
      MT safe.
  
      Params:
        str = a gchar describing a #GstCaps to set on the harness sinkpad
  */
  void setSinkCapsStr(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gst_harness_set_sink_caps_str(cast(GstHarness*)this._cPtr, _str);
  }

  /**
      Sets the GstHarness srcpad caps. This must be done before any buffers
      can legally be pushed from the harness to the element.
      
      MT safe.
  
      Params:
        caps = a #GstCaps to set on the harness srcpad
  */
  void setSrcCaps(gst.caps.Caps caps)
  {
    gst_harness_set_src_caps(cast(GstHarness*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the GstHarness srcpad caps using a string. This must be done before
      any buffers can legally be pushed from the harness to the element.
      
      MT safe.
  
      Params:
        str = a gchar describing a #GstCaps to set on the harness srcpad
  */
  void setSrcCapsStr(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gst_harness_set_src_caps_str(cast(GstHarness*)this._cPtr, _str);
  }

  /**
      Advance the #GstTestClock to a specific time.
      
      MT safe.
  
      Params:
        time = a #GstClockTime to advance the clock to
      Returns: a gboolean true if the time could be set. false if not.
  */
  bool setTime(gst.types.ClockTime time)
  {
    bool _retval;
    _retval = cast(bool)gst_harness_set_time(cast(GstHarness*)this._cPtr, time);
    return _retval;
  }

  /**
      Sets the min latency reported by #GstHarness when receiving a latency-query
  
      Params:
        latency = a #GstClockTime specifying the latency
  */
  void setUpstreamLatency(gst.types.ClockTime latency)
  {
    gst_harness_set_upstream_latency(cast(GstHarness*)this._cPtr, latency);
  }

  /**
      Convenience that calls gst_harness_push_to_sink pushes number of times.
      Will abort the pushing if any one push fails.
      
      MT safe.
  
      Params:
        pushes = a #gint with the number of calls to gst_harness_push_to_sink
      Returns: a #GstFlowReturn with the result of the push
  */
  gst.types.FlowReturn sinkPushMany(int pushes)
  {
    GstFlowReturn _cretval;
    _cretval = gst_harness_sink_push_many(cast(GstHarness*)this._cPtr, pushes);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Transfer data from the src-#GstHarness to the main-#GstHarness. Similar to
      gst_harness_push_from_src, this variant allows you to specify how many cranks
      and how many pushes to perform. This can be useful for both moving a lot
      of data at the same time, as well as cases when one crank does not equal one
      buffer to push and v.v.
      
      MT safe.
  
      Params:
        cranks = a #gint with the number of calls to gst_harness_crank_single_clock_wait
        pushes = a #gint with the number of calls to gst_harness_push
      Returns: a #GstFlowReturn with the result of the push
  */
  gst.types.FlowReturn srcCrankAndPushMany(int cranks, int pushes)
  {
    GstFlowReturn _cretval;
    _cretval = gst_harness_src_crank_and_push_many(cast(GstHarness*)this._cPtr, cranks, pushes);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Similar to what gst_harness_src_push does with #GstBuffers, this transfers
      a #GstEvent from the src-#GstHarness to the main-#GstHarness. Note that
      some #GstEvents are being transferred automagically. Look at sink_forward_pad
      for details.
      
      MT safe.
      Returns: a #gboolean with the result of the push
  */
  bool srcPushEvent()
  {
    bool _retval;
    _retval = cast(bool)gst_harness_src_push_event(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Pulls all pending data from the harness and returns it as a single buffer.
      Returns: the data as a buffer. Unref with gst_buffer_unref()
            when no longer needed.
  */
  gst.buffer.Buffer takeAllDataAsBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_harness_take_all_data_as_buffer(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pulls all pending data from the harness and returns it as a single #GBytes.
      Returns: a pointer to the data, newly allocated. Free
            with [glib.global.gfree] when no longer needed.
  */
  glib.bytes.Bytes takeAllData()
  {
    GBytes* _cretval;
    _cretval = gst_harness_take_all_data_as_bytes(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tears down a GstHarness, freeing all resources allocated using it.
      
      MT safe.
  */
  void teardown()
  {
    gst_harness_teardown(cast(GstHarness*)this._cPtr);
  }

  /**
      Pulls a #GstBuffer from the #GAsyncQueue on the #GstHarness sinkpad. Unlike
      gst_harness_pull this will not wait for any buffers if not any are present,
      and return null straight away.
      
      MT safe.
      Returns: a #GstBuffer or null if no buffers are present in the #GAsyncQueue
  */
  gst.buffer.Buffer tryPull()
  {
    GstBuffer* _cretval;
    _cretval = gst_harness_try_pull(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness sinkpad.
      See gst_harness_try_pull for details.
      
      MT safe.
      Returns: a #GstEvent or null if no buffers are present in the #GAsyncQueue
  */
  gst.event.Event tryPullEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_harness_try_pull_event(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Pulls an #GstEvent from the #GAsyncQueue on the #GstHarness srcpad.
      See gst_harness_try_pull for details.
      
      MT safe.
      Returns: a #GstEvent or null if no buffers are present in the #GAsyncQueue
  */
  gst.event.Event tryPullUpstreamEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_harness_try_pull_upstream_event(cast(GstHarness*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The number of #GstEvents currently in the #GstHarness srcpad #GAsyncQueue
      
      MT safe.
      Returns: a #guint number of events in the queue
  */
  uint upstreamEventsInQueue()
  {
    uint _retval;
    _retval = gst_harness_upstream_events_in_queue(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      The total number of #GstEvents that has arrived on the #GstHarness srcpad
      This number includes events handled by the harness as well as events
      that have already been pulled out.
      
      MT safe.
      Returns: a #guint number of events received
  */
  uint upstreamEventsReceived()
  {
    uint _retval;
    _retval = gst_harness_upstream_events_received(cast(GstHarness*)this._cPtr);
    return _retval;
  }

  /**
      Sets the system #GstClock on the GstHarness #GstElement
      
      MT safe.
  */
  void useSystemclock()
  {
    gst_harness_use_systemclock(cast(GstHarness*)this._cPtr);
  }

  /**
      Sets the #GstTestClock on the #GstHarness #GstElement
      
      MT safe.
  */
  void useTestclock()
  {
    gst_harness_use_testclock(cast(GstHarness*)this._cPtr);
  }

  /**
      Waits for timeout seconds until waits number of #GstClockID waits is
      registered with the #GstTestClock. Useful for writing deterministic tests,
      where you want to make sure that an expected number of waits have been
      reached.
      
      MT safe.
  
      Params:
        waits = a #guint describing the numbers of #GstClockID registered with
          the #GstTestClock
        timeout = a #guint describing how many seconds to wait for waits to be true
      Returns: a gboolean true if the waits have been registered, false if not.
        (Could be that it timed out waiting or that more waits than waits was found)
  */
  bool waitForClockIdWaits(uint waits, uint timeout)
  {
    bool _retval;
    _retval = cast(bool)gst_harness_wait_for_clock_id_waits(cast(GstHarness*)this._cPtr, waits, timeout);
    return _retval;
  }

  /**
      Stop the running #GstHarnessThread
      
      MT safe.
  
      Params:
        t = a #GstHarnessThread
      Returns: 
  */
  static uint stressThreadStop(gstcheck.types.HarnessThread t)
  {
    uint _retval;
    _retval = gst_harness_stress_thread_stop(t);
    return _retval;
  }
}
