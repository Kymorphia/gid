/// Module for [AccessibleHypertext] interface mixin
module gtk.accessible_hypertext_mixin;

public import gid.basictypes;
public import gtk.accessible_hypertext_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    An interface for accessible objects containing links.
    
    The [gtk.accessible_hypertext.AccessibleHypertext] interfaces is meant to be implemented by accessible
    objects that contain links. Those links don't necessarily have to be part
    of text, they can be associated with images and other things.
*/
template AccessibleHypertextT()
{
}

/// Fluent builder implementation template for [gtk.accessible_hypertext.AccessibleHypertext]
template AccessibleHypertextGidBuilderT()
{
}
