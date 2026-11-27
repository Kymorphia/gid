/// Module for [ParamSpecExpression] class
module gid.gtk4.param_spec_expression;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.param_spec;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    A [gid.gobject2.param_spec.ParamSpec] for properties holding a [gid.gtk4.expression.Expression].
*/
@gidGir("ParamSpecExpression")
class ParamSpecExpression : gid.gobject2.param_spec.ParamSpec
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
    return cast(void function())gtk_param_expression_get_type != &gidSymbolNotFound ? gtk_param_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }
}
