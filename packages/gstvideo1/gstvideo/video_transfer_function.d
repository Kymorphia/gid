/// Module for [VideoTransferFunction] enum namespace
module gstvideo.video_transfer_function;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoTransferFunction] enum
struct VideoTransferFunction
{
  alias Enum = gstvideo.types.VideoTransferFunction; ///

  /**
      Convert val to its gamma decoded value. This is the inverse operation of
      [gstvideo.global.videoColorTransferEncode].
      
      For a non-linear value L' in the range [0..1], conversion to the linear
      L is in general performed with a power function like:
      
      ```
         L = L' ^ gamma
      ```
      
      Depending on func, different formulas might be applied. Some formulas
      encode a linear segment in the lower range.
  
      Params:
        func = a #GstVideoTransferFunction
        val = a value
      Returns: the gamma decoded value of val
  */
  static double decode(gstvideo.types.VideoTransferFunction func, double val)
  {
    double _retval;
    _retval = gst_video_transfer_function_decode(func, val);
    return _retval;
  }

  /**
      Convert val to its gamma encoded value.
      
      For a linear value L in the range [0..1], conversion to the non-linear
      (gamma encoded) L' is in general performed with a power function like:
      
      ```
         L' = L ^ (1 / gamma)
      ```
      
      Depending on func, different formulas might be applied. Some formulas
      encode a linear segment in the lower range.
  
      Params:
        func = a #GstVideoTransferFunction
        val = a value
      Returns: the gamma encoded value of val
  */
  static double encode(gstvideo.types.VideoTransferFunction func, double val)
  {
    double _retval;
    _retval = gst_video_transfer_function_encode(func, val);
    return _retval;
  }

  /**
      Converts the value to the #GstVideoTransferFunction
      The transfer characteristics (TransferCharacteristics) value is
      defined by "ISO/IEC 23001-8 Section 7.2 Table 3"
      and "ITU-T H.273 Table 3".
      "H.264 Table E-4" and "H.265 Table E.4" share the identical values.
  
      Params:
        value = a ITU-T H.273 transfer characteristics value
      Returns: the matched #GstVideoTransferFunction
  */
  static gstvideo.types.VideoTransferFunction fromIso(uint value)
  {
    GstVideoTransferFunction _cretval;
    _cretval = gst_video_transfer_function_from_iso(value);
    gstvideo.types.VideoTransferFunction _retval = cast(gstvideo.types.VideoTransferFunction)_cretval;
    return _retval;
  }

  /**
      Returns whether from_func and to_func are equivalent. There are cases
      (e.g. BT601, BT709, and BT2020_10) where several functions are functionally
      identical. In these cases, when doing conversion, we should consider them
      as equivalent. Also, BT2020_12 is the same as the aforementioned three for
      less than 12 bits per pixel.
  
      Params:
        fromFunc = #GstVideoTransferFunction to convert from
        fromBpp = bits per pixel to convert from
        toFunc = #GstVideoTransferFunction to convert into
        toBpp = bits per pixel to convert into
      Returns: TRUE if from_func and to_func can be considered equivalent.
  */
  static bool isEquivalent(gstvideo.types.VideoTransferFunction fromFunc, uint fromBpp, gstvideo.types.VideoTransferFunction toFunc, uint toBpp)
  {
    bool _retval;
    _retval = cast(bool)gst_video_transfer_function_is_equivalent(fromFunc, fromBpp, toFunc, toBpp);
    return _retval;
  }

  /**
      Converts #GstVideoTransferFunction to the "transfer characteristics"
      (TransferCharacteristics) value defined by "ISO/IEC 23001-8 Section 7.2 Table 3"
      and "ITU-T H.273 Table 3".
      "H.264 Table E-4" and "H.265 Table E.4" share the identical values.
  
      Params:
        func = a #GstVideoTransferFunction
      Returns: The value of ISO/IEC 23001-8 transfer characteristics.
  */
  static uint toIso(gstvideo.types.VideoTransferFunction func)
  {
    uint _retval;
    _retval = gst_video_transfer_function_to_iso(func);
    return _retval;
  }
}
