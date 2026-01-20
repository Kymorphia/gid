/// Module for [VideoAffineTransformationMeta] class
module gstvideo.video_affine_transformation_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata for performing an affine transformation using a 4x4
    matrix. The transformation matrix can be composed with
    [gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta.applyMatrix].
    
    The vertices operated on are all in the range 0 to 1, not in
    Normalized Device Coordinates (-1 to +1). Transforming points in this space
    are assumed to have an origin at (0.5, 0.5, 0.5) in a left-handed coordinate
    system with the x-axis moving horizontally (positive values to the right),
    the y-axis moving vertically (positive values up the screen) and the z-axis
    perpendicular to the screen (positive values into the screen).
*/
class VideoAffineTransformationMeta
{
  GstVideoAffineTransformationMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_affine_transformation_meta.VideoAffineTransformationMeta");

    _cInstance = *cast(GstVideoAffineTransformationMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoAffineTransformationMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Apply a transformation using the given 4x4 transformation matrix.
      Performs the multiplication, meta->matrix X matrix.
  
      Params:
        matrix = a 4x4 transformation matrix to be applied
  */
  void applyMatrix(float[] matrix)
  {
    assert(!matrix || matrix.length == 16);
    auto _matrix = cast(const(float)*)matrix.ptr;
    gst_video_affine_transformation_meta_apply_matrix(cast(GstVideoAffineTransformationMeta*)this._cPtr, _matrix);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_affine_transformation_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
