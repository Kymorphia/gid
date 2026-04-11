/// Module for [LiteralExpression] class
module arrow.literal_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.expression;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class LiteralExpression : arrow.expression.Expression
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
    return cast(void function())garrow_literal_expression_get_type != &gidSymbolNotFound ? garrow_literal_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LiteralExpression self()
  {
    return this;
  }

  /**
      Get builder for [arrow.literal_expression.LiteralExpression]
      Returns: New builder object
  */
  static LiteralExpressionGidBuilder builder()
  {
    return new LiteralExpressionGidBuilder;
  }

  /** */
  this(arrow.datum.Datum datum)
  {
    GArrowLiteralExpression* _cretval;
    _cretval = garrow_literal_expression_new(datum ? cast(GArrowDatum*)datum._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.literal_expression.LiteralExpression]
class LiteralExpressionGidBuilderImpl(T) : arrow.expression.ExpressionGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.literal_expression.LiteralExpression]
final class LiteralExpressionGidBuilder : LiteralExpressionGidBuilderImpl!LiteralExpressionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LiteralExpression build()
  {
    return new LiteralExpression(cast(void*)createGObject(LiteralExpression._getGType), Yes.Take);
  }
}
