/// Module for [OutputMessage] class
module gio.output_message;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address;
import gio.types;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.output_message.OutputMessage");

    _cInstance = *cast(GOutputMessage*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `address` field.
      Returns: a #GSocketAddress, or null
  */
  @property gio.socket_address.SocketAddress address()
  {
    return cToD!(gio.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)this._cPtr).address);
  }

  /**
      Set `address` field.
      Params:
        propval = a #GSocketAddress, or null
  */
  @property void address(gio.socket_address.SocketAddress propval)
  {
    cValueFree!(gio.socket_address.SocketAddress)(cast(void*)(cast(GOutputMessage*)this._cPtr).address);
    dToC(propval, cast(void*)&(cast(GOutputMessage*)this._cPtr).address);
  }

  /**
      Get `vectors` field.
      Returns: pointer to an array of output vectors
  */
  @property gio.types.OutputVector vectors()
  {
    return cToD!(gio.types.OutputVector)(cast(void*)(cast(GOutputMessage*)this._cPtr).vectors);
  }

  /**
      Get `numVectors` field.
      Returns: the number of output vectors pointed to by @vectors.
  */
  @property uint numVectors()
  {
    return (cast(GOutputMessage*)this._cPtr).numVectors;
  }

  /**
      Set `numVectors` field.
      Params:
        propval = the number of output vectors pointed to by @vectors.
  */
  @property void numVectors(uint propval)
  {
    (cast(GOutputMessage*)this._cPtr).numVectors = propval;
  }

  /**
      Get `bytesSent` field.
      Returns: initialize to 0. Will be set to the number of bytes
            that have been sent
  */
  @property uint bytesSent()
  {
    return (cast(GOutputMessage*)this._cPtr).bytesSent;
  }

  /**
      Set `bytesSent` field.
      Params:
        propval = initialize to 0. Will be set to the number of bytes
              that have been sent
  */
  @property void bytesSent(uint propval)
  {
    (cast(GOutputMessage*)this._cPtr).bytesSent = propval;
  }

  /**
      Get `numControlMessages` field.
      Returns: number of elements in @control_messages.
  */
  @property uint numControlMessages()
  {
    return (cast(GOutputMessage*)this._cPtr).numControlMessages;
  }

  /**
      Set `numControlMessages` field.
      Params:
        propval = number of elements in @control_messages.
  */
  @property void numControlMessages(uint propval)
  {
    (cast(GOutputMessage*)this._cPtr).numControlMessages = propval;
  }
}
