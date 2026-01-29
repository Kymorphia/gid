/// Module for [Rect] class
module graphene.rect;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.point;
import graphene.size;
import graphene.types;
import graphene.vec2;

/**
    The location and size of a rectangle region.
    
    The width and height of a #graphene_rect_t can be negative; for instance,
    a #graphene_rect_t with an origin of [ 0, 0 ] and a size of [ 10, 10 ] is
    equivalent to a #graphene_rect_t with an origin of [ 10, 10 ] and a size
    of [ -10, -10 ].
    
    Application code can normalize rectangles using [graphene.rect.Rect.normalize];
    this function will ensure that the width and height of a rectangle are
    positive values. All functions taking a #graphene_rect_t as an argument
    will internally operate on a normalized copy; all functions returning a
    #graphene_rect_t will always return a normalized rectangle.
*/
class Rect : gobject.boxed.Boxed
{

  /**
      Create a `rect.Rect` boxed type.
      Params:
        origin = the coordinates of the origin of the rectangle
        size = the size of the rectangle
  */
  this(graphene.point.Point origin = graphene.point.Point.init, graphene.size.Size size = graphene.size.Size.init)
  {
    super(gMalloc(graphene_rect_t.sizeof), Yes.Take);
    this.origin = origin;
    this.size = size;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())graphene_rect_get_type != &gidSymbolNotFound ? graphene_rect_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Rect self()
  {
    return this;
  }

  /**
      Get `origin` field.
      Returns: the coordinates of the origin of the rectangle
  */
  @property graphene.point.Point origin()
  {
    return cToD!(graphene.point.Point)(cast(void*)&(cast(graphene_rect_t*)this._cPtr).origin);
  }

  /**
      Set `origin` field.
      Params:
        propval = the coordinates of the origin of the rectangle
  */
  @property void origin(graphene.point.Point propval)
  {
    (cast(graphene_rect_t*)this._cPtr).origin = cast(graphene_point_t)propval;
  }

  /**
      Get `size` field.
      Returns: the size of the rectangle
  */
  @property graphene.size.Size size()
  {
    return cToD!(graphene.size.Size)(cast(void*)&(cast(graphene_rect_t*)this._cPtr).size);
  }

  /**
      Set `size` field.
      Params:
        propval = the size of the rectangle
  */
  @property void size(graphene.size.Size propval)
  {
    (cast(graphene_rect_t*)this._cPtr).size = cast(graphene_size_t)propval;
  }

  /**
      Checks whether a #graphene_rect_t contains the given coordinates.
  
      Params:
        p = a #graphene_point_t
      Returns: `true` if the rectangle contains the point
  */
  bool containsPoint(graphene.point.Point p)
  {
    bool _retval;
    _retval = cast(bool)graphene_rect_contains_point(cast(const(graphene_rect_t)*)this._cPtr, cast(const(graphene_point_t)*)&p);
    return _retval;
  }

