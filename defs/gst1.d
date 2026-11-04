//!gir Gst-1.0
//!info description "D binding for the Gst library - Core library for the GStreamer multimedia framework"
//!info homepage https://gstreamer.freedesktop.org
//!info docs https://www.kymorphia.com/gid/gid~gst1/
//!info capi https://gstreamer.freedesktop.org/documentation/gstreamer/gi-index.html

// Disabled: maps memory without a way to unmap it (use Memory.map, which returns a MapScope)
//!set record[Memory].method[make_mapped][disable] 1

// Map functions return a MapScope which unmaps the structure (explicit unmap or scope exit), the unmap function is
// only used by the MapScope (unmapping a MapScope structure directly would unmap it twice)
//!set record[Buffer].method[map][gid-unmap] gst_buffer_unmap
//!set record[Buffer].method[map_range][gid-unmap] gst_buffer_unmap
//!set record[Buffer].method[unmap][disable] 1
//!set record[Memory].method[map][gid-unmap] gst_memory_unmap
//!set record[Memory].method[unmap][disable] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set record[Meta].function[deserialize].return-value[][gid-borrow] buffer
//!set enumeration[Format].function[get_details].return-value[][gid-borrow] static

//!subdtype Object ObjectWrap

//!kind Structure Boxed

//# Disable fundamental GValue types which are not currently supported (FIXME)
//!set class[Bitmask][disable] 1
//!set class[DoubleRange][disable] 1
//!set class[FlagSet][disable] 1
//!set class[Fraction][disable] 1
//!set class[FractionRange][disable] 1
//!set class[Int64Range][disable] 1
//!set class[IntRange][disable] 1
//!set class[ValueArray][disable] 1
//!set class[ValueList][disable] 1

//# Ignore "protected/private" structure fields
//!set record[Iterator].*field[][ignore] 1

//# Rename callback fields in TypeFind which conflict with method names
//!set record[TypeFind].field[get_length].callback[get_length][name] get_length_func
//!set record[TypeFind].field[get_length][name] get_length_func
//!set record[TypeFind].field[peek].callback[peek][name] peek_func
//!set record[TypeFind].field[peek][name] peek_func
//!set record[TypeFind].field[suggest].callback[suggest][name] suggest_func
//!set record[TypeFind].field[suggest][name] suggest_func

//# Change ChildProxy.getProperty to getChildProxyProperty, conflicts with ObjectWrap.getProperty and could not get it to work with an alias
//!set interface[ChildProxy].method[get_property][name] getChildProxyProperty

//# Ignore list free functions which take ownership of a D array, pointless since D would copy the list just to free it
//!set class[Plugin].function[list_free][ignore] 1
//!set class[PluginFeature].function[list_free][ignore] 1

//# Ignore methods which take a parent refcount, used for code implementing parent objects
//!set record[CapsFeatures].method[set_parent_refcount][ignore] 0
//!set record[Structure].method[set_parent_refcount][ignore] 0

//# Set arrays to be zero-terminated=1
//!set function[formats_contains].parameters.parameter[formats].array[][zero-terminated] 1

//# Set basic parameters to out
//!set callback[ControlSourceGetValue].parameters.parameter[value][direction] out
//!set callback[MemoryIsSpanFunction].parameters.parameter[offset][direction] out

//# Fix arg direction and ownership for some callbacks
//!set callback[BufferForeachMetaFunc].parameters.parameter[meta][transfer-ownership] none

//# Meta params aggregation returns a newly allocated structure in aggregated_params (callers pass a NULL-initialized pointer)
//!set record[Meta].function[api_type_aggregate_params].parameters.parameter[aggregated_params][direction] out
//!set record[Meta].function[api_type_aggregate_params].parameters.parameter[aggregated_params][caller-allocates] 0
//!set record[Meta].function[api_type_aggregate_params].parameters.parameter[aggregated_params][transfer-ownership] full
//!set callback[AllocationMetaParamsAggregator].parameters.parameter[aggregated_params][direction] out
//!set callback[AllocationMetaParamsAggregator].parameters.parameter[aggregated_params][caller-allocates] 0
//!set callback[AllocationMetaParamsAggregator].parameters.parameter[aggregated_params][transfer-ownership] full

