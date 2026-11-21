/// Module for [VideoChromaSite] flags namespace
module gid.gstvideo1.video_chroma_site;

import gid.core.gid;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoChromaSite] flags
struct VideoChromaSite
{
  alias Enum = gid.gstvideo1.types.VideoChromaSite; ///

  /**
      Convert `s` to a #GstVideoChromaSite
  
      Params:
        s = a chromasite string
      Returns: a #GstVideoChromaSite or [gid.gstvideo1.types.VideoChromaSite.Unknown] when `s` does
        not contain a valid chroma-site description.
  */
  static gid.gstvideo1.types.VideoChromaSite fromString(string s) nothrow
  {
    GstVideoChromaSite _cretval;
    const(char)* _s = s.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_video_chroma_site_from_string(_s);
    gid.gstvideo1.types.VideoChromaSite _retval = cast(gid.gstvideo1.types.VideoChromaSite)_cretval;
    return _retval;
  }

  /**
      Converts site to its string representation.
  
      Params:
        site = a #GstVideoChromaSite
      Returns: a string representation of site
                 or null if site contains undefined value or
                 is equal to [gid.gstvideo1.types.VideoChromaSite.Unknown]
  */
  static string toString_(gid.gstvideo1.types.VideoChromaSite site) nothrow
  {
    char* _cretval;
    _cretval = gst_video_chroma_site_to_string(site);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
