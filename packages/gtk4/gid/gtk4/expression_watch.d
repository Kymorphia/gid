/// Module for [ExpressionWatch] class
module gid.gtk4.expression_watch;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An opaque structure representing a watched [gid.gtk4.expression.Expression].
    
    The contents of [gid.gtk4.expression_watch.ExpressionWatch] should only be accessed through the
    provided API.
*/
class ExpressionWatch : gid.gobject2.boxed.BoxedWrap!(gtk_expression_watch_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ExpressionWatch self() nothrow
  {
    return this;
  }

  /**
      Evaluates the watched expression and on success stores the result
      in `value`.
      
      This is equivalent to calling [gid.gtk4.expression.Expression.evaluate] with the
      expression and this pointer originally used to create `watch`.
  
      Params:
        value = an empty [gid.gobject2.value.Value] to be set
      Returns: `TRUE` if the expression could be evaluated and `value` was set
  */
  bool evaluate(gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_expression_watch_evaluate(cast(GtkExpressionWatch*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Stops watching an expression.
      
      See [gid.gtk4.expression.Expression.watch] for how the watch
      was established.
  */
  void unwatch() nothrow
  {
    gtk_expression_watch_unwatch(cast(GtkExpressionWatch*)this._cPtr);
  }
}
