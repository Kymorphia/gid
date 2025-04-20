/// Module for [VideoResampler] class
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
class VideoResampler
{
  GstVideoResampler cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_resampler.VideoResampler");

    cInstance = *cast(GstVideoResampler*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `inSize` field.
      Returns: the input size
  */
  @property int inSize()
  {
    return (cast(GstVideoResampler*)cPtr).inSize;
  }

  /**
      Set `inSize` field.
      Params:
        propval = the input size
  */
  @property void inSize(int propval)
  {
    (cast(GstVideoResampler*)cPtr).inSize = propval;
  }

  /**
      Get `outSize` field.
      Returns: the output size
  */
  @property int outSize()
  {
    return (cast(GstVideoResampler*)cPtr).outSize;
  }

  /**
      Set `outSize` field.
      Params:
        propval = the output size
  */
  @property void outSize(int propval)
  {
    (cast(GstVideoResampler*)cPtr).outSize = propval;
  }

  /**
      Get `maxTaps` field.
      Returns: the maximum number of taps
  */
  @property uint maxTaps()
  {
    return (cast(GstVideoResampler*)cPtr).maxTaps;
  }

  /**
      Set `maxTaps` field.
      Params:
        propval = the maximum number of taps
  */
  @property void maxTaps(uint propval)
  {
    (cast(GstVideoResampler*)cPtr).maxTaps = propval;
  }

  /**
      Get `nPhases` field.
      Returns: the number of phases
  */
  @property uint nPhases()
  {
    return (cast(GstVideoResampler*)cPtr).nPhases;
  }

  /**
      Set `nPhases` field.
      Params:
        propval = the number of phases
  */
  @property void nPhases(uint propval)
  {
    (cast(GstVideoResampler*)cPtr).nPhases = propval;
  }

  /**
      Clear a previously initialized #GstVideoResampler resampler.
  */
  void clear()
  {
    gst_video_resampler_clear(cast(GstVideoResampler*)cPtr);
  }

  /** */
  bool init_(gstvideo.types.VideoResamplerMethod method, gstvideo.types.VideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, gst.structure.Structure options)
  {
    bool _retval;
    _retval = gst_video_resampler_init(cast(GstVideoResampler*)cPtr, method, flags, nPhases, nTaps, shift, inSize, outSize, options ? cast(GstStructure*)options.cPtr(No.Dup) : null);
    return _retval;
  }
}
