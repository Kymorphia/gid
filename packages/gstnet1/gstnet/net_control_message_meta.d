/// Module for [NetControlMessageMeta] class
module gstnet.net_control_message_meta;

public import gid.basictypes;
import gid.gid;
import gio.socket_control_message;
import gst.meta;
import gst.meta_info;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    #GstNetControlMessageMeta can be used to store control messages (ancillary
    data) which was received with or is to be sent alongside the buffer data.
    When used with socket sinks and sources which understand this meta it allows
    sending and receiving ancillary data such as unix credentials (See
    #GUnixCredentialsMessage) and Unix file descriptions (See #GUnixFDMessage).
*/
class NetControlMessageMeta
{
  GstNetControlMessageMeta _cInstance;

  /**
      Create a `net_control_message_meta.NetControlMessageMeta` wrap type.
      Params:
        message = a #GSocketControlMessage stored as metadata
  */
  this(gio.socket_control_message.SocketControlMessage message = gio.socket_control_message.SocketControlMessage.init) nothrow
  {
    this.message = message;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstNetControlMessageMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `meta` field.
      Returns: the parent type
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstNetControlMessageMeta*)this._cPtr).meta, No.Take);
  }

  private gio.socket_control_message.SocketControlMessage _messageRef; // Keeps borrowed field value alive

  /**
      Get `message` field.
      Returns: a #GSocketControlMessage stored as metadata
  */
  @property gio.socket_control_message.SocketControlMessage message() nothrow
  {
    return cToD!(gio.socket_control_message.SocketControlMessage)(cast(void*)(cast(GstNetControlMessageMeta*)this._cPtr).message);
  }

  /**
      Set `message` field.
      Params:
        propval = a #GSocketControlMessage stored as metadata
  */
  @property void message(gio.socket_control_message.SocketControlMessage propval) nothrow
  {
    _messageRef = propval;
    (cast(GstNetControlMessageMeta*)this._cPtr).message = propval ? cast(GSocketControlMessage*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_net_control_message_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
