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
class VideoResampler : StructWrap!(GstVideoResampler)
{
  /**
      Create a `video_resampler.VideoResampler` wrap type.
      Params:
        inSize = the input size
  */
  this(int inSize = int.init) nothrow
  {
    this.inSize = inSize;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
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
      Get `maxTaps` field.
      Returns: the maximum number of taps
  */
  @property uint maxTaps() nothrow
  {
    return (cast(GstVideoResampler*)this._cPtr).maxTaps;
  }

  /**
      Get `offset` field.
      Returns: array with the source offset for each output element
  */
  @property uint[] offset() nothrow
  {
    if (!(cast(GstVideoResampler*)this._cPtr).offset)
      return null;

    return (cast(GstVideoResampler*)this._cPtr).offset[0 .. (cast(GstVideoResampler*)this._cPtr).outSize].dup;
  }

  /**
      Get `phase` field.
      Returns: array with the phase to use for each output element
  */
  @property uint[] phase() nothrow
  {
    if (!(cast(GstVideoResampler*)this._cPtr).phase)
      return null;

    return (cast(GstVideoResampler*)this._cPtr).phase[0 .. (cast(GstVideoResampler*)this._cPtr).outSize].dup;
  }

  /**
      Get `nTaps` field.
      Returns: array with new number of taps for each phase
  */
  @property uint[] nTaps() nothrow
  {
    if (!(cast(GstVideoResampler*)this._cPtr).nTaps)
      return null;

    return (cast(GstVideoResampler*)this._cPtr).nTaps[0 .. (cast(GstVideoResampler*)this._cPtr).nPhases].dup;
  }

  /**
  Get `taps` field.
  Returns: the taps (copied), one row of maxTaps taps for each phase, or null if the resampler is not initialized
  */
  @property double[][] taps() nothrow
  {
    auto resampler = cast(GstVideoResampler*)this._cPtr;

    if (!resampler.taps || resampler.nPhases == 0 || resampler.maxTaps == 0)
      return null;

    auto _retval = new double[][](resampler.nPhases);

    foreach (i, ref row; _retval)
      row = resampler.taps[i * resampler.maxTaps .. (i + 1) * resampler.maxTaps].dup;

    return _retval;
  }

  /**
  Clear a previously initialized #GstVideoResampler resampler. The arrays are freed and their fields are reset, so
  the resampler can be initialized again.
  */
  void clear() nothrow
  {
    auto resampler = cast(GstVideoResampler*)this._cPtr;
    gst_video_resampler_clear(resampler);
    resampler.offset = null;
    resampler.phase = null;
    resampler.nTaps = null;
    resampler.taps = null;
    resampler.outSize = 0;
    resampler.nPhases = 0;
    resampler.maxTaps = 0;
  }


  /** */
  bool init_(gstvideo.types.VideoResamplerMethod method, gstvideo.types.VideoResamplerFlags flags, uint nPhases, uint nTaps, double shift, uint inSize, uint outSize, gst.structure.Structure options) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_resampler_init(cast(GstVideoResampler*)this._cPtr, method, flags, nPhases, nTaps, shift, inSize, outSize, options ? cast(GstStructure*)options._cPtr(No.Dup) : null);
    return _retval;
  }
}
