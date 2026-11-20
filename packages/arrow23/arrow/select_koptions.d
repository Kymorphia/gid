/// Module for [SelectKOptions] class
module arrow.select_koptions;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.sort_key;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SelectKOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_select_k_options_get_type != &gidSymbolNotFound ? garrow_select_k_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowSelectKOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override SelectKOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.select_koptions.SelectKOptions]
      Returns: New builder object
  */
  static SelectKOptionsGidBuilder builder() nothrow
  {
    return new SelectKOptionsGidBuilder;
  }

  /**
      Get `k` property.
      Returns: The number of k elements to keep.
  */
  @property long k() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("k");
  }

  /**
      Set `k` property.
      Params:
        propval = The number of k elements to keep.
  */
  @property void k(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("k", propval);
  }

  /** */
  this() nothrow
  {
    GArrowSelectKOptions* _cretval;
    _cretval = garrow_select_k_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a sort key to be used.
  
      Params:
        sortKey = The sort key to be added.
  */
  void addSortKey(arrow.sort_key.SortKey sortKey) nothrow
  {
    garrow_select_k_options_add_sort_key(cast(GArrowSelectKOptions*)this._cPtr, sortKey ? cast(GArrowSortKey*)sortKey._cPtr(No.Dup) : null);
  }

  /** */
  arrow.sort_key.SortKey[] getSortKeys() nothrow
  {
    GList* _cretval;
    _cretval = garrow_select_k_options_get_sort_keys(cast(GArrowSelectKOptions*)this._cPtr);
    auto _retval = gListToD!(arrow.sort_key.SortKey, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Set sort keys to be used.
  
      Params:
        sortKeys = The sort keys to be used.
  */
  void setSortKeys(arrow.sort_key.SortKey[] sortKeys) nothrow
  {
    auto _sortKeys = gListFromD!(arrow.sort_key.SortKey)(sortKeys);
    scope(exit) containerFree!(GList*, arrow.sort_key.SortKey, GidOwnership.None)(_sortKeys);
    garrow_select_k_options_set_sort_keys(cast(GArrowSelectKOptions*)this._cPtr, _sortKeys);
  }
}

/// Fluent builder implementation template for [arrow.select_koptions.SelectKOptions]
class SelectKOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `k` property.
      Params:
        propval = The number of k elements to keep.
      Returns: Builder instance for fluent chaining
  */
  T k(long propval) nothrow
  {
    return setProperty("k", propval);
  }
}

/// Fluent builder for [arrow.select_koptions.SelectKOptions]
final class SelectKOptionsGidBuilder : SelectKOptionsGidBuilderImpl!SelectKOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SelectKOptions build() nothrow
  {
    return new SelectKOptions(cast(void*)createGObject(SelectKOptions._getGType), Yes.Take);
  }
}
