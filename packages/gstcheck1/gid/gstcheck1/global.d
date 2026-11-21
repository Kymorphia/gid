/// Global functions for gstcheck1 library
module gid.gstcheck1.global;

import gid.core.gid;
import gid.glib2.types;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gst1.message;
import gid.gst1.object;
import gid.gst1.pad;
import gid.gst1.pad_template;
import gid.gst1.static_pad_template;
import gid.gst1.types;
import gid.gstcheck1.c.functions;
import gid.gstcheck1.c.types;
import gid.gstcheck1.check_abistruct;
import gid.gstcheck1.types;


/**
    Get one buffer from pad. Implemented via buffer probes. This function will
    block until the pipeline passes a buffer over pad, so for robust behavior
    in unit tests, you need to use check's timeout to fail out in the case that a
    buffer never arrives.
    
    You must have previously called [gid.gstcheck1.global.bufferStrawStartPipeline] on
    pipeline and pad.

    Params:
      bin = the pipeline previously started via [gid.gstcheck1.global.bufferStrawStartPipeline]
      pad = the pad previously passed to [gid.gstcheck1.global.bufferStrawStartPipeline]
    Returns: the captured #GstBuffer.
*/
gid.gst1.buffer.Buffer bufferStrawGetBuffer(gid.gst1.element.Element bin, gid.gst1.pad.Pad pad) nothrow
{
  GstBuffer* _cretval;
  _cretval = gst_buffer_straw_get_buffer(bin ? cast(GstElement*)bin._cPtr(No.Dup) : null, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Sets up a pipeline for buffer sucking. This will allow you to call
    [gid.gstcheck1.global.bufferStrawGetBuffer] to access buffers as they pass over pad.
    
    This function is normally used in unit tests that want to verify that a
    particular element is outputting correct buffers. For example, you would make
    a pipeline via [gid.gst1.global.parseLaunch], pull out the pad you want to monitor, then
    call [gid.gstcheck1.global.bufferStrawGetBuffer] to get the buffers that pass through pad.
    The pipeline will block until you have sucked off the buffers.
    
    This function will set the state of bin to PLAYING; to clean up, be sure to
    call [gid.gstcheck1.global.bufferStrawStopPipeline].
    
    Note that you may not start two buffer straws at the same time. This function
    is intended for unit tests, not general API use. In fact it calls fail_if
    from libcheck, so you cannot use it outside unit tests.

    Params:
      bin = the pipeline to run
      pad = a pad on an element in bin
*/
void bufferStrawStartPipeline(gid.gst1.element.Element bin, gid.gst1.pad.Pad pad) nothrow
{
  gst_buffer_straw_start_pipeline(bin ? cast(GstElement*)bin._cPtr(No.Dup) : null, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
}

/**
    Set bin to #GST_STATE_NULL and release resource allocated in
    [gid.gstcheck1.global.bufferStrawStartPipeline].
    
    You must have previously called [gid.gstcheck1.global.bufferStrawStartPipeline] on
    pipeline and pad.

    Params:
      bin = the pipeline previously started via [gid.gstcheck1.global.bufferStrawStartPipeline]
      pad = the pad previously passed to [gid.gstcheck1.global.bufferStrawStartPipeline]
*/
void bufferStrawStopPipeline(gid.gst1.element.Element bin, gid.gst1.pad.Pad pad) nothrow
{
  gst_buffer_straw_stop_pipeline(bin ? cast(GstElement*)bin._cPtr(No.Dup) : null, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
}

/**
    Verifies that reference values and current values are equals in list.

    Params:
      list = A list of GstCheckABIStruct to be verified
      haveAbiSizes = Whether there is a reference ABI size already specified,
        if it is false and the `GST_ABI` environment variable is set, usable code
        for list will be printed.
*/
void checkAbiList(gid.gstcheck1.check_abistruct.CheckABIStruct list, bool haveAbiSizes) nothrow
{
  gst_check_abi_list(list ? cast(GstCheckABIStruct*)list._cPtr : null, haveAbiSizes);
}

/**
    Compare the buffer contents with data and size.

    Params:
      buffer = buffer to compare
      data = data to compare to
      size = size of data to compare
*/
void checkBufferData(gid.gst1.buffer.Buffer buffer, const(void)* data, size_t size) nothrow
{
  gst_check_buffer_data(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, data, size);
}

/**
    Compare two caps with gst_caps_is_equal and fail unless they are
    equal.

    Params:
      caps1 = first caps to compare
      caps2 = second caps to compare
*/
void checkCapsEqual(gid.gst1.caps.Caps caps1, gid.gst1.caps.Caps caps2) nothrow
{
  gst_check_caps_equal(caps1 ? cast(GstCaps*)caps1._cPtr(No.Dup) : null, caps2 ? cast(GstCaps*)caps2._cPtr(No.Dup) : null);
}

/**
    A fake chain function that appends the buffer to the internal list of
    buffers.

    Params:
      pad = 
      parent = 
      buffer = 
    Returns: 
*/
gid.gst1.types.FlowReturn checkChainFunc(gid.gst1.pad.Pad pad, gid.gst1.object.ObjectWrap parent, gid.gst1.buffer.Buffer buffer) nothrow
{
  GstFlowReturn _cretval;
  _cretval = gst_check_chain_func(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
  return _retval;
}

/**
    Clear all filters added by gst_check_add_log_filter.
    
    MT safe.
*/
void checkClearLogFilter() nothrow
{
  gst_check_clear_log_filter();
}

/**
    Unref and remove all buffers that are in the global buffers GList,
    emptying the list.
*/
void checkDropBuffers() nothrow
{
  gst_check_drop_buffers();
}

/**
    Create an element using the factory providing the element_name and
    push the buffer_in to this element. The element should create one buffer
    and this will be compared with buffer_out. We only check the caps
    and the data of the buffers. This function unrefs the buffers.

    Params:
      elementName = name of the element that needs to be created
      bufferIn = push this buffer to the element
      capsIn = the #GstCaps expected of the sinkpad of the element
      bufferOut = compare the result with this buffer
      capsOut = the #GstCaps expected of the srcpad of the element
*/
void checkElementPushBuffer(string elementName, gid.gst1.buffer.Buffer bufferIn, gid.gst1.caps.Caps capsIn, gid.gst1.buffer.Buffer bufferOut, gid.gst1.caps.Caps capsOut) nothrow
{
  const(char)* _elementName = elementName.toCString!(No.Malloc, No.Nullable);
  gst_check_element_push_buffer(_elementName, bufferIn ? cast(GstBuffer*)bufferIn._cPtr(No.Dup) : null, capsIn ? cast(GstCaps*)capsIn._cPtr(No.Dup) : null, bufferOut ? cast(GstBuffer*)bufferOut._cPtr(No.Dup) : null, capsOut ? cast(GstCaps*)capsOut._cPtr(No.Dup) : null);
}

/**
    Create an element using the factory providing the element_name and push the
    buffers in buffer_in to this element. The element should create the buffers
    equal to the buffers in buffer_out. We only check the size and the data of
    the buffers. This function unrefs the buffers in the two lists.
    The last_flow_return parameter indicates the expected flow return value from
    pushing the final buffer in the list.
    This can be used to set up a test which pushes some buffers and then an
    invalid buffer, when the final buffer is expected to fail, for example.

    Params:
      elementName = name of the element that needs to be created
      bufferIn = a list of buffers that needs to be
         pushed to the element
      capsIn = the #GstCaps expected of the sinkpad of the element
      bufferOut = a list of buffers that we expect from
        the element
      capsOut = the #GstCaps expected of the srcpad of the element
      lastFlowReturn = the last buffer push needs to give this GstFlowReturn
*/
void checkElementPushBufferList(string elementName, gid.gst1.buffer.Buffer[] bufferIn, gid.gst1.caps.Caps capsIn, gid.gst1.buffer.Buffer[] bufferOut, gid.gst1.caps.Caps capsOut, gid.gst1.types.FlowReturn lastFlowReturn) nothrow
{
  const(char)* _elementName = elementName.toCString!(No.Malloc, No.Nullable);
  auto _bufferIn = gListFromD!(gid.gst1.buffer.Buffer)(bufferIn);
  auto _bufferOut = gListFromD!(gid.gst1.buffer.Buffer)(bufferOut);
  gst_check_element_push_buffer_list(_elementName, _bufferIn, capsIn ? cast(GstCaps*)capsIn._cPtr(No.Dup) : null, _bufferOut, capsOut ? cast(GstCaps*)capsOut._cPtr(No.Dup) : null, lastFlowReturn);
}

/** */
void checkMessageError(gid.gst1.message.Message message, gid.gst1.types.MessageType type, gid.glib2.types.Quark domain, int code) nothrow
{
  gst_check_message_error(message ? cast(GstMessage*)message._cPtr(No.Dup) : null, type, domain, code);
}

/**
    Unrefs object_to_unref and checks that is has properly been
    destroyed.

    Params:
      objectToUnref = The #GObject to unref
*/
void checkObjectDestroyedOnUnref(void* objectToUnref = null) nothrow
{
  gst_check_object_destroyed_on_unref(objectToUnref);
}

/**
    Remove a filter that has been added by gst_check_add_log_filter.
    
    MT safe.

    Params:
      filter = Filter returned by gst_check_add_log_filter
*/
void checkRemoveLogFilter(gid.gstcheck1.types.CheckLogFilter filter) nothrow
{
  gst_check_remove_log_filter(filter);
}

/**
    setup an element for a filter test with mysrcpad and mysinkpad

    Params:
      factory = factory
    Returns: a new element
*/
gid.gst1.element.Element checkSetupElement(string factory) nothrow
{
  GstElement* _cretval;
  const(char)* _factory = factory.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_check_setup_element(_factory);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.element.Element)(cast(GstElement*)_cretval, Yes.Take);
  return _retval;
}

/**
    Push stream-start, caps and segment event, which consist of the minimum
    required events to allow streaming. Caps is optional to allow raw src
    testing. If element has more than one src or sink pad, use
    [gid.gstcheck1.global.checkSetupEventsWithStreamId] instead.

    Params:
      srcpad = The src #GstPad to push on
      element = The #GstElement use to create the stream id
      caps = #GstCaps in case caps event must be sent
      format = The #GstFormat of the default segment to send
*/
void checkSetupEvents(gid.gst1.pad.Pad srcpad, gid.gst1.element.Element element, gid.gst1.caps.Caps caps, gid.gst1.types.Format format) nothrow
{
  gst_check_setup_events(srcpad ? cast(GstPad*)srcpad._cPtr(No.Dup) : null, element ? cast(GstElement*)element._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, format);
}

/**
    Push stream-start, caps and segment event, which consist of the minimum
    required events to allow streaming. Caps is optional to allow raw src
    testing.

    Params:
      srcpad = The src #GstPad to push on
      element = The #GstElement use to create the stream id
      caps = #GstCaps in case caps event must be sent
      format = The #GstFormat of the default segment to send
      streamId = A unique identifier for the stream
*/
void checkSetupEventsWithStreamId(gid.gst1.pad.Pad srcpad, gid.gst1.element.Element element, gid.gst1.caps.Caps caps, gid.gst1.types.Format format, string streamId) nothrow
{
  const(char)* _streamId = streamId.toCString!(No.Malloc, No.Nullable);
  gst_check_setup_events_with_stream_id(srcpad ? cast(GstPad*)srcpad._cPtr(No.Dup) : null, element ? cast(GstElement*)element._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, format, _streamId);
}

/**
    Does the same as #gst_check_setup_sink_pad_by_name with the <emphasis> name </emphasis> parameter equal to "src".

    Params:
      element = element to setup pad on
      tmpl = pad template
    Returns: a new pad that can be used to check the output of element
*/
gid.gst1.pad.Pad checkSetupSinkPad(gid.gst1.element.Element element, gid.gst1.static_pad_template.StaticPadTemplate tmpl) nothrow
{
  GstPad* _cretval;
  _cretval = gst_check_setup_sink_pad(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstStaticPadTemplate*)tmpl._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a new sink pad (based on the given tmpl) and links it to the given element src pad
    (the pad that matches the given name).
    You can set event/chain/query functions on this pad to check the output of the element.

    Params:
      element = element to setup pad on
      tmpl = pad template
      name = Name of the element src pad that will be linked to the sink pad that will be setup
    Returns: a new pad that can be used to check the output of element
*/
gid.gst1.pad.Pad checkSetupSinkPadByName(gid.gst1.element.Element element, gid.gst1.static_pad_template.StaticPadTemplate tmpl, string name) nothrow
{
  GstPad* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_check_setup_sink_pad_by_name(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstStaticPadTemplate*)tmpl._cPtr(No.Dup) : null, _name);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/** */
gid.gst1.pad.Pad checkSetupSinkPadByNameFromTemplate(gid.gst1.element.Element element, gid.gst1.pad_template.PadTemplate tmpl, string name) nothrow
{
  GstPad* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_check_setup_sink_pad_by_name_from_template(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstPadTemplate*)tmpl._cPtr(No.Dup) : null, _name);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/** */
gid.gst1.pad.Pad checkSetupSinkPadFromTemplate(gid.gst1.element.Element element, gid.gst1.pad_template.PadTemplate tmpl) nothrow
{
  GstPad* _cretval;
  _cretval = gst_check_setup_sink_pad_from_template(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstPadTemplate*)tmpl._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/**
    Does the same as #gst_check_setup_src_pad_by_name with the <emphasis> name </emphasis> parameter equal to "sink".

    Params:
      element = element to setup pad on
      tmpl = pad template
    Returns: A new pad that can be used to inject data on element
*/
gid.gst1.pad.Pad checkSetupSrcPad(gid.gst1.element.Element element, gid.gst1.static_pad_template.StaticPadTemplate tmpl) nothrow
{
  GstPad* _cretval;
  _cretval = gst_check_setup_src_pad(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstStaticPadTemplate*)tmpl._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a new src pad (based on the given tmpl) and links it to the given element sink pad (the pad that matches the given name).
    Before using the src pad to push data on element you need to call #gst_check_setup_events on the created src pad.
    
    Example of how to push a buffer on element:
    
    ```c
    static GstStaticPadTemplate sinktemplate = GST_STATIC_PAD_TEMPLATE ("sink",
    GST_PAD_SINK,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS (YOUR_CAPS_TEMPLATE_STRING)
    );
    static GstStaticPadTemplate srctemplate = GST_STATIC_PAD_TEMPLATE ("src",
    GST_PAD_SRC,
    GST_PAD_ALWAYS,
    GST_STATIC_CAPS (YOUR_CAPS_TEMPLATE_STRING)
    );
    
    GstElement * element = gst_check_setup_element ("element");
    GstPad * mysrcpad = gst_check_setup_src_pad (element, &srctemplate);
    GstPad * mysinkpad = gst_check_setup_sink_pad (element, &sinktemplate);
    
    gst_pad_set_active (mysrcpad, TRUE);
    gst_pad_set_active (mysinkpad, TRUE);
    fail_unless (gst_element_set_state (element, GST_STATE_PLAYING) == GST_STATE_CHANGE_SUCCESS, "could not set to playing");
    
    GstCaps * caps = gst_caps_from_string (YOUR_DESIRED_SINK_CAPS);
    gst_check_setup_events (mysrcpad, element, caps, GST_FORMAT_TIME);
    gst_caps_unref (caps);
    
    fail_unless (gst_pad_push (mysrcpad, gst_buffer_new_and_alloc(2)) == GST_FLOW_OK);
    ```
    
    For very simple input/output test scenarios checkout #gst_check_element_push_buffer_list and #gst_check_element_push_buffer.

    Params:
      element = element to setup src pad on
      tmpl = pad template
      name = Name of the element sink pad that will be linked to the src pad that will be setup
    Returns: A new pad that can be used to inject data on element
*/
gid.gst1.pad.Pad checkSetupSrcPadByName(gid.gst1.element.Element element, gid.gst1.static_pad_template.StaticPadTemplate tmpl, string name) nothrow
{
  GstPad* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_check_setup_src_pad_by_name(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstStaticPadTemplate*)tmpl._cPtr(No.Dup) : null, _name);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/** */
gid.gst1.pad.Pad checkSetupSrcPadByNameFromTemplate(gid.gst1.element.Element element, gid.gst1.pad_template.PadTemplate tmpl, string name) nothrow
{
  GstPad* _cretval;
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_check_setup_src_pad_by_name_from_template(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstPadTemplate*)tmpl._cPtr(No.Dup) : null, _name);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/** */
gid.gst1.pad.Pad checkSetupSrcPadFromTemplate(gid.gst1.element.Element element, gid.gst1.pad_template.PadTemplate tmpl) nothrow
{
  GstPad* _cretval;
  _cretval = gst_check_setup_src_pad_from_template(element ? cast(GstElement*)element._cPtr(No.Dup) : null, tmpl ? cast(GstPadTemplate*)tmpl._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
  return _retval;
}

/** */
void checkTeardownElement(gid.gst1.element.Element element) nothrow
{
  gst_check_teardown_element(element ? cast(GstElement*)element._cPtr(No.Dup) : null);
}

/** */
void checkTeardownPadByName(gid.gst1.element.Element element, string name) nothrow
{
  const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
  gst_check_teardown_pad_by_name(element ? cast(GstElement*)element._cPtr(No.Dup) : null, _name);
}

/** */
void checkTeardownSinkPad(gid.gst1.element.Element element) nothrow
{
  gst_check_teardown_sink_pad(element ? cast(GstElement*)element._cPtr(No.Dup) : null);
}

/** */
void checkTeardownSrcPad(gid.gst1.element.Element element) nothrow
{
  gst_check_teardown_src_pad(element ? cast(GstElement*)element._cPtr(No.Dup) : null);
}

/**
    Sets up a data probe on the given pad which will raise assertions if the
    data flow is inconsistent.

    Params:
      consist = The #GstStreamConsistency handle
      pad = The #GstPad on which the dataflow will be checked.
    Returns: true if the pad was added
*/
bool consistencyCheckerAddPad(gid.gstcheck1.types.StreamConsistency consist, gid.gst1.pad.Pad pad) nothrow
{
  bool _retval;
  _retval = cast(bool)gst_consistency_checker_add_pad(consist, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Frees the allocated data and probes associated with consist.

    Params:
      consist = The #GstStreamConsistency to free.
*/
void consistencyCheckerFree(gid.gstcheck1.types.StreamConsistency consist) nothrow
{
  gst_consistency_checker_free(consist);
}

/**
    Reset the stream checker's internal variables.

    Params:
      consist = The #GstStreamConsistency to reset.
*/
void consistencyCheckerReset(gid.gstcheck1.types.StreamConsistency consist) nothrow
{
  gst_consistency_checker_reset(consist);
}
