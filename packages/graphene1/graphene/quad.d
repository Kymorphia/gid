/// Module for [Quad] class
module graphene.quad;

import gid.gid;
import gobject.boxed;
import graphene.c.functions;
import graphene.c.types;
import graphene.point;
import graphene.rect;
import graphene.types;

/**
    A 4 vertex quadrilateral, as represented by four #graphene_point_t.
    
    The contents of a #graphene_quad_t are private and should never be
    accessed directly.
*/
class Quad : gobject.boxed.Boxed
{

  /**
      Create a `quad.Quad` boxed type.
  */
  this()
  {
    super(gMalloc(graphene_quad_t.sizeof), Yes.Take);
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
    return cast(void function())graphene_quad_get_type != &gidSymbolNotFound ? graphene_quad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Quad self()
  {
    return this;
  }

  /**
      Allocates a new #graphene_quad_t instance.
      
      The contents of the returned instance are undefined.
      Returns: the newly created #graphene_quad_t instance
  */
  static graphene.quad.Quad alloc()
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_alloc();
    auto _retval = _cretval ? new graphene.quad.Quad(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the bounding rectangle of `q` and places it into `r`.
  
      Params:
        r = return location for a #graphene_rect_t
  */
  void bounds(out graphene.rect.Rect r)
  {
    graphene_rect_t _r;
    graphene_quad_bounds(cast(const(graphene_quad_t)*)this._cPtr, &_r);
    r = new graphene.rect.Rect(cast(void*)&_r, No.Take);
  }

  /**
      Checks if the given #graphene_quad_t contains the given #graphene_point_t.
  
      Params:
        p = a #graphene_point_t
      Returns: `true` if the point is inside the #graphene_quad_t
  */
  bool contains(graphene.point.Point p)
  {
    bool _retval;
    _retval = cast(bool)graphene_quad_contains(cast(const(graphene_quad_t)*)this._cPtr, p ? cast(const(graphene_point_t)*)p._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Retrieves the point of a #graphene_quad_t at the given index.
  
      Params:
        index = the index of the point to retrieve
      Returns: a #graphene_point_t
  */
  graphene.point.Point getPoint(uint index)
  {
    const(graphene_point_t)* _cretval;
    _cretval = graphene_quad_get_point(cast(const(graphene_quad_t)*)this._cPtr, index);
    auto _retval = _cretval ? new graphene.point.Point(cast(void*)_cretval, No.Take) : null;
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
  graphene.quad.Quad init_(graphene.point.Point p1, graphene.point.Point p2, graphene.point.Point p3, graphene.point.Point p4)
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_init(cast(graphene_quad_t*)this._cPtr, p1 ? cast(const(graphene_point_t)*)p1._cPtr(No.Dup) : null, p2 ? cast(const(graphene_point_t)*)p2._cPtr(No.Dup) : null, p3 ? cast(const(graphene_point_t)*)p3._cPtr(No.Dup) : null, p4 ? cast(const(graphene_point_t)*)p4._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quad_t using an array of points.
  
      Params:
        points = an array of 4 #graphene_point_t
      Returns: the initialized #graphene_quad_t
  */
  graphene.quad.Quad initFromPoints(graphene.point.Point[] points)
  {
    graphene_quad_t* _cretval;
    assert(!points || points.length == 4);
    graphene_point_t[] _tmppoints;
    foreach (obj; points)
      _tmppoints ~= *cast(graphene_point_t*)obj._cPtr;
    const(graphene_point_t)* _points = _tmppoints.ptr;
    _cretval = graphene_quad_init_from_points(cast(graphene_quad_t*)this._cPtr, _points);
    auto _retval = _cretval ? new graphene.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Initializes a #graphene_quad_t using the four corners of the
      given #graphene_rect_t.
  
      Params:
        r = a #graphene_rect_t
      Returns: the initialized #graphene_quad_t
  */
  graphene.quad.Quad initFromRect(graphene.rect.Rect r)
  {
    graphene_quad_t* _cretval;
    _cretval = graphene_quad_init_from_rect(cast(graphene_quad_t*)this._cPtr, r ? cast(const(graphene_rect_t)*)r._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new graphene.quad.Quad(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
