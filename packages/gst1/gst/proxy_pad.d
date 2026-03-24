/// Module for [ProxyPad] class
module gst.proxy_pad;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.buffer;
import gst.buffer_list;
import gst.c.functions;
import gst.c.types;
import gst.iterator;
import gst.object;
import gst.pad;
import gst.types;

/** */
class ProxyPad : gst.pad.Pad
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
    return cast(void function())gst_proxy_pad_get_type != &gidSymbolNotFound ? gst_proxy_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyPad self()
  {
    return this;
  }

  /**
  Get builder for [gst.proxy_pad.ProxyPad]
  Returns: New builder object
  */
  static ProxyPadGidBuilder builder()
  {
    return new ProxyPadGidBuilder;
  }

  /**
      Invoke the default chain function of the proxy pad.
  
      Params:
        pad = a sink #GstPad, returns GST_FLOW_ERROR if not.
        parent = the parent of pad or null
        buffer = the #GstBuffer to send, return GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the pad.
  */
  static gst.types.FlowReturn chainDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_proxy_pad_chain_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Invoke the default chain list function of the proxy pad.
  
      Params:
        pad = a sink #GstPad, returns GST_FLOW_ERROR if not.
        parent = the parent of pad or null
        list = the #GstBufferList to send, return GST_FLOW_ERROR
              if not.
      Returns: a #GstFlowReturn from the pad.
  */
  static gst.types.FlowReturn chainListDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.buffer_list.BufferList list)
  {
    GstFlowReturn _cretval;
    _cretval = gst_proxy_pad_chain_list_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Invoke the default getrange function of the proxy pad.
  
      Params:
        pad = a src #GstPad, returns #GST_FLOW_ERROR if not.
        parent = the parent of pad
        offset = The start offset of the buffer
        size = The length of the buffer
        buffer = a pointer to hold the #GstBuffer,
              returns #GST_FLOW_ERROR if null.
      Returns: a #GstFlowReturn from the pad.
  */
  static gst.types.FlowReturn getrangeDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent, ulong offset, uint size, out gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_proxy_pad_getrange_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, offset, size, &_buffer);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    buffer = new gst.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Invoke the default iterate internal links function of the proxy pad.
  
      Params:
        pad = the #GstPad to get the internal links of.
        parent = the parent of pad or null
      Returns: a #GstIterator of #GstPad, or null if pad
        has no parent. Unref each returned pad with [gst.object.ObjectWrap.unref].
  */
  static gst.iterator.Iterator iterateInternalLinksDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent = null)
  {
    GstIterator* _cretval;
    _cretval = gst_proxy_pad_iterate_internal_links_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the internal pad of pad. Unref target pad after usage.
      
      The internal pad of a #GstGhostPad is the internally used
      pad of opposite direction, which is used to link to the target.
      Returns: the target #GstProxyPad, can
        be null.  Unref target pad after usage.
  */
  gst.proxy_pad.ProxyPad getInternal()
  {
    GstProxyPad* _cretval;
    _cretval = gst_proxy_pad_get_internal(cast(GstProxyPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.proxy_pad.ProxyPad)(cast(GstProxyPad*)_cretval, Yes.Take);
    return _retval;
  }
}

class ProxyPadGidBuilderImpl(T) : gst.pad.PadGidBuilderImpl!T
{
}

/// Fluent builder for [gst.proxy_pad.ProxyPad]
final class ProxyPadGidBuilder : ProxyPadGidBuilderImpl!ProxyPadGidBuilder
{
  ProxyPad build()
  {
    return new ProxyPad(cast(void*)createGObject(ProxyPad._getGType), No.Take);
  }
}
