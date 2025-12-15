/// Module for [Rectangle] class
module gdk.rectangle;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    A [gtk.types.Rectangle] data type for representing rectangles.
    
    [gtk.types.Rectangle] is identical to [cairo.rectangle.Rectangle]. Together with Cairo’s
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
class Rectangle : gobject.boxed.Boxed
{

  /**
      Create a `rectangle.Rectangle` boxed type.
      Params:
        x = the x coordinate of the top left corner
        y = the y coordinate of the top left corner
        width = the width of the rectangle
        height = the height of the rectangle
  */
  this(int x = int.init, int y = int.init, int width = int.init, int height = int.init)
  {
    super(gMalloc(GdkRectangle.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
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
    return cast(void function())gdk_rectangle_get_type != &gidSymbolNotFound ? gdk_rectangle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Rectangle self()
  {
    return this;
  }

  /**
      Get `x` field.
      Returns: the x coordinate of the top left corner
  */
  @property int x()
  {
    return (cast(GdkRectangle*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the x coordinate of the top left corner
  */
  @property void x(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the y coordinate of the top left corner
  */
  @property int y()
  {
    return (cast(GdkRectangle*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the y coordinate of the top left corner
  */
  @property void y(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: the width of the rectangle
  */
  @property int width()
  {
    return (cast(GdkRectangle*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the width of the rectangle
  */
  @property void width(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the height of the rectangle
  */
  @property int height()
  {
    return (cast(GdkRectangle*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the height of the rectangle
  */
  @property void height(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).height = propval;
  }

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
    _retval = cast(bool)gdk_rectangle_contains_point(cast(const(GdkRectangle)*)this._cPtr, x, y);
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
    _retval = cast(bool)gdk_rectangle_equal(cast(const(GdkRectangle)*)this._cPtr, rect2 ? cast(const(GdkRectangle)*)rect2._cPtr(No.Dup) : null);
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
    GdkRectangle _dest;
    _retval = cast(bool)gdk_rectangle_intersect(cast(const(GdkRectangle)*)this._cPtr, src2 ? cast(const(GdkRectangle)*)src2._cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
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
    GdkRectangle _dest;
    gdk_rectangle_union(cast(const(GdkRectangle)*)this._cPtr, src2 ? cast(const(GdkRectangle)*)src2._cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
  }
}
