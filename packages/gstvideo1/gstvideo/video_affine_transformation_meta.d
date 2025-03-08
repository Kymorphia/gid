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
  GstVideoAffineTransformationMeta cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoAffineTransformationMeta");

    cInstance = *cast(GstVideoAffineTransformationMeta*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoAffineTransformationMeta*)cPtr).meta);
  }

  /**
      Apply a transformation using the given 4x4 transformation matrix.
    Performs the multiplication, meta->matrix X matrix.
    Params:
      matrix =       a 4x4 transformation matrix to be applied
  */
  void applyMatrix(float[] matrix)
  {
    assert(!matrix || matrix.length == 16);
    auto _matrix = cast(const(float)*)matrix.ptr;
    gst_video_affine_transformation_meta_apply_matrix(cast(GstVideoAffineTransformationMeta*)cPtr, _matrix);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_affine_transformation_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
