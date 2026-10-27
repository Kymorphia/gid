/// Module for [OutputMessage] class
module gio.output_message;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.socket_control_message;
import gio.types;
import gobject.object;

/**
    Structure used for scatter/gather data output when sending multiple
    messages or packets in one go. You generally pass in an array of
    #GOutputVectors and the operation will use all the buffers as if they
    were one buffer.
    
    If @address is null then the message is sent to the default receiver
    (as previously set by [gio.socket.Socket.connect]).
*/
class OutputMessage
{
  GOutputMessage _cInstance;

  /**
      Create a `output_message.OutputMessage` wrap type.
      Params:
        address = a #GSocketAddress, or null
        numVectors = the number of output vectors pointed to by @vectors.
        bytesSent = initialize to 0. Will be set to the number of bytes
              that have been sent
  */
  this(gio.socket_address.SocketAddress address = gio.socket_address.SocketAddress.init, uint numVectors = uint.init, uint bytesSent = uint.init) nothrow
  {
    this.address = address;
    this.numVectors = numVectors;
    this.bytesSent = bytesSent;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GOutputMessage*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gio.socket_address.SocketAddress _addressRef; // Keeps borrowed field value alive

  /**
      Get `address` field.
      Returns: a #GSocketAddress, or null
  */
  @property gio.socket_address.SocketAddress address() nothrow
  {
    return cToD!(gio.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)this._cPtr).address);
  }

  /**
      Set `address` field.
      Params:
        propval = a #GSocketAddress, or null
  */
  @property void address(gio.socket_address.SocketAddress propval) nothrow
  {
    _addressRef = propval;
    (cast(GOutputMessage*)this._cPtr).address = propval ? cast(GSocketAddress*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `vectors` field.
      Returns: pointer to an array of output vectors
  */
  @property gio.types.OutputVector vectors() nothrow
  {
    return cToD!(gio.types.OutputVector)(cast(void*)(cast(GOutputMessage*)this._cPtr).vectors);
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
  @property gio.socket_control_message.SocketControlMessage[] controlMessages() nothrow
  {
    auto _retval = new gio.socket_control_message.SocketControlMessage[]((cast(GOutputMessage*)this._cPtr).numControlMessages);
    foreach (i; 0 .. (cast(GOutputMessage*)this._cPtr).numControlMessages)
      _retval[i] = gobject.object.ObjectWrap._getDObject!(gio.socket_control_message.SocketControlMessage)(cast(void*)(cast(GOutputMessage*)this._cPtr).controlMessages[i], No.Take);
    return _retval;
  }
}
