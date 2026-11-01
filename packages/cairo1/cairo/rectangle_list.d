/// Module for [RectangleList] class
module cairo.rectangle_list;

public import gid.basictypes;
import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a dynamically allocated
    array of rectangles.
*/
class RectangleList : gobject.boxed.BoxedWrap!(cairo_gobject_rectangle_list_get_type)
{
  /**
      Create a `rectangle_list.RectangleList` boxed type.
      Params:
        status = Error status of the rectangle list
        numRectangles = Number of rectangles in this list
  */
  this(cairo.types.Status status = cairo.types.Status.init, int numRectangles = int.init) nothrow
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
  @property cairo.types.Status status() nothrow
  {
    return cast(cairo.types.Status)(cast(cairo_rectangle_list_t*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = Error status of the rectangle list
  */
  @property void status(cairo.types.Status propval) nothrow
  {
    (cast(cairo_rectangle_list_t*)this._cPtr).status = cast(cairo_status_t)propval;
  }

  /**
      Get `rectangles` field.
      Returns: Array containing the rectangles
  */
  @property cairo.types.Rectangle rectangles() nothrow
  {
    return cToD!(cairo.types.Rectangle)(cast(void*)(cast(cairo_rectangle_list_t*)this._cPtr).rectangles);
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
