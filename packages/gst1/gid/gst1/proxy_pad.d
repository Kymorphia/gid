/// Module for [ProxyPad] class
module gid.gst1.proxy_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.buffer_list;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.iterator;
import gid.gst1.object;
import gid.gst1.pad;
import gid.gst1.types;

/** */
class ProxyPad : gid.gst1.pad.Pad
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_proxy_pad_get_type != &gidSymbolNotFound ? gst_proxy_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstProxyPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.proxy_pad.ProxyPad]
      Returns: New builder object
  */
  static ProxyPadGidBuilder builder() nothrow
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
  static gid.gst1.types.FlowReturn chainDefault(gid.gst1.pad.Pad pad, gid.gst1.object.ObjectWrap parent, gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_proxy_pad_chain_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  static gid.gst1.types.FlowReturn chainListDefault(gid.gst1.pad.Pad pad, gid.gst1.object.ObjectWrap parent, gid.gst1.buffer_list.BufferList list) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_proxy_pad_chain_list_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, list ? cast(GstBufferList*)list._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
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
  static gid.gst1.types.FlowReturn getrangeDefault(gid.gst1.pad.Pad pad, gid.gst1.object.ObjectWrap parent, ulong offset, uint size, out gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_proxy_pad_getrange_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, offset, size, &_buffer);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Invoke the default iterate internal links function of the proxy pad.
  
      Params:
        pad = the #GstPad to get the internal links of.
        parent = the parent of pad or null
      Returns: a #GstIterator of #GstPad, or null if pad
        has no parent. Unref each returned pad with [gid.gst1.object.ObjectWrap.unref].
  */
  static gid.gst1.iterator.Iterator iterateInternalLinksDefault(gid.gst1.pad.Pad pad, gid.gst1.object.ObjectWrap parent = null) nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_proxy_pad_iterate_internal_links_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the internal pad of pad. Unref target pad after usage.
      
      The internal pad of a #GstGhostPad is the internally used
      pad of opposite direction, which is used to link to the target.
      Returns: the target #GstProxyPad, can
        be null.  Unref target pad after usage.
  */
  gid.gst1.proxy_pad.ProxyPad getInternal() nothrow
  {
    GstProxyPad* _cretval;
    _cretval = gst_proxy_pad_get_internal(cast(GstProxyPad*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.proxy_pad.ProxyPad)(cast(GstProxyPad*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.proxy_pad.ProxyPad]
class ProxyPadGidBuilderImpl(T) : gid.gst1.pad.PadGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.proxy_pad.ProxyPad]
final class ProxyPadGidBuilder : ProxyPadGidBuilderImpl!ProxyPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProxyPad build() nothrow
  {
    return new ProxyPad(cast(void*)createGObject(ProxyPad._getGType), Yes.Take);
  }
}
