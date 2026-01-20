/// Module for [VideoDither] class
module gstvideo.video_dither;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    GstVideoDither provides implementations of several dithering algorithms
    that can be applied to lines of video pixels to quantize and dither them.
*/
class VideoDither
{
  GstVideoDither* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_dither.VideoDither");

    _cInstancePtr = cast(GstVideoDither*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Dither width pixels starting from offset `x` in line using dither.
      
      `y` is the line number of line in the output image.
  
      Params:
        line = pointer to the pixels of the line
        x = x coordinate
        y = y coordinate
        width = the width
  */
  void line(void* line, uint x, uint y, uint width)
  {
    gst_video_dither_line(cast(GstVideoDither*)this._cPtr, line, x, y, width);
  }
}
