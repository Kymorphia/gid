/// Module for [Matrix] class
module graphene.matrix;

import gid.gid;
import gobject.boxed;
import graphene.box;
import graphene.c.functions;
import graphene.c.types;
import graphene.euler;
import graphene.point3_d;
import graphene.point;
import graphene.quad;
import graphene.quaternion;
import graphene.ray;
import graphene.rect;
import graphene.sphere;
import graphene.types;
import graphene.vec3;
import graphene.vec4;

/**
    A structure capable of holding a 4x4 matrix.
    
    The contents of the #graphene_matrix_t structure are private and
    should never be accessed directly.
*/
class Matrix : gobject.boxed.Boxed
{

  /**
      Create a `matrix.Matrix` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_matrix_t.sizeof), Yes.Take);
  }

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
    return cast(void function())graphene_matrix_get_type != &gidSymbolNotFound ? graphene_matrix_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Matrix self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_matrix_t.
      Returns: the newly allocated matrix
  */
  static graphene.matrix.Matrix alloc()
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_alloc();
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Decomposes a transformation matrix into its component transformations.
      
      The algorithm for decomposing a matrix is taken from the
      [CSS3 Transforms specification](http://dev.w3.org/csswg/css-transforms/);
      specifically, the decomposition code is based on the equivalent code
      published in "Graphics Gems II", edited by Jim Arvo, and
      [available online](http://web.archive.org/web/20150512160205/http://tog.acm.org/resources/GraphicsGems/gemsii/unmatrix.c).
  
      Params:
        translate = the translation vector
        scale = the scale vector
        rotate = the rotation quaternion
        shear = the shear vector
        perspective = the perspective vector
      Returns: `true` if the matrix could be decomposed
  */
  bool decompose(out graphene.vec3.Vec3 translate, out graphene.vec3.Vec3 scale, out graphene.quaternion.Quaternion rotate, out graphene.vec3.Vec3 shear, out graphene.vec4.Vec4 perspective)
  {
    bool _retval;
    graphene_vec3_t _translate;
    graphene_vec3_t _scale;
    graphene_quaternion_t _rotate;
    graphene_vec3_t _shear;
    graphene_vec4_t _perspective;
    _retval = cast(bool)graphene_matrix_decompose(cast(const(graphene_matrix_t)*)this._cPtr, &_translate, &_scale, &_rotate, &_shear, &_perspective);
    translate = new graphene.vec3.Vec3(cast(void*)&_translate, No.Take);
    scale = new graphene.vec3.Vec3(cast(void*)&_scale, No.Take);
    rotate = new graphene.quaternion.Quaternion(cast(void*)&_rotate, No.Take);
    shear = new graphene.vec3.Vec3(cast(void*)&_shear, No.Take);
    perspective = new graphene.vec4.Vec4(cast(void*)&_perspective, No.Take);
    return _retval;
  }

  /**
      Computes the determinant of the given matrix.
      Returns: the value of the determinant
  */
  float determinant()
  {
    float _retval;
    _retval = graphene_matrix_determinant(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_matrix_t matrices are equal.
  
      Params:
        b = a #graphene_matrix_t
      Returns: `true` if the two matrices are equal, and `false` otherwise
  */
  bool equal(graphene.matrix.Matrix b)
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_equal(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_matrix_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given #graphene_matrix_t matrices are
      byte-by-byte equal.
      
      While this function is faster than [graphene.matrix.Matrix.equal], it
      can also return false negatives, so it should be used in
      conjuction with either [graphene.matrix.Matrix.equal] or
      [graphene.matrix.Matrix.near]. For instance:
      
      ```c
        if (graphene_matrix_equal_fast (a, b))
          {
            // matrices are definitely the same
          }
        else
          {
            if (graphene_matrix_equal (a, b))
              // matrices contain the same values within an epsilon of FLT_EPSILON
            else if (graphene_matrix_near (a, b, 0.0001))
              // matrices contain the same values within an epsilon of 0.0001
            else
              // matrices are not equal
          }
      ```
  
      Params:
        b = a #graphene_matrix_t
      Returns: `true` if the matrices are equal. and `false` otherwise
  */
  bool equalFast(graphene.matrix.Matrix b)
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_equal_fast(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_matrix_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the given row vector at index_ inside a matrix.
  
      Params:
        index = the index of the row vector, between 0 and 3
        res = return location for the #graphene_vec4_t
            that is used to store the row vector
  */
  void getRow(uint index, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_matrix_get_row(cast(const(graphene_matrix_t)*)this._cPtr, index, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Retrieves the value at the given row and col index.
  
      Params:
        row = the row index
        col = the column index
      Returns: the value at the given indices
  */
  float getValue(uint row, uint col)
  {
    float _retval;
    _retval = graphene_matrix_get_value(cast(const(graphene_matrix_t)*)this._cPtr, row, col);
    return _retval;
  }

  /**
      Retrieves the scaling factor on the X axis in `m`.
      Returns: the value of the scaling factor
  */
  float getXScale()
  {
    float _retval;
    _retval = graphene_matrix_get_x_scale(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the translation component on the X axis from `m`.
      Returns: the translation component
  */
  float getXTranslation()
  {
    float _retval;
    _retval = graphene_matrix_get_x_translation(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the scaling factor on the Y axis in `m`.
      Returns: the value of the scaling factor
  */
  float getYScale()
  {
    float _retval;
    _retval = graphene_matrix_get_y_scale(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the translation component on the Y axis from `m`.
      Returns: the translation component
  */
  float getYTranslation()
  {
    float _retval;
    _retval = graphene_matrix_get_y_translation(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the scaling factor on the Z axis in `m`.
      Returns: the value of the scaling factor
  */
  float getZScale()
  {
    float _retval;
    _retval = graphene_matrix_get_z_scale(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the translation component on the Z axis from `m`.
      Returns: the translation component
  */
  float getZTranslation()
  {
    float _retval;
    _retval = graphene_matrix_get_z_translation(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t from the values of an affine
      transformation matrix.
      
      The arguments map to the following matrix layout:
      
      ```plain
        ⎛ xx  yx ⎞   ⎛  a   b  0 ⎞
        ⎜ xy  yy ⎟ = ⎜  c   d  0 ⎟
        ⎝ x0  y0 ⎠   ⎝ tx  ty  1 ⎠
      ```
      
      This function can be used to convert between an affine matrix type
      from other libraries and a #graphene_matrix_t.
  
      Params:
        xx = the xx member
        yx = the yx member
        xy = the xy member
        yy = the yy member
        x0 = the x0 member
        y0 = the y0 member
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initFrom2d(double xx, double yx, double xy, double yy, double x0, double y0)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_from_2d(cast(graphene_matrix_t*)this._cPtr, xx, yx, xy, yy, x0, y0);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with the given array of floating
      point values.
  
      Params:
        v = an array of at least 16 floating
            point values
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initFromFloat(float[] v)
  {
    graphene_matrix_t* _cretval;
    assert(!v || v.length == 16);
    auto _v = cast(const(float)*)v.ptr;
    _cretval = graphene_matrix_init_from_float(cast(graphene_matrix_t*)this._cPtr, _v);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t using the values of the
      given matrix.
  
      Params:
        src = a #graphene_matrix_t
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initFromMatrix(graphene.matrix.Matrix src)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_from_matrix(cast(graphene_matrix_t*)this._cPtr, src ? cast(const(graphene_matrix_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with the given four row
      vectors.
  
      Params:
        v0 = the first row vector
        v1 = the second row vector
        v2 = the third row vector
        v3 = the fourth row vector
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initFromVec4(graphene.vec4.Vec4 v0, graphene.vec4.Vec4 v1, graphene.vec4.Vec4 v2, graphene.vec4.Vec4 v3)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_from_vec4(cast(graphene_matrix_t*)this._cPtr, v0 ? cast(const(graphene_vec4_t)*)v0._cPtr(No.Dup) : null, v1 ? cast(const(graphene_vec4_t)*)v1._cPtr(No.Dup) : null, v2 ? cast(const(graphene_vec4_t)*)v2._cPtr(No.Dup) : null, v3 ? cast(const(graphene_vec4_t)*)v3._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t compatible with #graphene_frustum_t.
      
      See also: [graphene.frustum.Frustum.initFromMatrix]
  
      Params:
        left = distance of the left clipping plane
        right = distance of the right clipping plane
        bottom = distance of the bottom clipping plane
        top = distance of the top clipping plane
        zNear = distance of the near clipping plane
        zFar = distance of the far clipping plane
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initFrustum(float left, float right, float bottom, float top, float zNear, float zFar)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_frustum(cast(graphene_matrix_t*)this._cPtr, left, right, bottom, top, zNear, zFar);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with the identity matrix.
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initIdentity()
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_identity(cast(graphene_matrix_t*)this._cPtr);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t so that it positions the "camera"
      at the given eye coordinates towards an object at the center
      coordinates. The top of the camera is aligned to the direction
      of the up vector.
      
      Before the transform, the camera is assumed to be placed at the
      origin, looking towards the negative Z axis, with the top side of
      the camera facing in the direction of the Y axis and the right
      side in the direction of the X axis.
      
      In theory, one could use `m` to transform a model of such a camera
      into world-space. However, it is more common to use the inverse of
      `m` to transform another object from world coordinates to the view
      coordinates of the camera. Typically you would then apply the
      camera projection transform to get from view to screen
      coordinates.
  
      Params:
        eye = the vector describing the position to look from
        center = the vector describing the position to look at
        up = the vector describing the world's upward direction; usually,
            this is the [graphene.vec3.Vec3.yAxis] vector
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initLookAt(graphene.vec3.Vec3 eye, graphene.vec3.Vec3 center, graphene.vec3.Vec3 up)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_look_at(cast(graphene_matrix_t*)this._cPtr, eye ? cast(const(graphene_vec3_t)*)eye._cPtr(No.Dup) : null, center ? cast(const(graphene_vec3_t)*)center._cPtr(No.Dup) : null, up ? cast(const(graphene_vec3_t)*)up._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with an orthographic projection.
  
      Params:
        left = the left edge of the clipping plane
        right = the right edge of the clipping plane
        top = the top edge of the clipping plane
        bottom = the bottom edge of the clipping plane
        zNear = the distance of the near clipping plane
        zFar = the distance of the far clipping plane
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initOrtho(float left, float right, float top, float bottom, float zNear, float zFar)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_ortho(cast(graphene_matrix_t*)this._cPtr, left, right, top, bottom, zNear, zFar);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with a perspective projection.
  
      Params:
        fovy = the field of view angle, in degrees
        aspect = the aspect value
        zNear = the near Z plane
        zFar = the far Z plane
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initPerspective(float fovy, float aspect, float zNear, float zFar)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_perspective(cast(graphene_matrix_t*)this._cPtr, fovy, aspect, zNear, zFar);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes `m` to represent a rotation of angle degrees on
      the axis represented by the axis vector.
  
      Params:
        angle = the rotation angle, in degrees
        axis = the axis vector as a #graphene_vec3_t
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initRotate(float angle, graphene.vec3.Vec3 axis)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_rotate(cast(graphene_matrix_t*)this._cPtr, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with the given scaling factors.
  
      Params:
        x = the scale factor on the X axis
        y = the scale factor on the Y axis
        z = the scale factor on the Z axis
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initScale(float x, float y, float z)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_scale(cast(graphene_matrix_t*)this._cPtr, x, y, z);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with a skew transformation
      with the given factors.
  
      Params:
        xSkew = skew factor, in radians, on the X axis
        ySkew = skew factor, in radians, on the Y axis
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initSkew(float xSkew, float ySkew)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_skew(cast(graphene_matrix_t*)this._cPtr, xSkew, ySkew);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_matrix_t with a translation to the
      given coordinates.
  
      Params:
        p = the translation coordinates
      Returns: the initialized matrix
  */
  graphene.matrix.Matrix initTranslate(graphene.point3_d.Point3D p)
  {
    graphene_matrix_t* _cretval;
    _cretval = graphene_matrix_init_translate(cast(graphene_matrix_t*)this._cPtr, p ? cast(const(graphene_point3d_t)*)p._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Linearly interpolates the two given #graphene_matrix_t by
      interpolating the decomposed transformations separately.
      
      If either matrix cannot be reduced to their transformations
      then the interpolation cannot be performed, and this function
      will return an identity matrix.
  
      Params:
        b = a #graphene_matrix_t
        factor = the linear interpolation factor
        res = return location for the
            interpolated matrix
  */
  void interpolate(graphene.matrix.Matrix b, double factor, out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_matrix_interpolate(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_matrix_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Inverts the given matrix.
  
      Params:
        res = return location for the
            inverse matrix
      Returns: `true` if the matrix is invertible
  */
  bool inverse(out graphene.matrix.Matrix res)
  {
    bool _retval;
    graphene_matrix_t _res;
    _retval = cast(bool)graphene_matrix_inverse(cast(const(graphene_matrix_t)*)this._cPtr, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
    return _retval;
  }

  /**
      Checks whether the given #graphene_matrix_t is compatible with an
      a 2D affine transformation matrix.
      Returns: `true` if the matrix is compatible with an affine
          transformation matrix
  */
  bool is2d()
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_is_2d(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether a #graphene_matrix_t has a visible back face.
      Returns: `true` if the back face of the matrix is visible
  */
  bool isBackfaceVisible()
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_is_backface_visible(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the given #graphene_matrix_t is the identity matrix.
      Returns: `true` if the matrix is the identity matrix
  */
  bool isIdentity()
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_is_identity(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether a matrix is singular.
      Returns: `true` if the matrix is singular
  */
  bool isSingular()
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_is_singular(cast(const(graphene_matrix_t)*)this._cPtr);
    return _retval;
  }

  /**
      Multiplies two #graphene_matrix_t.
      
      Matrix multiplication is not commutative in general; the order of the factors matters.
      The product of this multiplication is (`a` × `b`)
  
      Params:
        b = a #graphene_matrix_t
        res = return location for the matrix
            result
  */
  void multiply(graphene.matrix.Matrix b, out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_matrix_multiply(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_matrix_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Compares the two given #graphene_matrix_t matrices and checks
      whether their values are within the given epsilon of each
      other.
  
      Params:
        b = a #graphene_matrix_t
        epsilon = the threshold between the two matrices
      Returns: `true` if the two matrices are near each other, and
          `false` otherwise
  */
  bool near(graphene.matrix.Matrix b, float epsilon)
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_near(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_matrix_t)*)b._cPtr(No.Dup) : null, epsilon);
    return _retval;
  }

  /**
      Normalizes the given #graphene_matrix_t.
  
      Params:
        res = return location for the normalized matrix
  */
  void normalize(out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_matrix_normalize(cast(const(graphene_matrix_t)*)this._cPtr, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Applies a perspective of depth to the matrix.
  
      Params:
        depth = the depth of the perspective
        res = return location for the
            perspective matrix
  */
  void perspective(float depth, out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_matrix_perspective(cast(const(graphene_matrix_t)*)this._cPtr, depth, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Prints the contents of a matrix to the standard error stream.
      
      This function is only useful for debugging; there are no guarantees
      made on the format of the output.
  */
  void print()
  {
    graphene_matrix_print(cast(const(graphene_matrix_t)*)this._cPtr);
  }

  /**
      Projects a #graphene_point_t using the matrix `m`.
  
      Params:
        p = a #graphene_point_t
        res = return location for the projected
            point
  */
  void projectPoint(graphene.point.Point p, out graphene.point.Point res)
  {
    graphene_point_t _res;
    graphene_matrix_project_point(cast(const(graphene_matrix_t)*)this._cPtr, p ? cast(const(graphene_point_t)*)p._cPtr(No.Dup) : null, &_res);
    res = new graphene.point.Point(cast(void*)&_res, No.Take);
  }

  /**
      Projects all corners of a #graphene_rect_t using the given matrix.
      
      See also: [graphene.matrix.Matrix.projectPoint]
  
      Params:
        r = a #graphene_rect_t
        res = return location for the projected
            rectangle
  */
  void projectRect(graphene.rect.Rect r, out graphene.quad.Quad res)
  {
    graphene_quad_t _res;
    graphene_matrix_project_rect(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null, &_res);
    res = new graphene.quad.Quad(cast(void*)&_res, No.Take);
  }

  /**
      Projects a #graphene_rect_t using the given matrix.
      
      The resulting rectangle is the axis aligned bounding rectangle capable
      of fully containing the projected rectangle.
  
      Params:
        r = a #graphene_rect_t
        res = return location for the projected
            rectangle
  */
  void projectRectBounds(graphene.rect.Rect r, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_matrix_project_rect_bounds(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Adds a rotation transformation to `m`, using the given angle
      and axis vector.
      
      This is the equivalent of calling [graphene.matrix.Matrix.initRotate] and
      then multiplying the matrix `m` with the rotation matrix.
  
      Params:
        angle = the rotation angle, in degrees
        axis = the rotation axis, as a #graphene_vec3_t
  */
  void rotate(float angle, graphene.vec3.Vec3 axis)
  {
    graphene_matrix_rotate(cast(graphene_matrix_t*)this._cPtr, angle, axis ? cast(const(graphene_vec3_t)*)axis._cPtr(No.Dup) : null);
  }

  /**
      Adds a rotation transformation to `m`, using the given
      #graphene_euler_t.
  
      Params:
        e = a rotation described by a #graphene_euler_t
  */
  void rotateEuler(graphene.euler.Euler e)
  {
    graphene_matrix_rotate_euler(cast(graphene_matrix_t*)this._cPtr, e ? cast(const(graphene_euler_t)*)e._cPtr(No.Dup) : null);
  }

  /**
      Adds a rotation transformation to `m`, using the given
      #graphene_quaternion_t.
      
      This is the equivalent of calling [graphene.quaternion.Quaternion.toMatrix] and
      then multiplying `m` with the rotation matrix.
  
      Params:
        q = a rotation described by a #graphene_quaternion_t
  */
  void rotateQuaternion(graphene.quaternion.Quaternion q)
  {
    graphene_matrix_rotate_quaternion(cast(graphene_matrix_t*)this._cPtr, q ? cast(const(graphene_quaternion_t)*)q._cPtr(No.Dup) : null);
  }

  /**
      Adds a rotation transformation around the X axis to `m`, using
      the given angle.
      
      See also: [graphene.matrix.Matrix.rotate]
  
      Params:
        angle = the rotation angle, in degrees
  */
  void rotateX(float angle)
  {
    graphene_matrix_rotate_x(cast(graphene_matrix_t*)this._cPtr, angle);
  }

  /**
      Adds a rotation transformation around the Y axis to `m`, using
      the given angle.
      
      See also: [graphene.matrix.Matrix.rotate]
  
      Params:
        angle = the rotation angle, in degrees
  */
  void rotateY(float angle)
  {
    graphene_matrix_rotate_y(cast(graphene_matrix_t*)this._cPtr, angle);
  }

  /**
      Adds a rotation transformation around the Z axis to `m`, using
      the given angle.
      
      See also: [graphene.matrix.Matrix.rotate]
  
      Params:
        angle = the rotation angle, in degrees
  */
  void rotateZ(float angle)
  {
    graphene_matrix_rotate_z(cast(graphene_matrix_t*)this._cPtr, angle);
  }

  /**
      Adds a scaling transformation to `m`, using the three
      given factors.
      
      This is the equivalent of calling [graphene.matrix.Matrix.initScale] and then
      multiplying the matrix `m` with the scale matrix.
  
      Params:
        factorX = scaling factor on the X axis
        factorY = scaling factor on the Y axis
        factorZ = scaling factor on the Z axis
  */
  void scale(float factorX, float factorY, float factorZ)
  {
    graphene_matrix_scale(cast(graphene_matrix_t*)this._cPtr, factorX, factorY, factorZ);
  }

  /**
      Adds a skew of factor on the X and Y axis to the given matrix.
  
      Params:
        factor = skew factor
  */
  void skewXy(float factor)
  {
    graphene_matrix_skew_xy(cast(graphene_matrix_t*)this._cPtr, factor);
  }

  /**
      Adds a skew of factor on the X and Z axis to the given matrix.
  
      Params:
        factor = skew factor
  */
  void skewXz(float factor)
  {
    graphene_matrix_skew_xz(cast(graphene_matrix_t*)this._cPtr, factor);
  }

  /**
      Adds a skew of factor on the Y and Z axis to the given matrix.
  
      Params:
        factor = skew factor
  */
  void skewYz(float factor)
  {
    graphene_matrix_skew_yz(cast(graphene_matrix_t*)this._cPtr, factor);
  }

  /**
      Converts a #graphene_matrix_t to an affine transformation
      matrix, if the given matrix is compatible.
      
      The returned values have the following layout:
      
      ```plain
        ⎛ xx  yx ⎞   ⎛  a   b  0 ⎞
        ⎜ xy  yy ⎟ = ⎜  c   d  0 ⎟
        ⎝ x0  y0 ⎠   ⎝ tx  ty  1 ⎠
      ```
      
      This function can be used to convert between a #graphene_matrix_t
      and an affine matrix type from other libraries.
  
      Params:
        xx = return location for the xx member
        yx = return location for the yx member
        xy = return location for the xy member
        yy = return location for the yy member
        x0 = return location for the x0 member
        y0 = return location for the y0 member
      Returns: `true` if the matrix is compatible with an affine
          transformation matrix
  */
  bool to2d(out double xx, out double yx, out double xy, out double yy, out double x0, out double y0)
  {
    bool _retval;
    _retval = cast(bool)graphene_matrix_to_2d(cast(const(graphene_matrix_t)*)this._cPtr, cast(double*)&xx, cast(double*)&yx, cast(double*)&xy, cast(double*)&yy, cast(double*)&x0, cast(double*)&y0);
    return _retval;
  }

  /**
      Converts a #graphene_matrix_t to an array of floating point
      values.
  
      Params:
        v = return location
            for an array of floating point values. The array must be capable
            of holding at least 16 values.
  */
  void toFloat(ref float[] v)
  {
    graphene_matrix_to_float(cast(const(graphene_matrix_t)*)this._cPtr, v.ptr);
  }

  /**
      Transforms each corner of a #graphene_rect_t using the given matrix `m`.
      
      The result is the axis aligned bounding rectangle containing the coplanar
      quadrilateral.
      
      See also: [graphene.matrix.Matrix.transformPoint]
  
      Params:
        r = a #graphene_rect_t
        res = return location for the bounds
            of the transformed rectangle
  */
  void transformBounds(graphene.rect.Rect r, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_matrix_transform_bounds(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Transforms the vertices of a #graphene_box_t using the given matrix `m`.
      
      The result is the axis aligned bounding box containing the transformed
      vertices.
  
      Params:
        b = a #graphene_box_t
        res = return location for the bounds
            of the transformed box
  */
  void transformBox(graphene.box.Box b, out graphene.box.Box res)
  {
    graphene_box_t _res;
    graphene_matrix_transform_box(cast(const(graphene_matrix_t)*)this._cPtr, b ? cast(const(graphene_box_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.box.Box(cast(void*)&_res, No.Take);
  }

  /**
      Transforms the given #graphene_point_t using the matrix `m`.
      
      Unlike [graphene.matrix.Matrix.transformVec3], this function will take into
      account the fourth row vector of the #graphene_matrix_t when computing
      the dot product of each row vector of the matrix.
      
      See also: graphene_simd4x4f_point3_mul()
  
      Params:
        p = a #graphene_point_t
        res = return location for the
            transformed #graphene_point_t
  */
  void transformPoint(graphene.point.Point p, out graphene.point.Point res)
  {
    graphene_point_t _res;
    graphene_matrix_transform_point(cast(const(graphene_matrix_t)*)this._cPtr, p ? cast(const(graphene_point_t)*)p._cPtr(No.Dup) : null, &_res);
    res = new graphene.point.Point(cast(void*)&_res, No.Take);
  }

  /**
      Transforms the given #graphene_point3d_t using the matrix `m`.
      
      Unlike [graphene.matrix.Matrix.transformVec3], this function will take into
      account the fourth row vector of the #graphene_matrix_t when computing
      the dot product of each row vector of the matrix.
      
      See also: graphene_simd4x4f_point3_mul()
  
      Params:
        p = a #graphene_point3d_t
        res = return location for the result
  */
  void transformPoint3d(graphene.point3_d.Point3D p, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_matrix_transform_point3d(cast(const(graphene_matrix_t)*)this._cPtr, p ? cast(const(graphene_point3d_t)*)p._cPtr(No.Dup) : null, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Transform a #graphene_ray_t using the given matrix `m`.
  
      Params:
        r = a #graphene_ray_t
        res = return location for the
            transformed ray
  */
  void transformRay(graphene.ray.Ray r, out graphene.ray.Ray res)
  {
    graphene_ray_t _res;
    graphene_matrix_transform_ray(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_ray_t)*)r._cPtr(No.Dup) : null, &_res);
    res = new graphene.ray.Ray(cast(void*)&_res, No.Take);
  }

  /**
      Transforms each corner of a #graphene_rect_t using the given matrix `m`.
      
      The result is a coplanar quadrilateral.
      
      See also: [graphene.matrix.Matrix.transformPoint]
  
      Params:
        r = a #graphene_rect_t
        res = return location for the
            transformed quad
  */
  void transformRect(graphene.rect.Rect r, out graphene.quad.Quad res)
  {
    graphene_quad_t _res;
    graphene_matrix_transform_rect(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null, &_res);
    res = new graphene.quad.Quad(cast(void*)&_res, No.Take);
  }

  /**
      Transforms a #graphene_sphere_t using the given matrix `m`. The
      result is the bounding sphere containing the transformed sphere.
  
      Params:
        s = a #graphene_sphere_t
        res = return location for the bounds
            of the transformed sphere
  */
  void transformSphere(graphene.sphere.Sphere s, out graphene.sphere.Sphere res)
  {
    graphene_sphere_t _res;
    graphene_matrix_transform_sphere(cast(const(graphene_matrix_t)*)this._cPtr, s ? cast(const(graphene_sphere_t)*)s._cPtr(No.Dup) : null, &_res);
    res = new graphene.sphere.Sphere(cast(void*)&_res, No.Take);
  }

  /**
      Transforms the given #graphene_vec3_t using the matrix `m`.
      
      This function will multiply the X, Y, and Z row vectors of the matrix `m`
      with the corresponding components of the vector `v`. The W row vector will
      be ignored.
      
      See also: graphene_simd4x4f_vec3_mul()
  
      Params:
        v = a #graphene_vec3_t
        res = return location for a #graphene_vec3_t
  */
  void transformVec3(graphene.vec3.Vec3 v, out graphene.vec3.Vec3 res)
  {
    graphene_vec3_t _res;
    graphene_matrix_transform_vec3(cast(const(graphene_matrix_t)*)this._cPtr, v ? cast(const(graphene_vec3_t)*)v._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec3.Vec3(cast(void*)&_res, No.Take);
  }

  /**
      Transforms the given #graphene_vec4_t using the matrix `m`.
      
      See also: graphene_simd4x4f_vec4_mul()
  
      Params:
        v = a #graphene_vec4_t
        res = return location for a #graphene_vec4_t
  */
  void transformVec4(graphene.vec4.Vec4 v, out graphene.vec4.Vec4 res)
  {
    graphene_vec4_t _res;
    graphene_matrix_transform_vec4(cast(const(graphene_matrix_t)*)this._cPtr, v ? cast(const(graphene_vec4_t)*)v._cPtr(No.Dup) : null, &_res);
    res = new graphene.vec4.Vec4(cast(void*)&_res, No.Take);
  }

  /**
      Adds a translation transformation to `m` using the coordinates
      of the given #graphene_point3d_t.
      
      This is the equivalent of calling [graphene.matrix.Matrix.initTranslate] and
      then multiplying `m` with the translation matrix.
  
      Params:
        pos = a #graphene_point3d_t
  */
  void translate(graphene.point3_d.Point3D pos)
  {
    graphene_matrix_translate(cast(graphene_matrix_t*)this._cPtr, pos ? cast(const(graphene_point3d_t)*)pos._cPtr(No.Dup) : null);
  }

  /**
      Transposes the given matrix.
  
      Params:
        res = return location for the
            transposed matrix
  */
  void transpose(out graphene.matrix.Matrix res)
  {
    graphene_matrix_t _res;
    graphene_matrix_transpose(cast(const(graphene_matrix_t)*)this._cPtr, &_res);
    res = new graphene.matrix.Matrix(cast(void*)&_res, No.Take);
  }

  /**
      Unprojects the given point using the projection matrix and
      a modelview matrix.
  
      Params:
        modelview = a #graphene_matrix_t for the modelview matrix; this is
            the inverse of the modelview used when projecting the point
        point = a #graphene_point3d_t with the coordinates of the point
        res = return location for the unprojected
            point
  */
  void unprojectPoint3d(graphene.matrix.Matrix modelview, graphene.point3_d.Point3D point, out graphene.point3_d.Point3D res)
  {
    graphene_point3d_t _res;
    graphene_matrix_unproject_point3d(cast(const(graphene_matrix_t)*)this._cPtr, modelview ? cast(const(graphene_matrix_t)*)modelview._cPtr(No.Dup) : null, point ? cast(const(graphene_point3d_t)*)point._cPtr(No.Dup) : null, &_res);
    res = new graphene.point3_d.Point3D(cast(void*)&_res, No.Take);
  }

  /**
      Undoes the transformation on the corners of a #graphene_rect_t using the
      given matrix, within the given axis aligned rectangular bounds.
  
      Params:
        r = a #graphene_rect_t
        bounds = the bounds of the transformation
        res = return location for the
            untransformed rectangle
  */
  void untransformBounds(graphene.rect.Rect r, graphene.rect.Rect bounds, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_matrix_untransform_bounds(cast(const(graphene_matrix_t)*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Undoes the transformation of a #graphene_point_t using the
      given matrix, within the given axis aligned rectangular bounds.
  
      Params:
        p = a #graphene_point_t
        bounds = the bounds of the transformation
        res = return location for the
            untransformed point
      Returns: `true` if the point was successfully untransformed
  */
  bool untransformPoint(graphene.point.Point p, graphene.rect.Rect bounds, out graphene.point.Point res)
  {
    bool _retval;
    graphene_point_t _res;
    _retval = cast(bool)graphene_matrix_untransform_point(cast(const(graphene_matrix_t)*)this._cPtr, p ? cast(const(graphene_point_t)*)p._cPtr(No.Dup) : null, bounds ? cast(const(graphene_rect_t)*)bounds._cPtr(No.Dup) : null, &_res);
    res = new graphene.point.Point(cast(void*)&_res, No.Take);
    return _retval;
  }
}
