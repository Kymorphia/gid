/// Module for [FunctionOptions] class
module arrow.function_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FunctionOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_function_options_get_type != &gidSymbolNotFound ? garrow_function_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FunctionOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.function_options.FunctionOptions]
      Returns: New builder object
  */
  static FunctionOptionsGidBuilder builder() nothrow
  {
    return new FunctionOptionsGidBuilder;
  }

  /** */
  bool equal(arrow.function_options.FunctionOptions otherOptions = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_function_options_equal(cast(GArrowFunctionOptions*)this._cPtr, otherOptions ? cast(GArrowFunctionOptions*)otherOptions._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = garrow_function_options_to_string(cast(GArrowFunctionOptions*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.function_options.FunctionOptions]
class FunctionOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.function_options.FunctionOptions]
final class FunctionOptionsGidBuilder : FunctionOptionsGidBuilderImpl!FunctionOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FunctionOptions build() nothrow
  {
    return new FunctionOptions(cast(void*)createGObject(FunctionOptions._getGType), No.Take);
  }
}
