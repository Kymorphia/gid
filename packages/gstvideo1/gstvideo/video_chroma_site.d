/// Module for [VideoChromaSite] flags namespace
module gstvideo.video_chroma_site;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoChromaSite] flags
struct VideoChromaSite
{
  alias Enum = gstvideo.types.VideoChromaSite; ///

  /**
      Convert `s` to a #GstVideoChromaSite
  
      Params:
        s = a chromasite string
      Returns: a #GstVideoChromaSite or [gstvideo.types.VideoChromaSite.Unknown] when `s` does
        not contain a valid chroma-site description.
  */
  static gstvideo.types.VideoChromaSite fromString(string s) nothrow
  {
    GstVideoChromaSite _cretval;
    const(char)* _s = s.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_video_chroma_site_from_string(_s);
    gstvideo.types.VideoChromaSite _retval = cast(gstvideo.types.VideoChromaSite)_cretval;
    return _retval;
  }

  /**
      Converts site to its string representation.
  
      Params:
        site = a #GstVideoChromaSite
      Returns: a string representation of site
                 or null if site contains undefined value or
                 is equal to [gstvideo.types.VideoChromaSite.Unknown]
  */
  static string toString_(gstvideo.types.VideoChromaSite site) nothrow
  {
    char* _cretval;
    _cretval = gst_video_chroma_site_to_string(site);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
