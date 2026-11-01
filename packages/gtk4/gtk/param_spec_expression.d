/// Module for [ParamSpecExpression] class
module gtk.param_spec_expression;

public import gid.basictypes;
import gid.gid;
import gobject.param_spec;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A [gobject.param_spec.ParamSpec] for properties holding a [gtk.expression.Expression].
*/
class ParamSpecExpression : gobject.param_spec.ParamSpec
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_param_expression_get_type != &gidSymbolNotFound ? gtk_param_expression_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }
}
