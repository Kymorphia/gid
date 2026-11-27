/// Module for [NetControlMessageMeta] class
module gid.gstnet1.net_control_message_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.socket_control_message;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    #GstNetControlMessageMeta can be used to store control messages (ancillary
    data) which was received with or is to be sent alongside the buffer data.
    When used with socket sinks and sources which understand this meta it allows
    sending and receiving ancillary data such as unix credentials (See
    #GUnixCredentialsMessage) and Unix file descriptions (See #GUnixFDMessage).
*/
@gidGir("NetControlMessageMeta")
class NetControlMessageMeta : StructWrap!(GstNetControlMessageMeta)
{
  /**
      Create a `net_control_message_meta.NetControlMessageMeta` wrap type.
      Params:
        message = a #GSocketControlMessage stored as metadata
  */
  this(gid.gio2.socket_control_message.SocketControlMessage message = gid.gio2.socket_control_message.SocketControlMessage.init) nothrow
  {
    this.message = message;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstNetControlMessageMeta*)this._cPtr).meta, this);
  }

  private gid.gio2.socket_control_message.SocketControlMessage _messageRef; // Keeps borrowed field value alive

  /**
      Get `message` field.
      Returns: a #GSocketControlMessage stored as metadata
  */
  @property gid.gio2.socket_control_message.SocketControlMessage message() nothrow
  {
    return cToD!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)(cast(GstNetControlMessageMeta*)this._cPtr).message);
  }

  /**
      Set `message` field.
      Params:
        propval = a #GSocketControlMessage stored as metadata
  */
  @property void message(gid.gio2.socket_control_message.SocketControlMessage propval) nothrow
  {
    if (_refuseBorrowedStore("message"))
      return;

    _messageRef = propval;
    (cast(GstNetControlMessageMeta*)this._cPtr).message = propval ? cast(GSocketControlMessage*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_control_message_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
