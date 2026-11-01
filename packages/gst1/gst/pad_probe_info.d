/// Module for [PadProbeInfo] class
module gst.pad_probe_info;

public import gid.basictypes;
import gid.gid;
import gst.buffer;
import gst.buffer_list;
import gst.c.functions;
import gst.c.types;
import gst.event;
import gst.query;
import gst.types;

/**
    Info passed in the #GstPadProbeCallback.
*/
class PadProbeInfo : StructWrap!(GstPadProbeInfo)
{
  /**
      Create a `pad_probe_info.PadProbeInfo` wrap type.
      Params:
        type = the current probe type
        id = the id of the probe
        offset = offset of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
        size = size of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
  */
  this(gst.types.PadProbeType type = gst.types.PadProbeType.init, gulong id = gulong.init, ulong offset = ulong.init, uint size = uint.init) nothrow
  {
    this.type = type;
    this.id = id;
    this.offset = offset;
    this.size = size;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Get `type` field.
      Returns: the current probe type
  */
  @property gst.types.PadProbeType type() nothrow
  {
    return cast(gst.types.PadProbeType)(cast(GstPadProbeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the current probe type
  */
  @property void type(gst.types.PadProbeType propval) nothrow
  {
    (cast(GstPadProbeInfo*)this._cPtr).type = cast(GstPadProbeType)propval;
  }

  /**
      Get `id` field.
      Returns: the id of the probe
  */
  @property gulong id() nothrow
  {
    return (cast(GstPadProbeInfo*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = the id of the probe
  */
  @property void id(gulong propval) nothrow
  {
    (cast(GstPadProbeInfo*)this._cPtr).id = propval;
  }

  /**
      Get `offset` field.
      Returns: offset of pull probe, this field is valid when @type contains
           #GST_PAD_PROBE_TYPE_PULL
  */
  @property ulong offset() nothrow
  {
    return (cast(GstPadProbeInfo*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = offset of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
  */
  @property void offset(ulong propval) nothrow
  {
    (cast(GstPadProbeInfo*)this._cPtr).offset = propval;
  }

  /**
      Get `size` field.
      Returns: size of pull probe, this field is valid when @type contains
           #GST_PAD_PROBE_TYPE_PULL
  */
  @property uint size() nothrow
  {
    return (cast(GstPadProbeInfo*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = size of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
  */
  @property void size(uint propval) nothrow
  {
    (cast(GstPadProbeInfo*)this._cPtr).size = propval;
  }

  /** */
  gst.buffer.Buffer getBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_pad_probe_info_get_buffer(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.buffer_list.BufferList getBufferList() nothrow
  {
    GstBufferList* _cretval;
    _cretval = gst_pad_probe_info_get_buffer_list(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.event.Event getEvent() nothrow
  {
    GstEvent* _cretval;
    _cretval = gst_pad_probe_info_get_event(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.types.FlowReturn getFlowReturn() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_probe_info_get_flow_return(cast(GstPadProbeInfo*)this._cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /** */
  gulong getId() nothrow
  {
    gulong _retval;
    _retval = gst_pad_probe_info_get_id(cast(GstPadProbeInfo*)this._cPtr);
    return _retval;
  }

  /** */
  ulong getOffset() nothrow
  {
    ulong _retval;
    _retval = gst_pad_probe_info_get_offset(cast(GstPadProbeInfo*)this._cPtr);
    return _retval;
  }

  /** */
  gst.query.Query getQuery() nothrow
  {
    GstQuery* _cretval;
    _cretval = gst_pad_probe_info_get_query(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  size_t getSize() nothrow
  {
    size_t _retval;
    _retval = gst_pad_probe_info_get_size(cast(GstPadProbeInfo*)this._cPtr);
    return _retval;
  }

  /** */
  gst.types.PadProbeType getType() nothrow
  {
    GstPadProbeType _cretval;
    _cretval = gst_pad_probe_info_get_type(cast(GstPadProbeInfo*)this._cPtr);
    gst.types.PadProbeType _retval = cast(gst.types.PadProbeType)_cretval;
    return _retval;
  }

  /**
      Updates info with buffer or null.
  
      Params:
        buffer = a #GstBuffer
  */
  void setBuffer(gst.buffer.Buffer buffer = null) nothrow
  {
    gst_pad_probe_info_set_buffer(cast(GstPadProbeInfo*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with list or null.
  
      Params:
        list = a #GstBufferList
  */
  void setBufferList(gst.buffer_list.BufferList list = null) nothrow
  {
    gst_pad_probe_info_set_buffer_list(cast(GstPadProbeInfo*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with event or null.
  
      Params:
        event = a #GstEvent
  */
  void setEvent(gst.event.Event event = null) nothrow
  {
    gst_pad_probe_info_set_event(cast(GstPadProbeInfo*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with flow_ret.
  
      Params:
        flowRet = A #GstFlowReturn
  */
  void setFlowReturn(gst.types.FlowReturn flowRet) nothrow
  {
    gst_pad_probe_info_set_flow_return(cast(GstPadProbeInfo*)this._cPtr, flowRet);
  }
}
