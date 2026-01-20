/// Module for [VideoScaler] class
module gstvideo.video_scaler;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    #GstVideoScaler is a utility object for rescaling and resampling
    video frames using various interpolation / sampling methods.
*/
class VideoScaler
{
  GstVideoScaler* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_scaler.VideoScaler");

    _cInstancePtr = cast(GstVideoScaler*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Scale a rectangle of pixels in src with src_stride to dest with
      dest_stride using the horizontal scaler hscaler and the vertical
      scaler vscale.
      
      One or both of hscale and vscale can be NULL to only perform scaling in
      one dimension or do a copy without scaling.
      
      `x` and `y` are the coordinates in the destination image to process.
  
      Params:
        vscale = a vertical #GstVideoScaler
        format = a #GstVideoFormat for srcs and dest
        src = source pixels
        srcStride = source pixels stride
        dest = destination pixels
        destStride = destination pixels stride
        x = the horizontal destination offset
        y = the vertical destination offset
        width = the number of output pixels to scale
        height = the number of output lines to scale
  */
  void _2d(gstvideo.video_scaler.VideoScaler vscale, gstvideo.types.VideoFormat format, void* src, int srcStride, void* dest, int destStride, uint x, uint y, uint width, uint height)
  {
    gst_video_scaler_2d(cast(GstVideoScaler*)this._cPtr, vscale ? cast(GstVideoScaler*)vscale._cPtr : null, format, src, srcStride, dest, destStride, x, y, width, height);
  }

  /**
      For a given pixel at out_offset, get the first required input pixel at
      in_offset and the n_taps filter coefficients.
      
      Note that for interlaced content, in_offset needs to be incremented with
      2 to get the next input line.
  
      Params:
        outOffset = an output offset
        inOffset = result input offset
        nTaps = result n_taps
      Returns: an array of n_tap gdouble values with filter coefficients.
  */
  const(double)* getCoeff(uint outOffset, out uint inOffset, out uint nTaps)
  {
    auto _retval = gst_video_scaler_get_coeff(cast(GstVideoScaler*)this._cPtr, outOffset, cast(uint*)&inOffset, cast(uint*)&nTaps);
    return _retval;
  }

  /**
      Get the maximum number of taps for scale.
      Returns: the maximum number of taps
  */
  uint getMaxTaps()
  {
    uint _retval;
    _retval = gst_video_scaler_get_max_taps(cast(GstVideoScaler*)this._cPtr);
    return _retval;
  }

  /**
      Horizontally scale the pixels in src to dest, starting from dest_offset
      for width samples.
  
      Params:
        format = a #GstVideoFormat for src and dest
        src = source pixels
        dest = destination pixels
        destOffset = the horizontal destination offset
        width = the number of pixels to scale
  */
  void horizontal(gstvideo.types.VideoFormat format, void* src, void* dest, uint destOffset, uint width)
  {
    gst_video_scaler_horizontal(cast(GstVideoScaler*)this._cPtr, format, src, dest, destOffset, width);
  }
}
