/// Module for [Quad] class
module gid.graphene1.quad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.graphene1.c.functions;
import gid.graphene1.c.types;
import gid.graphene1.point;
import gid.graphene1.rect;
import gid.graphene1.types;

/**
    A 4 vertex quadrilateral, as represented by four #graphene_point_t.
    
    The contents of a #graphene_quad_t are private and should never be
    accessed directly.
*/
@gidGir("Quad")
class Quad : gid.gobject2.boxed.BoxedWrap!(graphene_quad_get_type)
{
  /**
      Create a `quad.Quad` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!graphene_quad_t(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Quad self() nothrow
  {
    return this;
  }

  /**
      Allocates a new #graphene_quad_t instance.
      
      The contents of the returned instance are undefined.
      Returns: the newly created #graphene_quad_t instance
  */
  static gid.graphene1.quad.Quad alloc() nothrow
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_alloc();
    auto _retval = _cretval ? new gid.graphene1.quad.Quad(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the bounding rectangle of `q` and places it into `r`.
  
      Params:
        r = return location for a #graphene_rect_t
  */
  void bounds(out gid.graphene1.rect.Rect r) nothrow
  {
    auto _r = boxedNew!graphene_rect_t(gid.graphene1.rect.Rect._getGType);
    graphene_quad_bounds(cast(const(graphene_quad_t)*)this._cPtr, _r);
    r = new gid.graphene1.rect.Rect(cast(void*)_r, Yes.Take);
  }

  /**
      Checks if the given #graphene_quad_t contains the given #graphene_point_t.
  
      Params:
        p = a #graphene_point_t
      Returns: `true` if the point is inside the #graphene_quad_t
  */
  bool contains(gid.graphene1.point.Point p) nothrow
  {
    bool _retval;
    _retval = cast(bool)graphene_quad_contains(cast(const(graphene_quad_t)*)this._cPtr, cast(const(graphene_point_t)*)&p);
    return _retval;
  }

  /**
      Retrieves the point of a #graphene_quad_t at the given index.
  
      Params:
        index = the index of the point to retrieve
      Returns: a #graphene_point_t
  */
  gid.graphene1.point.Point getPoint(uint index) nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = graphene_quad_get_point(cast(const(graphene_quad_t)*)this._cPtr, index);
    gid.graphene1.point.Point _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.point.Point*)_cretval;
    return _retval;
  }

  /**
      Initializes a #graphene_quad_t with the given points.
  
      Params:
        p1 = the first point of the quadrilateral
        p2 = the second point of the quadrilateral
        p3 = the third point of the quadrilateral
        p4 = the fourth point of the quadrilateral
      Returns: the initialized #graphene_quad_t
  */
  gid.graphene1.quad.Quad init_(gid.graphene1.point.Point p1, gid.graphene1.point.Point p2, gid.graphene1.point.Point p3, gid.graphene1.point.Point p4) nothrow
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_init(cast(graphene_quad_t*)this._cPtr, cast(const(graphene_point_t)*)&p1, cast(const(graphene_point_t)*)&p2, cast(const(graphene_point_t)*)&p3, cast(const(graphene_point_t)*)&p4);
    auto _retval = _cretval ? new gid.graphene1.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quad_t using an array of points.
  
      Params:
        points = an array of 4 #graphene_point_t
      Returns: the initialized #graphene_quad_t
  */
  gid.graphene1.quad.Quad initFromPoints(gid.graphene1.point.Point[] points) nothrow
  {
    graphene_quad_t* _cretval;
    if (points.length > 4) points = points[0 .. 4];
    auto _points = cast(graphene_point_t*)points.ptr;
    typeof(*_points)[4] _points_fixed = void;
    if (points.length < 4)
    {
      (cast(ubyte[])_points_fixed[])[] = 0;
      _points_fixed[0 .. points.length] = _points[0 .. points.length];
      _points = _points_fixed.ptr;
    }
    _cretval = graphene_quad_init_from_points(cast(graphene_quad_t*)this._cPtr, _points);
    auto _retval = _cretval ? new gid.graphene1.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quad_t using the four corners of the
      given #graphene_rect_t.
  
      Params:
        r = a #graphene_rect_t
      Returns: the initialized #graphene_quad_t
  */
  gid.graphene1.quad.Quad initFromRect(gid.graphene1.rect.Rect r) nothrow
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_init_from_rect(cast(graphene_quad_t*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.graphene1.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
