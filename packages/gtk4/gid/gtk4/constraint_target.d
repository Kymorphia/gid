/// Module for [ConstraintTarget] interface
module gid.gtk4.constraint_target;

public import gid.core.basictypes;
public import gid.gtk4.constraint_target_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Makes it possible to use an object as source or target in a
    [gid.gtk4.constraint.Constraint].
    
    Besides [gid.gtk4.widget.Widget], it is also implemented by [gid.gtk4.constraint_guide.ConstraintGuide].
*/
interface ConstraintTarget : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_target_get_type != &gidSymbolNotFound ? gtk_constraint_target_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gid.gtk4.constraint_target.ConstraintTarget]
interface ConstraintTargetGidBuilderImpl(T)
{
}
