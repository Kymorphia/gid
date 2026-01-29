/// Module for [Path] class
module cairo.path;

import cairo.c.functions;
import cairo.c.types;
import cairo.path_data;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a path. This data structure serves as
    the return value for [cairo.context.Context.copyPath] and
    [cairo.context.Context.copyPathFlat] as well the input value for
    [cairo.context.Context.appendPath].
    
    See #cairo_path_data_t for hints on how to iterate over the
    actual data within the path.
    
    The num_data member gives the number of elements in the data
    array. This number is larger than the number of independent path
    portions (defined in #cairo_path_data_type_t), since the data
    includes both headers and coordinates for each portion.
*/
class Path : gobject.boxed.Boxed
{

  /**
      Create a `path.Path` boxed type.
      Params:
        status = the current error status
        numData = the number of elements in the data array
  */
  this(cairo.types.Status status = cairo.types.Status.init, int numData = int.init)
  {
    super(gMalloc(cairo_path_t.sizeof), Yes.Take);
    this.status = status;
    this.numData = numData;
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
    return cast(void function())cairo_gobject_path_get_type != &gidSymbolNotFound ? cairo_gobject_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Path self()
  {
    return this;
  }

  /**
      Get `status` field.
      Returns: the current error status
  */
  @property cairo.types.Status status()
  {
    return cast(cairo.types.Status)(cast(cairo_path_t*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = the current error status
  */
  @property void status(cairo.types.Status propval)
  {
    (cast(cairo_path_t*)this._cPtr).status = cast(cairo_status_t)propval;
  }

  /**
      Get `data` field.
      Returns: the elements in the path
  */
  @property cairo.path_data.PathData data()
  {
    return new cairo.path_data.PathData(cast(cairo_path_data_t*)(cast(cairo_path_t*)this._cPtr).data, No.Take);
  }

  /**
      Get `numData` field.
      Returns: the number of elements in the data array
  */
  @property int numData()
  {
    return (cast(cairo_path_t*)this._cPtr).numData;
  }

  /**
      Set `numData` field.
      Params:
        propval = the number of elements in the data array
  */
  @property void numData(int propval)
  {
    (cast(cairo_path_t*)this._cPtr).numData = propval;
  }
}
