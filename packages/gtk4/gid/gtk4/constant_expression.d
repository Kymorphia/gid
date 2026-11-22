/// Module for [ConstantExpression] class
module gid.gtk4.constant_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    A constant value in a [gid.gtk4.expression.Expression].
*/
class ConstantExpression : gid.gtk4.expression.Expression
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
    return cast(void function())gtk_constant_expression_get_type != &gidSymbolNotFound ? gtk_constant_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates an expression that always evaluates to the given `value`.
  
      Params:
        value = a [gid.gobject2.value.Value]
      Returns: a new [gid.gtk4.expression.Expression]
  */
  static gid.gtk4.constant_expression.ConstantExpression newForValue(gid.gobject2.value.Value value) nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_constant_expression_new_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk4.constant_expression.ConstantExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value that a constant expression evaluates to.
      Returns: the value
  */
  gid.gobject2.value.Value getValue() nothrow
  {
    const(GValue)* _cretval;
    _cretval = gtk_constant_expression_get_value(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
