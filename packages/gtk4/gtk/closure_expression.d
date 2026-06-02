/// Module for [ClosureExpression] class
module gtk.closure_expression;

public import gid.basictypes;
import gid.gid;
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
}
