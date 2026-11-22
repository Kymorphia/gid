/// Module for [Region] class
module gid.cairo1.region;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.types;
import gid.core.utils;
import gid.gobject2.boxed;

/**
    A #cairo_region_t represents a set of integer-aligned rectangles.
    
    It allows set-theoretical operations like [gid.cairo1.region.Region.union_] and
    [gid.cairo1.region.Region.intersect] to be performed on them.
    
    Memory management of #cairo_region_t is done with
    [gid.cairo1.region.Region.reference] and [gid.cairo1.region.Region.destroy].
*/
class Region : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_region_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Region self() nothrow
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
  gid.cairo1.types.Bool containsPoint(int x, int y) nothrow
  {
    gid.cairo1.types.Bool _retval;
    _retval = cairo_region_contains_point(cast(const(cairo_region_t)*)this._cPtr, x, y);
    return _retval;
  }

  /**
      Checks whether rectangle is inside, outside or partially contained
      in region
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [gid.cairo1.types.RegionOverlap.In] if rectangle is entirely inside region,
          [gid.cairo1.types.RegionOverlap.Out] if rectangle is entirely outside region, or
          [gid.cairo1.types.RegionOverlap.Part] if rectangle is partially inside and partially outside region.
  */
  gid.cairo1.types.RegionOverlap containsRectangle(gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_region_overlap_t _cretval;
    _cretval = cairo_region_contains_rectangle(cast(const(cairo_region_t)*)this._cPtr, cast(const(cairo_rectangle_int_t)*)&rectangle);
    gid.cairo1.types.RegionOverlap _retval = cast(gid.cairo1.types.RegionOverlap)_cretval;
    return _retval;
  }

  /**
      Allocates a new region object copying the area from original.
      Returns: A newly allocated #cairo_region_t. Free with
          [gid.cairo1.region.Region.destroy]. This function always returns a
          valid pointer; if memory cannot be allocated, then a special
          error object is returned where all operations on the object do nothing.
          You can check for this with [gid.cairo1.region.Region.status].
  */
  gid.cairo1.region.Region copy() nothrow
  {
    cairo_region_t* _cretval;
    _cretval = cairo_region_copy(cast(const(cairo_region_t)*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.region.Region(cast(void*)_cretval, Yes.Take) : null;
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
  gid.cairo1.types.Bool equal(gid.cairo1.region.Region b) nothrow
  {
    gid.cairo1.types.Bool _retval;
    _retval = cairo_region_equal(cast(const(cairo_region_t)*)this._cPtr, b ? cast(const(cairo_region_t)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the bounding rectangle of region as a #cairo_rectangle_int_t
  
      Params:
        extents = rectangle into which to store the extents
  */
  void getExtents(out gid.cairo1.types.RectangleInt extents) nothrow
  {
    cairo_region_get_extents(cast(const(cairo_region_t)*)this._cPtr, cast(cairo_rectangle_int_t*)&extents);
  }

  /**
      Stores the nth rectangle from the region in rectangle.
  
      Params:
        nth = a number indicating which rectangle should be returned
        rectangle = return location for a #cairo_rectangle_int_t
  */
  void getRectangle(int nth, out gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_region_get_rectangle(cast(const(cairo_region_t)*)this._cPtr, nth, cast(cairo_rectangle_int_t*)&rectangle);
  }

  /**
      Computes the intersection of dst with other and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status intersect(gid.cairo1.region.Region other) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_intersect(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the intersection of dst with rectangle and places the
      result in dst
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status intersectRectangle(gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_intersect_rectangle(cast(cairo_region_t*)this._cPtr, cast(const(cairo_rectangle_int_t)*)&rectangle);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Checks whether region is empty.
      Returns: true if region is empty, false if it isn't.
  */
  gid.cairo1.types.Bool isEmpty() nothrow
  {
    gid.cairo1.types.Bool _retval;
    _retval = cairo_region_is_empty(cast(const(cairo_region_t)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of rectangles contained in region.
      Returns: The number of rectangles contained in region.
  */
  int numRectangles() nothrow
  {
    int _retval;
    _retval = cairo_region_num_rectangles(cast(const(cairo_region_t)*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether an error has previous occurred for this
      region object.
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status status() nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_status(cast(const(cairo_region_t)*)this._cPtr);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Subtracts other from dst and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status subtract(gid.cairo1.region.Region other) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_subtract(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Subtracts rectangle from dst and places the result in dst
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status subtractRectangle(gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_subtract_rectangle(cast(cairo_region_t*)this._cPtr, cast(const(cairo_rectangle_int_t)*)&rectangle);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Translates region by (dx, dy).
  
      Params:
        dx = Amount to translate in the x direction
        dy = Amount to translate in the y direction
  */
  void translate(int dx, int dy) nothrow
  {
    cairo_region_translate(cast(cairo_region_t*)this._cPtr, dx, dy);
  }

  /**
      Computes the union of dst with other and places the result in dst
  
      Params:
        other = another #cairo_region_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status union_(gid.cairo1.region.Region other) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_union(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the union of dst with rectangle and places the result in dst.
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status unionRectangle(gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_union_rectangle(cast(cairo_region_t*)this._cPtr, cast(const(cairo_rectangle_int_t)*)&rectangle);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the exclusive difference of dst with other and places the
      result in dst. That is, dst will be set to contain all areas that
      are either in dst or in other, but not in both.
  
      Params:
        other = another #cairo_region_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status xor(gid.cairo1.region.Region other) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_xor(cast(cairo_region_t*)this._cPtr, other ? cast(const(cairo_region_t)*)other._cPtr(No.Dup) : null);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }

  /**
      Computes the exclusive difference of dst with rectangle and places the
      result in dst. That is, dst will be set to contain all areas that are
      either in dst or in rectangle, but not in both.
  
      Params:
        rectangle = a #cairo_rectangle_int_t
      Returns: [gid.cairo1.types.Status.Success] or [gid.cairo1.types.Status.NoMemory]
  */
  gid.cairo1.types.Status xorRectangle(gid.cairo1.types.RectangleInt rectangle) nothrow
  {
    cairo_status_t _cretval;
    _cretval = cairo_region_xor_rectangle(cast(cairo_region_t*)this._cPtr, cast(const(cairo_rectangle_int_t)*)&rectangle);
    gid.cairo1.types.Status _retval = cast(gid.cairo1.types.Status)_cretval;
    return _retval;
  }
}
