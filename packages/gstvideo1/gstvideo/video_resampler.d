/// Module for [VideoResampler] class
module gstvideo.video_resampler;

public import gid.basictypes;
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
  GstVideoResampler _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoResampler*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `inSize` field.
      Returns: the input size
  */
  @property int inSize() nothrow
  {
    return (cast(GstVideoResampler*)this._cPtr).inSize;
  }

  /**
      Set `inSize` field.
      Params:
        propval = the input size
  */
  @property void inSize(int propval) nothrow
  {
    (cast(GstVideoResampler*)this._cPtr).inSize = propval;
  }

  /**
      Get `outSize` field.
      Returns: the output size
  */
  @property int outSize() nothrow
  {
    return (cast(GstVideoResampler*)this._cPtr).outSize;
  }

  /**
      Set `outSize` field.
      Params:
        propval = the output size
  */
  @property void outSize(int propval) nothrow
  {
    (cast(GstVideoResampler*)this._cPtr).outSize = propval;
  }

  /**
      Get `maxTaps` field.
      Returns: the maximum number of taps
  */
  @property uint maxTaps() nothrow
  {
    return (cast(GstVideoResampler*)this._cPtr).maxTaps;
  }

  /**
      Set `maxTaps` field.
      Params:
        propval = the maximum number of taps
  */
  @property void maxTaps(uint propval) nothrow
  {
    (cast(GstVideoResampler*)this._cPtr).maxTaps = propval;
  }

  /**
      Get `nPhases` field.
      Returns: the number of phases
  */
  @property uint nPhases() nothrow
  {
    return (cast(GstVideoResampler*)this._cPtr).nPhases;
  }

  /**
      Set `nPhases` field.
      Params:
        propval = the number of phases
  */
  @property void nPhases(uint propval) nothrow
  {
    (cast(GstVideoResampler*)this._cPtr).nPhases = propval;
  }

  /**
      Clear a previously initialized #GstVideoResampler resampler.
  */
  void clear() nothrow
  {
    gst_video_resampler_clear(cast(GstVideoResampler*)this._cPtr);
  }

  /** */
  bool init_(gstvideo.types.VideoResamplerMethod method, gstvideo.types.VideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, gst.structure.Structure options) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_resampler_init(cast(GstVideoResampler*)this._cPtr, method, flags, nPhases, nTaps, shift, inSize, outSize, options ? cast(GstStructure*)options._cPtr(No.Dup) : null);
    return _retval;
  }
}
