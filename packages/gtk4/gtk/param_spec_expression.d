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
    super(cast(GParamSpec*)ptr, take);
  }
}
