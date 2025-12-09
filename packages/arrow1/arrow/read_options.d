/// Module for [ReadOptions] class
module arrow.read_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ReadOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_read_options_get_type != &gidSymbolNotFound ? garrow_read_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ReadOptions self()
  {
    return this;
  }

  /**
      Get `maxRecursionDepth` property.
      Returns: The maximum permitted schema nesting depth.
  */
  @property int maxRecursionDepth()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-recursion-depth");
  }

  /**
      Set `maxRecursionDepth` property.
      Params:
        propval = The maximum permitted schema nesting depth.
  */
  @property void maxRecursionDepth(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-recursion-depth", propval);
  }

  /**
      Get `useThreads` property.
      Returns: Whether to use the global CPU thread pool.
  */
  @property bool useThreads()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-threads");
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
  */
  @property void useThreads(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-threads", propval);
  }

  /** */
  this()
  {
    GArrowReadOptions* _cretval;
    _cretval = garrow_read_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  int[] getIncludedFields()
  {
    int* _cretval;
    size_t _cretlength;
    _cretval = garrow_read_options_get_included_fields(cast(GArrowReadOptions*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  void setIncludedFields(int[] fields)
  {
    size_t _nFields;
    if (fields)
      _nFields = cast(size_t)fields.length;

    auto _fields = cast(int*)fields.ptr;
    garrow_read_options_set_included_fields(cast(GArrowReadOptions*)this._cPtr, _fields, _nFields);
  }
}
