/// Module for [IndexOptions] class
module arrow.index_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class IndexOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_index_options_get_type != &gidSymbolNotFound ? garrow_index_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IndexOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrow.index_options.IndexOptions]
  Returns: New builder object
  */
  static IndexOptionsGidBuilder builder()
  {
    return new IndexOptionsGidBuilder;
  }

  /**
      Get `value` property.
      Returns: The value to be compared.
  */
  @property arrow.scalar.Scalar value()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.scalar.Scalar)("value");
  }

  /**
      Set `value` property.
      Params:
        propval = The value to be compared.
  */
  @property void value(arrow.scalar.Scalar propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.scalar.Scalar)("value", propval);
  }

  /** */
  this()
  {
    GArrowIndexOptions* _cretval;
    _cretval = garrow_index_options_new();
    this(_cretval, Yes.Take);
  }
}

class IndexOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The value to be compared.
      Returns: Builder instance for fluent chaining
  */
  T value(arrow.scalar.Scalar propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.index_options.IndexOptions]
final class IndexOptionsGidBuilder : IndexOptionsGidBuilderImpl!IndexOptionsGidBuilder
{
  IndexOptions build()
  {
    return new IndexOptions(cast(void*)createGObject(IndexOptions._getGType), Yes.Take);
  }
}
