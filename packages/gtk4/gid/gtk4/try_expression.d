/// Module for [TryExpression] class
module gid.gtk4.try_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    A [gid.gtk4.expression.Expression] that tries to evaluate each of its expressions until it succeeds.
    
    If all expressions fail to evaluate, the [gid.gtk4.try_expression.TryExpression]'s evaluation fails as well.
*/
@gidGir("TryExpression")
class TryExpression : gid.gtk4.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_try_expression_get_type != &gidSymbolNotFound ? gtk_try_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gtk4.expression.Expression] with an array of expressions.
      
      When evaluated, the [gid.gtk4.try_expression.TryExpression] tries to evaluate each of its expressions until it succeeds.
      If all expressions fail to evaluate, the [gid.gtk4.try_expression.TryExpression]'s evaluation fails as well.
      
      The value type of the expressions in the array must match.
  
      Params:
        expressions = The array of expressions
      Returns: a new [gid.gtk4.expression.Expression]
  */
  this(gid.gtk4.expression.Expression[] expressions) nothrow
  {
    GtkExpression* _cretval;
    uint _nExpressions;
    if (expressions)
      _nExpressions = cast(uint)expressions.length;

    auto _expressions = cast(GtkExpression**)gMalloc((expressions.length) * (GtkExpression*).sizeof);
    foreach (i, obj; expressions) _expressions[i] = obj ? cast(GtkExpression*)obj._cPtr(Yes.Dup) : null;
    _cretval = gtk_try_expression_new(_nExpressions, _expressions);
    this(_cretval, Yes.Take);
  }
}
