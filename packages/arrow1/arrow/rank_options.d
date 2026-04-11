/// Module for [RankOptions] class
module arrow.rank_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.sort_key;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class RankOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_rank_options_get_type != &gidSymbolNotFound ? garrow_rank_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RankOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.rank_options.RankOptions]
      Returns: New builder object
  */
  static RankOptionsGidBuilder builder()
  {
    return new RankOptionsGidBuilder;
  }

  /**
      Get `nullPlacement` property.
      Returns: Whether nulls and NaNs are placed at the start or at the end.
  */
  @property arrow.types.NullPlacement nullPlacement()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.NullPlacement)("null-placement");
  }

  /**
      Set `nullPlacement` property.
      Params:
        propval = Whether nulls and NaNs are placed at the start or at the end.
  */
  @property void nullPlacement(arrow.types.NullPlacement propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.NullPlacement)("null-placement", propval);
  }

  /**
      Get `tiebreaker` property.
      Returns: Tiebreaker for dealing with equal values in ranks.
  */
  @property arrow.types.RankTiebreaker tiebreaker()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.RankTiebreaker)("tiebreaker");
  }

  /**
      Set `tiebreaker` property.
      Params:
        propval = Tiebreaker for dealing with equal values in ranks.
  */
  @property void tiebreaker(arrow.types.RankTiebreaker propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.RankTiebreaker)("tiebreaker", propval);
  }

  /** */
  this()
  {
    GArrowRankOptions* _cretval;
    _cretval = garrow_rank_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add a sort key to be used.
  
      Params:
        sortKey = The sort key to be added.
  */
  void addSortKey(arrow.sort_key.SortKey sortKey)
  {
    garrow_rank_options_add_sort_key(cast(GArrowRankOptions*)this._cPtr, sortKey ? cast(GArrowSortKey*)sortKey._cPtr(No.Dup) : null);
  }

  alias equal = arrow.function_options.FunctionOptions.equal;

  /** */
  bool equal(arrow.rank_options.RankOptions otherOptions)
  {
    bool _retval;
    _retval = cast(bool)garrow_rank_options_equal(cast(GArrowRankOptions*)this._cPtr, otherOptions ? cast(GArrowRankOptions*)otherOptions._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.sort_key.SortKey[] getSortKeys()
  {
    GList* _cretval;
    _cretval = garrow_rank_options_get_sort_keys(cast(GArrowRankOptions*)this._cPtr);
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
    garrow_rank_options_set_sort_keys(cast(GArrowRankOptions*)this._cPtr, _sortKeys);
  }
}

/// Fluent builder implementation template for [arrow.rank_options.RankOptions]
class RankOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nullPlacement` property.
      Params:
        propval = Whether nulls and NaNs are placed at the start or at the end.
      Returns: Builder instance for fluent chaining
  */
  T nullPlacement(arrow.types.NullPlacement propval)
  {
    return setProperty("null-placement", propval);
  }

  /**
      Set `tiebreaker` property.
      Params:
        propval = Tiebreaker for dealing with equal values in ranks.
      Returns: Builder instance for fluent chaining
  */
  T tiebreaker(arrow.types.RankTiebreaker propval)
  {
    return setProperty("tiebreaker", propval);
  }
}

/// Fluent builder for [arrow.rank_options.RankOptions]
final class RankOptionsGidBuilder : RankOptionsGidBuilderImpl!RankOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RankOptions build()
  {
    return new RankOptions(cast(void*)createGObject(RankOptions._getGType), Yes.Take);
  }
}
