/// Module for [Transform] class
module gsk.transform;

import gid.gid;
import glib.string_;
import gobject.boxed;
import graphene.matrix;
import graphene.point3_d;
import graphene.point;
import graphene.rect;
import graphene.vec3;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    [gsk.transform.Transform] is an object to describe transform matrices.
    
    Unlike [graphene.matrix.Matrix], [gsk.transform.Transform] retains the steps in how
    a transform was constructed, and allows inspecting them. It is modeled
    after the way CSS describes transforms.
    
    [gsk.transform.Transform] objects are immutable and cannot be changed after creation.
    This means code can safely expose them as properties of objects without
    having to worry about others changing them.
*/
class Transform : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_transform_get_type != &gidSymbolNotFound ? gsk_transform_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Transform self()
  {
    return this;
  }

  /** */
  this()
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_new();
    this(_cretval, Yes.Take);
  }

  /**
      Checks two transforms for equality.
  
      Params:
        second = the second transform
      Returns: true if the two transforms perform the same operation
  */
  bool equal(gsk.transform.Transform second = null)
  {
    bool _retval;
    _retval = cast(bool)gsk_transform_equal(cast(GskTransform*)this._cPtr, second ? cast(GskTransform*)second._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the category this transform belongs to.
      Returns: The category of the transform
  */
  gsk.types.TransformCategory getCategory()
  {
    GskTransformCategory _cretval;
    _cretval = gsk_transform_get_category(cast(GskTransform*)this._cPtr);
    gsk.types.TransformCategory _retval = cast(gsk.types.TransformCategory)_cretval;
    return _retval;
  }

  /**
      Inverts the given transform.
      
      If self is not invertible, null is returned.
      Note that inverting null also returns null, which is
      the correct inverse of null. If you need to differentiate
      between those cases, you should check self is not null
      before calling this function.
      Returns: The inverted transform
  */
  gsk.transform.Transform invert()
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_invert(cast(GskTransform*)this._cPtr);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Multiplies next with the given matrix.
  
      Params:
        matrix = the matrix to multiply next with
      Returns: The new transform
  */
  gsk.transform.Transform matrix(graphene.matrix.Matrix matrix)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_matrix(cast(GskTransform*)this._cPtr, matrix ? cast(const(graphene_matrix_t)*)matrix._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Applies a perspective projection transform.
      
      This transform scales points in X and Y based on their Z value,
      scaling points with positive Z values away from the origin, and
      those with negative Z values towards the origin. Points
      on the z=0 plane are unchanged.
  
      Params:
        depth = distance of the z=0 plane. Lower values give a more
            flattened pyramid and therefore a more pronounced
            perspective effect.
      Returns: The new transform
  */
  gsk.transform.Transform perspective(float depth)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_perspective(cast(GskTransform*)this._cPtr, depth);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Converts self into a human-readable string representation suitable
      for printing.
      
      The result of this function can later be parsed with
      [gsk.transform.Transform.parse].
  
      Params:
        string_ = The string to print into
  */
  void print(glib.string_.String string_)
  {
    gsk_transform_print(cast(GskTransform*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Rotates next angle degrees in 2D - or in 3D-speak, around the Z axis.
      The rotation happens around the origin point of (0, 0).
  
      Params:
        angle = the rotation angle, in degrees (clockwise)
      Returns: The new transform
  */
  gsk.transform.Transform rotate(float angle)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_rotate(cast(GskTransform*)this._cPtr, angle);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Rotates next angle degrees around axis.
      
      For a rotation in 2D space, use [gsk.transform.Transform.rotate]
  
      Params:
        angle = the rotation angle, in degrees (clockwise)
        axis = The rotation axis
      Returns: The new transform
  */
  gsk.transform.Transform rotate3d(float angle, graphene.vec3.Vec3 axis)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_rotate_3d(cast(GskTransform*)this._cPtr, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Scales next in 2-dimensional space by the given factors.
      
      Use [gsk.transform.Transform.scale3d] to scale in all 3 dimensions.
  
      Params:
        factorX = scaling factor on the X axis
        factorY = scaling factor on the Y axis
      Returns: The new transform
  */
  gsk.transform.Transform scale(float factorX, float factorY)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_scale(cast(GskTransform*)this._cPtr, factorX, factorY);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Scales next by the given factors.
  
      Params:
        factorX = scaling factor on the X axis
        factorY = scaling factor on the Y axis
        factorZ = scaling factor on the Z axis
      Returns: The new transform
  */
  gsk.transform.Transform scale3d(float factorX, float factorY, float factorZ)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_scale_3d(cast(GskTransform*)this._cPtr, factorX, factorY, factorZ);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Applies a skew transform.
  
      Params:
        skewX = skew factor, in degrees, on the X axis
        skewY = skew factor, in degrees, on the Y axis
      Returns: The new transform
  */
  gsk.transform.Transform skew(float skewX, float skewY)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_skew(cast(GskTransform*)this._cPtr, skewX, skewY);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Converts a [gsk.transform.Transform] to a 2D transformation matrix.
      
      self must be a 2D transformation. If you are not
      sure, use [gsk.transform.Transform.getCategory] >=
      [gsk.types.TransformCategory._2d] to check.
      
      The returned values have the following layout:
      
      ```
        | xx yx |   |  a  b  0 |
        | xy yy | = |  c  d  0 |
        | dx dy |   | tx ty  1 |
      ```
      
      This function can be used to convert between a [gsk.transform.Transform]
      and a matrix type from other 2D drawing libraries, in particular
      Cairo.
  
      Params:
        outXx = return location for the xx member
        outYx = return location for the yx member
        outXy = return location for the xy member
        outYy = return location for the yy member
        outDx = return location for the x0 member
        outDy = return location for the y0 member
  */
  void to2d(out float outXx, out float outYx, out float outXy, out float outYy, out float outDx, out float outDy)
  {
    gsk_transform_to_2d(cast(GskTransform*)this._cPtr, cast(float*)&outXx, cast(float*)&outYx, cast(float*)&outXy, cast(float*)&outYy, cast(float*)&outDx, cast(float*)&outDy);
  }

  /**
      Converts a [gsk.transform.Transform] to 2D transformation factors.
      
      To recreate an equivalent transform from the factors returned
      by this function, use
      
          gsk_transform_skew (
              gsk_transform_scale (
                  gsk_transform_rotate (
                      gsk_transform_translate (NULL, &GRAPHENE_POINT_T (dx, dy)),
                      angle),
                  scale_x, scale_y),
              skew_x, skew_y)
      
      self must be a 2D transformation. If you are not sure, use
      
          [gsk.transform.Transform.getCategory] >= [gsk.types.TransformCategory._2d]
      
      to check.
  
      Params:
        outSkewX = return location for the skew factor
            in the  x direction
        outSkewY = return location for the skew factor
            in the  y direction
        outScaleX = return location for the scale
            factor in the x direction
        outScaleY = return location for the scale
            factor in the y direction
        outAngle = return location for the rotation angle
        outDx = return location for the translation
            in the x direction
        outDy = return location for the translation
            in the y direction
  */
  void to2dComponents(out float outSkewX, out float outSkewY, out float outScaleX, out float outScaleY, out float outAngle, out float outDx, out float outDy)
  {
    gsk_transform_to_2d_components(cast(GskTransform*)this._cPtr, cast(float*)&outSkewX, cast(float*)&outSkewY, cast(float*)&outScaleX, cast(float*)&outScaleY, cast(float*)&outAngle, cast(float*)&outDx, cast(float*)&outDy);
  }

  /**
      Converts a [gsk.transform.Transform] to 2D affine transformation factors.
      
      To recreate an equivalent transform from the factors returned
      by this function, use
      
          gsk_transform_scale (gsk_transform_translate (NULL,
                                                        &GRAPHENE_POINT_T (dx, dy)),
                               sx, sy)
      
      self must be a 2D affine transformation. If you are not
      sure, use
      
          [gsk.transform.Transform.getCategory] >= [gsk.types.TransformCategory._2dAffine]
      
      to check.
  
      Params:
        outScaleX = return location for the scale
            factor in the x direction
        outScaleY = return location for the scale
            factor in the y direction
        outDx = return location for the translation
            in the x direction
        outDy = return location for the translation
            in the y direction
  */
  void toAffine(out float outScaleX, out float outScaleY, out float outDx, out float outDy)
  {
    gsk_transform_to_affine(cast(GskTransform*)this._cPtr, cast(float*)&outScaleX, cast(float*)&outScaleY, cast(float*)&outDx, cast(float*)&outDy);
  }

  /**
      Computes the actual value of self and stores it in out_matrix.
      
      The previous value of out_matrix will be ignored.
  
      Params:
        outMatrix = The matrix to set
  */
  void toMatrix(out graphene.matrix.Matrix outMatrix)
  {
    graphene_matrix_t _outMatrix;
    gsk_transform_to_matrix(cast(GskTransform*)this._cPtr, &_outMatrix);
    outMatrix = new graphene.matrix.Matrix(cast(void*)&_outMatrix, No.Take);
  }

  /**
      Converts a matrix into a string that is suitable for printing.
      
      The resulting string can be parsed with [gsk.transform.Transform.parse].
      
      This is a wrapper around [gsk.transform.Transform.print].
      Returns: A new string for self
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gsk_transform_to_string(cast(GskTransform*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Converts a [gsk.transform.Transform] to a translation operation.
      
      self must be a 2D transformation. If you are not
      sure, use
      
          [gsk.transform.Transform.getCategory] >= [gsk.types.TransformCategory._2dTranslate]
      
      to check.
  
      Params:
        outDx = return location for the translation
            in the x direction
        outDy = return location for the translation
            in the y direction
  */
  void toTranslate(out float outDx, out float outDy)
  {
    gsk_transform_to_translate(cast(GskTransform*)this._cPtr, cast(float*)&outDx, cast(float*)&outDy);
  }

  /**
      Applies all the operations from other to next.
  
      Params:
        other = Transform to apply
      Returns: The new transform
  */
  gsk.transform.Transform transform(gsk.transform.Transform other = null)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_transform(cast(GskTransform*)this._cPtr, other ? cast(GskTransform*)other._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Transforms a [graphene.rect.Rect] using the given transform self.
      
      The result is the bounding box containing the coplanar quad.
  
      Params:
        rect = a [graphene.rect.Rect]
        outRect = return location for the bounds
            of the transformed rectangle
  */
  void transformBounds(graphene.rect.Rect rect, out graphene.rect.Rect outRect)
  {
    graphene_rect_t _outRect;
    gsk_transform_transform_bounds(cast(GskTransform*)this._cPtr, rect ? cast(const(graphene_rect_t)*)rect._cPtr(No.Dup) : null, &_outRect);
    outRect = new graphene.rect.Rect(cast(void*)&_outRect, No.Take);
  }

  /**
      Transforms a [graphene.point.Point] using the given transform self.
  
      Params:
        point = a [graphene.point.Point]
        outPoint = return location for
            the transformed point
  */
  void transformPoint(graphene.point.Point point, out graphene.point.Point outPoint)
  {
    graphene_point_t _outPoint;
    gsk_transform_transform_point(cast(GskTransform*)this._cPtr, point ? cast(const(graphene_point_t)*)point._cPtr(No.Dup) : null, &_outPoint);
    outPoint = new graphene.point.Point(cast(void*)&_outPoint, No.Take);
  }

  /**
      Translates next in 2-dimensional space by point.
  
      Params:
        point = the point to translate the transform by
      Returns: The new transform
  */
  gsk.transform.Transform translate(graphene.point.Point point)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_translate(cast(GskTransform*)this._cPtr, point ? cast(const(graphene_point_t)*)point._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Translates next by point.
  
      Params:
        point = the point to translate the transform by
      Returns: The new transform
  */
  gsk.transform.Transform translate3d(graphene.point3_d.Point3D point)
  {
    GskTransform* _cretval;
    _cretval = gsk_transform_translate_3d(cast(GskTransform*)this._cPtr, point ? cast(const(graphene_point3d_t)*)point._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gsk.transform.Transform(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses the given string into a transform and puts it in
      out_transform.
      
      Strings printed via [gsk.transform.Transform.toString_]
      can be read in again successfully using this function.
      
      If string does not describe a valid transform, false is
      returned and null is put in out_transform.
  
      Params:
        string_ = the string to parse
        outTransform = The location to put the transform in
      Returns: true if string described a valid transform.
  */
  static bool parse(string string_, out gsk.transform.Transform outTransform)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    GskTransform* _outTransform;
    _retval = cast(bool)gsk_transform_parse(_string_, &_outTransform);
    outTransform = new gsk.transform.Transform(cast(void*)_outTransform, Yes.Take);
    return _retval;
  }
}
