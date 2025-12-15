/// Module for [VideoColorMatrix] enum namespace
module gstvideo.video_color_matrix;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoColorMatrix] enum
struct VideoColorMatrix
{
  alias Enum = gstvideo.types.VideoColorMatrix; ///

  /**
      Converts the value to the #GstVideoColorMatrix
      The matrix coefficients (MatrixCoefficients) value is
      defined by "ISO/IEC 23001-8 Section 7.3 Table 4"
      and "ITU-T H.273 Table 4".
      "H.264 Table E-5" and "H.265 Table E.5" share the identical values.
  
      Params:
        value = a ITU-T H.273 matrix coefficients value
      Returns: the matched #GstVideoColorMatrix
  */
  static gstvideo.types.VideoColorMatrix fromIso(uint value)
  {
    GstVideoColorMatrix _cretval;
    _cretval = gst_video_color_matrix_from_iso(value);
    gstvideo.types.VideoColorMatrix _retval = cast(gstvideo.types.VideoColorMatrix)_cretval;
    return _retval;
  }

  /**
      Get the coefficients used to convert between Y'PbPr and R'G'B' using matrix.
      
      When:
      
      ```
        0.0 <= [Y',R',G',B'] <= 1.0)
        (-0.5 <= [Pb,Pr] <= 0.5)
      ```
      
      the general conversion is given by:
      
      ```
        Y' = Kr*R' + (1-Kr-Kb)*G' + Kb*B'
        Pb = (B'-Y')/(2*(1-Kb))
        Pr = (R'-Y')/(2*(1-Kr))
      ```
      
      and the other way around:
      
      ```
        R' = Y' + Cr*2*(1-Kr)
        G' = Y' - Cb*2*(1-Kb)*Kb/(1-Kr-Kb) - Cr*2*(1-Kr)*Kr/(1-Kr-Kb)
        B' = Y' + Cb*2*(1-Kb)
      ```
  
      Params:
        matrix = a #GstVideoColorMatrix
        Kr = result red channel coefficient
        Kb = result blue channel coefficient
      Returns: TRUE if matrix was a YUV color format and Kr and Kb contain valid
           values.
  */
  static bool getKrKb(gstvideo.types.VideoColorMatrix matrix, out double Kr, out double Kb)
  {
    bool _retval;
    _retval = cast(bool)gst_video_color_matrix_get_Kr_Kb(matrix, cast(double*)&Kr, cast(double*)&Kb);
    return _retval;
  }

  /**
      Converts #GstVideoColorMatrix to the "matrix coefficients"
      (MatrixCoefficients) value defined by "ISO/IEC 23001-8 Section 7.3 Table 4"
      and "ITU-T H.273 Table 4".
      "H.264 Table E-5" and "H.265 Table E.5" share the identical values.
  
      Params:
        matrix = a #GstVideoColorMatrix
      Returns: The value of ISO/IEC 23001-8 matrix coefficients.
  */
  static uint toIso(gstvideo.types.VideoColorMatrix matrix)
  {
    uint _retval;
    _retval = gst_video_color_matrix_to_iso(matrix);
    return _retval;
  }
}
