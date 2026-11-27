/// Module for [OutputMessage] class
module gid.gio2.output_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_address;
import gid.gio2.socket_control_message;
import gid.gio2.types;
import gid.gobject2.object;

/**
    Structure used for scatter/gather data output when sending multiple
    messages or packets in one go. You generally pass in an array of
    #GOutputVectors and the operation will use all the buffers as if they
    were one buffer.
    
    If @address is null then the message is sent to the default receiver
    (as previously set by [gid.gio2.socket.Socket.connect]).
*/
@gidGir("OutputMessage")
class OutputMessage : StructWrap!(GOutputMessage)
{
  /**
      Create a `output_message.OutputMessage` wrap type.
      Params:
        address = a #GSocketAddress, or null
        numVectors = the number of output vectors pointed to by @vectors.
        bytesSent = initialize to 0. Will be set to the number of bytes
              that have been sent
  */
  this(gid.gio2.socket_address.SocketAddress address = gid.gio2.socket_address.SocketAddress.init, uint numVectors = uint.init, uint bytesSent = uint.init) nothrow
  {
    this.address = address;
    this.numVectors = numVectors;
    this.bytesSent = bytesSent;
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

  private gid.gio2.socket_address.SocketAddress _addressRef; // Keeps borrowed field value alive

  /**
      Get `address` field.
      Returns: a #GSocketAddress, or null
  */
  @property gid.gio2.socket_address.SocketAddress address() nothrow
  {
    return cToD!(gid.gio2.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)this._cPtr).address);
  }

  /**
      Set `address` field.
      Params:
        propval = a #GSocketAddress, or null
  */
  @property void address(gid.gio2.socket_address.SocketAddress propval) nothrow
  {
    if (_refuseBorrowedStore("address"))
      return;

    _addressRef = propval;
    (cast(GOutputMessage*)this._cPtr).address = propval ? cast(GSocketAddress*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `vectors` field.
      Returns: pointer to an array of output vectors
  */
  @property gid.gio2.types.OutputVector vectors() nothrow
  {
    return cToD!(gid.gio2.types.OutputVector)(cast(void*)(cast(GOutputMessage*)this._cPtr).vectors);
  }

  /**
      Get `numVectors` field.
      Returns: the number of output vectors pointed to by @vectors.
  */
  @property uint numVectors() nothrow
  {
    return (cast(GOutputMessage*)this._cPtr).numVectors;
  }

  /**
      Set `numVectors` field.
      Params:
        propval = the number of output vectors pointed to by @vectors.
  */
  @property void numVectors(uint propval) nothrow
  {
    (cast(GOutputMessage*)this._cPtr).numVectors = propval;
  }

  /**
      Get `bytesSent` field.
      Returns: initialize to 0. Will be set to the number of bytes
            that have been sent
  */
  @property uint bytesSent() nothrow
  {
    return (cast(GOutputMessage*)this._cPtr).bytesSent;
  }

  /**
      Set `bytesSent` field.
      Params:
        propval = initialize to 0. Will be set to the number of bytes
              that have been sent
  */
  @property void bytesSent(uint propval) nothrow
  {
    (cast(GOutputMessage*)this._cPtr).bytesSent = propval;
  }

  /**
      Get `controlMessages` field.
      Returns: a pointer
          to an array of #GSocketControlMessages, or null.
  */
  @property gid.gio2.socket_control_message.SocketControlMessage[] controlMessages() nothrow
  {
    if (!(cast(GOutputMessage*)this._cPtr).controlMessages)
      return null;

    auto _retval = new gid.gio2.socket_control_message.SocketControlMessage[]((cast(GOutputMessage*)this._cPtr).numControlMessages);
    foreach (i; 0 .. (cast(GOutputMessage*)this._cPtr).numControlMessages)
      _retval[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)(cast(GOutputMessage*)this._cPtr).controlMessages[i], No.Take);
    return _retval;
  }
}
