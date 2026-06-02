/// Module for [EventType] enum namespace
module gst.event_type;

import gid.gid;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [EventType] enum
struct EventType
{
  alias Enum = gst.types.EventType; ///

  /**
      Gets the #GstEventTypeFlags associated with type.
  
      Params:
        type = a #GstEventType
      Returns: a #GstEventTypeFlags.
  */
  static gst.types.EventTypeFlags getFlags(gst.types.EventType type) nothrow
  {
    GstEventTypeFlags _cretval;
    _cretval = gst_event_type_get_flags(type);
    gst.types.EventTypeFlags _retval = cast(gst.types.EventTypeFlags)_cretval;
    return _retval;
  }

  /**
      Get a printable name for the given event type. Do not modify or free.
  
      Params:
        type = the event type
      Returns: a reference to the static name of the event.
  */
  static string getName(gst.types.EventType type) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_event_type_get_name(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the unique quark for the given event type.
  
      Params:
        type = the event type
      Returns: the quark associated with the event type
  */
  static glib.types.Quark toQuark(gst.types.EventType type) nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_event_type_to_quark(type);
    return _retval;
  }

  /**
      Converts the #GstEventType to an unsigned integer that
      represents the ordering of sticky events when re-sending them.
      A lower value represents a higher-priority event.
  
      Params:
        type = a #GstEventType
      Returns: an unsigned integer
  */
  static uint toStickyOrdering(gst.types.EventType type) nothrow
  {
    uint _retval;
    _retval = gst_event_type_to_sticky_ordering(type);
    return _retval;
  }
}
