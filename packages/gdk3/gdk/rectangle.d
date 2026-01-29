/// Module for [Rectangle] struct
module gdk.rectangle;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
    Defines the position and size of a rectangle. It is identical to
    #cairo_rectangle_int_t.
*/
struct Rectangle
{
  /** */
  int x;

  /** */
  int y;

  /** */
  int width;

  /** */
  int height;

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_rectangle_get_type != &gidSymbolNotFound ? gdk_rectangle_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      Checks if the two given rectangles are equal.
  
      Params:
        rect2 = a #GdkRectangle
      Returns: true if the rectangles are equal.
  */
  bool equal(gdk.rectangle.Rectangle rect2)
  {
    bool _retval;
    _retval = cast(bool)gdk_rectangle_equal(cast(const(GdkRectangle)*)&this, cast(const(GdkRectangle)*)&rect2);
    return _retval;
  }

  /**
      Calculates the intersection of two rectangles. It is allowed for
      dest to be the same as either src1 or src2. If the rectangles
      do not intersect, dest’s width and height is set to 0 and its x
      and y values are undefined. If you are only interested in whether
      the rectangles intersect, but not in the intersecting area itself,
      pass null for dest.
  
      Params:
        src2 = a #GdkRectangle
        dest = return location for the
          intersection of src1 and src2, or null
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
      includes both src1 and src2 within it.
      It is allowed for dest to be the same as either src1 or src2.
      
      Note that this function does not ignore 'empty' rectangles (ie. with
      zero width or height).
  
      Params:
        src2 = a #GdkRectangle
        dest = return location for the union of src1 and src2
  */
  void union_(gdk.rectangle.Rectangle src2, out gdk.rectangle.Rectangle dest)
  {
    gdk_rectangle_union(cast(const(GdkRectangle)*)&this, cast(const(GdkRectangle)*)&src2, cast(GdkRectangle*)&dest);
  }
}
