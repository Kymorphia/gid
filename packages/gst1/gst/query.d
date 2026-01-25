/// Module for [Query] class
module gst.query;

import gid.gid;
import gobject.boxed;
import gobject.types;
import gst.allocation_params;
import gst.allocator;
import gst.buffer_pool;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.context;
import gst.mini_object;
import gst.structure;
import gst.types;

/**
    Queries can be performed on pads ([gst.pad.Pad.query]) and elements
    ([gst.element.Element.query]). Please note that some queries might need a running
    pipeline to work.
    
    Queries can be created using the gst_query_new_*() functions.
    Query values can be set using gst_query_set_*(), and parsed using
    gst_query_parse_*() helpers.
    
    The following example shows how to query the duration of a pipeline:
    ```c
      GstQuery *query;
      gboolean res;
      query = gst_query_new_duration (GST_FORMAT_TIME);
      res = gst_element_query (pipeline, query);
      if (res) {
        gint64 duration;
        gst_query_parse_duration (query, NULL, &duration);
        g_print ("duration = %"GST_TIME_FORMAT, GST_TIME_ARGS (duration));
      } else {
        g_print ("duration query failed...");
      }
      gst_query_unref (query);
    ```
*/
class Query : gobject.boxed.Boxed
{

  /**
      Create a `query.Query` boxed type.
      Params:
        type = the #GstQueryType
  */
  this(gst.types.QueryType type = gst.types.QueryType.init)
  {
    super(gMalloc(GstQuery.sizeof), Yes.Take);
    this.type = type;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_query_get_type != &gidSymbolNotFound ? gst_query_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Query self()
  {
    return this;
  }

  /**
      Get `miniObject` field.
      Returns: The parent #GstMiniObject type
  */
  @property gst.mini_object.MiniObject miniObject()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)&(cast(GstQuery*)this._cPtr).miniObject);
  }

  /**
      Get `type` field.
      Returns: the #GstQueryType
  */
  @property gst.types.QueryType type()
  {
    return cast(gst.types.QueryType)(cast(GstQuery*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GstQueryType
  */
  @property void type(gst.types.QueryType propval)
  {
    (cast(GstQuery*)this._cPtr).type = cast(GstQueryType)propval;
  }

  /**
      Constructs a new query object for querying if caps are accepted.
      
      Free-function: gst_query_unref()
  
      Params:
        caps = a fixed #GstCaps
      Returns: a new #GstQuery
  */
  static gst.query.Query newAcceptCaps(gst.caps.Caps caps)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_accept_caps(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the allocation properties.
      
      Free-function: gst_query_unref()
  
      Params:
        caps = the negotiated caps
        needPool = return a pool
      Returns: a new #GstQuery
  */
  static gst.query.Query newAllocation(gst.caps.Caps caps, bool needPool)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_allocation(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, needPool);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the bitrate.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newBitrate()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_bitrate();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the buffering status of
      a stream.
      
      Free-function: gst_query_unref()
  
      Params:
        format = the default #GstFormat for the new query
      Returns: a new #GstQuery
  */
  static gst.query.Query newBuffering(gst.types.Format format)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_buffering(format);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the caps.
      
      The CAPS query should return the allowable caps for a pad in the context
      of the element's state, its link to other elements, and the devices or files
      it has opened. These caps must be a subset of the pad template caps. In the
      NULL state with no links, the CAPS query should ideally return the same caps
      as the pad template. In rare circumstances, an object property can affect
      the caps returned by the CAPS query, but this is discouraged.
      
      For most filters, the caps returned by CAPS query is directly affected by the
      allowed caps on other pads. For demuxers and decoders, the caps returned by
      the srcpad's getcaps function is directly related to the stream data. Again,
      the CAPS query should return the most specific caps it reasonably can, since this
      helps with autoplugging.
      
      The filter is used to restrict the result caps, only the caps matching
      filter should be returned from the CAPS query. Specifying a filter might
      greatly reduce the amount of processing an element needs to do.
      
      Free-function: gst_query_unref()
  
      Params:
        filter = a filter
      Returns: a new #GstQuery
  */
  static gst.query.Query newCaps(gst.caps.Caps filter)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_caps(filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the pipeline-local context.
      
      Free-function: gst_query_unref()
  
      Params:
        contextType = Context type to query
      Returns: a new #GstQuery
  */
  static gst.query.Query newContext(string contextType)
  {
    GstQuery* _cretval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _cretval = gst_query_new_context(_contextType);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new convert query object. Use gst_query_unref()
      when done with it. A convert query is used to ask for a conversion between
      one format and another.
      
      Free-function: gst_query_unref()
  
      Params:
        srcFormat = the source #GstFormat for the new query
        value = the value to convert
        destFormat = the target #GstFormat
      Returns: a #GstQuery
  */
  static gst.query.Query newConvert(gst.types.Format srcFormat, long value, gst.types.Format destFormat)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_convert(srcFormat, value, destFormat);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new custom query object. Use gst_query_unref()
      when done with it.
      
      Free-function: gst_query_unref()
  
      Params:
        type = the query type
        structure = a structure for the query
      Returns: a new #GstQuery
  */
  static gst.query.Query newCustom(gst.types.QueryType type, gst.structure.Structure structure = null)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_custom(type, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the drain state.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newDrain()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_drain();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new stream duration query object to query in the given format.
      Use gst_query_unref() when done with it. A duration query will give the
      total length of the stream.
      
      Free-function: gst_query_unref()
  
      Params:
        format = the #GstFormat for this duration query
      Returns: a new #GstQuery
  */
  static gst.query.Query newDuration(gst.types.Format format)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_duration(format);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying formats of
      the stream.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newFormats()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_formats();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new latency query object.
      Use gst_query_unref() when done with it. A latency query is usually performed
      by sinks to compensate for additional latency introduced by elements in the
      pipeline.
      
      Free-function: gst_query_unref()
      Returns: a #GstQuery
  */
  static gst.query.Query newLatency()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_latency();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query stream position query object. Use gst_query_unref()
      when done with it. A position query is used to query the current position
      of playback in the streams, in some format.
      
      Free-function: gst_query_unref()
  
      Params:
        format = the default #GstFormat for the new query
      Returns: a new #GstQuery
  */
  static gst.query.Query newPosition(gst.types.Format format)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_position(format);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the scheduling properties.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newScheduling()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_scheduling();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying seeking properties of
      the stream.
      
      Free-function: gst_query_unref()
  
      Params:
        format = the default #GstFormat for the new query
      Returns: a new #GstQuery
  */
  static gst.query.Query newSeeking(gst.types.Format format)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_seeking(format);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new segment query object. Use gst_query_unref()
      when done with it. A segment query is used to discover information about the
      currently configured segment for playback.
      
      Free-function: gst_query_unref()
  
      Params:
        format = the #GstFormat for the new query
      Returns: a new #GstQuery
  */
  static gst.query.Query newSegment(gst.types.Format format)
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_segment(format);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query object for querying the stream selection capability.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newSelectable()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_selectable();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Constructs a new query URI query object. Use gst_query_unref()
      when done with it. An URI query is used to query the current URI
      that is used by the source or sink.
      
      Free-function: gst_query_unref()
      Returns: a new #GstQuery
  */
  static gst.query.Query newUri()
  {
    GstQuery* _cretval;
    _cretval = gst_query_new_uri();
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add api with params as one of the supported metadata API to query.
  
      Params:
        api = the metadata API
        params = API specific parameters
  */
  void addAllocationMeta(gobject.types.GType api, gst.structure.Structure params = null)
  {
    gst_query_add_allocation_meta(cast(GstQuery*)this._cPtr, api, params ? cast(const(GstStructure)*)params._cPtr(No.Dup) : null);
  }

  /**
      Add allocator and its params as a supported memory allocator.
  
      Params:
        allocator = the memory allocator
        params = a #GstAllocationParams
  */
  void addAllocationParam(gst.allocator.Allocator allocator, gst.allocation_params.AllocationParams params)
  {
    gst_query_add_allocation_param(cast(GstQuery*)this._cPtr, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&params);
  }

  /**
      Set the pool parameters in query.
  
      Params:
        pool = the #GstBufferPool
        size = the buffer size
        minBuffers = the min buffers
        maxBuffers = the max buffers
  */
  void addAllocationPool(gst.buffer_pool.BufferPool pool, uint size, uint minBuffers, uint maxBuffers)
  {
    gst_query_add_allocation_pool(cast(GstQuery*)this._cPtr, pool ? cast(GstBufferPool*)pool._cPtr(No.Dup) : null, size, minBuffers, maxBuffers);
  }

  /**
      Set the buffering-ranges array field in query. The current last
      start position of the array should be inferior to start.
  
      Params:
        start = start position of the range
        stop = stop position of the range
      Returns: a #gboolean indicating if the range was added or not.
  */
  bool addBufferingRange(long start, long stop)
  {
    bool _retval;
    _retval = cast(bool)gst_query_add_buffering_range(cast(GstQuery*)this._cPtr, start, stop);
    return _retval;
  }

  /**
      Add mode as one of the supported scheduling modes to query.
  
      Params:
        mode = a #GstPadMode
  */
  void addSchedulingMode(gst.types.PadMode mode)
  {
    gst_query_add_scheduling_mode(cast(GstQuery*)this._cPtr, mode);
  }

  /**
      Check if query has metadata api set. When this function returns true,
      index will contain the index where the requested API and the parameters
      can be found.
  
      Params:
        api = the metadata API
        index = the index
      Returns: true when api is in the list of metadata.
  */
  bool findAllocationMeta(gobject.types.GType api, out uint index)
  {
    bool _retval;
    _retval = cast(bool)gst_query_find_allocation_meta(cast(GstQuery*)this._cPtr, api, cast(uint*)&index);
    return _retval;
  }

  /**
      Retrieve the number of values currently stored in the
      meta API array of the query's structure.
      Returns: the metadata API array size as a #guint.
  */
  uint getNAllocationMetas()
  {
    uint _retval;
    _retval = gst_query_get_n_allocation_metas(cast(GstQuery*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the number of values currently stored in the
      allocator params array of the query's structure.
      
      If no memory allocator is specified, the downstream element can handle
      the default memory allocator. The first memory allocator in the query
      should be generic and allow mapping to system memory, all following
      allocators should be ordered by preference with the preferred one first.
      Returns: the allocator array size as a #guint.
  */
  uint getNAllocationParams()
  {
    uint _retval;
    _retval = gst_query_get_n_allocation_params(cast(GstQuery*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the number of values currently stored in the
      pool array of the query's structure.
      Returns: the pool array size as a #guint.
  */
  uint getNAllocationPools()
  {
    uint _retval;
    _retval = gst_query_get_n_allocation_pools(cast(GstQuery*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the number of values currently stored in the
      buffered-ranges array of the query's structure.
      Returns: the range array size as a #guint.
  */
  uint getNBufferingRanges()
  {
    uint _retval;
    _retval = gst_query_get_n_buffering_ranges(cast(GstQuery*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the number of values currently stored in the
      scheduling mode array of the query's structure.
      Returns: the scheduling mode array size as a #guint.
  */
  uint getNSchedulingModes()
  {
    uint _retval;
    _retval = gst_query_get_n_scheduling_modes(cast(GstQuery*)this._cPtr);
    return _retval;
  }

  /**
      Get the structure of a query.
      Returns: the #GstStructure of the query. The
            structure is still owned by the query and will therefore be freed when the
            query is unreffed.
  */
  gst.structure.Structure getStructure()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_query_get_structure(cast(GstQuery*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Check if query has scheduling mode set.
      
      > When checking if upstream supports pull mode, it is usually not
      > enough to just check for GST_PAD_MODE_PULL with this function, you
      > also want to check whether the scheduling flags returned by
      > [gst.query.Query.parseScheduling] have the seeking flag set (meaning
      > random access is supported, not only sequential pulls).
  
      Params:
        mode = the scheduling mode
      Returns: true when mode is in the list of scheduling modes.
  */
  bool hasSchedulingMode(gst.types.PadMode mode)
  {
    bool _retval;
    _retval = cast(bool)gst_query_has_scheduling_mode(cast(GstQuery*)this._cPtr, mode);
    return _retval;
  }

  /**
      Check if query has scheduling mode set and flags is set in
      query scheduling flags.
  
      Params:
        mode = the scheduling mode
        flags = #GstSchedulingFlags
      Returns: true when mode is in the list of scheduling modes
           and flags are compatible with query flags.
  */
  bool hasSchedulingModeWithFlags(gst.types.PadMode mode, gst.types.SchedulingFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_query_has_scheduling_mode_with_flags(cast(GstQuery*)this._cPtr, mode, flags);
    return _retval;
  }

  /**
      Get the caps from query. The caps remains valid as long as query remains
      valid.
  
      Params:
        caps = A pointer to the caps
  */
  void parseAcceptCaps(out gst.caps.Caps caps)
  {
    GstCaps* _caps;
    gst_query_parse_accept_caps(cast(GstQuery*)this._cPtr, &_caps);
    caps = new gst.caps.Caps(cast(void*)_caps, No.Take);
  }

  /**
      Parse the result from query and store in result.
  
      Params:
        result = location for the result
  */
  void parseAcceptCapsResult(out bool result)
  {
    gboolean _result;
    gst_query_parse_accept_caps_result(cast(GstQuery*)this._cPtr, &_result);
    result = cast(bool)_result;
  }

  /**
      Parse an allocation query, writing the requested caps in caps and
      whether a pool is needed in need_pool, if the respective parameters
      are non-null.
      
      Pool details can be retrieved using [gst.query.Query.getNAllocationPools] and
      [gst.query.Query.parseNthAllocationPool].
  
      Params:
        caps = The #GstCaps
        needPool = Whether a #GstBufferPool is needed
  */
  void parseAllocation(out gst.caps.Caps caps, out bool needPool)
  {
    GstCaps* _caps;
    gboolean _needPool;
    gst_query_parse_allocation(cast(GstQuery*)this._cPtr, &_caps, &_needPool);
    caps = new gst.caps.Caps(cast(void*)_caps, No.Take);
    needPool = cast(bool)_needPool;
  }

  /**
      Get the results of a bitrate query. See also [gst.query.Query.setBitrate].
  
      Params:
        nominalBitrate = The resulting bitrate in bits per second
  */
  void parseBitrate(out uint nominalBitrate)
  {
    gst_query_parse_bitrate(cast(GstQuery*)this._cPtr, cast(uint*)&nominalBitrate);
  }

  /**
      Get the percentage of buffered data. This is a value between 0 and 100.
      The busy indicator is true when the buffering is in progress.
  
      Params:
        busy = if buffering is busy, or null
        percent = a buffering percent, or null
  */
  void parseBufferingPercent(out bool busy, out int percent)
  {
    gboolean _busy;
    gst_query_parse_buffering_percent(cast(GstQuery*)this._cPtr, &_busy, cast(int*)&percent);
    busy = cast(bool)_busy;
  }

  /**
      Parse an available query, writing the format into format, and
      other results into the passed parameters, if the respective parameters
      are non-null
  
      Params:
        format = the format to set for the segment_start
              and segment_end values, or null
        start = the start to set, or null
        stop = the stop to set, or null
        estimatedTotal = estimated total amount of download
              time remaining in milliseconds, or null
  */
  void parseBufferingRange(out gst.types.Format format, out long start, out long stop, out long estimatedTotal)
  {
    gst_query_parse_buffering_range(cast(GstQuery*)this._cPtr, &format, cast(long*)&start, cast(long*)&stop, cast(long*)&estimatedTotal);
  }

  /**
      Extracts the buffering stats values from query.
  
      Params:
        mode = a buffering mode, or null
        avgIn = the average input rate, or null
        avgOut = the average output rat, or null
        bufferingLeft = amount of buffering time left in
              milliseconds, or null
  */
  void parseBufferingStats(out gst.types.BufferingMode mode, out int avgIn, out int avgOut, out long bufferingLeft)
  {
    gst_query_parse_buffering_stats(cast(GstQuery*)this._cPtr, &mode, cast(int*)&avgIn, cast(int*)&avgOut, cast(long*)&bufferingLeft);
  }

  /**
      Get the filter from the caps query. The caps remains valid as long as
      query remains valid.
  
      Params:
        filter = A pointer to the caps filter
  */
  void parseCaps(out gst.caps.Caps filter)
  {
    GstCaps* _filter;
    gst_query_parse_caps(cast(GstQuery*)this._cPtr, &_filter);
    filter = new gst.caps.Caps(cast(void*)_filter, No.Take);
  }

  /**
      Get the caps result from query. The caps remains valid as long as
      query remains valid.
  
      Params:
        caps = A pointer to the caps
  */
  void parseCapsResult(out gst.caps.Caps caps)
  {
    GstCaps* _caps;
    gst_query_parse_caps_result(cast(GstQuery*)this._cPtr, &_caps);
    caps = new gst.caps.Caps(cast(void*)_caps, No.Take);
  }

  /**
      Get the context from the context query. The context remains valid as long as
      query remains valid.
  
      Params:
        context = A pointer to store the #GstContext
  */
  void parseContext(out gst.context.Context context)
  {
    GstContext* _context;
    gst_query_parse_context(cast(GstQuery*)this._cPtr, &_context);
    context = new gst.context.Context(cast(void*)_context, No.Take);
  }

  /**
      Parse a context type from an existing GST_QUERY_CONTEXT query.
  
      Params:
        contextType = the context type, or null
      Returns: a #gboolean indicating if the parsing succeeded.
  */
  bool parseContextType(out string contextType)
  {
    bool _retval;
    char* _contextType;
    _retval = cast(bool)gst_query_parse_context_type(cast(GstQuery*)this._cPtr, &_contextType);
    contextType = _contextType.fromCString(No.Free);
    return _retval;
  }

  /**
      Parse a convert query answer. Any of src_format, src_value, dest_format,
      and dest_value may be null, in which case that value is omitted.
  
      Params:
        srcFormat = the storage for the #GstFormat of the
              source value, or null
        srcValue = the storage for the source value, or null
        destFormat = the storage for the #GstFormat of the
              destination value, or null
        destValue = the storage for the destination value,
              or null
  */
  void parseConvert(out gst.types.Format srcFormat, out long srcValue, out gst.types.Format destFormat, out long destValue)
  {
    gst_query_parse_convert(cast(GstQuery*)this._cPtr, &srcFormat, cast(long*)&srcValue, &destFormat, cast(long*)&destValue);
  }

  /**
      Parse a duration query answer. Write the format of the duration into format,
      and the value into duration, if the respective variables are non-null.
  
      Params:
        format = the storage for the #GstFormat of the duration
              value, or null.
        duration = the storage for the total duration, or null.
  */
  void parseDuration(out gst.types.Format format, out long duration)
  {
    gst_query_parse_duration(cast(GstQuery*)this._cPtr, &format, cast(long*)&duration);
  }

  /**
      Parse a latency query answer.
  
      Params:
        live = storage for live or null
        minLatency = the storage for the min latency or null
        maxLatency = the storage for the max latency or null
  */
  void parseLatency(out bool live, out gst.types.ClockTime minLatency, out gst.types.ClockTime maxLatency)
  {
    gboolean _live;
    gst_query_parse_latency(cast(GstQuery*)this._cPtr, &_live, cast(GstClockTime*)&minLatency, cast(GstClockTime*)&maxLatency);
    live = cast(bool)_live;
  }

  /**
      Parse the number of formats in the formats query.
  
      Params:
        nFormats = the number of formats in this query.
  */
  void parseNFormats(out uint nFormats)
  {
    gst_query_parse_n_formats(cast(GstQuery*)this._cPtr, cast(uint*)&nFormats);
  }

  /**
      Parse an available query and get the metadata API
      at index of the metadata API array.
  
      Params:
        index = position in the metadata API array to read
        params = API specific parameters
      Returns: a #GType of the metadata API at index.
  */
  gobject.types.GType parseNthAllocationMeta(uint index, out gst.structure.Structure params)
  {
    gobject.types.GType _retval;
    const(GstStructure)* _params;
    _retval = gst_query_parse_nth_allocation_meta(cast(GstQuery*)this._cPtr, index, &_params);
    params = new gst.structure.Structure(cast(void*)_params, No.Take);
    return _retval;
  }

  /**
      Parse an available query and get the allocator and its params
      at index of the allocator array.
  
      Params:
        index = position in the allocator array to read
        allocator = variable to hold the result
        params = parameters for the allocator
  */
  void parseNthAllocationParam(uint index, out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    GstAllocator* _allocator;
    gst_query_parse_nth_allocation_param(cast(GstQuery*)this._cPtr, index, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, Yes.Take);
  }

  /**
      Get the pool parameters in query.
      
      Unref pool with [gst.object.ObjectWrap.unref] when it's not needed any more.
  
      Params:
        index = index to parse
        pool = the #GstBufferPool
        size = the buffer size
        minBuffers = the min buffers
        maxBuffers = the max buffers
  */
  void parseNthAllocationPool(uint index, out gst.buffer_pool.BufferPool pool, out uint size, out uint minBuffers, out uint maxBuffers)
  {
    GstBufferPool* _pool;
    gst_query_parse_nth_allocation_pool(cast(GstQuery*)this._cPtr, index, &_pool, cast(uint*)&size, cast(uint*)&minBuffers, cast(uint*)&maxBuffers);
    pool = new gst.buffer_pool.BufferPool(cast(void*)_pool, Yes.Take);
  }

  /**
      Parse an available query and get the start and stop values stored
      at the index of the buffered ranges array.
  
      Params:
        index = position in the buffered-ranges array to read
        start = the start position to set, or null
        stop = the stop position to set, or null
      Returns: a #gboolean indicating if the parsing succeeded.
  */
  bool parseNthBufferingRange(uint index, out long start, out long stop)
  {
    bool _retval;
    _retval = cast(bool)gst_query_parse_nth_buffering_range(cast(GstQuery*)this._cPtr, index, cast(long*)&start, cast(long*)&stop);
    return _retval;
  }

  /**
      Parse the format query and retrieve the nth format from it into
      format. If the list contains less elements than nth, format will be
      set to GST_FORMAT_UNDEFINED.
  
      Params:
        nth = the nth format to retrieve.
        format = a pointer to store the nth format
  */
  void parseNthFormat(uint nth, out gst.types.Format format)
  {
    gst_query_parse_nth_format(cast(GstQuery*)this._cPtr, nth, &format);
  }

  /**
      Parse an available query and get the scheduling mode
      at index of the scheduling modes array.
  
      Params:
        index = position in the scheduling modes array to read
      Returns: a #GstPadMode of the scheduling mode at index.
  */
  gst.types.PadMode parseNthSchedulingMode(uint index)
  {
    GstPadMode _cretval;
    _cretval = gst_query_parse_nth_scheduling_mode(cast(GstQuery*)this._cPtr, index);
    gst.types.PadMode _retval = cast(gst.types.PadMode)_cretval;
    return _retval;
  }

  /**
      Parse a position query, writing the format into format, and the position
      into cur, if the respective parameters are non-null.
  
      Params:
        format = the storage for the #GstFormat of the
              position values (may be null)
        cur = the storage for the current position (may be null)
  */
  void parsePosition(out gst.types.Format format, out long cur)
  {
    gst_query_parse_position(cast(GstQuery*)this._cPtr, &format, cast(long*)&cur);
  }

  /**
      Set the scheduling properties.
  
      Params:
        flags = #GstSchedulingFlags
        minsize = the suggested minimum size of pull requests
        maxsize = the suggested maximum size of pull requests:
        align_ = the suggested alignment of pull requests
  */
  void parseScheduling(out gst.types.SchedulingFlags flags, out int minsize, out int maxsize, out int align_)
  {
    gst_query_parse_scheduling(cast(GstQuery*)this._cPtr, &flags, cast(int*)&minsize, cast(int*)&maxsize, cast(int*)&align_);
  }

  /**
      Parse a seeking query, writing the format into format, and
      other results into the passed parameters, if the respective parameters
      are non-null
  
      Params:
        format = the format to set for the segment_start
              and segment_end values, or null
        seekable = the seekable flag to set, or null
        segmentStart = the segment_start to set, or null
        segmentEnd = the segment_end to set, or null
  */
  void parseSeeking(out gst.types.Format format, out bool seekable, out long segmentStart, out long segmentEnd)
  {
    gboolean _seekable;
    gst_query_parse_seeking(cast(GstQuery*)this._cPtr, &format, &_seekable, cast(long*)&segmentStart, cast(long*)&segmentEnd);
    seekable = cast(bool)_seekable;
  }

  /**
      Parse a segment query answer. Any of rate, format, start_value, and
      stop_value may be null, which will cause this value to be omitted.
      
      See [gst.query.Query.setSegment] for an explanation of the function arguments.
  
      Params:
        rate = the storage for the rate of the segment, or null
        format = the storage for the #GstFormat of the values,
              or null
        startValue = the storage for the start value, or null
        stopValue = the storage for the stop value, or null
  */
  void parseSegment(out double rate, out gst.types.Format format, out long startValue, out long stopValue)
  {
    gst_query_parse_segment(cast(GstQuery*)this._cPtr, cast(double*)&rate, &format, cast(long*)&startValue, cast(long*)&stopValue);
  }

  /**
      Get the results of a selectable query. See also [gst.query.Query.setSelectable].
  
      Params:
        selectable = The resulting stream selection capability
  */
  void parseSelectable(out bool selectable)
  {
    gboolean _selectable;
    gst_query_parse_selectable(cast(GstQuery*)this._cPtr, &_selectable);
    selectable = cast(bool)_selectable;
  }

  /**
      Parse an URI query, writing the URI into uri as a newly
      allocated string, if the respective parameters are non-null.
      Free the string with [glib.global.gfree] after usage.
  
      Params:
        uri = the storage for the current URI
              (may be null)
  */
  void parseUri(out string uri)
  {
    char* _uri;
    gst_query_parse_uri(cast(GstQuery*)this._cPtr, &_uri);
    uri = _uri.fromCString(Yes.Free);
  }

  /**
      Parse an URI query, writing the URI into uri as a newly
      allocated string, if the respective parameters are non-null.
      Free the string with [glib.global.gfree] after usage.
  
      Params:
        uri = the storage for the redirect URI
              (may be null)
  */
  void parseUriRedirection(out string uri)
  {
    char* _uri;
    gst_query_parse_uri_redirection(cast(GstQuery*)this._cPtr, &_uri);
    uri = _uri.fromCString(Yes.Free);
  }

  /**
      Parse an URI query, and set permanent to true if there is a redirection
      and it should be considered permanent. If a redirection is permanent,
      applications should update their internal storage of the URI, otherwise
      they should make all future requests to the original URI.
  
      Params:
        permanent = if the URI redirection is permanent
              (may be null)
  */
  void parseUriRedirectionPermanent(out bool permanent)
  {
    gboolean _permanent;
    gst_query_parse_uri_redirection_permanent(cast(GstQuery*)this._cPtr, &_permanent);
    permanent = cast(bool)_permanent;
  }

  /**
      Remove the metadata API at index of the metadata API array.
  
      Params:
        index = position in the metadata API array to remove
  */
  void removeNthAllocationMeta(uint index)
  {
    gst_query_remove_nth_allocation_meta(cast(GstQuery*)this._cPtr, index);
  }

  /**
      Remove the allocation param at index of the allocation param array.
  
      Params:
        index = position in the allocation param array to remove
  */
  void removeNthAllocationParam(uint index)
  {
    gst_query_remove_nth_allocation_param(cast(GstQuery*)this._cPtr, index);
  }

  /**
      Remove the allocation pool at index of the allocation pool array.
  
      Params:
        index = position in the allocation pool array to remove
  */
  void removeNthAllocationPool(uint index)
  {
    gst_query_remove_nth_allocation_pool(cast(GstQuery*)this._cPtr, index);
  }

  /**
      Set result as the result for the query.
  
      Params:
        result = the result to set
  */
  void setAcceptCapsResult(bool result)
  {
    gst_query_set_accept_caps_result(cast(GstQuery*)this._cPtr, result);
  }

  /**
      Set the results of a bitrate query.  The nominal bitrate is the average
      bitrate expected over the length of the stream as advertised in file
      headers (or similar).
  
      Params:
        nominalBitrate = the nominal bitrate in bits per second
  */
  void setBitrate(uint nominalBitrate)
  {
    gst_query_set_bitrate(cast(GstQuery*)this._cPtr, nominalBitrate);
  }

  /**
      Set the percentage of buffered data. This is a value between 0 and 100.
      The busy indicator is true when the buffering is in progress.
  
      Params:
        busy = if buffering is busy
        percent = a buffering percent
  */
  void setBufferingPercent(bool busy, int percent)
  {
    gst_query_set_buffering_percent(cast(GstQuery*)this._cPtr, busy, percent);
  }

  /**
      Set the available query result fields in query.
  
      Params:
        format = the format to set for the start and stop values
        start = the start to set
        stop = the stop to set
        estimatedTotal = estimated total amount of download time remaining in
              milliseconds
  */
  void setBufferingRange(gst.types.Format format, long start, long stop, long estimatedTotal)
  {
    gst_query_set_buffering_range(cast(GstQuery*)this._cPtr, format, start, stop, estimatedTotal);
  }

  /**
      Configures the buffering stats values in query.
  
      Params:
        mode = a buffering mode
        avgIn = the average input rate
        avgOut = the average output rate
        bufferingLeft = amount of buffering time left in milliseconds
  */
  void setBufferingStats(gst.types.BufferingMode mode, int avgIn, int avgOut, long bufferingLeft)
  {
    gst_query_set_buffering_stats(cast(GstQuery*)this._cPtr, mode, avgIn, avgOut, bufferingLeft);
  }

  /**
      Set the caps result in query.
  
      Params:
        caps = A pointer to the caps
  */
  void setCapsResult(gst.caps.Caps caps = null)
  {
    gst_query_set_caps_result(cast(GstQuery*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  }

  /**
      Answer a context query by setting the requested context.
  
      Params:
        context = the requested #GstContext
  */
  void setContext(gst.context.Context context = null)
  {
    gst_query_set_context(cast(GstQuery*)this._cPtr, context ? cast(GstContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Answer a convert query by setting the requested values.
  
      Params:
        srcFormat = the source #GstFormat
        srcValue = the source value
        destFormat = the destination #GstFormat
        destValue = the destination value
  */
  void setConvert(gst.types.Format srcFormat, long srcValue, gst.types.Format destFormat, long destValue)
  {
    gst_query_set_convert(cast(GstQuery*)this._cPtr, srcFormat, srcValue, destFormat, destValue);
  }

  /**
      Answer a duration query by setting the requested value in the given format.
  
      Params:
        format = the #GstFormat for the duration
        duration = the duration of the stream
  */
  void setDuration(gst.types.Format format, long duration)
  {
    gst_query_set_duration(cast(GstQuery*)this._cPtr, format, duration);
  }

  /**
      Set the formats query result fields in query. The number of formats passed
      in the formats array must be equal to n_formats.
  
      Params:
        formats = an array containing n_formats
              GstFormat values.
  */
  void setFormatsv(gst.types.Format[] formats)
  {
    int _nFormats;
    if (formats)
      _nFormats = cast(int)formats.length;

    auto _formats = cast(const(GstFormat)*)formats.ptr;
    gst_query_set_formatsv(cast(GstQuery*)this._cPtr, _nFormats, _formats);
  }

  /**
      Answer a latency query by setting the requested values in the given format.
  
      Params:
        live = if there is a live element upstream
        minLatency = the minimal latency of the upstream elements
        maxLatency = the maximal latency of the upstream elements
  */
  void setLatency(bool live, gst.types.ClockTime minLatency, gst.types.ClockTime maxLatency)
  {
    gst_query_set_latency(cast(GstQuery*)this._cPtr, live, minLatency, maxLatency);
  }

  /**
      Parse an available query and get the allocator and its params
      at index of the allocator array.
  
      Params:
        index = position in the allocator array to set
        allocator = new allocator to set
        params = parameters for the allocator
  */
  void setNthAllocationParam(uint index, gst.allocator.Allocator allocator, gst.allocation_params.AllocationParams params)
  {
    gst_query_set_nth_allocation_param(cast(GstQuery*)this._cPtr, index, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&params);
  }

  /**
      Set the pool parameters in query.
  
      Params:
        index = index to modify
        pool = the #GstBufferPool
        size = the buffer size
        minBuffers = the min buffers
        maxBuffers = the max buffers
  */
  void setNthAllocationPool(uint index, gst.buffer_pool.BufferPool pool, uint size, uint minBuffers, uint maxBuffers)
  {
    gst_query_set_nth_allocation_pool(cast(GstQuery*)this._cPtr, index, pool ? cast(GstBufferPool*)pool._cPtr(No.Dup) : null, size, minBuffers, maxBuffers);
  }

  /**
      Answer a position query by setting the requested value in the given format.
  
      Params:
        format = the requested #GstFormat
        cur = the position to set
  */
  void setPosition(gst.types.Format format, long cur)
  {
    gst_query_set_position(cast(GstQuery*)this._cPtr, format, cur);
  }

  /**
      Set the scheduling properties.
  
      Params:
        flags = #GstSchedulingFlags
        minsize = the suggested minimum size of pull requests
        maxsize = the suggested maximum size of pull requests
        align_ = the suggested alignment of pull requests
  */
  void setScheduling(gst.types.SchedulingFlags flags, int minsize, int maxsize, int align_)
  {
    gst_query_set_scheduling(cast(GstQuery*)this._cPtr, flags, minsize, maxsize, align_);
  }

  /**
      Set the seeking query result fields in query.
  
      Params:
        format = the format to set for the segment_start and segment_end values
        seekable = the seekable flag to set
        segmentStart = the segment_start to set
        segmentEnd = the segment_end to set
  */
  void setSeeking(gst.types.Format format, bool seekable, long segmentStart, long segmentEnd)
  {
    gst_query_set_seeking(cast(GstQuery*)this._cPtr, format, seekable, segmentStart, segmentEnd);
  }

  /**
      Answer a segment query by setting the requested values. The normal
      playback segment of a pipeline is 0 to duration at the default rate of
      1.0. If a seek was performed on the pipeline to play a different
      segment, this query will return the range specified in the last seek.
      
      start_value and stop_value will respectively contain the configured
      playback range start and stop values expressed in format.
      The values are always between 0 and the duration of the media and
      start_value <= stop_value. rate will contain the playback rate. For
      negative rates, playback will actually happen from stop_value to
      start_value.
  
      Params:
        rate = the rate of the segment
        format = the #GstFormat of the segment values (start_value and stop_value)
        startValue = the start value
        stopValue = the stop value
  */
  void setSegment(double rate, gst.types.Format format, long startValue, long stopValue)
  {
    gst_query_set_segment(cast(GstQuery*)this._cPtr, rate, format, startValue, stopValue);
  }

  /**
      Set the results of a selectable query. If the element answering the query can
      handle stream selection, selectable should be set to true.
  
      Params:
        selectable = Whether the element can handle stream selection.
  */
  void setSelectable(bool selectable)
  {
    gst_query_set_selectable(cast(GstQuery*)this._cPtr, selectable);
  }

  /**
      Answer a URI query by setting the requested URI.
  
      Params:
        uri = the URI to set
  */
  void setUri(string uri = null)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gst_query_set_uri(cast(GstQuery*)this._cPtr, _uri);
  }

  /**
      Answer a URI query by setting the requested URI redirection.
  
      Params:
        uri = the URI to set
  */
  void setUriRedirection(string uri = null)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gst_query_set_uri_redirection(cast(GstQuery*)this._cPtr, _uri);
  }

  /**
      Answer a URI query by setting the requested URI redirection
      to permanent or not.
  
      Params:
        permanent = whether the redirect is permanent or not
  */
  void setUriRedirectionPermanent(bool permanent)
  {
    gst_query_set_uri_redirection_permanent(cast(GstQuery*)this._cPtr, permanent);
  }

  /**
      Get the structure of a query. This method should be called with a writable
      query so that the returned structure is guaranteed to be writable.
      Returns: the #GstStructure of the query. The structure is
            still owned by the query and will therefore be freed when the query
            is unreffed.
  */
  gst.structure.Structure writableStructure()
  {
    GstStructure* _cretval;
    _cretval = gst_query_writable_structure(cast(GstQuery*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
