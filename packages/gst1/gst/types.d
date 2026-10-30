/// D types for gst1 library
module gst.types;

import gid.gid;
import glib.thread;
import glib.types;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gst.buffer;
import gst.buffer_list;
import gst.bus;
import gst.c.functions;
import gst.c.types;
import gst.caps_features;
import gst.clock;
import gst.control_binding;
import gst.control_source;
import gst.custom_meta;
import gst.debug_category;
import gst.debug_message;
import gst.element;
import gst.event;
import gst.iterator;
import gst.map_info;
import gst.memory;
import gst.message;
import gst.meta;
import gst.meta_info;
import gst.mini_object;
import gst.object;
import gst.pad;
import gst.pad_probe_info;
import gst.plugin;
import gst.plugin_feature;
import gst.promise;
import gst.query;
import gst.structure;
import gst.tag_list;
import gst.task;
import gst.type_find;


// Aliases

/** */
alias BufferMapInfo = gst.map_info.MapInfo;

/** */
alias ClockID = GstClockID;

/** */
alias ClockTime = GstClockTime;

/** */
alias ClockTimeDiff = GstClockTimeDiff;

/** */
alias ElementFactoryListType = GstElementFactoryListType;

/** */
alias MemoryMapInfo = gst.map_info.MapInfo;

// Enums

/** */
alias AllocatorFlags = GstAllocatorFlags;

/** */
alias BinFlags = GstBinFlags;

/** */
alias BufferCopyFlags = GstBufferCopyFlags;

/** */
alias BufferFlags = GstBufferFlags;

/** */
alias BufferPoolAcquireFlags = GstBufferPoolAcquireFlags;

/** */
alias BufferingMode = GstBufferingMode;

/** */
alias BusFlags = GstBusFlags;

/** */
alias BusSyncReply = GstBusSyncReply;

/** */
alias CapsFlags = GstCapsFlags;

/** */
alias CapsIntersectMode = GstCapsIntersectMode;

/** */
alias ClockEntryType = GstClockEntryType;

/** */
alias ClockFlags = GstClockFlags;

/** */
alias ClockReturn = GstClockReturn;

/** */
alias ClockType = GstClockType;

/** */
alias CoreError = GstCoreError;

/** */
alias DebugColorFlags = GstDebugColorFlags;

/** */
alias DebugColorMode = GstDebugColorMode;

/** */
alias DebugGraphDetails = GstDebugGraphDetails;

/** */
alias DebugLevel = GstDebugLevel;

/** */
alias ElementFlags = GstElementFlags;

/** */
alias EventType = GstEventType;

/** */
alias EventTypeFlags = GstEventTypeFlags;

/** */
alias FlowReturn = GstFlowReturn;

/** */
alias Format = GstFormat;

/** */
alias GapFlags = GstGapFlags;

/** */
alias IteratorItem = GstIteratorItem;

/** */
alias IteratorResult = GstIteratorResult;

/** */
alias LibraryError = GstLibraryError;

/** */
alias LockFlags = GstLockFlags;

/** */
alias MapFlags = GstMapFlags;

/** */
alias MemoryFlags = GstMemoryFlags;

/** */
alias MessageType = GstMessageType;

/** */
alias MetaFlags = GstMetaFlags;

/** */
alias MiniObjectFlags = GstMiniObjectFlags;

/** */
alias ObjectFlags = GstObjectFlags;

/** */
alias PadDirection = GstPadDirection;

/** */
alias PadFlags = GstPadFlags;

/** */
alias PadLinkCheck = GstPadLinkCheck;

/** */
alias PadLinkReturn = GstPadLinkReturn;

/** */
alias PadMode = GstPadMode;

/** */
alias PadPresence = GstPadPresence;

/** */
alias PadProbeReturn = GstPadProbeReturn;

/** */
alias PadProbeType = GstPadProbeType;

/** */
alias PadTemplateFlags = GstPadTemplateFlags;

/** */
alias ParseError = GstParseError;

/** */
alias ParseFlags = GstParseFlags;

/** */
alias PipelineFlags = GstPipelineFlags;

/** */
alias PluginAPIFlags = GstPluginAPIFlags;

/** */
alias PluginDependencyFlags = GstPluginDependencyFlags;

/** */
alias PluginError = GstPluginError;

/** */
alias PluginFlags = GstPluginFlags;

/** */
alias ProgressType = GstProgressType;

/** */
alias PromiseResult = GstPromiseResult;

/** */
alias QOSType = GstQOSType;

/** */
alias QueryType = GstQueryType;

/** */
alias QueryTypeFlags = GstQueryTypeFlags;

/** */
alias Rank = GstRank;

/** */
alias ResourceError = GstResourceError;

/** */
alias SchedulingFlags = GstSchedulingFlags;

/** */
alias SearchMode = GstSearchMode;

/** */
alias SeekFlags = GstSeekFlags;

/** */
alias SeekType = GstSeekType;

/** */
alias SegmentFlags = GstSegmentFlags;

/** */
alias SerializeFlags = GstSerializeFlags;

/** */
alias StackTraceFlags = GstStackTraceFlags;

/** */
alias State = GstState;

/** */
alias StateChange = GstStateChange;

/** */
alias StateChangeReturn = GstStateChangeReturn;

/** */
alias StreamError = GstStreamError;

/** */
alias StreamFlags = GstStreamFlags;

/** */
alias StreamStatusType = GstStreamStatusType;

/** */
alias StreamType = GstStreamType;

/** */
alias StructureChangeType = GstStructureChangeType;

/** */
alias TagFlag = GstTagFlag;

/** */
alias TagMergeMode = GstTagMergeMode;

/** */
alias TagScope = GstTagScope;

/** */
alias TaskState = GstTaskState;

/** */
alias TocEntryType = GstTocEntryType;

/** */
alias TocLoopType = GstTocLoopType;

/** */
alias TocScope = GstTocScope;

/** */
alias TracerValueFlags = GstTracerValueFlags;

/** */
alias TracerValueScope = GstTracerValueScope;

/** */
alias TypeFindProbability = GstTypeFindProbability;

/** */
alias URIError = GstURIError;

/** */
alias URIType = GstURIType;

// Structs

/** */
alias BufferPoolAcquireParams = GstBufferPoolAcquireParams;

/** */
alias MetaTransformCopy = GstMetaTransformCopy;

/** */
alias TimedValue = GstTimedValue;

/** */
alias ValueTable = GstValueTable;

// Callbacks

/**
    Specifies the type of function passed to [gst.bus.Bus.addWatch] or
    [gst.bus.Bus.addWatchFull], which is called from the mainloop when a message
    is available on the bus.
    
    The message passed to the function will be unreffed after execution of this
    function so it should not be freed in the function.
    
    Note that this function is used as a #GSourceFunc which means that returning
    false will remove the #GSource from the mainloop.

    Params:
      bus = the #GstBus that sent the message
      message = the #GstMessage
    Returns: false if the event source should be removed.
*/
alias BusFunc = bool delegate(gst.bus.Bus bus, gst.message.Message message);

/**
    Handler will be invoked synchronously, when a new message has been injected
    into the bus. This function is mostly used internally. Only one sync handler
    can be attached to a given bus.
    
    If the handler returns [gst.types.BusSyncReply.Drop], it should unref the message, else the
    message should not be unreffed by the sync handler.

    Params:
      bus = the #GstBus that sent the message
      message = the #GstMessage
    Returns: #GstBusSyncReply stating what to do with the message
*/
alias BusSyncHandler = gst.types.BusSyncReply delegate(gst.bus.Bus bus, gst.message.Message message);

