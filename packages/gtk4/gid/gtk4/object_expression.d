/// Module for [ObjectExpression] class
module gid.gtk4.object_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    A [gid.gobject2.object.ObjectWrap] value in a [gid.gtk4.expression.Expression].
*/
class ObjectExpression : gid.gtk4.expression.Expression
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
    return cast(void function())gtk_object_expression_get_type != &gidSymbolNotFound ? gtk_object_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates an expression evaluating to the given `object` with a weak reference.
      
      Once the `object` is disposed, it will fail to evaluate.
      
      This expression is meant to break reference cycles.
      
      If you want to keep a reference to `object`, use [gid.gtk4.constant_expression.ConstantExpression.new_].
  
      Params:
        object = object to watch
      Returns: a new [gid.gtk4.expression.Expression]
  */
  this(gid.gobject2.object.ObjectWrap object) nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_object_expression_new(object ? cast(GObject*)object._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the object that the expression evaluates to.
      Returns: the object, or `NULL`
  */
  gid.gobject2.object.ObjectWrap getObject() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_object_expression_get_object(cast(GtkExpression*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }
}
