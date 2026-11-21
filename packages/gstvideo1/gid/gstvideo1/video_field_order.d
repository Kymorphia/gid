/// Module for [VideoFieldOrder] enum namespace
module gid.gstvideo1.video_field_order;

import gid.core.gid;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoFieldOrder] enum
struct VideoFieldOrder
{
  alias Enum = gid.gstvideo1.types.VideoFieldOrder; ///

  /**
      Convert order to a #GstVideoFieldOrder
  
      Params:
        order = a field order
      Returns: the #GstVideoFieldOrder of order or
           #GST_VIDEO_FIELD_ORDER_UNKNOWN when order is not a valid
           string representation for a #GstVideoFieldOrder.
  */
  static gid.gstvideo1.types.VideoFieldOrder fromString(string order) nothrow
  {
    GstVideoFieldOrder _cretval;
    const(char)* _order = order.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_video_field_order_from_string(_order);
    gid.gstvideo1.types.VideoFieldOrder _retval = cast(gid.gstvideo1.types.VideoFieldOrder)_cretval;
    return _retval;
  }

  /**
      Convert order to its string representation.
  
      Params:
        order = a #GstVideoFieldOrder
      Returns: order as a string.
  */
  static string toString_(gid.gstvideo1.types.VideoFieldOrder order) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_field_order_to_string(order);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