/**
    A function that will be called in [gst.caps.Caps.filterAndMapInPlace].
    The function may modify features and structure, and both will be
    removed from the caps if false is returned.

    Params:
      features = the #GstCapsFeatures
      structure = the #GstStructure
    Returns: true if the features and structure should be preserved,
      false if it should be removed.
*/
alias CapsFilterMapFunc = bool delegate(gst.caps_features.CapsFeatures features, gst.structure.Structure structure);

/**
    A function that will be called in [gst.caps.Caps.foreach_]. The function may
    not modify features or structure.

    Params:
      features = the #GstCapsFeatures
      structure = the #GstStructure
    Returns: true if the foreach operation should continue, false if
      the foreach operation should stop with false.
*/
alias CapsForeachFunc = bool delegate(gst.caps_features.CapsFeatures features, gst.structure.Structure structure);

/**
    A function that will be called in [gst.caps.Caps.mapInPlace]. The function
    may modify features and structure.

    Params:
      features = the #GstCapsFeatures
      structure = the #GstStructure
    Returns: true if the map operation should continue, false if
      the map operation should stop with false.
*/
alias CapsMapFunc = bool delegate(gst.caps_features.CapsFeatures features, gst.structure.Structure structure);

/**
    The function prototype of the callback.

    Params:
      clock = The clock that triggered the callback
      time = The time it was triggered
      id = The #GstClockID that expired
    Returns: true or false (currently unused)
*/
alias ClockCallback = bool delegate(gst.clock.Clock clock, gst.types.ClockTime time, gst.types.ClockID id);

/**
    FIXME(2.0): remove, this is unused

    Params:
      binding = 
      srcValue = 
      destValue = 
*/
alias ControlBindingConvert = void delegate(gst.control_binding.ControlBinding binding, double srcValue, gobject.value.Value destValue);

/**
    Function for returning a value for a given timestamp.

    Params:
      self = the #GstControlSource instance
      timestamp = timestamp for which a value should be calculated
      value = a value which will be set to the result.
    Returns: true if the value was successfully calculated.
*/
alias ControlSourceGetValue = bool delegate(gst.control_source.ControlSource self, gst.types.ClockTime timestamp, out double value);

/**
    Function called for each meta in buffer as a result of performing a
    transformation that yields transbuf. Additional type specific transform
    data is passed to the function as data.
    
    Implementations should check the type of the transform and parse
    additional type specific fields in data that should be used to update
    the metadata on transbuf.

    Params:
      transbuf = a #GstBuffer
      meta = a #GstCustomMeta
      buffer = a #GstBuffer
      type = the transform type
      data = transform specific data.
    Returns: true if the transform could be performed
*/
alias CustomMetaTransformFunction = bool delegate(gst.buffer.Buffer transbuf, gst.custom_meta.CustomMeta meta, gst.buffer.Buffer buffer, glib.types.Quark type, void* data);

/**
    we define this to avoid a compiler warning regarding a cast from a function
    pointer to a void pointer
    (see https://bugzilla.gnome.org/show_bug.cgi?id=309253)
*/
alias DebugFuncPtr = void delegate();

/**
    Callback prototype used in #gst_element_call_async

    Params:
      element = The #GstElement this function has been called against
*/
alias ElementCallAsyncFunc = void delegate(gst.element.Element element);

/**
    Function called for each pad when using [gst.element.Element.foreachSinkPad],
    [gst.element.Element.foreachSrcPad], or [gst.element.Element.foreachPad].

    Params:
      element = the #GstElement
      pad = a #GstPad
    Returns: false to stop iterating pads, true to continue
*/
alias ElementForeachPadFunc = bool delegate(gst.element.Element element, gst.pad.Pad pad);

/**
    This function will be called when creating a copy of it and should
    create a copy of all custom iterator fields or increase their
    reference counts.

    Params:
      it = The original iterator
      copy = The copied iterator
*/
alias IteratorCopyFunction = void delegate(gst.iterator.Iterator it, gst.iterator.Iterator copy);

/**
    A function to be passed to [gst.iterator.Iterator.fold].

    Params:
      item = the item to fold
      ret = a #GValue collecting the result
    Returns: true if the fold should continue, false if it should stop.
*/
alias IteratorFoldFunction = bool delegate(gobject.value.Value item, gobject.value.Value ret);

/**
    A function that is called by [gst.iterator.Iterator.foreach_] for every element.

    Params:
      item = The item
*/
alias IteratorForeachFunction = void delegate(gobject.value.Value item);

/**
    This function will be called when the iterator is freed.
    
    Implementors of a #GstIterator should implement this
    function and pass it to the constructor of the custom iterator.
    The function will be called with the iterator lock held.

    Params:
      it = the iterator
*/
alias IteratorFreeFunction = void delegate(gst.iterator.Iterator it);

/**
    The function that will be called after the next item of the iterator
    has been retrieved. This function can be used to skip items or stop
    the iterator.
    
    The function will be called with the iterator lock held.

    Params:
      it = the iterator
      item = the item being retrieved.
    Returns: the result of the operation.
*/
alias IteratorItemFunction = gst.types.IteratorItem delegate(gst.iterator.Iterator it, gobject.value.Value item);

/**
    The function that will be called when the next element of the iterator
    should be retrieved.
    
    Implementors of a #GstIterator should implement this
    function and pass it to the constructor of the custom iterator.
    The function will be called with the iterator lock held.

    Params:
      it = the iterator
      result = a pointer to hold the next item
    Returns: the result of the operation.
*/
alias IteratorNextFunction = gst.types.IteratorResult delegate(gst.iterator.Iterator it, gobject.value.Value result);

/**
    This function will be called whenever a concurrent update happened
    to the iterated datastructure. The implementor of the iterator should
    restart the iterator from the beginning and clean up any state it might
    have.
    
    Implementors of a #GstIterator should implement this
    function and pass it to the constructor of the custom iterator.
    The function will be called with the iterator lock held.

    Params:
      it = the iterator
*/
alias IteratorResyncFunction = void delegate(gst.iterator.Iterator it);

/**
    Function prototype for a logging function that can be registered with
    [gst.global.debugAddLogFunction].
    Use G_GNUC_NO_INSTRUMENT on that function.

    Params:
      category = a #GstDebugCategory
      level = a #GstDebugLevel
      file = file name
      function_ = function name
      line = line number
      object = a #GObject
      message = the message
*/
alias LogFunction = void delegate(gst.debug_category.DebugCategory category, gst.types.DebugLevel level, string file, string function_, int line, gobject.object.ObjectWrap object, gst.debug_message.DebugMessage message);

/**
    Copy size bytes from mem starting at offset and return them wrapped in a
    new GstMemory object.
    If size is set to -1, all bytes starting at offset are copied.

    Params:
      mem = a #GstMemory
      offset = an offset
      size = a size or -1
    Returns: a new #GstMemory object wrapping a copy of the requested region in
      mem.
*/
alias MemoryCopyFunction = gst.memory.Memory delegate(gst.memory.Memory mem, ptrdiff_t offset, ptrdiff_t size);

/**
    Check if mem1 and mem2 occupy contiguous memory and return the offset of
    mem1 in the parent buffer in offset.

    Params:
      mem1 = a #GstMemory
      mem2 = a #GstMemory
      offset = a result offset
    Returns: true if mem1 and mem2 are in contiguous memory.
*/
alias MemoryIsSpanFunction = bool delegate(gst.memory.Memory mem1, gst.memory.Memory mem2, out size_t offset);

