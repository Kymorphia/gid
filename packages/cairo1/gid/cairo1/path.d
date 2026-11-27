/// Module for [Path] class
module gid.cairo1.path;

public import gid.core.basictypes;
import gid.cairo1.c.functions;
import gid.cairo1.c.types;
import gid.cairo1.path_data;
import gid.cairo1.types;
import gid.core.utils;
import gid.gobject2.boxed;

/**
    A data structure for holding a path. This data structure serves as
    the return value for [gid.cairo1.context.Context.copyPath] and
    [gid.cairo1.context.Context.copyPathFlat] as well the input value for
    [gid.cairo1.context.Context.appendPath].
    
    See #cairo_path_data_t for hints on how to iterate over the
    actual data within the path.
    
    The num_data member gives the number of elements in the data
    array. This number is larger than the number of independent path
    portions (defined in #cairo_path_data_type_t), since the data
    includes both headers and coordinates for each portion.
*/
@gidGir("Path")
class Path : gid.gobject2.boxed.BoxedWrap!(cairo_gobject_path_get_type)
{
  /**
      Create a `path.Path` boxed type.
      Params:
        status = the current error status
        numData = the number of elements in the data array
  */
  this(gid.cairo1.types.Status status = gid.cairo1.types.Status.init, int numData = int.init) nothrow
  {
    super(boxedNew!cairo_path_t(_getGType), Yes.Take);
    this.status = status;
    this.numData = numData;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Path self() nothrow
  {
    return this;
  }

  /**
      Get `status` field.
      Returns: the current error status
  */
  @property gid.cairo1.types.Status status() nothrow
  {
    return cast(gid.cairo1.types.Status)(cast(cairo_path_t*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = the current error status
  */
  @property void status(gid.cairo1.types.Status propval) nothrow
  {
    (cast(cairo_path_t*)this._cPtr).status = cast(cairo_status_t)propval;
  }

  /**
      Get `data` field.
      Returns: the elements in the path
  */
  @property gid.cairo1.path_data.PathData data() nothrow
  {
    return new gid.cairo1.path_data.PathData(cast(cairo_path_data_t*)(cast(cairo_path_t*)this._cPtr).data, No.Take);
  }

  /**
      Get `numData` field.
      Returns: the number of elements in the data array
  */
  @property int numData() nothrow
  {
    return (cast(cairo_path_t*)this._cPtr).numData;
  }

  /**
      Set `numData` field.
      Params:
        propval = the number of elements in the data array
  */
  @property void numData(int propval) nothrow
  {
    (cast(cairo_path_t*)this._cPtr).numData = propval;
  }
}
