/// Module for [ConstraintTarget] interface mixin
module gtk.constraint_target_mixin;

public import gid.basictypes;
public import gtk.constraint_target_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    Makes it possible to use an object as source or target in a
    [gtk.constraint.Constraint].
    
    Besides [gtk.widget.Widget], it is also implemented by [gtk.constraint_guide.ConstraintGuide].
*/
template ConstraintTargetT()
{
}

/// Fluent builder implementation template for [gtk.constraint_target.ConstraintTarget]
template ConstraintTargetGidBuilderT()
{
}
