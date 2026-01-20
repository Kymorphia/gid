/// Module for [VideoResampler] struct
module gstvideo.video_resampler;

import gid.gid;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    #GstVideoResampler is a structure which holds the information
    required to perform various kinds of resampling filtering.
*/
struct VideoResampler
{
  /**
      the input size
  */
  int inSize;

  /**
      the output size
  */
  int outSize;

  /**
      the maximum number of taps
  */
  uint maxTaps;

  /**
      the number of phases
  */
  uint nPhases;

  /**
      array with the source offset for each output element
  */
  uint* offset;

  /**
      array with the phase to use for each output element
  */
  uint* phase;

  /**
      array with new number of taps for each phase
  */
  uint* nTaps;

  /**
      the taps for all phases
  */
  double* taps;

  /** */
  void*[4] GstReserved;

  /**
      Clear a previously initialized #GstVideoResampler resampler.
  */
  void clear()
  {
    gst_video_resampler_clear(cast(GstVideoResampler*)&this);
  }

  /** */
  bool init_(gstvideo.types.VideoResamplerMethod method, gstvideo.types.VideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, gst.structure.Structure options)
  {
    bool _retval;
    _retval = cast(bool)gst_video_resampler_init(cast(GstVideoResampler*)&this, method, flags, nPhases, nTaps, shift, inSize, outSize, cast(GstStructure*)&options);
    return _retval;
  }
}
