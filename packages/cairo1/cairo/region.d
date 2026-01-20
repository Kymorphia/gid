/// Module for [Region] class
module cairo.region;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_region_t represents a set of integer-aligned rectangles.
    
    It allows set-theoretical operations like [cairo.region.Region.union_] and
    [cairo.region.Region.intersect] to be performed on them.
    
    Memory management of #cairo_region_t is done with
    [cairo.region.Region.reference] and [cairo.region.Region.destroy].
*/
class Region : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_region_get_type != &gidSymbolNotFound ? cairo_gobject_region_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Region self()
  {
    return this;
  }

  /**
      Checks whether (`x`, `y`) is contained in region.
  
      Params:
        x = the x coordinate of a point
        y = the y coordinate of a point
      Returns: true if (`x`, `y`) is contained in region, false if it is not.
  */
  cairo.types.Bool containsPoint(int x, int y)
  {
    cairo.types.Bool _retval;
    _retval = cairo_region_contains_point(cast(const(cairo_region_t)*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Checks whether rectangle is inside, outside or partially contained
      in region
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [cairo.types.RegionOverlap.In] if rectangle is entirely inside region,
          [cairo.types.RegionOverlap.Out] if rectangle is entirely outside region, or
          [cairo.types.RegionOverlap.Part] if rectangle is partially inside and partially outside region.
  */
  cairo.types.RegionOverlap containsRectangle(cairo.types.RectangleInt rectangle)
  {
    cairo_region_overlap_t _cretval;
    _cretval = cairo_region_contains_rectangle(cast(const(cairo_region_t)*)this._cPtr, &rectangle);
    cairo.types.RegionOverlap _retval = cast(cairo.types.RegionOverlap)_cretval;
    return _retval;
  }

  /**
      Allocates a new region object copying the area from original.
      Returns: A newly allocated #cairo_region_t. Free with
          [cairo.region.Region.destroy]. This function always returns a
          valid pointer; if memory cannot be allocated, then a special
          error object is returned where all operations on the object do nothing.
          You can check for this with [cairo.region.Region.status].
  */
  cairo.region.Region copy()
  {
    cairo_region_t* _cretval;
    _cretval = cairo_region_copy(cast(const(cairo_region_t)*)this._cPtr);
    auto _retval = _cretval ? new cairo.region.Region(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares whether region_a is equivalent to region_b. null as an argument
      is equal to itself, but not to any non-null region.
  
      Params:
        b = a #cairo_region_t or null
      Returns: true if both regions contained the same coverage,
        false if it is not or any region is in an error status.
  */
  cairo.types.Bool equal(cairo.region.Region b)
  {
    cairo.types.Bool _retval;
    _retval = cairo_region_equal(cast(const(cairo_region_t)*)this._cPtr, b ? cast(const(cairo_region_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the bounding rectangle of region as a #cairo_rectangle_int_t
  
      Params:
        extents = rectangle into which to store the extents
  */
  void getExtents(out cairo.types.RectangleInt extents)
  {
    cairo_region_get_extents(cast(const(cairo_region_t)*)this._cPtr, &extents);
  }

  /**
      Stores the nth rectangle from the region in rectangle.
  
      Params:
        nth = a number indicating which rectangle should be returned
        rectangle = return location for a #cairo_rectangle_int_t
  */
  void getRectangle(int nth, out cairo.types.RectangleInt rectangle)
  {
    cairo_region_get_rectangle(cast(const(cairo_region_t)*)this._cPtr, nth, &rectangle);
  }

  /**
      Computes the intersection of dst with other and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status intersect(cairo.region.Region other)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_intersect(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the intersection of dst with rectangle and places the
      result in dst
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status intersectRectangle(cairo.types.RectangleInt rectangle)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_intersect_rectangle(cast(cairo_region_t*)this._cPtr, &rectangle);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Checks whether region is empty.
      Returns: true if region is empty, false if it isn't.
  */
  cairo.types.Bool isEmpty()
  {
    cairo.types.Bool _retval;
    _retval = cairo_region_is_empty(cast(const(cairo_region_t)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of rectangles contained in region.
      Returns: The number of rectangles contained in region.
  */
  int numRectangles()
  {
    int _retval;
    _retval = cairo_region_num_rectangles(cast(const(cairo_region_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether an error has previous occurred for this
      region object.
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_status(cast(const(cairo_region_t)*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Subtracts other from dst and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status subtract(cairo.region.Region other)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_subtract(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Subtracts rectangle from dst and places the result in dst
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status subtractRectangle(cairo.types.RectangleInt rectangle)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_subtract_rectangle(cast(cairo_region_t*)this._cPtr, &rectangle);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Translates region by (dx, dy).
  
      Params:
        dx = Amount to translate in the x direction
        dy = Amount to translate in the y direction
  */
  void translate(int dx, int dy)
  {
    cairo_region_translate(cast(cairo_region_t*)this._cPtr, dx, dy);
  }

  /**
      Computes the union of dst with other and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status union_(cairo.region.Region other)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_union(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the union of dst with rectangle and places the result in dst.
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status unionRectangle(cairo.types.RectangleInt rectangle)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_union_rectangle(cast(cairo_region_t*)this._cPtr, &rectangle);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the exclusive difference of dst with other and places the
      result in dst. That is, dst will be set to contain all areas that
      are either in dst or in other, but not in both.
  
      Params:
        other = another #cairo_region_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status xor(cairo.region.Region other)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_xor(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the exclusive difference of dst with rectangle and places the
      result in dst. That is, dst will be set to contain all areas that are
      either in dst or in rectangle, but not in both.
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [cairo.types.Status.Success] or [cairo.types.Status.NoMemory]
  */
  cairo.types.Status xorRectangle(cairo.types.RectangleInt rectangle)
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_xor_rectangle(cast(cairo_region_t*)this._cPtr, &rectangle);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }
}
