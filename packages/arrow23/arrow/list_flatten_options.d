/// Module for [ListFlattenOptions] class
module arrow.list_flatten_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ListFlattenOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_list_flatten_options_get_type != &gidSymbolNotFound ? garrow_list_flatten_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowListFlattenOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListFlattenOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.list_flatten_options.ListFlattenOptions]
      Returns: New builder object
  */
  static ListFlattenOptionsGidBuilder builder() nothrow
  {
    return new ListFlattenOptionsGidBuilder;
  }

  /**
      Get `recursive` property.
      Returns: If true, the list is flattened recursively until a non-list array is formed.
  */
  @property bool recursive() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("recursive");
  }

  /**
      Set `recursive` property.
      Params:
        propval = If true, the list is flattened recursively until a non-list array is formed.
  */
  @property void recursive(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("recursive", propval);
  }

  /** */
  this() nothrow
  {
    GArrowListFlattenOptions* _cretval;
    _cretval = garrow_list_flatten_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.list_flatten_options.ListFlattenOptions]
class ListFlattenOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `recursive` property.
      Params:
        propval = If true, the list is flattened recursively until a non-list array is formed.
      Returns: Builder instance for fluent chaining
  */
  T recursive(bool propval) nothrow
  {
    return setProperty("recursive", propval);
  }
}

/// Fluent builder for [arrow.list_flatten_options.ListFlattenOptions]
final class ListFlattenOptionsGidBuilder : ListFlattenOptionsGidBuilderImpl!ListFlattenOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListFlattenOptions build() nothrow
  {
    return new ListFlattenOptions(cast(void*)createGObject(ListFlattenOptions._getGType), Yes.Take);
  }
}
