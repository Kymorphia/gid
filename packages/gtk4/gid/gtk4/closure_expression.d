/// Module for [ClosureExpression] class
module gid.gtk4.closure_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.closure;
import gid.gobject2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    An expression using a custom [gid.gobject2.closure.Closure] to compute the value from
    its parameters.
*/
class ClosureExpression : gid.gtk4.expression.Expression
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
    return cast(void function())gtk_closure_expression_get_type != &gidSymbolNotFound ? gtk_closure_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gtk4.expression.Expression] that calls `closure` when it is evaluated.
      
      `closure` is called with the `this` object and the results of evaluating
      the `params` expressions.
  
      Params:
        valueType = the type of the value that this expression evaluates to
        closure = closure to call when evaluating this expression. If closure is floating, it is adopted
        params = expressions for each parameter
      Returns: a new [gid.gtk4.expression.Expression]
  */
  this(gid.gobject2.types.GType valueType, gid.gobject2.closure.Closure closure, gid.gtk4.expression.Expression[] params = null) nothrow
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
