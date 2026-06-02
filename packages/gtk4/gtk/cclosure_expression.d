/// Module for [CClosureExpression] class
module gtk.cclosure_expression;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.expression;
import gtk.types;

/**
    A variant of [gtk.closure_expression.ClosureExpression] using a C closure.
*/
class CClosureExpression : gtk.expression.Expression
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(GtkExpression*)ptr, take);
  }
}
