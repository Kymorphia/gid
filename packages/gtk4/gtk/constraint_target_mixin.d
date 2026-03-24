/// Module for [ConstraintTarget] interface mixin
module gtk.constraint_target_mixin;

public import gtk.constraint_target_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The [gtk.constraint_target.ConstraintTarget] interface is implemented by objects that
    can be used as source or target in [gtk.constraint.Constraint]s.
    
    Besides [gtk.widget.Widget], it is also implemented by [gtk.constraint_guide.ConstraintGuide].
*/
template ConstraintTargetT()
{
}

template ConstraintTargetGidBuilderT()
{
}
