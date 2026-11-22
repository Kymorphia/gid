/// Module for [AccessibleHypertext] interface mixin
module gid.gtk4.accessible_hypertext_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_hypertext_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for accessible objects containing links.
    
    The [gid.gtk4.accessible_hypertext.AccessibleHypertext] interfaces is meant to be implemented by accessible
    objects that contain links. Those links don't necessarily have to be part
    of text, they can be associated with images and other things.
*/
template AccessibleHypertextT()
{
}

/// Fluent builder implementation template for [gid.gtk4.accessible_hypertext.AccessibleHypertext]
template AccessibleHypertextGidBuilderT()
{
}