/**
    Get the memory of mem that can be accessed according to the mode specified
    in info's flags. The function should return a pointer that contains at least
    maxsize bytes.

    Params:
      mem = a #GstMemory
      info = the #GstMapInfo to map with
      maxsize = size to map
    Returns: a pointer to memory of which at least maxsize bytes can be
      accessed according to the access pattern in info's flags.
*/
alias MemoryMapFullFunction = void* delegate(gst.memory.Memory mem, gst.map_info.MapInfo info, size_t maxsize);

/**
    Get the memory of mem that can be accessed according to the mode specified
    in flags. The function should return a pointer that contains at least
    maxsize bytes.

    Params:
      mem = a #GstMemory
      maxsize = size to map
      flags = access mode for the memory
    Returns: a pointer to memory of which at least maxsize bytes can be
      accessed according to the access pattern in flags.
*/
alias MemoryMapFunction = void* delegate(gst.memory.Memory mem, size_t maxsize, gst.types.MapFlags flags);

/**
    Share size bytes from mem starting at offset and return them wrapped in a
    new GstMemory object. If size is set to -1, all bytes starting at offset are
    shared. This function does not make a copy of the bytes in mem.

    Params:
      mem = a #GstMemory
      offset = an offset
      size = a size or -1
    Returns: a new #GstMemory object sharing the requested region in mem.
*/
alias MemoryShareFunction = gst.memory.Memory delegate(gst.memory.Memory mem, ptrdiff_t offset, ptrdiff_t size);

/**
    Release the pointer previously retrieved with [gst.memory.Memory.map] with info.

    Params:
      mem = a #GstMemory
      info = a #GstMapInfo
*/
alias MemoryUnmapFullFunction = void delegate(gst.memory.Memory mem, gst.map_info.MapInfo info);

/**
    Release the pointer previously retrieved with [gst.memory.Memory.map].

    Params:
      mem = a #GstMemory
*/
alias MemoryUnmapFunction = void delegate(gst.memory.Memory mem);

/**
    Clears the content of the meta. This will be called by the GstBufferPool
    when a pooled buffer is returned.

    Params:
      buffer = a #GstBuffer
      meta = a #GstMeta
*/
alias MetaClearFunction = void delegate(gst.buffer.Buffer buffer, gst.meta.Meta meta);

/**
    Recreate a #GstMeta from serialized data returned by
    #GstMetaSerializeFunction and add it to buffer.

    Params:
      info = #GstMetaInfo of the meta
      buffer = a #GstBuffer
      data = data obtained from #GstMetaSerializeFunction
      version_ = 
    Returns: the metadata owned by buffer, or null.
*/
alias MetaDeserializeFunction = gst.meta.Meta delegate(gst.meta_info.MetaInfo info, gst.buffer.Buffer buffer, ubyte[] data, ubyte version_);

/**
    Function called when meta is freed in buffer.

    Params:
      meta = a #GstMeta
      buffer = a #GstBuffer
*/
alias MetaFreeFunction = void delegate(gst.meta.Meta meta, gst.buffer.Buffer buffer);

/**
    Function called when meta is initialized in buffer.

    Params:
      meta = a #GstMeta
      params = parameters passed to the init function
      buffer = a #GstBuffer
    Returns: 
*/
alias MetaInitFunction = bool delegate(gst.meta.Meta meta, void* params, gst.buffer.Buffer buffer);

/**
    Function called for each meta in buffer as a result of performing a
    transformation on transbuf. Additional type specific transform data
    is passed to the function as data.
    
    Implementations should check the type of the transform and parse
    additional type specific fields in data that should be used to update
    the metadata on transbuf.

    Params:
      transbuf = a #GstBuffer
      meta = a #GstMeta
      buffer = a #GstBuffer
      type = the transform type
    Returns: true if the transform could be performed
*/
alias MetaTransformFunction = bool delegate(gst.buffer.Buffer transbuf, gst.meta.Meta meta, gst.buffer.Buffer buffer, glib.types.Quark type);

/**
    Function prototype for methods to create copies of instances.

    Params:
      obj = MiniObject to copy
    Returns: reference to cloned instance.
*/
alias MiniObjectCopyFunction = gst.mini_object.MiniObject delegate(gst.mini_object.MiniObject obj);

/**
    Function prototype for when a miniobject has lost its last refcount.
    Implementation of the mini object are allowed to revive the
    passed object by doing a [gst.mini_object.MiniObject.ref_]. If the object is not
    revived after the dispose function, the function should return true
    and the memory associated with the object is freed.

    Params:
      obj = MiniObject to dispose
    Returns: true if the object should be cleaned up.
*/
alias MiniObjectDisposeFunction = bool delegate(gst.mini_object.MiniObject obj);

/**
    Virtual function prototype for methods to free resources used by
    mini-objects.

    Params:
      obj = MiniObject to free
*/
alias MiniObjectFreeFunction = void delegate(gst.mini_object.MiniObject obj);

/**
    A #GstMiniObjectNotify function can be added to a mini object as a
    callback that gets triggered when [gst.mini_object.MiniObject.unref] drops the
    last ref and obj is about to be freed.

    Params:
      obj = the mini object
*/
alias MiniObjectNotify = void delegate(gst.mini_object.MiniObject obj);

/**
    This function is called when the pad is activated during the element
    READY to PAUSED state change. By default this function will call the
    activate function that puts the pad in push mode but elements can
    override this function to activate the pad in pull mode if they wish.

    Params:
      pad = a #GstPad
      parent = the parent of pad
    Returns: true if the pad could be activated.
*/
alias PadActivateFunction = bool delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent);

/**
    The prototype of the push and pull activate functions.

    Params:
      pad = a #GstPad
      parent = the parent of pad
      mode = the requested activation mode of pad
      active = activate or deactivate the pad.
    Returns: true if the pad could be activated or deactivated.
*/
alias PadActivateModeFunction = bool delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.types.PadMode mode, bool active);

/**
    A function that will be called on sinkpads when chaining buffers.
    The function typically processes the data contained in the buffer and
    either consumes the data or passes it on to the internally linked pad(s).
    
    The implementer of this function receives a refcount to buffer and should
    gst_buffer_unref() when the buffer is no longer needed.
    
    When a chain function detects an error in the data stream, it must post an
    error on the bus and return an appropriate #GstFlowReturn value.

    Params:
      pad = the sink #GstPad that performed the chain.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      buffer = the #GstBuffer that is chained, not null.
    Returns: #GST_FLOW_OK for success
*/
alias PadChainFunction = gst.types.FlowReturn delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.buffer.Buffer buffer);

/**
    A function that will be called on sinkpads when chaining buffer lists.
    The function typically processes the data contained in the buffer list and
    either consumes the data or passes it on to the internally linked pad(s).
    
    The implementer of this function receives a refcount to list and
    should gst_buffer_list_unref() when the list is no longer needed.
    
    When a chainlist function detects an error in the data stream, it must
    post an error on the bus and return an appropriate #GstFlowReturn value.

    Params:
      pad = the sink #GstPad that performed the chain.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      list = the #GstBufferList that is chained, not null.
    Returns: #GST_FLOW_OK for success
*/
alias PadChainListFunction = gst.types.FlowReturn delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.buffer_list.BufferList list);

/**
    Function signature to handle an event for the pad.
    
    This variant is for specific elements that will take into account the
    last downstream flow return (from a pad push), in which case they can
    return it.

    Params:
      pad = the #GstPad to handle the event.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      event = the #GstEvent to handle.
    Returns: [gst.types.FlowReturn.Ok] if the event was handled properly, or any other
      #GstFlowReturn dependent on downstream state.
*/
alias PadEventFullFunction = gst.types.FlowReturn delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.event.Event event);

/**
    Function signature to handle an event for the pad.

    Params:
      pad = the #GstPad to handle the event.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      event = the #GstEvent to handle.
    Returns: true if the pad could handle the event.
*/
alias PadEventFunction = bool delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.event.Event event);

