/// Module for [MessageType] flags namespace
module gid.gst1.message_type;

import gid.core.utils;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [MessageType] flags
struct MessageType
{
  alias Enum = gid.gst1.types.MessageType; ///

  /**
      Get a printable name for the given message type. Do not modify or free.
  
      Params:
        type = the message type
      Returns: a reference to the static name of the message.
  */
  static string getName(gid.gst1.types.MessageType type) nothrow
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
  static gid.glib2.types.Quark toQuark(gid.gst1.types.MessageType type) nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_message_type_to_quark(type);
    return _retval;
  }
}
