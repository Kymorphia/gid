/// Module for [Matrix] struct
module cairo.matrix;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;

/**
    A #cairo_matrix_t holds an affine transformation, such as a scale,
    rotation, shear, or a combination of those. The transformation of
    a point (x, y) is given by:
    <programlisting>
        x_new = xx * x + xy * y + x0;
        y_new = yx * x + yy * y + y0;
    </programlisting>
*/
struct Matrix
{
  /**
      xx component of the affine transformation
  */
  double xx;

  /**
      yx component of the affine transformation
  */
  double yx;

  /**
      xy component of the affine transformation
  */
  double xy;

  /**
      yy component of the affine transformation
  */
  double yy;

  /**
      X translation component of the affine transformation
  */
  double x0;

  /**
      Y translation component of the affine transformation
  */
  double y0;

  /**
      Sets matrix to be the affine transformation given by
      xx, yx, xy, yy, x0, y0. The transformation is given
      by:
      <programlisting>
       x_new = xx * x + xy * y + x0;
       y_new = yx * x + yy * y + y0;
      </programlisting>
  
      Params:
        xx = xx component of the affine transformation
        yx = yx component of the affine transformation
        xy = xy component of the affine transformation
        yy = yy component of the affine transformation
        x0 = X translation component of the affine transformation
        y0 = Y translation component of the affine transformation
  */
  void init_(double xx, double yx, double xy, double yy, double x0, double y0)
  {
    cairo_matrix_init(cast(cairo_matrix_t*)&this, xx, yx, xy, yy, x0, y0);
  }

  /**
      Modifies matrix to be an identity transformation.
  */
  void initIdentity()
  {
    cairo_matrix_init_identity(cast(cairo_matrix_t*)&this);
  }

  /**
      Initialized matrix to a transformation that rotates by radians.
  
      Params:
        radians = angle of rotation, in radians. The direction of rotation
          is defined such that positive angles rotate in the direction from
          the positive X axis toward the positive Y axis. With the default
          axis orientation of cairo, positive angles rotate in a clockwise
          direction.
  */
  void initRotate(double radians)
  {
    cairo_matrix_init_rotate(cast(cairo_matrix_t*)&this, radians);
  }

  /**
      Initializes matrix to a transformation that scales by sx and sy
      in the X and Y dimensions, respectively.
  
      Params:
        sx = scale factor in the X direction
        sy = scale factor in the Y direction
  */
  void initScale(double sx, double sy)
  {
    cairo_matrix_init_scale(cast(cairo_matrix_t*)&this, sx, sy);
  }

  /**
      Initializes matrix to a transformation that translates by tx and
      ty in the X and Y dimensions, respectively.
  
      Params:
        tx = amount to translate in the X direction
        ty = amount to translate in the Y direction
  */
  void initTranslate(double tx, double ty)
  {
    cairo_matrix_init_translate(cast(cairo_matrix_t*)&this, tx, ty);
  }

  /**
      Changes matrix to be the inverse of its original value. Not
      all transformation matrices have inverses; if the matrix
      collapses points together (it is <firstterm>degenerate</firstterm>),
      then it has no inverse and this function will fail.
      Returns: If matrix has an inverse, modifies matrix to
         be the inverse matrix and returns [cairo.types.Status.Success]. Otherwise,
         returns [cairo.types.Status.InvalidMatrix].
  */
  cairo.types.Status invert()
  {
    cairo_status_t _cretval;
    _cretval = cairo_matrix_invert(cast(cairo_matrix_t*)&this);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Multiplies the affine transformations in `a` and `b` together
      and stores the result in result. The effect of the resulting
      transformation is to first apply the transformation in `a` to the
      coordinates and then apply the transformation in `b` to the
      coordinates.
      
      It is allowable for result to be identical to either `a` or `b`.
  
      Params:
        a = a #cairo_matrix_t
        b = a #cairo_matrix_t
  */
  void multiply(cairo.matrix.Matrix a, cairo.matrix.Matrix b)
  {
    cairo_matrix_multiply(cast(cairo_matrix_t*)&this, cast(const(cairo_matrix_t)*)&a, cast(const(cairo_matrix_t)*)&b);
  }

  /**
      Applies rotation by radians to the transformation in
      matrix. The effect of the new transformation is to first rotate the
      coordinates by radians, then apply the original transformation
      to the coordinates.
  
      Params:
        radians = angle of rotation, in radians. The direction of rotation
          is defined such that positive angles rotate in the direction from
          the positive X axis toward the positive Y axis. With the default
          axis orientation of cairo, positive angles rotate in a clockwise
          direction.
  */
  void rotate(double radians)
  {
    cairo_matrix_rotate(cast(cairo_matrix_t*)&this, radians);
  }

  /**
      Applies scaling by sx, sy to the transformation in matrix. The
      effect of the new transformation is to first scale the coordinates
      by sx and sy, then apply the original transformation to the coordinates.
  
      Params:
        sx = scale factor in the X direction
        sy = scale factor in the Y direction
  */
  void scale(double sx, double sy)
  {
    cairo_matrix_scale(cast(cairo_matrix_t*)&this, sx, sy);
  }

  /**
      Transforms the distance vector (dx,dy) by matrix. This is
      similar to [cairo.matrix.Matrix.transformPoint] except that the translation
      components of the transformation are ignored. The calculation of
      the returned vector is as follows:
      
      <programlisting>
      dx_new = xx * dx + xy * dy;
      dy_new = yx * dx + yy * dy;
      </programlisting>
  
      Params:
        dx = X component of a distance vector. An in/out parameter
        dy = Y component of a distance vector. An in/out parameter
  */
  void transformDistance(out double dx, out double dy)
  {
    cairo_matrix_transform_distance(cast(const(cairo_matrix_t)*)&this, cast(double*)&dx, cast(double*)&dy);
  }

  /**
      Transforms the point (`x`, `y`) by matrix.
  
      Params:
        x = X position. An in/out parameter
        y = Y position. An in/out parameter
  */
  void transformPoint(out double x, out double y)
  {
    cairo_matrix_transform_point(cast(const(cairo_matrix_t)*)&this, cast(double*)&x, cast(double*)&y);
  }

  /**
      Applies a translation by tx, ty to the transformation in
      matrix. The effect of the new transformation is to first translate
      the coordinates by tx and ty, then apply the original transformation
      to the coordinates.
  
      Params:
        tx = amount to translate in the X direction
        ty = amount to translate in the Y direction
  */
  void translate(double tx, double ty)
  {
    cairo_matrix_translate(cast(cairo_matrix_t*)&this, tx, ty);
  }
}