//# Pad callbacks have no user_data parameter, the closure data is stored in a GstPad structure field (see GST_PAD_*FUNC_DATA in gstpad.h)
//!set callback[PadActivateFunction][gid-closure-field] 'pad.activatedata'
//!set callback[PadActivateModeFunction][gid-closure-field] 'pad.activatemodedata'
//!set callback[PadChainFunction][gid-closure-field] 'pad.chaindata'
//!set callback[PadChainListFunction][gid-closure-field] 'pad.chainlistdata'
//!set callback[PadEventFunction][gid-closure-field] 'pad.eventdata'
//!set callback[PadEventFullFunction][gid-closure-field] 'pad.eventdata'
//!set callback[PadIterIntLinkFunction][gid-closure-field] 'pad.iterintlinkdata'
//!set callback[PadLinkFunction][gid-closure-field] 'pad.linkdata'
//!set callback[PadUnlinkFunction][gid-closure-field] 'pad.unlinkdata'
//!set callback[PadQueryFunction][gid-closure-field] 'pad.querydata'

//# Set values parameter to be a caller-allocates output array
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][direction] out
//!set callback[ControlSourceGetValueArray].parameters.parameter[values][caller-allocates] 1
//!set callback[ControlSourceGetValueArray].parameters.parameter[values].type '<array length="3" c:type="gdouble *"><type name="double" c:type="gdouble"/></array>'

//# Set MetaDeserializeFunction.data parameter to array with length
//!set callback[MetaDeserializeFunction].parameters.parameter[data].type '<array length="3" c:type="const guint8*"><type name="guint8" c:type="guint8"/></array>'

//# Disable unnecessary ByteArrayInterface functions (can use GArray versions instead)
//!set record[Meta].method[serialize][ignore] 1
//!set callback[MetaSerializeFunction][ignore] 1

//# Disable CustomMeta.structure field writing (struct pointer)
//!set record[CustomMeta].field[structure][writable] 0

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[Message].field[src][owned] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[Buffer].field[mini_object][writable] 0
//!set record[Caps].field[mini_object][writable] 0
//!set record[CustomMeta].field[meta][writable] 0
//!set record[Event].field[mini_object][writable] 0
//!set record[MapInfo].field[data][writable] 0
//!set record[Memory].field[mini_object][writable] 0
//!set record[Message].field[mini_object][writable] 0
//!set record[Meta].field[info][writable] 0
//!set record[ParamSpecArray].field[parent_instance][writable] 0
//!set record[ParamSpecFraction].field[parent_instance][writable] 0
//!set record[ParentBufferMeta].field[parent][writable] 0
//!set record[Promise].field[parent][writable] 0
//!set record[ProtectionMeta].field[meta][writable] 0
//!set record[Query].field[mini_object][writable] 0
//!set record[ReferenceTimestampMeta].field[parent][writable] 0
//!set record[StaticPadTemplate].field[static_caps][writable] 0
//!set record[TagList].field[mini_object][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[Buffer].field[pool][writable] 0
//!set record[Memory].field[allocator][writable] 0
//!set record[Memory].field[parent][writable] 0
//!set record[StaticCaps].field[caps][writable] 0
//!set record[StaticCaps].field[string][writable] 0
//!set record[StaticPadTemplate].field[name_template][writable] 0

//# Disable: Generic GCallback/C function symbol APIs, not usable from D
//!set function[tracing_register_hook][ignore] 1

//# Disable: Internal/implementation-only API, not useful from D
//!set record[Meta].function[api_type_set_params_aggregator][ignore] 1
//!set record[MetaInfo].field[serialize_func][ignore] 1
//!set record[MiniObject].method[set_qdata][ignore] 1

//# Disable: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[MapInfo].field[user_data][ignore] 1
//!set record[PadProbeInfo].field[data][ignore] 1
//!set record[TypeFind].field[data][ignore] 1

//# Disable: Use D native synchronization primitives instead (GLib Mutex/RecMutex/Cond/Private are disabled)
//!set class[Task].method[set_lock][ignore] 1

//# Disable: Uses unsupported GValue fundamental types (Fraction, ValueArray, ValueList) (FIXME)
//!set class[ValueUniqueList][disable] 1

//# Ignore: Iterator.find_custom uses a GCompareFunc with positional data, use Iterator.foreach or D iteration instead
//!set record[Iterator].method[find_custom][ignore] 1

//# Disable: Callback returns structure pointer with transfer none (no D owner to keep it alive for C)
//!set callback[MetaDeserializeFunction][disable] 1
//!set record[MetaInfo].field[deserialize_func][disable] 1

