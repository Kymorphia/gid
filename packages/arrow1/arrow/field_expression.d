/// Module for [FieldExpression] class
module arrow.field_expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.expression;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class FieldExpression : arrow.expression.Expression
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
    return cast(void function())garrow_field_expression_get_type != &gidSymbolNotFound ? garrow_field_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FieldExpression self()
  {
    return this;
  }

  /**
      Get builder for [arrow.field_expression.FieldExpression]
      Returns: New builder object
  */
  static FieldExpressionGidBuilder builder()
  {
    return new FieldExpressionGidBuilder;
  }

  /** */
  this(string reference)
  {
    GArrowFieldExpression* _cretval;
    const(char)* _reference = reference.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_field_expression_new(_reference, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.field_expression.FieldExpression]
class FieldExpressionGidBuilderImpl(T) : arrow.expression.ExpressionGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.field_expression.FieldExpression]
final class FieldExpressionGidBuilder : FieldExpressionGidBuilderImpl!FieldExpressionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FieldExpression build()
  {
    return new FieldExpression(cast(void*)createGObject(FieldExpression._getGType), Yes.Take);
  }
}
