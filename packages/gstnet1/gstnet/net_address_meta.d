/// Module for [NetAddressMeta] class
module gstnet.net_address_meta;

public import gid.basictypes;
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
class NetAddressMeta : StructWrap!(GstNetAddressMeta)
{
  /**
      Create a `net_address_meta.NetAddressMeta` wrap type.
      Params:
        addr = a #GSocketAddress stored as metadata
  */
  this(gio.socket_address.SocketAddress addr = gio.socket_address.SocketAddress.init) nothrow
  {
    this.addr = addr;
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
      Get `meta` field.
      Returns: the parent type
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetAddressMeta*)this._cPtr).meta, this);
  }

  private gio.socket_address.SocketAddress _addrRef; // Keeps borrowed field value alive

  /**
      Get `addr` field.
      Returns: a #GSocketAddress stored as metadata
  */
  @property gio.socket_address.SocketAddress addr() nothrow
  {
    return cToD!(gio.socket_address.SocketAddress)(cast(void*)(cast(GstNetAddressMeta*)this._cPtr).addr);
  }

  /**
      Set `addr` field.
      Params:
        propval = a #GSocketAddress stored as metadata
  */
  @property void addr(gio.socket_address.SocketAddress propval) nothrow
  {
    if (_refuseBorrowedStore("addr"))
      return;

    _addrRef = propval;
    (cast(GstNetAddressMeta*)this._cPtr).addr = propval ? cast(GSocketAddress*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_address_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