/**
    A forward function is called for all internally linked pads, see
    [gst.pad.Pad.forward].

    Params:
      pad = the #GstPad that is forwarded.
    Returns: true if the dispatching procedure has to be stopped.
*/
alias PadForwardFunction = bool delegate(gst.pad.Pad pad);

/**
    The signature of the internal pad link iterator function.

    Params:
      pad = The #GstPad to query.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
    Returns: a new #GstIterator that will iterate over all pads that are
      linked to the given pad on the inside of the parent element.
      
      the caller must call [gst.iterator.Iterator.free] after usage.
*/
alias PadIterIntLinkFunction = gst.iterator.Iterator delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent);

/**
    Function signature to handle a new link on the pad.

    Params:
      pad = the #GstPad that is linked.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      peer = the peer #GstPad of the link
    Returns: the result of the link with the specified peer.
*/
alias PadLinkFunction = gst.types.PadLinkReturn delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.pad.Pad peer);

/**
    Callback used by [gst.pad.Pad.addProbe]. Gets called to notify about the current
    blocking type.
    
    The callback is allowed to modify the data pointer in info.

    Params:
      pad = the #GstPad that is blocked
      info = #GstPadProbeInfo
    Returns: a #GstPadProbeReturn
*/
alias PadProbeCallback = gst.types.PadProbeReturn delegate(gst.pad.Pad pad, gst.pad_probe_info.PadProbeInfo info);

/**
    The signature of the query function.

    Params:
      pad = the #GstPad to query.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      query = the #GstQuery object to execute
    Returns: true if the query could be performed.
*/
alias PadQueryFunction = bool delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.query.Query query);

/**
    Function signature to handle a unlinking the pad prom its peer.
    
    The pad's lock is already held when the unlink function is called, so most
    pad functions cannot be called from within the callback.

    Params:
      pad = the #GstPad that is linked.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
*/
alias PadUnlinkFunction = void delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent);

/**
    A function that can be used with e.g. [gst.registry.Registry.featureFilter]
    to get a list of pluginfeature that match certain criteria.

    Params:
      feature = the pluginfeature to check
    Returns: true for a positive match, false otherwise
*/
alias PluginFeatureFilter = bool delegate(gst.plugin_feature.PluginFeature feature);

/**
    A function that can be used with e.g. [gst.registry.Registry.pluginFilter]
    to get a list of plugins that match certain criteria.

    Params:
      plugin = the plugin to check
    Returns: true for a positive match, false otherwise
*/
alias PluginFilter = bool delegate(gst.plugin.Plugin plugin);

/**
    A plugin should provide a pointer to a function of either #GstPluginInitFunc
    or this type in the plugin_desc struct.
    The function will be called by the loader at startup. One would then
    register each #GstPluginFeature. This version allows
    user data to be passed to init function (useful for bindings).

    Params:
      plugin = The plugin object
    Returns: true if plugin initialised successfully
*/
alias PluginInitFullFunc = bool delegate(gst.plugin.Plugin plugin);

/**
    A plugin should provide a pointer to a function of this type in the
    plugin_desc struct.
    This function will be called by the loader at startup. One would then
    register each #GstPluginFeature.

    Params:
      plugin = The plugin object
    Returns: true if plugin initialised successfully
*/
alias PluginInitFunc = bool delegate(gst.plugin.Plugin plugin);

/** */
alias PromiseChangeFunc = void delegate(gst.promise.Promise promise);

/**
    A function that will be called in [gst.structure.Structure.filterAndMapInPlace].
    The function may modify value, and the value will be removed from
    the structure if false is returned.

    Params:
      fieldId = the #GQuark of the field name
      value = the #GValue of the field
    Returns: true if the field should be preserved, false if it
      should be removed.
*/
alias StructureFilterMapFunc = bool delegate(glib.types.Quark fieldId, gobject.value.Value value);

/**
    A function that will be called in [gst.structure.Structure.foreach_]. The function may
    not modify value.

    Params:
      fieldId = the #GQuark of the field name
      value = the #GValue of the field
    Returns: true if the foreach operation should continue, false if
      the foreach operation should stop with false.
*/
alias StructureForeachFunc = bool delegate(glib.types.Quark fieldId, gobject.value.Value value);

/**
    A function that will be called in [gst.structure.Structure.mapInPlace]. The function
    may modify value.

    Params:
      fieldId = the #GQuark of the field name
      value = the #GValue of the field
    Returns: true if the map operation should continue, false if
      the map operation should stop with false.
*/
alias StructureMapFunc = bool delegate(glib.types.Quark fieldId, gobject.value.Value value);

/**
    A function that will be called in [gst.tag_list.TagList.foreach_]. The function may
    not modify the tag list.

    Params:
      list = the #GstTagList
      tag = a name of a tag in list
*/
alias TagForeachFunc = void delegate(gst.tag_list.TagList list, string tag);

/**
    A function for merging multiple values of a tag used when registering
    tags.

    Params:
      dest = the destination #GValue
      src = the source #GValue
*/
alias TagMergeFunc = void delegate(gobject.value.Value dest, gobject.value.Value src);

/**
    A function that will repeatedly be called in the thread created by
    a #GstTask.
*/
alias TaskFunction = void delegate();

/**
    Task function, see [gst.task_pool.TaskPool.push].
*/
alias TaskPoolFunction = void delegate();

/**
    Custom GstTask thread callback functions that can be installed.

    Params:
      task = The #GstTask
      thread = The #GThread
*/
alias TaskThreadFunc = void delegate(gst.task.Task task, glib.thread.Thread thread);

/**
    A function that will be called by typefinding.

    Params:
      find = A #GstTypeFind structure
*/
alias TypeFindFunction = void delegate(gst.type_find.TypeFind find);

/**
    Used together with [gst.global.valueCompare] to compare #GValue items.

    Params:
      value1 = first value for comparison
      value2 = second value for comparison
    Returns: one of GST_VALUE_LESS_THAN, GST_VALUE_EQUAL, GST_VALUE_GREATER_THAN
      or GST_VALUE_UNORDERED
*/
alias ValueCompareFunc = int delegate(gobject.value.Value value1, gobject.value.Value value2);

/**
    Used by [gst.global.valueDeserialize] to parse a non-binary form into the #GValue.

    Params:
      dest = a #GValue
      s = a string
    Returns: true for success
*/
alias ValueDeserializeFunc = bool delegate(gobject.value.Value dest, string s);

/**
    Used by [gst.global.valueDeserializeWithPspec] to parse a non-binary form into the #GValue.

    Params:
      dest = a #GValue
      s = a string
      pspec = a #GParamSpec describing the expected value
    Returns: true for success
*/
alias ValueDeserializeWithPSpecFunc = bool delegate(gobject.value.Value dest, string s, gobject.param_spec.ParamSpec pspec);

/**
    Used by [gst.global.valueSerialize] to obtain a non-binary form of the #GValue.
    
    Free-function: g_free

    Params:
      value1 = a #GValue
    Returns: the string representation of the value
*/
alias ValueSerializeFunc = string delegate(gobject.value.Value value1);

/**
    The allocator name for the default system memory allocator
*/
enum ALLOCATOR_SYSMEM = "SystemMemory";

/**
    Combination of all possible fields that can be copied with
    [gst.buffer.Buffer.copyInto].
*/
enum BUFFER_COPY_ALL = 15;

/**
    Combination of all possible metadata fields that can be copied with
    [gst.buffer.Buffer.copyInto].
*/
enum BUFFER_COPY_METADATA = 7;

