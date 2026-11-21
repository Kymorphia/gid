/// Module for [CClosureExpression] class
module gid.gtk4.cclosure_expression;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.expression;
import gid.gtk4.types;

/**
    A variant of [gid.gtk4.closure_expression.ClosureExpression] using a C closure.
*/
class CClosureExpression : gid.gtk4.expression.Expression
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
    return cast(void function())gtk_cclosure_expression_get_type != &gidSymbolNotFound ? gtk_cclosure_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }
}
