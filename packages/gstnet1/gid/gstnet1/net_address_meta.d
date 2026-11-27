/// Module for [NetAddressMeta] class
module gid.gstnet1.net_address_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.socket_address;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    #GstNetAddressMeta can be used to store a network address (a #GSocketAddress)
    in a #GstBuffer so that it network elements can track the to and from address
    of the buffer.
*/
@gidGir("NetAddressMeta")
class NetAddressMeta : StructWrap!(GstNetAddressMeta)
{
  /**
      Create a `net_address_meta.NetAddressMeta` wrap type.
      Params:
        addr = a #GSocketAddress stored as metadata
  */
  this(gid.gio2.socket_address.SocketAddress addr = gid.gio2.socket_address.SocketAddress.init) nothrow
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
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstNetAddressMeta*)this._cPtr).meta, this);
  }

  private gid.gio2.socket_address.SocketAddress _addrRef; // Keeps borrowed field value alive

  /**
      Get `addr` field.
      Returns: a #GSocketAddress stored as metadata
  */
  @property gid.gio2.socket_address.SocketAddress addr() nothrow
  {
    return cToD!(gid.gio2.socket_address.SocketAddress)(cast(void*)(cast(GstNetAddressMeta*)this._cPtr).addr);
  }

  /**
      Set `addr` field.
      Params:
        propval = a #GSocketAddress stored as metadata
  */
  @property void addr(gid.gio2.socket_address.SocketAddress propval) nothrow
  {
    if (_refuseBorrowedStore("addr"))
      return;

    _addrRef = propval;
    (cast(GstNetAddressMeta*)this._cPtr).addr = propval ? cast(GSocketAddress*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_address_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