/**
    Constant for no-offset return results.
*/
enum BUFFER_OFFSET_NONE = 18446744073709551615;

/** */
enum CAN_INLINE = 1;

/** */
enum CAPS_FEATURE_MEMORY_SYSTEM_MEMORY = "memory:SystemMemory";

/**
    Constant to define an undefined clock time.
*/
enum CLOCK_TIME_NONE = 18446744073709551615;

/** */
enum DEBUG_BG_MASK = 240;

/** */
enum DEBUG_FG_MASK = 15;

/** */
enum DEBUG_FORMAT_MASK = 65280;

/** */
enum ELEMENT_FACTORY_KLASS_DECODER = "Decoder";

/** */
enum ELEMENT_FACTORY_KLASS_DECRYPTOR = "Decryptor";

/** */
enum ELEMENT_FACTORY_KLASS_DEMUXER = "Demuxer";

/** */
enum ELEMENT_FACTORY_KLASS_DEPAYLOADER = "Depayloader";

/** */
enum ELEMENT_FACTORY_KLASS_ENCODER = "Encoder";

/** */
enum ELEMENT_FACTORY_KLASS_ENCRYPTOR = "Encryptor";

/** */
enum ELEMENT_FACTORY_KLASS_FORMATTER = "Formatter";

/**
    Elements interacting with hardware devices should specify this classifier in
    their metadata. You may need to put the element in "READY" state to test if
    the hardware is present in the system.
*/
enum ELEMENT_FACTORY_KLASS_HARDWARE = "Hardware";

/** */
enum ELEMENT_FACTORY_KLASS_MEDIA_AUDIO = "Audio";

/** */
enum ELEMENT_FACTORY_KLASS_MEDIA_IMAGE = "Image";

/** */
enum ELEMENT_FACTORY_KLASS_MEDIA_METADATA = "Metadata";

/** */
enum ELEMENT_FACTORY_KLASS_MEDIA_SUBTITLE = "Subtitle";

/** */
enum ELEMENT_FACTORY_KLASS_MEDIA_VIDEO = "Video";

/** */
enum ELEMENT_FACTORY_KLASS_MUXER = "Muxer";

/** */
enum ELEMENT_FACTORY_KLASS_PARSER = "Parser";

/** */
enum ELEMENT_FACTORY_KLASS_PAYLOADER = "Payloader";

/** */
enum ELEMENT_FACTORY_KLASS_SINK = "Sink";

/** */
enum ELEMENT_FACTORY_KLASS_SRC = "Source";

/**
    Elements of any of the defined GST_ELEMENT_FACTORY_LIST types
*/
enum ELEMENT_FACTORY_TYPE_ANY = 562949953421311;

/**
    All sinks handling audio, video or image media types
*/
enum ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS = 3940649673949188;

/**
    All encoders handling audio media types
*/
enum ELEMENT_FACTORY_TYPE_AUDIO_ENCODER = 1125899906842626;

/**
    All elements used to 'decode' streams (decoders, demuxers, parsers, depayloaders)
*/
enum ELEMENT_FACTORY_TYPE_DECODABLE = 1377;

/** */
enum ELEMENT_FACTORY_TYPE_DECODER = 1;

/** */
enum ELEMENT_FACTORY_TYPE_DECRYPTOR = 1024;

/** */
enum ELEMENT_FACTORY_TYPE_DEMUXER = 32;

/** */
enum ELEMENT_FACTORY_TYPE_DEPAYLOADER = 256;

/** */
enum ELEMENT_FACTORY_TYPE_ENCODER = 2;

/** */
enum ELEMENT_FACTORY_TYPE_ENCRYPTOR = 2048;

/** */
enum ELEMENT_FACTORY_TYPE_FORMATTER = 512;

/** */
enum ELEMENT_FACTORY_TYPE_HARDWARE = 4096;

/** */
enum ELEMENT_FACTORY_TYPE_MAX_ELEMENTS = 281474976710656;

/**
    Elements matching any of the defined GST_ELEMENT_FACTORY_TYPE_MEDIA types
    
    Note: Do not use this if you wish to not filter against any of the defined
    media types. If you wish to do this, simply don't specify any
    GST_ELEMENT_FACTORY_TYPE_MEDIA flag.
*/
enum ELEMENT_FACTORY_TYPE_MEDIA_ANY = 18446462598732840960;

/** */
enum ELEMENT_FACTORY_TYPE_MEDIA_AUDIO = 1125899906842624;

/** */
enum ELEMENT_FACTORY_TYPE_MEDIA_IMAGE = 2251799813685248;

/** */
enum ELEMENT_FACTORY_TYPE_MEDIA_METADATA = 9007199254740992;

/** */
enum ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE = 4503599627370496;

/** */
enum ELEMENT_FACTORY_TYPE_MEDIA_VIDEO = 562949953421312;

/** */
enum ELEMENT_FACTORY_TYPE_MUXER = 16;

/** */
enum ELEMENT_FACTORY_TYPE_PARSER = 64;

/** */
enum ELEMENT_FACTORY_TYPE_PAYLOADER = 128;

/** */
enum ELEMENT_FACTORY_TYPE_SINK = 4;

/** */
enum ELEMENT_FACTORY_TYPE_SRC = 8;

/**
    Timestamp correcting elements
*/
enum ELEMENT_FACTORY_TYPE_TIMESTAMPER = 8192;

/**
    All encoders handling video or image media types
*/
enum ELEMENT_FACTORY_TYPE_VIDEO_ENCODER = 2814749767106562;

/**
    Name and contact details of the author(s). Use \n to separate
    multiple author details.
    E.g: "Joe Bloggs &lt;joe.blogs at foo.com&gt;"
*/
enum ELEMENT_METADATA_AUTHOR = "author";

/**
    Sentence describing the purpose of the element.
    E.g: "Write stream to a file"
*/
enum ELEMENT_METADATA_DESCRIPTION = "description";

/**
    Set uri pointing to user documentation. Applications can use this to show
    help for e.g. effects to users.
*/
enum ELEMENT_METADATA_DOC_URI = "doc-uri";

/**
    Elements that bridge to certain other products can include an icon of that
    used product. Application can show the icon in menus/selectors to help
    identifying specific elements.
*/
enum ELEMENT_METADATA_ICON_NAME = "icon-name";

/**
    String describing the type of element, as an unordered list
    separated with slashes ('/'). See draft-klass.txt of the design docs
    for more details and common types. E.g: "Sink/File"
*/
enum ELEMENT_METADATA_KLASS = "klass";

/**
    The long English name of the element. E.g. "File Sink"
*/
enum ELEMENT_METADATA_LONGNAME = "long-name";

/**
    Builds a string using errno describing the previously failed system
    call.  To be used as the debug argument in #GST_ELEMENT_ERROR.
*/
enum ERROR_SYSTEM = "system error: %s";

/** */
enum EVENT_NUM_SHIFT = 8;

/**
    The same thing as #GST_EVENT_TYPE_UPSTREAM | #GST_EVENT_TYPE_DOWNSTREAM.
*/
enum EVENT_TYPE_BOTH = 3;

/**
    A mask value with all bits set, for use as a
    GstFlagSet mask where all flag bits must match
    exactly
*/
enum FLAG_SET_MASK_EXACT = 4294967295;

/**
    The PERCENT format is between 0 and this value
*/
enum FORMAT_PERCENT_MAX = 1000000;

/**
    The value used to scale down the reported PERCENT format value to
    its real value.
*/
enum FORMAT_PERCENT_SCALE = 10000;

/**
    Can be used together with #GST_FOURCC_ARGS to properly output a
    #guint32 fourcc value in a printf\()-style text message.
    
    ```
    printf ("fourcc: %" GST_FOURCC_FORMAT "\n", GST_FOURCC_ARGS (fcc));
    ```
*/
enum FOURCC_FORMAT = "c%c%c%c";

