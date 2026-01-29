/// Module for [ExpressionWatch] class
module gtk.expression_watch;

import gid.gid;
import gobject.boxed;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An opaque structure representing a watched [gtk.expression.Expression].
    
    The contents of [gtk.expression_watch.ExpressionWatch] should only be accessed through the
    provided API.
*/
class ExpressionWatch : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_expression_watch_get_type != &gidSymbolNotFound ? gtk_expression_watch_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExpressionWatch self()
  {
    return this;
  }

  /**
      Evaluates the watched expression and on success stores the result
      in `value`.
      
      This is equivalent to calling [gtk.expression.Expression.evaluate] with the
      expression and this pointer originally used to create `watch`.
  
      Params:
        value = an empty [gobject.value.Value] to be set
      Returns: `TRUE` if the expression could be evaluated and `value` was set
  */
  bool evaluate(gobject.value.Value value)
  {
    bool _retval;
    _retval = cast(bool)gtk_expression_watch_evaluate(cast(GtkExpressionWatch*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Stops watching an expression.
      
      See [gtk.expression.Expression.watch] for how the watch
      was established.
  */
  void unwatch()
  {
    gtk_expression_watch_unwatch(cast(GtkExpressionWatch*)this._cPtr);
  }
}
