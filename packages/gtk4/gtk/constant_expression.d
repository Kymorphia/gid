/// Module for [ConstantExpression] class
module gtk.constant_expression;

public import gid.basictypes;
import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A constant value in a [gtk.expression.Expression].
*/
class ConstantExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.constant_expression.ConstantExpression");

    super(cast(GtkExpression*)ptr, take);
  }

  /**
      Creates an expression that always evaluates to the given `value`.
  
      Params:
        value = a [gobject.value.Value]
      Returns: a new [gtk.expression.Expression]
  */
  static gtk.constant_expression.ConstantExpression newForValue(gobject.value.Value value)
  {
    GtkExpression* _cretval;
    _cretval = gtk_constant_expression_new_for_value(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.constant_expression.ConstantExpression(cast(GtkExpression*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the value that a constant expression evaluates to.
      Returns: the value
  */
  gobject.value.Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gtk_constant_expression_get_value(cast(GtkExpression*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