/**
    A value which is guaranteed to never be returned by
    [gst.global.utilGroupIdNext].
    
    Can be used as a default value in variables used to store group_id.
*/
enum GROUP_ID_INVALID = 0;

/**
    To be used in GST_PLUGIN_DEFINE if unsure about the licence.
*/
enum LICENSE_UNKNOWN = "unknown";

/**
    GstLockFlags value alias for GST_LOCK_FLAG_READ | GST_LOCK_FLAG_WRITE
*/
enum LOCK_FLAG_READWRITE = 3;

/**
    GstMapFlags value alias for GST_MAP_READ | GST_MAP_WRITE
*/
enum MAP_READWRITE = 3;

/**
    This metadata stays relevant until a deep copy is made.
*/
enum META_TAG_MEMORY_REFERENCE_STR = "memory-reference";

/**
    This metadata stays relevant as long as memory layout is unchanged.
    In hindsight, this tag should have been called "memory-layout".
*/
enum META_TAG_MEMORY_STR = "memory";

/**
    Constant that defines one GStreamer millisecond.
*/
enum MSECOND = 1000000;

/**
    Constant that defines one GStreamer nanosecond
*/
enum NSECOND = 1;

/**
    Use this flag on GObject properties of GstObject to indicate that
    they might not be available depending on environment such as OS, device, etc,
    so such properties will be installed conditionally only if the GstObject is
    able to support it.
*/
enum PARAM_CONDITIONALLY_AVAILABLE = 16384;

/**
    Use this flag on GObject properties to signal they can make sense to be.
    controlled over time. This hint is used by the GstController.
*/
enum PARAM_CONTROLLABLE = 512;

/**
    Use this flag on GObject properties of GstObject to indicate that
    during `gst-inspect` and friends, the default value should be used
    as default instead of the current value.
*/
enum PARAM_DOC_SHOW_DEFAULT = 8192;

/**
    Use this flag on GObject properties of GstElements to indicate that
    they can be changed when the element is in the PAUSED or lower state.
    This flag implies GST_PARAM_MUTABLE_READY.
*/
enum PARAM_MUTABLE_PAUSED = 2048;

/**
    Use this flag on GObject properties of GstElements to indicate that
    they can be changed when the element is in the PLAYING or lower state.
    This flag implies GST_PARAM_MUTABLE_PAUSED.
*/
enum PARAM_MUTABLE_PLAYING = 4096;

/**
    Use this flag on GObject properties of GstElements to indicate that
    they can be changed when the element is in the READY or lower state.
*/
enum PARAM_MUTABLE_READY = 1024;

/**
    Bits based on GST_PARAM_USER_SHIFT can be used by 3rd party applications.
*/
enum PARAM_USER_SHIFT = 65536;

/**
    The field name in a GstCaps that is used to signal the UUID of the protection
    system.
*/
enum PROTECTION_SYSTEM_ID_CAPS_FIELD = "protection-system";

/**
    The protection system value of the unspecified UUID.
    In some cases the system protection ID is not present in the contents or in their
    metadata, as encrypted WebM.
    This define is used to set the value of the "system_id" field in GstProtectionEvent,
    with this value, the application will use an external information to choose which
    protection system to use.
    
    Example: The matroskademux uses this value in the case of encrypted WebM,
    the application will choose the appropriate protection system based on the information
    received through EME API.
*/
enum PROTECTION_UNSPECIFIED_SYSTEM_ID = "unspecified-system-id";

/**
    printf format type used to debug GStreamer types. You can use this in
    combination with GStreamer's debug logging system as well as the functions
    [gst.global.infoVasprintf], [gst.global.infoStrdupVprintf] and [gst.global.infoStrdupPrintf]
    to pretty-print the following types: #GstCaps, #GstStructure,
    #GstCapsFeatures, #GstTagList, #GstDateTime, #GstBuffer, #GstBufferList,
    #GstMessage, #GstEvent, #GstQuery, #GstContext, #GstPad, #GstObject. All
    #GObject types will be printed as typename plus pointer, and everything
    else will simply be printed as pointer address.
    
    This can only be used on types whose size is >= sizeof(gpointer).
*/
enum PTR_FORMAT = "paA";

/** */
enum QUERY_NUM_SHIFT = 8;

/**
    The same thing as #GST_QUERY_TYPE_UPSTREAM | #GST_QUERY_TYPE_DOWNSTREAM.
*/
enum QUERY_TYPE_BOTH = 3;

/**
    Constant that defines one GStreamer second.
*/
enum SECOND = 1000000000;

/**
    printf format type used to debug GStreamer segments. You can use this in
    combination with GStreamer's debug logging system as well as the functions
    [gst.global.infoVasprintf], [gst.global.infoStrdupVprintf] and [gst.global.infoStrdupPrintf]
    to pretty-print #GstSegment structures.
    This can only be used on pointers to GstSegment structures.
*/
enum SEGMENT_FORMAT = "paB";

/** */
enum SEGMENT_INSTANT_FLAGS = 912;

/**
    A value which is guaranteed to never be returned by
    [gst.global.utilSeqnumNext].
    
    Can be used as a default value in variables used to store seqnum.
*/
enum SEQNUM_INVALID = 0;

/**
    printf format type used to debug GStreamer signed time value pointers. You
    can use this in combination with GStreamer's debug logging system as well as
    the functions [gst.global.infoVasprintf], [gst.global.infoStrdupVprintf] and
    [gst.global.infoStrdupPrintf] to pretty-print signed time (pointers to
    #GstClockTimeDiff or #gint64).
*/
enum STIMEP_FORMAT = "paS";

/**
    A string that can be used in printf-like format strings to display a signed
    #GstClockTimeDiff or #gint64 value in `h:m:s` format.  Use GST_TIME_ARGS() to
    construct the matching arguments.
    
    Example:
    
    ``` C
    printf("%" GST_STIME_FORMAT "\n", GST_STIME_ARGS(ts));
    ```
*/
enum STIME_FORMAT = "c%";

/**
    album containing this data (string)
    
    The album name as it should be displayed, e.g. 'The Jazz Guitar'
*/
enum TAG_ALBUM = "album";

/**
    The artist of the entire album, as it should be displayed.
*/
enum TAG_ALBUM_ARTIST = "album-artist";

/**
    The artist of the entire album, as it should be sorted.
*/
enum TAG_ALBUM_ARTIST_SORTNAME = "album-artist-sortname";

/**
    album gain in db (double)
*/
enum TAG_ALBUM_GAIN = "replaygain-album-gain";

/**
    peak of the album (double)
*/
enum TAG_ALBUM_PEAK = "replaygain-album-peak";

/**
    album containing this data, as used for sorting (string)
    
    The album name as it should be sorted, e.g. 'Jazz Guitar, The'
*/
enum TAG_ALBUM_SORTNAME = "album-sortname";

/**
    count of discs inside collection this disc belongs to (unsigned integer)
*/
enum TAG_ALBUM_VOLUME_COUNT = "album-disc-count";

/**
    disc number inside a collection (unsigned integer)
*/
enum TAG_ALBUM_VOLUME_NUMBER = "album-disc-number";

/**
    Arbitrary application data (sample)
    
    Some formats allow applications to add their own arbitrary data
    into files. This data is application dependent.
*/
enum TAG_APPLICATION_DATA = "application-data";

/**
    Name of the application used to create the media (string)
*/
enum TAG_APPLICATION_NAME = "application-name";

