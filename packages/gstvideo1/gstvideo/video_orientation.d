/// Module for [VideoOrientation] interface
module gstvideo.video_orientation;

public import gstvideo.video_orientation_iface_proxy;
import gid.gid;
import gst.tag_list;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    The interface allows unified access to control flipping and autocenter
    operation of video-sources or operators.
*/
interface VideoOrientation
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_video_orientation_get_type != &gidSymbolNotFound ? gst_video_orientation_get_type() : cast(GType)0;
  }

  /**
      Parses the "image-orientation" tag and transforms it into the
      #GstVideoOrientationMethod enum.
  
      Params:
        taglist = A #GstTagList
        method = The location where to return the orientation.
      Returns: TRUE if there was a valid "image-orientation" tag in the taglist.
  */
  static bool fromTag(gst.tag_list.TagList taglist, out gstvideo.types.VideoOrientationMethod method)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_from_tag(taglist ? cast(GstTagList*)taglist._cPtr(No.Dup) : null, &method);
    return _retval;
  }

  /**
      Get the horizontal centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  bool getHcenter(out int center);

  /**
      Get the horizontal flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  bool getHflip(out bool flip);

  /**
      Get the vertical centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  bool getVcenter(out int center);

  /**
      Get the vertical flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  bool getVflip(out bool flip);

  /**
      Set the horizontal centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  bool setHcenter(int center);

  /**
      Set the horizontal flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  bool setHflip(bool flip);

  /**
      Set the vertical centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  bool setVcenter(int center);

  /**
      Set the vertical flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  bool setVflip(bool flip);
}
