/// Module for [ImplementorIface] interface mixin
module gid.atk1.implementor_iface_mixin;

public import gid.core.basictypes;
public import gid.atk1.implementor_iface_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.gid_builder;

/**
    The AtkImplementor interface is implemented by objects for which
    AtkObject peers may be obtained via calls to
    iface->(ref_accessible)(implementor);
*/
template ImplementorIfaceT()
{
}

/// Fluent builder implementation template for [gid.atk1.implementor_iface.ImplementorIface]
template ImplementorIfaceGidBuilderT()
{
}
