/// Module for [NullArrayBuilder] class
module arrow.null_array_builder;

public import gid.basictypes;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class NullArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_null_array_builder_get_type != &gidSymbolNotFound ? garrow_null_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullArrayBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.null_array_builder.NullArrayBuilder]
      Returns: New builder object
  */
  static NullArrayBuilderGidBuilder builder() nothrow
  {
    return new NullArrayBuilderGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowNullArrayBuilder* _cretval;
    _cretval = garrow_null_array_builder_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.null_array_builder.NullArrayBuilder]
class NullArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.null_array_builder.NullArrayBuilder]
final class NullArrayBuilderGidBuilder : NullArrayBuilderGidBuilderImpl!NullArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NullArrayBuilder build() nothrow
  {
    return new NullArrayBuilder(cast(void*)createGObject(NullArrayBuilder._getGType), Yes.Take);
  }
}
