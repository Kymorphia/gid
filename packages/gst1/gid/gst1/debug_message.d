/// Module for [DebugMessage] class
module gid.gst1.debug_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/** */
class DebugMessage : OpaqueWrap!(GstDebugMessage*, void, void)
{

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
      Gets the string representation of a #GstDebugMessage. This function is used
      in debug handlers to extract the message.
      Returns: the string representation of a #GstDebugMessage.
  */
  string get() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_message_get(cast(GstDebugMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the id of the object that emitted this message. This function is used in
      debug handlers. Can be empty.
      Returns: The emitter of a #GstDebugMessage.
  */
  string getId() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_message_get_id(cast(GstDebugMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
