/// Module for [Rectangle] struct
module gdk.rectangle;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
    A [gtk.types.Rectangle] data type for representing rectangles.
    
    [gtk.types.Rectangle] is identical to [cairo.types.Rectangle]. Together with Cairo’s
    [cairo.region.Region] data type, these are the central types for representing
    sets of pixels.
    
    The intersection of two rectangles can be computed with
    [gdk.rectangle.Rectangle.intersect]; to find the union of two rectangles use
    [gdk.rectangle.Rectangle.union_].
    
    The [cairo.region.Region] type provided by Cairo is usually used for managing
    non-rectangular clipping of graphical operations.
    
    The Graphene library has a number of other data types for regions and
    volumes in 2D and 3D.
*/
struct Rectangle
{
  /**
      the x coordinate of the top left corner
  */
  int x;

  /**
      the y coordinate of the top left corner
  */
  int y;

  /**
      the width of the rectangle
  */
  int width;

  /**
      the height of the rectangle
  */
  int height;

  /**
      Returns true if rect contains the point described by `x` and `y`.
  
      Params:
        x = X coordinate
        y = Y coordinate
      Returns: true if rect contains the point
  */
  bool containsPoint(int x, int y)
  {
    bool _retval;
    _retval = cast(bool)gdk_rectangle_contains_point(cast(const(GdkRectangle)*)&this, x, y);
    return _retval;
  }

  /**
      Checks if the two given rectangles are equal.
  
      Params:
        rect2 = a [gtk.types.Rectangle]
      Returns: true if the rectangles are equal.
  */
  bool equal(gdk.rectangle.Rectangle rect2)
  {
    bool _retval;
    _retval = cast(bool)gdk_rectangle_equal(cast(const(GdkRectangle)*)&this, cast(const(GdkRectangle)*)&rect2);
    return _retval;
  }

  /**
      Calculates the intersection of two rectangles.
      
      It is allowed for dest to be the same as either src1 or src2.
      If the rectangles do not intersect, dest’s width and height is set
      to 0 and its x and y values are undefined. If you are only interested
      in whether the rectangles intersect, but not in the intersecting area
      itself, pass null for dest.
  
      Params:
        src2 = a [gtk.types.Rectangle]
        dest = return location for the
            intersection of src1 and src2
      Returns: true if the rectangles intersect.
  */
  bool intersect(gdk.rectangle.Rectangle src2, out gdk.rectangle.Rectangle dest)
  {
    bool _retval;
    _retval = cast(bool)gdk_rectangle_intersect(cast(const(GdkRectangle)*)&this, cast(const(GdkRectangle)*)&src2, cast(GdkRectangle*)&dest);
    return _retval;
  }

  /**
      Calculates the union of two rectangles.
      
      The union of rectangles src1 and src2 is the smallest rectangle which
      includes both src1 and src2 within it. It is allowed for dest to be
      the same as either src1 or src2.
      
      Note that this function does not ignore 'empty' rectangles (ie. with
      zero width or height).
  
      Params:
        src2 = a [gtk.types.Rectangle]
        dest = return location for the union of src1 and src2
  */
  void union_(gdk.rectangle.Rectangle src2, out gdk.rectangle.Rectangle dest)
  {
    gdk_rectangle_union(cast(const(GdkRectangle)*)&this, cast(const(GdkRectangle)*)&src2, cast(GdkRectangle*)&dest);
  }
}
