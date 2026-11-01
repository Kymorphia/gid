/// Module for [AccessibleHypertext] interface
module gtk.accessible_hypertext;

public import gid.basictypes;
public import gtk.accessible_hypertext_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An interface for accessible objects containing links.
    
    The [gtk.accessible_hypertext.AccessibleHypertext] interfaces is meant to be implemented by accessible
    objects that contain links. Those links don't necessarily have to be part
    of text, they can be associated with images and other things.
*/
interface AccessibleHypertext : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_hypertext_get_type != &gidSymbolNotFound ? gtk_accessible_hypertext_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gtk.accessible_hypertext.AccessibleHypertext]
interface AccessibleHypertextGidBuilderImpl(T)
{
}
