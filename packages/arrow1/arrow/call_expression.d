/// Module for [CallExpression] class
module arrow.call_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class CallExpression : arrow.expression.Expression
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
    return cast(void function())garrow_call_expression_get_type != &gidSymbolNotFound ? garrow_call_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CallExpression self()
  {
    return this;
  }

  /**
      Get builder for [arrow.call_expression.CallExpression]
      Returns: New builder object
  */
  static CallExpressionGidBuilder builder()
  {
    return new CallExpressionGidBuilder;
  }

  /** */
  this(string function_, arrow.expression.Expression[] arguments, arrow.function_options.FunctionOptions options = null)
  {
    GArrowCallExpression* _cretval;
    const(char)* _function_ = function_.toCString(No.Alloc);
    auto _arguments = gListFromD!(arrow.expression.Expression)(arguments);
    scope(exit) containerFree!(GList*, arrow.expression.Expression, GidOwnership.None)(_arguments);
    _cretval = garrow_call_expression_new(_function_, _arguments, options ? cast(GArrowFunctionOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.call_expression.CallExpression]
class CallExpressionGidBuilderImpl(T) : arrow.expression.ExpressionGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.call_expression.CallExpression]
final class CallExpressionGidBuilder : CallExpressionGidBuilderImpl!CallExpressionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CallExpression build()
  {
    return new CallExpression(cast(void*)createGObject(CallExpression._getGType), Yes.Take);
  }
}
