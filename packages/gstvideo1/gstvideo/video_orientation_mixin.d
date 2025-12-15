/// Module for [VideoOrientation] interface mixin
module gstvideo.video_orientation_mixin;

public import gstvideo.video_orientation_iface_proxy;
public import gid.gid;
public import gst.tag_list;
public import gstvideo.c.functions;
public import gstvideo.c.types;
public import gstvideo.types;

/**
    The interface allows unified access to control flipping and autocenter
    operation of video-sources or operators.
*/
template VideoOrientationT()
{


  /**
      Get the horizontal centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  override bool getHcenter(out int center)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_get_hcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the horizontal flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  override bool getHflip(out bool flip)
  {
    bool _retval;
    gboolean _flip;
    _retval = cast(bool)gst_video_orientation_get_hflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Get the vertical centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  override bool getVcenter(out int center)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_get_vcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the vertical flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  override bool getVflip(out bool flip)
  {
    bool _retval;
    gboolean _flip;
    _retval = cast(bool)gst_video_orientation_get_vflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Set the horizontal centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  override bool setHcenter(int center)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_hcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the horizontal flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  override bool setHflip(bool flip)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_hflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }

  /**
      Set the vertical centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  override bool setVcenter(int center)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_vcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the vertical flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  override bool setVflip(bool flip)
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_vflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }
}
