/// Module for [Aggregation] class
module arrow.aggregation;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Aggregation : gobject.object.ObjectWrap
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
    return cast(void function())garrow_aggregation_get_type != &gidSymbolNotFound ? garrow_aggregation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Aggregation self()
  {
    return this;
  }

  /**
      Get builder for [arrow.aggregation.Aggregation]
      Returns: New builder object
  */
  static AggregationGidBuilder builder()
  {
    return new AggregationGidBuilder;
  }

  /**
      Get `function_` property.
      Returns: The function name to aggregate.
  */
  @property string function_()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("function");
  }

  /**
      Get `input` property.
      Returns: The input field name of aggregate function.
  */
  @property string input()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("input");
  }

  /**
      Get `options` property.
      Returns: The options of aggregate function.
  */
  @property arrow.function_options.FunctionOptions options()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.function_options.FunctionOptions)("options");
  }

  /**
      Get `output` property.
      Returns: The output field name of aggregate function.
  */
  @property string output()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("output");
  }

  /** */
  this(string function_, arrow.function_options.FunctionOptions options, string input, string output)
  {
    GArrowAggregation* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    const(char)* _input = input.toCString(No.Alloc);
    const(char)* _output = output.toCString(No.Alloc);
    _cretval = garrow_aggregation_new(_function_, options ? cast(GArrowFunctionOptions*)options._cPtr(No.Dup) : null, _input, _output);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.aggregation.Aggregation]
class AggregationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `function_` property.
      Params:
        propval = The function name to aggregate.
      Returns: Builder instance for fluent chaining
  */
  T function_(string propval)
  {
    return setProperty("function", propval);
  }

  /**
      Set `input` property.
      Params:
        propval = The input field name of aggregate function.
      Returns: Builder instance for fluent chaining
  */
  T input(string propval)
  {
    return setProperty("input", propval);
  }

  /**
      Set `options` property.
      Params:
        propval = The options of aggregate function.
      Returns: Builder instance for fluent chaining
  */
  T options(arrow.function_options.FunctionOptions propval)
  {
    return setProperty("options", propval);
  }

  /**
      Set `output` property.
      Params:
        propval = The output field name of aggregate function.
      Returns: Builder instance for fluent chaining
  */
  T output(string propval)
  {
    return setProperty("output", propval);
  }
}

/// Fluent builder for [arrow.aggregation.Aggregation]
final class AggregationGidBuilder : AggregationGidBuilderImpl!AggregationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Aggregation build()
  {
    return new Aggregation(cast(void*)createGObject(Aggregation._getGType), Yes.Take);
  }
}
