/// Module for [NullOptions] class
module arrow.null_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class NullOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_null_options_get_type != &gidSymbolNotFound ? garrow_null_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowNullOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override NullOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.null_options.NullOptions]
      Returns: New builder object
  */
  static NullOptionsGidBuilder builder() nothrow
  {
    return new NullOptionsGidBuilder;
  }

  /**
      Get `nanIsNull` property.
      Returns: Whether floating-point NaN values are considered null.
  */
  @property bool nanIsNull() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("nan-is-null");
  }

  /**
      Set `nanIsNull` property.
      Params:
        propval = Whether floating-point NaN values are considered null.
  */
  @property void nanIsNull(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("nan-is-null", propval);
  }

  /** */
  this() nothrow
  {
    GArrowNullOptions* _cretval;
    _cretval = garrow_null_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.null_options.NullOptions]
class NullOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nanIsNull` property.
      Params:
        propval = Whether floating-point NaN values are considered null.
      Returns: Builder instance for fluent chaining
  */
  T nanIsNull(bool propval) nothrow
  {
    return setProperty("nan-is-null", propval);
  }
}

/// Fluent builder for [arrow.null_options.NullOptions]
final class NullOptionsGidBuilder : NullOptionsGidBuilderImpl!NullOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NullOptions build() nothrow
  {
    return new NullOptions(cast(void*)createGObject(NullOptions._getGType), Yes.Take);
  }
}
