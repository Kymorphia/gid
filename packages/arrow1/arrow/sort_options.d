/// Module for [SortOptions] class
module arrow.sort_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.sort_key;
import arrow.types;
import gid.gid;

/** */
class SortOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_sort_options_get_type != &gidSymbolNotFound ? garrow_sort_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SortOptions self()
  {
    return this;
  }

  /** */
  this(arrow.sort_key.SortKey[] sortKeys = null)
  {
    GArrowSortOptions* _cretval;
    auto _sortKeys = gListFromD!(arrow.sort_key.SortKey)(sortKeys);
    scope(exit) containerFree!(GList*, arrow.sort_key.SortKey, GidOwnership.None)(_sortKeys);
    _cretval = garrow_sort_options_new(_sortKeys);
    this(_cretval, Yes.Take);
  }

  /**
      Add a sort key to be used.
  
      Params:
        sortKey = The sort key to be added.
  */
  void addSortKey(arrow.sort_key.SortKey sortKey)
  {
    garrow_sort_options_add_sort_key(cast(GArrowSortOptions*)this._cPtr, sortKey ? cast(GArrowSortKey*)sortKey._cPtr(No.Dup) : null);
  }

  alias equal = arrow.function_options.FunctionOptions.equal;

  /** */
  bool equal(arrow.sort_options.SortOptions otherOptions)
  {
    bool _retval;
    _retval = cast(bool)garrow_sort_options_equal(cast(GArrowSortOptions*)this._cPtr, otherOptions ? cast(GArrowSortOptions*)otherOptions._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.sort_key.SortKey[] getSortKeys()
  {
    GList* _cretval;
    _cretval = garrow_sort_options_get_sort_keys(cast(GArrowSortOptions*)this._cPtr);
    auto _retval = gListToD!(arrow.sort_key.SortKey, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Set sort keys to be used.
  
      Params:
        sortKeys = The sort keys to be used.
  */
  void setSortKeys(arrow.sort_key.SortKey[] sortKeys)
  {
    auto _sortKeys = gListFromD!(arrow.sort_key.SortKey)(sortKeys);
    scope(exit) containerFree!(GList*, arrow.sort_key.SortKey, GidOwnership.None)(_sortKeys);
    garrow_sort_options_set_sort_keys(cast(GArrowSortOptions*)this._cPtr, _sortKeys);
  }
}
