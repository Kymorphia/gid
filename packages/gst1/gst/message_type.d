/// Module for [MessageType] flags namespace
module gst.message_type;

import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [MessageType] flags
struct MessageType
{
  alias Enum = gst.types.MessageType; ///

  /**
      Get a printable name for the given message type. Do not modify or free.
  
      Params:
        type = the message type
      Returns: a reference to the static name of the message.
  */
  static string getName(gst.types.MessageType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_message_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the unique quark for the given message type.
  
      Params:
        type = the message type
      Returns: the quark associated with the message type
  */
  static glib.types.Quark toQuark(gst.types.MessageType type) nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_message_type_to_quark(type);
    return _retval;
  }
}
