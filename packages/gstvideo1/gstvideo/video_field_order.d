/// Module for [VideoFieldOrder] enum namespace
module gstvideo.video_field_order;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoFieldOrder] enum
struct VideoFieldOrder
{
  alias Enum = gstvideo.types.VideoFieldOrder; ///

  /**
      Convert order to a #GstVideoFieldOrder
  
      Params:
        order = a field order
      Returns: the #GstVideoFieldOrder of order or
           #GST_VIDEO_FIELD_ORDER_UNKNOWN when order is not a valid
           string representation for a #GstVideoFieldOrder.
  */
  static gstvideo.types.VideoFieldOrder fromString(string order) nothrow
  {
    GstVideoFieldOrder _cretval;
    const(char)* _order = order.toCString(No.Alloc);
    _cretval = gst_video_field_order_from_string(_order);
    gstvideo.types.VideoFieldOrder _retval = cast(gstvideo.types.VideoFieldOrder)_cretval;
    return _retval;
  }

  /**
      Convert order to its string representation.
  
      Params:
        order = a #GstVideoFieldOrder
      Returns: order as a string.
  */
  static string toString_(gstvideo.types.VideoFieldOrder order) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_field_order_to_string(order);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
