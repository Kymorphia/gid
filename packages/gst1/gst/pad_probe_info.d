/// Module for [PadProbeInfo] class
module gst.pad_probe_info;

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
class PadProbeInfo
{
  GstPadProbeInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.pad_probe_info.PadProbeInfo");

    _cInstance = *cast(GstPadProbeInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: the current probe type
  */
  @property gst.types.PadProbeType type()
  {
    return cast(gst.types.PadProbeType)(cast(GstPadProbeInfo*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the current probe type
  */
  @property void type(gst.types.PadProbeType propval)
  {
    (cast(GstPadProbeInfo*)this._cPtr).type = cast(GstPadProbeType)propval;
  }

  /**
      Get `id` field.
      Returns: the id of the probe
  */
  @property gulong id()
  {
    return (cast(GstPadProbeInfo*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = the id of the probe
  */
  @property void id(gulong propval)
  {
    (cast(GstPadProbeInfo*)this._cPtr).id = propval;
  }

  /**
      Get `offset` field.
      Returns: offset of pull probe, this field is valid when @type contains
           #GST_PAD_PROBE_TYPE_PULL
  */
  @property ulong offset()
  {
    return (cast(GstPadProbeInfo*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = offset of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
  */
  @property void offset(ulong propval)
  {
    (cast(GstPadProbeInfo*)this._cPtr).offset = propval;
  }

  /**
      Get `size` field.
      Returns: size of pull probe, this field is valid when @type contains
           #GST_PAD_PROBE_TYPE_PULL
  */
  @property uint size()
  {
    return (cast(GstPadProbeInfo*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = size of pull probe, this field is valid when @type contains
             #GST_PAD_PROBE_TYPE_PULL
  */
  @property void size(uint propval)
  {
    (cast(GstPadProbeInfo*)this._cPtr).size = propval;
  }

  /** */
  gst.buffer.Buffer getBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_pad_probe_info_get_buffer(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.buffer_list.BufferList getBufferList()
  {
    GstBufferList* _cretval;
    _cretval = gst_pad_probe_info_get_buffer_list(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer_list.BufferList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.event.Event getEvent()
  {
    GstEvent* _cretval;
    _cretval = gst_pad_probe_info_get_event(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.event.Event(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.query.Query getQuery()
  {
    GstQuery* _cretval;
    _cretval = gst_pad_probe_info_get_query(cast(GstPadProbeInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.query.Query(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
