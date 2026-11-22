/// Module for [RectangleList] class
module gid.cairo1.rectangle_list;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.types;
import gid.core.utils;
import gid.gobject2.boxed;

/**
    A data structure for holding a dynamically allocated
    array of rectangles.
*/
class RectangleList : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_rectangle_list_get_type)
{
  /**
      Create a `rectangle_list.RectangleList` boxed type.
      Params:
        status = Error status of the rectangle list
        numRectangles = Number of rectangles in this list
  */
  this(gid.cairo1.types.Status status = gid.cairo1.types.Status.init, int numRectangles = int.init) nothrow
  {
    super(boxedNew!cairo_rectangle_list_t(_getGType), Yes.Take);
    this.status = status;
    this.numRectangles = numRectangles;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override RectangleList self() nothrow
  {
    return this;
  }

  /**
      Get `status` field.
      Returns: Error status of the rectangle list
  */
  @property gid.cairo1.types.Status status() nothrow
  {
    return cast(gid.cairo1.types.Status)(cast(cairo_rectangle_list_t*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = Error status of the rectangle list
  */
  @property void status(gid.cairo1.types.Status propval) nothrow
  {
    (cast(cairo_rectangle_list_t*)this._cPtr).status = cast(cairo_status_t)propval;
  }

  /**
      Get `rectangles` field.
      Returns: Array containing the rectangles
  */
  @property gid.cairo1.types.Rectangle rectangles() nothrow
  {
    return cToD!(gid.cairo1.types.Rectangle)(cast(void*)(cast(cairo_rectangle_list_t*)this._cPtr).rectangles);
  }

  /**
      Get `numRectangles` field.
      Returns: Number of rectangles in this list
  */
  @property int numRectangles() nothrow
  {
    return (cast(cairo_rectangle_list_t*)this._cPtr).numRectangles;
  }

  /**
      Set `numRectangles` field.
      Params:
        propval = Number of rectangles in this list
  */
  @property void numRectangles(int propval) nothrow
  {
    (cast(cairo_rectangle_list_t*)this._cPtr).numRectangles = propval;
  }
}
