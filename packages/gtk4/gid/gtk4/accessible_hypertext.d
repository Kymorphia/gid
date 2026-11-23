/// Module for [AccessibleHypertext] interface
module gid.gtk4.accessible_hypertext;

public import gid.core.basictypes;
public import gid.gtk4.accessible_hypertext_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for accessible objects containing links.
    
    The [gid.gtk4.accessible_hypertext.AccessibleHypertext] interfaces is meant to be implemented by accessible
    objects that contain links. Those links don't necessarily have to be part
    of text, they can be associated with images and other things.
*/
interface AccessibleHypertext : gid.gtk4.accessible.Accessible
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_hypertext_get_type != &gidSymbolNotFound ? gtk_accessible_hypertext_get_type() : cast(GType)0;
  }



}

/// Fluent builder implementation template for [gid.gtk4.accessible_hypertext.AccessibleHypertext]
interface AccessibleHypertextGidBuilderImpl(T) : gid.gtk4.accessible.AccessibleGidBuilderImpl!T
{
}
