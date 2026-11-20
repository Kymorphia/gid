/// Module for [MapLookupOptions] class
module arrow.map_lookup_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class MapLookupOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_map_lookup_options_get_type != &gidSymbolNotFound ? garrow_map_lookup_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowMapLookupOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override MapLookupOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.map_lookup_options.MapLookupOptions]
      Returns: New builder object
  */
  static MapLookupOptionsGidBuilder builder() nothrow
  {
    return new MapLookupOptionsGidBuilder;
  }

  /**
      Get `occurrence` property.
      Returns: Whether to return the first, last, or all matching values.
  */
  @property arrow.types.MapLookupOccurrence occurrence() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.MapLookupOccurrence)("occurrence");
  }

  /**
      Set `occurrence` property.
      Params:
        propval = Whether to return the first, last, or all matching values.
  */
  @property void occurrence(arrow.types.MapLookupOccurrence propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.MapLookupOccurrence)("occurrence", propval);
  }

  /**
      Get `queryKey` property.
      Returns: The key to lookup in the map.
  */
  @property arrow.scalar.Scalar queryKey() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.scalar.Scalar)("query-key");
  }

  /**
      Set `queryKey` property.
      Params:
        propval = The key to lookup in the map.
  */
  @property void queryKey(arrow.scalar.Scalar propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.scalar.Scalar)("query-key", propval);
  }

  /** */
  this(arrow.scalar.Scalar queryKey, arrow.types.MapLookupOccurrence occurrence) nothrow
  {
    GArrowMapLookupOptions* _cretval;
    _cretval = garrow_map_lookup_options_new(queryKey ? cast(GArrowScalar*)queryKey._cPtr(No.Dup) : null, occurrence);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.map_lookup_options.MapLookupOptions]
class MapLookupOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `occurrence` property.
      Params:
        propval = Whether to return the first, last, or all matching values.
      Returns: Builder instance for fluent chaining
  */
  T occurrence(arrow.types.MapLookupOccurrence propval) nothrow
  {
    return setProperty("occurrence", propval);
  }

  /**
      Set `queryKey` property.
      Params:
        propval = The key to lookup in the map.
      Returns: Builder instance for fluent chaining
  */
  T queryKey(arrow.scalar.Scalar propval) nothrow
  {
    return setProperty("query-key", propval);
  }
}

/// Fluent builder for [arrow.map_lookup_options.MapLookupOptions]
final class MapLookupOptionsGidBuilder : MapLookupOptionsGidBuilderImpl!MapLookupOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MapLookupOptions build() nothrow
  {
    return new MapLookupOptions(cast(void*)createGObject(MapLookupOptions._getGType), Yes.Take);
  }
}
