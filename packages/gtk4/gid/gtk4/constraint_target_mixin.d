/// Module for [ConstraintTarget] interface mixin
module gid.gtk4.constraint_target_mixin;

public import gid.core.basictypes;
public import gid.gtk4.constraint_target_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    Makes it possible to use an object as source or target in a
    [gid.gtk4.constraint.Constraint].
    
    Besides [gid.gtk4.widget.Widget], it is also implemented by [gid.gtk4.constraint_guide.ConstraintGuide].
*/
template ConstraintTargetT()
{
}

/// Fluent builder implementation template for [gid.gtk4.constraint_target.ConstraintTarget]
template ConstraintTargetGidBuilderT()
{
}
