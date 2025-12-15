/// Module for [Expression] class
module arrow.expression;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Expression : gobject.object.ObjectWrap
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
    return cast(void function())garrow_expression_get_type != &gidSymbolNotFound ? garrow_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Expression self()
  {
    return this;
  }

  /** */
  bool equal(arrow.expression.Expression otherExpression)
  {
    bool _retval;
    _retval = cast(bool)garrow_expression_equal(cast(GArrowExpression*)this._cPtr, otherExpression ? cast(GArrowExpression*)otherExpression._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_expression_to_string(cast(GArrowExpression*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
