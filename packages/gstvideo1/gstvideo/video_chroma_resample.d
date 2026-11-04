/// Module for [VideoChromaResample] class
module gstvideo.video_chroma_resample;

public import gid.basictypes;
import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/** */
class VideoChromaResample : OpaqueWrap!(GstVideoChromaResample*, void, void)
{

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
