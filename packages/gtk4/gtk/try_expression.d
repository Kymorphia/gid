/// Module for [TryExpression] class
module gtk.try_expression;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A [gtk.expression.Expression] that tries to evaluate each of its expressions until it succeeds.
    
    If all expressions fail to evaluate, the [gtk.try_expression.TryExpression]'s evaluation fails as well.
*/
class TryExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GtkExpression*)ptr, take);
  }

  /**
      Creates a [gtk.expression.Expression] with an array of expressions.
      
      When evaluated, the [gtk.try_expression.TryExpression] tries to evaluate each of its expressions until it succeeds.
      If all expressions fail to evaluate, the [gtk.try_expression.TryExpression]'s evaluation fails as well.
      
      The value type of the expressions in the array must match.
  
      Params:
        expressions = The array of expressions
      Returns: a new [gtk.expression.Expression]
  */
  this(gtk.expression.Expression[] expressions) nothrow
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
