/// Module for [Matrix] struct
module pango.matrix;

import gid.gid;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.matrix.Matrix] specifies a transformation between user-space
    and device coordinates.
    
    The transformation is given by
    
    ```
    x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
    y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
    ```
*/
struct Matrix
{
  /**
      1st component of the transformation matrix
  */
  double xx;

  /**
      2nd component of the transformation matrix
  */
  double xy;

  /**
      3rd component of the transformation matrix
  */
  double yx;

  /**
      4th component of the transformation matrix
  */
  double yy;

  /**
      x translation
  */
  double x0;

  /**
      y translation
  */
  double y0;

  /**
      Changes the transformation represented by matrix to be the
      transformation given by first applying transformation
      given by new_matrix then applying the original transformation.
  
      Params:
        newMatrix = a [pango.matrix.Matrix]
  */
  void concat(pango.matrix.Matrix newMatrix)
  {
    pango_matrix_concat(cast(PangoMatrix*)&this, cast(const(PangoMatrix)*)&newMatrix);
  }

  /**
      Copies a [pango.matrix.Matrix].
      Returns: the newly allocated [pango.matrix.Matrix]
  */
  pango.matrix.Matrix copy()
  {
    PangoMatrix* _cretval;
    _cretval = pango_matrix_copy(cast(const(PangoMatrix)*)&this);
    pango.matrix.Matrix _retval;
    if (_cretval)
      _retval = *cast(pango.matrix.Matrix*)_cretval;
    return _retval;
  }

  /**
      Returns the scale factor of a matrix on the height of the font.
      
      That is, the scale factor in the direction perpendicular to the
      vector that the X coordinate is mapped to.  If the scale in the X
      coordinate is needed as well, use [pango.matrix.Matrix.getFontScaleFactors].
      Returns: the scale factor of matrix on the height of the font,
          or 1.0 if matrix is null.
  */
  double getFontScaleFactor()
  {
    double _retval;
    _retval = pango_matrix_get_font_scale_factor(cast(const(PangoMatrix)*)&this);
    return _retval;
  }

  /**
      Calculates the scale factor of a matrix on the width and height of the font.
      
      That is, xscale is the scale factor in the direction of the X coordinate,
      and yscale is the scale factor in the direction perpendicular to the
      vector that the X coordinate is mapped to.
      
      Note that output numbers will always be non-negative.
  
      Params:
        xscale = output scale factor in the x direction
        yscale = output scale factor perpendicular to the x direction
  */
  void getFontScaleFactors(out double xscale, out double yscale)
  {
    pango_matrix_get_font_scale_factors(cast(const(PangoMatrix)*)&this, cast(double*)&xscale, cast(double*)&yscale);
  }

  /**
      Gets the slant ratio of a matrix.
      
      For a simple shear matrix in the form:
      
          1 λ
          0 1
      
      this is simply λ.
      Returns: the slant ratio of matrix
  */
  double getSlantRatio()
  {
    double _retval;
    _retval = pango_matrix_get_slant_ratio(cast(const(PangoMatrix)*)&this);
    return _retval;
  }

  /**
      Changes the transformation represented by matrix to be the
      transformation given by first rotating by degrees degrees
      counter-clockwise then applying the original transformation.
  
      Params:
        degrees = degrees to rotate counter-clockwise
  */
  void rotate(double degrees)
  {
    pango_matrix_rotate(cast(PangoMatrix*)&this, degrees);
  }

  /**
      Changes the transformation represented by matrix to be the
      transformation given by first scaling by sx in the X direction
      and sy in the Y direction then applying the original
      transformation.
  
      Params:
        scaleX = amount to scale by in X direction
        scaleY = amount to scale by in Y direction
  */
  void scale(double scaleX, double scaleY)
  {
    pango_matrix_scale(cast(PangoMatrix*)&this, scaleX, scaleY);
  }

  /**
      Transforms the distance vector (dx,dy) by matrix.
      
      This is similar to [pango.matrix.Matrix.transformPoint],
      except that the translation components of the transformation
      are ignored. The calculation of the returned vector is as follows:
      
      ```
      dx2 = dx1 * xx + dy1 * xy;
      dy2 = dx1 * yx + dy1 * yy;
      ```
      
      Affine transformations are position invariant, so the same vector
      always transforms to the same vector. If (x1,y1) transforms
      to (x2,y2) then (x1+dx1,y1+dy1) will transform to
      (x1+dx2,y1+dy2) for all values of x1 and x2.
  
      Params:
        dx = in/out X component of a distance vector
        dy = in/out Y component of a distance vector
  */
  void transformDistance(ref double dx, ref double dy)
  {
    pango_matrix_transform_distance(cast(const(PangoMatrix)*)&this, cast(double*)&dx, cast(double*)&dy);
  }

  /**
      First transforms the rect using matrix, then calculates the bounding box
      of the transformed rectangle.
      
      This function is useful for example when you want to draw a rotated
      PangoLayout to an image buffer, and want to know how large the image
      should be and how much you should shift the layout when rendering.
      
      For better accuracy, you should use [pango.matrix.Matrix.transformRectangle]
      on original rectangle in Pango units and convert to pixels afterward
      using `funcextents_to_pixels`'s first argument.
  
      Params:
        rect = in/out bounding box in device units
  */
  void transformPixelRectangle(ref pango.types.Rectangle rect)
  {
    pango_matrix_transform_pixel_rectangle(cast(const(PangoMatrix)*)&this, &rect);
  }

  /**
      Transforms the point (`x`, `y`) by matrix.
  
      Params:
        x = in/out X position
        y = in/out Y position
  */
  void transformPoint(ref double x, ref double y)
  {
    pango_matrix_transform_point(cast(const(PangoMatrix)*)&this, cast(double*)&x, cast(double*)&y);
  }

  /**
      First transforms rect using matrix, then calculates the bounding box
      of the transformed rectangle.
      
      This function is useful for example when you want to draw a rotated
      PangoLayout to an image buffer, and want to know how large the image
      should be and how much you should shift the layout when rendering.
      
      If you have a rectangle in device units (pixels), use
      [pango.matrix.Matrix.transformPixelRectangle].
      
      If you have the rectangle in Pango units and want to convert to
      transformed pixel bounding box, it is more accurate to transform it first
      (using this function) and pass the result to [pango.global.extentsToPixels],
      first argument, for an inclusive rounded rectangle.
      However, there are valid reasons that you may want to convert
      to pixels first and then transform, for example when the transformed
      coordinates may overflow in Pango units (large matrix translation for
      example).
  
      Params:
        rect = in/out bounding box in Pango units
  */
  void transformRectangle(ref pango.types.Rectangle rect)
  {
    pango_matrix_transform_rectangle(cast(const(PangoMatrix)*)&this, &rect);
  }

  /**
      Changes the transformation represented by matrix to be the
      transformation given by first translating by (tx, ty)
      then applying the original transformation.
  
      Params:
        tx = amount to translate in the X direction
        ty = amount to translate in the Y direction
  */
  void translate(double tx, double ty)
  {
    pango_matrix_translate(cast(PangoMatrix*)&this, tx, ty);
  }
}