//# PadGetRangeFunction and Pad.setGetrangeFunctionFull are hand written below: the buffer is either provided by the
//# caller (filled in place, the caller keeps its reference) or NULL (a new buffer is returned with full transfer),
//# which can't be expressed with GIR annotations
//!set callback[PadGetRangeFunction][ignore] 1
//!set class[Pad].method[set_getrange_function_full][ignore] 1

//!class types

/**
    This function will be called on source pads when a peer element
    request a buffer at the specified offset and length. If this function
    returns #GST_FLOW_OK, the result buffer will be stored in buffer. The
    contents of buffer is invalid for any other return value.

    This function is installed on a source pad with
    [gst.pad.Pad.setGetrangeFunctionFull] and can only be called on source pads after
    they are successfully activated with [gst.pad.Pad.activateMode] with the
    #GST_PAD_MODE_PULL.

    offset and length are always given in byte units. offset must normally be a value
    between 0 and the length in bytes of the data available on pad. The
    length (duration in bytes) can be retrieved with a #GST_QUERY_DURATION or with a
    #GST_QUERY_SEEKING.

    Any offset larger or equal than the length will make the function return
    #GST_FLOW_EOS, which corresponds to EOS. In this case buffer does not
    contain a valid buffer.

    The buffer size of buffer will only be smaller than length when offset is
    near the end of the stream. In all other cases, the size of buffer must be
    exactly the requested size.

    It is allowed to call this function with a 0 length and valid offset, in
    which case buffer will contain a 0-sized buffer and the function returns
    #GST_FLOW_OK.

    When this function is called with a -1 offset, the sequentially next buffer
    of length length in the stream is returned.

    When this function is called with a -1 length, a buffer with a default
    optimal length is returned in buffer. The length might depend on the value
    of offset.

    If buffer is null, the function should set it to a new buffer. Otherwise buffer is
    provided by the caller and should be filled in place: it must not be replaced or set to null
    (the call then fails with #GST_FLOW_ERROR), and it is only valid during the call (the
    caller keeps its reference, the D object is left empty afterwards).

    Params:
      pad = the src #GstPad to perform the getrange on.
      parent = the parent of pad. If the #GST_PAD_FLAG_NEED_PARENT
                 flag is set, parent is guaranteed to be not-null and remain valid
                 during the execution of this function.
      offset = the offset of the range
      length = the length of the range
      buffer = null to return a new buffer, or a caller provided buffer to fill
    Returns: #GST_FLOW_OK for success and a valid buffer in buffer. Any other
      return value leaves buffer undefined.
*/
alias PadGetRangeFunction = gst.types.FlowReturn delegate(gst.pad.Pad pad, gst.object.ObjectWrap parent, ulong offset, uint length, ref gst.buffer.Buffer buffer);

//!class Pad

  /**
      Sets the given getrange function for the pad. The getrange function is
      called to produce a new #GstBuffer to start the processing pipeline. see
      #GstPadGetRangeFunction for a description of the getrange function.

      Params:
        get = the #GstPadGetRangeFunction to set.
  */
  void setGetrangeFunctionFull(gst.types.PadGetRangeFunction get) nothrow
  {
    extern(C) GstFlowReturn _getCallback(GstPad* pad, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) nothrow
    {
      gst.types.FlowReturn _dretval;
      auto _dlg = cast(gst.types.PadGetRangeFunction*)pad.getrangedata;

      // A caller provided buffer is borrowed: its reference is taken for the call and stolen back afterwards, so
      // the buffer stays writable (single reference) while it is filled
      auto _provided = *buffer ? new gst.buffer.Buffer(cast(void*)*buffer, Yes.Take) : null;
      auto _buffer = _provided;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take),
          gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length,
          _buffer);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gst.types.PadGetRangeFunction");
      }

      auto _retval = cast(GstFlowReturn)_dretval;

      if (_provided) // The caller keeps its buffer, a replacement is released by its D object
      {
        _provided._cSteal;

        if (_buffer !is _provided)
        {
          import glib.c.functions : g_log;
          import glib.c.types : GLogLevelFlags;
          g_log("Gid", GLogLevelFlags.LevelCritical, "%s",
            "gst.types.PadGetRangeFunction replaced the caller provided buffer".ptr);
          _retval = GstFlowReturn.Error;
        }
      }
      else // New buffer owned by the caller
        *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _getCB = get ? &_getCallback : null;
    auto _get = get ? freezeDelegate(cast(void*)&get) : null;
    GDestroyNotify _getDestroyCB = get ? &thawDelegate : null;
    gst_pad_set_getrange_function_full(cast(GstPad*)this._cPtr, _getCB, _get, _getDestroyCB);
  }
