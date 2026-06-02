/// Module for [VideoChromaResample] class
module gstvideo.video_chroma_resample;

public import gid.basictypes;
import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/** */
class VideoChromaResample
{
  GstVideoChromaResample* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(GstVideoChromaResample*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      The resampler must be fed n_lines at a time. The first line should be
      at offset.
  
      Params:
        nLines = the number of input lines
        offset = the first line
  */
  void getInfo(out uint nLines, out int offset) nothrow
  {
    gst_video_chroma_resample_get_info(cast(GstVideoChromaResample*)this._cPtr, cast(uint*)&nLines, cast(int*)&offset);
  }
}
