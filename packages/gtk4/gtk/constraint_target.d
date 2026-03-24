/// Module for [ConstraintTarget] interface
module gtk.constraint_target;

public import gtk.constraint_target_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The [gtk.constraint_target.ConstraintTarget] interface is implemented by objects that
    can be used as source or target in [gtk.constraint.Constraint]s.
    
    Besides [gtk.widget.Widget], it is also implemented by [gtk.constraint_guide.ConstraintGuide].
*/
interface ConstraintTarget
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_target_get_type != &gidSymbolNotFound ? gtk_constraint_target_get_type() : cast(GType)0;
  }
}

interface ConstraintTargetGidBuilderImpl(T)
{
}
