/// Module for [Rectangle] class
module gdk.rectangle;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    Defines the position and size of a rectangle. It is identical to
    #cairo_rectangle_int_t.
*/
class Rectangle : gobject.boxed.Boxed
{

  /**
      Create a `rectangle.Rectangle` boxed type.
      Params:
        x = 
        y = 
        width = 
        height = 
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

  /** */
  @property int x()
  {
    return (cast(GdkRectangle*)this._cPtr).x;
  }

  /** */
  @property void x(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).x = propval;
  }

  /** */
  @property int y()
  {
    return (cast(GdkRectangle*)this._cPtr).y;
  }

  /** */
  @property void y(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).y = propval;
  }

  /** */
  @property int width()
  {
    return (cast(GdkRectangle*)this._cPtr).width;
  }

  /** */
  @property void width(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).width = propval;
  }

  /** */
  @property int height()
  {
    return (cast(GdkRectangle*)this._cPtr).height;
  }

  /** */
  @property void height(int propval)
  {
    (cast(GdkRectangle*)this._cPtr).height = propval;
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
    _retval = cast(bool)gdk_rectangle_equal(cast(const(GdkRectangle)*)this._cPtr, rect2 ? cast(const(GdkRectangle)*)rect2._cPtr(No.Dup) : null);
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
    GdkRectangle _dest;
    _retval = cast(bool)gdk_rectangle_intersect(cast(const(GdkRectangle)*)this._cPtr, src2 ? cast(const(GdkRectangle)*)src2._cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
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
    GdkRectangle _dest;
    gdk_rectangle_union(cast(const(GdkRectangle)*)this._cPtr, src2 ? cast(const(GdkRectangle)*)src2._cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
  }
}