/**
    person(s) responsible for the recording (string)
    
    The artist name as it should be displayed, e.g. 'Jimi Hendrix' or
    'The Guitar Heroes'
*/
enum TAG_ARTIST = "artist";

/**
    person(s) responsible for the recording, as used for sorting (string)
    
    The artist name as it should be sorted, e.g. 'Hendrix, Jimi' or
    'Guitar Heroes, The'
*/
enum TAG_ARTIST_SORTNAME = "artist-sortname";

/**
    generic file attachment (sample) (sample taglist should specify the content
    type and if possible set "filename" to the file name of the
    attachment)
*/
enum TAG_ATTACHMENT = "attachment";

/**
    codec the audio data is stored in (string)
*/
enum TAG_AUDIO_CODEC = "audio-codec";

/**
    number of beats per minute in audio (double)
*/
enum TAG_BEATS_PER_MINUTE = "beats-per-minute";

/**
    exact or average bitrate in bits/s (unsigned integer)
*/
enum TAG_BITRATE = "bitrate";

/**
    codec the data is stored in (string)
*/
enum TAG_CODEC = "codec";

/**
    free text commenting the data (string)
*/
enum TAG_COMMENT = "comment";

/**
    person(s) who composed the recording (string)
*/
enum TAG_COMPOSER = "composer";

/**
    The composer's name, used for sorting (string)
*/
enum TAG_COMPOSER_SORTNAME = "composer-sortname";

/**
    conductor/performer refinement (string)
*/
enum TAG_CONDUCTOR = "conductor";

/**
    contact information (string)
*/
enum TAG_CONTACT = "contact";

/**
    container format the data is stored in (string)
*/
enum TAG_CONTAINER_FORMAT = "container-format";

/**
    Unique identifier for the audio, video or text track this tag is associated
    with. The mappings for several container formats are defined in the [Sourcing
    In-band Media Resource Tracks from Media Containers into HTML
    specification](https://dev.w3.org/html5/html-sourcing-inband-tracks/).
*/
enum TAG_CONTAINER_SPECIFIC_TRACK_ID = "container-specific-track-id";

/**
    copyright notice of the data (string)
*/
enum TAG_COPYRIGHT = "copyright";

/**
    URI to location where copyright details can be found (string)
*/
enum TAG_COPYRIGHT_URI = "copyright-uri";

/**
    date the data was created (#GDate structure)
*/
enum TAG_DATE = "date";

/**
    date and time the data was created (#GstDateTime structure)
*/
enum TAG_DATE_TIME = "datetime";

/**
    short text describing the content of the data (string)
*/
enum TAG_DESCRIPTION = "description";

/**
    Manufacturer of the device used to create the media (string)
*/
enum TAG_DEVICE_MANUFACTURER = "device-manufacturer";

/**
    Model of the device used to create the media (string)
*/
enum TAG_DEVICE_MODEL = "device-model";

/**
    length in GStreamer time units (nanoseconds) (unsigned 64-bit integer)
*/
enum TAG_DURATION = "duration";

/**
    name of the person or organisation that encoded the file. May contain a
    copyright message if the person or organisation also holds the copyright
    (string)
    
    Note: do not use this field to describe the encoding application. Use
    #GST_TAG_APPLICATION_NAME or #GST_TAG_COMMENT for that.
*/
enum TAG_ENCODED_BY = "encoded-by";

/**
    encoder used to encode this stream (string)
*/
enum TAG_ENCODER = "encoder";

/**
    version of the encoder used to encode this stream (unsigned integer)
*/
enum TAG_ENCODER_VERSION = "encoder-version";

/**
    key/value text commenting the data (string)
    
    Must be in the form of 'key=comment' or
    'key[lc]=comment' where 'lc' is an ISO-639
    language code.
    
    This tag is used for unknown Vorbis comment tags,
    unknown APE tags and certain ID3v2 comment fields.
*/
enum TAG_EXTENDED_COMMENT = "extended-comment";

/**
    genre this data belongs to (string)
*/
enum TAG_GENRE = "genre";

/**
    Indicates the direction the device is pointing to when capturing
    a media. It is represented as degrees in floating point representation,
    0 means the geographic north, and increases clockwise (double from 0 to 360)
    
    See also #GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION
*/
enum TAG_GEO_LOCATION_CAPTURE_DIRECTION = "geo-location-capture-direction";

/**
    The city (english name) where the media has been produced (string).
*/
enum TAG_GEO_LOCATION_CITY = "geo-location-city";

/**
    The country (english name) where the media has been produced (string).
*/
enum TAG_GEO_LOCATION_COUNTRY = "geo-location-country";

/**
    geo elevation of where the media has been recorded or produced in meters
    according to WGS84 (zero is average sea level) (double).
*/
enum TAG_GEO_LOCATION_ELEVATION = "geo-location-elevation";

/**
    Represents the expected error on the horizontal positioning in
    meters (double).
*/
enum TAG_GEO_LOCATION_HORIZONTAL_ERROR = "geo-location-horizontal-error";

/**
    geo latitude location of where the media has been recorded or produced in
    degrees according to WGS84 (zero at the equator, negative values for southern
    latitudes) (double).
*/
enum TAG_GEO_LOCATION_LATITUDE = "geo-location-latitude";

/**
    geo longitude location of where the media has been recorded or produced in
    degrees according to WGS84 (zero at the prime meridian in Greenwich/UK,
    negative values for western longitudes). (double).
*/
enum TAG_GEO_LOCATION_LONGITUDE = "geo-location-longitude";

/**
    Indicates the movement direction of the device performing the capture
    of a media. It is represented as degrees in floating point representation,
    0 means the geographic north, and increases clockwise (double from 0 to 360)
    
    See also #GST_TAG_GEO_LOCATION_CAPTURE_DIRECTION
*/
enum TAG_GEO_LOCATION_MOVEMENT_DIRECTION = "geo-location-movement-direction";

/**
    Speed of the capturing device when performing the capture.
    Represented in m/s. (double)
    
    See also #GST_TAG_GEO_LOCATION_MOVEMENT_DIRECTION
*/
enum TAG_GEO_LOCATION_MOVEMENT_SPEED = "geo-location-movement-speed";

/**
    human readable descriptive location of where the media has been recorded or
    produced. (string).
*/
enum TAG_GEO_LOCATION_NAME = "geo-location-name";

/**
    A location 'smaller' than GST_TAG_GEO_LOCATION_CITY that specifies better
    where the media has been produced. (e.g. the neighborhood) (string).
    
    This tag has been added as this is how it is handled/named in XMP's
    Iptc4xmpcore schema.
*/
enum TAG_GEO_LOCATION_SUBLOCATION = "geo-location-sublocation";

/**
    Groups together media that are related and spans multiple tracks. An
    example are multiple pieces of a concerto. (string)
*/
enum TAG_GROUPING = "grouping";

/**
    Homepage for this media (i.e. artist or movie homepage) (string)
*/
enum TAG_HOMEPAGE = "homepage";

/**
    image (sample) (sample taglist should specify the content type and preferably
    also set "image-type" field as [gsttag.types.TagImageType])
*/
enum TAG_IMAGE = "image";

/**
    Represents the 'Orientation' tag from EXIF. Defines how the image
    should be rotated and mirrored for display. (string)
    
    This tag has a predefined set of allowed values:
      "rotate-0"
      "rotate-90"
      "rotate-180"
      "rotate-270"
      "flip-rotate-0"
      "flip-rotate-90"
      "flip-rotate-180"
      "flip-rotate-270"
    
    The naming is adopted according to a possible transformation to perform
    on the image to fix its orientation, obviously equivalent operations will
    yield the same result.
    
    Rotations indicated by the values are in clockwise direction and
    'flip' means an horizontal mirroring.
*/
enum TAG_IMAGE_ORIENTATION = "image-orientation";

