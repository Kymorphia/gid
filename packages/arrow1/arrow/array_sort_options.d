/// Module for [ArraySortOptions] class
module arrow.array_sort_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class ArraySortOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_array_sort_options_get_type != &gidSymbolNotFound ? garrow_array_sort_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArraySortOptions self()
  {
    return this;
  }

  /**
      Get `order` property.
      Returns: How to order values.
  */
  @property arrow.types.SortOrder order()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.SortOrder)("order");
  }

  /**
      Set `order` property.
      Params:
        propval = How to order values.
  */
  @property void order(arrow.types.SortOrder propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.SortOrder)("order", propval);
  }

  /** */
  this(arrow.types.SortOrder order)
  {
    GArrowArraySortOptions* _cretval;
    _cretval = garrow_array_sort_options_new(order);
    this(_cretval, Yes.Take);
  }

  alias equal = arrow.function_options.FunctionOptions.equal;

  /** */
  bool equal(arrow.array_sort_options.ArraySortOptions otherOptions)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_sort_options_equal(cast(GArrowArraySortOptions*)this._cPtr, otherOptions ? cast(GArrowArraySortOptions*)otherOptions._cPtr(No.Dup) : null);
    return _retval;
  }
}
