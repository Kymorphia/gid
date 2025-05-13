/// Module for [NetAddressMeta] class
module gstnet.net_address_meta;

import gid.gid;
import gio.socket_address;
import gst.meta;
import gst.meta_info;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetAddressMeta can be used to store a network address (a #GSocketAddress)
    in a #GstBuffer so that it network elements can track the to and from address
    of the buffer.
*/
class NetAddressMeta
{
  GstNetAddressMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstnet.net_address_meta.NetAddressMeta");

    cInstance = *cast(GstNetAddressMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: the parent type
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetAddressMeta*)this._cPtr).meta);
  }

  /**
      Get `addr` field.
      Returns: a #GSocketAddress stored as metadata
  */
  @property gio.socket_address.SocketAddress addr()
  {
    return cToD!(gio.socket_address.SocketAddress)(cast(void*)(cast(GstNetAddressMeta*)this._cPtr).addr);
  }

  /**
      Set `addr` field.
      Params:
        propval = a #GSocketAddress stored as metadata
  */
  @property void addr(gio.socket_address.SocketAddress propval)
  {
    cValueFree!(gio.socket_address.SocketAddress)(cast(void*)(cast(GstNetAddressMeta*)this._cPtr).addr);
    dToC(propval, cast(void*)&(cast(GstNetAddressMeta*)this._cPtr).addr);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_address_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
