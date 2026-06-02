/// Module for [ObjectExpression] class
module gtk.object_expression;

public import gid.basictypes;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A [gobject.object.ObjectWrap] value in a [gtk.expression.Expression].
*/
class ObjectExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GtkExpression*)ptr, take);
  }

  /**
      Creates an expression evaluating to the given `object` with a weak reference.
      
      Once the `object` is disposed, it will fail to evaluate.
      
      This expression is meant to break reference cycles.
      
      If you want to keep a reference to `object`, use [gtk.constant_expression.ConstantExpression.new_].
  
      Params:
        object = object to watch
      Returns: a new [gtk.expression.Expression]
  */
  this(gobject.object.ObjectWrap object) nothrow
  {
    GtkExpression* _cretval;
    _cretval = gtk_object_expression_new(object ? cast(GObject*)object._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the object that the expression evaluates to.
      Returns: the object, or `NULL`
  */
  gobject.object.ObjectWrap getObject() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_object_expression_get_object(cast(GtkExpression*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }
}
