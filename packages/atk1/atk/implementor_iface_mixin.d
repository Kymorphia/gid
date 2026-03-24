/// Module for [ImplementorIface] interface mixin
module atk.implementor_iface_mixin;

public import atk.implementor_iface_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;
public import gobject.gid_builder;

/**
    The AtkImplementor interface is implemented by objects for which
    AtkObject peers may be obtained via calls to
    iface->(ref_accessible)(implementor);
*/
template ImplementorIfaceT()
{
}

template ImplementorIfaceGidBuilderT()
{
}
