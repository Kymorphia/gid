/// Module for [ConstraintTarget] interface
module gtk.constraint_target;

public import gid.basictypes;
public import gtk.constraint_target_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Makes it possible to use an object as source or target in a
    [gtk.constraint.Constraint].
    
    Besides [gtk.widget.Widget], it is also implemented by [gtk.constraint_guide.ConstraintGuide].
*/
interface ConstraintTarget : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_target_get_type != &gidSymbolNotFound ? gtk_constraint_target_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gtk.constraint_target.ConstraintTarget]
interface ConstraintTargetGidBuilderImpl(T)
{
}
