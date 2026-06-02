/// Module for [ReadOptions] class
module arrow.read_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ReadOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_read_options_get_type != &gidSymbolNotFound ? garrow_read_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ReadOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.read_options.ReadOptions]
      Returns: New builder object
  */
  static ReadOptionsGidBuilder builder() nothrow
  {
    return new ReadOptionsGidBuilder;
  }

  /**
      Get `maxRecursionDepth` property.
      Returns: The maximum permitted schema nesting depth.
  */
  @property int maxRecursionDepth() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-recursion-depth");
  }

  /**
      Set `maxRecursionDepth` property.
      Params:
        propval = The maximum permitted schema nesting depth.
  */
  @property void maxRecursionDepth(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-recursion-depth", propval);
  }

  /**
      Get `useThreads` property.
      Returns: Whether to use the global CPU thread pool.
  */
  @property bool useThreads() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-threads");
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
  */
  @property void useThreads(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-threads", propval);
  }

  /** */
  this() nothrow
  {
    GArrowReadOptions* _cretval;
    _cretval = garrow_read_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  int[] getIncludedFields() nothrow
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
  void setIncludedFields(int[] fields) nothrow
  {
    size_t _nFields;
    if (fields)
      _nFields = cast(size_t)fields.length;

    auto _fields = fields.ptr ? cast(int*)fields.ptr : [int.init].ptr;
    garrow_read_options_set_included_fields(cast(GArrowReadOptions*)this._cPtr, _fields, _nFields);
  }
}

/// Fluent builder implementation template for [arrow.read_options.ReadOptions]
class ReadOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `maxRecursionDepth` property.
      Params:
        propval = The maximum permitted schema nesting depth.
      Returns: Builder instance for fluent chaining
  */
  T maxRecursionDepth(int propval) nothrow
  {
    return setProperty("max-recursion-depth", propval);
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
      Returns: Builder instance for fluent chaining
  */
  T useThreads(bool propval) nothrow
  {
    return setProperty("use-threads", propval);
  }
}

/// Fluent builder for [arrow.read_options.ReadOptions]
final class ReadOptionsGidBuilder : ReadOptionsGidBuilderImpl!ReadOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ReadOptions build() nothrow
  {
    return new ReadOptions(cast(void*)createGObject(ReadOptions._getGType), Yes.Take);
  }
}
