/// Module for [Expression] class
module arrow.expression;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Expression : gobject.object.ObjectWrap
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
    return cast(void function())garrow_expression_get_type != &gidSymbolNotFound ? garrow_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Expression self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.expression.Expression]
      Returns: New builder object
  */
  static ExpressionGidBuilder builder() nothrow
  {
    return new ExpressionGidBuilder;
  }

  /** */
  bool equal(arrow.expression.Expression otherExpression) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_expression_equal(cast(GArrowExpression*)this._cPtr, otherExpression ? cast(GArrowExpression*)otherExpression._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = garrow_expression_to_string(cast(GArrowExpression*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.expression.Expression]
class ExpressionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.expression.Expression]
final class ExpressionGidBuilder : ExpressionGidBuilderImpl!ExpressionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Expression build() nothrow
  {
    return new Expression(cast(void*)createGObject(Expression._getGType), No.Take);
  }
}
