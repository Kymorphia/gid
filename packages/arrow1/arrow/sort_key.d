/// Module for [SortKey] class
module arrow.sort_key;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class SortKey : gobject.object.ObjectWrap
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
    return cast(void function())garrow_sort_key_get_type != &gidSymbolNotFound ? garrow_sort_key_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SortKey self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.sort_key.SortKey]
      Returns: New builder object
  */
  static SortKeyGidBuilder builder() nothrow
  {
    return new SortKeyGidBuilder;
  }

  /**
      Get `order` property.
      Returns: How to order values.
  */
  @property arrow.types.SortOrder order() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.SortOrder)("order");
  }

  /**
      Get `target` property.
      Returns: A name or dot path for the sort target.
        
            dot_path = '.' name
                     | '[' digit+ ']'
                     | dot_path+
  */
  @property string target() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("target");
  }

  /** */
  this(string target, arrow.types.SortOrder order)
  {
    GArrowSortKey* _cretval;
    const(char)* _target = target.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = garrow_sort_key_new(_target, order, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.sort_key.SortKey otherSortKey) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_sort_key_equal(cast(GArrowSortKey*)this._cPtr, otherSortKey ? cast(GArrowSortKey*)otherSortKey._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.sort_key.SortKey]
class SortKeyGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `order` property.
      Params:
        propval = How to order values.
      Returns: Builder instance for fluent chaining
  */
  T order(arrow.types.SortOrder propval) nothrow
  {
    return setProperty("order", propval);
  }
}

/// Fluent builder for [arrow.sort_key.SortKey]
final class SortKeyGidBuilder : SortKeyGidBuilderImpl!SortKeyGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SortKey build() nothrow
  {
    return new SortKey(cast(void*)createGObject(SortKey._getGType), Yes.Take);
  }
}