  /**
      Checks whether a #graphene_rect_t fully contains the given
      rectangle.
  
      Params:
        b = a #graphene_rect_t
      Returns: `true` if the rectangle `a` fully contains `b`
  */
  bool containsRect(graphene.rect.Rect b)
  {
    bool _retval;
    _retval = cast(bool)graphene_rect_contains_rect(cast(const(graphene_rect_t)*)this._cPtr, b ? cast(const(graphene_rect_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks whether the two given rectangle are equal.
  
      Params:
        b = a #graphene_rect_t
      Returns: `true` if the rectangles are equal
  */
  bool equal(graphene.rect.Rect b)
  {
    bool _retval;
    _retval = cast(bool)graphene_rect_equal(cast(const(graphene_rect_t)*)this._cPtr, b ? cast(const(graphene_rect_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Expands a #graphene_rect_t to contain the given #graphene_point_t.
  
      Params:
        p = a #graphene_point_t
        res = return location for the expanded rectangle
  */
  void expand(graphene.point.Point p, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_expand(cast(const(graphene_rect_t)*)this._cPtr, cast(const(graphene_point_t)*)&p, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Compute the area of given normalized rectangle.
      Returns: the area of the normalized rectangle
  */
  float getArea()
  {
    float _retval;
    _retval = graphene_rect_get_area(cast(const(graphene_rect_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the coordinates of the bottom-left corner of the given rectangle.
  
      Params:
        p = return location for a #graphene_point_t
  */
  void getBottomLeft(out graphene.point.Point p)
  {
    graphene_rect_get_bottom_left(cast(const(graphene_rect_t)*)this._cPtr, cast(graphene_point_t*)&p);
  }

  /**
      Retrieves the coordinates of the bottom-right corner of the given rectangle.
  
      Params:
        p = return location for a #graphene_point_t
  */
  void getBottomRight(out graphene.point.Point p)
  {
    graphene_rect_get_bottom_right(cast(const(graphene_rect_t)*)this._cPtr, cast(graphene_point_t*)&p);
  }

  /**
      Retrieves the coordinates of the center of the given rectangle.
  
      Params:
        p = return location for a #graphene_point_t
  */
  void getCenter(out graphene.point.Point p)
  {
    graphene_rect_get_center(cast(const(graphene_rect_t)*)this._cPtr, cast(graphene_point_t*)&p);
  }

  /**
      Retrieves the normalized height of the given rectangle.
      Returns: the normalized height of the rectangle
  */
  float getHeight()
  {
    float _retval;
    _retval = graphene_rect_get_height(cast(const(graphene_rect_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the coordinates of the top-left corner of the given rectangle.
  
      Params:
        p = return location for a #graphene_point_t
  */
  void getTopLeft(out graphene.point.Point p)
  {
    graphene_rect_get_top_left(cast(const(graphene_rect_t)*)this._cPtr, cast(graphene_point_t*)&p);
  }

  /**
      Retrieves the coordinates of the top-right corner of the given rectangle.
  
      Params:
        p = return location for a #graphene_point_t
  */
  void getTopRight(out graphene.point.Point p)
  {
    graphene_rect_get_top_right(cast(const(graphene_rect_t)*)this._cPtr, cast(graphene_point_t*)&p);
  }

  /**
      Computes the four vertices of a #graphene_rect_t.
  
      Params:
        vertices = return location for an array
           of 4 #graphene_vec2_t
  */
  void getVertices(ref graphene.vec2.Vec2[] vertices)
  {
    graphene_vec2_t[] _vertices;
    _vertices.length = 4;
    graphene_rect_get_vertices(cast(const(graphene_rect_t)*)this._cPtr, _vertices.ptr);
    vertices.length = 4;
    foreach (i; 0 .. 4)
      vertices[i] = new graphene.vec2.Vec2(cast(void*)&_vertices[i], No.Take);
  }

  /**
      Retrieves the normalized width of the given rectangle.
      Returns: the normalized width of the rectangle
  */
  float getWidth()
  {
    float _retval;
    _retval = graphene_rect_get_width(cast(const(graphene_rect_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the normalized X coordinate of the origin of the given
      rectangle.
      Returns: the normalized X coordinate of the rectangle
  */
  float getX()
  {
    float _retval;
    _retval = graphene_rect_get_x(cast(const(graphene_rect_t)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the normalized Y coordinate of the origin of the given
      rectangle.
      Returns: the normalized Y coordinate of the rectangle
  */
  float getY()
  {
    float _retval;
    _retval = graphene_rect_get_y(cast(const(graphene_rect_t)*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the given #graphene_rect_t with the given values.
      
      This function will implicitly normalize the #graphene_rect_t
      before returning.
  
      Params:
        x = the X coordinate of the graphene_rect_t.origin
        y = the Y coordinate of the graphene_rect_t.origin
        width = the width of the graphene_rect_t.size
        height = the height of the graphene_rect_t.size
      Returns: the initialized rectangle
  */
  graphene.rect.Rect init_(float x, float y, float width, float height)
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_init(cast(graphene_rect_t*)this._cPtr, x, y, width, height);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes `r` using the given src rectangle.
      
      This function will implicitly normalize the #graphene_rect_t
      before returning.
  
      Params:
        src = a #graphene_rect_t
      Returns: the initialized rectangle
  */
  graphene.rect.Rect initFromRect(graphene.rect.Rect src)
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_init_from_rect(cast(graphene_rect_t*)this._cPtr, src ? cast(const(graphene_rect_t)*)src._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Changes the given rectangle to be smaller, or larger depending on the
      given inset parameters.
      
      To create an inset rectangle, use positive d_x or d_y values; to
      create a larger, encompassing rectangle, use negative d_x or d_y
      values.
      
      The origin of the rectangle is offset by d_x and d_y, while the size
      is adjusted by `(2 * d_x, 2 * d_y)`. If d_x and d_y are positive
      values, the size of the rectangle is decreased; if d_x and d_y are
      negative values, the size of the rectangle is increased.
      
      If the size of the resulting inset rectangle has a negative width or
      height then the size will be set to zero.
  
      Params:
        dX = the horizontal inset
        dY = the vertical inset
      Returns: the inset rectangle
  */
  graphene.rect.Rect inset(float dX, float dY)
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_inset(cast(graphene_rect_t*)this._cPtr, dX, dY);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Changes the given rectangle to be smaller, or larger depending on the
      given inset parameters.
      
      To create an inset rectangle, use positive d_x or d_y values; to
      create a larger, encompassing rectangle, use negative d_x or d_y
      values.
      
      The origin of the rectangle is offset by d_x and d_y, while the size
      is adjusted by `(2 * d_x, 2 * d_y)`. If d_x and d_y are positive
      values, the size of the rectangle is decreased; if d_x and d_y are
      negative values, the size of the rectangle is increased.
      
      If the size of the resulting inset rectangle has a negative width or
      height then the size will be set to zero.
  
      Params:
        dX = the horizontal inset
        dY = the vertical inset
        res = return location for the inset rectangle
  */
  void insetR(float dX, float dY, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_inset_r(cast(const(graphene_rect_t)*)this._cPtr, dX, dY, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Linearly interpolates the origin and size of the two given
      rectangles.
  
      Params:
        b = a #graphene_rect_t
        factor = the linear interpolation factor
        res = return location for the
            interpolated rectangle
  */
  void interpolate(graphene.rect.Rect b, double factor, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_interpolate(cast(const(graphene_rect_t)*)this._cPtr, b ? cast(const(graphene_rect_t)*)b._cPtr(No.Dup) : null, factor, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Computes the intersection of the two given rectangles.
      
      ![](rectangle-intersection.png)
      
      The intersection in the image above is the blue outline.
      
      If the two rectangles do not intersect, res will contain
      a degenerate rectangle with origin in (0, 0) and a size of 0.
  
      Params:
        b = a #graphene_rect_t
        res = return location for
            a #graphene_rect_t
      Returns: `true` if the two rectangles intersect
  */
  bool intersection(graphene.rect.Rect b, out graphene.rect.Rect res)
  {
    bool _retval;
    graphene_rect_t _res;
    _retval = cast(bool)graphene_rect_intersection(cast(const(graphene_rect_t)*)this._cPtr, b ? cast(const(graphene_rect_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
    return _retval;
  }

  /**
      Normalizes the passed rectangle.
      
      This function ensures that the size of the rectangle is made of
      positive values, and that the origin is the top-left corner of
      the rectangle.
      Returns: the normalized rectangle
  */
  graphene.rect.Rect normalize()
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_normalize(cast(graphene_rect_t*)this._cPtr);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Normalizes the passed rectangle.
      
      This function ensures that the size of the rectangle is made of
      positive values, and that the origin is in the top-left corner
      of the rectangle.
  
      Params:
        res = the return location for the
            normalized rectangle
  */
  void normalizeR(out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_normalize_r(cast(const(graphene_rect_t)*)this._cPtr, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Offsets the origin by d_x and d_y.
      
      The size of the rectangle is unchanged.
  
      Params:
        dX = the horizontal offset
        dY = the vertical offset
      Returns: the offset rectangle
  */
  graphene.rect.Rect offset(float dX, float dY)
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_offset(cast(graphene_rect_t*)this._cPtr, dX, dY);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Offsets the origin of the given rectangle by d_x and d_y.
      
      The size of the rectangle is left unchanged.
  
      Params:
        dX = the horizontal offset
        dY = the vertical offset
        res = return location for the offset
            rectangle
  */
  void offsetR(float dX, float dY, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_offset_r(cast(const(graphene_rect_t)*)this._cPtr, dX, dY, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Rounds the origin and size of the given rectangle to
      their nearest integer values; the rounding is guaranteed
      to be large enough to have an area bigger or equal to the
      original rectangle, but might not fully contain its extents.
      Use [graphene.rect.Rect.roundExtents] in case you need to round
      to a rectangle that covers fully the original one.
      
      This function is the equivalent of calling `floor` on
      the coordinates of the origin, and `ceil` on the size.
  
      Params:
        res = return location for the
            rounded rectangle
  
      Deprecated: Use [graphene.rect.Rect.roundExtents] instead
  */
  void round(out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_round(cast(const(graphene_rect_t)*)this._cPtr, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Rounds the origin of the given rectangle to its nearest
      integer value and and recompute the size so that the
      rectangle is large enough to contain all the conrners
      of the original rectangle.
      
      This function is the equivalent of calling `floor` on
      the coordinates of the origin, and recomputing the size
      calling `ceil` on the bottom-right coordinates.
      
      If you want to be sure that the rounded rectangle
      completely covers the area that was covered by the
      original rectangle — i.e. you want to cover the area
      including all its corners — this function will make sure
      that the size is recomputed taking into account the ceiling
      of the coordinates of the bottom-right corner.
      If the difference between the original coordinates and the
      coordinates of the rounded rectangle is greater than the
      difference between the original size and and the rounded
      size, then the move of the origin would not be compensated
      by a move in the anti-origin, leaving the corners of the
      original rectangle outside the rounded one.
  
      Params:
        res = return location for the
            rectangle with rounded extents
  */
  void roundExtents(out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_round_extents(cast(const(graphene_rect_t)*)this._cPtr, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Rounds the origin and the size of the given rectangle to
      their nearest integer values; the rounding is guaranteed
      to be large enough to contain the original rectangle.
      Returns: the pixel-aligned rectangle.
  
      Deprecated: Use [graphene.rect.Rect.round] instead
  */
  graphene.rect.Rect roundToPixel()
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_round_to_pixel(cast(graphene_rect_t*)this._cPtr);
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Scales the size and origin of a rectangle horizontaly by s_h,
      and vertically by s_v. The result `r`es is normalized.
  
      Params:
        sH = horizontal scale factor
        sV = vertical scale factor
        res = return location for the
            scaled rectangle
  */
  void scale(float sH, float sV, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_scale(cast(const(graphene_rect_t)*)this._cPtr, sH, sV, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Computes the union of the two given rectangles.
      
      ![](rectangle-union.png)
      
      The union in the image above is the blue outline.
  
      Params:
        b = a #graphene_rect_t
        res = return location for a #graphene_rect_t
  */
  void union_(graphene.rect.Rect b, out graphene.rect.Rect res)
  {
    graphene_rect_t _res;
    graphene_rect_union(cast(const(graphene_rect_t)*)this._cPtr, b ? cast(const(graphene_rect_t)*)b._cPtr(No.Dup) : null, &_res);
    res = new graphene.rect.Rect(cast(void*)&_res, No.Take);
  }

  /**
      Allocates a new #graphene_rect_t.
      
      The contents of the returned rectangle are undefined.
      Returns: the newly allocated rectangle
  */
  static graphene.rect.Rect alloc()
  {
    graphene_rect_t* _cretval;
    _cretval = graphene_rect_alloc();
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a degenerate rectangle with origin fixed at (0, 0) and
      a size of 0, 0.
      Returns: a fixed rectangle
  */
  static graphene.rect.Rect zero()
  {
    const(graphene_rect_t)* _cretval;
    _cretval = graphene_rect_zero();
    auto _retval = _cretval ? new graphene.rect.Rect(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
