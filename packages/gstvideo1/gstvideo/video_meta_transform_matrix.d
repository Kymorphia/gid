/// Module for [VideoMetaTransformMatrix] class
module gstvideo.video_meta_transform_matrix;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_info;

/**
    Extra data passed to a video transform #GstMetaTransformFunction such as:
    "gst-video-matrix".
    
    The matrix represents a transformation that is applied to the content of
    @in_rectangle, and its output is put inside @out_rectangle. The coordinate
    system has it's (0, 0) in the top-left corner of the rectangles and
    goes down and right from there..
    
    It's a programming error to have a singular matrix.
*/
class VideoMetaTransformMatrix : StructWrap!(GstVideoMetaTransformMatrix)
{
  /**
      Create a `video_meta_transform_matrix.VideoMetaTransformMatrix` wrap type.
      Params:
        inInfo = the input #GstVideoInfo
        inRectangle = the input #GstVideoRectangle
        outInfo = the output #GstVideoInfo
        outRectangle = the output #GstVideoRectangle
        matrix = a 3x3 matrix representing an homographic transformation
  */
  this(gstvideo.video_info.VideoInfo inInfo = gstvideo.video_info.VideoInfo.init, gstvideo.types.VideoRectangle inRectangle = gstvideo.types.VideoRectangle.init, gstvideo.video_info.VideoInfo outInfo = gstvideo.video_info.VideoInfo.init, gstvideo.types.VideoRectangle outRectangle = gstvideo.types.VideoRectangle.init, float[9] matrix = (float[9]).init) nothrow
  {
    this.inInfo = inInfo;
    this.inRectangle = inRectangle;
    this.outInfo = outInfo;
    this.outRectangle = outRectangle;
    this.matrix = matrix;
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

  private gstvideo.video_info.VideoInfo _inInfoRef; // Keeps borrowed field value alive

  /**
      Get `inInfo` field.
      Returns: the input #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo inInfo() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransformMatrix*)this._cPtr).inInfo);
  }

  /**
      Set `inInfo` field.
      Params:
        propval = the input #GstVideoInfo
  */
  @property void inInfo(gstvideo.video_info.VideoInfo propval) nothrow
  {
    if (_refuseBorrowedStore("inInfo"))
      return;

    _inInfoRef = propval;
    (cast(GstVideoMetaTransformMatrix*)this._cPtr).inInfo = propval ? cast(const(GstVideoInfo)*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `inRectangle` field.
      Returns: the input #GstVideoRectangle
  */
  @property gstvideo.types.VideoRectangle inRectangle() nothrow
  {
    return cToD!(gstvideo.types.VideoRectangle)(cast(void*)&(cast(GstVideoMetaTransformMatrix*)this._cPtr).inRectangle);
  }

  /**
      Set `inRectangle` field.
      Params:
        propval = the input #GstVideoRectangle
  */
  @property void inRectangle(gstvideo.types.VideoRectangle propval) nothrow
  {
    (cast(GstVideoMetaTransformMatrix*)this._cPtr).inRectangle = cast(GstVideoRectangle)propval;
  }

  private gstvideo.video_info.VideoInfo _outInfoRef; // Keeps borrowed field value alive

  /**
      Get `outInfo` field.
      Returns: the output #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo outInfo() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransformMatrix*)this._cPtr).outInfo);
  }

  /**
      Set `outInfo` field.
      Params:
        propval = the output #GstVideoInfo
  */
  @property void outInfo(gstvideo.video_info.VideoInfo propval) nothrow
  {
    if (_refuseBorrowedStore("outInfo"))
      return;

    _outInfoRef = propval;
    (cast(GstVideoMetaTransformMatrix*)this._cPtr).outInfo = propval ? cast(const(GstVideoInfo)*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `outRectangle` field.
      Returns: the output #GstVideoRectangle
  */
  @property gstvideo.types.VideoRectangle outRectangle() nothrow
  {
    return cToD!(gstvideo.types.VideoRectangle)(cast(void*)&(cast(GstVideoMetaTransformMatrix*)this._cPtr).outRectangle);
  }

  /**
      Set `outRectangle` field.
      Params:
        propval = the output #GstVideoRectangle
  */
  @property void outRectangle(gstvideo.types.VideoRectangle propval) nothrow
  {
    (cast(GstVideoMetaTransformMatrix*)this._cPtr).outRectangle = cast(GstVideoRectangle)propval;
  }

  /**
      Get `matrix` field.
      Returns: a 3x3 matrix representing an homographic transformation
  */
  @property float[9] matrix() nothrow
  {
    return *cast(float[9]*)&(cast(GstVideoMetaTransformMatrix*)this._cPtr).matrix;
  }

  /**
      Set `matrix` field.
      Params:
        propval = a 3x3 matrix representing an homographic transformation
  */
  @property void matrix(float[9] propval) nothrow
  {
    (cast(GstVideoMetaTransformMatrix*)this._cPtr).matrix = *cast(float[9]*)&propval;
  }

  /**
      Based on the rectangles, initializes the matrix to do a translation and
      scaling from in_rectangle to out_rectangle
  
      Params:
        inInfo = The #GstVideoInfo of the input image
        inRectangle = the input #GstVideoRectangle
        outInfo = the output #GstVideoInfo
        outRectangle = the output #GstVideoRectangle
  */
  void init_(gstvideo.video_info.VideoInfo inInfo, gstvideo.types.VideoRectangle inRectangle, gstvideo.video_info.VideoInfo outInfo, gstvideo.types.VideoRectangle outRectangle) nothrow
  {
    gst_video_meta_transform_matrix_init(cast(GstVideoMetaTransformMatrix*)this._cPtr, inInfo ? cast(const(GstVideoInfo)*)inInfo._cPtr(No.Dup) : null, cast(const(GstVideoRectangle)*)&inRectangle, outInfo ? cast(const(GstVideoInfo)*)outInfo._cPtr(No.Dup) : null, cast(const(GstVideoRectangle)*)&outRectangle);
  }

  /**
      Transforms the (`x`, `y`) point from the input coordinates to the
      output ones.  The point's coordinates are transformed by first
      applying the transform.matrix to it using the top left (x, y) of
      transform.in_rectangle as the origin, then translate it to use
      the top-left of transform.out_rectangle as new origin.
  
      Params:
        x = a non-NULL pointer to the X value of the coordinate
        y = a non-NULL pointer to the Y value of the coordinate
      Returns: false if the point is outside of transform.out_rectangle
        after the transformation has been applied
  */
  bool point(ref int x, ref int y) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_transform_matrix_point(cast(const(GstVideoMetaTransformMatrix)*)this._cPtr, cast(int*)&x, cast(int*)&y);
    return _retval;
  }

  /**
      Transforms the (`x`, `y`) point from the input coordinates to the
      output ones.  The point's coordinates are transformed by first
      applying the transform.matrix to it using the top left (x, y) of
      transform.in_rectangle as the origin, then translate it to use
      the top-left of transform.out_rectangle as new origin.
  
      Params:
        x = a non-NULL pointer to the X value of the coordinate
        y = a non-NULL pointer to the Y value of the coordinate
      Returns: false if the point is outside of transform.out_rectangle
        after the transformation has been applied
  */
  bool pointClipped(ref int x, ref int y) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_transform_matrix_point_clipped(cast(const(GstVideoMetaTransformMatrix)*)this._cPtr, cast(int*)&x, cast(int*)&y);
    return _retval;
  }

  /**
      Transforms rect from the input coordinates to the
      output ones.  The point's coordinates are transformed by first
      applying the transform.matrix to it using the top left (x, y) of
      transform.in_rectangle as the origin, then translate it to use
      the top-left of transform.out_rectangle as new origin.
      
      rect is always axis aligned at input and this function only returns
      axis aligned rectangles as output, otherwise it returns FALSE.
      
      Output rectangle could be in partially or totally outside of
      transform.out_rectangle.
  
      Params:
        rect = a rectangle in the coordinate of the original image
      Returns: false is the output rectangle is not axis aligned
  */
  bool rectangle(ref gstvideo.types.VideoRectangle rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_transform_matrix_rectangle(cast(const(GstVideoMetaTransformMatrix)*)this._cPtr, cast(GstVideoRectangle*)&rect);
    return _retval;
  }

  /**
      Transforms rect from the input coordinates to the
      output ones.  The point's coordinates are transformed by first
      applying the transform.matrix to it using the top left (x, y) of
      transform.in_rectangle as the origin, then translate it to use
      the top-left of transform.out_rectangle as new origin.
      
      rect is always axis aligned at input and this function only returns
      axis aligned rectangles as output, otherwise it returns FALSE.
      
      Output rectangle will be clipped to fit inside transform.out_rectangle.
  
      Params:
        rect = a rectangle in the coordinate of the original image
      Returns: false if the output rectangle is not axis aligned or if
         the rectangle is entirely outside of the out_rectangle.
  */
  bool rectangleClipped(ref gstvideo.types.VideoRectangle rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_transform_matrix_rectangle_clipped(cast(const(GstVideoMetaTransformMatrix)*)this._cPtr, cast(GstVideoRectangle*)&rect);
    return _retval;
  }

  /**
      Get the #GQuark for the "gst-video-matrix" metadata transform operation.
      Returns: a #GQuark
  */
  static glib.types.Quark getQuark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_video_meta_transform_matrix_get_quark();
    return _retval;
  }
}
