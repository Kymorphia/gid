/// Module for [PadProbeInfo] class
module gid.gst1.pad_probe_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.event;
import gid.gst1.query;
import gid.gst1.types;

/**
    Info passed in the #GstPadProbeCallback.
*/
@gidGir("PadProbeInfo")
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
  this(gid.gst1.types.PadProbeType type = gid.gst1.types.PadProbeType.init, gulong id = gulong.init, ulong offset = ulong.init, uint size = uint.init) nothrow
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

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `type` field.
      Returns: the current probe type
  */
  @property gid.gst1.types.PadProbeType type() nothrow
  {
    return cast(gid.gst1.types.PadProbeType)(cast(GstPadProbeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the current probe type
  */
  @property void type(gid.gst1.types.PadProbeType propval) nothrow
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
  gid.gst1.buffer.Buffer getBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_pad_probe_info_get_buffer(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.buffer_list.BufferList getBufferList() nothrow
  {
    GstBufferList* _cretval;
    _cretval = gst_pad_probe_info_get_buffer_list(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer_list.BufferList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.event.Event getEvent() nothrow
  {
    GstEvent* _cretval;
    _cretval = gst_pad_probe_info_get_event(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.types.FlowReturn getFlowReturn() nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_pad_probe_info_get_flow_return(cast(GstPadProbeInfo*)this._cPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  gid.gst1.query.Query getQuery() nothrow
  {
    GstQuery* _cretval;
    _cretval = gst_pad_probe_info_get_query(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.query.Query(cast(void*)_cretval, No.Take) : null;
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
  gid.gst1.types.PadProbeType getType() nothrow
  {
    GstPadProbeType _cretval;
    _cretval = gst_pad_probe_info_get_type(cast(GstPadProbeInfo*)this._cPtr);
    gid.gst1.types.PadProbeType _retval = cast(gid.gst1.types.PadProbeType)_cretval;
    return _retval;
  }

  /**
      Updates info with buffer or null.
  
      Params:
        buffer = a #GstBuffer
  */
  void setBuffer(gid.gst1.buffer.Buffer buffer = null) nothrow
  {
    gst_pad_probe_info_set_buffer(cast(GstPadProbeInfo*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with list or null.
  
      Params:
        list = a #GstBufferList
  */
  void setBufferList(gid.gst1.buffer_list.BufferList list = null) nothrow
  {
    gst_pad_probe_info_set_buffer_list(cast(GstPadProbeInfo*)this._cPtr, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with event or null.
  
      Params:
        event = a #GstEvent
  */
  void setEvent(gid.gst1.event.Event event = null) nothrow
  {
    gst_pad_probe_info_set_event(cast(GstPadProbeInfo*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
  }

  /**
      Updates info with flow_ret.
  
      Params:
        flowRet = A #GstFlowReturn
  */
  void setFlowReturn(gid.gst1.types.FlowReturn flowRet) nothrow
  {
    gst_pad_probe_info_set_flow_return(cast(GstPadProbeInfo*)this._cPtr, flowRet);
  }
}
