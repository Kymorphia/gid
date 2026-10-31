/// Module for [ClosureExpression] class
module gtk.closure_expression;

public import gid.basictypes;
import gid.gid;
import gobject.closure;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    An expression using a custom [gobject.closure.Closure] to compute the value from
    its parameters.
*/
class ClosureExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GtkExpression*)ptr, take);
  }

  /**
      Creates a [gtk.expression.Expression] that calls `closure` when it is evaluated.
      
      `closure` is called with the `this` object and the results of evaluating
      the `params` expressions.
  
      Params:
        valueType = the type of the value that this expression evaluates to
        closure = closure to call when evaluating this expression. If closure is floating, it is adopted
        params = expressions for each parameter
      Returns: a new [gtk.expression.Expression]
  */
  this(gobject.types.GType valueType, gobject.closure.Closure closure, gtk.expression.Expression[] params = null) nothrow
  {
    GtkExpression* _cretval;
    uint _nParams;
    if (params)
      _nParams = cast(uint)params.length;

    auto _params = cast(GtkExpression**)gMalloc((params.length) * (GtkExpression*).sizeof);
    foreach (i, obj; params) _params[i] = obj ? cast(GtkExpression*)obj._cPtr(Yes.Dup) : null;
    _cretval = gtk_closure_expression_new(valueType, closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, _nParams, _params);
    this(_cretval, Yes.Take);
  }
}