/**
    Information about the people behind a remix and similar
    interpretations of another existing piece (string)
*/
enum TAG_INTERPRETED_BY = "interpreted-by";

/**
    International Standard Recording Code - see http://www.ifpi.org/isrc/ (string)
*/
enum TAG_ISRC = "isrc";

/**
    comma separated keywords describing the content (string).
*/
enum TAG_KEYWORDS = "keywords";

/**
    ISO-639-2 or ISO-639-1 code for the language the content is in (string)
    
    There is utility API in libgsttag in gst-plugins-base to obtain a translated
    language name from the language code: `[gsttag.global.tagGetLanguageName]`
*/
enum TAG_LANGUAGE_CODE = "language-code";

/**
    Name of the language the content is in (string)
    
    Free-form name of the language the content is in, if a language code
    is not available. This tag should not be set in addition to a language
    code. It is undefined what language or locale the language name is in.
*/
enum TAG_LANGUAGE_NAME = "language-name";

/**
    license of data (string)
*/
enum TAG_LICENSE = "license";

/**
    URI to location where license details can be found (string)
*/
enum TAG_LICENSE_URI = "license-uri";

/**
    Origin of media as a URI (location, where the original of the file or stream
    is hosted) (string)
*/
enum TAG_LOCATION = "location";

/**
    The lyrics of the media (string)
*/
enum TAG_LYRICS = "lyrics";

/**
    maximum bitrate in bits/s (unsigned integer)
*/
enum TAG_MAXIMUM_BITRATE = "maximum-bitrate";

/**
    [Midi note number](http://en.wikipedia.org/wiki/Note#Note_designation_in_accordance_with_octave_name)
    of the audio track. This is useful for sample instruments and in particular
    for multi-samples.
*/
enum TAG_MIDI_BASE_NOTE = "midi-base-note";

/**
    minimum bitrate in bits/s (unsigned integer)
*/
enum TAG_MINIMUM_BITRATE = "minimum-bitrate";

/**
    nominal bitrate in bits/s (unsigned integer). The actual bitrate might be
    different from this target bitrate.
*/
enum TAG_NOMINAL_BITRATE = "nominal-bitrate";

/**
    organization (string)
*/
enum TAG_ORGANIZATION = "organization";

/**
    person(s) performing (string)
*/
enum TAG_PERFORMER = "performer";

/**
    image that is meant for preview purposes, e.g. small icon-sized version
    (sample) (sample taglist should specify the content type)
*/
enum TAG_PREVIEW_IMAGE = "preview-image";

/**
    Any private data that may be contained in tags (sample).
    
    It is represented by #GstSample in which #GstBuffer contains the
    binary data and the sample's info #GstStructure may contain any
    extra information that identifies the origin or meaning of the data.
    
    Private frames in ID3v2 tags ('PRIV' frames) will be represented
    using this tag, in which case the GstStructure will be named
    "ID3PrivateFrame" and contain a field named "owner" of type string
    which contains the owner-identification string from the tag.
*/
enum TAG_PRIVATE_DATA = "private-data";

/**
    Name of the label or publisher (string)
*/
enum TAG_PUBLISHER = "publisher";

/**
    reference level of track and album gain values (double)
*/
enum TAG_REFERENCE_LEVEL = "replaygain-reference-level";

/**
    serial number of track (unsigned integer)
*/
enum TAG_SERIAL = "serial";

/**
    Number of the episode within a season/show (unsigned integer)
*/
enum TAG_SHOW_EPISODE_NUMBER = "show-episode-number";

/**
    Name of the show, used for displaying (string)
*/
enum TAG_SHOW_NAME = "show-name";

/**
    Number of the season of a show/series (unsigned integer)
*/
enum TAG_SHOW_SEASON_NUMBER = "show-season-number";

/**
    Name of the show, used for sorting (string)
*/
enum TAG_SHOW_SORTNAME = "show-sortname";

/**
    codec/format the subtitle data is stored in (string)
*/
enum TAG_SUBTITLE_CODEC = "subtitle-codec";

/**
    commonly used title (string)
    
    The title as it should be displayed, e.g. 'The Doll House'
*/
enum TAG_TITLE = "title";

/**
    commonly used title, as used for sorting (string)
    
    The title as it should be sorted, e.g. 'Doll House, The'
*/
enum TAG_TITLE_SORTNAME = "title-sortname";

/**
    count of tracks inside collection this track belongs to (unsigned integer)
*/
enum TAG_TRACK_COUNT = "track-count";

/**
    track gain in db (double)
*/
enum TAG_TRACK_GAIN = "replaygain-track-gain";

/**
    track number inside a collection (unsigned integer)
*/
enum TAG_TRACK_NUMBER = "track-number";

/**
    peak of the track (double)
*/
enum TAG_TRACK_PEAK = "replaygain-track-peak";

/**
    Rating attributed by a person (likely the application user).
    The higher the value, the more the user likes this media
    (unsigned int from 0 to 100)
*/
enum TAG_USER_RATING = "user-rating";

/**
    version of this data (string)
*/
enum TAG_VERSION = "version";

/**
    codec the video data is stored in (string)
*/
enum TAG_VIDEO_CODEC = "video-codec";

/**
    printf format type used to debug GStreamer ClockTime pointers. You can use
    this in combination with GStreamer's debug logging system as well as the
    functions [gst.global.infoVasprintf], [gst.global.infoStrdupVprintf] and
    [gst.global.infoStrdupPrintf] to pretty-print #GstClockTime pointers. This can
    only be used on pointers to GstClockTime values.
*/
enum TIMEP_FORMAT = "paT";

/**
    A string that can be used in printf-like format strings to display a
    #GstClockTime value in `h:m:s` format.  Use GST_TIME_ARGS() to construct
    the matching arguments.
    
    Example:
    
    ``` C
    printf("%" GST_TIME_FORMAT "\n", GST_TIME_ARGS(ts));
    ```
*/
enum TIME_FORMAT = "u:%02u:%02u.%09u";

/**
    Special value for the repeat_count set in [gst.toc_entry.TocEntry.setLoop] or
    returned by [gst.toc_entry.TocEntry.setLoop] to indicate infinite looping.
*/
enum TOC_REPEAT_COUNT_INFINITE = -1;

/**
    Value for #GstUri<!-- -->.port to indicate no port number.
*/
enum URI_NO_PORT = 0;

/**
    Constant that defines one GStreamer microsecond.
*/
enum USECOND = 1000;

/**
    Indicates that the first value provided to a comparison function
    ([gst.global.valueCompare]) is equal to the second one.
*/
enum VALUE_EQUAL = 0;

/**
    Indicates that the first value provided to a comparison function
    ([gst.global.valueCompare]) is greater than the second one.
*/
enum VALUE_GREATER_THAN = 1;

/**
    Indicates that the first value provided to a comparison function
    ([gst.global.valueCompare]) is lesser than the second one.
*/
enum VALUE_LESS_THAN = -1;

/**
    Indicates that the comparison function ([gst.global.valueCompare]) can not
    determine a order for the two provided values.
*/
enum VALUE_UNORDERED = 2;

/**
    The major version of GStreamer at compile time:
*/
enum VERSION_MAJOR = 1;

/**
    The micro version of GStreamer at compile time:
*/
enum VERSION_MICRO = 8;

/**
    The minor version of GStreamer at compile time:
*/
enum VERSION_MINOR = 24;

/**
    The nano version of GStreamer at compile time:
    Actual releases have 0, GIT versions have 1, prerelease versions have 2-...
*/
enum VERSION_NANO = 0;
